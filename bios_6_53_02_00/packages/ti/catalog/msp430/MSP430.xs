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


var peripheralsTable = {};

peripheralsTable["MSP430G2210"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false,
                 hasRosc: false, hasVLO: true, hasAllCal: false,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A2",
        required: ["clock"],
        params: {name: "Timer_A2", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2210",
        required: ["comparator"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: -1, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: -1, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: -1, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: -1, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"}
                ]
        }
    }
];

peripheralsTable["MSP430G2230"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false,
                 hasRosc: false, hasVLO: true, hasAllCal: false,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A2",
        required: ["clock"],
        params: {name: "Timer_A2", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USI",
        required: ["clock"],
        params: {name: "usi",
                 interruptSource: [{registerName: "USISTTIE", priority: 20, priorityName: "USI"},
                                   {registerName: "USIIE",   priority: 20, priorityName: "USI"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2230",
        required: ["usi", "adc10"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: -1, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: -1, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: -1, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: -1, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x01"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false,
                 hasRosc: false, hasVLO: true, hasAllCal: false,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A2",
        required: ["clock"],
        params: {name: "Timer_A2", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x01",
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x11"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false, hasRosc: false,
                 hasVLO: true, hasAllCal: false,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A2",
        required: ["clock"],
        params: {name: "Timer_A2", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x11",
        required: ["comparator"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x21"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false, hasRosc: false,
                 hasVLO: true, hasAllCal: false,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USI",
        required: ["clock"],
        params: {name: "usi",
                 interruptSource: [{registerName: "USISTTIE", priority: 20, priorityName: "USI"},
                                   {registerName: "USIIE",   priority: 20, priorityName: "USI"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A2",
        required: ["clock"],
        params: {name: "Timer_A2", baseAddr: 0x160, intNum: 9, numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x21",
        required: ["usi"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x31"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false, hasRosc: false,
                 hasVLO: true, hasAllCal: false,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USI",
        required: ["clock"],
        params: {name: "usi",
                 interruptSource: [{registerName: "USISTTIE", priority: 20, priorityName: "USI"},
                                   {registerName: "USIIE",   priority: 20, priorityName: "USI"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A2",
        required: ["clock"],
        params: {name: "Timer_A2", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x31",
        required: ["usi", "adc10"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x02"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false,
                 hasRosc: false, hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USI",
        required: ["clock"],
        params: {name: "usi",
                 interruptSource: [{registerName: "USISTTIE", priority: 20, priorityName: "USI"},
                                   {registerName: "USIIE",   priority: 20, priorityName: "USI"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x02",
        required: ["usi"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x12"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false, hasRosc: false,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USI",
        required: ["clock"],
        params: {name: "usi",
                 interruptSource: [{registerName: "USISTTIE", priority: 20, priorityName: "USI"},
                                   {registerName: "USIIE",   priority: 20, priorityName: "USI"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x12",
        required: ["usi", "comparator"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x32"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false,
                 hasRosc: false, hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USI",
        required: ["clock"],
        params: {name: "usi",
                 interruptSource: [{registerName: "USISTTIE", priority: 20, priorityName: "USI"},
                                   {registerName: "USIIE",   priority: 20, priorityName: "USI"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x32",
        required: ["usi", "adc10"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x44"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: false, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_B3",
        required: ["clock"],
        params: {name: "Timer_B3", baseAddr: 0x180, intNum: 13,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x44",
        required: ["adc10", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x52"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false,
                 hasRosc: false, hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USI",
        required: ["clock"],
        params: {name: "usi",
                 interruptSource: [{registerName: "USISTTIE", priority: 20, priorityName: "USI"},
                                   {registerName: "USIIE",   priority: 20, priorityName: "USI"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x52",
        required: ["usi", "comparator", "adc10"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x55"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: false, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x140, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 16, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 17, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 16, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 16, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B3",
        required: ["clock"],
        params: {name: "Timer0_B3", baseAddr: 0x180, intNum: 13,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x55",
        required: ["adc10", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x03"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false, hasRosc: false,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x180, intNum: 8,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 28, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x03",
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x13"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false, hasRosc: false,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x180, intNum: 8,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 28, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x13",
        required: ["comparator"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x33"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false, hasRosc: false,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x180, intNum: 8,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 28, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x33",
        required: ["adc10"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430G2x53"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false, hasRosc: false,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x180, intNum: 8,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 28, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430G2x53",
        required: ["adc10", "comparator"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F20x1"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false,
                 hasRosc: false, hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A2",
        required: ["clock"],
        params: {name: "Timer_A2", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F20x1",
        required: ["comparator"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F20x2"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false,
                 hasRosc: false, hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USI",
        required: ["clock"],
        params: {name: "usi",
                 interruptSource: [{registerName: "USISTTIE", priority: 20, priorityName: "USI"},
                                   {registerName: "USIIE",   priority: 20, priorityName: "USI"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A2",
        required: ["clock"],
        params: {name: "Timer_A2", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F20x2",
        required: ["usi", "adc10"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F20x3"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: false, hasXT2: false,
                 hasRosc: false, hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USI",
        required: ["clock"],
        params: {name: "usi",
                 interruptSource: [{registerName: "USISTTIE", priority: 20, priorityName: "USI"},
                                   {registerName: "USIIE",   priority: 20, priorityName: "USI"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A2",
        required: ["clock"],
        params: {name: "Timer_A2", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.SD16_A",
        required: ["clock"],
        params: {name: "sd16",
                 interruptSource: [{registerName: "SD16OVIE", priority: 21, priorityName: "Sigma Delta ADC"},
                                   {registerName: "SD16IE",   priority: 21, priorityName: "Sigma Delta ADC"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F20x3",
        required: ["usi", "sd16"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: -1, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F21x2"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: false, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A2",
        required: ["clock"],
        params: {name: "Timer1_A2", baseAddr: 0x180, intNum: 13,
                 numberOfTimers: 2,
                 interruptSource: [{registerName: "TAIE",    priority: 28, priorityName: "Timer1_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer1_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer1_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F21x2",
        required: ["adc10", "comparator", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F21x1"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: false, hasRosc: false,
                 hasVLO: false, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F21x1",
        required: ["comparator"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F22x2"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: false, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_B3",
        required: ["clock"],
        params: {name: "Timer_B3", baseAddr: 0x180, intNum: 13,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F22x2",
        required: ["adc10", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F22x4"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: false, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.oa.OA_2",
        params: {name: "oa"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_B3",
        required: ["clock"],
        params: {name: "Timer_B3", baseAddr: 0x180, intNum: 13,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10",
        required: ["clock"],
        params: {name: "adc10",
                 interruptSource: [{registerName: "ADC10IE", priority: 21, priorityName: "ADC10"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F22x4",
        required: ["adc10", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F241x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.svs.SVS",
        params: {name: "svs"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: true, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A1_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A1_UART",
                 interruptSource: [{registerName: "UCA1TXIE for UART", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCA1RXIE for UART", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A1_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A1_SPI",
                 interruptSource: [{registerName: "UCA1TXIE", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCA1RXIE", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B1_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B1_SPI",
                 interruptSource: [{registerName: "UCB1TXIE for SPI", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCB1RXIE for SPI", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B1_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B1_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCSTPIE",  priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCSTTIE",  priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCALIE",   priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCB1TXIE for I2C", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCB1RXIE for I2C", priority: 16, priorityName: "USCI A1-B1 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 25,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_B7",
        required: ["clock"],
        params: {name: "Timer_B7", baseAddr: 0x180, intNum: 29,
                 numberOfTimers: 7,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B7 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.3",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.4",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.5",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.6",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC12",
        required: ["clock"],
        params: {name: "adc12",
                 interruptSource: [{registerName: "ADC12IE0", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE1", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE2", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE3", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE4", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE5", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE6", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE7", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE8", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE9", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE10", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE11", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE12", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE13", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE14", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE15", priority: 21, priorityName: "ADC12"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F241x",
        required: ["adc12", "comparator", "svs", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F261x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.svs.SVS",
        params: {name: "svs"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: true, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A1_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A1_UART",
                 interruptSource: [{registerName: "UCA1TXIE for UART", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCA1RXIE for UART", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A1_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A1_SPI",
                 interruptSource: [{registerName: "UCA1TXIE", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCA1RXIE", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B1_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B1_SPI",
                 interruptSource: [{registerName: "UCB1TXIE for SPI", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCB1RXIE for SPI", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B1_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B1_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCSTPIE",  priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCSTTIE",  priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCALIE",   priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCB1TXIE for I2C", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCB1RXIE for I2C", priority: 16, priorityName: "USCI A1-B1 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 25,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_B7",
        required: ["clock"],
        params: {name: "Timer_B7", baseAddr: 0x180, intNum: 29,
                 numberOfTimers: 7,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B7 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.3",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.4",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.5",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.6",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dac.DAC12",
        params: {name: "dac12",
                 interruptSource: [{registerName: "DAC12IE_0", priority: 14, priorityName: "DAC12"},
                                   {registerName: "DAC12IE_1", priority: 14, priorityName: "DAC12"}
                 ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC12",
        required: ["clock"],
        params: {name: "adc12",
                 interruptSource: [{registerName: "ADC12IE0", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE1", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE2", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE3", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE4", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE5", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE6", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE7", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE8", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE9", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE10", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE11", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE12", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE13", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE14", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE15", priority: 21, priorityName: "ADC12"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F261x",
        required: ["adc12", "comparator", "svs", "dac12", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F23x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.svs.SVS",
        params: {name: "svs"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: true, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_B3",
        required: ["clock"],
        params: {name: "Timer_B3", baseAddr: 0x180, intNum: 13,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC12",
        required: ["clock"],
        params: {name: "adc12",
                 interruptSource: [{registerName: "ADC12IE0", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE1", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE2", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE3", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE4", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE5", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE6", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE7", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE8", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE9", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE10", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE11", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE12", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE13", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE14", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE15", priority: 21, priorityName: "ADC12"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F23x",
        required: ["adc12", "comparator", "svs", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F24x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.svs.SVS",
        params: {name: "svs"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: true, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A1_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A1_UART",
                 interruptSource: [{registerName: "UCA1TXIE for UART", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCA1RXIE for UART", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A1_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A1_SPI",
                 interruptSource: [{registerName: "UCA1TXIE", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCA1RXIE", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B1_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B1_SPI",
                 interruptSource: [{registerName: "UCB1TXIE for SPI", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCB1RXIE for SPI", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B1_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B1_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCSTPIE",  priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCSTTIE",  priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCALIE",   priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCB1TXIE for I2C", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCB1RXIE for I2C", priority: 16, priorityName: "USCI A1-B1 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 25,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_B7",
        required: ["clock"],
        params: {name: "Timer_B7", baseAddr: 0x180, intNum: 29,
                 numberOfTimers: 7,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B7 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.3",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.4",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.5",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.6",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC12",
        required: ["clock"],
        params: {name: "adc12",
                 interruptSource: [{registerName: "ADC12IE0", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE1", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE2", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE3", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE4", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE5", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE6", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE7", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE8", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE9", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE10", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE11", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE12", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE13", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE14", priority: 21, priorityName: "ADC12"},
                                   {registerName: "ADC12IE15", priority: 21, priorityName: "ADC12"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F24x",
        required: ["adc12", "comparator", "svs", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F24x1"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.svs.SVS",
        params: {name: "svs"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: true, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A1_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A1_UART",
                 interruptSource: [{registerName: "UCA1TXIE for UART", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCA1RXIE for UART", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A1_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A1_SPI",
                 interruptSource: [{registerName: "UCA1TXIE", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCA1RXIE", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B1_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B1_SPI",
                 interruptSource: [{registerName: "UCB1TXIE for SPI", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCB1RXIE for SPI", priority: 17, priorityName: "USCI A1-B1 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B1_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B1_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCSTPIE",  priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCSTTIE",  priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCALIE",   priority: 17, priorityName: "USCI A1-B1 Receive"},
                                   {registerName: "UCB1TXIE for I2C", priority: 16, priorityName: "USCI A1-B1 Transmit"},
                                   {registerName: "UCB1RXIE for I2C", priority: 16, priorityName: "USCI A1-B1 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_B7",
        required: ["clock"],
        params: {name: "Timer_B7", baseAddr: 0x180, intNum: 13,
                 numberOfTimers: 7,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B7 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.3",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.4",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.5",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.6",  priority: 28, priorityName: "Timer0_B7 CCR1-6"},
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F24x1",
        required: ["comparator", "svs", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F23x0"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 26, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "NMIIE",    priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 30, priorityName: "Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "",         priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE2",
        params: {name: "interruptEnableRegister2",
                 interruptSource: [{registerName: "UCA0RXIE for UART", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for UART", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCA0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCA0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for SPI", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for SPI", priority: 22, priorityName: "USCI A0-B0 Transmit"},
                                   {registerName: "UCB0RXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCB0TXIE for I2C", priority: 22, priorityName: "USCI A0-B0 Transmit"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.BCSplus",
        params: {name: "clock", baseAddr: 0x53,
                 hasHFXT1: true, hasXT2: false, hasRosc: true,
                 hasVLO: true, hasAllCal: true,
                 maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.memory.Flash_2xx",
        required: ["clock"],
        params: {name: "flash"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_UART_2xx",
        required: ["clock"],
        params: {name: "usci_A0_UART"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_A0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_A0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_SPI_2xx",
        required: ["clock"],
        params: {name: "usci_B0_SPI"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.USCI_B0_I2C_2xx",
        required: ["clock"],
        params: {name: "usci_B0_I2C",
                 interruptSource: [{registerName: "UCNACKIE", priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTPIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCSTTIE",  priority: 23, priorityName: "USCI A0-B0 Receive"},
                                   {registerName: "UCALIE",   priority: 23, priorityName: "USCI A0-B0 Receive"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_A3",
        required: ["clock"],
        params: {name: "Timer_A3", baseAddr: 0x160, intNum: 9,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 25, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 24, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 24, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer_B3",
        required: ["clock"],
        params: {name: "Timer_B3", baseAddr: 0x180, intNum: 13,
                 numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 29, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 28, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 28, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_Aplus",
        params: {name: "comparator",
                 interruptSource: [{registerName: "CAIE", priority: 27, priorityName: "Comparator A"}]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F23x0",
        required: ["comparator", "clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 18, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 19, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 19, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F5131"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.UCS",
        params: {name: "clock", baseAddr: 0x160, maxCpuFrequency: 25000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "TA0", baseAddr: 0x3C0, intNum: 52, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    }
];

peripheralsTable["MSP430F543x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.UCS",
        params: {name: "clock",  baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: true, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 18000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A5",
        required: ["clock"],
        params: {name: "TA0", baseAddr: 0x340, intNum: 54, numberOfTimers: 5}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "TA1", baseAddr: 0x380, intNum: 49, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B7",
        required: ["clock"],
        params: {name: "TB0", baseAddr: 0x3C0, intNum: 60, numberOfTimers: 7}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F543xA",
        required: ["clock"],
        params: {name: "gpio"}
    }
];

peripheralsTable["MSP430F54xxA"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 58, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 61, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 62, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 61, priorityName: "User Non-maskable"},
                                   {registerName: "ACCVIE",   priority: 61, priorityName: "User Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 62, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 62, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.UCS",
        params: {name: "clock", baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: true, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 25000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A5",
        required: ["clock"],
        params: {name: "TA0", baseAddr: 0x340, intNum: 54, numberOfTimers: 5}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "TA1", baseAddr: 0x380, intNum: 49, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B7",
        required: ["clock"],
        params: {name: "TB0", baseAddr: 0x3C0, intNum: 60, numberOfTimers: 7}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio.GPIO_MSP430F543xA",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 47, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 47, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 47, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 47, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 47, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 47, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 47, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 47, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 42, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 42, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 42, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 42, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 42, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 42, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 42, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 42, priorityName: "Port 2"}
                ]
        }
    }
];

peripheralsTable["MSP430F5259"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 57},
                                   {registerName: "OFIE",     priority: 61},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 62},
                                   {registerName: "NMIIE",    priority: 61},
                                   {registerName: "ACCVIE",   priority: 61},
                                   {registerName: "JMBINIE",  priority: 62},
                                   {registerName: "JMBOUTIE", priority: 62}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.UCS",
        /* TODO: maxFrequency is a function of core voltage and may be
         * less than 25000000!!!!
         */
        params: {name: "clock", baseAddr: 0x160, maxCpuFrequency: 25000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A5",
        required: ["clock"],
        params: {name: "TA0", baseAddr: 0x340, intNum: 51, numberOfTimers: 5}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "TA1", baseAddr: 0x380, intNum: 43, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_A3",
        required: ["clock"],
        params: {name: "TA2", baseAddr: 0x400, intNum: 40, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B7",
        required: ["clock"],
        params: {name: "TB0", baseAddr: 0x3C0, intNum: 45, numberOfTimers: 7}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    }
];

peripheralsTable["MSP430F552x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 57},
                                   {registerName: "OFIE",     priority: 61},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 62},
                                   {registerName: "NMIIE",    priority: 61},
                                   {registerName: "ACCVIE",   priority: 61},
                                   {registerName: "JMBINIE",  priority: 62},
                                   {registerName: "JMBOUTIE", priority: 62}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.UCS",
        /* TODO: maxFrequency is a function of core voltage and may be
         * less than 25000000!!!!
         */
        params: {name: "clock", baseAddr: 0x160, maxCpuFrequency: 25000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A5",
        required: ["clock"],
        params: {name: "TA0", baseAddr: 0x340, intNum: 53, numberOfTimers: 5}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "TA1", baseAddr: 0x380, intNum: 49, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_A3",
        required: ["clock"],
        params: {name: "TA2", baseAddr: 0x400, intNum: 44, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B7",
        required: ["clock"],
        params: {name: "TB0", baseAddr: 0x3C0, intNum: 59, numberOfTimers: 7}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    }
];

peripheralsTable["MSP430F5630"] = [
    {
        /* this device does not have IE1! We have this here to satisfy other
         * peripherals that require this register.
         */
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.UCS",
        /* TODO: maxFrequency is a function of core voltage and may be
         * less than 20000000!!!!
         */
        params: {name: "clock", baseAddr: 0x160, maxCpuFrequency: 20000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A5",
        required: ["clock"],
        params: {name: "TA0", baseAddr: 0x340, intNum: 53, numberOfTimers: 5}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "TA1", baseAddr: 0x380, intNum: 49, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_A3",
        required: ["clock"],
        params: {name: "TA2", baseAddr: 0x400, intNum: 40, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B7",
        required: ["clock"],
        params: {name: "TB0", baseAddr: 0x3C0, intNum: 59, numberOfTimers: 7}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    }
];

peripheralsTable["MSP430F6736"] = [
    {
        /* this device does not have IE1! We have this here to satisfy other
         * peripherals that require this register.
         */
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.UCS",
        /* TODO: maxFrequency is a function of core voltage and may be
         * less than 25000000!!!!
         */
        params: {name: "clock", baseAddr: 0x160, maxCpuFrequency: 25000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "TA0", baseAddr: 0x340, intNum: 55, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A2",
        required: ["clock"],
        params: {name: "TA1", baseAddr: 0x380, intNum: 49, numberOfTimers: 2}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_A2",
        required: ["clock"],
        params: {name: "TA2", baseAddr: 0x400, intNum: 46, numberOfTimers: 2}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer3_A2",
        required: ["clock"],
        params: {name: "TA3", baseAddr: 0x440, intNum: 43, numberOfTimers: 2}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    }
];

peripheralsTable["MSP430F6779"] = [
    {
        /* this device does not have IE1! We have this here to satify other
         * peripherals that require this register.
         */
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.UCS",
        /* TODO: maxFrequency is a function of core voltage and may be
         * less than 25000000!!!!
         */
        params: {name: "clock", baseAddr: 0x160, maxCpuFrequency: 25000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "TA0", baseAddr: 0x340, intNum: 55, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A2",
        required: ["clock"],
        params: {name: "TA1", baseAddr: 0x380, intNum: 49, numberOfTimers: 2}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_A2",
        required: ["clock"],
        params: {name: "TA2", baseAddr: 0x400, intNum: 44, numberOfTimers: 2}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer3_A2",
        required: ["clock"],
        params: {name: "TA3", baseAddr: 0x440, intNum: 41, numberOfTimers: 2}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDTplus",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    }
];

peripheralsTable["CC430F6137"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.IE1",
        params: {name: "interruptEnableRegister1"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.UCS",

        /* maxFrequency is a function of core voltage and may be less than
         * 20000000!!!!
         */
        params: {name: "clock", baseAddr: 0x160, maxCpuFrequency: 20000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A5",
        required: ["clock"],
        params: {name: "TA0", baseAddr: 0x340, intNum: 55, numberOfTimers: 5}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "TA1", baseAddr: 0x380, intNum: 51, numberOfTimers: 3}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    }
];

peripheralsTable["MSP430FR5739_35_31"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS",
        params: {name: "clock", baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: false, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 24000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_D",
        params: {name: "comparator", baseAddr: 0x08c0,
               interruptSource: [{registerName: "CDIE",  priority: 52, priorityName: "Comparator_D"},
                                 {registerName: "CDIIE", priority: 52, priorityName: "Comparator_D"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A1",
        required: ["clock"],
        params: {name: "eusci_A1", baseAddr: 0x05e0,
                interruptSource: [{registerName: "UCTXIE",  priority: 43, priorityName: "eUSCI_A1"},
                                 {registerName: "UCRXIE",  priority: 43, priorityName: "eUSCI_A1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B3",
        required: ["clock"],
        params: {name: "Timer0_B3", baseAddr: 0x03C0, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_B3",
        required: ["clock"],
        params: {name: "Timer1_B3", baseAddr: 0x0400, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 37, priorityName: "Timer1_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 38, priorityName: "Timer1_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 37, priorityName: "Timer1_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 37, priorityName: "Timer1_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_B3",
        required: ["clock"],
        params: {name: "Timer2_B3", baseAddr: 0x0440, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 34, priorityName: "Timer2_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 35, priorityName: "Timer2_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 34, priorityName: "Timer2_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 34, priorityName: "Timer2_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10_B",
        required: ["clock"],
        params: {name: "adc10", baseAddr: 0x0700,
                interruptSource: [{registerName: "ADC10IE0",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10HIIE",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10LOIE",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10INIE",  priority: 46, priorityName: "ADC10_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P3IE.0", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.1", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.2", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.3", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.4", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.5", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.6", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.7", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P4IE.0", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.1", priority: 32, priorityName: "Port 4"},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR5729_25_21"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS",
        params: {name: "clock", baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: false, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 8000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B3",
        required: ["clock"],
        params: {name: "Timer0_B3", baseAddr: 0x03C0, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_B3",
        required: ["clock"],
        params: {name: "Timer1_B3", baseAddr: 0x0400, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 37, priorityName: "Timer1_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 38, priorityName: "Timer1_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 37, priorityName: "Timer1_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 37, priorityName: "Timer1_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_B3",
        required: ["clock"],
        params: {name: "Timer2_B3", baseAddr: 0x0440, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 34, priorityName: "Timer2_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 35, priorityName: "Timer2_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 34, priorityName: "Timer2_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 34, priorityName: "Timer2_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_D",
        params: {name: "comparator", baseAddr: 0x08c0,
               interruptSource: [{registerName: "CDIE",  priority: 52, priorityName: "Comparator_D"},
                                 {registerName: "CDIIE", priority: 52, priorityName: "Comparator_D"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A1",
        required: ["clock"],
        params: {name: "eusci_A1", baseAddr: 0x05e0,
                interruptSource: [{registerName: "UCTXIE",  priority: 43, priorityName: "eUSCI_A1"},
                                 {registerName: "UCRXIE",  priority: 43, priorityName: "eUSCI_A1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10_B",
        required: ["clock"],
        params: {name: "adc10", baseAddr: 0x0700,
                interruptSource: [{registerName: "ADC10IE0",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10HIIE",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10LOIE",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10INIE",  priority: 46, priorityName: "ADC10_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5739_35_31_29_25_21",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P3IE.0", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.1", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.2", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.3", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.4", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.5", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.6", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.7", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P4IE.0", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.1", priority: 32, priorityName: "Port 4"},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR5737_33"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS",
        params: {name: "clock", baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: false, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 24000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B3",
        required: ["clock"],
        params: {name: "Timer0_B3", baseAddr: 0x03C0, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_B3",
        required: ["clock"],
        params: {name: "Timer1_B3", baseAddr: 0x0400, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 37, priorityName: "Timer1_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 38, priorityName: "Timer1_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 37, priorityName: "Timer1_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 37, priorityName: "Timer1_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_B3",
        required: ["clock"],
        params: {name: "Timer2_B3", baseAddr: 0x0440, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 34, priorityName: "Timer2_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 35, priorityName: "Timer2_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 34, priorityName: "Timer2_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 34, priorityName: "Timer2_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_D",
        params: {name: "comparator", baseAddr: 0x08c0,
               interruptSource: [{registerName: "CDIE",   priority: 52, priorityName: "Comparator_D"},
                                 {registerName: "CDIIE",  priority: 52, priorityName: "Comparator_D"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A1",
        required: ["clock"],
        params: {name: "eusci_A1", baseAddr: 0x05e0,
                interruptSource: [{registerName: "UCTXIE",  priority: 43, priorityName: "eUSCI_A1"},
                                 {registerName: "UCRXIE",  priority: 43, priorityName: "eUSCI_A1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P3IE.0", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.1", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.2", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.3", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.4", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.5", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.6", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.7", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P4IE.0", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.1", priority: 32, priorityName: "Port 4"},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR5727_23"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS",
        params: {name: "clock", baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: false, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 8000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B3",
        required: ["clock"],
        params: {name: "Timer0_B3", baseAddr: 0x03C0, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_B3",
        required: ["clock"],
        params: {name: "Timer1_B3", baseAddr: 0x0400, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 37, priorityName: "Timer1_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 38, priorityName: "Timer1_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 37, priorityName: "Timer1_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 37, priorityName: "Timer1_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_B3",
        required: ["clock"],
        params: {name: "Timer2_B3", baseAddr: 0x0440, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 34, priorityName: "Timer2_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 35, priorityName: "Timer2_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 34, priorityName: "Timer2_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 34, priorityName: "Timer2_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_D",
        params: {name: "comparator", baseAddr: 0x08c0,
               interruptSource: [{registerName: "CDIE",   priority: 52, priorityName: "Comparator_D"},
                                 {registerName: "CDIIE",  priority: 52, priorityName: "Comparator_D"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A1",
        required: ["clock"],
        params: {name: "eusci_A1", baseAddr: 0x05e0,
                interruptSource: [{registerName: "UCTXIE",  priority: 43, priorityName: "eUSCI_A1"},
                                 {registerName: "UCRXIE",  priority: 43, priorityName: "eUSCI_A1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5737_33_27_23",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P3IE.0", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.1", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.2", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.3", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.4", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.5", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.6", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.7", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P4IE.0", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.1", priority: 32, priorityName: "Port 4"},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""},
                                   {registerName: "",       priority: -1, priorityName: ""}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR5738_34_30"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS",
        params: {name: "clock", baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: false, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 24000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_D",
        params: {name: "comparator", baseAddr: 0x08c0,
               interruptSource: [{registerName: "CDIE",  priority: 52, priorityName: "Comparator_D"},
                                 {registerName: "CDIIE", priority: 52, priorityName: "Comparator_D"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10_B",
        required: ["clock"],
        params: {name: "adc10", baseAddr: 0x0700,
                interruptSource: [{registerName: "ADC10IE0",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10HIIE",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10LOIE",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10INIE",  priority: 46, priorityName: "ADC10_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B3",
        required: ["clock"],
        params: {name: "Timer0_B3", baseAddr: 0x03C0, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: -1, priorityName: "Port 2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR5728_24_20"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS",
        params: {name: "clock", baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: false, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 8000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B3",
        required: ["clock"],
        params: {name: "Timer0_B3", baseAddr: 0x03C0, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_D",
        params: {name: "comparator", baseAddr: 0x08c0,
               interruptSource: [{registerName: "CDIE",   priority: 52, priorityName: "Comparator_D"},
                                 {registerName: "CDIIE",  priority: 52, priorityName: "Comparator_D"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC10_B",
        required: ["clock"],
        params: {name: "adc10", baseAddr: 0x0700,
                interruptSource: [{registerName: "ADC10IE0",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10HIIE",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10LOIE",  priority: 46, priorityName: "ADC10_B"},
                                 {registerName: "ADC10INIE",  priority: 46, priorityName: "ADC10_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5738_34_30_28_24_20",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: -1, priorityName: "Port 2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR5736_32"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS",
        params: {name: "clock", baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: false, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 24000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B3",
        required: ["clock"],
        params: {name: "Timer0_B3", baseAddr: 0x03C0, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_D",
        params: {name: "comparator", baseAddr: 0x08c0,
                interruptSource: [{registerName: "CDIE",  priority: 52, priorityName: "Comparator_D"},
                                 {registerName: "CDIIE",  priority: 52, priorityName: "Comparator_D"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: -1, priorityName: "Port 2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR5726_22"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS",
        params: {name: "clock", baseAddr: 0x160,
                 hasHFXT1: true, hasXT2: false, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 8000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B3",
        required: ["clock"],
        params: {name: "Timer0_B3", baseAddr: 0x03C0, numberOfTimers: 3,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "TB1CCR0 CCIFG", value: 9},
                                 {triggerName: "TB1CCR2 CCIFG", value: 10},
                                 {triggerName: "TB2CCR0 CCIFG", value: 11},
                                 {triggerName: "TB2CCR2 CCIFG", value: 12},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC10IFGx", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_D",
        params: {name: "comparator", baseAddr: 0x08c0,
                interruptSource: [{registerName: "CDIE",  priority: 52, priorityName: "Comparator_D"},
                                 {registerName: "CDIIE",  priority: 52, priorityName: "Comparator_D"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR5736_32_26_22",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: -1, priorityName: "Port 2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR594x_FR584x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS_A",
        params: {name: "clock", baseAddr: 0x160,
                 hasLFXT1: true, hasHFXT1: false, hasXT2: false, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, intNum:45, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, intNum: 41, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B7",
        required: ["clock"],
        params: {name: "Timer0_B7", baseAddr: 0x3c0, intNum: 51, numberOfTimers: 7,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B7 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.3",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.4",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.5",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.6",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_A2",
        required: ["clock"],
        params: {name: "Timer2_A2", baseAddr: 0x400, intNum: 38, numberOfTimers: 2, isInternal: true,
                 interruptSource: [{registerName: "TAIE",    priority: 37, priorityName: "Timer2_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 38, priorityName: "Timer2_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 37, priorityName: "Timer2_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer3_A2",
        required: ["clock"],
        params: {name: "Timer3_A2", baseAddr: 0x440, intNum: 35, numberOfTimers: 2, isInternal: true,
                 interruptSource: [{registerName: "TAIE",    priority: 34, priorityName: "Timer3_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 35, priorityName: "Timer3_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 34, priorityName: "Timer3_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TA2CCR0 CCIFG", value: 5},
                                 {triggerName: "TA3CCR0 CCIFG", value: 6},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "AES Trigger 0", value: 11},
                                 {triggerName: "AES Trigger 1", value: 12},
                                 {triggerName: "AES Trigger 2", value: 13},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC12 e/o conversion", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TA2CCR0 CCIFG", value: 5},
                                 {triggerName: "TA3CCR0 CCIFG", value: 6},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "AES Trigger 0", value: 11},
                                 {triggerName: "AES Trigger 1", value: 12},
                                 {triggerName: "AES Trigger 2", value: 13},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC12 e/o conversion", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                 [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TA2CCR0 CCIFG", value: 5},
                                 {triggerName: "TA3CCR0 CCIFG", value: 6},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "AES Trigger 0", value: 11},
                                 {triggerName: "AES Trigger 1", value: 12},
                                 {triggerName: "AES Trigger 2", value: 13},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC12 e/o conversion", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF_A",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_E",
        params: {name: "comparator", baseAddr: 0x08c0,
                interruptSource: [{registerName: "CEIE",  priority: 52, priorityName: "Comparator_E"},
                                 {registerName: "CEIIE",  priority: 52, priorityName: "Comparator_E"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A1",
        required: ["clock"],
        params: {name: "eusci_A1", baseAddr: 0x05e0,
                interruptSource: [{registerName: "UCTXIE",  priority: 43, priorityName: "eUSCI_A1"},
                                 {registerName: "UCRXIE",  priority: 43, priorityName: "eUSCI_A1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC12_B",
        required: ["clock"],
        params: {name: "adc12", baseAddr: 0x0800,
                interruptSource: [{registerName: "ADC12IE0", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE1", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE2", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE3", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE4", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE5", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE6", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE7", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE8", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE9", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE10", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE11", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE12", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE13", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE14", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE15", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE16", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE17", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE18", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE19", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE20", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE21", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE22", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE23", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE24", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE25", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE26", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE27", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE28", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE29", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE30", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE31", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12HIIFG", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12LOIFG", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12INIFG", priority: 46, priorityName: "ADC12_B"}
                                ]
                }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P3IE.0", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.1", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.2", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.3", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.4", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.5", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.6", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.7", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P4IE.0", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.1", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.2", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.3", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.4", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.5", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.6", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.7", priority: 32, priorityName: "Port 4"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR595x_FR585x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS_A",
        params: {name: "clock", baseAddr: 0x160,
                 hasLFXT1: false, hasHFXT1: false, hasXT2: true, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, intNum: 45, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, intNum: 41, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B7",
        required: ["clock"],
        params: {name: "Timer0_B7", baseAddr: 0x3c0, intNum: 51, numberOfTimers: 7,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B7 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.3",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.4",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.5",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.6",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_A2",
        required: ["clock"],
        params: {name: "Timer2_A2", baseAddr: 0x400, intNum: 38, numberOfTimers: 2, isInternal: true,
                 interruptSource: [{registerName: "TAIE",    priority: 37, priorityName: "Timer2_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 38, priorityName: "Timer2_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 37, priorityName: "Timer2_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer3_A2",
        required: ["clock"],
        params: {name: "Timer3_A2", baseAddr: 0x440, intNum: 35, numberOfTimers: 2, isInternal: true,
                 interruptSource: [{registerName: "TAIE",    priority: 34, priorityName: "Timer3_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 35, priorityName: "Timer3_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 34, priorityName: "Timer3_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TA2CCR0 CCIFG", value: 5},
                                 {triggerName: "TA3CCR0 CCIFG", value: 6},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "AES Trigger 0", value: 11},
                                 {triggerName: "AES Trigger 1", value: 12},
                                 {triggerName: "AES Trigger 2", value: 13},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC12 e/o conversion", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TA2CCR0 CCIFG", value: 5},
                                 {triggerName: "TA3CCR0 CCIFG", value: 6},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "AES Trigger 0", value: 11},
                                 {triggerName: "AES Trigger 1", value: 12},
                                 {triggerName: "AES Trigger 2", value: 13},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC12 e/o conversion", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                 [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TA2CCR0 CCIFG", value: 5},
                                 {triggerName: "TA3CCR0 CCIFG", value: 6},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "AES Trigger 0", value: 11},
                                 {triggerName: "AES Trigger 1", value: 12},
                                 {triggerName: "AES Trigger 2", value: 13},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC12 e/o conversion", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF_A",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_E",
        params: {name: "comparator", baseAddr: 0x08c0,
                interruptSource: [{registerName: "CEIE",  priority: 52, priorityName: "Comparator_E"},
                                 {registerName: "CEIIE",  priority: 52, priorityName: "Comparator_E"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A1",
        required: ["clock"],
        params: {name: "eusci_A1", baseAddr: 0x05e0,
                interruptSource: [{registerName: "UCTXIE",  priority: 43, priorityName: "eUSCI_A1"},
                                 {registerName: "UCRXIE",  priority: 43, priorityName: "eUSCI_A1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC12_B",
        required: ["clock"],
        params: {name: "adc12", baseAddr: 0x0800,
                interruptSource: [{registerName: "ADC12IE0", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE1", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE2", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE3", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE4", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE5", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE6", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE7", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE8", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE9", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE10", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE11", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE12", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE13", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE14", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE15", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE16", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE17", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE18", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE19", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE20", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE21", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE22", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE23", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE24", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE25", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE26", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE27", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE28", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE29", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE30", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE31", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12HIIFG", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12LOIFG", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12INIFG", priority: 46, priorityName: "ADC12_B"}
                                ]
                }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P3IE.0", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.1", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.2", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.3", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.4", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.5", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.6", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.7", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P4IE.0", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.1", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.2", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.3", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.4", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.5", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.6", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.7", priority: 32, priorityName: "Port 4"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR596x_FR586x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SR",
        params: {name: "statusRegister"}
    },
    {
        factory: "ti.catalog.msp430.peripherals.special_function.SFRIE1",
        params: {name: "interruptEnableRegister1",
                 interruptSource: [{registerName: "WDTIE",    priority: 49, priorityName: "Watchdog Timer"},
                                   {registerName: "OFIE",     priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "",         priority: -1, priorityName: ""},
                                   {registerName: "VMAIE",    priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "NMIIE",    priority: 53, priorityName: "User Non-maskable"},
                                   {registerName: "ACCTEIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBINIE",  priority: 54, priorityName: "System Non-maskable"},
                                   {registerName: "JMBOUTIE", priority: 54, priorityName: "System Non-maskable"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS_A",
        params: {name: "clock", baseAddr: 0x160,
                 hasLFXT1: true, hasHFXT1: false, hasXT2: true, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.pmm.PMM",
        params: {name: "pmm", baseAddr: 0x120}
    },
    {
        factory: "ti.catalog.msp430.peripherals.ref.REF_A",
        params: {name: "ref", baseAddr: 0x01b0}
    },
    {
        factory: "ti.catalog.msp430.peripherals.comparator.Comparator_E",
        params: {name: "comparator", baseAddr: 0x08c0,
                interruptSource: [{registerName: "CEIE",  priority: 52, priorityName: "Comparator_E"},
                                 {registerName: "CEIIE",  priority: 52, priorityName: "Comparator_E"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A0",
        required: ["clock"],
        params: {name: "eusci_A0", baseAddr: 0x05c0,
                interruptSource: [{registerName: "UCTXIE",  priority: 48, priorityName: "eUSCI_A0"},
                                 {registerName: "UCRXIE",  priority: 48, priorityName: "eUSCI_A0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_A1",
        required: ["clock"],
        params: {name: "eusci_A1", baseAddr: 0x05e0,
                interruptSource: [{registerName: "UCTXIE",  priority: 43, priorityName: "eUSCI_A1"},
                                 {registerName: "UCRXIE",  priority: 43, priorityName: "eUSCI_A1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.communication.EUSCI_B0",
        required: ["clock"],
        params: {name: "eusci_B0", baseAddr: 0x0640,
                interruptSource: [{registerName: "UCTXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE0",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE1",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE2",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCTXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCRXIE3",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTTIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCSTPIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCNACKIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCALIE",  priority: 47, priorityName: "eUSCI_B0"},
                                 {registerName: "UCCLTOIE",  priority: 47, priorityName: "eUSCI_B0"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.adc.ADC12_B",
        required: ["clock"],
        params: {name: "adc12", baseAddr: 0x0800,
                interruptSource: [{registerName: "ADC12IE0", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE1", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE2", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE3", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE4", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE5", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE6", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE7", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE8", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE9", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE10", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE11", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE12", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE13", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE14", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE15", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE16", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE17", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE18", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE19", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE20", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE21", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE22", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE23", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE24", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE25", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE26", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE27", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE28", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE29", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE30", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12IE31", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12HIIFG", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12LOIFG", priority: 46, priorityName: "ADC12_B"},
                                {registerName: "ADC12INIFG", priority: 46, priorityName: "ADC12_B"}
                                ]
                }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, intNum: 45, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 45, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 44, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 44, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, intNum: 41, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 41, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 40, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 40, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B7",
        required: ["clock"],
        params: {name: "Timer0_B7", baseAddr: 0x3c0, intNum: 51, numberOfTimers: 7,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B7 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.3",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.4",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.5",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.6",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_A2",
        required: ["clock"],
        params: {name: "Timer2_A2", baseAddr: 0x400, intNum: 38, numberOfTimers: 2, isInternal: true,
                 interruptSource: [{registerName: "TAIE",    priority: 37, priorityName: "Timer2_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 38, priorityName: "Timer2_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 37, priorityName: "Timer2_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer3_A2",
        required: ["clock"],
        params: {name: "Timer3_A2", baseAddr: 0x440, intNum: 35, numberOfTimers: 2, isInternal: true,
                 interruptSource: [{registerName: "TAIE",    priority: 34, priorityName: "Timer3_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 35, priorityName: "Timer3_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 34, priorityName: "Timer3_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.rtc.RTC_B",
        params: {name: "rtc", baseAddr: 0x04a0,
               interruptSource: [{registerName: "RTCOFIE",  priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCAIE",   priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCRDYIE", priority: 31, priorityName: "RTC_B"},
                                 {registerName: "RTCTEVIE", priority: 31, priorityName: "RTC_B"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.dma.DMA",
        params: {name: "dma", baseAddr: 0x0500, numberOfChannels: 3,
                 interruptSource: [{registerName: "DMAIE.0",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.1",  priority: 42, priorityName: "DMA"},
                                   {registerName: "DMAIE.2",  priority: 42, priorityName: "DMA"}
                ],

                 /* trigger source is a 2 dimensional array, with the
                    first dimension indexed by channel number */
                 triggerSource: [

                                /* channel 0 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TA2CCR0 CCIFG", value: 5},
                                 {triggerName: "TA3CCR0 CCIFG", value: 6},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "AES Trigger 0", value: 11},
                                 {triggerName: "AES Trigger 1", value: 12},
                                 {triggerName: "AES Trigger 2", value: 13},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC12 e/o conversion", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA2IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                /* channel 1 */
                                [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TA2CCR0 CCIFG", value: 5},
                                 {triggerName: "TA3CCR0 CCIFG", value: 6},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "AES Trigger 0", value: 11},
                                 {triggerName: "AES Trigger 1", value: 12},
                                 {triggerName: "AES Trigger 2", value: 13},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC12 e/o conversion", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA0IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}],

                                 /* channel 2 */
                                 [{triggerName: "DMAREQ", value: 0},
                                 {triggerName: "TA0CCR0 CCIFG", value: 1},
                                 {triggerName: "TA0CCR2 CCIFG", value: 2},
                                 {triggerName: "TA1CCR0 CCIFG", value: 3},
                                 {triggerName: "TA1CCR2 CCIFG", value: 4},
                                 {triggerName: "TA2CCR0 CCIFG", value: 5},
                                 {triggerName: "TA3CCR0 CCIFG", value: 6},
                                 {triggerName: "TB0CCR0 CCIFG", value: 7},
                                 {triggerName: "TB0CCR2 CCIFG", value: 8},
                                 {triggerName: "AES Trigger 0", value: 11},
                                 {triggerName: "AES Trigger 1", value: 12},
                                 {triggerName: "AES Trigger 2", value: 13},
                                 {triggerName: "UCA0RXIFG", value: 14},
                                 {triggerName: "UCA0TXIFG", value: 15},
                                 {triggerName: "UCA1RXIFG", value: 16},
                                 {triggerName: "UCA1TXIFG", value: 17},
                                 {triggerName: "UCB0RXIFG0", value: 18},
                                 {triggerName: "UCB0TXIFG0", value: 19},
                                 {triggerName: "UCB0RXIFG1", value: 20},
                                 {triggerName: "UCB0TXIFG1", value: 21},
                                 {triggerName: "UCB0RXIFG2", value: 22},
                                 {triggerName: "UCB0TXIFG2", value: 23},
                                 {triggerName: "UCB0RXIFG3", value: 24},
                                 {triggerName: "UCB0TXIFG3", value: 25},
                                 {triggerName: "ADC12 e/o conversion", value: 26},
                                 {triggerName: "MPY ready", value: 29},
                                 {triggerName: "DMA1IFG", value: 30},
                                 {triggerName: "DMAE0", value: 31}]
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.gpio_grace3.GPIO_MSP430FR59xx_FR58xx",
        required: ["clock"],
        params: {name: "gpio",
                 interruptSource: [{registerName: "P1IE.0", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.1", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.2", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.3", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.4", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.5", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.6", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P1IE.7", priority: 39, priorityName: "Port 1"},
                                   {registerName: "P2IE.0", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.1", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.2", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.3", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.4", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.5", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.6", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P2IE.7", priority: 36, priorityName: "Port 2"},
                                   {registerName: "P3IE.0", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.1", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.2", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.3", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.4", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.5", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.6", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P3IE.7", priority: 33, priorityName: "Port 3"},
                                   {registerName: "P4IE.0", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.1", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.2", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.3", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.4", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.5", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.6", priority: 32, priorityName: "Port 4"},
                                   {registerName: "P4IE.7", priority: 32, priorityName: "Port 4"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.pinmux.PinMux",
        params: {name: "pinmux"}
    }
];

peripheralsTable["MSP430FR598x_FR698x"] = [
    {
        factory: "ti.catalog.msp430.peripherals.clock.CS_A",
        params: {name: "clock", baseAddr: 0x160,
                 hasLFXT1: true, hasHFXT1: false, hasXT2: true, hasVLO: true,
                 baseAddr: 0x160, maxCpuFrequency: 16000000}
    },
    {
        factory: "ti.catalog.msp430.peripherals.watchdog.WDT_A",
        required: ["clock"],
        params: {name: "watchdog", baseAddr: 0x15c}
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_A3",
        required: ["clock"],
        params: {name: "Timer0_A3", baseAddr: 0x340, intNum: 44, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 43, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 44, priorityName: "Timer0_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 43, priorityName: "Timer0_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 43, priorityName: "Timer0_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer1_A3",
        required: ["clock"],
        params: {name: "Timer1_A3", baseAddr: 0x380, intNum: 39, numberOfTimers: 3,
                 interruptSource: [{registerName: "TAIE",    priority: 38, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.0",  priority: 39, priorityName: "Timer1_A3 CCR0"},
                                   {registerName: "CCIE.1",  priority: 38, priorityName: "Timer1_A3 CCR1-2"},
                                   {registerName: "CCIE.2",  priority: 38, priorityName: "Timer1_A3 CCR1-2"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer0_B7",
        required: ["clock"],
        params: {name: "Timer0_B7", baseAddr: 0x3c0, intNum: 51, numberOfTimers: 7,
                 interruptSource: [{registerName: "TBIE",    priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.0",  priority: 51, priorityName: "Timer0_B7 CCR0"},
                                   {registerName: "CCIE.1",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.2",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.3",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.4",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.5",  priority: 50, priorityName: "Timer0_B7 CCR1-6"},
                                   {registerName: "CCIE.6",  priority: 50, priorityName: "Timer0_B7 CCR1-6"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer2_A2",
        required: ["clock"],
        params: {name: "Timer2_A2", baseAddr: 0x400, intNum: 36, numberOfTimers: 2, isInternal: true,
                 interruptSource: [{registerName: "TAIE",    priority: 35, priorityName: "Timer2_A2 CCR1"},
                                   {registerName: "CCIE.0",  priority: 36, priorityName: "Timer2_A2 CCR0"},
                                   {registerName: "CCIE.1",  priority: 35, priorityName: "Timer2_A2 CCR1"}
                ]
        }
    },
    {
        factory: "ti.catalog.msp430.peripherals.timer.Timer3_A5",
        required: ["clock"],
        params: {name: "Timer3_A5", baseAddr: 0x440, intNum: 33, numberOfTimers: 5, isInternal: true,
                 interruptSource: [{registerName: "TAIE",    priority: 32, priorityName: "Timer3_A5 CCR1-4"},
                                   {registerName: "CCIE.0",  priority: 33, priorityName: "Timer3_A5 CCR0"},
                                   {registerName: "CCIE.1",  priority: 32, priorityName: "Timer3_A5 CCR1-4"},
                                   {registerName: "CCIE.2",  priority: 32, priorityName: "Timer3_A5 CCR1-4"},
                                   {registerName: "CCIE.3",  priority: 32, priorityName: "Timer3_A5 CCR1-4"},
                                   {registerName: "CCIE.4",  priority: 32, priorityName: "Timer3_A5 CCR1-4"}
                ]
        }
    }
];

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(revision)
{
    this.$private.realDevice = revision;
    var IC = xdc.useModule(
        "ti.catalog.msp430.peripherals.interrupt.Interrupt_Controller"
    );
    var Boot = xdc.useModule('ti.catalog.msp430.init.Boot');
    Boot.disableWatchdog = true;

    var tableEntry;
    /*
     * Define which actual devices correspond to the above defined
     * descriptor tables. Also, additional configurations important
     * to SYS/BIOS are made here.
     */
    if (this.$private.realDevice.match(/^MSP430G2210/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2210";
    }
    else if (this.$private.realDevice.match(/^MSP430G2230/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2230";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d01/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x01";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d11/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x11";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d21/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x21";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d31/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x31";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d02/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x02";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d12/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x12";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d32/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x32";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d44/)) {
       this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        tableEntry = "MSP430G2x44";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d52/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x52";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d55/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x55";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d03/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x03";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d13/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x13";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d33/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x33";
    }
    else if (this.$private.realDevice.match(/^MSP430G2\d53/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430G2x53";
    }
    else if (this.$private.realDevice.match(/^MSP430F20\d1/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F20x1";
    }
    else if (this.$private.realDevice.match(/^MSP430F20\d2/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F20x2";
    }
    else if (this.$private.realDevice.match(/^MSP430F20\d3/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F20x3";
    }
    else if (this.$private.realDevice.match(/^MSP430F21\d2/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430F21x2";
    }
    else if (this.$private.realDevice.match(/^MSP430F21\d1/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430F21x1";
    }
    else if (this.$private.realDevice.match(/^MSP430F22\d2/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430F22x2";
    }
    else if (this.$private.realDevice.match(/^MSP430F22\d4/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430F22x4";
    }
    /* trap MSP430F2616, F2617, F2618, F2619 */
    else if (this.$private.realDevice.match(/^MSP430F261[6-9]/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFC0, numInterrupts: 32}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F261x";
    }
    /* trap MSP430F247, F248, F249 */
    else if (this.$private.realDevice.match(/^MSP430F24[7-9]$/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFC0, numInterrupts: 32}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F24x";
    }
    /* trap MSP430F2471, F2481, F2491 */
    else if (this.$private.realDevice.match(/^MSP430F24[7-9]1/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFC0, numInterrupts: 32}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F24x1";
    }
    else if (this.$private.realDevice.match(/^MSP430F24\d1/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F24x1";
    }
    else if (this.$private.realDevice.match(/^MSP430F23\d0/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F23x0";
    }
    else if (this.$private.realDevice.match(/^MSP430F23\d$/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F23x";
    }
    /* trap MSP430F2416, F2417, F2418, F2419 */
    else if (this.$private.realDevice.match(/^MSP430F241[6-9]/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFC0, numInterrupts: 32}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F241x";
    }
    else if (this.$private.realDevice.match(/^MSP430F24(\d$|10)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFFE0, numInterrupts: 16}
        );
        Boot.configureDCO = false;
        Boot.disableWatchdog = false;
        tableEntry = "MSP430F24x";
    }
    else if (this.$private.realDevice.match(/^MSP430(F54(3|1)\d[aA]|BT51\d+)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F54xxA";
    }
    else if (this.$private.realDevice.match(/^MSP430F54(3|1)\d$/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F543x";
    }
    else if (this.$private.realDevice.match(/^MSP430F51\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F5131";
    }
    else if (this.$private.realDevice.match(/^MSP430F525\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F5259";
    }
    else if (this.$private.realDevice.match(/^MSP430F52\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F552x";
    }
    else if (this.$private.realDevice.match(/^MSP430F530\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F552x";
    }
    else if (this.$private.realDevice.match(/^MSP430F531\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F552x";
    }
    else if (this.$private.realDevice.match(/^MSP430F532\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F552x";
    }
    else if (this.$private.realDevice.match(/^MSP430F533\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F5630";
    }
    else if (this.$private.realDevice.match(/^MSP430F534\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F552x";
    }
    else if (this.$private.realDevice.match(/^MSP430F535\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F5630";
    }
    else if (this.$private.realDevice.match(/^MSP430F55\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F552x";
    }
    else if (this.$private.realDevice.match(/^MSP430F56\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F5630";
    }
    else if (this.$private.realDevice.match(/^MSP430F643\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F5630";
    }
    else if (this.$private.realDevice.match(/^MSP430F645\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F5630";
    }
    else if (this.$private.realDevice.match(/^MSP430F66\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F5630";
    }
    else if (this.$private.realDevice.match(/^MSP430F67(4|6|7)[5-9]1/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F6779";
    }
    else if (this.$private.realDevice.match(/^MSP430F676(2|4)1/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F6736";
    }
    else if (this.$private.realDevice.match(/^MSP430F67(4|6|7)\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F6779";
    }
    else if (this.$private.realDevice.match(/^MSP430F67\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F6736";
    }
    else if (this.$private.realDevice.match(/^MSP430FG6(4|6)2\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430F5630";
    }
    else if (this.$private.realDevice.match(/^CC430F5\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "CC430F6137";
    }
    else if (this.$private.realDevice.match(/^CC430F6\d+/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = true;
        tableEntry = "CC430F6137";
    }
    else if (this.$private.realDevice.match(/^MSP430FR57(39|35|31)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430FR5739_35_31";
    }
    else if (this.$private.realDevice.match(/^MSP430FR57(29|25|21)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430FR5729_25_21";
    }
    else if (this.$private.realDevice.match(/^MSP430FR57(37|33)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430FR5737_33";
    }
    else if (this.$private.realDevice.match(/^MSP430FR57(27|23)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430FR5727_23";
    }
    else if (this.$private.realDevice.match(/^MSP430FR57(38|34|30)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430FR5738_34_30";
    }
    else if (this.$private.realDevice.match(/^MSP430FR57(28|24|20)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430FR5728_24_20";
    }
    else if (this.$private.realDevice.match(/^MSP430FR57(36|32)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430FR5736_32";
    }
    else if (this.$private.realDevice.match(/^MSP430FR57(26|22)/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF80, numInterrupts: 64}
        );
        Boot.configureDCO = false;
        tableEntry = "MSP430FR5726_22";
    }
    else if (this.$private.realDevice.match(/^MSP430FR5994/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF90, numInterrupts: 56}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430FR596x_FR586x";
    }
    else if (this.$private.realDevice.match(/^MSP430FR5(9|8)4\d/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF90, numInterrupts: 56}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430FR594x_FR584x";
    }
    else if (this.$private.realDevice.match(/^MSP430FR5(9|8)5\d/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF90, numInterrupts: 56}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430FR595x_FR585x";
    }
    else if (this.$private.realDevice.match(/^MSP430FR5(9|8)6\d/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF90, numInterrupts: 56}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430FR596x_FR586x";
    }
    else if (this.$private.realDevice.match(/^MSP430FR(6|5)98\d/)) {
        this.peripherals["interruptController"] = IC.create(
            {name: "interruptController", baseAddr: 0xFF90, numInterrupts: 56}
        );
        Boot.configureDCO = true;
        tableEntry = "MSP430FR598x_FR698x";
    }
    else {
        this.$module.$logFatal("Device " + revision + " is not supported.",
            this.$module);
    }

    if (peripheralsTable[tableEntry] != null) {
        for (var i = 0; i < peripheralsTable[tableEntry].length; i++) {
            var entry = peripheralsTable[tableEntry][i];
            var modName = entry.factory;
            var mod = xdc.useModule(modName);
            var params = entry.params;

            /* construct the create arguments */
            var args = [];
            if ("required" in entry) {
                for (var j = 0; j < entry.required.length; j++) {
                    var peripheralName = entry.required[j];
                    var peripheral = this.peripherals[peripheralName];
                    if (!peripheral) {
                        this.$module.$logWarning(
                            this.$private.realDevice
                                + " " + peripheralName
                                + " must be created before " + params.name,
                            this, "peripherals");
                    }
                    args.push(peripheral);
                }
            }
            args.push(params);

            /* construct the peripheral instance */
            this.peripherals[params.name] = mod.create.$apply(mod, args);
        }
    }

    Boot.watchdogAddress = this.peripherals["watchdog"].$orig.baseAddr;
}

/*
 *  ======== MSP430.getMemoryMap ========
 *  Returns the memory map as seen by a program running on this device.
 */
function getMemoryMap(regs)
{
    return (null);
}
