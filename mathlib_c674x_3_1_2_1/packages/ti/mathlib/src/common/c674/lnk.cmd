/* ======================================================================== *
 * MATHLIB -- TI Floating-Point Math Function Library                       *
 *                                                                          *
 *                                                                          *
 * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/   *
 *                                                                          *
 *                                                                          *
 *  Redistribution and use in source and binary forms, with or without      *
 *  modification, are permitted provided that the following conditions      *
 *  are met:                                                                *
 *                                                                          *
 *    Redistributions of source code must retain the above copyright        *
 *    notice, this list of conditions and the following disclaimer.         *
 *                                                                          *
 *    Redistributions in binary form must reproduce the above copyright     *
 *    notice, this list of conditions and the following disclaimer in the   *
 *    documentation and/or other materials provided with the                *
 *    distribution.                                                         *
 *                                                                          *
 *    Neither the name of Texas Instruments Incorporated nor the names of   *
 *    its contributors may be used to endorse or promote products derived   *
 *    from this software without specific prior written permission.         *
 *                                                                          *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     *
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       *
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   *
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT    *
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   *
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        *
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   *
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   *
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     *
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   *
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    *
 * ======================================================================== */

-heap  0x8000
-stack 0xC000

-l ../../../../../lib/mathlib.lib

MEMORY
{
  L2SRAM (RWX)  : org = 0x0800000, len = 0x080000
  MSMCSRAM (RWX): org = 0xc000000, len = 0x200000
}

SECTIONS
{
  .kernel_asm: {
    mathlib*<*.o*>  (.text:optasm) { SIZE(_kernel_asm_size) }
  } 

  .kernel_vec: {
    mathlib*<*.o*>  (.text:optvec) { SIZE(_kernel_vec_size) }
  } 

  .kernel_ci: {
    mathlib*<*.o*>  (.text:optci) { SIZE(_kernel_ci_size) }
  } 

  .text:            load >> L2SRAM 
  .text:touch:      load >> L2SRAM

  GROUP (NEAR_DP)
  {
    .neardata
    .rodata 
    .bss
  } load > L2SRAM
   
  .init_array: load >> L2SRAM 
  .far:        load >> L2SRAM
  .fardata:    load >> L2SRAM
  .data:       load >> L2SRAM 
  .switch:     load >> L2SRAM
  .stack:      load >  L2SRAM
  .args:       load >  L2SRAM align = 0x4, fill = 0 {_argsize = 0x200; }
  .sysmem:     load >  L2SRAM
  .cinit:      load >  L2SRAM
  .const:      load >  L2SRAM START(const_start) SIZE(const_size)
  .pinit:      load >  L2SRAM
  .cio:        load >> L2SRAM
   xdc.meta:   load >> L2SRAM, type = COPY
}
