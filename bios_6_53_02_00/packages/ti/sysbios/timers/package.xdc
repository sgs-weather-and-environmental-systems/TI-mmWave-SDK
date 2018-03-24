/*
 * Copyright (c) 2012, Texas Instruments Incorporated
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
 *  ======== package.xdc ========
 *
 */

/*!
 *  ======== ti.sysbios.timer ========
 *  Contains various timer modules
 *
 *  This package contains Timer modules that manage the timer peripherals
 *  available on various devices.  For the IDs, names, and base addresses of
 *  supported devices, see the following Timer Mapping Tables:
 *  @p(blist)
 *  - {@link ./dmtimer/doc-files/TimerTables.html DMTimer Timer Mapping Table}
 *  - {@link ./gptimer/doc-files/TimerTables.html GPTimer Timer Mapping Table}
 *  - {@link ./timer64/doc-files/TimerTables.html Timer64 Timer Mapping Table}
 *  @p
 *  The Timer modules let you use and configure various timers that exist 
 *  on a particular device. This is achieved by specifying a timer ID when
 *  calling Timer_create(). 
 *
 *  By default, the {@link ti.sysbios.knl.Clock} module statically configures 
 *  a {@link ti.sysbios.hal.Timer}
 *  timer instance to provide the periodic 1 ms tick interrupt. If you
 *  want to use a custom configured timer for the Clock module's tick source,
 *  use the following example configuration as a guide:
 *
 *  @p(code)
 *  var Clock = xdc.useModule('ti.sysbios.knl.Clock');
 *
 *  // Tell the Clock module that YOU are providing the periodic interrupt
 *  Clock.tickSource = Clock.TickSource_USER;
 *
 *  // this example uses the ti.sysbios.timers.dmtimer.Timer module
 *  var Timer = xdc.useModule('ti.sysbios.timers.dmtimer.Timer');
 *
 *  // create a dmtimer config parameter object
 *  var timerParams = new Timer.Params();
 *
 *  // make sure you set the period to 1000 us (1ms)
 *  timerParams.period = 1000;
 *
 *  // custom dmtimer config parameters here...
 *  timerParams.twer.ovf_wup_ena = 1;
 *
 *  // Create the timer.
 *  // This example uses timer id 3.
 *  // The timer interrupt handler must be set to 'Clock.tick'. 
 *  Timer.create(3, Clock.tick, timerParams);
 *  @p
 */
package ti.sysbios.timers [2,0,0,0] {
}
