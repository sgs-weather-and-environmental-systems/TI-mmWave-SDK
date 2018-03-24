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
 *  ======== Cache.xs ========
 */

var Cache;
var Hwi;
var Mmu;
var Reset;
var Startup;
var l2CacheIntNum;
var supportsL2Sram;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "gnu.targets.arm.A9F":
            return (["Cache_asm_gnu.sv7A"]);
            break;

        default:
            return (null);
    }
}

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "OMAP4430": {
            l2CacheIntNum             : 32,
            l2CacheControllerAddress  : 0x48242000,
            supportsL2Sram            : false
        },
        "AM437X": {
            l2CacheIntNum             : 32,
            l2CacheControllerAddress  : 0x48242000,
            controlModuleReg          : 0x44E10000,
            supportsL2Sram            : true
        }
    };
}

/*
 *  ======== deviceSupportCheck ========
 *  Check validity of device
 */
function deviceSupportCheck()
{
    /* look for exact match first */
    for (device in deviceTable) {
        if (device == Program.cpu.deviceName) {
            return device;
            }
    }

    /* now look for a wildcard match */
    for (device in deviceTable) {
        if (Program.cpu.deviceName.match(device)) {
            return device;
            }
    }

    /*
     * no match, print all catalog devices supported
     * and then raise an error
     */
    var catalog = xdc.loadPackage(Program.cpu.catalogName);

    /* build associative array of supported devices */
    var supportedDevices = new Object();

    for (var i = 0; i < catalog.$modules.length; i++) {
        catalogName =
        catalog.$modules[i].$name.substring(Program.cpu.catalogName.length+1);
        for (device in deviceTable) {
            if (catalogName.match(device)) {
                supportedDevices[catalogName] = catalogName;
            }
        }
    }

    /* copy it into a sortable array */
    var sd = new Array();

    for (var i in supportedDevices) {
        sd[sd.length++] = i;
    }

    /* sort it for a nicer report */
    sd.sort();

    print(
            "The " +
            Program.cpu.deviceName +
            " device is not currently supported."
         );

    print(
            "The following devices are supported for the " +
            Program.build.target.name +
            " target:"
         );

    for (var i = 0; i < sd.length; i++) {
        print("\t" + sd[i]);
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

    this.$private.getAsmFiles = getAsmFiles;

    Cache = this;
    
    /* 
     *  This forces the delegate functions to be called directly.
     *  It removes indirect access to the delegate functions
     *  through a function table.
     */
    Cache.common$.fxntab = false;

    var device = deviceSupportCheck();

    if (device == "OMAP4430") {
        Cache.isOMAP4 = true;
    }

    l2CacheIntNum = deviceTable[device].l2CacheIntNum;
    supportsL2Sram = deviceTable[device].supportsL2Sram;
    Cache.l2CacheControllerAddress =
        deviceTable[device].l2CacheControllerAddress;

    if (deviceTable[device].controlModuleReg != undefined) {
        Cache.controlModuleReg = deviceTable[device].controlModuleReg;
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule('ti.sysbios.family.arm.gic.Hwi');
    Mmu = xdc.useModule('ti.sysbios.family.arm.a8.Mmu');
    Reset = xdc.useModule('xdc.runtime.Reset');
    Startup = xdc.useModule('xdc.runtime.Startup');

    /* Enable cache early */
    Startup.firstFxns.$add(Cache.startup);

    if (Cache.configureL2Sram && (supportsL2Sram == false)) {
        Cache.$logError("Configuring L2 as SRAM not supported for " + device +
                " device.", this);
    }
    else if (Cache.configureL2Sram) {
        Reset.fxns[Reset.fxns.length++] = Cache.initL2Sram;
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.l1dInfo = 0;
    mod.l1pInfo = 0;
    mod.l2Info = 0;
    mod.l2WaySize = 0;
    mod.l2NumSets = 0;
    mod.l2NumWays = 0;
    mod.l2CacheHwi = null;
    mod.pl310RTLRelease = 0;
    mod.l2ErrorStatus = 0;
    mod.lockRegister = 0;

    for (var i = 0; i < 16; i++) {
        mod.baseAddresses[i] = 0;
    }

    if (Cache.enableL2Interrupt) {
        var hwiParams = new Hwi.Params();

        if (Hwi.inUseMeta(l2CacheIntNum) == true) {
            Cache.$logError("L2 Cache interrupt " + l2CacheIntNum +
                            " already in use!", this);
            return;
        }

        mod.l2CacheHwi =
            Hwi.create(l2CacheIntNum, Cache.l2InterruptHandler, hwiParams);
    }
}

/*
 *  ======== viewInitCacheInfo ========
 */
function viewInitCacheInfo(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Cache = xdc.useModule('ti.sysbios.family.arm.a9.Cache');

    try {
        var cacheRawView = Program.scanRawView('ti.sysbios.family.arm.a9.Cache');
    }
    catch (e) {
        return null;
    }
    try {
        var modState = Program.fetchStruct(Cache.Module_State$fetchDesc, 
                             cacheRawView.modState.$addr);
    }
    catch (e) {
        return null;
    }

    var cacheList = new Array();

    cacheList[0] = viewGetLevelView(modState.l1dInfo, "L1D");
    cacheList[1] = viewGetLevelView(modState.l1pInfo, "L1P");
    cacheList[2] = viewGetLevelView(modState.l2Info, "L2");

    view.elements = cacheList;

    return (view);
}

function viewGetLevelView(info, name)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var view = 
        Program.newViewStruct('ti.sysbios.family.arm.a9.Cache', 'Cache Info');

    if (name == "L2") {
        var waysize = 0;
        switch ((info & 0x00000380) >>> 8) {
            case 0:
            case 1:
                waysize = 16384;    /* 16KB */
                break;
            case 2:
                waysize = 32768;    /* 32KB */
                break;
            case 3:
                waysize = 65536;    /* 64KB */
                break;
            case 4:
                waysize = 131072;   /* 128KB */
                break;
            case 5:
                waysize = 262144;   /* 256KB */
                break;
            case 6:
            case 7:
                waysize = 524288;   /* 512KB */
                break;
            default:
                /* impossible to get here */
                break;
        }
        var linesize = 32;
        var numsets = waysize >>> 5;
        var ways = 8 << ((info & 0x40) >> 6);
    }
    else {
        var numsets = ((info & 0x0fffe000) >> 13) + 1;
        var ways = ((info & 0x01ff8) >> 3) + 1;
        var exp = (info & 0x7) + 2;
        var linesize = 4;
        while (exp--) {
            linesize *= 2;
        }
        var waysize = numsets * linesize;
    }

    view.cache = name;
    view.ways = ways;
    view.waySize = waysize;
    view.lineSize = linesize;
    view.cacheSize = numsets * ways * linesize;

    return (view);
}


/*
 *  ======== viewInitWays ========
 */
function viewInitWays(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Cache = xdc.useModule('ti.sysbios.family.arm.a9.Cache');

    try {
        var cacheRawView =
            Program.scanRawView('ti.sysbios.family.arm.a9.Cache');
    }
    catch (e) {
        return null;
    }
    try {
        var modState = Program.fetchStruct(Cache.Module_State$fetchDesc,
                             cacheRawView.modState.$addr);
    }
    catch (e) {
        return null;
    }

    var wayList = new Array();

    for (var i = 0; i < modState.l2NumWays; i++) {
        var wayInfoView =
            Program.newViewStruct('ti.sysbios.family.arm.a9.Cache',
                                  'L2 Way Info');
        wayInfoView.number = i;
        wayInfoView.locked = (modState.lockRegister & (1 << i)) != 0;
        wayInfoView.baseAddress = modState.baseAddresses[i];
        wayList[wayList.length] = wayInfoView;
    }

    view.elements = wayList;

    return (view);
}

/*
 *  ======== viewInitErrorStatus ========
 */
function viewInitErrorStatus(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Cache = xdc.useModule('ti.sysbios.family.arm.a9.Cache');

    try {
        var cacheRawView =
            Program.scanRawView('ti.sysbios.family.arm.a9.Cache');
    }
    catch (e) {
        return null;
    }
    try {
        var modState = Program.fetchStruct(Cache.Module_State$fetchDesc,
                             cacheRawView.modState.$addr);
    }
    catch (e) {
        return null;
    }

    var errorView =
        Program.newViewStruct('ti.sysbios.family.arm.a9.Cache',
                'L2 Error Status');

    if (modState.l2ErrorStatus & 0x002) {
        errorView.TagRAMParityError = "True";
    }
    else {
        errorView.TagRAMParityError = "False";
    }

    if (modState.l2ErrorStatus & 0x004) {
        errorView.DataRAMParityError = "True";
    }
    else {
        errorView.DataRAMParityError = "False";
    }

    if (modState.l2ErrorStatus & 0x008) {
        errorView.TagRAMWriteError = "True";
    }
    else {
        errorView.TagRAMWriteError = "False";
    }

    if (modState.l2ErrorStatus & 0x010) {
        errorView.DataRAMWriteError = "True";
    }
    else {
        errorView.DataRAMWriteError = "False";
    }

    if (modState.l2ErrorStatus & 0x020) {
        errorView.TagRAMReadError = "True";
    }
    else {
        errorView.TagRAMReadError = "False";
    }

    if (modState.l2ErrorStatus & 0x040) {
        errorView.DataRAMReadError = "True";
    }
    else {
        errorView.DataRAMReadError = "False";
    }

    if (modState.l2ErrorStatus & 0x080) {
        errorView.SlaveError = "True";
    }
    else {
        errorView.SlaveError = "False";
    }

    if (modState.l2ErrorStatus & 0x100) {
        errorView.DecodeError = "True";
    }
    else {
        errorView.DecodeError = "False";
    }

    var cacheList = new Array();

    cacheList[0] = errorView;

    view.elements = cacheList;

    return (view);
}
