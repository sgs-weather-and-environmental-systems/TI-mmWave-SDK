/*
 * Copyright (c) 2014-2015, Texas Instruments Incorporated
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
 *  ======== TimestampProvider.xs ========
 */

var BIOS = null;
var Timer = null;
var Startup = null;
var TimestampProvider = null;
var Clock = null;
var Hwi = null;
var timerFreq = 0;
var useClockTimerSetByUser = false;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }
    TimestampProvider = this;
    /* set fxntab default */
    TimestampProvider.common$.fxntab = false;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.useModule('ti.sysbios.BIOS');
    Timer = xdc.useModule('ti.sysbios.timers.dmtimer.Timer');
    Startup = xdc.useModule('xdc.runtime.Startup');
    Clock = xdc.om['ti.sysbios.knl.Clock'];
    Hwi = xdc.useModule('ti.sysbios.hal.Hwi');

    var Diags = xdc.useModule('xdc.runtime.Diags');
    for (var dl in TimestampProvider.common$) {
        if (dl.match(/^diags_/) && dl != 'diags_ASSERT') {
            TimestampProvider.common$[dl] = Diags.ALWAYS_OFF;
        }
    }

    /* if user has not specified useClockTimer or timer id ... */
    if ((TimestampProvider.useClockTimer == undefined) &&
        (TimestampProvider.$written("timerId") == false)) {
        /*
         *  User has specified neither useClockTimer nor timerId.  We'll
         *  take a guess at what useClockTimer should be, since the
         *  Clock Timer proxy may not have been set yet and we cannot set
         *  useClockTimer later on (eg, in module$static$init())
         */
        if (BIOS.clockEnabled && (Clock.tickSource == Clock.TickSource_TIMER)) {
            /* This may turn out to be incorrect */
            TimestampProvider.useClockTimer = true;
        }
        else {
            /* This is correct */
            TimestampProvider.useClockTimer = false;
        }
    }
    else if ((TimestampProvider.useClockTimer == undefined) &&
             (TimestampProvider.$written("timerId") == true)) {
        TimestampProvider.useClockTimer = false;
    }
    else {
        /* TimestampProvider.useClockTimer was set outside this module */
        useClockTimerSetByUser = true;
        if (TimestampProvider.useClockTimer == true) {
            if (TimestampProvider.$written("timerId") == true) {
                this.$logWarning("Setting TimestampProvider.timerId has no" +
                        " effect since TimestampProvider.useClockTimer is true. ",
                        this);
            }
        }
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    /*
     *  We need to create the timer for the following two cases:
     *
     *  1. We set useClockTimer to true in module$use(), but the Clock
     *     Timer proxy is not the dm Timer.
     *
     *  2. useClockTimer is false.
     */
    if ((!useClockTimerSetByUser &&
            !Clock.TimerProxy.delegate$.$name.match(
                /ti.sysbios.timers.dmtimer.Timer/)) ||
            (TimestampProvider.useClockTimer == false)) {

        // TODO: If we set useClockTimer to true incorrectly,
        // we should fix it so it doesn't give incorrect information.

        var  timerParams = new Timer.Params();

        timerParams.period = Timer.MAX_PERIOD;
        timerParams.periodType = Timer.PeriodType_COUNTS;
        timerParams.runMode = Timer.RunMode_CONTINUOUS;
        timerParams.startMode = Timer.StartMode_USER;

        /*
         *  Save the frequency of the timer for getFreqMeta() (currently
         *  not implemented, but may be in the future)
         */
        timerFreq = Timer.getFreqMeta(TimestampProvider.timerId);

        mod.timer = Timer.create(TimestampProvider.timerId,
                    TimestampProvider.rolloverFunc,
                    timerParams);

        Startup.lastFxns.$add(TimestampProvider.startTimer);
    }
    else {
        /* This will be initialized in TimestampProvider_Module_startup() */
        mod.timer = null;
    }

    mod.rollovers = 0;
}

/*
 *  ======== module$view$init ========
 */
function module$view$init(view, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Timer = Program.scanModule('ti.sysbios.timers.dmtimer.Timer');

    view.timer = Timer.$scanHandle(mod.timer).$view;
    view.usesClockTimer =
        Program.$modules['ti.sysbios.timers.dmtimer.TimestampProvider'].useClockTimer;
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
    var BIOS = xdc.module('ti.sysbios.BIOS');
    var Clock = xdc.module('ti.sysbios.knl.Clock');
 
    if ((!BIOS.clockEnabled || (Clock.tickSource == Clock.TickSource_NULL))  
        && (this.useClockTimer == true)) {
        TimestampProvider.$logError("Clock is not enabled, cannot share its" +
                " Timer", TimestampProvider, "useClockTimer");
    }

    if (useClockTimerSetByUser && TimestampProvider.useClockTimer) {
        if (!String(Clock.TimerProxy.delegate$).match(
                /ti.sysbios.timers.dmtimer.Timer/)) {
            this.$logError(
                "TimestampProvider.useClockTimer is true but the Clock" +
                " module does not use DMTimer as the timer proxy. In order to use" +
                " this TimerstampProvider, please change the Clock module timer" +
                " proxy to DMTimer and rebuild.\n\nExample *.cfg code:\nvar Clock" +
                " = xdc.useModule\(\"ti.sysbios.knl.Clock\"\);\nClock.TimerProxy" +
                " = xdc.useModule\(\"ti.sysbios.timers.dmtimer.Timer\"\);\n", this);
        }
    }
}

/*
 *  ======== getFreqMeta ========
 */
function getFreqMeta()
{
    var freq = {lo: 0, hi: 0};
    var modObj = TimestampProvider.$object;
    var timer = null;

    if (TimestampProvider.useClockTimer == false) {
        timer = modObj.timer;
    }
    else {
        var Clock = xdc.module('ti.sysbios.knl.Clock');
        timer = Clock.$object.timer.delegate$;
    }

    if (timer) {
        if (timer.$object.extFreq.lo) {
            freq.lo = timer.$object.extFreq.lo;
        }
        else {
            for (var realInst in Timer.$instances) {
                var inst = Timer.$instances[realInst];
                if (timer.$object == inst.$object) {
                    freq = Timer.intFreqs[inst.$object.id].lo;
                    break;
                }
            }
        }
    }

    return (freq);
}
