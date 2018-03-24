/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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
 *  ======== Boot.xs ========
 *
 */

var Boot = null;
var Program = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }
    Boot = this;

    /* set the defaults for loadSegment and runSegment */
    Boot.loadSegment = "FLASH PAGE = 0";
    Boot.runSegment = "L03SARAM PAGE = 1";
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Program = xdc.useModule('xdc.cfg.Program');

    if (Program.build.rtsName !== null) {
        if ( (Boot.bootFromFlash == true) &&
           (Program.sectMap[".ti_catalog_c2800_concertoInit_begin"] ===
            undefined)) {
                Program.sectMap[".ti_catalog_c2800_concertoInit_begin"] =
                    new Program.SectionSpec();
                Program.sectMap[".ti_catalog_c2800_concertoInit_begin"].loadSegment = "BEGIN";
        }
    }

    /* compute Flash wait states */
    if (Boot.configureFlashWaitStates == true) {

        var foundBIOS;
        var freq;

        /*
         * Notes:
         * For SYS/BIOS apps we need to get the CPU frequency set in the
         * BIOS package.  Applications may change the frequency value in their
         * config, so we must check it after the app config has been processed.
         *
         * For non-SYS/BIOS apps we need to get the frequency from the platform
         * setting.
         *
         * To handle both cases, we need to first check to see if the BIOS
         * package is found.  If it is, then we need to check if BIOS is used
         * in the app.
         *
         * It is very unfortunate to have this linkage to the BIOS module here,
         * but this will likely be reworked soon with a move of the Boot module.
         *
         */
        try {
            var BIOS = xdc.module("ti.sysbios.BIOS");
            foundBIOS = true;
        }
        catch (e) {
            foundBIOS = false;
        }

        /* first get CPU freq from platform */
        freq = Program.cpu.clockRate;       /* MHz */

        /* if BIOS is used in the app update freq from BIOS.cpuFreq.lo */
        if (foundBIOS == true) {
            if (BIOS.$used == true) {
                freq = BIOS.cpuFreq.lo / 1000000;   /* MHz */
            }
        }

        /*
         * Compute wait states.  These threshold values are from initial
         * characterization by Concerto apps team. (RWAIT = (SYSCLK/FCLK)-1)
         */
        if (freq < 41) {
            Boot.flashWaitStates = 0;
        }
        else if (freq < 81) {
            Boot.flashWaitStates = 1;
        }
        else if (freq < 121) {
            Boot.flashWaitStates = 2;
        }
        else {
            Boot.flashWaitStates = 3;
        }
    }

    /* install Boot_init as a Startup first function */
    if ( (Boot.configureFlashWaitStates == true) ||
         (Boot.enableFlashProgramPrefetch == true) ||
         (Boot.enableFlashDataCache == true) ) {

        var Startup = xdc.useModule('xdc.runtime.Startup');
        Startup.firstFxns[Startup.firstFxns.length++] =
            '&ti_catalog_c2800_concertoInit_Boot_init';
    }
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
}
