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

requires ti.catalog.msp430.peripherals.clock;

/*!
 *  ======== ti.catalog.msp430.peripherals.communication ========
 *  MSP430 USCI peripherals
 */
package ti.catalog.msp430.peripherals.communication [1, 0, 0]
{
    interface IUSI;
    interface IUSCI , IUSCI_I2C , IUSCI_SPI , IUSCI_UART;
    interface IUSCI_A0_UART , IUSCI_A0_SPI , IUSCI_A1_UART;
    interface IUSCI_B0_SPI , IUSCI_B0_I2C;
    interface IEUSCI;
    module USCI_A0_UART_2xx;
    module USCI_A0_SPI_2xx;
    module USCI_B0_SPI_2xx;
    module USCI_B0_I2C_2xx;
    module USCI_A1_UART_2xx;
    module USCI_A1_SPI_2xx;
    module USCI_B1_SPI_2xx;
    module USCI_B1_I2C_2xx;
    module USI;
    module EUSCI_A0;
    module EUSCI_A1;
    module EUSCI_B0;
}
