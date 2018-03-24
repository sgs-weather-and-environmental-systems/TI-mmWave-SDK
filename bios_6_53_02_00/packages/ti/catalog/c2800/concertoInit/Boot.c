/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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
 *  ======== Boot.c ========
 *
 *  Optionally configure the FLASH controller.
 *
 */
#include <xdc/std.h>

#define Boot_initFlash ti_catalog_c2800_concertoInit_Boot_initFlash

#pragma CODE_SECTION(Boot_initFlash, ".ti_catalog_c2800_concertoInit_flashfuncs")

#define REG(x)     (*((volatile unsigned *)(x)))
#define FRDCNTL_REG          0x4000
#define FRD_INTF_CTRL_REG    0x4180
#define PREFETCH_ENABLE      0x1
#define DCACHE_ENABLE        0x2
#define RWAIT_SHIFT          8
#define NOPS                 8

/*
 *  ======== Boot_initFlash ========
 */
void Boot_initFlash(Bool configWaitStates, UInt waitStates,
    Bool enablePrefetch, Bool enableDataCache)
{
    UInt tempEnable = 0;
    UInt i;

    asm(" EALLOW");

    /* disable prefetch and data cache */
    REG(FRD_INTF_CTRL_REG) = 0;

    /* set wait states */
    if (configWaitStates) {
        REG(FRDCNTL_REG) = waitStates << RWAIT_SHIFT;
    }

    /* conditionally enable prefetch and data cache */
    if (enablePrefetch) {
        tempEnable |= PREFETCH_ENABLE;
    }
    if (enableDataCache) {
        tempEnable |= DCACHE_ENABLE;
    }
    REG(FRD_INTF_CTRL_REG) = tempEnable;

    asm(" EDIS");

    /* flush pipeline */
    for (i = 0; i < (NOPS - 1); i++) {
        asm(" NOP");
    }

}
