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
 *  ======== TMS320F28054M.cmd ========
 *  Define the memory block start/length for the F28054M
 */

/*
 *  PAGE 0 will be used to organize program sections
 *  PAGE 1 will be used to organize data sections
 *
 *  Notes:
 *        Memory blocks on F28054M are uniform (ie same
 *        physical memory) in both PAGE 0 and PAGE 1.
 *        That is the same memory region should not be
 *        defined for both PAGE 0 and PAGE 1.
 *        Doing so will result in corruption of program
 *        and/or data.
 *
 */

MEMORY
{
PAGE 0:    /* Program Memory */

    DCSM_OTP_Z2_P0  : origin = 0x3D7800, length = 0x000004		/* Part of Z1 OTP.  LinkPointer/JTAG lock/ Boot Mode */

    /* DCSM Z1 Zone Select Contents and Reserved Locations (!!Movable!!) */
    /* Z2_DCSM_RSVD must be programmed to all 0x0000 and must immediately follow Z2 Zone Select block */
    DCSM_ZSEL_Z2_P0 : origin = 0x3D7810, length = 0x000010		/* Part of Z2 OTP.  Z2 password locations / Flash and RAM partitioning  */
    Z2_DCSM_RSVD    : origin = 0x3D7820, length = 0x0001E0		/* Program with all 0x0000 when Z2 DCSM is in use. */

    DCSM_OTP_Z1_P0  : origin = 0x3D7A00, length = 0x000006		/* Part of Z2 OTP.  LinkPointer/JTAG lock */

    /* DCSM Z1 Zone Select Contents and Reserved Locations (!!Movable!!) */
    /* Z1_DCSM_RSVD must be programmed to all 0x0000 and must immediately follow Z1 Zone Select block */
    DCSM_ZSEL_Z1_P0 : origin = 0x3D7A10, length = 0x000010		/* Part of Z1 OTP.  Z1 password locations / Flash and RAM partitioning */
    Z1_DCSM_RSVD    : origin = 0x3D7A20, length = 0x0001E0	    /* Part of Z1 OTP.  Program with all 0x0000 when Z1 DCSM is in use. */

    FLASH           : origin = 0x3E8000, length = 0x00FFFE		/* on-chip FLASH */
    BEGIN           : origin = 0x3F7FFE, length = 0x000002		/* Part of FLASHA.  Used for "boot to Flash" bootloader mode. */

    Z1_SCC_ROM      : origin = 0x3F8000, length = 0x000400		/* Zone 1 Safe-Copy Code Secure ROM */
    Z2_SCC_ROM      : origin = 0x3F8400, length = 0x000400		/* Zone 2 Safe-Copy Code Secure ROM */
    Z1_SECURE_ROM	: origin = 0x3F8808, length = 0x0044F8		/* Z1 Secure ROM */

    IQTABLES        : origin = 0x3FE000, length = 0x000B50		/* IQ Math Tables in Boot ROM */
    IQTABLES2       : origin = 0x3FEB50, length = 0x00008C		/* IQ Math Tables in Boot ROM */
    IQTABLES3       : origin = 0x3FEBDC, length = 0x0000AA		/* IQ Math Tables in Boot ROM */

    ROM             : origin = 0x3FF27C, length = 0x000D44     /* Boot ROM */
    RESET           : origin = 0x3FFFC0, length = 0x000002     /* part of boot ROM */
    VECTORS         : origin = 0x3FFFC2, length = 0x00003E     /* part of boot ROM */

PAGE 1 :   /* Data Memory */

    M01SARAM        : origin = 0x000000, length = 0x000800     /* on-chip RAM block M0, M1 */
    PIEVECT         : origin = 0xD00,    length = 0x100
    L13SARAM        : origin = 0x008800, length = 0x001800     /* on-chip RAM block L0-L3 */
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
                          RUN  = L13SARAM   PAGE = 1,
                          LOAD_START(_RamfuncsLoadStart),
                          LOAD_SIZE(_RamfuncsLoadSize),
                          LOAD_END(_RamfuncsLoadEnd),
                          RUN_START(_RamfuncsRunStart)

    dcsm_otp_z1         : > DCSM_OTP_Z1_P0      PAGE = 0
    dcsm_otp_z2         : > DCSM_OTP_Z2_P0      PAGE = 0

    dcsm_zsel_z1        : > DCSM_ZSEL_Z1_P0     PAGE = 0
    dcsm_rsvd_z1        : > Z1_DCSM_RSVD        PAGE = 0
    dcsm_zsel_z2        : > DCSM_ZSEL_Z2_P0     PAGE = 0
    dcsm_rsvd_z2        : > Z2_DCSM_RSVD        PAGE = 0

    /* Allocate uninitalized data sections: */
    .stack              : > M01SARAM | L13SARAM     PAGE = 1
    .ebss               : > M01SARAM | L13SARAM     PAGE = 1
    .esysmem            : > L13SARAM | M01SARAM     PAGE = 1
    .cio                : > L13SARAM | M01SARAM     PAGE = 1

    /* Initalized sections go in Flash */
    /* For SDFlash to program these, they must be allocated to page 0 */
    .econst             : > FLASH       PAGE = 0
    .switch             : > FLASH       PAGE = 0
    .args               : > FLASH       PAGE = 0

#ifdef __TI_COMPILER_VERSION__
#if __TI_COMPILER_VERSION__ >= 15009000
    .TI.ramfunc         : {} LOAD = FLASH    PAGE = 0,
                             RUN  = L13SARAM PAGE = 1,
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
    IQmathTables2       : > IQTABLES2   PAGE = 0, TYPE = NOLOAD
    {
        IQmath.lib<IQNexpTable.obj> (IQmathTablesRam)
    }
    */

    /*
     *  Uncomment the section below if calling the IQNasin() or IQasin()
     *  functions from the IQMath.lib library in order to utilize the
     *  relevant IQ Math table in Boot ROM (This saves space and Boot ROM
     *  is 1 wait-state). If this section is not uncommented, IQmathTables2
     *  will be loaded into other memory (SARAM, Flash, etc.) and will take
     *  up space, but 0 wait-state is possible.
     */
    /*
    IQmathTables3       : > IQTABLES3   PAGE = 0, TYPE = NOLOAD
    {
        IQmath.lib<IQNasinTable.obj> (IQmathTablesRam)
    }
    */
}
