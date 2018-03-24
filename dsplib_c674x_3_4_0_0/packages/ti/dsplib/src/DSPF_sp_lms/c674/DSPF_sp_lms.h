/* ======================================================================= */
/* DSPF_sp_lms.h -- LMS Adaptive Filter                                    */
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

#ifndef DSPF_SP_LMS_H_
#define DSPF_SP_LMS_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup ADAPTIVEFILTER */
/* @{ */

/** @defgroup DSPF_sp_lms2 */
/** @ingroup DSPF_sp_lms2 */
/* @{ */

/**
 *     The DSPF_sp_lms implements an LMS adaptive filter. Given an actual input
 *     signal and a desired input signal, the filter produces an output signal,
 *     the final coefficient values, and returns the final output error signal.
 *  
 * 			@param x      Pointer to input samples
 * 			@param h      Pointer to the coefficient array
 * 			@param y_i    Pointer to the desired output array
 * 			@param y_o    Pointer to filtered output array
 * 			@param ar     Adaptation rate
 * 			@param error  Initial error
 * 			@param nh     Number of coefficients
 * 			@param nx     Number of output samples
 *
 * @par Algorithm:
 *  DSPF_sp_lms2_cn.c is the natural C equivalent of the optimized 
 *  intrinsic C code without restrictions note that the intrinsic 
 *  C code is optimized and restrictions may apply.
 *
 * @par Assumptions: 
 *     nh must be a multiple of 2 and >= 2. <BR>
 *     The coefficient array is assumed to be in reverse order; i.e., h(nh-1),
 *      h(nh-2), ..., h(0) will hold coefficients h0, h1, ..., hnh-1, repectively. <BR>
 *
 * @par Implementation notes:
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 * @b Interruptibility: The code is interruptible. <BR>
 *  
 */
 
 /* }@ */ /* ingroup */
 /* }@ */ /* ingroup */

float DSPF_sp_lms(const float *x, float *restrict h, const float *y_i,
    float *restrict y_o, const float ar, float error, const int nh, const int nx);

#endif /* DSPF_SP_LMS_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_lms.h                                            */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

