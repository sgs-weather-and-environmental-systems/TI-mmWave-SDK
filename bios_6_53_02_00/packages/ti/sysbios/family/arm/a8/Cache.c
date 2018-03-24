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

#include <xdc/runtime/Startup.h>
#include <xdc/runtime/Assert.h>

#include <ti/sysbios/hal/Hwi.h>
#include <ti/sysbios/knl/Intrinsics.h>
#include <ti/sysbios/family/arm/a8/Mmu.h>

#include "package/internal/Cache.xdc.h"

/*
 *  ======== Cache_startup ========
 *  Enable cache early if Cache_enableCache == TRUE.
 */
Void Cache_startup()
{
    UInt enabled, info, numsets;

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

    /* Unlock all L2 ways */
    if (Cache_unlockL2Cache == TRUE) {
        Cache_unlock(0xff);     /* unlock all 8 ways */
    }

    /* keep ROV informed of lock state */
    Cache_module->lockRegister = Cache_getLockdownReg();

    /* enable Branch Prediction */
    if (Cache_branchPredictionEnabled == TRUE) {
        Cache_enableBP();
    }
    else {
        Cache_disableBP();
    }

    enabled = Cache_getEnabled();

    /* disable the caches if anything is currently enabled */
    if (enabled) {
        Cache_invL1pAll();
        Cache_disable(Cache_Type_ALL);
    }
    else {
        Cache_invL1pAll();
        Cache_invL1dAll();
    }

    if (Cache_enableCache) {
        /*
         * CCS reset doesn't disable the MMU.
         * Since the MMU may still be set up and enabled
         * from a previous application, disable the MMU now
         * to prevent miss-configuration, when the cache gets
         * enabled
         */
        Mmu_disable();
        Cache_enable(Cache_Type_ALL);
    }
}

/*
 *  ======== Cache_disable ========
 *  Disable the cache(s) specified by the 'type' paramter.
 */
Void Cache_disable(Bits16 type)
{
    UInt enabled;
    UInt32 key;

    /* Only disable caches that are currently enabled */
    enabled = Cache_getEnabled();

    if (enabled & (type & Cache_Type_L2)) {
        Cache_disableL1p();             /* Disable ICache */

        key = Hwi_disable();
        Cache_disableL1d();             /* Disable DCache */
        Cache_disableL2();              /* Disable L2 */
        Hwi_restore(key);

        if (!(type & Cache_Type_L1D) && (enabled & Cache_Type_L1D)) {
            Cache_enableL1d();          /* Re-enable DCache */
        }
        if (!(type & Cache_Type_L1P) && (enabled & Cache_Type_L1P)) {
            Cache_enableL1p();          /* Re-enable ICache */
        }
    }
    else {
        if (enabled & (type & Cache_Type_L1D)) {
            key = Hwi_disable();
            Cache_disableL1d();         /* Disable DCache */
            Hwi_restore(key);
        }
        if (enabled & (type & Cache_Type_L1P)) {
            Cache_disableL1p();         /* Disable ICache */
        }
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

    if (disabled & (type & Cache_Type_L2)) {
        Cache_enableL2();               /* Enable L2 cache */
    }
    if (disabled & (type & Cache_Type_L1P)) {
        Cache_enableL1p();              /* Enable ICache */
    }
    if (disabled & (type & Cache_Type_L1D)) {
        Cache_enableL1d();              /* Enable DCache */
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
 *  ======== Cache_lock ========
 */
UInt Cache_lock(Ptr blockPtr, SizeT byteCnt)
{
    UInt hwiKey;
    UInt wayBit, wayNum;
    UInt lockedWays, unlockedWays;

    Assert_isTrue((byteCnt <= Cache_module->l2WaySize), Cache_A_badBlockLength);

    /* 
     * make sure memory block does not cross a way size page boundary by 
     * comparing high bits of start and end addresses 
     */
    Assert_isTrue(
        (
        (((SizeT)blockPtr) & ~(Cache_module->l2WaySize - 1)) ==
        (((SizeT)blockPtr + (byteCnt - 1)) & ~(Cache_module->l2WaySize - 1))
        ), Cache_A_blockCrossesPage);

    hwiKey = Hwi_disable();

    /* get current set of locked ways */
    lockedWays = Cache_getLockdownReg() & 0x000000ff;

    /* if all ways are locked, return 0 */
    if (lockedWays == 0xff) {
        Hwi_restore(hwiKey);
        return (0);
    }

    /* find highest unused lock */
    unlockedWays = lockedWays ^ 0x000000ff; /* toggle bits 0-7 */
    wayNum = Intrinsics_maxbit(unlockedWays);
    wayBit = 1 << wayNum;

    Cache_wayLoadLock(blockPtr, byteCnt, wayBit);

    /* update mod state for ROV purposes */
    Cache_module->baseAddresses[wayNum] = blockPtr;
    Cache_module->lockRegister = lockedWays | wayBit;

    Hwi_restore(hwiKey);

    return (wayBit);
}

/*
 *  ======== Cache_unlock ========
 */
Void Cache_unlock(UInt key)
{
    UInt hwiKey, newLock;

    if (key == 0) {
        return;
    }

    hwiKey = Hwi_disable();

    /* preserve all other lockdown register bits */
    newLock = Cache_getLockdownReg() & ~key;

    Cache_setLockdownReg(newLock);

    /* keep ROV informed */
    Cache_module->lockRegister = newLock;

    Hwi_restore(hwiKey);
}


