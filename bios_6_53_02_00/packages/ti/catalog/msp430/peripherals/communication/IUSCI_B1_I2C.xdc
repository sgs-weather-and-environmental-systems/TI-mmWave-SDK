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
 * Universal Serial Communication Interface B1 I2C 2xx
 */
metaonly interface IUSCI_B1_I2C inherits IUSCI_I2C {

instance:
    /*! Control Register 0 */
    config UCxCTL0_t UCB1CTL0 = {
        UCA10       : UCA10_OFF,
        UCSLA10     : UCSLA10_OFF,
        UCMM        : UCMM_OFF,
        UCMST       : UCMST_OFF,
        UCMODE      : UCMODE_0,
        UCSYNC      : UCSYNC,
    };

    /*! Control Register 1 */
    config UCxCTL1_t UCB1CTL1 = {
        UCSSEL      : UCSSEL_0,
        UCTR        : UCTR_OFF,
        UCTXNACK    : UCTXNACK_OFF,
        UCTXSTP     : UCTXSTP_OFF,
        UCTXSTT     : UCTXSTT_OFF,
        UCSWRST     : UCSWRST,
    };

    /*! Status Register */
    config UCxSTAT_t UCB1STAT = {
        UCSCLLOW    : UCSCLLOW,
        UCGC        : UCGC,
        UCBBUSY     : UCBBUSY,
        UCNACKIFG   : UCNACKIFG,
        UCSTPIFG    : UCSTPIFG,
        UCSTTIFG    : UCSTTIFG,
        UCALIFG     : UCALIFG,
    };

    /*! I2C Own Address Register */
    config UCBxI2COA_t UCB1I2COA = {
        UCGCEN      : UCGCEN_OFF,
        I2COA       : 0,
    };

    /*! I2C Slave Address Register */
    config Bits8 UCB1I2CSA = 0;

    /*! Receive Buffer Register */
    config Bits8 UCB1RXBUF = 0;

    /*! Transmit Buffer Register */
    config Bits8 UCB1TXBUF = 0;

    /*! Bit Rate Control Register 0 */
    config Bits8 UCB1BR0 = 0;

    /*! Bit Rate Control Register 1 */
    config Bits8 UCB1BR1 = 0;
}
