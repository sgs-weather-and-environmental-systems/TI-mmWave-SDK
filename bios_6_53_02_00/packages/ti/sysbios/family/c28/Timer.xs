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
 *  ======== Timer.xs ========
 *
 */

var Timer = null;
var Hwi = null;
var BIOS = null;

/*
 * Interrupt numbers for the corresponding timer device. Used to create
 * Hwi's with the appropriate interrupt number. Timers 1 (int 13) and 2 (int
 * 14) are normal interrupts, timer 0 (int 38) is a PIE interrupt.
 */
var intNumDef =  [38, 13, 14];

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }
    Timer = this;

    /*
     * set fxntab to false because ti.sysbios.hal.Timer can be used
     * instead of an abstract intsance
     */
    Timer.common$.fxntab = false;

    Timer.intNumDef[0]= 38;
    Timer.intNumDef[1]= 13;
    Timer.intNumDef[2]= 14;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.useModule('ti.sysbios.BIOS');
    Hwi = xdc.useModule("ti.sysbios.family.c28.Hwi");
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    /* availMask has 3 bits set for the three timers */
    mod.availMask = 0x7;

    /*
     * The list of timers available for 'any' should be <= to the list of
     * all timers (0x7).
     */
    if (params.anyMask > mod.availMask) {
        Timer.$logError("Incorrect anyMask (0x" +
                        Number(params.anyMask).toString(16) +
                        "). Should be <= 0x" +
                        Number(mod.availMask).toString(16) + ".", Timer, "anyMask");
    }

    /*
     * Initialize staticTimers to null. This way we don't need to keep a count
     * of the handles, we can just check for null.
     */
    for (var i = 0; i < Timer.NUM_TIMER_DEVICES; i++) {
        mod.staticTimers[i] = null;
    }

    /*
     * plug Timer.startup into BIOS.startupFxns array
     */
    BIOS.addUserStartupFunction(Timer.startup);
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, id, tickFxn, params)
{
    var modObj = this.$module.$object;

    /* set flag because static instances need to be started */
    Timer.startupNeeded = true;

    /* Make sure the requested timer is available, then assign it. */

    /* Make sure id is a valid timer id. */
    if ((id >= Timer.NUM_TIMER_DEVICES)) {
        if (id != Timer.ANY) {
            Timer.$logFatal("Invalid Timer ID " + id + "!", this);
        }
    }

    /* If timer id is "any timer" (-1) */
    if (id == Timer.ANY) {
        for (var i = Timer.NUM_TIMER_DEVICES - 1; i >= 0; i--) {
            if ((Timer.anyMask & (1 << i)) && (modObj.availMask & (1 << i))) {
                modObj.availMask &= ~(1 << i);
                /* Assign the timer */
                obj.id = i;
                break;
            }
        }
    }

    /* Otherwise, if the requested timer is available... */
    else if (modObj.availMask & (1 << id)) {
        /* Update the masks to make the timer unavailable. */
        modObj.availMask &= ~(1 << id);
        obj.id = id;
    }

    /*
     * If a timer has not been assigned because either the requested timer was
     * unavailable or 'any timer' was requested and none were available...
     */
    if (obj.id == undefined) {
        if (id == Timer.ANY) {
            Timer.$logFatal("No available timers.", this);
        }
        else {
            Timer.$logFatal("Timer " + id + " is already in use or reserved (check availMask).", this);
        }
    }

    /* Fill in the instance fields */
    obj.emulationModeInit.soft = params.emulationModeInit.soft;
    obj.emulationModeInit.free = params.emulationModeInit.free;
    obj.runMode = params.runMode;
    obj.startMode = params.startMode;
    obj.prescale = params.prescale;

    if (params.periodType == Timer.PeriodType_MICROSECS) {
        if (setPeriodMicroSecs(obj, params.period) == false) {
            Timer.$logError("Timer does not support configured period.",
                                 this, params.period)
        }
    }
    else {
        obj.period = params.period;
    }
    obj.periodType = Timer.PeriodType_COUNTS;

    obj.intNum = intNumDef[obj.id];
    obj.arg = params.arg; // Save arg to pass it to the tickFxn in the stubs.
    obj.tickFxn = tickFxn;
    obj.extFreq.lo = params.extFreq.lo;
    obj.extFreq.hi = params.extFreq.hi;

    /*
     * If the user has provided an isr to run, create a Hwi for the timer
     * interrupt with the tickFxn.
     */
    if (obj.tickFxn) {
        /* Use the default parameters if none were provided. */
        var hwiParams = params.hwiParams;

        if (!params.hwiParams) {
            hwiParams = new Hwi.Params();
            if ((obj.runMode == Timer.RunMode_ONESHOT) &&
                (obj.intNum < 15)) {
                /* oneShotStub disables the IER bit, so do not restore it */
                hwiParams.maskSetting = Hwi.MaskingOption_BITMASK;
                hwiParams.disableMask = 1 << (obj.intNum - 1);
                hwiParams.restoreMask = 0;
            }
        }

        /*
         * Perform error checking on the hwiParams. If the RunMode is ONESHOT
         * the hwi mask must mask itself so that the stub is not interrupted
         * by another timer interrupt.
         */
        if (obj.runMode == Timer.RunMode_ONESHOT) {
            if (hwiParams.maskSetting == Hwi.MaskingOption_NONE) {
                Timer.$logFatal("disableMask in hwiParams must mask self.", this, "maskSetting");
            }
            if ((hwiParams.maskSetting == Hwi.MaskingOption_BITMASK) &&
                (obj.intNum < 15)) {
                if (!(hwiParams.disableMask & (1 << (obj.intNum - 1)))) {
                    Timer.$logFatal("disableMask in hwiParams (0x" +
                    Number(hwiParams.disableMask).toString(16) +
                    ") must mask self.", this, "maskSetting");
                }
                /* oneShotStub disables the IER bit, so do not restore it */
                if (hwiParams.restoreMask & (1 << (obj.intNum - 1))) {
                    Timer.$logFatal("restoreMask in hwiParams (0x" +
                    Number(hwiParams.restoreMask).toString(16) +
                    ") must not restore self.", this, "maskSetting");
                }
            }
        }

        /* Verify that the timer interrupt is not already in use. */
        if (Hwi.inUseMeta(obj.intNum)) {
            Timer.$logError("Timer interrupt " + obj.intNum +
                            " is already in use!", this);
        }

        /*
         * Create the Hwi depending on the RunMode.
         * If continuous, just create the hwi.
         */
        if (obj.runMode == Timer.RunMode_CONTINUOUS) {
            hwiParams.arg = obj.arg;
            obj.hwi = Hwi.create(obj.intNum, obj.tickFxn, hwiParams);
        }
        /*
         * If the run mode is one shot, create a Hwi with a oneShotStub
         * which will call the user's isr and stop the timer.
         */
        else if (obj.runMode == Timer.RunMode_ONESHOT) {
            hwiParams.arg = this;
            obj.hwi = Hwi.create(obj.intNum, Timer.oneShotStub, hwiParams);
        }
        else {
            Timer.$logError("Invalid Timer RunMode: " + obj.runMode, this);
        }
    }
    else {
        obj.hwi = null;
    }

    /*
     * Add this timer to the module's array of static instances. This array is
     * used for timer initialization during Module_startup and in Timer_startup
     * just before main. Dynamic timer instances are initialized and started as
     * part of Timer_create, so they are not included in this array.
     */
    modObj.staticTimers[obj.id] = this;
}

/*
 *  ======== setPeriodMicroSecs ========
 */
function setPeriodMicroSecs(obj, period)
{
    var BIOS = xdc.module('ti.sysbios.BIOS');
    obj.period = Math.floor((BIOS.cpuFreq.lo / 1000000) * period / (obj.prescale + 1));

    if (obj.period > 0xffffffff) {
        return false;
    }
    else {
        return true;
    }
}

/*
 *  ======== viewInitBasic ========
 *  Basic View. This view shows information about the configuration of the
 *  Timer instance.
 */
function viewInitBasic(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var halTimer = xdc.useModule('ti.sysbios.hal.Timer');

    view.halTimerHandle =  halTimer.viewGetHandle(obj.$addr);
    view.label = Program.getShortName(obj.$label);
    view.id = obj.id;
    view.startMode = getEnumString(obj.startMode);
    view.runMode = getEnumString(obj.runMode);
    view.period = obj.period;
    view.periodType = getEnumString(obj.periodType);
    view.prescalar = obj.prescale;
    view.intNum = obj.intNum;
    view.arg = obj.arg;

    view.tickFxn = Program.lookupFuncName(Number(obj.tickFxn));

    view.hwiHandle = "0x" + Number(obj.hwi).toString(16);
}

/*
 *  ======== getEnumString ========
 *  Get the enum value string name, not 0, 1, 2 or 3, etc.  For an enumeration
 *  type property.
 *
 *  Example usage:
 *  if obj contains an enumeration type property "Enum enumProp"
 *
 *  view.enumString = getEnumString(obj.enumProp);
 *
 */
function getEnumString(enumProperty)
{
    /*
     *  Split the string into tokens in order to get rid of the huge package
     *  path that precedes the enum string name. Return the last 2 tokens
     *  concatenated with "_"
     */
    var enumStrArray = String(enumProperty).split(".");
    var len = enumStrArray.length;
    return (enumStrArray[len - 1]);
}

var devices = ["0x0C00", "0x0C08", "0x0C10"];

/*
 *  ======== viewInitDevice ========
 *  Device View. This view shows detailed information about the current state
 *  of each timer device in use.
 */
function viewInitDevice(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var ScalarStructs = xdc.useModule('xdc.rov.support.ScalarStructs');

    view.id = obj.id;
    view.deviceAddr = devices[view.id];
    view.intNum = obj.intNum;

    /*
     * Timer registers
     *   typedef struct TimerRegs {
     *       UInt32      TIM;        // Counter Register
     *       UInt32      PRD;        // Period Register
     *       TCR_BITS    TCR;        // Control Register
     *       UInt16      Reserved;   // reserved space
     *       TPR_BITS    TPR;        // Prescale Register
     *       TPRH_BITS   TPRH;       // Prescale Register
     *   } TimerRegs;
     */

    /*
     * Read in the timer register values. Pass 'false' to disable address
     * check.
     */
    var timerRegs = Program.fetchArray(ScalarStructs.S_UInt32$fetchDesc,
                                       Number(view.deviceAddr), 4, false);

    view.period = timerRegs[1].elem;

    /* Verify device period matches instance period. */
    if (view.period != obj.period) {
        Program.displayError(view, 'period', "Timer device period value: " +
                                             view.period + " does not match " +
                                             "instance period: " + obj.period);
    }

    /*
     * currCount and remainingCount will always have same value. This makes it
     * clear to the user that it counts downward.
     */
    view.currCount = timerRegs[0].elem;
    view.remainingCount = view.currCount;
}
