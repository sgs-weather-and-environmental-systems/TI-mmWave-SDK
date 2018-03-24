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

#define L1P_CACHE_SIZE (16*1024)
#define L1D_CACHE_SIZE (16*1024)

MEMORY
{
PAGE 0:

#if (L1P_CACHE_SIZE < 0x8000)
    L1PSRAM:        o = 0x00E00000, l = (0x00008000 - L1P_CACHE_SIZE)
#endif
#if (L1D_CACHE_SIZE < 0x8000)
    L1DSRAM:        o = 0x00F00000, l = (0x00008000 - L1D_CACHE_SIZE)
#endif
    L2SRAM_UMAP1:   o = 0x007E0000, l = 0x00020000
    L2SRAM_UMAP0:   o = 0x00800000, l = 0x00020000
    L3SRAM:         o = 0x20000000, l = 0x000A0000
    HSRAM:          o = 0x21080000, l = 0x8000

    /* PAGEs 1 and onwards are for overlay purposes for memory optimization. 
       Some examples:
       1. Overlay one-time only text with uninitialized data.
       2. Overlay L1PSRAM data path processing fast code and use copy tables
          to page in (before entering data path) and out of L1PSRAM (when entering
          sleep/low power).
    */
PAGE 1:
    L3SRAM:         o = 0x20000000, l = 0x000A0000
}

/* Set L1D, L1P and L2 Cache Sizes */
ti_sysbios_family_c64p_Cache_l1dSize = L1D_CACHE_SIZE;
ti_sysbios_family_c64p_Cache_l1pSize = L1P_CACHE_SIZE;
ti_sysbios_family_c64p_Cache_l2Size  = 0;

SECTIONS
{
    /* hard addresses forces vecs to be allocated there */
    .vecs:  {. = align(32); } > 0x007E0000

    /* Allocate data preferentially in one UMAP and code (.text) in another,
       this can improve performance due to simultaneous misses from L1P
       and L1D caches to L2 SRAM, for more information see C674 Megamodule
       User Guide section "Level 2 Memory Architecture".
       The linker notation "X >> Y | Z" indicates section X is first allocated in Y
       and allowed to overflow into Z and can be split from Y to Z.
       The linker notation "X > Y | Z" indicates section X is first allocated in Y
       and allowed to overflow into Z and cannot be split from Y to Z. Some sections
       like bss are not allowed to be split so > notation is used for them */

    .fardata:  {} >> L2SRAM_UMAP0 | L2SRAM_UMAP1
    .const:    {} >> L2SRAM_UMAP0 | L2SRAM_UMAP1
    .switch:   {} >> L2SRAM_UMAP0 | L2SRAM_UMAP1
    .cio:      {} >> L2SRAM_UMAP0 | L2SRAM_UMAP1
    .data:     {} >> L2SRAM_UMAP0 | L2SRAM_UMAP1

    .rodata:   {} > L2SRAM_UMAP0 | L2SRAM_UMAP1
    .bss:      {} > L2SRAM_UMAP0 | L2SRAM_UMAP1
    .neardata: {} > L2SRAM_UMAP0 | L2SRAM_UMAP1
    .stack:    {} > L2SRAM_UMAP0 | L2SRAM_UMAP1
    .cinit:    {} > L2SRAM_UMAP0 | L2SRAM_UMAP1
    .far:      {} > L2SRAM_UMAP0 | L2SRAM_UMAP1

    .text: {} >> L2SRAM_UMAP1 | L2SRAM_UMAP0
}

