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

#define MIN_MMU_PAGE_SIZE        4096
#define MIN_MMU_PAGE_ALIGN       0xFFFFF000

/* PL310 IP revision */
#define PL310_RTL_RELEASE_r0p0   0
#define PL310_RTL_RELEASE_r1p0   2
#define PL310_RTL_RELEASE_r2p0   4
#define PL310_RTL_RELEASE_r3p0   5
#define PL310_RTL_RELEASE_r3p1   6
#define PL310_RTL_RELEASE_r3p2   8
#define PL310_RTL_RELEASE_r3p3   9

/* L2 Cache Interrupt Bit masks */
#define PL310_ECNTRINTR          0x001
#define PL310_PARRTINTR          0x002
#define PL310_PARRDINTR          0x004
#define PL310_ERRWTINTR          0x008
#define PL310_ERRWDINTR          0x010
#define PL310_ERRRTINTR          0x020
#define PL310_ERRRDINTR          0x040
#define PL310_SLVERRINTR         0x080
#define PL310_DECERRINTR         0x100

#define PL310_INTMASK            0x1FF
#define PL310_AUXCTRL_NSINTCTRL  0x8000000
#define PL310_AUXCTRL_NSLOCKDOWN 0x4000000

#define L2_SIZE_16KB             16384
#define L2_SIZE_32KB             L2_SIZE_16KB * 2
#define L2_SIZE_64KB             L2_SIZE_16KB * 4
#define L2_SIZE_128KB            L2_SIZE_16KB * 8
#define L2_SIZE_256KB            L2_SIZE_16KB * 16
#define L2_SIZE_512KB            L2_SIZE_16KB * 32

/* AM437X MPUSS_CTRL register offset */
#define CONTROL_SEC_SPARE0       (0x1E0)
#define CONTROL_MPUSS_CTRL       (0x654)

/* PL310 AUX Control register Bit masks */
#define L2_DATA_PREFETCH_ENABLE  0x10000000
#define L2_INSTR_PREFETCH_ENABLE 0x20000000
#define L2_REPLACEMENT_POLICY    0x02000000

/* PL310 Prefetch Control register Bit masks */
#define L2_DOUBLE_LINEFILL       0x40000000
#define L2_WRAP_DOUBLE_LINEFILL  0x08000000
#define L2_INCR_DOUBLE_LINEFILL  0x00800000
#define L2_PREFETCH_DROP         0x01000000

#define HWREG(x)                 (*((volatile UInt32 *)(x)))

/*
 *  ======== Cache_initL2Sram ========
 *  This function is registered as a resetFxn.
 */
Void Cache_initL2Sram()
{
    UInt32 enabled, ctrlRegVal;

    enabled = Cache_getEnabled();

    /* disable the L2 cache if it is currently enabled */
    if (enabled & Cache_Type_L2) {
        /* Disable L2 cache */
        Cache_disableL2();
    }

    ctrlRegVal = HWREG((UInt32)Cache_controlModuleReg + CONTROL_SEC_SPARE0);
    HWREG((UInt32)Cache_controlModuleReg + CONTROL_SEC_SPARE0) =
        (ctrlRegVal | 0x10000);
}

/*
 *  ======== Cache_startup ========
 *  Enable cache early if Cache_enableCache == TRUE.
 */
Void Cache_startup()
{
    UInt32 auxCtrlReg, prefetchReg;
    UInt32 enabled, info, l2CacheLockMask;

    /* Read L1D and L1P cache info registers for ROV */
    Cache_module->l1dInfo = Cache_getCacheLevelInfo(0);
    Cache_module->l1pInfo = Cache_getCacheLevelInfo(1);

    /* Read L2 cache info for ROV */
    Cache_module->l2Info = Cache_l2ControllerRegs.CACHETYPE;

    Cache_module->pl310RTLRelease = (Cache_l2ControllerRegs.CACHEID) & 0x3F;

    /*
     * Derive L2 size info
     */
    info = Cache_module->l2Info;

    switch ((info & 0x00000700) >> 8) {
        case 0:
        case 1:
            Cache_module->l2WaySize = L2_SIZE_16KB;
            break;
        case 2:
            Cache_module->l2WaySize = L2_SIZE_32KB;
            break;
        case 3:
            Cache_module->l2WaySize = L2_SIZE_64KB;
            break;
        case 4:
            Cache_module->l2WaySize = L2_SIZE_128KB;
            break;
        case 5:
            Cache_module->l2WaySize = L2_SIZE_256KB;
            break;
        case 6:
        case 7:
            Cache_module->l2WaySize = L2_SIZE_512KB;
            break;
        default:
            /* Execution can never reach here */
            break;
    }

    /* l2NumSets = (l2WaySize in bytes / cache Line size in bytes) */
    Cache_module->l2NumSets = (Cache_module->l2WaySize) / Cache_sizeL2CacheLine;

    /*
     * Extract associativity bit from info and determine number of ways
     * based on whether bit is 0 or 1.
     */
    if (info & 0x40) {
        Cache_module->l2NumWays = 16;
    }
    else {
        Cache_module->l2NumWays = 8;
    }

    l2CacheLockMask = (0x1 << Cache_module->l2NumWays) - 1;

    /* Unlock all L2 ways */
    if (Cache_unlockL2Cache && (!Cache_configureL2Sram)) {
        Cache_unlock(l2CacheLockMask);
    }

    /* Keep ROV informed of lock state */
    Cache_module->lockRegister = Cache_getLockdownReg();

    /* Enable Branch Prediction */
    if (Cache_branchPredictionEnabled) {
        Cache_enableBP();
    }
    else {
        Cache_disableBP();
    }

    enabled = Cache_getEnabled();

    /* disable the caches if anything is currently enabled */
    if (enabled) {
        if (enabled & Cache_Type_L2) {
            /* Disable L2 cache */
            Cache_disableL2();
        }
        if (enabled & Cache_Type_L1D) {
            /* Disable L1d cache */
            Cache_disableL1d();
        }
        if (enabled & Cache_Type_L1P) {
            /* Disable and Invalidate L1p cache */
            Cache_disableL1p();
        }
    }

    if (!Cache_configureL2Sram) {
        /* Invalidate L2 cache */
        Cache_invL2All();
    }

    /* Invalidate L1 I-cache */
    Cache_invL1pAll();
    /* Invalidate L1 D-cache */
    Cache_invL1dAll();
    /* Ensure L1 D-cache invalidate complete */
    Cache_wait();

    if (!Cache_configureL2Sram) {
        auxCtrlReg = Cache_l2ControllerRegs.AUXCONTROL;

        if (Cache_l2DataPrefetchEnable) {
            auxCtrlReg |= L2_DATA_PREFETCH_ENABLE;
        }
        else {
            auxCtrlReg &= (~L2_DATA_PREFETCH_ENABLE);
        }

        if (Cache_l2InstructionPrefetchEnable) {
            auxCtrlReg |= L2_INSTR_PREFETCH_ENABLE;
        }
        else {
            auxCtrlReg &= (~L2_INSTR_PREFETCH_ENABLE);
        }

        Cache_setL2AuxControlReg(auxCtrlReg);

        if (Cache_module->pl310RTLRelease >= PL310_RTL_RELEASE_r3p0) {
            prefetchReg = Cache_l2ControllerRegs.PREFETCHCTRL;

            if (Cache_l2DoubleLinefillEnable) {
                prefetchReg |= L2_DOUBLE_LINEFILL;
            }
            else {
                prefetchReg &= (~L2_DOUBLE_LINEFILL);
            }

            if (Cache_l2WrapDoubleLinefillEnable) {
                    prefetchReg &= (~L2_WRAP_DOUBLE_LINEFILL);
            }
            else {
                prefetchReg |= L2_WRAP_DOUBLE_LINEFILL;
            }

            if (Cache_l2IncrDoubleLinefillEnable) {
                prefetchReg |= L2_INCR_DOUBLE_LINEFILL;
            }
            else {
                prefetchReg &= (~L2_INCR_DOUBLE_LINEFILL);
            }

            if (Cache_l2PrefetchDropEnable) {
                prefetchReg |= L2_PREFETCH_DROP;
            }
            else {
                prefetchReg &= (~L2_PREFETCH_DROP);
            }

            prefetchReg &= (~0x1F);
            prefetchReg |= (UInt32)(Cache_l2PrefetchOffset & 0x1F);

            Cache_setL2PrefetchControl(prefetchReg);
        }
    }

    /*
     * Read Auxiliary Control Register to determine if non-secure
     * access is allowed to the interrupt control registers.
     */
    if (Cache_l2ControllerRegs.AUXCONTROL & PL310_AUXCTRL_NSINTCTRL) {
        /* Disable and clear all L2 cache interrupts */
        Cache_l2ControllerRegs.INTMASK = 0x0;
        Cache_l2ControllerRegs.INTCLEAR = PL310_INTMASK;
        if (Cache_enableL2Interrupt) {
            Cache_l2ControllerRegs.INTMASK = Cache_l2InterruptMask;
        }
    }
    else {
        Assert_isTrue(!Cache_enableL2Interrupt,
                Cache_A_noNonSecureInterruptAccess);
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
    UInt enabled, hwiKey;

    /* only disable caches that are currently enabled */
    enabled = Cache_getEnabled();

    if (enabled & (type & Cache_Type_L2)) {
        Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);

        /* Disable Interurpts */
        hwiKey = Hwi_disable();

        /* Clean entire L1 data cache */
        Cache_wbL1dAll();
        /* Disable L1d cache */
        Cache_disableL1d();
        /* Ensure L1d cache written back and disabled */
        Cache_wait();

        /* Briefly re-enable interrupts */
        Hwi_restore(hwiKey);
        /* Disable Interurpts */
        hwiKey = Hwi_disable();

        /* Disable L2. The disable API also cleans and invalidates L2. */
        Cache_disableWbInvL2();

        /* Restore Interrupts */
        Hwi_restore(hwiKey);

        /* Invalidate entire L1 data cache */
        Cache_invL1dAll();

        /*
         * If L1d was enabled before and 'type' mask does not include it,
         * re-enable it.
         */
        if (!(type & Cache_Type_L1D) && (enabled & Cache_Type_L1D)) {
            Cache_enableL1d();
        }
    }
    else if (enabled & (type & Cache_Type_L1D)) {
        hwiKey = Hwi_disable();     /* Disable interrupts */

        Cache_wbInvL1dAll();        /* Clean and Invalidate L1 data cache */
        Cache_disableL1d();         /* Disable DCache */

        Hwi_restore(hwiKey);        /* Restore interrupts */
    }

    if (enabled & (type & Cache_Type_L1P)) {
        Cache_disableL1p();         /* Disable ICache */
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

    /*
     * L1d and L2 caches are invalidated again before being enabled
     * to avoid a potential stale valid cache line problem. The inv()
     * and wbInv() operations do a stack pop to restore the registers
     * at the end of the function. This can cause a read allocate if
     * the respective cache is enabled. To avoid having a stale valid
     * cache line, we invalidate the cache once more and then
     * enable it.
     */

    if ((disabled & (type & Cache_Type_L2)) && (!Cache_configureL2Sram)) {
        Cache_invL2All();               /* Invalidate L2 cache */
        Cache_enableL2();               /* Enable L2 cache */
    }
    if (disabled & (type & Cache_Type_L1P)) {
        Cache_enableL1p();              /* Enable ICache */
    }
    if (disabled & (type & Cache_Type_L1D)) {
        Cache_invL1dAll();              /* Invalidate L1 data cache */
        Cache_enableL1d();              /* Enable L1 data cache */
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
    if (type & (Cache_Type_L2P + Cache_Type_L2D)) {
        Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);
        Cache_invL2(blockPtr, byteCnt, wait);
    }

    if (type & Cache_Type_L1P) {
        Cache_invL1p(blockPtr, byteCnt, wait);
    }

    if (type & Cache_Type_L1D) {
        Cache_invL1d(blockPtr, byteCnt, wait);
    }

    /* Ensure completion of invalidate operation */
    Cache_wait();
}

/*
 *  ======== Cache_wb ========
 *  Write back the range of memory within the specified starting address and
 *  byte count.  The range of addresses operated on gets rounded down to whole
 *  cache lines in each cache.  All cache lines in range are written back in
 *  the L1d and L2 caches. The 'type' parameter is ignored.
 */
Void Cache_wb(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait)
{
    /* Write-back memory block in L1 data cache */
    Cache_wbL1d(blockPtr, byteCnt, wait);
    /* Ensure completion of write-back operation */
    Cache_wait();

    if (!Cache_configureL2Sram) {
        /* Write-back memory block in L2 cache */
        Cache_wbL2(blockPtr, byteCnt, wait);
    }

    /* Ensure completion of write-back operation */
    Cache_wait();
}

/*
 *  ======== Cache_wbInv ========
 *  Write back and invalidate the range of memory within the specified starting
 *  address and byte count.  The range of addresses operated on gets rounded
 *  down to whole cache lines in each cache.  All cache lines in range are
 *  written back and invalidated in the L1d and L2 caches. The 'type'
 *  parameter is ignored.
 */
Void Cache_wbInv(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait)
{
    /* Write-back memory block in L1 data cache */
    Cache_wbL1d(blockPtr, byteCnt, wait);
    /* Ensure completion of write-back operation */
    Cache_wait();

    if (!Cache_configureL2Sram) {
        /* Write-back invalidate memory block in L2 cache */
        Cache_wbInvL2(blockPtr, byteCnt, wait);
    }

    /* Invalidate memory block in L1 data cache */
    Cache_invL1d(blockPtr, byteCnt, wait);
    /* Ensure completion of invalidate operation */
    Cache_wait();
}

/*
 *  ======== Cache_getLockdownReg ========
 */
Bits32 Cache_getLockdownReg()
{
    /*
     * Return the contents of any one of the 16 D & I lockdown
     * registers. Since we set all lockdown registers to
     * the same value, it is okay to read and return the
     * contents of any one of the registers.
     */
    return (Bits32)(Cache_l2ControllerRegs.LOCKDOWN[0]);
}

/*
 *  ======== Cache_setLockdownReg ========
 */
Void Cache_setLockdownReg(Bits32 wayMask)
{
    UInt idx;

    for (idx = 0; idx < 8; idx++) {
        /* Data cache lockdown */
        Cache_l2ControllerRegs.LOCKDOWN[2 * idx] = wayMask;
        /* Instruction cache lockdown */
        Cache_l2ControllerRegs.LOCKDOWN[2 * idx + 1] = wayMask;
    }
}

/*
 *  ======== Cache_lock ========
 */
UInt Cache_lock(Ptr blockPtr, SizeT byteCnt)
{
    UInt hwiKey;
    UInt wayBit, wayNum;
    UInt lockedWays, unlockedWays, l2CacheLockMask;

    Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);

    Assert_isTrue(Cache_l2ControllerRegs.AUXCONTROL & PL310_AUXCTRL_NSLOCKDOWN,
            Cache_A_noNonSecureLockdown);

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

    l2CacheLockMask = (0x1 << Cache_module->l2NumWays) - 1;

    /* get current set of locked ways */
    lockedWays = Cache_getLockdownReg() & l2CacheLockMask;

    /* if all ways are locked, return 0 */
    if (lockedWays == l2CacheLockMask) {
        Hwi_restore(hwiKey);
        return (0);
    }

    /* find highest unused lock */
    unlockedWays = lockedWays ^ l2CacheLockMask; /* toggle bits */
    wayNum = Intrinsics_maxbit(unlockedWays);
    wayBit = 1 << wayNum;

    /* Load memory block into cache way identified by wayNum and lock the way */
    Cache_wayLoadLock(blockPtr, byteCnt, wayNum);

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

    Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);

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

/*
 *  ======== Cache_wayLoadLock ========
 *  Algorithm:
 *  1) Disable I cache to prevent caching of code
 *  2) Lock all but referenced L2 cache way
 *  3) Clean/invalidate referenced L2 cache way
 *  4) Flush then pull memory block into L2 cache
 *  5) Restore L2 locks to previous state plus this wayBit
 *  6) Restore I cache
 *
 *  NO data accesses between context save/restore other than
 *  loading the memory block being locked
 *
 *  This function is aligned so that it is entirely contained
 *  within a single L2 cache way.
 */
Void Cache_wayLoadLock(Ptr blockPtr, SizeT byteCnt, UInt wayNum)
{
    Ptr lastAddress;
    UInt wayBit, setIdx, wbInvMask;
    UInt enabled, oldLock, newLock, l2CacheLockMask;

    wayBit = 1 << wayNum;

    enabled = Cache_getEnabled();

    /* Disable L1P cache */
    if (enabled & Cache_Type_L1P) {
        Cache_disableL1p();
    }

    lastAddress = (Ptr)((UInt32)blockPtr + byteCnt);
    l2CacheLockMask = (0x1 << Cache_module->l2NumWays) - 1;

    /* Lock all but this way */
    newLock = (~(wayBit)) & l2CacheLockMask;
    oldLock = Cache_getLockdownReg();
    Cache_setLockdownReg(newLock);

    /* Clean L1 data cache */
    Cache_wbL1dAll();

    /* Ensure completion */
    Cache_wait();

    /*
     * Disable cache line fill and disable write-back.
     * This will prevent any accidental L2 line fills
     */
    Cache_debugWriteL2(0x3);

    if (Cache_module->pl310RTLRelease == PL310_RTL_RELEASE_r2p0) {
        setIdx = 0;
        while (setIdx != Cache_module->l2NumSets) {
            wbInvMask = (setIdx << 5) | (wayNum << 28);
            Cache_l2ControllerRegs.CLEANINVINDEX = wbInvMask;
            while (Cache_l2ControllerRegs.CLEANINVINDEX & 0x1);
            setIdx++;
        }
    }
    else {
        /* Clean/Flush and Invalidate selected L2 cache way */
        Cache_l2ControllerRegs.CLEANINVWAY = wayBit;

        /*
         * L2 cache clean (wb) and invalidate by way is a background
         * operation and we need to wait for the operation to complete.
         *
         * As and when each way is totally cleaned and invalidated, its
         * corresponding bit is cleared. Wait for all way bits to clear
         * to ensure operation is complete.
         */
        while (Cache_l2ControllerRegs.CLEANINVWAY & wayBit);
    }

    /* Ensure completion of L2 Clean & Invalidate operation */
    Cache_sync();

    /* Invalidate L1P cache */
    Cache_invL1pAll();

    /* Ensure completion of L1P cache invalidate operation */
    Cache_wait();

    /*
     * Re-enable cache line fill and write-back as we are now ready
     * to load memory block into selected cache way.
     */
    Cache_debugWriteL2(0x0);

    /*
     * Pull block into this cache way
     *
     * Implementing in assembly to avoid unwated data cache accesses.
     * If TI tools support is added, this code needs to be moved
     * into a assembly function as TI compiler does not support
     * GNU extended asm.
     *
     * Algorithm:
     *
     * 1) Load first word of cache line into this way
     * 2) Increment address by cache line size
     * 3) Compare to last address. If lower jump to step 1
     */
    __asm__ __volatile__ (
            "wayLoadLoop: ldr r12, [%0]\n\t"
            "add %0, %0, %2\n\t"
            "cmp %0, %1\n\t"
            "blo wayLoadLoop"
            :: "r" (blockPtr), "r" (lastAddress), "r" (Cache_sizeL2CacheLine)
            : "r12", "memory", "cc"
            );

    /*
     * Disable cache line fill and disable write-back.
     */
    Cache_debugWriteL2(0x3);

    Cache_setLockdownReg(oldLock | wayBit);

    /*
     * Now that the selected way is locked, it is safe to re-enable
     * cache line fill and write-back.
     */
    Cache_debugWriteL2(0x0);

    Cache_wait();

    if (enabled & Cache_Type_L1P) {
        Cache_enableL1p();
    }
}

/*
 *  ======== getL2AuxControlReg ========
 *  get current L2 Aux Control register contents
 */
Bits32 Cache_getL2AuxControlReg()
{
    return (Bits32)(Cache_l2ControllerRegs.AUXCONTROL);
}

/*
 *  ======== Cache_invL2 ========
 *  Invalidate the range of memory within the specified starting address and
 *  byte count.  The range of addresses operated on gets rounded down to whole
 *  cache lines in L2 cache.  All cache lines in range are invalidated in
 *  the L2 cache.
 */
Void Cache_invL2(Ptr blockPtr, SizeT byteCnt, Bool wait)
{
    Ptr phyAddress, pageLimit;
    Ptr endAddress = (Ptr)((UInt32)blockPtr + byteCnt);

    Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);

    /* Align blockPtr to cache line */
    blockPtr = (Ptr)((UInt32)blockPtr & (~(Cache_sizeL2CacheLine - 1)));

    phyAddress = Mmu_getPhysicalAddr(blockPtr);
    pageLimit = (Ptr)(((UInt32)blockPtr & MIN_MMU_PAGE_ALIGN) +
            MIN_MMU_PAGE_SIZE);
    while (blockPtr < endAddress) {
        if (blockPtr >= pageLimit) {
            phyAddress = Mmu_getPhysicalAddr(blockPtr);
            pageLimit = (Ptr)((UInt32)blockPtr + MIN_MMU_PAGE_SIZE);
        }

        /* Invalidate L2 cache line by PA - atomic operation */
        Cache_l2ControllerRegs.INVPA = (UInt32)phyAddress;

        blockPtr = (Ptr)((UInt32)blockPtr + Cache_sizeL2CacheLine);
        phyAddress = (Ptr)((UInt32)phyAddress + Cache_sizeL2CacheLine);
    }

    /* Ensure completion of L2 invalidate operation */
    Cache_sync();

    /* Ensure completion of invalidate operation */
    if (wait) {
        Cache_wait();
    }
}

/*
 *  ======== Cache_wbL2 ========
 *  Write back the range of memory within the specified starting address and
 *  byte count.  The range of addresses operated on gets rounded down to whole
 *  cache lines in L2 cache.
 */
Void Cache_wbL2(Ptr blockPtr, SizeT byteCnt, Bool wait)
{
    Ptr phyAddress, pageLimit;
    Ptr endAddress = (Ptr)((UInt32)blockPtr + byteCnt);

    Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);

    /* Align blockPtr to cache line */
    blockPtr = (Ptr)((UInt32)blockPtr & (~(Cache_sizeL2CacheLine - 1)));

    phyAddress = Mmu_getPhysicalAddr(blockPtr);
    pageLimit = (Ptr)(((UInt32)blockPtr & MIN_MMU_PAGE_ALIGN) +
            MIN_MMU_PAGE_SIZE);
    while (blockPtr < endAddress) {
        if (blockPtr >= pageLimit) {
            phyAddress = Mmu_getPhysicalAddr(blockPtr);
            pageLimit = (Ptr)((UInt32)blockPtr + MIN_MMU_PAGE_SIZE);
        }

        /* Write back L2 cache line by PA - atomic operation */
        Cache_l2ControllerRegs.CLEANPA = (UInt32)phyAddress;

        blockPtr = (Ptr)((UInt32)blockPtr + Cache_sizeL2CacheLine);
        phyAddress = (Ptr)((UInt32)phyAddress + Cache_sizeL2CacheLine);
    }

    /* Ensure completion of L2 write back operation */
    Cache_sync();

    /* Ensure completion of write back operation */
    if (wait) {
        Cache_wait();
    }
}

/*
 *  ======== Cache_wbInvL2 ========
 *  Write back and invalidate the range of memory within the specified
 *  starting address and byte count. The range of addresses operated
 *  on gets rounded down to whole cache lines in L2 cache.
 */
Void Cache_wbInvL2(Ptr blockPtr, SizeT byteCnt, Bool wait)
{
    Ptr phyAddress, pageLimit;
    Ptr endAddress = (Ptr)((UInt32)blockPtr + byteCnt);

    Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);

    /* Align blockPtr to cache line */
    blockPtr = (Ptr)((UInt32)blockPtr & (~(Cache_sizeL2CacheLine - 1)));

    phyAddress = Mmu_getPhysicalAddr(blockPtr);
    pageLimit = (Ptr)(((UInt32)blockPtr & MIN_MMU_PAGE_ALIGN) +
            MIN_MMU_PAGE_SIZE);
    while (blockPtr < endAddress) {
        if (blockPtr >= pageLimit) {
            phyAddress = Mmu_getPhysicalAddr(blockPtr);
            pageLimit = (Ptr)((UInt32)blockPtr + MIN_MMU_PAGE_SIZE);
        }

        /* Write back and invalidate L2 cache line by PA - atomic operation */
        Cache_l2ControllerRegs.CLEANINVPA = (UInt32)phyAddress;

        blockPtr = (Ptr)((UInt32)blockPtr + Cache_sizeL2CacheLine);
        phyAddress = (Ptr)((UInt32)phyAddress + Cache_sizeL2CacheLine);
    }

    /* Ensure completion of L2 write back and invalidate operation */
    Cache_sync();

    /* Ensure completion of write back and invalidate operation */
    if (wait) {
        Cache_wait();
    }
}

/*
 *  ======== Cache_invL2All ========
 *  Invalidate entire L2 cache.
 */
Void Cache_invL2All()
{
    UInt32 l2WayMask = (1 << (Cache_module->l2NumWays)) - 1;

    Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);

    Assert_isTrue(!(Cache_getEnabled() & Cache_Type_L2),
            Cache_A_badInvCallWithL2En);

    /* Invalidate all L2 cache ways */
    Cache_l2ControllerRegs.INVWAY = l2WayMask;

    /*
     * L2 cache invalidate by way is a background operation and we
     * need to wait for the operation to complete.
     *
     * As and when each way is totally invalidated, its corresponding
     * bit is cleared. Wait for all way bits to clear to ensure
     * operation is complete.
     */
    while (Cache_l2ControllerRegs.INVWAY & l2WayMask);

    /* Ensure completion of L2 invalidate operation */
    Cache_sync();
}

/*
 *  ======== Cache_wbL2All ========
 *  Write back entire L2 cache.
 */
Void Cache_wbL2All()
{
    UInt32 l2WayMask = (1 << (Cache_module->l2NumWays)) - 1;

    Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);

    /*
     * Disable cache line fill and disable write-back
     */
    Cache_debugWriteL2(0x3);

    /* Clean all L2 cache ways */
    Cache_l2ControllerRegs.CLEANWAY = l2WayMask;

    /*
     * L2 cache clean (wb) by way is a background operation and we
     * need to wait for the operation to complete.
     *
     * As and when each way is totally cleaned, its corresponding
     * bit is cleared. Wait for all way bits to clear to ensure
     * operation is complete.
     */
    while (Cache_l2ControllerRegs.CLEANWAY & l2WayMask);

    /* Ensure completion of L2 Clean operation */
    Cache_sync();

    Cache_debugWriteL2(0x0);
}

/*
 *  ======== Cache_wbInvL2All ========
 *  Write back and invalidate entire L2 cache
 */
Void Cache_wbInvL2All()
{
    UInt32 setIdx, wayIdx, wbInvMask;
    UInt32 l2WayMask = (1 << (Cache_module->l2NumWays)) - 1;

    Assert_isTrue((!Cache_configureL2Sram), Cache_A_badL2CacheOperation);

    /*
     * Disable cache line fill and disable write-back
     */
    Cache_debugWriteL2(0x3);

    /*
     * PL310 RTL release r2p0 (used in OMAP4) has a bug in the
     * non-secure clean & invalidate by way.
     *
     * ARM recommends to use clean and invalidate by set/way
     * as a work around.
     *
     * (see PL310 Errata 727915)
     */
    if (Cache_module->pl310RTLRelease == PL310_RTL_RELEASE_r2p0) {
        wayIdx = 0;
        while (wayIdx != Cache_module->l2NumWays) {
            setIdx = 0;
            while (setIdx != Cache_module->l2NumSets) {
                wbInvMask = (setIdx << 5) | (wayIdx << 28);
                Cache_l2ControllerRegs.CLEANINVINDEX = wbInvMask;
                while (Cache_l2ControllerRegs.CLEANINVINDEX & 0x1);
                setIdx++;
            }
            wayIdx++;
        }
    }
    else {
        /* Clean and Invalidate all L2 cache ways */
        Cache_l2ControllerRegs.CLEANINVWAY = l2WayMask;

        /*
         * L2 cache clean (wb) and invalidate by way is a background
         * operation and we need to wait for the operation to complete.
         *
         * As and when each way is totally cleaned and invalidated, its
         * corresponding bit is cleared. Wait for all way bits to clear
         * to ensure operation is complete.
         */
        while (Cache_l2ControllerRegs.CLEANINVWAY & l2WayMask);
    }

    /* Ensure completion of L2 Clean & Invalidate operation */
    Cache_sync();

    Cache_debugWriteL2(0x0);
}

/*
 *  ======== Cache_sync ========
 *  Perform a cache sync operation
 *
 *  According to TRM this operation does the following:
 *  Drain the Store Buffers (STB). Operation complete when all buffers,
 *  Line Read Buffers (LRB), Line Fill Buffers (LFB), Store Buffers (STB),
 *  and Eviction Buffers (EB) are empty.
 */
Void Cache_sync()
{
    if (Cache_module->pl310RTLRelease == PL310_RTL_RELEASE_r3p0) {
        /*
         * This is a workaround proposed by ARM to make sync
         * operation work correctly.
         *
         * ARM suggests to use an unmapped PL310 register at 0x740 offset.
         *
         * Note: This bug has been fixed in PL310 RTL Release r3p1 and
         *       is present only in RTL Release r3p0.
         *
         * (see PL310 Errata 753970)
         */
        Cache_l2ControllerRegs.hole3[4] = 0x0;
    }
    else {
        Cache_l2ControllerRegs.CACHESYNC = 0x0;
    }

    /* Wait for Sync operation to complete */
    while (Cache_l2ControllerRegs.CACHESYNC & 0x1);
}

/*
 *  ======== Cache_l2InterruptHandler ========
 */
Void Cache_l2InterruptHandler(UArg arg)
{
    UInt32 intMaskStatus = Cache_l2ControllerRegs.INTMASKSTATUS;

    /* Update ROV error status view */
    Cache_module->l2ErrorStatus |= intMaskStatus;

    /* Clear interrupt */
    Cache_l2ControllerRegs.INTCLEAR = intMaskStatus;

    if (Cache_l2InterruptFunc) {
        /* Call interrupt function */
        Cache_l2InterruptFunc(intMaskStatus);
    }
}

/*
 *  ======== Cache_enableL2EventCounters ========
 *  Enables the L2 Cache event counters
 */
Void Cache_enableL2EventCounters()
{
    /* Enable event counter */
    Cache_l2ControllerRegs.EVCOUNTERCTRL = 0x1;
}

/*
 *  ======== Cache_disableL2EventCounters ========
 *  Disables the L2 Cache event counters
 */
Void Cache_disableL2EventCounters()
{
    /* Disable event counter */
    Cache_l2ControllerRegs.EVCOUNTERCTRL = 0x0;
}

/*
 *  ======== Cache_resetL2EventCounter ========
 *  Reset the specified L2 Cache event counter
 */
Void Cache_resetL2EventCounter(UInt counterId)
{
    UInt oldState;

    Assert_isTrue(((counterId == 0) || (counterId == 1)),
            Cache_A_invalidL2CounterId);

    /* Disable event counter if enabled */
    if ((oldState = Cache_l2ControllerRegs.EVCOUNTERCTRL) & 0x1) {
        Cache_l2ControllerRegs.EVCOUNTERCTRL = 0x0;
    }

    /* Reset specified event counter */
    Cache_l2ControllerRegs.EVCOUNTERCTRL = (0x2 << counterId);

    /* Re-enable event counter if previously enabled */
    if (oldState) {
        Cache_l2ControllerRegs.EVCOUNTERCTRL = 0x1;
    }
}

/*
 *  ======== Cache_configureL2EventCounter ========
 *  Sets the event source and interrupt generation type for the specified
 *  L2 Cache event counter
 *
 *  Algorithm:
 *  1) Disable event counter if already enabled.
 *  2) Set event source and interrupt generation type.
 *  3) Re-enable event counter if previously enabled.
 */
Void Cache_configureL2EventCounter(UInt counterId, Cache_L2EventSource eventSource,
        Cache_L2CounterIntType interruptType)
{
    UInt oldState;

    Assert_isTrue(((counterId == 0) || (counterId == 1)),
            Cache_A_invalidL2CounterId);

    /* Disable event counter if enabled */
    if ((oldState = Cache_l2ControllerRegs.EVCOUNTERCTRL) & 0x1) {
        Cache_l2ControllerRegs.EVCOUNTERCTRL = 0x0;
    }

    /* Set counter event source */
    if (counterId) {
        Cache_l2ControllerRegs.EVCOUNTER1CFG = (eventSource | interruptType);
    }
    else {
        Cache_l2ControllerRegs.EVCOUNTER0CFG = (eventSource | interruptType);
    }

    /* Re-enable event counter if previously enabled */
    if (oldState) {
        Cache_l2ControllerRegs.EVCOUNTERCTRL = 0x1;
    }
}

/*
 *  ======== Cache_getL2EventCount ========
 *  Return L2 cache event counter register value.
 */
UInt32 Cache_getL2EventCount(UInt counterId)
{
    Assert_isTrue(((counterId == 0) || (counterId == 1)),
            Cache_A_invalidL2CounterId);

    if (counterId) {
        return (Cache_l2ControllerRegs.EVCOUNTER1);
    }
    else {
        return (Cache_l2ControllerRegs.EVCOUNTER0);
    }
}

/*
 *  ======== Cache_enableL1Prefetch ========
 *  Enable L1 data prefetching
 */
Void Cache_enableL1Prefetch()
{
    if (Cache_isOMAP4) {
        Assert_isTrue(0, Cache_A_l1PrefetchApiNotSupported);
    }
    else {
        Cache_setL1Prefetch(0x1);
    }
}

/*
 *  ======== Cache_disableL1Prefetch ========
 *  Disable L1 data prefetching
 */
Void Cache_disableL1Prefetch()
{
    if (Cache_isOMAP4) {
        Assert_isTrue(0, Cache_A_l1PrefetchApiNotSupported);
    }
    else {
        Cache_setL1Prefetch(0x0);
    }
}

/*
 *  ======== Cache_getL2PrefetchControl ========
 *  Get current L2 prefetch control register contents
 */
Bits32 Cache_getL2PrefetchControl()
{
    return (Bits32)(Cache_l2ControllerRegs.PREFETCHCTRL);
}
