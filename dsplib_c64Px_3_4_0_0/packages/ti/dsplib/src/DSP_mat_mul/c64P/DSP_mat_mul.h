/* ======================================================================= */
/* DSP_mat_mul.h -- Perform Matrix Multiplication                          */
/*                  Intrinsic C Implementation                             */
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

#ifndef DSP_MAT_MUL_H_
#define DSP_MAT_MUL_H_ 1

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup MATRIX */
/* @{ */

/** @defgroup  DSP_mat_mul */
/** @ingroup DSP_mat_mul */
/* @{ */

/**
 *      This function computes the expression “r = x * y” for the matrices 
 *      x and y. The columnar dimension of x must match the row dimension of 
 *      y. The resulting matrix has the same number of rows as x and the same 
 *      number of columns as y. <BR>
 *      The values stored in the matrices are assumed to be fixed-point or integer
 *      values. All intermediate sums are retained to 32-bit precision, and no 
 *      overflow checking is performed. The results are right-shifted by a 
 *      user-specified amount, and then truncated to 16 bits. <BR>                                                                   
 *
 *      @param  x   = Pointer to input matrix of size r1*c1
 *      @param  r1  = Number of rows in matrix x
 *      @param  c1  = Number of columns in matrix x. Also number of rows in y
 *      @param  y   = Pointer to input matrix of size c1*c2
 *      @param  c2  = Number of columns in matrix y
 *      @param  r   = Pointer to output matrix of size r1*c2
 *      @param  qs  = Final right-shift to apply to the result
 *
 * @par Algorithm:
 * DSP_mat_mul.c is the natural C equivalent of the optimized intrinsic
 * C code withoutrestrictions. Note that the intrinsic C code is optimized
 * and restrictions may apply.  
 *
 * @par Assumptions:
 *    The arrays x[], y[], and r[] are stored in distinct arrays. <BR>
 *    That is, in-place processing is not allowed. <BR>
 *    x, y and r are double word aligned. <BR>
 *    c1 is a multiple of 2 and >= 2. <BR>
 *    c2 is a multiple of 4 and >= 4. <BR>
 *    r1 is a multiple of 2 and >= 2. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility : The code is interruptible. <BR>
 * @b Endian support   : supports both Little and Big endian modes. <BR>
 *
 */

void DSP_mat_mul (
    const short *restrict x, int r1, int c1,
    const short *restrict y,         int c2,
    short       *restrict r,
    int                   qs
);

#endif

/* ======================================================================== */
/*  End of file:  DSP_mat_mul.h                                             */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

