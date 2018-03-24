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
 *  ======== SFRIE1 ========
 *  MSP430 Interrupt Enable Register 1
 */
metaonly module SFRIE1 inherits xdc.platform.IPeripheral {

    enum JMBOUTIE_t {
        JMBOUTIE_OFF  = 0x00,        /*! Interrupt not enabled */
        JMBOUTIE      = 0x80         /*! Interrupt enabled */
    };

    enum JMBINIE_t {
        JMBINIE_OFF = 0x00,          /*! Interrupt not enabled */
        JMBINIE     = 0x40           /*! Interrupt enabled */
    };

    enum ACCVIE_t {
        ACCVIE_OFF = 0x00,           /*! Interrupt not enabled */
        ACCVIE     = 0x20            /*! Interrupt enabled */
    };

    enum NMIIE_t {
        NMIIE_OFF  = 0x00,           /*! Interrupt not enabled */
        NMIIE      = 0x10            /*! Interrupt enabled */
    };

    enum OFIE_t {
        OFIE_OFF   = 0x00,           /*! Interrupt not enabled */
        OFIE       = 0x02            /*! Interrupt enabled */
    };

    enum WDTIE_t {
        WDTIE_OFF  = 0x00,           /*! Interrupt not enabled */
        WDTIE      = 0x01            /*! Interrupt enabled */
    };

    enum NMIIFG_t {
        NMIIFG_OFF = 0x00,           /*! No interrupt pending */
        NMIIFG     = 0x10            /*! Interrupt pending */
    };

    enum WDTIFG_t {
        WDTIFG_OFF = 0x00,           /*! No interrupt pending */
        WDTIFG     = 0x01            /*! Interrupt pending */
    };

    enum OFIFG_t {
        OFIFG_OFF  = 0x00,           /*! No interrupt pending */
        OFIFG      = 0x02            /*! Interrupt pending */
    };

    enum ACCVIFG_t {
        ACCVIFG_OFF = 0x00,          /*! No interrupt pending */
        ACCVIFG     = 0x20           /*! Interrupt pending */
    };

    /* IE1 */
    struct IE1_t {
        ACCVIE_t    ACCVIE;          /*! Flash memory access violation interrupt
                                      * enable. This bit enables the ACCVIFG interrupt.
                                      *  0  Interrupt disabled
                                      *  1  Interrupt enabled */
        NMIIE_t      NMIIE;          /*! NMI interrupt enable. This bit enables
                                      *the NMI interrupt.
                                      *  0  Interrupt disabled
                                      *  1  Interrupt enabled */
        OFIE_t      OFIE;            /*! Oscillator fault flag interrupt enable
                                      *This bit enables the OFIFG interrupt.
                                      *  0  Interrupt disabled
                                      *  1  Interrupt enabled */
        WDTIE_t     WDTIE;           /*! Watchdog timer+ interrupt enable. This
                                      *bit enables the WDTIFG interrupt for
                                      *interval timer mode. It is not necessary
                                      *to set this bit for watchdog mode.
                                      *  0  Interrupt disabled
                                      *  1  Interrupt enabled */
    }

    /* IFG1 */
    struct IFG1_t {
        ACCVIFG_t    ACCVIFG;        /*! Flash memory access violation interrupt
                                      * flag.
                                      *  0  No interrupt pending
                                      *  1  Interrupt pending */
        NMIIFG_t     NMIIFG;         /*! NMI interrupt flag.
                                      *  0  No interrupt pending
                                      *  1  Interrupt pending */
        OFIFG_t      OFIFG;          /*! Oscillator fault interrupt flag
                                      *  0  No interrupt pending
                                      *  1  Interrupt pending */
        WDTIFG_t     WDTIFG;         /*! Watchdog timer+ interrupt flag.
                                      *  0  No interrupt pending
                                      *  1  Interrupt pending */
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

   /*!
    *  ======== regIntVect_t ========
    *  Interrupt vector description
    *
    *  Type to describe a single interrupt vector pin and all its possible
    *  configurations.
    *
    *  @see #regIntVect_t
    */
    struct regIntVect_t {
        String                    registerName;
        String                    registerDescription;
        String                    isrToggleString;
        String                    priorityName;
        Bool                      interruptEnable;
        Bool                      interruptHandler;
        Int                       priority;
    }

instance:

    /*! SFRIE1 interrupt enables
     */
    config regIntVect_t interruptSource[16];

    /*! IE1, Interrupt Enable Register 1 */
    config IE1_t SFRIE1 = {
        ACCVIE      : ACCVIE_OFF,
        NMIIE       : NMIIE_OFF,
        OFIE        : OFIE_OFF,
        WDTIE       : WDTIE_OFF
    };

    /*! IFG1, Interrupt Flag Register 1 */
    config IFG1_t SFRIFG1 = {
        ACCVIFG     : ACCVIFG_OFF,
        NMIIFG      : NMIIFG_OFF,
        OFIFG       : OFIFG_OFF,
        WDTIFG      : WDTIFG_OFF
    };

   /*!
    *  ======== getSFRIE1 ========
    *  Gets a bit from the register in SFRIE1
    *
    *  @see #getSFRIE1
    */
    Bool    getSFRIE1(String register);

   /*!
    *  ======== setSFRIE1 ========
    *  Sets a bit in the register SFRIE1
    *
    *  @see #setSFRIE1
    */
    Bool    setSFRIE1(String register, Bool set);

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "SFRIE1" , regForceSet : false },
        { register : "SFRIFG1" , regForceSet : false },
    ];
}
