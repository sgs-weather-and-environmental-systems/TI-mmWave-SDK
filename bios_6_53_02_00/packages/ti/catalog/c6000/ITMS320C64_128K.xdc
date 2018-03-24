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
 *  ======== ITMS320C64_128K.xdc ========
 *
 */
package ti.catalog.c6000;

/*!
 *  ======== ITMS320C64_128K ========
 *  An interface implemented by all TMS320C64xx devices with 128KB of internal
 *  memory.
 *
 *  This interface is defined to factor common data about this family into
 *  a single place; all TMS320C64xx devices with 128KB of internal
 *  memory extend this interface.
 */
metaonly interface ITMS320C64_128K inherits ti.catalog.ICpuDataSheet
{

    config long cacheSize[string] = [
        ["4-way cache (0k)",   0x00000],
        ["4-way cache (32k)",  0x08000],
        ["4-way cache (64k)",  0x10000],
        ["4-way cache (128k)", 0x20000],
        ["0k",   0x00000],
        ["32k",  0x08000],
        ["64k",  0x10000],
        ["128k", 0x20000],
    ];

    readonly config ti.catalog.c6000.ICacheInfo.CacheDesc cacheMap[string] =  [
         ['l2Mode',{desc:"L2 Cache",
                     map : [["4-way cache (0k)",0x0000],
                            ["4-way cache (32k)",0x8000],
                            ["4-way cache (64k)",0x10000],
                            ["4-way cache (128k)",0x20000]],
                     defaultValue: "4-way cache (0k)",
                     memorySection: "IRAM"}]
    ];

instance:
    override config int     minProgUnitSize = 1;
    override config int     minDataUnitSize = 1;
    override config int     dataWordSize    = 4;

    override config string   cpuCore        = "6400";
    override config string   isa = "64";
    override config string   cpuCoreRevision = "1.0";

    /*!
     *  ======== memMap ========
     *  The default memory map for this device
     */
    config xdc.platform.IPlatform.Memory memMap[string]  = [
        ["IRAM", {
            name:       "IRAM",
            comment:    "Internal L2 memory",
            base:       0x00000,
            len:        0x20000,
            space:      "code/data",
            access:     "RWX"
        }],
    ];
}
