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


import ti.catalog.msp430.peripherals.timer.Timer_A3;
import ti.catalog.msp430.peripherals.timer.Timer_B3;
import ti.catalog.msp430.peripherals.clock.BCSplus;
import ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx;
import ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx;
import ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx;
import ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx;
import ti.catalog.msp430.peripherals.adc.ADC10;
import ti.catalog.msp430.peripherals.watchdog.WDTplus;
import ti.catalog.msp430.peripherals.oa.OA_2;
import ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F22x4;
import ti.catalog.msp430.peripherals.memory.Flash_2xx;
import ti.catalog.msp430.peripherals.special_function.IE1;
import ti.catalog.msp430.peripherals.special_function.IE2;
import ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller;

/*!
 *  ======== IMSP430x22xx.xdc ========
 *  Common definition for MSP430x22xx devices
 */
metaonly interface IMSP430x22xx inherits ti.catalog.msp430.IMSP430
{

instance:

    config Timer_A3.Instance timer_A3;
    config Timer_B3.Instance timer_B3;
    config BCSplus.Instance clock;
    config USCI_A0_UART_2xx.Instance usci_A0_UART;
    config USCI_A0_SPI_2xx.Instance usci_A0_SPI;
    config USCI_B0_SPI_2xx.Instance usci_B0_SPI;
    config USCI_B0_I2C_2xx.Instance usci_B0_I2C;
    config ADC10.Instance adc10;
    config WDTplus.Instance wdtPlus;
    config OA_2.Instance oa;
    config GPIO_MSP430F22x4.Instance gpio;
    config Flash_2xx.Instance flash;
    config IE1.Instance interruptEnableRegister1;
    config IE2.Instance interruptEnableRegister2;
    config Interrupt_Controller.Instance interruptController;

    /*!
     *  ======== commonMap ========
     *  Memory map elements shared by all MSP430x22xx devices
     */
    config xdc.platform.IPlatform.Memory commonMap[string]  = [
        ["PERIPHERALS_8BIT", {
            comment:    "Memory mapped I/O registers",
            name:       "PERIPHERALS_8BIT",
            base:       0x0010,
            len:        0x00F0,
            space:      "io",
            access:     "RW"
        }],

        ["PERIPHERALS_16BIT", {
            comment:    "Memory mapped I/O registers",
            name:       "PERIPHERALS_16BIT",
            base:       0x0100,
            len:        0x0100,
            space:      "io",
            access:     "RW"
        }],

        ["BSLSKEY", {
            comment:    "Boot loader security key",
            name:       "BSLSKEY",
            base:       0xFFDE,
            len:        0x0002,
            space:      "data",
            access:     "RI"
        }],

        ["INT00", {
            comment:    "Reserved Vector (int00)",
            name:       "INT00",
            base:       0xFFE0,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT01", {
            comment:    "Reserved Vector (int01)",
            name:       "INT01",
            base:       0xFFE2,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT02", {
            comment:    "I/O Port P1 Vector (int02)",
            name:       "INT02",
            base:       0xFFE4,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT03", {
            comment:    "I/O Port P2 Vector (int03)",
            name:       "INT03",
            base:       0xFFE6,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT04", {
            comment:    "Reserved Vector (int04)",
            name:       "INT04",
            base:       0xFFE8,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT05", {
            comment:    "ADC10 Vector (int05)",
            name:       "INT05",
            base:       0xFFEA,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT06", {
            comment:    "USCI_A0/B0 Transmit Vector (int06)",
            name:       "INT06",
            base:       0xFFEC,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT07", {
            comment:    "USCI_A0/B0 Receive Vector (int07)",
            name:       "INT07",
            base:       0xFFEE,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT08", {
            comment:    "Timer_A3 TBCCR1 Vector (int08)",
            name:       "INT08",
            base:       0xFFF0,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT09", {
            comment:    "Timer_A3 TBCCR0 Vector (int09)",
            name:       "INT09",
            base:       0xFFF2,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT10", {
            comment:    "Watchdog Vector (int10)",
            name:       "INT10",
            base:       0xFFF4,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT11", {
            comment:    "Reserved Vector (int11)",
            name:       "INT11",
            base:       0xFFF6,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT12", {
            comment:    "Timer_B3 TBCCR1 Vector (int12)",
            name:       "INT12",
            base:       0xFFF8,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT13", {
            comment:    "Timer_B3 TBCCR0 Vector (int13)",
            name:       "INT13",
            base:       0xFFFA,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INT14", {
            comment:    "NMI Vector (int14)",
            name:       "INT14",
            base:       0xFFFC,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["RESET", {
            comment:    "Reset Vector (int15)",
            name:       "RESET",
            base:       0xFFFE,
            len:        0x0002,
            space:      "data",
            access:     "RW"
        }],

        ["INFOA", {
            comment:    "INFO Flash Memory Segment A",
            name:       "INFOA",
            base:       0x10C0,
            len:        0x0040,
            space:      "data",
            access:     "RW"
        }],

        ["INFOB", {
            comment:    "INFO Flash Memory Segment B",
            name:       "INFOB",
            base:       0x1080,
            len:        0x0040,
            space:      "data",
            access:     "RW"
        }],

        ["INFOC", {
            comment:    "INFO Flash Memory Segment C",
            name:       "INFOC",
            base:       0x1040,
            len:        0x0040,
            space:      "data",
            access:     "RW"
        }],

        ["INFOD", {
            comment:    "INFO Flash Memory Segment D",
            name:       "INFOD",
            base:       0x1000,
            len:        0x0040,
            space:      "data",
            access:     "RW"
        }],
    ];
}
