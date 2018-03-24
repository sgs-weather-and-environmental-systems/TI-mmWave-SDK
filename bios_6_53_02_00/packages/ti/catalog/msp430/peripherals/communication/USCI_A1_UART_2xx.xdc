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
 * Universal Serial Communication Interface
 */
metaonly module USCI_A1_UART_2xx inherits IUSCI_A1_UART {
    /* Add 2xx-specific stuff here */

    /*
     *  ======== create ========
     */
    create(IClock.Instance clock);

    /*! USCI_A1 transmit interrupt enable */
    enum UCA1TXIE_t {
        UCA1TXIE_OFF = 0x00,    /*! Interrupt disabled */
        UCA1TXIE = 0x02         /*! Interrupt enabled */
    };

    /*! USCI_A1 receive interrupt enable */
    enum UCA1RXIE_t {
        UCA1RXIE_OFF = 0x00,     /*! Interrupt disabled */
        UCA1RXIE = 0x01          /*! Interrupt enabled */
    };

    /*! USCI_Ax UART Interrupt Enable Register */
    struct UC1IE_t {
        UCA1TXIE_t  UCA1TXIE;   /*! USCI_A1 transmit interrupt enable
                                 *  0  Interrupt disabled
                                 *  1  Interrupt enabled */
        UCA1RXIE_t  UCA1RXIE;   /*! USCI_A1 receive interrupt enable
                                 *  0  Interrupt disabled
                                 *  1  Interrupt enabled */
    }

instance:
    /*! @_nodoc */
    config IClock.Instance clock;

    /*! USCI_A1 Interrupt Enable Register */
    config UC1IE_t UC1IE = {
        UCA1TXIE    : UCA1TXIE_OFF,
        UCA1RXIE    : UCA1RXIE_OFF
    };

    /*! USCI_A1 UART interrupt enables */
    config regIntVect_t interruptSource[2];

    /*! Determine if each Register needs to be forced set or not */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "UCA1CTL0"   , regForceSet : false },
        { register : "UCA1CTL1"   , regForceSet : false },
        { register : "UCA1BR0"    , regForceSet : false },
        { register : "UCA1BR1"    , regForceSet : false },
        { register : "UCA1MCTL"   , regForceSet : false },
        { register : "UCA1STAT"   , regForceSet : false },
        { register : "UCA1RXBUF"  , regForceSet : false },
        { register : "UCA1TXBUF"  , regForceSet : false },
        { register : "UCA1ABCTL"  , regForceSet : false },
        { register : "UCA1IRTCTL" , regForceSet : false },
        { register : "UCA1IRRCTL" , regForceSet : false },
        { register : "UC1IE"      , regForceSet : false }
    ];
}
