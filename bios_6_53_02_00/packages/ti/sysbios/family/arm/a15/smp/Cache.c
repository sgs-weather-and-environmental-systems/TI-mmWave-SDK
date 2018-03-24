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
 *  ======== Cache.c ========
 */

#include <xdc/runtime/Assert.h>

#include <ti/sysbios/BIOS.h>
#include <ti/sysbios/hal/Hwi.h>
#include <ti/sysbios/knl/Intrinsics.h>
#include <ti/sysbios/family/arm/a15/Mmu.h>
#include <ti/sysbios/family/arm/a15/smp/Core.h>

#include "package/internal/Cache.xdc.h"

/*
 *  ======== Cache_initModuleState ========
 *  This function is registered as a firstFxn.
 */
Void Cache_initModuleState()
{
    UInt info, numsets;

    /* Read L1D, L1P, L2 cache info registers for ROV */
    Cache_module->l1dInfo = Cache_getCacheLevelInfo(0);
    Cache_module->l1pInfo = Cache_getCacheLevelInfo(1);
    Cache_module->l2Info = Cache_getCacheLevelInfo(2);

    /*
     * Derive L2 size info
     */
    info = Cache_module->l2Info;

    /* numsets = number of 64 byte cache lines contained in L2 */
    numsets = ((info & 0x0fffe000) >> 13) + 1;

    Cache_module->l2WaySize = numsets * Cache_sizeL2CacheLine;
}

/*
 *  ======== Cache_startup ========
 *  This function is registered as a resetFxn and is
 *  not a module startup function.
 *
 *  Enable cache early if Cache_enableCache == TRUE.
 */
Void Cache_startup()
{
    UInt32 reg;

    if ((Cache_errata798870 == TRUE) &&
        (Core_getRevisionNumber() < 0x30)) {
        reg = Cache_getL2AuxControlReg();
        reg |= 0x80;
        Cache_setL2AuxControlReg(reg);
    }

    /* enable Branch Prediction */
    if (Cache_branchPredictionEnabled == TRUE) {
        Cache_enableBP();
    }
    else {
        Cache_disableBP();
    }

    /*
     * Caches should have been disabled during the startup routine so we
     * do not need to disable the caches again. The HW also guarantees
     * that the data cache is invalidated on reset so we do not need to
     * explicitly invalidate the data cache here.
     *
     * The L1P cache will be invalidated by the Cache_enableL1P code so we
     * do not need to invalidate the program cache either.
     */

    if (Cache_enableCache) {
        /*
         * boot.asm code disables the MMU, data cache and
         * program cache.
         */
        Cache_enableL1D();
        Cache_enableL1P();
    }

    /* Init MMU module */
    Mmu_startup();
}

/*
 *  ======== Cache_disable ========
 *  Disable the cache(s) specified by the 'type' paramter.
 */
Void Cache_disable(Bits16 type )
{
    UInt enabled;

    /* only disable caches that are currently enabled */
    enabled = Cache_getEnabled();

    if ((type & Cache_Type_L2) || (type & Cache_Type_L1D)) {
        Assert_isTrue(FALSE, Cache_A_cacheDisableUnsupported);
    }

    if (enabled & (type & Cache_Type_L1P)) {
        Cache_disableL1P();       /* Disable L1P Cache */
    }
}

/*
 *  ======== Cache_enable ========
 *  Enable the cache(s) specified by the 'type' parameter.
 */
Void Cache_enable(Bits16 type)
{
    UInt disabled;

    /* only enable caches that are currently disabled */
    disabled = ~(Cache_getEnabled());

    if ((type & Cache_Type_L2) || (type & Cache_Type_L1D)) {
        Assert_isTrue(FALSE, Cache_A_cacheEnableUnsupported);
    }

    if (disabled & (type & Cache_Type_L1P)) {
        Cache_enableL1P();              /* Enable L1P Cache */
    }
}

/*
 *  ======== Cache_inv ========
 *  Invalidate the range of memory within the specified starting address and
 *  byte count.  The range of addresses operated on gets rounded down to whole
 *  cache lines in each cache.  All cache lines in range are invalidated in
 *  the caches specified by the 'type' parameter.
 */
Void Cache_inv(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait)
{
    if (type & (Cache_Type_L1P + Cache_Type_L2P)) {
        Cache_invL1p(blockPtr, byteCnt, wait);
    }
    if (type & (Cache_Type_L1D + Cache_Type_L2D)) {
        Cache_invL1d(blockPtr, byteCnt, wait);
    }
}

/*
 *  ======== Cache_preLoad ========
 */
Void Cache_preLoad(Ptr blockPtr, SizeT byteCnt)
{
    UInt hwiKey;

    // TODO Add assert to check byteCnt less than L2 cache size

    hwiKey = Hwi_disable();

    Cache_preFetch(blockPtr, byteCnt);

    Hwi_restore(hwiKey);
}
