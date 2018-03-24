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

#define REG32(A)            (*(volatile UInt32 *) (A))

#define ESM_BASE_ADDRESS    0xFFFFF500
#define ESMSR1              (ESM_BASE_ADDRESS + 0x18)
#define ESMSR2              (ESM_BASE_ADDRESS + 0x1C)
#define ESMSR3              (ESM_BASE_ADDRESS + 0x20)
#define ESMSSR2             (ESM_BASE_ADDRESS + 0x3C)
#define ESMSR4              (ESM_BASE_ADDRESS + 0x58)

#define RCM_BASE_ADDRESS    0xFFFFFF00
#define SOFTRST2            (RCM_BASE_ADDRESS + 0x08)

extern Void ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());
extern Void ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC(
Hwi_Irp irp, Void (*dispatchC)(Hwi_Irp irp));

#define Hwi_switchAndRunFunc                                        \
        ti_sysbios_family_xxx_Hwi_switchAndRunFunc
#define Hwi_switchAndRunDispatchC                                   \
        ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC

#ifdef ti_sysbios_family_arm_tms570_Hwi_dispatcherTaskSupport__D
/* disable unused local variable warning during optimized compile */
#pragma diag_suppress=179
#define TASK_DISABLE Task_disable
#define TASK_RESTORE Task_restoreHwi
#else
#define TASK_DISABLE Hwi_taskDisable
#define TASK_RESTORE Hwi_taskRestoreHwi
#endif

#ifdef ti_sysbios_family_arm_tms570_Hwi_dispatcherSwiSupport__D
/* disable unused local variable warning during optimized compile */
#pragma diag_suppress=179
#define SWI_DISABLE Swi_disable
#define SWI_RESTORE Swi_restoreHwi
#else
#define SWI_DISABLE Hwi_swiDisable
#define SWI_RESTORE Hwi_swiRestoreHwi
#endif

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

    /*
     * Initialize the pointer to the isrStack.
     */
    Hwi_module->isrStack =
            (Char *) (((UInt32) (Hwi_module->isrStackBase) & 0xfffffff8) +
            (UInt32) Hwi_module->isrStackSize - (2 * sizeof(Int)));

    Hwi_module->taskSP = (Char *)-1;    /* signal that we're executing */
                                        /* on the ISR stack */

    /* Initialize VIM RAM phantom vector */
    Hwi_module->vimRam[0] = (UInt32)(Hwi_phantomFunc);

    /* Initialize remaining VIM RAM */
    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        /*
         *  IntNum 127 does not have a corresponding VIM RAM entry. It
         *  should be skipped.
         */
        if (i != 127) {
            hwi = Hwi_module->dispatchTable[i];
            if (hwi !=  NULL) {
                if (hwi->type == Hwi_Type_IRQ) {
                    Hwi_plug(hwi->intNum, (Hwi_PlugFuncPtr)(hwi->intNum));
                }
                else {
                    Hwi_plug(hwi->intNum, (Hwi_PlugFuncPtr)(hwi->fxn));
                }
            }
            else {
                Hwi_plug(i, (Hwi_PlugFuncPtr)(~0));
            }
        }
    }

    /*
     * Hwi_initIntController() will reset VIM. Ensure it is run after
     * VIM RAM has been initialized.
     */
    Hwi_initIntController();

    if (Hwi_errataInitEsm) {
        Hwi_initEsm();
    }

    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        /*
         *  IntNum 127 does not have a corresponding VIM RAM entry. It
         *  should be skipped.
         */
        if (i != 127) {
            hwi = Hwi_module->dispatchTable[i];
            if (hwi !=  NULL) {
                Hwi_postInit(hwi, NULL);
            }
        }
    }

    return Startup_DONE;        /* Max startup phase needed is 0 */
}

/*
 *  ======== Hwi_Instance_init  ========
 */
Int Hwi_Instance_init(Hwi_Object *hwi, Int intNum,
                      Hwi_FuncPtr fxn, const Hwi_Params *params,
                      Error_Block *eb)
{
    Int status;

    if ((intNum == 127) || (intNum >= Hwi_NUM_INTERRUPTS)) {
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
        case Hwi_MaskingOption_ALL:
        case Hwi_MaskingOption_SELF:
            break;
        case Hwi_MaskingOption_NONE:
        case Hwi_MaskingOption_BITMASK:
        default:
            Error_raise(eb, Hwi_E_unsupportedMaskingOption, 0, 0);
            break;
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

    if (hwi->type == Hwi_Type_IRQ) {
        Hwi_plug(hwi->intNum, (Hwi_PlugFuncPtr)(hwi->intNum));
    }
    else {
        Hwi_plug(hwi->intNum, (Hwi_PlugFuncPtr)(hwi->fxn));
    }

    status = Hwi_postInit(hwi, eb);

    if (status) {
        return (1 + status);
    }

    return (0);
}

/*
 *  ======== Hwi_nonPluggedHwiHandler ========
 */
Void Hwi_nonPluggedHwiHandler(UArg arg)
{
    UInt8 intNum;

    /* Force MAIN threadtype So we can safely call Error_raise */
    BIOS_setThreadType(BIOS_ThreadType_Main);

    /*
     * This function can be called on a spurious IRQ or FIQ. Since there is
     * no way to determine whether an IRQ or FIQ caused this function to get
     * called, we check both FIQINDEX and IRQINDEX. If FIQINDEX is non-zero,
     * the interrupt type must be FIQ as it is higher priority and cannot be
     * disabled. If FIQINDEX is 0, then the interrupt must be IRQ and we can
     * read and return IRQINDEX.
     */
    intNum = Hwi_vim.FIQINDEX;

    if (intNum == 0) {
        intNum = Hwi_vim.IRQINDEX;
    }

    Error_raise(0, Hwi_E_undefined, (intNum - 1), 0);
}

/*
 *  ======== Hwi_plug ========
 */
Void Hwi_plug(UInt intNum, Hwi_PlugFuncPtr fxn)
{
    Hwi_module->vimRam[intNum + 1] = (UInt)fxn;
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
    Error_Block localEB;
    Error_Block *leb;

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
                return (i + 1);
            }
        }
    }
#endif

    Hwi_setType(hwi->intNum, hwi->type);

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
    UInt intNum, key;

    for (intNum = 0; intNum < Hwi_NUM_INTERRUPTS; intNum++) {
        if (Hwi_module->dispatchTable[intNum] == hwi) {
            break;
        }
    }

    Hwi_disableInterrupt(intNum);
    Hwi_module->dispatchTable[intNum] = NULL;
    Hwi_plug(intNum, (Hwi_PlugFuncPtr)(~0));

    if (hwi->type == Hwi_Type_FIQ) {
        key = Hwi_disable();
        Hwi_module->zeroLatencyFIQMask[intNum >> 5] |= (1 << (intNum & 0x1f));
        Hwi_restore(key);
    }

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
 *  ======== Hwi_initEsm ========
 */
Void Hwi_initEsm()
{
    REG32(ESMSR1)  = 0xFFFFFFFF;
    REG32(ESMSR2)  = 0xFFFFFFFF;
    REG32(ESMSR3)  = 0xFFFFFFFF;
    REG32(ESMSSR2) = 0xFFFFFFFF;
    REG32(ESMSR4)  = 0xFFFFFFFF;
}

/*
 *  ======== Hwi_initIntController ========
 */
Void Hwi_initIntController()
{
    UInt i, numRegs;
    UInt32 regVal;

    if (Hwi_resetVIM) {
        regVal = REG32(SOFTRST2);
        regVal |= 0xAD000000;       /* Assert VIM only reset */
        REG32(SOFTRST2) = regVal;
        regVal &= ~(0xFF000000);
        REG32(SOFTRST2) = regVal;
    }

    /*
     * The interrupt controller has no RESET feature and
     * none would be required after a hard reset or power up.
     * But the CCS reset/reload process doesn't do a hard reset.
     * The code below tries to "virtually" reset the intc.
     */

    if ((Hwi_NUM_INTERRUPTS % 32) != 0) {
        numRegs = (Hwi_NUM_INTERRUPTS / 32) + 1;
    }
    else {
        numRegs = (Hwi_NUM_INTERRUPTS / 32);
    }

    /*
     * Force all interrupts to be IRQ
     */
    for (i = 0; i < numRegs; i++) {
        Hwi_vim.FIRQPR[i] = 0;

        /* clear all enables */
        Hwi_vim.REQENACLR[i] = 0xFFFFFFFF;
        Hwi_vim.WAKEENACLR[i] = 0xFFFFFFFF;

        /* clear all pending interrupts */
        Hwi_vim.INTREQ[i] = 0xFFFFFFFF;

        /* init per REQENASET settings */
        Hwi_vim.REQENASET[i] = Hwi_intReqEnaSet[i];

        /* init per WAKEENASET settings */
        Hwi_vim.WAKEENASET[i] = Hwi_wakeEnaSet[i];
    }

    /* init channel mapping */
    for (i = 2; i < Hwi_NUM_INTERRUPTS; i++) {
        /* Skip channelId 127 */
        if (i != 127) {
            Hwi_mapChannel(i, Hwi_channelMap[i]);
        }
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
    oldEnableState = Hwi_vim.REQENASET[index] & mask;
    Hwi_vim.REQENACLR[index] = mask;

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
    oldEnableState = Hwi_vim.REQENASET[index] & mask;
    Hwi_vim.REQENASET[index] = mask;

    return oldEnableState;
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
    Hwi_vim.INTREQ[index] = mask;
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

    index = intNum / 32;
    mask = 1 << (intNum & 0x1f);

    key = Hwi_disable();

    if (type == Hwi_Type_FIQ) {
        Hwi_vim.FIRQPR[index] |= mask;
    }
    else {
        Hwi_vim.FIRQPR[index] &= ~mask;
    }

    Hwi_restore(key);
}

/*
 *  ======== Hwi_reconfig ========
 *  Reconfigure a dispatched interrupt.
 */
Void Hwi_reconfig(Hwi_Object *hwi, Hwi_FuncPtr fxn, const Hwi_Params *params)
{
    UInt i, intNum, index, offset, mask, key;

    for (intNum = 0; intNum < Hwi_NUM_INTERRUPTS; intNum++) {
        if (Hwi_module->dispatchTable[intNum] == hwi) {
            break;
        }
    }

    Hwi_disableInterrupt(intNum);

    hwi->fxn = fxn;
    hwi->arg = params->arg;
    hwi->type = params->type;

    index = intNum >> 5;
    offset = intNum & 0x1f;

    switch (params->maskSetting) {
        case Hwi_MaskingOption_LOWER:
            for (i = 0; i < 4; i++) {
                if (i >= index) {
                    if ((i == index) && (offset != 0)) {
                        mask = (1 << offset);
                        hwi->disableMask[i] = mask | (~mask + 1);
                    }
                    else {
                        hwi->disableMask[i] = 0xffffffff;
                    }
                }
                else {
                    hwi->disableMask[i] = 0;
                }
            }
            break;
        case Hwi_MaskingOption_ALL:
            for (i = 0; i < 4; i++) {
                hwi->disableMask[i] = 0xffffffff;
            }
            break;
        case Hwi_MaskingOption_SELF:
            for (i = 0; i < 4; i++) {
                if (i == index) {
                    hwi->disableMask[i] = (1 << offset);
                }
                else {
                    hwi->disableMask[i] = 0;
                }
            }
            break;
        case Hwi_MaskingOption_NONE:
        case Hwi_MaskingOption_BITMASK:
        default:
            Error_raise(0, Hwi_E_unsupportedMaskingOption, 0, 0);
            break;
    }

    /*
     *  Keep track of all FIQ interrupts created so they are cleared from the
     *  disableMask and not disabled in the dispatcher.
     */
    if (hwi->type == Hwi_Type_FIQ) {
        key = Hwi_disable();
        Hwi_module->zeroLatencyFIQMask[index] &= ~(1 << offset);
        Hwi_restore(key);
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
    hwi->fxn = fxn;
    hwi->arg = arg;
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

/*
 *  ======== Hwi_mapChannel ========
 */
Void Hwi_mapChannel(UInt channelId, UInt intRequestId)
{
    Assert_isTrue((channelId != 127) && (channelId < Hwi_NUM_INTERRUPTS),
        Hwi_A_badChannelId);
#ifdef _big_endian__
    Hwi_vim.CHANCTRL[channelId] = intRequestId;
#else
    Hwi_vim.CHANCTRL[(channelId ^ 0x3)] = intRequestId;
#endif
}

/*
 *  ======== Hwi_phantomIntHandler ========
 *  Default phantom interrupt handler.
 */
interrupt Void Hwi_phantomIntHandler()
{
    Error_raise(0, Hwi_E_phantomInterrupt, 0, 0);
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
    volatile UInt dummy;
    UInt oldReqEnaMask[4];
    BIOS_ThreadType prevThreadType;

    intNum = Hwi_vim.IRQVECREG;

    if (intNum >= Hwi_NUM_INTERRUPTS) {
        Hwi_module->spuriousInts++;
        if (intNum == ~0) {
            Hwi_nonPluggedHwiHandler(0);
        }
        else if (intNum == (UInt32)(Hwi_phantomFunc)) {
            Hwi_phantomFunc();
        }
        return;
    }

    /* ack this interrupt */
    Hwi_clearInterrupt(intNum);

    hwi = Hwi_module->dispatchTable[intNum];

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

    if (Hwi_dispatcherAutoNestingSupport) {
        for (i = 0; i < 4; i++) {
            oldReqEnaMask[i] =
                Hwi_vim.REQENASET[i] & Hwi_module->zeroLatencyFIQMask[i];
            Hwi_vim.REQENACLR[i] =
                hwi->disableMask[i] & Hwi_module->zeroLatencyFIQMask[i];
            /*
             *  Ordering is preserved for all accesses to the same interface.
             *  Therefore, perform a dummy read of REQENACLR register to ensure
             *  register write is complete. This is an alternative to using
             *  "dmb" which is more expensive.
             */
            dummy = Hwi_vim.REQENACLR[i];
        }

        Hwi_enable();

        /* call the user's isr */
        (hwi->fxn)(hwi->arg);

        Hwi_disable();

        for (i = 0; i < 4; i++) {
            Hwi_vim.REQENASET[i] = oldReqEnaMask[i];
            /* Dummy read to ensure register write complete */
            dummy = Hwi_vim.REQENASET[i];
        }
    }
    else {
        /* call the user's isr */
        (hwi->fxn)(hwi->arg);
    }

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
