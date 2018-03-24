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
 *  ======== GateSmp.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Startup.h>

#include <ti/sysbios/hal/Core.h>

#include "package/internal/GateSmp.xdc.h"

/*
 *  ======== GateSmp_startup ========
 */
Void __attribute__((naked)) GateSmp_startup()
{
    /* Reset exclusive access monitor to open-access state */
    __asm__ __volatile__ (
        "clrex\n\t"
        "bx      lr"
    );
}

/*
 *  ======== GateSmp_tryLock ========
 *  Try to acquire lock
 *
 *  Returns 0 if successful
 *          1 if not successful
 */
static inline UInt32 GateSmp_tryLock(volatile UInt32 *lockAddr)
{
    UInt32 contended, retVal;

    do {
        __asm__ __volatile__ (
            "mov r12, #0x1\n\t"
            "ldrex %1, [%2]\n\t"
            "teq %1, #0\n\t"
            "strexeq %0, r12, [%2]\n\t"
            "movne %0, #0\n\t"
            : "=&r" (contended), "=&r" (retVal)
            : "r" (lockAddr)
            : "r12", "cc", "memory"
        );
    } while (contended);

    return (retVal);
}

/*
 *  ======== GateSmp_unlock ========
 *  Release lock
 */
static Void __attribute__((naked)) GateSmp_unlock(volatile UInt32 *lockAddr)
{
    __asm__ __volatile__ (
        "mov r1, #0\n\t"
        "dmb\n\t"
        "str r1, [r0]\n\t"
        "dsb\n\t"
        "sev\n\t"
        "bx lr"
    );
}

/*
 *  ======== GateSmp_Instance_init ========
 */
Void GateSmp_Instance_init(GateSmp_Object *gate,
                               const GateSmp_Params *params)
{
    gate->gateWord = 0;

    /* Init stats */
    gate->owner = (~0);
    gate->stalls = 0;
    gate->noStalls = 0;
    gate->totalStalls = 0;
    gate->maxStall = 0;
}

/*
 *  ======== GateSmp_enter ========
 */
IArg GateSmp_enter(GateSmp_Object *gate)
{
    UInt key, stalls = 0;
    volatile UInt coreId;

    key = Core_hwiDisable();

    coreId = Core_getId();

    /* If this core already owns the gate, return */
    if (gate->owner == coreId) {
        return (key);
    }

    /* Preload the gate word into the cache */
    __asm__ __volatile__ (
        "pldw [%0]"
        :: "r" (&(gate->gateWord))
        : "memory"
    );

    while (TRUE) {
        if (GateSmp_tryLock(&gate->gateWord) == 0) {
            /* Add barrier to ensure lock is taken before we proceed */
            __asm__ __volatile__ (
                "dmb"
                ::: "memory"
            );

            /* Store owner's core Id */
            gate->owner = coreId;

            if (GateSmp_enableStats == TRUE) {
                if (stalls) {
                    gate->stalls += 1;
                    gate->totalStalls += stalls;
                    if (stalls > gate->maxStall) {
                        gate->maxStall = stalls;
                    }
                }
                else {
                    gate->noStalls += 1;
                }
            }

            Assert_isTrue((gate->gateWord != 0), NULL);

            return (key);
        }
        else {
            /*
             * SDOCM00115451: Re-enable interrupts while waiting to acquire lock
             */
            Core_hwiRestore(key);

            __asm__ __volatile__ (
                "wfe"
                ::: "memory"
            );

            Core_hwiDisable();

            /*
             * Read coreId again as Task may have switched to a different core
             */
            coreId = Core_getId();

            if (GateSmp_enableStats == TRUE) {
                stalls += 1;
            }
        }
    }
}

/*
 *  ======== GateSmp_leave ========
 */
Void GateSmp_leave(GateSmp_Object *gate, IArg key)
{
    /*
     * No need to disable interrupts. Interrupts are disabled by caller.
     */

    /* Check if this core owns the lock before releasing lock */
    if (gate->owner == Core_getId()) {
        gate->owner = (~0);
        GateSmp_unlock(&gate->gateWord);
    }
}

/*
 *  ======== GateSmp_query ========
 */
Bool GateSmp_query(Int qual)
{
    return (FALSE);
}
