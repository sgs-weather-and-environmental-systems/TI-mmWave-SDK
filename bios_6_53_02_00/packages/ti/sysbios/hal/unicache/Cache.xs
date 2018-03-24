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
var Reset = null;
var catalogName = null;
var deviceName = null;
var cache = null;
var gateModule = null;
var Hwi = null;
var AMMU = null;

if (xdc.om.$name == "cfg") {
    var deviceTable = {
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
                gateModule: "ti.sysbios.family.arm.ducati.GateDualCore",
                cache: {
                    baseAddr: 0x40000000,
                    l2CacheSupported: false,
                    l1EventId: 0,
                    l1IntNum: 17,
                    l1IntPriority: -1,
                    maxLineModeBufSize: 1024,
                },
            },
            "TMS320C6A8168": {
                gateModule: "ti.sysbios.gates.GateHwi", /* single M3 core */
                cache: {
                    baseAddr: 0x40000000,
                    l2CacheSupported: false,
                    l1EventId: 0,
                    l1IntNum: 17,
                    l1IntPriority: -1,
                    maxLineModeBufSize: 1024,
                },
            },
            "OMAP4430": {
                gateModule: "ti.sysbios.family.arm.ducati.GateDualCore",
                cache: {
                    baseAddr: 0x40000000,
                    l2CacheSupported: false,
                    l1EventId: 0,
                    l1IntNum: 17,
                    l1IntPriority: -1,
                    maxLineModeBufSize: 1024,
                },
            },
        },
        "ti.catalog.arm.cortexm4": {
            "OMAP5430": {
                gateModule: "ti.sysbios.family.arm.ducati.GateDualCore",
                cache: {
                    baseAddr: 0x40000000,
                    l2CacheSupported: false,
                    l1EventId: 0,
                    l1IntNum: 17,
                    l1IntPriority: -1,
                    maxLineModeBufSize: 1024,
                },
            },
        },
        "ti.catalog.c6000": {
            "OMAP4430": {
                gateModule: "ti.sysbios.gates.GateHwi",
                cache: {
                    baseAddr: 0x01c30000,
                    l2CacheSupported: true,
                    l1EventId: 123,
                    l1IntNum: 12,
                    l1IntPriority: -1,
                    l2EventId: 124,
                    l2IntNum: 13,
                    l2IntPriority: -1,
                    maxLineModeBufSize: 4096,
                },
            },
        },
    };

    deviceTable["ti.catalog.arm"]["TMS320CDM740"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320DM8148"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI811X"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI813X"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI814X"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320DM8168"] =
            deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320C6A8149"] =
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

    Cache = this;

    BIOS = xdc.module('ti.sysbios.BIOS');

    catalogName = Program.cpu.catalogName;

    /* loop through the device table */
    for (deviceName in deviceTable[catalogName]) {
        if (deviceName == Program.cpu.deviceName) {
            cache = deviceTable[catalogName][deviceName].cache;
            break;
        }
    }

    if (cache == null) {
        print("Unicache is not supported for the specified device (" +
            Program.cpu.deviceName + ").");
        if (deviceTable[catalogName] != null) {
            print("The following devices within the " + catalogName +
                " catalog are supported:");
            for (device in deviceTable[catalogName]) {
                print("\t" + device);
            }
        }
        throw new Error ("Unicache unsupported on device!");
    }

    Cache.baseAddr = cache.baseAddr;
    Cache.maxLineModeBufSize = cache.maxLineModeBufSize;

    Cache.l2CacheSupported = cache.l2CacheSupported;

    /* if Ducati/Benelli, plug Cache.excHandlerAsm into interrupt vector */
    if (Program.build.target.$name.match(/M3/) || Program.build.target.$name.match(/M4/)) {
        /*
         * linker script sets Cache_excHandlerAsm to Hwi_excHandlerAsm
         * (Done to match Hwi function prototype requirements)
         */
        Cache.l1InterruptHandler = $externModFxn("ti_sysbios_family_arm_m3_Hwi_excHandlerAsm__I");
        Cache.l1InterruptPriority = 0; /* force non-dispatched interrupt */
    }
    else {
        Cache.l1InterruptHandler = Cache.ISR;
        Cache.l1InterruptPriority = cache.l1IntPriority;
    }
    Cache.l1InterruptNumber = cache.l1IntNum;

    Cache.l2InterruptHandler = Cache.ISR;
    Cache.l2InterruptNumber = cache.l2IntNum;
    Cache.l2InterruptPriority = cache.l2IntPriority;
}

/*
 *  ======== module$use ========
 */
function module$use ()
{
    if (Program.build.target.$name.match(/M3/) || Program.build.target.$name.match(/M4/)) {
        Hwi = xdc.useModule("ti.sysbios.family.arm.m3.Hwi");
    }
    else {
        Hwi = xdc.useModule("ti.sysbios.family.c64p.Hwi");
    }
    AMMU = xdc.useModule("ti.sysbios.hal.ammu.AMMU");
    Reset = xdc.useModule("xdc.runtime.Reset");

    Reset.fxns[Reset.fxns.length++] = Cache.startup;

    if (BIOS.smpEnabled == true) {
        gateModule = xdc.useModule('ti.sysbios.gates.GateHwi', true);
    }
    else {
        gateModule = xdc.useModule(deviceTable[catalogName][deviceName].gateModule, true);
    }

    if (Cache.common$.gate === undefined) {
        Cache.common$.gate = gateModule.create();
    }

    if (Cache.enableCache == true) {
        Cache.configureCache = true;
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    Cache.l1ocpConfig = (params.ocpL1.wrap << 0) |
                        (params.ocpL1.wrbuffer << 1) |
                        (params.ocpL1.prefetch << 4);

    Cache.l1secConfig = (params.configL1.secure << 0) |
                        (params.configL1.nbypass << 1) |
                        (params.configL1.secint << 2) |
                        (params.configL1.secport << 3) |
                        (params.configL1.secmain << 4);

    Cache.l2ocpConfig = (params.ocpL2.wrap << 0) |
                        (params.ocpL2.wrbuffer << 1) |
                        (params.ocpL2.prefetch << 4);

    Cache.l2secConfig = (params.configL2.secure << 0) |
                        (params.configL2.nbypass << 1) |
                        (params.configL2.secint << 2) |
                        (params.configL2.secport << 3) |
                        (params.configL2.secmain << 4);

    var hwiParams = new Hwi.Params();

    hwiParams.eventId = cache.l1EventId;
    hwiParams.priority = Cache.l1InterruptPriority;
    hwiParams.arg = 1;

    Hwi.create(Cache.l1InterruptNumber, Cache.l1InterruptHandler, hwiParams);

    if (Cache.l2CacheSupported) {
        hwiParams.eventId = cache.l2EventId;
        hwiParams.priority = Cache.l2InterruptPriority;
        hwiParams.arg = 2;

        Hwi.create(Cache.l2InterruptNumber, Cache.l2InterruptHandler, hwiParams);
    }
}

/*
 *  ======== viewInitModule ========
 *  Initialize the Task module view.
 */
function viewInitModule(view, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Cache = xdc.useModule('ti.sysbios.hal.unicache.Cache');
    var ScalarStructs = xdc.useModule('xdc.rov.support.ScalarStructs');

    var CacheCfg = Program.getModuleConfig('ti.sysbios.hal.unicache.Cache');

    var cacheAttributes = Program.fetchArray(ScalarStructs.S_UInt32$fetchDesc,
        CacheCfg.baseAddr, 2, false);

    if (cacheAttributes[1].elem & 0x2) {
        view.cacheEnabled = true;
    }
    else {
        view.cacheEnabled = false;
    }
}



