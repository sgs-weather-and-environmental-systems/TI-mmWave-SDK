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

var Build = null;
var Hwi = null;
var Memory = null;
var Exception = null;
var Reset = null;
var device = null;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.A8Fnv":
            return (["Hwi_asm.s470", "Hwi_asm_switch.s470"]);
            break;

        case "gnu.targets.arm.A8F":
            return (["Hwi_asm_gnu.sv7A"]);
            break;

        default:
            return (null);
    }
}

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "TMS320DM8168": {
            useCodeMemory : true,
            vectorTableAddress : null,
            numPriorities : 64,
        },
        "TMS320DM8148": {
            useCodeMemory : true,
            vectorTableAddress : null,
            numPriorities : 64,
        },
        "TMS320C3430": {
            useCodeMemory : true,
            vectorTableAddress : null,
            numPriorities : 64,
        },
    };

    deviceTable["TMS320C3.*"] = deviceTable["TMS320C3430"];
    deviceTable["OMAP3.*"]    = deviceTable["TMS320C3430"];
    deviceTable["AM35.*"]     = deviceTable["TMS320C3430"];
    deviceTable["DM37XX"]     = deviceTable["TMS320C3430"];

    deviceTable["TMS320.*81.."] = deviceTable["TMS320DM8168"];
    deviceTable["AM335.*"]      = deviceTable["TMS320DM8168"];
}


/*
 *  ======== deviceSupportCheck ========
 *  Check validity of device
 */
function deviceSupportCheck()
{
    /* look for exact match first */
    for (device in deviceTable) {
        if (device == Program.cpu.deviceName) {
            return device;
        }
    }

    /* now look for a wildcard match */
    for (device in deviceTable) {
        if (Program.cpu.deviceName.match(device)) {
            return device;
        }
    }

    /*
     * no match, print all catalog devices supported
     * and then raise an error
     */
    var catalog = xdc.loadPackage(Program.cpu.catalogName);

    /* build associative array of supported devices */
    var supportedDevices = new Object();

    for (var i = 0; i < catalog.$modules.length; i++) {
        catalogName = catalog.$modules[i].$name.substring(Program.cpu.catalogName.length+1);
        for (device in deviceTable) {
            if (catalogName.match(device)) {
                supportedDevices[catalogName] = catalogName;
            }
        }
    }

    /* copy it into a sortable array */
    var sd = new Array();

    for (var i in supportedDevices) {
        sd[sd.length++] = i;
    }

    /* sort it for a nicer report */
    sd.sort();

    print("The " + Program.cpu.deviceName + " device is not currently supported.");
    print("The following devices are supported for the " + Program.build.target.name + " target:");

    for (var i = 0; i < sd.length; i++) {
        print("\t" + sd[i]);
    }

    throw new Error ("Unsupported device!");
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

    Hwi = this;

    /* set fxntab default */
    Hwi.common$.fxntab = false;

    Exception = xdc.module('ti.sysbios.family.arm.exc.Exception');

    var device = deviceSupportCheck();

    Hwi.NUM_PRIORITIES = deviceTable[device].numPriorities;

    /*
     * Initialize meta-only Hwi object array
     */

    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        Hwi.interrupt[intNum].used = false;
        Hwi.interrupt[intNum].fxn = null;
    }

    Hwi.resetFunc = '&_c_int00';

    Hwi.irqFunc = Hwi.dispatchIRQ;

    Hwi.fiqFunc = Hwi.dispatchFIQC;

    Hwi.swiFunc = Exception.excHandlerAsm;

    Hwi.undefinedInstFunc = Exception.excHandlerAsm;

    Hwi.prefetchAbortFunc = Exception.excHandlerAsm;

    Hwi.dataAbortFunc = Exception.excHandlerDataAsm;

    Hwi.reservedFunc = Exception.excHandlerAsm;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Build = xdc.useModule('ti.sysbios.Build');
    
    /* only useModule(Memory) if needed */
    var Defaults = xdc.useModule('xdc.runtime.Defaults');
    if (Defaults.common$.memoryPolicy ==
        xdc.module("xdc.runtime.Types").STATIC_POLICY) {
        Memory = xdc.module('xdc.runtime.Memory');
    }
    else {
        Memory = xdc.useModule('xdc.runtime.Memory');
    }

    Reset = xdc.useModule('xdc.runtime.Reset');

    xdc.useModule('xdc.runtime.Log');

    xdc.useModule('ti.sysbios.hal.Cache');
    xdc.useModule('ti.sysbios.family.arm.exc.Exception');

    var BIOS = xdc.useModule('ti.sysbios.BIOS');

    if (Hwi.dispatcherSwiSupport == undefined) {
        Hwi.dispatcherSwiSupport = BIOS.swiEnabled;
    }
    if (Hwi.dispatcherTaskSupport == undefined) {
        Hwi.dispatcherTaskSupport = BIOS.taskEnabled;
    }
    if (Hwi.dispatcherSwiSupport) {
        if (BIOS.swiEnabled) {
            xdc.useModule('ti.sysbios.knl.Swi');
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
            xdc.useModule('ti.sysbios.knl.Task');
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

    /* place .vecs section */
    if (Program.sectMap[".vecs"] === undefined) {
        Program.sectMap[".vecs"] = new Program.SectionSpec();
        if (deviceTable[device].useCodeMemory == true) {
            Program.sectMap[".vecs"].loadSegment = Program.platform.codeMemory;
        }
        else {
            Program.sectMap[".vecs"].loadAddress = deviceTable[device].vectorTableAddress;
        }
    }

    /* Install Hwi_initVbar as a reset function */
    Reset.fxns[Reset.fxns.length++] =
        "&ti_sysbios_family_arm_a8_intcps_Hwi_initVbar__I";

    /* add -D to compile line to optimize Asid tagging code */
    Build.ccArgs.$add("-Dti_sysbios_family_arm_a8_intcps_Hwi_enableAsidTagging__D=" +
        (Hwi.enableAsidTagging ? "TRUE" : "FALSE"));
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.mir0Mask = params.mir0Mask;
    mod.mir1Mask = params.mir1Mask;
    mod.mir2Mask = params.mir2Mask;
    mod.mir3Mask = params.mir3Mask;

    mod.spuriousInts = 0;
    mod.lastSpuriousInt = 0;

    mod.irp = 0;

    mod.taskSP = null;

    /*
     * ROM
     * These members of the module state are added for ROM. They are tied to
     * their respective symbol name because the symbols will not be defined
     * at the time the ROM assembly is made.
     */
    mod.isrStack = null;
    mod.isrStackBase = $externPtr('__TI_STACK_BASE');
    mod.isrStackSize = $externPtr('__TI_STACK_SIZE');

    var hwiParams = new Hwi.Params();
    Hwi.construct(mod.nonPluggedHwi, 0, Hwi.nonPluggedHwiHandler, hwiParams);

    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        mod.dispatchTable[intNum] = mod.nonPluggedHwi;
    }

    /* setup FIQ stack */
    mod.fiqStackSize = params.fiqStackSize;

    if (params.fiqStack) {
        mod.fiqStack = params.fiqStack;
    }
    else {
        mod.fiqStack.length = params.fiqStackSize;
        Memory.staticPlace(mod.fiqStack, 4, params.fiqStackSection);
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
    // print ("In Hwi Instance init", intNum, fxn);

    var mod = this.$module.$object;

    if (intNum >= Hwi.NUM_INTERRUPTS) {
        Hwi.$logError("intnum " + intNum + " is out of range!", this);
    }

    if (Hwi.interrupt[intNum].used == true) {
        Hwi.$logError("Hwi " + intNum + " already in use (by " +
                Hwi.interrupt[intNum].fxn + ").", intNum);
    }

    if (params.priority == 0) {
        Hwi.$logError("Interrupt priority 0 is not supported.", this);
    }

    if (obj.fxn != Hwi.nonPluggedHwiHandler) {
        Hwi.interrupt[intNum].used = true;
    }

    Hwi.interrupt[intNum].fxn = fxn;

    mod.dispatchTable[intNum] = this;
    obj.arg = params.arg;
    obj.fxn = fxn;
    obj.irp = null;

    obj.type = params.type;

    if (params.priority == -1) {
        obj.priority = Hwi.NUM_PRIORITIES - 1;
    }
    else {
        obj.priority = params.priority;
    }

    if (params.enableInt) {
        if ( intNum < 32 ) {
            mod.mir0Mask &= ~(1 << intNum);
        }
        else if ( intNum < 64 ) {
            intNum %= 32;        // normalize to 0 - 31
            mod.mir1Mask &= ~(1 << intNum);
        }
        else if ( intNum < 96 ) {
            intNum %= 32;        // normalize to 0 - 31
            mod.mir2Mask &= ~(1 << intNum);
        }
        else if ( intNum < 128 ) {
            intNum %= 32;        // normalize to 0 - 31
            mod.mir3Mask &= ~(1 << intNum);
        }
    }

    obj.hookEnv.length = Hwi.hooks.length;
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
    var Hwi = xdc.useModule('ti.sysbios.family.arm.a8.intcps.Hwi');
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
    view.priority = obj.priority;

    var fxn = Program.lookupFuncName(Number(obj.fxn));
    view.fxn = fxn[0];
    view.arg = obj.arg;

    try {
        var hwiRawView = Program.scanRawView('ti.sysbios.family.arm.a8.intcps.Hwi');
        var dispatchTable = hwiRawView.modState.dispatchTable;
        for (var i=0; i<128; i++) {
            if (dispatchTable[i] == view.address) {
                view.intNum = i;
                break;
            }
        }
    }
    catch (e) {
        view.$status["intNum"] = "Unable to obtain intNum: " + e;
    }
}

/*
 *  ======== viewIntcFetch ========
 *  Once per halt, fetch current intc contents
 *  Called from viewInitModule()
 */
function viewIntcFetch(that)
{
    var Hwi = xdc.useModule('ti.sysbios.family.arm.a8.intcps.Hwi');
    try {
        if (that.INTC === undefined) {
            that.INTC = Program.fetchStruct(Hwi.Intc$fetchDesc, 0x48200000, false);
        }
    }
    catch (e) {
        print("Error: Problem fetching NVIC: " + e.toString());
    }
}

/*
 *  ======== viewInitDetailed ========
 *  Initialize the 'Detailed' Task instance view.
 */
function viewInitDetailed(view, obj)
{
    var Hwi = xdc.useModule('ti.sysbios.family.arm.a8.intcps.Hwi');
    var Program = xdc.useModule('xdc.rov.Program');

    /* Detailed view builds off basic view. */
    viewInitBasic(view, obj);

    view.irp = obj.irp;

    viewIntcFetch(this);

    var enabled = false;
    var pending = false;
    var intNum = view.intNum;

    if ( intNum < 32 ) {
        enabled = ! (this.INTC.MIR0 & (1 << intNum));
        pending = this.INTC.ITR0 & (1 << intNum);
    }
    else if ( intNum < 64 ) {
        intNum %= 32;        // normalize to 0 - 31
        enabled = ! (this.INTC.MIR1 & (1 << intNum));
        pending = this.INTC.ITR1 & (1 << intNum);
    }
    else if ( intNum < 96 ) {
        intNum %= 32;        // normalize to 0 - 31
        enabled = ! (this.INTC.MIR2 & (1 << intNum));
        pending = this.INTC.ITR2 & (1 << intNum);
    }
    else if ( intNum < 128 ) {
        intNum %= 32;        // normalize to 0 - 31
        enabled = ! (this.INTC.MIR3 & (1 << intNum));
        pending = this.INTC.ITR3 & (1 << intNum);
    }


    if (enabled) {
        view.enabled = true;
    }
    else {
        view.enabled = false;
    }

    if (pending) {
        view.pending = true;
    }
    else {
        view.pending = false;
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
        var size = Program.getSymbolValue("__STACK_SIZE");
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

    var hwiModCfg = Program.getModuleConfig('ti.sysbios.family.arm.a8.intcps.Hwi');

    viewIntcFetch(this);

    view.options[0] = "Hwi.autoNestingSupport = ";
    view.options[1] = "Hwi.swiSupport = ";
    view.options[2] = "Hwi.taskSupport = ";
    view.options[3] = "Hwi.irpSupport = ";

    view.options[0] += hwiModCfg.dispatcherAutoNestingSupport ? "true" : "false";
    view.options[1] += hwiModCfg.dispatcherSwiSupport ? "true" : "false";
    view.options[2] += hwiModCfg.dispatcherTaskSupport ? "true" : "false";
    view.options[3] += hwiModCfg.dispatcherIrpTrackingSupport ? "true" : "false";

    view.spuriousInterrupts = mod.spuriousInts;
    view.lastSpuriousInterrupt = mod.lastSpuriousInt;

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
