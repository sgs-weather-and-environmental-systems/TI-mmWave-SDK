/* ======================================================================= */
/* DSP_w_vec.h -- Weighted Vector Sum                                      */
/*                Intrinsic C Implementation                               */
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

#ifndef DSP_W_VEC_H_
#define DSP_W_VEC_H_ 1

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup MATH */
/* @{ */

/** @defgroup DSP_w_vec */
/** @ingroup DSP_w_vec */
/* @{ */

/**
 *     This routine is used to obtain the weighted vector sum.
*      Both the inputs and output are 16-bit numbers
 *  
 * 			@param x = Vector being weighted
 * 			@param y = Summation vector
 * 			@param m = Weighting factor
 * 			@param r = Output vector
 * 			@param nr = Dimensions of the vectors
 * 
 * @par Algorithm:
 * DSP_vecsumsq_cn.c is the natural C equivalent of the optimized intrinsic 
 * C code without restrictions note that the intrinsic C code is optimized
 * and restrictions may apply.
 *
 * @par Assumptions: 
 *     nr must be a multiple of 8 and >= 8. <BR>
 *     Vectors x[ ] y[ ] and r[ ] must be double-word aligned. <BR>
 *     m is not -32768. <BR>
 *
 * @par Implementation notes:
 * @b Endian Support: The code supports both big and little endian modes. <BR>
 * @b Interruptibility: The code is interruptible. <BR>
 *  
 */

void DSP_w_vec (
    const short * restrict x,   /* Vector being weighted  */
    const short * restrict y,   /* Non-weighted vector    */
    short m,                    /* weighting factor       */
    short * restrict r,         /* Result vector          */
    int nr                      /* Number of samples.     */
);

#endif

/* ======================================================================== */
/*  End of file:  DSP_w_vec.h                                               */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

