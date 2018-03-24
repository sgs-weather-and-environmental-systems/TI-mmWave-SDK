/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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
 *  ======== Boot.xs ========
 *
 */

var Boot = null;
var Program = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }
    Boot = this;

    /* Assign setters to the Clock configs. */
    var GetSet = xdc.module("xdc.services.getset.GetSet");

    GetSet.init(Boot);

    GetSet.onSet(this, "configureClocks", updateFrequency);
    GetSet.onSet(this, "OSCCLK", updateFrequency);
    GetSet.onSet(this, "SPLLIMULT", updateFrequency);
    GetSet.onSet(this, "SPLLFMULT", updateFrequency);
    GetSet.onSet(this, "SYSDIVSEL", updateFrequency);
    GetSet.onSet(this, "M3SSDIVSEL", updateFrequency);
    GetSet.onSet(this, "configureFlashController", updateFrequency);

    /* initialize the config parameter */
    for (var i=0; i < Boot.sharedMemoryAccess.length; i++) {
        Boot.sharedMemoryAccess[i] = 0;
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Program = xdc.useModule('xdc.cfg.Program');

    /* only install Boot_init if using XDC runtime */
    if (Program.build.rtsName === null) {
        return;
    }

    /* install Boot_init as a Reset functions */
    var Reset = xdc.useModule('xdc.runtime.Reset');
    Reset.fxns[Reset.fxns.length++]
        = '&ti_catalog_arm_cortexm3_concertoInit_Boot_init';

    /* set the default loadSegment */
    if (Boot.loadSegment === undefined) {
        if ((Program.cpu.deviceName.match(/F28M35.20*/)) ||
            (Program.cpu.deviceName.match(/F28M35.22*/)) ||
            (Program.cpu.deviceName.match(/F28M35.32B1/))) {
            Boot.loadSegment = "FLASH1";
        }
        else {
            Boot.loadSegment = "FLASH";
        }
    }

    /* set the default runSegment */
    if (Boot.runSegment === undefined) {
        Boot.runSegment = "C03SRAM";
    }

    /* if the Limp abort function is undefined, use default */
    if (Boot.limpAbortFunction === undefined) {
            Boot.limpAbortFunction = '&ti_catalog_arm_cortexm3_concertoInit_Boot_defaultLimpAbortFunction';
    }

    /* place initial branch to c_int00 if booting from Flash */
    if ( (Boot.bootFromFlash == true) &&
         (Program.sectMap[".ti_catalog_arm_cortexm3_concertoInit_begin"] ===
              undefined)) {
            Program.sectMap[".ti_catalog_arm_cortexm3_concertoInit_begin"] =
                new Program.SectionSpec();
            Program.sectMap[".ti_catalog_arm_cortexm3_concertoInit_begin"].loadSegment = "FLASH_BOOT";
    }

    /* compute Flash wait states */
    if (Boot.configureFlashWaitStates == true) {

        var foundBIOS;
        var freq;

        /*
         * Notes:
         * For SYS/BIOS apps we need to get the CPU frequency set in the
         * BIOS package.  Applications may change the frequency value in their
         * config, so we must check it after the app config has been processed.
         *
         * For non-SYS/BIOS apps we need to get the frequency from the platform
         * setting.
         *
         * To handle both cases, we need to first check to see if the BIOS
         * package is found.  If it is, then we need to check if BIOS is used
         * in the app.
         *
         * It is very unfortunate to have this linkage to the BIOS module here,
         * but this will likely be reworked soon with a move of the Boot module.
         *
         */
        try {
            var BIOS = xdc.module("ti.sysbios.BIOS");
            foundBIOS = true;
        }
        catch (e) {
            foundBIOS = false;
        }

        /* first get CPU freq from platform */
        freq = Program.cpu.clockRate * 1000000;     /* Hz */

        /* if BIOS is used in the app update freq from BIOS.cpuFreq.lo */
        if (foundBIOS == true) {
            if (BIOS.$used == true) {
                freq = BIOS.cpuFreq.lo;             /* Hz */
            }
        }

        updateFlashWaitState(freq);
    }

    /* install Boot_initStartup as a Startup first function */
    if ( (Boot.configureFlashWaitStates == true) ||
         (Boot.enableFlashProgramCache == true) ||
         (Boot.enableFlashDataCache == true) ) {

        var Startup = xdc.useModule('xdc.runtime.Startup');
        Startup.firstFxns[Startup.firstFxns.length++] =
            '&ti_catalog_arm_cortexm3_concertoInit_Boot_initStartup';
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    /* compute the MSxSRCR register values */
    Boot.MSxSRCR[0] = (Boot.sharedMemoryAccess[0])  |
                 (Boot.sharedMemoryAccess[1] << 8)  |
                 (Boot.sharedMemoryAccess[2] << 16) |
                 (Boot.sharedMemoryAccess[3] << 24);

    Boot.MSxSRCR[1] = (Boot.sharedMemoryAccess[4])  |
                 (Boot.sharedMemoryAccess[5] << 8)  |
                 (Boot.sharedMemoryAccess[6] << 16) |
                 (Boot.sharedMemoryAccess[7] << 24);
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
 *  ======== viewInitModule ========
 *  Display the module properties in ROV
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Boot = xdc.useModule('ti.catalog.arm.cortexm3.concertoInit.Boot');
    var modCfg = Program.getModuleConfig(Boot.$name);

    view.configureClocks = modCfg.configureClocks;
    view.OSCCLK = modCfg.OSCCLK;
    view.SPLLIMULT = modCfg.SPLLIMULT;
    view.SPLLFMULT = getEnumString(modCfg.SPLLFMULT);
    view.SYSDIVSEL = getEnumString(modCfg.SYSDIVSEL);
    view.M3SSDIVSEL = getEnumString(modCfg.M3SSDIVSEL);
    view.bootC28 = modCfg.bootC28;
}

/*
 *  ======== updateFlashWaitState ========
 */
function updateFlashWaitState(freq)
{
    /*
     * Compute wait states.  These threshold values are from initial
     * characterization by Concerto apps team. (RWAIT = (SYSCLK/FCLK)-1)
     */
    if (freq < 41000000) {
        Boot.flashWaitStates = 0;
    }
    else if (freq < 81000000) {
        Boot.flashWaitStates = 1;
    }
    else if (freq < 121000000) {
        Boot.flashWaitStates = 2;
    }
    else {
        Boot.flashWaitStates = 3;
    }
}

/*
 *  ======== getFrequency ========
 */
function getFrequency()
{
    var fractMult = 0;
    var frequency;

    /* apply integer and fractional multiply values */
    if (Boot.SPLLFMULT == Boot.Fract_25) {
        fractMult = 0.25;
    }
    else if (Boot.SPLLFMULT == Boot.Fract_50) {
        fractMult = 0.5;
    }
    else if (Boot.SPLLFMULT == Boot.Fract_75) {
        fractMult = 0.75;
    }

    if (Boot.SPLLIMULT == 0) {  /* multiplier bypasses PLL ? */
        frequency = Boot.OSCCLK;
    }
    else {
        frequency = (Boot.OSCCLK * (Boot.SPLLIMULT + fractMult) / 2);
    }

    /* convert to Hz */
    frequency *= 1000000;

    /* apply sys clock dividers */
    if (Boot.SYSDIVSEL == Boot.Div_2) {
        frequency /= 2;
    }
    else if (Boot.SYSDIVSEL == Boot.Div_4) {
        frequency /= 4;
    }
    else if (Boot.SYSDIVSEL == Boot.Div_8) {
        frequency /= 8;
    }

    /* set the Timestamp frequency */
    Boot.timestampFreq = frequency;

    /* apply M3 subsystem clock dividers */
    if (Boot.M3SSDIVSEL == Boot.M3Div_2) {
        frequency /= 2;
    }
    if (Boot.M3SSDIVSEL == Boot.M3Div_4) {
        frequency /= 4;
    }

    return (frequency);
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

    /*
     * Invoke updateFrequency in case changes were made before the module
     * was registered (e.g., if the Platform meta$init ran before BIOS
     * meta$init)
     */
    updateFrequency();
}

/*
 *  ======== updateFrequency ========
 *  Update all of the listeners whenever the PLL configuration changes
 *  (assuming configureClocks is true).
 */
function updateFrequency(field, val)
{
    /* Don't fire the update if configureClocks is false. */
    if (!Boot.configureClocks) {
        return;
    }

    /* Compute the new M3 frequency. */
    var newFreq = getFrequency();

    /* Compute the new C28 frequency. */
    var newFreq28 = newFreq;
    if (Boot.M3SSDIVSEL == Boot.M3Div_2) {
        newFreq28 *= 2;
    }
    if (Boot.M3SSDIVSEL == Boot.M3Div_4) {
        newFreq28 *= 4;
    }

    updateFlashWaitState(newFreq);

    /* Update the displayed frequency values. */
    Boot.displayFrequency = freqToString(newFreq);
    Boot.displayFrequency28 = freqToString(newFreq28);

    /* Notify each of the listeners of the new frequency value. */
    for each (var listener in listeners) {
        listener.fireFrequencyUpdate(newFreq);
    }
}

/*
 *  ======== freqToString ========
 *  Convert the frequency to a string with appropriate MHz / KHz label.
 */
function freqToString(freq)
{
    if ((freq / 1000000) >= 1) {
        var mhz = freq / 1000000.0;
        return (String(mhz) + " MHz");
    }
    else if ((freq / 1000) >= 1) {
        var khz = freq / 1000.0;
        return (String(khz) + " KHz");
    }
    else {
        return (freq + " Hz");
    }
}
