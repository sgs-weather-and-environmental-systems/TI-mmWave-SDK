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
 *  ======== Hwi.xs ========
 */

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.msp430.elf.MSP430X":
            return (["Hwi_switch_asm.asm"]);
            break;

        case "iar.targets.msp430.MSP430":
        case "iar.targets.msp430.MSP430X_small":
        case "iar.targets.msp430.MSP430X_large":
            return (["Hwi_switch_asm_iar.asm"]);
            break;

	default:
	    return (null);
	    break;
    }
}

var BIOS = null;
var Hwi = null;
var Startup = null;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    Hwi = this;

    /* provide getAsmFiles() for Build.getAsmFiles() */
    this.$private.getAsmFiles = getAsmFiles;

    /* set fxntab default */
    Hwi.common$.fxntab = false;

    /* get number of interrupts from the device */
    Hwi.NUM_INTERRUPTS = Program.cpu.attrs.peripherals["interruptController"].$orig.numInterrupts;

    /*
     * Initialize meta-only Hwi object array
     */

    Hwi.interrupt.length = Hwi.NUM_INTERRUPTS;

    /* all others use vector to spin loop by default */
    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        Hwi.interrupt[intNum].name = "";
        Hwi.interrupt[intNum].used = false;
        Hwi.interrupt[intNum].generateStub = true;
        Hwi.interrupt[intNum].swiEnabled = false;
        Hwi.interrupt[intNum].taskEnabled = false;
        Hwi.interrupt[intNum].isrStackEnabled = false;
        Hwi.interrupt[intNum].nestingEnabled = false;
        Hwi.interrupt[intNum].lmBeginEnabled = false;
        Hwi.interrupt[intNum].ldEndEnabled = false;
        Hwi.interrupt[intNum].threadTypeEnabled = false;
        Hwi.interrupt[intNum].keepAwakeEnabled = false;
        Hwi.interrupt[intNum].fxn = null;
        Hwi.interrupt[intNum].arg = intNum;
    }

    Hwi.resetFunc = '&_c_int00';
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Startup = xdc.useModule('xdc.runtime.Startup');
    xdc.useModule('xdc.runtime.Log');

    BIOS = xdc.useModule("ti.sysbios.BIOS");

    Hwi.interrupt[Hwi.NUM_INTERRUPTS-1].fxn = String(Hwi.resetFunc);
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.taskSP = null;

    mod.isrStack = null;

    /* push Hwi objects (which are fully static now) to FLASH */
    /* NOTE: if we add IRP tracking support in the future, this push should be
       made conditional upon Hwi.dispatcherIrpTrackingSupport == false */
    // Hwi.common$.instanceSection = Program.platform.codeMemory;
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, intNum, fxn, params)
{
    var mod = this.$module.$object;

    if (fxn == null) {
        var name = this.instance.name != null ? this.instance.name : this;
        Hwi.$logError("The function for Hwi " + name
                      + ", interrupt number " + intNum
                      + ", is not defined", this);
    }

    if (Hwi.interrupt[intNum].used == true) {
        var name = this.instance.name != null ? this.instance.name : this;
        Hwi.$logError("Hwi " + intNum + " is already in use by " + name
            + " (function: " + Hwi.interrupt[intNum].fxn + ").", this);
    }

    Hwi.interrupt[intNum].generateStub = true;
    Hwi.interrupt[intNum].used = true;
    Hwi.interrupt[intNum].fxn = fxn;
    Hwi.interrupt[intNum].swiEnabled = BIOS.swiEnabled && Hwi.dispatcherSwiSupport && params.swiEnabled;
    Hwi.interrupt[intNum].taskEnabled = BIOS.taskEnabled && Hwi.dispatcherTaskSupport && params.taskEnabled;
    Hwi.interrupt[intNum].isrStackEnabled = BIOS.taskEnabled && Hwi.dispatcherTaskSupport && params.taskEnabled && params.isrStackEnabled;
    Hwi.interrupt[intNum].nestingEnabled = params.nestingEnabled;
    Hwi.interrupt[intNum].threadTypeEnabled = params.threadTypeEnabled;
    Hwi.interrupt[intNum].keepAwakeEnabled = params.keepAwakeEnabled;

    if (params.loggingEnabled) {
        if (Hwi.Module__diagsIncluded & Hwi.LM_begin.mask) {
            Hwi.interrupt[intNum].lmBeginEnabled = true;
        }
        else {
            Hwi.interrupt[intNum].lmBeginEnabled = false;
        }
        if (Hwi.Module__diagsIncluded & Hwi.LD_end.mask) {
            Hwi.interrupt[intNum].ldEndEnabled = true;
        }
        else {
            Hwi.interrupt[intNum].ldEndEnabled = false;
        }
    }
    else {
        Hwi.interrupt[intNum].lmBeginEnabled = false;
        Hwi.interrupt[intNum].ldEndEnabled = false;
    }

    var index = String(this).substr(String(this).indexOf("#")+1);
    Hwi.interrupt[intNum].handle =
        "&ti_sysbios_family_msp430_Hwi_Object__table__V["+index+"]";

    if (typeof(params.arg) != "number") {
        Hwi.interrupt[intNum].arg = $externPtr(params.arg);
    }
    else {
        Hwi.interrupt[intNum].arg = params.arg;
    }

    obj.intNum = intNum;
    obj.irp = null;

    obj.hookEnv.length = Hwi.hooks.length;
}

/*
 *  ======== addHookSet ========
 */
function addHookSet(hookSet)
{
    /* use "===" so 'null' is not flagged */
    if (hookSet.registerFxn === undefined) {
        hookSet.registerFxn = null;
    }
    if (hookSet.createFxn === undefined) {
        hookSet.createFxn = null;
    }
    if (hookSet.beginFxn === undefined) {
        hookSet.beginFxn = null;
    }
    if (hookSet.endFxn === undefined) {
        hookSet.endFxn = null;
    }
    if (hookSet.deleteFxn === undefined) {
        hookSet.deleteFxn = null;
    }

    this.hooks.$add(hookSet);
}

/*
 *  ======== inUseMeta ========
 */
function inUseMeta(intNum)
{
    return Hwi.interrupt[intNum].used;
}

/*
 *  ======== plugMeta ========
 */
function plugMeta(intNum, fxn)
{
    if (Hwi.interrupt[intNum].used == true) {
        Hwi.$logError("Hwi " + intNum + " already in use (by " +
                Hwi.interrupt[intNum].pfxn + ").", this);
    }

    Hwi.interrupt[intNum].used = true;
    Hwi.interrupt[intNum].generateStub = false;
    Hwi.interrupt[intNum].pfxn = fxn;
}

/*
 *  ======== viewInitBasic ========
 *  Initialize the 'Basic' Task instance view.
 */
function viewInitBasic(view, obj)
{
    var Hwi = xdc.useModule('ti.sysbios.family.msp430.Hwi');
    var Program = xdc.useModule('xdc.rov.Program');
    var halHwi = xdc.useModule('ti.sysbios.hal.Hwi');
    var hwiModCfg = Program.getModuleConfig('ti.sysbios.family.msp430.Hwi');

    view.halHwiHandle =  halHwi.viewGetHandle(obj.$addr);
    view.label = Program.getShortName(obj.$label);
    view.intNum = obj.intNum;

    view.fxn = hwiModCfg.interrupt[obj.intNum].fxn;
    view.arg = hwiModCfg.interrupt[obj.intNum].arg;
    view.irp = obj.irp;
}

/*!
 *  ======== viewGetStackInfo ========
 */
function viewGetStackInfo()
{
    var IHwi = xdc.useModule('ti.sysbios.interfaces.IHwi');

    var stackInfo = new IHwi.StackInfo();

    /* Fetch the Hwi stack */
    try {
        if (Program.build.target.$name.match(/iar/)) {
            var size = Program.getSymbolValue("_STACK_SIZE");
        }
        else {
            var size = Program.getSymbolValue("__STACK_SIZE");
        }
        var stackBase = Program.getSymbolValue("_stack");
        var stackData = Program.fetchArray({type: 'xdc.rov.support.ScalarStructs.S_UChar', isScalar: true}, stackBase, size);
    }
    catch (e) {
        stackInfo.hwiStackSize = 0;     /* signal error to caller */
        return (stackInfo);
    }

    var index = 0;

    /*
     * The stack is filled with 0xbe.
     */
    while (stackData[index] == 0xbe) {
        index++;
    }

    stackInfo.hwiStackPeak = size - index;
    stackInfo.hwiStackSize = size;
    stackInfo.hwiStackBase = stackBase;

    return (stackInfo);
}

/*
 *  ======== viewInitModule ========
 */
function viewInitModule(view, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var halHwiModCfg = Program.getModuleConfig('ti.sysbios.hal.Hwi');
    var hwiModCfg = Program.getModuleConfig('ti.sysbios.family.msp430.Hwi');

    view.options[0] = "Hwi.autoNestingSupport = ";
    view.options[1] = "Hwi.swiSupport = ";
    view.options[2] = "Hwi.taskSupport = ";
    view.options[3] = "Hwi.irpSupport = ";

    view.options[0] += hwiModCfg.dispatcherAutoNestingSupport ? "true" : "false";
    view.options[1] += hwiModCfg.dispatcherSwiSupport ? "true" : "false";
    view.options[2] += hwiModCfg.dispatcherTaskSupport ? "true" : "false";
    view.options[3] += hwiModCfg.dispatcherIrpTrackingSupport ? "true" : "false";

    var stackInfo = viewGetStackInfo();

    if (stackInfo.hwiStackSize == 0) {
        view.$status["hwiStackPeak"] =
        view.$status["hwiStackSize"] =
        view.$status["hwiStackBase"] = "Error fetching Hwi stack info!";
    }
    else {
        if (halHwiModCfg.initStackFlag) {
            view.hwiStackPeak = String(stackInfo.hwiStackPeak);
            view.hwiStackSize = stackInfo.hwiStackSize;
            view.hwiStackBase = "0x"+ stackInfo.hwiStackBase.toString(16);

            if (stackInfo.hwiStackPeak == stackInfo.hwiStackSize) {
                view.$status["hwiStackPeak"] = "Overrun!  ";
                /*                                  ^^  */
                /* (extra spaces to overcome right justify) */
            }
        }
        else {
            view.hwiStackPeak = "n/a - set Hwi.initStackFlag";
            view.hwiStackSize = stackInfo.hwiStackSize;
            view.hwiStackBase = "0x"+ stackInfo.hwiStackBase.toString(16);
        }
    }
}
