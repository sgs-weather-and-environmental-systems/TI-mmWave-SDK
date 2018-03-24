/*
 * Copyright (c) 2012, Texas Instruments Incorporated
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
 *  ======== AMMU.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Error.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Types.h>

#include <ti/sysbios/hal/Hwi.h>
#include "package/internal/AMMU.xdc.h"

/*
 *  ======== AMMU_init ========
 */
Void AMMU_init()
{
    UInt i;

    /* Only AMMU pages that are enabled are configured */

    for (i = 0; i < AMMU_numLargePages; i++) {
        if (AMMU_mmuInitConfig.LARGE_POLICY[i] & 1) {
            AMMU_mmu.LARGE_ADDR[i] = AMMU_mmuInitConfig.LARGE_ADDR[i];
            AMMU_mmu.LARGE_XLTE[i] = AMMU_mmuInitConfig.LARGE_XLTE[i];
            AMMU_mmu.LARGE_POLICY[i] = AMMU_mmuInitConfig.LARGE_POLICY[i];
        }
    }

    for (i = 0; i < AMMU_numMediumPages; i++) {
        if (AMMU_mmuInitConfig.MEDIUM_POLICY[i] & 1) {
            AMMU_mmu.MEDIUM_ADDR[i] = AMMU_mmuInitConfig.MEDIUM_ADDR[i];
            AMMU_mmu.MEDIUM_XLTE[i] = AMMU_mmuInitConfig.MEDIUM_XLTE[i];
            AMMU_mmu.MEDIUM_POLICY[i] = AMMU_mmuInitConfig.MEDIUM_POLICY[i];
        }
    }

    for (i = 0; i < AMMU_numSmallPages; i++) {
        if (AMMU_mmuInitConfig.SMALL_POLICY[i] & 1) {
            AMMU_mmu.SMALL_ADDR[i] = AMMU_mmuInitConfig.SMALL_ADDR[i];
            AMMU_mmu.SMALL_XLTE[i] = AMMU_mmuInitConfig.SMALL_XLTE[i];
            AMMU_mmu.SMALL_POLICY[i] = AMMU_mmuInitConfig.SMALL_POLICY[i];
            AMMU_mmu.SMALL_MAINT[i] = AMMU_mmuInitConfig.SMALL_MAINT[i];
        }
    }

    for (i = 0; i < AMMU_numLinePages; i++) {
        if (AMMU_mmuInitConfig.LINE_POLICY[i] & 1) {
            AMMU_mmu.LINE_ADDR[i] = AMMU_mmuInitConfig.LINE_ADDR[i];
            AMMU_mmu.LINE_XLTE[i] = AMMU_mmuInitConfig.LINE_XLTE[i];
            AMMU_mmu.LINE_POLICY[i] = AMMU_mmuInitConfig.LINE_POLICY[i];
        }
    }

    if (AMMU_mmuInitConfig.DEBUG_POLICY & 1) {
        AMMU_mmu.DEBUG_XLTE = AMMU_mmuInitConfig.DEBUG_XLTE;
        AMMU_mmu.DEBUG_POLICY = AMMU_mmuInitConfig.DEBUG_POLICY;
    }
}

/*!
 *  ======== AMMU_invAll ========
 *  Invalidate entire L1 and L2 caches
 *  Waits for completion.
 */
Void AMMU_invAll()
{
    UInt key;

    while (TRUE) {
        key = Hwi_disable();
        if (AMMU_mmu.MAINT) {
            Hwi_restore(key);
        }
        else {
            break;
        }
    }

    AMMU_mmu.MAINT |= 0x400;    /* global flush = 1 */

    Hwi_restore(key);

// Workaround for simulator bug!
    AMMU_mmu.MAINT &= ~0x400;   /*  sim doesn't auto-clear global flush */

    while (AMMU_mmu.MAINT & 0x400) {
        ;
    }
}

/*
 *  ======== AMMU_dumpAmmu ========
 */
Void AMMU_dumpAmmu()
{
    UInt i;

    System_printf("AMMU Base Address: 0x%08x\n\n", &AMMU_mmu);

    for (i = 0; i < AMMU_numLargePages; i++) {
        if (AMMU_mmuInitConfig.LARGE_POLICY[i] & 1) {
            System_printf("LargePage[%d] enabled\n", i);
            System_printf("  ADDR   = 0x%08x\n", AMMU_mmu.LARGE_ADDR[i]);
            System_printf("  XLTE   = 0x%08x\n", AMMU_mmu.LARGE_XLTE[i]);
            System_printf("  POLICY = 0x%08x\n", AMMU_mmu.LARGE_POLICY[i]);
        }
    }

    for (i = 0; i < AMMU_numMediumPages; i++) {
        if (AMMU_mmuInitConfig.MEDIUM_POLICY[i] & 1) {
            System_printf("MediumPage[%d] enabled\n", i);
            System_printf("  ADDR   = 0x%08x\n", AMMU_mmu.MEDIUM_ADDR[i]);
            System_printf("  XLTE   = 0x%08x\n", AMMU_mmu.MEDIUM_XLTE[i]);
            System_printf("  POLICY = 0x%08x\n", AMMU_mmu.MEDIUM_POLICY[i]);
        }
    }

    for (i = 0; i < AMMU_numSmallPages; i++) {
        if (AMMU_mmuInitConfig.SMALL_POLICY[i] & 1) {
            System_printf("SmallPage[%d] enabled\n", i);
            System_printf("  ADDR   = 0x%08x\n", AMMU_mmu.SMALL_ADDR[i]);
            System_printf("  XLTE   = 0x%08x\n", AMMU_mmu.SMALL_XLTE[i]);
            System_printf("  POLICY = 0x%08x\n", AMMU_mmu.SMALL_POLICY[i]);
            System_printf("  MAINT  = 0x%08x\n", AMMU_mmu.SMALL_MAINT[i]);
        }
    }

    for (i = 0; i < AMMU_numLinePages; i++) {
        if (AMMU_mmuInitConfig.LINE_POLICY[i] & 1) {
            System_printf("LinePage[%d] enabled\n", i);
            System_printf("  ADDR   = 0x%08x\n", AMMU_mmu.LINE_ADDR[i]);
            System_printf("  XLTE   = 0x%08x\n", AMMU_mmu.LINE_XLTE[i]);
            System_printf("  POLICY = 0x%08x\n", AMMU_mmu.LINE_POLICY[i]);
        }
    }

    if (AMMU_mmuInitConfig.DEBUG_POLICY & 1) {
        System_printf("LinePage enabled\n", i);
        System_printf("  XLTE   = 0x%08x\n", AMMU_mmu.DEBUG_XLTE);
        System_printf("  POLICY = 0x%08x\n", AMMU_mmu.DEBUG_POLICY);
    }
}


