/* ======================================================================= */
/* DSPF_sp_convol.c -- Convolution                                         */
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

#pragma CODE_SECTION(DSPF_sp_convol, ".text:optimized");

#include "DSPF_sp_convol.h"
#ifdef __TI_COMPILER_VERSION__
#include "c6x.h"
#endif

void DSPF_sp_convol(const float *x, const float *h,
    float *restrict y, const short nh, const short ny)
{
    int   i, j;
    float sum1, sum2; //, sum3, sum4;
    float a0, a1, a2, /*a3, a4,*/ b0, b1;
    const float *temp1;
    const float *temp2;

    _nassert(nh % 2 == 0);
    _nassert(nh > 2);
    _nassert(ny % 2 == 0);
    _nassert(ny > 0);
    _nassert((int)x % 8 == 0);
    _nassert((int)y % 8 == 0);

    temp2 = h + nh - 2;
    #pragma MUST_ITERATE(1,,)
    for (i = 0 ; i < ny ; i+=2)
    {
        /*sum3 = sum4 =*/ sum1 = sum2 = 0;     /* zero the accumulator */
        temp1 = x + i;

        #pragma MUST_ITERATE(1,,)
        //#pragma UNROLL(1);
        for (j = 0 ; j < nh ; j += 2)
        {  
            b0 = _hif2(_amem8_f2( (void *)(temp2 - j) ) );
            b1 = _lof2(_amem8_f2( (void *)(temp2 - j) ) );
            a0 = _lof2(_amem8_f2( (void *)(temp1 + j) ) );
            a1 = _hif2(_amem8_f2( (void *)(temp1 + j) ) );
            a2 = _lof2(_amem8_f2( (void *)(temp1 + j + 2) ) );
            //a3 = _itof(_hi( _amemd8( (void *)(temp1 + j + 2) ) ));
            //a4 = temp1[j + 4];

            sum1 += a0 * b0;
            sum1 += a1 * b1;
            sum2 += a1 * b0;
            sum2 += a2 * b1;
            //sum3 += a2 * b0;
            //sum3 += a3 * b1;
            //sum4 += a3 * b0;
            //sum4 += a4 * b1;    
        }

        // store y[0] through y[ny-1]
        _amem8_f2((void*)&y[i]) = _ftof2(sum2, sum1);
        //y[i + 1] = sum2;
        //y[i + 2] = sum3;
        //y[i + 3] = sum4;
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_convol.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

