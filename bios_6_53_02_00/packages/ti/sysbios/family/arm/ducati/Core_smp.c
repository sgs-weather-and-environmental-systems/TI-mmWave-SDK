/*
 * Copyright (c) 2015, Texas Instruments Incorporated
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
#include <ti/sysbios/family/arm/m3/Hwi.h>
#include <ti/sysbios/family/arm/ducati/GateSmp.h>

#include "package/internal/Core.xdc.h"

#define REG16(A)   (*(volatile UInt16 *) (A))
#define REG32(A)   (*(volatile UInt32 *) (A))

#define PID0_ADDRESS            0xE00FFFE0
#define INTERRUPT_CORE_0        0x40001000
#define INTERRUPT_CORE_1        0x40001002
#define INTER_CORE_INTNUM       19

extern void _exit(int code);
extern Void ti_sysbios_hal_Hwi_initStack(Void);

/*
 *  ======== Timer_Module_startup ========
 */
Int Core_Module_startup(Int status)
{
    /* grab Hwi/Swi/Task schedulers */
    /* Task and Swi scheduler is locked by default */
    Core_lock();

    return (Startup_DONE);
}

/*
 *  ======== Core_getId ========
 */
UInt Core_getId()
{
    return (REG32(PID0_ADDRESS));
}

/*
 *  ======== Core_getIpuId ========
 */
UInt Core_getIpuId()
{
    return Core_ipuId;
}

/*
 *  ======== Core_hwiFunc ========
 */
Void Core_hwiFunc(UArg arg)
{
    UInt coreId = Core_getId();

    Core_module->schedulerInts[coreId] += 1;

    if (Core_module->exitFlag == TRUE) {
        Core_module->exitFlag = FALSE;
        Task_unlockSched();
        Swi_unlockSched();
        Core_unlock();

#if defined(__GNUC__) && !defined(__ti__)
        /*
         * Call _exit() instead of abort. abort() internally
         * calls raise() which will invoke ReentSupport_getReent()
         * from a Hwi context and cause an assertion failure.
         */
        _exit(0);
#else
        abort();
#endif

    }

    Hwi_flushVnvic();
}

/*
 *  ======== Core_InterruptCore ========
 */
Void Core_interruptCore(UInt coreId)
{
    if (coreId == 0) {
        REG16(INTERRUPT_CORE_0) |= 0x1;
        REG16(INTERRUPT_CORE_0) &= ~0x1;
    }
    else {
        REG16(INTERRUPT_CORE_1) |= 0x1;
        REG16(INTERRUPT_CORE_1) &= ~0x1;
    }
}

/*
 *  ======== Core_startCore1 ========
 *  Called by core0 during Task_start() just before
 *  Task_SupportProxy_swap() call.
 *
 *  It should be safe to start Core 1 then.
 */

Void Core_startCore1()
{
    if (Core_getId() != 0) {
        return;
    }

    /* put C stack in the middle of core 1's Hwi stack to avoid collision */
    *(volatile Char **)(0x0008) = &Core_module->core1HwiStack[Core_core1HwiStackSize/2];
    *(volatile UInt32 *)(0x000C) = (UInt32)Core_core1Startup;
}

/*
 *  ======== Core_core1Startup ========
 *  Core 1's intial thread.
 *  Executes on stack provided by Core module.
 */
Void Core_core1Startup()
{
    Hwi_disable();

    /* initialize our NVIC */
    Hwi_initNVIC();

    /* split thread and handler stacks */
    Hwi_initStacks(&Core_module->core1HwiStack[Core_core1HwiStackSize - 1]);

    /* Initialize this core's Hwi stack to enable stack checking */
    if (Core_initStackFlag) {
        ti_sysbios_hal_Hwi_initStack();
    }

    /* set the priority and enable the inter-core interrupt */
    Hwi_nvic.IPR[INTER_CORE_INTNUM-16] = 0xff;
    Hwi_nvic.ISER[0] = 1 << ((INTER_CORE_INTNUM-16) & 0x1f);

    Task_startCore(1);
}

/*
 *  ======== Core_atexit ========
 */
Void Core_atexit(Int arg)
{
    if ((Core_module->exitFlag == TRUE) || (Core_syncExits == FALSE)) {
        Core_module->exitFlag = FALSE;
        Task_unlockSched();
        Swi_unlockSched();
        Core_unlock();
        return;
    }

    Core_module->exitFlag = TRUE;
    Task_unlockSched();
    Swi_unlockSched();
    Core_unlock();

    /* interrupt the other core */
    Core_interruptCore(Core_getId() ^ 1);

    while (Core_module->exitFlag);
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
    //      Task_enabled() and Swi_enabled() APIs.
    if (Task_enabled() && Swi_enabled()) {
        GateSmp_leave(Core_gate, 0);
    }
}

/*
 *  ======== Core_getCore1HwiStackBase ========
 */
Ptr Core_getCore1HwiStackBase()
{
    return ((Ptr)(Core_module->core1HwiStack));
}
