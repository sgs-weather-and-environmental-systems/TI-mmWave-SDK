/*
 * Copyright (c) 2012-2013, Texas Instruments Incorporated
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
var Queue = null;
var Clock = null;
var Idle = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    Power = this;

    /* set fxntab default */
    Power.common$.fxntab = false;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Queue = xdc.useModule("ti.sysbios.knl.Queue");
    Clock = xdc.useModule("ti.sysbios.knl.Clock");

    /* if using a pre-built PMI library load the pmi package */
    if (Power.pmiControlLib != Power.pmiLib_user) {
        xdc.loadPackage('ti.sysbios.family.c674.pmi');
    }

    /* if using a pre-built PSCL library load the pscl package */
    if (Power.psclConfigLib != Power.psclLib_user) {
        xdc.loadPackage('ti.sysbios.family.c674.pscl');
    }

    /*
     *  If enabled to idle the CPU: plug the idling function (Power.idleCpu
     *  is deprecated and replaced with Power.idle, so check both).
     */
    if ((Power.idle == true) || (Power.idleCpu == true)) {
        Idle = xdc.useModule('ti.sysbios.knl.Idle');

        Idle.addFunc(Power.idleFunc);
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    /* init module state */
    mod.currentSetpointCPU = 0;
    mod.currentSetpointPER = 0;
    mod.disallowedSetpointsCPU = 0;
    mod.disallowedSetpointsPER = 0;
    mod.disallowedSleepModes = 0;
    mod.nextSP = 0;
    mod.previousSP = 0;
    mod.nextSPPER = 0;
    mod.previousSPPER = 0;
    mod.numSPCPU = 0;
    mod.numSPPER = 0;
    mod.currentConfig.scaleVoltage = false;
    mod.currentConfig.waitForVoltageScale = false;
    mod.PSCLinitOK = false;
    mod.busy = false;

    /* form the capabilities mask based upon app configs */
    Power.CAPSMASK = 0;
    if (Power.trackResources) {
        Power.CAPSMASK |= Power.CRESOURCETRACKING;  
    }
    if (Power.enableScaling) {
        Power.CAPSMASK |= Power.CVFSCALING;  
    }
    if (Power.moveToSetpoints) {
        Power.CAPSMASK |= Power.CMOVEINITSPS;  
    }
    if (Power.scaleVoltage) {
        Power.CAPSMASK |= Power.CSCALEVWITHF;  
    }
    if (Power.waitVoltage) {
        Power.CAPSMASK |= Power.CWAITFORV;  
    }

    /* construct queues */
    Queue.construct(mod.constraintsQ);

    mod.notifyQ.length = 10;
    for (var i = 0; i < mod.notifyQ.length; i++) {
        Queue.construct(mod.notifyQ[i]);
    }

}

/*
 *  ======== viewInitModule ========
 *  Initialize the Power 'Module' view.
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var modRaw = Program.scanRawView("ti.sysbios.family.c674.Power");

    view.setpointCPU = modRaw.modState.currentSetpointCPU;
    view.setpointPER = modRaw.modState.currentSetpointPER;

    var maskCPU = modRaw.modState.disallowedSetpointsCPU; 
    view.maskDisallowedSetpointsCPU = "0x" + Number(maskCPU).toString(16);

    var maskPER = modRaw.modState.disallowedSetpointsPER; 
    view.maskDisallowedSetpointsPER = "0x" + Number(maskPER).toString(16);

    var maskSleep = modRaw.modState.disallowedSleepModes; 
    view.maskDisallowedSleepModes = "0x" + Number(maskSleep).toString(16);
}

