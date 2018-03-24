/* ======================================================================= */
/* DSP_fir_cplx_hM4X4.h -- Complex FIR Filter                              */
/*                         Optimized C Implementation (w/ Intrinsics)      */
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

#ifndef DSP_FIR_CPLX_HM4X4_H_
#define DSP_FIR_CPLX_HM4X4_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSP_fir_cplx_hM4X4 */
/** @ingroup DSP_fir_cplx_hM4X4 */
/* @{ */

/**
 *      This complex FIR computes nr complex output samples using nh       
 *      complex coefficients. It operates on 16-bit data with a 32-bit     
 *      accumulate. Each array consists of an even and odd term with even  
 *      terms representing the real part of the element and the odd terms  
 *      the imaginary part. The pointer to input array x must point to the 
 *      (nh)th complex sample, i.e. element 2*(nh-1), upon entry to the   
 *      function. The coefficients are expected in normal order.          
 *
 *         @param x       Complex input data. x must point to x[2*(nh-1)].
 *         @param h       Complex coefficients (in normal order). h must point to h[2*nh].
 *         @param r       Complex output data. r must point to r[2*nr].
 *         @param nh      Number of complex coefficients.
 *         @param nr      Number of complex output samples.
 *
 * @par Algorithm:
 * DSP_fir_cplx_hM4X4_cn.c is the natural C equivalent of the optimized
 * intrinsic C code without restrictions. Note that the intrinsic C code
 * is optimized and restrictions may apply.  
 *
 * @par Assumptions:
 *     Arrays x, h, and r do not overlap <BR>                              
 *     nr >= 4; nr % 4 == 0 <BR>                                                
 *     nh >= 4; nh % 4 == 0 <BR>                                               
 *
 * @par Implementation Notes:
 * @b Endian Support: The code supports both big and little endian modes. 
 * @b Interruptibility: The code is interruptible
 */

void DSP_fir_cplx_hM4X4 (
    const short *restrict x,    /* Input array [nr+nh-1 elements] */
    const short *restrict h,    /* Coeff array [nh elements]      */
    short       *restrict r,    /* Output array [nr elements]     */
    int nh,                     /* Number of coefficients         */
    int nr                      /* Number of output samples       */
);

#endif /* DSP_FIR_CPLX_HM4X4_H_ */

/* ======================================================================= */
/*  End of file:  DSP_fir_cplx_hM4X4.h                                     */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

