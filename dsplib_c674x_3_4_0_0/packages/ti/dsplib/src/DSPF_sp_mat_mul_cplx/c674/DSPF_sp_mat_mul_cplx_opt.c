/* ======================================================================= */
/* DSPF_sp_mat_mul_cplx_opt.c -- Complex Matrix Multiply                   */
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

#pragma CODE_SECTION(DSPF_sp_mat_mul_cplx_opt, ".text:intrinsic");

void DSPF_sp_mat_mul_cplx_opt(const float* x1, int r1, int c1, const float* x2, 
                              int c2, float* restrict y)
{
    float real1 = 0, imag1 = 0, real2 = 0, imag2 = 0;
    int i = 0, j = 0, k = 8 * c2, imax = r1 * c2 * c1 / 2;
    const float *x11 = x1, *x21;
    double x11_1_0, x21_1_0, x21_3_2;
    float x11_1, x11_0, x21_3, x21_2, x21_1, x21_0;

    _nassert((int)x1 % 8 == 0);
    _nassert((int)x2 % 8 == 0);
    _nassert(c1 >= 2);
    _nassert(r1 >= 1);
    _nassert(c2 >= 1);

    x2 = x2 + 2 * c2;
    x21 = (float *)( (int)x2 - k );
    
    #pragma MUST_ITERATE(1,,)
    for(i = 0; i < imax; i++)
    {
       x11_1_0 = _amemd8((void *)x11);
       x21_1_0 = _amemd8((void *)x21);
       x21_3_2 = _amemd8((void *)(x21 + 2));

       x11_0 = _itof(_lo(x11_1_0));
       x11_1 = _itof(_hi(x11_1_0));
       x21_0 = _itof(_lo(x21_1_0));
       x21_1 = _itof(_hi(x21_1_0));
       x21_2 = _itof(_lo(x21_3_2));
       x21_3 = _itof(_hi(x21_3_2));

       real1 += (x11_0 * x21_0) - (x11_1 * x21_1);
       imag1 += x11_0 * x21_1  + x11_1 * x21_0;       // Accumulate the products
       real2 += (x11_0 * x21_2) - (x11_1 * x21_3);      
       imag2 += x11_0 * x21_3  + x11_1 * x21_2;       // Accumulate the products

       x21 += 2 * c2;
       x11 += 2;

       if (++j >= c1)
       {
           j = 0;
           *y++ = real1;                              // Store the result
           *y++ = imag1; 
           *y++ = real2;
           *y++ = imag2;   
           real1=0;                                   // Initialise the accumulator
           imag1=0;  
           real2=0;
           imag2=0;   
           
           k -= 16;

           if (k == 0)                                // Chaeck for end of one row
           {
               k = 8 * c2;                            // Initialise for next row
               x1 += 2 * c1;                          // Update x to start of next row
           }

           x21 = (float *)((int)x2 - k);              // Update x2 pointer
           x11 = x1;                                  // Update x11 for next row
        }    
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_mat_mul_cplx_opt.c                               */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

