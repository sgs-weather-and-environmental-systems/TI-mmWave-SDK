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
 *  ======== GPIO_MSP430F543xA.xs ========
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
                        "TA0.TA0CLK",
                        "ACLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P1SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "TA0.0"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P1SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
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
                        "TA0.1"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P1SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
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
                        "TA0.2"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P1SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
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
                        "TA0.CCI3A",
                        "TA0.3"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P1SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
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
                        "TA0.CCI4A",
                        "TA0.4"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P1SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
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
                        "SMCLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P1.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
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
                        "MCLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "TA1CLK",
                        "MCLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
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
                        "TA1.CCI1A",
                        "TA1.1"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
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
                        "TA1.CCI1A",
                        "TA1.1"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P2SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
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
                        "RTCCLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P2.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
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
                        "ACLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x40, bitClearMask : 0x00 }
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
                        "DMAE0",
                        "ADC12CLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P2SEL", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P2SEL", bitSetMask : 0x80, bitClearMask : 0x00 }
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
                        "UCB0STE/UCA0CLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "UCB0SIMO/UCB0SDA"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
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
                        "UCB0SOMI/UCB0SCL"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
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
                        "UCB0CLK/UCA0STE"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
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
                        "UCA0TXD/UCA0SIMO"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
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
                        "UCA0RXD/UCA0SOMI"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
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
                        "UCB1STE/UCA1CLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x40, bitClearMask : 0x00 }
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
                        "UCB1SIMO/UCB1SDA"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P3SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P3SEL", bitSetMask : 0x80, bitClearMask : 0x00 }
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
                        "TB0.CCI0A and TB0.CCI0B",
                        "TB0.0"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "TB0.CCI1A and TB0.CCI1B",
                        "TB0.1"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
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
                        "TB0.CCI2A and TB0.CCI2B",
                        "TB0.2"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
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
                        "TB0.CCI3A and TB0.CCI3B",
                        "TB0.3"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
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
                        "TB0.CCI4A and TB0.CCI4B",
                        "TB0.4"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
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
                        "TB0.CCI5A and TB0.CCI5B",
                        "TB0.5"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P4SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
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
                        "TB0.CCI6A and TB0.CCI6B",
                        "TB0.6"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x40, bitClearMask : 0x00 }
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
                        "SMCLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P4SEL", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P5.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A8 / VeREF+",
                        "A8 / VREF+"
                    ],
                    functionConfig : [
                        [
                            { register : "P5DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P5DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "ADC12CTL2", bitSetMask : 0x0000, bitClearMask : 0x0002 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "ADC12CTL2", bitSetMask : 0x0002, bitClearMask : 0x0000 }
                        ]
                    ]
                }
            },
            {
                pinName : "P5.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A9 / VeREF-",
                        "A9 / VREF-"
                    ],
                    functionConfig : [
                        [
                            { register : "P5DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P5DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "ADC12CTL2", bitSetMask : 0x0000, bitClearMask : 0x0002 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "ADC12CTL2", bitSetMask : 0x0002, bitClearMask : 0x0000 }
                        ]
                    ]
                }
            },
            {
                pinName : "P5.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "XT2IN"
                    ],
                    functionConfig : [
                        [
                            { register : "P5DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P5DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P5.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "XT2OUT"
                    ],
                    functionConfig : [
                        [
                            { register : "P5DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P5DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P5.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB1SOMI/UCB1SCL"
                    ],
                    functionConfig : [
                        [
                            { register : "P5DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P5DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P5.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB1CLK/UCA1STE"
                    ],
                    functionConfig : [
                        [
                            { register : "P5DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P5DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P5.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCA1TXD/UCA1SIMO"
                    ],
                    functionConfig : [
                        [
                            { register : "P5DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P5DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P5.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCA1RXD/UCA1SOMI"
                    ],
                    functionConfig : [
                        [
                            { register : "P5DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P5DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P5SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P5SEL", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P6.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A0"
                    ],
                    functionConfig : [
                        [
                            { register : "P6DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P6DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P6.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A1"
                    ],
                    functionConfig : [
                        [
                            { register : "P6DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P6DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P6.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A2"
                    ],
                    functionConfig : [
                        [
                            { register : "P6DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P6DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P6.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A3"
                    ],
                    functionConfig : [
                        [
                            { register : "P6DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P6DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P6.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A4"
                    ],
                    functionConfig : [
                        [
                            { register : "P6DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P6DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P6.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A5"
                    ],
                    functionConfig : [
                        [
                            { register : "P6DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P6DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P6DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "INCH", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P6.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A6"
                    ],
                    functionConfig : [
                        [
                            { register : "P6DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P6DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P6.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A7"
                    ],
                    functionConfig : [
                        [
                            { register : "P6DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P6DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P6SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P7.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "XIN"
                    ],
                    functionConfig : [
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P7SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P7.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "XOUT"
                    ],
                    functionConfig : [
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P7SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P7.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TB0OUTH",
                        "SVMOUT"
                    ],
                    functionConfig : [
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P7SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P7.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA1.CCI2B",
                        "TA1.2"
                    ],
                    functionConfig : [
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P7SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P7.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A12"
                    ],
                    functionConfig : [
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P7.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A13"
                    ],
                    functionConfig : [
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P7.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A14"
                    ],
                    functionConfig : [
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P7.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A15"
                    ],
                    functionConfig : [
                        [
                            { register : "P7DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P7DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P7SEL", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "INCH", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "INCH", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P8.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA1.CCI2B",
                        "TA1.2"
                    ],
                    functionConfig : [
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P8SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P8.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI1B",
                        "TA0.1"
                    ],
                    functionConfig : [
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P8SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P8.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI1B",
                        "TA0.1"
                    ],
                    functionConfig : [
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P8SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P8.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI3B",
                        "TA0.3"
                    ],
                    functionConfig : [
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P8SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P8.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA0.CCI4B",
                        "TA0.4"
                    ],
                    functionConfig : [
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P8SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P8.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA1.CCI0B",
                        "TA1.0"
                    ],
                    functionConfig : [
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P8SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P8.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "TA1.CCI1B",
                        "TA1.1"
                    ],
                    functionConfig : [
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P8SEL", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P8.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P8DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P8DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P8SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P9.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB2STE/UCA2CLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P9DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P9DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P9SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P9.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB2SIMO/UCB2SDA"
                    ],
                    functionConfig : [
                        [
                            { register : "P9DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P9DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P9SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P9.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB2SOMI/UCB2SCL"
                    ],
                    functionConfig : [
                        [
                            { register : "P9DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P9DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P9SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P9.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB2CLK/UCA2STE"
                    ],
                    functionConfig : [
                        [
                            { register : "P9DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P9DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P9SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P9.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCA2TXD/UCA2SIMO"
                    ],
                    functionConfig : [
                        [
                            { register : "P9DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P9DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P9SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P9.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCA2RXD/UCA2SOMI"
                    ],
                    functionConfig : [
                        [
                            { register : "P9DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P9DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P9SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P9.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P9DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P9DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ]
                    ]
                }
            },
            {
                pinName : "P9.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P9DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P9DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P9SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P10.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB3STE/UCA3CLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P10DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P10DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P10SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P10.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB3SIMO/UCB3SDA"
                    ],
                    functionConfig : [
                        [
                            { register : "P10DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P10DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P10SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P10.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB3SOMI/UCB3SCL"
                    ],
                    functionConfig : [
                        [
                            { register : "P10DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P10DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P10SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P10.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCB3CLK/UCA3STE"
                    ],
                    functionConfig : [
                        [
                            { register : "P10DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P10DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P10SEL", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P10.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCA3TXD/UCA3SIMO"
                    ],
                    functionConfig : [
                        [
                            { register : "P10DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P10DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P10SEL", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P10.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "UCA3RXD/UCA3SOMI"
                    ],
                    functionConfig : [
                        [
                            { register : "P10DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P10DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P10SEL", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P10.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P10DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P10DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ]
                    ]
                }
            },
            {
                pinName : "P10.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P10DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P10DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P10SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ]
                    ]
                }
            }
        ],
        [
            {
                pinName : "P11.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "ACLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P11DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P11DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P11DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P11SEL", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P11.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "MCLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P11DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P11DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P11DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P11SEL", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P11.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "SMCLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P11DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P11DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P11DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P11SEL", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P11.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input"
                    ],
                    functionConfig : [
                        [
                            { register : "P11DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ]
                    ]
                }
            },
            {
                pinName : "P11.4",
                pinFunction : {
                    functionName : [
                        "GPIO Input"
                    ],
                    functionConfig : [
                        [
                            { register : "P11DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ]
                    ]
                }
            },
            {
                pinName : "P11.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input"
                    ],
                    functionConfig : [
                        [
                            { register : "P11DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ]
                    ]
                }
            },
            {
                pinName : "P11.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input"
                    ],
                    functionConfig : [
                        [
                            { register : "P11DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ]
                    ]
                }
            },
            {
                pinName : "P11.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input"
                    ],
                    functionConfig : [
                        [
                            { register : "P11DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P11SEL", bitSetMask : 0x00, bitClearMask : 0x80 }
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
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.1",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.2",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x04, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.3",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x08, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.4",
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
                pinName : "PJ.5",
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
