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
 *  ======== ICacheInfo.xdc ========
 */


package ti.catalog.c6000;

metaonly interface ICacheInfo {
    /*!
     *  ======== CacheDesc ========
     *  Structure used by ICpuDataSheet implementations to
     *  specify device cache modes.
     *
     *  A map is defined by an ICpuDataSheet implementation
     *  that maps a string denoting a device register setting
     *  to a CacheDesc structure. This maybe used in implementing
     *  the 'getMemoryMap' method. An example of such a map is shown below :
     *
     *   readonly config ti.catalog.c6000.ICacheInfo.CacheDesc cacheMap[string] =  [
         *    ['l1PMode',{desc:"L1P Cache",
         *                map : [["0k",0x0000],
         *                       ["4k",0x1000],
         *                       ["8k",0x2000],
         *                       ["16k",0x4000],
         *                       ["32k",0x8000]],
         *                defaultValue: "32k",
         *                memorySection: "L1PSRAM"}],
         *
         *        ['l1DMode',{desc:"L1D Cache",
         *                map : [["0k",0x0000],
         *                       ["4k",0x1000],
         *                       ["8k",0x2000],
         *                       ["16k",0x4000],
         *                       ["32k",0x8000]],
         *                defaultValue: "32k",
         *                memorySection: "L1DSRAM"}],
         *
         *    ['l2Mode',{desc:"L2 Cache",
         *                map : [["0k",0x0000],
         *                       ["32k",0x8000],
         *                       ["64k",0x10000],
         *                       ["128k",0x20000],
         *                       ["256k",0x40000]],
         *                defaultValue: "0k",
         *                memorySection: "IRAM"}],
     *
     *   ];
     *
     *  @_nodoc
     */
    struct CacheDesc {
        string desc;          /*! String describing the register setting */
        Int base;             /*! base address of cache */
        unsigned map[string]; /*! A hash of cache modes to cache size*/
        string defaultValue;  /*! The default cache mode for the device */
        string memorySection; /*! The associated memory section */
    };


}
