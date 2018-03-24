/* ======================================================================= */
/* DSPF_sp_fir_gen.c -- FIR Filter                                         */
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

#pragma CODE_SECTION(DSPF_sp_fir_gen, ".text:optimized");

#include "DSPF_sp_fir_gen.h"
#ifdef __TI_COMPILER_VERSION__
#include "c6x.h"
#endif

void DSPF_sp_fir_gen(const float * restrict x,
    const float * restrict h,
    float * restrict y,
    int nh,
    int ny)
{
    int i, j = 0, k = 0, l = 0, nhm4 = nh - 4;
    __float2_t x1x0, h1h0;
    __float2_t x3x2, h3h2;
    __float2_t x5x4;
    float sum1=0,sum2=0,sum3=0,sum4=0;
    float term1, term2, term3, term4, x1, x0, h1, h0;
    float term5, term6, term7, term8, x2,x3,h2,h3;
    float term9, term10, term11, term12, term13, term14, term15, term16, x4,x5;

    _nassert(nh >= 4);
    _nassert(nh % 4 == 0);
    _nassert(ny >= 4);
    _nassert(ny % 4 == 0);

    #pragma MUST_ITERATE(4,,)
    for (i = 0; i < (nh * ny) >> 2; i += 4)
    {
        //term1 = x[j++] * h[l];
        //term3 = x[j] * h[l++];
        //term2 = x[j++] * h[l];
        //term4 = x[j] * h[l++];
        x1x0 = _amem8_f2((void *)(x + j));
        h1h0 = _amem8_f2((void *)(h + l));

        x3x2 = _amem8_f2((void *)(x + j + 2));
        h3h2 = _amem8_f2((void *)(h + l + 2));

        x5x4 = _amem8_f2((void *)(x + j + 4));
        j += 4;
        l += 4;
        x0 = _lof2(x1x0);
        x1 = _hif2(x1x0);
        h0 = _lof2(h1h0);
        h1 = _hif2(h1h0);

        x2 = _lof2(x3x2);
        x3 = _hif2(x3x2);
        h2 = _lof2(h3h2);
        h3 = _hif2(h3h2);

        x4 = _lof2(x5x4);
        x5 = _hif2(x5x4);

        term1 = x0 * h0;
        term5 = x1 * h0;
        term2 = x1 * h1;
        term6 = x2 * h1;

        term3 = x2 * h2;
        term7 = x3 * h2;
        term4 = x3 * h3;
        term8 = x4 * h3;

        term9 = x2 * h0;
        term13= x3 * h0;
        term10= x3 * h1;
        term14= x4 * h1;

        term11= x4 * h2;
        term15= x5 * h2;
        term12= x5 * h3;
        term16= x[j+2]*h3;

        sum1 += term1 + term2 + term3 + term4;
        sum2 += term5 + term6 + term7 + term8;
        sum3 += term9 + term10+ term11+term12;
        sum4 += term13+ term14+ term15+term16;

        if (l >= nh)
        {
            _amem8_f2((void *)(y + k    )) = _ftof2(sum2, sum1);
            _amem8_f2((void *)(y + k + 2)) = _ftof2(sum4, sum3);
            k += 4;
            j -= nhm4;
            l = 0;
            sum1 = 0;
            sum2 = 0;
            sum3 = 0;
            sum4 = 0;
        
        }
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_fir_gen.c                                        */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */


