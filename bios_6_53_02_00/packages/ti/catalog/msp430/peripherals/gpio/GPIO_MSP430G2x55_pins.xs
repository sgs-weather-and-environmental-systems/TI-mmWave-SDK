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
 *  ======== GPIO_MSP430G2x55_pins.xs ========
 */

/*
 *  ======== setPins ========
 */
function setPins(inst)
{
    inst.devicePins =
    [
        [
            {
                pinName : "P1.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0CLK",
                        "ACLK",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL2", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P1.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI0A",
                        "TA0.0",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL2", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P1.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI1A",
                        "TA0.1",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL2", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P1.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI2A",
                        "TA0.2",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL2", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P1.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "SMCLK",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL2", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P1.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.0",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL2", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P1.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.1",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL2", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P1.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.2",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL2", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL2", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P2.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA1CLK",
                        "ACLK",
                        "A0",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL2", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0INCLK",
                        "SMCLK",
                        "A1",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL2", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI0B",
                        "TA0.0",
                        "A2",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL2", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI1B",
                        "TA0.1",
                        "A3/VREF-/VeREF-",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL2", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI2B",
                        "TA0.2",
                        "A4/VREF+/VeREF+",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "ADC10AE", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL2", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA1.CCI0A",
                        "TA1.0",
                        "Rosc",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL2", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "XIN",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL2", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "XOUT",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P2SEL2", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P2SEL2", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P3.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB0STE/UCA0CLK",
                        "A5",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P3SEL2", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ]
                    ]
                }
            },
            {
                pinName : "P3.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB0SIMO/UCB0SDA",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P3SEL2", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P3.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB0SOMI/UCB0SCL",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P3SEL2", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P3.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB0CLK/UCA0STE",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P3SEL2", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P3.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCA0TXD/UCA0SIMO",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL2", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P3.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCA0RXD/UCA0SOMI",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL2", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P3.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA1.CCI1A",
                        "TA1.1",
                        "A6",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL2", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ]
                    ]
                }
            },
            {
                pinName : "P3.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA1.CCI2A",
                        "TA1.2",
                        "A7",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P3SEL2", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL2", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P4.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TB0.CCI0A",
                        "TB0.0",
                        "CA0",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "CAPD", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL2", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TB0.CCI1A",
                        "TB0.1",
                        "CA1",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "CAPD", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL2", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TB0.CCI2A",
                        "TB0.2",
                        "CA2",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "CAPD", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL2", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TB0.CCI0A",
                        "TB0.0",
                        "A12",
                        "CA3",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "CAPD", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL2", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TB0.CCI1A",
                        "TB0.1",
                        "A13",
                        "CA4",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "CAPD", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL2", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TB0.2",
                        "A14",
                        "CA5",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "CAPD", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P4SEL2", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TBOUTH",
                        "CAOUT",
                        "A15",
                        "CA6",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "CAPD", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL2", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TB0CLK",
                        "CAOUT",
                        "CA7",
                        "Capacitive sensing"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P4SEL2", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "CAPD", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL2", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "ADC10AE", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "CAPD", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ]
                    ]
                }
            }
        ]
    ];
}
