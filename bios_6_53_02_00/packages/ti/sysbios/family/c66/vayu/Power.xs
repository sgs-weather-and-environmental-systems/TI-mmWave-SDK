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
 *  ======== Power.xs ========
 *
 */

 /*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.elf.C66":
        case "ti.targets.elf.C66_big_endian":
            return (["Power_resume.s66",
                     "Power_standby.s66"]);
            break;

        default:
            return (null);
            break;
    }
}

var Power;
var Reset;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    /* provide getAsmFiles() for Build.getAsmFiles() */
    this.$private.getAsmFiles = getAsmFiles;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    xdc.useModule('ti.sysbios.knl.Task');
    xdc.useModule('ti.sysbios.knl.Swi');

    Power = this;

    /* plug Power.resetFxn as the first reset function */
    Reset = xdc.useModule('xdc.runtime.Reset');

    /*
     * if already have a reset function, swap Power's first, move first to
     * last
     */
    if (Reset.fxns.length != 0) {
        Reset.fxns[Reset.fxns.length++] = Reset.fxns[0];
        Reset.fxns[0] = Power.resetFxn;
    }

    /* else just add Power's reset function as first element of array */
    else {
        Reset.fxns[Reset.fxns.length++] = Power.resetFxn;
    }

    /* set fxntab default */
    Power.common$.fxntab = false;
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
}
