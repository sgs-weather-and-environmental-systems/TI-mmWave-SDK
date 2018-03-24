/* ======================================================================= */
/* DSPF_sp_fir_r2_opt.c -- FIR Filter                                      */
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

#pragma CODE_SECTION(DSPF_sp_fir_r2_opt, ".text:intrinsic");

void DSPF_sp_fir_r2_opt(const float * x, const float * h,
    float *restrict y, const int nh, const int ny)
{
    int i, j;
    float sum1, sum2;

    _nassert((int)x % 8 == 0);
    _nassert((int)h % 8 == 0);
    _nassert(nh >= 4);
    _nassert(nh % 2 == 0);
    _nassert(ny >= 2);
    _nassert(ny % 2 == 0);
   
    #pragma MUST_ITERATE(1,,)
    for (j = 0; j < ny; j += 2) 
    {
        sum1 = 0;
        sum2 = 0;

        #pragma MUST_ITERATE(2,,)
        for (i = 0; i < nh; i += 2)
        {
            sum1 += x[i + j] * h[i];
            sum2 += x[i + j + 1] * h[i];
            
            sum1 += x[i + j + 1] * h[i + 1];
            sum2 += x[i + j + 2] * h[i + 1];
        }

        // store the results
        y[j]     = sum1;
        y[j + 1] = sum2;
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_fir_r2_opt.c                                     */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

