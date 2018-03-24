/*
 * Copyright (c) 2012, Texas Instruments Incorporated
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
 *  ======== package.xs ========
 *
 */


/*
 *  ======== Package.getLibs ========
 *  This function is called when a program's configuration files are
 *  being generated and it returns the name of a library appropriate
 *  for the program's configuration.
 */

function getLibs(prog)
{
    var Build = xdc.module("ti.sysbios.Build");

    /* use shared getLibs() */
    return (Build.getLibs(this));
}

/*
 *  ======== Package.validate ========
 *  This function is called to validate the program's configuration.
 */
function validate()
{
    var Hwi = xdc.module('ti.sysbios.family.msp430.Hwi');
    var Diags = xdc.module('xdc.runtime.Diags');

    /* first validate the module-level Hwi.alwaysLog */
    if (Hwi.alwaysLog == true) {
        if (Hwi.common$.diags_USER2 == Diags.ALWAYS_OFF) {
            if (Hwi.common$.diags_USER1 == Diags.ALWAYS_OFF) {
                Hwi.$logWarning("Hwi.common$.diags_USER1 and " +
                "Hwi.common$.diags_USER2 are both set to Diags.ALWAYS_OFF, " +
                "so Hwi.alwaysLog will have no effect.", Hwi, "alwaysLog");
            }
            else {
                Hwi.$logWarning("Hwi.common$.diags_USER2 is set to " +
                "Diags.ALWAYS_OFF, so the resulting output from setting " +
                "Hwi.alwaysLog will be limited.", Hwi, "alwaysLog");
            }
        }
    }

    /* now check if loggingEnabled is true for any created instances */
    var anyInstLogging = false;
    for(var i = 0; i < Hwi.$instances.length; i++) {
        if (Hwi.$instances[i].loggingEnabled == true) {
            anyInstLogging = true;
        }
    }

    /* if any instances are logging, validate re the Diag bits ... */
    if (anyInstLogging == true) {
        if (Hwi.common$.diags_USER2 == Diags.ALWAYS_OFF) {
            if (Hwi.common$.diags_USER1 == Diags.ALWAYS_OFF) {
                Hwi.$logWarning("Hwi.common$.diags_USER1 and " +
                "Hwi.common$.diags_USER2 are both set to Diags.ALWAYS_OFF, " +
                "so setting loggingEnabled for any Hwi instance will have " +
                "no effect.", Hwi);
            }
            else {
                Hwi.$logWarning("Hwi.common$.diags_USER2 is set to " +
                "Diags.ALWAYS_OFF, so the resulting output from setting " +
                "loggingEnabled for a Hwi instance will be limited.", Hwi);
            }
        }
    }
}
