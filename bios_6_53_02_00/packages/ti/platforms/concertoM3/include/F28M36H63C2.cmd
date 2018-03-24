/*
 * Copyright (c) 2015-2016, Texas Instruments Incorporated
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
 *  ======== F28M36H63C2.cmd ========
 *  Define the memory block start/length for the F28M36H63C2 M3
 */

MEMORY
{
    FLASH_BOOT (RWX): origin = 0x200030,   length = 0x4
    FLASH  (RWX)    : origin = 0x200034,   length = 0xFFF9C
    C03SRAM (RWX)   : origin = 0x20000000, length = 0x8000
    S07SHRAM (RWX)  : origin = 0x20008000, length = 0x10000
    C415SRAM (RWX)  : origin = 0x20018000, length = 0x18000
    CTOMMSGRAM (R)  : origin = 0x2007F000, length = 0x800
    MTOCMSGRAM (RW) : origin = 0x2007F800, length = 0x800
}

SECTIONS
{
    /* Allocate program areas: */
    .text       : > FLASH
#ifdef __TI_COMPILER_VERSION__
#if __TI_COMPILER_VERSION__ >= 15009000
    .TI.ramfunc : load=FLASH, run=C03SRAM | C415SRAM, table(BINIT)
#endif
#endif
    .cinit      : > FLASH
    .pinit      : > FLASH
    .binit      : > FLASH
    .init_array : > FLASH

    /* Initalized sections go in Flash */
    .const      : > FLASH

    /* Allocate uninitalized data sections: */
    .data       : > C03SRAM | C415SRAM
    .bss        : > C03SRAM | C415SRAM
    .sysmem     : > C03SRAM | C415SRAM
    .stack      : > C03SRAM | C415SRAM
    .cio        : > C03SRAM | C415SRAM
    .neardata   : > C03SRAM | C415SRAM
    .rodata     : > C03SRAM | C415SRAM
    .args       : > C03SRAM | C415SRAM
}

__STACK_TOP = __stack + 256;
