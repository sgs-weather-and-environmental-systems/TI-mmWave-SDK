/*
 * Copyright (c) 2016-2017, Texas Instruments Incorporated
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

    /* Assign setters to the PLL configs. */
    var GetSet = xdc.module("xdc.services.getset.GetSet");

    GetSet.init(Boot);

    GetSet.onSet(this, "pllOSCCLK", updateFrequency);
    GetSet.onSet(this, "pllcrDIV", updateFrequency);
    GetSet.onSet(this, "pllstsDIVSEL", updateFrequency);
    GetSet.onSet(this, "pllType", updateFrequency);
    GetSet.onSet(this, "configurePll", updateFrequency);
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Program = xdc.useModule('xdc.cfg.Program');

    if (Program.cpu.deviceName.match(/F28M35/)) {
        Boot.concertoDevice = true;
    }

    if (Program.build.rtsName !== null) {
        /* Install Boot_init as one of Reset functions */
        var Reset = xdc.useModule('xdc.runtime.Reset');
        Reset.fxns[Reset.fxns.length++] = '&ti_catalog_c2800_init_Boot_init';

        if (Boot.limpAbortFunction === undefined) {
            Boot.limpAbortFunction = '&ti_catalog_c2800_init_Boot_defaultLimpAbortFunction';
        }

        if ( (Boot.bootFromFlash == true) &&
             (Program.sectMap[".ti_catalog_c2800_init_begin"] === undefined)) {
            Program.sectMap[".ti_catalog_c2800_init_begin"] =
                new Program.SectionSpec();
            Program.sectMap[".ti_catalog_c2800_init_begin"].loadSegment =
                "BEGIN";
        }
    }
}

/*
 *  ======== viewInitModule ========
 *  Display the module properties in ROV
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Boot = xdc.useModule('ti.catalog.c2800.init.Boot');
    var bootModConfig = Program.getModuleConfig(Boot.$name);

    view.disableWatchdog = bootModConfig.disableWatchdog;
    view.configurePll    = bootModConfig.configurePll;
    view.pllcrDIV = bootModConfig.pllcrDIV;
    view.pllstsDIVSEL = bootModConfig.pllstsDIVSEL;
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
    if (((Boot.pllType == Boot.Type_280x) || (Boot.pllType == Boot.Type_281x))
        && (Boot.configurePll == true)) {
       Boot.$logWarning("\nPLL configuration is not supported for this PLL " +
           "type.  Setting configurePll to true will have no effect.", Boot,
           "configurePll");
    }
}

/*
 *  ======== getFrequency ========
 */
function getFrequency()
{
    if (Boot.configurePll == true) {

        var divider;
        var OSCCLK_multiplier;

        if ( (Boot.pllType == Boot.Type_282xx_283xx) ||
             (Boot.pllType == Boot.Type_2802x_2803x_2806x) ) {

            /* determine divide factor */
            if ((Boot.pllstsDIVSEL == 0) || (Boot.pllstsDIVSEL == 1)) {
                divider = 4;
            }
            else if (Boot.pllstsDIVSEL == 2) {
                divider = 2;
            }
            else if (Boot.pllstsDIVSEL == 3) {
                divider = 1;
            }
            else {
                Boot.$logError("Invalid divide value specified for pllstsDIVSEL.", Boot, "pllstsDIVSEL");
            }

            if (Boot.pllcrDIV == 0) {
                OSCCLK_multiplier = 1;
            }
            else {
                OSCCLK_multiplier = Boot.pllcrDIV;
            }

            return((Boot.pllOSCCLK * OSCCLK_multiplier * 1000000) / divider);
        }

        else if (Boot.pllType == Boot.Type_2834x) {

            /* determine divide factor */
            if (Boot.pllstsDIVSEL == 0) {
                divider = 8;
            }
            else if (Boot.pllstsDIVSEL == 1) {
                divider = 4;
            }
            else if (Boot.pllstsDIVSEL == 2) {
                divider = 2;
            }
            else if (Boot.pllstsDIVSEL == 3) {
                divider = 1;
            }
            else {
                Boot.$logError("Invalid divide value specified for pllstsDIVSEL.", Boot, "pllstsDIVSEL");
            }

            return((Boot.pllOSCCLK * (Boot.pllcrDIV + 1) * 1000000) / divider);

        }
    }

    return (0);
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
 *  (assuming configurePll is true).
 */
function updateFrequency(field, val)
{
    /* Don't fire the update if configurePll is false. */
    if (!Boot.configurePll) {
        return;
    }

    /* Compute the new frequency. */
    var newFreq = getFrequency();

    /* Update the display. */
    Boot.displayFrequency = freqToString(newFreq);

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
