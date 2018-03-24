/*
 * Copyright (c) 2015-2016, Texas Instruments Incorporated
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
package ti.sysbios.family.arm.v7r.vim;

import xdc.runtime.Diags;
import xdc.runtime.Error;
import xdc.runtime.Log;
import xdc.rov.ViewInfo;

import ti.sysbios.interfaces.IHwi;

/*!
 *  ======== Hwi ========
 *  Hardware Interrupt Support Module.
 *
 *  This Hwi module provides Hercules VIM specific implementations of the
 *  APIs defined in {@link ti.sysbios.interfaces.IHwi IHwi}.
 *
 *  Additional ARM device-specific APIs are also provided.
 *
 *  @a(Minimal Latency Interrupts)
 *  For applications requiring extremely low interrupt latency, this Hwi module
 *  allows the user to create FIQ interrupts that bypass the SYS/BIOS interrupt
 *  dispatcher. Though not a precisely correct classification, these interrupts
 *  are referred to as "Zero latency" interrupts.
 *
 *  "FIQ" aka "Zero latency" interrupts can be created by setting the Hwi_Param
 *  {@link #type} to Hwi_Type_FIQ. FIQ interrupts offer low interrupt latency
 *  as they do not have to pass through the regular SYS/BIOS interrupt
 *  dispatcher and are always enabled. When auto nesting is enabled and masking
 *  option ALL or LOWER is used, some or all of the VIM interrupt channels will
 *  be disabled while the interrupt is being serviced. However, none of the
 *  channels corresponding to "Zero latency" interrupts are disabled (masked).
 *
 *  The ISR handler function for a "Zero latency" interrupt must use the
 *  "interrupt" keyword in the function definition and should have no
 *  parameters. Using the "interrupt" keyword will ensure that the necessary
 *  registers are saved on entry into the interrupt routine and are restored
 *  upon exit from the interrupt routine.
 *
 *  Since the function pointer passed to Hwi_create()/Hwi_construct() has a
 *  different function signature (i.e. it accepts an argument), the
 *  "Zero latency" function must be type-casted to {@link #FuncPtr Hwi_FuncPtr}
 *  type before being passed to Hwi_create()/Hwi_construct() in order to avoid
 *  any compiler warnings.
 *
 *  Unlike regular IRQ interrupts, FIQ interrupts do not run on the System stack
 *  but on their own FIQ stack. The stack pointer, size and section name for the
 *  FIQ stack can be set using the {@link #fiqStack}, {@link #fiqStackSize}
 *  and {@link #fiqStackSection} module wide configuration params.
 *
 *  @a(Constraints of using "FIQ" aka "Zero latency" interrupts)
 *  Interrupts configured to bypass the dispatcher are not allowed
 *  to call ANY SYS/BIOS APIs that effect thread scheduling. Examples
 *  of API that should no be invoked are:
 *
 *  @p(dlist)
 *    - Swi_post(),
 *    - Semaphore_post(),
 *    - Event_post(),
 *    - Task_yield()
 *  @p
 *
 *  Here's an example showing how to create a Hwi of FIQ type:
 *  @p(code)
 *  *.cfg:
 *  var Hwi = xdc.useModule('ti.sysbios.family.arm.v7r.vim.Hwi');
 *  Hwi.fiqStackSize = 2048;
 *  Hwi.fiqStackSection = ".myFiqStack"
 *  Program.sectMap[".myFiqStack"] = "RAM";
 *
 *  *.c:
 *  #include <xdc/std.h>
 *  #include <xdc/runtime/System.h>
 *
 *  #include <ti/sysbios/BIOS.h>
 *  #include <ti/sysbios/family/arm/v7r/vim/Hwi.h>
 *
 *  #include <xdc/cfg/global.h>
 *
 *  Void interrupt myIsrFIQ()
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
 *      Hwi_create(INT_NUM_FIQ, (Hwi_FuncPtr)myIsrFIQ, &hwiParams, NULL);
 *      ...
 *
 *      BIOS_start();
 *  }
 *  @p
 *
 *  @a(Interrupt Channel configuration)
 *  Each VIM interrupt request (source) can be mapped to any of the interrupt
 *  channels (same as intNums). Lower numbered channels in each FIQ and IRQ
 *  have higher priority. Therefore, channel mapping provides a mechanism for
 *  prioritizing the interrupt requests.
 *
 *  Additionally, it is possible to configure a channel interrupt as a wakeup
 *  interrupt so it can bring the core out of low power mode (LPM).
 *
 *  This module has a {@link #configChannelMeta Hwi.configChannelMeta()}
 *  function that can be invoked from the cfg script to statically
 *  (at build time) change the channel mapping and wakeup functionality of a
 *  channel interrupt.
 *
 *  By default, all interrupt request sources are direct mapped to channels
 *  (i.e. interrupt request N is mapped to channel N) and wakeup feature is
 *  enabled for all interrupts.
 *
 *  Here's an example showing how to use this function:
 *  @p(code)
 *  *.cfg:
 *  var Hwi = xdc.useModule('ti.sysbios.family.arm.v7r.vim.Hwi');
 *
 *  // Map interrupt request line 86 to channel 2 (i.e. intNum 2) and disable
 *  // wakeup feature
 *  Hwi.configChannelMeta(2, 86, false);
 *  @p
 *
 *  @a(More Hwi examples)
 *  Here's an example showing how to construct a Hwi at runtime:
 *  @p(code)
 *  *.c:
 *  #include <ti/sysbios/family/arm/v7r/vim/Hwi.h>
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

    config UInt NUM_INTERRUPTS;

    // -------- Module Types --------

    /*! Hwi vector function type definition. */
    typedef Void (*VectorFuncPtr)(void);

    /*! @_nodoc Hwi plug function type definition. */
    typedef Void (*PlugFuncPtr)(void);

    /*! Interrupt type. IRQ or FIQ */
    enum Type {
        Type_IRQ,               /*! IRQ interrupt. */
        Type_FIQ                /*! FIQ interrupt. */
    };

    /*!
     *  @_nodoc
     *  Vectored Interrupt Manager (VIM) Registers
     */
    struct VIM {
        UInt32 ECCSTAT;         /*! VIM RAM ECC Status Register */
        UInt32 ECCCTL;          /*! VIM RAM ECC Control Register */
        UInt32 UERRADDR;        /*! Uncorrectable Error Address Register */
        UInt32 FBVECADDR;       /*! Fallback Vector Address Register */
        UInt32 SBERRADDR;       /*! Single Bit Error Address Register */

        UInt32 IRQINDEX;        /*! IRQ Index Offset Vector Register */
        UInt32 FIQINDEX;        /*! FIQ Index Offset Vector Register */
        UInt32 RES00[2];        /*! Reserved */

        UInt32 FIRQPR[4];       /*! FIQ/IRQ Program Control Registers */
        UInt32 INTREQ[4];       /*! Pending Interrupt Read Location Registers */

        UInt32 REQENASET[4];    /*! Interrupt Enable Set Registers */
        UInt32 REQENACLR[4];    /*! Interrupt Enable Clear Registers */

        UInt32 WAKEENASET[4];   /*! Wake-up Enable Set Registers */
        UInt32 WAKEENACLR[4];   /*! Wake-up Enable Clear Registers */

        UInt32 IRQVECREG;       /*! IRQ Interrupt Vector Register */
        UInt32 FIQVECREG;       /*! FIQ Interrupt Vector Register */

        UInt32 CAPEVT;          /*! Capture Event Register */
        UInt32 RES01;           /*! Reserved */

        UInt8 CHANCTRL[128];    /*! VIM Interrupt Control Registers */
    };

    /*!
     *  @_nodoc
     *  Symbol "Hwi_vim" is a physical device
     */
    extern volatile VIM vim;

    /*! @_nodoc */
    metaonly struct BasicView {
        Ptr         halHwiHandle;
        String      label;
        String      type;
        Int         intNum;
        String      fxn;
        UArg        arg;
        Ptr         irp;
        String      status;
    };

    /*! @_nodoc */
    metaonly struct ChannelMapView {
        UInt        channelId;
        UInt        interruptRequestId;
    };

    /*! @_nodoc */
    metaonly struct ModuleView {
        String      options[4];
        UInt        spuriousInterrupts;
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
    config Ptr core0VectorTableAddress;

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
    config Ptr core1VectorTableAddress;

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
     *  IRQ exception handler.
     *  Default is set to internal IRQ dispatcher.
     */
    metaonly config VectorFuncPtr irqFunc;

    /*!
     *  Phantom interrupt handler.
     *  Default is set to internal phantom interrupt handler.
     */
    config VectorFuncPtr phantomFunc;

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
     * @_nodoc
     * VIM base address
     */
    metaonly config Ptr vimBaseAddress;

    /*!
     *  ======== errataInitESM ========
     *  Clear ESM errors for AWR1xxx/IWR1xxx devices. Default is true.
     *
     *  Errata brief description:
     *  Cortex-R4 on AWR1xxx/IWR1xxx devices generates a VIM RAM compare error
     *  during startup due to a ROM code bug. This error needs to be cleared
     *  before SYS/BIOS is started and interrupts are enabled.
     */
    config Bool errataInitEsm = false;

    /*!
     *  ======== resetVIM ========
     *  Reset VIM hardware. Default is true for AWR1xxx/IWR1xxx devices.
     *
     *  This feature is available only on certain devices.
     */
    config Bool resetVIM = false;

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
        msg: "E_undefined: Hwi undefined, intnum: %d"
    };

    /*!
     *  Error raised when an unsupported Hwi.MaskingOption used.
     */
    config Error.Id E_unsupportedMaskingOption = {
        msg: "E_unsupportedMaskingOption: Unsupported masking option passed."
    };

    /*!
     *  Error raised when a phantom interrupt occurs.
     */
    config Error.Id E_phantomInterrupt = {
        msg: "E_phantomInterrupt: A phantom interrupt has occurred."
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
     *  ======== configChannelMeta ========
     *  Configure which VIM interrupt request this channel maps to and
     *  whether this channel's interrupt is a wakeup interrupt
     *
     *  Each VIM interrupt request (source) can be mapped to any of
     *  the interrupt channels. Lower numbered channels in each FIQ
     *  and IRQ have higher priority. Therefore, channel mapping
     *  provides a mechanism for prioritizing the interrupt requests.
     *
     *  A channel interrupt can also be configured to be a wakeup interrupt
     *  so it can bring the core out of low power mode (LPM).
     *
     *  @param(channelId)       Channel number (intNum)
     *  @param(intRequestId)    VIM Interrupt request (source) number
     *  @param(wakeupEnable)    Enable wakeup interrupt functionality ?
     */
    metaonly Void configChannelMeta(UInt channelId, UInt intRequestId,
        Bool wakeupEnable);

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

instance:

    /*! Interrupt type (IRQ/FIQ. Default is IRQ. */
    config Type type = Type_IRQ;

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

    metaonly config Bool lockstepDevice;

    /*
     *  ======== channelMap ========
     */
    config UInt8 channelMap[];

    /*
     *  ======== intReqEnaSet ========
     *  Initial interrupt request enable value
     */
    config UInt32 intReqEnaSet[];

    /*
     *  ======== wakeEnaSet ========
     *  Initial wakeup enable value
     */
    config UInt32 wakeEnaSet[];

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
     *  ======== initEsm ========
     */
    Void initEsm();

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
    Void dispatchIRQC(Irp irp);

    /* default Phantom Interrupt Handler */
    Void phantomIntHandler();

    /*
     *  ======== mapChannel ========
     *  Map interrupt request to given channel
     *
     *  @param(channelId)       Channel number
     *  @param(intRequestId)    VIM Interrupt request (source) number
     */
    Void mapChannel(UInt channelId, UInt intRequestId);

    /* non plugged interrupt handler */
    Void nonPluggedHwiHandler(UArg arg);

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
        UInt        disableMask[4];
    };

    struct Module_State {
        Char        *taskSP;                // temporary storage of interrupted
                                            // Task's SP during ISR execution
        Char        *isrStack;              // Points to isrStack address
        Ptr         isrStackBase;           // _stack
        Ptr         isrStackSize;           // _STACK_SIZE
        Char        fiqStack[];             // buffer used for FIQ stack
        SizeT       fiqStackSize;
        UInt        *vimRam;                // VIM RAM
        Handle      dispatchTable[];        // dispatch table
        UInt        zeroLatencyFIQMask[4];
        UInt        spuriousInts;           // Count of spurious interrupts
    };
}
