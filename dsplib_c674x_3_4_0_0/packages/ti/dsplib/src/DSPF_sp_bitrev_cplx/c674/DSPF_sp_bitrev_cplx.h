/* ======================================================================= */
/* DSPF_sp_bitrev_cplx.h -- Complex Bit Reversal                           */
/*                 Assembly Implementation                                 */
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

#ifndef DSPF_SP_BITREV_CPLX_H_
#define DSPF_SP_BITREV_CPLX_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup FFT */
/* @{ */

/** @defgroup  DSPF_sp_bitrev_cplx */
/** @ingroup DSPF_sp_bitrev_cplx */
/* @{ */

/**
 *   This routine performs the bit-reversal of the input array x[], where x[] is a float
 *   array of length 2*nx containing single-precision floating-point complex pairs of
 *   data. This routine requires the index array provided by the program below. This
 *   index should be generated at compile time, not by the DSP. TI retains all rights,
 *   title and interest in this code and only authorizes the use of the bit-reversal
 *   code and related table generation code with TMS320 family DSPs manufactured
 *   by TI.
 *                                                                           
 *         @param x     Complex input array to be bit reversed. Contains 2*nx floats
 *         @param index Array of size ~sqrt(nx) created by the routine bitrev_index to
                         allow the fast implementation of the bit reversal
 *         @param nx    Number of elements in array x[]
 *
 * @par Algorithm:
 * DSPF_sp_bitrev_cplx_cn.c is the natural C equivalent of the optimized
 * linear assembly code without restrictions. Note that the linear
 * assembly code is optimized and restrictions may apply.  
 * 
 * @par Assumptions:
 *      nx must be a power of 2. <BR>
 *      The table from bitrev_index is already created. <BR>
 *      The array x is actually an array of 2*nx floats. <BR> 
 *      Array x is assumed to be double word aligned. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interruptible. <BR>
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 *
 */

void DSPF_sp_bitrev_cplx (double *restrict x, short *restrict index, int nx);

#endif /* DSPF_SP_BITREV_CPLX_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_bitrev_cplx.h                                    */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */
