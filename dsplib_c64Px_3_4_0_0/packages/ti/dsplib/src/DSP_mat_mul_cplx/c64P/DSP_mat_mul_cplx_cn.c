/* ======================================================================= */
/* DSP_mat_mul_cplx_cn.c -- Perform Matrix Multiplication                  */
/*                     Natural C Implementation                            */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  USAGE                                                                  */
/*      This routine is C-callable and can be called as:                   */
/*                                                                         */
/*          void DSP_mat_mul_cplx_cn (                                     */
/*              const short *restrict x, int r1, int c1r2,                 */
/*              const short *restrict y,         int c2,                   */
/*              short       *restrict r,                                   */
/*              int                   qs                                   */
/*          );                                                             */
/*                                                                         */
/*      x  == Pointer to r1 by c1 input matrix.                            */
/*      y  == Pointer to r2 by c2 input matrix.                            */
/*      r  == Pointer to r1 by c2 output matrix.                           */
/*                                                                         */
/*      r1   == Number of rows in x.                                       */
/*      c1r2 == Number of columns in x.  Also number of rows in y.         */
/*      c2   == Number of columns in y.                                    */
/*                                                                         */
/*      qs == Final right-shift to apply to the result.                    */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      This function computes the expression "r = x * y" for the          */
/*      matrices x and y.  The columnar dimension of x must match          */
/*      the row dimension of y.  The resulting matrix has the same         */
/*      number of rows as x and the same number of columns as y.           */
/*                                                                         */
/*      The values stored in the matrices are assumed to be fixed-point    */
/*      or integer values.  All intermediate sums are retained to 32-bit   */
/*      precision, and no overflow checking is performed.  The results     */
/*      are right-shifted by a user-specified amount, and then truncated   */
/*      to 16 bits.                                                        */
/*                                                                         */
/*      This code is suitable for dense matrices.  No optimizations are    */
/*      made for sparse matrices.                                          */
/*                                                                         */
/*  ASSUMPTIONS                                                            */
/*      The arrays 'x', 'y', and 'r' are stored in distinct arrays.  That  */
/*      is, in-place processing is not allowed.                            */
/*                                                                         */
/*      The input matrices have minimum dimensions of at least 1 row and   */
/*      1 column, and no more than 32767 rows or 32767 columns.            */
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

#pragma CODE_SECTION(DSP_mat_mul_cplx_cn, ".text:ansi");

#include "DSP_mat_mul_cplx_cn.h"

void DSP_mat_mul_cplx_cn (
    const short *restrict x, int r1, int c1r2,
    const short *restrict y,         int c2,
    short       *restrict r,
    int                   qs
)
{
    int i, j, k;
    int sum_re, sum_im;

    /* -------------------------------------------------------------------- */
    /*  Multiply each row in x by each column in y.  The product of row m   */
    /*  in x and column n in y is placed in position (m,n) in the result.   */
    /* -------------------------------------------------------------------- */
    for (i = 0; i < r1*2; i+=2) {
        for (j = 0; j < c2*2; j+=2) {
            for (k = 0, sum_re = 0, sum_im = 0; k < c1r2*2; k+=2) {
                sum_re += x[k+1 + i*c1r2] * y[j+1 + k*c2] - x[k + i*c1r2] * y[j + k*c2]; 
                sum_im += x[k+1 + i*c1r2] * y[j + k*c2] + x[k + i*c1r2] * y[j+1 + k*c2];
            }
            r[j   + i*c2] = sum_im >> qs;
            r[j+1 + i*c2] = sum_re >> qs;
        }
    }
}

/* ======================================================================== */
/*  End of file:  DSP_mat_mul_cplx_cn.c                                     */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */

