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

import xdc.rov.ViewInfo;

import xdc.runtime.Diags;
import xdc.runtime.Log;
import xdc.runtime.Assert;
import xdc.runtime.Error;

/*!
 *  ======== Hwi ========
 *  ARP32 Hardware Interrupt Support Module.
 *
 *  This Hwi module provides ARP32 family-specific implementations of the
 *  APIs defined in {@link ti.sysbios.interfaces.IHwi IHwi}.  Additional
 *  ARP32 device-specific APIs are also provided.
 *
 *  The interrupt numbers supported range from 0 to 127. Interrupts 0 to 31
 *  are supported on Interrupt Controller 0 (INTC0).  These can be mapped to
 *  one of the interrupt vectors 4 to 7.  Interrupts 32 to 63 interrupts are
 *  supported on INTC1 and can be mapped to interrupt vectors 8 to 11.
 *  Interrupts 64 to 95 are supported on INTC2 and can be mapped to interrupt
 *  vectors 12 and 13.  Interrupts 96 to 127 are supported on INTC3 and can
 *  be mapped to interrupt vectors 14 and 15.
 *
 *  @a(NOTE)
 *  In this Hwi module implementation, the instance config parameter value
 *  {@link #MaskingOption_LOWER} is equivalent to {@link #MaskingOption_SELF}.
 *  Statically configuring a Hwi object's {@link #Params.maskSetting} to
 *  {@link #MaskingOption_LOWER} will result in the generation of a benign
 *  build warning. Dynamic usages of {@link #MaskingOption_LOWER} will be
 *  silently converted to {@link #MaskingOption_SELF}.
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
 *    <tr><td> {@link #disableIER}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #disableInterrupt} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enable}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableIER}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableInterrupt}  </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getHandle}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #Params_init}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restore}          </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restoreIER}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #restoreInterrupt} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
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
 *  </table>
 *  @p
 *
 */

@Template("./Hwi.xdt")  /* generates the vector table and the dispatcher */
@ModuleStartup          /* generate a call to Hwi_init at startup */
@InstanceInitStatic	/* allow constructs in static only systems */

module Hwi inherits ti.sysbios.interfaces.IHwi
{
    // -------- Module Types --------

    /*! @_nodoc Hwi plug function type definition. */
    typedef Void (*PlugFuncPtr)(void);

    /*!
     *  ======== BasicView ========
     *  @_nodoc
     */
    metaonly struct BasicView {
        Ptr         halHwiHandle;
        String      label;
        UInt        intNum;
        UInt        vector;
        String      fxn;
        UArg        arg;           // Argument to Hwi function.
        Ptr         irp;
        String      disableIerMask;   // Interrupts to mask during ISR.
        String      restoreIerMask;   // Interrupts to restore after ISR.
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
    };

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Basic',    {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitBasic',    structName: 'BasicView'}],
                ['Module',   {type: ViewInfo.MODULE,   viewInitFxn: 'viewInitModule',   structName: 'ModuleView'}]
            ]
        });

    // -------- Module Parameters --------

    /*! number of interrupt supported */
    config Int NUM_INTERRUPTS;

    /*! number of interrupt vectors supported */
    config Int NUM_VECTORS;

    /*!
     *  Assert raised when an invalid interrupt number is passed to a Hwi call
     */
    config Assert.Id A_badIntNum = {
        msg: "A_badIntNum: Invalid interrupt number"
    };

    /*!
     *  Assert raised when an invalid vector number is passed to a Hwi call
     */
    config Assert.Id A_badVectNum = {
        msg: "A_badVectNum: Invalid interrupt vector number"
    };

    /*!
     *  Error raised when Hwi is already defined
     */
    config Error.Id E_alreadyDefined = {
        msg: "E_alreadyDefined: Hwi already defined: intr# %d"
    };

    /*!
     *  Error raised when a Hwi function that has not been implemented
     *  for the arp32 has been called
     */
    config Error.Id E_notImplemented = {
        msg: "E_notImplemented: Function not implemented: %s"
    };

    /*!
     *  Issued just prior to Hwi function invocation (with interrupts disabled)
     */
    config Log.Event LM_begin = {
        mask: Diags.USER1 | Diags.USER2,
        msg: "LM_begin: hwi: 0x%x, func: 0x%x, intNum: %d, irp: 0x%x"
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

    /*! Stub to be plugged for unused interrupts */
    Void selfLoop(UArg arg);

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
     *  ======== plugMeta ========
     *  Statically plug an interrupt vector with an ISR address.
     *
     *  @param(intNum)  interrupt number
     *  @param(fxn)     pointer to ISR function
     */
    metaonly Void plugMeta(UInt intNum, PlugFuncPtr fxn);

    /*!
     *  ======== getHandle ========
     *  Returns Hwi_handle associated with interrupt number
     *
     *  @param(intNum)  interrupt number
     *  @b(returns)     handle associated with intNum
     */
    Handle getHandle(UInt intNum);

    /*!
     *  ======== disableIER ========
     *  Disable certain maskable interrupts.
     *
     *  Atomically disables specific interrupts by clearing the bits
     *  specified by mask in the Interrupt Enable Register (IER).
     *
     *  The IER bits to be cleared should be set to 1 in the mask.
     *
     *  @param(mask)    bitmask of interrupts to disable
     *  @b(returns)     previous IER settings bitmask
     */
    Bits16 disableIER(Bits16 mask);

    /*!
     *  ======== enableIER ========
     *  Enable certain maskable interrupts.
     *
     *  Atomically enables specific interrupts by setting the bits
     *  specified by mask in the Interrupt Enable Register (IER).
     *
     *  The IER bits to be set should be set to 1 in the mask.
     *
     *  @param(mask)    bitmask of interrupts to enable
     *  @b(returns)     previous IER settings bitmask
     */
    Bits16 enableIER(Bits16 mask);

    /*!
     *  ======== restoreIER ========
     *  Restore maskable interrupts to the state they were in
     *  when either disableIER() or enableIER() was called.
     *
     *  Atomically writes the given mask to the IER register. Typically used
     *  to restore the IER register to the state returned from a call to
     *  either {@link #disableIER()} or {@link #enableIER()}.
     *
     *  @param(mask)    bitmask of interrupts to restore
     *  @b(returns)     previous IER settings bitmask
     */
    Bits16 restoreIER(Bits16 mask);

    /*!
     *  ======== plug ========
     *  Plug an interrupt vector with an ISR address.
     *
     *  Hwi_plug writes a function address into the interrupt vector table
     *  at the address corresponding to vectNum.
     *
     *  Hwi_plug hooks up the specified function as the branch target of a
     *  hardware interrupt (fielded by the CPU) at the vector address
     *  specified in vectNum. Hwi_plug does not enable the interrupt.
     *  Use Hwi_enableIER to enable specific interrupts.
     *
     *  Once Hwi_plug() is called on a vector, Hwi_create() will not work
     *  on that particular vector.
     *
     *  AN ISR PLUGGED WITH THIS API IS NOT SERVICED BY THE INTERRUPT
     *  DISPATCHER. CONSEQUENTLY, IT SHOULD NOT INVOKE ANY SYS/BIOS APIs
     *  (ie Semaphore_post())!!!
     *
     *  @a(constraints)
     *  o interrupt function MUST NOT INTERACT WITH SYS/BIOS.
     *    (ie do not call Semaphore_post())
     *
     *  o Hwi_create() will not work on the vector used by Hwi_plug().
     *
     *  o vecNum must be a valid interrupt vector
     *
     *  @param(vectNum)  interrupt vector number
     *  @param(fxn)      pointer to ISR function
     */
    Void plug(UInt vectNum, PlugFuncPtr fxn);

    /*!
     *  ======== post ========
     *  @_nodoc
     *  Generate an interrupt for the vector for test purposes.
     *
     *  @param(vectNum)      vector num to generate interrupt
     */
    Void postIntVector(UInt vectNum);

instance:

    /*!
     *  Dispatcher auto-nesting interrupt disable mask.
     *
     *  When the dispatcher's auto interrupt nesting support feature
     *  is enabled (see {@link #dispatcherAutoNestingSupport}),
     *  this mask defines which IER bits are disabled prior to invoking
     *  the user's ISR function with GIE = 1.
     *
     *  disableIerMask bits set to 1 correspond to IER bits that will be cleared
     *  prior to invoking the ISR.
     *
     *  The value of this mask is normally auto-calculated based on the
     *  value of the maskSetting. However, manual setting of this
     *  mask is enabled by setting the maskSetting to
     *  {@link #MaskingOption MaskingOption_BITMASK}.
     *
     *  The default value is derived from the
     *  {@link #MaskingOption MaskingOption_SELF}
     *  maskSetting.
     */
    config Bits16 disableIerMask = 0;

    /*!
     *  Dispatcher auto-nesting interrupt restore mask.
     *
     *  When the dispatcher's auto interrupt nesting support feature
     *  is enabled (see {@link #dispatcherAutoNestingSupport}),
     *  this mask defines which IER bits are restored to their previous
     *  setting upon return from the user's ISR function.
     *
     *  restoreIerMask bits set to 1 correspond to IER bits that will be restored.
     *
     *  The value of this mask is normally auto-calculated based on the
     *  value of the maskSetting. However, manual setting of this
     *  mask is enabled by setting the maskSetting to
     *  {@link #MaskingOption MaskingOption_BITMASK}.
     *
     *  The default value is derived from the
     *  {@link #MaskingOption MaskingOption_SELF}
     *  maskSetting.
     */
    config Bits16 restoreIerMask = 0;

    /*!
     *  Interrupt priority is not supported on this target.
     */
    override config Int priority = 0;

    /*!
     *  The interrupt vector where the interrupt is enabled.
     *
     *  Each interrupt can only be enabled on a single interrupt vector.
     *  If this is not specified when creating the Hwi, the defaults are:
     *  For interrupts 0-31 is 4.
     *  For interrupts 32-63 is 8.
     *  For interrupts 64-95 is 12.
     *  For interrupts 96-127 is 14.
     */
    config Int vectorNum = -1;

    /*!
     *  ======== reconfig ========
     *  Reconfigures a dispatched interrupt.
     *
     *  This function reconfigures the dispatched interrupt so the
     *  specified function is called with the specified parameters.
     *
     *  @param(fxn)     pointer to ISR function
     *  @param(params)  pointer to Hwi parameter structure
     */
    Void reconfig(FuncPtr fxn, const Params *params);

internal:   /* not for client use */

    config Bits32 initialIerMask = 0;

    /* Interrupt Controller registers */
    struct IntcRegs {
        volatile Bits32 rawStatus;   /* IRQ raw status */
        volatile Bits32 status;      /* IRQ status     */
        volatile Bits32 set;         /* IRQ set        */
        volatile Bits32 clr;         /* IRQ clear      */
    };

    /* Interrupt Controller base addresses */
    config IntcRegs* INTCREGSBASEADDRS[4];

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

    /*!
     *  const array to hold all HookSet objects.
     */
    config HookSet hooks[length] = [];

    /*
     *  ======== getIsrStackAddress ========
     *  Returns initial isrStack address.
     *  This API was developed solely for the Exception module
     *  to allow removal of the Hwi_link.xdt template definition
     *  of ti_sysbios_family_c64p_Hwi_isrStack which was not
     *  ROM-able
     */
    Char *getIsrStackAddress();

    /* Interrupt Dispatcher */
    Void dispatchC(Int vectorNum);

    /* Interrupt dispatcher core */
    Void dispatchCore(Int vectorNum);

    /* assembly language code that switches SP and calls dispatchCore */
    Void switchAndDispatch(Int vectNum);

    /* unPlugged interrupt handler */
    Void unPluggedInterrupt();
    Void nmiInterrupt();
    Void swiInterrupt();
    Void undefInterrupt();

    /* stubs which call the dispatcher and pass intnum */
    Void dispIsr4();
    Void dispIsr5();
    Void dispIsr6();
    Void dispIsr7();
    Void dispIsr8();
    Void dispIsr9();
    Void dispIsr10();
    Void dispIsr11();
    Void dispIsr12();
    Void dispIsr13();
    Void dispIsr14();
    Void dispIsr15();

    /*
     *  ========= postInit ========
     */
    Int postInit(Object *hwi, Error.Block *eb);

    /*! Meta World Only Hwi Configuration Object. */
    metaonly struct VectorObj {
        String name;            /* symbol used for vector table entry */
        Bool used;              /* Interrupt already defined? */
        Bool useDispatcher;     /* Should dispatcher handle this Int? */
        FuncPtr fxn;            /* Dispatched ISR function */
        PlugFuncPtr pfxn;       /* "Hwi_plug'd" ISR function. */
    };

    /*!
     *  non-dispatched interrupt object.
     *  provided so that XGCONF users can easily plug non-dispatched interrupts
     */
    metaonly struct NonDispatchedInterrupt {
        Int             vectorNum;
        PlugFuncPtr     fxn;        /*! "Hwi_plug'd" ISR function. */
        Bool            enableInt;
    };

    /*!
     *  non-dispatched interrupt array.
     *  provided so that XGCONF users can easily plug non-dispatched interrupts
     */
    metaonly config NonDispatchedInterrupt nonDispatchedInterrupts[string];

    /*!
     * Meta-only array of interrupt objects.
     * This meta-only array of Hwi config objects is initialized
     * in Hwi.xs:module$meta$init().
     */
    metaonly config VectorObj vectors[];

    /*! Meta World Only Hwi Configuration Object. */
    metaonly struct InterruptObj {
        Bool used;              /* Interrupt already defined? */
        Bool useDispatcher;     /* Should dispatcher handle this Int? */
        FuncPtr fxn;            /* Dispatched ISR function */
    };

    /*!
     * Meta-only array of interrupt objects.
     * This meta-only array of Hwi config objects is initialized
     * in Hwi.xs:module$meta$init().
     */
    metaonly config InterruptObj interrupt[];

    struct Instance_State {
        Bits16  disableIerMask; // Interrupts to mask during ISR.
        Bits16  restoreIerMask; // Interrupts to restore after ISR.
        Int16   vectorNum;      // Interrupt vector
        Int16   index;          // ARP32 Interrupt controller index
        UInt    intNum;         // Interrupt number
        UArg    arg;            // Argument to Hwi function.
        FuncPtr fxn;            // Hwi function.
        Irp     irp;            // current IRP
        Ptr     hookEnv[];
    };

    struct Module_State {
        Bits32  interruptMask[]; // Initial interrupt mask
        Bits16  disableIerMask[];// Interrupts to mask during ISR.
        Bits16  restoreIerMask[];// Interrupts to restore after ISR.
        volatile Int vectNum;    // Interrupt vector number
        Char    *taskSP;         // temporary storage of interrupted
                                 // Task's SP during ISR execution
        Char    *isrStack;       // Points to isrStack address
        Irp     irp[];           // current irp;
        Handle  dispatchTable[]; // dispatch table
    };
}
