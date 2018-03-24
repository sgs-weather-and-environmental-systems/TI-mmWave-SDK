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
 *  ======== F28M35x.xdc ========
 *
 */
package ti.catalog.c2800;

/*!
 *  ======== F28M35x ========
 *  The F28M35x device data sheet module.
 *
 *  This module implements the xdc.platform.ICpuDataSheet interface and is used
 *  by platforms to obtain "data sheet" information about this device.
 */
metaonly module F28M35x inherits ITMS320C283xx
{
instance:
    override config string   cpuCoreRevision = "1.0";

    /*!
     *  ======== memMap ========
     *  The default memory map for this device
     */
    config xdc.platform.IPlatform.Memory memMap[string]  = [
        ["M01SARAM", {
            comment: "On-Chip RAM Memory",
            name: "M01SARAM",
            base: 0x0,
            len:  0x800,
            page: 1,
            space: "code/data",
            access: "RWX"
        }],

        ["PIEVECT", {
            comment: "On-Chip PIEVECT RAM Memory",
            name: "PIEVECT",
            base: 0xD00,
            len:  0x100,
            page: 0,
            space: "data",
            access: "RW"
        }],

        ["L03SARAM", {
            comment: "On-Chip RAM Memory",
            name: "L03SARAM",
            base: 0x8000,
            len:  0x4000,
            page: 1,
            space: "code/data",
            access: "RWX"
        }],

        ["S07SHRAM", {
            comment: "On-Chip Shared RAM Memory",
            name: "S07SHRAM",
            base: 0xC000,
            len:  0x8000,
            page: 1,
            space: "code/data",
            access: "RWX"
        }],

        ["CTOMMSGRAM", {
            comment: "C28 to M3 MSG RAM Memory",
            name: "CTOMMSGRAM",
            base: 0x3F800,
            len:  0x00400,
            page: 1,
            space: "data",
            access: "RW"
        }],

        ["MTOCMSGRAM", {
            comment: "M3 to C28 MSG RAM Memory",
            name: "MTOCMSGRAM",
            base: 0x3FC00,
            len:  0x00400,
            page: 1,
            space: "data",
            access: "R"
        }],

        ["OTP", {
            comment: "1K X 16 OTP memory",
            name: "OTP",
            base: 0x240400,
            len:  0x000400,
            page: 0,
            space: "code",
            access: "RWX"
        }],

        ["FLASH", {
            comment: "256K X 16 Flash memory",
            name: "FLASH",
            base: 0x100000,
            len:  0x03fffe,
            page: 0,
            space: "code/data",
            access: "RWX"
        }],

        ["BEGIN", {
            comment: "Used for Flash boot",
            name: "BEGIN",
            base: 0x13fffe,
            len:  0x000002,
            page: 0,
            space: "code/data",
            access: "RWX"
        }],

        ["BOOTROM", {
            comment: "On-Chip Boot ROM",
            name: "BOOTROM",
            base: 0x3f8000,
            len:  0x008000,
            page: 0,
            space: "code",
            access: "RX"
        }],
    ];
};
