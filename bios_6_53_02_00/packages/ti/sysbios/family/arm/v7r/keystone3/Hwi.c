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
 *  ======== Hwi.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Log.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Startup.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/interfaces/IHwi.h>

#include "package/internal/Hwi.xdc.h"

extern Void ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());
extern Void ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC(
Hwi_Irp irp, Void (*dispatchC)(Hwi_Irp irp));

#define Hwi_switchAndRunFunc                                        \
        ti_sysbios_family_xxx_Hwi_switchAndRunFunc
#define Hwi_switchAndRunDispatchC                                   \
        ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC

#ifdef ti_sysbios_family_arm_v7r_keystone3_Hwi_dispatcherTaskSupport__D
/* disable unused local variable warning during optimized compile */
#pragma diag_suppress=179
#define TASK_DISABLE Task_disable
#define TASK_RESTORE Task_restoreHwi
#else
#define TASK_DISABLE Hwi_taskDisable
#define TASK_RESTORE Hwi_taskRestoreHwi
#endif

#ifdef ti_sysbios_family_arm_v7r_keystone3_Hwi_dispatcherSwiSupport__D
/* disable unused local variable warning during optimized compile */
#pragma diag_suppress=179
#define SWI_DISABLE Swi_disable
#define SWI_RESTORE Swi_restoreHwi
#else
#define SWI_DISABLE Hwi_swiDisable
#define SWI_RESTORE Hwi_swiRestoreHwi
#endif

// TODO: Can FIQs be disabled on this part ? CFGNMFIm configuration input value ?

/*
 *  ======== Hwi_Module_startup ========
 *  must initialize IRQ, FIQ, (and SWI?) SPs (R13s)
 */
Int Hwi_Module_startup (Int startupPhase)
{
    int i;
    Hwi_Object *hwi;

    /* must wait for these modules to initialize first */
    if (!Startup_rtsDone()) {
        return (Startup_NOTDONE);
    }

    /* okay to proceed with initialization */

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    for (i = 0; i < Hwi_hooks.length; i++) {
        if (Hwi_hooks.elem[i].registerFxn != NULL) {
            Hwi_hooks.elem[i].registerFxn(i);
        }
    }
#endif

    /* set up FIQ stack pointer */
    Hwi_init();

    Hwi_initIntController();

    /*
     * Initialize the pointer to the isrStack.
     */
    Hwi_module->isrStack =
            (Char *) (((UInt32) (Hwi_module->isrStackBase) & 0xfffffff8) +
            (UInt32) Hwi_module->isrStackSize - (2 * sizeof(Int)));

    Hwi_module->taskSP = (Char *)-1;    /* signal that we're executing */
                                        /* on the ISR stack */

    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        hwi = Hwi_module->dispatchTable[i];
        if (hwi != NULL) {
            Hwi_postInit(hwi, NULL);
        }
    }

    for (i = 0; i < (Hwi_NUM_INTERRUPTS / 32); i++) {
        /* Enable statically created interrupts */
        Hwi_vim.GROUP[i].ENABLEDSET = Hwi_intEnable[i];
    }

    return (Startup_DONE);        /* Max startup phase needed is 0 */
}

/*
 *  ======== Hwi_Instance_init  ========
 */
Int Hwi_Instance_init(Hwi_Object *hwi, Int intNum,
                      Hwi_FuncPtr fxn, const Hwi_Params *params,
                      Error_Block *eb)
{
    Int status;

    if (intNum >= Hwi_NUM_INTERRUPTS) {
        Error_raise(eb, Hwi_E_badIntNum, intNum, 0);
        return (1);
    }

    if (Hwi_module->dispatchTable[intNum] != NULL) {
        Error_raise(eb, Hwi_E_alreadyDefined, intNum, 0);
        return (1);
    }

    Hwi_module->dispatchTable[intNum] = hwi;

    hwi->intNum = intNum;

    switch (params->maskSetting) {
        case Hwi_MaskingOption_LOWER:
            break;
        case Hwi_MaskingOption_ALL:
        case Hwi_MaskingOption_BITMASK:
        case Hwi_MaskingOption_NONE:
        case Hwi_MaskingOption_SELF:
        default:
            Error_raise(eb, Hwi_E_unsupportedMaskingOption, 0, 0);
    }

    Hwi_reconfig(hwi, fxn, params);

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    if (Hwi_hooks.length > 0) {
        /* Allocate environment space for each hook instance. */
        hwi->hookEnv = Memory_calloc(Hwi_Object_heap(),
                Hwi_hooks.length * sizeof(Ptr), 0, eb);

        if (hwi->hookEnv == NULL) {
            return (1);
        }
    }
#endif

    hwi->irp = 0;

    status = Hwi_postInit(hwi, eb);

    if (Error_check(eb)) {
        return (2 + status);
    }

    return (0);
}

/*
 *  ======== Hwi_nonPluggedHwiHandler ========
 */
Void Hwi_nonPluggedHwiHandler()
{
    UInt intNum = ~0;

    if (Hwi_vim.ACTIVEIRQ & 0x80000000) {
        intNum = Hwi_vim.ACTIVEIRQ & 0x3F;
    }

    /* Force MAIN threadtype So we can safely call Error_raise */
    BIOS_setThreadType(BIOS_ThreadType_Main);

    Error_raise(0, Hwi_E_undefined, (Int)intNum, 0);
}

/*
 *  ======== Hwi_plug ========
 */
Void Hwi_plug(UInt intNum, Hwi_PlugFuncPtr fxn)
{
    Hwi_vim.VECTOR[intNum] = (UInt32)fxn;
}

/*
 *  ======== Hwi_postInit ========
 *  Function to be called during module startup to complete the
 *  initialization of any statically created or constructed Hwi.
 *  returns (0) and clean 'eb' on success
 *  returns 'eb' *and* 'n' for number of successful createFxn() calls iff
 *      one of the createFxn() calls fails
 */
Int Hwi_postInit (Hwi_Object *hwi, Error_Block *eb)
{
#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    Int i;
    Error_Block *leb;
    Error_Block localEB;

    if (eb != Error_IGNORE) {
        leb = eb;
    }
    else {
        Error_init(&localEB);
        leb = &localEB;
    }

    for (i = 0; i < Hwi_hooks.length; i++) {
        hwi->hookEnv[i] = (Ptr)0;
        if (Hwi_hooks.elem[i].createFxn != NULL) {
            Hwi_hooks.elem[i].createFxn((IHwi_Handle)hwi, leb);

            if (Error_check(leb)) {
                return (i);
            }
        }
    }
#endif

    Hwi_setPriority(hwi->intNum, hwi->priority);
    Hwi_setType(hwi->intNum, hwi->type);
    Hwi_setTriggerType(hwi->intNum, hwi->triggerType);

    if (hwi->type == Hwi_Type_IRQ) {
        Hwi_plug(hwi->intNum, (Hwi_PlugFuncPtr)(&Hwi_dispatchIRQ));
    }
    else {
        Hwi_plug(hwi->intNum, (Hwi_PlugFuncPtr)(&Hwi_dispatchFIQC));
    }

    return (0);
}

/*
 *  ======== Hwi_Instance_finalize ========
 *  Here on Hwi_delete() or failed Hwi_create().
 */
Void Hwi_Instance_finalize(Hwi_Object *hwi, Int status)
{
#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    Int i, cnt;
#endif
    UInt intNum;

    for (intNum = 0; intNum < Hwi_NUM_INTERRUPTS; intNum++) {
        if (Hwi_module->dispatchTable[intNum] == hwi) {
            break;
        }
    }

    Hwi_disableInterrupt(intNum);
    Hwi_module->dispatchTable[intNum] = NULL;

    /*
     *  Plug intNum as interrupt vector. This is required in case a
     *  FIQ interrupt was plugged before.
     */
    Hwi_plug(intNum, (Hwi_PlugFuncPtr)(&Hwi_dispatchIRQ));

    if (status == 1) {  /* failed Hwi_create */
        return;
    }

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    if (Hwi_hooks.length > 0) {
        if (status == 0) {
            cnt = Hwi_hooks.length;
        }
        else {
            cnt = status - 2;
        }

        for (i = 0; i < cnt; i++) {
            if (Hwi_hooks.elem[i].deleteFxn != NULL) {
                Hwi_hooks.elem[i].deleteFxn((IHwi_Handle)hwi);
            }
        }

        Memory_free(Hwi_Object_heap(), hwi->hookEnv,
                Hwi_hooks.length * sizeof(Ptr));
    }
#endif
}

/*
 *  ======== Hwi_initIntController ========
 */
Void Hwi_initIntController()
{
    UInt i, numGroups;

    /*
     * The interrupt controller has no RESET feature and
     * none would be required after a hard reset or power up.
     * But the CCS reset/reload process doesn't do a hard reset.
     * The code below tries to "virtually" reset the vim.
     */

    numGroups = Hwi_NUM_INTERRUPTS / 32;

    for (i = 0; i < numGroups; i++) {
        /* Disable all interrupts */
        Hwi_vim.GROUP[i].ENABLEDCLEAR = 0xFFFFFFFF;
        /* Clear all active interrupts */
        Hwi_vim.GROUP[i].ENABLEDSTATUSCLEAR = 0xFFFFFFFF;
        /* Map all interrupts as IRQ/FIQ */
        Hwi_vim.GROUP[i].INTERRUPTMAP = 0x0; // TODO
        /* Set type for all interrupts - pulse or edge triggered */
        Hwi_vim.GROUP[i].TYPEMAP = 0x0; // TODO
    }

    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        Hwi_vim.VECTOR[i] = (UInt32)(&Hwi_dispatchIRQ);
    }
}

/*
 *  ======== Hwi_startup ========
 */
Void Hwi_startup()
{
    /*
     * Enable FIQs. Once enabled, the HW ignores all calls to disable the FIQs.
     * Therefore, FIQs cannot be disabled again.
     */
    _enable_FIQ();

    /* Enable IRQs */
    Hwi_enable();
}

/*
 *  ======== Hwi_disableIRQ ========
 *  disables only IRQ interrupts
 */

UInt Hwi_disableIRQ()
{
    return Hwi_disable();
}

/*
 *  ======== Hwi_enableIRQ ========
 *  enables only IRQ interrupts
 */
UInt Hwi_enableIRQ()
{
    return Hwi_enable();
}

/*
 *  ======== Hwi_restoreIRQ ========
 *  restores only IRQ interrupts
 */
Void Hwi_restoreIRQ(UInt key)
{
    Hwi_restore(key);
}

/*
 *  ======== Hwi_getHandle ========
 */
Hwi_Object *Hwi_getHandle(UInt intNum)
{
    return (Hwi_module->dispatchTable[intNum]);
}

/*
 *  ======== Hwi_post ========
 */
Void Hwi_post(UInt intNum)
{
    Hwi_vim.GROUP[intNum >> 5].RAWSTATUSSET = 1 << (intNum & 0x1F);
}

/*
 *  ======== Hwi_getTaskSP ========
 */
Char *Hwi_getTaskSP()
{
    return (Hwi_module->taskSP);
}

/*
 *  ======== Hwi_disableInterrupt ========
 */
UInt Hwi_disableInterrupt(UInt intNum)
{
    UInt oldEnableState, index, mask;

    index = intNum / 32;
    mask = 1 << (intNum & 0x1f);
    oldEnableState = Hwi_vim.GROUP[index].ENABLEDSET & mask;
    Hwi_vim.GROUP[index].ENABLEDCLEAR = mask;

    return (oldEnableState);
}

/*
 *  ======== Hwi_enableInterrupt ========
 */
UInt Hwi_enableInterrupt(UInt intNum)
{
    UInt oldEnableState, index, mask;

    index = intNum / 32;
    mask = 1 << (intNum & 0x1f);
    oldEnableState = Hwi_vim.GROUP[index].ENABLEDSET & mask;
    Hwi_vim.GROUP[index].ENABLEDSET = mask;

    return (oldEnableState);
}

/*
 *  ======== Hwi_RestoreInterrupt ========
 */
Void Hwi_restoreInterrupt(UInt intNum, UInt key)
{
    if (key & (1 << (intNum & 0x1f))) {
        Hwi_enableInterrupt(intNum);
    }
    else {
        Hwi_disableInterrupt(intNum);
    }
}

/*
 *  ======== Hwi_clearInterrupt ========
 */
Void Hwi_clearInterrupt(UInt intNum)
{
    UInt index, mask;

    index = intNum / 32;
    mask = 1 << (intNum & 0x1f);
    Hwi_vim.GROUP[index].ENABLEDSTATUSCLEAR = mask;
}

/*
 *  ======== switchFromBootStack ========
 *  Indicate that we are leaving the boot stack and
 *  are about to switch to a task stack.
 */
Void Hwi_switchFromBootStack()
{
    Hwi_module->taskSP = 0;
}

/*
 *  ======== Hwi_getStackInfo ========
 *  Used to get Hwi stack usage info.
 */
Bool Hwi_getStackInfo(Hwi_StackInfo *stkInfo, Bool computeStackDepth)
{
    Char *isrSP;
    Bool stackOverflow;

    /* Copy the stack base address and size */
    stkInfo->hwiStackSize = (SizeT)Hwi_module->isrStackSize;
    stkInfo->hwiStackBase = Hwi_module->isrStackBase;

    isrSP = stkInfo->hwiStackBase;

    /* Check for stack overflow */
    stackOverflow = (*isrSP != (Char)0xbe ? TRUE : FALSE);

    if (computeStackDepth && !stackOverflow) {
        /* Compute stack depth */
        do {
        } while(*isrSP++ == (Char)0xbe);
        stkInfo->hwiStackPeak = stkInfo->hwiStackSize - (SizeT)(--isrSP - (Char *)stkInfo->hwiStackBase);
    }
    else {
        stkInfo->hwiStackPeak = 0;
    }

    return stackOverflow;
}

/*!
 *  ======== Hwi_setType ========
 *  Set an interrupt's type (FIQ/IRQ).
 *
 *  @param(intNum)      ID of interrupt
 *  @param(type)        type = FIQ/IRQ
 */
Void Hwi_setType(UInt intNum, Hwi_Type type)
{
    UInt index, key, mask;

    index = intNum >> 5;
    mask = 1 << (intNum & 0x1f);

    key = Hwi_disable();

    if (type == Hwi_Type_FIQ) {
        Hwi_vim.GROUP[index].INTERRUPTMAP |= mask;
    }
    else {
        Hwi_vim.GROUP[index].INTERRUPTMAP &= ~mask;
    }

    Hwi_restore(key);
}

/*!
 *  ======== Hwi_setTriggerType ========
 *  Set an interrupt's trigger type (Pulse/Level).
 *
 *  @param(intNum)      ID of interrupt
 *  @param(triggerType) triggerType = Pulse/Level
 */
Void Hwi_setTriggerType(UInt intNum, Hwi_TriggerType triggerType)
{
    UInt index, key, mask;

    index = intNum >> 5;
    mask = 1 << (intNum & 0x1f);

    key = Hwi_disable();

    if (triggerType == Hwi_TriggerType_PULSE) {
        Hwi_vim.GROUP[index].TYPEMAP |= mask;
    }
    else {
        Hwi_vim.GROUP[index].TYPEMAP &= ~mask;
    }

    Hwi_restore(key);
}

/*
 *  ======== Hwi_reconfig ========
 *  Reconfigure a dispatched interrupt.
 */
Void Hwi_reconfig(Hwi_Object *hwi, Hwi_FuncPtr fxn, const Hwi_Params *params)
{
    UInt intNum;

    for (intNum = 0; intNum < Hwi_NUM_INTERRUPTS; intNum++) {
        if (Hwi_module->dispatchTable[intNum] == hwi) {
            break;
        }
    }

    Hwi_disableInterrupt(intNum);

    hwi->fxn = fxn;
    hwi->arg = params->arg;
    hwi->type = params->type;

    if (params->priority == -1) {
        hwi->priority = Hwi_DEFAULT_INT_PRIORITY;
    }
    else {
        hwi->priority = params->priority;
    }

    switch (params->maskSetting) {
        case Hwi_MaskingOption_LOWER:
            break;
        case Hwi_MaskingOption_ALL:
        case Hwi_MaskingOption_BITMASK:
        case Hwi_MaskingOption_NONE:
        case Hwi_MaskingOption_SELF:
        default:
            Error_raise(0, Hwi_E_unsupportedMaskingOption, 0, 0);
    }

    if (params->enableInt) {
        Hwi_enableInterrupt(intNum);
    }
}

/*
 *  ======== Hwi_getFunc ========
 */
Hwi_FuncPtr Hwi_getFunc(Hwi_Object *hwi, UArg *arg)
{
    *arg = hwi->arg;

    return (hwi->fxn);
}

/*
 *  ======== setFunc ========
 */
Void Hwi_setFunc(Hwi_Object *hwi, Void (*fxn)(), UArg arg)
{
    UInt key;

    key = Hwi_disable();
    hwi->fxn = fxn;
    hwi->arg = arg;
    Hwi_restore(key);
}

/*
 *  ======== Hwi_getIrp ========
 */
Hwi_Irp Hwi_getIrp(Hwi_Object *hwi)
{
    return (hwi->irp);
}

/*
 *  ======== Hwi_getHookContext ========
 *  Get hook instance's context for a hwi.
 *
 *  @param(id)            hook instance's ID
 *  @a(hookContextPtr)    hook instance's context for task
 */
Ptr Hwi_getHookContext(Hwi_Object *hwi, Int id)
{
    return (hwi->hookEnv[id]);
}

/*
 *  ======== Hwi_setHookContext ========
 *  Set hook instance's context for a hwi.
 *
 *  @param(id)            hook instance's ID
 *  @param(hookContext)   value to write to context
 */
Void Hwi_setHookContext(Hwi_Object *hwi, Int id, Ptr hookContext)
{
    hwi->hookEnv[id] = hookContext;
}

/*!
 *  ======== Hwi_setPriority ========
 *  Set an interrupt's relative priority.
 *
 *  @param(intNum)      ID of interrupt
 *  @param(priority)    priority
 */
Void Hwi_setPriority(UInt intNum, UInt priority)
{
    if (intNum < Hwi_NUM_INTERRUPTS) {
        Hwi_vim.PRIORITY[intNum] = priority;
    }
    else {
        Error_raise(0, Hwi_E_badIntNum, intNum, 0);
    }
}

/*
 *  ======== Hwi_dispatchFIQC ========
 *  Configurable FIQ interrupt dispatcher.
 */
Void interrupt Hwi_dispatchFIQC()
{
    UInt intNum;
    Hwi_Object *hwi;
    volatile UInt dummy;

    /* Read to force prioritization logic to take effect */
    dummy = Hwi_vim.FIQVECADDRESS;

    if (Hwi_vim.ACTIVEFIQ & 0x80000000) {
        intNum = Hwi_vim.ACTIVEFIQ & 0x3F;
    }
    else {
        Hwi_module->spuriousInts++;
        Hwi_vim.FIQVECADDRESS = 0;
        return;
    }

    hwi = Hwi_module->dispatchTable[intNum];

    if (hwi->triggerType == Hwi_TriggerType_PULSE) {
        Hwi_vim.GROUP[intNum >> 5].ENABLEDSTATUSCLEAR =
            (UInt)(1 << (intNum & 0x1f));
    }

    /* call the user's isr */
    (hwi->fxn)(hwi->arg);

    if (hwi->triggerType == Hwi_TriggerType_LEVEL) {
        Hwi_vim.GROUP[intNum >> 5].ENABLEDSTATUSCLEAR =
            (UInt)(1 << (intNum & 0x1f));
    }

    /* Ack end of interrupt */
    Hwi_vim.FIQVECADDRESS = intNum;
}

/*
 *  ======== Hwi_dispatchIRQC ========
 *  Configurable IRQ interrupt dispatcher.
 */
Void Hwi_dispatchIRQC(Hwi_Irp irp)
{
    Int i;
    Int swiKey;
    UInt intNum;
    Hwi_Object *hwi;
    BIOS_ThreadType prevThreadType;

    if (Hwi_vim.ACTIVEIRQ & 0x80000000) {
        intNum = Hwi_vim.ACTIVEIRQ & 0x3F;
    }
    else {
        Hwi_module->spuriousInts++;
        Hwi_vim.IRQVECADDRESS = 0;
        return;
    }

    hwi = Hwi_module->dispatchTable[intNum];

    /* save irp for ROV call stack view */
    hwi->irp = irp;

    if (Hwi_dispatcherSwiSupport) {
        swiKey = SWI_DISABLE();
    }

    /* set thread type to Hwi */
    prevThreadType = BIOS_setThreadType(BIOS_ThreadType_Hwi);

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    /* call the begin hooks */
    for (i = 0; i < Hwi_hooks.length; i++) {
        if (Hwi_hooks.elem[i].beginFxn != NULL) {
            Hwi_hooks.elem[i].beginFxn((IHwi_Handle)hwi);
        }
    }
#endif

    Log_write5(Hwi_LM_begin, (IArg)hwi, (IArg)hwi->fxn,
               (IArg)prevThreadType, (IArg)intNum, hwi->irp);

    if (hwi->triggerType == Hwi_TriggerType_PULSE) {
        Hwi_vim.GROUP[intNum >> 5].ENABLEDSTATUSCLEAR =
            (UInt)(1 << (intNum & 0x1f));
    }

    if (Hwi_dispatcherAutoNestingSupport) {
        Hwi_enable();

        /* call the user's isr */
        (hwi->fxn)(hwi->arg);

        Hwi_disable();
    }
    else {
        /* call the user's isr */
        (hwi->fxn)(hwi->arg);
    }

    if (hwi->triggerType == Hwi_TriggerType_LEVEL) {
        Hwi_vim.GROUP[intNum >> 5].ENABLEDSTATUSCLEAR =
            (UInt)(1 << (intNum & 0x1f));
    }

    /* Ack end of interrupt */
    Hwi_vim.IRQVECADDRESS = intNum;

    Log_write1(Hwi_LD_end, (IArg)hwi);

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    /* call the end hooks */
    for (i = 0; i < Hwi_hooks.length; i++) {
        if (Hwi_hooks.elem[i].endFxn != NULL) {
            Hwi_hooks.elem[i].endFxn((IHwi_Handle)hwi);
        }
    }
#endif

    /* Run Swi scheduler */
    if (Hwi_dispatcherSwiSupport) {
        SWI_RESTORE(swiKey);
    }

    /* restore thread type */
    BIOS_setThreadType(prevThreadType);
}
