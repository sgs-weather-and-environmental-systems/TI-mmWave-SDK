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
 *  ======== GateSmp.xs ========
 */

var Build = null;
var GateSmp = null;
var Startup = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    GateSmp = this;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Build = xdc.useModule('ti.sysbios.Build');
    Startup = xdc.useModule('xdc.runtime.Startup');
    Startup.firstFxns.$add(GateSmp.startup);

    /* add -D to compile line */
    Build.ccArgs.$add("-Dti_sysbios_family_arm_v7a_smp_GateSmp_enableStats__D="
        + (GateSmp.enableStats ? "TRUE" : "FALSE"));

    GateSmp.common$.fxntab = false;
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, params)
{
    obj.gateWord = 0;
    obj.owner = (~0);

    /* Init stats */
    obj.stalls = 0;
    obj.noStalls = 0;
    obj.totalStalls = 0;
    obj.maxStall = 0;
}

/*
 *  ======== queryMeta ========
 */
function queryMeta(qual)
{
    var rc = false;
    var IGateProvider = xdc.module('xdc.runtime.IGateProvider');

    switch (qual) {
        case IGateProvider.Q_BLOCKING:
        case IGateProvider.Q_PREEMPTING:
            rc = false;
            break;

        default:
           GateSmp.$logWarning("Invalid quality. Returning false", this, qual);
           break;
    }

    return (rc);
}

/*
 *  ======== viewInitBasic ========
 *  Initialize the 'Basic' GateSmp instance view.
 */
function viewInitBasic(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    view.label      = Program.getShortName(obj.$label);

    view.gateValue = String(obj.gateWord);

    switch (obj.owner) {
        case 0xFFFFFFFF:
            view.owner = "None";
            break;
        default:
            view.owner = "Core " + String(obj.owner);
            break;
    }

    view.stalls      = obj.stalls;
    view.noStalls    = obj.noStalls;
    view.totalStalls = obj.totalStalls;
    view.maxStall    = obj.maxStall;
}
