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
 *  ======== Timer.xs ========
 *
 */

var Program = xdc.module('xdc.cfg.Program');

var Timer = null;
var Hwi = null;
var CTM = null;
var BIOS = null;

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
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule("ti.sysbios.family.arp32.Hwi");
    CTM = xdc.useModule("ti.sysbios.family.arp32.CTM");
    BIOS = xdc.useModule('ti.sysbios.BIOS');
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{

    /* availMask has 2 bits set for the 2 timers */
    mod.availMask = 0x3;

    if (params.anyMask > 3) {
        Timer.$logError("Incorrect anyMask (" + params.anyMask
            + "). Should be <= " + mod.availMask + ".", Timer, "anyMask");
    }

    for (var i = 0; i < Timer.NUM_TIMER_DEVICES; i++) {
        mod.handles[i] = null;
    }

    /* this is added here based on simulator */
    mod.baseAddr = $addr(0x40085000);

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

    if ((id >= Timer.NUM_TIMER_DEVICES)) {
        if (id != Timer.ANY) {
            Timer.$logFatal("Invalid Timer ID " + id + "!", this);
        }
    }

    if (id == Timer.ANY) {
        for (var i = 0; i < Timer.NUM_TIMER_DEVICES; i++) {
            if ((Timer.anyMask & (1 << i)) && (modObj.availMask & (1 << i))) {
                var period = checkPeriod(i, params);

                modObj.availMask &= ~(1 << i);
                obj.id = i;
                obj.period = period;
                obj.periodType = Timer.PeriodType_COUNTS;
                break;
            }
        }
    }
    else if (modObj.availMask & (1 << id)) {
        var period = checkPeriod(id, params);

        modObj.availMask &= ~(1 << id);
        obj.id = id;
        obj.period = period;
        obj.periodType = Timer.PeriodType_COUNTS;
    }

    if (obj.id == undefined) {
        if (modObj.availMask == 0) {
            Timer.$logFatal("No Timer devices available.", this);
        }
        else {
            Timer.$logFatal("No Timers support chosen period.",
                            this, params.period);
        }
    }

    /* if timer id == 0 */
    if (obj.id == 0) {
        obj.ctmid = 0;      /* not used, but must be initialized */
        obj.intNum = 17;
    }
    else if (obj.id == 1) {
        obj.ctmid = 1;
        obj.intNum = 18;
    }

    obj.runMode = params.runMode;
    obj.startMode = params.startMode;
    obj.extFreq.lo = params.extFreq.lo;
    obj.extFreq.hi = params.extFreq.hi;
    obj.arg = params.arg;
    obj.tickFxn = tickFxn;

    if (obj.tickFxn) {
        if (!params.hwiParams) {
            params.hwiParams = new Hwi.Params;
        }

        var hwiParams = params.hwiParams;

        /* CTM doesn't need to be acknowledged, no stub required */
        hwiParams.arg = obj.arg;
        obj.hwi = Hwi.create(obj.intNum, obj.tickFxn, hwiParams);
    }
    else {
        obj.hwi = null;
    }

    modObj.handles[obj.id] = this;
}

/*
 *  ======== checkPeriod ========
 *  Make sure we can support the period which is specified in the params.
 */
function checkPeriod(timerNum, params)
{
    var period, freq;

    if (params.extFreq.lo) {
        freq = (params.extFreq.hi << 32) + params.extFreq.lo;
        freq /= 1000000;        /* convert to MHz */
    }
    else {
        freq = BIOS.cpuFreq.lo / 1000000;   /* freq in MHz */
    }

    /* make sure we are not creating a periodic timer with 0 period */
    if ((params.period == 0) && (params.runMode != Timer.RunMode_ONESHOT)) {
        Timer.$logFatal("Cannot create a periodic Timer with a period of 0",
                         Timer, params.runMode);
    }

    if (params.periodType == Timer.PeriodType_COUNTS) {
        period = params.period;
    }
    else {
        period = Math.floor(freq * params.period);
    }

    if (period > 0xffffffff) {          /* CTM is 32 bits */
        Timer.$logFatal("Specified period is too big and cannot be supported!",
                         Timer, params.period)
    }
    else {
        return (period);
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
    view.label       = Program.getShortName(obj.$label);
    view.id          = obj.id;
    view.device      = view.id == 0 ? "CTM[0]" : "CTM[1]";
    view.runMode     = getEnumString(obj.runMode);
    view.startMode   = getEnumString(obj.startMode);
    view.periodType  = getEnumString(obj.periodType);
    view.period      = obj.period;
    view.intNum      = obj.intNum;
    view.tickFxn     = Program.lookupFuncName(Number(obj.tickFxn));
    view.arg         = obj.arg;
    view.extFreq     = Number(obj.extFreq.lo).toString(10);
    view.hwiHandle   = "0x" + Number(obj.hwi).toString(16);
}

/*
 *  ======== viewInitDevice ========
 */
function viewInitDevice(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');

    view.id         = obj.id;
    view.device     = view.id == 0 ? "CTM[0]" : "CTM[1]";
    view.intNum     = obj.intNum;
    view.runMode    = getEnumString(obj.runMode);
    view.devAddr    = "0x40085000";

    var CTM_TINTVLR = Program.fetchArray(
        {   type: 'xdc.rov.support.ScalarStructs.S_UInt32',
            isScalar: true
        },
        0x40085040, 2, false);

    var CTM_CTCNTR  = Program.fetchArray(
        {   type: 'xdc.rov.support.ScalarStructs.S_UInt32',
            isScalar: true
        },
        0x40085180, 2, false);

    view.period     = CTM_TINTVLR[obj.ctmid];
    view.currCount  = CTM_CTCNTR[obj.ctmid];
    view.remainingCount = view.period - view.currCount;
}

/*
 *  ======== viewInitModule ========
 *  Initialize the Timer 'Module' view.
 */
function viewInitModule(view, obj)
{
    view.availMask = Number(obj.availMask).toString(2);
}

