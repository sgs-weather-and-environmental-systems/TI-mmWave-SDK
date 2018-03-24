/*
 * Copyright (c) 2014-2017, Texas Instruments Incorporated
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
var BIOS = null;
var Hwi = null;
var timers = null;
var ClockFreqs = null;

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
     * instead of an abstract instance
     */
    Timer.common$.fxntab = false;

    Timer.anyMask = (1 << 4) - 1;
    Timer.numTimerDevices = 4;

    /*
     * for newer (non-MSP432P401x) devices, set Timer.defaultDynamic to
     * true; if the application configuration does not specify Clock.tickMode
     * then the default will be Clock.TickMode_PERIODIC on older devices, and
     * Clock.TickMode_DYNAMIC on newer devices
     */
    Program = xdc.module('xdc.cfg.Program');
    if (!Program.cpu.deviceName.match(/MSP432P401/)) {
        Timer.defaultDynamic = true;
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule("ti.sysbios.family.arm.m3.Hwi");
    BIOS = xdc.useModule('ti.sysbios.BIOS');
    ClockFreqs = xdc.useModule('ti.sysbios.family.arm.msp432.ClockFreqs');
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.availMask = (1 << 4) - 1;
    mod.device.length = 4;
    mod.handles.length = 4;

    if (params.anyMask > mod.availMask) {
        Timer.$logError("Incorrect anyMask (" + params.anyMask
            + "). Should be <= " + mod.availMask + ".", Timer);
    }

    mod.device[0].baseAddr = 0x40000000;   /* Timer_TA0 */
    mod.device[0].intNum = 24;
    mod.handles[0] = null;

    mod.device[1].baseAddr = 0x40000400;   /* Timer_TA1 */
    mod.device[1].intNum = 26;
    mod.handles[1] = null;

    mod.device[2].baseAddr = 0x40000800;   /* Timer_TA2 */
    mod.device[2].intNum = 28;
    mod.handles[2] = null;

    mod.device[3].baseAddr = 0x40000C00;   /* Timer_TA3 */
    mod.device[3].intNum = 30;
    mod.handles[3] = null;

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
    obj.staticInst = true;

    if ((id >= Timer.numTimerDevices)) {
        if (id != Timer.ANY) {
            Timer.$logFatal("Invalid Timer ID: " + id
                            + "; the id must be -1, 0, ..., "
                            + (Timer.numTimerDevices - 1), this);
        }
    }

    if (id == Timer.ANY) {
        var mask = Timer.anyMask & modObj.availMask;
        for (var i = 0; i < Timer.numTimerDevices; i++) {
            if (mask & (1 << i)) {
                modObj.availMask &= ~(1 << i);
                obj.id = i;
                break;
            }
        }
    }
    else if (modObj.availMask & (1 << id)) {
        modObj.availMask &= ~(1 << id);
        obj.id = id;
    }

    if (obj.id == undefined) {
        var alist = [];
        var mask = Timer.anyMask & modObj.availMask;
        for (var i = 0; i < Timer.numTimerDevices; i++) {
            if (mask & (1 << i)) {
                alist.push(i);
            }
        }
        var avail = alist.length == 0
            ? "no timers are available"
            : ("the current set of  available timer ids includes: "
               + alist.join(", ") + ", or Timer.ANY (-1)");
        Timer.$logFatal("Timer device id " + id + " is unavailable; "
                        + avail, this);
    }

    if (params.clockSource == Timer.Source_ACLK) {
        obj.controlRegInit = 0x0100 | params.inputDivider;
    }
    else if (params.clockSource == Timer.Source_SMCLK) {
        obj.controlRegInit = 0x0200 | params.inputDivider;
    }
    else if (params.clockSource == Timer.Source_EXTERNAL) {
        obj.controlRegInit = 0x0000 | params.inputDivider;
    }
    else if (params.clockSource == Timer.Source_EXTERNAL_INVERTED) {
        obj.controlRegInit = 0x0300 | params.inputDivider;
    }
    else {
        Timer.$logFatal("Unsupported input clock source: "
                        + params.clockSource, this);
    }
    obj.runMode = params.runMode;
    obj.startMode = params.startMode;
    obj.intNum = modObj.device[obj.id].intNum;
    obj.arg = params.arg;
    obj.tickFxn = tickFxn;

    if (params.extFreq.lo == 0) {
        if (params.clockSource == Timer.Source_ACLK) {
            obj.frequency.lo = ClockFreqs.ACLK;
        }
        else if (params.clockSource == Timer.Source_SMCLK) {
            obj.frequency.lo = ClockFreqs.SMCLK;
        }
    }
    else {
        obj.frequency.lo = params.extFreq.lo;
    }
    obj.frequency.hi = params.extFreq.hi;

    obj.inputDivider = params.inputDivider;
    obj.inputDividerExp = params.inputDividerExp;

    if (params.periodType == Timer.PeriodType_MICROSECS) {
        if (setPeriodMicroSecs(obj, params.period) == false) {
            Timer.$logError("Timer doesn't support configured period.",
                                this, params.period);
        }
    }
    else {
        obj.period = params.period;
    }
    obj.periodType = Timer.PeriodType_COUNTS;

    obj.prevThreshold = 0;
    obj.savedCurrCount = 0;
    obj.rollovers = 0;
    obj.synchronous = params.synchronous;

    if (obj.tickFxn) {
        if (!params.hwiParams) {
            params.hwiParams = new Hwi.Params;
        }
        var hwiParams = params.hwiParams;

        if (Hwi.inUseMeta(obj.intNum) == true) {
            Timer.$logError("Timer interrupt " + obj.intNum +
                                " already in use!", obj);
            return;
        }

        hwiParams.arg = obj.id;

        if ((obj.runMode == Timer.RunMode_CONTINUOUS) ||
            (obj.runMode == Timer.RunMode_DYNAMIC)) {
            if (params.nesting == true) {
                hwiParams.maskSetting = Hwi.MaskingOption_LOWER;
                obj.hwi = Hwi.create(obj.intNum, Timer.periodicNestStub,
                    hwiParams);
            }
            else {
                obj.hwi = Hwi.create(obj.intNum, Timer.periodicStub, hwiParams);
            }
        }
        else {
            if (params.nesting == true) {
                hwiParams.maskSetting = Hwi.MaskingOption_LOWER;
                obj.hwi = Hwi.create(obj.intNum, Timer.oneShotNestStub,
                    hwiParams);
            }
            else {
                obj.hwi = Hwi.create(obj.intNum, Timer.oneShotStub, hwiParams);
            }
        }
    }
    else {
        obj.hwi = null;
    }

    modObj.handles[obj.id] = this;
}

/*
 *  ======== setPeriodMicroSecs ========
 */
function setPeriodMicroSecs(obj, period)
{
    var divider;

    /* set divider based on ID */
    if (obj.inputDivider == Timer.ID_1) {
        divider = 1;
    }
    else if (obj.inputDivider == Timer.ID_2) {
        divider = 2;
    }
    else if (obj.inputDivider == Timer.ID_4) {
        divider = 4;
    }
    else if (obj.inputDivider == Timer.ID_8) {
        divider = 8;
    }

    /* now factor in IDEX */
    divider *= (obj.inputDividerExp + 1);

    var clockRate = (obj.frequency.lo / divider) + (obj.frequency.hi << 32);

    obj.period = Math.floor((period * clockRate) / 1000000);

    if (obj.period > 0xffff) {
        return false;
    }
    else {
        return true;
    }
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

/*
 *  ======== viewInitBasic ========
 *  Initialize the 'Basic' Timer instance view.
 */
function viewInitBasic(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var halTimer = xdc.useModule('ti.sysbios.hal.Timer');

    view.halTimerHandle =  halTimer.viewGetHandle(obj.$addr);
    view.label      = Program.getShortName(obj.$label);
    view.id         = obj.id;

    view.runMode    = getEnumString(obj.runMode);
    view.startMode  = getEnumString(obj.startMode);
    view.periodType = getEnumString(obj.periodType);
    view.period     = obj.period;
    view.intNum     = obj.intNum;
    view.synchronous = obj.synchronous;

    view.tickFxn    = Program.lookupFuncName(Number(obj.tickFxn));
    view.arg        = obj.arg;
    view.frequency  = obj.frequency.lo;

    view.hwiHandle  = "0x" + Number(obj.hwi).toString(16);
}

/*
 *  ======== viewInitDevice ========
 */
function viewInitDevice(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var tNames = ["Timer_A0", "Timer_A1", "Timer_A2", "Timer_A3"];

    view.device = tNames[obj.id];

    try {
        var timerRawView = Program.scanRawView('ti.sysbios.family.arm.msp432.Timer');
    }
    catch (e) {
        Program.displayError(view, 'devAddr', "Caught exception retrieving Timer state: " + e);
        return;
    }

    var device = Program.fetchArray(timerRawView.modState.device$fetchDesc,
                                    timerRawView.modState.device,
                                    timerRawView.modCfg.numTimerDevices);

    view.devAddr    = "0x" + Number(device[obj.id].baseAddr).toString(16);

    var TMR = Program.fetchArray(
        {   type: 'xdc.rov.support.ScalarStructs.S_UInt16',
            isScalar: true
        },
        Number(view.devAddr), 10, false);

    view.period = obj.period;
    view.currCount = view.period - (TMR[9] - TMR[8]);
    view.remainingCount = TMR[9] - TMR[8]; /* compare - count */

    switch (TMR[0] & 0x0300) {
        case 0x0000:
            view.clockSource = "EXT";
            break;
        case 0x0100:
            view.clockSource = "ACLK";
            break;
        case 0x0200:
            view.clockSource = "SMCLK";
            break;
        case 0x0300:
            view.clockSource = "EXT_INV";
            break;
    }

    view.id         = obj.id;
    view.intNum     = obj.intNum;
    view.runMode    = getEnumString(obj.runMode);

    view.prevThreshold = obj.prevThreshold;

    if (TMR[1] & 0x0010) {
        view.state = "Enabled";
    }
    else {
        view.state = "Disabled";
    }
}

/*
 *  ======== viewInitModule ========
 *  Initialize the Timer 'Module' view.
 */
function viewInitModule(view, obj)
{
    view.availMask = Number(obj.availMask).toString(2);
}
