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
var Core = null;
var BIOS = null;

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "TMS320C6A8168": {
        },
    };
}

/*
 * ======== getCFiles ========
 * return the array of C language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getCFiles(targetName)
{
    if (BIOS.smpEnabled) {
        return (["Timer_smp.c"]);
    }
    else {
        return (["Timer.c"]);
    }
}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    /* provide getCFiles() for Build.getCFiles() */
    this.$private.getCFiles = getCFiles;

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
    Hwi = xdc.useModule("ti.sysbios.family.arm.m3.Hwi");
    CTM = xdc.useModule("ti.sysbios.family.arm.ducati.CTM");
    Core = xdc.useModule("ti.sysbios.family.arm.ducati.Core");
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
                if (period |= 0) {
                    modObj.availMask &= ~(1 << i);
                    obj.id = i;
                    obj.period = period;
                    obj.periodType = Timer.PeriodType_COUNTS;
                    break;
                }
            }
        }
    }
    else if (modObj.availMask & (1 << id)) {
        var period = checkPeriod(id, params);
        if (period != 0) {
            modObj.availMask &= ~(1 << id);
            obj.id = id;
            obj.period = period;
            obj.periodType = Timer.PeriodType_COUNTS;
        }
        else {
            Timer.$logFatal("Timer id " + id + " does not support the period chosen.", 
                            this, params.period)
        }
    }
    else {
        Timer.$logFatal("Timer id " + id + " is in use.", this);
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

    if (BIOS.smpEnabled == true) {
        /* SMP uses both CTM timers */
        if (obj.id == 0) {
            obj.ctmid = 0;
            obj.intNum = 18;
        }
        else {
            obj.ctmid = 1;
            obj.intNum = 22;
        }
    }
    else {
        /* if timer id == 0, use systick */
        if (obj.id == 0) {
            obj.ctmid = 0;          /* not used, but must be initialized */
            obj.intNum = 15;
        }
        /* if timer id == 1, must select which CTM timer based on core id */
        else {
            if (Core.id == 0) {
                obj.ctmid = 0;      /* core 0 uses ctcr 0 */
                obj.intNum = 18;
            }
            else {
                obj.ctmid = 1;      /* core 1 uses ctcr 1 */
                obj.intNum = 22;
            }
        }
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

        if (Hwi.inUseMeta(obj.intNum) == true) {
            Timer.$logError("Timer interrupt " + obj.intNum + 
                            " already in use!", obj);
            return;
        }

        if (BIOS.smpEnabled == true) {
            /* CTM doesn't need to be acknowledged, no stub required */        
            hwiParams.arg = obj.arg;
            obj.hwi = Hwi.create(obj.intNum, obj.tickFxn, hwiParams);
        }
        else {
            /* SysTick needs to be acknowledged, use stub functions */
            if (obj.id == 0) {
                hwiParams.arg = this;

                if (obj.runMode == Timer.RunMode_CONTINUOUS) {
                    obj.hwi = Hwi.create(obj.intNum, Timer.periodicStub, hwiParams);
                }
                else {
                    obj.hwi = Hwi.create(obj.intNum, Timer.oneShotStub , hwiParams);
                }
            }
            /* CTM doesn't need to be acknowledged, no stub required */        
            else {
                hwiParams.arg = obj.arg;
                obj.hwi = Hwi.create(obj.intNum, obj.tickFxn, hwiParams);
            }
        }
    }
    else {
        obj.hwi = null;
    }

    modObj.handles[obj.id] = this;
}

/*
 *  ======== checkPeriod ========
 *  confirm that selected period works with selected timerNum
 *  return calculated period if so.
 *  returns 0 if not.
 */
function checkPeriod(timerNum, params)
{
    var period, freq;

    if (BIOS.smpEnabled == true) {
        return (smpCheckPeriod(timerNum, params));
    }

    if (params.extFreq.lo) {
        freq = (params.extFreq.hi << 32) + params.extFreq.lo;
        freq /= 1000000;                /* convert to MHz */
    }
    else {
        freq = BIOS.cpuFreq.lo / 1000000; /* freq in MHz */
        if (timerNum == 1) {
            freq *= 2;                  /* CTM is 2 x CPU */
        }
    }

    if (params.periodType == Timer.PeriodType_COUNTS) {
        period = params.period;
    }
    else {
        period = Math.floor(freq * params.period);
    }

    if (timerNum == 0) {
        if (period > 0xffffff) {   /* SysTick is 24 bits */
            return 0;
        }
        else {
            return period;
        }
    }
    else {
        if (period > 0xffffffff) {  /* CTM is 32 bits */
            return 0;
        }
        else {
            return period;
        }
    }
}

function smpCheckPeriod(timerNum, params)
{
    var period, freq;

    if (params.extFreq.lo) {
        freq = (params.extFreq.hi << 32) + params.extFreq.lo;
        freq /= 1000000;                /* convert to MHz */
    }
    else {
        freq = BIOS.cpuFreq.lo / 1000000;   /* freq in MHz */
        freq *= 2;                  /* CTM is 2 x CPU */
    }

    if (params.periodType == Timer.PeriodType_COUNTS) {
        period = params.period;
    }
    else {
        period = Math.floor(freq * params.period);
    }

    if (period > 0xffffffff) {  /* CTM is 32 bits */
        return 0;
    }
    else {
        return period;
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
    var BIOS = xdc.useModule('ti.sysbios.BIOS');
    var BIOSCfg = Program.getModuleConfig(BIOS.$name);

    view.halTimerHandle =  halTimer.viewGetHandle(obj.$addr);
    view.label       = Program.getShortName(obj.$label);
    view.id          = obj.id;

    if (BIOSCfg.smpEnabled == true) {
        view.device      = obj.ctmid == 0 ? "CTM[0]" : "CTM[1]";
    }
    else {
        view.device      = view.id == 0 ? "SysTick"
                                        : obj.ctmid == 0 ? "CTM[0]" 
                                        : "CTM[1]";
    }

    view.runMode     = getEnumString(obj.runMode);
    view.startMode   = getEnumString(obj.startMode);
    view.periodType  = getEnumString(obj.periodType);
    view.period      = obj.period;
    view.intNum      = obj.intNum;

    view.tickFxn     = Program.lookupFuncName(Number(obj.tickFxn));
    view.arg         = obj.arg;

    view.extFreq    = Number(obj.extFreq.lo).toString(10);

    view.hwiHandle   = "0x" + Number(obj.hwi).toString(16);
}

/*
 *  ======== viewInitDevice ========
 */
function viewInitDevice(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var BIOS = xdc.useModule('ti.sysbios.BIOS');
    var BIOSCfg = Program.getModuleConfig(BIOS.$name);

    view.id          = obj.id;

    if (BIOSCfg.smpEnabled == true) {
        return (viewInitDeviceSmp(view, obj));
    }

    view.intNum = obj.intNum;

    view.runMode     = getEnumString(obj.runMode);

    if (view.id == 0) { /* SysTick */
        view.devAddr = "0xe000e010";
        var Systick = Program.fetchArray(
            {   type: 'xdc.rov.support.ScalarStructs.S_UInt32', 
                isScalar: true
            }, 
            0xe000e010, 4, false);
        view.period = Systick[1];
        if (getEnumString(obj.runMode) == "RunMode__CONTINUOUS") {
            view.period += 1;
        }
        view.currCount = Systick[2];
        view.remainingCount = view.currCount;
    }
    else {      /* CTM */
        view.devAddr = "0x40000400";
        var CTM_TINTVLR = Program.fetchArray(
            {   type: 'xdc.rov.support.ScalarStructs.S_UInt32', 
                isScalar: true
            }, 
            0x40000440, 2, false);
        var CTM_CTCNTR = Program.fetchArray(
            {   type: 'xdc.rov.support.ScalarStructs.S_UInt32', 
                isScalar: true
            }, 
            0x40000580, 2, false);
        view.period = CTM_TINTVLR[obj.ctmid];
        view.currCount = CTM_CTCNTR[obj.ctmid];
        view.remainingCount = view.period - view.currCount;
    }
}

/*
 *  ======== viewInitDeviceSmp ========
 */
function viewInitDeviceSmp(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');

    view.id          = obj.id;

    view.device      = obj.ctmid == 0 ? "CTM[0]" : "CTM[1]";

    view.intNum = obj.intNum;

    view.runMode     = getEnumString(obj.runMode);

    view.devAddr = "0x40000400";
    var CTM_TINTVLR = Program.fetchArray(
        {   type: 'xdc.rov.support.ScalarStructs.S_UInt32', 
            isScalar: true
        }, 
        0x40000440, 2, false);
    var CTM_CTCNTR = Program.fetchArray(
        {   type: 'xdc.rov.support.ScalarStructs.S_UInt32', 
            isScalar: true
        }, 
        0x40000580, 2, false);
    view.period = CTM_TINTVLR[obj.ctmid];
    view.currCount = CTM_CTCNTR[obj.ctmid];
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

