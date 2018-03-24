/*
 * Copyright (c) 2017, Texas Instruments Incorporated
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
var Core = null;
var Memory = null;
var device = null;
var Exception = null;

if (xdc.om.$name == "cfg") {
    var deviceTable = {
        "SIMFLEMING": {
            lockstepDevice              : true,//false,
            vimBaseAddress              : 0x40F80000,
            resetVectorAddress          : 0x00000000,
            resetVectorHandlerAddress   : 0x00550000,
            vectorTable0Address         : 0x00550180,
            vectorTable1Address         : 0x00550180,
            numInterrupts               : 128
        }
    }

    deviceTable["SIMMAXWELL"] = deviceTable["SIMFLEMING"];
}

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.R5F":
            if ((Core.id == 0) && (!Hwi.lockstepDevice)) {
                return (["Hwi_asm.sv7R", "Hwi_asm_vecs.sv7R",
                         "Hwi_asm_switch.sv7R"]);
            }
            else {
                return (["Hwi_asm.sv7R", "Hwi_asm_switch.sv7R"]);
            }
            break;

        default:
            return (null);
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

    Exception = xdc.module('ti.sysbios.family.arm.exc.Exception');

    /* loop through the device table */
    for (deviceName in deviceTable) {
        if (Program.cpu.deviceName.match(deviceName)) {
            device = deviceTable[deviceName];
            break;
        }
    }

    if (device == null) {
        print("The " + Program.cpu.deviceName +
              " device is not currently supported.");
        print("The following devices are supported for the " +
              Program.build.target.name + " target:");
        for (device in deviceTable) {
            print("\t" + device);
        }
        throw new Error ("Unsupported device!");
    }

    Hwi.lockstepDevice = device.lockstepDevice;

    if (!Hwi.lockstepDevice) {
        Hwi.core0VectorTableAddress = device.vectorTable0Address;
        Hwi.core1VectorTableAddress = device.vectorTable1Address;
        Hwi.resetVectorHandlerAddress = device.resetVectorHandlerAddress;
    }
    else {
        Hwi.core0VectorTableAddress = 0;
        Hwi.core1VectorTableAddress = 0;
        Hwi.resetVectorHandlerAddress = 0;
    }

    Hwi.vimBaseAddress = device.vimBaseAddress;

    Hwi.NUM_INTERRUPTS = device.numInterrupts;
    Hwi.intEnable.length = Hwi.NUM_INTERRUPTS / 32;;
    for (var i = 0; i < Hwi.intEnable.length; i++) {
        Hwi.intEnable[i] = 0;
    }

    /*
     * Initialize meta-only Hwi object array
     */
    Hwi.interrupt.length = Hwi.NUM_INTERRUPTS;

    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        Hwi.interrupt[intNum].used = false;
    }

    Hwi.resetFunc = '&_c_int00';

    Hwi.swiFunc = Exception.excHandlerAsm;

    Hwi.undefinedInstFunc = Exception.excHandlerAsm;

    Hwi.prefetchAbortFunc = Exception.excHandlerAsm;

    Hwi.dataAbortFunc = Exception.excHandlerDataAsm;

    Hwi.reservedFunc = Exception.excHandlerAsm;

    Hwi.irqFunc = Hwi.dispatchIRQ;

    Hwi.fiqFunc = Hwi.dispatchFIQC;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.useModule('ti.sysbios.BIOS');
    Core = xdc.useModule('ti.sysbios.family.arm.v7r.keystone3.Core');
    Memory = xdc.useModule('xdc.runtime.Memory');

    xdc.useModule('xdc.runtime.Log');
    xdc.useModule('ti.sysbios.hal.Cache');
    xdc.useModule('ti.sysbios.family.arm.exc.Exception');

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
            Hwi.$logError("Dispatcher Swi support can't be enabled if " +
                "ti.sysbios.BIOS.swiEnabled is false.", Hwi,
                "dispatcherSwiSupport");
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
            Hwi.$logError ("Dispatcher Task support can't be enabled if " +
                "ti.sysbios.BIOS.taskEnabled is false.", Hwi,
                "dispatcherTaskSupport");
        }
    }
    else {
        Hwi.taskDisable = null;
        Hwi.taskRestoreHwi = null;
    }

    if ((Core.id == 0) && (!Hwi.lockstepDevice)) {
        /* place .resetVecs section */
        if (Program.sectMap[".resetVecs"] === undefined) {
            Program.sectMap[".resetVecs"] = new Program.SectionSpec();
            Program.sectMap[".resetVecs"].loadAddress =
                device.resetVectorAddress;
        }
    }

    if (Program.sectMap[".resetVecHandler"] === undefined) {
        Program.sectMap[".resetVecHandler"] = new Program.SectionSpec();
        Program.sectMap[".resetVecHandler"].loadAddress =
            Hwi.resetVectorHandlerAddress;
    }

    /* place .vecs section */
    if (Program.sectMap[".vecs"] === undefined) {
        Program.sectMap[".vecs"] = new Program.SectionSpec();
        if (!Hwi.lockstepDevice) {
            if (Core.id == 0) {
                Program.sectMap[".vecs"].loadAddress =
                    Hwi.core0VectorTableAddress;
            }
            else {
                Program.sectMap[".vecs"].loadAddress =
                    Hwi.core1VectorTableAddress;
            }
        }
        else {
            Program.sectMap[".vecs"].loadAddress =
                    device.resetVectorAddress;
        }
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    mod.taskSP = null;
    mod.isrStack = null;
    mod.isrStackBase = $externPtr('__TI_STACK_BASE');
    mod.isrStackSize = $externPtr('__TI_STACK_SIZE');
    mod.dispatchTable.length = Hwi.NUM_INTERRUPTS;
    mod.spuriousInts = 0;

    for (var intNum = 0; intNum < Hwi.NUM_INTERRUPTS; intNum++) {
        mod.dispatchTable[intNum] = null;
    }

    /*
     * round stackSize up to the nearest multiple of the alignment.
     */
    var align = 8;
    var fiqStackSize = (params.fiqStackSize + align - 1) & -align;
    if (fiqStackSize != params.fiqStackSize) {
        Hwi.$logWarning("stack size was adjusted to guarantee proper" +
            " alignment", this, "Hwi.fiqStackSize");
    }

    mod.fiqStackSize = fiqStackSize;

    if (params.fiqStack) {
        mod.fiqStack = params.fiqStack;
    }
    else {
        mod.fiqStack.length = fiqStackSize;
        Memory.staticPlace(mod.fiqStack, align, params.fiqStackSection);
    }

    /*
     * round stackSize up to the nearest multiple of the alignment.
     */
    var irqStackSize =
        (params.irqStackSize + align - 1) & -align;
    if (irqStackSize != params.irqStackSize) {
        Hwi.$logWarning("stack size was adjusted to guarantee proper" +
            " alignment", this, "Hwi.irqStackSize");
    }

    mod.irqStackSize = irqStackSize;

    if (params.irqStack) {
        mod.irqStack = params.irqStack;
    }
    else {
        mod.irqStack.length = params.irqStackSize;
        Memory.staticPlace(mod.irqStack, align,
            params.irqStackSection);
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

    if (intNum >= Hwi.NUM_INTERRUPTS) {
        Hwi.$logError("IntNum " + intNum + " is out of range.", this);
    }

    if (Hwi.interrupt[intNum].used == true) {
        Hwi.$logError("Hwi " + intNum + " already in use (by " +
            Hwi.interrupt[intNum].fxn + ").", this);
    }

    Hwi.interrupt[intNum].used = true;
    Hwi.interrupt[intNum].fxn = fxn;

    mod.dispatchTable[intNum] = this;
    obj.arg = params.arg;
    obj.fxn = fxn;
    obj.intNum = intNum;
    obj.irp = null;
    obj.type = params.type;
    obj.triggerType = params.triggerType;

    if (params.priority == -1) {
        obj.priority = Hwi.DEFAULT_INT_PRIORITY;
    }
    else {
        obj.priority = params.priority;
    }

    if (params.enableInt) {
        Hwi.intEnable[intNum >>> 5] |= (1 << (intNum % 32));
    }

    obj.hookEnv.length = Hwi.hooks.length;

    /* Quietly allow any maskSetting to go through */
    /*switch (params.maskSetting) {
        case Hwi.MaskingOption_LOWER:
            break;
        case Hwi.MaskingOption_ALL:
        case Hwi.MaskingOption_BITMASK:
        case Hwi.MaskingOption_NONE:
        case Hwi.MaskingOption_SELF:
        default:
            Hwi.$logError("Hwi MaskingOption not supported.", this,
                "maskSetting");
    }*/
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
 *  ======== convertToUInt32 ========
 */
function convertToUInt32(value)
{
    /*
     *  Provide this workaround here due to javascript.
     */
    if (value < 0) {
        value = value + 0xFFFFFFFF + 1;
    }

    return (value);
}

/*
 *  ======== viewScanDispatchTable ========
 *  Scans dispatch table for constructed Hwis to add them to the Hwi ROV view.
 *
 *  The Hwi dispatch table is scanned for handles that are not in
 *  the raw instance view. These Hwi objects are then manually added to
 *  ROV's scanned object list.
 *
 *  This function does not perform any error handling because it has nowhere
 *  to display an error. If any of the APIs called within this function throw
 *  an exception, it will propagate up and be displayed to the user in ROV.
 */
function viewScanDispatchTable(data, viewLevel)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Hwi = xdc.useModule('ti.sysbios.family.arm.v7r.keystone3.Hwi');

    /* Check if the constructed Hwis have already been scanned. */
    if (data.scannedConstructedHwis) {
        return;
    }

    /*
     * Set the flag to true now to prevent recursive calls of this function
     * when we scan the constructed Hwis.
     */
    data.scannedConstructedHwis = true;

    /* Get the Task module config to get the number of constructed tasks. */
    var modCfg = Program.getModuleConfig('ti.sysbios.family.arm.v7r.keystone3.Hwi');

    var numHwis = modCfg.NUM_INTERRUPTS;

    /*
     * Retrieve the raw view to get at the module state.
     * This should just return, we don't need to catch exceptions.
     */
    var rawView = Program.scanRawView('ti.sysbios.family.arm.v7r.keystone3.Hwi');

    var dispatchTableAddr = rawView.modState.dispatchTable;

    var ScalarStructs = xdc.useModule('xdc.rov.support.ScalarStructs');

    /* Retrieve the dispatchTable array of handles */
    var hwiHandles = Program.fetchArray(ScalarStructs.S_Ptr$fetchDesc,
                                         dispatchTableAddr, numHwis);

    /*
     * Scan the dispatchTable for non-zero Hwi handles
     */
    for (var i = 0; i < numHwis; i++) {
        var hwiHandle = hwiHandles[i];
        if (Number(hwiHandle.elem) != 0) {
            var alreadyScanned = false;
            /* skip Hwis that are already known to ROV */
            for (var j in rawView.instStates) {
                rawInstance = rawView.instStates[j];
                if (Number(rawInstance.$addr) == Number(hwiHandle.elem)) {
                    alreadyScanned = true;
                    break;
                }
            }
            if (alreadyScanned == false) {
                /* Retrieve the embedded instance */
                var obj = Program.fetchStruct(Hwi.Instance_State$fetchDesc,
                                              hwiHandle.elem);
                /*
                 * Retrieve the view for the object. This will automatically
                 * add the object to the instance list.
                 */
                Program.scanObjectView('ti.sysbios.family.arm.v7r.keystone3.Hwi',
                                       obj, viewLevel);
            }
        }
    }
}

/*
 *  ======== viewVimFetch ========
 *  Once per halt, fetch current vim contents
 *  Called from viewInitBasic()
 */
function viewVimFetch(that)
{
    var Hwi = xdc.useModule('ti.sysbios.family.arm.v7r.keystone3.Hwi');
    var modCfg = Program.getModuleConfig('ti.sysbios.family.arm.v7r.keystone3.Hwi');
    try {
        if (that.VIMREGS === undefined) {
            that.VIMREGS = Program.fetchStruct(
                                                Hwi.VIM$fetchDesc,
                                                modCfg.vimBaseAddress,
                                                false
                                           );
        }
    }
    catch (e) {
        print("Error: Problem fetching VIM Registers: " + e.toString());
    }
}

/*
 *  ======== viewInitBasic ========
 *  Initialize the 'Basic' Hwi instance view.
 */
function viewInitBasic(view, obj)
{
    var Hwi = xdc.useModule('ti.sysbios.family.arm.v7r.keystone3.Hwi');
    var Program = xdc.useModule('xdc.rov.Program');
    var halHwi = xdc.useModule('ti.sysbios.hal.Hwi');

    /* Add constructed Hwis to ROV object list */
    viewScanDispatchTable(this, 'Basic');

    view.halHwiHandle =  halHwi.viewGetHandle(obj.$addr);
    view.label = Program.getShortName(obj.$label);
    view.intNum = obj.intNum;

    if (obj.type == Hwi.Type_FIQ) {
        view.type = "FIQ";
    }
    else {
        view.type = "IRQ";
    }

    if (obj.tiggerType == Hwi.TriggerType_PULSE) {
        view.triggerType = "Pulse";
    }
    else {
        view.triggerType = "Level";
    }

    var fxn = Program.lookupFuncName(Number(obj.fxn));
    view.fxn = fxn[0];
    view.arg = obj.arg;
    view.irp = obj.irp;

    viewVimFetch(this);
    var regIdx = obj.intNum >>> 5;
    var regOffset = obj.intNum & 0x1F;
    var enabled = this.VIMREGS.REQENASET[regIdx] & (1 << regOffset);
    var pending = this.VIMREGS.INTREQ[regIdx] & (1 << regOffset);

    if (enabled) {
        view.status = "enabled";
    }
    else {
        view.status = "disabled";
    }

    if (pending) {
        view.status += ", pending";
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
        var stackData = Program.fetchArray(
                        {
                            type: 'xdc.rov.support.ScalarStructs.S_UChar',
                            isScalar: true
                        },
                        stackBase,
                        size);
    }
    catch (e) {
        stackInfo.hwiStackSize = 0;     /* signal error to caller */
        return (stackInfo);
    }

    var index = 0;

    /*
     * The stack is filled with 0xBE.
     */
    while (stackData[index] == 0xBE) {
        index++;
    }

    stackInfo.hwiStackPeak = size - index;
    stackInfo.hwiStackSize = size;
    stackInfo.hwiStackBase = stackBase;

    return (stackInfo);
}

/*
 *  ======== viewChannelMap ========
 *  Initialize the channel map view
 */
function viewChannelMap(view)
{
    var hwiModCfg = Program.getModuleConfig('ti.sysbios.family.arm.v7r.keystone3.Hwi');

    for (var i = 0; i < hwiModCfg.NUM_INTERRUPTS; i++) {
        var elem = Program.newViewStruct('ti.sysbios.family.arm.v7r.keystone3.Hwi',
            'ChannelMap');

        elem.channelId = i;
        elem.interruptRequestId = hwiModCfg.channelMap[i];

        /* Add the element to the list. */
        view.elements.$add(elem);
    }
}

/*
 *  ======== viewInitModule ========
 *  Initialize the Hwi module view.
 */
function viewInitModule(view, mod)
{
    var Program = xdc.useModule('xdc.rov.Program');

    var hwiModCfg = Program.getModuleConfig('ti.sysbios.family.arm.v7r.keystone3.Hwi');

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
        view.hwiStackPeak = stackInfo.hwiStackPeak;
        view.hwiStackSize = stackInfo.hwiStackSize;
        view.hwiStackBase = "0x"+ stackInfo.hwiStackBase.toString(16);

        if (view.hwiStackPeak == view.hwiStackSize) {
            view.$status["hwiStackPeak"] = "Overrun!  ";
            /*                                  ^^  */
            /* (extra spaces to overcome right justify) */
        }
    }
}
