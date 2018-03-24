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
 *  ======== Exception.xs ========
 */

var BIOS = null;
var Core = null;
var Exception = null;
var Memory = null;
var Build = null;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.Arm9":
        case "ti.targets.arm.elf.A8Fnv":
        case "ti.targets.arm.elf.R4F":
        case "ti.targets.arm.elf.R4Ft":
        case "ti.targets.arm.elf.R5F":
            return (["Exception_asm.asm"]);
            break;

        case "gnu.targets.arm.A8F":
        case "gnu.targets.arm.A9F":
        case "gnu.targets.arm.A15F":
            return (["Exception_asm_gnu.asm"]);
            break;

        default:
            return (null);
	    break;
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

    this.$private.getAsmFiles = getAsmFiles;

    Exception = this;

    var maxNumCores = 4;
    //var Settings = xdc.module("ti.sysbios.family.Settings");
    //CoreDelegate = xdc.module(Settings.getDefaultCoreDelegate());

    /* by default, exception context is saved on local ISR stack */
    Exception.excContextBuffer = 0;
    Exception.excContextBuffers.length = maxNumCores;
    for (var i = 0; i < maxNumCores; i++) {
        Exception.excContextBuffers[i] = 0;
    }

    /* by default, the exception thread stack is NOT copied */
    Exception.excStackBuffer = null;
    Exception.excStackBuffers.length = maxNumCores;
    for (var i = 0; i < maxNumCores; i++) {
        Exception.excStackBuffers[i] = null;
    }

    Exception.excHookFuncs.length = maxNumCores;
    for (var i = 0; i < maxNumCores; i++) {
        Exception.excHookFuncs[i] = null;
    }

    /* by default, the exception stack size is same as default Hwi stack size */
    Exception.excStackSize = Program.stack;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.useModule("ti.sysbios.BIOS");
    Build = xdc.useModule("ti.sysbios.Build");
    Memory = xdc.useModule("xdc.runtime.Memory");
    Core = xdc.useModule("ti.sysbios.hal.Core");

    /* Re-assign array length as Core.numCores may have changed */
    Exception.excContextBuffers.length = Core.numCores;
    Exception.excStackBuffers.length = Core.numCores;
    Exception.excHookFuncs.length = Core.numCores;

    if (Exception.excContextBuffer != null) {
        Exception.excContextBuffers[0] = Exception.excContextBuffer;
    }

    if (Exception.excStackBuffer != null) {
        Exception.excStackBuffers[0] = Exception.excStackBuffer;
    }

    if (Exception.excHookFunc != null) {
        Exception.excHookFuncs[0] = Exception.excHookFunc;
    }

    /* add -D to compile line to optimize exception code */
    Build.ccArgs.$add("-Dti_sysbios_family_arm_exc_Exception_enableDecode__D=" + 
        (Exception.enableDecode ? "TRUE" : "FALSE"));
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.excStackSize = params.excStackSize;
    mod.excActive.length = Core.numCores;
    mod.excContext.length = Core.numCores;
    mod.excStack.length = Core.numCores;
    mod.excStackBuffers.length = Core.numCores;
    for (var idx = 0; idx < Core.numCores; idx++) {
        mod.excActive[idx] = false;
        mod.excContext[idx] = $addr(Exception.excContextBuffers[idx]);
        mod.excStack[idx].length = params.excStackSize;
        Memory.staticPlace(mod.excStack[idx], 8, params.excStackSection);
        mod.excStackBuffers[idx] = Exception.excStackBuffers[idx];
    }
}

function viewGetType(mode)
{
    switch(mode & 0x1f) {

        case 0x13:
            return("Supervisor");

        case 0x17:
            return("Prefetch Abort");

        case 0x18:
            return("Data Abort");

        case 0x1b:
            return("Undefined Instruction");

    }
    return("Unknown");
}

/*
 *  ======== viewCallStack ========
 */
function viewCallStack(excContext) {
    try {
        var CallStack = xdc.useModule('xdc.rov.CallStack');
    }
    catch (e) {
        return (null);
    }

    CallStack.setRegister("R13", Number(excContext["sp"]));
    CallStack.setRegister("R14", Number(excContext["lr"]));
    CallStack.setRegister("PC", Number(excContext["pc"]));

    CallStack.setRegister("R0", Number(excContext["r0"]));
    CallStack.setRegister("R1", Number(excContext["r1"]));
    CallStack.setRegister("R2", Number(excContext["r2"]));
    CallStack.setRegister("R3", Number(excContext["r3"]));
    CallStack.setRegister("R4", Number(excContext["r4"]));
    CallStack.setRegister("R5", Number(excContext["r5"]));
    CallStack.setRegister("R6", Number(excContext["r6"]));
    CallStack.setRegister("R7", Number(excContext["r7"]));
    CallStack.setRegister("R8", Number(excContext["r8"]));
    CallStack.setRegister("R9", Number(excContext["r9"]));
    CallStack.setRegister("R10", Number(excContext["r10"]));
    CallStack.setRegister("R11", Number(excContext["r11"]));
    CallStack.setRegister("R12", Number(excContext["r12"]));

    /* fetch back trace string */
    var frames = CallStack.toText();

    /* break up into separate lines */
    frames = frames.split("\n");

    /*
     * Strip off "Unwind halted ... " from last frame
     */
    frames.length -= 1;

    for (var i = 0; i < frames.length; i++) {
        var line = frames[i];
        /* separate frame # from frame text a little */
        line = line.replace(" ", "    ");
        var file = line.substr(line.indexOf(" at ") + 4);
        file = file.replace(/\\/g, "/");
        file = file.substr(file.lastIndexOf("/")+1);
        if (file != "") {
            frames[i] = line.substring(0,
                                   line.indexOf(" at ") + 4);
            /* tack on file info */
            frames[i] += file;
        }
    }

    /*
     * Invert the frames[] array so that the strings become the index of a
     * new associative array.
     *
     * This is done because the TREE view renders the array index (field)
     * on the left and the array value on the right.
     *
     * At the same time, extract the "PC = ..." substrings and make them
     * be the value of the array who's index is the beginning of the
     * frame text.
     */
    var invframes = new Array();

    for (var i = 0; i < frames.length; i++) {
        invframes[frames[i].substring(0,frames[i].indexOf("PC")-1)] =
            frames[i].substr(frames[i].indexOf("PC"));
    }

    return (invframes);
}

/*
 *  ======== viewInitBasic ========
 */
function viewInitBasic()
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Exception = xdc.useModule('ti.sysbios.family.arm.exc.Exception');
    var BIOS = xdc.useModule('ti.sysbios.BIOS');
    var biosModConfig = Program.getModuleConfig(BIOS.$name);

    if (biosModConfig.smpEnabled == true) {
        var Core = xdc.useModule('ti.sysbios.hal.Core');
        var coreModConfig = Program.getModuleConfig(Core.$name);
        var numCores = coreModConfig.numCores;
    }
    else {
        var numCores = 1;
    }

    try {
        var excRawView = Program.scanRawView('ti.sysbios.family.arm.exc.Exception');
    }
    catch (e) {
        return null;
    }

    var excActive  = Program.fetchArray(
                         {
                             type: 'xdc.rov.support.ScalarStructs.S_UInt16',
                             isScalar: true
                         },
                         excRawView.modState.excActive,
                         numCores,
                         false
                     );

    try {
        var excContexts  = Program.fetchArray(
                               {
                                   type: 'xdc.rov.support.ScalarStructs.S_UInt',
                                   isScalar: true
                               },
                               excRawView.modState.excContext,
                               numCores,
                               false
                           );
    }
    catch (e) {
        return null;
    }

    var obj = {};

    for (var coreId = 0; coreId < numCores; coreId++) {
        if (excActive[coreId] != 0) {
            try {
                var excContext = Program.fetchStruct(
                    Exception.ExcContext$fetchDesc, excContexts[coreId], false);
            }
            catch (e) {
                print(e);
                return null;
            }

            var excDecode = {};
            excDecode["Decoded"] = {};
            excDecode.Decoded = viewGetType(excContext.type);

            var excCallStack = viewCallStack(excContext);

            if (biosModConfig.smpEnabled == true) {
                obj["Decoded exception, core " + String(coreId)] = excDecode;
                obj["Exception context " + String(coreId)] = excContext;
            }
            else {
                obj["Decoded exception"] = excDecode;
                obj["Exception context"] = excContext;
            }

            obj["Exception call stack"] = excCallStack;
        }
    }

    return (obj);
}

/*
 *  ======== viewInitModule ========
 */ 
function viewInitModule(view, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var ScalarStructs = xdc.useModule('xdc.rov.support.ScalarStructs');
    var Core = xdc.useModule('ti.sysbios.hal.Core');
    var coreModConfig = Program.getModuleConfig(Core.$name);

    numCores = coreModConfig.numCores;
    var excActive = Program.fetchArray({type:'xdc.rov.support.ScalarStructs.S_UInt16', isScalar:true},
                            mod.excActive,
                            numCores);

    view.exception = "none";
    
    for (var i = 0; i < numCores; i++) {
        if (excActive[i] != 0) {
            view.exception = "Yes"; 
            Program.displayError(view, "exception", "An exception has occurred!");
        }
    }
}
