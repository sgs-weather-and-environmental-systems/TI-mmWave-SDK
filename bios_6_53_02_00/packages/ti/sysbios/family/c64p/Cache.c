/*
 * Copyright (c) 2014-2016, Texas Instruments Incorporated
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
#include <ti/sysbios/family/c64p/Hwi.h>
#include "package/internal/Cache.xdc.h"

#define L2CFG    (volatile UInt32 *)0x01840000
#define L1PCFG   (volatile UInt32 *)0x01840020
#define L1PCC    (volatile UInt32 *)0x01840024
#define L1DCFG   (volatile UInt32 *)0x01840040
#define L1DCC    (volatile UInt32 *)0x01840044
#define L2WBAR   (volatile UInt32 *)0x01844000
#define L2WWC    (volatile UInt32 *)0x01844004
#define L2WIBAR  (volatile UInt32 *)0x01844010
#define L2IBAR   (volatile UInt32 *)0x01844018
#define L2WB     (volatile UInt32 *)0x01845000
#define L2WBINV  (volatile UInt32 *)0x01845004
#define L1PINV   (volatile UInt32 *)0x01845028
#define L1DWB    (volatile UInt32 *)0x01845040
#define L1DWBINV (volatile UInt32 *)0x01845044
#define MAR      (volatile UInt32 *)0x01848000

#define L2CFG_L2CC_MASK         0x00000018      /* L2 CC mask */
#define L2CFG_L2CC_ENABLE       0x00000000      /* L2 CC enable mode */
#define L2CFG_L2CC_FREEZE       0x00000008      /* L2 CC freeze mode */
#define L2CFG_L2CC_BYPASS       0x00000010      /* L2 CC bypass mode */
#define L2CFG_MODE_MASK         0x00000007      /* L2 Mode mask */
#define L1PCC_OPER_MASK         0x00000007      /* L1P OPER mask */
#define L1PCC_OPER_FREEZE       0x00000001      /* L1P OPER freeze */
#define L1PCC_OPER_NORMAL       0x00000000      /* L1P OPER normal */
#define L1PCC_POPER_MASK        0x00070000      /* L1P POPER mask */
#define L1PCC_POPER_FREEZE      0x00010000      /* L1P POPER freeze */
#define L1PCC_POPER_NORMAL      0x00000000      /* L1P POPER normal */
#define L1DCC_OPER_MASK         0x00000007      /* L1D OPER mask */
#define L1DCC_OPER_FREEZE       0x00000001      /* L1D OPER freeze */
#define L1DCC_OPER_NORMAL       0x00000000      /* L1D OPER normal */
#define L1DCC_POPER_MASK        0x00070000      /* L1D POPER mask */
#define L1DCC_POPER_FREEZE      0x00010000      /* L1D POPER freeze */
#define L1DCC_POPER_NORMAL      0x00000000      /* L1D POPER normal */

#define MAXWC    0xFF00      /* Max word count per cache operations */

#define MAR16        0x10
#define MAR32        0x20
#define MAR64        0x40
#define MAR96        0x60
#define MAR128       0x80
#define MAR160       0xA0
#define MAR192       0xC0
#define MAR224       0xE0

/*
 *  ======== emifRange ========
 *  If addr within range of 'base' and 'base + length - 1' then return TRUE,
 *  otherwise return FALSE.
 */
static inline Bool emifRange(UInt32 addr, UInt32 base, UInt32 length)
{
    if (base != 0) {
        return (addr >= base) && (addr <= (base + length - 1));
    }
    else {
        return FALSE;
    }
}

/*
 *  ======== getEmifCtrlAddr ========
 *  Return the EMIF configuratin control register for the address.
 */
static inline volatile UInt32 *getEmifCtrlAddr(UInt32 addr)
{
    if (emifRange(addr, Cache_EMIFA_BASE, Cache_EMIFA_LENGTH)) {
        return (UInt32 *)Cache_EMIFA_CFG;
    }
    else if (emifRange(addr, Cache_EMIFB_BASE, Cache_EMIFB_LENGTH)) {
        return (UInt32 *)Cache_EMIFB_CFG;
    }
    else if (emifRange(addr, Cache_EMIFC_BASE, Cache_EMIFC_LENGTH)) {
        return (UInt32 *)Cache_EMIFC_CFG;
    }
    else {
        return NULL;
    }
}

/*
 *  ======== mapL1dOper ========
 *  Maps the L1D cache mode Oper field to one of the values of Cache_Mode
 */
static inline Cache_Mode mapL1dOper(UInt mode)
{
    if (mode == L1DCC_OPER_FREEZE) {
        return Cache_Mode_FREEZE;
    }
    else {
        return Cache_Mode_NORMAL;
    }
}

/*
 *  ======== mapL1dPoper ========
 *  Maps the L1D cache mode Poper field to one of the values of Cache_Mode
 */
static inline Cache_Mode mapL1dPoper(UInt mode)
{
    if (mode == L1DCC_POPER_FREEZE) {
        return Cache_Mode_FREEZE;
    }
    else {
        return Cache_Mode_NORMAL;
    }
}

/*
 *  ======== mapL1pOper ========
 *  Maps the L1P cache mode Oper field to one of the values of Cache_Mode
 */
static inline Cache_Mode mapL1pOper(UInt mode)
{
    if (mode == L1PCC_OPER_FREEZE) {
        return Cache_Mode_FREEZE;
    }
    else {
        return Cache_Mode_NORMAL;
    }
}

/*
 *  ======== mapL1pPoper ========
 *  Maps the L1P cache mode Poper field to one of the values of Cache_Mode
 */
static inline Cache_Mode mapL1pPoper(UInt mode)
{
    if (mode == L1PCC_POPER_FREEZE) {
        return Cache_Mode_FREEZE;
    }
    else {
        return Cache_Mode_NORMAL;
    }
}

/*
 *  ======== mapL2Mode ========
 *  Maps the L2 cache mode to one of the values of Cache_Mode
 */
static inline Cache_Mode mapL2Mode(UInt mode)
{
    if (mode == L2CFG_L2CC_FREEZE) {
        return Cache_Mode_FREEZE;
    }
    else if (mode == L2CFG_L2CC_ENABLE) {
        return Cache_Mode_NORMAL;
    }
    else {
        return Cache_Mode_BYPASS;
    }
}

/*
 *  ======== Cache_all ========
 */
Void Cache_all(volatile UInt32 *cacheReg)
{
    UInt mask;

    /* disable interrupts */
    mask = Hwi_disable();

    /* wait for any previous cache operation to complete */
    while (*L2WWC != 0) {
        /* open a window for interrupts */
        Hwi_restore(mask);

        /* disable interrupts */
        mask = Hwi_disable();
    }

    /* perform global write back of cache */
    *cacheReg = 1;

    /* restore interrupts */
    Hwi_restore(mask);

    /* wait until cache operation completes */
    while (*cacheReg) {
        ;
    }
}

/*
 *  ======== Cache_block ========
 *  This internal function used by the block cache APIs.
 */
Void Cache_block(Ptr blockPtr, SizeT byteCnt, Bool wait,
    volatile UInt32 *barReg)
{
    volatile UInt32 *bar;
    volatile UInt32 *wc;
    Int wordCnt;
    UInt mask;
    UInt32 alignAddr;

    /*
     *  Get the base address and word count register.
     *  wc is one word after bar on c64x+ cache.
     */
    bar = barReg;
    wc = bar + 1;

    /* word align the base address */
    alignAddr = ((UInt32)blockPtr & ~3);

    /* convert from byte to word since cache operation takes words */
    wordCnt = (byteCnt + 3 + ((UInt32)blockPtr - alignAddr)) >> 2;

    /* loop until word count is zero or less */
    while (wordCnt > 0) {

        /* critical section -- disable interrupts */
        mask = Hwi_disable();

        /* wait for any previous cache operation to complete */
        while (*L2WWC != 0) {
            /* open a window for interrupts */
            Hwi_restore(mask);

            /* disable interrupts */
            mask = Hwi_disable();
        }

        /* get the emif config for the address */
        Cache_module->emifAddr = getEmifCtrlAddr(alignAddr);

        /* set the word address and number of words to invalidate */
        *bar = alignAddr;
        *wc = (wordCnt > MAXWC) ? MAXWC : wordCnt;

        /* end of critical section -- restore interrupts */
        Hwi_restore(mask);

        /*
         * reduce word count by _BCACHE_MAXWC and
         * increase base address by BCACHE_MAXWC
         */
        wordCnt -= MAXWC;
        alignAddr += (MAXWC * sizeof(Int));
    }

    /* wait for cache operation to complete */
    if (wait) {
        Cache_wait();
    }
}

/*
 *  ======== Cache_marInit ========
 *  This function initializes the MAR registers
 */
Void Cache_marInit(UInt32 mask, UInt32 index)
{
    Int         i;
    Int         count = 32;
    UInt32      addr = index;
    UInt32      block;

    /*
     * MARs 0-15 are reserved and should not be written.
     * Therefore, only 16 MAR registers are written for the first set.
     * 32 registers are written for every set after the first.
     */
    if (index == MAR16) {
        count = 16;
        mask >>= 16;
    }

    for (i = 0; i < count; i++) {
        block = addr << 24;
        Cache_setMar((Ptr)block, 0x1, (Cache_Mar)(mask & 0x1));
        addr = addr + 1;
        mask >>= 1;
    }
}

/*
 *  ======== Cache_Module_startup ========
 *  Sets the default cache size and MAR register values.
 */
Int Cache_Module_startup(Int phase)
{
    Cache_Size cacheSize;

    Cache_module->emifAddr = NULL;

    Cache_getL1DInitSize(&cacheSize);
    Cache_getL1PInitSize(&cacheSize);
    Cache_getL2InitSize(&cacheSize);
    Cache_setSize(&cacheSize);

    Cache_marInit(Cache_MAR0_31, MAR16);
    Cache_marInit(Cache_MAR32_63, MAR32);
    Cache_marInit(Cache_MAR64_95, MAR64);
    Cache_marInit(Cache_MAR96_127, MAR96);
    Cache_marInit(Cache_MAR128_159, MAR128);
    Cache_marInit(Cache_MAR160_191, MAR160);
    Cache_marInit(Cache_MAR192_223, MAR192);
    Cache_marInit(Cache_MAR224_255, MAR224);

    return Startup_DONE;
}

/*
 *  ======== Cache_enable ========
 *  For L1P and L1D, set the size to the Cache init size.
 *  For L2, set the cache mode to NORMAL.
 */
Void Cache_enable(Bits16 type)
{
    Cache_Size size;

    Cache_getSize(&size);

    if (type & Cache_Type_L1P) {
        Cache_getL1PInitSize(&size);
        Cache_setSize(&size);
    }

    if (type & Cache_Type_L1D) {
        Cache_getL1DInitSize(&size);
        Cache_setSize(&size);
    }

    if (type & Cache_Type_L2) {
        Cache_setMode(Cache_Type_L2, Cache_Mode_NORMAL);
    }
}

/*
 *  ======== Cache_disable ========
 *  For L1P and L1D set the size to 0.
 *  This API should not be called to disable L2 Cache.
 *  To disable L2 use Cache_setSize() and/or Cache_setMar().
 */
Void Cache_disable(Bits16 type)
{
    Cache_Size size;

    /* Only L1 is supported, reject any other type */
    Assert_isTrue((type & ~Cache_Type_L1) == 0, NULL);

    Cache_getSize(&size);

    if (type & Cache_Type_L1P) {
        size.l1pSize = Cache_L1Size_0K;
        Cache_setSize(&size);
    }

    if (type & Cache_Type_L1D) {
        size.l1dSize = Cache_L1Size_0K;
        Cache_setSize(&size);
    }
}

/*
 *  ======== Cache_getMode ========
 *  Returns the current cache operating mode for the specified cache.
 */
Cache_Mode Cache_getMode(Bits16 type)
{
    UInt mode;

    /* determine which cache to get the mode */
    if (type == Cache_Type_L1P) {
        /* case of L1P cache */
        mode = *L1PCC & L1PCC_OPER_MASK;
        return mapL1pOper(mode);
    }
    else if (type == Cache_Type_L1D) {
        /* case of L1D cache */
        mode = *L1DCC & L1DCC_OPER_MASK;
        return mapL1dOper(mode);
    }
    else {
        /* case of L2 cache */
        mode = *L2CFG & L2CFG_L2CC_MASK;
        return mapL2Mode(mode);
    }
}

/*
 *  ======== Cache_setMode ========
 *  Set either L1D, L1P, or L2 cache operating mode depending on the argument
 *  that was passed in.
 */
Cache_Mode Cache_setMode(Bits16 type, Cache_Mode mode)
{
    UInt        mask;
    UInt prevmode;
    Cache_Mode returnVal;
    UInt regVal;

    /* critical section -- disable interrupts */
    mask = Hwi_disable();

    /* determine which mode we want to set */
    if (type == Cache_Type_L1P) {
        /*
         * case we want to set L1P cache
         */
        if (mode == Cache_Mode_NORMAL) {
            *L1PCC = L1PCC_OPER_NORMAL;
        }
        else if (mode == Cache_Mode_FREEZE) {
            *L1PCC = L1PCC_OPER_FREEZE;
        }
        prevmode = *L1PCC & L1PCC_POPER_MASK,

        returnVal = mapL1pPoper(prevmode);
    }
    else if (type == Cache_Type_L1D) {
        /*
         * case we want to set L1D cache
         */
        if (mode == Cache_Mode_NORMAL) {
            *L1DCC = L1DCC_OPER_NORMAL;
        }
        else if (mode == Cache_Mode_FREEZE) {
            /*
             *  there should be no data accesses two cycles prior to changing
             *  L1D cache to freeze to work around silicon issue.
             *  GEM_arch.bts_dmc.26
             */
            asm("       nop 2");
            *L1DCC = L1DCC_OPER_FREEZE;
        }
        prevmode = *L1DCC & L1DCC_POPER_MASK,

        returnVal = mapL1dPoper(prevmode);
    }
    else {
        /*
         * case we want to set L2 cache
         */
        regVal = *L2CFG;
        prevmode = regVal & L2CFG_L2CC_MASK;
        if (mode == Cache_Mode_NORMAL) {
            *L2CFG = (regVal & ~L2CFG_L2CC_MASK) |
                (L2CFG_L2CC_ENABLE);
        }
        else if (mode == Cache_Mode_FREEZE) {
            *L2CFG = (regVal & ~L2CFG_L2CC_MASK) |
                (L2CFG_L2CC_FREEZE);
        }
        else if (mode == Cache_Mode_BYPASS) {
            /* Not allowed to set Cache to BYPASS mode in latest specs */
            Assert_isTrue(FALSE, NULL);
        }
        regVal = *L2CFG;

        returnVal = mapL2Mode(prevmode);
    }

    /* end of critical section -- restore interrupts */
    Hwi_restore(mask);

    /* return previous mode of the cache that was modified */
    return (returnVal);
}

/*
 *  ======== Cache_setSize ========
 *  Set the L1D, L1P, and L2 cache sizes
 */
Void Cache_setSize(Cache_Size *size)
{
    UInt        mask;

    /* critical section -- disable interrupts */
    mask = Hwi_disable();

    /*
     *  Set size of L2 cache.
     *  Read back CFG, this stalls CPU until the mode change completes.
     */
    *L2CFG = size->l2Size;
    *L2CFG;

    /*
     *  Set size of L1D cache.
     *  Set size of L1P cache.
     *  Read back CFG, this stalls CPU until the mode change completes.
     */
    *L1DCFG = size->l1dSize;
    *L1PCFG = size->l1pSize;
    *L1DCFG;
    *L1PCFG;

    /* end of critical section -- restore interrupts */
    Hwi_restore(mask);
}

/*
 *  ======== Cache_getSize ========
 *  Returns the L1D, L1P, and L2 cache sizes.
 *  If value of L2 size is greater than Cache_L2_256K then return
 *  Cache_L2_256K.
 *  If value of L1 size is greater than Cache_L1_32K then return
 *  Cache_L1_32K.
 */
Void Cache_getSize(Cache_Size *size)
{
    UInt        tmpSize;

    /*
     *  Read the L2 CFG register
     *  Its possible the register value is greater than 4 in which case
     *  we simply return 4 since values greater than 4 is equivalent to 4.
     */
    tmpSize = *L2CFG & L2CFG_MODE_MASK;
    if (tmpSize > Cache_L2Size_256K) {
        tmpSize = Cache_L2Size_256K;
    }
    size->l2Size = (Cache_L2Size)tmpSize;

    /*
     *  Read the L1D register
     *  Its possible the register value is greater than 4 in which case
     *  we simply return 4 since values greater than 4 is equivalent to 4.
     */
    tmpSize = *L1DCFG;
    if (tmpSize > Cache_L1Size_32K) {
        tmpSize = Cache_L1Size_32K;
    }
    size->l1dSize = (Cache_L1Size)tmpSize;

    /*
     *  Read the L1P register
     *  Its possible the register value is greater than 4 in which case
     *  we simply return 4 since values greater than 4 is equivalent to 4.
     */
    tmpSize = *L1PCFG;
    if (tmpSize > Cache_L1Size_32K) {
        tmpSize = Cache_L1Size_32K;
    }
    size->l1pSize = (Cache_L1Size)tmpSize;
}

/*
 *  ======== Cache_getMar ========
 *  Get the value of the MAR register defined for the specified base address
 */
Cache_Mar Cache_getMar(Ptr baseAddr)
{
    UInt marNum;
    volatile UInt32 *marBase = MAR;

    /*
     *  the MAR register number can be obtained by right shifting the
     *  base address by 24 bits. (The upper 8 bits correspond to the MAR number)
     */
    marNum = (UInt32)baseAddr >> 24;

    /* return the value of the MAR register which amounts to a 0 or 1 */
    return ((Cache_Mar)(marBase[marNum]));
}

/*
 *  ======== Cache_setMar ========
 *  Set the MAR register(s) that corresponds to the specified address range.
 */
Void Cache_setMar(Ptr baseAddr, SizeT byteSize, Cache_Mar value)
{
    UInt32 maxAddr;
    UInt32 firstMar, lastMar;
    UInt32 marNum;
    volatile UInt32 *marBase = MAR;

    /* caculate the maximum address */
    maxAddr = (UInt32)baseAddr + byteSize - 1;

    /* range of MAR's that need to be modified */
    firstMar = (UInt32)baseAddr >> 24;
    lastMar = (UInt32)maxAddr >> 24;

    /* loop through the number of MAR registers affecting the address range */
    for (marNum = firstMar; marNum <= lastMar; marNum++) {
        /* set the MAR registers to the specified value */
        marBase[marNum] = value;
        asm("   NOP");                  /* necessary to work around bug */
    }

    /* issue a dummy read to ensure all writes completed */
    marBase[firstMar];
}

/*
 *  ======== Cache_invL1pAll ========
 *  Performs a global invalidate of L1P cache.
 *  Polls the L1P invalidate register until done.
 */
Void Cache_invL1pAll()
{
    Cache_all(L1PINV);
}

/*
 *  ======== Cache_wbAll ========
 *  Perform a global write back.  There is no effect on L1P cache.  All cache
 *  lines are left valid in L1D cache and the data in L1D cache is written
 *  back L2 or external.  All cache lines are left valid in L2 cache and the
 *  data in L2 cache is written back to external.
 */
Void Cache_wbAll()
{
    Cache_all(L2WB);
}

/*
 *  ======== Cache_wbL1dAll ========
 *  Performs a global write back of only L1D cache.
 */
Void Cache_wbL1dAll()
{
    Cache_all(L1DWB);
}

/*
 *  ======== Cache_wbInvAll ========
 *  Performs a global write back and invalidate.  All cache lines are
 *  invalidated in L1P cache.  All cache lines are written back to L2 or
 *  or external then invalidated in L1D cache.  All cache lines are
 *  written back to external and then invalidated in L2 cache.
 */
Void Cache_wbInvAll()
{
    Cache_all(L2WBINV);
}

/*
 *  ======== Cache_wbInvL1dAll ========
 *  Performs a global write back then invalidate of L1D cache 
 */
Void Cache_wbInvL1dAll()
{
    Cache_all(L1DWBINV);
}

/*
 *  ======== Cache_inv ========
 *  Invalidate the range of memory within the specified starting address and
 *  byte count.  The range of addresses operated on gets quantized to whole
 *  cache lines in each cache.  All cache lines in range are invalidated in L1P
 *  cache.  All cache lines in range are invalidated in L1D cache.
 *  All cache lines in range are invaliated in L2 cache.
 */
Void Cache_inv(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait)
{
    Cache_block(blockPtr, byteCnt, wait, L2IBAR);
}

/*
 *  ======== Cache_wb ========
 *  Writes back the range of memory within the specified starting address
 *  and byte count.  The range of addresses operated on gets quantized to
 *  whole cache lines in each cache.  There is no effect on L1P cache.
 *  All cache lines within the range are left valid in L1D cache and the data
 *  within the range in L1D cache will be written back to L2 or external.
 *  All cache lines within the range are left valid in L2 cache and the data
 *  within the range in L2 cache will be written back to external.
 */
Void Cache_wb(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait)
{
    Cache_block(blockPtr, byteCnt, wait, L2WBAR);
}

/*
 *  ======== Cache_wbInv ========
 *  Writes back and invalidates the range of memory within the specified
 *  starting address and byte count.  The range of addresses operated on gets
 *  quantized to whole cache lines in each cache.  All cache lines within range
 *  are invalidated in L1P cache.  All cache lines within the range are
 *  written back to L2 or external and then invalidated in L1D cache
 *  All cache lines within the range are written back to external and then
 *  invalidated in L2 cache.
 */
Void Cache_wbInv(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait)
{
    Cache_block(blockPtr, byteCnt, wait, L2WIBAR);
}

/*
 *  ======== Cache_wait ========
 *  Wait for the L2 count to complete.  This function needs only to wait
 *  for L2 word count since all block cache operations in BIOS are done
 *  through the L2 registers and all global cache operations must already
 *  wait until the operation completes.  Note:  Its sufficient to wait
 *  on one of the L2 count registers since all 3 count registers are
 *  mirrors of one another and map to the same bits.
 */
Void Cache_wait()
{
    UInt mask;

    /* wait for L2 word count to be zero */
    while (*L2WWC != 0) {
        ;
    }

    /*
     *  make a dummy write and read to emif config register to
     *  insure that data made it out to external memory, otherwise
     *  its possible that the data is out of the Master's view but
     *  has not reached its final destination.
     */
    mask = Hwi_disable();
    if (Cache_module->emifAddr != NULL) {
        *(Cache_module->emifAddr) = 0;
        *(Cache_module->emifAddr);
        Cache_module->emifAddr = NULL;
    }
    Hwi_restore(mask);
}

/*
 *  ======== Cache_getL1DInitSize ========
 */
Void Cache_getL1DInitSize(Cache_Size *cacheSize)
{
    __extern __FAR__ UInt32 ti_sysbios_family_c64p_Cache_l1dSize;

    /*
     *  Copy cache size extern to local variable instead of using
     *  it directly in switch expression in order to avoid compiler
     *  warning.
     */
    UInt32 l1dSize = (UInt32)&ti_sysbios_family_c64p_Cache_l1dSize;

    switch (l1dSize) {
        case 0:
            cacheSize->l1dSize = Cache_L1Size_0K;
            break;
        case (4*1024):
            cacheSize->l1dSize = Cache_L1Size_4K;
            break;
        case (8*1024):
            cacheSize->l1dSize = Cache_L1Size_8K;
            break;
        case (16*1024):
            cacheSize->l1dSize = Cache_L1Size_16K;
            break;
        case (32*1024):
            cacheSize->l1dSize = Cache_L1Size_32K;
            break;
        default:
            Error_raise(NULL, Cache_E_invalidL1CacheSize, l1dSize, 0);
    }
}

/*
 *  ======== Cache_getL1PInitSize ========
 */
Void Cache_getL1PInitSize(Cache_Size *cacheSize)
{
    __extern __FAR__ UInt32 ti_sysbios_family_c64p_Cache_l1pSize;

    /*
     *  Copy cache size extern to local variable instead of using
     *  it directly in switch expression in order to avoid compiler
     *  warning.
     */
    UInt32 l1pSize = (UInt32)&ti_sysbios_family_c64p_Cache_l1pSize;

    switch (l1pSize) {
        case 0:
            cacheSize->l1pSize = Cache_L1Size_0K;
            break;
        case (4*1024):
            cacheSize->l1pSize = Cache_L1Size_4K;
            break;
        case (8*1024):
            cacheSize->l1pSize = Cache_L1Size_8K;
            break;
        case (16*1024):
            cacheSize->l1pSize = Cache_L1Size_16K;
            break;
        case (32*1024):
            cacheSize->l1pSize = Cache_L1Size_32K;
            break;
        default:
            Error_raise(NULL, Cache_E_invalidL1CacheSize, l1pSize, 0);
    }
}

/*
 *  ======== Cache_getL2InitSize ========
 */
Void Cache_getL2InitSize(Cache_Size *cacheSize)
{
    __extern __FAR__ UInt32 ti_sysbios_family_c64p_Cache_l2Size;

    /*
     *  Copy cache size extern to local variable instead of using
     *  it directly in switch expression in order to avoid compiler
     *  warning.
     */
    UInt32 l2Size = (UInt32)&ti_sysbios_family_c64p_Cache_l2Size;

    switch (l2Size) {
        case 0:
            cacheSize->l2Size = Cache_L2Size_0K;
            break;
        case (32*1024):
            cacheSize->l2Size = Cache_L2Size_32K;
            break;
        case (64*1024):
            cacheSize->l2Size = Cache_L2Size_64K;
            break;
        case (128*1024):
            cacheSize->l2Size = Cache_L2Size_128K;
            break;
        case (256*1024):
            cacheSize->l2Size = Cache_L2Size_256K;
            break;
        case (512*1024):
            cacheSize->l2Size = Cache_L2Size_512K;
            break;
        case (1024*1024):
            cacheSize->l2Size = Cache_L2Size_1024K;
            break;
        default:
            Error_raise(NULL, Cache_E_invalidL2CacheSize, l2Size, 0);
    }
}
