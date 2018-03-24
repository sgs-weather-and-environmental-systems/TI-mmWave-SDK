/* ======================================================================= */
/* DSP_mat_mul_gemm_cplx_cn.c -- Complex Matrix Multiply “y = a*x1*x2+y"   */
/*                 Natural C Implementation                                */
/*                                                                         */
/* Rev 0.0.2                                                               */
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

#pragma CODE_SECTION(DSPF_sp_mat_mul_gemm_cplx_cn, ".text:ansi");

#include "DSPF_sp_mat_mul_gemm_cplx_cn.h"

void DSPF_sp_mat_mul_gemm_cplx_cn(float *x1, float const a, const int r1, const int c1,
    float *x2, const int c2, float *y)
{
    int i, j, k;
    float real, imag;

    for (i = 0; i < r1; i++) {
      for (j = 0; j < c2; j++) {
        real = 0;
        imag = 0;
        for (k = 0; k < c1; k++)
          {
           real += (x1[2 * (i * c1 +  k)    ] * x2[2 * (c1 * j + k)    ]
                  - x1[2 * (i * c1 +  k) + 1] * x2[2 * (c1 * j + k) + 1]);
           imag += (x1[2 * (i * c1 +  k)    ] * x2[2 * (c1 * j + k) + 1]
                  + x1[2 * (i * c1 +  k) + 1] * x2[2 * (c1 * j + k)    ]);
          } 
        y[2 * (r1 * j + i)    ] = a * real;
        y[2 * (r1 * j + i) + 1] = a * imag;
      }
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_mat_mul_gemm_cplx_cn.c                           */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

