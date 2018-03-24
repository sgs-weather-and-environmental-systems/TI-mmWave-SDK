/* ======================================================================= */
/* DSPF_sp_mat_mul_cplx.h -- Complex Matrix Multiply                       */
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

#ifndef DSPF_SP_MAT_MUL_CPLX_H_
#define DSPF_SP_MAT_MUL_CPLX_H_

/** @ingroup MATRIX */
/* @{ */

/** @defgroup  DSPF_sp_mat_mul_cplx */
/** @ingroup DSPF_sp_mat_mul_cplx */
/* @{ */

/**
 *      This function computes the expression “y = x1*x2?for the matrices
 *      x1 and x2. The columnar dimension of x1 must match the row dimension 
 *      of x2. The resulting matrix has the same number of rows as x1 and the
 *      same number of columns as x2. Each element of Matrices are assumed to 
 *      be complex numbers with real values are stored in even word positions
 *      and imaginary values in odd positions.
 *
 *      @param x1[2*r1*c1]  Input matrix containing r1*c1 complex floating-point numbers 
 *      @param r1           Number of rows in matrix x1. 
 *      @param c1           Number of columns in matrix x1. Also number of rows in matrix x2. 
 *      @param x2[2*c1*c2]  Input matrix containing c1*c2 complex floating-point 
 *      @param c2           Number of columns in matrix x2. 
 *      @param y[2*r1*c2]   Output matrix of c1*c2 complex floating-point numbers 
 *
 * @par Algorithm:
 * DSPF_sp_mat_mul_cplx.c is the natural C equivalent of the optimized intrinsic
 * C code withoutrestrictions. Note that the intrinsic C code is optimized
 * and restrictions may apply.  
 *
 * @par Assumptions:
 *    r1, c1, c2 are multiple of 2. <BR>
 *    x1, x2 and y should be double-word aligned. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility : The code is interruptible. <BR>
 * @b Endian support   : supports both Little and Big endian modes. <BR>
 *
 */

void DSPF_sp_mat_mul_cplx(const float* x1, int r1, int c1, const float* x2, 
                          int c2, float* restrict y);

void DSPF_sp_mat_mul_cplx_opt(const float* x1, int r1, int c1, const float* x2, 
                          int c2, float* restrict y);

#endif /* DSPF_SP_MAT_MUL_CPLX_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_mat_mul_cplx.h                                   */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

