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
 *  ======== Core.xs ========
 */

var Hwi = null;
var Core = null;
var BIOS = null;
var Task = null;
var Build = null;
var HalHwi = null;
var Memory = null;
var Startup = null;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.M3":
        case "ti.targets.arm.elf.M4":
        case "ti.targets.arm.elf.M4F":
            if (BIOS.smpEnabled == true) {
                return (["Core_smp_asm.sv7M"]);
            }
            else {
                return (["Core_asm.sv7M"]);
            }
            break;

        case "gnu.targets.arm.M3":
        case "gnu.targets.arm.M4":
        case "gnu.targets.arm.M4F":
            if (BIOS.smpEnabled == true) {
                return (["Core_smp_asm_gnu.sv7M"]);
            }
            else {
                return (["Core_asm_gnu.sv7M"]);
            }
            break;

        case "iar.targets.arm.M3":
        case "iar.targets.arm.M4":
        case "iar.targets.arm.M4F":
            return (null);
            break;

        default:
            return (null);
    }
}

/*
 * ======== getCFiles ========
 * return the array of C language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getCFiles(targetName)
{
    if (BIOS.smpEnabled) {
        return (["Core_smp.c"]);
    }
    else {
        return (["Core.c"]);
    }
}

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "TMS320C6A8168": {
        },
    };
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

    /* provide getCFiles() for Build.getCFiles() */
    this.$private.getCFiles = getCFiles;

    Core = this;

    Core.id = 0;

    /* devices in deviceTable have logically only one core, core 1 */
    for (device in deviceTable) {
        if (device == Program.cpu.deviceName) {
            Core.id = 1;
            return;
        }
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.module("ti.sysbios.family.arm.m3.Hwi");
    Task = xdc.module('ti.sysbios.knl.Task');
    Build = xdc.module('ti.sysbios.Build');
    TaskSupport = xdc.module('ti.sysbios.family.arm.m3.TaskSupport');
    BIOS = xdc.module('ti.sysbios.BIOS');
    Memory = xdc.module('xdc.runtime.Memory');
    Power = xdc.module('ti.sysbios.family.arm.ducati.smp.Power');
    Startup = xdc.useModule('xdc.runtime.Startup');
    HalHwi = xdc.module('ti.sysbios.hal.Hwi');

    Core.common$.fxntab = false;

    if (BIOS.smpEnabled == true) {
        if (Core.id != 0) {
             Core.$logFatal("Invalid Core.id: " + Core.id + 
                       ", must be 0.", 
                       Core, "id");
        }
    }
    else {
        if ( (Core.id != 0) && (Core.id != 1) ) {
             Core.$logFatal("Invalid Core.id: " + Core.id + 
                       ", must be 0 or 1.", 
                       Core, "id");
        }
    }

    /* 
     * by default, Core 0's vector table is placed at 0x400
     * and Core 1's vector table is placed at 0x800
     */

    if ((Hwi.resetVectorAddress == 0) && (Hwi.vectorTableAddress == 0)) {

        /* 
         * generate and place a single, core-specific const vector table 
         */

        Hwi.resetVectorAddress = (Core.id + 1) * 0x400;
        Hwi.vectorTableAddress = Hwi.resetVectorAddress;

        if (Power.$used) {
            if (Power.enable) {
                /* place Power moduleboot code at 0 */
                Program.sectMap[".ducatiPowerBoot"] = new Program.SectionSpec();
                Program.sectMap[".ducatiPowerBoot"].loadAddress = 0;
                if (Program.build.target.$name.match(/gnu/)) {
                    Program.sectMap[".ducatiPowerBoot"].runAddress = 0;
                }
            }
            else {
                /* place common boot code at 0 */
                Program.sectMap[".ducatiBoot"] = new Program.SectionSpec();
                Program.sectMap[".ducatiBoot"].loadAddress = 0;
                if (Program.build.target.$name.match(/gnu/)) {
                    Program.sectMap[".ducatiBoot"].runAddress = 0;
                }
            }
        }
        else {
            /* place common boot code at 0 */
            Program.sectMap[".ducatiBoot"] = new Program.SectionSpec();
            Program.sectMap[".ducatiBoot"].loadAddress = 0;
            if (Program.build.target.$name.match(/gnu/)) {
                Program.sectMap[".ducatiBoot"].runAddress = 0;
            }
        }
    }

    /* Set up for SMP, if enabled */
    if (BIOS.smpEnabled == true) {

        /* Create task scheduling interrupt */
        var hwiParams = new Hwi.Params();
        hwiParams.enableInt = false;
        Hwi.create(19, Core.hwiFunc);

        var GateSmp = xdc.useModule('ti.sysbios.family.arm.ducati.GateSmp');
        Core.gate = GateSmp.create();

        /* configure Core 1's Hwi stack size */
        if (Core.core1HwiStackSize == undefined) {
            Core.core1HwiStackSize = Program.stack;
        }

        /* install our startCore1 func */
        Task.startupHookFunc = Core.startCore1;

        /* install our atexit func */
        var System = xdc.module('xdc.runtime.System');
        System.atexitMeta(Core.atexit);

        Core.initStackFlag = HalHwi.initStackFlag;
    }
    else {
        Startup.lastFxns.$add(Core.startCore1);
        Core.core1HwiStackSize = 0;
        Core.gate = null;
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.core1HwiStack.length = Core.core1HwiStackSize;
    mod.schedulerInts[0] = 0;
    mod.schedulerInts[1] = 0;
    mod.exitFlag = false;
    mod.gateEntered[0] = false;
    mod.gateEntered[1] = false;

    /* add -D to compile line to optimize exception code */
    Build.ccArgs.$add("-Dti_sysbios_family_arm_ducati_Core_initStackFlag__D=" +
        (Core.initStackFlag ? "TRUE" : "FALSE"));
}
