/*
 * Copyright (c) 2015-2016, Texas Instruments Incorporated
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
 *  ======== Core.c ========
 */

#include <stdlib.h>     /* for abort() */

#include <xdc/std.h>

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/knl/Swi.h>
#include <ti/sysbios/knl/Task.h>
#include <ti/sysbios/family/arm/gic/Hwi.h>
#include <ti/sysbios/family/arm/a15/smp/Cache.h>
#include <ti/sysbios/family/arm/exc/Exception.h>
#include <ti/sysbios/family/arm/systimer/Timer.h>
#include <ti/sysbios/family/arm/v7a/smp/GateSmp.h>

#include "package/internal/Core.xdc.h"

#define REG16(A)    (*(volatile UInt16 *) (A))
#define REG32(A)    (*(volatile UInt32 *) (A))

#define SKERNEL_POWER_ON_CPU    0
#define SKERNEL_POWER_OFF_CPU   1

#define OMAP5_WUGEN_BASE_ADDR   0x48281000
#define OMAP5_WKG_CONTROL_1     (OMAP5_WUGEN_BASE_ADDR + 0x400)
#define OMAP5_AUX_CORE_BOOT_0   (OMAP5_WUGEN_BASE_ADDR + 0x800)
#define OMAP5_AUX_CORE_BOOT_1   (OMAP5_WUGEN_BASE_ADDR + 0x804)

extern void _exit(int code);
extern Void ti_sysbios_hal_Hwi_initStack(Void);

/*
 *  ======== Core_Module_startup ========
 */
Int Core_Module_startup(Int status)
{
    /* grab Hwi/Swi/Task schedulers */
    /* Task and Swi scheduler is locked by default */
    Core_lock();

    return (Startup_DONE);
}

/*
 *  ======== Core_enableActlrSmp ========
 */
Void __attribute__((naked)) Core_enableActlrSmp()
{
    __asm__ __volatile__ (
        /* Enable ACTLR SMP bit if non-secure access allowed */
        "mov   r0, #0x40\n\t"
        "mcr   p15, #0, r0, c1, c0, #1\n\t"
        "bx    lr"
    );
}

/*
 *  ======== Core_getId ========
 */
UInt __attribute__((naked)) Core_getId()
{
    __asm__ __volatile__ (
        "mrc p15, #0, r0, c0, c0, #5\n\t"
        "and r0, r0, #0x3\n\t"
        "bx  lr"
    );

    /*
     * Coverity does not recognize inline assembly and complaints
     * that this function has a UInt return type but does not return
     * anything. Add a dummy return to make coverity happy.
     */
    return 0;
}

/*
 *  ======== Core_hwiFunc ========
 */
Void Core_hwiFunc(UArg arg)
{
    if (arg == Core_numCores) {
        /* Scheduler interrupt */
        Core_module->schedulerInts[Core_getId()] += 1;
    }
    else {
        if (Core_module->ipcMsg[arg].func) {
            Core_module->ipcMsg[arg].func(Core_module->ipcMsg[arg].arg);
        }

        /* Signal operation complete */
        Core_module->syncCores[arg][Core_getId()] = TRUE;
    }
}

/*
 *  ======== Core_exit ========
 */
Void Core_exit(UArg arg)
{
    Task_unlockSched();
    Swi_unlockSched();
    Core_unlock();

    /* Signal operation complete */
    Core_module->syncCores[arg][Core_getId()] = TRUE;

    /*
     * Call _exit() instead of abort. abort() internally
     * calls raise() which will invoke ReentSupport_getReent()
     * from a Hwi context and cause an assertion failure.
     */
    _exit(0);
}

/*
 *  ======== Core_InterruptCore ========
 *  //TODO we may need to interrupt more than one core.
 */
Void Core_interruptCore(UInt dstCoreId)
{
    Hwi_raiseSGI((0x1 << dstCoreId), Core_numCores);
}

/*
 *  ======== Core_notify ========
 */
Void Core_notify(Core_IpcFuncPtr func, UArg arg, UInt mask)
{
    UInt idx, coreId;

    /* Store function ptr, argument and sync flag in msg buffer */
    coreId = Core_getId();
    Core_module->ipcMsg[coreId].func = func;
    Core_module->ipcMsg[coreId].arg = arg;

    /* Init syncCores flag */
    for (idx = 0; idx < Core_numCores; idx++) {
        Core_module->syncCores[coreId][idx] = FALSE;
    }

    /* Interrupt other cores */
    Hwi_raiseSGI(mask, coreId);

    /* Wait for all other cores */
    for (idx = 0; idx < Core_numCores; idx++) {
        if ((idx != coreId) && (mask & (0x1 << idx))) {
            while (!(Core_module->syncCores[coreId][idx]));
            Core_module->syncCores[coreId][idx] = FALSE;
        }
    }
}

/*
 *  ======== notifySpinLock ========
 */
UInt Core_notifySpinLock()
{
    UInt key;

    key = Hwi_disable();

    while (1) {
        if (!Core_module->notifyLock) {
            Core_module->notifyLock = TRUE;
            break;
        }
        else {
            /* Re-enable interrupts and release inter-core lock */
            Hwi_restore(key);
            /* Wait for lock to be released */
            while (Core_module->notifyLock);
            key = Hwi_disable();
        }
    }

    /* Release inter-core lock */
    Core_unlock();

    return (key);
}

/*
 *  ======== notifySpinUnlock ========
 */
Void Core_notifySpinUnlock(UInt key)
{
    /* Acquire inter-core lock */
    Core_lock();

    /* Release notify lock */
    Core_module->notifyLock = FALSE;

    Hwi_restore(key);
}

/*
 *  ======== skernelCmd ========
 *  Secure Kernel Command
 */
Void __attribute__((naked)) Core_skernelCmd(UInt32 cmd, UInt32 coreId,
    UInt32 startAddr)
{
    __asm__ __volatile__ (
        "stmfd sp!, {r4-r11, lr}\n\t"
        "smc   #0\n\t"
        "ldmfd sp!, {r4-r11, pc}"
    );
}

/*
 *  ======== Core_startCoreXOMAP5xxx ========
 *  Called by core0 during Task_start() just before
 *  Task_SupportProxy_swap() call.
 *
 *  It should be safe to start all other cores then.
 */
Void Core_startCoreXOMAP5xxx()
{
    /* Init syncCores flag */
    Core_module->syncCores[0][0] = FALSE;

    /* Wakeup other core */
    REG32(OMAP5_AUX_CORE_BOOT_1) = (UInt32)(&Core_smpBoot);
    REG32(OMAP5_AUX_CORE_BOOT_0) = (UInt32)(0x20);
    __asm__ __volatile__ (
        "dsb\n\t"       /* Ensure writes are visible to other cores */
        "sev"           /* Wake-up other cores */
    );

    /* Wait for other core to run its startup sequence */
    while (!(Core_module->syncCores[0][1]));
    Core_module->syncCores[0][1] = FALSE;

    /* Let other core run */
    Core_module->syncCores[0][0] = TRUE;
}

/*
 *  ======== Core_startCoreXKeystone2 ========
 *  Called by core0 during Task_start() just before
 *  Task_SupportProxy_swap() call.
 *
 *  It should be safe to start all other cores then.
 */
Void Core_startCoreXKeystone2()
{
    UInt idx;

    /* Init syncCores flag */
    Core_module->syncCores[0][0] = FALSE;

    /* Start all other cores */
    if (Core_useSkernelCmd) {
        for (idx = 1; idx < Core_numCores; idx++) {
            Core_skernelCmd(SKERNEL_POWER_ON_CPU, idx, (UInt32)(&Core_smpBoot));
        }
    }
    else {
        for (idx = 1; idx < Core_numCores; idx++) {
            REG32(Core_bootMagicBase + 0x4*idx) = (UInt32)(&Core_smpBoot);
        }
        __asm__ __volatile__ (
            "dsb\n\t"       /* Ensure writes are visible to other cores */
            "sev"           /* Wake-up other cores */
        );
    }

    /* Wait for all other cores to run their startup sequence */
    for (idx = 1; idx < Core_numCores; idx++) {
        while (!(Core_module->syncCores[0][idx]));
        Core_module->syncCores[0][idx] = FALSE;
    }

    /* Let all other cores run */
    Core_module->syncCores[0][0] = TRUE;
}

/*
 *  ======== Core_smpBoot ========
 *  Boot routine called on all other CPUs once they are brought out of reset
 */
Void __attribute__((naked)) Core_smpBoot()
{
    __asm__ __volatile__ (
        /* Disable interrupts */
        "mrs   r0, cpsr_cf\n\t"
        "orr   r12, r0, #192\n\t"
        "msr   cpsr_cf, r12\n\t"

        /* Change cpu mode to system mode */
        "cps   #0x1f\n\t"

        /* Init SCTLR register - disable all caches */
        "mrc   p15, #0, r0, c1, c0, #0\n\t"
        "movw  r1, #0x1004\n\t"
        "bic   r0, r0, r1\n\t"
        "mcr   p15, #0, r0, c1, c0, #0\n\t"
        "isb\n\t"

        /* Init SCTLR register - disable mmu */
        "mrc   p15, #0, r0, c1, c0, #0\n\t"
        "mov   r1, #0x1\n\t"
        "bic   r0, r0, r1\n\t"
        "mcr   p15, #0, r0, c1, c0, #0\n\t"
        "dsb\n\t"
        "isb\n\t"

        /* Invalidate BP */
        "mcr   p15, #0, r0, c7, c5, #6\n\t"
        "dsb\n\t"
        "isb\n\t"

        /* Invalidate TLB */
        "mcr   p15, #0, r0, c8, c7, #0\n\t"
        "dsb\n\t"
        "isb\n\t"

        /* Enable ACTLR SMP bit if non-secure access allowed */
        "mov   r0, #0x40\n\t"
        "mcr   p15, #0, r0, c1, c0, #1\n\t"

#if (defined(__VFP_FP__) && !defined(__SOFTFP__))
        /* Enable access to cp10 and cp11 - required for SIMD and VFP to work */
        "movw  r0, #0x0000\n\t"
        "movt  r0, #0x00F0\n\t"
        "mcr   p15, #0, r0, c1, c0, #2\n\t"
        "isb\n\t"
        /* set the FPEXC.EN bit to enable Advanced SIMD and VFP */
        "movw  r0, #0x0000\n\t"
        "movt  r0, #0x4000\n\t"
        "fmxr  fpexc, r0\n\t"
#endif

        /* Reset exclusive access monitor to open-access state */
        "clrex\n\t"

        /* Init SP */
        "movw  r0, #:lower16:ti_sysbios_family_arm_a15_smp_Core_getId__E\n\t"
        "movt  r0, #:upper16:ti_sysbios_family_arm_a15_smp_Core_getId__E\n\t"
        "blx   r0\n\t"
        "movw  r1, #:lower16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
        "movt  r1, #:upper16:ti_sysbios_family_arm_gic_Hwi_Module__state__V\n\t"
        "ldr   r2, [r1, #8]\n\t"            /* Read hwi stack base address */
        "ldr   r2, [r2, r0, lsl #2]\n\t"
        "mov   sp, r2\n\t"
        "ldr   r2, [r1, #12]\n\t"           /* Read hwi stack size */
        "add   sp, r2\n\t"
        "movw  r0, #:lower16:ti_sysbios_family_arm_a15_smp_Core_startup__I\n\t"
        "movt  r0, #:upper16:ti_sysbios_family_arm_a15_smp_Core_startup__I\n\t"
        "blx   r0\n\t"

        /* We should never return from Core_startup. If we do loop forever */
        "Core_smpBootLoopForever:\n\t"
        "b     Core_smpBootLoopForever"
    );
}

/*
 *  ======== Core_startup ========
 *  Other core's intial thread.
 *  Executes on stack provided by Core module.
 */
Void Core_startup()
{
    /* Init Cache and MMU */
    Cache_startup();

    /* Install vector table */
    Hwi_init();

    /* Init exception regs */
    Exception_initCoreX();

    /*
     * Initialize GIC CPU Interface and FIQ stack
     *
     * Note: GIC Distributor will be initialized by core 0
     */
    Hwi_initIntControllerCoreX();

    /* Initialize this core's Hwi stack to enable stack checking */
    if (Core_initStackFlag) {
        ti_sysbios_hal_Hwi_initStack();
    }

    /* Signal to core 0 that this core's startup routine is complete */
    Core_module->syncCores[0][Core_getId()] = TRUE;

    /* Wait for store to complete */
    __asm__ __volatile__ (
        "dmb ish"
    );

    /* Wait for core 0's signal to start running tasks */
    while(!Core_module->syncCores[0][0]);

    /*
     * Enable FIQ interrupts on this core. Task_startCore() will
     * enable IRQs.
     */
    if (Hwi_enableSecureMode) {
        Hwi_enableFIQ();
    }

    Task_startCore(Core_getId());
}

/*
 *  ======== Core_atexit ========
 */
Void Core_atexit(Int arg)
{
    UInt key;
    UInt coreId = Core_getId();

    Task_unlockSched();
    Swi_unlockSched();
    Core_unlock();

    /* force other cores to exit */
    key = Core_notifySpinLock();
    Core_notify(&Core_exit, (UArg)coreId, (Core_CPUMASK ^ (0x1 << coreId)));
    Core_notifySpinUnlock(key);
}

/*
 *  ======== Core_lock ========
 */
IArg Core_lock()
{
    return (GateSmp_enter(Core_gate));
}

/*
 *  ======== Core_unlock ========
 */
Void Core_unlock()
{
    // TODO Check BIOS.swiEnabled and BIOS.taskEnabled before using
    //      Task_enabled() and Swi_enabled() APIs as Tasking/Swis
    //      may be disabled.
    if (Task_enabled() && Swi_enabled()) {
        GateSmp_leave(Core_gate, 0);
    }
}

/*
 *  ======== Core_getRevisionNumber ========
 */
UInt8 __attribute__((naked)) Core_getRevisionNumber()
{
    __asm__ __volatile__ (
        "mrc p15, #0, r0, c0, c0, #0\n\t"
        "mov r1, r0, lsr #16\n\t"
        "and r1, r1, #0xF0\n\t"
        "and r0, r0, #0xF\n\t"
        "orr r0, r1, r0\n\t"
        "bx  lr"
    );
}
