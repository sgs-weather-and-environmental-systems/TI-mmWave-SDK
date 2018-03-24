/* ======================================================================= */
/* DSPF_sp_w_vec.c -- Weighted Vector Sum                                  */
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

#pragma CODE_SECTION(DSPF_sp_w_vec, ".text:optimized");

#include "DSPF_sp_w_vec.h"

void DSPF_sp_w_vec(const float *x1, const float *x2, const float m,
    float *restrict y, const int n)
{
    int i;
    double x11x10, x21x20;
    float x10, x11, x20, x21;

    _nassert(n > 0);
    _nassert(n % 2 == 0);
    _nassert((int)x1 % 8 == 0);
    _nassert((int)x2 % 8 == 0);
    
    #pragma MUST_ITERATE(1,,1)
    for (i = 0; i < n; i += 2)    
    {
        /* use double word load intrinsic and improve throughput */
        x11x10 = _amemd8((void *) (x1 + i));
        x21x20 = _amemd8((void *) (x2 + i));
        
        x10 = _itof(_lo(x11x10));
        x11 = _itof(_hi(x11x10));
        
        x20 = _itof(_lo(x21x20));
        x21 = _itof(_hi(x21x20));
        
        y[i] = (m * x10) + x20;
        y[i + 1] = (m * x11) + x21;
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_w_vec.c                                          */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

