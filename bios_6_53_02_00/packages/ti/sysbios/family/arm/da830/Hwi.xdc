/*
 * Copyright (c) 2015, Texas Instruments Incorporated
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
 *
 */
package ti.sysbios.family.arm.da830;

import xdc.runtime.Diags;
import xdc.runtime.Log;
import xdc.runtime.Assert;
import xdc.rov.ViewInfo;
import xdc.runtime.Error;

/*!
 *  ======== Hwi ========
 *  Hardware Interrupt Support Module.
 *
 *  This Hwi module provides ARM family-specific implementations of the
 *  APIs defined in {@link ti.sysbios.interfaces.IHwi IHwi}.
 *
 *  Additional ARM device-specific APIs are also provided.
 *
 *  IRQ Interrupts are nestable and can invoke SYS/BIOS functions.
 *  FIQ Interrupts are non-nestable and cannot invoke SYS/BIOS functions.
 *
 *  The IRQ dispatcher re-enables IRQ interrupts prior to invoking the
 *  ISR function associated with an interrupt but uses the CP INTC's
 *  Host Interrupt Nesting Level Register (HINLR) to suppress lower
 *  priority interrupts while the interrupt is being serviced.
 *
 *  The default FIQ handler does not re-enable FIQ interrupts nor
 *  use the HINLR. It simply calls the registered FIQ ISR and returns.
 *
 *  To statically configure a non-dispatched interrupt:
 *  To dynamically configure a non-dispatched interrupt:
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #clearInterrupt}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #create}           </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #disable}          </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disableFIQ}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disableInterrupt} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #disableIRQ}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enable}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableFIQ}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableInterrupt}  </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableIRQ}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getHandle}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #Params_init}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restore}          </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restoreFIQ}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restoreInterrupt} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restoreIRQ}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setPriority}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #construct}        </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #delete}           </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #destruct}         </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getHookContext}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #reconfig}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setFunc}          </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setHookContext}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started (e.g. Hwi_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started (e.g. Hwi_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *
 *
 *  </table>
 *  @p
 */

@Template("./Hwi.xdt")  /* generates the vector table and the dispatcher */
@ModuleStartup          /* generates call to Hwi_Module_startup at startup */
@InstanceInitStatic	/* allow constructs in static only systems */

module Hwi inherits ti.sysbios.interfaces.IHwi
{

    // -------- Module Constants --------

    /*! The DA830 ARM Interrupt Controller has 101 defined interrupts. */
    const Int NUM_INTERRUPTS = 101;

    // -------- Module Types --------

    /*! Hwi vector function type definition. */
    typedef Void (*VectorFuncPtr)(void);

    /*! @_nodoc Hwi plug function type definition. */
    typedef Void (*PlugFuncPtr)(void);

    /*!
     * Common Platform Interrupt Controller.
     */
    struct CPINTC {
        UInt32 REV;         /*! 0x00 Revision Register */
        UInt32 CR;          /*! 0x04 Control Register */
        UInt32 RES_08;      /*! 0x08 reserved */
        UInt32 HCR;         /*! 0x0C Host Control Register */
        UInt32 GER;         /*! 0x10 Global Enable Register */
        UInt32 RES_14;      /*! 0x14 reserved */
        UInt32 RES_18;      /*! 0x18 reserved */
        UInt32 GNLR;        /*! 0x1C Global Nesting Level Register */
        UInt32 SISR;        /*! 0x20 Status Index Set Register */
        UInt32 SICR;        /*! 0x24 Status Index Clear Register */
        UInt32 EISR;        /*! 0x28 Enable Index Set Register */
        UInt32 EICR;        /*! 0x2C Enable Index Clear Register */
        UInt32 GWER;        /*! 0x30 Global Wakeup Enable Register */
        UInt32 HIEISR;      /*! 0x34 Host Int Enable Index Set Register */
        UInt32 HIDISR;      /*! 0x38 Host Int Disable Index Set Register */
        UInt32 RES_3C;      /*! 0x3C reserved */
        UInt32 PPR;         /*! 0x40 Pacer Prescale Register */
        UInt32 RES_44;      /*! 0x44 reserved */
        UInt32 RES_48;      /*! 0x48 reserved */
        UInt32 RES_4C;      /*! 0x4C reserved */
        Ptr   *VBR;         /*! 0x50 Vector Base Register */
        UInt32 VSR;         /*! 0x54 Vector Size Register */
        Ptr    VNR;         /*! 0x58 Vector Null Register */
        UInt32 RES_5C[9];   /*! 0x5C-0x7C reserved */
        Int32  GPIR;        /*! 0x80 Global Prioritized Index Register */
        Ptr   *GPVR;        /*! 0x84 Global Prioritized Vector Register */
        UInt32 RES_88;      /*! 0x88 reserved */
        UInt32 RES_8C;      /*! 0x8C reserved */
        UInt32 GSIER;       /*! 0x90 Global Secure Interrupt Enable Register */
        UInt32 SPIR;        /*! 0x94 Secure Prioritized Index Register */
        UInt32 RES_98[26];  /*! 0x98-0xFC reserved */
        UInt32 PPMR[64];    /*! 0x100-0x1FC Pacer Parameter/Map Registers */
        UInt32 SRSR[32];    /*! 0x200-0x27C Status Raw/Set Registers */
        UInt32 SECR[32];    /*! 0x280-0x2FC Status Enabled/Clear Registers */
        UInt32 ESR[32];     /*! 0x300-0x37C Enable Set Registers */
        UInt32 ECR[32];     /*! 0x380-0x3FC Enable Clear Registers */
        UInt8  CMR[1024];   /*! 0x400-0x7FC Channel Map Registers */
        UInt8  HIMR[256];   /*! 0x800-0x8FC Host Interrupt Map Registers */
        UInt32 HIPIR[256];  /*! 0x900-0xCFC Host Interrupt Pri Index Registers */
        UInt32 PR[32];      /*! 0xD00-0xD7C Polarity Registers */
        UInt32 TR[32];      /*! 0xD80-0xDFC Type Registers */
        UInt32 WER[64];     /*! 0xE00-0xEFC Wakeup Enable Registers */
        UInt32 DSR[64];     /*! 0xF00-0xFFC Debug Select Registers */
        UInt32 SER[32];     /*! 0x1000-0x107C Secure Enable Registers */
        UInt32 SDR[32];     /*! 0x1080-0x10FC Secure Disable Registers */
        UInt32 HINLR[256];  /*! 0x1100-0x14FC Host Interrupt Nesting Level Registers */
        UInt32 HIER[8];     /*! 0x1500-0x151F Host Interrupt Enable Registers */
        UInt32 RES_1520[56];/*! 0x1520-0x15fC Reserved */
        Ptr   *HIPVR[256];  /*! 0x1600-0x19fC Host Interrupt Prioritized Vector */
    };

    /*!
     * Physical Common Platform Interrupt Controller Device.
     * Short name is "Hwi_cpIntc"
     * Long name is "ti_sysbios_family_arm_da830_Hwi_cpIntc"
     */
    extern volatile CPINTC cpIntc;

    /*!
     *  ======== BasicView ========
     *  @_nodoc
     */
    metaonly struct BasicView {
        Ptr         halHwiHandle;
        String      label;
        Int         intNum;
        Int         priority;
        String      fxn;
        UArg        arg;
        Ptr         irp;
        String      status;
    };

    /*!
     *  ======== ModuleView ========
     *  @_nodoc
     */
    metaonly struct ModuleView {
        String      options[4];
        String      hwiStackPeak;
        SizeT       hwiStackSize;
        Ptr         hwiStackBase;
        UInt        priorities[256];
    };

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Basic', {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitBasic', structName: 'BasicView'}],
                ['Module', {type: ViewInfo.MODULE, viewInitFxn: 'viewInitModule', structName: 'ModuleView'}]
            ]
        });

    // -------- Module Parameters --------

    /*! Assert when bad maskSetting parameter provided */
    config Assert.Id A_unsupportedMaskingOption = {
        msg: "A_unsupportedMaskingOption: unsupported maskSetting."
    };

    /*! Reset Handler. Default is c_int00 */
    metaonly config VectorFuncPtr resetFunc;

    /*! Undefined instruction exception handler. Default is self loop */
    metaonly config VectorFuncPtr undefinedInstFunc;

    /*! SWI Handler. Default is internal SWI handler */
    metaonly config VectorFuncPtr swiFunc;

    /*! Prefetch abort exception handler. Default is self loop */
    metaonly config VectorFuncPtr prefetchAbortFunc;

    /*! Data abort exception handler. Default is self loop */
    metaonly config VectorFuncPtr dataAbortFunc;

    /*! Reserved exception handler. Default is self loop */
    metaonly config VectorFuncPtr reservedFunc;

    /*! IRQ interrupt handler. Default is internal IRQ dispatcher */
    metaonly config VectorFuncPtr irqFunc;

    /*! FIQ interrupt handler. Default is internal FIQ dispatcher */
    metaonly config VectorFuncPtr fiqFunc;

    /*!
     *  non-dispatched interrupt object.
     *  provided so that XGCONF users can easily plug non-dispatched interrupts
     */
    metaonly struct NonDispatchedInterrupt {
        Int             intNum;
        PlugFuncPtr     fxn;            /*! "Hwi_plug'd" ISR function. */
        UInt            priority;
        Bool            enableInt;
    };

    /*!
     *  non-dispatched interrupt array.
     *  provided so that XGCONF users can easily plug non-dispatched interrupts
     */
    metaonly config NonDispatchedInterrupt nonDispatchedInterrupts[string];

    /*!
     *  FIQ stack pointer. Default = null.
     *  (Indicates that stack is to be created using
     *  staticPlace()
     */
    config Ptr fiqStack = null;

    /*!
     *  FIQ stack size in bytes.
     *  Default is 1024 bytes.
     */
    metaonly config SizeT fiqStackSize = 1024;

    /*!
     *  Memory section used for FIQ stack
     *  Default is null.
     */
    metaonly config String fiqStackSection = null;

    /*!
     *  IRQ stack pointer. Default = null.
     *  (Indicates that stack is to be created using
     *  staticPlace()
     */
    config Ptr irqStack = null;

    /*!
     *  IRQ stack size in bytes.
     *  Default is 256 bytes.
     *  This is enough room for 32 nested IRQ interrupts.
     *
     *  An IRQ interrupt pushes 2 32bit words onto the IRQ stack.
     */
    metaonly config SizeT irqStackSize = 256;

    /*!
     *  Memory section used for IRQ stack
     *  Default is null.
     */
    metaonly config String irqStackSection = null;

    /*!
     *  Location of the Interrupt Vector Table
     *
     *  The default placement of the Interrupt Vector Table
     *  is immediately after the ARM exception table located
     *  at 0xffff0000.
     *
     *  The vector table is internally assigned to the ".vectorTable"
     *  memory section.
     */
    metaonly config Ptr vectorTableAddress = 0xffff0040;

    /*!
     *  Error raised when Hwi is already defined
     */
    config Error.Id E_alreadyDefined = {
        msg: "E_alreadyDefined: Hwi already defined: intr# %d"
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
     */
    @Macro
    override UInt enable();

    /*!
     *  ======== restore ========
     */
    @Macro
    override Void restore(UInt key);

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

    /*!
     *  @_nodoc
     *  ======== plug ========
     *  Plug an interrupt vector with an ISR address.
     *
     *  Hwi_plug writes an Interrupt Service Fetch Packet (ISFP) into the
     *  Interrupt Service Table (IST), at the address corresponding to intNum
     *  The op-codes written in the ISFP create a branch to the function
     *  entry  point specified by fxn:
     *
     *  @p(code)
     *          stw     b0, *SP--[1]
     *          mvk     fxn, b0
     *          mvkh    fxn, b0
     *          b       b0
     *          ldw     *++SP[1],b0
     *          nop     4
     *  @p
     *
     *  Hwi_plug hooks up the specified function as the branch target of a
     *  hardware interrupt (fielded by the CPU) at the vector address
     *  specified in intNum. Hwi_plug does not enable the interrupt.
     *  Use Hwi_enableIER to enable specific interrupts.
     *
     *  For internal SYS/BIOS use only.
     *
     *  Constraints and Calling Context
     *  o vecid must be a valid interrupt ID in the range of 0-15.
     *
     *  @param(intNum)  interrupt number
     *  @param(fxn)     pointer to ISR function
     */
    Void plug(UInt intNum, PlugFuncPtr fxn);

    /*!
     *  ======== plugMeta ========
     *  Statically plug an interrupt vector with an ISR address.
     *
     *  @param(intNum)  interrupt number
     *  @param(fxn)     pointer to ISR function
     */
    metaonly Void plugMeta(UInt intNum, PlugFuncPtr fxn);

    /*!
     *  ======== getHandle ========
     *  Returns Hwi_handle associated with intNum
     *
     *  @param(intNum)  interrupt number
     */
    Handle getHandle(UInt intNum);

    /*!
     *  ======== enableFIQ ========
     *  Enable FIQ interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    UInt enableFIQ();

    /*!
     *  ======== disableFIQ ========
     *  Disable FIQ interrupts.
     *
     *  @b(returns)     previous FIQ interrupt enable/disable state
     */
    UInt disableFIQ();

    /*!
     *  ======== restoreFIQ ========
     *  Restore FIQ interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    Void restoreFIQ(UInt key);

    /*!
     *  ======== enableIRQ ========
     *  Enable IRQ interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    UInt enableIRQ();

    /*!
     *  ======== disableIRQ ========
     *  Disable IRQ interrupts.
     *
     *  @b(returns)     previous IRQ interrupt enable/disable state
     */
    UInt disableIRQ();

    /*!
     *  ======== restoreIRQ ========
     *  Restore IRQ interrupts.
     *
     *  @param(key)     enable/disable state to restore
     */
    Void restoreIRQ(UInt key);

    /*!
     *  ======== beginIRQ ========
     *  Function to be invoked at the beginning of a
     *  non-dispatched IRQ handler. Services cpIntc.
     */
    Void beginIRQ();

    /*!
     *  ======== endIRQ ========
     *  Function to be invoked at the end of a
     *  non-dispatched IRQ handler. Services cpIntc.
     */
    Void endIRQ();

    /*!
     *  ======== beginFIQ ========
     *  Function to be invoked at the beginning of a
     *  non-dispatched FIQ handler. Services cpIntc.
     */
    Void beginFIQ();

    /*!
     *  ======== endFIQ ========
     *  Function to be invoked at the end of a
     *  non-dispatched FIQ handler. Services cpIntc.
     */
    Void endFIQ();

    /*!
     *  ======== setPriority ========
     *  Set an interrupt's relative priority.
     *
     *  Valid priorities are 0 - 31. 0 is highest priority.
     *  Priorities 0 - 1 are routed to the ARM's FIQ interrupt.
     *  Priorities 2 - 31 are routed to the ARM's IRQ interrupt.
     *
     *  @param(intNum)      ID of interrupt
     *  @param(priority)    priority
     */
    Void setPriority(UInt intNum, UInt priority);

instance:

    /*!
     *  Interrupt priority.
     *  Valid priorities are 0 - 31. 0 is highest priority.
     *  Priorities 0 - 1 are routed to the ARM's FIQ interrupt.
     *  Priorities 2 - 31 are routed to the ARM's IRQ interrupt.
     *  The default is 31 which is the lowest priority IRQ interrupt.
     */
    override config Int priority = 31;

    /*!
     *  ======== reconfig ========
     *  Reconfigure a dispatched interrupt.
     */
    Void reconfig(FuncPtr fxn, const Params *params);

internal:   /* not for client use */

    /*! Hwi vector function type definition. */
    typedef Void (*HandlerFuncPtr)(Handle, UInt);

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
     *  ======== initIntController ========
     */
    Void initIntController();

    /* assembly code mode registers setup */
    Void init();

    /* Interrupt Dispatcher assembly code wrapper */
    Void dispatchIRQ();

    /* IRQ Interrupt Dispatcher */
    Void dispatchIRQC();

    /* default FIQ Interrupt Dispatcher */
    Void dispatchFIQC();

    /* spurious interrupt handler */
    Void spuriousInt();

    Void handlerNONE(Handle hwi, UInt intNum);

    Void handlerALL(Handle hwi, UInt intNum);

    Void handlerLOWER(Handle hwi, UInt intNum);

    Void handlerSELF(Handle hwi, UInt intNum);

    /*!
     *  const array to hold all HookSet objects.
     */
    config HookSet hooks[length] = [];

    /*! Meta World Only Hwi Configuration Object. */
    metaonly struct InterruptObj {
        String name;            /* symbol used for vector table entry */
        Bool used;              /* Interrupt already defined? */
        Bool useDispatcher;     /* Should dispatcher handle this Int? */
        UInt priority;          /* used to determine FIQ/IRQ type */
        FuncPtr fxn;            /* Dispatched ISR function */
        PlugFuncPtr pfxn;       /* "Hwi_plug'd" ISR function. */
    };

    /*!
     * Meta-only array of interrupt objects.
     * This meta-only array of Hwi config objects is initialized
     * in Hwi.xs:module$meta$init().
     */
    metaonly config InterruptObj interrupt[NUM_INTERRUPTS];

    struct Instance_State {
        UArg            arg;            // Argument to Hwi function.
        FuncPtr         fxn;            // Hwi function.
        Int             intNum;         // Interrupt number
        HandlerFuncPtr  handler;        // MaskingOption-unique handler
        Irp             irp;            // current IRP
        Ptr             hookEnv[];
    };

    struct Module_State {
        Bits32      er[4];          // Initial Enable Reg values
        UInt        irp;            // temporary irp storage for IRQ handler
        UInt8       priorities[NUM_INTERRUPTS];
                                    // table of interrupt priorities
        Char        *taskSP;        // temporary storage of interrupted
                                    // Task's SP during ISR execution
        /* ROM */
        Ptr         vectorTableBase;// Points to base of vector table
        Char        *isrStack;      // Points to isrStack address
        Ptr         isrStackBase;   // _stack
        Ptr         isrStackSize;   // _STACK_SIZE
        Char        fiqStack[];     // buffer used for FIQ stack
        SizeT       fiqStackSize;

        Handle      dispatchTable[NUM_INTERRUPTS];
                                    // dispatch table
    };
}

