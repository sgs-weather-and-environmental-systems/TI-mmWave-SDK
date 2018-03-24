/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 *  ======== Power.xdc ========
 *
 *
 */

package ti.sysbios.family.msp430;

import xdc.runtime.Error;

/*!
 *  ======== Power ========
 *  Power Manager Module
 *
 *  This module provides functions that can be called to reduce MSP430 power
 *  consumption.
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!-- -->
 *    <tr><td> {@link #idleCPU} </td><td>   N    </td><td>   N    </td><td>   N </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #changeIdleMode} </td><td>   Y    </td><td>   Y    </td><td>   Y </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #sleepCPU}  </td><td>   N    </td><td>   N    </td><td>   Y   </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td> {@link #wakeCPU}  </td><td>   Y    </td><td>   N    </td><td>   N   </td><td>   N    </td><td>   N    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable from main(). </li>
 *         <li> <b>Startup</b>: API is callable during any module startup. </li>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

@Template("./Power.xdt")
module Power inherits ti.sysbios.interfaces.IPower
{
    /*!
     *  ======== SleepPrepFuncPtr ========
     *  Sleep mode preparation function type definition
     */
    typedef Void (*SleepPrepFuncPtr)();

    /*!
     *  ======== IdleMode ========
     *  Available idle modes
     */
    enum IdleMode {
        LPM0 = 0x10,            /* CPUOFF */
        LPM1 = 0x50,            /* CPUOFF + SCG0 */
        LPM2 = 0x90,            /* CPUOFF + SCG1 */
        LPM3 = 0xD0,            /* CPUOFF + SCG0 + SCG1 */
        LPM4 = 0xF0             /* CPUOFF + SCG0 + SCG1  + OSCOFF */
    };

    /*!
     *  ======== SleepMode ========
     *  Available sleep modes.
     */
    enum SleepMode {
        Sleep_LPM4_5            /*! Shutdown (LPM4.5) */
    };

    /*!
     *  ======== E_dynamicModeNotAllowed ========
     *  Dynamic mode not allowed error
     *
     *  This Error is raised if there is an attempt to change idleMode at
     *  runtime, or trigger a dynamic CPU wakeup, and
     *  `{@link #allowDynamicMode}` is set to "false".
     */
    config Error.Id E_dynamicModeNotAllowed = {
        msg: "E_dynamicModeNotAllowed: Dynamic mode is not enabled (allowDynamicMode=false)"
    };

    /*!
     *  ======== idle ========
     *  Idle CPU when threads blocked waiting for an interrupt?
     */
    override config Bool idle = true;

    /*!
     *  ======== idleMode ========
     *  Idle mode for CPU to enter while waiting for an interrupt
     */
    config IdleMode idleMode = LPM0;

    /*!
     *  ======== allowDynamicMode ========
     *  Allow dynamic changes to idleMode (`{@link #changeIdleMode}`), or
     *  dynamically waking the CPU upon return from interrupt
     *  (`{@link #wakeCPU}`), at runtime?
     */
    config Bool allowDynamicMode = false;

    /*!
     *  ======== sleepPrepFunction ========
     *  I/O preparation function to be called by Power_sleepCPU()
     */
    config SleepPrepFuncPtr sleepPrepFunction;

    /*!
     *  ======== idleCPU ========
     *  Function to automatically idle the CPU during idle time
     *
     *  When the `{@link #idle}` configuration parameter is set, this function
     *  will be added to the list of Idle loop functions.  When called from the
     *  `Idle` loop, it will transition the CPU into the idle mode specified
     *  by the `{@link #idleMode}` configuration parameter.  The CPU will stay
     *  in the corresponding low power mode until the next interrupt occurs.
     */
    Void idleCPU();

    /*!
     *  ======== changeIdleMode ========
     *  Change the idleMode used for idling the CPU
     *
     *  This function does not immediately affect the state of the CPU, but
     *  defines the idleMode that will be invoked at subsequent opportunities
     *  SYS/BIOS has to idle the CPU.
     *
     *  Changing the `idleMode` at runtime requires that `{@link #idle}` be
     *  enabled, the initial `{@link #idleMode}` is defined, and
     *  `{@link #allowDynamicMode}` is specified in the application
     *  configuration.  For example:
     *
     *  @p(code)
     *  var Power = xdc.useModule('ti.sysbios.family.msp430.Power');
     *  Power.idle = true;
     *  Power.idleMode = Power.LPM3;
     *  Power.allowDynamicMode = true;
     *  @p
     */
    Void changeIdleMode(Power.IdleMode mode);

    /*!
     *  ======== sleepCPU ========
     *  Function called by the application to sleep the CPU
     *
     *  This function currently supports the `LPM4.5` sleep mode only, and
     *  only on MSP430 devices that support this mode.  To be effective, the
     *  device I/Os MUST be properly configured before `LPM4.5` is activated,
     *  otherwise there may be excessive current draw, which could be higher
     *  than before this function is called.  The proper configuration of I/Os
     *  is device, application, and board specific.  The caller of this
     *  function has two options:
     *
     *     1) Prepare the device I/Os, and any (non-reset) wakeup interrupts
     *        prior to  calling this function, or
     *     2) Write a function for this purpose, and configure it as the
     *        optional `{@link #sleepPrepFunction}`, that `Power_sleepCPU()`
     *        should call before transitioning to `LPM4.5`.
     */
    Void sleepCPU(SleepMode sleepMode);

    /*!
     *  ======== wakeCPU ========
     *  Function called to trigger a dynamic CPU wakeup upon return from
     *  interrupt
     *
     *  An interrupt can be configured statically (at build time) to let the
     *  CPU naturally resume an LPM mode upon return from interrupt (see
     *  `{@link ti.sysbios.family.msp430 Hwi}`).
     *
     *  This function (Power_wakeCPU()) can be called from within an ISR
     *  function to override the static configuration (where the CPU would
     *  resume an LPM mode), and force the CPU to stay awake upon return from
     *  interrupt.
     *
     *  For the case of nested interrupts, the effect of this API is for the
     *  bottom-most (or first-preempting) interrupt, meaning that if this
     *  function is called from an ISR that has nested upon another, the CPU
     *  will be kept awake after the interrupt that first awoke the CPU.
     *
     *  To call this function, it is required that
     *  `{@link #allowDynamicMode}` is specified as 'true' in the application
     *  configuration.  For example:
     *
     *  @p(code)
     *  var Power = xdc.useModule('ti.sysbios.family.msp430.Power');
     *  Power.allowDynamicMode = true;
     *  @p
     *
     */
    Void wakeCPU();

    /*! @_nodoc
     *  ======== getModeChangeFlag ========
     *  Retrieve flag indicating whether the application changed the idleMode
     */
    UInt getModeChangeFlag();

internal:

    /*
     *  ======== defaultSleepPrepFunction ========
     *  Default (NOP) function to be called to prepare device I/Os for sleep
     */
    Void defaultSleepPrepFunction();

    /*
     *  ======== blockedTaskFunction ========
     *  Function to call when Idle not used, and plugging Task.allBlockedFunc
     */
    Void blockedTaskFunction();

    /*
     *  ======== Module_State ========
     */
    struct Module_State {
        UInt idleMode;          /* idle depth to invoke in Power_idle() */
        Bool newMode;           /* flag indicating idleMode has just changed */
    }
}
