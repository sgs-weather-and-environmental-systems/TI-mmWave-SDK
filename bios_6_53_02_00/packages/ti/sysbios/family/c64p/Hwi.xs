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
var instanceName = [];

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
            return (["Hwi_asm.s62", "Hwi_asm_switch.s62", "Hwi_disp_always.s64P"]);
            break;

        default:
            return (null);
	    break;
    }
}

/*
 * ======== getCFiles ========
 * return the array of C language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getCFiles(targetName)
{
    return (["Hwi.c", "Hwi_startup.c"]);
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

    /* provide getCFiles() for Build.getCFiles() */
    this.$private.getCFiles = getCFiles;

    /* initially assume all ints are mapped to default event sources */
    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        Hwi.$object.intEvents[intNum] = -1;
    }

    /* set fxntab default */
    Hwi.common$.fxntab = false;

    /*
     * Initialize meta-only Hwi object array
     */

    /* initialize reset vector */
    var name = "ti_sysbios_family_c64p_Hwi_int0";
    Hwi.nonDispatchedInterrupts[name] = new Hwi.NonDispatchedInterrupt();
    Hwi.nonDispatchedInterrupts[name].fxn = '&_c_int00';
    Hwi.nonDispatchedInterrupts[name].eventId = -1;
    Hwi.nonDispatchedInterrupts[name].enableInt = true;
    Hwi.nonDispatchedInterrupts[name].intNum = 0;

    /* all others use vector to Hwi_nonPluggedInt by default */
    for (var intNum = 1; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
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

    if (Program.build.target.isa == "66") {
        xdc.useModule("ti.sysbios.family.c66.Cache");
    }
    else {
        xdc.useModule("ti.sysbios.family.c64p.Cache");
    }

    var BIOS = xdc.useModule("ti.sysbios.BIOS");

    if (BIOS.useSK && BIOS.setupSecureContext) {
        var Startup = xdc.useModule('xdc.runtime.Startup');
        Startup.lastFxns.$add(Hwi.setupSC);
    }

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

    if (Hwi.enableException) {
        xdc.useModule("ti.sysbios.family.c64p.Exception");
    }

    /* place .vecs section into platform's codeMemory */
    if (!Program.platformName.match(/ti\.platforms\.c6x/) &&
        (Program.sectMap[".vecs"] === undefined)) {
        Program.sectMap[".vecs"] = new Program.SectionSpec();
        Program.sectMap[".vecs"].loadSegment = Program.platform.codeMemory;
    }
    
    /* 
     * if resetVectorAddress is defined, place .resetVector section at 
     * that address
     */
    if (Hwi.resetVectorAddress !== undefined) {
        Program.sectMap[".resetVector"] = new Program.SectionSpec();
        Program.sectMap[".resetVector"].loadAddress = Hwi.resetVectorAddress;
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.ierMask = 2;    // enable NMI
    mod.intNum = 0;
    mod.taskSP = null;
    mod.scw = 0;

    /* 
     * ROM 
     * These members of the module state are added for ROM. They are tied to
     * their respective symbol name because the symbols will not be defined
     * at the time the ROM assembly is made.
     */
    mod.isrStack = null;
    mod.vectorTableBase = $externPtr('ti_sysbios_family_c64p_Hwi0');
    mod.bss = $externPtr('__TI_STATIC_BASE');

    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
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
                Hwi.interrupt[intNum].pfxn + ").", Hwi);
        }

        Hwi.interrupt[intNum].used = true;
        Hwi.interrupt[intNum].useDispatcher = false;
        Hwi.interrupt[intNum].pfxn = thisInt.fxn;
        Hwi.interrupt[intNum].name = i;

        if (thisInt.enableInt) {
            mod.ierMask |= 1 << intNum;
        }

        if ((thisInt.eventId != -1) && (thisInt.eventId !== undefined)) {
            if (thisInt.eventId < 128) {
                eventMapMeta(thisInt.intNum, thisInt.eventId);
            }
            else {
                Hwi.$logError ("eventId (" + thisInt.eventId + ") must be less than 128", Hwi, thisInt);
            }
        }
    }
}

/*
 *  ======== module$validate ========
 *  The default xgconf names collide with the interrupt vector labels.
 *  Check the instance names here and flag an error.
 */
function module$validate()
{
    /* validate all instance names */
    for (var i = 0; i < instanceName.length; i++) {
        /* log error if name matches "ti_sysbios_family_c64p_Hwi0" */
        if (instanceName[i] != null &&
            instanceName[i].match(/ti_sysbios_family_c64p_Hwi0/)) {
            Hwi.$logError("Handle name cannot be " +
                "ti_sysbios_family_c64p_Hwi0", Hwi.$instances[i]);
        }
    }

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
 *  ======== eventMapMeta ========
 *  Function maps an event to an interrupt number so that the 
 *  event will be the source of the interrupt of the vector.
 *
 *  @param(intNum)      interrupt number
 *  @param(eventId)     pointer to ISR function
 */
function eventMapMeta(intNum, eventId)
{
    if (intNum < 4) {
        Hwi.$logFatal("Can't remap interrupts 0-3", this);
    }
    Hwi.$object.intEvents[intNum] = eventId;
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, intNum, fxn, params)
{
    var mod = this.$module.$object;
    var len = instanceName.length;
    
    /* increment the instanceName array and store the name */
    instanceName.length++;
    instanceName[len] = params.instance.name;
    
    if (intNum == 0) {
        Hwi.$logError("Reset (intNum = 0) can't be assigned to the dispatcher", this);
    }

    if (intNum == 1) {
        Hwi.$logError("NMI (intNum = 1) can't be assigned to the dispatcher", this);
    }

    if (Hwi.interrupt[intNum].used == true) {
        if (Hwi.interrupt[intNum].fxn) {
            var pluggedFxn = Hwi.interrupt[intNum].fxn;
        }
        else {
            var pluggedFxn = Hwi.interrupt[intNum].pfxn;
        }

        Hwi.$logError("Failed to plug: " + fxn + ". Hwi " + intNum +
			" already in use by: " + pluggedFxn + ".", this);
    }

    Hwi.interrupt[intNum].used = true;
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
            obj.disableMask = 1 << intNum;
            obj.restoreMask = 1 << intNum;
            break;
        case Hwi.MaskingOption_BITMASK:
            obj.disableMask = params.disableMask;
            obj.restoreMask = params.restoreMask;
            break;
    }

    if (params.enableInt) {
        mod.ierMask |= 1 << intNum;
    }

    if (params.eventId != -1) {
        if (params.eventId < 128) {
            Hwi.eventMapMeta(intNum, params.eventId);
        }
        else {
            Hwi.$logError ("eventId (" + params.eventId + ") must be less than 128", Hwi, this);
        }
    }

    obj.hookEnv.length = Hwi.hooks.length;
}

/*
 *  ======== plugMeta ========
 */
function plugMeta(intNum, fxn)
{
    var name = "ti_sysbios_family_c64p_Hwi_int" + intNum;
    Hwi.nonDispatchedInterrupts[name] = new Hwi.NonDispatchedInterrupt();
    Hwi.nonDispatchedInterrupts[name].fxn = fxn;
    Hwi.nonDispatchedInterrupts[name].eventId = -1;
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
    var Hwi = xdc.useModule('ti.sysbios.family.c64p.Hwi');
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
    view.irp = obj.irp;
    view.disableMask = "0x" + obj.disableMask.toString(16);
    view.restoreMask = "0x" + obj.restoreMask.toString(16);

    try {
        var hwiRawView = Program.scanRawView('ti.sysbios.family.c64p.Hwi');
        var dispatchTable = hwiRawView.modState.dispatchTable;
        for (var i=0; i<16; i++) {
            if (dispatchTable[i] == view.address) {
                view.intNum = i;
                view.eventId = hwiRawView.modState.intEvents[i];
                break;
            }
        }
    }
    catch (e) {
        view.$status["intNum"] = "Unable to obtain intNum: " + e;
        view.$status["eventId"] = "Unable to obtain eventId: " + e;
    }
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
        }
        else {
            var size = Program.getSymbolValue("__STACK_SIZE");
        }
        var stackBase = Program.getSymbolValue("__stack");
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
    var hwiModCfg = Program.getModuleConfig('ti.sysbios.family.c64p.Hwi');

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
