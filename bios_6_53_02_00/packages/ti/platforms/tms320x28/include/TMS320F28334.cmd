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
 *  ======== TMS320F28334.cmd ========
 *  Define the memory block start/length for the F28334
 */

/*
 *  PAGE 0 will be used to organize program sections
 *  PAGE 1 will be used to organize data sections
 *
 *  Notes:
 *        Memory blocks on F28334 are uniform (ie same
 *        physical memory) in both PAGE 0 and PAGE 1.
 *        That is the same memory region should not be
 *        defined for both PAGE 0 and PAGE 1.
 *        Doing so will result in corruption of program
 *        and/or data.
 *
 *        L0/L1/L2 and L3 memory blocks are mirrored - that is
 *        they can be accessed in high memory or low memory.
 *        For simplicity only one instance is used in this
 *        linker file.
 */

MEMORY
{
PAGE 0:    /* Program Memory */

    FLASH       : origin = 0x320000, length = 0x01FF80     /* on-chip FLASH */
    CSM_RSVD    : origin = 0x33FF80, length = 0x000076     /* Program with all 0x0000 when CSM is in use. */
    BEGIN       : origin = 0x33FFF6, length = 0x000002     /* Used for "boot to Flash" bootloader mode. */
    CSM_PWL     : origin = 0x33FFF8, length = 0x000008     /* CSM password locations in FLASH */
    OTP         : origin = 0x380400, length = 0x000400     /* on-chip OTP */
    ADC_CAL     : origin = 0x380080, length = 0x000009     /* ADC_cal function in Reserved memory */

    IQTABLES    : origin = 0x3FE000, length = 0x000b50     /* IQ Math Tables in Boot ROM */
    IQTABLES2   : origin = 0x3FEB50, length = 0x00008c     /* IQ Math Tables in Boot ROM */
    FPUTABLES   : origin = 0x3FEBDC, length = 0x0006A0     /* FPU Tables in Boot ROM */
    ROM         : origin = 0x3FF27C, length = 0x000D44     /* Boot ROM */
    RESET       : origin = 0x3FFFC0, length = 0x000002     /* part of boot ROM  */
    VECTORS     : origin = 0x3FFFC2, length = 0x00003E     /* part of boot ROM  */

PAGE 1 :   /* Data Memory */

    M01SARAM    : origin = 0x000000, length = 0x000800     /* on-chip RAM block M0, M1 */
    PIEVECT     : origin = 0xD00,    length = 0x100
    L07SARAM    : origin = 0x008000, length = 0x008000     /* on-chip RAM block L0-L7 */
}

/*
 *  Allocate sections to memory blocks.
 *  Note:
 *      codestart   user defined section in DSP28_CodeStartBranch.asm
 *                  used to redirect code execution when booting to flash
 *
 *      ramfuncs    user defined section to store functions that will be
 *                  copied from Flash into RAM
 */

SECTIONS
{
    /* Allocate program areas: */
    .cinit              : > FLASH       PAGE = 0
    .pinit              : > FLASH       PAGE = 0
    .text               : > FLASH       PAGE = 0
    codestart           : > BEGIN       PAGE = 0
    ramfuncs            : LOAD = FLASH      PAGE = 0,
                          RUN  = L07SARAM   PAGE = 1,
                          LOAD_START(_RamfuncsLoadStart),
                          LOAD_SIZE(_RamfuncsLoadSize),
                          LOAD_END(_RamfuncsLoadEnd),
                          RUN_START(_RamfuncsRunStart)

    csmpasswds          : > CSM_PWL     PAGE = 0
    csm_rsvd            : > CSM_RSVD    PAGE = 0

    /* Allocate uninitalized data sections: */
    .stack              : > M01SARAM | L07SARAM     PAGE = 1
    .ebss               : > M01SARAM | L07SARAM     PAGE = 1
    .esysmem            : > L07SARAM | M01SARAM     PAGE = 1
    .cio                : > L07SARAM | M01SARAM     PAGE = 1

    /* Initalized sections go in Flash */
    /* For SDFlash to program these, they must be allocated to page 0 */
    .econst             : > FLASH       PAGE = 0
    .switch             : > FLASH       PAGE = 0
    .args               : > FLASH       PAGE = 0

#ifdef __TI_COMPILER_VERSION__
#if __TI_COMPILER_VERSION__ >= 15009000
    .TI.ramfunc         : {} LOAD = FLASH    PAGE = 0,
                             RUN  = L07SARAM PAGE = 1,
                             table(BINIT)
#endif
#endif

    /* Allocate IQ math areas: */
    IQmath              : > FLASH       PAGE = 0        /* Math Code */
    IQmathTables        : > IQTABLES    PAGE = 0, TYPE = NOLOAD

    /*
     *  Uncomment the section below if calling the IQNexp() or IQexp()
     *  functions from the IQMath.lib library in order to utilize the
     *  relevant IQ Math table in Boot ROM (This saves space and Boot ROM
     *  is 1 wait-state). If this section is not uncommented, IQmathTables2
     *  will be loaded into other memory (SARAM, Flash, etc.) and will take
     *  up space, but 0 wait-state is possible.
     */
    /*
    IQmathTables2       : > IQTABLES2, PAGE = 0, TYPE = NOLOAD
    {
        IQmath.lib<IQNexpTable.obj> (IQmathTablesRam)
    }
    */

    FPUmathTables       : > FPUTABLES, PAGE = 0, TYPE = NOLOAD

    /* Allocate ADC_cal function (pre-programmed by factory into TI reserved memory) */
    .adc_cal            : load = ADC_CAL,   PAGE = 0, TYPE = NOLOAD
}
