/*
 * Copyright (c) 2014, Texas Instruments Incorporated
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

#include <xdc/runtime/Error.h>
#include <xdc/runtime/Gate.h>
#include <xdc/runtime/Startup.h>
#include <xdc/runtime/System.h>

#include <ti/sysbios/hal/Hwi.h>
#include <ti/sysbios/hal/ammu/AMMU.h>

#include "package/internal/Cache.xdc.h"

#define LINE_SIZE               32
#define LINE_ADDRESS_MASK       0xffffffe0

/*
 *  ======== Cache_startup ========
 */
Void Cache_startup()
{
    if (AMMU_configureAmmu) {
        AMMU_init();
    }

    if (Cache_configureCache) {

        /* if cache is already enabled, return */
        if (Cache_cache.L1_CONFIG & 0x2) {
            return;
        }

        Cache_cache.L1_CONFIG = Cache_l1secConfig;
        Cache_cache.L1_OCP = Cache_l1ocpConfig;

        if (Cache_l2CacheSupported) {
            Cache_cache.L2_CONFIG = Cache_l2secConfig;
            Cache_cache.L2_OCP = Cache_l2ocpConfig;
        }

        /*
         *  Invalidate all caches
         *
         *  Call internal version of invAll that does not lock/seize
         *  cache regs. This is ok since interrupts are disabled at
         *  this point and this is the only thread running. We cannot
         *  call Cache_seizeRegs() since data section has not been
         *  initialized yet.
         */

        /* Make sure any previous job is finished */
        while ((Cache_cache.L1_MAINT & 0x1f) ||
               (Cache_l2CacheSupported &&
               (Cache_cache.L2_MAINT & 0x1f))) {
            ;
        }

        Cache_invAllI();

        if (Cache_enableCache == TRUE) {
            Cache_enable(Cache_Type_ALL);
        }
    }
}

/*
 *  ======== Cache_enable ========
 */
Void Cache_enable(Bits16 type)
{
    if (type & Cache_Type_L1) {
        Cache_cache.L1_CONFIG |= 0x2; /* NORMAL MODE */
        Cache_cache.L1_CONFIG;          /* complete posted write */
    }
    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        Cache_cache.L2_CONFIG |= 0x2; /* NORMAL MODE */
        Cache_cache.L2_CONFIG;          /* complete posted write */ 
    }
}

/*
 *  ======== Cache_disable ========
 */
Void Cache_disable(Bits16 type)
{
    if (type & Cache_Type_L1) {
        Cache_cache.L1_CONFIG &= ~0x2;  /* Bypass MODE */
        Cache_cache.L1_CONFIG;          /* complete posted write */
    }
    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        Cache_cache.L2_CONFIG &= ~0x2;  /* Bypass MODE */
        Cache_cache.L2_CONFIG;          /* complete posted write */ 
    }
}

/*
 *  ======== Cache_inv ========
 */
Void Cache_inv(Ptr blockPtr, size_t byteCnt, Bits16 type, Bool wait)
{
    UInt key;

    key = Cache_seizeRegs();

    if (type & Cache_Type_L1) {
        if (byteCnt <= Cache_maxLineModeBufSize) {
            UChar *linePtr = (UChar *)((UInt32)blockPtr & LINE_ADDRESS_MASK);
            do {
                Cache_cache.L1_MTSTART = linePtr;
                Cache_cache.L1_MTEND = linePtr;
                Cache_cache.L1_MAINT |= 0x10;   /* Invalidate */
                linePtr += LINE_SIZE;
                while (Cache_cache.L1_MAINT & 0x1f) {
                        ;
                }
            } while (linePtr < ((UChar *)blockPtr + byteCnt));
        }
        else {
            Cache_cache.L1_MTSTART = blockPtr;
            Cache_cache.L1_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
            Cache_cache.L1_MAINT |= 0x10;       /* Invalidate */
            if (wait) {
                while (Cache_cache.L1_MAINT & 0x1f) {
                    ;
                }
            }
        }
    }

    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        if (byteCnt <= Cache_maxLineModeBufSize) {
            UChar *linePtr = (UChar *)((UInt32)blockPtr & LINE_ADDRESS_MASK);
            do {
                Cache_cache.L2_MTSTART = linePtr;
                Cache_cache.L2_MTEND = linePtr;
                Cache_cache.L2_MAINT |= 0x10;   /* Invalidate */
                linePtr += LINE_SIZE;
                while (Cache_cache.L2_MAINT & 0x1f) {
                        ;
                }
            } while (linePtr < ((UChar *)blockPtr + byteCnt));
        }
        else {
            Cache_cache.L2_MTSTART = blockPtr;
            Cache_cache.L2_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
            Cache_cache.L2_MAINT |= 0x10;       /* Invalidate */
            if (wait) {
                while (Cache_cache.L2_MAINT & 0x1f) {
                    ;
                }
            }
        }
    }

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_wb ========
 */
Void Cache_wb(Ptr blockPtr, size_t byteCnt, Bits16 type, Bool wait)
{
    UInt key;

    key = Cache_seizeRegs();

    if (type & Cache_Type_L1) {
        if (byteCnt <= Cache_maxLineModeBufSize) {
            UChar *linePtr = (UChar *)((UInt32)blockPtr & LINE_ADDRESS_MASK);
            do {
                Cache_cache.L1_MTSTART = linePtr;
                Cache_cache.L1_MTEND = linePtr;
                Cache_cache.L1_MAINT |= 0x08;   /* Clean */
                linePtr += LINE_SIZE;
                while (Cache_cache.L1_MAINT & 0x1f) {
                        ;
                }
            } while (linePtr < ((UChar *)blockPtr + byteCnt));
        }
        else {
            Cache_cache.L1_MTSTART = blockPtr;
            Cache_cache.L1_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
            Cache_cache.L1_MAINT |= 0x08;       /* Clean */
            if (wait) {
                while (Cache_cache.L1_MAINT & 0x1f) {
                    ;
                }
            }
        }
    }

    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        if (byteCnt <= Cache_maxLineModeBufSize) {
            UChar *linePtr = (UChar *)((UInt32)blockPtr & LINE_ADDRESS_MASK);
            do {
                Cache_cache.L2_MTSTART = linePtr;
                Cache_cache.L2_MTEND = linePtr;
                Cache_cache.L2_MAINT |= 0x08;   /* Clean */
                linePtr += LINE_SIZE;
                while (Cache_cache.L2_MAINT & 0x1f) {
                        ;
                }
            } while (linePtr < ((UChar *)blockPtr + byteCnt));
        }
        else {
            Cache_cache.L2_MTSTART = blockPtr;
            Cache_cache.L2_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
            Cache_cache.L2_MAINT |= 0x08;       /* Clean */
            if (wait) {
                while (Cache_cache.L2_MAINT & 0x1f) {
                    ;
                }
            }
        }
    }

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_wbInv ========
 */
Void Cache_wbInv(Ptr blockPtr, size_t byteCnt, Bits16 type, Bool wait)
{
    UInt key;

    key = Cache_seizeRegs();

    if (type & Cache_Type_L1) {
        if (byteCnt <= Cache_maxLineModeBufSize) {
            UChar *linePtr = (UChar *)((UInt32)blockPtr & LINE_ADDRESS_MASK);
            do {
                Cache_cache.L1_MTSTART = linePtr;
                Cache_cache.L1_MTEND = linePtr;
                Cache_cache.L1_MAINT |= 0x18;   /* Clean + Invalidate */
                linePtr += LINE_SIZE;
                while (Cache_cache.L1_MAINT & 0x1f) {
                        ;
                }
            } while (linePtr < ((UChar *)blockPtr + byteCnt));
        }
        else {
            Cache_cache.L1_MTSTART = blockPtr;
            Cache_cache.L1_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
            Cache_cache.L1_MAINT |= 0x18;       /* Clean + Invalidate */
            if (wait) {
                while (Cache_cache.L1_MAINT & 0x1f) {
                    ;
                }
            }
        }
    }

    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        if (byteCnt <= Cache_maxLineModeBufSize) {
            UChar *linePtr = (UChar *)((UInt32)blockPtr & LINE_ADDRESS_MASK);
            do {
                Cache_cache.L2_MTSTART = linePtr;
                Cache_cache.L2_MTEND = linePtr;
                Cache_cache.L2_MAINT |= 0x18;   /* Clean + Invalidate */
                linePtr += LINE_SIZE;
                while (Cache_cache.L2_MAINT & 0x1f) {
                        ;
                }
            } while (linePtr < ((UChar *)blockPtr + byteCnt));
        }
        else {
            Cache_cache.L2_MTSTART = blockPtr;
            Cache_cache.L2_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
            Cache_cache.L2_MAINT |= 0x18;       /* Clean + Invalidate */
            if (wait) {
                while (Cache_cache.L2_MAINT & 0x1f) {
                    ;
                }
            }
        }
    }

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_lock ========
 */
Void Cache_lock(Ptr blockPtr, size_t byteCnt, Bits16 type, Bool wait)
{
    UInt key;

    key = Cache_seizeRegs();

    if (type & Cache_Type_L1) {
        Cache_cache.L1_MTSTART = blockPtr;
        Cache_cache.L1_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
        Cache_cache.L1_MAINT |= 0x02;   /* Lock */
        if (wait) {
            while (Cache_cache.L1_MAINT & 0x1f) {
                ;
            }
        }
    }

    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        Cache_cache.L2_MTSTART = blockPtr;
        Cache_cache.L2_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
        Cache_cache.L2_MAINT |= 0x02;   /* Lock */
        if (wait) {
            while (Cache_cache.L2_MAINT & 0x1f) {
                ;
            }
        }
    }

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_unlock ========
 */
Void Cache_unlock(Ptr blockPtr, size_t byteCnt, Bits16 type, Bool wait)
{
    UInt key;

    key = Cache_seizeRegs();

    if (type & Cache_Type_L1) {
        Cache_cache.L1_MTSTART = blockPtr;
        Cache_cache.L1_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
        Cache_cache.L1_MAINT |= 0x04;   /* Lock */
        if (wait) {
            while (Cache_cache.L1_MAINT & 0x1f) {
                ;
            }
        }
    }

    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        Cache_cache.L2_MTSTART = blockPtr;
        Cache_cache.L2_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
        Cache_cache.L2_MAINT |= 0x04;   /* Lock */
        if (wait) {
            while (Cache_cache.L2_MAINT & 0x1f) {
                ;
            }
        }
    }

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_preload ========
 */
Void Cache_preload(Ptr blockPtr, size_t byteCnt, Bits16 type, Bool wait)
{
    UInt key;

    key = Cache_seizeRegs();

    if (type & Cache_Type_L1) {
        Cache_cache.L1_MTSTART = blockPtr;
        Cache_cache.L1_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
        Cache_cache.L1_MAINT |= 0x01;   /* preload */
        if (wait) {
            while (Cache_cache.L1_MAINT & 0x1f) {
                ;
            }
        }
    }

    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        Cache_cache.L2_MTSTART = blockPtr;
        Cache_cache.L2_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
        Cache_cache.L2_MAINT |= 0x01;   /* preload */
        if (wait) {
            while (Cache_cache.L2_MAINT & 0x1f) {
                ;
            }
        }
    }

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_preloadLock ========
 */
Void Cache_preloadLock(Ptr blockPtr, size_t byteCnt, Bits16 type, Bool wait)
{
    UInt key;

    key = Cache_seizeRegs();

    if (type & Cache_Type_L1) {
        Cache_cache.L1_MTSTART = blockPtr;
        Cache_cache.L1_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
        Cache_cache.L1_MAINT |= 0x03;   /* preload + lock */
        if (wait) {
            while (Cache_cache.L1_MAINT & 0x1f) {
                ;
            }
        }
    }

    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        Cache_cache.L2_MTSTART = blockPtr;
        Cache_cache.L2_MTEND = (Ptr)((UInt32)blockPtr + byteCnt-1);
        Cache_cache.L2_MAINT |= 0x03;   /* preload + lock */
        if (wait) {
            while (Cache_cache.L2_MAINT & 0x1f) {
                ;
            }
        }
    }

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_wbAll ========
 */
Void Cache_wbAll()
{
    UInt key;

    key = Cache_seizeRegs();

    AMMU_mmu.MSTART = (Ptr)0x00000000;
    AMMU_mmu.MEND   = (Ptr)0xffffffff;
    AMMU_mmu.MAINT  |= 0x288;   /* clean */

    while (AMMU_mmu.MAINT & 0x008) {
        ;
    }
    
    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_invAll ========
 */
Void Cache_invAll()
{
    UInt key;

    key = Cache_seizeRegs();

    Cache_invAllI();

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_invAllI ========
 */
Void Cache_invAllI()
{
    AMMU_mmu.MSTART = (Ptr)0x00000000;
    AMMU_mmu.MEND   = (Ptr)0xffffffff;
    AMMU_mmu.MAINT  |= 0x400;   /* g_flush */

    while (AMMU_mmu.MAINT & 0x400) {
        ;
    }
}

/*
 *  ======== Cache_wbInvAll ========
 */
Void Cache_wbInvAll()
{
    UInt key;

    key = Cache_seizeRegs();

    AMMU_mmu.MSTART = (Ptr)0x00000000;
    AMMU_mmu.MEND   = (Ptr)0xffffffff;
    AMMU_mmu.MAINT  |= 0x298;   /* L2 + L1 + inv + clean */

    while (AMMU_mmu.MAINT & 0x018) {
        ;
    }

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_read ========
 */
Void Cache_read(Ptr blockPtr, size_t byteCnt, Bits16 type, Ptr destBuf)
{
    UInt key;
    UInt32 *buf;

    byteCnt /= 4;       /* convert to 32 bit word count */
    buf = (UInt32 *)destBuf;

    key = Cache_seizeRegs();

    if (type & Cache_Type_L1) {
        Cache_cache.L1_CTADDR = blockPtr;
        while (byteCnt--) {
            *buf++ = Cache_cache.L1_CTDATA;
        }
    }
    if (Cache_l2CacheSupported && (type & Cache_Type_L2)) {
        Cache_cache.L2_CTADDR = blockPtr;
        while (byteCnt--) {
            *buf++ = Cache_cache.L2_CTDATA;
        }
    }

    Cache_releaseRegs(key);
}

/*
 *  ======== Cache_ISR ========
 */
Void Cache_ISR(UArg level)
{
    UInt reason;

    if (level == 1) {
        reason = Cache_cache.L1_INT;
        Error_raise(NULL, Cache_E_exception, level, reason);
    }

    if (Cache_l2CacheSupported && (level == 2)) {
        reason = Cache_cache.L2_INT;
        Error_raise(NULL, Cache_E_exception, level, reason);
    }
}

/*
 *  ======== Cache_wait ========
 */
Void Cache_wait()
{
    while ((Cache_cache.L1_MAINT & 0x1f) || (Cache_l2CacheSupported && (Cache_cache.L2_MAINT & 0x1f))) {
        ;
    }
}

/*
 *  ======== Cache_seizeRegs ========
 */
UInt Cache_seizeRegs()
{
    UInt key;

    while (TRUE) {
        /* first, grap the registers */
        key = Gate_enterModule();

        /* Then make sure any previous job is finished */
        if ((Cache_cache.L1_MAINT & 0x1f) || (Cache_l2CacheSupported && (Cache_cache.L2_MAINT & 0x1f))) {
            Gate_leaveModule(key);
        }
        else {
            /* return with registers and cache ready for duty */
            return (key);
        }
    }
}

/*
 *  ======== Cache_releaseRegs ========
 */
Void Cache_releaseRegs(UInt key)
{
    Gate_leaveModule(key);
}

/*
 *  ======== Cache_printInfo ========
 */
Void Cache_printInfo(UInt info, UInt level)
{
    UInt vers, waysCode, ways, size, slaves, masters;

    vers = info & 0x0f;
    waysCode = ((info & 0x30) >> 4) + 1;
    ways = 2;
    while (--waysCode) {
        ways = ways * 2;
    }
    size = (info & 0xffc0) >> 6;
    slaves = (info & 0x70000) >> 16;
    masters = (info & 0x180000) >> 19;

    System_printf("L%d_INFO\n", level);
    System_printf("   version = %d\n", vers);
    System_printf("   ways = %d\n", ways);
    System_printf("   size = %d kb\n", size);
    System_printf("   slaves = %d\n", slaves);
    System_printf("   masters = %d\n", masters);
}

/*
 *  ======== Cache_printConfig ========
 */
Void Cache_printConfig(UInt config, UInt level)
{
    UInt secure, bypass, secint, secport, secmain;

    secure = config & 0x01;
    bypass = config & 0x02;
    secint = config & 0x04;
    secport = config & 0x08;
    secmain = config & 0x10;

    System_printf("L%d_CONFIG\n", level);
    System_printf("   secure = %s\n", secure ? "locked" : "unlocked");
    System_printf("   bypass = %s\n", bypass ? "normal" : "bypass");
    System_printf("   secint = %s\n", secint ? "non-secure" : "secure");
    System_printf("   secport = %s\n", secport ? "non-secure" : "secure");
    System_printf("   secmain = %s\n", secmain ? "non-secure" : "secure");
}

/*
 *  ======== Cache_printOCP ========
 */
Void Cache_printOCP(UInt config, UInt level)
{
    UInt wrap, wrbuffer, prefetch, cleanbuf;

    wrap = config & 0x01;
    wrbuffer = config & 0x02;
    prefetch = config & 0x10;
    cleanbuf = config & 0x20;

    System_printf("L%d_OCP\n", level);
    System_printf("   wrap = %s\n", wrap ? "OCP wrap" : "non-wrap");
    System_printf("   wrbuffer = %s\n", wrbuffer ? "buffered writes" : "non-buffered writes");
    System_printf("   prefetch = %s\n", prefetch ? "always prefetch" : "follow MMU");
    System_printf("   cleanbuf = %s\n", cleanbuf ? "clean/not-empty" : "no-clean/empty");
}

/*
 *  ======== Cache_dumpRegs ========
 */
Void Cache_dumpRegs()
{
    Cache_printInfo(Cache_cache.L1_INFO, 1);
    Cache_printConfig(Cache_cache.L1_CONFIG, 1);
    Cache_printOCP(Cache_cache.L1_OCP, 1);

    if (Cache_l2CacheSupported) {
        Cache_printInfo(Cache_cache.L2_INFO, 2);
        Cache_printConfig(Cache_cache.L2_CONFIG, 2);
        Cache_printOCP(Cache_cache.L2_OCP, 2);
    }
}



