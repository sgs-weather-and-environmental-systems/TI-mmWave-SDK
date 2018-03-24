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

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Memory.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Log.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/interfaces/IHwi.h>
#include <ti/sysbios/BIOS.h>

#include "package/internal/Hwi.xdc.h"

extern Char *ti_sysbios_family_xxx_Hwi_switchToIsrStack();
extern Void ti_sysbios_family_xxx_Hwi_switchToTaskStack(Char *oldTaskSP);
extern Void ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());

#define Hwi_switchToIsrStack ti_sysbios_family_xxx_Hwi_switchToIsrStack
#define Hwi_switchToTaskStack ti_sysbios_family_xxx_Hwi_switchToTaskStack
#define Hwi_switchAndRunFunc ti_sysbios_family_xxx_Hwi_switchAndRunFunc

#define GLOBAL_MASK 0x4
#define NEW_FIQ_AGR 0x2
#define NEW_IRQ_AGR 0x1

#ifdef ti_sysbios_family_arm_a8_intcps_Hwi_dispatcherTaskSupport__D
#define TASK_DISABLE Task_disable
#define TASK_RESTORE Task_restoreHwi
#else
#define TASK_DISABLE Hwi_taskDisable
#define TASK_RESTORE Hwi_taskRestoreHwi
#endif

#ifdef ti_sysbios_family_arm_a8_intcps_Hwi_dispatcherSwiSupport__D
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

    /* set up FIQ/IRQ stackpointers, etc */
    Hwi_init(Hwi_module->fiqStack + Hwi_module->fiqStackSize);

    /* Initialize the interrupt controller */
    Hwi_initIntController();

    /*
     * Initialize the pointer to the isrStack.
     *
     * The dispatcher's SP must be aligned on a long word boundary
     */
    Hwi_module->isrStack =
        (Char *)(((UInt32)(Hwi_module->isrStackBase) & 0xfffffff8) +
                (UInt32) Hwi_module->isrStackSize - 2 * sizeof(Int));

    Hwi_module->taskSP = (Char *)-1; /* signal that we're executing on the */
                                     /* ISR stack */

    Hwi_restoreMIR0(Hwi_module->mir0Mask); /* MIR0 per static Hwi settings */
    Hwi_restoreMIR1(Hwi_module->mir1Mask); /* MIR1 per static Hwi settings */
    Hwi_restoreMIR2(Hwi_module->mir2Mask); /* MIR2 per static Hwi settings */
    Hwi_restoreMIR3(Hwi_module->mir3Mask); /* MIR2 per static Hwi settings */

    for (i = 0; i < Hwi_NUM_INTERRUPTS; i++) {
        hwi = Hwi_module->dispatchTable[i];
        if (hwi !=  ti_sysbios_family_arm_a8_intcps_Hwi_Module_State_nonPluggedHwi()) {
            Hwi_postInit(hwi, NULL);
        }
    }
    return (Startup_DONE);
}

/*
 *  ======== Hwi_Instance_init  ========
 */
Int Hwi_Instance_init(Hwi_Object *hwi, Int intNum, Hwi_FuncPtr fxn, const Hwi_Params *params, Error_Block *eb)
{
    Int status;

    if (intNum >= Hwi_NUM_INTERRUPTS) {
        Error_raise(eb, Hwi_E_badIntNum, intNum, 0);
        return (1);
    }

    if (Hwi_module->dispatchTable[intNum] !=
           ti_sysbios_family_arm_a8_intcps_Hwi_Module_State_nonPluggedHwi()) {
        Error_raise(eb, Hwi_E_alreadyDefined, intNum, 0);
        return (1);
    }

    if (params->priority == 0) {
        Error_raise(eb, Hwi_E_invalidPriority, params->priority, 0);
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
            return (1);
        }
    }
#endif

    hwi->irp = 0;

    status = Hwi_postInit(hwi, eb);

    if (status) {
        return (1 + status);
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

    if (intNum == Hwi_NUM_INTERRUPTS) {
        Error_raise(NULL, Hwi_E_handleNotFound, hwi, 0);
        return;
    }

    Hwi_disableInterrupt(intNum);
    Hwi_module->dispatchTable[intNum] = ti_sysbios_family_arm_a8_intcps_Hwi_Module_State_nonPluggedHwi();

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
    UInt i;

    /* clear any stale IRQ/FIQs */
    Hwi_intc.SIR_IRQ;        /* read SIR_IRQ */
    Hwi_intc.SIR_FIQ;        /* read SIR_FIQ */
    Hwi_intc.CONTROL = NEW_IRQ_AGR + NEW_FIQ_AGR;

    /* reset Interrupt Controller */
    Hwi_intc.SYSCONFIG |= 2;

    /* wait for reset to complete */
    while(Hwi_intc.SYSSTATUS != 0x00000001)
        ;

    /*
     * Set configured interrupt Sense and Priority for each
     * interrupt
     */
    for (i=0; i < Hwi_NUM_INTERRUPTS; i++) {
        Hwi_setPriority(i, Hwi_module->dispatchTable[i]->priority);
        Hwi_setType(i, Hwi_module->dispatchTable[i]->type);
    }
}

/*
 *  ======== Hwi_startup ========
 */
Void Hwi_startup()
{
    /* start with a clean sort of interrupts */
    Hwi_intc.CONTROL = NEW_IRQ_AGR;
    Hwi_enable();
}

#ifndef __ti__

/*
 *  ======== ti_sysbios_family_xxx_Hwi_switchToIsrStack ========
 *  Char *ti_sysbios_family_xxx_Hwi_switchToIsrStack();
 *
 *  If not already on the isr stack, switch to it.
 *
 *  Checks the Hwi module object's taskSP.
 *  If 0, then set taskSP to current SP then switch to ISR stack.
 *
 *  Returns:
 *        old taskSP value for use with switchToTaskStack()
 */
Char * __attribute__((naked)) ti_sysbios_family_xxx_Hwi_switchToIsrStack()
{
    __asm__ __volatile__ (
            "movw r1, #:lower16:ti_sysbios_family_arm_a8_intcps_Hwi_Module__state__V\n\t"
            "movt r1, #:upper16:ti_sysbios_family_arm_a8_intcps_Hwi_Module__state__V\n\t"
            "ldr r0, [r1]\n\t"                /* Old taskSP */
            "cmp r0, #0\n\t"                  /* On ISR stack already ? */
            "bxne lr\n\t"                     /* Return if yes */
            "str r13, [r1]\n\t"               /* save SP into taskSP */
            "ldr r13, [r1, #4]\n\t"           /* switch to isr Stack */
            "bx lr"
                 );
}

/*
 *  ======== ti_sysbios_family_xxx_Hwi_switchToTaskStack ========
 *  ti_sysbios_family_xxx_Hwi_switchToTaskStack(Char *oldTaskSP);
 *
 *  If at bottom of ISR stack, switch to Task stack.
 *
 *  If oldTaskSP is zero, then this is the thread that switched
 *  to the ISR stack first and therefore it is safe to switch
 *  back to the task stack address saved in the Hwi module
 *  object's taskSP variable.
 */
Void __attribute__ ((naked)) ti_sysbios_family_xxx_Hwi_switchToTaskStack(Char *oldTaskSP)
{
    __asm__ __volatile__ (
            "cmp r0, #0\n\t"              /* Lowest order ISR? */
            "bxne lr\n\t"                 /* Return if not */
            "movw r1, #:lower16:ti_sysbios_family_arm_a8_intcps_Hwi_Module__state__V\n\t"
            "movt r1, #:upper16:ti_sysbios_family_arm_a8_intcps_Hwi_Module__state__V\n\t"
                                          /* if yes, restore */
            "ldr r13, [r1]\n\t"           /* Interrupted task's SP */
            "str r0, [r1]\n\t"            /* Signal return to TaskStack */
            "bx lr"
                 );
}

/*
 *  ======== ti_sysbios_family_xxx_Hwi_switchAndRunFunc ========
 *  ti_sysbios_family_xxx_Hwi_switchAndRunFunc(Void (*func)());
 *
 *  Switch to ISR stack, call the function Func() and then switch
 *  back to Task stack.
 *
 *  Note: Stack switch only occurs if "switchStack" is true.
 */
Void __attribute__ ((naked)) ti_sysbios_family_xxx_Hwi_switchAndRunFunc(
        Void (*func)())
{
    __asm__ __volatile__ (
            "push {r4, lr}\n\t"
            "movw r1, #:lower16:ti_sysbios_family_arm_a8_intcps_Hwi_Module__state__V\n\t"
            "movt r1, #:upper16:ti_sysbios_family_arm_a8_intcps_Hwi_Module__state__V\n\t"
            "ldr r4, [r1]\n\t"                /* Old taskSP */
            "cmp r4, #0\n\t"                  /* On ISR stack already ? */
            "bne callFunc\n\t"                /* branch if yes */
            "str r13, [r1]\n\t"               /* save SP into taskSP */
            "ldr r13, [r1, #4]\n\t"           /* switch to isr Stack */
            "callFunc:\n\t"
            "blx r0\n\t"                      /* Call func */
            "cmp r4, #0\n\t"                  /* Lowest order ISR? */
            "bne exitFunc\n\t"                /* branch to 'exitFunc' */
            "movw r1, #:lower16:ti_sysbios_family_arm_a8_intcps_Hwi_Module__state__V\n\t"
            "movt r1, #:upper16:ti_sysbios_family_arm_a8_intcps_Hwi_Module__state__V\n\t"
                                              /* if yes, restore */
            "ldr r13, [r1]\n\t"               /* Interrupted task's SP */
            "str r4, [r1]\n\t"                /* Signal return to TaskStack */
            "exitFunc:\n\t"
            "pop {r4, pc}"
                 );
}
#endif

/*
 * Below APIs provided for backward compatability.
 */

#ifdef __ti__
#pragma CODE_SECTION(ti_sysbios_family_arm_a8_intcps_Hwi_disable__E, ".text:ti_sysbios_family_arm_a8_intcps_Hwi_disable__E")
#pragma CODE_SECTION(ti_sysbios_family_arm_a8_intcps_Hwi_enable__E, ".text:ti_sysbios_family_arm_a8_intcps_Hwi_enable__E")
#pragma CODE_SECTION(ti_sysbios_family_arm_a8_intcps_Hwi_restore__E, ".text:ti_sysbios_family_arm_a8_intcps_Hwi_restore__E")
#pragma FUNC_EXT_CALLED(ti_sysbios_family_arm_a8_intcps_Hwi_disable__E);
#pragma FUNC_EXT_CALLED(ti_sysbios_family_arm_a8_intcps_Hwi_enable__E);
#pragma FUNC_EXT_CALLED(ti_sysbios_family_arm_a8_intcps_Hwi_restore__E);
#endif

/*
 *  ======== Hwi_disable ========
 *  disables only IRQ interrupts
 */

UInt ti_sysbios_family_arm_a8_intcps_Hwi_disable__E()
{
    return Hwi_disable();
}

/*
 *  ======== Hwi_enable ========
 *  enables only IRQ interrupts
 */
UInt ti_sysbios_family_arm_a8_intcps_Hwi_enable__E()
{
    return Hwi_enable();
}

/*
 *  ======== Hwi_restore ========
 *  restores only IRQ interrupts
 */
Void ti_sysbios_family_arm_a8_intcps_Hwi_restore__E( UInt key )
{
    Hwi_restore(key);
}

/*
 *  ======== Hwi_disableFIQ ========
 *  disables only FIQ interrupts
 */

UInt Hwi_disableFIQ()
{
    return _disable_FIQ();
}

/*
 *  ======== Hwi_enableFIQ ========
 *  enables only FIQ interrupts
 */
UInt Hwi_enableFIQ()
{
    return _enable_FIQ();
}

/*
 *  ======== Hwi_restoreFIQ ========
 *  restores only IRQ interrupts
 */
Void Hwi_restoreFIQ( UInt key )
{
#if defined(__ti__)
    Hwi_restore(key);
#else
    _restore_FIQ(key);
#endif
}

/*
 *  ======== Hwi_disableFIQ ========
 *  disables only FIQ interrupts
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
Void Hwi_restoreIRQ( UInt key )
{
    Hwi_restore(key);
}

/*!
 *  ======== Hwi_disableMIR0 ========
 */
Bits32 Hwi_disableMIR0(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR0;

    key = Hwi_disable();
    oldMIR0 = Hwi_intc.MIR0;
    Hwi_intc.MIR_SET0 = mask;
    Hwi_module->mir0Mask |= mask;
    Hwi_restore(key);

    return (oldMIR0);
}

/*!
 *  ======== Hwi_disableMIR1 ========
 */
Bits32 Hwi_disableMIR1(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR1;

    key = Hwi_disable();
    oldMIR1 = Hwi_intc.MIR1;
    Hwi_intc.MIR_SET1 = mask;
    Hwi_module->mir1Mask |= mask;
    Hwi_restore(key);

    return (oldMIR1);
}

/*!
 *  ======== Hwi_disableMIR2 ========
 */
Bits32 Hwi_disableMIR2(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR2;

    key = Hwi_disable();
    oldMIR2 = Hwi_intc.MIR2;
    Hwi_intc.MIR_SET2 = mask;
    Hwi_module->mir2Mask |= mask;
    Hwi_restore(key);

    return (oldMIR2);
}

/*!
 *  ======== Hwi_disableMIR3 ========
 */
Bits32 Hwi_disableMIR3(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR3;

    key = Hwi_disable();
    oldMIR3 = Hwi_intc.MIR3;
    Hwi_intc.MIR_SET3 = mask;
    Hwi_module->mir3Mask |= mask;
    Hwi_restore(key);

    return (oldMIR3);
}

/*!
 *  ======== Hwi_enableMIR0 ========
 */
Bits32 Hwi_enableMIR0(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR0;

    key = Hwi_disable();
    oldMIR0 = Hwi_intc.MIR0;
    Hwi_intc.MIR_CLEAR0 = mask;
    Hwi_module->mir0Mask &= ~mask;
    Hwi_restore(key);

    return (oldMIR0);
}

/*!
 *  ======== Hwi_enableMIR1 ========
 */
Bits32 Hwi_enableMIR1(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR1;

    key = Hwi_disable();
    oldMIR1 = Hwi_intc.MIR1;
    Hwi_intc.MIR_CLEAR1 = mask;
    Hwi_module->mir1Mask &= ~mask;
    Hwi_restore(key);

    return (oldMIR1);
}

/*!
 *  ======== Hwi_enableMIR2 ========
 */
Bits32 Hwi_enableMIR2(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR2;

    key = Hwi_disable();
    oldMIR2 = Hwi_intc.MIR2;
    Hwi_intc.MIR_CLEAR2 = mask;
    Hwi_module->mir2Mask &= ~mask;
    Hwi_restore(key);

    return (oldMIR2);
}

/*!
 *  ======== Hwi_enableMIR3 ========
 */
Bits32 Hwi_enableMIR3(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR3;

    key = Hwi_disable();
    oldMIR3 = Hwi_intc.MIR3;
    Hwi_intc.MIR_CLEAR3 = mask;
    Hwi_module->mir3Mask &= ~mask;
    Hwi_restore(key);

    return (oldMIR3);
}

/*!
 *  ======== Hwi_restoreMIR0 ========
 */
Bits32 Hwi_restoreMIR0(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR0;

    key = Hwi_disable();
    oldMIR0 = Hwi_intc.MIR0;
    Hwi_intc.MIR0 = mask;
    Hwi_module->mir0Mask = mask;
    Hwi_restore(key);

    return (oldMIR0);
}

/*!
 *  ======== Hwi_restoreMIR1 ========
 */
Bits32 Hwi_restoreMIR1(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR1;

    key = Hwi_disable();
    oldMIR1 = Hwi_intc.MIR1;
    Hwi_intc.MIR1 = mask;
    Hwi_module->mir1Mask = mask;
    Hwi_restore(key);

    return (oldMIR1);
}

/*!
 *  ======== Hwi_restoreMIR2 ========
 */
Bits32 Hwi_restoreMIR2(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR2;

    key = Hwi_disable();
    oldMIR2 = Hwi_intc.MIR2;
    Hwi_intc.MIR2 = mask;
    Hwi_module->mir2Mask = mask;
    Hwi_restore(key);

    return (oldMIR2);
}

/*!
 *  ======== Hwi_restoreMIR3 ========
 */
Bits32 Hwi_restoreMIR3(Bits32 mask)
{
    UInt key;
    Bits32 oldMIR3;

    key = Hwi_disable();
    oldMIR3 = Hwi_intc.MIR3;
    Hwi_intc.MIR3 = mask;
    Hwi_module->mir3Mask = mask;
    Hwi_restore(key);

    return (oldMIR3);
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
    if ( intNum < 32 ) {
        Hwi_intc.ISR_SET0 = (1 << intNum);
    }
    else if ( intNum < 64 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        Hwi_intc.ISR_SET1 = (1 << intNum);
    }
    else if ( intNum < 96 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        Hwi_intc.ISR_SET2 = (1 << intNum);
    }
    else if ( intNum < 128 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        Hwi_intc.ISR_SET3 = (1 << intNum);
    }
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
    if ( intNum < 32 ) {
        return (Hwi_disableMIR0(1 << intNum)) ;
    }
    else if ( intNum < 64 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        return (Hwi_disableMIR1(1 << intNum));
    }
    else if ( intNum < 96 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        return (Hwi_disableMIR2(1 << intNum));
    }
    else {
        intNum %= 32;    /* normalize to 0 - 31 */
        return (Hwi_disableMIR3(1 << intNum));
    }
}

/*
 *  ======== Hwi_enableInterrupt ========
 */
UInt Hwi_enableInterrupt(UInt intNum)
{
    if ( intNum < 32 ) {
        return (Hwi_enableMIR0(1 << intNum));
    }
    else if ( intNum < 64 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        return (Hwi_enableMIR1(1 << intNum));
    }
    else if ( intNum < 96 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        return (Hwi_enableMIR2(1 << intNum));
    }
    else {
        intNum %= 32;    /* normalize to 0 - 31 */
        return (Hwi_enableMIR3(1 << intNum));
    }
}

/*
 *  ======== Hwi_RestoreInterrupt ========
 */
Void Hwi_restoreInterrupt(UInt intNum, UInt key)
{
    if (key & (1 << (intNum%32))) {
        Hwi_disableInterrupt(intNum);
    }
    else {
        Hwi_enableInterrupt(intNum);
    }
}

/*
 *  ======== Hwi_clearInterrupt ========
 */
Void Hwi_clearInterrupt(UInt intNum)
{
    /*
     * The CPINTC doesn't allow direct clearing
     * of an individual pending interrupt.
     * Assuming the interrupt has been cleared at
     * its source, simply latching a new agreement
     * should remove a stale interrupt from the sort.
     */
    Hwi_intc.CONTROL = NEW_IRQ_AGR;
}

/*
 *  ======== Hwi_clearPostedInterrupt ========
 */
Void Hwi_clearPostedInterrupt(UInt intNum)
{
    /* clear the corresponding ISR bit */

    if ( intNum < 32 ) {
        Hwi_intc.ISR_CLEAR0 = (1 << intNum);
    }
    else if ( intNum < 64 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        Hwi_intc.ISR_CLEAR1 = (1 << intNum);
    }
    else if ( intNum < 96 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        Hwi_intc.ISR_CLEAR2 = (1 << intNum);
    }
    else if ( intNum < 128 ) {
        intNum %= 32;    /* normalize to 0 - 31 */
        Hwi_intc.ISR_CLEAR3 = (1 << intNum);
    }

    /* remove it from the pending interrupt stack */
    Hwi_clearInterrupt(intNum);
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
 *  ======== Hwi_setPriority ========
 *  Set an interrupt's relative priority.
 *
 *  @param(intNum)      ID of interrupt
 *  @param(priority)    priority
 */
Void Hwi_setPriority(UInt intNum, UInt priority)
{
    UInt ilr, ilrPriorityMask;

    if (intNum < 128) {
        ilr = Hwi_intc.ILR[intNum];

        ilrPriorityMask = ~((Hwi_NUM_PRIORITIES - 1) << 2);

        Hwi_intc.ILR[intNum] = (ilr & ilrPriorityMask) | (priority << 2);
    }
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
    UInt ilr;

    if ( intNum < 128 ) {
        ilr = Hwi_intc.ILR[intNum];
        Hwi_intc.ILR[intNum] = (ilr & 0xfffffffe) | type;
    }
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
    hwi->priority = params->priority;

    Hwi_setType(intNum, hwi->type);

    /*
     * the -1 sentinel priority is the default passed by hal Hwi_create().
     * Translate it to the lowest (logical) possible priority, which is
     * our default priority.
     */
    if (params->priority == -1) {
        hwi->priority = Hwi_NUM_PRIORITIES - 1;
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
 *  ======== Hwi_nonPluggedHwiHandler ========
 */
Void Hwi_nonPluggedHwiHandler(UArg arg)
{
    /* Force MAIN threadtype So we can safely call Error_raise */

    BIOS_setThreadType(BIOS_ThreadType_Main);

    Error_raise(0, Hwi_E_undefined, Hwi_intc.SIR_IRQ, 0);
}

/*
 *  ======== Hwi_dispatchFIQC ========
 *  FIQ interrupt dispatcher
 */
#ifdef __ti__
Void interrupt Hwi_dispatchFIQC()
#else
Void Hwi_dispatchFIQC() __attribute__ ((interrupt("FIQ")));
Void Hwi_dispatchFIQC()
#endif
{
    Hwi_Object *entry;
    UInt intNum;

    intNum = Hwi_intc.SIR_FIQ;

    entry = Hwi_module->dispatchTable[intNum];

    (entry->fxn)(entry->arg);

    Hwi_intc.CONTROL = NEW_FIQ_AGR;             /* force NEW_FIQ_AGR */
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
    UInt32 oldThreshold;
#ifndef ti_sysbios_hal_Hwi_DISABLE_ALL_HOOKS
    Int i;
#endif

    /* ignore spurious ints */
    if (Hwi_intc.SIR_IRQ & 0x80000000) {
        Hwi_module->spuriousInts++;
        Hwi_module->lastSpuriousInt = Hwi_intc.SIR_IRQ & 0x7f;
        Hwi_intc.CONTROL = NEW_IRQ_AGR;
        return;
    }

    /* save irp for ROV call stack view */
    Hwi_module->irp = irp;

    if (Hwi_dispatcherSwiSupport) {
        swiKey = SWI_DISABLE();
    }

    /* set thread type to Hwi */
    prevThreadType = BIOS_setThreadType(BIOS_ThreadType_Hwi);

    /* Process only this pending interrupt */
    intNum = Hwi_intc.SIR_IRQ;        /* get current int num */

    /* remember previous priority threshold */
    oldThreshold = Hwi_intc.THRESHOLD;

    /* set the threshold to this interrupt's priority */
    Hwi_intc.THRESHOLD = Hwi_intc.IRQ_PRIORITY & (Hwi_NUM_PRIORITIES - 1);

    /* clear this interrupt, force a re-sort, and allow new ones in */
    Hwi_intc.CONTROL = NEW_IRQ_AGR;

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

    if (Hwi_dispatcherAutoNestingSupport) {
        Hwi_enable();
    }

    /* call user's ISR func */
    (hwi->fxn)(hwi->arg);

    Hwi_disable();

    Log_write1(Hwi_LD_end, (IArg)hwi);

    /* restore previous threshold priority */
    Hwi_intc.THRESHOLD = oldThreshold;

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
