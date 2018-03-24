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

MEMORY
{
    L2SRAM:     o = 0x00800000 l = 0x00080000   /* 512kB LOCAL L2/SRAM */
    L1PSRAM:    o = 0x00E00000 l = 0x00008000   /* 32kB LOCAL L1P/SRAM */
    L1DSRAM:    o = 0x00F00000 l = 0x00008000   /* 32kB LOCAL L1D/SRAM */
    SHRAM:      o = 0x0C000000 l = 0x00400000   /* 4MB MSMC shared Memory */
    DDR3:       o = 0x80000000 l = 0x80000000   /* 2GB DDR3 SDRAM */
}

/* Set L1D, L1P and L2 Cache Sizes */
ti_sysbios_family_c66_Cache_l1dSize = 32*1024;
ti_sysbios_family_c66_Cache_l1pSize = 32*1024;
ti_sysbios_family_c66_Cache_l2Size = 0;

SECTIONS
{
    .vecs:              load >  L2SRAM
    .text:              load >  L2SRAM
    .stack:             load >  L2SRAM
    GROUP:              load >  L2SRAM
    {
        .bss:
        .neardata:
        .rodata:
    }
    .cio:               load >  L2SRAM
    .const:             load >  L2SRAM
    .data:              load >  L2SRAM
    .switch:            load >  L2SRAM
    .sysmem:            load >  L2SRAM
    .far:               load >  L2SRAM
    .args:              load >  L2SRAM
    .ppinfo:            load >  L2SRAM
    .ppdata:            load >  L2SRAM
    .ti.decompress:     load >  L2SRAM
    .ti.handler_table:  load >  L2SRAM

    /* COFF sections */
    .pinit:             load >  L2SRAM
    .cinit:             load >  L2SRAM

    /* EABI sections */
    .binit:             load >  L2SRAM
    .init_array:        load >  L2SRAM
    .fardata:           load >  L2SRAM
    .c6xabi.exidx:      load >  L2SRAM
    .c6xabi.extab:      load >  L2SRAM
}
