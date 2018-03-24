/* ======================================================================= */
/* DSPF_sp_fir_cplx_opt.c -- Complex FIR Filter                            */
/*                 Optimized C Implementation with Intrinsics              */
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

#pragma CODE_SECTION(DSPF_sp_fir_cplx_opt, ".text:intrinsic");

void DSPF_sp_fir_cplx_opt(const float * x, const float * h,
    float * restrict y, int nh, int ny)
{
    float re1, re2, re3, re4, im1, im2, im3, im4, sumRe1, sumRe2, sumIm1, sumIm2;
    int i, j = 0, k = 0, l = 0;

    _nassert(nh > 0);
    _nassert(ny > 0);
    _nassert(ny % 2 == 0);
    //_nassert((int)x % 8 == 0);    // may not be true; x points to 2 * (nh - 1) element
    _nassert((int)h % 8 == 0);

    sumRe1 = 0;
    sumIm1 = 0;
    sumRe2 = 0;
    sumIm2 = 0;

    #pragma MUST_ITERATE(2,,)
    for (i = 0; i < nh * ny; i+=2)
    {
        re1 = x[j] * h[l];
        re2 = x[j+1] * h[l+1];
        im1 = x[j] * h[l+1];
        im2 = x[j+1] * h[l];

        re3 = x[j+2] * h[l];
        re4 = x[j+3] * h[l+1];
        im3 = x[j+2] * h[l+1];
        im4 = x[j+3] * h[l];

        sumRe1 += re1 - re2;
        sumIm1 += im1 + im2;
        sumRe2 += re3 - re4;
        sumIm2 += im3 + im4;

        j -= 2;
        l += 2 ;

        if (l >= nh * 2)
        {
            y[k++] = sumRe1;
            y[k++] = sumIm1;
            y[k++] = sumRe2;
            y[k++] = sumIm2;
            j += (nh + 2) * 2;
            l = 0;
            sumRe1 = 0;
            sumIm1 = 0;
            sumRe2 = 0;
            sumIm2 = 0;
        }
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_fir_cplx_opt.c                                   */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

