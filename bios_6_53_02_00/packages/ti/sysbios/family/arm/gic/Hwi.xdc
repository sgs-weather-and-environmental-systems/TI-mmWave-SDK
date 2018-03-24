/*
 * Copyright (c) 2015-2017, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== Hwi.xdc ========
 */
package ti.sysbios.family.arm.gic;

import xdc.rov.ViewInfo;

import xdc.runtime.Diags;
import xdc.runtime.Log;
import xdc.runtime.Error;

import ti.sysbios.BIOS;
import ti.sysbios.interfaces.IHwi;

/*!
 *  ======== Hwi ========
 *  Hardware Interrupt Support Module.
 *
 *  This Hwi module provides ARM cortex-A Generic Interrupt Controller(GIC) v2.0
 *  specific implementations and extensions of the APIs defined in
 *  {@link ti.sysbios.interfaces.IHwi IHwi}.
 *
 *  The GIC is logically partitioned into 2 blocks, the Distributor block
 *  and CPU interface block. The Distributor block interfaces with the interrupt
 *  sources, prioritizes interrupts and distributes them to the CPU interface
 *  block. The CPU interface block connects to the processors in the system
 *  and is responsible for priority masking and preemption handling for
 *  the processor it is connected to.
 *
 *  The GIC can implement up to 8 CPU interfaces with each CPU interface
 *  being able to see up to 1020 interrupts. The GIC assigns interrupt ID
 *  numbers 0-1019 as follows:
 *   - Interrupt numbers 0-31 are used for interrupts private to a
 *     CPU interface. These private interrupts are banked in the Distributor.
 *   - Banked interrupt number 0-15 are used for Software Generated Interrupts
 *     or SGIs.
 *   - Banked interrupt number 16-31 are used for Private Peripheral Interrupts
 *     or PPIs.
 *   - Interrupt numbers 32-1019 are used for Shared Peripheral Interrupts
 *     or SPIs.
 *   - Interrupt numbers 1020-1023 are reserved.
 *
 *  @a(NOTE)
 *  In the SoC Technical Reference Manual, the MPU IRQs 0 to N map to
 *  GIC interrupt numbers 32 to (N+32) where (N+1) is the total number of
 *  Shared Peripheral Interrupts implemented.
 *  For instance on OMAP5430, MPU IRQ 0 to 159 maps to GIC interrupt number
 *  32 to 191.
 *
 *  @a(INTERRUPT GROUPING)
 *  GIC allows configuring an interrupt as a Group 0 or a Group 1 interrupt.
 *  Group 0 interrupts are Secure interrupts and Group 1 interrupts are
 *  Non-secure interrupts.
 *
 *  If {@link #enableSecureMode} is set to true, this module supports both
 *  Group0 and Group 1 interrupts. Group 0 interrupts are delivered to the CPU
 *  using FIQ signal whereas Group 1 interrupts are delivered using IRQ signal.
 *
 *  If {@link #enableSecureMode} is set to false, this module only supports
 *  Group 1 interrupts which are delivered to the target CPU using IRQ signal.
 *
 *  @a(INTERRUPT PRIORITIES)
 *  In general GIC supports priority values 0 thru 255.
 *
 *  In practice valid priority values depend on the particular device used,
 *  security mode and the Binary Point Register (see {@link #BPR} and
 *  {@link #ABPR}) value.
 *
 *  The device implementation and security mode decide the number of priority
 *  bits that are implemented (see {@link #NUM_PRIORITY_BITS}). Group 0
 *  interrupts always implement one more priority bit than Group 1 interrupts.
 *
 *  In GIC, interrupts with lower priority numbers have higher priority.
 *
 *  @a(NOTE)
 *  In this Hwi module implementation, the instance config parameter value
 *  {@link #MaskingOption_LOWER} is equivalent to {@link #MaskingOption_SELF}.
 *  Statically configuring a Hwi object's {@link #Params.maskSetting} to
 *  {@link #MaskingOption_LOWER} will result in the generation of a benign
 *  build warning. Dynamic usages of {@link #MaskingOption_LOWER} will be
 *  silently converted to {@link #MaskingOption_SELF}.
 *
 *  @a(ZERO LATENCY INTERRUPTS)
 *  On Keystone2 devices, this module supports zero-latency interrupts. A
 *  zero-latency interrupt does not go through the SYS/BIOS dispatcher and
 *  thus has a faster response time. Since zero-latency interrupts bypass the
 *  dispatcher, their handler function cannot call any SYS/BIOS APIs.
 *
 *  This module implements zero-latency interrupts by forwarding the interrupt
 *  to the target CPU using FIQ signal. Therefore, in order to configure an
 *  interrupt as a zero-latency interrupt, the Hwi type needs to be changed
 *  to FIQ when creating or constructing a Hwi.
 *
 *  Example showing how to create a zero-latency Hwi:
 *  @p(code)
 *  Void main(Void)
 *  {
 *      Hwi_Params hwiParams;
 *      Hwi_Params_init(&hwiParams);
 *      // Default Hwi type is IRQ
 *      hwiParams.type = Hwi_Type_FIQ;
 *      Hwi_create(INT_NUM_FIQ, myIsrFIQ, &hwiParams, NULL);
 *      ...
 *  }
 *  @p
 *
 *  FIQs run on their own stack. See {@link #fiqStack} and {@link #fiqStackSize}
 *  for more info on how to control the FIQ stack.
 *
 *  @a(NOTE)
 *  This module is written for GIC v2.0, however it is backwards compatible
 *  with GIC v1.0
 */

@Template("./Hwi.xdt")  /* generates the vector table and the dispatcher */
@ModuleStartup          /* generates call to Hwi_Module_startup at startup */
@InstanceInitStatic	/* allow constructs in static only systems */
@CustomHeader

module Hwi inherits ti.sysbios.interfaces.IHwi
{
    // -------- Module Constants --------

    /*!
     *  ======== enableSecureMode ========
     *  Security Mode
     *
     *  This field specifies the MPU's security mode. The MPU's security mode
     *  determines the type of accesses to the GIC i.e. if the MPU is in secure
     *  mode, all accesses to the GIC are secure and if the MPU is in non-secure
     *  mode, all accesses to the GIC are non-secure.
     *
     *  An exception to the above rule can be seen on certain devices like
     *  Keystone 2, where all GIC acceses are secure irrespective of the MPU's
     *  security state. {@link #enableSecureMode} should be set to true for such
     *  devices.
     */
    config Bool enableSecureMode = false;

    /*!
     *  Number of interrupts implemented in GIC
     *
     *  On OMAP543x GIC implements 192 interrupts.
     *
     *  See the OMAP543x_ES1 Technical Reference Manual pg 5280 for more
     *  details.
     */
    config UInt NUM_INTERRUPTS;

    /*!
     *  Number of Priority bits implemented.
     *
     *  On OMAP543x running in non-secure mode, only most significant 4
     *  priority bits are available for use. The least significant 4 bits
     *  are always 0.
     */
    config UInt NUM_PRIORITY_BITS;

    /*!
     *  Minimum Interrupt Priority.
     */
    config UInt MIN_INT_PRIORITY;

    /*!
     *  Default Interrupt Priority.
     *
     *  Set to one level higher than minimum supported priority.
     */
    config UInt DEFAULT_INT_PRIORITY;

    /*!
     *  ======== BPR ========
     *  GIC Binary Point Register value
     *
     *  Defines the point at which the priority value fields split into
     *  two parts, the group priority field and the sub-priority field.
     *  When running in SECURE mode, BPR applies to Group 0 interrupts
     *  and when running in NON-SECURE mode, BPR applies to Group 1
     *  interrupts.
     *
     *  The group priority field determines interrupt preemption in case
     *  of nested interrupts whereas sub-priority field is used to determine
     *  priority within a group when multiple interrrupts belonging to the
     *  same group are pending.
     *
     *  Valid BPR values are from 0-7 with the minimum value supported being
     *  implementation defined and in the range 0-3.
     *
     *  @p(code)
     *   -------------------------------------------------------
     *  | BPR value | Group priority field | Sub-priority field |
     *   -------------------------------------------------------
     *  |     0     |         [7:1]        |         [0]        |
     *  |     1     |         [7:2]        |        [1:0]       |
     *  |     2     |         [7:3]        |        [2:0]       |
     *  |     3     |         [7:4]        |        [3:0]       |
     *  |     4     |         [7:5]        |        [4:0]       |
     *  |     5     |         [7:6]        |        [5:0]       |
     *  |     6     |          [7]         |        [6:0]       |
     *  |     7     |     No preemption    |        [7:0]       |
     *   -------------------------------------------------------
     *  @p
     *
     */
    config UInt BPR;

    /*!
     *  ======== ABPR ========
     *  GIC Aliased Binary Point Register value for Grourp 1 interrupts
     *
     *  Defines the point at which the priority value fields split into
     *  two parts, the group priority field and the sub-priority field.
     *  ABPR is used only when {@link #enableSecureMode} set to true and
     *  is ignored when security mode is set to false. ABPR applies to
     *  Group 1 interrupts.
     *
     *  The group priority field determines interrupt preemption in case
     *  of nested interrupts whereas sub-priority field is used to determine
     *  priority within a group when multiple interrrupts belonging to the
     *  same group are pending.
     *
     *  Valid ABPR values are from 1-7 with the minimum value supported being
     *  implementation defined and in the range 1-4. Minimum ABPR value is
     *  1 more than the minimum BPR value.
     *
     *  @p(code)
     *   --------------------------------------------------------
     *  | ABPR value | Group priority field | Sub-priority field |
     *   --------------------------------------------------------
     *  |     0      |          --          |         --         |
     *  |     1      |         [7:1]        |         [0]        |
     *  |     2      |         [7:2]        |        [1:0]       |
     *  |     3      |         [7:3]        |        [2:0]       |
     *  |     4      |         [7:4]        |        [3:0]       |
     *  |     5      |         [7:5]        |        [4:0]       |
     *  |     6      |         [7:6]        |        [5:0]       |
     *  |     7      |          [7]         |        [6:0]       |
     *   --------------------------------------------------------
     *  @p
     *
     */
    config UInt ABPR;

    /*!
     *  ======== Type ========
     *  Interrupt type. IRQ or FIQ
     */
    enum Type {
        Type_IRQ,               /*! IRQ interrupt. */
        Type_FIQ                /*! FIQ interrupt. */
    };

    // -------- Module Types --------

    /*! Hwi vector function type definition. */
    typedef Void (*VectorFuncPtr)(void);

    /*!
     *  ======== BasicView ========
     *  @_nodoc
     */
    metaonly struct BasicView {
        Ptr         halHwiHandle;
        String      label;
        Int         intNum;
        String      absolutePriority;
        UInt        relativeGrpPriority;
        UInt        relativeSubPriority;
        String      fxn;
        UArg        arg;
    };

    /*!
     *  ======== DetailedView ========
     *  @_nodoc
     */
    metaonly struct DetailedView {
        Ptr         halHwiHandle;
        String      label;
        Int         intNum;
        String      absolutePriority;
        UInt        relativeGrpPriority;
        UInt        relativeSubPriority;
        String      fxn;
        UArg        arg;
        Ptr         irp;
        Bool        enabled;
        Bool        pending;
        String      triggerSensitivity;
        String      targetProcList;
    };

    /*!
     *  ======== ModuleView ========
     *  @_nodoc
     */
    metaonly struct ModuleView {
        String      options[4];
        UInt        spuriousInterrupts;
        UInt        lastSpuriousInterrupt;
        String      hwiStackPeak;
        SizeT       hwiStackSize;
        Ptr         hwiStackBase;
    };

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                [
                    'Basic',
                    {
                        type: ViewInfo.INSTANCE,
                        viewInitFxn: 'viewInitBasic',
                        structName: 'BasicView'
                    }
                ],
                [
                    'Detailed',
                    {
                        type: ViewInfo.INSTANCE,
                        viewInitFxn: 'viewInitDetailed',
                        structName: 'DetailedView'
                    }
                ],
                [
                    'Module',
                    {
                        type: ViewInfo.MODULE,
                        viewInitFxn: 'viewInitModule',
                        structName: 'ModuleView'
                    }
                ]
            ]
        });

    /*!
     * Generic Interrupt Controller Distributor. Symbol "Hwi_gicd" is
     * a physical device
     */
    struct Gicd {
        UInt32 CTLR;            /*! 0x000 Distributor Control Register */
        UInt32 TYPER;           /*! 0x004 Interrupt Controller Type Register */
        UInt32 IIDR;            /*! 0x008 Distributor Implementor Id Register */
        UInt32 hole0[29];       /*! 0x00C-0x07C */
        UInt32 IGROUPR[32];     /*! 0x080 Interrupt Group Registers */
        UInt32 ISENABLER[32];   /*! 0x100 Interrupt Set-Enable Registers */
        UInt32 ICENABLER[32];   /*! 0x180 Interrupt Clear-Enable Registers */
        UInt32 ISPENDR[32];     /*! 0x200 Interrupt Set-Pending Registers */
        UInt32 ICPENDR[32];     /*! 0x280 Interrupt Clear-Pending Registers */
        UInt32 ISACTIVER[32];   /*! 0x300 Interrupt Set-Active Registers */
        UInt32 ICACTIVER[32];   /*! 0x380 Interrupt Clear-Active Registers */
        UInt32 IPRIORITYR[255]; /*! 0x400 Interrupt Priority Registers */
        UInt32 hole1[1];        /*! 0x7FC */
        UInt32 ITARGETSR[255];  /*! 0x800 Interrupt Processor Targets Register */
        UInt32 hole2[1];        /*! 0xBFC */
        UInt32 ICFGR[64];       /*! 0xC00 Interrupt Configuration Registers */
        UInt32 PPISR;           /*! 0xD00 PPI Status Register */
        UInt32 SPISR[7];        /*! 0xD04 SPI Status Registers */
        UInt32 hole3[120];      /*! 0xD20-0xEFC */
        UInt32 SGIR;            /*! 0xF00 Software Generated Interrupt
                                          Registers */
        UInt32 hole4[3];        /*! 0xF04-0xF0C */
        UInt32 CPENDSGIR[4];    /*! 0xF10 SGI Clear-Pending Registers */
        UInt32 SPENDSGIR[4];    /*! 0xF20 SGI Set-Pending Registers */
        UInt32 hole5[40];       /*! 0xF30-0xFCC */
        UInt32 PIDR4;           /*! 0xFD0 Peripheral ID4 Register */
        UInt32 PIDR5;           /*! 0xFD4 Peripheral ID5 Register */
        UInt32 PIDR6;           /*! 0xFD8 Peripheral ID6 Register */
        UInt32 PIDR7;           /*! 0xFDC Peripheral ID7 Register */
        UInt32 PIDR0;           /*! 0xFE0 Peripheral ID0 Register */
        UInt32 PIDR1;           /*! 0xFE4 Peripheral ID1 Register */
        UInt32 PIDR2;           /*! 0xFE8 Peripheral ID2 Register */
        UInt32 PIDR3;           /*! 0xFEC Peripheral ID3 Register */
        UInt32 CIDR0;           /*! 0xFF0 Component  ID0 Register */
        UInt32 CIDR1;           /*! 0xFF4 Component  ID1 Register */
        UInt32 CIDR2;           /*! 0xFF8 Component  ID2 Register */
        UInt32 CIDR3;           /*! 0xFFC Component  ID3 Register */
    };

    extern volatile Gicd gicd;

    /*!
     * Generic Interrupt Controller CPU Interface. Symbol "Hwi_gicc" is
     * a physical device.
     */
    struct Gicc {
        UInt32 CTLR;            /*! 0x0000 CPU Interface Control Register */
        UInt32 PMR;             /*! 0x0004 Interrupt Priority Mask Register */
        UInt32 BPR;             /*! 0x0008 Binary Point Register */
        UInt32 IAR;             /*! 0x000C Interrupt Acknowledge Register */
        UInt32 EOIR;            /*! 0x0010 End Of Interrupt Register */
        UInt32 RPR;             /*! 0x0014 Running Priority Register */
        UInt32 HPPIR;           /*! 0x0018 Highest Priority Pending Interrupt
                                    Register */
        UInt32 ABPR;            /*! 0x001C Aliased Binary Point Register */
        UInt32 AIAR;            /*! 0x0020 Aliased IAR Register */
        UInt32 AEOIR;           /*! 0x0024 Aliased EOI Register */
        UInt32 AHPPIR;          /*! 0x0028 Aliased HPPI Register */
        UInt32 hole0[41];       /*! 0x002C-0x00CC */
        UInt32 APR0;            /*! 0x00D0 Active Priority Register */
        UInt32 hole1[3];        /*! 0x00D4-0x00DC */
        UInt32 NSAPR0;          /*! 0x00E0 Non-secure Active Priority Register */
        UInt32 hole2[6];        /*! 0x00E4-0x00F8 */
        UInt32 IIDR;            /*! 0x00FC CPU Interface Id Register */
        UInt32 hole3[960];      /*! 0x0100-0x0FFC */
        UInt32 DIR;             /*! 0x1000 Deactivate Interrupt Register */
    };

    extern volatile Gicc gicc;

    // -------- Module Parameters --------

    /*! Reset Handler. Default is _c_int00 */
    metaonly config VectorFuncPtr resetFunc;

    /*!
     * Undefined instruction exception handler.
     * Default is an internal exception handler.
     */
    metaonly config VectorFuncPtr undefinedInstFunc;

    /*!
     * SVC Handler. Supervisor Call exception handler.
     * (previously called Software Interrupt or SWI)
     * Default is an internal exception handler.
     */
    metaonly config VectorFuncPtr svcFunc;

    /*!
     * Prefetch abort exception handler.
     * Default is an internal exception handler.
     */
    metaonly config VectorFuncPtr prefetchAbortFunc;

    /*!
     * Data abort exception handler.
     * Default is an internal exception handler.
     */
    metaonly config VectorFuncPtr dataAbortFunc;

    /*!
     * Reserved exception handler.
     * Default is an internal exception handler.
     */
    metaonly config VectorFuncPtr reservedFunc;

    /*! IRQ interrupt handler.
     *  Default is internal IRQ dispatcher
     */
    metaonly config VectorFuncPtr irqFunc;

    /*! FIQ interrupt handler.
     *  Default is internal exception handler.
     */
    metaonly config VectorFuncPtr fiqFunc;

    /*!
     *  @_nodoc
     *  ======== enableAsidTagging ========
     *  Flag to enable/disable ASID tagging
     *
     *  If ASID tagging is enabled, the Hwi dispatcher will switch
     *  to ASID 0 (and change the MMU table base address to match
     *  kernel MMU table address) in the Hwi dispatcher prolog
     *  and restore the ASID (and MMU table base address) in the
     *  Hwi dispatcher epilog.
     */
    config Bool enableAsidTagging = false;

    /*!
     *  ======== initGicd ========
     *  Initialize all GIC Distributor registers. True by default.
     *
     *  Flag determines whether to initialize certain global GIC distributor
     *  registers. It is set to false when running under a hypervisor and
     *  should be true if not running under a hypervisor.
     */
    config Bool initGicd = true;

    /*!
     *  @_nodoc
     *  ======== irqStackSection ========
     *  Memory section used for IRQ stack on each core
     *  Default is null.
     */
    metaonly config String irqStackSection = null;

    /*!
     *  @_nodoc
     *  ======== fiqStack ========
     *  FIQ stack pointer. Default = null.
     *  (Indicates that stack is to be created internally)
     *
     *  @a(Note)
     *  If running in SMP mode and both fiqStack and fiqStacks[0]
     *  are set, then fiqStack is used on Core0.
     */
    metaonly config Ptr fiqStack = null;
    metaonly config Ptr fiqStacks[];

    /*!
     *  ======== fiqStackSize ========
     *  FIQ stack size in MAUs.
     *  Default is 1024 bytes.
     *
     *  If running in SMP mode, the FIQ stacks on all cores are
     *  set to this size.
     */
    metaonly config SizeT fiqStackSize = 1024;

    /*!
     *  ======== fiqStackSection ========
     *  Memory section used for FIQ stack
     *  Default is null.
     */
    metaonly config String fiqStackSection = null;

    /*!
     *  ======== A_badSGIIntNum ========
     *  Assert raised when an interrupt number >= 16 is
     *  passed to Hwi_raiseSGI() function.
     */
    config xdc.runtime.Assert.Id A_badSGIIntNum  = {
        msg: "A_badSGIIntNum: SGI intNum should be <= 15."
    };

    /*!
     *  Error raised when an attempt is made to create a Hwi
     *  that has already been created.
     */
    config Error.Id E_alreadyDefined = {
        msg: "E_alreadyDefined: Hwi already defined, intnum: %d"
    };

    /*!
     *  Error raised when Hwi handle referenced in Hwi_delete()
     *  is not found in the Hwi dispatch table
     */
    config Error.Id E_handleNotFound = {
        msg: "E_handleNotFound: Hwi handle not found: 0x%x"
    };

    /*!
     *  Error raised when an undefined interrupt has fired.
     */
    config Error.Id E_undefined = {
        msg: "E_undefined: Hwi undefined, intnum: %d"
    };

    /*!
     *  Error raised if an attempt is made to create a Hwi
     *  with an interrupt number greater than Hwi_NUM_INTERRUPTS - 1.
     */
    config Error.Id E_badIntNum = {
        msg: "E_badIntNum, intnum: %d is out of range"
    };

    /*!
     *  Issued just prior to Hwi function invocation (with interrupts disabled)
     */
    config Log.Event LM_begin = {
        mask: Diags.USER1 | Diags.USER2,
        msg: "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"
    };

    /*!
     *  Issued just after return from Hwi function (with interrupts disabled)
     */
    config Log.Event LD_end = {
        mask: Diags.USER2,
        msg: "LD_end: hwi: 0x%x"
    };


    // -------- Module Functions --------

    /*!
     *  ======== disable ========
     *  Globally disable interrupts.
     *
     *  Hwi_disable globally disables hardware interrupts and returns an
     *  opaque key indicating whether interrupts were globally enabled or
     *  disabled on entry to Hwi_disable(). 
     *  The actual value of the key is target/device specific and is meant 
     *  to be passed to Hwi_restore(). 
     *
     *  Call Hwi_disable before a portion of a function that needs
     *  to run without interruption. When critical processing is complete, call
     *  Hwi_restore or Hwi_enable to reenable hardware interrupts.
     *
     *  Servicing of interrupts that occur while interrupts are disabled is
     *  postponed until interrupts are reenabled. However, if the same type 
     *  of interrupt occurs several times while interrupts are disabled, 
     *  the interrupt's function is executed only once when interrupts are 
     *  reenabled.
     *
     *  A context switch can occur when calling Hwi_enable or Hwi_restore if
     *  an enabled interrupt occurred while interrupts are disabled.
     *
     *  Hwi_disable may be called from main(). However, since Hwi interrupts
     *  are already disabled in main(), such a call has no effect.
     *
     *  @a(NOTE)
     *  Disables only IRQ interrupts
     *
     *  @a(constraints)
     *  If a Task switching API such as 
     *  {@link ti.sysbios.knl.Semaphore#pend Semaphore_pend()}, 
     *  {@link ti.sysbios.knl.Semaphore#post Semaphore_post()},
     *  {@link ti.sysbios.knl.Task#sleep Task_sleep()}, or
     *  {@link ti.sysbios.knl.Task#yield Task_yield()} 
     *  is invoked which results in a context switch while
     *  interrupts are disabled, an embedded call to 
     *  {@link #enable Hwi_enable} occurs
     *  on the way to the new thread context which unconditionally re-enables
     *  interrupts. Interrupts will remain enabled until a subsequent 
     *  {@link #disable Hwi_disable}
     *  invocation.
     *
     *  Swis always run with interrupts enabled.
     *  See {@link ti.sysbios.knl.Swi#post Swi_post()} for a discussion Swis and
     *  interrupts.
     *
     *  @b(returns)     opaque key for use by Hwi_restore()
     */
    @Macro
    override UInt disable();

    /*!
     *  ======== enable ========
     *
     *  @a(NOTE)
     *  Enables only IRQ interrupts
     */
    @Macro
    override UInt enable();

    /*!
     *  ======== restore ========
     *
     *  @a(NOTE)
     *  Restores only IRQ interrupts
     */
    @Macro
    override Void restore(UInt key);

    /*!
     *  ======== enableIRQ ========
     *  Enable IRQ interrupts.
     *
     *  @a(NOTE)
     *  Same as Hwi_enable()
     *
     *  @b(returns)     previous IRQ interrupt enable/disable state
     */
    @Macro
    UInt enableIRQ();

    /*!
     *  ======== disableIRQ ========
     *  Disable IRQ interrupts.
     *
     *  @a(NOTE)
     *  Same as Hwi_disable()
     *
     *  @b(returns)     previous IRQ interrupt enable/disable state
     */
    @Macro
    UInt disableIRQ();

    /*!
     *  ======== restoreIRQ ========
     *  Restore IRQ interrupts.
     *
     *  @a(NOTE)
     *  Same as Hwi_restore()
     *
     *  @param(key)     enable/disable state to restore
     */
    @Macro
    Void restoreIRQ(UInt key);

    /*!
     *  ======== enableFIQ ========
     *  Enable FIQ interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    @Macro
    UInt enableFIQ();

    /*!
     *  ======== disableFIQ ========
     *  Disable FIQ interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    @Macro
    UInt disableFIQ();

    /*!
     *  ======== restoreFIQ ========
     *  Restore FIQ interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    @Macro
    Void restoreFIQ(UInt key);

    /*!
     *  @_nodoc
     *  ======== disableFxn ========
     *  function call implementation
     */
    UInt disableFxn();

    /*!
     *  @_nodoc
     *  ======== enableFxn ========
     *  function call implementation
     */
    UInt enableFxn();

    /*!
     *  @_nodoc
     *  ======== restoreFxn ========
     *  function call implementation
     */
    Void restoreFxn(UInt key);

    /*!
     *  ======== getHandle ========
     *  Returns Hwi_Handle associated with intNum
     *
     *  @param(intNum)  interrupt number
     */
    Handle getHandle(UInt intNum);

    /*!
     *  @_nodoc
     *  ======== init ========
     *  assembly code mode registers setup
     */
    Void init();

    /*!
     *  @_nodoc
     *  ======== initIntControllerCoreX ========
     */
    Void initIntControllerCoreX();

    /*!
     *  ======== intAffinity ========
     *  SMP Interrupt affinity mappings
     *
     *  In SMP mode, this array maps an interrupt number to the
     *  coreId it is to be tied to. By default, all ints are mapped to
     *  core 0.
     *
     *  For example, to make Timer 1 from the ti.sysbios.timers.dmtimer.Timer
     *  module interrupt on core 1 rather than core 0, add the following to
     *  your config file:
     *
     *  @p(code)
     *     var Hwi = xdc.useModule('ti.sysbios.family.arm.gic.Hwi');
     *     Hwi.intAffinity[<intNum>] = 1;
     *  @p
     *
     *  @a(constraints)
     *  Interrupt numbers below 32 are ignored. This config param only
     *  allows routing interrupt numbers greater than or equal to #32.
     */
    metaonly config UInt8 intAffinity[];

    /*!
     *  @_nodoc
     *  ======== raiseSGI ========
     */
    Void raiseSGI(UInt mask, UInt intNum);

    /*!
     *  ======== setPriority ========
     *  Set an interrupt's priority.
     *
     *  Not an instance function so that it can be used
     *  with non-dispatched interrupts.
     *
     *  @param(intNum)      ID of interrupt
     *  @param(priority)    priority
     */
    Void setPriority(UInt intNum, UInt priority);

instance:

    /*!
     *  ======== type ========
     *  Interrupt type (IRQ/FIQ). Default is IRQ.
     *
     *  @a(NOTE)
     *  FIQs are only supported when {@link #enableSecureMode} is set to
     *  true.
     */
    config Type type = Type_IRQ;

    /*!
     *  ======== triggerSensitivity ========
     *  Set an interrupt's trigger sensitivity
     *
     *  2-bit field that configures the trigger sensitivity of an
     *  interrupt.
     *
     *  On the Cortex-A15, all software generated interrupts (SGI)
     *  are edge-triggered (b10) and all private peripheral interrupts (PPI)
     *  are level-sensitive (b01). The trigger sensitivity of these
     *  interrupt types cannot be changed.
     *
     *  For shared peripheral interrupts (SPI), the LSB of the bit-pair
     *  is read only and is always 1. The MSB of the bit-pair can be
     *  altered to change trigger sensitivity.
     *
     *  Possible bit-pair encodings for Cortex-A15 SPIs:
     *      b01    Interrupt is active-High level-sensitive (default)
     *      b11    Interrupt is rising edge-sensitive
     *
     *  For more information please refer section 4.3.13 on
     *  Interrupt Configuration Registers (GICD_ICFGRn) in
     *  ARM Generic Interrupt Controller Architecure Spec v2.0
     */
    config UInt triggerSensitivity = ~(0);

    /*!
     *  ======== targetProcList ========
     *  Set an interrupt's target processor list.
     *
     *  This is an 8-bit CPU targets field that stores the list of target
     *  processors for the interrupt. That is, it holds the list of CPU
     *  interfaces to which the GIC Distributor will forward the interrupt
     *  if it is asserted and has sufficient priority.
     *
     *  Each bit in targetProcList refers to the corresponding processor.
     *  For instance, a value of 0x3 means the pending interrupt is
     *  forwarded to processor 0 and 1.
     *
     *  For more information please refer section 4.3.12 on
     *  Interrupt Processor Targets Registers (GICD_ITARGETSRn) in
     *  ARM Generic Interrupt Controller Architecure Spec v2.0
     *
     *  If running in {@link ti.sysbios.BIOS#smpEnabled SMP mode}
     *  and both the targetProcList Hwi param as well as the
     *  {@link #intAffinity}[] array entry for the intNum are set,
     *  targetProcList is given precedence and is used to configure
     *  the interrupt's target processors.
     *
     *  @a(NOTE)
     *  Target processor list is read-only for the first 32 interrupts.
     *  Therefore, this field will have no effect for interrupt numbers
     *  less than 32 (intNum 0-31).
     */
    config UInt targetProcList = 0x0;

    /*!
     *  ======== Interrupt priority ========
     *  Hwi instance interrupt priority.
     *
     *  Valid priorities are device dependent and their
     *  nesting behaviors depend on the {@link #BPR} setting.
     *
     *  See the ARM GIC Architecture Specification v2.0 document for more
     *  details.
     */
    override config Int priority = -1;

    /*! The interrupt controller is designed for priority based interrupts */
    override config IHwi.MaskingOption maskSetting = IHwi.MaskingOption_LOWER;

    /*!
     *  ======== reconfig ========
     *  Reconfigure a dispatched interrupt.
     */
    Void reconfig(FuncPtr fxn, const Params *params);

internal:   /* not for client use */

    /*!
     *  ======== inUseMeta ========
     *  @_nodoc
     *  Check for Hwi already in use.
     *  For internal SYS/BIOS use only.
     *  Should be called prior to any internal Hwi.create().
     *
     *  @param(intNum)  interrupt number
     */
    metaonly Bool inUseMeta(UInt intNum);

    /*
     * Swi and Task module function pointers.
     * Used to decouple Hwi from Swi and Task when
     * dispatcherSwiSupport or
     * dispatcherTaskSupport is false.
     */
    config UInt (*swiDisable)();
    config Void (*swiRestoreHwi)(UInt);
    config UInt (*taskDisable)();
    config Void (*taskRestoreHwi)(UInt);

    /*
     *  ======== postInit ========
     *  finish initializing static and dynamic Hwis
     */
    Int postInit(Object *hwi, Error.Block *eb);

    /*
     *  ======== initIntControllerCore0 ========
     */
    Void initIntControllerCore0();

    /* setup FIQ stack pointer */
    Void initFIQStack(Ptr fiqStack);

    /* default FIQ Interrupt Dispatcher */
    Void dispatchFIQC();

    /* Interrupt Dispatcher assembly code wrapper */
    Void dispatchIRQ();

    /* Interrupt Dispatcher C code */
    Void dispatchIRQC(Irp irp);

    /* non plugged interrupt handler */
    Void nonPluggedHwiHandler(UArg arg);

    /*!
     *  const array to hold all HookSet objects.
     */
    config HookSet hooks[length] = [];

    /*! Meta World Only Hwi Configuration Object. */
    metaonly struct InterruptObj {
        Bool used;              /* Interrupt already defined? */
        FuncPtr fxn;            /* Dispatched ISR function */
    };

    /*!
     * Meta-only array of interrupt objects.
     * This meta-only array of Hwi config objects is initialized
     * in Hwi.xs:module$meta$init().
     */
    metaonly config InterruptObj interrupt[];

    /*!
     * GIC Distributor base address
     */
    metaonly config Ptr gicdBaseAddress;

    /*!
     * GIC cpu interface base address
     */
    metaonly config Ptr giccBaseAddress;

    struct Instance_State {
        Type        type;             // Interrupt Type
        UInt        priority;         // Interrupt Priority
        UArg        arg;              // Argument to Hwi function.
        FuncPtr     fxn;              // Hwi function.
        Irp         irp;              // current IRP
        Ptr         hookEnv[];
        UInt        triggerSensitivity;
        UInt        targetProcList;
    };

    struct Module_State {
        Char         *taskSP[];       // temporary storage of interrupted
                                      // Task's SP during ISR execution
        Char         *isrStack[];     // Points to isrStack address
        Char          hwiStack[][];   // IRQ stack for each core
        Ptr           isrStackSize;   // = Program.stack
                                      // !!! The above three fields MUST be kept
                                      // !!! at the base of the module state
                                      // !!! GNU switchAndRunFunc and
                                      // !!! SMP Core module assumes it
        UInt32        iser[32];       // Initial Interrupt Set Enable Reg values
        UInt32        icfgr[];        // Initial Trigger sensitivity values
        UInt32        itargetsr[];    // Initial interrupt target processors
        UInt          spuriousInts;   // Count of spurious interrupts
        UInt          lastSpuriousInt;// Most recent spurious interrupt
        UInt          irp;            // temporary irp storage for IRQ handler
        Ptr           isrStackBase;   // = __TI_STACK_BASE
        Hwi.Object    nonPluggedHwi;  // default Hwi object
        Handle        dispatchTable[];// dispatch table
        volatile UInt curIntId;       // current Interrupt Id
        UInt32        igroupr[];      // Initial Interrupt Group (0/1)
        Char          fiqStack[][];   // buffers used for FIQ stacks
        SizeT         fiqStackSize;   // FIQ stack size
        UInt8         intAffinity[];  // smp int-to-coreId mappings
    };
}
