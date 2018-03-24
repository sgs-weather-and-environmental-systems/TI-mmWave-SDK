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
package ti.sysbios.family.msp430;

import xdc.rov.ViewInfo;
import xdc.runtime.Diags;
import xdc.runtime.Log;
import xdc.runtime.Assert;
import xdc.runtime.Error;

import ti.sysbios.interfaces.IHwi;

/*!
 *  ======== Hwi ========
 *  MSP430 Hardware Interrupt Manager
 *
 *  This module implements the generic Hwi module functions 
 *  Hwi_enable, Hwi_disable, and Hwi_restore as defined by
 *  {@link ti.sysbios.interfaces.IHwi IHwi}.
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
 *    <tr><td> {@link #disableInterrupt} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enable}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableInterrupt}  </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #Params_init}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restore}          </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restoreInterrupt} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #construct}        </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #delete}           </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #destruct}         </td><td>   N    </td><td>   N    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getHookContext}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
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
@ModuleStartup          /* generate a call to startup function */

module Hwi inherits ti.sysbios.interfaces.IHwi 
{
    /*! 
     *  The MSP430 supports up to 64 interrupts/exceptions.
     *
     *  The actual number supported is device specific and provided by
     *  the catalog device specification.
     */
    readonly config Int NUM_INTERRUPTS;

    // -------- Module Types --------

    /*! Hwi vector function type definition. */
    typedef Void (*VectorFuncPtr)(void);

     /*! @_nodoc */
    metaonly struct BasicView {
        Ptr         halHwiHandle;
        String      label;
        Int         intNum;
        String      fxn; 
        UArg        arg; 
        Ptr         irp; 
    };
    
    /*! @_nodoc */
    metaonly struct ModuleView {
        String      options[4];
        String      hwiStackPeak;
        SizeT       hwiStackSize;
        Ptr         hwiStackBase;
    };

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo = 
        ViewInfo.create({
            viewMap: [
                ['Basic',    {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitBasic',    structName: 'BasicView'}],
                ['Module',   {type: ViewInfo.MODULE,   viewInitFxn: 'viewInitModule',   structName: 'ModuleView'}]
            ]
        });
    
    // -------- Module Parameters --------

    // Logs

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

    // Asserts

    /*! Assert when bad maskSetting parameter provided */
    config Assert.Id A_unsupportedMaskingOption = {
        msg: "A_unsupportedMaskingOption: unsupported maskSetting."
    };

    // Errors

    /*!
     *  Error raised when Hwi is already defined
     */
    config Error.Id E_alreadyDefined = {
        msg: "E_alreadyDefined: Hwi already defined: intr# %d"
    };

    /*!
     *  Error raised when an unimplemented Hwi function is called
     *
     *  The MSP430 does not implement all of the functions defined
     *  by {@link ti.sysbios.interfaces.IHwi}.  If applications
     *  call such a function, an E_notImplemented error is raised
     *  with the name of the unimplemented function passed as an
     *  argument.  See {@link xdc.runtime.Error#raise}.
     */
    config Error.Id E_notImplemented = {
        msg: "E_notImplemented: Function not implemented: %s"
    };

    // configs

    /*!
     *  ======== fillVectors ========
     *  Plug all unused interrupt vectors
     *
     *  This parameter allows one to plug all unused interrupt vectors
     *  with a spin loop, to catch unexpected interrupts and "run away" code.
     */
    metaonly config Bool fillVectors = true;

    /*!
     *  ======== resetFunc ========
     *  Reset handler
     *
     *  This parameter specifies the interrupt service routine triggered on
     *  reset. The default is c_int00.
     */
    metaonly config VectorFuncPtr resetFunc;

    /*!
     *  ======== alwaysWake ========
     *  Always keep the CPU awake upon return from interrupt?
     *
     *  This parameter serves as a global 'switch' to control whether the
     *  CPU is kept awake (i.e., not allowed to return to a low power mode) at
     *  the end of servicing a hardware interrupt (Hwi) managed by SYS/BIOS.  
     *  The behavior of each interrupt instance can be controlled individually
     *  (see {@link #keepAwakeEnabled}); when set to true, this parameter serves
     *  as an override of the individual instance selection, to force keep awake 
     *  of the CPU. This parameter is provided to assist with debug, and to 
     *  ease use and transition of legacy code to work with SYS/BIOS.
     */
    metaonly config Bool alwaysWake = false;

    /*!
     *  ======== alwaysLog ========
     *  Always emit Log messages from interrupt stubs?
     *
     *  This parameter serves as a global 'switch' to control whether Log
     *  begin and end messages will be emitted from interrupt stubs.
     *  Note that the behavior of each interrupt instance can be controlled
     *  individually (see {@link #loggingEnabled}); when set to true, alwaysLog
     *  serves as an override of the individual instance selections, forcing 
     *  logging from the stubs of all configured interrupts.
     */
    metaonly config Bool alwaysLog = false;

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
     *  Check for Hwi already in use
     *
     *  For internal SYS/BIOS use only. 
     *  Should be called prior to any internal Hwi.create().
     *
     *  @param(intNum)  interrupt number
     */
    metaonly Bool inUseMeta(UInt intNum);

    /*!
     *  ======== plugMeta ========
     *  Statically plug an interrupt vector with an ISR address
     *
     *  @param(intNum)  interrupt number
     *  @param(fxn)     pointer to ISR function
     */
    metaonly Void plugMeta(UInt intNum, Fxn fxn);

    /*!
     *  @_nodoc
     *  ======= logBegin ========
     *  Log the LM_begin from within Hwi module scope
     */
    Void logBegin(Log.Event evt, IArg a1, IArg a2, IArg a3, IArg a4, IArg a5);

    /*!
     *  @_nodoc
     *  ======= logEnd ========
     *  Log the LD_end from within Hwi module scope
     */
    Void logEnd(Log.Event evt, IArg a1);

instance:

    /*! override maskSetting - Hwi does not manage nesting on 430 */
    override config IHwi.MaskingOption maskSetting = IHwi.MaskingOption_ALL;

    /*! 
     *  Does this interrupt support posting of Swis? Default is true.
     *
     *  If "true", the interrupt stub will disable the Swi scheduler upon stub
     *  entry, and restore it upon interrupt completion. 
     *
     *  If no Swi-scheduling APIs (for example, Swi_post()) are called from 
     *  within this interrupt's ISR function, then swiEnabled can be set to 
     *  "false".
     */
    metaonly config Bool swiEnabled = true;

    /*! 
     *  Does this interrupt support task pre-emption? Default is true.
     *
     *  If "true", the interrupt stub will disable the Task scheduler upon 
     *  stub entry, and restore it upon interrupt completion. 
     *
     *  If no Task-scheduling APIs (e.g., Semaphore_post()) are called from 
     *  within this interrupt's ISR function, then taskEnabled can be set to 
     *  "false".
     */
    metaonly config Bool taskEnabled = true;

    /*! 
     *  Switch to ISR stack for this interrupt? Default is true.
     *
     *  If "true", the SYS/BIOS interrupt/system stack will be used when 
     *  running this interrupt's ISR function (instead of the interrupted 
     *  Task's dedicated stack).  If "false", no switching to the 
     *  interrupt/system stack will occur for this interrupt. 
     *
     *  Note that this parameter is only relevant for the Task module; if 
     *  the Task module is not enabled in the application only a single stack
     *  is used (i.e., the "system/interrupt stack").
     */
    metaonly config Bool isrStackEnabled = true;

    /*! 
     *  Does this interrupt allow nesting by other interrupts? Default is 
     *  false.
     *
     *  Set to "true" if the configured ISR function will enable global 
     *  interrupts temporarily within the function, to allow other interrupts
     *  to nest on top of this interrupt.  If the ISR does not enable other
     *  interrupts, then leave as the default of "false".
     *
     */
    metaonly config Bool nestingEnabled = false;

    /*! 
     *  Does this interrupt support logging?
     *
     *  If set to true, {@link xdc.runtime.Log Log} statements are inserted
     *  into the generated interrupt stub that calls the user's interrupt
     *  function.  The stub posts an {@link #LM_begin} event at the beginning
     *  of the interrupt service routine and a {@link #LD_end} event after
     *  the user's function returns.
     *
     *  In addition to enabling this flag, you must also enable USER1 and/or
     *  USER2 logging for this module.  Otherwise, the events posted by the
     *  inserted Log statments will be ignored.
     */
    metaonly config Bool loggingEnabled = false;

    /*! 
     *  Does this interrupt support thread-type tracking? Default is true. 
     *
     *  If "true", this stub will enable full tracking of the execution 
     *  context.  For example, if the ISR function (or one of the functions
     *  it calls) were to call BIOS_getThreadType(), the returned value would be
     *  BIOS_ThreadType_Hwi.  
     *
     *  Setting this parameter to "false" will slightly reduce the interrupt 
     *  stub overhead, but may result in an incorrect thread type being 
     *  reported during the processing of the interrupt.
     */
    metaonly config Bool threadTypeEnabled = true;

    /*! 
     *  Should keep CPU awake following this interrupt? Default is false. 
     * 
     *  If "true", this interrupt stub will modify the status register (SR)
     *  value that was pushed onto the stack (automatically, at the start of
     *  servicing the interrupt), so that when it is restored by the RETI 
     *  instruction, the CPU will stay in the Active mode. 
     *
     *  If left as "false", the unmodified SR value will be restored by the
     *  RETI instruction, and the CPU may return to a previous low power mode
     *  (LPM) that was in effect when the interrupt was triggered. 
     */
    metaonly config Bool keepAwakeEnabled = false;

internal:   /* not for client use */

    /*
     *  ======== postInit ========
     *  finish initializing static and dynamic Hwis
     */
    Int postInit(Object *hwi, Error.Block *eb);

    /*!
     *  ======== init ========
     *  Setup Hwi stack
     */
    Void init();

    /*!
     *  const array to hold all HookSet objects.
     */
    config HookSet hooks[length] = [];

    /*! Meta World Only Hwi Configuration Object. */
    metaonly struct InterruptObj {
        String name;            /* symbol used for vector table entry */
        Bool used;              /* Interrupt already defined? */
        Bool generateStub;      /* handler is generated? */
        Bool swiEnabled;
        Bool taskEnabled;
        Bool nestingEnabled;
        Bool isrStackEnabled;
        Bool lmBeginEnabled;
        Bool ldEndEnabled;
        Bool threadTypeEnabled;
        Bool keepAwakeEnabled;
        String handle;
        FuncPtr fxn;            /* "wrapped" ISR function */
        Fxn pfxn;               /* non "wrapped" ISR function */
        UArg arg;               /* Argument to fxn */
    };

    /*!
     * Meta-only array of interrupt objects.
     *
     * This meta-only array of Hwi config objects is initialized
     * in Hwi.xs:module$meta$init().
     */
    metaonly config InterruptObj interrupt[];

    struct Instance_State {
        Int             intNum;         // Interrupt number
        Irp             irp;            // current IRP
        Ptr             hookEnv[];
    };
 
    struct Module_State {
        Char        *taskSP;        // Temporary storage of interrupted
                                    // Task's SP during ISR execution
        /* ROM */
        Char        *isrStack;      // Points to isrStack address
    };
}
