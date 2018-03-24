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
 *  ======== Hwi.xs ========
 */

var Hwi = null;
var BIOS = null;
var Build = null;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.C28_large":
        case "ti.targets.C28_float":
        case "ti.targets.elf.C28_float":
            return (["Hwi_asm.s28", "Hwi_disp_asm.s28"]);
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

    Hwi = this;

    /* provide getAsmFiles() for Build.getAsmFiles() */
    this.$private.getAsmFiles = getAsmFiles;

    /* set fxntab default */
    Hwi.common$.fxntab = false;

    if ((Program.cpu.deviceName.match(/F2807/)) ||
        (Program.cpu.deviceName.match(/F28004/)) ||
        (Program.cpu.deviceName.match(/F2837/))) {
        Hwi.NUM_INTERRUPTS_PIE = 192;
        Hwi.NUM_INTERRUPTS_ALL = Hwi.NUM_INTERRUPTS + Hwi.NUM_INTERRUPTS_PIE;
    }

    /*
     * Initialize meta-only Hwi object array
     */

    /* initialize reset vector */
    var name = "ti_sysbios_family_c28_Hwi0";
    Hwi.nonDispatchedInterrupts[name] = new Hwi.NonDispatchedInterrupt();
    Hwi.nonDispatchedInterrupts[name].fxn = '&_c_int00';
    Hwi.nonDispatchedInterrupts[name].enableInt = true;
    Hwi.nonDispatchedInterrupts[name].intNum = 0;

    /* others use vector to Hwi_unpluggedInterrupt by default */
    Hwi.interrupt.length = Hwi.NUM_INTERRUPTS_ALL;
    for (var intNum = 1; intNum < Hwi.NUM_INTERRUPTS_ALL; intNum++) {
        Hwi.interrupt[intNum].used = false;
        Hwi.interrupt[intNum].useDispatcher = false;
        Hwi.interrupt[intNum].fxn = null;
        Hwi.interrupt[intNum].pfxn = null;
        Hwi.interrupt[intNum].name = "";
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    xdc.useModule('xdc.runtime.Log');

    BIOS = xdc.useModule("ti.sysbios.BIOS");
    Build = xdc.useModule("ti.sysbios.Build");

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
            Hwi.$logError("Dispatcher Swi support can't be enabled " +
                          "if ti.sysbios.BIOS.swiEnabled is false.", Hwi);
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
            Hwi.$logError ("Dispatcher Task support can't be enabled " +
                           "if ti.sysbios.BIOS.taskEnabled is false.", Hwi);
        }
    }
    else {
        Hwi.taskDisable = null;
        Hwi.taskRestoreHwi = null;
    }

    /* add -D to compile line to optimize zeroLatency support code */
    Build.ccArgs.$add("-Dti_sysbios_family_c28_Hwi_zeroLatencyIERMask__D=" + 
        Hwi.zeroLatencyIERMask + "U");
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.ierMask = 0;
    mod.isrStack = null; /* initialized in Hwi_Module_startup */
    mod.taskSP = null;
    mod.irp = null;      /* Set only when in an interrupt */

    mod.dispatchTable.length = Hwi.NUM_INTERRUPTS_ALL;

    mod.globalEnable = false;
    mod.shadowIER = 0;

    for (var intNum = 0; intNum < mod.dispatchTable.length; intNum++) {
        mod.dispatchTable[intNum] = null;
    }

    /*
     * parse the nonDispatchedInterrupts array and populate
     * the Hwi.interrupt array accordingly
     */
    for (var i in Hwi.nonDispatchedInterrupts) {
        var thisInt = Hwi.nonDispatchedInterrupts[i];
        var intNum = thisInt.intNum;

        if (Hwi.inUseMeta(intNum)) {
            Hwi.$logError("Hwi " + intNum + " already in use (by " +
                Hwi.interrupt[intNum].pfxn + ").", i);
        }
        Hwi.interrupt[intNum].used = true;

        Hwi.interrupt[intNum].useDispatcher = false;
        Hwi.interrupt[intNum].pfxn = thisInt.fxn;
        Hwi.interrupt[intNum].name = i;

        if (thisInt.enableInt) {
            if (intNum >= Hwi.NUM_INTERRUPTS) {
                Hwi.$logError("Interrupt #" + intNum + " is a PIE interrupt " +
                    " and must be enabled at runtime.", i);
            }
            if (intNum != 0) {
                mod.ierMask |= 1 << (intNum - 1);
            }
        }
    }

    /* Prepare masks to be used in zero latency .xdt */
    Hwi.zeroLatencyIERMaskStr = "0x" + Hwi.zeroLatencyIERMask.toString(16);
    Hwi.nonZeroLatencyIERMaskStr = "0x" +
            (0xffff - Hwi.zeroLatencyIERMask).toString(16);

    /*
     * ROM
     * These members of the module state are added for ROM. They are tied to
     * their respective symbol name because the symbols will not be defined
     * at the time the ROM assembly is made.
     */
    if (Build.buildROM == false) {
        if (Program.build.target.$name.match(/elf/)) {
            mod.isrStackSize = $externPtr('__TI_STACK_SIZE');
            mod.isrStackBase = $externPtr("__stack");
        }
        else {
            mod.isrStackSize = $externPtr("_STACK_SIZE");
            mod.isrStackBase = $externPtr("_stack");
        }
    }
    else {
        /* If building ROM, then __stack and __STACK_SIZE is undefined */
        mod.isrStackBase = null;
        mod.isrStackSize = 0;
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

    /* Check for conflict with zero latency IER mask */
    if (Hwi.zeroLatencyIERMask & Hwi.getIERMask([intNum])) {
        Hwi.$logError("Hwi " + intNum + " conflicts with IER Mask 0x" +
                       Hwi.zeroLatencyIERMask.toString(16), this);
    }

    if (Hwi.interrupt[intNum].used == true) {
        Hwi.$logError("Hwi " + intNum + " already in use (by " +
                Hwi.interrupt[intNum].fxn + ").", this);
    }

    Hwi.interrupt[intNum].used = true;

    if ((intNum == 0) || (intNum >= 16 && intNum <= 31)) {
        Hwi.$logError("intNum = " + intNum + " can't be assigned to the dispatcher", this);
    }

    if ((intNum > 0) && (intNum < Hwi.NUM_INTERRUPTS)) {
        if (Hwi.zeroLatencyIERMask != 0) {
            Hwi.interrupt[intNum].pfxn =
                '&ti_sysbios_family_c28_Hwi_dispatchZeroTable';
        }
        else {
            Hwi.interrupt[intNum].pfxn =
                '&ti_sysbios_family_c28_Hwi_dispatchTable';
        }

        /* intNum from 1-16, IER from 0-15 */
        obj.ierBitMask = 1 << (intNum - 1);
    }
    else if (intNum >= Hwi.NUM_INTERRUPTS && intNum < Hwi.NUM_INTERRUPTS_ALL) {
        /* This is PIE interrupt */
        if (Hwi.zeroLatencyIERMask != 0) {
            Hwi.interrupt[intNum].pfxn =
                '&ti_sysbios_family_c28_Hwi_dispatchZero';
        }
        else {
            Hwi.interrupt[intNum].pfxn =
                '&ti_sysbios_family_c28_Hwi_dispatchPie';
        }

        if (intNum < 128) {
            /* intNum from 32-127, IER from 0-11 */
            obj.ierBitMask = 1 << ((intNum - Hwi.NUM_INTERRUPTS) >> 3);
        }
        else {
            /* Upper PIE bits on F2837x devices */
            /* intNum from 128-223, IER are still from 0-11 */
            obj.ierBitMask = 1 << ((intNum - 128) >> 3);
        }

    }
    else {
        /* Invalid vector id (128 or greater [224 or greater on F2837x]) */
        Hwi.$logError("Invalid vector id: " + intNum, Hwi);
    }

    obj.intNum = intNum;
    obj.enableInt = params.enableInt;
    obj.enableAck = params.enableAck;

    Hwi.interrupt[intNum].useDispatcher = true;
    Hwi.interrupt[intNum].fxn = fxn;

    mod.dispatchTable[intNum] = this;
    obj.arg = params.arg;
    obj.fxn = fxn;
    obj.irp = null;

    if ((Hwi.dispatcherAutoNestingSupport == false) &&
        (params.maskSetting != Hwi.MaskingOption_SELF)) {
        Hwi.$logWarning("Non default mask setting but " +
                        "dispatcherAutoNestingSupport is disabled.",
                        this);
    }

    switch (params.maskSetting) {
        case Hwi.MaskingOption_NONE:
            obj.disableMask = 0;
            obj.restoreMask = 0;
            break;
        case Hwi.MaskingOption_ALL:
            obj.disableMask = 0xffff;
            obj.restoreMask = 0xffff;
            break;
        case Hwi.MaskingOption_LOWER:
            Hwi.$logWarning("Hwi.MaskingOption_LOWER not supported," +
                                " converting to Hwi.MaskingOption_SELF.",
                            this);
            params.maskSetting = Hwi.MaskingOption_SELF;
        case Hwi.MaskingOption_SELF:
            obj.disableMask = obj.ierBitMask;
            obj.restoreMask = obj.ierBitMask;
            break;
        case Hwi.MaskingOption_BITMASK:
            obj.disableMask =
                params.disableMask;
            obj.restoreMask =
                params.restoreMask;
            break;
    }

    if (params.enableInt) {
        mod.ierMask |= obj.ierBitMask;
    }

    obj.hookEnv.length = Hwi.hooks.length;
}

/*
 *  ======== getIERMask ========
 */
function getIERMask(vecIds)
{
    var ierMask = 0x0;

    for (var i in vecIds) {
        var vecId = vecIds[i];
        if ((vecId <= 0) || (vecId >= 16 && vecId <= 31) ||
            (vecId >= Hwi.NUM_INTERRUPTS_ALL)) {
            Hwi.$logError("Vector ID = " + vecId + " is not a valid vector ID", this);
        }
        if (vecId >= 1 && vecId <= 14) {
            ierMask |= 1 << (vecId - 1);
        }
        else if (vecId < 128) {
            ierMask |= 1 << ((vecId - 32) >> 3);
        }
        else {
            ierMask |= 1 << ((vecId - 128) >> 3);
        }
    }

    return ierMask;
}

/*
 *  ======== plugMeta ========
 */
function plugMeta(intNum, fxn)
{
    if (intNum == 0 || intNum >= Hwi.NUM_INTERRUPTS_ALL) {
       Hwi.$logError("Interrupt number " + intNum + " cannot be plugged", Hwi);
    }

    var name = "ti_sysbios_family_c28_Hwi" + intNum;
    Hwi.nonDispatchedInterrupts[name] = new Hwi.NonDispatchedInterrupt();
    Hwi.nonDispatchedInterrupts[name].fxn = fxn;
    Hwi.nonDispatchedInterrupts[name].enableInt = false;
    Hwi.nonDispatchedInterrupts[name].intNum = intNum;
}

/*
 *  ======== inUseMeta ========
 */
function inUseMeta(intNum)
{
    return Hwi.interrupt[intNum].used;
}

/*
 *  ======== getEnumString ========
 *  Get the enum value string name, not 0, 1, 2 or 3, etc.  For an enumeration
 *  type property.
 *
 *  Example usage:
 *  if obj contains an enumeration type property "Enum enumProp"
 *
 *  view.enumString = getEnumString(obj.enumProp);
 *
 */
function getEnumString(enumProperty)
{
    /*
     *  Split the string into tokens in order to get rid of the huge package
     *  path that precedes the enum string name. Return the last 2 tokens
     *  concatenated with "_"
     */
    var enumStrArray = String(enumProperty).split(".");
    var len = enumStrArray.length;
    return (enumStrArray[len - 1]);
}

/*
 *  ======== module$validate ========
 */
function module$validate()
{
    var segName;

    var libType = getEnumString(BIOS.libType);

    switch (BIOS.libType) {
        case BIOS.LibType_Instrumented:
        case BIOS.LibType_NonInstrumented:
            if (Hwi.zeroLatencyIERMask != 0) {
                Hwi.$logError("Zero latency interrupts are not supported " +
                              "with BIOS.libType == BIOS." + libType + ".  " +
                              "You must use BIOS.LibType_Custom or " +
                              "BIOS.LibType_Debug.",
                              this, "zeroLatencyIERMask");
            }
            break;

        case BIOS.LibType_Custom:
        case BIOS.LibType_Debug:
        default:
            break;
    }

    /* validate all "created" instances */
    for (var i = 0; i < Hwi.$instances.length; i++) {
        instance_validate(Hwi.$instances[i]);
    }

    /* validate all "constructed" instances */
    for (var i = 0; i < Hwi.$objects.length; i++) {
        instance_validate(Hwi.$objects[i]);
    }

    /* Program.sectMap takes precedence over target.sectMap */
    if (Program.sectMap[".stack"] != undefined) {
        if (Program.sectMap[".stack"].loadSegment != undefined) {
            segName = Program.sectMap[".stack"].loadSegment;
        }
        else {
            segName = Program.sectMap[".stack"];
        }
    }
    /* Otherwise, check the platform to see what segment stackMemory is in. */
    else {
        segName = Program.platform.stackMemory;
    }

    /*
     * Make sure .stack is < 0x10000.
     */

    /*
     * On same platforms, the memory layout is not available to config, so
     * we cannot do the check.
     */
    if (segName == null) {
        return;
    }

    var segment = Program.cpu.memoryMap[segName];

    if (segment != null) {
        /* 28x Stack Pointer is only 16 bits, so isr stack must be < 0x10000. */
        if ((segment.base + segment.len) > 0x10000) {
            Hwi.$logError("stackMemory cannot be placed in segment " +
                          segName + ". Stacks must be within page 0.", Hwi);
        }
    }
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
 */
function viewInitBasic(view, obj)
{
    var Hwi = xdc.useModule('ti.sysbios.family.c28.Hwi');
    var Program = xdc.useModule('xdc.rov.Program');
    var halHwi = xdc.useModule('ti.sysbios.hal.Hwi');

    view.halHwiHandle =  halHwi.viewGetHandle(obj.$addr);
    if (view.halHwiHandle != null) {
        view.label = Program.getShortName(halHwi.viewGetLabel(obj.$addr));
    }
    else {
        view.label = Program.getShortName(obj.$label);
    }
    view.intNum = obj.intNum;

    var fxn = Program.lookupFuncName(Number(obj.fxn));
    view.fxn = fxn[0];
    view.arg = obj.arg;
    view.irp = obj.irp;
    view.disableMask = "0x" + obj.disableMask.toString(16);
    view.restoreMask = "0x" + obj.restoreMask.toString(16);
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
        if (Program.build.target.$name.match(/elf/)) {
            var size = Program.getSymbolValue("__TI_STACK_SIZE");
            var stackBase = Program.getSymbolValue("__stack");
        }
        else {
            var size = Program.getSymbolValue("__STACK_SIZE");
            var stackBase = Program.getSymbolValue("_stack");
        }
        var stackData = Program.fetchArray({type: 'xdc.rov.support.ScalarStructs.S_UChar', isScalar: true}, stackBase, size);
    }
    catch (e) {
        stackInfo.hwiStackSize = 0;     /* signal error to caller */
        return (stackInfo);
    }

    var index = stackData.length - 1;

    /*
     * The stack is filled with 0xbebe.
     */
    while (stackData[index] == 0xbebe) {
        index--;
    }

    stackInfo.hwiStackPeak = index+1;
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
    var hwiModCfg = Program.getModuleConfig('ti.sysbios.family.c28.Hwi');

    if (hwiModCfg.zeroLatencyIERMask == 0x0) {
        view.globalEnable = "unknown";
        view.shadowIER = "unused";
    }
    else {
        view.globalEnable = mod.globalEnable ? "enabled" : "disabled";
        view.shadowIER = "0x" + mod.shadowIER.toString(16);
    }

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
