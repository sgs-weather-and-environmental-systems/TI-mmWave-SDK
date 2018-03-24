/*
 * Copyright (c) 2016-2017, Texas Instruments Incorporated
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
var Core = null;
var Memory = null;
var Reset = null;
var IcfgrInitArr;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "gnu.targets.arm.A53F":
            return (["Hwi_asm_gnu.sv8A", "Hwi_asm_switch_gnu.sv8A",
                     "Hwi_asm_vecs_gnu.sv8A"]);
            break;

        default:
            return (null);
            break;
    }
}

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "SIMFLEMING": {
            binaryPointReg     : 3,
            numInterrupts      : 992,
            numPriorityBits    : 4,
            gicdBaseAddress    : 0x01800000,
            gicrBaseAddress    : 0x01900000,
            icfgrInit          :
            [
                0xAAAAAAAA, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000
            ],
            enableSecureMode   : false
        },
        "SIMMAXWELL": {
            binaryPointReg     : 3,
            numInterrupts      : 992,
            numPriorityBits    : 4,
            gicdBaseAddress    : 0x01800000,
            gicrBaseAddress    : 0x01880000,
            icfgrInit          :
            [
                0xAAAAAAAA, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000, 0x00000000, 0x00000000, 0x00000000,
                0x00000000, 0x00000000
            ],
            enableSecureMode   : false
        }
    };
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

    print(
            "The " +
            Program.cpu.deviceName +
            " device is not currently supported."
         );

    print(
            "The following devices are supported for the " +
            Program.build.target.name +
            " target:"
         );

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

    var device = deviceSupportCheck();

    Hwi.BPR = deviceTable[device].binaryPointReg;
    Hwi.NUM_INTERRUPTS = deviceTable[device].numInterrupts;
    Hwi.NUM_PRIORITY_BITS = deviceTable[device].numPriorityBits;
    Hwi.NUM_GICD_ENABLE_REGS = Hwi.NUM_INTERRUPTS / 32;
    Hwi.gicdBaseAddress = deviceTable[device].gicdBaseAddress;
    Hwi.gicrBaseAddress = deviceTable[device].gicrBaseAddress;
    IcfgrInitArr = deviceTable[device].icfgrInit;
    Hwi.enableSecureMode = deviceTable[device].enableSecureMode;

    /*
     * Initialize meta-only Hwi object array
     */
    Hwi.interrupt.length = Hwi.NUM_INTERRUPTS;
    Hwi.intAffinity.length = Hwi.NUM_INTERRUPTS;
    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        Hwi.interrupt[intNum].used = false;
        Hwi.interrupt[intNum].fxn = null;
    }

    var maxNumCores = 4;
    Hwi.gicMap.length = maxNumCores;
    for (var idx = 0; idx < maxNumCores; idx++) {
        Hwi.gicMap[idx].gicr = null;
        Hwi.gicMap[idx].gics = null;
    }

    Hwi.excContextBuffer.length = maxNumCores;
    for (var idx = 0; idx < maxNumCores; idx++) {
        Hwi.excContextBuffer[idx] = 0;
    }

    Hwi.syncExcHookFunc.length = maxNumCores;
    for (var idx = 0; idx < maxNumCores; idx++) {
        Hwi.syncExcHookFunc[idx] = null;
    }

    Hwi.sErrorExcHookFunc.length = maxNumCores;
    for (var idx = 0; idx < maxNumCores; idx++) {
        Hwi.sErrorExcHookFunc[idx] = null;
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.useModule('ti.sysbios.BIOS');
    Build = xdc.useModule('ti.sysbios.Build');

    /* Pull smp.Core module only if SMP enabled */
    if (BIOS.smpEnabled) {
        // FIXME
    }
    else {
        Core = xdc.useModule('ti.sysbios.family.arm.v8a.Core');
    }

    Hwi.initGicd = Core.bootMaster;

    if (BIOS.smpEnabled) {
        Hwi.gicMap.length = Core.numCores;
        for (var idx = 0; idx < Core.numCores; idx++) {
            /*
             * Each redistributor frame is 64KB. All frames must be contiguous
             * and must be ordered as RD_base, SGI_base, ...
             */
            Hwi.gicMap[idx].gicr = Hwi.gicrBaseAddress + (0x20000 * idx);
            Hwi.gicMap[idx].gics = Hwi.gicMap[idx].gicr + 0x10000;
        }
    }
    else {
        Hwi.gicMap.length = 1;
        Hwi.gicMap[0].gicr = Hwi.gicrBaseAddress + (0x20000 * Core.id);
        Hwi.gicMap[0].gics = Hwi.gicMap[0].gicr + 0x10000;
    }

    /* Re-assign array length as Core.numCores may have changed */
    Hwi.excContextBuffer.length = Core.numCores;
    Hwi.syncExcHookFunc.length = Core.numCores;
    Hwi.sErrorExcHookFunc.length = Core.numCores;

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

    /* Install Hwi_init as a reset function */
    Reset.fxns[Reset.fxns.length++] = "&ti_sysbios_family_arm_gicv3_Hwi_init__E";

    /* Compute Minimum and Default priority */
    var Mask = 1 << (8 - Hwi.NUM_PRIORITY_BITS);

    if (!Hwi.$written("MIN_INT_PRIORITY")) {
        Hwi.MIN_INT_PRIORITY = 0xFF & (~(Mask - 1));
    }

    if (!Hwi.$written("DEFAULT_INT_PRIORITY")) {
        Hwi.DEFAULT_INT_PRIORITY = Hwi.MIN_INT_PRIORITY ^ Mask;
    }
    if (BIOS.buildingAppLib == true) {
        /* add -D to compile line to optimize code */
        Build.ccArgs.$add(
            "-Dti_sysbios_family_arm_gicv3_Hwi_enableSecureMode__D=" +
            (Hwi.enableSecureMode ? "TRUE" : "FALSE"));
        Build.ccArgs.$add(
            "-Dti_sysbios_family_arm_gicv3_Hwi_gicdBaseAddress__D=" +
            Hwi.gicdBaseAddress);
        Build.ccArgs.$add(
            "-Dti_sysbios_family_arm_gicv3_Hwi_gicrBaseAddress__D=" +
            Hwi.gicrBaseAddress);
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    var reg;
    var align;
    var isrStackSize;

    for (reg = 0; reg < 32; reg++) {
        mod.iser[reg] = 0;
    }

    if (BIOS.smpEnabled) {
        /*
         * In SMP mode align stack size to cache line size
         * (Cache line size on Cortex-A15 is 64 bytes)
         */
        align = 64;
    }
    else {
        align = 8;
    }

    /*
     * round stackSize down to the nearest multiple of the alignment.
     */
    isrStackSize = Program.stack & (-align);

    if (isrStackSize != Program.stack) {
        Hwi.$logWarning("stack size was adjusted to guarantee proper alignment",
            this, "Program.stack");
    }

    mod.isrStackBase = $externPtr('__TI_STACK_BASE');
    mod.isrStackSize = isrStackSize;
    mod.isrStack.length = Core.numCores;
    mod.hwiStack.length = Core.numCores;
    mod.excActive.length = Core.numCores;
    mod.excContext.length = Core.numCores;

    for (var idx = 0; idx < Core.numCores; idx++) {
        mod.isrStack[idx] = null;
        if (idx == 0) {
            /* Use ".stack" for Core 0 */
            mod.hwiStack[0].length = 0;
        }
        else {
            mod.hwiStack[idx].length = mod.isrStackSize;
            Memory.staticPlace(mod.hwiStack[idx], align,
                params.irqStackSection);
        }
        mod.excActive[idx] = false;
        mod.excContext[idx] = $addr(Hwi.excContextBuffer[idx]);
    }

    mod.icfgr.length = Hwi.NUM_INTERRUPTS / 16;
    for (var i = 0; i < mod.icfgr.length; i++) {
        mod.icfgr[i] = IcfgrInitArr[i];
    }

    mod.spuriousInts = 0;
    mod.lastSpuriousInt = 0;

    mod.irp = 0;

    mod.dispatchTable.length = Hwi.NUM_INTERRUPTS;
    mod.intAffinity.length = Hwi.NUM_INTERRUPTS;

    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        mod.dispatchTable[intNum] = null;
        // TODO should we validate the affinity ???
        if (Hwi.intAffinity[intNum].routingMode != undefined) {
            mod.intAffinity[intNum].aff0 = Hwi.intAffinity[intNum].aff0;
            mod.intAffinity[intNum].aff1 = Hwi.intAffinity[intNum].aff1;
            mod.intAffinity[intNum].routingMode =
                Hwi.intAffinity[intNum].routingMode;
        }
        else {
            /* By default, all interrupts are routed to Cluster 0 Core 0 */
            mod.intAffinity[intNum] = {aff0: 0, aff1: Core.baseClusterId,
                routingMode: Hwi.RoutingMode_NODE};
        }
    }

    mod.curIntId = ~(0);

    /* add -D to compile line to optimize code */
    Build.ccArgs.$add(
        "-Dti_sysbios_family_arm_gicv3_Hwi_initGicd__D=" +
        (Hwi.initGicd ? "TRUE" : "FALSE"));
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

    if (intNum >= Hwi.NUM_INTERRUPTS) {
        Hwi.$logError("intnum " + intNum + " is out of range!", this);
    }

    if (Hwi.interrupt[intNum].used == true) {
        Hwi.$logError("Hwi " + intNum + " already in use (by " +
                Hwi.interrupt[intNum].fxn + ").", intNum);
    }

    Hwi.interrupt[intNum].used = true;
    Hwi.interrupt[intNum].fxn = fxn;

    mod.dispatchTable[intNum] = this;
    obj.arg = params.arg;
    obj.fxn = fxn;
    obj.irp = null;
    obj.type = params.type;
    obj.triggerSensitivity = params.triggerSensitivity;

    var shift, mask;

    /* Set interrupt trigger sensitivity */
    if (obj.triggerSensitivity != (~0)) {
        shift = (intNum & 0xF) << 1;
        mask = 0x3 << shift;
        var newIcfgr = mod.icfgr[intNum >>> 4] & (~mask);
        mod.icfgr[intNum >>> 4] = newIcfgr |
            ((obj.triggerSensitivity & 0x3) << shift);
    }

    if (params.priority == -1) {
        obj.priority = Hwi.DEFAULT_INT_PRIORITY;
    }
    else {
        obj.priority = params.priority;
    }

    if (params.enableInt)
    {
        mod.iser[intNum >>> 5] |= (1 << (intNum & 0x1f));
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
    var Program = xdc.useModule('xdc.rov.Program');
    var halHwi = xdc.useModule('ti.sysbios.hal.Hwi');
    var Hwi = xdc.useModule('ti.sysbios.family.arm.gicv3.Hwi');

    var modCfg = Program.getModuleConfig('ti.sysbios.family.arm.gicv3.Hwi');
    var SubPriorityMask = (1 << (modCfg.BPR + modCfg.NUM_PRIORITY_BITS - 7)) - 1;

    view.halHwiHandle =  halHwi.viewGetHandle(obj.$addr);
    view.label = Program.getShortName(obj.$label);
    view.absolutePriority = "0x" +
        Number(obj.priority).toString(16).toUpperCase();
    view.relativeGrpPriority = (obj.priority >> (modCfg.BPR + 1));
    view.relativeSubPriority = (obj.priority >> (8 - modCfg.NUM_PRIOIRTY_BITS))
        & SubPriorityMask;
    var fxn = Program.lookupFuncName(Number(obj.fxn));
    view.fxn = fxn[0];
    view.arg = obj.arg;

    try {
        var hwiRawView = Program.scanRawView('ti.sysbios.family.arm.gicv3.Hwi');
        var mod = hwiRawView.modState;
        var dispatchTable = Program.fetchArray(mod.dispatchTable$fetchDesc,
            mod.dispatchTable, modCfg.NUM_INTERRUPTS);

        for (var i = 0; i < modCfg.NUM_INTERRUPTS; i++) {
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
 *  ======== viewGicdFetch ========
 *  Once per halt, fetch current gicd contents
 *  Called from viewInitModule()
 */
function viewGicdFetch(that)
{
    var Hwi = xdc.useModule('ti.sysbios.family.arm.gicv3.Hwi');
    var modCfg = Program.getModuleConfig('ti.sysbios.family.arm.gicv3.Hwi');
    try {
        if (that.GICD === undefined) {
            that.GICD = Program.fetchStruct(
                                                Hwi.Gicd$fetchDesc,
                                                modCfg.gicdBaseAddress,
                                                false
                                           );
        }
    }
    catch (e) {
        print("Error: Problem fetching GIC Registers: " + e.toString());
    }
}

/*
 *  ======== viewInitDetailed ========
 *  Initialize the 'Detailed' Task instance view.
 */
function viewInitDetailed(view, obj)
{
    var Hwi = xdc.useModule('ti.sysbios.family.arm.gicv3.Hwi');
    var Program = xdc.useModule('xdc.rov.Program');

    /* Detailed view builds off basic view. */
    viewInitBasic(view, obj);

    view.irp = obj.irp;

    var enabled = false;
    var pending = false;
    var intNum = view.intNum;

    if (intNum < 32) {
        // TODO
    }
    else {
        viewGicdFetch(this);

        enabled = this.GICD.ISENABLER[intNum >>> 5] & (1 << intNum);
        pending = this.GICD.ISPENDR[intNum >>> 5] & (1 << intNum);

        var icfgr = (this.GICD.ICFGR[intNum >>> 4] >>> ((intNum & 0xF) << 1)) & 0x2;
        if (icfgr) {
            view.triggerSensitivity = "Edge-triggered";
        }
        else {
            view.triggerSensitivity = "Level-sensitive";
        }
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
        if (size == -1) {
            size = Program.getSymbolValue("__TI_STACK_SIZE");
        }
        var stackBase = Program.getSymbolValue("__stack");
        var stackData = Program.fetchArray(
            {type: 'xdc.rov.support.ScalarStructs.S_UChar', isScalar: true},
            stackBase, size);
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
    var hwiModCfg = Program.getModuleConfig('ti.sysbios.family.arm.gicv3.Hwi');

    viewGicdFetch(this);

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
