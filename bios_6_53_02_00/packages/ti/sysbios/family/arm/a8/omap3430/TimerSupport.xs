/*
 * Copyright (c) 2012-2016, Texas Instruments Incorporated
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
 *  ======== TimerSupport.xs ========
 *
 */

var Timer = null;
var TimerSupport = null;
var numTimers;
var catalogName;

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "ti.catalog.arm.cortexa8": {
            "TMS320C3430": {
                suspendMux1Addr: 0x48002294
            }
        },
    };

    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3*"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["TMS320CDM740"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8168"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["AM3505"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["AM3517"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
    deviceTable["ti.catalog.arm.cortexa8"]["DM37XX"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3430"];
}

/*
 *  ======== deviceSupportCheck ========
 *  Check validity of device
 */
function deviceSupportCheck() 
{
    catalogName = Program.cpu.catalogName;

    /* look for exact match first */
    for (deviceName in deviceTable[catalogName]) {
        if (deviceName == Program.cpu.deviceName) {
            return deviceName;
        }
    }

    /* now look for a wildcard match */
    for (deviceName in deviceTable[catalogName]) {
        if (Program.cpu.deviceName.match(deviceName)) {
            return deviceName;
        }
    }

    print("The " + Program.cpu.deviceName + " device is not currently supported.");
    print("The following devices are supported for the " + Program.build.target.name + " target:");
    for (deviceName in deviceTable[catalogName]) {
        print("\t" + device);
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

    TimerSupport = this;

    TimerSupport.timer.length = 12;

    for (var i=0; i < 12; i++) {
        TimerSupport.timer[i].suspSrc = TimerSupport.SuspSrc_ARM;
    }
    
    var deviceName = deviceSupportCheck();

    TimerSupport.controlMsuspendMux1Addr = 
            $addr(deviceTable[catalogName][deviceName].suspendMux1Addr);

    /* set fxntab default */
    TimerSupport.common$.fxntab = false;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Timer = xdc.useModule('ti.sysbios.timers.gptimer.Timer');
    numTimers = Timer.numTimerDevices;
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.suspSrc.length = numTimers;

    for (var i=0; i < numTimers; i++) {
        mod.suspSrc[i] = params.timer[i].suspSrc;
    }
}

