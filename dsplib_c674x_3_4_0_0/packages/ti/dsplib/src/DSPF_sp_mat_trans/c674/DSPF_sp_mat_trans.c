/* ======================================================================= */
/* DSPF_sp_mat_trans.c -- Matrix Transpose                                 */
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

#pragma CODE_SECTION(DSPF_sp_mat_trans, ".text:optimized");

#include "DSPF_sp_mat_trans.h"
#ifdef __TI_COMPILER_VERSION__
#include "c6x.h"
#endif

void DSPF_sp_mat_trans(const float *restrict x, const int rows,
                       const int cols, float *restrict y)
{
    int    i, j;
    __float2_t x_10, x_32;

    _nassert(rows >= 2);
    _nassert(cols >= 2);
    _nassert(rows % 2 == 0);
    _nassert(cols % 2 == 0);
    _nassert((int)x % 8 == 0);
    _nassert((int)y % 8 == 0);
  
    #pragma MUST_ITERATE(1,,)
    for(i = 0; i < rows; i+=2) {

        #pragma MUST_ITERATE(1,,)
        for(j = 0; j < cols; j+=2) {

            x_10 = _amem8_f2_const(&x[j + cols * i   ]);
            x_32 = _amem8_f2_const(&x[j + cols *(i+1)]);
            _amem8_f2(&y[rows * j    + i]) = _ftof2(_lof2(x_32), _lof2(x_10));
            _amem8_f2(&y[rows *(j+1) + i]) = _ftof2(_hif2(x_32), _hif2(x_10));
        }
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_mat_trans.c                                      */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

