/* ======================================================================= */
/* lnk.cmd -- Linker command file                                          */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/* Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/  */ 
/*                                                                         */
/*                                                                         */
/*  Redistribution and use in source and binary forms, with or without     */
/*  modification, are permitted provided that the following conditions     */
/*  are met:                                                               */
/*                                                                         */
/*    Redistributions of source code must retain the above copyright       */
/*    notice, this list of conditions and the following disclaimer.        */
/*                                                                         */
/*    Redistributions in binary form must reproduce the above copyright    */
/*    notice, this list of conditions and the following disclaimer in the  */
/*    documentation and/or other materials provided with the               */
/*    distribution.                                                        */
/*                                                                         */
/*    Neither the name of Texas Instruments Incorporated nor the names of  */
/*    its contributors may be used to endorse or promote products derived  */
/*    from this software without specific prior written permission.        */
/*                                                                         */
/*  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS    */
/*  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT      */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR  */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,  */
/*  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT       */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,  */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY  */
/*  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE  */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.   */
/*                                                                         */
/* ======================================================================= */

-c
-heap  0x1000
-stack 0x1000
-l../../../../packages/ti/dsplib/lib/dsplib.lib
/* MODULE MEM */
MEMORY {
   CACHE_L2    : origin = 0x11808000,  len = 0x8000
   CACHE_L1P   : origin = 0x11e08000,  len = 0x8000
   CACHE_L1D   : origin = 0x11f10000,  len = 0x8000
   DDR2        : origin = 0x80000000,  len = 0x8000000
   L1DSRAM     : origin = 0x11f04000,  len = 0xc000
   IRAM        : origin = 0x11800000,  len = 0x8000
}

SECTIONS
{
    vectors            :> IRAM
    .cinit             :> DDR2
    .text              :> DDR2
    .stack             :> DDR2
    .bss               :> IRAM
    .const             :> IRAM
    .data              :> IRAM
    .far               :> DDR2
    .switch            :> IRAM
    .sysmem            :> IRAM
    .tables            :> IRAM
    .cio               :> IRAM
}

