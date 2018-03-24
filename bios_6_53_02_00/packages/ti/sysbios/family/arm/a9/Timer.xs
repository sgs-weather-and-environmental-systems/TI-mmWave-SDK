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
 *  ======== Timer.xs ========
 */

var Timer = null;
var Hwi = null;
var BIOS = null;

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "OMAP4430": {
            privTimerRegBaseAddress  : 0x48240600,
        }
    };

    deviceTable["AM437X"] = deviceTable["OMAP4430"];
}

/*
 *  ======== deviceSupportCheck ========
 *  Check validity of device
 */
function deviceSupportCheck()
{
    /* look for exact match first */
    for (device in deviceTable) {
        if (device == Program.cpu.deviceName) {
            return device;
            }
    }

    /* now look for a wildcard match */
    for (device in deviceTable) {
        if (Program.cpu.deviceName.match(device)) {
            return device;
            }
    }

    /*
     * no match, print all catalog devices supported
     * and then raise an error
     */
    var catalog = xdc.loadPackage(Program.cpu.catalogName);

    /* build associative array of supported devices */
    var supportedDevices = new Object();

    for (var i = 0; i < catalog.$modules.length; i++) {
        catalogName =
        catalog.$modules[i].$name.substring(Program.cpu.catalogName.length+1);
        for (device in deviceTable) {
            if (catalogName.match(device)) {
                supportedDevices[catalogName] = catalogName;
            }
        }
    }

    /* copy it into a sortable array */
    var sd = new Array();

    for (var i in supportedDevices) {
        sd[sd.length++] = i;
    }

    /* sort it for a nicer report */
    sd.sort();

    print(
            "The " +
            Program.cpu.deviceName +
            " device is not currently supported."
         );

    print(
            "The following devices are supported for the " +
            Program.build.target.name +
            " target:"
         );

    for (var i = 0; i < sd.length; i++) {
        print("\t" + sd[i]);
    }

    throw new Error ("Unsupported device!");
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

    Timer = this;

    /*
     * set fxntab to false because ti.sysbios.hal.Timer can be used
     * instead of an abstract intsance
     */
    Timer.common$.fxntab = false;

    Timer.intNumDef = 29;
    Timer.privTimerRegBaseAddress = deviceTable[device].privTimerRegBaseAddress;

    var GetSet = xdc.module("xdc.services.getset.GetSet");
    GetSet.onSet(this, "availMask", _setTimerAvailMask);
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule('ti.sysbios.family.arm.gic.Hwi');
    BIOS = xdc.useModule('ti.sysbios.BIOS');

    var device = deviceSupportCheck();
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.availMask = Timer.availMask;

    if (params.anyMask > mod.availMask) {
        Timer.$logError("Incorrect anyMask (" + params.anyMask
            + "). Should be <= " + mod.availMask + ".", Timer, "anyMask");
    }

    mod.handle = null;

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
        if (Timer.anyMask && modObj.availMask) {
            modObj.availMask = 0;
        }
        else {
            Timer.$logFatal("Timer device unavailable.", this);
        }
    }
    else if (modObj.availMask) {
        modObj.availMask = 0;
    }
    else {
        Timer.$logFatal("Timer device unavailable.", this);
    }

    obj.runMode       = params.runMode;
    obj.startMode     = params.startMode;
    obj.periodType    = params.periodType;
    obj.intNum        = Timer.intNumDef;
    obj.arg           = params.arg;
    obj.tickFxn       = tickFxn;
    obj.extFreq.lo    = params.extFreq.lo;
    obj.extFreq.hi    = params.extFreq.hi;
    obj.period        = params.period;
    obj.prescale      = params.prescale;

    if (obj.tickFxn) {
        if (!params.hwiParams) {
            params.hwiParams = new Hwi.Params();
        }
        var hwiParams = params.hwiParams;

        if (Hwi.inUseMeta(obj.intNum) == true) {
            Timer.$logError("Timer interrupt " + obj.intNum +
                    " already in use!", obj);
            return;
        }

        if (hwiParams.type == Hwi.Type_IRQ) {
            hwiParams.arg = this;
            obj.hwi = Hwi.create(obj.intNum, Timer.stub, hwiParams);
        }
    }
    else {
        obj.hwi = null;
    }

    modObj.handle = this;
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

    view.halTimerHandle = halTimer.viewGetHandle(obj.$addr);
    view.label          = Program.getShortName(obj.$label);
    view.startMode      = getEnumString(obj.startMode);
    view.runMode        = getEnumString(obj.runMode);
    view.period         = "0x" + Number(obj.period).toString(16);
    view.periodType     = getEnumString(obj.periodType);
    view.prescale       = "0x" + Number(obj.prescale).toString(16);
    view.intNum         = obj.intNum;
    view.tickFxn        = Program.lookupFuncName(Number(obj.tickFxn));
    view.arg            = obj.arg;

    view.extFreq        =
        Number(obj.extFreq.lo + (obj.extFreq.hi << 32)).toString(10);

    view.hwiHandle      = "0x" + Number(obj.hwi).toString(16);
}

/*
 *  ======== viewInitDevice ========
 *  Initialize the Timer 'Device' view.
 */
function viewInitDevice(view, obj)
{
    var counterValue, loadValue, prescale;
    var modCfg = Program.getModuleConfig('ti.sysbios.family.arm.a9.Timer');

    view.deviceAddr     = "0x" +
        Number(modCfg.privTimerRegBaseAddress).toString(16);
    view.intNum         = obj.intNum;

    try {
        counterValue    = Program.fetchArray(
                            {
                                type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                                isScalar: true
                            },
                            (modCfg.privTimerRegBaseAddress + 0x4), 1, false);
        loadValue       = Program.fetchArray(
                            {
                                type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                                isScalar: true
                            },
                            modCfg.privTimerRegBaseAddress, 1, false);
        prescale        = Program.fetchArray(
                            {
                                type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                                isScalar: true
                            },
                            (modCfg.privTimerRegBaseAddress + 0x8), 1, false);
    }
    catch (e) {
        print("Error: Problem fetching Timer Registers: " + e.toString());
    }

    view.period         = "0x" + Number(loadValue).toString(16);
    view.currCount      = "0x" + Number(loadValue - counterValue).toString(16);
    view.remainingCount = "0x" + Number(counterValue).toString(16);
    view.prescale       = "0x" + Number((prescale & 0xFF00) >>> 8).toString(16);
}

/*
 *  ======== _setTimerAvailMask ========
 *  The "real-time" setter setTimerAvailMask function
 *
 *  This function is called whenever availMask changes.
 */
function _setTimerAvailMask(field, val)
{
    if ((val != 0) && (val != 1)) {
        this.$logFatal("Invalid availMask " + val + ". This module manages " +
                "a single timer and valid availMask values are 0 or 1.",
                DMTimer);
    }
}
