/*
 * Copyright (c) 2016-2017, Texas Instruments Incorporated
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

#define L1P_CACHE_SIZE  (32*1024)
#define L1D_CACHE_SIZE  (32*1024)

MEMORY
{
#if (L1P_CACHE_SIZE < 0x8000)
    L1PRAM:         o = 0x00E00000, l = (0x00008000 - L1P_CACHE_SIZE)
#endif
#if (L1D_CACHE_SIZE < 0x8000)
    L1DRAM:         o = 0x00F00000, l = (0x00008000 - L1D_CACHE_SIZE)
#endif
    L2SRAM_UMAP1:   o = 0x007E0000, l = 0x00020000
    L2SRAM_UMAP0:   o = 0x00800000, l = 0x00020000
    L3SRAM:         o = 0x20000000, l = 0x000A0000
}

/* Set L1D, L1P and L2 Cache Sizes */
ti_sysbios_family_c64p_Cache_l1dSize = L1D_CACHE_SIZE;
ti_sysbios_family_c64p_Cache_l1pSize = L1P_CACHE_SIZE;
ti_sysbios_family_c64p_Cache_l2Size  = 0;

SECTIONS
{
    .vecs:              {. = align(32); } > L2SRAM_UMAP1 // Interrupt Vectors
    GROUP
    {
        .fardata:       {. = align(8);  }
        .pinit:         {. = align(8);  }
        .init_array:    {. = align(8);  }
        .binit:         {. = align(8);  }
        .const:         {. = align(8);  }
        .switch:        {. = align(8);  }
        .stack:         {. = align(8);  }
        .sysmem:        {. = align(8);  }
        .cio:           {. = align(8);  }
        .neardata:      {. = align(8);  }
        .bss:           {. = align(8);  }
        .data:          {. = align(8);  }
        .rodata:        {. = align(8);  }
    } > L2SRAM_UMAP0 | L2SRAM_UMAP1

    GROUP
    {
        .cinit:         {. = align(8); }
    } > L2SRAM_UMAP0 | L2SRAM_UMAP1

    .far: fill = 0x0, load > L2SRAM_UMAP0 | L2SRAM_UMAP1             // Far Global & Static Variables
    .text: {} >> L2SRAM_UMAP0 | L2SRAM_UMAP1
}
