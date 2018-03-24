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
 *  ======== F28377D.cmd ========
 *  Define the memory block start/length for the F28377D
 */

MEMORY
{
PAGE 0 :  /* Program Memory */
          /* BEGIN is used for the "boot to FLASH" bootloader mode   */

    D01SARAM   : origin = 0x00B000, length = 0x001000

    /* Flash boot address */
    BEGIN   : origin = 0x080000, length = 0x000002

    /* Flash sectors */
    FLASHA  : origin = 0x080002, length = 0x001FFE  /* on-chip Flash */
    FLASHB  : origin = 0x082000, length = 0x002000  /* on-chip Flash */
    FLASHC  : origin = 0x084000, length = 0x002000  /* on-chip Flash */
    FLASHD  : origin = 0x086000, length = 0x002000  /* on-chip Flash */
    FLASHE  : origin = 0x088000, length = 0x008000  /* on-chip Flash */
    FLASHF  : origin = 0x090000, length = 0x008000  /* on-chip Flash */
    FLASHG  : origin = 0x098000, length = 0x008000  /* on-chip Flash */
    FLASHH  : origin = 0x0A0000, length = 0x008000  /* on-chip Flash */
    FLASHI  : origin = 0x0A8000, length = 0x008000  /* on-chip Flash */
    FLASHJ  : origin = 0x0B0000, length = 0x008000  /* on-chip Flash */
    FLASHK  : origin = 0x0B8000, length = 0x002000  /* on-chip Flash */
    FLASHL  : origin = 0x0BA000, length = 0x002000  /* on-chip Flash */
    FLASHM  : origin = 0x0BC000, length = 0x002000  /* on-chip Flash */
    FLASHN  : origin = 0x0BE000, length = 0x002000  /* on-chip Flash */
    RESET   : origin = 0x3FFFC0, length = 0x000002

PAGE 1 : /* Data Memory */

    BOOT_RSVD : origin = 0x000002, length = 0x000120 /* Part of M0, BOOT rom
                                                        will use this for
                                                        stack */

    M01SARAM : origin = 0x000122, length = 0x0006DE  /* on-chip RAM */

    LS05SARAM : origin = 0x008000, length = 0x003000 /* on-chip RAM */

    /* on-chip Global shared RAMs */
    RAMGS0  : origin = 0x00C000, length = 0x001000
    RAMGS1  : origin = 0x00D000, length = 0x001000
    RAMGS2  : origin = 0x00E000, length = 0x001000
    RAMGS3  : origin = 0x00F000, length = 0x001000
    RAMGS4  : origin = 0x010000, length = 0x001000
    RAMGS5  : origin = 0x011000, length = 0x001000
    RAMGS6  : origin = 0x012000, length = 0x001000
    RAMGS7  : origin = 0x013000, length = 0x001000
    RAMGS8  : origin = 0x014000, length = 0x001000
    RAMGS9  : origin = 0x015000, length = 0x001000
    RAMGS10 : origin = 0x016000, length = 0x001000
    RAMGS11 : origin = 0x017000, length = 0x001000
    RAMGS12 : origin = 0x018000, length = 0x001000
    RAMGS13 : origin = 0x019000, length = 0x001000
    RAMGS14 : origin = 0x01A000, length = 0x001000
    RAMGS15 : origin = 0x01B000, length = 0x001000

    /* Shared MessageRam */
    CPU2TOCPU1RAM   : origin = 0x03F800, length = 0x000400
    CPU1TOCPU2RAM   : origin = 0x03FC00, length = 0x000400
}


SECTIONS
{
    /* Allocate program areas: */
    .cinit              : > FLASHA | FLASHB | FLASHC | FLASHD | FLASHE |
                            FLASHF | FLASHG | FLASHH | FLASHI | FLASHJ |
                            FLASHK | FLASHL | FLASHM | FLASHN PAGE = 0
    .binit              : > FLASHA | FLASHB | FLASHC | FLASHD | FLASHE |
                            FLASHF | FLASHG | FLASHH | FLASHI | FLASHJ |
                            FLASHK | FLASHL | FLASHM | FLASHN PAGE = 0
    .pinit              : > FLASHA | FLASHB | FLASHC | FLASHD | FLASHE |
                            FLASHF | FLASHG | FLASHH | FLASHI | FLASHJ |
                            FLASHK | FLASHL | FLASHM | FLASHN PAGE = 0
    .text               : > FLASHA | FLASHB | FLASHC | FLASHD | FLASHE |
                            FLASHF | FLASHG | FLASHH | FLASHI | FLASHJ |
                            FLASHK | FLASHL | FLASHM | FLASHN PAGE = 0
    codestart           : > BEGIN   PAGE = 0
    ramfuncs            : LOAD = FLASHA | FLASHB | FLASHC | FLASHD | FLASHE |
                                 FLASHF | FLASHG | FLASHH | FLASHI | FLASHJ |
                                 FLASHK | FLASHL | FLASHM | FLASHN PAGE = 0
                          RUN  = LS05SARAM  PAGE = 1
                          LOAD_START(_RamfuncsLoadStart),
                          LOAD_SIZE(_RamfuncsLoadSize),
                          LOAD_END(_RamfuncsLoadEnd),
                          RUN_START(_RamfuncsRunStart),
                          RUN_SIZE(_RamfuncsRunSize),
                          RUN_END(_RamfuncsRunEnd)

#ifdef __TI_COMPILER_VERSION__
#if __TI_COMPILER_VERSION__ >= 15009000
    .TI.ramfunc : {} LOAD = FLASHA | FLASHB | FLASHC | FLASHD | FLASHE |
                            FLASHF | FLASHG | FLASHH | FLASHI | FLASHJ |
                            FLASHK | FLASHL | FLASHM | FLASHN PAGE = 0,
                     RUN  = LS05SARAM PAGE = 1,
                     table(BINIT)
#endif
#endif

    /* Allocate uninitalized data sections: */
    .stack              : > M01SARAM | LS05SARAM    PAGE = 1
    .ebss               : > M01SARAM | LS05SARAM    PAGE = 1
    .esysmem            : > LS05SARAM | M01SARAM    PAGE = 1
    .cio                : > LS05SARAM | M01SARAM    PAGE = 1

    /* Initalized sections go in Flash */
    .econst             : > FLASHA | FLASHB | FLASHC | FLASHD | FLASHE |
                            FLASHF | FLASHG | FLASHH | FLASHI | FLASHJ |
                            FLASHK | FLASHL | FLASHM | FLASHN PAGE = 0
    .switch             : > FLASHA | FLASHB | FLASHC | FLASHD | FLASHE |
                            FLASHF | FLASHG | FLASHH | FLASHI | FLASHJ |
                            FLASHK | FLASHL | FLASHM | FLASHN PAGE = 0
    .args               : > FLASHA | FLASHB | FLASHC | FLASHD | FLASHE |
                            FLASHF | FLASHG | FLASHH | FLASHI | FLASHJ |
                            FLASHK | FLASHL | FLASHM | FLASHN PAGE = 0

    Filter_RegsFile     : > RAMGS0 | RAMGS1 | RAMGS2 | RAMGS3 | RAMGS4 |
                            RAMGS5 | RAMGS6 | RAMGS7 | RAMGS8 | RAMGS9 |
                            RAMGS10 | RAMGS11 | RAMGS12 | RAMGS13 | RAMGS14 |
                            RAMGS15 PAGE = 1

    /* The following section definitions are required when using the IPC API Drivers */
    GROUP : > CPU1TOCPU2RAM, PAGE = 1
    {
        PUTBUFFER
        PUTWRITEIDX
        GETREADIDX
    }

    GROUP : > CPU2TOCPU1RAM, PAGE = 1
    {
        GETBUFFER :    TYPE = DSECT
        GETWRITEIDX :  TYPE = DSECT
        PUTREADIDX :   TYPE = DSECT
    }
}
