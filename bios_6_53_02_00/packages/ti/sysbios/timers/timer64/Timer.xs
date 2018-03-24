/*
 * Copyright (c) 2015-2017, Texas Instruments Incorporated
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
 *  ======== Timer.xs ========
 */

var Timer = null;
var Hwi = null;
var BIOS = null;
var catalogName;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.Arm9":
            return (["Timer_asm.s470"]);
            break;

        case "gnu.targets.arm.A15F":
            return (["Timer_asm_gnu.sv7A"]);
            break;

        case "ti.targets.elf.C674":
        case "ti.targets.elf.C64P":
        case "ti.targets.elf.C64P_big_endian":
        case "ti.targets.elf.C66":
        case "ti.targets.elf.C66_big_endian":
        case "ti.targets.elf.C67P":
            return (["Timer_asm.s64P"]);
            break;

        default:
            return (null);
            break;
    }
}

if (xdc.om.$name == "cfg" || typeof(genCdoc) != "undefined") {
    var deviceTable = {
        "ti.catalog.c6000": {
           "TMS320CDM6446": {
                freqDivisor: 0,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x01c21400,
                        intNum:  [ 14, 4],
                        eventId: [ 4, 5],
                        intFreq: {
                            lo: 27000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21800,
                        intNum:  [ 15, 5],
                        eventId: [ 6, 7],
                        intFreq: {
                            lo: 27000000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320CDM6467": {
                freqDivisor: 4,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x01c21400,
                        intNum:  [ 14, 4],
                        eventId: [ 4, 5],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 4,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21800,
                        intNum:  [ 15, 5],
                        eventId: [ 6, 7],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 4,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320CDM6437": {
                freqDivisor: 0,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x01c21400,
                        intNum:  [ 14, 4],
                        eventId: [ 4, 5],
                        intFreq: {
                            lo: 27000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21800,
                        intNum:  [ 15, 5],
                        eventId: [ 6, 7],
                        intFreq: {
                            lo: 27000000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320CTCI6482": {
                freqDivisor: 6,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02940000,
                        intNum:  [ 14, 4],
                        eventId: [ 67, 68],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02980000,
                        intNum:  [ 15, 5],
                        eventId: [ 69, 70],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320CTCI6486": {
                freqDivisor: 6,
                numLocalTimers: 6,
                timer:  [
                    {
                        name: "Timer0",
                        baseAddr: 0x025e0000,       /* core0 local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 16, 17],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x025f0000,       /* core1 local Timer1 */
                        intNum:  [ 14, 4],
                        eventId: [ 16, 17],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02600000,       /* core2 local Timer2 */
                        intNum:  [ 14, 4],
                        eventId: [ 16, 17],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02610000,       /* core3 local Timer3 */
                        intNum:  [ 14, 4],
                        eventId: [ 16, 17],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02620000,       /* core4 local Timer4 */
                        intNum:  [ 14, 4],
                        eventId: [ 16, 17],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02630000,       /* core5 local Timer5 */
                        intNum:  [ 14, 4],
                        eventId: [ 16, 17],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02640000,           /* shared Timer6 */
                        intNum:  [ 15, 5],
                        eventId: [ 18, 19],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02650000,           /* shared Timer7 */
                        intNum:  [ 15, 5],
                        eventId: [ 20, 21],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x2660000,            /* shared Timer8 */
                        intNum:  [ 15, 5],
                        eventId: [ 22, 23],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x2670000,            /* shared Timer9 */
                        intNum:  [ 15, 5],
                        eventId: [ 24, 25],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x2680000,            /* shared Timer10 */
                        intNum:  [ 15, 5],
                        eventId: [ 26, 27],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x2690000,            /* shared Timer11 */
                        intNum:  [ 15, 5],
                        eventId: [ 28, 29],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320CTCI6488": {
                freqDivisor: 6,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02910000,           /* shared Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 33, 34],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02920000,           /* shared Timer1 */
                        intNum:  [ 15, 5],
                        eventId: [ 35, 36],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02930000,           /* shared Timer2 */
                        intNum:  [ 15, 5],
                        eventId: [ 37, 38],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x2940000,            /* shared Timer3 */
                        intNum:  [ 15, 5],
                        eventId: [ 39, 40],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x2950000,            /* shared Timer4 */
                        intNum:  [ 15, 5],
                        eventId: [ 41, 42],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02960000,           /* shared Timer5 */
                        intNum:  [ 15, 5],
                        eventId: [ 43, 44],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320TCI6614": {
                freqDivisor: 6,
                numLocalTimers: 4,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* core0 local Timer0 */
                        intNum:  [ 14, 14],
                        eventId: [ 64, 64],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* core1 local Timer1 */
                        intNum:  [ 14, 14],
                        eventId: [ 64, 64],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,       /* core2 local Timer2 */
                        intNum:  [ 14, 14],
                        eventId: [ 64, 64],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,       /* core3 local Timer3 */
                        intNum:  [ 14, 14],
                        eventId: [ 64, 64],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,        /* shared Timer4 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,        /* shared Timer5 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,        /* shared Timer6 */
                        intNum:  [ 15, 5],
                        eventId: [ 70, 71],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02270000,        /* shared Timer7 */
                        intNum:  [ 15, 5],
                        eventId: [ 72, 73],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320TCI6634": {
                freqDivisor: 6,
                numLocalTimers: 8,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* core0 local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* core1 local Timer1 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,       /* core2 local Timer2 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,       /* core3 local Timer3 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,       /* core4 local Timer4 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,       /* core5 local Timer5 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,       /* core6 local Timer6 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02270000,       /* core7 local Timer7 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x02280000,       /* shared Timer8 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x02290000,       /* shared Timer9 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x022A0000,       /* shared Timer10 */
                        intNum:  [ 15, 5],
                        eventId: [ 70, 71],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x022B0000,       /* shared Timer11 */
                        intNum:  [ 15, 5],
                        eventId: [ 72, 73],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer12",
                        baseAddr: 0x022C0000,       /* Timer12 via intc  */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 27, 28],         /* event id          */
                        sysInt:  [ 433, 434],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer13",
                        baseAddr: 0x022D0000,       /* Timer13 via intc  */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 27, 28],         /* event id          */
                        sysInt:  [ 435, 436],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer14",
                        baseAddr: 0x022E0000,       /* shared Timer14 */
                        intNum:  [ 15, 5],
                        eventId: [ 78, 79],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer15",
                        baseAddr: 0x022F0000,       /* shared Timer15 */
                        intNum:  [ 15, 5],
                        eventId: [ 80, 81],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320TCI6630K2L": {
                freqDivisor: 6,
                numLocalTimers: 4,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* core0 local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* core1 local Timer1 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,       /* core2 local Timer2 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,       /* core3 local Timer3 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,       /* not available:   */
                        intNum:  [ -1, -1],         /* set intNum to -1 */
                        eventId: [ -1, -1],         /* to signify not   */
                        intFreq: {                  /* available        */
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,       /* not available */
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,       /* not available */
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02270000,       /* not available */
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x02280000,       /* shared Timer8 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x02290000,       /* shared Timer9 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x022A0000,       /* shared Timer10 */
                        intNum:  [ 15, 5],
                        eventId: [ 70, 71],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x022B0000,       /* shared Timer11 */
                        intNum:  [ 15, 5],
                        eventId: [ 72, 73],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer12",
                        baseAddr: 0x022C0000,       /* Timer12 via intc  */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 27, 28],         /* event id          */
                        sysInt:  [ 433, 434],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer13",
                        baseAddr: 0x022D0000,       /* Timer13 via intc  */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 27, 28],         /* event id          */
                        sysInt:  [ 435, 436],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer14",
                        baseAddr: 0x022E0000,       /* shared Timer14 */
                        intNum:  [ 15, 5],
                        eventId: [ 78, 79],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer15",
                        baseAddr: 0x022F0000,       /* shared Timer15 */
                        intNum:  [ 15, 5],
                        eventId: [ 80, 81],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
		    //  currently we do not support > than 16 timers
                    //{
                    //    name: "Timer16",
                    //    baseAddr: 0x022F0080,       /* Timer16 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ 441, 440],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                    //{
                    //    name: "Timer17",
                    //    baseAddr: 0x022F0100,       /* Timer17 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ 442, 439],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                ]
            },
            "TMS320C66AK2E02": {
                freqDivisor: 6,
                numLocalTimers: 1,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* core0 local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* not available */
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,       /* not available */
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,       /* not available */
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,       /* not available:   */
                        intNum:  [ -1, -1],         /* set intNum to -1 */
                        eventId: [ -1, -1],         /* to signify not   */
                        intFreq: {                  /* available        */
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,       /* not available */
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,       /* not available */
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02270000,       /* not available */
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x02280000,       /* shared Timer8 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x02290000,       /* shared Timer9 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x022A0000,       /* shared Timer10 */
                        intNum:  [ 15, 5],
                        eventId: [ 70, 71],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x022B0000,       /* shared Timer11 */
                        intNum:  [ 15, 5],
                        eventId: [ 72, 73],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer12",
                        baseAddr: 0x022C0000,       /* Timer12 via intc  */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 27, 28],         /* event id          */
                        sysInt:  [ 433, 434],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer13",
                        baseAddr: 0x022D0000,       /* Timer13 via intc  */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 27, 28],         /* event id          */
                        sysInt:  [ 435, 436],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer14",
                        baseAddr: 0x022E0000,       /* shared Timer14 */
                        intNum:  [ 15, 5],
                        eventId: [ 78, 79],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer15",
                        baseAddr: 0x022F0000,       /* shared Timer15 */
                        intNum:  [ 15, 5],
                        eventId: [ 80, 81],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
		    //  currently we do not support > than 16 timers
                    //{
                    //    name: "Timer16",
                    //    baseAddr: 0x022F0080,       /* Timer16 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ , 199],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                    //{
                    //    name: "Timer17",
                    //    baseAddr: 0x022F0100,       /* Timer17 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ , 200],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                    //{
                    //    name: "Timer18",
                    //    baseAddr: 0x022F0180,       /* Timer18 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ , 201],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                    //{
                    //    name: "Timer19",
                    //    baseAddr: 0x022F0200,       /* Timer19 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ , 202],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                ]
            },
            "TMS320C66AK2H06": {
                freqDivisor: 6,
                numLocalTimers: 8,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* core0 local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* core1 local Timer1 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,       /* core2 local Timer2 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,       /* core3 local Timer3 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,       /* core4 local Timer4 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,       /* core5 local Timer5 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,       /* core6 local Timer6 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02270000,       /* core7 local Timer7 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x02280000,       /* shared Timer8 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x02290000,       /* shared Timer9 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x022A0000,       /* shared Timer10 */
                        intNum:  [ 15, 5],
                        eventId: [ 70, 71],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x022B0000,       /* shared Timer11 */
                        intNum:  [ 15, 5],
                        eventId: [ 72, 73],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer12",
                        baseAddr: 0x022C0000,       /* Timer12 via intc  */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 27, 28],         /* event id          */
                        sysInt:  [ 433, 434],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer13",
                        baseAddr: 0x022D0000,       /* Timer13 via intc  */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 27, 28],         /* event id          */
                        sysInt:  [ 435, 436],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer14",
                        baseAddr: 0x022E0000,       /* shared Timer14 */
                        intNum:  [ 15, 5],
                        eventId: [ 78, 79],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer15",
                        baseAddr: 0x022F0000,       /* shared Timer15 */
                        intNum:  [ 15, 5],
                        eventId: [ 80, 81],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
		    //  currently we do not support > than 16 timers
                    //{
                    //    name: "Timer16",
                    //    baseAddr: 0x022F0080,       /* Timer16 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ 441, ],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                    //{
                    //    name: "Timer17",
                    //    baseAddr: 0x022F0100,       /* Timer17 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ 442, ],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                    //{
                    //    name: "Timer18",
                    //    baseAddr: 0x022F0180,       /* Timer18 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ 443, ],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                    //{
                    //    name: "Timer19",
                    //    baseAddr: 0x022F0200,       /* Timer19 via intc  */
                    //    intNum:  [ -1, -1],         /* interrupt vect id */
                    //    eventId: [ 27, 28],         /* event id          */
                    //    sysInt:  [ 444, ],       /* system interrupt  */
                    //    intFreq: {
                    //        lo: (Program.cpu.clockRate * 1000000) / 6,
                    //        hi: 0,
                    //    },
                    //},
                ]
            },
            "TCI66AK2G02": {
                freqDivisor: 6,
                numLocalTimers: 1,
                timer: [
                    {
                        name: "Timer0",         /* local for DSP */
                        baseAddr: 0x02200000,
                        intNum:  [ 14, 4],
                        eventId: [ 32, 33],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,
                        intNum:  [ 15, 5],
                        eventId: [ 34, 35],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,
                        intNum:  [ 15, 5],
                        eventId: [ 36, 37],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,
                        intNum:  [ 15, 5],
                        eventId: [ 38, 39],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,
                        intNum:  [ 15, 5],
                        eventId: [ 40, 41],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,
                        intNum:  [ 15, 5],
                        eventId: [ 42, 43],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",        /* reserved for A15 */
                        baseAddr: 0x02260000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320C6655": {
                freqDivisor: 6,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* not available:   */
                        intNum:  [ -1, -1],         /* set intNum to -1 */
                        eventId: [ -1, -1],         /* to signify not   */
                        intFreq: {                  /* available        */
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,       /* Timer2 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,       /* Timer3 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,       /* Timer4 via intc   */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 24, 25],         /* event id          */
                        sysInt:  [ 145, 146],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,       /* Timer5 via intc   */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 24, 25],         /* event id          */
                        sysInt:  [ 151, 152],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,       /* Timer6 via intc   */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 24, 25],         /* event id          */
                        sysInt:  [ 153, 154],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02270000,       /* Timer7 via intc   */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 24, 25],         /* event id          */
                        sysInt:  [ 162, 163],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320C6657": {
                freqDivisor: 6,
                numLocalTimers: 2,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* local Timer1 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,       /* shared Timer2 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,       /* shared Timer3 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,       /* Timer4 via intc   */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 24, 25],         /* event id          */
                        sysInt:  [ 145, 146],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,       /* Timer5 via intc   */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 24, 25],         /* event id          */
                        sysInt:  [ 151, 152],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,       /* Timer6 via intc   */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 24, 25],         /* event id          */
                        sysInt:  [ 153, 154],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02270000,       /* Timer7 via intc   */
                        intNum:  [ -1, -1],         /* interrupt vect id */
                        eventId: [ 24, 25],         /* event id          */
                        sysInt:  [ 162, 163],       /* system interrupt  */
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320C6670": {
                freqDivisor: 6,
                numLocalTimers: 4,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* core0 local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* core1 local Timer1 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,       /* core2 local Timer2 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,       /* core3 local Timer3 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,        /* shared Timer4 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,        /* shared Timer5 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,        /* shared Timer6 */
                        intNum:  [ 15, 5],
                        eventId: [ 70, 71],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02270000,        /* shared Timer7 */
                        intNum:  [ 15, 5],
                        eventId: [ 72, 73],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320C6672": {
                freqDivisor: 6,
                numLocalTimers: 2,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* core0 local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* core1 local Timer1 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,        /* shared Timer2 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,        /* shared Timer3 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320C6671": {
                freqDivisor: 6,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02280000,       /* local Timer1 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02290000,       /* local Timer2 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x022A0000,       /* local Timer3 */
                        intNum:  [ 15, 5],
                        eventId: [ 70, 71],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x022B0000,       /* local Timer4 */
                        intNum:  [ 15, 5],
                        eventId: [ 72, 73],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x022C0000,       /* local Timer5 */
                        intNum:  [ 15, 5],
                        eventId: [ 74, 75],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x022D0000,       /* local Timer6 */
                        intNum:  [ 15, 5],
                        eventId: [ 76, 77],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x022E0000,       /* local Timer7 */
                        intNum:  [ 15, 5],
                        eventId: [ 78, 79],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x022F0000,       /* local Timer8 */
                        intNum:  [ 15, 5],
                        eventId: [ 80, 81],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320C6678": {
                freqDivisor: 6,
                numLocalTimers: 8,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02200000,       /* core0 local Timer0 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,       /* core1 local Timer1 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,       /* core2 local Timer2 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,       /* core3 local Timer3 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,       /* core4 local Timer4 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,       /* core5 local Timer5 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,       /* core6 local Timer6 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",
                        baseAddr: 0x02270000,       /* core7 local Timer7 */
                        intNum:  [ 14, 4],
                        eventId: [ 64, 65],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x02280000,       /* shared Timer8 */
                        intNum:  [ 15, 5],
                        eventId: [ 66, 67],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x02290000,       /* shared Timer9 */
                        intNum:  [ 15, 5],
                        eventId: [ 68, 69],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x022A0000,       /* shared Timer10 */
                        intNum:  [ 15, 5],
                        eventId: [ 70, 71],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x022B0000,       /* shared Timer11 */
                        intNum:  [ 15, 5],
                        eventId: [ 72, 73],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer12",
                        baseAddr: 0x022C0000,       /* shared Timer12 */
                        intNum:  [ 15, 5],
                        eventId: [ 74, 75],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer13",
                        baseAddr: 0x022D0000,       /* shared Timer13 */
                        intNum:  [ 15, 5],
                        eventId: [ 76, 77],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer14",
                        baseAddr: 0x022E0000,       /* shared Timer14 */
                        intNum:  [ 15, 5],
                        eventId: [ 78, 79],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer15",
                        baseAddr: 0x022F0000,       /* shared Timer15 */
                        intNum:  [ 15, 5],
                        eventId: [ 80, 81],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320CDM648": {
                freqDivisor: 6,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x02044400,
                        intNum:  [ 14, 4],
                        eventId: [ 67, 68],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02044800,
                        intNum:  [ 15, 5],
                        eventId: [ 69, 70],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 6,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320DA830": {
                freqDivisor: 0,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x01c20000,
                        intNum:  [ 14, 4],
                        eventId: [ 4, 64],
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21000,
                        intNum:  [ 15, 5],
                        eventId: [ 40, 48],
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320DA850": {
                freqDivisor: 0,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x01c20000,
                        intNum:  [ 14, 4],
                        eventId: [ 4, 64],
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21000,
                        intNum:  [ 15, 5],
                        eventId: [ 40, 48],
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x01f0c000,
                        intNum:  [ 6, 6],
                        eventId: [ 25, 25],
                        intFreq: {
                            lo: 150000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x01f0d000,
                        intNum:  [ 7, 7],
                        eventId: [ 86, 86],
                        intFreq: {
                            lo: 150000000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arm": {
            "TMS320CDM6446": {
                freqDivisor: 0,
                timer: [
                    {
                         name: "Timer0",
                        baseAddr: 0x01c21400,
                        intNum:  [ 32, 33],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 27000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21800,
                        intNum:  [ 34, 35],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 27000000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320CDM6467": {
                freqDivisor: 2,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x01c21400,
                        intNum:  [ 32, 33],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 2,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21800,
                        intNum:  [ 34, 35],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: (Program.cpu.clockRate * 1000000) / 2,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320CDM510": {
                freqDivisor: 0,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x01c21400,
                        intNum:  [ 32, 33],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 90000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21800,
                        intNum:  [ 34, 35],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 90000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x01c21c00,
                        intNum:  [ 36, 37],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 90000000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320DA830": {
                freqDivisor: 0,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x01c20000,
                        intNum:  [ 21, 22],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21000,
                        intNum:  [ 23, 24],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TMS320DA850": {
                freqDivisor: 0,
                timer: [
                    {
                        name: "Timer0",
                        baseAddr: 0x01c20000,
                        intNum:  [ 21, 22],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x01c21000,
                        intNum:  [ 23, 24],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x01f0c000,
                        intNum:  [ 68, 68],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 150000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x01f0d000,
                        intNum:  [ 96, 96],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 150000000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arm.cortexa15": {
            "C66AK2E05": {
                freqDivisor: 0,
                numLocalTimers: 4,
                localTimerBaseId: 16,
                useTimer64pRegMap: true,
                timer: [
                    {
                        name: "Timer0",         // Reserved for DSP
                        baseAddr: 0x02200000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",         // Reserved (Unavailable)
                        baseAddr: 0x02210000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",         // Reserved (Unavailable)
                        baseAddr: 0x02220000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",         // Reserved (Unavailable)
                        baseAddr: 0x02230000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",         // Reserved (Unavailable)
                        baseAddr: 0x02240000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",         // Reserved (Unavailable)
                        baseAddr: 0x02250000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",         // Reserved (Unavailable)
                        baseAddr: 0x02260000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",         // Reserved (Unavailable)
                        baseAddr: 0x02270000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x02280000,       /* shared Timer8 */
                        intNum:  [ 128, 129],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x02290000,       /* shared Timer9 */
                        intNum:  [ 130, 131],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x022A0000,       /* shared Timer10 */
                        intNum:  [ 132, 133],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x022B0000,       /* shared Timer11 */
                        intNum:  [ 134, 135],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer12",
                        baseAddr: 0x022C0000,       /* shared Timer12 */
                        intNum:  [ 136, 137],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer13",
                        baseAddr: 0x022D0000,       /* shared Timer13 */
                        intNum:  [ 138, 139],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer14",
                        baseAddr: 0x022E0000,       /* shared Timer14 */
                        intNum:  [ 140, 141],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer15",
                        baseAddr: 0x022F0000,       /* shared Timer15 */
                        intNum:  [ 142, 143],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer16",
                        baseAddr: 0x022F0080,       /* local Timer 16 */
                        intNum:  [ 144, 145],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer17",
                        baseAddr: 0x022F0100,       /* local Timer 17 */
                        intNum:  [ 146, 147],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer18",
                        baseAddr: 0x022F0180,       /* local Timer 18 */
                        intNum:  [ 148, 149],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer19",
                        baseAddr: 0x022F0200,       /* local Timer 19 */
                        intNum:  [ 150, 151],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TCI66AK2G02": {
                freqDivisor: 0,
                numLocalTimers: 1,
                localTimerBaseId: 6,
                useTimer64pRegMap: true,
                timer: [
                    {
                        name: "Timer0",         /* Reserved for DSP */
                        baseAddr: 0x02200000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",
                        baseAddr: 0x02210000,
                        intNum:  [ 50, 51],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",
                        baseAddr: 0x02220000,
                        intNum:  [ 52, 53],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",
                        baseAddr: 0x02230000,
                        intNum:  [ 54, 55],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",
                        baseAddr: 0x02240000,
                        intNum:  [ 56, 57],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",
                        baseAddr: 0x02250000,
                        intNum:  [ 58, 59],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",
                        baseAddr: 0x02260000,
                        intNum:  [ 60, 61],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TCI6630K2L": {
                freqDivisor: 0,
                numLocalTimers: 2,
                localTimerBaseId: 16,
                useTimer64pRegMap: true,
                timer: [
                    {
                        name: "Timer0",         // Reserved for DSP
                        baseAddr: 0x02200000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",         // Reserved for DSP
                        baseAddr: 0x02210000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",         // Reserved for DSP
                        baseAddr: 0x02220000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",         // Reserved for DSP
                        baseAddr: 0x02230000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",         // Reserved (Unavailable)
                        baseAddr: 0x02240000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",         // Reserved (Unavailable)
                        baseAddr: 0x02250000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",         // Reserved (Unavailable)
                        baseAddr: 0x02260000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",         // Reserved (Unavailable)
                        baseAddr: 0x02270000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x02280000,       /* shared Timer8 */
                        intNum:  [ 128, 129],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x02290000,       /* shared Timer9 */
                        intNum:  [ 130, 131],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x022A0000,       /* shared Timer10 */
                        intNum:  [ 132, 133],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x022B0000,       /* shared Timer11 */
                        intNum:  [ 134, 135],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer12",
                        baseAddr: 0x022C0000,       /* shared Timer12 */
                        intNum:  [ 136, 137],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer13",
                        baseAddr: 0x022D0000,       /* shared Timer13 */
                        intNum:  [ 138, 139],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer14",
                        baseAddr: 0x022E0000,       /* shared Timer14 */
                        intNum:  [ 140, 141],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer15",
                        baseAddr: 0x022F0000,       /* shared Timer15 */
                        intNum:  [ 142, 143],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer16",
                        baseAddr: 0x022F0080,       /* local Timer 16 */
                        intNum:  [ 144, 145],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer17",
                        baseAddr: 0x022F0100,       /* local Timer 17 */
                        intNum:  [ 146, 147],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TCI6636K2H": {
                freqDivisor: 0,
                numLocalTimers: 4,
                localTimerBaseId: 16,
                useTimer64pRegMap: true,
                timer: [
                    {
                        name: "Timer0",         // Reserved for DSP
                        baseAddr: 0x02200000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",         // Reserved for DSP
                        baseAddr: 0x02210000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",         // Reserved for DSP
                        baseAddr: 0x02220000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",         // Reserved for DSP
                        baseAddr: 0x02230000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",         // Reserved for DSP
                        baseAddr: 0x02240000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",         // Reserved for DSP
                        baseAddr: 0x02250000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",         // Reserved for DSP
                        baseAddr: 0x02260000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",         // Reserved for DSP
                        baseAddr: 0x02270000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x02280000,       /* shared Timer8 */
                        intNum:  [ 128, 129],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x02290000,       /* shared Timer9 */
                        intNum:  [ 130, 131],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x022A0000,       /* shared Timer10 */
                        intNum:  [ 132, 133],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x022B0000,       /* shared Timer11 */
                        intNum:  [ 134, 135],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer12",
                        baseAddr: 0x022C0000,       /* shared Timer12 */
                        intNum:  [ 136, 137],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer13",
                        baseAddr: 0x022D0000,       /* shared Timer13 */
                        intNum:  [ 138, 139],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer14",
                        baseAddr: 0x022E0000,       /* shared Timer14 */
                        intNum:  [ 140, 141],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer15",
                        baseAddr: 0x022F0000,       /* shared Timer15 */
                        intNum:  [ 142, 143],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer16",
                        baseAddr: 0x022F0080,       /* local Timer 16 */
                        intNum:  [ 144, 145],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer17",
                        baseAddr: 0x022F0100,       /* local Timer 17 */
                        intNum:  [ 146, 147],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer18",
                        baseAddr: 0x022F0180,       /* local Timer 18 */
                        intNum:  [ 148, 149],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer19",
                        baseAddr: 0x022F0200,       /* local Timer 19 */
                        intNum:  [ 150, 151],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TCI6638K2K": {
                freqDivisor: 0,
                numLocalTimers: 4,
                localTimerBaseId: 16,
                useTimer64pRegMap: true,
                timer: [
                    {
                        name: "Timer0",         // Reserved for DSP
                        baseAddr: 0x02200000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer1",         // Reserved for DSP
                        baseAddr: 0x02210000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer2",         // Reserved for DSP
                        baseAddr: 0x02220000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer3",         // Reserved for DSP
                        baseAddr: 0x02230000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer4",         // Reserved for DSP
                        baseAddr: 0x02240000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer5",         // Reserved for DSP
                        baseAddr: 0x02250000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer6",         // Reserved for DSP
                        baseAddr: 0x02260000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer7",         // Reserved for DSP
                        baseAddr: 0x02270000,
                        intNum:  [ -1, -1],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer8",
                        baseAddr: 0x02280000,       /* shared Timer8 */
                        intNum:  [ 128, 129],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer9",
                        baseAddr: 0x02290000,       /* shared Timer9 */
                        intNum:  [ 130, 131],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer10",
                        baseAddr: 0x022A0000,       /* shared Timer10 */
                        intNum:  [ 132, 133],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer11",
                        baseAddr: 0x022B0000,       /* shared Timer11 */
                        intNum:  [ 134, 135],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer12",
                        baseAddr: 0x022C0000,       /* shared Timer12 */
                        intNum:  [ 136, 137],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer13",
                        baseAddr: 0x022D0000,       /* shared Timer13 */
                        intNum:  [ 138, 139],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer14",
                        baseAddr: 0x022E0000,       /* shared Timer14 */
                        intNum:  [ 140, 141],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer15",
                        baseAddr: 0x022F0000,       /* shared Timer15 */
                        intNum:  [ 142, 143],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer16",
                        baseAddr: 0x022F0080,       /* local Timer 16 */
                        intNum:  [ 144, 145],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer17",
                        baseAddr: 0x022F0100,       /* local Timer 17 */
                        intNum:  [ 146, 147],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer18",
                        baseAddr: 0x022F0180,       /* local Timer 18 */
                        intNum:  [ 148, 149],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                    {
                        name: "Timer19",
                        baseAddr: 0x022F0200,       /* local Timer 19 */
                        intNum:  [ 150, 151],
                        eventId: [ -1, -1],
                        intFreq: {
                            lo: 20480000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
    };

    deviceTable["ti.catalog.c6000"]["TMS320CDM415"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6446"];
    deviceTable["ti.catalog.c6000"]["TMS320CDM420"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6446"];
    deviceTable["ti.catalog.c6000"]["TMS320CDM421"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6446"];
    deviceTable["ti.catalog.c6000"]["TMS320CDM425"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6446"];
    deviceTable["ti.catalog.c6000"]["TMS320CDM426"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6446"];

    deviceTable["ti.catalog.c6000"]["TMS320C6421"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6437"];
    deviceTable["ti.catalog.c6000"]["TMS320C6424"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6437"];
    deviceTable["ti.catalog.c6000"]["TMS320CDM6431"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6437"];
    deviceTable["ti.catalog.c6000"]["TMS320CDM6433"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6437"];
    deviceTable["ti.catalog.c6000"]["TMS320CDM6435"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM6437"];

    deviceTable["ti.catalog.c6000"]["TMS320C6454"] =
        deviceTable["ti.catalog.c6000"]["TMS320CTCI6482"];
    deviceTable["ti.catalog.c6000"]["TMS320C6455"] =
        deviceTable["ti.catalog.c6000"]["TMS320CTCI6482"];
    deviceTable["ti.catalog.c6000"]["TMS320C6457"] =
        deviceTable["ti.catalog.c6000"]["TMS320CTCI6482"];
    deviceTable["ti.catalog.c6000"]["TMS320CTCI6484"] =
        deviceTable["ti.catalog.c6000"]["TMS320CTCI6482"];
        
    deviceTable["ti.catalog.c6000"]["TMS320C6452"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM648"];
    deviceTable["ti.catalog.c6000"]["TMS320CDM647"] =
        deviceTable["ti.catalog.c6000"]["TMS320CDM648"];

    deviceTable["ti.catalog.c6000"]["TMS320C6472"] =
        deviceTable["ti.catalog.c6000"]["TMS320CTCI6486"];

    deviceTable["ti.catalog.c6000"]["TMS320C6474"] =
        deviceTable["ti.catalog.c6000"]["TMS320CTCI6488"];
    deviceTable["ti.catalog.c6000"]["TMS320CTCI6487"] =
        deviceTable["ti.catalog.c6000"]["TMS320CTCI6488"];
    deviceTable["ti.catalog.c6000"]["TMS320TCI6485"] =
        deviceTable["ti.catalog.c6000"]["TMS320CTCI6488"];
    deviceTable["ti.catalog.c6000"]["TMS320TCI6489"] =
        deviceTable["ti.catalog.c6000"]["TMS320CTCI6488"];

    deviceTable["ti.catalog.c6000"]["TMS320TCI6608"] =
        deviceTable["ti.catalog.c6000"]["TMS320C6678"];
    
    deviceTable["ti.catalog.c6000"]["Kepler"] =
        deviceTable["ti.catalog.c6000"]["TMS320TCI6634"];
    deviceTable["ti.catalog.c6000"]["TMS320TCI6636"] =
        deviceTable["ti.catalog.c6000"]["TMS320TCI6634"];
    deviceTable["ti.catalog.c6000"]["TMS320TCI6638"] =
        deviceTable["ti.catalog.c6000"]["TMS320TCI6634"];

    deviceTable["ti.catalog.c6000"]["TMS320C66AK2H12"] =
        deviceTable["ti.catalog.c6000"]["TMS320C66AK2H06"];

    deviceTable["ti.catalog.c6000"]["TMS320C66AK2E05"] =
        deviceTable["ti.catalog.c6000"]["TMS320C66AK2E02"];

    deviceTable["ti.catalog.c6000"]["TMS320TCI6616"] =
        deviceTable["ti.catalog.c6000"]["TMS320C6670"];
    deviceTable["ti.catalog.c6000"]["TMS320TCI6618"] =
        deviceTable["ti.catalog.c6000"]["TMS320C6670"];
    deviceTable["ti.catalog.c6000"]["TMS320C6654"] = 
        deviceTable["ti.catalog.c6000"]["TMS320C6655"];
    deviceTable["ti.catalog.c6000"]["TMS320C6674"] = 
        deviceTable["ti.catalog.c6000"]["TMS320C6670"];

    deviceTable["ti.catalog.c6000"]["TMS320DA802"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320DA803"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320DA804"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320DA805"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320DA807"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320DA808"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320DA810"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320DA828"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320C6747"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320C6745"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["TMS320C6743"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];
    deviceTable["ti.catalog.c6000"]["OMAPL137"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA830"];

    deviceTable["ti.catalog.c6000"]["OMAPL138"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA850"];
    deviceTable["ti.catalog.c6000"]["TMS320DA840"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA850"];
    deviceTable["ti.catalog.c6000"]["TMS320C6742"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA850"];
    deviceTable["ti.catalog.c6000"]["TMS320C6746"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA850"];
    deviceTable["ti.catalog.c6000"]["TMS320C6748"] =
        deviceTable["ti.catalog.c6000"]["TMS320DA850"];
    

    deviceTable["ti.catalog.arm"]["TMS320DA805"] =
        deviceTable["ti.catalog.arm"]["TMS320DA830"];
    deviceTable["ti.catalog.arm"]["TMS320DA807"] =
        deviceTable["ti.catalog.arm"]["TMS320DA830"];
    deviceTable["ti.catalog.arm"]["TMS320DA808"] =
        deviceTable["ti.catalog.arm"]["TMS320DA830"];
    deviceTable["ti.catalog.arm"]["TMS320DA810"] =
        deviceTable["ti.catalog.arm"]["TMS320DA830"];
    deviceTable["ti.catalog.arm"]["TMS320DA828"] =
        deviceTable["ti.catalog.arm"]["TMS320DA830"];
    deviceTable["ti.catalog.arm"]["OMAPL137"] =
        deviceTable["ti.catalog.arm"]["TMS320DA830"];
    deviceTable["ti.catalog.arm"]["AM1705"] =
        deviceTable["ti.catalog.arm"]["TMS320DA830"];
    deviceTable["ti.catalog.arm"]["AM1707"] =
        deviceTable["ti.catalog.arm"]["TMS320DA830"];


    deviceTable["ti.catalog.arm"]["OMAPL108"] =
        deviceTable["ti.catalog.arm"]["TMS320DA850"];
    deviceTable["ti.catalog.arm"]["OMAPL118"] =
        deviceTable["ti.catalog.arm"]["TMS320DA850"];
    deviceTable["ti.catalog.arm"]["OMAPL138"] =
        deviceTable["ti.catalog.arm"]["TMS320DA850"];
    deviceTable["ti.catalog.arm"]["TMS320DA850"] =
        deviceTable["ti.catalog.arm"]["TMS320DA850"];
    deviceTable["ti.catalog.arm"]["AM1806"] =
        deviceTable["ti.catalog.arm"]["TMS320DA850"];
    deviceTable["ti.catalog.arm"]["AM1808"] =
        deviceTable["ti.catalog.arm"]["TMS320DA850"];

        
    deviceTable["ti.catalog.arm"]["TMS320DM355"] =
        deviceTable["ti.catalog.arm"]["TMS320CDM6446"];
    deviceTable["ti.catalog.arm"]["TMS320DM365"] =
        deviceTable["ti.catalog.arm"]["TMS320CDM6446"];
}

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    /* Only process during "cfg" phase */
    if (xdc.om.$name != "cfg") {
        return;
    }

    this.$private.getAsmFiles = getAsmFiles;

    Timer = this;

    /* set fxntab default */
    Timer.common$.fxntab = false;

    catalogName = Program.cpu.catalogName;

    /* loop through the device table */
    for (deviceName in deviceTable[catalogName]) {
        if (deviceName == Program.cpu.deviceName) {
            var device = deviceTable[catalogName][deviceName].timer;
            var local = deviceTable[catalogName][deviceName].numLocalTimers;
            var divisor = deviceTable[catalogName][deviceName].freqDivisor;
            var useTimer64pRegMap =
                deviceTable[catalogName][deviceName].useTimer64pRegMap;
            var localTimerBaseId =
                deviceTable[catalogName][deviceName].localTimerBaseId;

            /* initialize timer fields */
            if ((localTimerBaseId != undefined) && (local != undefined)) {
                /*
                 * If localTimerBaseId is set then use the base id and the
                 * number of local timers to generate the any mask. For
                 * instance, if base id is 4 and there are 8 local timers,
                 * any mask should be 0x 0000 0000 0000 FF00
                 */

                if (device.length > 32) {
                    Timer.$logError("This module cannot support a device " +
                    "with this many timers: " + device.length, Timer);
                }

                if (localTimerBaseId > device.length) {
                    Timer.$logError("Local timer base id out of range.", Timer);
                }

                if ((localTimerBaseId + local) > device.length) {
                    Timer.$logError("Too many timers set as local timers. " +
                            "Change local timer base id or num local timers. ",
                            Timer);
                }

                Timer.anyMask = 0;
                Timer.anyMaskHigh = 0;
                Timer.localTimerBaseId = localTimerBaseId;

                for (var i = localTimerBaseId; i < (localTimerBaseId + local); i++) {
                    if (i < 16) {
                        Timer.anyMask |= (3 << (i << 1));
                    }
                    else {
                        Timer.anyMaskHigh |= (3 << ((i - 16) << 1));
                    }
                }
            }
            else {
                if (device.length < 16) {
                    Timer.anyMask = (1 << (device.length << 1)) - 1;
                    Timer.anyMaskHigh = 0;
                }
                else if (device.length == 16) {
                    Timer.anyMask = 0xffffffff;
                    Timer.anyMaskHigh = 0;
                }
                else if (device.length < 32) {
                    Timer.anyMask = 0xffffffff;
                    Timer.anyMaskHigh = (1 << ((device.length - 16) << 1)) - 1;
                }
                else if (device.length == 32) {
                    Timer.anyMask = 0xffffffff;
                    Timer.anyMaskHigh = 0xffffffff;
                }
                else {
                    Timer.$logError("This module cannot support a device " +
                       "with this many timers: " + device.length, Timer);
                }
            }

            Timer.timerSettings.length = device.length;
            Timer.intFreqs.length = device.length;
            Timer.numTimerDevices = device.length << 1;
            
            /* set the number of local timers */
            if (local != undefined) {
                Timer.numLocalTimers = local;
            }

            /* set the frequency divisor value */
            Timer.freqDivisor = divisor;
            
            /* default mode set to 32-bit unchained, master is TRUE */
            for (var i = 0; i < device.length; i++) {
                Timer.timerSettings[i].mode = Timer.Mode_UNCHAINED;
                Timer.timerSettings[i].master = true;
                Timer.timerSettings[i].ownerCoreId = 0;
                
                /*
                 *  For Timer2 and Timer3 of OMAPL138 and similar parts
                 *  there is only 1 event Id associated with both halves
                 *  of the timer, therefore set them to 64bit mode
                 */
                if (device[i].intNum[0] == device[i].intNum[1]) {
                    Timer.timerSettings[i].mode = Timer.Mode_CHAINED;
                }
                
                /*
                 *  Any timer with intNum specified as -1 means its not
                 *  available on that device.  Remove the lower and upper
                 *  halves from the anymask.
                 */
                if (device[i].intNum[0] == -1) {
                    if (i < 16) {
                        Timer.anyMask &= ~(1 << (i << 1));
                    }
                    else {
                        Timer.anyMaskHigh &= ~(1 << ((i - 16) << 1));
                    }
                }
                if (device[i].intNum[1] == -1) {
                    if (i < 16) {
                        Timer.anyMask &= ~(2 << (i << 1));
                    }
                    else {
                        Timer.anyMaskHigh &= ~(2 << ((i - 16) << 1));
                    }
                }
                
                Timer.intFreqs[i].lo = device[i].intFreq.lo;
                Timer.intFreqs[i].hi = device[i].intFreq.hi;
            }

            if (useTimer64pRegMap != undefined) {
                Timer.useTimer64pRegMap = useTimer64pRegMap;
            }

            Timer.anyMask = convertToUInt32(Timer.anyMask);
            Timer.anyMaskHigh = convertToUInt32(Timer.anyMaskHigh);

            return;
        }
    }

    print("Timer is not supported for the specified device (" +
        Program.cpu.deviceName + ").");

    for (device in deviceTable[catalogName]) {
        print("\t" + device);
    }

    throw new Error ("Timers unsupported on device!");
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    Hwi = xdc.useModule("ti.sysbios.hal.Hwi");
    BIOS = xdc.useModule('ti.sysbios.BIOS');

    if (Program.cpu.catalogName == "ti.catalog.c6000") {
        xdc.useModule("ti.sysbios.family.c64p.Hwi");
    }
    
    var Settings = xdc.module("ti.sysbios.family.Settings");
    var delegate = Settings.getDefaultTimerSupportDelegate();
    Timer.TimerSupportProxy = xdc.useModule(delegate, true);

    var device = deviceTable[catalogName][Program.cpu.deviceName].timer;
    
    /* re-calculate timer frequency for those based on cpu frequency */
    for (var i = 0; i < device.length; i++) {
        if (Timer.freqDivisor) {
            Timer.intFreqs[i].lo = BIOS.cpuFreq.lo / Timer.freqDivisor;
            Timer.intFreqs[i].hi = BIOS.cpuFreq.hi / Timer.freqDivisor;
        } 
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    var device = deviceTable[catalogName][Program.cpu.deviceName].timer;
    mod.gctrl.length = device.length;
    mod.intFreqs.length = device.length;
    mod.device.length = device.length << 1;

    if (device.length < 16) {
        mod.availMask = (1 << (device.length << 1)) - 1;
        mod.availMaskHigh = 0;
    }
    else if (device.length == 16) {
        mod.availMask = 0xffffffff;
        mod.availMaskHigh = 0;
    }
    else if (device.length < 32) {
        mod.availMask = 0xffffffff;
        mod.availMaskHigh = (1 << ((device.length - 16) << 1)) - 1;
    }
    else {
        mod.availMask = 0xffffffff;
        mod.availMaskHigh = 0xffffffff;
    }

    if (Timer.intFreq.lo != undefined || Timer.intFreq.hi != undefined) {
        Timer.$logError("Timer.intFreq is no longer supported. Please use " +
            "Timer.intFreqs['timerId'] to set the timer frequency.", Timer,
	    "intFreq");
    }

    mod.handles.length = mod.device.length;
        
    /* init the module state fields for 'mode' and 'master' */
    for (var i=0; i < device.length; i++) {
        if ((params.timerSettings[i].mode != Timer.Mode_UNCHAINED) &&
            (params.timerSettings[i].mode != Timer.Mode_CHAINED)) {
            Timer.$logError("Unsupported mode: " + params.timerSettings[i].mode
                + " is specified for Timer: " + i, Timer);
        }
        
        mod.gctrl[i].mode = params.timerSettings[i].mode;
        mod.gctrl[i].master = params.timerSettings[i].master;
        mod.gctrl[i].ownerCoreId = params.timerSettings[i].ownerCoreId;
        
        /* set the frequency for each Timer for a device */
        mod.intFreqs[i].lo = params.intFreqs[i].lo;
        mod.intFreqs[i].hi = params.intFreqs[i].hi;
        
        if (device[i].intNum[0] == -1) {
            if (i < 16) {
                mod.availMask &= ~(1 << (i << 1));
            }
            else {
                mod.availMaskHigh &= ~(1 << ((i - 16) << 1));
            }
        }
        if (device[i].intNum[1] == -1) {
            if (i < 16) {
                mod.availMask &= ~(2 << (i << 1));
            }
            else {
                mod.availMaskHigh &= ~(2 << ((i - 16) << 1));
            }
        }
    }
    
    mod.availMask = convertToUInt32(mod.availMask);
    mod.availMaskHigh = convertToUInt32(mod.availMaskHigh);

    Timer.staticAvailMask = mod.availMask;
    Timer.staticAvailMaskHigh = mod.availMaskHigh;

    if (params.anyMaskHigh > mod.availMaskHigh) {
        Timer.$logError("Incorrect anyMaskHigh (0x" +
            params.anyMaskHigh.toString(16) + "). Should be <= 0x" +
            mod.availMaskHigh.toString(16) + ".", Timer, "anyMaskHigh");
    }
    else if ((params.anyMaskHigh == mod.availMaskHigh) &&
             (params.anyMask > mod.availMask)) {
        Timer.$logError("Incorrect anyMask (0x" + params.anyMask.toString(16)
            + "). Should be <= 0x" + mod.availMask.toString(16) + ".", Timer,
            "anyMask");
    }

    /* init the module state fields for each timer */
    for (var i = 0; i < mod.device.length; i++) {
        var j = i >> 1;
        var k = i % 2;
        mod.device[i].baseAddr = $addr(device[j].baseAddr);
        mod.device[i].intNum = device[j].intNum[k];
        mod.device[i].eventId = device[j].eventId[k];
        mod.handles[i] = null;
    }
    /*
     * plug Timer.startup into BIOS.startupFxns array
     */
    BIOS.addUserStartupFunction(Timer.startup);
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, id, tickFxn, params)
{
    var modObj = this.$module.$object;
    var device = deviceTable[catalogName][Program.cpu.deviceName];
 
    /* set flag because static instances need to be started */
    Timer.startupNeeded = true;

    /* identify that this is a static object */
    obj.staticInst = true;

    /* if user does not specify which half, use the Timer.defaultHalf */
    if (params.half == Timer.Half_DEFAULT) {
        obj.half = Timer.defaultHalf;
    }
    else {
        obj.half = params.half;
    }

    if (id >= (Timer.numTimerDevices >> 1)) {
        if (id != Timer.ANY) {
            Timer.$logFatal("Invalid Timer ID " + id + "!", this);
        }
    }

    if (id == Timer.ANY) {
        /*
         * If in 'chained' mode, need to find a timer with both halves
         * available. In 'unchained' mode, try to find any available half.
         */
        for (var i = Timer.localTimerBaseId; i < Timer.numTimerDevices; i++) {
            if (i < 32) {
                if ((Timer.anyMask & (1 << i)) &&
                    (Timer.staticAvailMask & (1 << i))) {
                    /* make sure we're not trying to get a shared timer */
                    if ((Timer.numLocalTimers) &&
                       ((i >> 1) >= (Timer.localTimerBaseId + Timer.numLocalTimers))) {
                        Timer.$logFatal("No more local timers are availabe " +
                            " for specifying 'Timer.ANY'.  To use a shared " +
                            " timer, specify the exact timer id.", Timer);
                    }

                    if (Timer.timerSettings[i >> 1].mode == Timer.Mode_CHAINED) {
                        Timer.staticAvailMask &= ~(3 << (i >> 1));
                        modObj.availMask &= ~(3 << (i >> 1));
                    }
                    else {
                        Timer.staticAvailMask &= ~(1 << i);
                        modObj.availMask &= ~(1 << i);
                        if ((i % 2) == 0) {
                            obj.half = Timer.Half_LOWER;
                        }
                        else {
                            obj.half = Timer.Half_UPPER;
                        }
                    }
                    obj.id = i;
                    break;
                }
            }
            else { /* i >= 32 */
                var j = i - 32;
                if ((Timer.anyMaskHigh & (1 << j)) &&
                    (Timer.staticAvailMaskHigh & (1 << j))) {
                    /* make sure we're not trying to get a shared timer */
                    if ((Timer.numLocalTimers) &&
                       ((i >> 1) >= (Timer.localTimerBaseId + Timer.numLocalTimers))) {
                        Timer.$logFatal("No more local timers are availabe " +
                            " for specifying 'Timer.ANY'.  To use a shared " +
                            " timer, specify the exact timer id.", Timer);
                    }


                    if (Timer.timerSettings[i >> 1].mode == Timer.Mode_CHAINED) {
                        Timer.staticAvailMaskHigh &= ~(3 << (j >> 1));
                        modObj.availMaskHigh &= ~(3 << (j >> 1));
                    }
                    else {
                        Timer.staticAvailMaskHigh &= ~(1 << j);
                        modObj.availMaskHigh &= ~(1 << j);
                        if ((i % 2) == 0) {
                            obj.half = Timer.Half_LOWER;
                        }
                        else {
                            obj.half = Timer.Half_UPPER;
                        }
                    }
                    obj.id = i;
                    break;
                }
            }
        }
    }
    else if (Timer.timerSettings[id].mode == Timer.Mode_CHAINED) {
        if (id < 16) {
            if (((Timer.staticAvailMask >> (id << 1)) & 0x3) == 3) {
                Timer.staticAvailMask &= ~(3 << (id << 1));
                modObj.availMask &= ~(3 << (id << 1));
                obj.id = id << 1;
            }
        }
        else {
            if (((Timer.staticAvailMaskHigh >> ((id - 16) << 1)) & 0x3) == 3) {
                Timer.staticAvailMaskHigh &= ~(3 << ((id - 16) << 1));
                modObj.availMask &= ~(3 << ((id - 16) << 1));
                obj.id = id << 1;
            }
        }
    }
    else {
        var mask, timerId;
        if (obj.half == Timer.Half_LOWER) {
            mask = 1;
            timerId = id << 1;
        }
        else {
            mask = 2;
            timerId = (id << 1) + 1;
        }

        if (id < 16) {
            if (Timer.staticAvailMask & (mask << (id << 1))) {
                Timer.staticAvailMask &= ~(mask << (id << 1));
                modObj.availMask &= ~(mask << (id << 1));
                obj.id = timerId;
            }        
        }
        else {
            if (Timer.staticAvailMaskHigh & (mask << ((id - 16) << 1))) {
                Timer.staticAvailMaskHigh &= ~(mask << ((id - 16) << 1));
                modObj.availMaskHigh &= ~(mask << ((id - 16) << 1));
                obj.id = timerId;
            }
        }
    }

    /*
     * If a timer has not been assigned because either the requested timer was
     * unavailable or 'any timer' was requested and none were available...
     */
    if (obj.id == undefined) {
        if (id == Timer.ANY) {
            Timer.$logFatal("No available timers.", this);
        }
        else {
            Timer.$logFatal("Timer " + id + " is already in use or reserved " +
                    "(check availMask/availMaskHigh).", this);
        }
    }

    var clkSrc = (params.extFreq.lo) ? 1 : 0;
    obj.tcrInit = (params.controlInit.invout << 1) |
                  (params.controlInit.invin << 2) |
                  (params.controlInit.cp << 3) |
                  (params.controlInit.pwid << 4) |
                  (clkSrc << 8) |
                  (params.controlInit.tien << 9);


    obj.emumgtInit = (params.emuMgtInit.free << 0) |
                     (params.emuMgtInit.soft << 1);

    obj.gpioIntEn = (params.gpioIntEn.gpint12_eni << 0) |
                    (params.gpioIntEn.gpint12_eno << 1) |
                    (params.gpioIntEn.gpint12_invi << 4) |
                    (params.gpioIntEn.gpint12_invo << 5) |
                    (params.gpioIntEn.gpint34_eni << 8) |
                    (params.gpioIntEn.gpint34_eno << 9) |
                    (params.gpioIntEn.gpint34_invi << 12) |
                    (params.gpioIntEn.gpint34_invo << 13) |
                    (params.gpioIntEn.gpio_eni12 << 16) |
                    (params.gpioIntEn.gpio_eno12 << 17) |
                    (params.gpioIntEn.gpio_eni34 << 24) |
                    (params.gpioIntEn.gpio_eno34 << 25);

    obj.gpioDatDir = (params.gpioDatDir.gpio_dati12 << 0) |
                     (params.gpioDatDir.gpio_dato12 << 1) |
                     (params.gpioDatDir.gpio_dati34 << 8) |
                     (params.gpioDatDir.gpio_dato34 << 9) |
                     (params.gpioDatDir.gpio_diri12 << 16) |
                     (params.gpioDatDir.gpio_diro12 << 17) |
                     (params.gpioDatDir.gpio_diri34 << 24) |
                     (params.gpioDatDir.gpio_diro34 << 25);

    obj.intCtl     = (params.intCtl.prdinten_lo << 0) |
                     (params.intCtl.prdinten_hi << 16);

    obj.runMode = params.runMode;
    obj.startMode = params.startMode;
    obj.period = params.period;
    obj.periodType = params.periodType;
    obj.prescalar = params.prescalar;
    if (params.intNum == -1) {
        obj.intNum = device.timer[obj.id >> 1].intNum[obj.id % 2];
    }
    else {
        obj.intNum = params.intNum;
    }
    obj.arg = params.arg;
    obj.tickFxn = tickFxn;
    obj.extFreq.lo = params.extFreq.lo;
    obj.extFreq.hi = params.extFreq.hi;

    if (obj.tickFxn != null) {
        if (!params.hwiParams) {
            params.hwiParams = new Hwi.Params();
        }

        var hwiPrms = params.hwiParams;
        hwiPrms.eventId = device.timer[obj.id >> 1].eventId[obj.id % 2];
        hwiPrms.arg = obj.arg;
        obj.hwi = Hwi.create(obj.intNum, obj.tickFxn, hwiPrms);
    }
    else {
        obj.hwi = null;
    }
    
    modObj.handles[obj.id] = this;

    /*
     *  If there are some local timers that are not available to
     *  all cores it needs to remapped at runtime depending on
     *  which core is running.
     */
    if ((id == Timer.ANY) &&
        (Timer.numLocalTimers) &&
        (Timer.localTimerBaseId == 0)) {
        /* reset the mask so at runtime this instance can be remapped */
        if (Timer.timerSettings[obj.id >> 1].mode == Timer.Mode_CHAINED) {
            if (obj.id < 32) {
                modObj.availMask |= (3 << (obj.id >> 1));
            }
            else {
                modObj.availMaskHigh |= (3 << ((obj.id - 32) >> 1));
            }
        }
        else {
            if (obj.id < 32) {
                modObj.availMask |= (1 << obj.id);
            }
            else {
                modObj.availMaskHigh |= (1 << (obj.id - 32));
            }
        }

        /* set the id to Timer.ANY, it will be remapped in Module_startup */
        obj.id = Timer.ANY;    
    }

    modObj.availMask = convertToUInt32(modObj.availMask);
    modObj.availMaskHigh = convertToUInt32(modObj.availMaskHigh);

    Timer.staticAvailMask = convertToUInt32(Timer.staticAvailMask);
    Timer.staticAvailMaskHigh = convertToUInt32(Timer.staticAvailMaskHigh);
}

/*
 *  ======== getEnumString ========
 *  Get the enum value string name, not 0, 1, 2 or 3, etc.  For an enumeration
 *  type property.
 *
 *  Example usage:
 *  if obj contains an enumeration type property "Enum enumProp"
 *
 *  view.enumString = getEnumString(obj.enumProp);
 *
 */
function getEnumString(enumProperty)
{
    /*
     *  Split the string into tokens in order to get rid of the huge package
     *  path that precedes the enum string name. Return the last 2 tokens
     *  concatenated with "_" 
     */
    var enumStrArray = String(enumProperty).split(".");
    var len = enumStrArray.length;
    return (enumStrArray[len - 1]);
}

/*
 *  ======== viewInitBasic ========
 *  Initialize the 'Basic' Timer instance view.
 */
function viewInitBasic(view, obj)
{

    var Program = xdc.useModule('xdc.rov.Program');
    var Timer = Program.getModuleConfig('ti.sysbios.timers.timer64.Timer');
    var halTimer = xdc.useModule('ti.sysbios.hal.Timer');

    view.halTimerHandle =  halTimer.viewGetHandle(obj.$addr);
    view.label = Program.getShortName(obj.$label);
    view.id          = obj.id >>> 1;

    view.half        = getEnumString(obj.half);
    view.runMode     = getEnumString(obj.runMode);
    view.startMode   = getEnumString(obj.startMode);
    view.periodType  = getEnumString(obj.periodType);

    if (obj.period < 0) {
        view.$status["period"] = "Error: invalid value for period: " + obj.period;
    }
    else {
        view.period      = obj.period;
    }

    view.intNum = obj.intNum;

    view.tickFxn = Program.lookupFuncName(Number(obj.tickFxn));
    view.arg         = obj.arg;

    view.extFreqLow    = "0x" + Number(obj.extFreq.lo).toString(16);
    view.extFreqHigh   = "0x" + Number(obj.extFreq.hi).toString(16);

    view.hwiHandle   = "0x" + Number(obj.hwi).toString(16);
}

/*
 *  ======== viewInitModule ========
 *  Initialize the Timer 'Module' view.
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Timer = Program.getModuleConfig('ti.sysbios.timers.timer64.Timer');
    var numTimers = Timer.numTimerDevices >> 1; // undo original left shift

    /* construct 'intFrequency' ROV field */
    var intFreqs =
       Program.fetchArray(obj.intFreqs$fetchDesc, obj.intFreqs, numTimers);

    for (var i = 0; i < numTimers; i++) {
        // combine high and low frequency values into a single value
        view.intFrequency.$add("Timer " + i + ": " +
                ((intFreqs[i].hi << 32) + intFreqs[i].lo) );
    }

    /*
     *  Construct 'availMask' ROV field
     *
     *  Convert 'availMask' into a string.  Goal here is to display 'availMask'
     *  in binary, showing bits in groups of four separated by spaces and
     *  ending with "b".  For example, the binary mask '1110' should be
     *  displayed as:
     *
     *      0000 0000 0000 1110b
     *
     */

    // convert the availMask to a string of bits
    var origMaskStr = Number(obj.availMask).toString(2);
    var origMaskStrHigh = Number(obj.availMaskHigh).toString(2);

    // prepend 0s to the mask to give it a total of sizeOfMask bits
    var zeroStr = "", zeroStrHigh = "";
    var numZerosToAdd = 32 - origMaskStr.length; // num 0s to prepend
    var numZerosToAddHigh = 32 - origMaskStrHigh.length; // num 0s to prepend

    // construct a string containing the necessary amount of zeros
    for (var i = 0; i < numZerosToAdd; i++) {
        zeroStr += "0";
    }
    for (var i = 0; i < numZerosToAddHigh; i++) {
        zeroStrHigh += "0";
    }

    // append the significant bits and the leading 0s together
    var fullStr = zeroStr.concat(origMaskStr);
    var fullStrHigh = zeroStrHigh.concat(origMaskStrHigh);

    // split string into array of characters. Each elem will have one bit
    var splitStr = fullStr.split("");
    var splitStrHigh = fullStrHigh.split("");

    // insert spaces between every 4 bits (for e.g. a 32 bit mask w/ groups 
    // of 4 bits separated by spaces will have 7 spaces
    var spacedStr = "", spacedStrHigh = "";
    for (var i = 0; i < splitStr.length; i++) {

        // add a space after every 4th bit, except for the very last one
        if ( ((i + 1) % 4 == 0) && (i != splitStr.length - 1) ) {
            spacedStr += splitStr[i] + " ";
        }
        else {
            spacedStr += splitStr[i];
        }
    }
    for (var i = 0; i < splitStrHigh.length; i++) {

        // add a space after every 4th bit, except for the very last one
        if ( ((i + 1) % 4 == 0) && (i != splitStrHigh.length - 1) ) {
            spacedStrHigh += splitStrHigh[i] + " ";
        }
        else {
            spacedStrHigh += splitStrHigh[i];
        }
    }

    view.availMask = spacedStr + "b";
    view.availMaskHigh = spacedStrHigh + "b";
}


/*
 *  ======== getFreqMeta ========
 */
function getFreqMeta(id)
{
    Timer.$logWarning("ti.sysbios.timers.timer64.Timer.getFreqMeta not " +
            "implemented");

    return ({lo : 0, hi : 0});
}

/*
 *  ======== convertToUInt32 ========
 */
function convertToUInt32(value)
{
    /*
     *  Provide this workaround here due to javascript.
     */
    if (value < 0) {
        value = value + 0xffffffff + 1;
    }

    return (value);
}
