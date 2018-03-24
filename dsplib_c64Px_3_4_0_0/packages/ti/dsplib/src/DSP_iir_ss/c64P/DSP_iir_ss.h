/* ======================================================================= */
/* DSP_iir_ss.h -- IIR Filter                                              */
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

#ifndef DSP_IIR_SS_H_
#define DSP_IIR_SS_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSP_iir_ss */
/** @ingroup DSP_iir_ss */
/* @{ */

/**
 *      This function implements an IIR filter, with a number of biquad    
 *      stages given by nCoefs / 4. It accepts a single sample of          
 *      input and returns a single sample of output. Coefficients are      
 *      expected to be in the range [-2.0, 2.0) with Q14 precision.                                                     
 *                                                                         
 *      @param  Input   = Single sample input
 *      @param  Coefs   = Coefficients with Q14 precision
 *      @param  nCoefs  = Number of coefficients
 *      @param  State   = State
 *
 * @par Algorithm:
 * DSP_iir_ss_cn.c is the natural C equivalent of the optimized intrinsic C code without
 * restrictions. Note that the intrinsic C code is optimized and restrictions may
 * apply.  
 *
 * @par Assumptions:
 *    Coefs and State are double word aligned. <BR>
 *    nCoefs is a multiple of 4 and >= 4. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility : The code is interruptible. <BR>
 * @b Endian support   : supports both Little and Big endian modes. <BR>
 *
 */

short DSP_iir_ss (
    short                 Input,
    const short *restrict Coefs,
    int                   nCoefs,
    short       *restrict State
);

#endif /* DSP_IIR_SS_H_ */

/* ======================================================================= */
/*  End of file:  DSP_iir_ss.h                                             */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

