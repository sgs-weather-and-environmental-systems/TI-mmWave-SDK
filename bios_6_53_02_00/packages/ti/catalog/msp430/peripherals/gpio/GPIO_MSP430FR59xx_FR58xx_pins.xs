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
 *  ======== GPIO_MSP430FR59xx_FR58xx.xs ========
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
                        "A0/CE0/VREF-/VeREF-"
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
                        "CEOUT",
                        "A1/CE1/VREF+/VeREF+"
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
                        "CEOUT",
                        "A2/CE2"
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
                        "A3/CE3"
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
                        "A4/CE4"
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
                        "A5/CE5"
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
                        "TB0.CCI3B",
                        "TB0.3",
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
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL0", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P1SEL0", bitSetMask : 0x40, bitClearMask : 0x00 }
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
                        "TB0.CCI4B",
                        "TB0.4",
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
                            { register : "P1DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL0", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P1DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P1SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P1SEL0", bitSetMask : 0x80, bitClearMask : 0x00 }
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
                        "TB0.CCI6B",
                        "TB0.6",
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
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P2SEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "TB0.CCI0A",
                        "TB0.0",
                        "UCA0RXD/UCA0SOMI"
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
                            { register : "P2DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P2SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
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
                        "TB0.2",
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
                            { register : "P2DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P2SEL0", bitSetMask : 0x04, bitClearMask : 0x00 }
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
                        "UCA1STE",
                        "A6/CE10"
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
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
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
                        "UCA1CLK",
                        "A7/CE11"
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
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
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
                        "TB0.0",
                        "UCA1TXD/UCA1SIMO"
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
                        ],
                        [
                            { register : "P2SEL1", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P2SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
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
                        "TB0.1",
                        "UCA1RXD/UCA1SOMI"
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
                        ],
                        [
                            { register : "P2DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P2SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P2SEL0", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P2SEL1", bitSetMask : 0x40, bitClearMask : 0x00 },
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
                pinName : "P3.0",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "A12/CE12"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P3SEL1", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P3SEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "A13/CE13"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P3SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P3SEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
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
                        "A14/CE14"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P3SEL1", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P3SEL0", bitSetMask : 0x04, bitClearMask : 0x00 }
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
                        "A15/CE15"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P3SEL1", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P3SEL0", bitSetMask : 0x08, bitClearMask : 0x00 }
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
                        "TB0.CCI3A",
                        "TB0.3",
                        "SMCLK"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P3SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x10, bitClearMask : 0x00 }
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
                        "TB0.CCI4A",
                        "TB0.4",
                        "CEOUT"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL0", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P3SEL0", bitSetMask : 0x20, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x20, bitClearMask : 0x00 }
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
                        "TB0.CCI5A",
                        "TB0.5"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL0", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P3SEL0", bitSetMask : 0x40, bitClearMask : 0x00 }
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
                        "TB0.CCI6A",
                        "TB0.6"
                    ],
                    functionConfig : [
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL0", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P3DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P3SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P3SEL0", bitSetMask : 0x80, bitClearMask : 0x00 }
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
                        "A8"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "P4SEL1", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "P4SEL0", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "A9"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "P4SEL1", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "P4SEL0", bitSetMask : 0x02, bitClearMask : 0x00 }
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
                        "A10"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "P4SEL1", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "P4SEL0", bitSetMask : 0x04, bitClearMask : 0x00 }
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
                        "A11"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "P4SEL1", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "P4SEL0", bitSetMask : 0x08, bitClearMask : 0x00 }
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
                        "TB0.CCI5B",
                        "TB0.5"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x10 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x10, bitClearMask : 0x00 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x10 },
                            { register : "P4SEL0", bitSetMask : 0x10, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.5",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x20, bitClearMask : 0x00 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x20 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x20 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.6",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ]
                    ]
                }
            },
            {
                pinName : "P4.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output"
                    ],
                    functionConfig : [
                        [
                            { register : "P4DIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "P4DIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "P4SEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "P4SEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
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
                        "CE6"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL0", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x01 },
                            { register : "PJSEL0", bitSetMask : 0x01, bitClearMask : 0x00 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x01 }
                        ],
                        [
                            { register : "CEPD", bitSetMask : 0x01, bitClearMask : 0x00 }
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
                        "CE7"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x02 },
                            { register : "PJSEL0", bitSetMask : 0x02, bitClearMask : 0x00 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x02 }
                        ],
                        [
                            { register : "CEPD", bitSetMask : 0x02, bitClearMask : 0x00 }
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
                        "CE8"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x04 },
                            { register : "PJSEL0", bitSetMask : 0x04, bitClearMask : 0x00 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x04 }
                        ],
                        [
                            { register : "CEPD", bitSetMask : 0x04, bitClearMask : 0x00 }
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
                        "CE9"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x08, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x08 },
                            { register : "CEPD", bitSetMask : 0x00, bitClearMask : 0x08 }
                        ],
                        [
                            { register : "CEPD", bitSetMask : 0x08, bitClearMask : 0x00 }
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
                        "LFXIN"
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
                        "LFXOUT"
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
                        "GPIO Input",
                        "GPIO Output",
                        "HFXIN"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x40, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x40 }
                        ],
                        [
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x40 },
                            { register : "PJSEL0", bitSetMask : 0x40, bitClearMask : 0x00 }
                        ]
                    ]
                }
            },
            {
                pinName : "PJ.7",
                pinFunction : {
                    functionName : [
                        "GPIO Input",
                        "GPIO Output",
                        "HFXOUT"
                    ],
                    functionConfig : [
                        [
                            { register : "PJDIR", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "PJDIR", bitSetMask : 0x80, bitClearMask : 0x00 },
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "PJSEL0", bitSetMask : 0x00, bitClearMask : 0x80 }
                        ],
                        [
                            { register : "PJSEL1", bitSetMask : 0x00, bitClearMask : 0x80 },
                            { register : "PJSEL0", bitSetMask : 0x80, bitClearMask : 0x00 }
                        ]
                    ]
                }
            }
        ]
    ];
}
