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

/*!
 *  ======== SR ========
 *  MSP430 Status Register
 */
metaonly module SR inherits xdc.platform.IPeripheral {

    /* System clock generator 1. This bit, when set, turns off the SMCLK. */
    enum SCG1_t {
        SCG1_OFF   = 0x0000,              /*! Disable System clock generator 1 */
        SCG1       = 0x0080               /*! Enable System clock generator 1 */
    };

    enum SCG0_t {
        SCG0_OFF   = 0x0000,              /*! Disable System clock generator 0 */
        SCG0       = 0x0040               /*! Enable System clock generator 0 */
    };

    enum OSCOFF_t {
        OSCOFF_OFF = 0x0000,              /*! Oscillator On */
        OSCOFF     = 0x0020               /*! Oscillator Off */
    };

    /* CPU off. This bit, when set, turns off the CPU. */
    enum CPUOFF_t {
        CPUOFF_OFF = 0x0000,              /*! CPU On */
        CPUOFF     = 0x0010               /*! CPU Off */
    };

    enum GIE_t {
        GIE_OFF    = 0x0000,              /*! General interrupt disable */
        GIE        = 0x0008               /*! General interrupt enable */
    };

    /* SR */
    struct SR_t {
        SCG1_t      SCG1;                 /*! System clock generator 1
                                           *This bit, when set, turns off the SMCLK.
                                           */
        SCG0_t      SCG0;                 /*! System clock generator 0
                                           *This bit, when set, turns off the DCO dc
                                           *generator, if DCOCLK is not used for MCLK
                                           *or SMCLK.
                                           */
        OSCOFF_t    OSCOFF;               /*!Oscillator Off
                                           *This bit, when set, turns off the LFXT1
                                           *crystal oscillator, when LFXT1CLK is not
                                           *use for MCLK or SMCLK
                                           */
        CPUOFF_t    CPUOFF;               /*! CPU off
                                           *This bit, when set, turns off the CPU.
                                           */
        GIE_t       GIE;                  /*! General interrupt enable
                                           *This bit, when set, enables maskable
                                           *interrupts. When reset, all maskable
                                           *interrupts are disabled
                                           */
    }

   /*!
    *  ======== ForceSetDefaultRegister_t ========
    *  Force Set Default Register
    *
    *  Type to store if each register needs to be forced initialized
    *  even if the register is in default state.
    *
    *  @see #ForceSetDefaultRegister_t
    */
    struct ForceSetDefaultRegister_t {
        String     register;
        Bool       regForceSet;
    }

instance:
    /*! SR, Status Register */
    config SR_t SR = {
        SCG1        : SCG1_OFF,
        SCG0        : SCG0_OFF,
        OSCOFF      : OSCOFF_OFF,
        CPUOFF      : CPUOFF_OFF,
        GIE         : GIE_OFF
    };

   /*!
    *  ======== getSCG1 ========
    *  Gets SCG1 bit
    *
    *  @see #getSCG1
    */
    Bool    getSCG1();

   /*!
    *  ======== setSCG1 ========
    *  Sets SCG1 bit
    *
    *  @see #setSCG1
    */
    Bool    setSCG1(Bool set);

   /*!
    *  ======== getSCG0 ========
    *  Gets SCG0 bit
    *
    *  @see #getSCG0
    */
    Bool    getSCG0();

   /*!
    *  ======== setSCG0 ========
    *  Sets SCG0 bit
    *
    *  @see #setSCG0
    */
    Bool    setSCG0(Bool set);

   /*!
    *  ======== getOSCOFF ========
    *  Gets OSCOFF bit
    *
    *  @see #getOSCOFF
    */
    Bool    getOSCOFF();

   /*!
    *  ======== setOSCOFF ========
    *  Sets OSCOFF bit
    *
    *  @see #setOSCOFF
    */
    Bool    setOSCOFF(Bool set);

    /*!
    *  ======== getCPUOFF ========
    *  Gets CPUOFF bit
    *
    *  @see #getCPUOFF
    */
    Bool    getCPUOFF();

   /*!
    *  ======== setCPUOFF ========
    *  Sets CPUOFF bit
    *
    *  @see #setCPUOFF
    */
    Bool    setCPUOFF(Bool set);

    /*!
    *  ======== getGIE ========
    *  Gets GIE bit
    *
    *  @see #getGIE
    */
    Bool    getGIE();

   /*!
    *  ======== setGIE ========
    *  Sets GIE bit
    *
    *  @see #setGIE
    */
    Bool    setGIE(Bool set);

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "SR" , regForceSet : false },
    ];
}
