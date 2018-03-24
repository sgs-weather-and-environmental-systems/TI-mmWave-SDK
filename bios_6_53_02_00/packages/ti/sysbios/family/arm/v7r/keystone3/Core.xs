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
 *  ======== Core.xs ========
 */

var Hwi = null;
var Boot = null;
var Core = null;
var Build = null;
var halCore = null;
var Reset = null;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.R5F":
            return (["Core_asm.sv7R"]);
            break;

    default:
        return (null);
        break;
    }
}

if (xdc.om.$name == "cfg" || typeof(genCdoc) != "undefined") {
    var deviceTable = {
        "SIMFLEMING": {
            numCores  : 1
        }
    };

    deviceTable["SIMMAXWELL"] = deviceTable["SIMFLEMING"];
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

    return (null);
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

    /* provide getAsmFiles() for Build.getAsmFiles() */
    this.$private.getAsmFiles = getAsmFiles;

    Core = this;

    device = deviceSupportCheck();

    if (device == null) {
        print("The " + Program.cpu.deviceName +
            " device is not currently supported.");
        print("The following devices are supported for the " +
            Program.build.target.name + " target:");
        for (device in deviceTable) {
                print("\t" + device);
        }
        throw new Error ("Unsupported device!");
    }

    Core.numCores = deviceTable[device].numCores;

    /*
     * Set halCores.numCores config param. Some modules
     * like the ARM exception module read the halCore
     * module's numCores field and expect it to be set.
     */
    halCore = xdc.module('ti.sysbios.hal.Core');
    halCore.numCores = Core.numCores;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Reset = xdc.useModule('xdc.runtime.Reset');

    Core.common$.fxntab = false;

    if ((Core.id != 0) && (Core.id != 1)) {
        Core.$logFatal("Invalid Core.id: " + Core.id + ", must be 0 or 1.",
            Core, "id");
    }

    Hwi = xdc.useModule('ti.sysbios.family.arm.v7r.keystone3.Hwi');
    if (!Hwi.$written("resetFunc") &&
       ((Core.numCores != 1) || (Core.resetFunc != null))) {
        Hwi.resetFunc = '&ti_sysbios_family_arm_v7r_keystone3_Core_reset';
        Core.overrideHwiResetFunc = true;
    }
    else if (Hwi.$written("resetFunc")) {
        /* Warn the user if the reset function is overridden */
        Core.$logWarning("Reset function has been changed in the cfg script" +
            " and SYS/BIOS's reset function has been overriden.", this,
            "Hwi.resetFunc");
    }

    if ((Core.numCores == 1) && (Core.id == 0)) {
        return;
    }
    else if (Core.id == 0) {
        Reset.fxns[Reset.fxns.length++] = Core.startCore1;
    }
}
