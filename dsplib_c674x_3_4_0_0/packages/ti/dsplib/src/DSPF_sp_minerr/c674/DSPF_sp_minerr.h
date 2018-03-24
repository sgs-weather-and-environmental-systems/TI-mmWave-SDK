/* ======================================================================= */
/* DSPF_sp_minerr.h -- Vocoder Codebook Search                             */
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

#ifndef DSPF_SP_MINERR_H_
#define DSPF_SP_MINERR_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup MATH */
/* @{ */

/** @defgroup  DSPF_sp_minerr */
/** @ingroup DSPF_sp_minerr */
/* @{ */

/**
 *  Performs a dot product on 256 pairs of 9 element vectors and searches for the
 *  pair of vectors which produces the maximum dot product result. This is a large
 *  part of the VSELP vocoder codebook search. The function stores the index to
 *  the first element of the 9-element vector that resulted in the maximum dot product
 *  in the memory location Pointed by max_index. The maximum dot product
 *  value is returned by the function.
 *                                                                           
 *         @param GSP0_TABLE[256*9] GSP0 terms array.
 *         @param errCoefs[9]       Array of error coefficients. Must be double-word aligned.
 *         @param max_index         Index to GSP0_TABLE[max_index], the first element of the 9-element 
 *                                  vector that resulted in the maximum dot product. 
 *
 * @par Algorithm:
 * DSPF_sp_maxval_cn.c is the natural C equivalent of the optimized
 * linear assembly code without restrictions. Note that the linear
 * assembly code is optimized and restrictions may apply.  
 * 
 * @par Assumptions:
 *   errCoefs must be double-word aligned <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interruptible. <BR> 
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 *
 */

float DSPF_sp_minerr(const float* GSP0_TABLE,
    const float* errCoefs, int *restrict max_index);

#endif /* DSPF_SP_MINERR_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_minerr.h                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

