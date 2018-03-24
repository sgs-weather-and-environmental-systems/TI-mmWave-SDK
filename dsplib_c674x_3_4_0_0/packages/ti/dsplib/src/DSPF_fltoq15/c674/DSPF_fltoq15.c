/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  DSPLIB  DSP Signal Processing Library                                  */
/*                                                                         */
/*  This library contains proprietary intellectual property of Texas       */
/*  Instruments, Inc.  The library and its source code are protected by    */
/*  various copyrights, and portions may also be protected by patents or   */
/*  other legal protections.                                               */
/*                                                                         */
/*  This software is licensed for use with Texas Instruments TMS320        */
/*  family DSPs.  This license was provided to you prior to installing     */
/*  the software.  You may review this license by consulting the file      */
/*  TI_license.PDF which accompanies the files in this library.            */
/*                                                                         */
/* ----------------------------------------------------------------------- */
/*                                                                         */
/* DSPF_fltoq15.c -- Float to Q15 conversion                               */
/*                  Optimized C Implementation (w/ Intrinsics)             */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSPF_fltoq15 (                                                 */
/*         const float *restrict flt, // Input float array                 */
/*         short *restrict q15,       // Output Q15 array                  */
/*         short nx                   // Number of elements                */
/*     );                                                                  */
/*                                                                         */
/*     Convert the IEEE floating point numbers stored in vector x[] into   */
/*     Q.15 format numbers stored in vector r[]. Results are truncated     */
/*     towards zero. Values that exceed the size limit will be saturated   */
/*     to 0x7fff if value is positive and 0x8000 if value is negative.     */
/*     All values too small to be correctly represented will be truncated  */
/*     to 0.                                                               */
/*                                                                         */
/*     The 16-bit Q.15 format is defined as follows:                       */
/*                                                                         */
/*         1 11111                                                         */
/*         5 432109876543210                                               */
/*         S.XXXXXXXXXXXXXXX                                               */
/*                                                                         */
/*         range: 1.000000000000000 = -1.0               <-> -32768        */
/*                0.111111111111111 =  0.999969482421875 <->  32767        */
/*                                                                         */
/*     IEEE floating point format is defined as follows:                   */
/*                                                                         */
/*         31 | 30....23 | 22.....0                                        */
/*         S  | EXPONENT | MANTISSA                                        */
/*                                                                         */
/*     The value is obtained as: (-1)^S * 1.MANTISSA * 2^(EXPONENT-127)    */
/*                                                                         */
/*  Assumptions                                                            */
/*     Arrays flt and q15 do not overlap                                   */
/*     nx >= 2    nx % 2 == 0                                              */
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

#pragma CODE_SECTION(DSPF_fltoq15, ".text:optimized");

#include "DSPF_fltoq15.h"

extern cregister volatile unsigned int FADCR;

void DSPF_fltoq15(const float* restrict x, short* restrict y, const int n)
{
           int i, a;
           int fadcr_store;
           float t, t1;

           _nassert(n > 0);
           _nassert(n % 2 == 0);
           
           /* preserve the FADCR value */
           fadcr_store = FADCR;
           
           /* set FADCR bits to switch to ROUND TOWARD NEGATIVE INF */
           FADCR = _set(FADCR,9,10);
           
           /* set mode for both L units */
           FADCR = _set(FADCR,25,26);
           
           #pragma MUST_ITERATE(1,,)
           for(i = 0; i < n; i++)                                         
           {
               /* load the float */
               t = x[i];

               /* multiply by 2^15 for converting to Q15 format */
               /* this brings the number in the range -32768 to 32767 */
               t1 = t * 32768;

               /* use intrinsic to convert the number to integer */
               a = _spint(t1);
               
               /* saturate the number if required */
               a = _sshl(a, 16);
               
               /* fetch the lower 16 bits of the result */
               y[i] = _mpyhlu(a,1);
           }                   
           
           /* restore the FADCR value */
           FADCR = fadcr_store;
}

/* ======================================================================= */
/*  End of file:  DSPF_fltoq15.c                                           */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

