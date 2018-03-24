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
 *  ======== Platform.xdc ========
 *  Platform support for simVayu
 *
 */

/*!
 *  ======== Platform ========
 *  Platform support for simVayu
 *
 *  This module implements xdc.platform.IPlatform and defines configuration
 *  parameters that correspond to this platform's Cpu's, Board's, etc.
 *
 *  The configuration parameters are initialized in this package's
 *  configuration script (package.cfg) and "bound" to the TCOM object
 *  model.  Once they are part of the model, these parameters are
 *  queried by a program's configuration script.
 *
 *  This particular platform has 1 Cortex-A15, 4 EVE's, 2 Benelli/IPU
 *  Sub-system (Dual M4's) and 2 C66x DSP's.
 */
metaonly module Platform inherits xdc.platform.IPlatform
{
    readonly config xdc.platform.IPlatform.Board BOARD = {
        id:             "0",
        boardName:      "simVayu",
        boardFamily:    "simVayu",
        boardRevision:  null,
    };

    readonly config xdc.platform.IExeContext.Cpu DSP = {
        id:             "0",
        clockRate:      1000,
        catalogName:    "ti.catalog.c6000",
        deviceName:     "Vayu",
        revision:       "1.0",
    };

    /* Benelli M4 Subsystem */
    readonly config xdc.platform.IExeContext.Cpu M4 = {
        id:             "1",
        clockRate:      266.0,
        catalogName:    "ti.catalog.arm.cortexm4",
        deviceName:     "Vayu",
        revision:       "1.0",
    };

    /* EVE */
    readonly config xdc.platform.IExeContext.Cpu EVE = {
        id:             "2",
        clockRate:      200.0,
        catalogName:    "ti.catalog.arp32",
        deviceName:     "Vayu",
        revision:       "1.0"
    };

    /* GPP */
    readonly config xdc.platform.IExeContext.Cpu GPP = {
        id:             "3",
        clockRate:      800.0,  /* Typically set by the HLOS */
        catalogName:    "ti.catalog.arm.cortexa15",
        deviceName:     "Vayu",
        revision:       "1.0"
    };

/*  Memory Map for ti.platforms.simVayu
 *
 *  Virtual     Physical        Size            Comment
 *  ------------------------------------------------------------------------
 *              8000_0000  1000_0000  ( 256 MB) External Memory
 *
 *  0000_0000 0 8000_0000        100  ( 256  B) EVE1_VECS (vector table)
 *              8000_0100       FF00  ( ~64 KB) --------
 *  0000_0000   8001_0000        100  ( 256  B) EVE2_VECS (vector table)
 *              8001_0100       FF00  ( ~64 KB) --------
 *  0000_0000   8002_0000        100  ( 256  B) EVE3_VECS (vector table)
 *              8002_0100       FF00  ( ~64 KB) --------
 *  0000_0000   8003_0000        100  ( 256  B) EVE4_VECS (vector table)
 *              8003_0100    FE_FF00  ( ~16 MB) --------
 *            1 8100_0000    40_0000  (   4 MB) EVE1_PROG (code, data)
 *              8140_0000    C0_0000  (  12 MB) --------
 *            2 8200_0000    40_0000  (   4 MB) EVE2_PROG (code, data)
 *              8240_0000    C0_0000  (  12 MB) --------
 *            3 8300_0000    40_0000  (   4 MB) EVE3_PROG (code, data)
 *              8340_0000    C0_0000  (  12 MB) --------
 *            4 8400_0000    40_0000  (   4 MB) EVE4_PROG (code, data)
 *              8440_0000    C0_0000  (  12 MB) --------
 *            5 8500_0000   100_0000  (  16 MB) --------
 *            6 8600_0000   100_0000  (  16 MB) --------
 *            7 8700_0000   100_0000  (  16 MB) --------
 *            8 8800_0000   100_0000  (  16 MB) --------
 *            9 8900_0000   100_0000  (  16 MB) --------
 *            A 8A00_0000    80_0000  (   8 MB) IPU1 (code, data), benelli
 *              8A80_0000    80_0000  (   8 MB) IPU2 (code, data), benelli
 *            B 8B00_0000   100_0000  (  16 MB) HOST (code, data)
 *            C 8C00_0000   100_0000  (  16 MB) DSP1 (code, data)
 *            D 8D00_0000   100_0000  (  16 MB) DSP2 (code, data)
 *            E 8E00_0000   100_0000  (  16 MB) SR_0 (ipc)
 *            F 8F00_0000   100_0000  (  16 MB) --------
 */

    readonly config Any SR_0 = {
        name: "SR_0", space: "data", access: "RWX",
        base: 0x8E000000, len: 0x1000000,
        comment: "SR#0 Memory (16 MB)"
    };

    readonly config Any DSP1 = {
        externalMemoryMap: [
            [ "DSP1_PROG", {
                name: "DSP1_PROG", space: "code/data", access: "RWX",
                base: 0x8C000000, len: 0x1000000,
                comment: "DSP1 Program Memory (16 MB)"
            }],
            [ "SR_0", SR_0 ]
        ],
        codeMemory:  "DSP1_PROG",
        dataMemory:  "DSP1_PROG",
        stackMemory: "DSP1_PROG",
        l1DMode: "32k",
        l1PMode: "32k",
        l2Mode: "128k"
    };

    readonly config Any DSP2 = {
        externalMemoryMap: [
            [ "DSP2_PROG", {
                name: "DSP2_PROG", space: "code/data", access: "RWX",
                base: 0x8D000000, len: 0x1000000,
                comment: "DSP2 Program Memory (16 MB)"
            }],
            [ "SR_0", SR_0 ]
        ],
        codeMemory:  "DSP2_PROG",
        dataMemory:  "DSP2_PROG",
        stackMemory: "DSP2_PROG",
        l1DMode: "32k",
        l1PMode: "32k",
        l2Mode: "128k"
    };

    readonly config Any EVE1 = {
        externalMemoryMap: [
            [ "EVEVECS", { /* name used by SYS/BIOS */
                name: "EVEVECS", space: "code/data", access: "RWX",
                base: 0x80000000, len: 0x100, page: 0,
                comment: "EVE1 Vector Table (256 B)"
            }],
            [ "EVE1_PROG", {
                name: "EVE1_PROG", space: "code/data", access: "RWX",
                base: 0x81000000, len: 0x400000, page: 1,
                comment: "EVE1 Program Memory (4 MB)"
            }],
            [ "SR_0", SR_0 ]
        ],
        codeMemory:  "EVE1_PROG",
        dataMemory:  "EVE1_PROG",
        stackMemory: "EVE1_PROG"
    };

    readonly config Any EVE2 = {
        externalMemoryMap: [
            [ "EVEVECS", { /* name used by SYS/BIOS */
                name: "EVEVECS", space: "code/data", access: "RWX",
                base: 0x80010000, len: 0x100, page: 0,
                comment: "EVE2 Vector Table (256 B)"
            }],
            [ "EVE2_PROG", {
                name: "EVE2_PROG", space: "code/data", access: "RWX",
                base: 0x82000000, len: 0x400000, page: 1,
                comment: "EVE2 Program Memory (4 MB)"
            }],
            [ "SR_0", SR_0 ]
        ],
        codeMemory:  "EVE2_PROG",
        dataMemory:  "EVE2_PROG",
        stackMemory: "EVE2_PROG"
    };

    readonly config Any EVE3 = {
        externalMemoryMap: [
            [ "EVEVECS", { /* name used by SYS/BIOS */
                name: "EVEVECS", space: "code/data", access: "RWX",
                base: 0x80020000, len: 0x100, page: 0,
                comment: "EVE3 Vector Table (256 B)"
            }],
            [ "EVE3_PROG", {
                name: "EVE3_PROG", space: "code/data", access: "RWX",
                base: 0x83000000, len: 0x400000, page: 1,
                comment: "EVE3 Program Memory (4 MB)"
            }],
            [ "SR_0", SR_0 ]
        ],
        codeMemory:  "EVE3_PROG",
        dataMemory:  "EVE3_PROG",
        stackMemory: "EVE3_PROG"
    };

    readonly config Any EVE4 = {
        externalMemoryMap: [
            [ "EVEVECS", { /* name used by SYS/BIOS */
                name: "EVEVECS", space: "code/data", access: "RWX",
                base: 0x80030000, len: 0x100, page: 0,
                comment: "EVE4 Vector Table (256 B)"
            }],
            [ "EVE4_PROG", {
                name: "EVE4_PROG", space: "code/data", access: "RWX",
                base: 0x84000000, len: 0x400000, page: 1,
                comment: "EVE4 Program Memory (4 MB)"
            }],
            [ "SR_0", SR_0 ]
        ],
        codeMemory:  "EVE4_PROG",
        dataMemory:  "EVE4_PROG",
        stackMemory: "EVE4_PROG"
    };

    readonly config Any IPU1 = {
        externalMemoryMap: [
            [ "IPU1_PROG", {
                name: "IPU1_PROG", space: "code/data", access: "RWX",
                base: 0x8A000000, len: 0x800000,
                comment: "IPU1 Program Memory (8 MB)"
            }],
            [ "SR_0", SR_0 ]
        ],
        codeMemory:  "IPU1_PROG",
        dataMemory:  "IPU1_PROG",
        stackMemory: "IPU1_PROG"
    };

    readonly config Any IPU2 = {
        externalMemoryMap: [
            [ "IPU2_PROG", {
                name: "IPU2_PROG", space: "code/data", access: "RWX",
                base: 0x8A800000, len: 0x800000,
                comment: "IPU2 Program Memory (8 MB)"
            }],
            [ "SR_0", SR_0 ]
        ],
        codeMemory:  "IPU2_PROG",
        dataMemory:  "IPU2_PROG",
        stackMemory: "IPU2_PROG"
    };

    readonly config Any HOST = {
        externalMemoryMap: [
            [ "HOST_PROG", {
                name: "HOST_PROG", space: "code/data", access: "RWX",
                base: 0x8B000000, len: 0x1000000,
                comment: "HOST Program Memory (16 MB)"
            }],
            [ "SR_0", SR_0 ]
        ],
        codeMemory:  "HOST_PROG",
        dataMemory:  "HOST_PROG",
        stackMemory: "HOST_PROG"
    };

instance:

    /*!
     *  ======== externalMemoryMap ========
     *  Memory regions as defined in the Vayu Simulator Specification
     */
    override readonly config xdc.platform.IPlatform.Memory
        externalMemoryMap[string] = [
            ["EXT_RAM", {
                comment: "1 GB External RAM Memory",
                name: "EXT_RAM",
                base: 0x80000000,
                len:  0x40000000
            }]
        ];

    /*
     *  ======== l1PMode ========
     *  Define the amount of L1P RAM used for L1 Program Cache.
     *
     *  Check the device documentation for valid values.
     */
    config String l1PMode = "32k";

    /*
     *  ======== l1DMode ========
     *  Define the amount of L1D RAM used for L1 Data Cache.
     *
     *  Check the device documentation for valid values.
     */
    config String l1DMode = "32k";

    /*
     *  ======== l2Mode ========
     *  Define the amount of L2 RAM used for L2 Cache.
     *
     *  Check the device documentation for valid values.
     */
    config String l2Mode = "0k";
};
