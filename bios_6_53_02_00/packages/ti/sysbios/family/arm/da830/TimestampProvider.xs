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
 *  ======== TimestampProvider.xs ========
 *
 */

var Hwi = null;
var TimestampProvider = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }
    TimestampProvider = this;
    /* set fxntab default */
    TimestampProvider.common$.fxntab = false;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule('ti.sysbios.family.arm.da830.Hwi');
    xdc.useModule('ti.sysbios.BIOS');
    Startup = xdc.useModule('xdc.runtime.Startup');

    var Diags = xdc.useModule('xdc.runtime.Diags');

    for (var dl in TimestampProvider.common$) {
        if (dl.match(/^diags_/) && dl != 'diags_ASSERT') {
            TimestampProvider.common$[dl] = Diags.ALWAYS_OFF;
        }
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.upper32Bits = 0;
    var hwiParams = new Hwi.Params();
    /* benchmarks counter interrupts are tied to NINT which is ID 2 */
    mod.hwi = Hwi.create(2, '&ti_sysbios_family_arm_da830_TimestampProvider_overflowHandler__I', hwiParams);
}


/*
 *  ======== module$validate ========
 */
function module$validate()
{
    if ((TimestampProvider.benchmarkCounterId == 0) 
        && (TimestampProvider.countType 
            == TimestampProvider.CountType_INSTRUCTIONS)) {
        TimestampProvider.$logError("TimestampProvider.CountType_INSTRUCTIONS"
                                    + " not supported on benchmarkCounter 0.",
                                    TimestampProvider, "benchmarkCounterId");
    }
}

/*
 *  ======== module$view$init ========
 */
function module$view$init(view, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');
}


/*
 *  ======== getFreqMeta ========
 */
function getFreqMeta()
{
    var BIOS = xdc.module("ti.sysbios.BIOS");

    return (BIOS.getCpuFreqMeta());
}
