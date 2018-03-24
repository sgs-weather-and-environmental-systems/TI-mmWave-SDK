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

var Power;
var Idle;

/*
 *  ======== module$use ========
 */
function module$use()
{
    Power = this;
    Idle = xdc.useModule('ti.sysbios.knl.Idle');
    Task = xdc.module('ti.sysbios.knl.Task');

    /*
     *  Set fxntab default.  Not sure this is applicable,
     *  since Power has no instance objects, so maybe this
     *  line should be removed.
     */
    Power.common$.fxntab = false;

    if (Power.sleepPrepFunction === undefined) {
        Power.sleepPrepFunction = Power.defaultSleepPrepFunction;
    }

    var halPower = xdc.module('ti.sysbios.hal.Power');
    if (halPower.$used == false) {
        //print("ti.sysbios.hal.Power NOT USED"); // DEBUG
    }
    /* if enabled to idle the CPU: plug the idling function */
    if (Power.idle == true) {

        /* if Task used without Idle, plug the all blocked function */
        if ((Task.$used) && (Task.enableIdleTask == false)) {

            /* if the all blocked function is unplugged: plug it */
            if (Task.allBlockedFunc == null) {
                Task.allBlockedFunc = Power.blockedTaskFunction;
            }
            else if (!Idle.$used) {
                // TODO: Can this ever happen, since we called
                // xdc.useModule('ti.sysbios.knl.Idle') earlier?
                /* else, throw error: collision for the all blocked function */
                throw new Error ("Unable to plug CPU idling function; Task_allBlockedFunc is already reassigned!");
            }

            Hwi = xdc.module('ti.sysbios.family.msp430.Hwi');
            Hwi.alwaysWake = true;
        }
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    if (xdc.om.$name != "cfg") {
        return;
    }

    /* init the idleMode and newMode state vars */
    mod.idleMode = Power.idleMode;
    mod.newMode = false;

    if ((Power.idle == false) && (Power.allowDynamicMode == true)) {
        /* throw error: idling not enabled, can't allow changes to mode */
        throw new Error ("Idling not enabled, cannot allow dynamic changes to idle mode!");

    }

    /* if enabled to idle the CPU: plug the idling function */
    if (Power.idle == true) {

        /* if Task used without Idle, plug the all blocked function */
        if ((Task.$used) && (Task.enableIdleTask == false)) {
        }
        /* else if Idle is used, plug the idling function to the Idle loop */
        else if (Idle.$used) {
            Idle.addFunc(Power.idleCPU);
        }
        /* else, throw error saying can't do the idling */
        else {
            /* throw error: unable to plug the idling function */
            throw new Error ("Unable to plug CPU idling function!");
        }
    }
}
