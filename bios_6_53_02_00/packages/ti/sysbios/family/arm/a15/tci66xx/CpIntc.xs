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
 *  ======== CpIntc.xs ========
 */

var CpIntc = null;
var numHostInterrupts;
var deviceName = null;
var catalog = null;

/*
 *  This table is indexed by ARM CorePac interrupt numbers and lists the
 *  CP_INTC host interrupts associated with each interrupt number.
 */
if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "ti.catalog.arm.cortexa15": {
            "TCI6636K2H": {
                baseAddr: 0x02608000,
                numSystemInterrupts: 480,
                armIntsForHostInts: {
                    448: [29],
                    449: [30],
                    450: [31],
                    451: [32],
                    452: [33],
                    453: [34],
                    454: [35],
                    455: [36],
                    456: [37],
                    457: [38],
                    458: [39],
                    459: [40],
                    460: [41],
                    461: [42],
                    462: [43],
                    463: [44],
                    464: [45],
                    465: [46],
                    466: [47],
                    467: [18],
                    468: [19],
                    469: [22],
                    470: [23],
                    471: [50],
                    472: [51],
                    473: [66],
                    474: [67],
                    475: [88],
                    476: [89],
                    477: [90],
                    478: [91],
                    479: [92],
                }
            },
            "TCI66AK2G02": {
                baseAddr: 0x02600000,
                numSystemInterrupts: 416,
                armIntsForHostInts: {
                    336: [0],
                    337: [1],
                    338: [2],
                    339: [3],
                    340: [4],
                    341: [5],
                    342: [6],
                    343: [7],
                    344: [8],
                    345: [9],
                    346: [10],
                    347: [11],
                    348: [12],
                    349: [13],
                    350: [14],
                    351: [15],
                    352: [16],
                    353: [17],
                    354: [18],
                    355: [19],
                    356: [20],
                    357: [21],
                    358: [22],
                    359: [23],
                    360: [24],
                    361: [25],
                    362: [26],
                    363: [27],
                    364: [28],
                    365: [29],
                    366: [30],
                    367: [31],
                    368: [32],
                    369: [33],
                    370: [34],
                    371: [35],
                    372: [36],
                    373: [37],
                    374: [38],
                    375: [39],
                    376: [80],
                    377: [81],
                    378: [82],
                    379: [83],
                    380: [84],
                    381: [85],
                    382: [86],
                    383: [87],
                }
            },
        }
    }

    deviceTable["ti.catalog.arm.cortexa15"]["C66AK2E05"] =
        deviceTable["ti.catalog.arm.cortexa15"]["TCI6636K2H"];
    deviceTable["ti.catalog.arm.cortexa15"]["TCI6630K2L"] =
        deviceTable["ti.catalog.arm.cortexa15"]["TCI6636K2H"];
    deviceTable["ti.catalog.arm.cortexa15"]["TCI6638K2K"] =
        deviceTable["ti.catalog.arm.cortexa15"]["TCI6636K2H"];
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

    CpIntc = this;
    var deviceSupported = false;

    catalog = Program.cpu.catalogName;
    /* loop through the device table */
    for (deviceName in deviceTable[catalog]) {
        if (deviceName == Program.cpu.deviceName) {
            deviceSupported = true;
            break;
        }
    }

    if (!(deviceSupported)) {
        print("CpIntc is not supported for the specified device (" +
              Program.cpu.deviceName + ")");

        throw new Error ("CpIntc unsupported on device!");
    }

    var armInterrupts = deviceTable[catalog][deviceName].armIntsForHostInts;
    numSystemInterrupts = deviceTable[catalog][deviceName].numSystemInterrupts;

    CpIntc.numSysInts = numSystemInterrupts;
    CpIntc.sysInts.length = numSystemInterrupts;
    CpIntc.sysIntToHostInt.length = numSystemInterrupts;

    /* init the host interrupt and ARM interrupt table */
    for (var i in armInterrupts) {
        /* create the event id table */
        var len = CpIntc.intNum.length++;
        CpIntc.intNum[len] = parseInt(i);
        CpIntc.hostIntToArmIntNum.length++;
        CpIntc.hostIntToArmIntNum[len] = armInterrupts[i][0];
    }

    /* set the number of ARM CorePac interrupts */
    CpIntc.numArmInts = CpIntc.intNum.length;
    numHostInterrupts = CpIntc.numArmInts;

    /* initialize all system interrupts */
    for (var i = 0; i < numSystemInterrupts; i++) {
        CpIntc.sysInts[i].fxn =
            '&ti_sysbios_family_arm_a15_tci66xx_CpIntc_unused';
        CpIntc.sysInts[i].arg = i;
        CpIntc.sysInts[i].hostInt = -1;
        CpIntc.sysInts[i].enable = false;
        CpIntc.sysIntToHostInt[i] = -1;
    }

    /*
     *  Based on the number of system interrupt in the system, we can
     *  calculate the number of System Interrupt Status Registers required.
     *  Each SISR can be used for 32 system interrupts.
     */
    CpIntc.numStatusRegs = ((numSystemInterrupts - 1) / 32) + 1;
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    var idx;

    mod.initSIER.length = CpIntc.numStatusRegs;
    mod.dispatchTab.length = CpIntc.numSysInts;
    mod.hostIntToSysInt.length = numHostInterrupts;
    mod.controller = $addr(deviceTable[catalog][deviceName].baseAddr);

    /* Set the default system interrupt status register to 0 */
    for (var i = 0; i < mod.initSIER.length; i++) {
        mod.initSIER[i] = 0;
    }

    /* Set the default system to host interrupt to -1 */
    for (var i = 0; i < numHostInterrupts; i++) {
        mod.hostIntToSysInt[i].hostInt = CpIntc.hostIntToArmIntNum[i];
        mod.hostIntToSysInt[i].sysInt = -1;
    }

    /* initialize the dipatcher table */
    for (var i = 0; i < CpIntc.numSysInts; i++) {
        var regIndex = Math.floor(i / 32);
        mod.dispatchTab[i].fxn = CpIntc.sysInts[i].fxn;
        mod.dispatchTab[i].arg = CpIntc.sysInts[i].arg;

        if (CpIntc.sysInts[i].enable) {
            mod.initSIER[regIndex] |= 1 << (i % 32);
        }

        /*
         *  If only one system interrupt is mapped to one host interrupt,
         *  The dispatch() can look at the sysToHost[] and determine
         *  the system interrupt which caused the host interrupt to trigger.
         */
        if (CpIntc.sysInts[i].hostInt != -1) {
            CpIntc.sysIntToHostInt[i] = CpIntc.sysInts[i].hostInt;
            idx = getHostIntKeyMeta(CpIntc.sysInts[i].hostInt);

            if (idx == -1) {
                CpIntc.$logFatal("Bad host interrupt number (" +
                        CpIntc.sysInts[i].hostInt + ") mapped " +
                        "to system event (" + i + ").", CpIntc);
            }

            if (mod.hostIntToSysInt[idx].sysInt == -1) {
                mod.hostIntToSysInt[idx].sysInt = i;
            }
            else {
                mod.hostIntToSysInt[idx].sysInt = -2;
            }
        }
    }
}

/*
 *  ======== getHostIntiIndexMeta ========
 */
function getHostIntKeyMeta(hostInt)
{
    /* find the Host interrupt associated with given index */
    for (var idx = 0; idx < numHostInterrupts; idx++) {
        if (hostInt == CpIntc.hostIntToArmIntNum[idx]) {
            return (idx);
        }
    }

    return (-1);
}

/*
 *  ======== getIntNumMeta ========
 */
function getIntNumMeta(hostInt)
{
    var armInterrupts = deviceTable[catalog][deviceName].armIntsForHostInts;
    var intNum = -1;

    /* find the ARM interrupt associated with Host interrupt */
    for (var j in armInterrupts) {
        if (hostInt == armInterrupts[j]) {
            if ((intNum != -1) && (intNum != parseInt(j))) {
                CpIntc.$logWarning("More than one event id was found " +
                    "for this host interrupt.  The event id should be " +
                    "set explicitly or the host interrupt should be " +
                    "plugged at runtime.", CpIntc, "getIntNum");
            }
            else {
                /*
                 * ARM CorePac Interrupt numbers 0 to N in Keystone2 reference
                 * manual map to ARM GIC interrupt number 32 to (N + 32).
                 */
                intNum = parseInt(j) + 32;
                break;
            }
        }
    }

    return (intNum);
}

/*
 *  ======== viewInitSystemInts ========
 */
function viewInitSystemInts(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var CpIntc = xdc.useModule('ti.sysbios.family.arm.a15.tci66xx.CpIntc');

    /* Scan the raw view in order to obtain the module state. */
    var rawView;
    try {
        rawView = Program.scanRawView('ti.sysbios.family.arm.a15.tci66xx.CpIntc');
    }
    catch (e) {
        print("Caught exception while retrieving raw view: " + e);
    }

    var mod = rawView.modState;

    /* Retrieve the module configuration. */
    var modCfg = Program.getModuleConfig('ti.sysbios.family.arm.a15.tci66xx.CpIntc');

    /* Retrieve the dispatch table for system interrupts */
    try {
        var sysInts = Program.fetchArray(mod.dispatchTab$fetchDesc,
                                         mod.dispatchTab,
                                         modCfg.numSysInts);
    }
    catch (e) {
        print("Caught exception while trying to retrieve dispatch table: " + e);
    }

    var ScalarStructs = xdc.useModule('xdc.rov.support.ScalarStructs');

    /* Retrieve the CpIntc controller register */
    try {
        var controlReg = Program.fetchStruct(CpIntc.RegisterMap$fetchDesc,
                                             mod.controller,
                                             false);
    }
    catch (e) {
        print("Caught exception while trying to retrieve controlReg: " + e);
    }

    /* Display each of the system interrupt's settings. */
    for (var i = 0; i < modCfg.numSysInts; i++) {
        var fxnName = Program.lookupFuncName(Number(sysInts[i].fxn))[0];
        var arg     = sysInts[i].arg;
        var group   = parseInt(i / 32);
        var bitpos  = i % 32;

        /* ignore system interrupts that are not plugged */
        if (fxnName == "ti_sysbios_family_arm_a15_tci66xx_CpIntc_unused__E") {
            continue;
        }

        var entryView =
            Program.newViewStruct('ti.sysbios.family.arm.a15.tci66xx.CpIntc',
                                  'SysInts');

        entryView.systemInt = i;
        entryView.hostInt   = controlReg.CMR[i];
        entryView.fxn       = fxnName;
        entryView.arg       = arg;
        entryView.enabled   = (controlReg.ECR[group]) & (1 << bitpos);

        view.elements.$add(entryView);
    }
}
