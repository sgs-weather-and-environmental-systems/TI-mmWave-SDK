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
var BIOS = null;
var Program = null;
var foundBIOS;

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
    Program = xdc.module('xdc.cfg.Program');

    /* set default loadSegment */
    Boot.loadSegment = "FLASHA PAGE = 0";

    /* default runSegment */
    Boot.runSegment = "D01SARAM PAGE = 0";

    /* Assign setters to the Clock configs. */
    var GetSet = xdc.module("xdc.services.getset.GetSet");

    GetSet.init(Boot);

    GetSet.onSet(this, "configureClocks", updateFrequency);
    GetSet.onSet(this, "OSCCLK", updateFrequency);
    GetSet.onSet(this, "SPLLIMULT", updateFrequency);
    GetSet.onSet(this, "SPLLFMULT", updateFrequency);
    GetSet.onSet(this, "SYSCLKDIVSEL", updateFrequency);
    GetSet.onSet(this, "configureFlashController", updateFrequency);

}

/*
 *  ======== module$use ========
 */
function module$use()
{
    /* only install Boot_init if using XDC runtime */
    if (Program.build.rtsName === null) {
        return;
    }

    /* install Boot_init as a Reset functions */
    var Reset = xdc.useModule('xdc.runtime.Reset');
    Reset.fxns[Reset.fxns.length++]
        = '&ti_catalog_c2800_initF2837x_Boot_init';

    /* if the Limp abort function is undefined, use default */
    if (Boot.limpAbortFunction === undefined) {
            Boot.limpAbortFunction = '&ti_catalog_c2800_initF2837x_Boot_defaultLimpAbortFunction';
    }

    /* place initial branch to c_int00 if booting from Flash */
    if ( (Boot.bootFromFlash == true) &&
         (Program.sectMap[".ti_catalog_c2800_initF2837x_begin"] ===
              undefined)) {
            Program.sectMap[".ti_catalog_c2800_initF2837x_begin"] =
                new Program.SectionSpec();
            Program.sectMap[".ti_catalog_c2800_initF2837x_begin"].loadSegment = "BEGIN";
    }

    /* compute Flash wait states */
    if (Boot.configureFlashWaitStates == true) {

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
            BIOS = xdc.module("ti.sysbios.BIOS");
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
                freq = BIOS.cpuFreq.lo;   /* Hz */
            }
        }

        updateFlashWaitState(freq);
    }

    /* install Boot_initStartup as a Startup first function */
    if (Boot.configureFlashWaitStates == true) {

        var Startup = xdc.useModule('xdc.runtime.Startup');
        Startup.firstFxns[Startup.firstFxns.length++] =
            '&ti_catalog_c2800_initF2837x_Boot_initStartup';
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
    if ((Boot.configureClocks == true) &&
        (foundBIOS == true)) {
        var freq = getFrequency();
        if (BIOS.cpuFreq.lo != freq) {
            this.$logError(
                "BIOS.cpuFreq (" + BIOS.cpuFreq.lo + " Hz) does not match " +
                "the actual CPU frequency (" + freq + " Hz). Please program " +
                "the Boot module's PLL settings to ensure the actual CPU " +
                "frequency matches BIOS.cpuFreq.", this);
        }
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
 *  ======== viewInitModule ========
 *  Display the module properties in ROV
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Boot = xdc.useModule('ti.catalog.c2800.initF2837x.Boot');
    var modCfg = Program.getModuleConfig(Boot.$name);

    view.configureClocks = modCfg.configureClocks;
    view.OSCCLK = modCfg.OSCCLK;
    view.SPLLIMULT = modCfg.SPLLIMULT;
    view.SPLLFMULT = getEnumString(modCfg.SPLLFMULT);
    view.SYSCLKDIVSEL = modCfg.SYSCLKDIVSEL;
    view.bootCPU2 = modCfg.bootCPU2;
}

/*
 *  ======== updateFlashWaitState ========
 */
function updateFlashWaitState(freq)
{
    if (Program.cpu != undefined) {
        if (Program.cpu.deviceName.match(/F28004/)) {
            /* external oscillator case */
            if (Boot.OSCCLKSRCSEL == Boot.OscClk_XTAL) {
                if (freq <= 20000000) {
                    Boot.flashWaitStates = 0;
                }
                else if (freq <= 40000000) {
                    Boot.flashWaitStates = 1;
                }
                else if (freq <= 60000000) {
                    Boot.flashWaitStates = 2;
                }
                else if (freq <= 80000000) {
                    Boot.flashWaitStates = 3;
                }
                else {
                    Boot.flashWaitStates = 4;
                }
            }
            else { /* internal oscillator case */
                if (freq <= 19000000) {
                    Boot.flashWaitStates = 0;
                }
                else if (freq <= 38000000) {
                    Boot.flashWaitStates = 1;
                }
                else if (freq <= 58000000) {
                    Boot.flashWaitStates = 2;
                }
                else if (freq <= 77000000) {
                    Boot.flashWaitStates = 3;
                }
                else if (freq <= 97000000) {
                    Boot.flashWaitStates = 4;
                }
                else {
                    Boot.flashWaitStates = 5;
                }
            }
        }
        else {
            /*
             *  For F2837x devices
             *  Compute wait states.  These threshold values are from datasheet
             *  (RWAIT = [(SYSCLK/50)-1] round up to next integer)
             */
            if (freq <= 50000000) {
                Boot.flashWaitStates = 0;
            }
            else if (freq <= 100000000) {
                Boot.flashWaitStates = 1;
            }
            else if (freq <= 150000000) {
                Boot.flashWaitStates = 2;
            }
            else {
                Boot.flashWaitStates = 3;
            }
        }
    }
}

/*
 *  ======== getFrequency ========
 */
function getFrequency()
{
    var fractMult = 0;
    var frequency;

    if (Boot.configureClocks) {
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
            frequency = (Boot.OSCCLK * (Boot.SPLLIMULT + fractMult));
        }

        /* convert to Hz */
        frequency *= 1000000;

        /* apply sys clock dividers */
        if (Boot.SYSCLKDIVSEL) {
            frequency /= Boot.SYSCLKDIVSEL << 1;
        }

        Boot.timestampFreq = frequency;

    }
    else {
        BIOS = xdc.module("ti.sysbios.BIOS");
        frequency = BIOS.cpuFreq.lo;
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
    /* Compute the new frequency. */
    var newFreq = getFrequency();

    /* update the flash wait state with new frequency */
    updateFlashWaitState(newFreq);

    /* Update the displayed frequency values. */
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
