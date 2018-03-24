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
 * Universal Serial Communication Interface B1 SPI 2xx
 */
metaonly module USCI_B1_SPI_2xx inherits IUSCI_B1_SPI {
    /*
     *  ======== create ========
     */
    create(IClock.Instance clock);

    /*! USCI_B1 transmit interrupt enable */
    enum UCB1TXIE_t {
        UCB1TXIE_OFF = 0x00,    /*! Interrupt disabled */
        UCB1TXIE = 0x08         /*! Interrupt enabled */
    };

    /*! USCI_B1 receive interrupt enable */
    enum UCB1RXIE_t {
        UCB1RXIE_OFF = 0x00,     /*! Interrupt disabled */
        UCB1RXIE = 0x04          /*! Interrupt enabled */
    };

    /*! USCI_xx SPI Interrupt Enable Register */
    struct UC1IE_t {
        UCB1TXIE_t  UCB1TXIE;   /*! USCI_B1 transmit interrupt enable
                                 *  0  Interrupt disabled
                                 *  1  Interrupt enabled */
        UCB1RXIE_t  UCB1RXIE;   /*! USCI_B1 receive interrupt enable
                                 *  0  Interrupt disabled
                                 *  1  Interrupt enabled */
    }

instance:
    /*! @_nodoc */
    config IClock.Instance clock;

    /*! USCI_B1 Interrupt Enable Register */
    config UC1IE_t UC1IE = {
        UCB1TXIE    : UCB1TXIE_OFF,
        UCB1RXIE    : UCB1RXIE_OFF
    };

    /*! USCI_A1 SPI interrupt enables */
    config regIntVect_t interruptSource[2];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "UCB1CTL0"   , regForceSet : false },
        { register : "UCB1CTL1"   , regForceSet : false },
        { register : "UCB1BR0"    , regForceSet : false },
        { register : "UCB1BR1"    , regForceSet : false },
        { register : "UCB1STAT"   , regForceSet : false },
        { register : "UCB1RXBUF"  , regForceSet : false },
        { register : "UCB1TXBUF"  , regForceSet : false },
        { register : "UC1IE"      , regForceSet : false }
    ];
}
