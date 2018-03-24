/*
 * Copyright (c) 2013, Texas Instruments Incorporated
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
#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Startup.h>
#include <ti/sysbios/hal/Hwi.h>
#include "package/internal/Cache.xdc.h"

#define L1P_INV         (volatile UInt32 *)0x40080040
#define L1P_INVBAR      (volatile UInt32 *)0x40080050
#define L1P_INVBC       (volatile UInt32 *)0x40080054
#define L1P_INVSAR      (volatile UInt32 *)0x40080058
#define L1P_INVSAR_DONE (volatile UInt32 *)0x4008005C
#define L1P_PREBAR      (volatile UInt32 *)0x40080060
#define L1P_PREBC       (volatile UInt32 *)0x40080064

#define MAXBC    0x8000      /* Max byte count per cache operations */

/*
 *  ======== Cache_block ========
 *  This internal function is used by the block cache APIs.
 */
Void Cache_block(Ptr blockPtr, SizeT byteCnt, Bool wait,
    volatile UInt32 *barReg, volatile UInt32 *countReg)
{
    volatile UInt32 *bar = barReg;
    volatile UInt32 *bc = countReg;
    UInt mask;
    UInt32 lastAddr;

    /* calculate the last address */
    lastAddr = ((UInt32)blockPtr + byteCnt);

    /* loop until address is larger than last address */
    while (lastAddr > (UInt32)blockPtr) {

        /* critical section -- disable interrupts */
        mask = Hwi_disable();

        /* wait for any previous cache operation to complete */
        while (*bc != 0) {
            /* open a window for interrupts */
            Hwi_restore(mask);

            /* disable interrupts */
            mask = Hwi_disable();
        }

        /* set the address and number of words to invalidate */
        *bar = (UInt32)blockPtr;
        *bc = (byteCnt > MAXBC) ? MAXBC : byteCnt;

        /* end of critical section -- restore interrupts */
        Hwi_restore(mask);

        /*
         * reduce byte count by _BCACHE_MAXBC and
         * increase base address by BCACHE_MAXWC
         */
        byteCnt -= MAXBC;
        blockPtr = (Ptr)((UInt32)blockPtr + MAXBC);
    }

    if (wait) {
        while (*bc != 0) {
        }
    }
}

/*
 *  ======== Cache_enable ========
 */
Void Cache_enable(Bits16 type)
{
}

/*
 *  ======== Cache_disable ========
 */
Void Cache_disable(Bits16 type)
{
}

/*
 *  ======== Cache_preloadL1p ========
 */
Void Cache_preloadL1p(Ptr blockPtr, SizeT byteCnt)
{
    UInt32 value;
    volatile UInt32 *preBar = L1P_PREBAR;
    volatile UInt32 *preCount = L1P_PREBC;

    /* check to make sure the byte count is not larger than 32K */
    Assert_isTrue(byteCnt <= MAXBC,
                  Cache_A_byteCountTooLarge);

    *preBar = (UInt32)blockPtr;
    *preCount = byteCnt;

    do {
        value = *preCount;
    } while (value != 0x0);
}

/*
 *  ======== Cache_invL1pAll ========
 *  Performs a global invalidate of L1P cache.
 */
Void Cache_invL1pAll()
{
    volatile UInt32 *l1pInv = L1P_INV;

    /* make sure operation is not in progress */
    while (*l1pInv & 1) {
    }

    /* initiate invalidate all command */
    *l1pInv = 0x1;

    /* make sure operation completes before proceeding */
    while (*l1pInv & 1) {
    }
}

/*
 *  ======== Cache_wbAll ========
 */
Void Cache_wbAll()
{
}

/*
 *  ======== Cache_wbInvAll ========
 */
Void Cache_wbInvAll()
{
}

/*
 *  ======== Cache_inv ========
 */
Void Cache_inv(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait)
{
    if (type & Cache_Type_L1P) {
        /* currently supports only L1 Program cache invalidate */
        Cache_block(blockPtr, byteCnt, wait, L1P_INVBAR, L1P_INVBC);
    }
}

/*
 *  ======== Cache_invL1pSingleAddr ========
 */
Void Cache_invL1pSingleAddr(Ptr blockPtr)
{
    volatile UInt32 *l1pInvSar = L1P_INVSAR;
    volatile UInt32 *l1pInvSarDone = L1P_INVSAR_DONE;

    /* wait while done is not 1 */
    while ((*l1pInvSarDone & 1) != 1) {
    }

    /* initiate invalidate of single address */
    *l1pInvSar = (UInt32)(blockPtr);
}

/*
 *  ======== Cache_wb ========
 */
Void Cache_wb(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait)
{
}

/*
 *  ======== Cache_wbInv ========
 */
Void Cache_wbInv(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait)
{
}

/*
 *  ======== Cache_wait ========
 */
Void Cache_wait()
{
}



