/*
 * Copyright (c) 2014-2017, Texas Instruments Incorporated
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
 *  ======== ClockFreqs.xs ========
 *
 */
var ClockFreqs;

/*
 *  ======== module$use ========
 */
function module$use()
{
    ClockFreqs = this;

    /* set fxntab default */
    ClockFreqs.common$.fxntab = false;

    /* if application has not defined any rates... set defaults */
    if ( (ClockFreqs.ACLK === undefined) && (ClockFreqs.SMCLK === undefined) &&
         (ClockFreqs.HSMCLK === undefined) ) {

        var Boot = xdc.module('ti.sysbios.family.arm.msp432.init.Boot');

        if (Boot.configureClocks == true) {

            if (Boot.speedSelect == Boot.SpeedOpt_High) {
                ClockFreqs.ACLK   = 32768;
                ClockFreqs.SMCLK  = 12000000;
                ClockFreqs.HSMCLK = 24000000;
            }
            else if (Boot.speedSelect == Boot.SpeedOpt_Medium) {
                ClockFreqs.ACLK   = 32768;
                ClockFreqs.SMCLK  = 6000000;
                ClockFreqs.HSMCLK = 6000000;
            }
            else if (Boot.speedSelect == Boot.SpeedOpt_Low) {
                ClockFreqs.ACLK   = 32768;
                ClockFreqs.SMCLK  = 3000000;
                ClockFreqs.HSMCLK = 3000000;
            }
        }
        else {
            ClockFreqs.ACLK   = 32768;
            ClockFreqs.SMCLK  = 3000000;
            ClockFreqs.HSMCLK = 3000000;
        }
    }

    /* else, if app has defined at least one, but not all... throw an error */
    else if ( ( (!(ClockFreqs.ACLK === undefined)) ||
                (!(ClockFreqs.SMCLK === undefined)) ||
                (!(ClockFreqs.HSMCLK === undefined)) ) &&
              ( (ClockFreqs.ACLK === undefined) ||
                (ClockFreqs.SMCLK === undefined) ||
                (ClockFreqs.HSMCLK === undefined) ) ) {

                throw new Error ("If one clock frequency is specified then ALL clock frequencies must be specified!");

    }

    /* else, do nothing more, just use the application-defined values */
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.ACLK = ClockFreqs.ACLK;
    mod.SMCLK = ClockFreqs.SMCLK;
    mod.HSMCLK = ClockFreqs.HSMCLK;
}

/*
 *  ======== viewInitModule ========
 *  Display the module properties in ROV
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var rawView =
        Program.scanRawView('ti.sysbios.family.arm.msp432.ClockFreqs');

    view.ACLK   = rawView.modState.ACLK
    view.SMCLK  = rawView.modState.SMCLK
    view.HSMCLK = rawView.modState.HSMCLK
}
