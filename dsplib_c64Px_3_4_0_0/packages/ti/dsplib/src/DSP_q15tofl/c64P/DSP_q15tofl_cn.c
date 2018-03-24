/* ======================================================================= */
/* DSP_q15tofl_cn.c -- Float to Q15 conversion                             */
/*                     Natural C Implementation                            */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_q15tofl_cn (                                               */
/*         const short *restrict q15, // Input Q15 array                   */
/*         float *restrict flt,       // Output float array                */
/*         int    nx                  // Number of elements                */
/*     );                                                                  */
/*                                                                         */
/*     x[nx]  ---  Pointer to Q15 input vector of size nx                  */
/*     r[nx]  ---  Pointer to floating-point output data vector            */
/*                 of size nx containing the floating-point equivalent     */
/*                 of vector input                                         */
/*     nx     ---  length of input and output data vectors                 */
/*                                                                         */
/*  Description                                                            */
/*     Converts the Q15 stored in vector input to IEEE floating point      */
/*     numbers stored in vector output.                                    */
/*                                                                         */
/*     void q15tofl(short *q15, float *flt, int nx)                        */
/*     {                                                                   */
/*      int i;                                                             */
/*                                                                         */
/*      for (i=0;i<nx;i++)                                                 */
/*           flt[i]=(float)q15[i]/0x8000;                                  */
/*     }                                                                   */
/*                                                                         */
/*     The above C code is a general implementation without restrictions.  */
/*                                                                         */
/*  Assumptions                                                            */
/*     Arrays q15 and flt do not overlap                                   */
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

#pragma CODE_SECTION(DSP_q15tofl_cn, ".text:ansi");

#include "DSP_q15tofl_cn.h"

void DSP_q15tofl_cn (
    const short *restrict q15,  /* Input Q15 array      */
    float *restrict flt,        /* Output float array   */
    int    nx                   /* Number of elements   */
)
{
    int i;

    for (i = 0; i < nx; i++)
        flt[i] = (float)q15[i] / 32768;
}

/* ======================================================================= */
/*  End of file:  DSP_q15tofl_cn.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

