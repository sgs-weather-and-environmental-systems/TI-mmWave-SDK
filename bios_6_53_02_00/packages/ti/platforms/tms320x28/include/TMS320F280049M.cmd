/*
 * Copyright (c) 2015-2017, Texas Instruments Incorporated
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
 *  ======== TMS320F280049M.cmd ========
 *  Define the memory block start/length for the Potenza F280049M
 */

MEMORY
{
PAGE 0 :  /* Program Memory */
          /* BEGIN is used for the "boot to FLASH" bootloader mode   */

    D01SARAM   : origin = 0x00B000, length = 0x001000

    /* Flash boot address */
    BEGIN   : origin = 0x080000, length = 0x000002

    /* Flash sectors */
    FLASHA  : origin = 0x080002, length = 0x00FFFE  /* on-chip Flash */
    FLASHB  : origin = 0x090000, length = 0x010000  /* on-chip Flash */
    RESET   : origin = 0x3FFFC0, length = 0x000002

PAGE 1 : /* Data Memory */

    BOOT_RSVD : origin = 0x000002, length = 0x000120 /* Part of M0, BOOT rom
                                                        will use this for
                                                        stack */

    M01SARAM : origin = 0x000122, length = 0x0006DE  /* on-chip RAM */

    LS07SARAM : origin = 0x008000, length = 0x004000 /* on-chip RAM */

    /* on-chip Global shared RAMs */
    RAMGS0  : origin = 0x00C000, length = 0x002000
    RAMGS1  : origin = 0x00E000, length = 0x002000
    RAMGS2  : origin = 0x010000, length = 0x002000
    RAMGS3  : origin = 0x012000, length = 0x002000
}


SECTIONS
{
    /* Allocate program areas: */
    .cinit              : > FLASHA | FLASHB PAGE = 0
    .binit              : > FLASHA | FLASHB PAGE = 0
#ifdef __TI_EABI__
    .init_arrray        : > FLASHA | FLASHB PAGE = 0
#else
    .pinit              : > FLASHA | FLASHB PAGE = 0
#endif
    .text               : > FLASHA | FLASHB PAGE = 0
    codestart           : > BEGIN   PAGE = 0
    ramfuncs            : LOAD = FLASHA | FLASHB PAGE = 0
                          RUN  = LS07SARAM  PAGE = 1
                          LOAD_START(_RamfuncsLoadStart),
                          LOAD_SIZE(_RamfuncsLoadSize),
                          LOAD_END(_RamfuncsLoadEnd),
                          RUN_START(_RamfuncsRunStart),
                          RUN_SIZE(_RamfuncsRunSize),
                          RUN_END(_RamfuncsRunEnd)

    /* Allocate uninitalized data sections: */
    .stack              : > M01SARAM | LS07SARAM    PAGE = 1
#ifdef __TI_EABI__
    .bss                : > M01SARAM | LS07SARAM    PAGE = 1
    .sysmem             : > LS07SARAM | M01SARAM    PAGE = 1
    .data               : > M01SARAM | LS07SARAM    PAGE = 1
#else
    .ebss               : > M01SARAM | LS07SARAM    PAGE = 1
    .esysmem            : > LS07SARAM | M01SARAM    PAGE = 1
#endif
    .cio                : > LS07SARAM | M01SARAM    PAGE = 1

    /* Initalized sections go in Flash */
#ifdef __TI_EABI__
    .const              : > FLASHA | FLASHB PAGE = 0
#else
    .econst             : > FLASHA | FLASHB PAGE = 0
#endif
    .switch             : > FLASHA | FLASHB PAGE = 0
    .args               : > FLASHA | FLASHB PAGE = 0

    .reset              : > RESET,  PAGE = 0, TYPE = DSECT

    Filter_RegsFile     : > RAMGS0 | RAMGS1 | RAMGS2 | RAMGS3 PAGE = 1
}
