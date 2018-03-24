/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  DSPLIB  DSP Signal Processing Library                                  */
/*                                                                         */
/*  This library contains proprietary intellectual property of Texas       */
/*  Instruments, Inc.  The library and its source code are protected by    */
/*  various copyrights, and portions may also be protected by patents or   */
/*  other legal protections.                                               */
/*                                                                         */
/*  This software is licensed for use with Texas Instruments TMS320        */
/*  family DSPs.  This license was provided to you prior to installing     */
/*  the software.  You may review this license by consulting the file      */
/*  TI_license.PDF which accompanies the files in this library.            */
/*                                                                         */
/* ----------------------------------------------------------------------- */
/*                                                                         */
/* DSP_mat_mul_cplx.c -- Perform Matrix Multiplication                     */
/*                  Intrinsic C Implementation                             */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  USAGE                                                                  */
/*      This routine is C-callable and can be called as:                   */
/*                                                                         */
/*          void DSP_mat_mul_cplx (                                        */
/*              const short *restrict x, int r1, int c1,                   */
/*              const short *restrict y,         int c2,                   */
/*              short       *restrict r,                                   */
/*              int                   qs                                   */
/*          );                                                             */
/*                                                                         */
/*      x  == Pointer to r1 by c1 input matrix.                            */
/*      y  == Pointer to c1 by c2 input matrix.                            */
/*      r  == Pointer to r1 by c2 output matrix.                           */
/*                                                                         */
/*      r1 == Number of rows in x.                                         */
/*      c1 == Number of columns in x.  Also number of rows in y.           */
/*      c2 == Number of columns in y.                                      */
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
/*  Requirements:                                                          */
/*  R1   min = 4, Factor 2                                                 */
/*  c1   min = 4, Factor 2                                                 */
/*  C2   min = 4, Factor 2                                                 */
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

#pragma CODE_SECTION(DSP_mat_mul_cplx, ".text:optimized");

#include "DSP_mat_mul_cplx.h"

/* For fixed-size implementation, use these defines */
/* #define FIXED_SIZES */
/* #define SIZE (16)   */

#ifdef _LITTLE_ENDIAN
void DSP_mat_mul_cplx (
    const short *restrict x, int r1, int c1,
    const short *restrict y,         int c2,
    short       *restrict r,
    int                   qs
)
{
    int i, j, k;
    int sum_re0, sum_im0, sum_re1, sum_im1, sum_re2, sum_im2, sum_re3, sum_im3;
    int nbR1, nbC1R2, nbC2;
  
#ifdef FIXED_SIZES
    nbR1 = SIZE;
    nbC1R2 = SIZE;
    nbC2 = SIZE;
  
    _nassert(r1 == SIZE);
    _nassert(c1 == SIZE);
    _nassert(c2 == SIZE);
#else
    nbR1 = r1;
    nbC1R2 = c1;
    nbC2 = c2;
#endif

    /* -------------------------------------------------------------------- */
    /*  Multiply each row in x by each column in y.  The product of row m   */
    /*  in x and column n in y is placed in position (m,n) in the result.   */
    /* -------------------------------------------------------------------- */
    _nassert((int)x % 8 == 0);
    _nassert((int)y % 8 == 0);
    _nassert((int)r % 8 == 0);
    _nassert(nbR1 % 2 == 0);
    _nassert(nbR1 >= 4);

    for (i = 0; i < nbR1*2; i+=4) {

        _nassert(nbC2 % 2 == 0);
        _nassert(nbC2 >= 4);

        for (j = 0; j < nbC2*2; j+=4) {
            sum_re0 = 0; sum_im0 = 0;
            sum_re1 = 0; sum_im1 = 0;
            sum_re2 = 0; sum_im2 = 0;
            sum_re3 = 0; sum_im3 = 0;

            _nassert(nbC1R2 % 2 == 0);
            _nassert(nbC1R2 >= 4);

            for (k = 0; k < nbC1R2*2; k+=4) {

                long long tmp0_x0x1, tmp0_y0y1, tmp1_x0x1, tmp1_y0y1;
                long long tmp_p0, tmp_p1, tmp_p2, tmp_p3, tmp_p4, tmp_p5, tmp_p6, tmp_p7;
                tmp0_x0x1 = _amem8((void*)&x[k + i*nbC1R2]);
                tmp1_x0x1 = _amem8((void*)&x[k + ((i+2)*nbC1R2)]);
                tmp0_y0y1 = _amem8((void*)&y[j + k*nbC2]);
                tmp1_y0y1 = _amem8((void*)&y[j + ((k+2)*nbC2)]);
                
                tmp_p0    = _cmpy(_loll(tmp0_x0x1), _loll(tmp0_y0y1));
                tmp_p1    = _cmpy(_hill(tmp0_x0x1), _loll(tmp1_y0y1));
                tmp_p2    = _cmpy(_loll(tmp0_x0x1), _hill(tmp0_y0y1));
                tmp_p3    = _cmpy(_hill(tmp0_x0x1), _hill(tmp1_y0y1)); 
                tmp_p4    = _cmpy(_loll(tmp1_x0x1), _loll(tmp0_y0y1));
                tmp_p5    = _cmpy(_hill(tmp1_x0x1), _loll(tmp1_y0y1));
                tmp_p6    = _cmpy(_loll(tmp1_x0x1), _hill(tmp0_y0y1));
                tmp_p7    = _cmpy(_hill(tmp1_x0x1), _hill(tmp1_y0y1));

                sum_re0   = sum_re0 + _hill(tmp_p0) + _hill(tmp_p1);
                sum_im0   = sum_im0 + _loll(tmp_p0) + _loll(tmp_p1);
                sum_re1   = sum_re1 + _hill(tmp_p2) + _hill(tmp_p3);
                sum_im1   = sum_im1 + _loll(tmp_p2) + _loll(tmp_p3);
                sum_re2   = sum_re2 + _hill(tmp_p4) + _hill(tmp_p5);
                sum_im2   = sum_im2 + _loll(tmp_p4) + _loll(tmp_p5);
                sum_re3   = sum_re3 + _hill(tmp_p6) + _hill(tmp_p7);
                sum_im3   = sum_im3 + _loll(tmp_p6) + _loll(tmp_p7);

            }
            _amem8((void*)&r[j + i*nbC2])     = _itoll(_pack2(sum_re1 >> qs, sum_im1 >> qs), 
                                                       _pack2(sum_re0 >> qs, sum_im0 >> qs));
            _amem8((void*)&r[j + (i+2)*nbC2]) = _itoll(_pack2(sum_re3 >> qs, sum_im3 >> qs),
                                                       _pack2(sum_re2 >> qs, sum_im2 >> qs));
        }
    }
}
/*-----------------------------------------------------------*/
/*  Big Endian version                                       */
/*-----------------------------------------------------------*/
#else
void DSP_mat_mul_cplx (
    const short *restrict x, int r1, int c1,
    const short *restrict y,         int c2,
    short       *restrict r,
    int                   qs
)
{
    int i, j, k;
    int sum_re0, sum_im0, sum_re1, sum_im1, sum_re2, sum_im2, sum_re3, sum_im3;
    int nbR1, nbC1R2, nbC2;
  
#ifdef FIXED_SIZES
    nbR1 = SIZE;
    nbC1R2 = SIZE;
    nbC2 = SIZE;
  
    _nassert(r1 == SIZE);
    _nassert(c1 == SIZE);
    _nassert(c2 == SIZE);
#else
    nbR1 = r1;
    nbC1R2 = c1;
    nbC2 = c2;
#endif

    /* -------------------------------------------------------------------- */
    /*  Multiply each row in x by each column in y.  The product of row m   */
    /*  in x and column n in y is placed in position (m,n) in the result.   */
    /* -------------------------------------------------------------------- */
    _nassert((int)x % 8 == 0);
    _nassert((int)y % 8 == 0);
    _nassert((int)r % 8 == 0);
    _nassert(nbR1 % 2 == 0);
    _nassert(nbR1 >= 4);

    for (i = 0; i < nbR1*2; i+=4) {

        _nassert(nbC2 % 2 == 0);
        _nassert(nbC2 >= 4);

        for (j = 0; j < nbC2*2; j+=4) {
            sum_re0 = 0; sum_im0 = 0;
            sum_re1 = 0; sum_im1 = 0;
            sum_re2 = 0; sum_im2 = 0;
            sum_re3 = 0; sum_im3 = 0;

            _nassert(nbC1R2 % 2 == 0);
            _nassert(nbC1R2 >= 4);

            for (k = 0; k < nbC1R2*2; k+=4) {

                long long tmp0_x1x0, tmp0_y1y0, tmp1_x1x0, tmp1_y1y0;
                long long tmp_p0, tmp_p1, tmp_p2, tmp_p3, tmp_p4, tmp_p5, tmp_p6, tmp_p7;

                tmp0_x1x0   = _amem8((void*)&x[k + i*nbC1R2]);
                tmp1_x1x0   = _amem8((void*)&x[k + ((i+2)*nbC1R2)]);
                tmp0_y1y0   = _amem8((void*)&y[j + k*nbC2]);
                tmp1_y1y0   = _amem8((void*)&y[j + ((k+2)*nbC2)]);
                
                tmp_p0      = _cmpy(_loll(tmp0_x1x0), _hill(tmp1_y1y0));
                tmp_p1      = _cmpy(_hill(tmp0_x1x0), _hill(tmp0_y1y0));
                tmp_p2      = _cmpy(_loll(tmp0_x1x0), _loll(tmp1_y1y0));
                tmp_p3      = _cmpy(_hill(tmp0_x1x0), _loll(tmp0_y1y0)); 
                tmp_p4      = _cmpy(_loll(tmp1_x1x0), _hill(tmp1_y1y0));
                tmp_p5      = _cmpy(_hill(tmp1_x1x0), _hill(tmp0_y1y0));
                tmp_p6      = _cmpy(_loll(tmp1_x1x0), _loll(tmp1_y1y0));
                tmp_p7      = _cmpy(_hill(tmp1_x1x0), _loll(tmp0_y1y0));

                sum_im0     =  sum_im0 + _hill(tmp_p0) + _hill(tmp_p1);
                sum_re0     =  sum_re0 + _loll(tmp_p0) + _loll(tmp_p1);
                sum_im1     =  sum_im1 + _hill(tmp_p2) + _hill(tmp_p3);
                sum_re1     =  sum_re1 + _loll(tmp_p2) + _loll(tmp_p3);
                sum_im2     =  sum_im2 + _hill(tmp_p4) + _hill(tmp_p5);
                sum_re2     =  sum_re2 + _loll(tmp_p4) + _loll(tmp_p5);
                sum_im3     =  sum_im3 + _hill(tmp_p6) + _hill(tmp_p7);
                sum_re3     =  sum_re3 + _loll(tmp_p6) + _loll(tmp_p7);

            }
            _amem8((void*)&r[j + i*nbC2])     = _itoll(_pack2(sum_re0 >> qs, (-sum_im0) >> qs), 
                                                       _pack2(sum_re1 >> qs, (-sum_im1) >> qs));
            _amem8((void*)&r[j + (i+2)*nbC2]) = _itoll(_pack2(sum_re2 >> qs, (-sum_im2) >> qs),
                                                       _pack2(sum_re3 >> qs, (-sum_im3) >> qs));
        }
    }
}
#endif
/* ======================================================================== */
/*  End of file:  DSP_mat_mul_cplx.c                                        */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

