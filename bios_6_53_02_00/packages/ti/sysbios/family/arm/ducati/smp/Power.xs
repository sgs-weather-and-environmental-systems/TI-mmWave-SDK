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
 *  ======== Power.xs ========
 *
 */

var BIOS = null;
var Power = null;
var GateSmp = null;
var Idle = null;
var Task = null;
var Semaphore = null;

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
            return (["Power_resumeCpu.sv7M", "Power_saveCpu.sv7M"]);
            break;

        case "gnu.targets.arm.M3":
        case "gnu.targets.arm.M4":
        case "gnu.targets.arm.M4F":
            return (["Power_resumeCpu_gnu.sv7M", "Power_saveCpu_gnu.sv7M"]);
            break;

        case "iar.targets.arm.M3":
        case "iar.targets.arm.M4":
        case "iar.targets.arm.M4F":
            return (null);
            break;

	default:
            return (null);
            break;
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
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Power = this;

    BIOS = xdc.module('ti.sysbios.BIOS');

    if (BIOS.smpEnabled == false) {
        Power.$logError("The ti.sysbios.family.arm.ducati.smp.Power "
            + "module is for use with SMP applications only!. ", Power);
    }
    
    xdc.useModule('ti.sysbios.hal.unicache.Cache');
    xdc.useModule('ti.sysbios.hal.ammu.AMMU');
    xdc.useModule('ti.sysbios.family.arm.ducati.Core');
    xdc.useModule('ti.sysbios.family.arm.ducati.CTM');
    xdc.useModule('ti.sysbios.family.arm.m3.Hwi');

    Task = xdc.useModule('ti.sysbios.knl.Task');

    Semaphore = xdc.useModule('ti.sysbios.knl.Semaphore');

    Idle = xdc.useModule('ti.sysbios.knl.Idle');

    GateSmp = 
        xdc.useModule('ti.sysbios.family.arm.ducati.GateSmp');

    /* set fxntab default */
    Power.common$.fxntab = false;
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    
    /* if enabled: create other objects ... */
    if (Power.enable == true) {

        /* if enabled to idle the CPU: plug the idling function */
        if (Power.idle == true) {

            /*  plug the idling function to the Idle loops */
            Idle.addCoreFunc(Power.idleCPU, 0);
            Idle.addCoreFunc(Power.idleCPU, 1);
        }

        /* create Power task on each core */
        var tskParams = new Task.Params();
        tskParams.affinity = 0;
        tskParams.priority = Task.numPriorities - 1;
        tskParams.instance.name = 
            "ti.sysbios.family.arm.ducati.smp.Power.taskFxnCore0";
        Power.taskCore0 = Task.create(Power.taskFxnCore0, tskParams);
        tskParams.affinity = 1;
        tskParams.instance.name = 
            "ti.sysbios.family.arm.ducati.smp.Power.taskFxnCore1";
        Power.taskCore1 = Task.create(Power.taskFxnCore1, tskParams);

        /* create a semaphore for each of the tasks */
        Power.semCore0 = Semaphore.create(0);
        Power.semCore1 = Semaphore.create(0);

        /* create sync gate */
        Power.gate = GateSmp.create();
    }
    else {
        Power.taskCore0 = null;
        Power.taskCore1 = null;
        Power.semCore0 = null;
        Power.semCore1 = null;
        Power.gate = null;
    }

    /* initialize module state */
    mod.dmaChan0 = -1;
    mod.resetFlag0 = 0;
    mod.resetFlag1 = 0;
    mod.intMask31_0 = 0;
    mod.intMask63_32 = 0;
    mod.intMask79_64 = 0;

    /* steer Power code and data to external RAM */ 
    Program.sectMap[".ti_sysbios_family_arm_ducati_smp_Power"] =
        Power.loadSegment;

}
