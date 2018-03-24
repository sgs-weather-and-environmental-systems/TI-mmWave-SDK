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
 *  ======== DRA7XX.xdc ========
 *
 */

package ti.catalog.arp32;

/*!
 *  ======== DRA7XX ========
 *  The DRA7XX device data sheet module.
 *
 *  This module implements the xdc.platform.ICpuDataSheet interface and is
 *  used by platforms to obtain "data sheet" information about this device.
 *
 */
metaonly module DRA7XX inherits ti.catalog.ICpuDataSheet
{
instance:
    override config string cpuCore           = "ARP32";
    override config string isa               = "arp32";
    override config string cpuCoreRevision   = "1.0";
    override config int    minProgUnitSize   = 1;
    override config int    minDataUnitSize   = 1;
    override config int    dataWordSize      = 4;

    /*!
     *  ======== memMap ========
     *  The memory map returned be getMemoryMap().
     */
    config xdc.platform.IPlatform.Memory memMap[string]  = [

        ["DMEM", {
            comment: "32KB data memory",
            name: "DMEM",
            base: 0x40020000,
            len:  0x8000,
            space: "data",
            page: 1,
            access: "RW"
        }],

        ["WBUF", {
            comment: "VCOP work buffer",
            name: "WBUF",
            base: 0x40040000,
            len:  0x8000,
            space: "data",
            page: 1,
            access: "RW"
        }],

        ["IBUFLA", {
            comment: "Image buffer low copy A",
            name: "IBUFLA",
            base: 0x40050000,
            len:  0x4000,
            space: "data",
            page: 1,
            access: "RW"
        }],

        ["IBUFHA", {
            comment: "Image buffer high copy A",
            name: "IBUFHA",
            base: 0x40054000,
            len:  0x4000,
            space: "data",
            page: 1,
            access: "RW"
        }],

        ["IBUFLB", {
            comment: "Image buffer low copy B",
            name: "IBUFLB",
            base: 0x40070000,
            len:  0x4000,
            space: "data",
            page: 1,
            access: "RW"
        }],

        ["IBUFHB", {
            comment: "Image buffer high copy B",
            name: "IBUFHB",
            base: 0x40074000,
            len:  0x4000,
            space: "data",
            page: 1,
            access: "RW"
        }],

        ["OCMC_RAM1", {
            comment:    "OCMC (On-chip RAM) Bank 1 (512KB)",
            name:       "OCMC_RAM1",
            base:       0x40300000,
            len:        0x00080000,
            space:      "code/data",
            page: 1,
            access:     "RWX"
        }],

        ["OCMC_RAM2", {
            comment:    "OCMC (On-chip RAM) Bank 2 (1MB)",
            name:       "OCMC_RAM2",
            base:       0x40400000,
            len:        0x00100000,
            space:      "code/data",
            page: 1,
            access:     "RWX"
        }],

        ["OCMC_RAM3", {
            comment:    "OCMC (On-chip RAM) Bank 3 (1MB)",
            name:       "OCMC_RAM3",
            base:       0x40500000,
            len:        0x00100000,
            space:      "code/data",
            page: 1,
            access:     "RWX"
        }],

    ];
};
