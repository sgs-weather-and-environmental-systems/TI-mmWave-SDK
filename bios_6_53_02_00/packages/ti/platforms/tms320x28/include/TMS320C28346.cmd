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
 *  ======== TMS320C28346.cmd ========
 *  Define the memory block start/length for the C28346
 */

/*
 *  PAGE 0 will be used to organize program sections
 *  PAGE 1 will be used to organize data sections
 *
 *  Notes:
 *      Memory blocks on C28346 are uniform (ie same
 *      physical memory) in both PAGE 0 and PAGE 1.
 *      That is the same memory region should not be
 *      defined for both PAGE 0 and PAGE 1.
 *      Doing so will result in corruption of program
 *      and/or data.
 */

MEMORY
{
PAGE 0 :    /* Program Memory */
            /* BEGIN is used for the "boot to SARAM" bootloader mode      */

    BEGIN        : origin = 0x000000, length = 0x000002     /* Boot to M0 will go here                      */
    H05SARAM     : origin = 0x300000, length = 0x030000     /* on-chip RAM block H0-H5 */
    CSM_RSVD     : origin = 0x33FF80, length = 0x000076     /* Reserved - for compatibility to legacy C28x designs. */
    CSM_PWL      : origin = 0x33FFF8, length = 0x000008     /* 128-bit password locations */
    IQTABLES     : origin = 0x3FE000, length = 0x000b50
    IQTABLES2    : origin = 0x3FEB50, length = 0x00008c
    FPUTABLES    : origin = 0x3FEBDC, length = 0x0006A0
    BOOTROM      : origin = 0x3FF27C, length = 0x000D44
    RESET        : origin = 0x3FFFC0, length = 0x000002

PAGE 1 :

    M01SARAM     : origin = 0x000002, length = 0x0007FE     /* on-chip RAM block M0, M1 */
    PIEVECT      : origin = 0xD00,    length = 0x100
    L03SARAM     : origin = 0x008000, length = 0x008000     /* on-chip RAM block L0-L3 */
    L47SARAM     : origin = 0x010000, length = 0x008000     /* on-chip RAM block L4-L7 */
}

/*
 *  Allocate sections to memory blocks.
 *  Note:
 *      codestart   user defined section in DSP28_CodeStartBranch.asm
 *                  used to redirect code execution when booting to flash
 */

SECTIONS
{
    /* Allocate program areas: */
    .cinit              : > H05SARAM    PAGE = 0
    .pinit              : > H05SARAM    PAGE = 0
    .text               : > H05SARAM    PAGE = 0
    codestart           : > H05SARAM    PAGE = 0

    csmpasswds          : > CSM_PWL     PAGE = 0
    csm_rsvd            : > CSM_RSVD    PAGE = 0

    /* Allocate data sections: */
    .stack              : > M01SARAM | L03SARAM                PAGE = 1
    .ebss               : > M01SARAM | L03SARAM                PAGE = 1
    .esysmem            : > L47SARAM | L03SARAM | M01SARAM     PAGE = 1
    .cio                : > L47SARAM | L03SARAM | M01SARAM     PAGE = 1

    /* Initalized sections */
    .econst             : > H05SARAM    PAGE = 0
    .switch             : > H05SARAM    PAGE = 0
    .args               : > H05SARAM    PAGE = 0

#ifdef __TI_COMPILER_VERSION__
#if __TI_COMPILER_VERSION__ >= 15009000
    .TI.ramfunc         : {} > H05SARAM  PAGE = 0
#endif
#endif

    /* Allocate IQ math areas: */
    IQmath              : > H05SARAM    PAGE = 0
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
    IQmathTables2       : > IQTABLES2   PAGE = 0, TYPE = NOLOAD
    {
        IQmath.lib<IQNexpTable.obj> (IQmathTablesRam)
    }

    FPUmathTables       : > FPUTABLES   PAGE = 0, TYPE = NOLOAD
    */
}
