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
 *  ======== BCSplus.xs ========
 */

var BCSplus;
var GetSet;
var RSELValue = 7;
var DCOBitValue = 3;
var MODValue = 0;
var protectDcoModRsel = 0;
var DEBUG = $traceQuery("all");
function debug(msg) {
    if (DEBUG) {
        $trace(msg);
    }
}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    BCSplus = this;
    GetSet = xdc.module("xdc.services.getset.GetSet");
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init()
{
    debug("testing Clock availability");
    debug(this.hasHFXT1, this.hasXT2, this.hasRosc, this.hasVLO);

    /* save "this" for use inside setter */
    var inst = this;
    var firstPass = true;
    var group = GetSet.createGroup();

    /* Initialize pre-calibrated constants list */
    _initPreCalConstant(inst);

    /*
     *  ======== calculateClock ========
     *  Calculate ACLK, SMCLK, MCLK
     */
    function calculateClock() {
        if (firstPass) {
            return;
        }
        var inputHz;

        /* Check if device has XT2 present first */
        if (inst.hasXT2) {
            /* Device has XT2 */
            if (inst.XT2CLKHz > 0) {
                inst.enableXT2 = true;
                inst.BCSCTL1.XT2OFF = BCSplus.XT2OFF_OFF;
            }
            else {
                inst.enableXT2 = false;
                inst.BCSCTL1.XT2OFF = BCSplus.XT2OFF;
            }
        }
        else {
            /* Device does not have XT2 */
            inst.enableXT2 = false;
            inst.BCSCTL1.XT2OFF = BCSplus.XT2OFF;
        }

        if (inst.BCSCTL1.XTS & BCSplus.XTS) {   /* If XTS == 1 */
            debug("if XTS == 1");

            /* TODO: Check frequency range and print error */
            inputHz = inst.LFXT1CLKHz;
        }
        else {                                  /* Else XTS == 0 */
            debug("if XTS == 0");

            switch (inst.BCSCTL3.LFXT1S) {
                case BCSplus.LFXT1S_0:
                case BCSplus.LFXT1S_3:
                    inputHz = inst.LFXT1CLKHz;
                    break;
                case BCSplus.LFXT1S_1:
                    inputHz = 0;
                    break;
                case BCSplus.LFXT1S_2:
                    inputHz = inst.VLOCLKHz;
                    break;
            }
        }

        /* Calculate ACLK/DIVA */
        inst.$unseal("ACLKHz");
        switch (inst.BCSCTL1.DIVA) {
            case BCSplus.DIVA_0:
                inst.ACLKHz = inputHz / 1;
                break;
            case BCSplus.DIVA_1:
                inst.ACLKHz = inputHz / 2;
                break;
            case BCSplus.DIVA_2:
                inst.ACLKHz = inputHz / 4;
                break;
            case BCSplus.DIVA_3:
                inst.ACLKHz = inputHz / 8;
                break;
        }
        inst.$seal("ACLKHz");

        /* Calculate MCLK */
        switch (inst.BCSCTL2.SELM) {
            case BCSplus.SELM_0:
         /* case BCSplus.SELM_1: */
                inputHz = inst.DCOCLKHz;
                break;
            case BCSplus.SELM_2:
                inputHz = inst.enableXT2 ? inst.XT2CLKHz : inst.LFXT1CLKHz;
                break;
            case BCSplus.SELM_3:
                inputHz = inst.LFXT1CLKHz;
                break;
        }

        debug("inputHz @ MCLK = " + inputHz);

        /* Calculate MCLK/DIVM */
        inst.$unseal("MCLKHz");
        switch (inst.BCSCTL2.DIVM) {
            case BCSplus.DIVM_0:
                inst.MCLKHz = inputHz / 1;
                break;
            case BCSplus.DIVM_1:
                inst.MCLKHz = inputHz / 2;
                break;
            case BCSplus.DIVM_2:
                inst.MCLKHz = inputHz / 4;
                break;
            case BCSplus.DIVM_3:
                inst.MCLKHz = inputHz / 8;
                break;
        }
        inst.$seal("MCLKHz");

        /********* Calculate SMCLK *********/
        if (inst.BCSCTL2.SELS & BCSplus.SELS) {
            debug("Inside SELS");
            inputHz = inst.enableXT2 ? inst.XT2CLKHz : inst.LFXT1CLKHz;
        }
        else {
            debug("Inside SELS_OFF");
            inputHz = inst.DCOCLKHz;
        }

        debug("inputHz @ SMCLK = " + inputHz);

        /* Calculate SMCLK/DIVS */
        inst.$unseal("SMCLKHz");
        switch (inst.BCSCTL2.DIVS) {
            case BCSplus.DIVS_0:
                inst.SMCLKHz = inputHz / 1;
                break;
            case BCSplus.DIVS_1:
                inst.SMCLKHz = inputHz / 2;
                break;
            case BCSplus.DIVS_2:
                inst.SMCLKHz = inputHz / 4;
                break;
            case BCSplus.DIVS_3:
                inst.SMCLKHz = inputHz / 8;
                break;
        }
        inst.$seal("SMCLKHz");

        debug("inst.enableXT2 = " + inst.enableXT2);
        debug("inst.XT2CLKHz = " + inst.XT2CLKHz);
        debug("inst.LFXT1CLKHz = " + inst.LFXT1CLKHz);
        debug("inst.DCOCLKHz = " + inst.DCOCLKHz);
        debug("inst.ACLKHz = " + inst.ACLKHz);
        debug("inst.MCLKHz = " + inst.MCLKHz);
        debug("inst.SMCLKHz = " + inst.SMCLKHz);
    }

    /* For each of the following onSet calls, calculateClock will run.
     * But there is no need for it to run more than once here because the
     * register values will not change between the calls, and there is no
     * feedback loop for which we would need to run the function more than
     * once to stabilize the values.
     */
    group.onSet(inst.BCSCTL1, "XT2OFF", calculateClock);
    group.onSet(inst.BCSCTL1, "XTS", calculateClock);
    group.onSet(inst.BCSCTL1, "DIVA", calculateClock);

    group.onSet(inst.BCSCTL2, "SELM", calculateClock);
    group.onSet(inst.BCSCTL2, "DIVM", calculateClock);
    group.onSet(inst.BCSCTL2, "SELS", calculateClock);
    group.onSet(inst.BCSCTL2, "DIVS", calculateClock);
    group.onSet(inst.BCSCTL2, "DCOR", calculateClock);

    group.onSet(inst.BCSCTL3, "XT2S", calculateClock);
    group.onSet(inst.BCSCTL3, "LFXT1S", calculateClock);
    group.onSet(inst.BCSCTL3, "XCAP", calculateClock);

    group.onSet(inst, "VLOCLKHz", calculateClock);
    group.onSet(inst, "LFXT1CLKHz", calculateClock);
    group.onSet(inst, "DCOCLKHz", calculateClock);
    group.onSet(inst, "enableXT2", calculateClock);
    firstPass = false;
    group.onSet(inst, "XT2CLKHz", calculateClock);


    /*
     *  ======== calculateDcoRselModBits ========
     */
    function calculateDcoRselModBits()
    {
        if (((inst.hasAllCal) && (inst.preCalibratedValues == 4)) ||
            ((!inst.hasAllCal) && (inst.preCalibratedValues == 1))) {
            if (protectDcoModRsel == 0) {
                _setDcoRselModBits(inst,0);
                inst.$unseal("DCOCLKHz");
                inst.DCOCLKHz = _calculateDCOFrequency(inst, RSELValue, DCOBitValue, MODValue);
                inst.$seal("DCOCLKHz");
            }
        }
    }
    group.onSet(inst.DCOCTL, "MOD0", calculateDcoRselModBits).
        addInput(inst.DCOCTL, "MOD1").
        addInput(inst.DCOCTL, "MOD2").
        addInput(inst.DCOCTL, "MOD3").
        addInput(inst.DCOCTL, "MOD4").
        addInput(inst.DCOCTL, "DCO0").
        addInput(inst.DCOCTL, "DCO1").
        addInput(inst.DCOCTL, "DCO2").
        addInput(inst.BCSCTL1, "RSEL0").
        addInput(inst.BCSCTL1, "RSEL1").
        addInput(inst.BCSCTL1, "RSEL2").
        addInput(inst.BCSCTL1, "RSEL2").
        addInput(inst.BCSCTL1, "RSEL3");


    /*
     *  ======== updatePreCalibratedValues ========
     */
    function updatePreCalibratedValues(sel, val)
    {
        debug("Inside updatePreCalibratedValues()");

        protectDcoModRsel = 1;
        inst.$unseal("DCOCLKHz");
        if (inst.preCalibratedValues == 0) {
            debug("Inside PreCal_0");
            inst.DCOCLKHz = 1000000;
        }
        else if ((inst.hasAllCal) && (inst.preCalibratedValues == 1)) {
            debug("Inside PreCal_1");
            inst.DCOCLKHz = 8000000;
        }
        else if ((inst.hasAllCal) && (inst.preCalibratedValues == 2)) {
            debug("Inside PreCal_2");
            inst.DCOCLKHz = 12000000;
        }
        else if ((inst.hasAllCal) && (inst.preCalibratedValues == 3)) {
            debug("Inside PreCal_3");
            inst.DCOCLKHz = 16000000;
        }
        else if (((inst.hasAllCal) && (inst.preCalibratedValues == 4))
                 || ((!inst.hasAllCal) && (inst.preCalibratedValues == 1))) {
            debug("Inside PreCal_4");
            protectDcoModRsel = 0;
            _setDcoRselModBits(inst,0);
            inst.DCOCLKHz = _calculateDCOFrequency(inst, RSELValue, DCOBitValue,
                                                   MODValue);
        }
        inst.$seal("DCOCLKHz");
    }
    GetSet.onSet(inst, "preCalibratedValues", updatePreCalibratedValues);
}

/*
 *  ======== computeDCOCLKHz ========
 */
function computeDCOCLKHz(targetValue)
{
    var preCalibratedValues;
    var DCOCLKHz;

    if (this.hasAllCal) {
        /* Device has all calibration constants */
        if (targetValue == 1000000) {
            preCalibratedValues = 0;
            DCOCLKHz = targetValue;
        }
        else if (targetValue ==  8000000) {
            preCalibratedValues = 1;
            DCOCLKHz = targetValue;
        }
        else if (targetValue == 12000000) {
            preCalibratedValues = 2;
            DCOCLKHz = targetValue;
        }
        else if (targetValue == 16000000) {
            preCalibratedValues = 3;
            DCOCLKHz = targetValue;
        }
        else {
            debug("set this.preCalibratedValues = 4");
            preCalibratedValues = 4;
            DCOCLKHz = _configDCOCLKHz(this, targetValue);
        }
    }
    else {
        /* Device has only 1 calibration constant */
        if (targetValue == 1000000) {
            preCalibratedValues = 0;
            DCOCLKHz = targetValue;
        }
        else {
            debug("set this.preCalibratedValues = 1");
            preCalibratedValues = 1;
            DCOCLKHz = _configDCOCLKHz(this, targetValue);
        }
    }

    this.preCalibratedValues = preCalibratedValues;
    debug("Unseal DCOCLKHz");
    this.$unseal("DCOCLKHz");
    this.DCOCLKHz = DCOCLKHz;
    debug("Seal DCOCLKHz");
    this.$seal("DCOCLKHz");
}

/*
 *  ======== _configDCOCLKHz ========
 */
function _configDCOCLKHz(inst, targetValue)
{
    debug("executing inside _configDCOCLKHz() with targetValue = " + targetValue);
    /* Start RSEL, DCO, and MOD bits from zero */
    var localRSELbits = 0;
    var localDCObits = 0;
    var localMODbits = 0;

    var executedLocalRSELbits = false;
    var executedLocalDCObits = false;

    var newDcoFrequency = 0;
    var oldDcoFrequency = 0;

    /* Iterate until it is > than target value */
    /* Iterate through RSEL value */
    /* Calculate DCO */
    oldDcoFrequency = newDcoFrequency;
    newDcoFrequency  = _calculateDCOFrequency(inst, localRSELbits, localDCObits, localMODbits);

    debug("configuring _configDCOCLKHz() by incrementing localRSELbits");
    while (newDcoFrequency < targetValue) {
        executedLocalRSELbits = true;

        /* Increment RSEL value */
        localRSELbits++;

        debug("configDCOHz for localRSELbits = " + localRSELbits);

        /* Calculate DCO */
        oldDcoFrequency = newDcoFrequency;
        newDcoFrequency  = _calculateDCOFrequency(inst, localRSELbits,
            localDCObits, localMODbits);

        /* if == , stop             */
        if (newDcoFrequency == targetValue) {
            localRSELbits++;
            break;
        }
        if (localRSELbits > 16) {
            break;
        }
    }

    if (executedLocalRSELbits) {
        localRSELbits--;
    }
    debug("setDCOHz for localRSELbits = " + localRSELbits);

    /* Iterate through DCO Values */
    /* Calculate DCO */
    oldDcoFrequency = newDcoFrequency;
    newDcoFrequency = _calculateDCOFrequency(inst, localRSELbits, localDCObits,
                                             localMODbits);

    debug("configuring _configDCOCLKHz() by incrementing localDCObits");

    /* if < than target */
    while (newDcoFrequency < targetValue) {
        executedLocalDCObits = true;

        /* Increment DCO bits */
        localDCObits++;
        debug("configDCOHz for localDCObits = " + localDCObits);
        /* Calculate DCO */
        oldDcoFrequency = newDcoFrequency;
        newDcoFrequency = _calculateDCOFrequency(inst, localRSELbits,
            localDCObits, localMODbits);

        /* Iterate until DCO > target */
        /* if ==, stop */
        if (newDcoFrequency == targetValue) {
            localDCObits++;
            break;
        }
        if (localDCObits > 7) {
            break;
        }
    }

    if (executedLocalDCObits) {
        localDCObits--;
    }
    debug("configDCOHz for localDCObits = " + localDCObits);

    /* Iterate through MOD Values */
    /* Calculate DCO */
    oldDcoFrequency = newDcoFrequency;
    newDcoFrequency = _calculateDCOFrequency(inst, localRSELbits, localDCObits,
                                             localMODbits);

    debug("configuring _configDCOCLKHz() by incrementing localMODbits");

    /* if < than target */
    while (newDcoFrequency < targetValue)
    {
        /* Increment MOD bits */
        localMODbits++;
        debug("configDCOHz for localMODbits = " + localMODbits);

        /* Calculate DCO */
        oldDcoFrequency = newDcoFrequency;
        newDcoFrequency = _calculateDCOFrequency(inst, localRSELbits,
                                                 localDCObits, localMODbits);

        /* Iterate until DCO > target stop */

        /* if == stop */
        if (newDcoFrequency == targetValue) {
            localMODbits++;
            break;
        }
        if (localMODbits > 32) {
            break;
        }

    }
    debug("oldDcoFrequency = " + oldDcoFrequency);
    debug("newDcoFrequency = " + newDcoFrequency);
    /* How close are these values */
    var delta1 = targetValue - oldDcoFrequency;
    var delta2 = newDcoFrequency - targetValue;
    debug("delta1 = " + delta1);
    debug("delta2 = " + delta2);

    if (delta1 < delta2) {
        /* If Old value is smaller delta, decrement the MOD bits */
        localMODbits--;
    }

    newDcoFrequency = _calculateDCOFrequency(inst, localRSELbits, localDCObits,
                                             localMODbits);

    debug("Final localRSELbits = " + localRSELbits);
    debug("Final localDCObits = " + localDCObits);
    debug("Final localMODbits = " + localMODbits);
    debug("Final DCO Frequency = " + newDcoFrequency);

    DCOBitValue = localDCObits;
    MODValue = localMODbits;
    RSELValue = localRSELbits;

    /*_setDcoRselModBits(inst, localRSELbits,localDCObits,localMODbits); */
    protectDcoModRsel = 1;
    _setDcoRselModBits(inst,1);
    protectDcoModRsel = 0;
    return newDcoFrequency;
}

/*
 *  ======== _calculateDCOFrequency ========
 *  Returns value of DCOCLK in Hz
 */
function _calculateDCOFrequency(inst, localRSELValue, localDCOBitValue, localMODValue)
{
    debug("executing function _calculateDCOFrequency; " +
           " localRSELValue = " + localRSELValue +
           " localDCOBitValue = " + localDCOBitValue +
           " localMODValue = " + localMODValue);

    var calcDCO;
    var calcDCOPlusOne;

    switch (localRSELValue) {
        case 0:
            calcDCO = (0.07 + 0.17)/2;
            break;
        case 1:
            calcDCO = (0.1 + 0.2)/2;
            break;
        case 2:
            calcDCO = (0.14 + 0.28)/2;
            break;
        case 3:
            calcDCO = (0.2 + 0.4)/2;
            break;
        case 4:
            calcDCO = (0.28 + 0.54)/2;
            break;
        case 5:
            calcDCO = (0.39 + 0.77)/2;
            break;
        case 6:
            calcDCO = (0.54 + 1.06)/2;
            break;
        case 7:
            calcDCO = (0.8 + 1.5)/2;
            break;
        case 8:
            calcDCO = (1.1 + 2.1)/2;
            break;
        case 9:
            calcDCO = (1.6 + 3.0)/2;
            break;
        case 10:
            calcDCO = (2.5 + 4.3)/2;
            break;
        case 11:
            calcDCO = (3.0 + 5.50)/2;
            break;
        case 12:
            calcDCO = (4.3 + 7.3)/2;
            break;
        case 13:
            calcDCO = (6.00 + 9.60)/2;
            break;
        case 14:
            calcDCO = (8.60 + 13.90)/2;
            break;
        case 15:
            calcDCO = (12.0 + 18.50)/2;
            break;
    }

    if (localDCOBitValue < 3) {
        calcDCO = calcDCO / Math.pow(1.08,3 - localDCOBitValue);
    }
    else if (localDCOBitValue > 3) {
        calcDCO = Math.pow(1.08,localDCOBitValue - 3) * calcDCO;
    }

    if (localDCOBitValue <= 7) {
        calcDCOPlusOne = 1.08 * calcDCO;
    }
    else {
        calcDCOPlusOne = calcDCO;
    }

    /* Calculate MOD value */
    calcDCO = (32 * calcDCO * calcDCOPlusOne)
        / ((localMODValue * calcDCO) + ((32 - localMODValue) * calcDCOPlusOne));

    var result = Math.round(calcDCO * 1000000);

    debug("_calculateDCOFrequency returning " + result);

    return result;
}

/*
 *  ======== _setDcoRselModBits ========
 *  This function sets the DCO, RSEL, and MOD bits registers
 *  flag = 0 - User configuring register view
 *  flag = 1 - User configuring DCO Clock manually
 */
function _setDcoRselModBits(inst, flag)
{
    debug("setDcoRselModBits() setting localRSELValue = " + RSELValue
        + ", DCOBitValue = " + DCOBitValue + ", MODValue = " + MODValue);
    debug("flag = " + flag);

    /* Calculate a local DCO bits based on the register settings, */
    if (flag == 0) {
        var localDCOBitValue = 0;
        var localRSELValue = 0;
        var localMODValue = 0;

       /*
        *  ======== calculateDcoBits ========
        */
        localDCOBitValue = 0;
        if (inst.DCOCTL.DCO0 & BCSplus.DCO0) {
            localDCOBitValue = localDCOBitValue + 1;
        }
        if (inst.DCOCTL.DCO1 & BCSplus.DCO1) {
            localDCOBitValue = localDCOBitValue + 2;
        }
        if (inst.DCOCTL.DCO2 & BCSplus.DCO2) {
            localDCOBitValue = localDCOBitValue + 4;
        }
        debug("localDCOBitValue = " + localDCOBitValue);

       /*
        *  ======== calculateRSEL ========
        */
        localRSELValue = 0;
        if (inst.BCSCTL1.RSEL0 & BCSplus.RSEL0) {
            localRSELValue = localRSELValue + 1;
        }
        if (inst.BCSCTL1.RSEL1 & BCSplus.RSEL1) {
            localRSELValue = localRSELValue + 2;
        }
        if (inst.BCSCTL1.RSEL2 & BCSplus.RSEL2) {
            localRSELValue = localRSELValue + 4;
        }
        if (inst.BCSCTL1.RSEL3 & BCSplus.RSEL3) {
            localRSELValue = localRSELValue + 8;
        }

       /*
        *  ======== calculateMOD ========
        */
        localMODValue = 0;
        if (inst.DCOCTL.MOD0 & BCSplus.MOD0) {
            localMODValue = localMODValue + 1;
        }
        if (inst.DCOCTL.MOD1 & BCSplus.MOD1) {
            localMODValue = localMODValue + 2;
        }
        if (inst.DCOCTL.MOD2 & BCSplus.MOD2) {
            localMODValue = localMODValue + 4;
        }
        if (inst.DCOCTL.MOD3 & BCSplus.MOD3) {
            localMODValue = localMODValue + 8;
        }
        if (inst.DCOCTL.MOD4 & BCSplus.MOD4) {
            localMODValue = localMODValue + 16;
        }
        MODValue = localMODValue;
        DCOBitValue = localDCOBitValue;
        RSELValue = localRSELValue;
    }

    else if (flag == 1) {
        debug("modifying DCO bits");
        if (DCOBitValue & 0x4) {
            inst.DCOCTL.DCO2 = BCSplus.DCO2;
        }
        else {
            inst.DCOCTL.DCO2 = BCSplus.DCO2_OFF;
        }
        if (DCOBitValue & 0x2) {
            inst.DCOCTL.DCO1 = BCSplus.DCO1;
        }
        else {
            inst.DCOCTL.DCO1 = BCSplus.DCO1_OFF;
        }
        if (DCOBitValue & 0x1) {
            inst.DCOCTL.DCO0 = BCSplus.DCO0;
        }
        else {
            inst.DCOCTL.DCO0 = BCSplus.DCO0_OFF;
        }

        debug("modifying RSEL bits");
        /* Modify RSEL value */
        if (RSELValue & 0x8) {
            inst.BCSCTL1.RSEL3 = BCSplus.RSEL3;
        }
        else {
            inst.BCSCTL1.RSEL3 = BCSplus.RSEL3_OFF;
        }
        if (RSELValue & 0x4) {
            inst.BCSCTL1.RSEL2 = BCSplus.RSEL2;
        }
        else {
            inst.BCSCTL1.RSEL2 = BCSplus.RSEL2_OFF;
        }
        if (RSELValue & 0x2) {
            inst.BCSCTL1.RSEL1 = BCSplus.RSEL1;
        }
        else {
            inst.BCSCTL1.RSEL1 = BCSplus.RSEL1_OFF;
        }
        if (RSELValue & 0x1) {
            inst.BCSCTL1.RSEL0 = BCSplus.RSEL0;
        }
        else {
            inst.BCSCTL1.RSEL0 = BCSplus.RSEL0_OFF;
        }

        debug("modifying MOD bits");
        /* Modify MOD value */
        if (MODValue & 0x10) {
            debug("modifying MOD4 bit");
            inst.DCOCTL.MOD4 = BCSplus.MOD4;
        }
        else {
            debug("modifying MOD4_OFF bit");
            inst.DCOCTL.MOD4 = BCSplus.MOD4_OFF;
        }
        if (MODValue & 0x8) {
            debug("modifying MOD3 bit");
            inst.DCOCTL.MOD3 = BCSplus.MOD3;
        }
        else {
            debug("modifying MOD3_OFF bit");
            inst.DCOCTL.MOD3 = BCSplus.MOD3_OFF;
        }
        if (MODValue & 0x4) {
            debug("modifying MOD2 bit");
            inst.DCOCTL.MOD2 = BCSplus.MOD2;
        }
        else {
            debug("modifying MOD2_OFF bit");
            inst.DCOCTL.MOD2 = BCSplus.MOD2_OFF;
        }
        if (MODValue & 0x2) {
            debug("modifying MOD1 bit");
            inst.DCOCTL.MOD1 = BCSplus.MOD1;
        }
        else {
            debug("modifying MOD1_OFF bit");
            inst.DCOCTL.MOD1 = BCSplus.MOD1_OFF;
        }
        if (MODValue & 0x1) {
            debug("modifying MOD0 bit");
            inst.DCOCTL.MOD0 = BCSplus.MOD0;
        }
        else {
            debug("modifying MOD0_OFF bit");
            inst.DCOCTL.MOD0 = BCSplus.MOD0_OFF;
        }
    }

    debug("RSELValue = " + RSELValue);
    debug("localRSELValue = " + localRSELValue);
    debug("DCOBitValue = " + DCOBitValue);
    debug("MODValue = " + MODValue);
    debug("localMODValue = " + localMODValue);
}

/*
 *  ======== _initPreCalConstant ========
 */
function _initPreCalConstant(inst)
{
    if (inst.hasAllCal) {
        inst.preCalibratedValuesItems.$add("1 MHz");
        inst.preCalibratedValuesItems.$add("8 MHz");
        inst.preCalibratedValuesItems.$add("12 MHz");
        inst.preCalibratedValuesItems.$add("16 MHz");
        inst.preCalibratedValuesItems.$add("Custom");
    }
    else {
        inst.preCalibratedValuesItems.$add("1 MHz");
        inst.preCalibratedValuesItems.$add("Custom");
    }
}
