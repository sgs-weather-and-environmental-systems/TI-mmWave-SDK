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
 *  ======== Hwi.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Log.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/hal/Core.h>
#define ti_sysbios_knl_Task__internalaccess
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/interfaces/IHwi.h>

#include "package/internal/Hwi.xdc.h"

#ifdef ti_sysbios_family_arm_gic_Hwi_dispatcherTaskSupport__D
#define TASK_DISABLE Task_disable
#define TASK_RESTORE Task_restoreHwi
#else
#define TASK_DISABLE Hwi_taskDisable
#define TASK_RESTORE Hwi_taskRestoreHwi
#endif

#ifdef ti_sysbios_family_arm_gic_Hwi_dispatcherSwiSupport__D
#define SWI_DISABLE Swi_disable
#define SWI_RESTORE Swi_restoreHwi
#else
#define SWI_DISABLE Hwi_swiDisable
#define SWI_RESTORE Hwi_swiRestoreHwi
#endif

#define Hwi_readSystemReg  ti_sysbios_family_arm_gicv3_Hwi_readSystemReg
#define Hwi_writeSystemReg ti_sysbios_family_arm_gicv3_Hwi_writeSystemReg

#define PRINTF_64BIT_ARG(X) ((UInt64)X >> 32),((UInt64)X & 0xFFFFFFFF)

/*
 *  ======== Hwi_Module_startup ========
 *  must initialize IRQ (and SWI?) SPs (R13s)
 */
Int Hwi_Module_startup (Int startupPhase)
{
    int i;
    Hwi_Object *hwi;

    /* must wait for these modules to initialize first */
    if (!Startup_rtsDone()) {
        return Startup_NOTDONE;
    }

    /* okay to proceed with initialization */

#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    for (i = 0; i < Hwi_hooks.length; i++) {
        if (Hwi_hooks.elem[i].registerFxn != NULL) {
            Hwi_hooks.elem[i].registerFxn(i);
        }
    }
#endif

    Hwi_initIntController();

    /*
     * Round up isrStackBase address to align with the cache line size
     */
    if ((UInt64)(Hwi_module->isrStackBase) & (UInt64)0x3F) {
        Hwi_module->isrStackBase =
            (Ptr)(((UInt64)(Hwi_module->isrStackBase) + 64) & ~((UInt64)0x3F));
        // TODO This assumes a cache line size of 64 bytes
    }

    /*
     * Initialize the pointer to the isrStack.
     *
     * The dispatcher's SP must be aligned on a long word boundary
     */
    for (i = 0; i < Core_numCores; i++) {
        if (i == 0) {
            Hwi_module->isrStack[i] =
                (Char *)((UInt64)(Hwi_module->isrStackBase) +
                (UInt64)(Hwi_module->isrStackSize));
        }
        else {
            Hwi_module->isrStack[i] =
                (Char *)((UInt64)(Hwi_module->hwiStack[i]) +
                (UInt64)(Hwi_module->isrStackSize));
        }
    }

    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        hwi = Hwi_module->dispatchTable[i];
        if (hwi != NULL) {
            Hwi_postInit(hwi, NULL);
        }
    }

    return (Startup_DONE);
}

/*
 *  ======== Hwi_Instance_init  ========
 */
Int Hwi_Instance_init(Hwi_Object *hwi, Int intNum, Hwi_FuncPtr fxn,
        const Hwi_Params *params, Error_Block *eb)
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

    // TODO fix IRP
    hwi->irp = 0;

    status = Hwi_postInit(hwi, eb);

    if (Error_check(eb)) {
        return (3 + status);
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

    return (0);
}

/*
 *  ======== Hwi_Instance_finalize ========
 */
Void Hwi_Instance_finalize(Hwi_Object *hwi, Int status)
{
#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    Int i, cnt;
#endif
    UInt intNum;

    if (status == 1) {  /* failed early in Hwi_Instance_init() */
        return;
    }

    for (intNum = 0; intNum < Hwi_NUM_INTERRUPTS; intNum++) {
        if (Hwi_module->dispatchTable[intNum] == hwi) {
            break;
        }
    }

    if (intNum == Hwi_NUM_INTERRUPTS) {
        Error_raise(NULL, Hwi_E_handleNotFound, hwi, 0);
        return;
    }

    Hwi_disableInterrupt(intNum);
    Hwi_module->dispatchTable[intNum] = NULL;

    if (status == 2) {  /* failed mid way within Hwi_Instance_init() */
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
    UInt32 i, j;
    UInt32 intActiveReg;

    /*
     * Disable IRQs
     */
    Core_hwiDisable();

    /* Enable interrupt controller system register access at EL1 */
    Hwi_writeSystemReg(s3_0_c12_c12_5, 0x7);   /* icc_sre_el1 */

    /*
     * Disable forwarding of interrupts in GIC Distributer and CPU interface
     * Controller.
     */
    if (Hwi_initGicd == TRUE) {
        Hwi_gicd.CTLR = 0x0;
    }
    Hwi_writeSystemReg(s3_0_c12_c12_7, 0x0);   /* icc_igrpen1_el1 */

    /*
     * Disable all interrupts at startup
     */
    Hwi_gicMap[0].gics->ICENABLER0 = 0xFFFFFFFF;
    if (Hwi_initGicd == TRUE) {
        for (i = 1; i < Hwi_NUM_GICD_ENABLE_REGS; i++) {
            Hwi_gicd.ICENABLER[i] = 0xFFFFFFFF;
        }
    }

    /*
     * Enable forwarding of interrupts in GIC Distributor and CPU interface
     * Controller.
     */
    if (Hwi_initGicd == TRUE) {
        Hwi_gicd.CTLR = 0x2;
    }
    Hwi_writeSystemReg(s3_0_c12_c12_7, 0x1);   /* icc_igrpen1_el1 */

    /* Search for any previously active interrupts and acknowledge them */
    intActiveReg = Hwi_gicMap[0].gics->ICACTIVER0;
    if (intActiveReg) {
        for (j = 0; j < 32; j++) {
            if (intActiveReg & 0x1) {
                Hwi_writeSystemReg(s3_0_c12_c12_1, j);   /* icc_eoir1_el1 */
            }
            intActiveReg = intActiveReg >> 1;
        }
    }
#if defined(ti_sysbios_family_arm_gicv3_Hwi_initGicd__D) && \
    (ti_sysbios_family_arm_gicv3_Hwi_initGicd__D == TRUE)
    for (i = 1; i < Hwi_NUM_GICD_ENABLE_REGS; i++) {
        intActiveReg = Hwi_gicd.ISACTIVER[i];
        if (intActiveReg) {
            for (j = 0; j < 32; j++) {
                if (intActiveReg & 0x1) {
                    Hwi_writeSystemReg(s3_0_c12_c12_1, (i * 32) + j);
                                                         /* icc_eoir1_el1 */
                }
                intActiveReg = intActiveReg >> 1;
            }
        }
    }
#endif

    /*
     * Clear any currently pending enabled interrupts
     */
    Hwi_gicMap[0].gics->ICPENDR0 = 0xFFFFFFFF;
    if (Hwi_initGicd == TRUE) {
        for (i = 1; i < Hwi_NUM_GICD_ENABLE_REGS; i++) {
            Hwi_gicd.ICPENDR[i] = 0xFFFFFFFF;
        }
    }

    /*
     * Clear all interrupt active status registers
     */
    Hwi_gicMap[0].gics->ICACTIVER0 = 0xFFFFFFFF;
    if (Hwi_initGicd == TRUE) {
        for (i = 1; i < Hwi_NUM_GICD_ENABLE_REGS; i++) {
            Hwi_gicd.ICACTIVER[i] = 0xFFFFFFFF;
        }

        /*
         * Initialize the interrupt routing registers for all
         * interrupts (32-1019).
         *
         * Interrupt number lower than 32 are not routed using these registers.
         */
        for (i = 32; i < Hwi_NUM_INTERRUPTS; i++) {
            Hwi_gicd.IROUTER[i] =
                    ((UInt64)(Hwi_module->intAffinity[i].routingMode) << 31) |
                    ((UInt64)(Hwi_module->intAffinity[i].aff1) << 8) |
                     (UInt64)(Hwi_module->intAffinity[i].aff0);
        }
    }

    /*
     * Initialize Binary Point Register
     */
    Hwi_writeSystemReg(s3_0_c12_c12_3, Hwi_BPR);   /* icc_bpr1_el1 */

    /*
     * Set configured interrupt Sense and Priority for each
     * interrupt
     */
    for (i=0; i < Hwi_NUM_INTERRUPTS; i++) {
        if ((Hwi_initGicd == TRUE) || (Hwi_module->dispatchTable[i] != NULL)) {
            Hwi_setPriority(i, Hwi_module->dispatchTable[i]->priority);
        }
    }

    /*
     * Initialize Interrupt Priority Mask Register
     *
     * Initialize PMR with the minimum possible interrupt priority.
     */
    Hwi_writeSystemReg(s3_0_c4_c6_0, 0xFF); /* icc_pmr_el1 */

    /*
     * Set trigger sensitivity of interrupts
     *
     * On the Cortex-A15:
     *  -   For SGI:
     *          The ICFGR bits are read-only and a bit-pair always reads as
     *          b10 because SGIs are edge-triggered.
     *  -   For PPI and SPI :
     *          The LSB of the bit-pair is read only and is always 0. MSB can
     *          be altered to change trigger sensitivity.
     *              b00    Interrupt is active-High level-sensitive
     *              b10    Interrupt is rising edge-sensitive
     */
    Hwi_gicMap[0].gics->ICFGR[1] = Hwi_module->icfgr[1];
    if (Hwi_initGicd == TRUE) {
        for (i = 2; i < (Hwi_NUM_GICD_ENABLE_REGS * 2); i++) {
            Hwi_gicd.ICFGR[i] = Hwi_module->icfgr[i];
        }
    }

    /*
     * Enable any statically config'd interrupts that are enabled.
     */
    Hwi_gicMap[0].gics->ISENABLER0 = Hwi_module->iser[0];
    for (i = 1; i < Hwi_NUM_GICD_ENABLE_REGS; i++) {
        Hwi_gicd.ISENABLER[i] = Hwi_module->iser[i];
    }
}

/*
 *  ======== Hwi_startup ========
 */
Void Hwi_startup()
{
    /* Enable IRQs */
    Hwi_enable();
}

/*
 *  ======== Hwi_getHandle ========
 */
Hwi_Handle Hwi_getHandle(UInt intNum)
{
    return (Hwi_module->dispatchTable[intNum]);
}

/*
 *  ======== Hwi_post ========
 */
Void Hwi_post(UInt intNum)
{
    if (intNum < 32) {
        Hwi_gicMap[0].gics->ISPENDR0 = 1 << intNum;
    }
    else if (intNum < Hwi_NUM_INTERRUPTS) {
        Hwi_gicd.ISPENDR[intNum >> 5] = 1 << (intNum & 0x1f);
    }
    else {
        Error_raise(0, Hwi_E_badIntNum, intNum, 0);
    }

    /*
     * TODO Remove this ???
     * Add delay to ensure posted interrupt are triggered before function
     * returns.
     */
    __asm__ __volatile__ (
        "dsb sy\n\t"
        "isb"
        ::: "memory"
    );
}

/*
 *  ======== Hwi_raiseSGI ========
 */
Void Hwi_raiseSGI(Hwi_SgiIntAffinity affinity, UInt intNum)
{
    UInt key;
    UInt64 reg;

    Assert_isTrue((intNum < 16), Hwi_A_badSGIIntNum);

    key = Core_hwiDisable();

    reg = ((UInt64)affinity.routingMode << 40) |
          ((UInt64)intNum << 24) |
          ((UInt64)affinity.aff1 << 16) |
          ((UInt64)affinity.targetList & 0xFFFF);

    /* Ensure all memory write ops complete */
    __asm__ __volatile__ (
        "dmb ishst"
        ::: "memory"
    );

    Hwi_gicd.SGIR = reg;

    Core_hwiRestore(key);
}

/*
 *  ======== Hwi_disableInterrupt ========
 */
UInt Hwi_disableInterrupt(UInt intNum)
{
    UInt key, oldEnableState, index, mask;

    key = Hwi_disable();
    index = intNum / 32;
    mask = 1 << (intNum & 0x1f);
    oldEnableState = Hwi_gicd.ISENABLER[index] & mask;
    Hwi_gicd.ICENABLER[index] = mask;
    Hwi_restore(key);

    return oldEnableState;
}

/*
 *  ======== Hwi_enableInterrupt ========
 */
UInt Hwi_enableInterrupt(UInt intNum)
{
    UInt key, oldEnableState, index, mask;

    key = Hwi_disable();
    index = intNum / 32;
    mask = 1 << (intNum & 0x1f);
    oldEnableState = Hwi_gicd.ISENABLER[index] & mask;
    Hwi_gicd.ISENABLER[index] = mask;
    Hwi_restore(key);

    return oldEnableState;
}

/*
 *  ======== Hwi_RestoreInterrupt ========
 */
Void Hwi_restoreInterrupt(UInt intNum, UInt key)
{
    if (key) {
        Hwi_enableInterrupt(intNum);
    }
    else {
        Hwi_disableInterrupt(intNum);
    }
}

/*
 *  ======== Hwi_clearInterrupt ========
 *  Clear a specific interrupt's pending status.
 */
Void Hwi_clearInterrupt(UInt intNum)
{
    /*
     * For level-triggered SPIs and PPIs, interrupt remains pending
     * if interrupt signal remains asserted.
     */

    if (intNum < 32) {
        Hwi_gicMap[0].gics->ICPENDR0 = 1 << intNum;
    }
    else if (intNum < Hwi_NUM_INTERRUPTS) {
        Hwi_gicd.ICPENDR[intNum >> 5] = 1 << (intNum & 0x1f);
    }
    else {
        Error_raise(0, Hwi_E_badIntNum, intNum, 0);
    }
}

/*
 *  ======== switchFromBootStack ========
 *  Indicate that we are leaving the boot stack and
 *  are about to switch to a task stack.
 */
Void Hwi_switchFromBootStack()
{
    Hwi_initStacks(Hwi_module->isrStack[0]);
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
        stkInfo->hwiStackPeak = stkInfo->hwiStackSize -
                    (SizeT)(--isrSP - (Char *)stkInfo->hwiStackBase);
    }
    else {
        stkInfo->hwiStackPeak = 0;
    }

    return (stackOverflow);
}

/*
 *  ======== Hwi_getCoreStackInfo ========
 *  Used to get Hwi stack usage info on the specified core.
 */
Bool Hwi_getCoreStackInfo(Hwi_StackInfo *stkInfo, Bool computeStackDepth,
    UInt coreId)
{
    Char *isrSP;
    Bool stackOverflow;

    /* Copy the stack base address and size */
    stkInfo->hwiStackSize = (SizeT)Hwi_module->isrStackSize;
    if (coreId == 0) {
        stkInfo->hwiStackBase = Hwi_module->isrStackBase;
    }
    else {
        stkInfo->hwiStackBase = Hwi_module->hwiStack[coreId];
    }

    isrSP = stkInfo->hwiStackBase;

    /* Check for stack overflow */
    stackOverflow = (*isrSP != (Char)0xbe ? TRUE : FALSE);

    if (computeStackDepth && !stackOverflow) {
        /* Compute stack depth */
        do {
        } while(*isrSP++ == (Char)0xbe);
        stkInfo->hwiStackPeak = stkInfo->hwiStackSize -
                    (SizeT)(--isrSP - (Char *)stkInfo->hwiStackBase);
    }
    else {
        stkInfo->hwiStackPeak = 0;
    }

    return (stackOverflow);
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
    if (intNum < 32) {
        Hwi_gicMap[0].gics->IPRIORITYR[intNum] = priority & 0xFF;
    }
    else if (intNum < Hwi_NUM_INTERRUPTS) {
        Hwi_gicd.IPRIORITYR[intNum] = priority & 0xFF;
    }
    __asm__ __volatile__ (
        "dsb sy"
        ::: "memory"
    );
}

/*
 *  ======== Hwi_reconfig ========
 *  Reconfigure a dispatched interrupt.
 */
Void Hwi_reconfig(Hwi_Object *hwi, Hwi_FuncPtr fxn, const Hwi_Params *params)
{
    UInt intNum, hwiKey;
    UInt32 shift, mask;

    //TODO we should clear any pending/active interrupt first ?

    for (intNum = 0; intNum < Hwi_NUM_INTERRUPTS; intNum++) {
        if (Hwi_module->dispatchTable[intNum] == hwi) {
            break;
        }
    }

    Hwi_disableInterrupt(intNum);

    hwi->fxn = fxn;
    hwi->arg = params->arg;
    hwi->type = params->type;
    hwi->priority = params->priority;
    hwi->triggerSensitivity = params->triggerSensitivity;

    if (Hwi_initGicd) {
        /*
         *  Disable interrupts before manipulating GIC registers.
         *  The GIC registers go through a read-modify-write and
         *  therefore the interrupts should be disabled in case
         *  a task switch happens and another task tries to create
         *  a hwi that attempts to modify the same set of registers.
         */
        hwiKey = Hwi_disable();

        /* Set trigger sensitivity */
        if (hwi->triggerSensitivity != ~(0)) {
            shift = (intNum & 0xF) << 1;
            mask  = 0x3 << shift;
            Hwi_gicd.ICFGR[intNum >> 4] = (Hwi_gicd.ICFGR[intNum >> 4] & (~mask)) |
                ((hwi->triggerSensitivity & 0x3) << shift);
        }

        Hwi_restore(hwiKey);
    }

    /*
     * The -1 sentinel priority is the default passed by hal Hwi_create().
     * Translate it to Hwi_DEFAULT_INT_PRIORITY, which is our default priority.
     */
    if (hwi->priority == ~0) {
        hwi->priority = Hwi_DEFAULT_INT_PRIORITY;
    }

    Hwi_setPriority(intNum, hwi->priority);

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

/*
 *  ======== Hwi_disableFxn ========
 */
#if (ti_sysbios_BIOS_smpEnabled__D)
UInt Hwi_disableFxn()
{
    /* acquire Inter-core lock */
    return (Core_lock());
}
#else
UInt Hwi_disableFxn()
{
    UInt key;
    ti_sysbios_family_arm_gicv3_HwiMacros_disable(key);
    return (key);
}
#endif

/*
 *  ======== Hwi_restoreFxn ========
 */
#if (ti_sysbios_BIOS_smpEnabled__D)
Void Hwi_restoreFxn(UInt key)
{
    /* Test IRQ bit */
    if ((key & 0x80) == 0) {
        /* call Core_unlock() with interrupt disabled */
        Core_hwiDisable();

        /* release Inter-core lock */
        Core_unlock();
    }

    Core_hwiRestore(key);
}
#else
Void Hwi_restoreFxn(UInt key)
{
    ti_sysbios_family_arm_gicv3_HwiMacros_restore(key);
}
#endif

/*
 *  ======== Hwi_enableFxn ========
 */
#if (ti_sysbios_BIOS_smpEnabled__D)
UInt Hwi_enableFxn()
{
    /* call Core_unlock() with interrupt disabled */
    Core_hwiDisable();

    /* release Inter-core lock */
    Core_unlock();

    return (Core_hwiEnable());
}
#else
UInt Hwi_enableFxn()
{
    UInt key;
    ti_sysbios_family_arm_gicv3_HwiMacros_enable(key);
    return (key);
}
#endif

/*
 *  ======== Hwi_nonPluggedHwiHandler ========
 */
Void Hwi_nonPluggedHwiHandler()
{
    /* Force MAIN threadtype So we can safely call Error_raise */
    BIOS_setThreadType(BIOS_ThreadType_Main);

    Error_raise(0, Hwi_E_undefined, Hwi_module->curIntId, 0);
}

/*
 *  ======== Hwi_dispatchIRQC ========
 *  Configurable IRQ interrupt dispatcher.
 */
Void Hwi_dispatchIRQC(Hwi_Irp irp)
{
    /*
     * TODO Stale comment ???
     * Enough room is reserved above the isr stack to handle
     * as many as 16 32-bit stack resident local variables.
     * This space is reserved for the Swi scheduler.
     *
     * If the swi scheduler requires more than this, you must
     * handle this in Hwi_Module_startup().
     */

    Hwi_Object *hwi;
    BIOS_ThreadType prevThreadType;
    UInt intNum;
    Int swiKey;
#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    Int i;
#endif

    /* Acknowledge Interrupt */
    Hwi_readSystemReg(s3_0_c12_c12_0, Hwi_module->curIntId); /* icc_iar1_el1 */

    /* Ignore spurious ints */
    if ((Hwi_module->curIntId >= 1020) && (Hwi_module->curIntId <= 1023)) {
        Hwi_module->spuriousInts++;
        Hwi_module->lastSpuriousInt = Hwi_module->curIntId;
        return;
    }

    /* save irp for ROV call stack view */
    Hwi_module->irp = irp;

    intNum = Hwi_module->curIntId;

    if (Hwi_dispatcherSwiSupport) {
        swiKey = SWI_DISABLE();
    }

    /* set thread type to Hwi */
    prevThreadType = BIOS_setThreadType(BIOS_ThreadType_Hwi);

    /* Process only this pending interrupt */
    hwi = Hwi_module->dispatchTable[Hwi_module->curIntId & 0x3FF];

    if (hwi == NULL) {
        Hwi_nonPluggedHwiHandler();
    }

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
               (IArg)prevThreadType, (IArg)Hwi_module->curIntId, hwi->irp);

    if (Hwi_dispatcherAutoNestingSupport) {
        /*
         * IRQ Handler is disabled on exception entry
         * in secure state
         */
        Core_hwiEnable();
    }

    /* call user's ISR func */
    (hwi->fxn)(hwi->arg);

    Core_hwiDisable();

    /* Signal End of Interrupt */
    Hwi_writeSystemReg(s3_0_c12_c12_1, intNum); /* icc_eoir1_el1 */

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

/*
 *  ======== Hwi_excHandler ========
 */
Void Hwi_excHandler(UInt64 *excStack, Hwi_ExcType excType)
{
    Hwi_ExcContext excContext, *excContextp;
    SizeT stackSize = 0;
    UInt8 *stack = NULL;
    UInt coreId = 0;
    UInt exceptionClass;

    if (BIOS_smpEnabled) {
        coreId = Core_getId();
    }

    Hwi_module->excActive[coreId] = TRUE;

    if (Hwi_module->excContext[coreId] == NULL) {
        Hwi_module->excContext[coreId] = &excContext;
        excContextp = &excContext;
    }
    else {
        excContextp = Hwi_module->excContext[coreId];
    }

    /* copy registers from stack to excContext */
    excContextp->x0   = (Ptr)excStack[34];      /* x0 */
    excContextp->x1   = (Ptr)excStack[35];      /* x1 */
    excContextp->x2   = (Ptr)excStack[32];      /* x2 */
    excContextp->x3   = (Ptr)excStack[33];      /* x3 */
    excContextp->x4   = (Ptr)excStack[30];      /* x4 */
    excContextp->x5   = (Ptr)excStack[31];      /* x5 */
    excContextp->x6   = (Ptr)excStack[28];      /* x6 */
    excContextp->x7   = (Ptr)excStack[29];      /* x7 */
    excContextp->x8   = (Ptr)excStack[26];      /* x8 */
    excContextp->x9   = (Ptr)excStack[27];      /* x9 */
    excContextp->x10  = (Ptr)excStack[24];      /* x10 */
    excContextp->x11  = (Ptr)excStack[25];      /* x11 */
    excContextp->x12  = (Ptr)excStack[22];      /* x12 */
    excContextp->x13  = (Ptr)excStack[23];      /* x13 */
    excContextp->x14  = (Ptr)excStack[20];      /* x14 */
    excContextp->x15  = (Ptr)excStack[21];      /* x15 */
    excContextp->x16  = (Ptr)excStack[18];      /* x16 */
    excContextp->x17  = (Ptr)excStack[19];      /* x17 */
    excContextp->x18  = (Ptr)excStack[16];      /* x18 */
    excContextp->x19  = (Ptr)excStack[17];      /* x19 */
    excContextp->x20  = (Ptr)excStack[14];      /* x20 */
    excContextp->x21  = (Ptr)excStack[15];      /* x21 */
    excContextp->x22  = (Ptr)excStack[12];      /* x22 */
    excContextp->x23  = (Ptr)excStack[13];      /* x23 */
    excContextp->x24  = (Ptr)excStack[10];      /* x24 */
    excContextp->x25  = (Ptr)excStack[11];      /* x25 */
    excContextp->x26  = (Ptr)excStack[8];       /* x26 */
    excContextp->x27  = (Ptr)excStack[9];       /* x27 */
    excContextp->x28  = (Ptr)excStack[6];       /* x28 */
    excContextp->x29  = (Ptr)excStack[7];       /* x29 */
    excContextp->x30  = (Ptr)excStack[5];       /* x30 */
    excContextp->elr  = (Ptr)excStack[3];       /* elr */
    excContextp->sp   = (Ptr)excStack[2];       /* sp */
    excContextp->esr  = (Ptr)excStack[1];       /* esr */
    excContextp->spsr = (Ptr)excStack[0];       /* spsr */

    excContextp->type = excType;

    excContextp->threadType = BIOS_getThreadType();

    switch (excContextp->threadType) {
        case BIOS_ThreadType_Task: {
            if (BIOS_taskEnabled == TRUE) {
                excContextp->threadHandle = (Ptr)Task_self();
                stack = (UInt8 *)(Task_self())->stack;
                stackSize = (Task_self())->stackSize;
            }
            break;
        }
        case BIOS_ThreadType_Swi: {
            if (BIOS_swiEnabled == TRUE) {
                excContextp->threadHandle = (Ptr)Swi_self();
                stack = Hwi_module->isrStackBase;
                stackSize = (SizeT)(Hwi_module->isrStackSize);
            }
            break;
        }
        case BIOS_ThreadType_Hwi: {
                excContextp->threadHandle = NULL;
                stack = Hwi_module->isrStackBase;
                stackSize = (SizeT)(Hwi_module->isrStackSize);
            break;
        }
        case BIOS_ThreadType_Main: {
                excContextp->threadHandle = NULL;
                stack = Hwi_module->isrStackBase;
                stackSize = (SizeT)(Hwi_module->isrStackSize);
            break;
        }
    }

    excContextp->threadStackSize = stackSize;
    excContextp->threadStack = (Ptr)stack;

    /* Force MAIN threadtype So we can safely call System_printf */

    BIOS_setThreadType(BIOS_ThreadType_Main);

    if (Hwi_enableDecode == TRUE) {
        Hwi_excDumpContext();
    }

    /* Call user's exception hook */
    switch (excType) {
        case Hwi_ExcType_Synchronous:
            if (Hwi_syncExcHookFunc[coreId] != NULL) {
                Hwi_syncExcHookFunc[coreId](excContextp);
            }
            break;
        case Hwi_ExcType_SError:
            if (Hwi_sErrorExcHookFunc[coreId] != NULL) {
                Hwi_sErrorExcHookFunc[coreId](excContextp);
            }
            break;
    }

    exceptionClass = (uintptr_t)(excContextp->esr) >> 26;

    /* raise a corresponding Error */
    switch(exceptionClass) {

        /* SVC */
        case 0x15:
            System_printf ("\nSVC Exception: PC = 0x%8.8x%8.8x  LR = 0x%8.8x%8.8x\n",
                PRINTF_64BIT_ARG(excContextp->elr),
                PRINTF_64BIT_ARG(excContextp->x30));
            break;

        /* Instruction abort */
        case 0x20:
        case 0x21:
            System_printf ("\nInstrcution Abort: PC = 0x%8.8x%8.8x  LR = 0x%8.8x%8.8x\n",
                PRINTF_64BIT_ARG(excContextp->elr),
                PRINTF_64BIT_ARG(excContextp->x30));
            break;

        /* Data abort */
        case 0x24:
        case 0x25:
            System_printf ("\nData Abort: PC = 0x%8.8x%8.8x  LR = 0x%8.8x%8.8x\n",
                PRINTF_64BIT_ARG(excContextp->elr),
                PRINTF_64BIT_ARG(excContextp->x30));
            break;

        /* Illegal execution state or PC/SP alignment fault */
        case 0x0E:
        case 0x22:
        case 0x26:
            System_printf ("\nIllegal execution state: PC = 0x%8.8x%8.8x  LR = 0x%8.8x%8.8x\n",
                PRINTF_64BIT_ARG(excContextp->elr),
                PRINTF_64BIT_ARG(excContextp->x30));
            break;
        default:
            break;
    }

    /* TODO Add Error_raise call */
    while (1);
}

/*
 *  ======== Hwi_excDumpContext ========
 */
Void Hwi_excDumpContext()
{
    Hwi_ExcContext *excp;
    Char *ttype;
    UInt coreId = 0;

    if (BIOS_smpEnabled) {
        coreId = Core_getId();
    }

    excp = Hwi_module->excContext[coreId];

    switch (excp->threadType) {
        case BIOS_ThreadType_Task: {
            ttype = "Task";
            break;
        }
        case BIOS_ThreadType_Swi: {
            ttype = "Swi";
            break;
        }
        case BIOS_ThreadType_Hwi: {
            ttype = "Hwi";
            break;
        }
        case BIOS_ThreadType_Main: {
            ttype = "Main";
            break;
        }
    }

    switch (excp->type) {
        case Hwi_ExcType_Synchronous: {
            System_printf("Synchronous ");
            break;
        }
        case Hwi_ExcType_SError: {
            System_printf("SError ");
            break;
        }
    }

    System_printf("Exception occurred in ThreadType_%s.\n", ttype);
    System_printf("%s handle: 0x%x.\n", ttype, excp->threadHandle);
    System_printf("%s stack base: 0x%x.\n", ttype, excp->threadStack);
    System_printf("%s stack size: 0x%x.\n", ttype, excp->threadStackSize);

    /*
     *  Filed Bugzilla 489399 to request support for printing 64-bit types.
     *  Until the bug is fixed, the below code splits the 64-bit value into
     *  2 32-bit unsigned values and prints them.
     */
    System_printf ("X0  = 0x%8.8x%8.8x  X1  = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x0), PRINTF_64BIT_ARG(excp->x1));
    System_printf ("X2  = 0x%8.8x%8.8x  X3  = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x2), PRINTF_64BIT_ARG(excp->x3));
    System_printf ("X4  = 0x%8.8x%8.8x  X5  = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x4), PRINTF_64BIT_ARG(excp->x5));
    System_printf ("X6  = 0x%8.8x%8.8x  X7  = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x6), PRINTF_64BIT_ARG(excp->x7));
    System_printf ("X8  = 0x%8.8x%8.8x  X9  = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x8), PRINTF_64BIT_ARG(excp->x9));
    System_printf ("X10 = 0x%8.8x%8.8x  X11 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x10), PRINTF_64BIT_ARG(excp->x11));
    System_printf ("X12 = 0x%8.8x%8.8x  X13 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x12), PRINTF_64BIT_ARG(excp->x13));
    System_printf ("X14 = 0x%8.8x%8.8x  X15 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x14), PRINTF_64BIT_ARG(excp->x15));
    System_printf ("X16 = 0x%8.8x%8.8x  X17 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x16), PRINTF_64BIT_ARG(excp->x17));
    System_printf ("X18 = 0x%8.8x%8.8x  X19 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x18), PRINTF_64BIT_ARG(excp->x19));
    System_printf ("X20 = 0x%8.8x%8.8x  X21 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x20), PRINTF_64BIT_ARG(excp->x21));
    System_printf ("X22 = 0x%8.8x%8.8x  X23 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x22), PRINTF_64BIT_ARG(excp->x23));
    System_printf ("X24 = 0x%8.8x%8.8x  X25 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x24), PRINTF_64BIT_ARG(excp->x25));
    System_printf ("X26 = 0x%8.8x%8.8x  X27 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x26), PRINTF_64BIT_ARG(excp->x27));
    System_printf ("X28 = 0x%8.8x%8.8x  X29 = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x28), PRINTF_64BIT_ARG(excp->x29));
    System_printf ("X30 = 0x%8.8x%8.8x  SP  = 0x%8.8x%8.8x\n",
        PRINTF_64BIT_ARG(excp->x30), PRINTF_64BIT_ARG(excp->sp));
    System_printf ("ELR = 0x%8.8x%8.8x  ESR = 0x%8.8x\n",
        PRINTF_64BIT_ARG(excp->elr), excp->esr);
    System_printf ("SPSR = 0x%8.8x\n", excp->spsr);
}
