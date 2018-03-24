/*
 * Copyright (c) 2015-2017, Texas Instruments Incorporated
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

var F28004x = xdc.module('ti.sysbios.rom.c28.f28004x.F28004x');

var Build = xdc.useModule('ti.sysbios.Build');
Build.buildROM = false;
Build.buildROMApp = true;

var BIOS = xdc.useModule('ti.sysbios.BIOS');
if (BIOS.$written("swiEnabled") && BIOS.swiEnabled == false) {
    F28004x.$logWarning("BIOS.swiEnabled must be set to true for ROM applications.", BIOS, "swiEnabled");
}
BIOS.swiEnabled = true;

if (BIOS.$written("logsEnabled") && BIOS.logsEnabled == true) {
    var $logsEnabledWarningIssued = true;
    F28004x.$logWarning("\nLogs are disabled in all ROM APIs." +
            "\nOnly APIs not in the ROM will have their Logs enabled.", BIOS, "logsEnabled");
}
else {
    BIOS.logsEnabled = false;
}

if (BIOS.$written("assertsEnabled") && BIOS.assertsEnabled == true) {
    var $assertsEnabledWarningIssued = true;
    F28004x.$logWarning("\nAsserts are disabled in all ROM APIs." +
            "\nOnly APIs not in the ROM will have their Asserts enabled.", BIOS, "assertsEnabled");;
}
else {
    BIOS.assertsEnabled = false;
}

/* allow Mod_construct() Mod_destruct() */
if (BIOS.$written("runtimeCreatesEnabled") && BIOS.runtimeCreatesEnabled == false) {
    F28004x.$logWarning("BIOS.runtimeCreatesEnabled must be set to true for ROM applications.", BIOS, "runtimeCreatesEnabled");
}
BIOS.runtimeCreatesEnabled = true;

/* List of modules needed to build ROM executable */
var Defaults = xdc.useModule('xdc.runtime.Defaults');
var Types = xdc.useModule('xdc.runtime.Types');
var Diags = xdc.useModule('xdc.runtime.Diags');
var Error = xdc.useModule('xdc.runtime.Error');
var Main = xdc.useModule('xdc.runtime.Main');
var SysCallback = xdc.useModule('xdc.runtime.SysCallback');
var System = xdc.useModule('xdc.runtime.System');
var Text = xdc.useModule('xdc.runtime.Text');

/* use the minimal user-supplied callback provider */
if (System.$written("SupportProxy") == false) {
    System.SupportProxy = SysCallback;
}

/* disable sorting by task priority */
var Semaphore = xdc.useModule('ti.sysbios.knl.Semaphore');
if (Semaphore.$written("supportsPriority") && Semaphore.supportsPriority == true) {
    F28004x.$logWarning("Semaphore.supportsPriority must be set to false for ROM applications.", Semaphore, "supportsPriority");
}
Semaphore.supportsPriority = false;

/* don't check stacks for overflow - saves cycles (and power) and Flash */
var Task = xdc.useModule('ti.sysbios.knl.Task');
if (Task.$written("checkStackFlag") && Task.checkStackFlag == true) {
    F28004x.$logWarning("Task.checkStackFlag must be set to false for ROM applications.", Task, "checkStackFlag");
}
Task.checkStackFlag = false; /* avoids pulling in Task_checkStacks() */
                             /* also removes all Task HOOK code from library */

/* don't check for interrupt stack overflow during Idle loop */
var halHwi = xdc.useModule('ti.sysbios.hal.Hwi');
halHwi.checkStackFlag = false; /* avoids pulling in hal Hwi_checkStack() */

xdc.loadCapsule("ti/sysbios/rom/c28/f28004x/F28004x_externs.xs");

if (Program.build.target.$name.match(/gnu/)) {
    var Reset = xdc.useModule('xdc.runtime.Reset');
    Reset.fxns[Reset.fxns.length++] =
        "&ti_sysbios_rom_c28_f28004x_F28004x_dataInit"

    var ReentSupport = xdc.useModule('ti.sysbios.rts.gnu.ReentSupport');
    ReentSupport.enableReentSupport = false;

    var Platform = xdc.module('ti.platforms.f28004x.Platform');
    Platform.useGnuRomLinkCmd = true;
}
