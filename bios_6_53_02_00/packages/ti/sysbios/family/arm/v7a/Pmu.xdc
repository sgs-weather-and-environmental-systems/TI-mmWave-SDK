/*
 * Copyright (c) 2013, Texas Instruments Incorporated
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
 *  ======== Pmu.xdc ========
 *
 */

package ti.sysbios.family.arm.v7a;

import xdc.rov.ViewInfo;
import xdc.runtime.Assert;

import ti.sysbios.hal.Hwi;

/*!
 *  ======== Pmu ========
 *  ARM Performance Monitoring Unit module
 *
 *  This module manages the performance monitor unit's counters on ARM v7A
 *  processors. This module does not manage the cycle counter. The cycle
 *  counter is managed by the Timestamp module on most ARM cores.
 *
 *  The following is an example of how to configure one of the Pmu counters
 *  to count L2 cache access events on a Cortex-A15 processor:
 *
 *  C source file:
 *  @p(code)
 *  #include <ti/sysbios/family/arm/v7a/Pmu.h>
 *
 *  Int main(Int argc, char *argv[])
 *  {
 *      // Set L2 cache access as the event type for event counter 0.
 *      // The event number corresponding to each event type can be determined
 *      // using the Cortex-A15 reference manual.
 *      Pmu_configureCounter(0, 0x16, FALSE);
 *
 *      // Reset the count
 *      Pmu_resetCount(0);
 *
 *      // Start the counter
 *      Pmu_startCounter(0);
 *
 *      // code
 *      ...
 *
 *      // Stop the counter
 *      Pmu_stopCounter(0);
 *
 *      // Read and print the count
 *      System_printf("L2 access count: %d\n", Pmu_getCount(0));
 *
 *      return 0;
 *  }
 *  @p
 *
 *  *.cfg file:
 *  @p(code)
 *  var Pmu = xdc.useModule('ti.sysbios.family.arm.v7a.Pmu');
 *  @p
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center">
 *    </colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th>
 *    <th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                               -->
 *    <tr><td> {@link #configureCounter}    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #clearOverflowStatus}       </td><td>   Y    </td>
 *    <td>   Y   </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #disableInterrupt}       </td><td>   Y    </td>
 *    <td>   Y   </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #enableInterrupt}       </td><td>   Y    </td>
 *    <td>   Y   </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getCount}       </td><td>   Y    </td><td>   Y   </td>
 *    <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #getOverflowStatus}       </td><td>   Y    </td>
 *    <td>   Y   </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #resetCount}    </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setCount}    </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #setInterruptFunc}    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #startCounter}    </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td> {@link #stopCounter}    </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   N    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started
 *   (e.g. PerfMonitor_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started
 *   (e.g. Cache_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

@ModuleStartup
@DirectCall
module Pmu
{
    /*!
     *  ======== intNum ========
     *  A Hwi is created for the interrupt number 'pmuIntNum'
     *
     *  pmuIntNum specifies the interrupt number that is connected to the
     *  nPMUIRQ signal from the PMU module.
     */
    config UInt intNum = (~0);

    /*! Pmu interrupt handler function type definition. */
    typedef Void (*IntHandlerFuncPtr)(UArg);

    /*!
     *  ======== ModView ========
     *  @_nodoc
     */
    metaonly struct PmuInfoView {
        UInt    numEventCounters;   /* Number of event counters implemented
                                       in Hardware */
    };

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Pmu Info',  { type: ViewInfo.MODULE_DATA,
                                viewInitFxn: 'viewInitPmuInfo',
                                structName: 'PmuInfoView'}],
           ]
        });

    /*!
     *  ======== A_badIntNum ========
     *  Assert raised when module cannot determine PMU interrupt number
     *  for the given target/platform and the user is not providing the
     *  interrupt number using intNum config param.
     */
    config xdc.runtime.Assert.Id A_badIntNum  = {
        msg: "A_badIntNum: Set PMU interrupt number using Pmu.intNum config param."
    };

    /*!
     *  ======== A_invalidCounterId ========
     *  Assert raised when invalid PMU counter Id passed.
     */
    config xdc.runtime.Assert.Id A_invalidCounterId  = {
        msg: "A_invalidCounterId: Invalid PMU counter Id passed."
    };

    /*!
     *  ======== interruptFunc ========
     *  PMU overflow interrupt callback function pointer
     *
     *  When a counter overflow interrupt occurs, the registered
     *  callback function is called with the contents of the Overflow
     *  Flag Status Register passed as an argument. The overflow
     *  status flag can be used to determine which counter generated
     *  the interrupt when multiple counters are running with
     *  overflow interrupt enabled.
     */
    metaonly config IntHandlerFuncPtr interruptFunc = null;

    /*!
     *  ======== setInterruptFunc ========
     *  Set callback function
     *
     *  When a counter overflow interrupt occurs, the registered
     *  callback function is called with the contents of the Overflow
     *  Flag Status Register passed as an argument. The overflow
     *  status flag can be used to determine which counter generated
     *  the interrupt when multiple counters are running with
     *  overflow interrupt enabled.
     *
     *  Setting the callback function through this API overrides
     *  the callback function set through {@link #interruptFunc} config param.
     *
     *  @param(interruptFunc)       Callback function
     */
    Void setInterruptFunc(IntHandlerFuncPtr interruptFunc);

    /*!
     *  ======== startCounter ========
     *  Start an event counter
     *
     *  @param(counterId)       Event counter Id
     */
    Void startCounter(UInt counterId);

    /*!
     *  ======== stopCounter ========
     *  Stop an event counter
     *
     *  @param(counterId)       Event counter Id
     */
    Void stopCounter(UInt counterId);

    /*!
     *  ======== resetCount ========
     *  Reset the event counter's count to 0
     *
     *  @param(counterId)       Event counter Id
     */
    Void resetCount(UInt counterId);

    /*!
     *  ======== setCount ========
     *  Set the event counter's count to counterVal.
     *
     *  @param(counterId)       Event counter Id
     *  @param(counterVal)      Counter value to set
     */
    Void setCount(UInt counterId, UInt32 counterVal);

    /*!
     *  ======== configureCounter ========
     *  Set the event type for an event counter and enable/disable
     *  interrupt generation on a counter overflow
     *
     *  This function disables/stops the counter, sets the new event type,
     *  enables/disables interrupt generation and then re-enables the
     *  counter if it was enabled before.
     *
     *  Please refer the device's Technical Reference Manual for a list of
     *  supported event types and their corresponding event numbers.
     *
     *  @param(counterId)       Event counter Id
     *  @param(eventNum)        Event number
     *  @param(interruptEnable) Enable/Disable Interrupt generation
     */
    Void configureCounter(UInt counterId, UInt eventNum, Bool interruptEnable);

    /*!
     *  ======== enableInterrupt ========
     *  Enable interrupt generation on a counter overflow
     *
     *  @param(counterId)       Event counter Id
     */
    Void enableInterrupt(UInt counterId);

    /*!
     *  ======== disableInterrupt ========
     *  Disable interrupt generation on a counter overflow
     *
     *  @param(counterId)       Event counter Id
     */
    Void disableInterrupt(UInt counterId);

    /*!
     *  ======== clearOverflowStatus ========
     *  Clear overflow status flag
     *
     *  @param(counterId)       Event counter Id
     */
    Void clearOverflowStatus(UInt counterId);

    /*!
     *  ======== getCount ========
     *  Read the event count
     *
     *  @param(counterId)       Event counter Id
     *  @b(returns)             Event count
     */
    UInt32 getCount(UInt counterId);

    /*!
     *  ======== getNumCounters ========
     *  Reads and returns the number of event counters
     *  implemented in HW.
     */
    UInt getNumCounters();

    /*!
     *  ======== getOverflowStatus ========
     *  Returns a boolean indicating status of overflow flag
     *
     *  @param(counterId)       Event counter Id
     *  @b(returns)             Overflow status
     */
    Bool getOverflowStatus(UInt counterId);

    /*!
     *  @_nodoc
     *  ======== getEnabled ========
     *  Get the bit mask of counter enable.
     */
    UInt32 getEnabled();

    /*!
     *  @_nodoc
     *  ======== startCounterI ========
     *  Internal inline asm implementation.
     */
    Void startCounterI(UInt counterId);

    /*!
     *  @_nodoc
     *  ======== stopCounterI ========
     *  Internal inline asm implementation.
     */
    Void stopCounterI(UInt counterId);

    /*!
     *  @_nodoc
     *  ======== resetCountI ========
     *  Internal inline asm implementation.
     */
    Void resetCountI(UInt counterId);

    /*!
     *  @_nodoc
     *  ======== setCountI ========
     *  Internal inline asm implementation.
     */
    Void setCountI(UInt counterId, UInt32 counterVal);

    /*!
     *  @_nodoc
     *  ======== enableInterrupt ========
     *  Internal inline asm implementation.
     */
    Void enableInterruptI(UInt counterId);

    /*!
     *  @_nodoc
     *  ======== disableInterrupt ========
     *  Internal inline asm implementation.
     */
    Void disableInterruptI(UInt counterId);

    /*!
     *  @_nodoc
     *  ======== clearOverflowStatusI ========
     *  Internal inline asm implementation.
     */
    Void clearOverflowStatusI(UInt counterId);

    /*!
     *  @_nodoc
     *  ======== getCountI ========
     *  Internal inline asm implementation.
     */
    UInt32 getCountI(UInt counterId);

    /*!
     *  @_nodoc
     *  ======== getOverflowStatus ========
     *  Internal inline asm implementation.
     */
    UInt32 getOverflowStatusI(UInt counterId);

internal:

    /*
     *  ======== configureCounterI ========
     *  Internal inline asm implementation.
     */
    Void configureCounterI(UInt counterId, UInt eventNum);

    /*
     *  ======== clearOverflowStatusReg ========
     *  Write to Overflow Flag Status Clear register.
     */
    Void clearOverflowStatusReg(UInt32 clearMask);

    /*
     *  ======== getOverflowStatusReg ========
     *  Read Overflow Flag Status Clear register.
     */
    UInt32 getOverflowStatusReg();

    /*
     *  ======== initCounters ========
     *  Disables interrupt request generation for all event counters, clears
     *  the overflow status flag, resets and enables all event counters.
     *
     *  This function is called during module startup.
     */
    Void initCounters(UInt32 counterMask);

    /*
     *  ======== interruptHandler ========
     *  Pmu interrupt handler function.
     */
    Void interruptHandler(UArg arg);

    struct Module_State {
        UInt                    numCounters;    /* Number of event counters
                                                   implemented in Hardware */
        Hwi.Handle              hwiHandle;
        IntHandlerFuncPtr       interruptFunc;
    }
}
