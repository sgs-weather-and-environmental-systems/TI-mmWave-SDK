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

var BIOS = null;
var Cache = null;
var Mmu = null;
var Startup = null;
var Reset = null;
var Build = null;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "gnu.targets.arm.A15F":
            return (["Cache_asm_gnu.asm"]);
            break;

        default:
            return (null);
	    break;
    }
}

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "Vayu": {
            errata798870   : true
        },
        "OMAP5430": {
            errata798870   : true
        },
        "TCI6636K2H": {
            errata798870   : false
        },
        "TCI66AK2G02": {
            errata798870   : false
        },
    };

    deviceTable["DRA7XX"] = deviceTable["Vayu"];
    deviceTable["C66AK2E05"] = deviceTable["TCI6636K2H"];
    deviceTable["TCI6630K2L"] = deviceTable["TCI6636K2H"];
    deviceTable["TCI6638K2K"] = deviceTable["TCI6636K2H"];
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
            return (device);
        }
    }

    /* now look for a wildcard match */
    for (device in deviceTable) {
        if (Program.cpu.deviceName.match(device)) {
            return (device);
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
        catalogName = catalog.$modules[i].$name.substring(
                Program.cpu.catalogName.length + 1);

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

    print("The " + Program.cpu.deviceName +
          " device is not currently supported.");
    print("The following devices are supported for the " +
          Program.build.target.name + " target:");

    for (var i=0; i<sd.length; i++) {
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
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.module('ti.sysbios.BIOS');
    Mmu = xdc.useModule('ti.sysbios.family.arm.a15.Mmu');
    Startup = xdc.useModule('xdc.runtime.Startup');
    Reset = xdc.useModule('xdc.runtime.Reset');
    Build = xdc.module('ti.sysbios.Build');

    if (BIOS.smpEnabled) {
        Cache.$logError("This module does not support SMP mode. Please use " +
            "ti.sysbios.family.arm.a15.smp.Cache module instead.", Cache);
    }

    /* Enable cache early */
    Reset.fxns[Reset.fxns.length++] = Cache.startup;
    Startup.firstFxns.$add(Cache.initModuleState);

    var device = deviceSupportCheck();

    if (Cache.$written("errata798870") != true) {
        Cache.errata798870 = deviceTable[device].errata798870;
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

    /* add -D to compile line to optimize cache code */
    Build.ccArgs.$add("-Dti_sysbios_family_arm_a15_Cache_errata798870__D=" +
        (Cache.errata798870 ? "TRUE" : "FALSE"));
}

/*
 *  ======== viewInitCacheInfo ========
 */
function viewInitCacheInfo(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Cache = xdc.useModule('ti.sysbios.family.arm.a15.Cache');

    try {
        var cacheRawView = Program.scanRawView('ti.sysbios.family.arm.a15.Cache');
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
        Program.newViewStruct('ti.sysbios.family.arm.a15.Cache', 'Cache Info');

    var numsets = ((info&0x0fffe000)>>13)+1;
    var ways = ((info&0x01ff8)>>3)+1;
    var exp = (info&0x7) + 2;
    var linesize = 4;
    while (exp--) { 
        linesize *= 2;
    }

    view.cache = name;
    view.ways = ways;
    view.waySize = numsets * linesize;
    view.lineSize = linesize;
    view.cacheSize = numsets * ways * linesize;

    return (view);
}
