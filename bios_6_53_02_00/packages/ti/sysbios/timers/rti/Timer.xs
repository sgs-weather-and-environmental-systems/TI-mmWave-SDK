/*
 * Copyright (c) 2015-2017, Texas Instruments Incorporated
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

var Hwi = null;
var BIOS = null;
var Core = null;
var Timer = null;
var device;
var catalogName = null;

if (xdc.om.$name == "cfg" || typeof(genCdoc) != "undefined") {
    var deviceTable = {
        "ti.catalog.arm.cortexr4": {
            "RM48L.*": {
                timer : [
                    {
                        name: "RTI Timer0",
                        baseAddr: 0xFFFFFC00,
                        intNum: 2,
                        eventId: -1,
                        intFreqDivFactor: 2
                    },
                    {
                        name: "RTI Timer1",
                        baseAddr: 0xFFFFFC00,
                        intNum: 3,
                        eventId: -1,
                        intFreqDivFactor: 2
                    }
                ]
            },
            "AWR14XX": {
                timer : [
                    {
                        name: "RTI Timer0",
                        baseAddr: 0xFFFFFC00,
                        intNum: 2,
                        eventId: -1,
                        intFreqDivFactor: 1
                    },
                    {
                        name: "RTI Timer1",
                        baseAddr: 0xFFFFFC00,
                        intNum: 3,
                        eventId: -1,
                        intFreqDivFactor: 1
                    }
                ]
            }
        },
        "ti.catalog.arm.cortexr5": {
            "RM57L8.*": {
                timer : [
                    {
                        name: "RTI Timer0",
                        baseAddr: 0xFFFFFC00,
                        intNum: 2,
                        eventId: -1,
                        intFreqDivFactor: 2
                    },
                    {
                        name: "RTI Timer1",
                        baseAddr: 0xFFFFFC00,
                        intNum: 3,
                        eventId: -1,
                        intFreqDivFactor: 2
                    }
                ]
            },
        },
        "ti.catalog.c6000": {
            "AWR16XX": {
                timer : [
                    {
                        name: "RTI2 Timer0",
                        baseAddr: 0x02020000,
                        intNum: 14,
                        eventId: 75,
                        intFreqDivFactor: 3
                    },
                    {
                        name: "RTI2 Timer1",
                        baseAddr: 0x02020000,
                        intNum: 15,
                        eventId: 76,
                        intFreqDivFactor: 3
                    }
                ]
            }
        }
    };

    deviceTable["ti.catalog.arm.cortexr4"]["AWR16XX"] =
        deviceTable["ti.catalog.arm.cortexr4"]["AWR14XX"];
    deviceTable["ti.catalog.arm.cortexr4"]["IWR14XX"] =
        deviceTable["ti.catalog.arm.cortexr4"]["AWR14XX"];
    deviceTable["ti.catalog.arm.cortexr4"]["IWR16XX"] =
        deviceTable["ti.catalog.arm.cortexr4"]["AWR14XX"];

    deviceTable["ti.catalog.c6000"]["IWR16XX"] =
        deviceTable["ti.catalog.c6000"]["AWR16XX"];
}

/*
 *  ======== deviceSupportCheck ========
 *  Check validity of device
 */
function deviceSupportCheck()
{
    /* look for exact match first */
    for (device in deviceTable[catalogName]) {
        if (device == Program.cpu.deviceName) {
            return (deviceTable[catalogName][device].timer);
        }
    }

    /* now look for a wildcard match */
    for (device in deviceTable[catalogName]) {
        if (Program.cpu.deviceName.match(device)) {
            return (deviceTable[catalogName][device].timer);
        }
    }

    return (null);
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

    catalogName = Program.cpu.catalogName;

    device = deviceSupportCheck();

    Timer.intFreqs.length = device.length;
    Timer.numTimerDevices = device.length;
    Timer.timerSettings.length = device.length;
    Timer.anyMask = (1 << device.length) - 1;

    for (var i=0; i < device.length; i++) {
        Timer.timerSettings[i].baseAddr = $addr(device[i].baseAddr);
        Timer.timerSettings[i].intNum = device[i].intNum;
        Timer.timerSettings[i].eventId = device[i].eventId;
        Timer.timerSettings[i].name = device[i].name;
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule('ti.sysbios.hal.Hwi');

    device = deviceSupportCheck();

    if (device == null) {
        print("The " + Program.cpu.deviceName +
            " device is not currently supported.");
        print("The following devices are supported for the " +
            Program.build.target.name + " target:");
        for (device in deviceTable[catalogName]) {
                print("\t" + device);
        }
        throw new Error ("Unsupported device!");
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    BIOS = xdc.module('ti.sysbios.BIOS');

    mod.availMask = (1 << Timer.numTimerDevices) - 1;

    if (params.anyMask > mod.availMask) {
        Timer.$logError("Incorrect anyMask (" + params.anyMask
            + "). Should be <= " + mod.availMask + ".", Timer, "anyMask");
    }

    mod.device.length = Timer.numTimerDevices;
    mod.intFreqs.length = Timer.numTimerDevices;
    mod.handles.length = Timer.numTimerDevices;
    for (var i = 0; i < Timer.numTimerDevices; i++) {
        mod.device[i].baseAddr = Timer.timerSettings[i].baseAddr;
        mod.device[i].intNum = Timer.timerSettings[i].intNum;
        mod.device[i].eventId = Timer.timerSettings[i].eventId;

        if (Timer.intFreqs[i].lo == undefined) {
            mod.intFreqs[i].lo = BIOS.cpuFreq.lo / device[i].intFreqDivFactor;
            mod.intFreqs[i].hi = BIOS.cpuFreq.hi;
        }
        else {
            /* set the frequency for each Timer */
            mod.intFreqs[i].lo = Timer.intFreqs[i].lo;
            mod.intFreqs[i].hi = Timer.intFreqs[i].hi;
        }

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

    if ((id >= Timer.numTimerDevices)) {
        if (id != Timer.ANY) {
            Timer.$logFatal("Invalid Timer ID " + id + "!", this);
        }
    }

    if (id == Timer.ANY) {
        for (var i = 0; i < Timer.numTimerDevices; i++) {
            if ((Timer.anyMask & (1 << i)) && (modObj.availMask & (1 << i))) {
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
        Timer.$logFatal("Timer device unavailable.", this);
    }

    obj.runMode = params.runMode;
    obj.startMode = params.startMode;
    obj.prescale = params.prescale;
    obj.period = params.period;
    obj.periodType = params.periodType;
    obj.intNum = Timer.timerSettings[obj.id].intNum;
    obj.arg = params.arg;
    obj.tickFxn = tickFxn;
    obj.extFreq.lo = params.extFreq.lo;
    obj.extFreq.hi = params.extFreq.hi;
    obj.createHwi = params.createHwi;

    if (obj.tickFxn && obj.createHwi) {
        if (!params.hwiParams) {
            params.hwiParams = new Hwi.Params();
        }

        var hwiParams = params.hwiParams;
        hwiParams.eventId = Timer.timerSettings[obj.id].eventId;

        if (obj.runMode == Timer.RunMode_ONESHOT) {
            if (hwiParams.maskSetting == Hwi.MaskingOption_NONE) {
                Timer.$logFatal("Mask in hwiParams cannot" +
                    "enable self.", this);
            }
        }

        hwiParams.arg = this;

        if (obj.runMode == Timer.RunMode_CONTINUOUS) {
            obj.hwi = Hwi.create(obj.intNum, Timer.periodicStub, hwiParams);
        }
        else {
            obj.hwi = Hwi.create(obj.intNum, Timer.oneShotStub , hwiParams);
        }
    }
    else {
        obj.hwi = null;
    }

    modObj.handles[obj.id] = this;
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
 *  Initialize the 'Basic' Timer view.
 */
function viewInitBasic(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var halTimer = xdc.useModule('ti.sysbios.hal.Timer');
    var Timer = xdc.useModule('ti.sysbios.timers.rti.Timer');

    /* Scan the raw view in order to obtain the module state. */
    var biosRawView;

    try {
        biosRawView = Program.scanRawView('ti.sysbios.BIOS');
    }
    catch (e) {
        this.$logWarning("Caught exception while retrieving raw view: " + e,
                this);
    }

    /* Get the module state */
    var biosMod = biosRawView.modState;

    /* Get the Timer module config to get the number of timer devices. */
    var modCfg = Program.getModuleConfig('ti.sysbios.timers.rti.Timer');

    var numTimers = modCfg.numTimerDevices;

    /*
     * Retrieve the raw view to get at the module state.
     * This should just return, we don't need to catch exceptions.
     */
    var rawView = Program.scanRawView('ti.sysbios.timers.rti.Timer');

    var deviceObj = Program.fetchArray(rawView.modState.device$fetchDesc,
            rawView.modState.device, numTimers);

    var timerHandlesAddr = rawView.modState.handles;
    var intFreqsAddr = rawView.modState.intFreqs;

    var ScalarStructs = xdc.useModule('xdc.rov.support.ScalarStructs');

    /* Retrieve the array of timer handles */
    var timerHandles = Program.fetchArray(ScalarStructs.S_Ptr$fetchDesc,
                                          timerHandlesAddr, numTimers);

    /* Retrieve the array of timer frequencies */
    var intFreqs = Program.fetchArray(rawView.modState.intFreqs$fetchDesc,
                        rawView.modState.intFreqs, numTimers);

    /*
     * Scan the timerHandles array for non-zero Timer handles
     */
    for (var i = 0; i < numTimers; i++) {
        var timerHandle = timerHandles[i];
        if (Number(timerHandle.elem) != 0) {
            /* Retrieve the embedded instance */
            var obj = Program.fetchStruct(Timer.Instance_State$fetchDesc,
                                          timerHandle.elem);
            var elem = Program.newViewStruct(
                            'ti.sysbios.timers.rti.Timer',
                            'Basic');

            if ((obj.__name != undefined) && obj.__name) {
                elem.label      = Program.fetchString(obj.__name, true);
            }

            var timerFreq;
            if (obj.extFreq.lo) {
                timerFreq = (obj.extFreq.lo) / (obj.prescale + 1);
            }
            else {
                timerFreq = (intFreqs[obj.id].lo) / (obj.prescale + 1);
            }

            var freqKHz = timerFreq / 1000;
            if (obj.periodType == Timer.PeriodType_COUNTS) {
                elem.periodInCounts = obj.period;
                elem.periodInMicroSecs = (obj.period * 1000) / (freqKHz);
            }
            else {
                elem.periodInMicroSecs = obj.period;
                elem.periodInCounts = (freqKHz * obj.period) / 1000;
            }

            elem.halTimerHandle = halTimer.viewGetHandle(obj.$addr);
            elem.id             = obj.id;
            elem.name           = modCfg.timerSettings[obj.id].name;
            elem.startMode      = getEnumString(obj.startMode);
            elem.runMode        = getEnumString(obj.runMode);
            elem.intNum         = obj.intNum;
            elem.tickFxn        = Program.lookupFuncName(Number(obj.tickFxn));
            elem.arg            = obj.arg;
            elem.extFreq        =
                Number(obj.extFreq.lo / (obj.prescale + 1)).toString(10);

            var device = Program.fetchStruct(rawView.modState.device$fetchDesc,
                deviceObj[obj.id].$addr);
            elem.eventId = Number(device.eventId);

            if (obj.createHwi) {
                elem.hwiHandle  = "0x" + Number(obj.hwi).toString(16);
            }
            else {
                elem.hwiHandle = "Timer Hwi create disabled";
            }

            /* Add the element to the list. */
            view.elements.$add(elem);
        }
    }
}

/*
 *  ======== viewInitDevice ========
 */
function viewInitDevice(view, obj)
{
    var deviceRegs;
    var Program = xdc.useModule('xdc.rov.Program');
    var Timer = xdc.useModule('ti.sysbios.timers.rti.Timer');
    var modCfg = Program.getModuleConfig('ti.sysbios.timers.rti.Timer');
    var timerRawView = Program.scanRawView('ti.sysbios.timers.rti.Timer');
    var modState = timerRawView.modState;

    view.id          = obj.id;
    view.device      = "timer"+view.id;
    view.intNum      = obj.intNum;
    view.runMode     = getEnumString(obj.runMode);

    var deviceObj = Program.fetchArray(modState.device$fetchDesc,
            modState.device, modCfg.numTimerDevices);

    var device = Program.fetchStruct(modState.device$fetchDesc,
            deviceObj[obj.id].$addr);

    view.devAddr = "0x" + Number(device.baseAddr).toString(16);

    try {
        if (deviceRegs === undefined) {
            deviceRegs = Program.fetchStruct(
                            Timer.DeviceRegs$fetchDesc,
                            device.baseAddr,
                            false
                         );
        }
    }
    catch (e) {
        print("Error: Problem fetching Timer Registers: " + e.toString());
    }

    if (view.id & 0x1) {
        /* udcp1 */
        view.period = deviceRegs.RTIUDCP1;

        /* gctrl */
        if (deviceRegs.RTIGCTRL & 2) {
            view.state = "Enabled";
        }
        else {
            view.state = "Disabled";
        }
    }
    else {
        /* udcp0 */
        view.period = deviceRegs.RTIUDCP0;

        /* gctrl */
        if (deviceRegs.RTIGCTRL & 1) {
            view.state = "Enabled";
        }
        else {
            view.state = "Disabled";
        }
    }
}

/*
 *  ======== viewInitModule ========
 *  Initialize the Timer 'Module' view.
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Timer = Program.getModuleConfig('ti.sysbios.timers.rti.Timer');
    var numTimers = Timer.numTimerDevices;

    // construct "intFrequency" ROV field
    var intFreqs =
        Program.fetchArray(obj.intFreqs$fetchDesc, obj.intFreqs, numTimers);

    for (var i = 0; i < numTimers; i++) {
        // combine high and low frequency values into a single value
        view.intFrequency.$add("Timer " + i + ":" +
                (Number(intFreqs[i].hi << 32) + Number(intFreqs[i].lo)));
    }

    view.availMask = Number(obj.availMask).toString(2) + "b";
}
