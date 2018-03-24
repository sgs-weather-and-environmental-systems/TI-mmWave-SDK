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
 *  Platform support for evmTI814X
 *
 */

package ti.platforms.evmTI814X;

/*!
 *  ======== Platform ========
 *  Platform support for the evmTI814X
 *
 *  This module implements xdc.platform.IPlatform and defines configuration
 *  parameters that correspond to this platform's Cpu's, Board's, etc.
 *
 *  The configuration parameters are initialized in this package's
 *  configuration script (package.cfg) and "bound" to the TCOM object
 *  model.  Once they are part of the model, these parameters are
 *  queried by a program's configuration script.
 *
 *  This particular platform has 4 CPU's, a host GPP, 2 M3's, and a
 *  C674 DSP.
 */
metaonly module Platform inherits xdc.platform.IPlatform
{
    readonly config xdc.platform.IPlatform.Board BOARD = {
        id:             "0",
        boardName:      "evmTI814X",
        boardFamily:    "evmTI814X",
        boardRevision:  null
    };

    /* C674 GEM */
    readonly config xdc.platform.IExeContext.Cpu GEM = {
        id:             "0",
        clockRate:      500.0,
        catalogName:    "ti.catalog.c6000",
        deviceName:     "TMS320TI814X",
        revision:       ""
    };

    /* M3 Subsystem */
    readonly config xdc.platform.IExeContext.Cpu DSS = {
        id:             "1",
        clockRate:      200.0,
        catalogName:    "ti.catalog.arm.cortexm3",
        deviceName:     "TMS320TI814X",
        revision:       "1.0"
    };

    /* GPP */
    readonly config xdc.platform.IExeContext.Cpu GPP = {
        id:             "2",
        clockRate:      600.0,  /* Typically set by the HLOS */
        catalogName:    "ti.catalog.arm.cortexa8",
        deviceName:     "TMS320TI814X",
        revision:       "1.0"
    };

instance:

    override readonly config xdc.platform.IPlatform.Memory
        externalMemoryMap[string] = [
            ["DDR3_HOST", {
                comment: "DDR3 Memory reserved for use by the A8",
                name: "DDR3_HOST",
                base: 0x80000000,
                len:  0x0B000000    /* 176 MB */
            }],
            ["DDR3_DSP", {
                comment: "DDR3 Memory reserved for use by the C674",
                name: "DDR3_DSP",
                base: 0x8B000000,
                len:  0x02000000    /* 32 MB */
            }],
            ["DDR3_SR1", {
                comment: "DDR3 Memory reserved for use by SharedRegion 1",
                name: "DDR3_SR1",
                base: 0x8D000000,
                len:  0x00C00000    /* 12 MB */
            }],
            ["DDR3_HDVPSS", {
                comment: "DDR3 Memory reserved for use by HDVPSS",
                name: "DDR3_HDVPSS",
                base: 0x8DC00000,
                len:  0x00200000    /* 2 MB */
            }],
            ["DDR3_V4L2", {
                comment: "DDR3 Memory reserved for use by V4L2",
                name: "DDR3_V4L2",
                base: 0x8DE00000,
                len:  0x00200000    /* 2 MB */
            }],
            ["DDR3_SR0", {
                comment: "DDR3 Memory reserved for use by SharedRegion 0",
                name: "DDR3_SR0",
                base: 0x8E000000,
                len:  0x01000000    /* 16 MB */
            }],
            ["DDR3_M3", {
                comment: "DDR3 Memory reserved for use by the M3 core",
                name: "DDR3_M3",
                base: 0x8F000000,
                len:  0x01000000    /* 16 MB */
            }],
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
