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
 *  ======== GPIO_MSP430FR5736_32_26_22_pins.xs ========
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
                        "TA0.CCI1A",
                        "TA0.1",
                        "DMAE0",
                        "RTCCLK",
                        "CD0"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL1", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "TA0.CCI2A",
                        "TA0.2",
                        "TA1CLK",
                        "CDOUT",
                        "CD1"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
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
                        "TA1.CCI1A",
                        "TA1.1",
                        "TA0CLK",
                        "CDOUT",
                        "CD2"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL0", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL0", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL1", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x04, bitClearMask : 0x00 }
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
                        "TA1.CCI2A",
                        "TA1.2",
                        "UCB0STE",
                        "CD3"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL0", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL0", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x08, bitClearMask : 0x00 }
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
                        "TB0.CCI1A",
                        "TB0.1",
                        "UCA0STE",
                        "CD4"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
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
                        "TB0.CCI2A",
                        "TB0.2",
                        "UCA0CLK",
                        "CD5"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL0", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL0", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x20, bitClearMask : 0x00 }
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
                        "UCB0SIMO/UCB0SDA",
                        "TA0.CCI0A",
                        "TA0.0"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL1", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x40, bitClearMask : 0x00 }
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
                        "UCB0SOMI/UCB0SCL",
                        "TA1.CCI0A",
                        "TA1.0"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P1SEL1", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL1", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL0", bitSetMask : 0x80, bitClearMask : 0x00 }
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
                        "UCA0TXD/UCA0SIMO",
                        "TB0CLK",
                        "ACLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P2SEL1", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL1", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "UCA0RXD/UCA0SOMI",
                        "TB0.CCI0A",
                        "TB0.0"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P2SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
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
                        "UCB0CLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P2SEL1", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
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
                        "TA0.CCI0B",
                        "TA0.0",
                        "CD10"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL0", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL0", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2SEL1", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x08, bitClearMask : 0x00 }
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
                        "TA1.CCI0B",
                        "TA1.0",
                        "CD11"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2SEL1", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
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
                        "TB0.CCI0B",
                        "TB0.0"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL0", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL0", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "PJ.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TB0OUTH",
                        "SMCLK",
                        "CD6"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "PJSEL1", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "PJSEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "MCLK",
                        "CD7"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "PJSEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "PJSEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "PJSEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "ACLK",
                        "CD8"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "PJSEL0", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "PJSEL1", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "PJSEL0", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "CD9"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "PJSEL1", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "PJSEL0", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "XIN"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "PJSEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "XOUT"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "PJSEL0", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.6",
                pinFunction : {
                    functionName : [
                        ""
                    ],
                    functionConfig : [
                        [

                        ]
                    ]
                }
            },
            {
                pinName : "PJ.7",
                pinFunction : {
                    functionName : [
                        ""
                    ],
                    functionConfig : [
                        [

                        ]
                    ]
                }
            }
        ]
    ];
}
