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

#include <ti/sysbios/hal/Hwi.h>
#include <ti/sysbios/knl/Intrinsics.h>
#include <ti/sysbios/family/arm/MPU.h>

#include "package/internal/Cache.xdc.h"

/*
 *  ======== Cache_initModuleState ========
 *  This function is registered as a firstFxn.
 */
Void Cache_initModuleState()
{
    UInt32 info;

    /* Read L1D cache info registers for ROV */
    info = Cache_getCacheLevelInfo(0);
    Cache_module->l1dInfo = info;
    Cache_module->l1dCacheLineSize = 1 << ((info & 0x7) + 2);

    /* Read L1P cache info registers for ROV */
    info = Cache_getCacheLevelInfo(1);
    Cache_module->l1pInfo = info;
    Cache_module->l1pCacheLineSize = 1 << ((info & 0x7) + 2);
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
    UInt enabled;

    enabled = Cache_getEnabled();

    /* disable the caches if anything is currently enabled */
    if (enabled) {
        Cache_invL1pAll();
        Cache_disable(Cache_Type_ALL);
    }

    /* enable Branch Prediction */
    if (Cache_branchPredictionEnabled == TRUE) {
        Cache_enableBP();
    }
    else {
        Cache_disableBP();
    }

    if (Cache_enableCache) {
        /*
         * Cache_enable() code will invalidate the L1D and L1P caches.
         * Therefore, no need to explicitly invalidate the cache here.
         */
        Cache_enable(Cache_Type_ALL);
    }

    /* Init MPU module */
    MPU_startup();
}

/*
 *  ======== Cache_disable ========
 *  Disable the cache(s) specified by the 'type' paramter.
 */
Void Cache_disable(Bits16 type)
{
    UInt enabled, key;

    /* only disable caches that are currently enabled */
    enabled = Cache_getEnabled();

    if (enabled & (type & Cache_Type_L1D)) {
        key = Hwi_disable();
        Cache_disableL1d();             /* Disable L1D Cache */
        Hwi_restore(key);
    }
    if (enabled & (type & Cache_Type_L1P)) {
        key = Hwi_disable();
        Cache_disableL1p();             /* Disable L1P Cache */
        Hwi_restore(key);
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

    if (disabled & (type & Cache_Type_L1D)) {
        Cache_enableL1d();              /* Enable L1D Cache */
    }
    if (disabled & (type & Cache_Type_L1P)) {
        Cache_enableL1p();              /* Enable L1P Cache */
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
    if (type & Cache_Type_L1P) {
        Cache_invL1p(blockPtr, byteCnt, wait);
    }
    if (type & Cache_Type_L1D) {
        Cache_invL1d(blockPtr, byteCnt, wait);
    }
}
