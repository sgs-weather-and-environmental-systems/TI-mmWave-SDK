/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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
 *  ======== AMMU.xs ========
 */

var Program = xdc.module('xdc.cfg.Program');

var AMMU = null;
var Cache = null;
var catalogName = null;
var deviceTable = null;
var mmu = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    AMMU = this;

    deviceTable = {
        // only add "real" targets to table. "fake" ones (e.g. Tesla) are below
        // (need empty element here in order for assignment below to work)
        "ti.catalog.arm.nda": {
        },
        "ti.catalog.c6000.nda": {
        },
        "ti.catalog.arm": {
        },
        "ti.catalog.arm.cortexm3": {
            "TMS320TI816X": {
                mmu: {
                    baseAddr: 0x40000800,
                    numLargePages: 4,
                    numMediumPages: 2,
                    numSmallPages: 10,
                    numLinePages: 0,
                    largePageSizeStrings: ["Large_32M", "Large_512M"],
                    largePageSizeEnums: [AMMU.Large_32M, AMMU.Large_512M],
                    mediumPageSizeStrings: ["Medium_128K", "Medium_256K"],
                    mediumPageSizeEnums: [AMMU.Medium_128K, AMMU.Medium_256K],
                    smallPageSizeStrings: ["Small_4K", "Small_16K"],
                    smallPageSizeEnums: [AMMU.Small_4K, AMMU.Small_16K]
                },
            },
            "OMAP4430": {
                mmu: {
                    baseAddr: 0x40000800,
                    numLargePages: 4,
                    numMediumPages: 2,
                    numSmallPages: 10,
                    numLinePages: 0,
                    largePageSizeStrings: ["Large_32M", "Large_512M"],
                    largePageSizeEnums: [AMMU.Large_32M, AMMU.Large_512M],
                    mediumPageSizeStrings: ["Medium_128K", "Medium_256K"],
                    mediumPageSizeEnums: [AMMU.Medium_128K, AMMU.Medium_256K],
                    smallPageSizeStrings: ["Small_4K", "Small_16K"],
                    smallPageSizeEnums: [AMMU.Small_4K, AMMU.Small_16K]
                },
            },
        },
        "ti.catalog.arm.cortexm4": {
            "OMAP5430": {
                mmu: {
                    baseAddr: 0x40000800,
                    numLargePages: 4,
                    numMediumPages: 2,
                    numSmallPages: 10,
                    numLinePages: 0,
                    largePageSizeStrings: ["Large_32M", "Large_512M"],
                    largePageSizeEnums: [AMMU.Large_32M, AMMU.Large_512M],
                    mediumPageSizeStrings: ["Medium_128K", "Medium_256K"],
                    mediumPageSizeEnums: [AMMU.Medium_128K, AMMU.Medium_256K],
                    smallPageSizeStrings: ["Small_4K", "Small_16K"],
                    smallPageSizeEnums: [AMMU.Small_4K, AMMU.Small_16K]
                },
            },
        },
        "ti.catalog.c6000": {
            "OMAP4430": {
                mmu: {
                    baseAddr: 0x01c30800,
                    numLargePages: 8,
                    numMediumPages: 7,
                    numSmallPages: 3,
                    numLinePages: 0,
                    largePageSizeStrings: ["Large_256M", "Large_512M"],
                    largePageSizeEnums: [AMMU.Large_256M, AMMU.Large_512M],
                    mediumPageSizeStrings: ["Medium_128K", "Medium_1M"],
                    mediumPageSizeEnums: [AMMU.Medium_128K, AMMU.Medium_1M],
                    smallPageSizeStrings: ["Small_4K", "Small_32K"],
                    smallPageSizeEnums: [AMMU.Small_4K, AMMU.Small_32K]
                },
            },
        },
    };

    deviceTable["ti.catalog.arm"]["TMS320CDM740"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320C6A8168"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320C6A8149"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320DM8168"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320DM8148"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI811X"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI813X"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI814X"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.nda"]["Ducati"] =
        deviceTable["ti.catalog.arm.cortexm3"]["OMAP4430"];

    deviceTable["ti.catalog.arm.cortexm4"]["Vayu"] =
            deviceTable["ti.catalog.arm.cortexm4"]["OMAP5430"];

    deviceTable["ti.catalog.arm.cortexm4"]["DRA7XX"] =
            deviceTable["ti.catalog.arm.cortexm4"]["OMAP5430"];

    deviceTable["ti.catalog.arm.cortexm4"]["TDA3XX"] =
            deviceTable["ti.catalog.arm.cortexm4"]["OMAP5430"];

    deviceTable["ti.catalog.c6000"]["OMAP5430"] =
        deviceTable["ti.catalog.c6000"]["OMAP4430"];

    deviceTable["ti.catalog.c6000"]["OMAP5432"] =
        deviceTable["ti.catalog.c6000"]["OMAP4430"];

    deviceTable["ti.catalog.c6000.nda"]["Tesla"] =
        deviceTable["ti.catalog.c6000"]["OMAP4430"];

    catalogName = Program.cpu.catalogName;

    /* loop through the device table */
    for (deviceName in deviceTable[catalogName]) {
        if (deviceName == Program.cpu.deviceName) {
            mmu = deviceTable[catalogName][deviceName].mmu;
            break;
        }
    }

    if (mmu == null) {
        print("AMMU is not supported for the specified device (" +
            Program.cpu.deviceName + ").");
        if (deviceTable[catalogName] != null) {
            print("The following devices within the " + catalogName +
                " catalog are supported:");
            for (device in deviceTable[catalogName]) {
                print("\t" + device);
            }
        }
        throw new Error ("MMU unsupported on device!");
    }

    AMMU.largePages.length = mmu.numLargePages;
    AMMU.mediumPages.length = mmu.numMediumPages;
    AMMU.smallPages.length = mmu.numSmallPages;
    AMMU.linePages.length = mmu.numLinePages;

    /* seal the lengths for xgconf */

    AMMU.largePages.$seal("length");
    AMMU.mediumPages.$seal("length");
    AMMU.smallPages.$seal("length");
    AMMU.linePages.$seal("length");

    /* initialize Large Page Descriptors */
    for (var i = 0; i < mmu.numLargePages; i++) {
        AMMU.largePages[i].logicalAddress = 0;
        AMMU.largePages[i].translationEnabled = AMMU.Enable_NO;
        AMMU.largePages[i].translatedAddress = ~0;

        AMMU.largePages[i].L2_writePolicy = AMMU.WritePolicy_WRITE_THROUGH;
        AMMU.largePages[i].L2_allocate = AMMU.AllocatePolicy_NON_ALLOCATE;
        AMMU.largePages[i].L2_posted = AMMU.PostedPolicy_NON_POSTED;
        AMMU.largePages[i].L2_cacheable = AMMU.CachePolicy_NON_CACHEABLE;

        AMMU.largePages[i].L1_writePolicy = AMMU.WritePolicy_WRITE_THROUGH;
        AMMU.largePages[i].L1_allocate = AMMU.AllocatePolicy_NON_ALLOCATE;
        AMMU.largePages[i].L1_posted = AMMU.PostedPolicy_NON_POSTED;
        AMMU.largePages[i].L1_cacheable = AMMU.CachePolicy_NON_CACHEABLE;

        AMMU.largePages[i].exclusion = AMMU.Enable_NO;
        AMMU.largePages[i].prefetch = AMMU.Enable_NO;
        AMMU.largePages[i].readOnly = AMMU.Enable_NO;
        AMMU.largePages[i].executeOnly = AMMU.Enable_NO;
        AMMU.largePages[i].volatileQualifier = AMMU.Volatile_DO_NOT_FOLLOW;
        AMMU.largePages[i].size = mmu.largePageSizeEnums[0];
        AMMU.largePages[i].pageEnabled = AMMU.Enable_NO;
    }

    /* initialize Medium Page Descriptors */
    for (var i = 0; i < mmu.numMediumPages; i++) {
        AMMU.mediumPages[i].logicalAddress = 0;
        AMMU.mediumPages[i].translationEnabled = AMMU.Enable_NO;
        AMMU.mediumPages[i].translatedAddress = ~0;

        AMMU.mediumPages[i].L2_writePolicy = AMMU.WritePolicy_WRITE_THROUGH;
        AMMU.mediumPages[i].L2_allocate = AMMU.AllocatePolicy_NON_ALLOCATE;
        AMMU.mediumPages[i].L2_posted = AMMU.PostedPolicy_NON_POSTED;
        AMMU.mediumPages[i].L2_cacheable = AMMU.CachePolicy_NON_CACHEABLE;

        AMMU.mediumPages[i].L1_writePolicy = AMMU.WritePolicy_WRITE_THROUGH;
        AMMU.mediumPages[i].L1_allocate = AMMU.AllocatePolicy_NON_ALLOCATE;
        AMMU.mediumPages[i].L1_posted = AMMU.PostedPolicy_NON_POSTED;
        AMMU.mediumPages[i].L1_cacheable = AMMU.CachePolicy_NON_CACHEABLE;

        AMMU.mediumPages[i].exclusion = AMMU.Enable_NO;
        AMMU.mediumPages[i].prefetch = AMMU.Enable_NO;
        AMMU.mediumPages[i].readOnly = AMMU.Enable_NO;
        AMMU.mediumPages[i].executeOnly = AMMU.Enable_NO;
        AMMU.mediumPages[i].volatileQualifier = AMMU.Volatile_DO_NOT_FOLLOW;
        AMMU.mediumPages[i].size = mmu.mediumPageSizeEnums[0];
        AMMU.mediumPages[i].pageEnabled = AMMU.Enable_NO;
    }

    /* initialize Small Page Descriptors */
    for (var i = 0; i < mmu.numSmallPages; i++) {
        AMMU.smallPages[i].logicalAddress = 0;
        AMMU.smallPages[i].translationEnabled = AMMU.Enable_NO;
        AMMU.smallPages[i].translatedAddress = ~0;

        AMMU.smallPages[i].L2_writePolicy = AMMU.WritePolicy_WRITE_THROUGH;
        AMMU.smallPages[i].L2_allocate = AMMU.AllocatePolicy_NON_ALLOCATE;
        AMMU.smallPages[i].L2_posted = AMMU.PostedPolicy_NON_POSTED;
        AMMU.smallPages[i].L2_cacheable = AMMU.CachePolicy_NON_CACHEABLE;

        AMMU.smallPages[i].L1_writePolicy = AMMU.WritePolicy_WRITE_THROUGH;
        AMMU.smallPages[i].L1_allocate = AMMU.AllocatePolicy_NON_ALLOCATE;
        AMMU.smallPages[i].L1_posted = AMMU.PostedPolicy_NON_POSTED;
        AMMU.smallPages[i].L1_cacheable = AMMU.CachePolicy_NON_CACHEABLE;

        AMMU.smallPages[i].exclusion = AMMU.Enable_NO;
        AMMU.smallPages[i].prefetch = AMMU.Enable_NO;
        AMMU.smallPages[i].readOnly = AMMU.Enable_NO;
        AMMU.smallPages[i].executeOnly = AMMU.Enable_NO;
        AMMU.smallPages[i].volatileQualifier = AMMU.Volatile_DO_NOT_FOLLOW;
        AMMU.smallPages[i].size = mmu.smallPageSizeEnums[0];
        AMMU.smallPages[i].pageEnabled = AMMU.Enable_NO;
    }

    if (!Program.build.target.$name.match(/C6/)) {
        /*
         *  Change the small page starting at base address 0x40000000 to 16K
         *  (32K for some devices) from 4K. This needs to be done because any
         *  accesses to any address greater than 4K will generate an exception.
         */
        AMMU.smallPages[1].pageEnabled = AMMU.Enable_YES;
        AMMU.smallPages[1].logicalAddress = 0x40000000;
        AMMU.smallPages[1].translatedAddress = 0x55080000;
        AMMU.smallPages[1].translationEnabled = AMMU.Enable_YES;
        AMMU.smallPages[1].size = mmu.smallPageSizeEnums[1];
    }

    /* initialize Line Page Descriptors */
    for (var i = 0; i < mmu.numLinePages; i++) {
        AMMU.linePages[i].logicalAddress = 0;
        AMMU.linePages[i].translationEnabled = AMMU.Enable_NO;
        AMMU.linePages[i].translatedAddress = ~0;
        AMMU.linePages[i].pageEnabled = AMMU.Enable_NO;
    }

    AMMU.debugPage.translationEnabled = AMMU.Enable_NO;
    AMMU.debugPage.translatedAddress = ~0;

    AMMU.debugPage.pageEnabled = AMMU.Enable_NO;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    var page;
    var policy;
    var maint;
    var registerResetHook = true;

    if ((Program.build.target.name == "M3") ||
        (Program.build.target.name == "M4")) {
        /*
         * If the cache module is used, it is responsible for
         * calling AMMU_init() and we do not need to register
         * AMMU_init() as a reset function.
         */
        Cache = xdc.module("ti.sysbios.hal.unicache.Cache");
        if (Cache.$used) {
            registerResetHook = false;
        }
    }

    if ((AMMU.configureAmmu == true) && (registerResetHook == true)) {
        var Reset = xdc.useModule('xdc.runtime.Reset');
        Reset.fxns.$add(AMMU.init);
    }

    var deviceMMU = deviceTable[catalogName][Program.cpu.deviceName].mmu;

    /*
     * construct mmuInitConfig image from the metaonly structures
     */

    /* first init the entire array to zero */

    for (var i = 0; i < 8; i++) {
        AMMU.mmuInitConfig.LARGE_ADDR[i] = null;
        AMMU.mmuInitConfig.LARGE_XLTE[i] = null;
        AMMU.mmuInitConfig.LARGE_POLICY[i] = 0;
    }

    for (var i = 0; i < 16; i++) {
        AMMU.mmuInitConfig.MEDIUM_ADDR[i] = null;
        AMMU.mmuInitConfig.MEDIUM_XLTE[i] = null;
        AMMU.mmuInitConfig.MEDIUM_POLICY[i] = 0;
    }

    for (var i = 0; i < 32; i++) {
        AMMU.mmuInitConfig.SMALL_ADDR[i] = null;
        AMMU.mmuInitConfig.SMALL_XLTE[i] = null;
        AMMU.mmuInitConfig.SMALL_POLICY[i] = 0;
        AMMU.mmuInitConfig.SMALL_MAINT[i] = 0;
    }

    for (var i = 0; i < 32; i++) {
        AMMU.mmuInitConfig.LINE_ADDR[i] = null;
        AMMU.mmuInitConfig.LINE_XLTE[i] = null;
        AMMU.mmuInitConfig.LINE_POLICY[i] = 0;
    }

    /*
     * Then initialize only those defined for this device
     */

    for (var i = 0; i < mmu.numLargePages; i++) {
        page = AMMU.largePages[i];

        if (typeof page.logicalAddress == "number") {
            AMMU.mmuInitConfig.LARGE_ADDR[i] = $addr(page.logicalAddress);
        }
        else {
            AMMU.mmuInitConfig.LARGE_ADDR[i] = page.logicalAddress;
        }

        if (typeof page.translatedAddress == "number") {
            AMMU.mmuInitConfig.LARGE_XLTE[i] = $addr(page.translatedAddress);
        }
        else {
            AMMU.mmuInitConfig.LARGE_XLTE[i] = page.translatedAddress;
        }

        if ((page.translationEnabled == 0)
             && (page.translatedAddress == ~0)) {
            AMMU.mmuInitConfig.LARGE_XLTE[i] |= $addr(1);
        }

        policy = page.L2_writePolicy << 23;
        policy += page.L2_allocate << 22;
        policy += page.L2_posted << 21;
        policy += page.L2_cacheable << 20;
        policy += page.L1_writePolicy << 19;
        policy += page.L1_allocate << 18;
        policy += page.L1_posted << 17;
        policy += page.L1_cacheable << 16;
        policy += page.exclusion << 7;
        policy += page.prefetch << 6;
        policy += page.readOnly << 5;
        policy += page.executeOnly << 4;
        policy += page.volatileQualifier << 3;

        if (page.size == mmu.largePageSizeEnums[0]) {
        }
        else if (page.size == mmu.largePageSizeEnums[1]) {
            policy += 1 << 1;
        }
        else {
            AMMU.$logError("Large Page Size: " + page.size.$name.replace(/.*\./,"") +
                            " is not supported on the " + deviceName +
                            " device.", AMMU, "largePages");
        }

        policy += page.pageEnabled;

        AMMU.mmuInitConfig.LARGE_POLICY[i] = policy;
    }

    for (var i = 0; i < mmu.numMediumPages; i++) {
        page = AMMU.mediumPages[i];

        if (typeof page.logicalAddress == "number") {
            AMMU.mmuInitConfig.MEDIUM_ADDR[i] = $addr(page.logicalAddress);
        }
        else {
            AMMU.mmuInitConfig.MEDIUM_ADDR[i] = page.logicalAddress;
        }

        if (typeof page.translatedAddress == "number") {
            AMMU.mmuInitConfig.MEDIUM_XLTE[i] = $addr(page.translatedAddress);
        }
        else {
            AMMU.mmuInitConfig.MEDIUM_XLTE[i] = page.translatedAddress;
        }

        if ((page.translationEnabled == 0)
             && (page.translatedAddress == ~0)) {
            AMMU.mmuInitConfig.MEDIUM_XLTE[i] = $addr(1);
        }

        policy = page.L2_writePolicy << 23;
        policy += page.L2_allocate << 22;
        policy += page.L2_posted << 21;
        policy += page.L2_cacheable << 20;
        policy += page.L1_writePolicy << 19;
        policy += page.L1_allocate << 18;
        policy += page.L1_posted << 17;
        policy += page.L1_cacheable << 16;
        policy += page.exclusion << 7;
        policy += page.prefetch << 6;
        policy += page.readOnly << 5;
        policy += page.executeOnly << 4;
        policy += page.volatileQualifier << 3;

        if (page.size == mmu.mediumPageSizeEnums[0]) {
        }
        else if (page.size == mmu.mediumPageSizeEnums[1]) {
            policy += 1 << 1;
        }
        else {
            AMMU.$logError("Medium Page Size: " + page.size.$name.replace(/.*\./,"") +
                            " is not supported on the " + deviceName +
                            " device.", AMMU, "mediumPages");
        }

        policy += page.pageEnabled;

        AMMU.mmuInitConfig.MEDIUM_POLICY[i] = policy;
    }

    for (var i = 0; i < mmu.numSmallPages; i++) {
        page = AMMU.smallPages[i];

        if (typeof page.logicalAddress == "number") {
            AMMU.mmuInitConfig.SMALL_ADDR[i] = $addr(page.logicalAddress);
        }
        else {
            AMMU.mmuInitConfig.SMALL_ADDR[i] = page.logicalAddress;
        }

        if (typeof page.translatedAddress == "number") {
            AMMU.mmuInitConfig.SMALL_XLTE[i] = $addr(page.translatedAddress);
        }
        else {
            AMMU.mmuInitConfig.SMALL_XLTE[i] = page.translatedAddress;
        }

        /* assume translation enabled if logical != translated */
        if ((page.translationEnabled == 0)
             && (page.translatedAddress == ~0)) {
            AMMU.mmuInitConfig.SMALL_XLTE[i] = $addr(1);
        }

        policy = page.L2_writePolicy << 23;
        policy += page.L2_allocate << 22;
        policy += page.L2_posted << 21;
        policy += page.L2_cacheable << 20;
        policy += page.L1_writePolicy << 19;
        policy += page.L1_allocate << 18;
        policy += page.L1_posted << 17;
        policy += page.L1_cacheable << 16;
        policy += page.exclusion << 7;
        policy += page.prefetch << 6;
        policy += page.readOnly << 5;
        policy += page.executeOnly << 4;
        policy += page.volatileQualifier << 3;

        if (page.size == mmu.smallPageSizeEnums[0]) {
        }
        else if (page.size == mmu.smallPageSizeEnums[1]) {
            policy += 1 << 1;
        }
        else {
            AMMU.$logError("Small Page Size: " + page.size.$name.replace(/.*\./,"") +
                            " is not supported on the " + deviceName +
                            " device.", AMMU, "smallPages");
        }

        policy += page.pageEnabled;

        AMMU.mmuInitConfig.SMALL_POLICY[i] = policy;
    }

    for (var i = 0; i < mmu.numLinePages; i++) {
            page = AMMU.linePages[i];

        if (typeof page.logicalAddress == "number") {
            AMMU.mmuInitConfig.LINE_ADDR[i] = $addr(page.logicalAddress);
        }
        else {
            AMMU.mmuInitConfig.LINE_ADDR[i] = page.logicalAddress;
        }

        if (page.translationEnabled == 1) {
            if (typeof page.translatedAddress == "number") {
                AMMU.mmuInitConfig.LINE_XLTE[i] = $addr(page.translatedAddress);
            }
            else {
                AMMU.mmuInitConfig.LINE_XLTE[i] = page.translatedAddress;
            }
        }
        else {
            AMMU.mmuInitConfig.LINE_XLTE[i] = $addr(1);
        }

        AMMU.mmuInitConfig.LINE_POLICY[i] = page.pageEnabled;
    }

    page = AMMU.debugPage;

    if (page.translationEnabled == 1) {
        if (typeof page.translatedAddress == "number") {
            AMMU.mmuInitConfig.DEBUG_XLTE = $addr(page.translatedAddress);
        }
        else {
            AMMU.mmuInitConfig.DEBUG_XLTE = page.translatedAddress;
        }
    }
    else {
        AMMU.mmuInitConfig.DEBUG_XLTE = $addr(1);
    }

    AMMU.mmuInitConfig.DEBUG_POLICY = AMMU.debugPage.pageEnabled;

    AMMU.mmuInitConfig.MAINT = 0;
    AMMU.mmuInitConfig.MSTART = null;
    AMMU.mmuInitConfig.MEND = null;
    AMMU.mmuInitConfig.MSTAT = 0;

    AMMU.numLargePages = mmu.numLargePages;
    AMMU.numMediumPages = mmu.numMediumPages;
    AMMU.numSmallPages = mmu.numSmallPages;
    AMMU.numLinePages = mmu.numLinePages;

    AMMU.baseAddr = mmu.baseAddr;

    AMMU.largePageSizeStrings = mmu.largePageSizeStrings;
    AMMU.mediumPageSizeStrings = mmu.mediumPageSizeStrings;
    AMMU.smallPageSizeStrings = mmu.smallPageSizeStrings;
}

/*
 *  ======== pageSizeFilter ========
 */
function pageSizeFilter (op, cfgparam, value) {
    var result = null;

    var pageArray, field;
    var cp = cfgparam;

    if (cp.indexOf(".") != -1) {
        pageArray = new String(cp.substring(0, cp.indexOf("."))) + '' ;
        field = new String(cp.substring(cp.lastIndexOf(".") + 1)) + '' ;
    }
    else {

    }

    if (pageArray in this) {

        switch (pageArray + '') {

            case 'largePages':

                switch (field + '') {

                    case 'size':
                        if (op == 0) {
                            result = [mmu.largePageSizeStrings[0], mmu.largePageSizeStrings[1]];
                        }
                        else {
                            if (value == mmu.largePageSizeStrings[0]) {
                                result = mmu.largePageSizeEnums[0].$name;
                            }
                            else {
                                result = mmu.largePageSizeEnums[1].$name;
                            }
                            result = [new String(result.substring(result.lastIndexOf(".") + 1)) + ''];
                        }
                        break;

                    default:
                        result = null;
                        break;
                }
                break;

            case 'mediumPages':

                switch (field + '') {

                    case 'size':
                        if (op == 0) {
                            result = [mmu.mediumPageSizeStrings[0], mmu.mediumPageSizeStrings[1]];
                        }
                        else {
                            if (value == mmu.mediumPageSizeStrings[0]) {
                                result = mmu.mediumPageSizeEnums[0].$name;
                            }
                            else {
                                result = mmu.mediumPageSizeEnums[1].$name;
                            }
                            result = [new String(result.substring(result.lastIndexOf(".") + 1)) + ''];
                        }
                        break;

                    default:
                        result = null;
                        break;
                }
                break;

            case 'smallPages':

                switch (field + '') {

                    case 'size':
                        if (op == 0) {
                            result = [mmu.smallPageSizeStrings[0], mmu.smallPageSizeStrings[1]];
                        }
                        else {
                            if (value == mmu.smallPageSizeStrings[0]) {
                                result = mmu.smallPageSizeEnums[0].$name;
                            }
                            else {
                                result = mmu.smallPageSizeEnums[1].$name;
                            }
                            result = [new String(result.substring(result.lastIndexOf(".") + 1)) + ''];
                        }
                        break;

                    default:
                        result = null;
                        break;
                }
                break;

            default:
                result = null;
                break;
        }

    }

    return (result);
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
    for (var i = 0; i < mmu.numLargePages; i++) {
        if (AMMU.largePages[i].size == mmu.largePageSizeEnums[0]) {
        }
        else if (AMMU.largePages[i].size == mmu.largePageSizeEnums[1]) {
        }
        else {
            AMMU.$logError("Large Page Size: " + AMMU.largePages[i].size.$name.replace(/.*\./,"") +
                            " is not supported on the " + deviceName +
                            " device.", AMMU, "largePages");
        }
    }

    for (var i = 0; i < mmu.numMediumPages; i++) {
        if (AMMU.mediumPages[i].size == mmu.mediumPageSizeEnums[0]) {
        }
        else if (AMMU.mediumPages[i].size == mmu.mediumPageSizeEnums[1]) {
        }
        else {
            AMMU.$logError("Large Page Size: " + AMMU.mediumPages[i].size.$name.replace(/.*\./,"") +
                            " is not supported on the " + deviceName +
                            " device.", AMMU, "mediumPages");
        }
    }

    for (var i = 0; i < mmu.smallMediumPages; i++) {
        if (AMMU.smallPages[i].size == mmu.smallPageSizeEnums[0]) {
        }
        else if (AMMU.smallPages[i].size == mmu.smallPageSizeEnums[1]) {
        }
        else {
            AMMU.$logError("Large Page Size: " + AMMU.smallPages[i].size.$name.replace(/.*\./,"") +
                            " is not supported on the " + deviceName +
                            " device.", AMMU, "smallPages");
        }
    }
}

/*
 *  ======== viewGetPolicy ========
 *  Used as a helper function for the viewPages function
 */
function viewGetPolicy(elem, policyVal)
{
    elem.Enabled = policyVal & 0x1;
    elem.L2WrPolicy = policyVal & (0x1 << 23) ?
        "Write Back" : "Write Through";
    elem.L2AllocPolicy = policyVal & (0x1 << 22) ?
        "Follow sideband" : "No writes allocated";
    elem.L2Posted = (policyVal & (0x1 << 21)) != 0;
    elem.L2Cacheable = (policyVal & (0x1 << 20)) != 0;
    elem.L1WrPolicy = policyVal & (0x1 << 19) ?
        "Write Back" : "Write Through";
    elem.L1AllocPolicy = policyVal & (0x1 << 18) ?
        "Follow sideband" : "No writes allocated";
    elem.L1Posted = (policyVal & (0x1 << 17)) != 0;
    elem.L1Cacheable = (policyVal & (0x1 << 16)) != 0;
    elem.ReadOnly = (policyVal & (0x1 << 5)) != 0;
    elem.ExecOnly = (policyVal & (0x1 << 4)) != 0;
}

/*
 *  ======== viewPages ========
 */
function viewPages(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var AMMU = xdc.useModule('ti.sysbios.hal.ammu.AMMU');
    var AMMUcfg = Program.getModuleConfig('ti.sysbios.hal.ammu.AMMU');

    var ammuAttributes = Program.fetchStruct(AMMU.MMU$fetchDesc,
        AMMUcfg.baseAddr, false);

    /* Small pages */
    for (var i = 0; i < AMMUcfg.numSmallPages; i++) {
        var elem = Program.newViewStruct('ti.sysbios.hal.ammu.AMMU',
            'PageView');

        elem.Page = (ammuAttributes.SMALL_POLICY[i] & (0x1 << 1)) != 0 ?
            AMMUcfg.smallPageSizeStrings[1] + "_" + i :
            AMMUcfg.smallPageSizeStrings[0] + "_" + i;

        elem.AddrVirtual = ammuAttributes.SMALL_ADDR[i];
        if (ammuAttributes.SMALL_XLTE[i] & 0x1) {
            elem.AddrPhysical = "[No Translation]";
        }
        else {
            elem.AddrPhysical = "0x" +
                Number(ammuAttributes.SMALL_XLTE[i]).toString(16);
        }

        viewGetPolicy(elem, ammuAttributes.SMALL_POLICY[i]);

        /* Add the element to the list. */
        view.elements.$add(elem);
    }

    /* Medium pages */
    for (var i = 0; i < AMMUcfg.numMediumPages; i++) {
        var elem = Program.newViewStruct('ti.sysbios.hal.ammu.AMMU',
            'PageView');

        elem.Page = (ammuAttributes.MEDIUM_POLICY[i] & (0x1 << 1)) != 0 ?
            AMMUcfg.mediumPageSizeStrings[1] + "_" + i :
            AMMUcfg.mediumPageSizeStrings[0] + "_" + i;

        elem.AddrVirtual = ammuAttributes.MEDIUM_ADDR[i];
        if (ammuAttributes.MEDIUM_XLTE[i] & 0x1) {
            elem.AddrPhysical = "[No Translation]";
        }
        else {
            elem.AddrPhysical = "0x" +
                Number(ammuAttributes.MEDIUM_XLTE[i]).toString(16);
        }

        viewGetPolicy(elem, ammuAttributes.MEDIUM_POLICY[i]);

        /* Add the element to the list. */
        view.elements.$add(elem);
    }

    /* Large pages */
    for (var i = 0; i < AMMUcfg.numLargePages; i++) {
        var elem = Program.newViewStruct('ti.sysbios.hal.ammu.AMMU',
            'PageView');

        elem.Page = (ammuAttributes.LARGE_POLICY[i] & (0x1 << 1)) != 0 ?
            AMMUcfg.largePageSizeStrings[1] + "_" + i :
            AMMUcfg.largePageSizeStrings[0] + "_" + i;

        elem.AddrVirtual = ammuAttributes.LARGE_ADDR[i];
        if (ammuAttributes.LARGE_XLTE[i] & 0x1) {
            elem.AddrPhysical = "[No Translation]";
        }
        else {
            elem.AddrPhysical = "0x" +
                Number(ammuAttributes.LARGE_XLTE[i]).toString(16);
        }

        viewGetPolicy(elem, ammuAttributes.LARGE_POLICY[i]);

        /* Add the element to the list. */
        view.elements.$add(elem);
    }
}

