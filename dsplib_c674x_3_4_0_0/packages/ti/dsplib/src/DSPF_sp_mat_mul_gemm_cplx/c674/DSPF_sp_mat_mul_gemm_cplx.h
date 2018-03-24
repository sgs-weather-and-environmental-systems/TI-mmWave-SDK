/* ======================================================================= */
/* DSPF_sp_mat_mul_gemm_cplx.h -- Comeplex Matrix Multiply y = a*x1*x2+y   */
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

#ifndef DSPF_SP_MAT_MUL_GEMM_CPLX_H_
#define DSPF_SP_MAT_MUL_GEMM_CPLX_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup MATRIX */
/* @{ */

/** @defgroup  DSPF_sp_mat_mul_gemm_cplx */
/** @ingroup DSPF_sp_mat_mul_gemm_cplx */
/* @{ */

/**
 *      This function computes the expression y = a*x1*x2+y. The column 
 *      dimension of x1 must match the row dimension of x2.
 *      The values stored in the matrices are assumed to be double-precision 
 *      floating-point values. This code is suitable for 
 *      dense matrices. No optimizations are made for sparse matrices.
 *
 *     @param  x1 Pointer to r1 by c1 input matrix.
 *     @param  a  Scalar value.
 *     @param  r1 Number of rows in x1.
 *     @param  c1 Number of columns in x1. Also number of rows in x2.
 *     @param  x2 Pointer to c1 by c2 input matrix.
 *     @param  c2 Number of columns in x2.
 *     @param  y  Pointer to r1 by c2 output matrix.
 *
 * @par Algorithm:
 * DSPF_dp_mat_mul_gemm.c is the natural C equivalent of the optimized intrinsic
 * C code withoutrestrictions. Note that the intrinsic C code is optimized
 * and restrictions may apply.  
 *
 * @par Assumptions:
 *  The arrays x1, x2 and y are stored in distinct arrays.
 *  That is, in-place processing is not allowed. <BR>
 *  r1, c2 are assumed to be even. c1 is assumed to be an integer multiple of 4. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility : The code is interruptible.  <BR>
 * @b Endian support   : supports little endian mode.  <BR>
 *
 */

void DSPF_sp_mat_mul_gemm_cplx(float *restrict x1, float const a, const int r1, const int c1,
    float *restrict x2, const int c2, float *restrict y);

#endif /* DSPF_SP_MAT_MUL_GEMM_CPLX_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_mat_mul_gemm_cplx.h                              */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

