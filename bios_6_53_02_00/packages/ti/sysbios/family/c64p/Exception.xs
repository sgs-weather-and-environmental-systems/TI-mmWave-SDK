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

/*
 *  ======== Exception.xs ========
 */

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.elf.C64P":
        case "ti.targets.elf.C674":
        case "ti.targets.elf.C66":
        case "ti.targets.elf.C66_big_endian":
            return (["Exception_asm.s64P"]);
            break;

        default:
            return (null);
	    break;
    }
}

var Diags = null;
var Hwi = null;
var Exception = null;
var BIOS = null;
var Build = null;

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
    Hwi = xdc.useModule("ti.sysbios.family.c64p.Hwi");
    Diags = xdc.useModule("xdc.runtime.Diags");
    BIOS = xdc.module("ti.sysbios.BIOS");
    Build = xdc.module("ti.sysbios.Build");
    
    var Log = xdc.useModule('xdc.runtime.Log');
    this.common$.diags_USER1 = Diags.ALWAYS_ON;

    Exception = this;

    if (BIOS.buildingAppLib == true) {
        /* add -D to compile line to optimize exception code */
        Build.ccArgs.$add("-Dti_sysbios_family_c64p_Exception_enableExternalMPC__D=" + 
            (Exception.enableExternalMPC ? "TRUE" : "FALSE"));

        /* add -D to compile line to optimize exception code */
        Build.ccArgs.$add("-Dti_sysbios_family_c64p_Exception_enablePrint__D=" + 
            (Exception.enablePrint ? "TRUE" : "FALSE"));
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.efr = null;
    mod.nrp = null;
    mod.ntsr = null;
    mod.ierr = null;
    mod.returnHook = params.returnHook;
    mod.excContext = null;
    mod.excPtr = null;

    /* init the scratch buffer to 0 */
    for (var i=0; i < mod.scratch.length; i++) {
        mod.scratch[i] = 0;
    }

    if (params.useInternalBuffer) {
        /*
         *  The size of context buffer must be at least 74 words (296 bytes)
         *  to hold the exception context.  Add some padding.
         */
        mod.contextBuf.length = Exception.sizeContextBuf;

        /* init the context buffer to 0 */
        for (var i=0; i < mod.contextBuf.length; i++) {
            mod.contextBuf[i] = 0;
        }
    }
    else {
        mod.contextBuf.length = 0;
    }

    Hwi.plugMeta(1, Exception.dispatch);
}

/*
 *  ======== viewDecodeInternal ========
 */
function viewDecodeInternal(excContext)
{
    var Exception = xdc.useModule('ti.sysbios.family.c64p.Exception');
    var fault = "Internal: ";

    if (excContext.IERR & Exception.IERRIFX) {
        fault += "Instruction fetch exception; ";
    }
    if (excContext.IERR & Exception.IERRFPX) {
        fault += "Fetch packet exception; ";
    }
    if (excContext.IERR & Exception.IERREPX) {
        fault += "Execute packet exception; ";
    }
    if (excContext.IERR & Exception.IERROPX) {
        fault += "Opcode exception; ";
    }
    if (excContext.IERR & Exception.IERRRCX) {
        fault += "Resource conflict exception; ";
    }
    if (excContext.IERR & Exception.IERRRAX) {
        fault += "Resource access exception; ";
    }
    if (excContext.IERR & Exception.IERRPRX) {
        fault += "Privilege exception; ";
    }
    if (excContext.IERR & Exception.IERRLBX) {
        fault += "Loop buffer exception; ";
    }
    if (excContext.IERR & Exception.IERRMSX) {
        fault += "Missed stall exception; ";
    }

    return (fault);
}

/*
 *  ======== viewDecodeException ========
 */
function viewDecodeException(excNum)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Exception = xdc.useModule('ti.sysbios.family.c64p.Exception');

    try {
        var excRawView =
            Program.scanRawView('ti.sysbios.family.c64p.Exception');
    }
    catch (e) {
        print("Caught exception while retrieving raw view: " + e);
        return (null);
    }

    if (excRawView.modState.excContext == 0) {
        return("No Exception Context");
    }

    try {
        var excContext = Program.fetchStruct(Exception.Context$fetchDesc,
                     excRawView.modState.excContext);
    }
    catch (e) {
        print("Caught exception while retrieving raw view: " + e);
        return (null);
    }

    if (excNum & Exception.EFRIXF) {
        return (viewDecodeInternal(excContext));    /* Internal */
    }
    if (excNum & Exception.EFREXF) {
        return ("External Exception");              /* External */
    }
    if (excNum & Exception.EFRNXF) {
        return ("Legacy NMI Exception");                /* Legacy NMI */
    }

    return (null);
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

    CallStack.setRegister("A0", Number(excContext["A0"]));
    CallStack.setRegister("A1", Number(excContext["A1"]));
    CallStack.setRegister("A1", Number(excContext["A2"]));
    CallStack.setRegister("A3", Number(excContext["A3"]));
    CallStack.setRegister("A4", Number(excContext["A4"]));
    CallStack.setRegister("A5", Number(excContext["A5"]));
    CallStack.setRegister("A6", Number(excContext["A6"]));
    CallStack.setRegister("A7", Number(excContext["A7"]));
    CallStack.setRegister("A8", Number(excContext["A8"]));
    CallStack.setRegister("A9", Number(excContext["A9"]));
    CallStack.setRegister("A10", Number(excContext["A10"]));
    CallStack.setRegister("A11", Number(excContext["A11"]));
    CallStack.setRegister("A12", Number(excContext["A12"]));
    CallStack.setRegister("A13", Number(excContext["A13"]));
    CallStack.setRegister("A14", Number(excContext["A14"]));
    CallStack.setRegister("A15", Number(excContext["A15"]));

    CallStack.setRegister("B0", Number(excContext["B0"]));
    CallStack.setRegister("B1", Number(excContext["B1"]));
    CallStack.setRegister("B1", Number(excContext["B2"]));
    CallStack.setRegister("B3", Number(excContext["B3"]));
    CallStack.setRegister("B4", Number(excContext["B4"]));
    CallStack.setRegister("B5", Number(excContext["B5"]));
    CallStack.setRegister("B6", Number(excContext["B6"]));
    CallStack.setRegister("B7", Number(excContext["B7"]));
    CallStack.setRegister("B8", Number(excContext["B8"]));
    CallStack.setRegister("B9", Number(excContext["B9"]));
    CallStack.setRegister("B10", Number(excContext["B10"]));
    CallStack.setRegister("B11", Number(excContext["B11"]));
    CallStack.setRegister("B12", Number(excContext["B12"]));
    CallStack.setRegister("B13", Number(excContext["B13"]));
    CallStack.setRegister("B14", Number(excContext["B14"]));
    CallStack.setRegister("B15", Number(excContext["B15"]));

    CallStack.setRegister("IRP", Number(excContext["IRP"]));
    CallStack.setRegister("SP", Number(excContext["B15"]));
    CallStack.setRegister("PC", Number(excContext["NRP"]));

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
 *  ======== viewInitException ========
 */
function viewInitException()
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Exception = xdc.useModule('ti.sysbios.family.c64p.Exception');

    try {
        var excRawView =
            Program.scanRawView('ti.sysbios.family.c64p.Exception');
    }
    catch (e) {
        print("Caught exception while retrieving raw view: " + e);
        return null;
    }

    if (excRawView.modState.excContext == 0
        || excRawView.modState.efr == 0) {
        return("No Exception Context");
    }

    try {
        var excContext = Program.fetchStruct(Exception.Context$fetchDesc,
                                 excRawView.modState.excContext);
    }
    catch (e) {
        print("Caught exception while retrieving raw view: " + e);
        return null;
    }

    var excDecode = {};
    excDecode["Decoded"] = {};
    excDecode.Decoded = viewDecodeException(excRawView.modState.efr);
    excDecode["Address"] = {};
    excDecode.Address = excContext.NRP;

    var excCallStack = viewCallStack(excContext);

    var obj = {};

    obj["Decoded exception"] = excDecode;

    obj["Exception context"] = excContext;

    obj["Exception call stack"] = excCallStack;

    return (obj);
}

/*
 *  ======== viewInitModule ========
 */ 
function viewInitModule(view, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');

    view.exception = "none";
   
    if (mod.excContext != 0) {
        view.exception = "Yes"; 
        Program.displayError(view, "exception", "An exception has occurred!");
    }
}
