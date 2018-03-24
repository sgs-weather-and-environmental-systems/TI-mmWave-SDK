/*
 * Copyright (c) 2014-2016, Texas Instruments Incorporated
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
var catalogName;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.A8F":
        case "ti.targets.arm.elf.A8Fnv":
            return (["Timer_asm.s470"]);
            break;

        case "gnu.targets.arm.A8F":
        case "gnu.targets.arm.A9F":
            return (["Timer_asm_gnu.sv7A"]);
            break;

        case "ti.targets.elf.C64P":
            return (["Timer_asm.s64P"]);
            break;

        default:
            return (null);
            break;
    }
}

if (xdc.om.$name == "cfg" || typeof(genCdoc) != "undefined") {
    var deviceTable = {
        "ti.catalog.c6000": {
            "DM37XX": {
                timer: [
                    {
                        name: "GPTimer5",
                        baseAddr: 0x49038000,
                        intNum:  14,
                        eventId: 51,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x4903A000,
                        intNum:  15,
                        eventId: 52,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x4903C000,
                        intNum:  4,
                        eventId: 53,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x4903E000,
                        intNum:  5,
                        eventId: 54,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        // only add "real" targets to table. "fake" ones (e.g. Tesla) are below
        // (need empty element here in order for assignment below to work)
        "ti.catalog.c6000.nda": {
        },
        "ti.catalog.arm.cortexa8": {
            "TMS320C3430": {
                timer: [
/* Not enabled by default
                    {
                        name: "GPTimer1",
                        baseAddr: 0x48318000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
*/
                    {
                        name: "GPTimer2",
                        baseAddr: 0x49032000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x49034000,
                        intNum:  39,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x49036000,
                        intNum:  40,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x49038000,
                        intNum:  41,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x4903A000,
                        intNum:  42,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x4903C000,
                        intNum:  43,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x4903e000,
                        intNum:  44,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer9",
                        baseAddr: 0x49040000,
                        intNum:  45,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer10",
                        baseAddr: 0x48086000,
                        intNum:  46,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer11",
                        baseAddr: 0x48088000,
                        intNum:  47,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer12",
                        baseAddr: 0x48304000,
                        intNum:  95,
                        eventId: -1,
                        intFreq: {
                            lo: 13000000,
                            hi: 0,
                        },
                    },
                ]
            },
            "DM37XX": {
                timer: [
/* Not enabled by default
                    {
                        name: "GPTimer1",
                        baseAddr: 0x48318000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
*/
                    {
                        name: "GPTimer2",
                        baseAddr: 0x49032000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x49034000,
                        intNum:  39,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x49036000,
                        intNum:  40,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x49038000,
                        intNum:  41,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x4903A000,
                        intNum:  42,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x4903C000,
                        intNum:  43,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x4903e000,
                        intNum:  44,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer9",
                        baseAddr: 0x49040000,
                        intNum:  45,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer10",
                        baseAddr: 0x48086000,
                        intNum:  46,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer11",
                        baseAddr: 0x48088000,
                        intNum:  47,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer12",
                        baseAddr: 0x48304000,
                        intNum:  95,
                        eventId: -1,
                        intFreq: {
                            lo: 26000000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arm.cortexa9": {
            "AM437X": {
                timer: [
                    {
                        name: "Unavailable",
                        baseAddr: 0x44E05000,  /* L4 address */
                        intNum:  66 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer1",
                        baseAddr: 0x44E31000,  /* L4 address */
                        intNum:  67 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                ]
            },
            "OMAP4430": {
                timer: [
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4A318000,  /* L4 address */
                        intNum:  69,
                        eventId: -1,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48032000,  /* L4 address */
                        intNum:  70,
                        eventId: -1,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer10",
                        baseAddr: 0x48086000,  /* L4 address */
                        intNum:  78,
                        eventId: -1,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
    };

    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3403"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3405"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3425"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3503"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3505"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3515"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3517"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3525"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3530"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];

    deviceTable["ti.catalog.arm.cortexa8"]["AM3505"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["AM3517"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
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

    this.$private.getAsmFiles = getAsmFiles;

    Timer = this;

    /* set fxntab default */
    Timer.common$.fxntab = false;

    catalogName = Program.cpu.catalogName;

    /* loop through the device table */
    for (deviceName in deviceTable[catalogName]) {
        if (deviceName == Program.cpu.deviceName) {
            var device = deviceTable[catalogName][deviceName].timer;

            /* initialize timer fields */
            Timer.anyMask = (1 << device.length) - 1;
            Timer.timerSettings.length = device.length;
            Timer.numTimerDevices = device.length;

            Timer.intFreq.hi = device[0].intFreq.hi;
            Timer.intFreq.lo = device[0].intFreq.lo;

            /* default mode set to 32-bit unchained, master is TRUE */
            for (var i=0; i < device.length; i++) {
                Timer.timerSettings[i].master = true;
                Timer.timerSettings[i].baseAddr = $addr(device[i].baseAddr);
                Timer.timerSettings[i].intNum = device[i].intNum;
                Timer.timerSettings[i].name = device[i].name;
            }

            return;
        }
    }

    /* falls thru on failure */

    print("Timer is not supported for the specified device (" +
        Program.cpu.deviceName + ").");

    for (device in deviceTable[catalogName]) {
        print("\t" + device);
    }

    throw new Error ("Timers unsupported on device!");
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.useModule('ti.sysbios.BIOS');
    Hwi = xdc.useModule("ti.sysbios.hal.Hwi");
    var Settings = xdc.module("ti.sysbios.family.Settings");
    var delegate = Settings.getDefaultTimerSupportDelegate();
    Timer.TimerSupportProxy = xdc.useModule(delegate, true);
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    var device = deviceTable[catalogName][Program.cpu.deviceName].timer;

    if (mod.availMask == undefined) {
        mod.availMask = (1 << device.length) - 1;
    }

    mod.device.length = device.length;

    /*
     * Note: I think the proxy.TimerSupport should initialized the
     *       frequency of timer once info is in the catalog files
     */
    mod.intFreq.lo = Timer.intFreq.lo;
    mod.intFreq.hi = Timer.intFreq.hi;

    if (params.anyMask > mod.availMask) {
        Timer.$logError("Incorrect anyMask (" + params.anyMask
            + "). Should be <= " + mod.availMask + ".", Timer, "anyMask");
    }

    mod.handles.length = mod.device.length;

    /* init the module state fields for each timer */
    for (var i=0; i < mod.device.length; i++) {
        mod.device[i].baseAddr = Timer.timerSettings[i].baseAddr;
        mod.device[i].intNum = Timer.timerSettings[i].intNum;
        mod.device[i].eventId = device[i].eventId;
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
    var device = deviceTable[catalogName][Program.cpu.deviceName];

    /* set flag because static instances need to be started */
    Timer.startupNeeded = true;

    obj.staticInst = true;

    if (id >= Timer.numTimerDevices) {
        if (id != Timer.ANY) {
            Timer.$logFatal("Invalid Timer ID " + id + "!", this);
        }
    }

    if (id == Timer.ANY) {
        for (var i=0; i < Timer.numTimerDevices; i++) {
            var j = 1 << i;
            if ((Timer.anyMask & j) && (modObj.availMask & j)) {
                modObj.availMask &= ~j;
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

    obj.tiocpCfg = (params.tiocpCfg.autoidle  << 0) |
                   (params.tiocpCfg.softreset << 1) |
                   (params.tiocpCfg.enawakeup << 2) |
                   (params.tiocpCfg.idlemode  << 3) |
                   (params.tiocpCfg.emufree   << 5) |
                   (params.tiocpCfg.emufree   << 8);


    obj.tier = (params.tier.mat_it_ena  << 0) |
               (params.tier.ovf_it_ena  << 1) |
               (params.tier.tcar_it_ena << 2);

    obj.tclr =  (params.tclr.ptv << 2) |
                (params.tclr.pre << 5) |
                (params.tclr.ce << 6) |
                (params.tclr.scpwm << 7) |
                (params.tclr.tcm << 8) |
                (params.tclr.trg << 10) |
                (params.tclr.pt << 12) |
                (params.tclr.captmode << 13) |
                (params.tclr.gpocfg << 14);

    obj.tsicr = (params.tsicr.sft << 1) |
                (params.tsicr.posted << 2);

    obj.twer = (params.twer.mat_wup_ena << 0) |
               (params.twer.ovf_wup_ena << 1) |
               (params.twer.tcar_wup_ena << 2);

    obj.tmar = params.tmar;

    obj.runMode = params.runMode;
    obj.startMode = params.startMode;
    obj.period = params.period;
    obj.periodType = params.periodType;
    obj.arg = params.arg;
    obj.tickFxn = tickFxn;
    obj.intNum = Timer.timerSettings[obj.id].intNum;
    obj.extFreq.lo = params.extFreq.lo;
    obj.extFreq.hi = 0;

    if (obj.tickFxn != null) {
        if (!params.hwiParams) {
            params.hwiParams = new Hwi.Params();
        }

        var hwiPrms = params.hwiParams;
        hwiPrms.eventId = device.timer[obj.id].eventId;
        hwiPrms.arg = this;
        obj.hwi = Hwi.create(obj.intNum, Timer.stub, hwiPrms);
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
 *  Initialize the 'Basic' Timer instance view.
 */
function viewInitBasic(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Timer = Program.getModuleConfig('ti.sysbios.timers.gptimer.Timer');
    var halTimer = xdc.useModule('ti.sysbios.hal.Timer');

    view.halTimerHandle =  halTimer.viewGetHandle(obj.$addr);
    view.label = Program.getShortName(obj.$label);
    view.id          = obj.id;
    view.name = Timer.timerSettings[obj.id].name;

    view.runMode     = getEnumString(obj.runMode);
    view.startMode   = getEnumString(obj.startMode);
    view.periodType  = getEnumString(obj.periodType);

    if (obj.period < 0) {
        view.$status["period"] = "Error: invalid value for period: " + obj.period;
    }
    else {
        view.period      = obj.period;
    }

    view.intNum     = obj.intNum;
    view.tickFxn    = Program.lookupFuncName(Number(obj.tickFxn));
    view.arg        = obj.arg;

    view.extFreqLow    = "0x" + Number(obj.extFreq.lo).toString(16);
    view.extFreqHigh   = "0x" + Number(obj.extFreq.hi).toString(16);

    view.hwiHandle   = "0x" + Number(obj.hwi).toString(16);
}

/*
 *  ======== viewInitDevice ========
 *  Initialize the 'Device' Timer instance view.
 */
function viewInitDevice(view, obj)
{
    var counterValue, loadValue, compareValuei, controlReg;
    var Program = xdc.useModule('xdc.rov.Program');
    var Timer = Program.getModuleConfig('ti.sysbios.timers.gptimer.Timer');
    var halTimer = xdc.useModule('ti.sysbios.hal.Timer');
    var timerModCfg = Program.getModuleConfig('ti.sysbios.timers.gptimer.Timer');
    var timerRawView = Program.scanRawView('ti.sysbios.timers.gptimer.Timer');
    var modState = timerRawView.modState;

    view.id          = obj.id;

    if (obj.period < 0) {
        view.$status["period"] = "Error: invalid value for period: " + obj.period;
    }
    else {
        if (obj.runMode == halTimer.RunMode_DYNAMIC) {
            view.period  = obj.period;
        }
        else {
            view.period  = obj.period + 1;
        }
    }

    view.intNum      = obj.intNum;
    view.runMode     = getEnumString(obj.runMode);

    var deviceObj = Program.fetchArray(modState.device$fetchDesc,
            modState.device, timerModCfg.numTimerDevices);

    var device = Program.fetchStruct(modState.device$fetchDesc,
            deviceObj[obj.id].$addr);

    view.deviceAddr = "0x" + Number(device.baseAddr).toString(16);

    /* Read TCRR Register */
    counterValue = Program.fetchArray(
                    {
                        type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                        isScalar: true
                    },
                    (device.baseAddr + 0x28), 1, false);

    /* Read TLDR Register */
    loadValue    = Program.fetchArray(
                    {
                        type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                        isScalar: true
                    },
                    (device.baseAddr + 0x2C), 1, false);

    /* Read TMAR Register */
    compareValue    = Program.fetchArray(
                    {
                        type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                        isScalar: true
                    },
                    (device.baseAddr + 0x38), 1, false);

    /* Read TCLR Register */
    controlReg      = Program.fetchArray(
                    {
                        type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                        isScalar: true
                    },
                    (device.baseAddr + 0x24), 1, false);

    if (obj.runMode == halTimer.RunMode_DYNAMIC) {
        view.currCount = Number(counterValue).toString(10);
        view.remainingCount = Number(compareValue - counterValue).toSring(10);
    }
    else if (obj.runMode == halTimer.RunMode_CONTINUOUS) {
        view.currCount = Number(counterValue - loadValue).toString(10);
        view.remainingCount =
            Number(Timer.MAX_PERIOD - counterValue + 1).toString(10);
    }
    else if (obj.runMode == halTimer.RunMode_ONESHOT) {
        if (counterValue >= loadValue) {
            view.currCount = Number(counterValue - loadValue).toString(10);
            view.remainingCount =
                Number(Timer.MAX_PERIOD - counterValue + 1).toString(10);
        } else {
            view.currCount = "Timer Expired Or Uninit";
            view.remainingCount = "";
        }
    }

    if (controlReg & 0x1) {
        view.timerState = "Started";
    }
    else {
        view.timerState = "Stopped";
    }
}

/*
 *  ======== viewInitModule ========
 *  Initialize the Timer 'Module' view.
 */
function viewInitModule(view, obj)
{
    // combine high and low frequency values into a single value
    view.intFrequency = "" +
            (Number(obj.intFreq.hi << 32) + Number(obj.intFreq.lo));

    /*
     *  Construct 'availMask' ROV field
     *
     *  Convert 'availMask' into a string.  Goal here is to display 'availMask'
     *  in binary, showing bits in groups of four separated by spaces and
     *  ending with "b".  For example, the binary mask '1110' should be
     *  displayed as:
     *
     *      0000 0000 0000 1110b
     *
     */

    // convert the availMask to a string of bits
    var origMaskStr = Number(obj.availMask).toString(2);

    // determine the number of bits for the mask.  If upper 16 bits are all 0,
    // then only display the first 16 bits of the mask (upper 16 0s are don't
    // cares in this case)
    var sizeOfMask = (origMaskStr.length > 16) ? 32 : 16;

    // prepend 0s to the mask to give it a total of sizeOfMask bits
    var zeroStr = "";
    var numZerosToAdd = sizeOfMask - origMaskStr.length; // num 0s to prepend

    // construct a string containing the necessary amount of zeros
    for (var i = 0; i < numZerosToAdd; i++) {
        zeroStr += "0";
    }

    // append the significant bits and the leading 0s together
    fullStr = zeroStr.concat(origMaskStr);

    // split string into array of characters. Each elem will have one bit
    var splitStr = fullStr.split("");

    // insert spaces between every 4 bits (for e.g. a 32 bit mask w/ groups of 4
    // bits separated by spaces will have 7 spaces
    var spacedStr = "";
    for (var i = 0; i < splitStr.length; i++) {

        // add a space after every 4th bit, except for the very last one
        if ( ((i + 1) % 4 == 0) && (i != splitStr.length - 1) ) {
            spacedStr += splitStr[i] + " ";
        }
        else {
            spacedStr += splitStr[i];
        }

    }

    view.availMask = spacedStr + "b";
}
