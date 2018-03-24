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
 *  ======== Pmu.xs ========
 */

var Pmu = null;
var catalogName;

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "ti.catalog.arm.cortexa8": {
            "TMS320DM8168": {
                intNum  : 3
            }
        },
        "ti.catalog.arm.cortexa15": {
            /*
             * This is a SPI interrupt. SPI interrupt numbering starts from 0 in
             * the TRM and is offset by 32 relative to the start of GIC
             * interrupt numbering. Add 32 to account for this 32 offset
             */
            "DRA7XX": {
                intNum  : 131 + 32
            },
            "TCI6636K2H": {
                intNum  : 20 + 32
            },
            "TCI66AK2G02": {
                intNum  : 4 + 32
            }
        },
        "ti.catalog.arm.cortexr5": {
            "RM57D8XX": {
                intNum  : 22
            }
        }
    };

    deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8148"] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8168"];
    deviceTable["ti.catalog.arm.cortexa8"]["TMS320C3.*"]   =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8168"];
    deviceTable["ti.catalog.arm.cortexa8"]["OMAP3.*"]      =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8168"];
    deviceTable["ti.catalog.arm.cortexa8"]["AM35.*"]       =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8168"];
    deviceTable["ti.catalog.arm.cortexa8"]["TMS320.*81.."] =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8168"];
    deviceTable["ti.catalog.arm.cortexa8"]["AM335.*"]      =
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8168"];

    deviceTable["ti.catalog.arm.cortexa15"]["Vayu"] =
        deviceTable["ti.catalog.arm.cortexa15"]["DRA7XX"];
    deviceTable["ti.catalog.arm.cortexa15"]["OMAP5430"] =
        deviceTable["ti.catalog.arm.cortexa15"]["DRA7XX"];
    deviceTable["ti.catalog.arm.cortexa15"]["C66AK2E05"] =
        deviceTable["TCI6636K2H"];
    deviceTable["ti.catalog.arm.cortexa15"]["TCI6630K2L"] =
        deviceTable["ti.catalog.arm.cortexa15"]["TCI6636K2H"];
    deviceTable["ti.catalog.arm.cortexa15"]["TCI6638K2K"] =
        deviceTable["ti.catalog.arm.cortexa15"]["TCI6636K2H"];

    deviceTable["ti.catalog.arm.cortexr5"]["TMS570DC.*"] =
        deviceTable["ti.catalog.arm.cortexr5"]["RM57D8XX"];
    deviceTable["ti.catalog.arm.cortexr5"]["RM57D8.*"] =
        deviceTable["ti.catalog.arm.cortexr5"]["RM57D8XX"];

}

/*
 *  ======== deviceSupportCheck ========
 *  Check validity of device
 */
function deviceSupportCheck()
{
    /* look for exact match first */
    for (deviceName in deviceTable[catalogName]) {
        if (deviceName == Program.cpu.deviceName) {
            return deviceName;
        }
    }

    /* now look for a wildcard match */
    for (deviceName in deviceTable[catalogName]) {
        if (Program.cpu.deviceName.match(deviceName)) {
            return deviceName;
        }
    }

    return null;
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

    Pmu = this;

    catalogName = Program.cpu.catalogName;
    var device = deviceSupportCheck();

    if (device) {
        Pmu.intNum = deviceTable[catalogName][device].intNum;
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule("ti.sysbios.hal.Hwi");
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.numCounters = 0;
    mod.interruptFunc = Pmu.interruptFunc;

    if ((Pmu.intNum == (~0)) && (mod.interruptFunc != null)) {
        Pmu.$logError("PMU interrupt number not known. Cannot create a Hwi " +
                "and register callback interrupt function. Please specify " +
                "interrupt number in the *.cfg file using Pmu.intNum config " +
                "param.", Pmu);
    }

    if (mod.interruptFunc != null) {
        var hwiParams = new Hwi.Params();
        mod.hwiHandle = Hwi.create(Pmu.intNum, Pmu.interruptHandler, hwiParams);
    }
    else {
        mod.hwiHandle = null;
    }
}

/*
 *  ======== viewInitPmuInfo ========
 */
function viewInitPmuInfo(view)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Pmu = xdc.useModule('ti.sysbios.family.arm.v7a.Pmu');

    try {
        var pmuRawView = Program.scanRawView('ti.sysbios.family.arm.v7a.Pmu');
    }
    catch (e) {
        return null;
    }
    try {
        var modState = Program.fetchStruct(Pmu.Module_State$fetchDesc,
                             pmuRawView.modState.$addr);
    }
    catch (e) {
        return null;
    }

    var pmuView =
        Program.newViewStruct('ti.sysbios.family.arm.v7a.Pmu', 'Pmu Info');

    pmuView.numEventCounters = modState.numCounters;

    var pmuList = new Array();

    pmuList[0] = pmuView;

    view.elements = pmuList;

    return (view);
}
