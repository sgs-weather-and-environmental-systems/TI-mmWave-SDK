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

var TimestampProvider;

 /*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }
    /* set fxntab default */
    this.common$.fxntab = false;
    
    TimestampProvider = this;

    /* init freq to 0 */
    TimestampProvider.freq.lo = 0;
    TimestampProvider.freq.hi = 0;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    var Diags = xdc.useModule('xdc.runtime.Diags');
    for (var dl in this.common$) {
        if (dl.match(/^diags_/) && dl != 'diags_ASSERT') {
            this.common$[dl] = Diags.ALWAYS_OFF;
        }
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    var Boot = xdc.module('ti.catalog.arm.cortexm3.concertoInit.Boot');
    
    /* set the module's cpu frequency */
    if (TimestampProvider.freq.$written("hi") || 
        TimestampProvider.freq.$written("lo")) {

        /* If 'cpuFreq' set used its value */ 
        mod.freq = TimestampProvider.freq;
    }
    else if (Boot.$used) {
        /* If Boot module used, use its computed timestamp frequency */ 
        mod.freq.lo = Boot.timestampFreq;
        mod.freq.hi = 0;
    }
    else {
        TimestampProvider.$logError("TimestampProvider.freq is undefined. " +
            "You must define the Timestamp frequency in your application " +
            "configuration.  For example, if the Timestamp is configured " +
            "for 150MHz, add this to your application configuration script: " +
            "TimerstampProvide.freq.lo = 150000000;", this);
    }
}

/*
 *  ======== getFreqMeta ========
 */
function getFreqMeta()
{
    var Boot = xdc.module('ti.catalog.arm.cortexm3.concertoInit.Boot');

    return ({lo : Boot.timestampFreq, hi : 0});
}
