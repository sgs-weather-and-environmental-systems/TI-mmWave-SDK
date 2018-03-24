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
 *  ======== TimerSupport.xdc ========
 */

package ti.sysbios.family.shared.vayu;

import xdc.rov.ViewInfo;

/*!
 *  ======== TimerSupport ========
 *  Vayu Timer Support.
 *
 *  The Vayu Timer Support module works in conjunction with the DMTimer
 *  module to manage the usage of the DMTimers by the various Vayu cores.
 *
 *  This module provides a timer available mask. The application can modify
 *  this available mask in the .cfg script to choose a different set of timers.
 *
 *  The default value of the timer {@link #availMask} depends on the target
 *  the application is being built for. The defaults are shown below:
 *
 *  @p(code)
 *  For Vayu or DRA7XX devices:
 *   --------------------------------------------
 *  | Target       | Default availMask           |
 *   --------------------------------------------
 *  | A15          | 0x0202 (GPTimer 2 & 10)     |
 *  | DSP          | 0x0030 (GPTimer 5 & 6)      |
 *  | IPU(Dual-M4) | 0x050C (GPTimer 3,4,9 & 11) |
 *  | ARP32        | 0x00C0 (GPTimer 7 & 8)      |
 *   --------------------------------------------
 *
 *  For TDA3XX devices:
 *   --------------------------------------------
 *  | Target       | Default availMask           |
 *   --------------------------------------------
 *  | DSP          | 0x0003 (GPTimer 1 & 2)      |
 *  | IPU(Dual-M4) | 0x000C (GPTimer 3 & 4)      |
 *  | ARP32        | 0x00C0 (GPTimer 7 & 8)      |
 *   --------------------------------------------
 *  @p
 *
 *  @a(Note)
 *  If the {@link #availMask} is changed, the interrupt sources
 *  corresponding to the new Timer Ids may need to be mapped in
 *  the interrupt crossbar module if they are not mapped by default.
 *
 *  See {@link ../../../timers/dmtimer/doc-files/TimerTables.html Timer Mapping Tables}
 *  to determine the default interruptNumber/eventId assigned to
 *  each DM Timer. In the Timer Mapping Table, an interrupt number
 *  of -1 implies the timer's interrupt source is not connected to
 *  the target cpu's interrupt controller. If you need to use a
 *  timer with an interrupt number of -1, you will need to first select
 *  an unused interrupt to use for the timer and then map the
 *  timer's interrupt source to the target cpu's interrupt controller
 *  using the
 *  {@link ti.sysbios.family.shared.vayu.IntXbar Interrupt Crossbar module}.
 *
 *  Below is an example showing how to statically override the default
 *  timer available mask in a configuration script for the DSP:
 *
 *  @p(code)
 *  var Timer = xdc.useModule('ti.sysbios.timers.dmtimer.Timer');
 *  var IntXbar = xdc.useModule('ti.sysbios.family.shared.vayu.IntXbar');
 *  var TimerSupport = xdc.useModule('ti.sysbios.family.shared.vayu.TimerSupport');
 *
 *  // The new availability mask includes GP Timers 13, 14, 15 & 16.
 *  // The interrupt sources for these timers is not connected to the
 *  // DSP and need to be connected by the user.
 *  TimerSupport.availMask = 0xF000;
 *
 *  // Connect GP Timer 13 to EventId 76 (XBAR Instance 45)
 *  IntXbar.connectMeta(45, 339);
 *
 *  // Connect GP Timer 14 to EventId 77 (XBAR Instance 46)
 *  IntXbar.connectMeta(46, 340);
 *
 *  // Connect GP Timer 15 to EventId 78 (XBAR Instance 47)
 *  IntXbar.connectMeta(47, 341);
 *
 *  // Connect GP Timer 16 to EventId 81 (XBAR Instance 49)
 *  IntXbar.connectMeta(49, 342);
 *
 *  // The DMTimer's timer mapping table shows that the intNum
 *  // for GP Timer 13, 14, 15 & 16 is -1 implying the intNum
 *  // has not been assigned by default. The below code utilizes
 *  // the DMTimer module's timerSettings array to assign
 *  // a default intNum to each of these timers.
 *  Timer.timerSettings[12].intNum = 14;
 *  Timer.timerSettings[13].intNum = 15;
 *  Timer.timerSettings[14].intNum = 4;
 *  Timer.timerSettings[15].intNum = 5;
 *
 *  var TimerParams = new Timer.Params();
 *  TimerParams.period = 5000;
 *  TimerParams.runMode = Timer.RunMode_ONESHOT;
 *  TimerParams.periodType = Timer.PeriodType_MICROSECS;
 *
 *  TimerParams.arg = 1;
 *  Timer.create(Timer.ANY, '&myIsr1', TimerParams);
 *
 *  TimerParams.arg = 2;
 *  Timer.create(Timer.ANY, '&myIsr2', TimerParams);
 *  @p
 *
 *  Below is an example showing how to statically override the default
 *  timer available mask in a configuration script for the A15:
 *
 *  @p(code)
 *  var Timer = xdc.useModule('ti.sysbios.hal.Timer');
 *  var DMTimer = xdc.useModule('ti.sysbios.timers.dmtimer.Timer');
 *
 *  // Override the default hal timer proxy for the A15 target
 *  Timer.TimerProxy = DMTimer;
 *
 *  var TimerSupport = xdc.module('ti.sysbios.family.shared.vayu.TimerSupport');
 *  TimerSupport.availMask = 0x000F;
 *
 *  var TimerParams = new Timer.Params();
 *  TimerParams.arg = 1;
 *  TimerParams.period = 5000;
 *  TimerParams.runMode = Timer.RunMode_ONESHOT;
 *  TimerParams.periodType = Timer.PeriodType_MICROSECS;
 *
 *  Timer.create(Timer.ANY, '&myIsr', TimerParams);
 *  @p
 *
 */

@ModuleStartup

module TimerSupport inherits ti.sysbios.interfaces.ITimerSupport
{
    /*!
     *  ======== ModuleView ========
     *  @_nodoc
     */
    metaonly struct ModuleView {
        String availMask;
    }

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo = 
        ViewInfo.create({
            viewMap: [
            [
                'Module',
                {
                    type: ViewInfo.MODULE,
                    viewInitFxn: 'viewInitModule',
                    structName: 'ModuleView'
                }
            ],
            ]
        });

    /*!
     *  ======== availMask ========
     *  Default available mask for dmtimers
     *
     *  Used to set Timer module's availMask.
     *  The default value of the timer availMask depends on the target
     *  the application is being built for. The defaults are shown below:
     *
     *  @p(code)
     *  For Vayu or DRA7XX devices:
     *   --------------------------------------------
     *  | Target       | Default availMask           |
     *   --------------------------------------------
     *  | A15          | 0x0202 (GPTimer 2 & 10)     |
     *  | DSP          | 0x0030 (GPTimer 5 & 6)      |
     *  | IPU(Dual-M4) | 0x050C (GPTimer 3,4,9 & 11) |
     *   --------------------------------------------
     *
     *  For TDA3XX devices:
     *   --------------------------------------------
     *  | Target       | Default availMask           |
     *   --------------------------------------------
     *  | DSP          | 0x0003 (GPTimer 1 & 2)      |
     *  | IPU(Dual-M4) | 0x050C (GPTimer 3 & 3)      |
     *   --------------------------------------------
     *  @p
     */
     config Bits32 availMask = 0x0;

internal:

    /*
     *  ======== getAnyMask ========
     *  Return the anyMask for this device.
     */
    metaonly Bits32 getAnyMask();

    /*
     *  ======== getAvailMask ========
     *  Return the availMask for this device.
     */
    metaonly Bits32 getAvailMask();
}
