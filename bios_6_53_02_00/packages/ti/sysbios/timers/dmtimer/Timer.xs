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
 *
 */

var Timer = null;
var TimerSupport = null;
var Hwi = null;
var catalogName;
var BIOS = null;

/*
 * ======== getAsmFiles ========
 * return the array of assembly language files associated
 * with targetName (ie Program.build.target.$name)
 */
function getAsmFiles(targetName)
{
    switch(targetName) {
        case "ti.targets.arm.elf.M3":
        case "ti.targets.arm.elf.M4":
        case "ti.targets.arm.elf.M4F":
            return (["Timer_asm.sv7M"]);
            break;

        case "gnu.targets.arm.M3":
        case "gnu.targets.arm.M4":
        case "gnu.targets.arm.M4F":
            return (["Timer_asm_gnu.sv7M"]);
            break;

        case "ti.targets.arm.elf.Arm9":
        case "ti.targets.arm.elf.A8F":
        case "ti.targets.arm.elf.A8Fnv":
        case "ti.targets.arm.elf.R5F":
            return (["Timer_asm.s470"]);
            break;

        case "gnu.targets.arm.A8F":
        case "gnu.targets.arm.A9F":
        case "gnu.targets.arm.A15F":
            return (["Timer_asm_gnu.sv7A"]);
            break;

        case "gnu.targets.arm.A53F":
            return (["Timer_asm_gnu.sv8A"]);
            break;

        case "ti.targets.C674":
        case "ti.targets.C64P":
        case "ti.targets.C64P_big_endian":
        case "ti.targets.elf.C674":
        case "ti.targets.elf.C64P":
        case "ti.targets.elf.C64P_big_endian":
        case "ti.targets.elf.C66":
        case "ti.targets.elf.C66_big_endian":
        case "ti.targets.elf.C67P":
            return (["Timer_asm.s64P"]);
            break;

        case "ti.targets.elf.C64T":
            return (["Timer_asm.s64T"]);
            break;

        case "ti.targets.elf.nda.C71":
            return (["Timer_asm.s71"]);
            break;

        case "ti.targets.arp32.elf.ARP32":
            return (["Timer_asm.sarp32"]);
            break;

	default:
            return (null);
            break;
    }
}

if (xdc.om.$name == "cfg" || typeof(genCdoc) != "undefined") {
    var deviceTable = {
        "ti.catalog.c7000": {
            "C71": {
                timer: [
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4AE18000,
                        intNum:  14,
                        eventId: 63,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ],
            }
        },
        "ti.catalog.c6000": {
            "TDA3XX": {
                timer: [
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4AE18000,
                        intNum:  14,
                        eventId: 63,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48032000,
                        intNum:  15,
                        eventId: 64,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,
                        intNum:  14,
                        eventId: 65,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,
                        intNum:  15,
                        eventId: 66,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48820000,
                        intNum:  14,
                        eventId: 67,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48822000,
                        intNum:  15,
                        eventId: 68,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x48824000,
                        intNum:  14,
                        eventId: 69,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x48826000,
                        intNum:  15,
                        eventId: 70,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
            "DRA7XX": {
                timer: [
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4AE18000,
                        intNum:  14,
                        eventId: 63,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48032000,
                        intNum:  15,
                        eventId: 64,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,
                        intNum:  14,
                        eventId: 65,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,
                        intNum:  15,
                        eventId: 66,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48820000,
                        intNum:  14,
                        eventId: 67,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48822000,
                        intNum:  15,
                        eventId: 68,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x48824000,
                        intNum:  14,
                        eventId: 69,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x48826000,
                        intNum:  15,
                        eventId: 70,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer9",
                        baseAddr: 0x4803E000,
                        intNum:  14,
                        eventId: 71,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer10",
                        baseAddr: 0x48086000,
                        intNum:  15,
                        eventId: 72,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer11",
                        baseAddr: 0x48088000,
                        intNum:  14,
                        eventId: 73,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer12",
                        baseAddr: 0x4AE20000,
                        intNum:  -1,
                        eventId: 75,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer13",
                        baseAddr: 0x48828000,
                        intNum:  -1,
                        eventId: 76,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer14",
                        baseAddr: 0x4882A000,
                        intNum:  -1,
                        eventId: 77,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer15",
                        baseAddr: 0x4882C000,
                        intNum:  -1,
                        eventId: 78,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer16",
                        baseAddr: 0x4882E000,
                        intNum:  -1,
                        eventId: 81,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
            "Arctic": {
                timer: [
                    {
                        name: "GPTimer0",
                        baseAddr: 0x4802C000,
                        intNum:  4,
                        eventId: 48,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    }
                ]
            },
            "TMS320TI816X": {
                timer: [
/* used by linux
                    {
                        name: "GPTimer0",
                        baseAddr: 0x0802C000,
                        intNum:  4,
                        eventId: 48,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer1",
                        baseAddr: 0x0802E000,
                        intNum:  5,
                        eventId: 49,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x08040000,
                        intNum:  6,
                        eventId: 50,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
used by linux */
/* SDOCM00084584 removed GPTimers 3 & 7
                    {
                        name: "GPTimer3",
                        baseAddr: 0x08042000,
                        intNum:  14,
                        eventId: 51,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
*/
                    {
                        name: "GPTimer4",
                        baseAddr: 0x08044000,
                        intNum:  15,
                        eventId: 52,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x08046000,
                        intNum:  11,
                        eventId: 53,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x08048000,
                        intNum:  12,
                        eventId: 54,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
/* SDOCM00084584 removed GPTimers 3 & 7
                    {
                        name: "GPTimer7",
                        baseAddr: 0x0804A000,
                        intNum:  13,
                        eventId: 55,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
*/
                ]
            },
            "TMS320TI814X": {
                timer: [
/* used by linux
                    {
                        name: "GPTimer0",
                        baseAddr: 0x0802C000,
                        intNum:  4,
                        eventId: 48,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer1",
                        baseAddr: 0x0802E000,
                        intNum:  5,
                        eventId: 49,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x08040000,
                        intNum:  6,
                        eventId: 50,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
used by linux */
                    {
                        name: "GPTimer3",
                        baseAddr: 0x08042000,
                        intNum:  14,
                        eventId: 51,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x08044000,
                        intNum:  15,
                        eventId: 52,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x08046000,
                        intNum:  11,
                        eventId: 53,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x08048000,
                        intNum:  12,
                        eventId: 54,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x0804A000,
                        intNum:  13,
                        eventId: 55,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                ]
            },
            "OMAP4430": {
                timer: [
                    {
                        name: "GPTimer5",
                        baseAddr: 0x01d38000,
                        intNum:   14,
                        eventId: 51,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x01d3a000,
                        intNum:  15,
                        eventId: 52,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x01d3c000,
                        intNum:  4,
                        eventId: 53,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x01d3e000,
                        intNum:  5,
                        eventId: 54,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                ]
            },
            "OMAP5430": {
                timer: [
                    {
                        name: "GPTimer5",
                        baseAddr: 0x01d38000,
                        intNum:   14,
                        eventId: 51,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x01d3a000,
                        intNum:  15,
                        eventId: 52,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x01d3c000,
                        intNum:  4,
                        eventId: 53,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x01d3e000,
                        intNum:  5,
                        eventId: 54,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        // only add "real" targets to table. "fake" ones (e.g. Tesla) are below
        // (need empty element here in order for assignment below to work)
        "ti.catalog.c6000.nda": {
        },
        "ti.catalog.arm.nda": {
        },
        "ti.catalog.arm": {
        },
        "ti.catalog.arm.cortexa8": {
            "TMS320TI816X": {
                timer: [
/**     Don't use wtdog timer
                    {
                        name: "GPTimer0",
                        baseAddr: 0x4802c000,
                        intNum:  66,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
**/
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4802e000,
                        intNum:  67,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48040000,
                        intNum:  68,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
/* SDOCM00084584 removed GPTimers 3 & 7
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48042000,
                        intNum:  69,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
*/
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48044000,
                        intNum:  92,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48046000,
                        intNum:  93,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48048000,
                        intNum:  94,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
/* SDOCM00084584 removed GPTimers 3 & 7
                    {
                        name: "GPTimer7",
                        baseAddr: 0x4804A000,
                        intNum:  95,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
*/
                ]
            },
            "TMS320TI814X": {
                timer: [
/**     Don't use wtdog timer
                    {
                        name: "GPTimer0",
                        baseAddr: 0x4802c000,
                        intNum:  66,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
**/
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4802e000,
                        intNum:  67,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48040000,
                        intNum:  68,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48042000,
                        intNum:  69,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48044000,
                        intNum:  92,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48046000,
                        intNum:  93,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48048000,
                        intNum:  94,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x4804A000,
                        intNum:  95,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                ]
            },
            "AM335X": {
                timer: [
/**     Don't use wtdog timer
                    {
                        name: "GPTimer0",
                        baseAddr: 0x4802c000,
                        intNum:  66,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
**/
/**     Don't use 1MS timer as it's register map is not the same as the rest
                    {
                        name: "DMTimer1_1MS",
                        baseAddr: 0x44e31000,
                        intNum:  67,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
**/
                    {
                        name: "DMTimer2",
                        baseAddr: 0x48040000,
                        intNum:  68,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer3",
                        baseAddr: 0x48042000,
                        intNum:  69,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer4",
                        baseAddr: 0x48044000,
                        intNum:  92,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer5",
                        baseAddr: 0x48046000,
                        intNum:  93,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer6",
                        baseAddr: 0x48048000,
                        intNum:  94,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer7",
                        baseAddr: 0x4804A000,
                        intNum:  95,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arm.cortexa9": {
            "OMAP4430": {
                timer: [
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,  /* L4 address */
                        intNum:  71,
                        eventId: -1,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,  /* L4 address */
                        intNum:  72,
                        eventId: -1,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                ]
            },
            "AM437X": {
                timer: [
                    {
                        name: "DMTimer0",
                        baseAddr: 0x44E05000,  /* L4 address */
                        intNum:  66 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer1",      /* This is a GP Timer. It is not
                                                  available for use by this
                                                  module */
                        baseAddr: 0x44E31000,  /* L4 address */
                        intNum:  67 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer2",
                        baseAddr: 0x48040000,  /* L4 address */
                        intNum:  68 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer3",
                        baseAddr: 0x48042000,  /* L4 address */
                        intNum:  69 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer4",
                        baseAddr: 0x48044000,  /* L4 address */
                        intNum:  92 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer5",
                        baseAddr: 0x48046000,  /* L4 address */
                        intNum:  93 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer6",
                        baseAddr: 0x48048000,  /* L4 address */
                        intNum:  94 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer7",
                        baseAddr: 0x4804A000,  /* L4 address */
                        intNum:  95 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer8",
                        baseAddr: 0x481C1000,  /* L4 address */
                        intNum:  131 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer9",
                        baseAddr: 0x4833D000,  /* L4 address */
                        intNum:  132 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer10",
                        baseAddr: 0x4833F000,  /* L4 address */
                        intNum:  133 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer11",
                        baseAddr: 0x48341000,  /* L4 address */
                        intNum:  134 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 24000000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arm.cortexa15": {
            "DRA7XX": {
                timer: [
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4AE18000,
                        intNum:  37 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48032000,
                        intNum:  38 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,
                        intNum:  39 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,
                        intNum:  40 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48820000,
                        intNum:  41 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48822000,
                        intNum:  42 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x48824000,
                        intNum:  43 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x48826000,
                        intNum:  44 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer9",
                        baseAddr: 0x4803E000,
                        intNum:  45 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer10",
                        baseAddr: 0x48086000,
                        intNum:  46 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer11",
                        baseAddr: 0x48088000,
                        intNum:  47 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer12",
                        baseAddr: 0x4AE20000,
                        intNum:  95 + 32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer13",
                        baseAddr: 0x48828000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer14",
                        baseAddr: 0x4882A000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer15",
                        baseAddr: 0x4882C000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer16",
                        baseAddr: 0x4882E000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
            "OMAP5430": {
                timer: [
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48032000,  /* L4 address */
                        intNum:  70,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer10",
                        baseAddr: 0x48086000,  /* L4 address */ 
                        intNum:  78,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arm.cortexa53": {
            "SIMFLEMING": {
                timer: [
                    {
                        name: "DMTimer0",
                        baseAddr: 0x02400000,
                        intNum:  96,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer1",
                        baseAddr: 0x02410000,
                        intNum:  97,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer2",
                        baseAddr: 0x02420000,
                        intNum:  98,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer3",
                        baseAddr: 0x02430000,
                        intNum:  99,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer4",
                        baseAddr: 0x02440000,
                        intNum:  100,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer5",
                        baseAddr: 0x02450000,
                        intNum:  101,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer6",
                        baseAddr: 0x02460000,
                        intNum:  102,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer7",
                        baseAddr: 0x02470000,
                        intNum:  103,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer8",
                        baseAddr: 0x02480000,
                        intNum:  104,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer9",
                        baseAddr: 0x02490000,
                        intNum:  105,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer10",
                        baseAddr: 0x024A0000,
                        intNum:  106,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer11",
                        baseAddr: 0x024B0000,
                        intNum:  107,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer12",
                        baseAddr: 0x024C0000,
                        intNum:  108,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer13",
                        baseAddr: 0x024D0000,
                        intNum:  109,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer14",
                        baseAddr: 0x024E0000,
                        intNum:  110,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer15",
                        baseAddr: 0x024F0000,
                        intNum:  111,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer16",
                        baseAddr: 0x02500000,
                        intNum:  112,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer17",
                        baseAddr: 0x02510000,
                        intNum:  113,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer18",
                        baseAddr: 0x02520000,
                        intNum:  114,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer19",
                        baseAddr: 0x02530000,
                        intNum:  115,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
            "SIMMAXWELL": {
                timer: [
                    {
                        name: "DMTimer0",
                        baseAddr: 0x02400000,
                        intNum:  256,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer1",
                        baseAddr: 0x02410000,
                        intNum:  257,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer2",
                        baseAddr: 0x02420000,
                        intNum:  258,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer3",
                        baseAddr: 0x02430000,
                        intNum:  259,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer4",
                        baseAddr: 0x02440000,
                        intNum:  260,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer5",
                        baseAddr: 0x02450000,
                        intNum:  261,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer6",
                        baseAddr: 0x02460000,
                        intNum:  262,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer7",
                        baseAddr: 0x02470000,
                        intNum:  263,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer8",
                        baseAddr: 0x02480000,
                        intNum:  264,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer9",
                        baseAddr: 0x02490000,
                        intNum:  265,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer10",
                        baseAddr: 0x024A0000,
                        intNum:  266,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer11",
                        baseAddr: 0x024B0000,
                        intNum:  267,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arm.cortexr5": {
            "SIMFLEMING": {
                timer: [
                    {
                        name: "DMTimer0",
                        baseAddr: 0x40400000,
                        intNum:  32,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer1",
                        baseAddr: 0x40410000,
                        intNum:  33,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer2",
                        baseAddr: 0x40420000,
                        intNum:  34,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer3",
                        baseAddr: 0x40430000,
                        intNum:  35,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
            "SIMMAXWELL": {
                timer: [
                    {
                        name: "DMTimer0",
                        baseAddr: 0x40400000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer1",
                        baseAddr: 0x40410000,
                        intNum:  39,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer2",
                        baseAddr: 0x40420000,
                        intNum:  40,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "DMTimer3",
                        baseAddr: 0x40430000,
                        intNum:  41,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arm.cortexm3": {
            "TMS320TI816X": {
                timer: [
/* used by linux
                    {
                        name: "GPTimer0",
                        baseAddr: 0x48035000,
                        intNum:  24,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer1",
                        baseAddr: 0x48037000,
                        intNum:  25,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48040000,
                        intNum:  26,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
used by linux */
/* Used by DSP
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48042000,
                        intNum:  27,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
used by DSP */
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48044000,
                        intNum:  28,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48046000,
                        intNum:  29,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48048000,
                        intNum:  30,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
/* SDOCM00084584 removed GPTimers 3 & 7
                    {
                        name: "GPTimer7",
                        baseAddr: 0x4804A000,
                        intNum:  31,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
*/
                ]
            },
            "TMS320TI814X": {
                timer: [
/* used by linux
                    {
                        name: "GPTimer0",
                        baseAddr: 0x48035000,
                        intNum:  24,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer1",
                        baseAddr: 0x48037000,
                        intNum:  25,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48040000,
                        intNum:  26,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
used by linux */
/* Used by DSP
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48042000,
                        intNum:  27,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
used by DSP */
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48044000,
                        intNum:  28,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48046000,
                        intNum:  29,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48048000,
                        intNum:  30,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x4804A000,
                        intNum:  31,
                        eventId: -1,
                        intFreq: {
                            lo: 32768,
                            hi: 0,
                        },
                    },
                ]
            },
            "OMAP4430": {
                timer: [
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,  /* L3 address */
                        intNum:   53,
                        eventId: -1,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,  /* L3 address */ 
                        intNum:  54,
                        eventId: -1,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer9",
                        baseAddr: 0x4803e000,  /* L3 address */ 
                        intNum:  55,
                        eventId: -1,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer11",
                        baseAddr: 0x48088000,  /* L3 address */ 
                        intNum:  56,
                        eventId: -1,
                        intFreq: {
                            lo: 38400000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arm.cortexm4": {
            "OMAP5430": {
                timer: [
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,  /* L3 address */
                        intNum:   53,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,  /* L3 address */ 
                        intNum:  54,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer9",
                        baseAddr: 0x4803e000,  /* L3 address */ 
                        intNum:  55,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer11",
                        baseAddr: 0x48088000,  /* L3 address */ 
                        intNum:  56,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
            "DRA7XX": {
                timer: [
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4AE18000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48032000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,
                        intNum:  53,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,
                        intNum:  54,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48820000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48822000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x48824000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x48826000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer9",
                        baseAddr: 0x4803E000,
                        intNum:  55,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer10",
                        baseAddr: 0x48086000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer11",
                        baseAddr: 0x48088000,
                        intNum:  56,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer12",
                        baseAddr: 0x4AE20000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer13",
                        baseAddr: 0x48828000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer14",
                        baseAddr: 0x4882A000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer15",
                        baseAddr: 0x4882C000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer16",
                        baseAddr: 0x4882E000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
            "TDA3XX": {
                timer: [
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4AE18000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48032000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,
                        intNum:  53,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,
                        intNum:  54,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48820000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48822000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x48824000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x48826000,
                        intNum:  -1,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
            },
        },
        "ti.catalog.arp32": {
            "DRA7XX": {
                timer: [
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4AE18000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48032000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48820000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48822000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x48824000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x48826000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer9",
                        baseAddr: 0x4803E000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer10",
                        baseAddr: 0x48086000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer11",
                        baseAddr: 0x48088000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer12",
                        baseAddr: 0x4AE20000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer13",
                        baseAddr: 0x48828000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer14",
                        baseAddr: 0x4882A000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer15",
                        baseAddr: 0x4882C000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer16",
                        baseAddr: 0x4882E000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
           },
	   "TDA3XX" : {
                timer: [
                    {
                        name: "GPTimer1",
                        baseAddr: 0x4AE18000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer2",
                        baseAddr: 0x48032000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer3",
                        baseAddr: 0x48034000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer4",
                        baseAddr: 0x48036000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer5",
                        baseAddr: 0x48820000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer6",
                        baseAddr: 0x48822000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer7",
                        baseAddr: 0x48824000,
                        intNum:  37,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                    {
                        name: "GPTimer8",
                        baseAddr: 0x48826000,
                        intNum:  38,
                        eventId: -1,
                        intFreq: {
                            lo: 19200000,
                            hi: 0,
                        },
                    },
                ]
           },
        },
    };

    deviceTable["ti.catalog.c6000.nda"]["Tesla"] =
        deviceTable["ti.catalog.c6000"]["OMAP4430"];

    deviceTable["ti.catalog.arm.nda"]["Ducati"] =
        deviceTable["ti.catalog.arm.cortexm3"]["OMAP4430"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI811X"] = 
        deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI814X"];

    deviceTable["ti.catalog.arm.cortexa8"]["TMS320TI811X"] = 
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320TI814X"];

    deviceTable["ti.catalog.c6000"]["TMS320TI811X"] = 
        deviceTable["ti.catalog.c6000"]["TMS320TI814X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI813X"] = 
        deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI814X"];
    
    deviceTable["ti.catalog.arm.cortexa8"]["TMS320TI813X"] = 
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320TI814X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320DM8148"] = 
        deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI814X"];
    
    deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8148"] = 
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320TI814X"];

    deviceTable["ti.catalog.c6000"]["TMS320DM8148"] = 
        deviceTable["ti.catalog.c6000"]["TMS320TI814X"];
    
    deviceTable["ti.catalog.arm"]["TMS320CDM740"] = 
        deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.c6000"]["TMS320CDM740"] = 
        deviceTable["ti.catalog.c6000"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexm3"]["TMS320C6A8168"] = 
        deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];

    deviceTable["ti.catalog.arm.cortexa8"]["TMS320C6A8168"] = 
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320TI816X"];

    deviceTable["ti.catalog.c6000"]["TMS320C6A8168"] = 
        deviceTable["ti.catalog.c6000"]["TMS320TI816X"];
    
    deviceTable["ti.catalog.arm.cortexm3"]["TMS320DM8168"] = 
        deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI816X"];
    
    deviceTable["ti.catalog.arm.cortexa8"]["TMS320DM8168"] = 
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320TI816X"];
    
    deviceTable["ti.catalog.c6000"]["TMS320DM8168"] = 
        deviceTable["ti.catalog.c6000"]["TMS320TI816X"];
    
    deviceTable["ti.catalog.arm.cortexm3"]["TMS320C6A8149"] = 
        deviceTable["ti.catalog.arm.cortexm3"]["TMS320TI814X"];
    
    deviceTable["ti.catalog.arm.cortexa8"]["TMS320C6A8149"] = 
        deviceTable["ti.catalog.arm.cortexa8"]["TMS320TI814X"];

    deviceTable["ti.catalog.c6000"]["TMS320C6A8149"] = 
        deviceTable["ti.catalog.c6000"]["TMS320TI814X"];
    
    deviceTable["ti.catalog.arm.cortexa8"]["AM3359"] = 
        deviceTable["ti.catalog.arm.cortexa8"]["AM335X"];

    deviceTable["ti.catalog.arm.cortexm3"]["OMAP5430"] = 
        deviceTable["ti.catalog.arm.cortexm4"]["OMAP5430"];

    deviceTable["ti.catalog.arm.cortexm4"]["Vayu"] =
        deviceTable["ti.catalog.arm.cortexm4"]["DRA7XX"];

    deviceTable["ti.catalog.arm.cortexa15"]["Vayu"] =
        deviceTable["ti.catalog.arm.cortexa15"]["DRA7XX"];

    deviceTable["ti.catalog.c6000"]["Vayu"] =
        deviceTable["ti.catalog.c6000"]["DRA7XX"];

    deviceTable["ti.catalog.arp32"]["Vayu"] =
        deviceTable["ti.catalog.arp32"]["DRA7XX"];
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

            /* initialize timer fields */
            Timer.anyMask = (1 << device.length) - 1;
            Timer.timerSettings.length = device.length;
            Timer.numTimerDevices = device.length;
            Timer.intFreqs.length = device.length;

            /* default mode set to 32-bit unchained, master is TRUE */
            for (var i=0; i < device.length; i++) {
                Timer.timerSettings[i].master = true;
                Timer.timerSettings[i].baseAddr = $addr(device[i].baseAddr);
                Timer.timerSettings[i].intNum = device[i].intNum;
                Timer.timerSettings[i].eventId = device[i].eventId;
                Timer.timerSettings[i].name = device[i].name;
            }

            var Settings = xdc.module("ti.sysbios.family.Settings");
            var delegate = Settings.getDefaultTimerSupportDelegate();
            TimerSupport = xdc.module(delegate);

            if ("getAnyMask" in TimerSupport) {
                Timer.anyMask = TimerSupport.getAnyMask();
            }

            return;
        }
    }

    /* falls thru on failure */

    print("Timer is not supported for the specified device (" +
        Program.cpu.deviceName + ").");

    for (device in deviceTable[catalogName]) {
        print("\t" + device);
    }

    throw new Error ("Timers unsupported on device!");
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(id, tickFxn, params)
{
    var modObj = this.$module.$object;

    if (modObj.availMask == undefined) {
        if ("getAvailMask" in TimerSupport) {
            modObj.availMask = TimerSupport.getAvailMask();
        }
        else {
            modObj.availMask = (1 << Timer.numTimerDevices) - 1;
        }
    }

    if (id >= Timer.numTimerDevices) {
        if (id != Timer.ANY) {
            Timer.$logFatal("Invalid Timer ID " + id + "!", this);
        }
    }

    if (id == Timer.ANY) {
        for (var i = 0; i < Timer.numTimerDevices; i++) {
            var j = 1 << i;
            if ((Timer.anyMask & j) && (modObj.availMask & j)) {
                modObj.availMask &= ~j;
                this.$object.id = i;
                break;
            }
        }
    }
    else if (modObj.availMask & (1 << id)) {
        modObj.availMask &= ~(1 << id);
        this.$object.id = id;
    }

    if (this.$object.id == undefined) {
        Timer.$logFatal("Timer device unavailable.", this);
    }
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    BIOS = xdc.useModule('ti.sysbios.BIOS');
    Hwi = xdc.useModule("ti.sysbios.hal.Hwi");
    var Settings = xdc.module("ti.sysbios.family.Settings");
    var delegate = Settings.getDefaultTimerSupportDelegate();
    Timer.TimerSupportProxy = xdc.useModule(delegate, true);

    if (Program.platformName.match(/sim/)) {
        Timer.checkFrequency = false;
    }

    if (Timer.checkFreq) {
        xdc.useModule("xdc.runtime.Timestamp");
    }
}

/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    var device = deviceTable[catalogName][Program.cpu.deviceName].timer;

    mod.device.length = device.length;
    mod.intFreqs.length = device.length;
    mod.firstInit = true;

    for (var i=0; i < device.length; i++) {
        if (Timer.intFreqs[i].lo == undefined) {
            if (Timer.intFreq.$written("lo") == true) {
                Timer.intFreqs[i].hi = Timer.intFreq.hi;
                Timer.intFreqs[i].lo = Timer.intFreq.lo;
            }
            else {
                Timer.intFreqs[i].hi = device[i].intFreq.hi;
                Timer.intFreqs[i].lo = device[i].intFreq.lo;
            }
        }
    }

    if (mod.availMask == undefined) {
        if ("getAvailMask" in TimerSupport) {
            mod.availMask = TimerSupport.getAvailMask();
        }
        else {
            mod.availMask = (1 << Timer.numTimerDevices) - 1;
        }
    }

    /*
     * Read availMask again as the availMask in module state might
     * have changed during timer creation in instance$meta$init()
     * function.
     */
    var availMaskOrig;
    if ("getAvailMask" in TimerSupport) {
        availMaskOrig = TimerSupport.getAvailMask();
    }
    else {
        availMaskOrig = (1 << Timer.numTimerDevices) - 1;
    }

    if (params.anyMask > availMaskOrig) {
        Timer.$logError("Incorrect anyMask (" + params.anyMask
            + "). Should be <= " + availMaskOrig + ".", Timer, "anyMask");
    }

    mod.handles.length = mod.device.length;
        
    /* init the module state fields for each timer */
    for (var i=0; i < mod.device.length; i++) {
        mod.device[i].baseAddr = Timer.timerSettings[i].baseAddr;

        /* set the frequency for each Timer */
        mod.intFreqs[i].lo = Timer.intFreqs[i].lo;
        mod.intFreqs[i].hi = Timer.intFreqs[i].hi;

        mod.device[i].intNum = Timer.timerSettings[i].intNum;

        mod.device[i].eventId = Timer.timerSettings[i].eventId;
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

    obj.staticInst = true;

    obj.tiocpCfg = (params.tiocpCfg.softreset << 0) |
                   (params.tiocpCfg.emufree   << 1) |
                   (params.tiocpCfg.idlemode  << 2);


    if (params.runMode == Timer.RunMode_DYNAMIC) {
        obj.tier = 0x1;  /* enable timer compare interrupts */
    }
    else {
        obj.tier = (params.tier.mat_it_ena  << 0) |
               (params.tier.ovf_it_ena  << 1) |
               (params.tier.tcar_it_ena << 2);
    }

    if (params.runMode == Timer.RunMode_DYNAMIC) {
        obj.tclr =  (params.tclr.ptv << 2) |
                (params.tclr.pre << 5) |
                0x40 |  /* set compare mode for RunMode_DYAMIC */
                (params.tclr.scpwm << 7) |
                (params.tclr.tcm << 8) |
                (params.tclr.trg << 10) |
                (params.tclr.pt << 12) |
                (params.tclr.captmode << 13) |
                (params.tclr.gpocfg << 14);
    }
    else {
        obj.tclr =  (params.tclr.ptv << 2) |
                (params.tclr.pre << 5) |
                (params.tclr.ce << 6) |
                (params.tclr.scpwm << 7) |
                (params.tclr.tcm << 8) |
                (params.tclr.trg << 10) |
                (params.tclr.pt << 12) |
                (params.tclr.captmode << 13) |
                (params.tclr.gpocfg << 14);
    }

    obj.tsicr = (params.tsicr.sft << 1) |
                (params.tsicr.posted << 2) |
                (params.tsicr.readmode << 3);

    obj.twer = (params.twer.mat_wup_ena << 0) |
               (params.twer.ovf_wup_ena << 1) |
               (params.twer.tcar_wup_ena << 2);

    obj.tmar = params.tmar;

    obj.runMode = params.runMode;
    obj.startMode = params.startMode;
    obj.period = params.period;
    obj.periodType = params.periodType;
    obj.arg = params.arg;
    obj.tickFxn = tickFxn;
    
    if (params.intNum == -1) {
        if (Timer.timerSettings[obj.id].intNum == -1) {
            Timer.$logFatal("Timer intNum is not valid. Please use DMTimer " +
                            "module's timerSettings config param to set the " +
                            "intNum for this timer. ", Timer, "intNum");
        }
        else {
            obj.intNum = Timer.timerSettings[obj.id].intNum;
        }
    }
    else {
        obj.intNum = params.intNum;
    }
    
    if (params.eventId == -1) {
        obj.useDefaultEventId = true;
        obj.eventId = Timer.timerSettings[obj.id].eventId;
    }
    else {
        obj.useDefaultEventId = false; 
        obj.eventId = params.eventId;
    }
    
    obj.extFreq.lo = params.extFreq.lo;
    obj.extFreq.hi = 0;

    obj.prevThreshold = 0;
    obj.rollovers = 0;
    obj.savedCurrCount = 0;

    if (obj.tickFxn != null) {
        if (!params.hwiParams) {
            params.hwiParams = new Hwi.Params();
        }
        var hwiPrms = params.hwiParams;
        hwiPrms.eventId = obj.eventId;
        hwiPrms.arg = this;
        if (params.runMode == Timer.RunMode_DYNAMIC) {
            if (Program.build.target.name == "M3") {
                var m3Hwi = xdc.module ('ti.sysbios.family.arm.m3.Hwi');
                hwiPrms.priority = m3Hwi.disablePriority;
            }
            obj.hwi = Hwi.create(obj.intNum, Timer.dynStub, hwiPrms);
        }
        else {
            obj.hwi = Hwi.create(obj.intNum, Timer.stub, hwiPrms);
        }
    }
    else {
        obj.hwi = null;
    }
    modObj.handles[obj.id] = this;
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
    var Timer = Program.getModuleConfig('ti.sysbios.timers.dmtimer.Timer');
    var halTimer = xdc.useModule('ti.sysbios.hal.Timer');

    view.halTimerHandle =  halTimer.viewGetHandle(obj.$addr);
    view.label = Program.getShortName(obj.$label);
    view.id          = obj.id;
    view.name = Timer.timerSettings[obj.id].name;

    view.runMode     = getEnumString(obj.runMode);
    view.startMode   = getEnumString(obj.startMode);
    view.periodType  = getEnumString(obj.periodType);

    if (obj.period < 0) {
        view.$status["period"] = "Error: invalid value for period: " + obj.period;
    }
    else {
        view.period      = obj.period;
    }

    view.intNum     = obj.intNum;
    if (obj.eventId == -1) {
        view.eventId   = "Not Used";
    }
    else {
        view.eventId   = Number(obj.eventId).toString(10);
    }
    view.tickFxn       = Program.lookupFuncName(Number(obj.tickFxn));
    view.arg           = obj.arg;

    view.extFreqLow    = "0x" + Number(obj.extFreq.lo).toString(16);
    view.extFreqHigh   = "0x" + Number(obj.extFreq.hi).toString(16);

    view.hwiHandle     = "0x" + Number(obj.hwi).toString(16);
}

/*
 *  ======== viewInitDevice ========
 *  Initialize the 'Device' Timer instance view.
 */
function viewInitDevice(view, obj)
{
    var counterValue, loadValue, compareValuei, controlReg;
    var Program = xdc.useModule('xdc.rov.Program');
    var Timer = Program.getModuleConfig('ti.sysbios.timers.dmtimer.Timer');
    var halTimer = xdc.useModule('ti.sysbios.hal.Timer');
    var timerModCfg = Program.getModuleConfig('ti.sysbios.timers.dmtimer.Timer');
    var timerRawView = Program.scanRawView('ti.sysbios.timers.dmtimer.Timer');
    var modState = timerRawView.modState;

    view.id            = obj.id;

    if (obj.period < 0) {
        view.$status["period"] = "Error: invalid value for period: " + obj.period;
    }
    else {
        if (obj.runMode == halTimer.RunMode_DYNAMIC) {
            view.period    = obj.period;
        }
        else {
            view.period    = obj.period + 1;
        }
    }

    view.intNum        = obj.intNum;
    if (obj.eventId == -1) {
        view.eventId   = "Not Used";
    }
    else {
        view.eventId   = Number(obj.eventId).toString(10);
    }

    view.runMode     = getEnumString(obj.runMode);

    var deviceObj = Program.fetchArray(modState.device$fetchDesc,
            modState.device, timerModCfg.numTimerDevices);

    var device = Program.fetchStruct(modState.device$fetchDesc,
            deviceObj[obj.id].$addr);

    view.deviceAddr = "0x" + Number(device.baseAddr).toString(16);

    /* Read TCRR Register */
    counterValue = Program.fetchArray(
                    {
                        type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                        isScalar: true
                    },
                    (device.baseAddr + 0x3C), 1, false);

    /* Read TLDR Register */
    loadValue    = Program.fetchArray(
                    {
                        type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                        isScalar: true
                    },
                    (device.baseAddr + 0x40), 1, false);

    /* Read TMAR Register */
    compareValue    = Program.fetchArray(
                    {
                        type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                        isScalar: true
                    },
                    (device.baseAddr + 0x4C), 1, false);

    /* Read TCLR Register */
    controlReg      = Program.fetchArray(
                    {
                        type: 'xdc.rov.support.ScalarStructs.S_UInt32',
                        isScalar: true
                    },
                    (device.baseAddr + 0x38), 1, false);

    if (obj.runMode == halTimer.RunMode_DYNAMIC) {
        view.currCount = Number(counterValue).toString(10);
        view.remainingCount = Number(compareValue - counterValue).toSring(10);
    }
    else if (obj.runMode == halTimer.RunMode_CONTINUOUS) {
        view.currCount = Number(counterValue - loadValue).toString(10);
        view.remainingCount =
            Number(Timer.MAX_PERIOD - counterValue + 1).toString(10);
    }
    else if (obj.runMode == halTimer.RunMode_ONESHOT) {
        if (counterValue >= loadValue) {
            view.currCount = Number(counterValue - loadValue).toString(10);
            view.remainingCount =
                Number(Timer.MAX_PERIOD - counterValue + 1).toString(10);
        } else {
            view.currCount = "Timer Expired Or Uninit";
            view.remainingCount = "";
        }
    }

    if (controlReg & 0x1) {
        view.timerState = "Started";
    }
    else {
        view.timerState = "Stopped";
    }
}

/*
 *  ======== viewInitModule ========
 *  Initialize the Timer 'Module' view.
 */
function viewInitModule(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');
    var Timer = Program.getModuleConfig('ti.sysbios.timers.dmtimer.Timer');
    var numTimers = Timer.numTimerDevices;

    // construct "intFrequency" ROV field
    var intFreqs =
        Program.fetchArray(obj.intFreqs$fetchDesc, obj.intFreqs, numTimers);

    for (var i = 0; i < numTimers; i++) {
        // combine high and low frequency values into a single value
        view.intFrequency.$add("Timer " + i + ":" +
                (Number(intFreqs[i].hi << 32) + Number(intFreqs[i].lo)));
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

    // determine the number of bits for the mask.  If upper 16 bits are all 0,
    // then only display the first 16 bits of the mask (upper 16 0s are don't
    // cares in this case)
    var sizeOfMask = (origMaskStr.length > 16) ? 32 : 16;

    // prepend 0s to the mask to give it a total of sizeOfMask bits
    var zeroStr = "";
    var numZerosToAdd = sizeOfMask - origMaskStr.length; // num 0s to prepend

    // construct a string containing the necessary amount of zeros
    for (var i = 0; i < numZerosToAdd; i++) {
        zeroStr += "0";
    }

    // append the significant bits and the leading 0s together
    fullStr = zeroStr.concat(origMaskStr);

    // split string into array of characters. Each elem will have one bit
    var splitStr = fullStr.split("");

    // insert spaces between every 4 bits (for e.g. a 32 bit mask w/ groups of 4
    // bits separated by spaces will have 7 spaces
    var spacedStr = "";
    for (var i = 0; i < splitStr.length; i++) {

        // add a space after every 4th bit, except for the very last one
        if ( ((i + 1) % 4 == 0) && (i != splitStr.length - 1) ) {
            spacedStr += splitStr[i] + " ";
        }
        else {
            spacedStr += splitStr[i];
        }

    }

    view.availMask = spacedStr + "b";
}


/*
 *  ======== getFreqMeta ========
 */
function getFreqMeta(id)
{
    var device = deviceTable[catalogName][Program.cpu.deviceName].timer;
    var modObj = this.$object;
    var timerId = 0;

    if (id == Timer.ANY) {
        for (var i = 0; i < Timer.numTimerDevices; i++) {
            var j = 1 << i;
            if ((Timer.anyMask & j) && (modObj.availMask & j)) {
                timerId = i;
                break;
            }
        }
        if (i == Timer.numTimerDevices) {
            Timer.$logFatal("getFreqMeta(): No available timer id to " +
                    " determine frequency!", this);
        }
    }
    else if (id >= Timer.numTimerDevices) {
        Timer.$logFatal("getFreqMeta(): Invalid Timer ID " + id + "!", this);
    }
    else {
        timerId = id;
    }

    return ({lo : device[timerId].intFreq.lo,
             hi : device[timerId].intFreq.hi});
}
