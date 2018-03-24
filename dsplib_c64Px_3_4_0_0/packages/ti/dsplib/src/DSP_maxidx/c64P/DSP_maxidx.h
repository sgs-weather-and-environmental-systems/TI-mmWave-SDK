/* ======================================================================= */
/* DSP_maxidx.h -- Maximum Vector Value                                    */
/*                 Intrinsic C Implementation                              */
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

#ifndef DSP_MAXIDX_H_
#define DSP_MAXIDX_H_ 1

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup MATH */
/* @{ */

/** @defgroup DSP_maxidx */
/** @ingroup DSP_maxidx */
/* @{ */

/**
 *     This routine finds the max value of a vector and returns the 
 *     index of that value. The input array is treated as 16 separate 
 *     columns that are interleaved throughout the array. If values in 
 *     different columns are equal to the maximum value, then the 
 *     element in the leftmost column is returned. If two values within
 *     a column are equal to the maximum, then the one with the lower 
 *     index is returned. Column takes precedence over index.
 *     return int Index for vector element with maximum value.
 *
 * 			@param x = Pointer to input vector of size nx. Must be double-word aligned
 * 			@param nx = Length of input data vector. Must be multiple of 16 and >=48
 * 
 * @par Algorithm:
 * DSP_maxidx_cn.c is the natural C equivalent of the optimized intrinsic 
 * C code without restrictions note that the intrinsic C code is optimized
 * and restrictions may apply.
 *
 * @par Assumptions: 
 *     nx must be a multiple of 16 and greater than or equal to 32
 *     The input vector x[ ] must be double-word aligned
 *
 * @par Implementation notes:
 * @b Endian Support: The code supports both big and little endian modes. 
 * @b Interruptibility: The code is interruptible.
 *  
 */

int DSP_maxidx (
    const short *x,
    int          nx
);

#endif

/* ======================================================================== */
/*  End of file:  DSP_maxidx.h                                              */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

