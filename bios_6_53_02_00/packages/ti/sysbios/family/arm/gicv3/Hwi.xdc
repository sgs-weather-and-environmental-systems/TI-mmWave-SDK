/*
 * Copyright (c) 2016-2017, Texas Instruments Incorporated
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
package ti.sysbios.family.arm.gicv3;

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

    /* Exception types */
    enum ExcType {
        ExcType_Synchronous,
        ExcType_SError
    };

    /*!
     *  ======== Type ========
     *  Interrupt type. IRQ or FIQ
     */
    enum Type {
        Type_IRQ,           /*! IRQ interrupt. */
        Type_FIQ            /*! FIQ interrupt. */
    };

    /*!
     *  ======== RoutingMode ========
     *  Routing mode. ANY or NODE
     */
    enum RoutingMode {
        RoutingMode_NODE,   /*! Route interrupt to node specified by
                                affinity fields. */
        RoutingMode_ALL     /*! Route interrupt to all nodes. */
    };

    /*!
     *  ======== IntAffinity ========
     *  Interrupt affinity type. Stores the hierarchical address (composed
     *  of different affinity levels) that uniquely identifies the core or
     *  processing element (PE) an interrupt is routed to.
     *
     *  The routingMode field determines whether an interrupt is routed to
     *  all nodes or a node identified by the affinity fields. This field
     *  takes the value Hwi_RoutingMode_ANY and Hwi_RoutingMode_NODE.
     *
     *  If {@link ti.sysbios.BIOS#smpEnabled BIOS.smpEnabled} is true then,
     *  all interrupts are forwarded to core 0 by default.
     *  If {@link ti.sysbios.BIOS#smpEnabled BIOS.smpEnabled} is false then,
     *  all interrupts are forwarded to all participating nodes.
     *
     *  @a(constraints)
     *  This config param is ignored if
     *  {@link ti.sysbios.family.arm.v8a.Core#bootMaster Core.bootMaster} is
     *  set to false.
     */
    struct IntAffinity {
        UInt8       aff0;        /*! Affinity level 0 - CoreId within cluster */
        UInt8       aff1;        /*! Affinity level 1 - Cluster Id */
        RoutingMode routingMode; /*! Routing Mode - ALL or particular NODE */
    };

    /*!
     *  ======== SgiIntAffinity ========
     *  Sgi interrupt affinity type. Stores affinity and routing mode
     *  information that is used to determine which cores will the generated
     *  SGI be routed to.
     *
     *  The routingMode field determines whether a generated SGI is routed to
     *  all cores except the core generating the SGI (Hwi_RoutingMode_ANY) or
     *  to list of target cores identified by the "targetList" and "aff1"
     *  fields (Hwi_RoutingMode_NODE).
     */
    struct SgiIntAffinity {
        UInt8       targetList;  /*! Bit map of target cores */
        UInt8       aff1;        /*! Identifies the target cluster */
        RoutingMode routingMode; /*! Routing Mode - ALL or NODE target list */
    };

    // -------- Module Types --------

    /*! Exception hook function type definition. */
    typedef Void (*ExceptionHookFuncPtr)(ExcContext *);

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
     *  Exception Context - Register contents at the time of an exception.
     */
    struct ExcContext {
        /* Thread Context */
        BIOS.ThreadType threadType; /* Type of thread executing at */
                                    /* the time the exception occurred */
        Ptr     threadHandle;       /* Handle to thread executing at */
                                    /* the time the exception occurred */
        Ptr     threadStack;        /* Address of stack contents of thread */
                                    /* executing at the time the exception */
                                    /* occurred */
        SizeT   threadStackSize;    /* size of thread stack */
        ExcType type;               /* Synchronous or SError */

        /* Internal Registers */
        Ptr     x0;
        Ptr     x1;
        Ptr     x2;
        Ptr     x3;
        Ptr     x4;
        Ptr     x5;
        Ptr     x6;
        Ptr     x7;
        Ptr     x8;
        Ptr     x9;
        Ptr     x10;
        Ptr     x11;
        Ptr     x12;
        Ptr     x13;
        Ptr     x14;
        Ptr     x15;
        Ptr     x16;
        Ptr     x17;
        Ptr     x18;
        Ptr     x19;
        Ptr     x20;
        Ptr     x21;
        Ptr     x22;
        Ptr     x23;
        Ptr     x24;
        Ptr     x25;
        Ptr     x26;
        Ptr     x27;
        Ptr     x28;
        Ptr     x29;
        Ptr     x30;
        Ptr     sp;                 /* sp_EL0 or sp_EL1 */
        Ptr     elr;                /* elr_EL1 */
        Ptr     spsr;               /* spsr_EL1 */

        /* Fault registers */
        Ptr     esr;                /* esr_EL1 */
    }

    /*!
     * Generic Interrupt Controller Distributor. Symbol "Hwi_gicd" is
     * a physical device
     */
    struct Gicd {
        UInt32 CTLR;            /*! 0x0000 Distributor Control Register */
        UInt32 TYPER;           /*! 0x0004 Interrupt Controller Type Register */
        UInt32 IIDR;            /*! 0x0008 Distributor Implementor Id Register */
        UInt32 hole0[13];       /*! 0x000C-0x03C */
        UInt32 SETSPI_NSR;      /*! 0x0040 Set SPI Register */
        UInt32 hole1;           /*! 0x0044 */
        UInt32 CLRSPI_NSR;      /*! 0x0048 Clear SPI Register */
        UInt32 hole2;           /*! 0x004C */
        UInt32 SETSPI_SR;       /*! 0x0050 Set SPI Register */
        UInt32 hole3;           /*! 0x0054 */
        UInt32 CLRSPI_SR;       /*! 0x0058 Clear SPI Register */
        UInt32 hole4[9];        /*! 0x005C-0x007C */
        UInt32 IGROUPR[32];     /*! 0x0080 Interrupt Group Registers */
        UInt32 ISENABLER[32];   /*! 0x0100 Interrupt Set-Enable Registers */
        UInt32 ICENABLER[32];   /*! 0x0180 Interrupt Clear-Enable Registers */
        UInt32 ISPENDR[32];     /*! 0x0200 Interrupt Set-Pending Registers */
        UInt32 ICPENDR[32];     /*! 0x0280 Interrupt Clear-Pending Registers */
        UInt32 ISACTIVER[32];   /*! 0x0300 Interrupt Set-Active Registers */
        UInt32 ICACTIVER[32];   /*! 0x0380 Interrupt Clear-Active Registers */
        UInt8  IPRIORITYR[992]; /*! 0x0400 Interrupt Priority Registers */
        UInt32 hole5[8];        /*! 0x07E0-0x07FC */
        UInt32 ITARGETSR[8];    /*! 0x0800 Interrupt Processor Targets
                                           Register */
        UInt32 hole6[248];      /*! 0x0820-0x0BFC */
        UInt32 ICFGR[64];       /*! 0x0C00 Interrupt Configuration Registers */
        UInt32 IGRPMODR[32];    /*! 0x0D00 Interrupt Group Modifier Registers */
        UInt32 hole7[32];       /*! 0x0D80-0x0DFC */
        UInt32 NSACR[64];       /*! 0x0E00 NonSecure Access Control Registers */
        UInt32 SGIR;            /*! 0x0F00 Software Generated Interrupt
                                           Register */
        UInt32 hole8[3];        /*! 0x0F04-0x0F0C */
        UInt32 CPENDSGIR[4];    /*! 0x0F10 SGI Clear-Pending Registers */
        UInt32 SPENDSGIR[4];    /*! 0x0F20 SGI Set-Pending Registers */
        UInt32 hole9[5172];     /*! 0x0F30-0x5FFC */
        UInt64 IROUTER[992];    /*! 0x6000 Interrupt Routing Registers */
        UInt32 hole10[4160];    /*! 0x7F00-0xBFFC */
        UInt32 ESTATUSR;        /*! 0xC000 Extended Status Register */
        UInt32 ERRTESTR;        /*! 0xC004 Error Test Register */
        UInt32 hole11[31];      /*! 0xC008-0xC080 */
        UInt32 SPISR[30];       /*! 0xC084 SPI Status Registers */
        UInt32 hole12[4021];    /*! 0xC0FC-0xFFCC */
        UInt32 PIDR4;           /*! 0xFFD0 Peripheral ID4 Register */
        UInt32 PIDR5;           /*! 0xFFD4 Peripheral ID5 Register */
        UInt32 PIDR6;           /*! 0xFFD8 Peripheral ID6 Register */
        UInt32 PIDR7;           /*! 0xFFDC Peripheral ID7 Register */
        UInt32 PIDR0;           /*! 0xFFE0 Peripheral ID0 Register */
        UInt32 PIDR1;           /*! 0xFFE4 Peripheral ID1 Register */
        UInt32 PIDR2;           /*! 0xFFE8 Peripheral ID2 Register */
        UInt32 PIDR3;           /*! 0xFFEC Peripheral ID3 Register */
        UInt32 CIDR0;           /*! 0xFFF0 Component  ID0 Register */
        UInt32 CIDR1;           /*! 0xFFF4 Component  ID1 Register */
        UInt32 CIDR2;           /*! 0xFFF8 Component  ID2 Register */
        UInt32 CIDR3;           /*! 0xFFFC Component  ID3 Register */
    };

    extern volatile Gicd gicd;

    /*!
     * Generic Interrupt Controller Redistributor Interface (RD_base).
     * Symbol "Hwi_gicr" is a physical device.
     */
    struct Gicr {
        UInt32 CTLR;            /*! 0x0000 Redistributor Control Register */
        UInt32 IIDR;            /*! 0x0004 Implementor Id Register */
        UInt32 TYPER[2];        /*! 0x0008 Redistributor Type Register */
        UInt32 hole0;           /*! 0x0010 */
        UInt32 WAKER;           /*! 0x0014 Power Management Control Register */
        UInt32 hole1[22];       /*! 0x0018-0x006C */
        UInt32 PROPBASER[2];    /*! 0x0070 LPI Config Table Base Register */
        UInt32 PENDBASER[2];    /*! 0x0078 LPI Pending Table Base Register */
    };

    /*!
     * Generic Interrupt Controller Redistributor Interface (SGI_base).
     * Symbol "Hwi_gics" is a physical device.
     */
    struct Gics {
        UInt32 hole0[32];       /*! 0x0000-0x007C */
        UInt32 IGROUPR0;        /*! 0x0080 Interrupt Group Register */
        UInt32 hole1[31];       /*! 0x0084-0x00FC */
        UInt32 ISENABLER0;      /*! 0x0100 Interrupt Set-Enable Register */
        UInt32 hole2[31];       /*! 0x0104-0x017C */
        UInt32 ICENABLER0;      /*! 0x0180 Interrupt Set-Enable Register */
        UInt32 hole3[31];       /*! 0x0184-0x01FC */
        UInt32 ISPENDR0;        /*! 0x0200 Interrupt Set-Enable Register */
        UInt32 hole4[31];       /*! 0x0204-0x027C */
        UInt32 ICPENDR0;        /*! 0x0280 Interrupt Set-Enable Register */
        UInt32 hole5[31];       /*! 0x0284-0x02FC */
        UInt32 ISACTIVER0;      /*! 0x0300 Interrupt Set-Enable Register */
        UInt32 hole6[31];       /*! 0x0304-0x037C */
        UInt32 ICACTIVER0;      /*! 0x0380 Interrupt Set-Enable Register */
        UInt32 hole7[31];       /*! 0x0384-0x03FC */
        UInt8  IPRIORITYR[32];  /*! 0x0400 Interrupt Priority Registers */
        UInt32 hole8[504];      /*! 0x0420-0x0BFC */
        UInt32 ICFGR[2];        /*! 0x0C00 Interrupt Configuration Registers */
        UInt32 hole9[62];       /*! 0x0C08-0x0CFC */
        UInt32 IGRPMODR0;       /*! 0x0D00 Interrupt Group Modifier Register */
        UInt32 hole10[63];      /*! 0x0D04-0x0DFC */
        UInt32 NSACR;           /*! 0x0E00 NonSecure Access Control Register */
        UInt32 hole11[11391];   /*! 0x0E04-0xBFFC */
        UInt32 MISCSTATUSR;     /*! 0xC000 Miscellaneous Status Register */
        UInt32 hole12[31];      /*! 0xC004-0xC07C */
        UInt32 PPISR;           /*! 0xC080 PPI Status Register */
    };

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

    // -------- Module Parameters --------

    /*!
     *  Enable full exception decoding, default is true.
     *
     *  When enabled, the exception handler will fully
     *  decode an exception and dump the registers to the
     *  system console.
     *
     *  When set to false, only an Error is printed on the console.
     *
     *  In either case, the full exception context is always
     *  saved and visible with ROV.
     */
    config Bool enableDecode = true;

    /*!
     *  User Exception Context Buffer Address
     *
     *  By default, when an exception occurs, an {@link #ExcContext}
     *  structure is allocated on the ISR stack and filled in within the
     *  exception handler.
     *
     *  If {@link #excContextBuffer} is initialized by the user, the
     *  {@link #ExcContext} structure will be placed at that address instead.
     *
     *  The buffer must be large enough to contain an {@link #ExcContext}
     *  structure.
     */
    metaonly config Ptr excContextBuffer[];

    /*!
     *  User Synchronous Exception hook function.
     *
     *  Called just after the exception context has been initialized.
     *
     *  This function will be run on the ISR stack.
     *
     *  This function must run to completion.
     *
     *  It is called without any Task or Swi scheduling protection
     *  and therefore can not call any functions that may cause a Swi or Task
     *  scheduling operation (Swi_post(), Semaphore_post(), Event_post(), etc).
     */
    config ExceptionHookFuncPtr syncExcHookFunc[];

    /*!
     *  User SError Exception hook function.
     *
     *  Called just after the exception context has been initialized.
     *
     *  This function will be run on the ISR stack.
     *
     *  This function must run to completion.
     *
     *  It is called without any Task or Swi scheduling protection
     *  and therefore can not call any functions that may cause a Swi or Task
     *  scheduling operation (Swi_post(), Semaphore_post(), Event_post(), etc).
     */
    config ExceptionHookFuncPtr sErrorExcHookFunc[];

    /*!
     *  @_nodoc
     *  ======== irqStackSection ========
     *  Memory section used for IRQ stack on each core
     *  Default is null.
     */
    metaonly config String irqStackSection = null;

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
     *  ======== intAffinity ========
     *  SMP Interrupt affinity mappings
     *
     *  In SMP mode, this array maps the interrupt number to the
     *  core it is to be tied to. By default, all interrupts
     *  are routed to Core0.
     *
     *  For example, to route Timer 1 (from the ti.sysbios.timers.dmtimer.Timer)
     *  module interrupt to core 1 rather than core 0, add the following to
     *  your config file:
     *
     *  @p(code)
     *     var Hwi = xdc.useModule('ti.sysbios.family.arm.gicv3.Hwi');
     *     Hwi.intAffinity[<intNum>] = {aff0: 1, aff1: 0,
                                        routingMode: Hwi.RoutingMode_NODE};
     *  @p
     *
     *  @a(constraints)
     *  Interrupt numbers below 32 are ignored. This config param only
     *  allows routing interrupt numbers greater than or equal to #32.
     */
    metaonly config IntAffinity intAffinity[];

    /*!
     *  @_nodoc
     *  ======== raiseSGI ========
     *  Generate an SGI interrupt and route it to CPUs specified by the
     *  affinity field.
     *
     *  @param(affinity)    If the "routingMode" field is set to
     *                      Hwi_RoutingMode_ANY, then the interrupt is routed to
     *                      all cores except this core. Else, if "routingMode"
     *                      is set to Hwi_RoutingMode_NODE, the affinity fields
     *                      are used to determine which cores the interrupt
     *                      should be routed to. "aff0" field is a bit mapped
     *                      target list identifying all cores within the cluster
     *                      identified by "aff1".
     *  @param(intNum)      Interrupt number
     */
    Void raiseSGI(SgiIntAffinity affinity, UInt intNum);

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
     *
     *  @a(constraints)
     *  This Hwi param is ignored if
     *  {@link ti.sysbios.family.arm.v8a.Core#bootMaster Core.bootMaster} is
     *  set to false.
     */
    config UInt triggerSensitivity = ~(0);

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

    struct GicRegisterMap {
        volatile Gicr *gicr;
        volatile Gics *gics;
    };

    config GicRegisterMap gicMap[];

    /*
     *  Number of GICD Enable registers
     */
    config UInt NUM_GICD_ENABLE_REGS;

    /*
     *  ======== initGicd ========
     *  Flag determines whether to initialize global gic distributor
     *  registers. It is set to false if this core is not the boot master.
     */
    config Bool initGicd = true;

    /*
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
     *  ======== dispatchIRQ ========
     *  Interrupt Dispatcher assembly code wrapper
     */
    Void dispatchIRQ(Bool usingEL0Stack);

    /*
     *  ======== dispatchIRQC ========
     *  Interrupt Dispatcher C code
     */
    Void dispatchIRQC(Irp irp);

    /*!
     *  ======== excDumpContext ========
     */
    Void excDumpContext();

    /*
     *  ======== excHandler ========
     */
    Void excHandler(UInt64 *excStack, ExcType excType);

    /*
     *  ======== initIntController ========
     */
    Void initIntController();

    /*
     *  ======== initStacks ========
     *  set up split stacks
     */
    Void initStacks(Ptr hwiStack);

    /*
     *  ======== nonPluggedHwiHandler ========
     *  Non-plugged interrupt handler
     */
    Void nonPluggedHwiHandler();

    /*
     *  ======== postInit ========
     *  finish initializing static and dynamic Hwis
     */
    Int postInit(Object *hwi, Error.Block *eb);

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
     * GIC Redistributor base address
     */
    metaonly config Ptr gicrBaseAddress;

    struct Instance_State {
        Type        type;             /* Interrupt Type */
        UInt        priority;         /* Interrupt Priority */
        UArg        arg;              /* Argument to Hwi function */
        FuncPtr     fxn;              /* Hwi function */
        Irp         irp;              /* current IRP */
        Ptr         hookEnv[];
        UInt        triggerSensitivity;
    };

    struct Module_State {
        Char         *isrStack[];     /* Points to isrStack address */
        Char          hwiStack[][];   /* IRQ stack for each core */
        Ptr           isrStackSize;   /* = Program.stack */
                                      /*
                                       * !!! The above three fields MUST be kept
                                       * !!! at the base of the module state
                                       * !!! GNU switchAndRunFunc and
                                       * !!! SMP Core module assumes it
                                       */
        UInt32        iser[32];       /* Initial Interrupt enable reg values */
        UInt32        icfgr[];        /* Initial Trigger sensitivity values */
        UInt          spuriousInts;   /* Count of spurious interrupts */
        UInt          lastSpuriousInt;/* Most recent spurious interrupt */
        UInt          irp;            /* temp irp storage for IRQ handler */
        Ptr           isrStackBase;   /* = __TI_STACK_BASE */
        Handle        dispatchTable[];/* dispatch table */
        volatile UInt curIntId;       /* current Interrupt Id */
        IntAffinity   intAffinity[];  /* smp int-to-coreId mappings */
        Bool          excActive[];    /* TRUE if an exception has occurred */
        ExcContext   *excContext[];   /* Exception context */
    };
}
