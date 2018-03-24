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
 *  ======== Core.xs ========
 */

var Build = null;
var Core = null;

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "SIMFLEMING": {
            baseClusterId : 2
        },
        "SIMMAXWELL": {
            baseClusterId : 0
        }
    };
}

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "gnu.targets.arm.A53F":
            return (["Core_asm_gnu.sv8A"]);
            break;

        default:
            return (null);
    }
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

    Core = this;

    /* set fxntab default */
    Core.common$.fxntab = false;

    for (var device in deviceTable) {
        if (device == Program.cpu.deviceName) {
            Core.baseClusterId = deviceTable[device].baseClusterId;
            return;
        }
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Build = xdc.module('ti.sysbios.Build');
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    /* add -D to compile line to optimize exception code */
    Build.ccArgs.$add(
        "-Dti_sysbios_family_arm_v8a_Core_bootMaster__D=" +
        (Core.bootMaster ? "TRUE" : "FALSE"));
    Build.ccArgs.$add(
        "-Dti_sysbios_family_arm_v8a_Core_baseClusterId__D=" +
        Core.baseClusterId);
}
