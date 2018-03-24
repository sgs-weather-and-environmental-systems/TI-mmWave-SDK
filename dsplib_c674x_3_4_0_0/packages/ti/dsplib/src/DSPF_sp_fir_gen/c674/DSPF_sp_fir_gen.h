/* ======================================================================= */
/* DSPF_sp_fir_gen.h -- FIR Filter                                         */
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

#ifndef DSPF_SP_FIR_GEN_H_
#define DSPF_SP_FIR_GEN_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSPF_sp_fir_gen */
/** @ingroup DSPF_sp_fir_gen */
/* @{ */

/**
 *   This routine implements a block FIR filter. There are “nh” filter 
 *   coefficients, “nr” output samples, and “nh+nr-1” input samples. The 
 *   coefficients need to be placed in the “h” array in reverse order 
 *   {h(nh-1), ... , h(1), h(0)} and the array “x” starts at x(-nh+1) and 
 *   ends at x(nr-1). The routine calculates y(0) through y(nr-1) using 
 *   the following formula: <BR>
 *      y(n) = h(0)*x(n) + h(1)*x(n-1) + ... + h(nh-1)*x(n-nh+1) <BR>
 *      where n = {0, 1, ... , nr-1}. <BR>
 *                                                                           
 *     @param x   Pointer to array holding the input floating-point array
 *     @param h   Pointer to array holding the coefficient floating-point array
 *     @param r   Pointer to output array
 *     @param nh  Number of coefficents
 *     @param nr  Number of output values
 *
 * @par Algorithm:
 * DSPF_sp_fir_gen_cn.c is the natural C equivalent of the optimized
 * linear assembly code without restrictions. Note that the linear
 * assembly code is optimized and restrictions may apply.  
 * 
 * @par Assumptions:
 *    nr is a multiple of 4 and greater than or equal to 4. <BR>
 *    nh is a multiple of 4 and greater than or equal to 4. <BR>
 *    x, h and r are double-word aligned. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interruptible. <BR>
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 *
 */

void DSPF_sp_fir_gen(const float * restrict x,
    const float * restrict h,
    float * restrict r,
    int nh,
    int nr);

#endif /* DSPF_SP_FIR_GEN_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_fir_gen.h                                        */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

