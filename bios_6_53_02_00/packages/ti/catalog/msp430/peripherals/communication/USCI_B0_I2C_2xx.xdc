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

import ti.catalog.msp430.peripherals.clock.IClock;

/*!
 * Universal Serial Communication Interface B0 I2C 2xx
 */
metaonly module USCI_B0_I2C_2xx inherits IUSCI_B0_I2C {

    /*
     *  ======== create ========
     */
    create(IClock.Instance clock);

    /*! Not-acknowledge interrupt enable */
    enum UCNACKIE_t {
        UCNACKIE_OFF = 0x00,    /*! Interrupt disabled */
        UCNACKIE = 0x80         /*! Interrupt enabled */
    };

    /*! Stop condition interrupt enable */
    enum UCSTPIE_t {
        UCSTPIE_OFF = 0x00,     /*! Interrupt disabled */
        UCSTPIE = 0x80          /*! Interrupt enabled */
    };

    /*! Start condition interrupt enable */
    enum UCSTTIE_t {
        UCSTTIE_OFF = 0x00,     /*! Interrupt disabled */
        UCSTTIE = 0x80          /*! Interrupt enabled */
    };

    /*! Arbitration lost interrupt enable */
    enum UCALIE_t {
        UCALIE_OFF = 0x00,      /*! Interrupt disabled */
        UCALIE = 0x80           /*! Interrupt enabled */
    };

    /*! USCI_Bx I2C Interrupt Enable Register */
    struct UCBxI2CIE_t {
        UCNACKIE_t  UCNACKIE;   /*! Not-acknowledge interrupt enable
                                 *  0  Interrupt disabled
                                 *  1  Interrupt enabled */
        UCSTPIE_t   UCSTPIE;    /*! Stop condition interrupt enable
                                 *  0  Interrupt disabled
                                 *  1  Interrupt enabled */
        UCSTTIE_t   UCSTTIE;    /*! Start condition interrupt enable
                                 *  0  Interrupt disabled
                                 *  1  Interrupt enabled */
        UCALIE_t    UCALIE;    /*! Arbitration lost interrupt enable
                                 *  0  Interrupt disabled
                                 *  1  Interrupt enabled */
    }

instance:
    /*! @_nodoc */
    config IClock.Instance clock;

    /*! USCI_Bx I2C Interrupt Enable Register */
    config UCBxI2CIE_t UCB0I2CIE = {
        UCNACKIE    : UCNACKIE_OFF,
        UCSTPIE     : UCSTPIE_OFF,
        UCSTTIE     : UCSTTIE_OFF,
        UCALIE      : UCALIE_OFF,
    };

   /*!
    *  ======== setUCNACKIE ========
    *  Sets UCNACKIE bit
    *
    *  @see #setUCNACKIE
    */
    Bool setUCNACKIE(Bool set);

   /*!
    *  ======== getUCNACKIE ========
    *  Gets UCNACKIE bit
    *
    *  @see #getUCNACKIE
    */
    Bool getUCNACKIE();

   /*!
    *  ======== setUCSTPIE ========
    *  Sets UCSTPIE bit
    *
    *  @see #setUCSTPIE
    */
    Bool setUCSTPIE(Bool set);

   /*!
    *  ======== getUCSTPIE ========
    *  Gets UCSTPIE bit
    *
    *  @see #getUCSTPIE
    */
    Bool getUCSTPIE();

   /*!
    *  ======== setUCSTTIE ========
    *  Sets UCSTTIE bit
    *
    *  @see #setUCSTTIE
    */
    Bool setUCSTTIE(Bool set);

   /*!
    *  ======== getUCSTTIE ========
    *  Gets UCSTTIE bit
    *
    *  @see #getUCSTTIE
    */
    Bool getUCSTTIE();

   /*!
    *  ======== setUCALIE ========
    *  Sets UCALIE bit
    *
    *  @see #setUCALIE
    */
    Bool setUCALIE(Bool set);

   /*!
    *  ======== getUCALIE ========
    *  Gets UCALIE bit
    *
    *  @see #getUCALIE
    */
    Bool getUCALIE();

    /*! USCI_B0 I2C interrupt enables */
    config regIntVect_t interruptSource[4];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "UCB0CTL0"   , regForceSet : false },
        { register : "UCB0CTL1"   , regForceSet : false },
        { register : "UCB0BR0"    , regForceSet : false },
        { register : "UCB0BR1"    , regForceSet : false },
        { register : "UCB0STAT"   , regForceSet : false },
        { register : "UCB0RXBUF"  , regForceSet : false },
        { register : "UCB0TXBUF"  , regForceSet : false },
        { register : "UCB0I2COA"  , regForceSet : false },
        { register : "UCB0I2CSA"  , regForceSet : false },
        { register : "UCB0I2CIE"  , regForceSet : false }
    ];
}
