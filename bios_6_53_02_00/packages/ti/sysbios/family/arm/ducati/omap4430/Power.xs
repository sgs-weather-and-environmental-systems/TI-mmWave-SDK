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

var Power = null;
var Reset = null;
var Core = null;
var GateDualCore = null;
var Idle = null;
var BIOS = null;

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

    if (BIOS.smpEnabled == true) {
        Power.$logError("The ti.sysbios.family.arm.ducati.omap4430.Power "
            + "module is for use with non-SMP applications only!. "
            + "For SMP applications, use the "
            + "ti.sysbios.family.arm.ducati.smp.Power module.", Power);
        
    }
    
    xdc.useModule('ti.sysbios.hal.unicache.Cache');
    xdc.useModule('ti.sysbios.hal.ammu.AMMU');
    xdc.useModule('ti.sysbios.knl.Task');
    xdc.useModule('ti.sysbios.knl.Swi');
    xdc.useModule('ti.sysbios.family.arm.ducati.Core');
    xdc.useModule('ti.sysbios.family.arm.ducati.CTM');
    xdc.useModule('ti.sysbios.family.arm.m3.Hwi');

    Reset = xdc.useModule('xdc.runtime.Reset');
    Reset.fxns[Reset.fxns.length++] = Power.resetFxn;

    Idle = xdc.useModule('ti.sysbios.knl.Idle');

    GateDualCore = 
        xdc.useModule('ti.sysbios.family.arm.ducati.GateDualCore');

    /* set fxntab default */
    Power.common$.fxntab = false;
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    /* if enabled to idle the CPU: plug the idling function */
    if (Power.idle == true) {

        /*  plug the idling function to the Idle loop */
        Idle.addFunc(Power.idleCPU);
    }

    /* create rendezvous gate */
    var gateParams = new GateDualCore.Params();
    gateParams.index = Power.rendezvousGateIndex;
    Power.rendezvousGate = GateDualCore.create(gateParams);

    /* steer Power code and data to external RAM */ 
    Program.sectMap[".ti_sysbios_family_arm_ducati_omap4430_Power"] =
        Power.loadSegment;
}
