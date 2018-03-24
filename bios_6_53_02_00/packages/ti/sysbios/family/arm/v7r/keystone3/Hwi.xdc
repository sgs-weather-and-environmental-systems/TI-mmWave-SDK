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
package ti.sysbios.family.arm.v7r.keystone3;

import xdc.runtime.Diags;
import xdc.runtime.Error;
import xdc.runtime.Log;
import xdc.rov.ViewInfo;

import ti.sysbios.interfaces.IHwi;

/*!
 *  ======== Hwi ========
 *  Hardware Interrupt Support Module.
 *
 *  //TODO Note: FIQ interrupt handler must save FIQ context before using FPU
 *
 *  This Hwi module provides PL192 Vectored Interrupt Controller (VIC)
 *  specific implementations of the APIs defined in
 *  {@link ti.sysbios.interfaces.IHwi IHwi}.
 *
 *  Additional ARM device-specific APIs are also provided.
 *
 *  @a(Minimal Latency Interrupts)
 *  For applications requiring extremely low interrupt latency, this Hwi module
 *  allows the user to create FIQ interrupts that have a light weight interrupt
 *  dispatcher. Though not a precisely correct classification, these interrupts
 *  are referred to as "Zero latency" interrupts.
 *
 *  "FIQ" aka "Zero latency" interrupts can be created by setting the Hwi_Param
 *  {@link #type} to Hwi_Type_FIQ. FIQ interrupts offer low interrupt latency
 *  as they do not have to pass through the regular SYS/BIOS interrupt
 *  dispatcher and are always enabled. When auto nesting is enabled and masking
 *  option ALL or LOWER is used, some or all of the VIC interrupts will
 *  be disabled while the interrupt is being serviced. However, none of the
 *  "Zero latency" interrupts are disabled (masked).
 *
 *  Unlike regular IRQ interrupts, FIQ interrupts do not run on the System stack
 *  but on their own FIQ stack. The stack pointer, size and section name for the
 *  FIQ stack can be set using the {@link #fiqStack}, {@link #fiqStackSize}
 *  and {@link #fiqStackSection} module wide configuration params.
 *
 *  @a(Constraints of using FIQ aka Zero latency interrupts)
 *  FIQ Interrupts bypass the regular SYS/BIOS interrupt dispatcher and are
 *  therefore not allowed to call ANY SYS/BIOS APIs that affect thread
 *  scheduling. Examples of API that should not be invoked are:
 *
 *  @p(dlist)
 *    - Swi_post(),
 *    - Semaphore_post(),
 *    - Event_post(),
 *    - Task_yield()
 *  @p
 *
 *  Here's an example showing how to create a Hwi of FIQ type:
 *
 *  @p(code)
 *  *.cfg:
 *  var Hwi = xdc.useModule('ti.sysbios.family.arm.pl192.Hwi');
 *  Hwi.fiqStackSize = 2048;
 *  Hwi.fiqStackSection = ".myFiqStack"
 *  Program.sectMap[".myFiqStack"] = "RAM";
 *
 *  *.c:
 *  #include <xdc/std.h>
 *  #include <xdc/runtime/System.h>
 *
 *  #include <ti/sysbios/BIOS.h>
 *  #include <ti/sysbios/family/arm/pl192/Hwi.h>
 *
 *  #include <xdc/cfg/global.h>
 *
 *  Void myIsrFIQ(UArg arg)
 *  {
 *      ...
 *  }
 *
 *  Void main(Void)
 *  {
 *      Hwi_Params hwiParams;
 *
 *      Hwi_Params_init(&hwiParams);
 *      hwiParams.type = Hwi_Type_FIQ;
 *      Hwi_create(INT_NUM_FIQ, myIsrFIQ, &hwiParams, NULL);
 *      ...
 *
 *      BIOS_start();
 *  }
 *  @p
 *
 *  @a(Interrupt Latency)
 *  This module supports daisy-chained Vectored Interrupt Controllers (VICs).
 *  In a daisy-chained configuration, the VIC closest to the core has the lowest
 *  interrupt latency. In other words, lower interrupt numbers have lower
 *  latency.
 *
 *  @a(Interrupt Priorities)
 *  FIQ interrupts have the highest priority i.e. any interrupt of FIQ type will
 *  have a higher priority than any other interrupt of IRQ type.
 *
 *  IRQ interrupts (or vectored interrupts in PL192 VIC terminology) can be
 *  assigned different priority levels, ranging from 0-15. Lower priority levels
 *  imply a higher effective interrupt priority. Priority level can be set by
 *  writing to the {@link #priority} Hwi param. By default, all interrupts are
 *  set to the lowest priority level.
 *
 *  If multiple interrupts that are at the same priority level and belong to
 *  the same VIC, occur at the time, the fixed hardware priority levels are
 *  used to determine the order in which the interrupts are serviced. In this
 *  case, lower interrupts have a higher priority i.e. interrupt 0 will have
 *  a higher priority than interrupt 31.
 *
 *  @a(Interrupt Masking Options)
 *  In this Hwi module, the {@link #maskSetting} instance configuration
 *  parameter is ignored.
 *  Effectively, only the {@link #MaskingOption_LOWER} is supported.
 *
 *  @a(More Hwi examples)
 *  Here's an example showing how to construct a Hwi at runtime:
 *  @p(code)
 *  *.c:
 *  #include <ti/sysbios/family/arm/pl192/Hwi.h>
 *
 *  Hwi_Struct hwiStruct;
 *
 *  Void myIsrIRQ(UArg arg)
 *  {
 *      ...
 *  }
 *
 *  Void main(Void)
 *  {
 *      Hwi_Params hwiParams;
 *
 *      Hwi_Params_init(&hwiParams);
 *      Hwi_construct(&hwiStruct, INT_NUM_IRQ, myIsrIRQ, &hwiParams, NULL);
 *      ...
 *      BIOS_start();
 *  }
 *  @p
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
 *    <tr><td> {@link #disableIRQ}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enable}           </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableInterrupt}  </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableIRQ}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getHandle}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #Params_init}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restore}          </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restoreInterrupt} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #restoreIRQ}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
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
@InstanceInitStatic     /* allow constructs in static only systems */
@CustomHeader

module Hwi inherits ti.sysbios.interfaces.IHwi
{

    // -------- Module Constants --------

    config UInt DEFAULT_INT_PRIORITY = 0xF;

    config UInt NUM_INTERRUPTS;

    // -------- Module Types --------

    /*! Hwi vector function type definition. */
    typedef Void (*VectorFuncPtr)(void);

    /*! @_nodoc Hwi plug function type definition. */
    typedef Void (*PlugFuncPtr)(void);

    /*! Interrupt type. IRQ or FIQ */
    enum Type {
        Type_IRQ,                /*! IRQ interrupt. */
        Type_FIQ                 /*! FIQ interrupt. */
    };

    /*! Interrupt trigger type. Pulse or Level triggered */
    enum TriggerType {
        TriggerType_LEVEL,
        TriggerType_PULSE
    };

    /*! @_nodoc */
    metaonly struct BasicView {
        Ptr         halHwiHandle;
        String      label;
        String      type;
        String      triggerType;
        Int         intNum;
        String      fxn;
        UArg        arg;
        Ptr         irp;
        String      status;
    };

    /*! @_nodoc */
    metaonly struct ModuleView {
        String      options[4];
        SizeT       hwiStackPeak;
        SizeT       hwiStackSize;
        Ptr         hwiStackBase;
    };

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Basic', {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitBasic', structName: 'BasicView'}],
                ['ChannelMap', {type: ViewInfo.MODULE_DATA, viewInitFxn: 'viewChannelMap', structName: 'ChannelMapView'}],
                ['Module', {type: ViewInfo.MODULE, viewInitFxn: 'viewInitModule', structName: 'ModuleView'}]
            ]
        });

    // -------- Module Parameters --------

    /*!
     *  ======== core0VectorTableAddress ========
     *  Determines the location of Core0's Interrupt Vector Table on a
     *  Dual-Core device. Default is device dependent.
     *
     *  On Dual-Core devices, both Cortex-R5 cores share a common reset
     *  vector table. In order to allow the 2 cores to register their own
     *  exception handlers, each core generates its own clone of the reset
     *  vector table and initializes it with its own exception handler
     *  addresses. The core specific vector tables are placed at fixed
     *  addresses so that the exception handler functions called by the
     *  common reset vector table known each core's vector table address
     *  and are able to reference it once they detect which core the
     *  application is currently running on.
     *
     *  The address of Core0's vector table is determined by this parameter.
     *
     *  Here are the default Core0 vector table addresses for all supported
     *  Dual-Core devices:
     *  @p(code)
     *   ----------------------------------------------------
     *  | Device name | Core0's default vector table address |
     *   ----------------------------------------------------
     *  | RM57D8xx    | 0x100                                |
     *   ----------------------------------------------------
     *  @p
     *
     *  @a(Note)
     *  If changing Core0's vector table address, it is not necessary to
     *  rebuild Core1's application as it does not need to know the location
     *  of Core0's vector table.
     */
    metaonly config Ptr core0VectorTableAddress;

    /*!
     *  ======== core1VectorTableAddress ========
     *  Determines the location of Core1's Interrupt Vector Table on a
     *  Dual-Core device. Default is device dependent.
     *
     *  On Dual-Core devices, both Cortex-R5 cores share a common reset
     *  vector table. In order to allow the 2 cores to register their own
     *  exception handlers, each core generates its own clone of the reset
     *  vector table and initializes it with its own exception handler
     *  addresses. The core specific vector tables are placed at fixed
     *  addresses so that the exception handler functions called by the
     *  common reset vector table known each core's vector table address
     *  and are able to reference it once they detect which core the
     *  application is currently running on.
     *
     *  Core0's vector table is always placed at 0x100 while the address of
     *  Core1's vector table is determined by this parameter.
     *
     *  Here are the default Core1 vector table addresses for all supported
     *  Dual-Core devices:
     *  @p(code)
     *   ----------------------------------------------------
     *  | Device name | Core1's default vector table address |
     *   ----------------------------------------------------
     *  | RM57D8xx    | 0x200000                             |
     *   ----------------------------------------------------
     *  @p
     *
     *  @a(Note)
     *  If changing Core1's vector table address, it is important to rebuild
     *  Core0's application with the same change as Core0 owns the common
     *  reset vector table and the common exception handler functions need
     *  to know Core1's vector table address so they can determine the
     *  address of the handler function they need to jump to.
     */
    metaonly config Ptr core1VectorTableAddress;

    /*!
     *  ======== resetVectorHandlerAddress ========
     *  Determines the location of the common reset vector handlers on a
     *  Dual-Core device. Default is device dependent.
     *
     *  On Dual-Core devices, both Cortex-R5 cores share a common reset
     *  vector table which points to a set of common vector handler
     *  functions. These vector handler functions are placed at a fixed
     *  address determined by this parameter.
     *
     *  @p(code)
     *   ----------------------------------------------------
     *  | Device name | Default reset vector handler address |
     *   ----------------------------------------------------
     *  | KEYSTONE3   | 0x00550000                           |
     *   ----------------------------------------------------
     *  @p
     */
    config Ptr resetVectorHandlerAddress;

    /*! Reset Handler. Default is c_int00 */
    metaonly config VectorFuncPtr resetFunc;

    /*!
     *  Undefined instruction exception handler.
     *  Default is set to an internal exception handler.
     */
    metaonly config VectorFuncPtr undefinedInstFunc;

    /*! SWI Handler. Default is internal SWI handler */
    metaonly config VectorFuncPtr swiFunc;

    /*!
     *  Prefetch abort exception handler.
     *  Default is set to an internal exception handler.
     */
    metaonly config VectorFuncPtr prefetchAbortFunc;

    /*!
     *  Data abort exception handler.
     *  Default is set to an internal exception handler.
     */
    metaonly config VectorFuncPtr dataAbortFunc;

    /*!
     *  Reserved exception handler.
     *  Default is set to an internal exception handler.
     */
    metaonly config VectorFuncPtr reservedFunc;

    /*!
     *  @_nodoc
     *  IRQ interrupt handler.
     *  Default is set to an internal exception dispatcher.
     */
    metaonly config VectorFuncPtr irqFunc;

    /*!
     *  FIQ interrupt handler.
     *  Default is set to an internal FIQ dispatcher.
     */
    metaonly config VectorFuncPtr fiqFunc;

    /*!
     *  FIQ stack pointer. Default = null.
     *  (Indicates that stack is to be created using
     *  staticPlace())
     */
    config Ptr fiqStack = null;

    /*!
     *  FIQ stack size in MAUs.
     *  Default is 1024 bytes.
     */
    metaonly config SizeT fiqStackSize = 1024;

    /*!
     *  Memory section used for FIQ stack
     *  Default is null.
     */
    metaonly config String fiqStackSection = null;

    /*!
     *  Non dispatched IRQ stack pointer. Default = null.
     *  (Indicates that stack is to be created using
     *  staticPlace())
     */
    config Ptr irqStack = null;

    /*!
     *  Non dispatched IRQ stack size in MAUs.
     *  Default is 1024 bytes.
     */
    metaonly config SizeT irqStackSize = 1024;

    /*!
     *  Memory section used for non dispatched IRQ stack
     *  Default is null.
     */
    metaonly config String irqStackSection = null;

    /*!
     * @_nodoc
     * VIM base address
     */
    metaonly config Ptr vimBaseAddress;

    /*!
     *  ======== A_badChannelId ========
     *  Assert raised when an invalid channelId is passed to Hwi_mapChannel()
     *  function.
     */
    config xdc.runtime.Assert.Id A_badChannelId  = {
        msg: "A_badChannelId: ChannelId is either not re-mappable or invalid."
    };

    /*!
     *  Error raised when Hwi is already defined
     */
    config Error.Id E_alreadyDefined = {
        msg: "E_alreadyDefined: Hwi already defined: intr# %d"
    };

    /*!
     *  Error raised if an attempt is made to create a Hwi
     *  with an interrupt number greater than Hwi_NUM_INTERRUPTS - 1.
     */
    config Error.Id E_badIntNum = {
        msg: "E_badIntNum, intnum: %d is out of range"
    };

    /*!
     *  Error raised when an undefined interrupt has fired.
     */
    config Error.Id E_undefined = {
        msg: "E_undefined: Hwi undefined, intNum: %d"
    };

    /*!
     *  Error raised when an unsupported Hwi.MaskingOption used.
     */
    config Error.Id E_unsupportedMaskingOption = {
        msg: "E_unsupportedMaskingOption: Unsupported masking option passed."
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
     *  @_nodoc
     *  ======== inUseMeta ========
     *  Check for Hwi already in use.
     *  For internal SYS/BIOS use only.
     *  Should be called prior to any internal Hwi.create().
     *
     *  @param(intNum)  interrupt number
     */
    metaonly Bool inUseMeta(UInt intNum);

    /*!
     *  ======== getHandle ========
     *  Returns pointer to Hwi instance object.
     *
     *  @param(intNum)  interrupt number
     */
    Object *getHandle(UInt intNum);

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

    /*!
     *  @_nodoc
     *  ======== setType ========
     *  Set an interrupt's type (FIQ/IRQ).
     *
     *  Not an instance function so that it can be used
     *  with non-dispatched interrupts.
     *
     *  @param(intNum)      ID of interrupt
     *  @param(type)        type = FIQ/IRQ
     */
    Void setType(UInt intNum, Type type);

    /*!
     *  @_nodoc
     *  ======== setTriggerType ========
     *  Set an interrupt's trigger type (Pulse/Level).
     *
     *  @param(intNum)      ID of interrupt
     *  @param(triggerType) triggerType = Pulse/Level
     */
    Void setTriggerType(UInt intNum, TriggerType triggerType);

instance:

    /*!
     *  Interrupt priority.
     *
     *  The Vectored Interrupt Controllers (VIC) on Keystone3 are
     *  connected in a daisy-chain configuration (i.e. VIC1's output
     *  line is connected to VIC0's input line and so on) with each VIC
     *  having its own priority hardware.
     *
     *  On each VIC, FIQ interrupts have the highest priority, followed by
     *  the IRQ interrupts and the daisy-chained interrupt.
     *  The daisy-chained interrupt has the lowest priority.
     *
     *  There are a total of 16 different priority levels and therefore
     *  the priority field can take a value from 0-15.
     *
     *  Each vectored interrupt source can
     *  The default value of -1 is used as a flag to indicate
     *  the lowest (logical) device-specific priority value.
     *
     *  Not all targets/devices support this instance parameter.
     *  On those that don't, this parameter is ignored.
     */
    override config Int priority = -1;

    /*! Interrupt type (IRQ/FIQ). Default is IRQ. */
    config Type type = Type_IRQ;

    /*! Interrupt trigger type (Pulse/Level). Default is Level triggered. */
    config TriggerType triggerType = TriggerType_LEVEL;

    /*!
     *  Default setting for this Hwi module is IHwi.MaskingOption_LOWER
     */
    override config IHwi.MaskingOption maskSetting = IHwi.MaskingOption_LOWER;

    /*!
     *  ======== reconfig ========
     *  Reconfigure a dispatched interrupt.
     */
    Void reconfig(FuncPtr fxn, const Params *params);

internal:   /* not for client use */

    struct InterruptGroup {
        UInt32 RAWSTATUSSET;              /*! Interrupt Raw Status/Set */
        UInt32 ENABLEDSTATUSCLEAR;        /*! Interrupt Enabled Status/Clear */
        UInt32 ENABLEDSET;                /*! Interrupt Enabled Set */
        UInt32 ENABLEDCLEAR;              /*! Interrupt Enabled Clear */
        UInt32 IRQENABLEDSTATUSCLEAR;     /*! IRQ Enabled Status/Clear */
        UInt32 FIQENABLEDSTATUSCLEAR;     /*! FIQ Enabled Status/Clear */
        UInt32 INTERRUPTMAP;              /*! Interrupt Map - IRQ or FIQ */
        UInt32 TYPEMAP;                   /*! Type Map - Level or Pulse */
    };

    /*
     *  Vectored Interrupt Manager (VIM) Registers
     */
    struct VIM {
        UInt32 REVISION;          /*! 0x0000 Revision Register */
        UInt32 INFO;              /*! 0x0004 Info Register */
        UInt32 PRIOIRQ;           /*! 0x0008 Prioritized IRQ */
        UInt32 PRIOFIQ;           /*! 0x000C Prioritized FIQ */
        UInt32 IRQGROUPSTATUS;    /*! 0x0010 IRQ Group Status */
        UInt32 FIQGROUPSTATUS;    /*! 0x0014 FIQ Group Status */
        UInt32 IRQVECADDRESS;     /*! 0x0018 IRQ Vector Address */
        UInt32 FIQVECADDRESS;     /*! 0x001C FIQ Vector Address */
        UInt32 ACTIVEIRQ;         /*! 0x0020 Active IRQ */
        UInt32 ACTIVEFIQ;         /*! 0x0024 Active FIQ */
        UInt32 hole0[2];          /*! 0x0028-0x002F Reserved */
        UInt32 DECVECADDRESS;     /*! 0x0030 DED Vector Address */
        UInt32 hole1[243];        /*! 0x0034-0x03FF Reserved */
        InterruptGroup GROUP[32]; /*! 0x0400-0x07FF Interrupt Group M Regs */
        UInt32 hole2[512];        /*! 0x0800-0x0FFF Reserved */
        UInt32 PRIORITY[1024];    /*! 0x1000-0x1FFF Interrupt N Priority Reg */
        UInt32 VECTOR[1024];      /*! 0x2000-0x2FFF Vector Register */
    };

    metaonly config Bool lockstepDevice;

    /*
     *  ======== vim ========
     *  Symbol "Hwi_vim" is a physical device
     */
    extern volatile VIM vim;

    /*
     *  ======== intEnable ========
     *  Initial interrupt enable register value
     */
    config UInt32 intEnable[];

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

    /* FIQ Interrupt Dispatcher */
    Void dispatchFIQC();

    /* IRQ Interrupt Dispatcher */
    Void dispatchIRQC(Irp irp);

    /* non plugged interrupt handler */
    Void nonPluggedHwiHandler();

    /*
     *  ======== plug ========
     *  Plug an interrupt vector with an ISR address.
     *
     *  @param(intNum)  interrupt number
     *  @param(fxn)     pointer to ISR function
     */
    Void plug(UInt intNum, PlugFuncPtr fxn);

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

    struct Instance_State {
        Type        type;                   // Interrupt Type
        UArg        arg;                    // Argument to Hwi function.
        FuncPtr     fxn;                    // Hwi function.
        Int         intNum;                 // Interrupt number
        Irp         irp;                    // current IRP
        Ptr         hookEnv[];
        Int         priority;               // Interript priority
        TriggerType triggerType;            // Trigger Type
    };

    struct Module_State {
        Char        *taskSP;                /* temporary storage of interrupted
                                               Task's SP during ISR execution */
        Char        *isrStack;              /* Points to isrStack address */
        Ptr         isrStackBase;           /* _stack */
        Ptr         isrStackSize;           /* _STACK_SIZE */
        Char        fiqStack[];             /* buffer used for FIQ stack */
        SizeT       fiqStackSize;
        Char        irqStack[];             /* buffer used for non dispatched
                                               IRQ stack */
        SizeT       irqStackSize;
        Handle      dispatchTable[];        /* dispatch table */
        UInt        spuriousInts;           /* Count of spurious interrupts */
    };
}
