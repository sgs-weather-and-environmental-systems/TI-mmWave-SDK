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


/*
 *  ======== IMSP430F55xx.xdc ========
 *  Common definitions for MSP430F55xx devices
 *
 *  This device can load code for different MSP430 ISAs - `MSP430` and
 *  `MSP430X`. The parameter `{@link #isa}` is set to a JavaScript regular
 *  expression that covers different MSP430 ISAs.
 *
 */

metaonly interface IMSP430F55xx inherits ti.catalog.msp430.IMSP430
{

instance:

    override config string   cpuCore = "MSP430X";
    override config string   isa     = "430|430X";

    config ti.catalog.msp430.peripherals.special_function.IE1.Instance
        interruptEnableRegister1;
    config ti.catalog.msp430.peripherals.timer.Timer0_A5.Instance TA0;
    config ti.catalog.msp430.peripherals.timer.Timer1_A3.Instance TA1;
    config ti.catalog.msp430.peripherals.timer.Timer2_A3.Instance TA2;
    config ti.catalog.msp430.peripherals.timer.Timer0_B7.Instance TB0;
    config ti.catalog.msp430.peripherals.watchdog.WDTplus.Instance wdtPlus;
    config ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller.Instance
        interruptController;

    /*!
     *  ======== commonMap ========
     *  Memory map elements shared by all MSP430F55xx devices
     */
    config xdc.platform.IPlatform.Memory commonMap[string] = [

        ["PERIPHERALS", {
            comment:    "Memory mapped peripherals",
            name:       "PERIPHERALS",
            base:       0x0,
            len:        0x1000,
            space:      "io",
            access:     "RW"
        }],

        ["BSL", {
            comment:    "Bootstrap loader (flash)",
            name:       "BSL",
            base:       0x1000,
            len:        0x800,
            space:      "code",
            access:     "RW"
        }],

        ["INFOD", {
            comment:    "Information Memory D (flash)",
            name:       "INFOD",
            base:       0x1800,
            len:        0x80,
            space:      "data",
            access:     "RW"
        }],

        ["INFOC", {
            comment:    "Information Memory C (flash)",
            name:       "INFOC",
            base:       0x1880,
            len:        0x80,
            space:      "data",
            access:     "RW"
        }],

        ["INFOB", {
            comment:    "Information Memory B (flash)",
            name:       "INFOB",
            base:       0x1900,
            len:        0x80,
            space:      "data",
            access:     "RW"
        }],

        ["INFOA", {
            comment:    "Information Memory A (flash)",
            name:       "INFOA",
            base:       0x1980,
            len:        0x80,
            space:      "data",
            access:     "RW"
        }],

        ["INT00", {
            comment: "Reserved Vector",
            name: "INT00",
            base: 0xFF80,
            len: 0x2,
            space: "data"
        }],

        ["INT01", {
            comment: "Reserved Vector",
            name: "INT01",
            base: 0xFF82,
            len: 0x2,
            space: "data"
        }],

        ["INT02", {
            comment: "Reserved Vector",
            name: "INT02",
            base: 0xFF84,
            len: 0x2,
            space: "data"
        }],

        ["INT03", {
            comment: "Reserved Vector",
            name: "INT03",
            base: 0xFF86,
            len: 0x2,
            space: "data"
        }],

        ["INT04", {
            comment: "Reserved Vector",
            name: "INT04",
            base: 0xFF88,
            len: 0x2,
            space: "data"
        }],

        ["INT05", {
            comment: "Reserved Vector",
            name: "INT05",
            base: 0xFF8A,
            len: 0x2,
            space: "data"
        }],

        ["INT06", {
            comment: "Reserved Vector",
            name: "INT06",
            base: 0xFF8C,
            len: 0x2,
            space: "data"
        }],

        ["INT07", {
            comment: "Reserved Vector",
            name: "INT07",
            base: 0xFF8E,
            len: 0x2,
            space: "data"
        }],

        ["INT08", {
            comment: "Reserved Vector",
            name: "INT08",
            base: 0xFF90,
            len: 0x2,
            space: "data"
        }],

        ["INT09", {
            comment: "Reserved Vector",
            name: "INT09",
            base: 0xFF92,
            len: 0x2,
            space: "data"
        }],

        ["INT10", {
            comment: "Reserved Vector",
            name: "INT10",
            base: 0xFF94,
            len: 0x2,
            space: "data"
        }],

        ["INT11", {
            comment: "Reserved Vector",
            name: "INT11",
            base: 0xFF96,
            len: 0x2,
            space: "data"
        }],

        ["INT12", {
            comment: "Reserved Vector",
            name: "INT12",
            base: 0xFF98,
            len: 0x2,
            space: "data"
        }],

        ["INT13", {
            comment: "Reserved Vector",
            name: "INT13",
            base: 0xFF9A,
            len: 0x2,
            space: "data"
        }],

        ["INT14", {
            comment: "Reserved Vector",
            name: "INT14",
            base: 0xFF9C,
            len: 0x2,
            space: "data"
        }],

        ["INT15", {
            comment: "Reserved Vector",
            name: "INT15",
            base: 0xFF9E,
            len: 0x2,
            space: "data"
        }],

        ["INT16", {
            comment: "Reserved Vector",
            name: "INT16",
            base: 0xFFA0,
            len: 0x2,
            space: "data"
        }],

        ["INT17", {
            comment: "Reserved Vector",
            name: "INT17",
            base: 0xFFA2,
            len: 0x2,
            space: "data"
        }],

        ["INT18", {
            comment: "Reserved Vector",
            name: "INT18",
            base: 0xFFA4,
            len: 0x2,
            space: "data"
        }],

        ["INT19", {
            comment: "Reserved Vector",
            name: "INT19",
            base: 0xFFA6,
            len: 0x2,
            space: "data"
        }],

        ["INT20", {
            comment: "Reserved Vector",
            name: "INT20",
            base: 0xFFA8,
            len: 0x2,
            space: "data"
        }],

        ["INT21", {
            comment: "Reserved Vector",
            name: "INT21",
            base: 0xFFAA,
            len: 0x2,
            space: "data"
        }],

        ["INT22", {
            comment: "Reserved Vector",
            name: "INT22",
            base: 0xFFAC,
            len: 0x2,
            space: "data"
        }],

        ["INT23", {
            comment: "Reserved Vector",
            name: "INT23",
            base: 0xFFAE,
            len: 0x2,
            space: "data"
        }],

        ["INT24", {
            comment: "Reserved Vector",
            name: "INT24",
            base: 0xFFB0,
            len: 0x2,
            space: "data"
        }],

        ["INT25", {
            comment: "Reserved Vector",
            name: "INT25",
            base: 0xFFB2,
            len: 0x2,
            space: "data"
        }],

        ["INT26", {
            comment: "Reserved Vector",
            name: "INT26",
            base: 0xFFB4,
            len: 0x2,
            space: "data"
        }],

        ["INT27", {
            comment: "Reserved Vector",
            name: "INT27",
            base: 0xFFB6,
            len: 0x2,
            space: "data"
        }],

        ["INT28", {
            comment: "Reserved Vector",
            name: "INT28",
            base: 0xFFB8,
            len: 0x2,
            space: "data"
        }],

        ["INT29", {
            comment: "Reserved Vector",
            name: "INT29",
            base: 0xFFBA,
            len: 0x2,
            space: "data"
        }],

        ["INT30", {
            comment: "Reserved Vector",
            name: "INT30",
            base: 0xFFBC,
            len: 0x2,
            space: "data"
        }],

        ["INT31", {
            comment: "Reserved Vector",
            name: "INT31",
            base: 0xFFBE,
            len: 0x2,
            space: "data"
        }],

        ["INT32", {
            comment: "Reserved Vector",
            name: "INT32",
            base: 0xFFC0,
            len: 0x2,
            space: "data"
        }],

        ["INT33", {
            comment: "Reserved Vector",
            name: "INT33",
            base: 0xFFC2,
            len: 0x2,
            space: "data"
        }],

        ["INT34", {
            comment: "Reserved Vector",
            name: "INT34",
            base: 0xFFC4,
            len: 0x2,
            space: "data"
        }],

        ["INT35", {
            comment: "Reserved Vector",
            name: "INT35",
            base: 0xFFC6,
            len: 0x2,
            space: "data"
        }],

        ["INT36", {
            comment: "Reserved Vector",
            name: "INT36",
            base: 0xFFC8,
            len: 0x2,
            space: "data"
        }],

        ["INT37", {
            comment: "Reserved Vector",
            name: "INT37",
            base: 0xFFCA,
            len: 0x2,
            space: "data"
        }],

        ["INT38", {
            comment: "Reserved Vector",
            name: "INT38",
            base: 0xFFCC,
            len: 0x2,
            space: "data"
        }],

        ["INT39", {
            comment: "Reserved Vector",
            name: "INT39",
            base: 0xFFCE,
            len: 0x2,
            space: "data"
        }],

        ["INT40", {
            comment: "Reserved Vector",
            name: "INT40",
            base: 0xFFD0,
            len: 0x2,
            space: "data"
        }],

        ["INT41", {
            comment: "RTC_A Vector",
            name: "INT41",
            base: 0xFFD2,
            len: 0x2,
            space: "data"
        }],

        ["INT42", {
            comment: "I/O Port P2 Vector",
            name: "INT42",
            base: 0xFFD4,
            len: 0x2,
            space: "data"
        }],

        ["INT43", {
            comment: "TA2 CCR1-CCR2 Vector",
            name: "INT43",
            base: 0xFFD6,
            len: 0x2,
            space: "data"
        }],

        ["INT44", {
            comment: "TA2 CCR0 Vector",
            name: "INT44",
            base: 0xFFD8,
            len: 0x2,
            space: "data"
        }],

        ["INT45", {
            comment: "USCI_B1 Receive/Transmit Vector",
            name: "INT45",
            base: 0xFFDA,
            len: 0x2,
            space: "data"
        }],

        ["INT46", {
            comment: "USCI_A1 Receive/Transmit Vector",
            name: "INT46",
            base: 0xFFDC,
            len: 0x2,
            space: "data"
        }],

        ["INT47", {
            comment: "I/O Port P1 Vector",
            name: "INT47",
            base: 0xFFDE,
            len: 0x2,
            space: "data"
        }],

        ["INT48", {
            comment: "TA1 CCR1-CCR2 Vector",
            name: "INT48",
            base: 0xFFE0,
            len: 0x2,
            space: "data"
        }],

        ["INT49", {
            comment: "TA1 CCR0 Vector",
            name: "INT49",
            base: 0xFFE2,
            len: 0x2,
            space: "data"
        }],

        ["INT50", {
            comment: "DMA Vector",
            name: "INT50",
            base: 0xFFE4,
            len: 0x2,
            space: "data"
        }],

        ["INT51", {
            comment: "USB_UBM Vector",
            name: "INT51",
            base: 0xFFE6,
            len: 0x2,
            space: "data"
        }],

        ["INT52", {
            comment: "TA0 CCR1-CCR4 Vector",
            name: "INT52",
            base: 0xFFE8,
            len: 0x2,
            space: "data"
        }],

        ["INT53", {
            comment: "TA0 CCR0 Vector",
            name: "INT53",
            base: 0xFFEA,
            len: 0x2,
            space: "data"
        }],

        ["INT54", {
            comment: "ADC12_A Vector",
            name: "INT54",
            base: 0xFFEC,
            len: 0x2,
            space: "data"
        }],

        ["INT55", {
            comment: "USCI_B0 Receive/Transmit Vector",
            name: "INT55",
            base: 0xFFEE,
            len: 0x2,
            space: "data"
        }],

        ["INT56", {
            comment: "USCI_A0 Receive/Transmit Vector",
            name: "INT56",
            base: 0xFFF0,
            len: 0x2,
            space: "data"
        }],

        ["INT57", {
            comment: "Watchdog Timer_A Interval Timer Mode Vector",
            name: "INT57",
            base: 0xFFF2,
            len: 0x2,
            space: "data"
        }],

        ["INT58", {
            comment: "TB0 CCR1-CCR6 Vector",
            name: "INT58",
            base: 0xFFF4,
            len: 0x2,
            space: "data"
        }],

        ["INT59", {
            comment: "TB0 CCR0 Vector",
            name: "INT59",
            base: 0xFFF6,
            len: 0x2,
            space: "data"
        }],

        ["INT60", {
            comment: "Comp_B Vector",
            name: "INT60",
            base: 0xFFF8,
            len: 0x2,
            space: "data"
        }],

        ["INT61", {
            comment: "User NMI Vector",
            name: "INT61",
            base: 0xFFFA,
            len: 0x2,
            space: "data"
        }],

        ["INT62", {
            comment: "System NMI Vector",
            name: "INT62",
            base: 0xFFFC,
            len: 0x2,
            space: "data"
        }],

        ["RESET", {
            comment: "Reset Vector",
            name: "RESET",
            base: 0xFFFE,
            len:  0x2,
            space: "data"
        }],
    ];
}
