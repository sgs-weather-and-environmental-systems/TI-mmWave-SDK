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
 *  ======== TimestampProvider.xs ========
 */

var BIOS = null;
var Clock = null;
var TimestampProvider = null;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.A8Fnv":
            return (["TimestampProvider_asm.asm"]);
            break;

        case "gnu.targets.arm.A8F":
            return (["TimestampProvider_asm_gnu.sv7A"]);
            break;

        default:
            return (null);
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

    TimestampProvider = this;

    /* provide getAsmFiles() for Build.getAsmFiles() */
    this.$private.getAsmFiles = getAsmFiles;

    /* set fxntab default */
    TimestampProvider.common$.fxntab = false;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    xdc.useModule('xdc.runtime.Startup');

    BIOS = xdc.module('ti.sysbios.BIOS');

    var Diags = xdc.useModule('xdc.runtime.Diags');

    for (var dl in TimestampProvider.common$) {
        if (dl.match(/^diags_/) && dl != 'diags_ASSERT') {
            TimestampProvider.common$[dl] = Diags.ALWAYS_OFF;
        }
    }

    if (TimestampProvider.autoRefreshEnable) {
        var period;

        if (BIOS.clockEnabled == true) {
            Clock = xdc.module('ti.sysbios.knl.Clock');
            period = (0x80000000 * 1000) / BIOS.getCpuFrequency();
            period = (period * 1000) / Clock.tickPeriod;
            if (period == 0) {
                period = 1;
            }

            var clkParams = new Clock.Params;
            clkParams.period = period;
            clkParams.startFlag = true;
            Clock.create(TimestampProvider.autoRefreshFxn, period, clkParams);
        }
        else {
            this.$logWarning("Setting TimestampProvider.autoRefreshEnable to " +
                    "true has no affect since the SYS/BIOS Clock module is " +
                    "disabled. Please enable SYS/BIOS Clock module or set " +
                    "TimestampProvider.autoRefreshEnable to false and build " +
                    "again.", this);
        }
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.upper32Bits = 0;
    mod.prevLoBits = 0;
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
