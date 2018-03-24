/* ======================================================================= */
/* DSPF_sp_biquad.c -- Biquad Filter                                       */
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

#pragma CODE_SECTION(DSPF_sp_biquad, ".text:optimized");

#include "DSPF_sp_biquad.h"

void DSPF_sp_biquad(float *restrict x,
    float *b,
    float *a,
    float *delay,
    float *restrict y,
    const int nx)
{
    int i;
    float sum1, sum2, sum3, sum4, sum5, sum, x0, x1, y0;

    /* calculate first two samples (consume delay elements) */
    y[0] = b[0] * x[0] + delay[0];
    y[1] = b[0] * x[1] + delay[1] + b[1] * x[0] - a[1] * y[0];

    /* prepare temp variables for i = 2 */
    x0  = x[0];
    x1  = x[1];
    y0  = y[0];
    sum = y[1];

    _nassert(nx >= 2);
    #pragma MUST_ITERATE(1,,)
    for (i = 2; i < nx; i++)
    {
        sum5 = a[1] * sum;
        sum4 = a[2] * y0;
        sum1 = b[0] * x[i];
        sum2 = b[1] * x1;
        sum3 = b[2] * x0;

        x0   = x1;
        x1   = x[i];

        y0   = sum;
        sum  = sum3 + sum2 + sum1 - sum4 - sum5;
        y[i] = sum;
    }

    /* find final delay elements to return */
    delay[0] = b[1] * x1 + b[2] * x0 - a[1] * sum - a[2] * y0;
    delay[1] = b[2] * x1 - a[2] * sum;
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_biquad.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

