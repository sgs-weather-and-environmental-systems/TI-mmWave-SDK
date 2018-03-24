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
 * */
/*
 *  ======== Boot.xs ========
 */

var Boot = null;
var Program = null;
var Build = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }
    Boot = this;

    /* Assign setters to the Clock configs. */
    var GetSet = xdc.module("xdc.services.getset.GetSet");

    GetSet.init(Boot);

    GetSet.onSet(this, "configureClocks", updateFrequency);
    GetSet.onSet(this, "speedSelect", updateFrequency);
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Program = xdc.useModule('xdc.cfg.Program');
    Build = xdc.useModule('ti.sysbios.Build');

    /* only install Boot_init if using XDC runtime */
    if (Program.build.rtsName === null) {
        return;
    }

    /* if Boot.configureClocks not written, set default based on device ID */
    if (!Boot.$written("configureClocks")) {
        if (Program.cpu.deviceName.match(/MSP432P401/)) {
            Boot.configureClocks = true;
        }
        else {
            Boot.configureClocks = false;
        }
    }
    /* else, if was written, check that selection is valid */
    else {
        if ((!Program.cpu.deviceName.match(/MSP432P401/)) &&
            (Boot.configureClocks == true)) {
            Boot.$logError(
              "Boot.configureClocks is only supported on MSP432P401x devices",
              Boot);
        }
    }

    /* install Boot_init as reset function */
    var Reset = xdc.useModule('xdc.runtime.Reset');
    Reset.fxns[Reset.fxns.length++] =
        '&ti_sysbios_family_arm_msp432_init_Boot_init';

    /* insert include path to CMSIS headers */
    var xdcpath =
        String(environment['xdc.path'] + '/packages/').replace(/\\/g, "/");
    var xdcincs = xdcpath.split(';');
    var ADD_XDC_PATH = "";
    for each (var inc in xdcincs) {
        if(inc.match(/source/)) {
            ADD_XDC_PATH += "-I\"" + inc + "/third_party/CMSIS/Include/\" ";
        }
    }
    Build.ccArgs.$add(ADD_XDC_PATH);

    /* Add in the appropriate -DDeviceFamily_XXX definition */

    var devFamily = "";

    if (Program.cpu.deviceName.match(/MSP432P401/)) {
        devFamily = "-DDeviceFamily_MSP432P401x";
    }
    else if (Program.cpu.deviceName.match(/MSP432P411/)) {
        devFamily = "-DDeviceFamily_MSP432P4x1xI";
    }
    else {
        Boot.$logWarning("Unknown device: " + Program.cpu.deviceName
            + ". Assuming MSP432P401R compatible.", Boot);
        devFamily = "-DDeviceFamily_MSP432P401x";
    }

    Build.ccArgs.$add(devFamily);
}

/*
 *  ======== viewInitModule ========
 *  Display the module properties in ROV
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Boot = xdc.useModule('ti.sysbios.family.arm.msp432.init.Boot');
    var modCfg = Program.getModuleConfig(Boot.$name);

    view.configureClocks        = modCfg.configureClocks
    view.disableWatchdog        = modCfg.disableWatchdog;
}

/*
 *  ======== getFrequency ========
 */
function getFrequency()
{
    var freq;

    if (Boot.configureClocks == false) {
        freq = 3000000;
    }
    else if (Boot.speedSelect == Boot.SpeedOpt_High) {
        freq = 48000000;
    }
    else if (Boot.speedSelect == Boot.SpeedOpt_Medium) {
        freq = 24000000;
    }
    else if (Boot.speedSelect == Boot.SpeedOpt_Low) {
        freq = 12000000;
    }

    return (freq);
}


/* Array of listeners, used by 'registerFreqListener' and 'updateFrequency'. */
var listeners = new Array();

/*
 *  ======== registerFreqListener ========
 *  Called by other modules (e.g., BIOS), to register themselves to listen
 *  for changes to the device frequency configured by the Boot module.
 */
function registerFreqListener(listener)
{
    listeners[listeners.length] = listener;
}

/*
 *  ======== updateFrequency ========
 *  Update all of the listeners whenever the clock configuration changes
 *  (assuming configureClocks is true).
 */
function updateFrequency(field, val)
{
    Boot.computedCpuFrequency = getFrequency();;

    /* Notify each of the listeners of the new frequency value. */
    for each (var listener in listeners) {
        listener.fireFrequencyUpdate(Boot.computedCpuFrequency);
    }
}
