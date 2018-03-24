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

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Log.h>
#include <xdc/runtime/Assert.h>

#include <ti/sysbios/hal/Cache.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/interfaces/IHwi.h>
#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/family/arm/HwiCommon.h>

#include "package/internal/Hwi.xdc.h"

extern Void ti_sysbios_family_arm_da830_Hwi_dispatchIRQ(Void);
extern Void ti_sysbios_family_arm_da830_Hwi_init(Void);
extern Char *ti_sysbios_family_xxx_Hwi_switchToIsrStack();
extern Void ti_sysbios_family_xxx_Hwi_switchToTaskStack(Char *oldTaskSP);
extern Void ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());

#define Hwi_switchToIsrStack ti_sysbios_family_xxx_Hwi_switchToIsrStack
#define Hwi_switchToTaskStack ti_sysbios_family_xxx_Hwi_switchToTaskStack
#define Hwi_switchAndRunFunc ti_sysbios_family_xxx_Hwi_switchAndRunFunc

#ifdef ti_sysbios_family_arm_da830_Hwi_dispatcherTaskSupport__D
/* disable unused local variable warning during optimized compile */
#pragma diag_suppress=179
#define TASK_DISABLE Task_disable
#define TASK_RESTORE Task_restoreHwi
#else
#define TASK_DISABLE Hwi_taskDisable
#define TASK_RESTORE Hwi_taskRestoreHwi
#endif

#ifdef ti_sysbios_family_arm_da830_Hwi_dispatcherSwiSupport__D
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

    /* set up FIQ stack pointer & switch to SYSTEM mode */
    Hwi_init();                 

    Hwi_initIntController();

    /* 
     * Initialize the pointer to the isrStack.
     *
     * The dispatcher's SP is decremented to accomodate its local variables 
     * BEFORE switching to the ISR stack. Consequently, the intial value of
     * the ISR stack SP must leave room for these variables.
     *
     * Leave room for up to 32 32 bit local variables.
     */
    Hwi_module->isrStack = (Char *) (((UInt32) (Hwi_module->isrStackBase) & 0xfffffff8) + 
                                     (UInt32) Hwi_module->isrStackSize - 32 * sizeof(Int));

    Hwi_module->taskSP = (Char *)-1;    /* signal that we're executing */
                                        /* on the ISR stack */
    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        hwi = Hwi_module->dispatchTable[i];
        if (hwi !=  NULL) {
            Hwi_postInit(hwi, NULL);
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

    if (Hwi_module->dispatchTable[intNum] != NULL) {
        Error_raise(eb, Hwi_E_alreadyDefined, intNum, 0);
        return (1);
    }

    Hwi_module->dispatchTable[intNum] = hwi;

    hwi->intNum = intNum;

    if ((params->priority > 1) || (params->priority < 0)) {
        Hwi_plug(intNum, Hwi_dispatchIRQ);
    }
    else {
        Hwi_plug(intNum, Hwi_dispatchFIQC);
    }

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

    hwi->irp = 0;

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

    return (0);
}

/*
 *  ======== Hwi_Instance_finalize ========
 *  Here on Hwi_delete() or failed Hwi_create().
 */
Void Hwi_Instance_finalize(Hwi_Object *hwi, Int status)
{
    Int i, cnt;
    UInt intNum;

    if (status == 1) {  /* failed early in Hwi_Instance_init() */
        return;
    }

    for (intNum = 0; intNum < Hwi_NUM_INTERRUPTS; intNum++) {
        if (Hwi_module->dispatchTable[intNum] == hwi) {
            break;
        }
    }

    /* Kill the interrupt */
    Hwi_disableInterrupt(intNum);

    /* null out the dispatch table entry */
    Hwi_module->dispatchTable[intNum] = NULL;

    if (status == 2) {  /* failed in the middle of Hwi_instance_init() */
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
 *  ======== Hwi_initIntController ========
 */
Void Hwi_initIntController()
{
    UInt i;

    /*
     * Issue a hard reset to the INTC through the psc.
     * TBD!
     */

    /* 
     * Set priority hold mode, auto-individual-nesting, 
     * and normal-wakeup modes.
     */
    Hwi_cpIntc.CR = 0x14;

    /* Disable all interrupts to start with */
    Hwi_cpIntc.ECR[0] = 0xffffffff;
    Hwi_cpIntc.ECR[1] = 0xffffffff;
    Hwi_cpIntc.ECR[2] = 0xffffffff;
    Hwi_cpIntc.ECR[3] = 0xffffffff;
    
    /* Enable any statically config'd interrupts that are enabled */
    Hwi_cpIntc.ESR[0] = Hwi_module->er[0];
    Hwi_cpIntc.ESR[1] = Hwi_module->er[1];
    Hwi_cpIntc.ESR[2] = Hwi_module->er[2];
    Hwi_cpIntc.ESR[3] = Hwi_module->er[3];
    
    /* Clear any currently pending, enabled interrupts */
    Hwi_cpIntc.SECR[0] = Hwi_module->er[0];
    Hwi_cpIntc.SECR[1] = Hwi_module->er[1];
    Hwi_cpIntc.SECR[2] = Hwi_module->er[2];
    Hwi_cpIntc.SECR[3] = Hwi_module->er[3];

    /* Set interrupt priorities */
    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        Hwi_setPriority(i, Hwi_module->priorities[i]);
    }

    /* 
     * Channel mapping/priorities are hard wired, no need to 
     * configure the Channel Map Registers.
     */

    /*
     * Set up vector table.
     * The vectorizer is used as a power assist to calculate
     * the address of the dispatch table entry.
     */

    /* Point Vector Base to generated Hwi_vectorTable */
    Hwi_cpIntc.VBR = Hwi_module->vectorTableBase;

    /* each entry is 8 bytes */
    Hwi_cpIntc.VSR = 1;

    /* init spurious interrupt vector */
    Hwi_cpIntc.VNR = Hwi_spuriousInt;

    /*
     * Enable each host interrupt (FIQ and IRQ)
     */
    Hwi_cpIntc.HIEISR = 0;      /* enable FIQ */
    Hwi_cpIntc.HIEISR = 1;      /* enable IRQ */

    /*
     * Globally enable all host interrupts
     */
    Hwi_cpIntc.GER = 1;
}

/*
 *  ======== Hwi_startup ========
 */
Void Hwi_startup()
{
    Hwi_enable();
}

/*
 * Below APIs provided for backward compatability.
 */

#ifdef __ti__
#pragma CODE_SECTION(ti_sysbios_family_arm_da830_Hwi_disable__E, ".text:ti_sysbios_family_arm_da830_Hwi_disable__E")
#pragma CODE_SECTION(ti_sysbios_family_arm_da830_Hwi_enable__E, ".text:ti_sysbios_family_arm_da830_Hwi_enable__E")
#pragma CODE_SECTION(ti_sysbios_family_arm_da830_Hwi_restore__E, ".text:ti_sysbios_family_arm_da830_Hwi_restore__E")
#pragma FUNC_EXT_CALLED(ti_sysbios_family_arm_da830_Hwi_disable__E);
#pragma FUNC_EXT_CALLED(ti_sysbios_family_arm_da830_Hwi_enable__E);
#pragma FUNC_EXT_CALLED(ti_sysbios_family_arm_da830_Hwi_restore__E);
#endif

/*
 *  ======== Hwi_disable ========
 *  disables only IRQ interrupts
 */

UInt ti_sysbios_family_arm_da830_Hwi_disable__E()
{
    return HwiCommon_disable();
}

/*
 *  ======== Hwi_enable ========
 *  enables only IRQ interrupts
 */
UInt ti_sysbios_family_arm_da830_Hwi_enable__E()
{
    return HwiCommon_enable();
}

/*
 *  ======== Hwi_restore ========
 *  restores only IRQ interrupts
 */
Void ti_sysbios_family_arm_da830_Hwi_restore__E(UInt key)
{
    HwiCommon_restore(key);
}

/*
 *  ======== Hwi_disableFIQ ========
 *  disables only FIQ interrupts
 */

UInt Hwi_disableFIQ()
{
    return HwiCommon_disableFIQ();
}

/*
 *  ======== Hwi_enableFIQ ========
 *  enables only FIQ interrupts
 */
UInt Hwi_enableFIQ()
{
    return HwiCommon_enableFIQ();
}

/*
 *  ======== Hwi_restoreFIQ ========
 *  restores only IRQ interrupts
 */
Void Hwi_restoreFIQ( UInt key )
{
    HwiCommon_restoreFIQ(key);
}

/*
 *  ======== Hwi_disableFIQ ========
 *  disables only FIQ interrupts
 */

UInt Hwi_disableIRQ()
{
    return HwiCommon_disableIRQ();
}

/*
 *  ======== Hwi_enableIRQ ========
 *  enables only IRQ interrupts
 */
UInt Hwi_enableIRQ()
{
    return HwiCommon_enableIRQ();
}

/*
 *  ======== Hwi_restoreIRQ ========
 *  restores only IRQ interrupts
 */
Void Hwi_restoreIRQ( UInt key )
{
    HwiCommon_restoreIRQ(key);
}

/*
 *  ======== Hwi_getHandle ========
 */
Hwi_Handle Hwi_getHandle(UInt intNum)
{
    return (Hwi_module->dispatchTable[intNum]);
}

/*
 *  ======== Hwi_plug ========
 */
Void Hwi_plug(UInt intNum, Hwi_PlugFuncPtr fxn)
{
    UInt32 *ldrpc, *func;

    ldrpc = (UInt32 *)Hwi_module->vectorTableBase + intNum * 2;
    func = (UInt32 *)Hwi_module->vectorTableBase + intNum * 2 + 1;

    /* install "ldr pc, [pc, 4]" instruction */
    *ldrpc = 0xE51FF004;

    /* install ptr to function for ldr pc, [pc, 4] to read. */
    *func = (UInt32)fxn;

    /* flush and invalidate the cache line for this vector table entry */
//    Cache_wbInv((Ptr)ldrpc, 8, Cache_Type_ALL, TRUE);
}

/*
 *  ======== Hwi_post ========
 */
Void Hwi_post(UInt intNum)
{
    Hwi_cpIntc.SISR = intNum;
    asm("   mcr   p15, #0, r0, c7, c0, #4;  WFI");
}

/*
 *  ======== Hwi_getTaskSP ========
 */
Char *Hwi_getTaskSP()
{
    return (HwiCommon_getTaskSP());
}

/*
 *  ======== Hwi_disableInterrupt ========
 */
UInt Hwi_disableInterrupt(UInt intNum)
{
    UInt oldEnableState, index;

    index = intNum >> 5;

    oldEnableState = Hwi_cpIntc.ESR[index] & (1 << (intNum & 0x1f));

    Hwi_cpIntc.EICR = intNum; /* clear the enable for this int */

    return oldEnableState;
}

/*
 *  ======== Hwi_enableInterrupt ========
 */
UInt Hwi_enableInterrupt(UInt intNum)
{
    UInt oldEnableState, index;

    index = intNum >> 5;

    oldEnableState = Hwi_cpIntc.ESR[index] & (1 << (intNum & 0x1f));

    Hwi_cpIntc.EISR = intNum; /* set the enable for this int */

    return oldEnableState;
}

/*
 *  ======== Hwi_RestoreInterrupt ========
 */
Void Hwi_restoreInterrupt(UInt intNum, UInt key)
{
    if (key) {
        Hwi_cpIntc.EISR = intNum; /* set the enable for this int */
    }
    else {
        Hwi_cpIntc.EICR = intNum; /* clear the enable for this int */
    }
}

/*
 *  ======== Hwi_beginIRQ ========
 */
Void Hwi_beginIRQ()
{
    Hwi_cpIntc.HIDISR = 1;
}

/*
 *  ======== Hwi_endIRQ ========
 */
Void Hwi_endIRQ()
{
    Hwi_cpIntc.HIEISR = 1;
}

/*
 *  ======== Hwi_beginFIQ ========
 */
Void Hwi_beginFIQ()
{
    Hwi_cpIntc.HIDISR = 0;
}

/*
 *  ======== Hwi_endFIQ ========
 */
Void Hwi_endFIQ()
{
    Hwi_cpIntc.HIEISR = 0;
}

/*
 *  ======== Hwi_clearInterrupt ========
 */
Void Hwi_clearInterrupt(UInt intNum)
{
    Hwi_cpIntc.SICR = intNum; /* clear the interrupt status for this int */
}

/*
 *  ======== Hwi_switchFromBootStack ========
 *  Indicate that we are leaving the boot stack and
 *  are about to switch to a task stack.
 */
Void Hwi_switchFromBootStack()
{
    HwiCommon_switchFromBootStack();
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

/*
 *  ======== Hwi_setPriority ========
 *  Set an interrupt's relative priority.
 *
 *  @param(intNum)      ID of interrupt
 *  @param(priority)    priority
 */
Void Hwi_setPriority(UInt intNum, UInt priority)
{
    Hwi_cpIntc.CMR[intNum] = priority; 
}

/*
 *  ======== Hwi_reconfig ========
 *  Reconfigure a dispatched interrupt.
 */
Void Hwi_reconfig(Hwi_Object *hwi, Hwi_FuncPtr fxn, const Hwi_Params *params)
{
    UInt intNum;
    Int priority;

    for (intNum = 0; intNum < Hwi_NUM_INTERRUPTS; intNum++) {
        if (Hwi_module->dispatchTable[intNum] == hwi) {
            break;
        }
    }

    Hwi_disableInterrupt(intNum);

    hwi->fxn = fxn;
    hwi->arg = params->arg;

    priority = params->priority;

    /* 
     * the -1 sentinel priority is the default passed by hal Hwi_create().
     * Translate it to 31, which is our default priority.
     */

    if (priority == -1) {
        priority = 31;
    }

    Hwi_module->priorities[intNum] = priority;

    Hwi_setPriority(intNum, priority);

    Assert_isTrue((params->maskSetting != Hwi_MaskingOption_BITMASK),
                  Hwi_A_unsupportedMaskingOption);
                  
    switch (params->maskSetting) {
        case Hwi_MaskingOption_NONE:
            hwi->handler = Hwi_handlerNONE;
            break;
        case Hwi_MaskingOption_ALL:
            hwi->handler = Hwi_handlerALL;
            break;
        case Hwi_MaskingOption_LOWER:
            hwi->handler = Hwi_handlerLOWER;
            break;
        case Hwi_MaskingOption_BITMASK:
        case Hwi_MaskingOption_SELF:
            hwi->handler = Hwi_handlerSELF;
            break;
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

#pragma CLINK (Hwi_spuriousInt)
Void interrupt Hwi_spuriousInt()
{
}

/*
 *  ======== Hwi_dispatchFIQC ========
 *  FIQ interrupt dispatcher
 *  Service all pending and enabled FIQ interrupts
 */
#pragma CLINK (Hwi_dispatchFIQC)
Void interrupt Hwi_dispatchFIQC()
{
    Hwi_Object *hwi;
    Int intNum;

    intNum = Hwi_cpIntc.HIPIR[0];

    /* disable host interrupt 0 (FIQ) */
    Hwi_cpIntc.HIDISR = 0;

    Hwi_cpIntc.SICR = intNum; /* clear interrupt */

    hwi = Hwi_module->dispatchTable[intNum];

    Log_write4(Hwi_LM_begin, (IArg)hwi, (IArg)hwi->fxn, 
               (IArg)BIOS_ThreadType_Main, (IArg)intNum);

    (hwi->fxn)(hwi->arg);

    Log_write1(Hwi_LD_end, (IArg)hwi);

    /* enable host interrupt 0 (FIQ) */
    Hwi_cpIntc.HIEISR = 0;
}

/*
 *  ======== Hwi_dispatchIRQC ========
 *  Configurable IRQ interrupt dispatcher.
 */
Void Hwi_dispatchIRQC()
{
    /*
     * Enough room is reserved above the isr stack to handle
     * as many as 16 32-bit stack resident local variables.
     * This space is reserved for the Swi scheduler.
     *
     * If the swi scheduler requires more than this, you must
     * handle this in Hwi_Module_startup().
     */

    Hwi_Object *hwi;
    BIOS_ThreadType prevThreadType;
    Int intNum;
    Int swiKey;
    Int i;

    if (Hwi_dispatcherSwiSupport) {
        swiKey = SWI_DISABLE();
    }

    /* set thread type to Hwi */
    prevThreadType = BIOS_setThreadType(BIOS_ThreadType_Hwi);

    /* read interrupt index */
    intNum = Hwi_cpIntc.HIPIR[1];

    /* disable host interrupt 1 (IRQ) */
    Hwi_cpIntc.HIDISR = 1;

    hwi = Hwi_module->dispatchTable[intNum];

    hwi->irp = Hwi_module->irp;

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

    /* call the user's isr */
    if (Hwi_dispatcherAutoNestingSupport) {
        (hwi->handler)(hwi, intNum);
    }
    else {
        /* clear the interrupt status for this int */
        Hwi_cpIntc.SICR = intNum;

        (hwi->fxn)(hwi->arg);

        /* re-enable IRQ */
        Hwi_cpIntc.HIEISR = 1;
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

Void Hwi_handlerNONE(Hwi_Object *hwi, UInt intNum)
{
    Int32 nestingLevel;

    /* remember old nesting priority level */
    nestingLevel = Hwi_cpIntc.HINLR[1];

    /* forcibly unmask all channels/priorities */
    Hwi_cpIntc.HINLR[1] = 0x80000020;

    /* clear the interrupt status for this int */
    Hwi_cpIntc.SICR = intNum;

    /* re-enable IRQ */
    Hwi_cpIntc.HIEISR = 1;
    
    Hwi_enable();

    (hwi->fxn)(hwi->arg);

    Hwi_disable();

    /* disable IRQ */
    Hwi_cpIntc.HIDISR = 1;

    /* restore previous nesting level */
    Hwi_cpIntc.HINLR[1] = nestingLevel | 0x80000000;
 
    /* re-enable IRQ */
    Hwi_cpIntc.HIEISR = 1;
}

Void Hwi_handlerALL(Hwi_Object *hwi, UInt intNum)
{
    /* clear the interrupt status for this int */
    Hwi_cpIntc.SICR = intNum;

    (hwi->fxn)(hwi->arg);

    /* re-enable IRQ */
    Hwi_cpIntc.HIEISR = 1;
}

Void Hwi_handlerLOWER(Hwi_Object *hwi, UInt intNum)
{
    Int32 nestingLevel;

    /* remember old nesting priority level */
    nestingLevel = Hwi_cpIntc.HINLR[1];

    /* internally set the current nesting level */
    Hwi_cpIntc.HINLR[1] = 0;

    /* clear the interrupt status for this int */
    Hwi_cpIntc.SICR = intNum;

    /* re-enable IRQs */
    Hwi_cpIntc.HIEISR = 1;
    
    Hwi_enable();

    (hwi->fxn)(hwi->arg);

    Hwi_disable();

    /* disable IRQs */
    Hwi_cpIntc.HIDISR = 1;

    /* restore previous nesting level */
    Hwi_cpIntc.HINLR[1] = nestingLevel | 0x80000000;
 
    /* re-enable IRQ */
    Hwi_cpIntc.HIEISR = 1;
}

Void Hwi_handlerSELF(Hwi_Object *hwi, UInt intNum)
{
    Int32 nestingLevel;

    /* remember old nesting priority level */
    nestingLevel = Hwi_cpIntc.HINLR[1];

    /* forcibly unmask all channels/priorities */
    Hwi_cpIntc.HINLR[1] = 0x80000020;

    /* clear the interrupt status for this int */
    Hwi_cpIntc.SICR = intNum;

    /* disable this int */
    Hwi_cpIntc.EICR = intNum;

    /* re-enable IRQs */
    Hwi_cpIntc.HIEISR = 1;
    
    Hwi_enable();

    (hwi->fxn)(hwi->arg);

    Hwi_disable();

    /* disable IRQs */
    Hwi_cpIntc.HIDISR = 1;

    /* enable this int */
    Hwi_cpIntc.EISR = intNum;

    /* restore previous nesting level */
    Hwi_cpIntc.HINLR[1] = nestingLevel | 0x80000000;

    /* re-enable IRQs */
    Hwi_cpIntc.HIEISR = 1;
}


