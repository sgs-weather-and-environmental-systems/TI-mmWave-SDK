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
 *  ======== IE2 ========
 *  MSP430 Interrupt Enable Register 2
 */
metaonly module IE2 inherits xdc.platform.IPeripheral {

    /* USCI_B0 transmit interrupt enable */
    enum UCB0TXIE_t {
        UCB0TXIE_OFF = 0x00,            /*! Interrupt disabled */
        UCB0TXIE     = 0x08             /*! Interrupt enabled */
    };

    /* USCI_B0 receive interrupt enable */
    enum UCB0RXIE_t {
        UCB0RXIE_OFF = 0x00,            /*! Interrupt disabled */
        UCB0RXIE     = 0x04             /*! Interrupt enabled */
    };

    /* USCI_A0 transmit interrupt enable */
    enum UCA0TXIE_t {
        UCA0TXIE_OFF = 0x00,            /*! Interrupt disabled */
        UCA0TXIE     = 0x02             /*! Interrupt enabled */
    };

    /* USCI_A0 receive interrupt enable */
    enum UCA0RXIE_t {
        UCA0RXIE_OFF = 0x00,            /*! Interrupt disabled */
        UCA0RXIE     = 0x01             /*! Interrupt enabled */
    };

    /* USCI_B0 transmit interrupt flag */
    enum UCB0TXIFG_t {
        UCB0TXIFG_OFF = 0x00,           /*! No interrupt pending */
        UCB0TXIFG     = 0x08            /*! Interrupt pending */
    };

    /* USCI_B0 receive interrupt flag */
    enum UCB0RXIFG_t {
        UCB0RXIFG_OFF = 0x00,           /*! No interrupt pending */
        UCB0RXIFG     = 0x04            /*! Interrupt pending */
    };

    /* USCI_A0 transmit interrupt flag */
    enum UCA0TXIFG_t {
        UCA0TXIFG_OFF = 0x00,           /*! No interrupt pending */
        UCA0TXIFG     = 0x02            /*! Interrupt pending */
    };

    /* USCI_A0 receive interrupt flag */
    enum UCA0RXIFG_t {
        UCA0RXIFG_OFF = 0x00,           /*! No interrupt pending */
        UCA0RXIFG     = 0x01            /*! Interrupt pending */
    };

    /*! IE2, Interrupt Enable Register 2 */
    struct IE2_t {
        UCB0TXIE_t  UCB0TXIE;           /*! USCI_B0 transmit interrupt enable
                                         *  0 Interrupt disabled
                                         *  1 Interrupt enabled */
        UCB0RXIE_t  UCB0RXIE;           /*! USCI_B0 receive interrupt enable
                                         *  0 Interrupt disabled
                                         *  1 Interrupt enabled */
        UCA0TXIE_t  UCA0TXIE;           /*! USCI_A0 transmit interrupt enable
                                         *  0 Interrupt disabled
                                         *  1 Interrupt enabled */
        UCA0RXIE_t  UCA0RXIE;           /*! USCI_A0 receive interrupt enable
                                         *  0 Interrupt disabled
                                         *  1 Interrupt enabled */
    }

    /*! IFG2, Interrupt Flag Register 2 */
    struct IFG2_t {
        UCB0TXIFG_t  UCB0TXIFG;         /*! USCI_B0 transmit interrupt flag
                                         *  0 No interrupt pending
                                         *  1 Interrupt pending */
        UCB0RXIFG_t  UCB0RXIFG;         /*! USCI_B0 receive interrupt flag
                                         *  0 No interrupt pending
                                         *  1 Interrupt pending */
        UCA0TXIFG_t  UCA0TXIFG;         /*! USCI_A0 transmit interrupt flag
                                         *  0 No interrupt pending
                                         *  1 Interrupt pending */
        UCA0RXIFG_t  UCA0RXIFG;         /*! USCI_A0 receive interrupt flag
                                         *  0 No interrupt pending
                                         *  1 Interrupt pending */
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
    /*! IE2, Interrupt Enable Register 2 */
    config IE2_t IE2 = {
        UCB0TXIE    : UCB0TXIE_OFF,
        UCB0RXIE    : UCB0RXIE_OFF,
        UCA0TXIE    : UCA0TXIE_OFF,
        UCA0RXIE    : UCA0RXIE_OFF,
    };

    /*! IFG2, Interrupt Flag Register 2 */
    config IFG2_t IFG2 = {
        UCB0TXIFG   : UCB0TXIFG_OFF,
        UCB0RXIFG   : UCB0RXIFG_OFF,
        UCA0TXIFG   : UCA0TXIFG_OFF,
        UCA0RXIFG   : UCA0RXIFG_OFF,
    };

   /*!
    *  ======== getUCB0TXIE ========
    *  Gets UCB0TXIE bit
    *
    *  @see #getUCB0TXIE
    */
    Bool    getUCB0TXIE();

   /*!
    *  ======== setUCB0TXIE ========
    *  Sets UCB0TXIE bit
    *
    *  @see #setUCB0TXIE
    */
    Bool    setUCB0TXIE(Bool set);

   /*!
    *  ======== getUCB0RXIE ========
    *  Gets UCB0RXIE bit
    *
    *  @see #getUCB0RXIE
    */
    Bool    getUCB0RXIE();

   /*!
    *  ======== setUCB0RXIE ========
    *  Sets UCB0RXIE bit
    *
    *  @see #setUCB0RXIE
    */
    Bool    setUCB0RXIE(Bool set);

   /*!
    *  ======== getUCA0TXIE ========
    *  Gets UCA0TXIE bit
    *
    *  @see #getUCA0TXIE
    */
    Bool    getUCA0TXIE();

   /*!
    *  ======== setUCA0TXIE ========
    *  Sets UCA0TXIE bit
    *
    *  @see #setUCA0TXIE
    */
    Bool    setUCA0TXIE(Bool set);

   /*!
    *  ======== getUCA0RXIE ========
    *  Gets UCA0RXIE bit
    *
    *  @see #getUCA0RXIE
    */
    Bool    getUCA0RXIE();

   /*!
    *  ======== setUCA0RXIE ========
    *  Sets UCA0RXIE bit
    *
    *  @see #setUCA0RXIE
    */
    Bool    setUCA0RXIE(Bool set);

    /*! IE2 interrupt enables
     */
    config regIntVect_t interruptSource[8];

    /*!
     *  ======== forceSetDefaultRegister ========
     *  Determine if each Register needs to be forced set or not
     */
    readonly config ForceSetDefaultRegister_t forceSetDefaultRegister[] =
    [
        { register : "IE2" , regForceSet : false },
        { register : "IFG2" , regForceSet : false },
    ];
}
