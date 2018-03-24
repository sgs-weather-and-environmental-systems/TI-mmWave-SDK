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
 *  ======== GateDualCore.xs ========
 *
 */

var BIOS = null;
var Build = null;
var Core = null;
var GateDualCore = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    GateDualCore = this;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.module('ti.sysbios.BIOS');

    Build = xdc.module("ti.sysbios.Build");

    if (BIOS.smpEnabled == true) {
        GateDualCore.$logError("The ti.sysbios.family.arm.ducati.GateDualCore "
            + "module is for use with non-SMP applications only!. "
            + "For SMP applications, use the "
            + "ti.sysbios.family.arm.ducati.GateSmp module",
            GateDualCore);
        
    }
    
    Core = xdc.useModule("ti.sysbios.family.arm.ducati.Core");

    /* 
     * Initialization of the array of gate objects must be precisely managed
     * By default, core 0 has the honors.
     */
    if (GateDualCore.initGates === undefined) {
        if (Core.id == 0) {
            GateDualCore.initGates = true;
        }
        else {
            GateDualCore.initGates = false;
        }
    }
    
    /* add -D to compile line to optimize enter/leave code */
    Build.ccArgs.$add("-Dti_sysbios_family_arm_ducati_GateDualCore_enableStats__D=" + 
        (GateDualCore.enableStats ? "TRUE" : "FALSE"));
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{

    for (var i = 0; i < GateDualCore.numGates; i++) {
        mod.usedGates[i] = 0;
    }

    if (Program.sectMap[".ducatiGates"] === undefined) {
        Program.sectMap[".ducatiGates"] = new Program.SectionSpec();
        Program.sectMap[".ducatiGates"].loadAddress =
            GateDualCore.gateArrayAddress;
        if (Program.build.target.$name.match(/gnu/)) {
            Program.sectMap[".ducatiGates"].runAddress =
                GateDualCore.gateArrayAddress;
        }
    }

    /* 
     * Initialization of the array of gate objects must be 
     * performed per the 'GateDualCore.initGates' setting.
     *
     * Make sure the boot code doesn't zero it out for us.
     */
    if (Program.build.target.$name.match(/gnu/)) {
        Program.sectMap[".ducatiGates"].type = "NOLOAD";
    }
    else {
        Program.sectMap[".ducatiGates"].type = "NOINIT";
    }
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, params)
{
    var mod = this.$module.$object;
    var index = params.index;

    if (index > GateDualCore.numGates - 1) {
        GateDualCore.$logError("Invalid Gate index", this, index);
    }
    else if (mod.usedGates[index] != 0) {
        GateDualCore.$logError("Gate already in use", this, index);
    }
    else {
        mod.usedGates[index] = 1;
    }

    obj.index = index;
    obj.gatePtr = null;
    obj.gateBytePtr = null;
    obj.stalls = 0;
    obj.noStalls = 0;
    obj.totalStalls = 0;
    obj.maxStall = 0;
}

/*
 *  ======== viewInitBasic ========
 *  Initialize the 'Basic' Timer instance view.
 */
function viewInitBasic(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');

    view.label       = Program.getShortName(obj.$label);
    view.index       = obj.index;

    var gateArray = Program.fetchArray(
            {   type: 'xdc.rov.support.ScalarStructs.S_UInt32', 
                isScalar: true
            }, 
            Program.getSymbolValue("ti_sysbios_family_arm_ducati_GateDualCore_gateArray"),
            view.index+1, false);

    view.gateValue = String($addr(gateArray[view.index]));

    switch (gateArray[view.index]) {
        case 0x00000000:
            view.owner = "None";
            break;
        case 0x00000001:
            view.owner = "Core 0";
            break;
        case 0x00000100:
            view.owner = "Core 1";
            break;
        case 0x00000101:
            view.owner = "In Contention";
            break;
        default:
            view.owner = "Invalid";
            view.$status["owner"] = "Invalid gate value!";
            break;
    }

    view.stalls      = obj.stalls;     
    view.noStalls    = obj.noStalls;   
    view.totalStalls = obj.totalStalls;
    view.maxStall    = obj.maxStall;   
}

/*
 *  ======== queryMeta ========
 */
function queryMeta(qual)
{
    return (false);
}
