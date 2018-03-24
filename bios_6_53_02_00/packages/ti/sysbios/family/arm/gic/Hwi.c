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
#include <xdc/runtime/System.h>
#include <xdc/runtime/Startup.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/hal/Core.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/interfaces/IHwi.h>

#include "package/internal/Hwi.xdc.h"

extern Void ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());
extern Void ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC(
Hwi_Irp irp, Void (*dispatchC)(Hwi_Irp irp));

#define Hwi_switchAndRunFunc ti_sysbios_family_xxx_Hwi_switchAndRunFunc

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

#define NUM_GICD_ENABLE_REGS    32

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

    /* Set-up FIQ stack pointer */
    if (Hwi_enableSecureMode) {
        Hwi_initFIQStack(Hwi_module->fiqStack[0] + Hwi_module->fiqStackSize);
    }

    Hwi_initIntControllerCore0();

    /*
     * Round up Core 0's isrStackBase address to align with the cache line size
     */
    if (BIOS_smpEnabled) {
        /* Cache line size on Cortex-A15 is 64 bytes */
        Hwi_module->isrStackBase =
            (Ptr)(((UInt32)(Hwi_module->isrStackBase) + 64) & 0xFFFFFFC0);
    }

    /*
     * Initialize the pointer to the isrStack.
     *
     * The dispatcher's SP must be aligned on a long word boundary
     */
    for (i = 0; i < Core_numCores; i++) {
        if (i == 0) {
            Hwi_module->isrStack[i] =
                (Char *) (((UInt32) (Hwi_module->isrStackBase) & 0xFFFFFFF8) +
                (UInt32) (Hwi_module->isrStackSize) - (2 * sizeof(Int)));
            /*
             * Signal that we're executing on the ISR stack.
             */
            Hwi_module->taskSP[i] = (Char *)-1;
        }
        else {
            Hwi_module->isrStack[i] =
                (Char *) (((UInt32) Hwi_module->hwiStack[i] & 0xFFFFFFF8) +
                (UInt32) (Hwi_module->isrStackSize) - (2 * sizeof(Int)));
            Hwi_module->taskSP[i] = (Char *)0;
        }
    }

    /*
     * Initialize the dispatchTable with default entries pointing
     * to nonPluggedHwi() handler.
     *
     * This will catch any triggered Interrupts that were not created
     * using the Hwi module.
     */
    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        hwi = Hwi_module->dispatchTable[i];
        if (hwi !=  ti_sysbios_family_arm_gic_Hwi_Module_State_nonPluggedHwi()) {
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

    if (Hwi_module->dispatchTable[intNum] !=
        ti_sysbios_family_arm_gic_Hwi_Module_State_nonPluggedHwi()) {
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
    Hwi_module->dispatchTable[intNum] =
        ti_sysbios_family_arm_gic_Hwi_Module_State_nonPluggedHwi();

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
 *  ======== Hwi_initIntControllerCore0 ========
 */
Void Hwi_initIntControllerCore0()
{
    UInt32 i, j;
    UInt32 intActiveReg;

    /*
     * Disable IRQs
     */
    if (BIOS_smpEnabled) {
        Core_hwiDisable();
    }
    else {
        Hwi_disable();
    }

    /*
     * Disable forwarding of interrupts in GIC Distributer and CPU interface
     * Controller.
     */
    Hwi_gicd.CTLR = 0x0;
    Hwi_gicc.CTLR = 0x0;

    /*
     * Disable all interrupts at startup
     */
    for (i = 0; i < NUM_GICD_ENABLE_REGS; i++) {

        /*
         * Disable the forwarding of the corresponding interrupt from GIC
         * distributor to CPU interface.
         */
        Hwi_gicd.ICENABLER[i] = 0xFFFFFFFF;

        /* Track interrupts that cannot be disabled */
        Hwi_module->iser[i] |= Hwi_gicd.ISENABLER[i];
    }

    /*
     * Enable forwarding of interrupts in GIC Distributor and CPU interface
     * Controller.
     */
    if (Hwi_enableSecureMode) {
        Hwi_gicd.CTLR = 0x3;
        Hwi_gicc.CTLR = 0xB;
    }
    else {
        Hwi_gicd.CTLR = 0x1;
        Hwi_gicc.CTLR = 0x1;
    }

    /* Search for any previously active interrupts and acknowledge them */
    for (i = 0; i < NUM_GICD_ENABLE_REGS; i++) {
        intActiveReg = Hwi_gicd.ISACTIVER[i];
        if (intActiveReg) {
            for (j = 0; j < 32; j++) {
                if (intActiveReg & 0x1) {
                    if (Hwi_enableSecureMode) {
                        // TODO Need to somehow determine what group interrupt belonged to ?
                        Hwi_gicc.EOIR = i*32 + j;
                        Hwi_gicc.AEOIR = i*32 + j;
                    }
                    else {
                        Hwi_gicc.EOIR = i*32 + j;
                    }
                }
                intActiveReg = intActiveReg >> 1;
            }
        }
    }

    /*
     * Clear any currently pending enabled interrupts
     *
     * Note: SGIs are always enabled
     */
    for (i = 0; i < 4; i++) {
        Hwi_gicd.CPENDSGIR[i] = 0xFFFFFFFF;
    }

    for (i = 0; i < NUM_GICD_ENABLE_REGS; i++) {
        Hwi_gicd.ICPENDR[i] = 0xFFFFFFFF;
    }

    /*
     * Clear all interrupt active status registers
     */
    for (i = 0; i < NUM_GICD_ENABLE_REGS; i++) {
        Hwi_gicd.ICACTIVER[i] = 0xFFFFFFFF;
    }

    /*
     * Configure interrupt Group.
     */
    if (Hwi_enableSecureMode) {
        for (i = 0; i < (Hwi_NUM_INTERRUPTS / 32); i++) {
            Hwi_gicd.IGROUPR[i] = Hwi_module->igroupr[i];
        }
    }

    /*
     * Enable any statically config'd interrupts that are enabled.
     */
    for (i = 0; i < NUM_GICD_ENABLE_REGS; i++) {
        Hwi_gicd.ISENABLER[i] = Hwi_module->iser[i];
    }

    /*
     * Set MPU0 as the target processor for all interrupts.
     *
     * ITARGETSR[0:7] are Read-Only
     */
    if (Hwi_initGicd) {
        for (i = 8; i < (Hwi_NUM_INTERRUPTS / 4); i++) {
            Hwi_gicd.ITARGETSR[i] = Hwi_module->itargetsr[i];
        }
    }

    /*
     * Initialize Binary Point Register
     */
    if (Hwi_enableSecureMode) {
        Hwi_gicc.BPR = Hwi_BPR;
        Hwi_gicc.ABPR = Hwi_ABPR;
    }
    else {
        Hwi_gicc.BPR = Hwi_BPR;
    }

    /*
     * Set configured interrupt Sense and Priority for each
     * interrupt
     */
    for (i=0; i < Hwi_NUM_INTERRUPTS; i++) {
            Hwi_setPriority(i, Hwi_module->dispatchTable[i]->priority);
    }

    /*
     * Initialize Interrupt Priority Mask Register
     *
     * Initialize PMR with the minimum possible interrupt priority.
     */
    Hwi_gicc.PMR = Hwi_MIN_INT_PRIORITY;

    /*
     * Set trigger sensitivity of interrupts
     *
     * On the Cortex-A15:
     *  -   For SGI: The ICFGR bits are read-only and a bit-pair always
     *               reads as b10 because SGIs are edge-triggered.
     *  -   For PPI: The ICFGR bits are read-only and a bit-pair always
     *               reads as b01 because PPIs are level-sensitive.
     *  -   For SPI: The LSB of the bit-pair is read only and is always
     *               1. MSB can be altered to change trigger sensitivity.
     *               b01    Interrupt is active-High level-sensitive
     *               b11    Interrupt is rising edge-sensitive
     */
    for (i = 2; i < (Hwi_NUM_INTERRUPTS / 16); i++) {
        Hwi_gicd.ICFGR[i] = Hwi_module->icfgr[i];
    }
}

/*
 *  ======== Hwi_initIntControllerCoreX ========
 */
Void Hwi_initIntControllerCoreX()
{
    UInt i;
    UInt32 intActiveReg;

    /*
     * Interrupts should be disabled by the Core_smpBoot code so we do not
     * have to explicitly disable them here.
     */

    /* Set-up FIQ stack pointer */
    if (Hwi_enableSecureMode) {
        Hwi_initFIQStack(Hwi_module->fiqStack[Core_getId()] +
            Hwi_module->fiqStackSize);
    }

    /*
     * Initialize all banked GICD registers.
     */

    /* Search for any previously active interrupts and acknowledge them */
    intActiveReg = Hwi_gicd.ISACTIVER[0];
    if (intActiveReg) {
        for (i = 0; i < 32; i++) {
            if (intActiveReg & 0x1) {
                if (Hwi_enableSecureMode) {
                    // TODO Need to somehow determine what group interrupt belonged to ?
                    Hwi_gicc.EOIR = i;
                    Hwi_gicc.AEOIR = i;
                }
                else {
                    Hwi_gicc.EOIR = i;
                }
            }
            intActiveReg = intActiveReg >> 1;
        }
    }

    /*
     * Clear any currently pending enabled interrupts
     *
     * Note: SGIs are always enabled
     */
    for (i = 0; i < 4; i++) {
        Hwi_gicd.CPENDSGIR[i] = 0xFFFFFFFF;
    }

    Hwi_gicd.ICPENDR[0] = 0xFFFFFFFF;

    /*
     * Clear all interrupt active status registers
     */
    Hwi_gicd.ICACTIVER[0] = 0xFFFFFFFF;

    /*
     * Configure interrupt Group.
     */
    if (Hwi_enableSecureMode) {
        Hwi_gicd.IGROUPR[0] = Hwi_module->igroupr[0];
    }

    /*
     * Enable any statically config'd interrupts that are enabled.
     */
    Hwi_gicd.ISENABLER[0] = Hwi_module->iser[0];

    /*
     * Enable forwarding of interrupts in GIC Distributor and CPU interface
     * Controller.
     */
    if (Hwi_enableSecureMode) {
        Hwi_gicc.CTLR = 0xB;
    }
    else {
        Hwi_gicc.CTLR = 0x1;
    }

    /*
     * Initialize Binary Point Register
     */
    if (Hwi_enableSecureMode) {
        Hwi_gicc.BPR = Hwi_BPR;
        Hwi_gicc.ABPR = Hwi_ABPR;
    }
    else {
        Hwi_gicc.BPR = Hwi_BPR;
    }

    /*
     * Set configured interrupt Sense and Priority for each
     * interrupt
     */
    UInt regIndex, oldPriorities, newPriorities, shift, mask;
    for (i=0; i < 16; i++) {
        regIndex = i >> 2;
        shift = (i & 0x3) << 3;
        mask = 0xFF << shift;
        oldPriorities = Hwi_gicd.IPRIORITYR[regIndex] & (~mask);
        newPriorities = oldPriorities |
            ((Hwi_module->dispatchTable[i]->priority & 0xFF) << shift);
        Hwi_gicd.IPRIORITYR[regIndex] = newPriorities;
    }

    /*
     * Initialize Interrupt Priority Mask Register
     *
     * Initialize PMR with the minimum possible interrupt priority.
     */
    Hwi_gicc.PMR = Hwi_MIN_INT_PRIORITY;
}


/*
 *  ======== Hwi_startup ========
 */
Void Hwi_startup()
{
    /* Enable IRQs */
    Hwi_enable();

    if (Hwi_enableSecureMode) {
        /* Enable FIQs */
        Hwi_enableFIQ();
    }
}

/*
 *  ======== ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC ========
 *  ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC(
 *      Hwi_Irp irp, Void (*dispatchC)(Hwi_Irp irp));
 *
 *  Switch to ISR stack, call the dispatchC function and then switch
 *  back to Task stack.
 */
#if defined(__GNUC__) && !defined(__ti__)

#if (ti_sysbios_BIOS_smpEnabled__D)
Void __attribute__ ((naked)) ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC(
        Hwi_Irp irp, Void (*dispatchC)(Hwi_Irp irp))
{
    __asm__ __volatile__ (
            "push {r4-r6, lr}\n\t"
            "mrc p15, #0, r4, c0, c0, #5\n\t" /* Read core Id */
            "and r4, r4, #0x3\n\t"
            "movw r5, #:lower16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
            "movt r5, #:upper16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
            "ldr r2, [r5]\n\t"
            "ldr r6, [r2, r4, lsl #2]\n\t"    /* Old taskSP */
            "cmp r6, #0\n\t"                  /* On ISR stack already ? */
            "bne 1f\n\t"                      /* branch if yes */
            "str r13, [r2, r4, lsl #2]\n\t"   /* save SP into taskSP */
            "ldr r2, [r5, #4]\n\t"            /* switch to isr Stack */
            "ldr r13, [r2, r4, lsl #2]\n\t"   /* switch to isr Stack */
            "1:\n\t"
            "blx r1\n\t"                      /* Call dispatchC (r0 = IRP) */
            "cmp r6, #0\n\t"                  /* Lowest order ISR? */
            "bne 2f\n\t"                      /* branch to 'exitFunc' */
            "ldr r2, [r5]\n\t"                /* if yes, restore */
            "ldr r13, [r2, r4, lsl #2]\n\t"   /* Interrupted task's SP */
            "str r6, [r2, r4, lsl #2]\n\t"    /* Signal return to TaskStack */
            "2:\n\t"
            "pop {r4-r6, pc}"
                 );
}
#else /* !ti_sysbios_BIOS_smpEnabled__D */
Void __attribute__ ((naked)) ti_sysbios_family_xxx_Hwi_switchAndRunDispatchC(
        Hwi_Irp irp, Void (*dispatchC)(Hwi_Irp irp))
{
    __asm__ __volatile__ (
            "push {r4-r6, lr}\n\t"
            "movw r5, #:lower16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
            "movt r5, #:upper16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
            "ldr r2, [r5]\n\t"
            "ldr r6, [r2]\n\t"                /* Old taskSP */
            "cmp r6, #0\n\t"                  /* On ISR stack already ? */
            "bne 1f\n\t"                      /* branch if yes */
            "str r13, [r2]\n\t"               /* save SP into taskSP */
            "ldr r2, [r5, #4]\n\t"            /* switch to isr Stack */
            "ldr r13, [r2]\n\t"               /* switch to isr Stack */
            "1:\n\t"
            "blx r1\n\t"                      /* Call dispatchC (r0 = IRP) */
            "cmp r6, #0\n\t"                  /* Lowest order ISR? */
            "bne 2f\n\t"                      /* branch to 'exitFunc' */
            "ldr r2, [r5]\n\t"                /* if yes, restore */
            "ldr r13, [r2]\n\t"               /* Interrupted task's SP */
            "str r6, [r2]\n\t"                /* Signal return to TaskStack */
            "2:\n\t"
            "pop {r4-r6, pc}"
                 );
}
#endif /* ti_sysbios_BIOS_smpEnabled__D */

#endif

/*
 *  ======== ti_sysbios_family_xxx_Hwi_switchAndRunFunc ========
 *  ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());
 *
 *  Switch to ISR stack, call the function Func() and then switch
 *  back to Task stack.
 */
#if defined(__GNUC__) && !defined(__ti__)

#if (ti_sysbios_BIOS_smpEnabled__D)
Void __attribute__ ((naked)) ti_sysbios_family_xxx_Hwi_switchAndRunFunc(
        Void (*func)())
{
    __asm__ __volatile__ (
            "push {r4-r6, lr}\n\t"
            "mrc p15, #0, r4, c0, c0, #5\n\t" /* Read core Id */
            "and r4, r4, #0x3\n\t"
            "movw r5, #:lower16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
            "movt r5, #:upper16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
            "ldr r2, [r5]\n\t"
            "ldr r6, [r2, r4, lsl #2]\n\t"    /* Old taskSP */
            "cmp r6, #0\n\t"                  /* On ISR stack already ? */
            "bne 1f\n\t"                      /* branch if yes */
            "str r13, [r2, r4, lsl #2]\n\t"   /* save SP into taskSP */
            "ldr r2, [r5, #4]\n\t"
            "ldr r13, [r2, r4, lsl #2]\n\t"   /* switch to isr Stack */
            "1:\n\t"
            "blx r0\n\t"                      /* Call func */
            "cmp r6, #0\n\t"                  /* Lowest order ISR? */
            "bne 2f\n\t"                      /* branch to 'exitFunc' */
            "ldr r2, [r5]\n\t"                /* if yes, restore */
            "ldr r13, [r2, r4, lsl #2]\n\t"   /* Interrupted task's SP */
            "str r6, [r2, r4, lsl #2]\n\t"    /* Signal return to TaskStack */
            "2:\n\t"
            "pop {r4-r6, pc}"
                 );
}
#else /* !ti_sysbios_BIOS_smpEnabled__D */
Void __attribute__ ((naked)) ti_sysbios_family_xxx_Hwi_switchAndRunFunc(
        Void (*func)())
{
    __asm__ __volatile__ (
            "push {r4-r6, lr}\n\t"
            "movw r5, #:lower16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
            "movt r5, #:upper16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
            "ldr r2, [r5]\n\t"
            "ldr r6, [r2]\n\t"                /* Old taskSP */
            "cmp r6, #0\n\t"                  /* On ISR stack already ? */
            "bne 1f\n\t"                      /* branch if yes */
            "str r13, [r2]\n\t"               /* save SP into taskSP */
            "ldr r2, [r5, #4]\n\t"
            "ldr r13, [r2]\n\t"               /* switch to isr Stack */
            "1:\n\t"
            "blx r0\n\t"                      /* Call func */
            "cmp r6, #0\n\t"                  /* Lowest order ISR? */
            "bne 2f\n\t"                      /* branch to 'exitFunc' */
            "ldr r2, [r5]\n\t"                /* if yes, restore */
            "ldr r13, [r2]\n\t"               /* Interrupted task's SP */
            "str r6, [r2]\n\t"                /* Signal return to TaskStack */
            "2:\n\t"
            "pop {r4-r6, pc}"
                 );
}
#endif /* ti_sysbios_BIOS_smpEnabled__D */

#endif

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
    if (intNum < 16) {
        /*
         * SGIR Register format:
         *
         * Bits  [25:24]        [23:16]     [15]      [3:0]
         *   TargetListFilter CPUTargetList NSATT SGIInterruptId
         *
         * Selected Values for each field:
         * TargetListFilter: (0x1) Forward interrupt to all CPU
         *                   interfaces except that of the processor
         *                   that requested the interrupt.
         *                   (0x2) Forward interrupt only to CPU
         *                   that posted the interrupt.
         * CPUTargetList   : Has No effect when TargetListFilter
         *                   set to 0x2.
         * NSATT           : Writable only from secure mode.
         * SGIInterruptId  : (intNum & 0xF) SGI Interrupt Number.
         */
        Hwi_gicd.SGIR =  (0x401 << 15) | (intNum & 0xf);
    }
    else {
        if (intNum >= Hwi_NUM_INTERRUPTS) {
            Error_raise(0, Hwi_E_badIntNum, intNum, 0);
        }

        Hwi_gicd.ISPENDR[intNum/32] = 1 << (intNum & 0x1f);
    }

    /*
     * Add delay to insure posted interrupt are triggered before function
     * returns.
     */
    __asm__ __volatile__ (
        "dsb \n\t"
        "isb"
        ::: "memory"
    );
}

/*
 *  ======== Hwi_raiseSGI ========
 *  mask: Mask of target CPUs
 */
Void Hwi_raiseSGI(UInt mask, UInt intNum)
{
    UInt reg, key;

    Assert_isTrue((intNum < 16), Hwi_A_badSGIIntNum);

    key = Core_hwiDisable();

    reg = ((mask & 0xFF) << 16) | 0x8000 | intNum;

    /* Ensure all memory write ops complete */
    __asm__ __volatile__ (
        "dmb ishst"
        ::: "memory"
    );

    Hwi_gicd.SGIR = reg;

    Core_hwiRestore(key);
}


/*
 *  ======== Hwi_getTaskSP ========
 */
Char *Hwi_getTaskSP()
{
    return (Hwi_module->taskSP[Core_getId()]);
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
    UInt index, shift, mask;

    if (intNum < 16) {
        index = intNum / 4;         /* Offset of required GICD_CPENSGIR */
        shift = (intNum & 0x3) << 3;
        mask = 1 << shift;          /* SGI Clear-pending field offset */
        Hwi_gicd.CPENDSGIR[index] = mask;
    }
    else {
        index = intNum / 32;
        mask = 1 << (intNum & 0x1F);
        Hwi_gicd.ICPENDR[index] = mask;
    }
}

/*
 *  ======== switchFromBootStack ========
 *  Indicate that we are leaving the boot stack and
 *  are about to switch to a task stack.
 */
Void Hwi_switchFromBootStack()
{
    Hwi_module->taskSP[0] = 0;
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

    return stackOverflow;
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

    return stackOverflow;
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
    UInt key;
    UInt regIndex, oldPriorities, newPriorities, shift, mask;

    if (intNum < Hwi_NUM_INTERRUPTS) {
        regIndex = intNum >> 2;
        shift = (intNum & 0x3) << 3;
        mask = 0xFF << shift;
        key = Hwi_disable();
        oldPriorities = Hwi_gicd.IPRIORITYR[regIndex] & (~mask);
        newPriorities = oldPriorities | ((priority & 0xFF) << shift);
        Hwi_gicd.IPRIORITYR[regIndex] = newPriorities;
        Hwi_restore(key);
    }
}

/*
 *  ======== Hwi_reconfig ========
 *  Reconfigure a dispatched interrupt.
 */
Void Hwi_reconfig(Hwi_Object *hwi, Hwi_FuncPtr fxn, const Hwi_Params *params)
{
    UInt intNum, hwiKey;
    UInt32 shift, mask;

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

    if (params->targetProcList) {
        hwi->targetProcList = params->targetProcList;
    }
    else {
        if (BIOS_smpEnabled) {
            hwi->targetProcList = (0x1 << Hwi_module->intAffinity[intNum]);
        }
        else {
            hwi->targetProcList = 0x1;
        }
    }

    /*
     *  Disable interrupts before manipulating GIC registers.
     *  The GIC registers go through a read-modify-write and
     *  therefore the interrupts should be disabled in case
     *  a task switch happens and another task tries to create
     *  a hwi that attempts to modify the same set of registers.
     */
    hwiKey = Hwi_disable();

    /*
     *  Set interrupt group (only required when in secure mode)
     */
    if (Hwi_enableSecureMode) {
        shift = (intNum & 0x1F);
        mask = (0x1 << shift);
        if (hwi->type == Hwi_Type_IRQ) {
            Hwi_gicd.IGROUPR[intNum >> 5] =
                (Hwi_gicd.IGROUPR[intNum >> 5] | mask);
        }
        else {
            Hwi_gicd.IGROUPR[intNum >> 5] = (Hwi_gicd.IGROUPR[intNum >> 5] & (~mask));
        }
    }

    /* Set trigger sensitivity */
    if (hwi->triggerSensitivity != ~(0)) {
        shift = (intNum & 0xF) << 1;
        mask  = 0x3 << shift;
        Hwi_gicd.ICFGR[intNum >> 4] = (Hwi_gicd.ICFGR[intNum >> 4] & (~mask)) |
            ((hwi->triggerSensitivity & 0x3) << shift);
    }

    /* Set target processors */
    if (Hwi_initGicd) {
        shift = (intNum & 0x3) << 3;
        mask  = 0xF << shift;
        Hwi_gicd.ITARGETSR[intNum >> 2] = (Hwi_gicd.ITARGETSR[intNum >> 2] & (~mask)) |
            ((hwi->targetProcList & 0xF) << shift);
    }

    Hwi_restore(hwiKey);

    /*
     * the -1 sentinel priority is the default passed by hal Hwi_create().
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
 *  ======== Hwi_disableFxn ========
 */
#if (ti_sysbios_BIOS_smpEnabled__D)
UInt Hwi_disableFxn()
{
    /* acquire Inter-core lock */
    return (Core_lock());
}
#else
UInt __attribute__ ((naked)) Hwi_disableFxn()
{
    __asm__ __volatile__ (
            "mrs r0, cpsr_cf\n\t"
            "cpsid i\n\t"
            "bx lr"
            );
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
Void __attribute__ ((naked)) Hwi_restoreFxn(UInt key)
{
    __asm__ __volatile__ (
            "and r1, r0, #128\n\t"
            "mrs r0, cpsr_cf\n\t"
            "bic r0, r0, #128\n\t"
            "orr r1, r1, r0\n\t"
            "msr cpsr_cf, r1\n\t"
            "bx lr"
            );
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
UInt __attribute__ ((naked)) Hwi_enableFxn()
{
    __asm__ __volatile__ (
            "mrs r0, cpsr_cf\n\t"
            "cpsie i\n\t"
            "bx lr"
            );
}
#endif

/*
 *  ======== Hwi_nonPluggedHwiHandler ========
 */
Void Hwi_nonPluggedHwiHandler(UArg arg)
{
    /* Force MAIN threadtype So we can safely call Error_raise */

    BIOS_setThreadType(BIOS_ThreadType_Main);

    Error_raise(0, Hwi_E_undefined, Hwi_module->curIntId, 0);
}

/*
 *  ======== Hwi_dispatchFIQC ========
 *  FIQ interrupt dispatcher
 */
Void Hwi_dispatchFIQC() __attribute__ ((interrupt("FIQ")));
Void Hwi_dispatchFIQC()
{
    UInt intNum;
    Hwi_Object *hwi;

    intNum = Hwi_gicc.IAR;

    /* Process only this pending interrupt */
    hwi = Hwi_module->dispatchTable[intNum & 0x3FF];

    /* call user's ISR func */
    (hwi->fxn)(hwi->arg);

    Hwi_gicc.EOIR = intNum;
}

/*
 *  ======== Hwi_dispatchIRQC ========
 *  Configurable IRQ interrupt dispatcher.
 */
Void Hwi_dispatchIRQC(Hwi_Irp irp)
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
    UInt intNum;
    Int swiKey;
#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    Int i;
#endif

    /* Acknowledge Interrupt */
    if (Hwi_enableSecureMode) {
        Hwi_module->curIntId = Hwi_gicc.AIAR;
    }
    else {
        Hwi_module->curIntId = Hwi_gicc.IAR;
    }

    /* Ignore spurious ints */
    if ((Hwi_module->curIntId == 1023) || (Hwi_module->curIntId == 1022)) {
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
    if (Hwi_enableSecureMode) {
        Hwi_gicc.AEOIR = intNum;
    }
    else {
        Hwi_gicc.EOIR = intNum;
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
