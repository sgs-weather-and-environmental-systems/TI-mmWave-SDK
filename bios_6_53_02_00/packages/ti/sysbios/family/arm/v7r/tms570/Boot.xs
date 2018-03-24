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
 *  ======== Boot.xs ========
 */

var Boot = null;
var BIOS = null;
var Core = null;
var Reset = null;
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

    /* Assign setters to the Clock configs. */
    var GetSet = xdc.module("xdc.services.getset.GetSet");

    GetSet.init(Boot);

    GetSet.onSet(this, "configureClocks", updateFrequency);
    GetSet.onSet(this, "OSCIN", updateFrequency);
    GetSet.onSet(this, "PLLMUL", updateFrequency);
    GetSet.onSet(this, "PLLDIV", updateFrequency);
    GetSet.onSet(this, "REFCLKDIV", updateFrequency);
    GetSet.onSet(this, "ODPLL", updateFrequency);
    GetSet.onSet(this, "configureFlashController", updateFrequency);
    GetSet.onSet(this, "configureFlashWaitStates", updateFrequency);

}

/*
 *  ======== module$use ========
 */
function module$use()
{
    var Core = xdc.useModule("ti.sysbios.family.arm.v7r.tms570.Core");

    /* Validate PLL settings */
    if (Boot.PLLMUL > 255) {
        this.$logError("PLL Multiplier value is out of range. Valid range is " +
            "from 0 to 255.", this);
    }

    if (Boot.PLLDIV > 31) {
        this.$logError("PLL Output clock divider value is out of range. " +
            "Valid range is from 0 to 31.", this);
    }

    if (Boot.REFCLKDIV > 62) {
        this.$logError("PLL Reference clock divider value is out of range. " +
            "Valid range is from 0 to 62.", this);
    }

    if (Boot.ODPLL > 7) {
        this.$logError("Internal PLL Output divider value is out of range. " +
            "Valid range is from 0 to 7.", this);
    }

    if (Boot.SPREADINGRATE > 511) {
        this.$logError("Spreading rate value is out of range. Valid range is " +
            "from 0 to 511.", this);
    }

    if (Boot.MULMOD > 511) {
        this.$logError("Multplication correction value is out of range. " +
            "Valid range is from 0 to 511.", this);
    }

    if (Boot.SPR_AMOUNT > 511) {
        this.$logError("Spreading amount value is out of range. Valid range " +
            "is from 0 to 511.", this);
    }

    /* only install Boot_init if using XDC runtime */
    if (Program.build.rtsName === null) {
        return;
    }


    if (Core.id == 0) {
        /* install Boot_init as a Reset function */
        Reset = xdc.useModule('xdc.runtime.Reset');
        Reset.fxns[Reset.fxns.length++]
            = '&ti_sysbios_family_arm_v7r_tms570_Boot_init';
    }
    else {
        Boot.configureClocks = false;
        Boot.configureFlashController = false;
        Boot.configureFlashWaitStates = false;
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
 *  ======== viewInitModule ========
 *  Display the module properties in ROV
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Boot = xdc.useModule('ti.sysbios.family.arm.v7r.tms570.Boot');
    var modCfg = Program.getModuleConfig(Boot.$name);

    view.configureClocks = modCfg.configureClocks;
    view.frequencyModulationEnable = modCfg.frequencyModulationEnable;
    view.OSCIN = modCfg.OSCIN;
    view.PLLMUL = modCfg.PLLMUL;
    view.PLLDIV = modCfg.PLLDIV;
    view.REFCLKDIV = modCfg.REFCLKDIV;
    view.ODPLL = modCfg.ODPLL;
    view.SPREADINGRATE = modCfg.SPREADINGRATE;
    view.MULMOD = modCfg.MULMOD;
    view.SPR_AMOUNT = modCfg.SPR_AMOUNT;
}

/*
 *  ======== updateFlashWaitState ========
 */
function updateFlashWaitState(freq)
{
    /*
     * Compute wait states. These threshold values are from datasheet
     * (RWAIT = [(SYSCLK/45)-1] round up to next integer)
     */
    if (freq <= 45000000) {
        Boot.flashWaitStates = 0;
    }
    else if (freq <= 90000000) {
        Boot.flashWaitStates = 1;
    }
    else if (freq <= 135000000) {
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
    var NF, NR, OD, R;
    var frequency;

    if (Boot.configureClocks) {
        NF = Boot.PLLMUL + 1;
        NR = Boot.REFCLKDIV + 1;
        OD = Boot.ODPLL + 1;
        R  = Boot.PLLDIV + 1;

        /* Compute frequency and convert to Hz */
        frequency = ((Boot.OSCIN * NF) / (NR * OD * R)) * 1000000;
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
     * Invoke updateFrequency so PLL frequency & flash wait states are
     * computed and BIOS.cpuFreq is updated.
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
