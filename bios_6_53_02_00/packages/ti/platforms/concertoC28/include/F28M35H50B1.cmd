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
 *  ======== F28M35H50B1.cmd ========
 *  Define the memory block start/length for the F28M35H50B1 C28
 */

MEMORY
{
PAGE 0:    /* Program Memory */

    FLASH       : origin = 0x100000, length = 0x3FF80
    BEGIN       : origin = 0x13FFF0, length = 0x2

PAGE 1 :   /* Data Memory */

    M01SARAM    : origin = 0x0,      length = 0x800     /* on-chip RAM block M0, M1 */
    PIEVECT     : origin = 0xD00,    length = 0x100
    L03SARAM    : origin = 0x8000,   length = 0x4000    /* on-chip RAM block L0-L3 */
    S07SHRAM    : origin = 0xC000,   length = 0x8000
    CTOMMSGRAM  : origin = 0x3F800,  length = 0x400
    MTOCMSGRAM  : origin = 0x3FC00,  length = 0x400
}

SECTIONS
{
    /* Allocate program areas: */
    .text       : > FLASH   PAGE = 0
    .cinit      : > FLASH   PAGE = 0
    .pinit      : > FLASH   PAGE = 0
    .binit      : > FLASH   PAGE = 0
    ramfuncs    : LOAD = FLASH      PAGE = 0,
                  RUN  = L03SARAM   PAGE = 1,
                  LOAD_START(_RamfuncsLoadStart),
                  LOAD_SIZE(_RamfuncsLoadSize),
                  LOAD_END(_RamfuncsLoadEnd),
                  RUN_START(_RamfuncsRunStart)
#ifdef __TI_COMPILER_VERSION__
#if __TI_COMPILER_VERSION__ >= 15009000
    .TI.ramfunc : {} LOAD = FLASH     PAGE = 0,
                     RUN  = L03SARAM  PAGE = 1,
                     TABLE(BINIT)
#endif
#endif

    /* Initalized sections go in Flash */
    .econst     : > FLASH   PAGE = 0
    .switch     : > FLASH   PAGE = 0
    .args       : > FLASH   PAGE = 0

    /* Allocate uninitalized data sections: */
    .stack      : > M01SARAM | L03SARAM PAGE = 1
    .ebss       : > M01SARAM | L03SARAM PAGE = 1
    .esysmem    : > L03SARAM | M01SARAM PAGE = 1
    .cio        : > L03SARAM | M01SARAM PAGE = 1
}
