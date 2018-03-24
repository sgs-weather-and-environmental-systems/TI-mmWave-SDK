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
 *  ======== Hwi.c ========
 */


#include <arp32.h>
#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Log.h>

#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/knl/Intrinsics.h>
#include <ti/sysbios/interfaces/IHwi.h>
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/family/arp32/Cache.h>

#include "package/internal/Hwi.xdc.h"

extern Void ti_sysbios_family_arp32_Hwi_dispatchAlways(Int intnum);
extern Void ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());

#define Hwi_switchAndRunFunc ti_sysbios_family_xxx_Hwi_switchAndRunFunc
#define Hwi_dispatchAlways ti_sysbios_family_arp32_Hwi_dispatchAlways

extern cregister volatile unsigned int IRP;
extern cregister volatile unsigned int IER;
extern cregister volatile unsigned int ISR;
extern cregister volatile unsigned int ICR;

#ifdef ti_sysbios_family_arp32_Hwi_dispatcherTaskSupport__D
/* disable unused local variable warning during optimized compile */
#pragma diag_suppress=179
#define TASK_DISABLE Task_disable
#define TASK_RESTORE Task_restoreHwi
#else
#define TASK_DISABLE Hwi_taskDisable
#define TASK_RESTORE Hwi_taskRestoreHwi
#endif

#ifdef ti_sysbios_family_arp32_Hwi_dispatcherSwiSupport__D
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
 */
Int Hwi_Module_startup(Int phase)
{
    Int i, j;
    Hwi_Object *hwi;
    Hwi_IntcRegs **intc = (Hwi_IntcRegs **)Hwi_INTCREGSBASEADDRS;

    /* Task and Swi APIs used not called until BIOS_start() */
    /* okay to proceed with initialization */

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    for (i = 0; i < Hwi_hooks.length; i++) {
        if (Hwi_hooks.elem[i].registerFxn != NULL) {
            Hwi_hooks.elem[i].registerFxn(i);
        }
    }
#endif

    /*
     * Initialize the pointer to the isrStack. These symbols are part of the
     * Hwi_module (instead of floating) in order to support ROM.
     */
    Hwi_module->isrStack = Hwi_getIsrStackAddress();

    /* signal that we're executing on the ISR stack */
    Hwi_module->taskSP = (Char *)-1;

    /* start with a clean slate, clear the IFR */
    ICR = 0xffff;

    /* clear all INT4-INT15 registers */
    for (i = 0; i < 4; i++) {
        for (j = 0; j < 4; j++) {
            if (i < 2 || j < 2) {
                /* clear all status bits */
                intc[i][j].status = 0xffffffff;

                /* clear all enabled bits */
                intc[i][j].clr = 0xffffffff;
            }
        }
    }

    Hwi_enableIER(0x3);     // enable RESET and NMI

    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        /* run Hwi_postInit for statically created instances */
        hwi = Hwi_module->dispatchTable[i];
        if (hwi != NULL) {
            Hwi_postInit(hwi, NULL);

            /* enable specified static interrupts */
            if (Hwi_module->interruptMask[i / 32] & (1 << (i % 32))) {
                Hwi_enableInterrupt(i);
            }
        }
    }

    return (Startup_DONE);
}

/*
 *  ======== Hwi_Instance_init ========
 */
Int Hwi_Instance_init(Hwi_Object *hwi, Int intNum,
                      Hwi_FuncPtr fxn, const Hwi_Params *params,
                      Error_Block *eb)
{
    Int status;

    /* check to make sure we don't have a bogus intNum */
    Assert_isTrue(intNum < Hwi_NUM_INTERRUPTS,
                  Hwi_A_badIntNum);

    /* check to make sure we don't have a bogus vectorNum */
    Assert_isTrue((params->vectorNum == -1) ||
                  (params->vectorNum < Hwi_NUM_VECTORS),
                  Hwi_A_badVectNum);

    /* make sure intNum being created is NULL */
    if (Hwi_module->dispatchTable[intNum] != NULL) {
        Error_raise(eb, Hwi_E_alreadyDefined, intNum, 0);
        return (1);
    }

    Hwi_module->dispatchTable[intNum] = hwi;
    Hwi_reconfig(hwi, fxn, params);

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    if (Hwi_hooks.length > 0) {
        /* Allocate environment space for each hook instance. */
        hwi->hookEnv = Memory_calloc(Hwi_Object_heap(),
                       Hwi_hooks.length * sizeof(Ptr), 0, eb);

        if (hwi->hookEnv == NULL) {
            return (2);
        }
    }
#endif

    Hwi_module->irp[hwi->vectorNum] = 0;

    status = Hwi_postInit(hwi, eb);

    if (status) {
        return (2 + status);
    }

    return (0);
}

/*
 *  ======== Hwi_postInit ========
 *  Function to be called during module startup to complete the
 *  initialization of any statically created or constructed Hwi.
 *  returns (0) and clean 'eb' on success
 *  returns 'eb' *and* 'n' for number of successful createFxn() calls iff
 *      one of the createFxn() calls fails
 */
Int Hwi_postInit(Hwi_Object *hwi, Error_Block *eb)
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

    return (0);
}

/*
 *  ======== Hwi_Instance_finalize ========
 *  Here on Hwi_delete() or failed Hwi_create().
 */
Void Hwi_Instance_finalize(Hwi_Object *hwi, Int status)
{
    Int i, cnt;
    Int key;
    UInt disableIerMask = 0;
    UInt restoreIerMask = 0;

    if (status == 1) {  /* failed early in Hwi_Instance_init() */
        return;
    }

    /* disable interrupts */
    key = Hwi_disable();

    /* recalculate the disable/restore ier masks for hwi->vectorNum */
    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        if ((i != hwi->intNum) && (Hwi_module->dispatchTable != NULL) &&
            (Hwi_module->dispatchTable[i]->vectorNum == hwi->vectorNum)) {
            disableIerMask |= Hwi_module->dispatchTable[i]->disableIerMask;
            restoreIerMask |= Hwi_module->dispatchTable[i]->restoreIerMask;
        }
    }

    Hwi_module->disableIerMask[hwi->vectorNum] = disableIerMask;
    Hwi_module->restoreIerMask[hwi->vectorNum]= restoreIerMask;
    Hwi_module->dispatchTable[hwi->intNum] = NULL;

    /* restore interrupts */
    Hwi_restore(key);

    if (status == 2) {  /* failed midway into Hwi_Instance_init() */
        return;
    }

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    if (Hwi_hooks.length > 0) {
        if (status == 0) {
            cnt = Hwi_hooks.length;
        }
        else {
            cnt = status - 3;
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
 *  ======== Hwi_selfLoop ========
 *  Unplugged vectors are plugged with this by default
 */
Void Hwi_selfLoop(UArg arg)
{
    _disable_interrupts();
    while(TRUE);
}

/*
 *  ======== Hwi_unPluggedInterrupt ========
 *  Here on interrupt unPlugged by Hwi_delete().
 */
Void Hwi_unPluggedInterrupt()
{
    while(TRUE);
}

/*
 *  ======== Hwi_nmiInterrupt ========
 */
Void Hwi_nmiInterrupt()
{
    while(TRUE);
}

/*
 *  ======== Hwi_swiInterrupt ========
 */
Void Hwi_swiInterrupt()
{
    while(TRUE);
}

/*
 *  ======== Hwi_undefInterrupt ========
 */
Void Hwi_undefInterrupt()
{
    while(TRUE);
}

/*
 *  ======== Hwi_startup ========
 */
Void Hwi_startup()
{
    Hwi_enable();
}

/*
 *  ======== Hwi_disableIER ========
 */
Bits16 Hwi_disableIER(Bits16 mask)
{
    UInt key;
    Bits16 oldIER;

    key = Hwi_disable();
    oldIER = IER;
    IER &= ~mask;
    Hwi_restore(key);

    return (oldIER);
}

/*
 *  ======== Hwi_enableIER ========
 */
Bits16 Hwi_enableIER(Bits16 mask)
{
    UInt key;
    Bits16 oldIER;

    key = Hwi_disable();
    oldIER = IER;
    IER |= mask;
    Hwi_restore(key);

    return (oldIER);
}

/*
 *  ======== Hwi_restoreIER ========
 */
Bits16 Hwi_restoreIER(Bits16 mask)
{
    UInt key;
    Bits16 oldIER;

    key = Hwi_disable();
    oldIER = IER;
    IER = mask;
    Hwi_restore(key);

    return (oldIER);
}

/*
 *  ======== Hwi_disableInterrupt ========
 */
UInt Hwi_disableInterrupt(UInt intNum)
{
    UInt key;
    UInt oldIntc;
    UInt clearBit = 1 << (intNum % 32);
    Hwi_Handle hwi = Hwi_module->dispatchTable[intNum];
    Hwi_IntcRegs **intc = (Hwi_IntcRegs **)Hwi_INTCREGSBASEADDRS;

    /* disable interrupts */
    key = Hwi_disable();

    /* get the current enabled interrupts */
    oldIntc = intc[intNum / 32][hwi->index].set;

    /* clear the specified interrupt */
    intc[intNum / 32][hwi->index].clr = clearBit;

    /* if last disabled interrupt in group, disable IER */
    if ((oldIntc == 0) || ((oldIntc & ~(clearBit)) == 0)) {
        Hwi_disableIER(1 << hwi->vectorNum);
    }

    /* restore interrupts */
    Hwi_restore(key);

    /* return the old enabled interrupts */
    return (oldIntc);
}

/*
 *  ======== Hwi_enableInterrupt ========
 */
UInt Hwi_enableInterrupt(UInt intNum)
{
    UInt key;
    UInt oldIntc;
    UInt setBit = 1 << (intNum % 32);
    Hwi_Handle hwi = Hwi_module->dispatchTable[intNum];
    Hwi_IntcRegs **intc = (Hwi_IntcRegs **)Hwi_INTCREGSBASEADDRS;

    /* disable interrupts */
    key = Hwi_disable();

    /* get the current enabled interrupts */
    oldIntc = intc[intNum / 32][hwi->index].set;

    /* set the specified interrupt */
    intc[intNum / 32][hwi->index].set = setBit;

    /* enable the IER */
    Hwi_enableIER(1 << hwi->vectorNum);

    /* restore interrupts */
    Hwi_restore(key);

    /* return the old enabled interrupts */
    return (oldIntc);
}

/*
 *  ======== Hwi_RestoreInterrupt ========
 */
Void Hwi_restoreInterrupt(UInt intNum, UInt key)
{
    if (key & (1 << (intNum))) {
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
    Hwi_Handle hwi = Hwi_module->dispatchTable[intNum];
    UInt clearBit = 1 << (intNum % 32);
    Hwi_IntcRegs **intc = (Hwi_IntcRegs **)Hwi_INTCREGSBASEADDRS;

    /* clear the status register */
    intc[intNum / 32][hwi->index].status = clearBit;
}

/*
 *  ======== Hwi_getHandle ========
 */
Hwi_Handle Hwi_getHandle(UInt intNum)
{
    return (Hwi_module->dispatchTable[intNum]);
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
 *  ======== Hwi_setFunc ========
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
    return (Hwi_module->irp[hwi->vectorNum]);
}

/*
 *  ======== Hwi_post ========
 */
Void Hwi_post(UInt intNum)
{
    Hwi_Handle hwi = Hwi_module->dispatchTable[intNum];
    UInt setBit = 1 << (intNum % 32);
    Hwi_IntcRegs **intc = (Hwi_IntcRegs **)Hwi_INTCREGSBASEADDRS;

    /* set the rawStatus register */
    intc[intNum / 32][hwi->index].rawStatus = setBit;

    /* set the ISR bit corresponding to the vector */
    ISR = (1 << hwi->vectorNum);
}

/*
 *  ======== Hwi_postIntVector ========
 */
Void Hwi_postIntVector(UInt vectNum)
{
    /* set the ISR bit corresponding to the vector */
    ISR = (1 << vectNum);
}

/*
 *  ======== Hwi_getTaskSP ========
 */
Char *Hwi_getTaskSP()
{
    return (Hwi_module->taskSP);
}

/*
 *  ======== Hwi_plug ========
 *  Plug a function directly into the interrupt vector table.
 *  This will remove the existing function and will cause functions
 *  plugged by Hwi_create() to stop working.
 */
Void Hwi_plug(UInt intNum, Hwi_PlugFuncPtr fxn)
{
    Hwi_PlugFuncPtr *intVect;

    intVect = (Hwi_PlugFuncPtr *)(intNum * 4);

    *intVect = fxn;

    /* requires a cache invalidate of the L1p cache at the vector */
    Cache_invL1pSingleAddr(intVect);
}

/*
 *  ======== Hwi_reconfig ========
 *  Reconfigure a dispatched interrupt.
 */
Void Hwi_reconfig(Hwi_Object *hwi, Hwi_FuncPtr fxn, const Hwi_Params *params)
{
    UInt intNum;

    /* determine the intNum */
    for (intNum = 0; intNum < Hwi_NUM_INTERRUPTS; intNum++) {
        if (Hwi_module->dispatchTable[intNum] == hwi) {
            break;
        }
    }

    /* set the instance fields */
    hwi->fxn = fxn;
    hwi->arg = params->arg;
    hwi->intNum = intNum;
    hwi->vectorNum = params->vectorNum;

    /* if vectorNum not specified, set the default based on intNum */
    if (params->vectorNum == -1) {
        if (intNum < 32) {
            hwi->vectorNum = 4;
        }
        else if (intNum < 64) {
            hwi->vectorNum = 8;
        }
        else if (intNum < 96) {
            hwi->vectorNum = 12;
        }
        else {
            hwi->vectorNum = 14;
        }
    }

    /*
     *  Compute the index for accessing the Interrupt controller registers.
     *  The bases are INT4 (Intc0), INT8 (Intc1), INT12 (Intc2),
     *  and INT14 (Intc3).
     */
    if (hwi->vectorNum < 8) {
        hwi->index = hwi->vectorNum - 4;
    }
    else if (hwi->vectorNum < 12) {
        hwi->index = hwi->vectorNum - 8;
    }
    else if (hwi->vectorNum < 14) {
        hwi->index = hwi->vectorNum - 12;
    }
    else {
        hwi->index = hwi->vectorNum - 14;
    }

    /* disable the interrupt */
    Hwi_disableInterrupt(intNum);

    switch (params->maskSetting) {
        case Hwi_MaskingOption_NONE:
            hwi->disableIerMask = 0;
            hwi->restoreIerMask = 0;
            break;
        case Hwi_MaskingOption_ALL:
            hwi->disableIerMask = 0xfff0;
            hwi->restoreIerMask = 0xfff0;
            break;
        default:
        case Hwi_MaskingOption_SELF:
            hwi->disableIerMask = 1 << hwi->vectorNum;
            hwi->restoreIerMask = 1 << hwi->vectorNum;
            break;
        case Hwi_MaskingOption_BITMASK:
            hwi->disableIerMask = params->disableIerMask;
            hwi->restoreIerMask = params->restoreIerMask;
            break;
    }

    Hwi_module->disableIerMask[hwi->vectorNum] |= hwi->disableIerMask;
    Hwi_module->restoreIerMask[hwi->vectorNum] |= hwi->restoreIerMask;

    if (params->enableInt) {
        Hwi_enableInterrupt(intNum);
    }
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
 *  ======== Hwi_getIsrStackAddress ========
 */
Char *Hwi_getIsrStackAddress()
{
    __extern __FAR__ char _stack[32];
    __extern __FAR__ UInt8 __TI_STACK_SIZE;
    UInt32 isrStack;

    isrStack = (UInt32)_stack + (UInt32)&__TI_STACK_SIZE - 1;

    isrStack &= ~0x7;   /* make sure stack is aligned to long word boundary */

    return ((Char *)isrStack);
}

/*
 *  ======== Hwi_getStackInfo ========
 *  Used to get Hwi stack usage info.
 */
Bool Hwi_getStackInfo(Hwi_StackInfo *stkInfo, Bool computeStackDepth)
{
    __extern __FAR__ char _stack[32];
    __extern __FAR__ UInt8 __TI_STACK_SIZE;

    Char *isrSP;
    Bool stackOverflow;

    /* Copy the stack base address and size */
    stkInfo->hwiStackSize = (SizeT)&__TI_STACK_SIZE;
    stkInfo->hwiStackBase = (Ptr)_stack;

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

/*
 *  ======== Hwi_getHookContext ========
 */
Ptr Hwi_getHookContext(Hwi_Object *hwi, Int id)
{
    return (hwi->hookEnv[id]);
}

/*
 *  ======== Hwi_setHookContext ========
 */
Void Hwi_setHookContext(Hwi_Object *hwi, Int id, Ptr hookContext)
{
    hwi->hookEnv[id] = hookContext;
}

/*
 *  ======== Hwi_dispatchCore ========
 */
#pragma FUNC_EXT_CALLED(ti_sysbios_family_arp32_Hwi_dispatchCore);
Void Hwi_dispatchCore(Int vectorNum)
{
    Hwi_Object *hwi;
    Int i, lmbd;
    Int intNumBase;
    Int vectIndex;
    Hwi_FuncPtr fxn;
    UArg arg;
    UInt32 status;
    UInt16 oldIER, disableIerMask, restoreIerMask;
    Hwi_IntcRegs **intc = (Hwi_IntcRegs **)Hwi_INTCREGSBASEADDRS;
    BIOS_ThreadType prevThreadType;
    Int swiKey;

    Hwi_module->vectNum = vectorNum;

    if (Hwi_dispatcherIrpTrackingSupport) {
        Hwi_module->irp[vectorNum] = IRP;
    }

    if (Hwi_dispatcherAutoNestingSupport) {
        disableIerMask = Hwi_module->disableIerMask[vectorNum];
        restoreIerMask = Hwi_module->restoreIerMask[vectorNum];
    }

    if (Hwi_dispatcherSwiSupport) {
        swiKey = SWI_DISABLE();
    }

    /* set thread type to Hwi */
    prevThreadType = BIOS_setThreadType(BIOS_ThreadType_Hwi);

    /* determine which intc to read */
    if (vectorNum < 12) {
        if (vectorNum < 8) {
            /* set interrupt id base to 0 */
            intNumBase = 0;
        }
        else {
            /* set interrupt id base to 32 */
            intNumBase = 32;
        }

        /* set the interrupt vector index */
        vectIndex = vectorNum % 4;
    }
    else {
        if (vectorNum < 14) {
            /* set interrupt id base to 64 */
            intNumBase = 64;
        }
        else {
            /* set interrupt id base to 96 */
            intNumBase = 96;
        }

        /* set the interrupt vector index */
        vectIndex = vectorNum % 2;
    }

    /* read the intc status register */
    status = intc[intNumBase / 32][vectIndex].status;
    intc[intNumBase / 32][vectIndex].status = status;

    /* process the interrupt(s) which were triggered */
    while (status != 0) {
        lmbd = Intrinsics_maxbit(status);
        status &= ~(1 << lmbd);

        /*
         * pre-read local copies of the variables used
         * within to eliminate memory fetch nops
         */
        hwi = Hwi_module->dispatchTable[intNumBase + lmbd];
        fxn = hwi->fxn;
        arg = hwi->arg;

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
        /* call the begin hooks */
        for (i = 0; i < Hwi_hooks.length; i++) {
            if (Hwi_hooks.elem[i].beginFxn != NULL) {
                Hwi_hooks.elem[i].beginFxn((IHwi_Handle)hwi);
            }
        }
#endif

        Log_write4(Hwi_LM_begin, (IArg)hwi, (IArg)fxn,
                  (IArg)vectorNum, Hwi_module->irp[vectorNum]);

        /* call the user's isr */
        if (Hwi_dispatcherAutoNestingSupport) {
            oldIER = IER;
            IER &= ~disableIerMask;
            Hwi_enable();

            (fxn)(arg);

            Hwi_disable();
            IER |= (restoreIerMask & oldIER);
        }
        else {
            (fxn)(arg);
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
    }

    /* Run Swi scheduler */
    if (Hwi_dispatcherSwiSupport) {
        SWI_RESTORE(swiKey);
    }

    /* restore thread type */
    BIOS_setThreadType(prevThreadType);
}

/*
 *  ======== Hwi_dispatchC ========
 *  Configurable dispatcher.
 */
#pragma FUNC_EXT_CALLED(ti_sysbios_family_arp32_Hwi_dispatchC);
Void Hwi_dispatchC(Int vectorNum)
{
    Int tskKey;

    if (Hwi_dispatcherTaskSupport) {
        tskKey = TASK_DISABLE();
    }

    Hwi_switchAndDispatch(vectorNum);

    /* Run Task scheduler */
    if (Hwi_dispatcherTaskSupport) {
        /* tskKey fetched from task stack if this is a non-nested interrupt */
        TASK_RESTORE(tskKey);   /* returns with ints disabled */
    }
}
