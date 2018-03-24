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

package ti.sysbios.family.c64p;

import xdc.rov.ViewInfo;

import xdc.runtime.Diags;
import xdc.runtime.Error;
import xdc.runtime.Log;

/*!
 *  ======== Hwi ========
 *  C64+ Hardware Interrupt Support Module.
 *
 *  This Hwi module provides C64+ family-specific implementations of the
 *  APIs defined in {@link ti.sysbios.interfaces.IHwi IHwi}.
 *
 *  Additional C64+ device-specific APIs are also provided.
 *
 *  An example of creating a Hwi instance:
 *
 *  @p(code)
 *
 *  Int intNum;
 *  Hwi_Params params;
 *  Error_Block eb;
 *
 *  // Initialize the error block
 *  Error_init(&eb);
 *
 *  // Initialize the Hwi parameters
 *  Hwi_Params_init(&params);
 *
 *  // Set the GEM event id in the params
 *  params.eventId = 78
 *
 *  // Specify the interrupt vector number
 *  intNum = 8;
 *
 *  // create the Hwi for the specified interrupt number and params
 *  Hwi_create(intNum, myIsr, &params, &eb);
 *
 *  @p
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
 *    <tr><td> {@link #eventMap}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getEventId}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
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
 */

@Template("./Hwi.xdt")  /* generates the vector table and the dispatcher */
@ModuleStartup          /* generate a call to Hwi_init at startup */
@InstanceInitStatic	/* allow constructs in static only systems */

module Hwi inherits ti.sysbios.interfaces.IHwi
{
    // -------- Module Constants --------

    /*! C64+ supports 16 interrupts. */
    const Int NUM_INTERRUPTS = 16;

    // -------- Module Types --------

    /*! @_nodoc Hwi plug function type definition. */
    typedef Void (*PlugFuncPtr)(void);

    /*!
     *  ======== BasicView ========
     *  @_nodoc
     */
    metaonly struct BasicView {
        Ptr     halHwiHandle;
        String  label;
        UInt    intNum;
        String  fxn;
        UArg    arg;           // Argument to Hwi function.
        Ptr     irp;
        UInt    eventId;
        String  disableMask;   // Interrupts to mask during ISR.
        String  restoreMask;   // Interrupts to restore after ISR.
    };

    /*!
     *  ======== ModuleView ========
     *  @_nodoc
     */
    metaonly struct ModuleView {
        String  options[4];
        String  hwiStackPeak;
        SizeT   hwiStackSize;
        Ptr     hwiStackBase;
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

    /*!
     *  non-dispatched interrupt object.
     *  provided so that XGCONF users can easily plug non-dispatched interrupts
     */
    metaonly struct NonDispatchedInterrupt {
        Int         intNum;
        PlugFuncPtr fxn;        /*! "Hwi_plug'd" ISR function. */
        Bool        enableInt;
        Int         eventId;
    };

    /*!
     *  non-dispatched interrupt array.
     *  provided so that XGCONF users can easily plug non-dispatched interrupts
     */
    metaonly config NonDispatchedInterrupt nonDispatchedInterrupts[string];

    /*!
     *  Alternate reset vector address. Default is undefined.
     *
     *  if initialized by the user then an additional reset vector
     *  is created and placed in the ".resetVector" section.
     *  To place the .resetVector section into a specific memory section,
     *  add the following command to your config script:
     *  @p(code)
     *  Program.sectMap[".resetVector"] = YourMemorySection;
     *  @p
     */
    metaonly config Ptr resetVectorAddress;

    /*!
     *  Error raised when Hwi is already defined
     */
    config Error.Id E_alreadyDefined = {
        msg: "E_alreadyDefined: Hwi already defined: intr# %d"
    };

    /*!
     *  Error raised when Hwi handle referenced in Hwi_delete()
     *  is not found in the Hwi dispatch table
     */
    config Error.Id E_handleNotFound = {
        msg: "E_handleNotFound: Hwi handle not found: 0x%x"
    };

    /*!
     *  Error raised when a secure context failed to be allocated
     */
    config Error.Id E_allocSCFailed = {
        msg: "E_allocSCFailed: Alloc secure context failed"
    };

    /*!
     *  Error raised when a secure context failed to be registered
     */
    config Error.Id E_registerSCFailed = {
        msg: "E_registerSCFailed: Register secure context failed"
    };

    /*!
     *  Error raised when an invalid interrupt number is passed in
     */
    config Error.Id E_invalidIntNum = {
        msg: "E_invalidIntNum: Invalid interrupt number: intr# %d"
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

    /*!
     *  enable Exception module for exception processing.
     */
    config Bool enableException = true;

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
     *  ======== eventMap ========
     *  Maps a GEM event to interrupt number
     *
     *  Function maps a GEM event to an interrupt number so that the
     *  event is the interrupt source of the vector.
     *
     *  @p(code)
     *      // Maps GEM event #65 as the interrupt source of int vector #7
     *      Hwi_eventMap(7, 65);
     *  @p
     *
     *  @param(intNum)  interrupt number
     *  @param(eventId) event ID
     */
    Void eventMap(Int intNum, Int eventId);

    /*!
     *  ======== eventMapMeta ========
     *  Maps GEM Event to interrupt number statically
     *
     *  Function maps a GEM event to an interrupt number so that the
     *  event is the interrupt source of the vector.
     *
     *  @p(code)
     *      // Maps GEM event #65 as the interrupt source of int vector #7
     *      Hwi.eventMapMeta(7, 65);
     *  @p
     *
     *  @param(intNum)      interrupt number
     *  @param(eventId)     event Id
     */
    metaonly Void eventMapMeta(Int intNum, Int eventId);

    /*!
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
     *  AN ISR PLUGGED WITH THIS API IS NOT SERVICED BY THE INTERRUPT
     *  DISPATCHER. CONSEQUENTLY, IT SHOULD NOT INVOKE ANY SYS/BIOS APIs
     *  (ie Semaphore_post())!!!
     *
     *  @a(constraints)
     *  o interrupt function MUST NOT INTERACT WITH SYS/BIOS.
     *    (ie do not call Semaphore_post())
     *
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
     *  ======== getEventId ========
     *  Returns event id associated with interrupt number
     *
     *  If a bad interrupt number is passed in, it will return -1.
     *
     *  @param(intNum)  interrupt number
     *  @b(returns)     event id associated with intNum
     */
    Int getEventId(UInt intNum);

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

instance:

    /*!
     *  Dispatcher auto-nesting interrupt disable mask.
     *
     *  When the dispatcher's auto interrupt nesting support feature
     *  is enabled (see {@link #dispatcherAutoNestingSupport}),
     *  this mask defines which IER bits are disabled prior to invoking
     *  the user's ISR function with GIE = 1.
     *
     *  disableMask bits set to 1 correspond to IER bits that will be cleared
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
    config Bits16 disableMask = 0;

    /*!
     *  Dispatcher auto-nesting interrupt restore mask.
     *
     *  When the dispatcher's auto interrupt nesting support feature
     *  is enabled (see {@link #dispatcherAutoNestingSupport}),
     *  this mask defines which IER bits are restored to their previous
     *  setting upon return from the user's ISR function.
     *
     *  restoreMask bits set to 1 correspond to IER bits that will be restored.
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
    config Bits16 restoreMask = 0;

    /*!
     *  Interrupt priority. Not supported on this target.
     */
    override config Int priority = 0;

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
     *  ======== getIsrStackAddress ========
     *  Returns initial isrStack address.
     *  This API was developed solely for the Exception module
     *  to allow removal of the Hwi_link.xdt template definition
     *  of ti_sysbios_family_c64p_Hwi_isrStack which was not
     *  ROM-able
     */
    Char *getIsrStackAddress();

    /* Interrupt Dispatcher */
    Void dispatchC(Int intNum);

    /* Interrupt dispatcher core */
    Void dispatchCore(Int intNum);

    /* unPlugged interrupt handler */
    Void unPluggedInterrupt();

    /* assembly language code that switches SP and calls dispatchCore */
    Void switchAndDispatch(Int intNum);

    /* setup a secure context */
    Void setupSC();

    /*
     *  ======== postInit ========
     */
    Int postInit(Object *hwi, Error.Block *eb);

    /*!
     *  const array to hold all HookSet objects.
     */
    config HookSet hooks[length] = [];

    /*! Meta World Only Hwi Configuration Object. */
    metaonly struct InterruptObj {
        String name;        /* symbol used for vector table entry */
        Bool used;          /* Interrupt already defined? */
        Bool useDispatcher; /* Should dispatcher handle this Int? */
        FuncPtr fxn;        /* Dispatched ISR function */
        PlugFuncPtr pfxn;   /* "Hwi_plug'd" ISR function. */
    };

    /*!
     * Meta-only array of interrupt objects.
     * This meta-only array of Hwi config objects is initialized
     * in Hwi.xs:module$meta$init().
     */
    metaonly config InterruptObj interrupt[NUM_INTERRUPTS];

    struct Instance_State {
        Bits16  disableMask;    // Interrupts to mask during ISR.
        Bits16  restoreMask;    // Interrupts to restore after ISR.
        UArg    arg;            // Argument to Hwi function.
        FuncPtr fxn;            // Hwi function.
        Irp     irp;            // current IRP
        Ptr     hookEnv[];
    };

    struct Module_State {
        Char        intEvents[16];  // Initial event mapping
        Bits16      ierMask;        // Initial IER mask
        volatile Int intNum;        // Interrupt number
        Char        *taskSP;        // temporary storage of interrupted
                                    // Task's SP during ISR execution
        /* ROM */
        Char        *isrStack;      // Points to isrStack address
        Ptr         vectorTableBase;// ti_sysbios_family_c64_Hwi0
        Ptr         bss;            // bss address
        Int         scw;            // secure context word

        Handle      dispatchTable[NUM_INTERRUPTS];  // dispatch table
    };
}
