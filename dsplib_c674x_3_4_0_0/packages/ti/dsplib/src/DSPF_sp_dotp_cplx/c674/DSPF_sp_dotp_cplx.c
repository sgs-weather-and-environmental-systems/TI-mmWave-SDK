/* ======================================================================= */
/* DSPF_sp_dotp_cplx.c -- Complex Dot Product                              */
/*              Optimized C Implementation (w/ Intrinsics)                 */
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

#pragma CODE_SECTION(DSPF_sp_dotp_cplx, ".text:optimized");

#include "DSPF_sp_dotp_cplx.h"

void DSPF_sp_dotp_cplx(const float * x, const float * y, int n,
    float * restrict re, float * restrict im)
{
    float real1 = 0, imag1 = 0;
    float real2 = 0, imag2 = 0;
    int i;

    _nassert(n % 2 == 0);
    _nassert(n > 0);
    _nassert((int)x % 8 == 0);
    _nassert((int)y % 8 == 0);
    
    #pragma MUST_ITERATE(1,,2)
    #pragma UNROLL(2)
    for(i = 0; i < 2 * n; i += 2)
    {        
        /* accumulate the 2 portions of the real part separately */
        real1 += x[i] * y[i];             
        real2 += x[i + 1] * y[i + 1];
        
        /* accumulate the 2 portions of the imag part separately */
        imag1 += x[i] * y[i + 1];
        imag2 += x[i + 1] * y[i];
    }
    /* find the final results */
    *re = real1 - real2;
    *im = imag1 + imag2;
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_dotp_cplx.c                                      */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

