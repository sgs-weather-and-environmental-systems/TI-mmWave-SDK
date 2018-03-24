/*
 * Copyright (c) 2013-2017, Texas Instruments Incorporated
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

var Hwi = null;
var device;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arp32.elf.ARP32":
        case "ti.targets.arp32.elf.ARP32_far":
            return (["Hwi_switch_asm.sarp32", "Hwi_disp_always.sarp32"]);
            break;

	default:
	    return (null);
	    break;
    }
}

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "default": {
            vectorTableAddress : 0x80000000,
            numInterrupts: 128,
            numVectors: 16,
        },
        "Arctic": {
            vectorTableAddress : 0x80000000,
            numInterrupts: 32,
            numVectors: 8,
        },
        "TMS320C6A8149": {
            vectorTableAddress : 0x90000000,
            numInterrupts: 32,
            numVectors: 8,
        },
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

    Hwi = this;

    /* provide getAsmFiles() for Build.getAsmFiles() */
    this.$private.getAsmFiles = getAsmFiles;

    /* set fxntab default */
    Hwi.common$.fxntab = false;
    
    device = deviceTable[Program.cpu.deviceName];
    
    /* use the "default" settings if device not defined */
    if (device == undefined) {
        device = deviceTable["default"];
    }

    /* set the number of interrupts and number of vectors */
    Hwi.NUM_INTERRUPTS = device.numInterrupts;
    Hwi.NUM_VECTORS = device.numVectors;
    Hwi.vectors.length = Hwi.NUM_VECTORS;
    Hwi.interrupt.length = Hwi.NUM_INTERRUPTS;

    /* set the INTC base addresses */
    Hwi.INTCREGSBASEADDRS[0] = $addr(0x40080210);
    Hwi.INTCREGSBASEADDRS[1] = $addr(0x40080600);
    Hwi.INTCREGSBASEADDRS[2] = $addr(0x40080640);
    Hwi.INTCREGSBASEADDRS[3] = $addr(0x40080680);

    /*
     * Initialize meta-only Hwi object array
     */

    /* initialize reset vector and other special interrupts */
    var name = "ti_sysbios_family_arp32_Hwi0";
    Hwi.nonDispatchedInterrupts[name] = new Hwi.NonDispatchedInterrupt();
    Hwi.nonDispatchedInterrupts[name].fxn = '&_c_int00';
    Hwi.nonDispatchedInterrupts[name].enableInt = true;
    Hwi.nonDispatchedInterrupts[name].vectorNum = 0;

    var name = "ti_sysbios_family_arp32_Hwi1";
    Hwi.nonDispatchedInterrupts[name] = new Hwi.NonDispatchedInterrupt();
    Hwi.nonDispatchedInterrupts[name].fxn = Hwi.nmiInterrupt;
    Hwi.nonDispatchedInterrupts[name].enableInt = true;
    Hwi.nonDispatchedInterrupts[name].vectorNum = 1;

    var name = "ti_sysbios_family_arp32_Hwi2";
    Hwi.nonDispatchedInterrupts[name] = new Hwi.NonDispatchedInterrupt();
    Hwi.nonDispatchedInterrupts[name].fxn = Hwi.swiInterrupt;
    Hwi.nonDispatchedInterrupts[name].enableInt = false;
    Hwi.nonDispatchedInterrupts[name].vectorNum = 2;

    var name = "ti_sysbios_family_arp32_Hwi3";
    Hwi.nonDispatchedInterrupts[name] = new Hwi.NonDispatchedInterrupt();
    Hwi.nonDispatchedInterrupts[name].fxn = Hwi.undefInterrupt;
    Hwi.nonDispatchedInterrupts[name].enableInt = false;
    Hwi.nonDispatchedInterrupts[name].vectorNum = 3;

    /* all others use vector to Hwi_unPluggedInterrupt by default */
    for (var vectorNum = 4; vectorNum < Hwi.NUM_VECTORS; vectorNum++) {
        var name = "&ti_sysbios_family_arp32_Hwi" + vectorNum;
        Hwi.vectors[vectorNum].used = false;
        Hwi.vectors[vectorNum].useDispatcher = true;
        Hwi.vectors[vectorNum].fxn = Hwi.selfLoop;
        Hwi.vectors[vectorNum].pfxn = name;
        Hwi.vectors[vectorNum].name = "";
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    xdc.useModule('xdc.runtime.Log');

    var BIOS = xdc.useModule("ti.sysbios.BIOS");
    var Cache = xdc.useModule("ti.sysbios.family.arp32.Cache");

    if (Hwi.dispatcherSwiSupport == undefined) {
        Hwi.dispatcherSwiSupport = BIOS.swiEnabled;
    }
    if (Hwi.dispatcherTaskSupport == undefined) {
        Hwi.dispatcherTaskSupport = BIOS.taskEnabled;
    }
    if (Hwi.dispatcherSwiSupport) {
        if (BIOS.swiEnabled) {
            xdc.useModule("ti.sysbios.knl.Swi");
            Hwi.swiDisable = '&ti_sysbios_knl_Swi_disable__E';
            Hwi.swiRestoreHwi = '&ti_sysbios_knl_Swi_restoreHwi__E';
        }
        else {
            Hwi.$logError("Dispatcher Swi support can't be enabled if ti.sysbios.BIOS.swiEnabled is false.", Hwi, "dispatcherSwiSupport");
        }
    }
    else {
        Hwi.swiDisable = null;
        Hwi.swiRestoreHwi = null;
    }

    if (Hwi.dispatcherTaskSupport) {
        if (BIOS.taskEnabled) {
            xdc.useModule("ti.sysbios.knl.Task");
            Hwi.taskDisable = '&ti_sysbios_knl_Task_disable__E';
            Hwi.taskRestoreHwi = '&ti_sysbios_knl_Task_restoreHwi__E';
        }
        else {
            Hwi.$logError ("Dispatcher Task support can't be enabled if ti.sysbios.BIOS.taskEnabled is false.", Hwi, "dispatcherTaskSupport");
        }
    }
    else {
        Hwi.taskDisable = null;
        Hwi.taskRestoreHwi = null;
    }

    /* place .vecs section into platform's codeMemory */
    if (Program.sectMap[".vecs"] === undefined) {
        Program.sectMap[".vecs"] = new Program.SectionSpec();

        var found = false;

        /* need to loop through platform memory for EVEVECS */
        for (memmap in Program.cpu.memoryMap) {
            if (memmap.match("EVEVECS")) {
                found = true;
                Program.sectMap[".vecs"].loadSegment = memmap;
            }
        }

        /* if EVEVECS not found, then place in default addr specified above */
        if (!found) {
            Program.sectMap[".vecs"].loadAddress = device.vectorTableAddress;
        }
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.vectNum = 0;
    mod.taskSP = null;

    /* each interrupt vector requires a mask */
    mod.disableIerMask.length = Hwi.NUM_VECTORS;
    mod.restoreIerMask.length = Hwi.NUM_VECTORS;

    /* init the masks to 0 */
    for (var i = 0; i < Hwi.NUM_VECTORS; i++) {
        mod.disableIerMask[i] = 0;
        mod.restoreIerMask[i] = 0;
    }

    /* one interruptMask for each 32 interrupts */
    mod.interruptMask.length = (Hwi.NUM_INTERRUPTS + 31) / 32;

    /* init the interruptMask[] to 0 */
    for (var i = 0; i < mod.interruptMask.length; i++) {
        mod.interruptMask[i] = 0;
    }

    mod.isrStack = null;
    mod.irp.length = Hwi.NUM_VECTORS;
    mod.dispatchTable.length = Hwi.NUM_INTERRUPTS;
    
    for (var i = 0; i < Hwi.NUM_VECTORS; i++) {
        mod.irp[i] = null;
    }
    
    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        mod.dispatchTable[intNum] = null;
    }

    /* 
     * parse the nonDispatchedInterrupts array and populate 
     * the Hwi.vectors array accordingly
     */
    for (var i in Hwi.nonDispatchedInterrupts) {
        var thisInt = Hwi.nonDispatchedInterrupts[i];
        var vectorNum = thisInt.vectorNum;

        if (Hwi.inUseMeta(vectorNum)) {
            Hwi.$logError("Hwi vector " + vectorNum + " already in use (by " +
                Hwi.vectors[vectorNum].pfxn + ").", i);
        }

        Hwi.vectors[vectorNum].used = true;
        Hwi.vectors[vectorNum].useDispatcher = false;
        Hwi.vectors[vectorNum].pfxn = thisInt.fxn;
        Hwi.vectors[vectorNum].name = i;

        if (thisInt.enableInt) {
            Hwi.initialIerMask |= 1 << vectorNum;
        }
    }
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
    /* validate all "created" instances */
    for (var i = 0; i < Hwi.$instances.length; i++) {
        instance_validate(Hwi.$instances[i]);
    }

    /* validate all "constructed" instances */
    for (var i = 0; i < Hwi.$objects.length; i++) {
        instance_validate(Hwi.$objects[i]);
    }
}

/*
 *  ======== instance_validate ========
 *  common function to test instance configuration
 */
function instance_validate(instance)
{    
    if (instance.$object.fxn == null) {
        Hwi.$logError("function cannot be null", instance);
    }
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, intNum, fxn, params)
{
    var mod = this.$module.$object;

    if (Hwi.interrupt[intNum].used == true) {
        Hwi.$logError("Hwi " + intNum + " already in use (by " +
                Hwi.interrupt[intNum].fxn + ").", Hwi);
    }
    
    if (intNum > Hwi.NUM_INTERRUPTS) {
        Hwi.$logError("Hwi " + intNum + " larger than max interrupt " +
                "number", Hwi);
    }

    Hwi.interrupt[intNum].used = true;
    Hwi.interrupt[intNum].useDispatcher = true;
    Hwi.interrupt[intNum].fxn = fxn;

    mod.dispatchTable[intNum] = this;
    obj.arg = params.arg;
    obj.fxn = fxn;
    obj.irp = null;
    obj.intNum = intNum;
    
    /*
     *  Set the default vectorNum if none is specified.
     *  The default for interrupts 0-31 is vector 4 (intc0)
     *  The default for interrupts 32-63 is vector 8 (intc1)
     *  The default for interrupts 64-95 is vector 12 (intc2)
     *  The default for interrupts 96-127 is vector 14 (intc3)
     */
    if (params.vectorNum == -1) {
        if (intNum < 32) {
            obj.vectorNum = 4;
        }
        else if (intNum < 64) {
            obj.vectorNum = 8;
        }
        else if (intNum < 96) {
            obj.vectorNum = 12;
        }
        else {
            obj.vectorNum = 14;
        }
    }
    else {
        /* 
         *  If vectorNum is specified then make sure vectorNum can
         *  be assigned to the intNum.
         */
        if ((params.vectorNum >= 4) && (params.vectorNum <= 7) &&
            (intNum < 32)) {
            obj.vectorNum = params.vectorNum;
        }
        else if ((params.vectorNum >= 8) && (params.vectorNum <= 11) &&
            (intNum >= 32) && (intNum < 64)) {
            obj.vectorNum = params.vectorNum;
        }
        else if ((params.vectorNum >= 12) && (params.vectorNum <= 13) &&
            (intNum >= 64) && (intNum < 96)) {
            obj.vectorNum = params.vectorNum;
        }
        else if ((params.vectorNum >= 14) && (params.vectorNum <= 15) &&
            (intNum >= 96) && (intNum < 128)) {
            obj.vectorNum = params.vectorNum;
        }
        else {
            Hwi.$logError("The vector: " + params.vectorNum + " cannot be " +
                          "assigned to the interrupt: " + intNum, Hwi, obj);
        }
    }

    /* determine the index from the vector number */
    if (obj.vectorNum < 8) {
        obj.index = obj.vectorNum - 4;
    }
    else if (obj.vectorNum < 12) {
        obj.index = obj.vectorNum - 8;
    }
    else if (obj.vectorNum < 14) {
        obj.index = obj.vectorNum - 12;
    }
    else {
        obj.index = obj.vectorNum - 14;
    }
    
    if ((Hwi.dispatcherAutoNestingSupport == false) && 
        (params.maskSetting != Hwi.MaskingOption_SELF)) {
        Hwi.$logWarning("Non default mask setting but " +
                        "dispatcherAutoNestingSupport is disabled.",
                        this, "maskSetting");
    }

    switch (params.maskSetting) {
        case Hwi.MaskingOption_NONE:
            obj.disableIerMask = 0;
            obj.restoreIerMask = 0;
            break;
        case Hwi.MaskingOption_ALL:
            obj.disableIerMask = 0xfff0;
            obj.restoreIerMask = 0xfff0;
            break;
        case Hwi.MaskingOption_LOWER:
            Hwi.$logWarning("Hwi.MaskingOption_LOWER not supported," + 
                            " converting to Hwi.MaskingOption_SELF.",
                            this, "maskSetting");
            params.maskSetting = Hwi.MaskingOption_SELF;
        case Hwi.MaskingOption_SELF:
            obj.disableIerMask = 1 << obj.vectorNum;
            obj.restoreIerMask = 1 << obj.vectorNum;
            break;
        case Hwi.MaskingOption_BITMASK:
            obj.disableIerMask = params.disableIerMask;
            obj.restoreIerMask = params.restoreIerMask;
            break;
    }

    mod.disableIerMask[obj.vectorNum] |= obj.disableIerMask;
    mod.restoreIerMask[obj.vectorNum] |= obj.restoreIerMask;

    if (params.enableInt) {
        var num = parseInt(intNum / 32);
        mod.interruptMask[num] |= 1 << (intNum % 32);
    }

    obj.hookEnv.length = Hwi.hooks.length;
}

/*
 *  ======== plugMeta ========
 */
function plugMeta(vectorNum, fxn)
{
    var name = "ti_sysbios_family_arp32_Hwi" + vectorNum;
    Hwi.nonDispatchedInterrupts[name] = new Hwi.NonDispatchedInterrupt();
    Hwi.nonDispatchedInterrupts[name].fxn = fxn;
    Hwi.nonDispatchedInterrupts[name].enableInt = false;
    Hwi.nonDispatchedInterrupts[name].vectorNum = vectorNum;
}

/*
 *  ======== inUseMeta ========
 */
function inUseMeta(vectorNum)
{
    return Hwi.vectors[vectorNum].used;
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
 *  ======== viewInitBasic ========
 *  Initialize the 'Basic' Task instance view.
 */
function viewInitBasic(view, obj)
{    
    var Hwi = xdc.useModule('ti.sysbios.family.arp32.Hwi');
    var Program = xdc.useModule('xdc.rov.Program');
    var halHwi = xdc.useModule('ti.sysbios.hal.Hwi');

    view.halHwiHandle =  halHwi.viewGetHandle(obj.$addr);
    if (view.halHwiHandle != null) {
        view.label = Program.getShortName(halHwi.viewGetLabel(obj.$addr));
    }
    else {
        view.label = Program.getShortName(obj.$label);
    }
    var fxn = Program.lookupFuncName(Number(obj.fxn));
    view.fxn = fxn[0];
    view.arg = obj.arg;
    view.irp = 0;
    view.vector = obj.vectorNum;
    view.intNum = obj.intNum;
    view.disableIerMask = "0x" + obj.disableIerMask.toString(16);
    view.restoreIerMask = "0x" + obj.restoreIerMask.toString(16);

}

/*
 *  ======== viewGetStackInfo ========
 */
function viewGetStackInfo()
{
    var IHwi = xdc.useModule('ti.sysbios.interfaces.IHwi');

    var stackInfo = new IHwi.StackInfo();

    /* Fetch the Hwi stack */
    try {
        var size = Program.getSymbolValue("__TI_STACK_SIZE");
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
 *  Initialize the Task module view.
 */
function viewInitModule(view, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var halHwiModCfg = Program.getModuleConfig('ti.sysbios.hal.Hwi');

    var hwiModCfg = Program.getModuleConfig('ti.sysbios.family.arp32.Hwi');

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
