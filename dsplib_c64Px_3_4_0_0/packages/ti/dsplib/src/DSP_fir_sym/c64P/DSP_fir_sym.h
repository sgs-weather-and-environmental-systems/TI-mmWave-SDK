/* ======================================================================= */
/* DSP_fir_sym.h -- Symmetric FIR Filter                                   */
/*                  Optimized C Implementation (w/ Intrinsics)             */
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

#ifndef DSP_FIR_SYM_H_
#define DSP_FIR_SYM_H_ 1

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSP_fir_sym */
/** @ingroup DSP_fir_sym */
/* @{ */

/**
 *     This function applies a symmetric filter to the input samples. 
 *     The filter tap array h[] provides ‘nh+1’ total filter taps. 
 *     The filter tap at h[nh] forms the center point of the filter. 
 *     The taps at h[nh - 1] through h[0] form a symmetric filter 
 *     about this central tap. The effective filter length is thus 
 *     2*nh+1 taps. The filter is performed on 16-bit data with 16-bit 
 *     coefficients, accumulating intermediate results to 40-bit precision.
 *     The accumulator is rounded and truncated according to the value 
 *     provided in ‘s’. This allows a variety of Q-points to be used.
 *                                                                         
 *      @param  x   =  Input array [nr+2*nh elements]
 *      @param  h   =  Coeff array [nh+1 elements]      
 *      @param  r   =  Output array [nr elements] 
 *      @param  nh  =  Number of coefficients
 *      @param  nr  =  Number of output samples       
 *      @param  s   =  Number of insignificant digits to truncate
 *                     e.g., 15 for Q.15 input data and coefficients
 *
 * @par Algorithm:
 * DSP_fir_sym_cn.c is the natural C equivalent of the optimized intrinsic C 
 * code without restrictions. Note that the intrinsic C code is optimized
 * and restrictions may apply.  
 *
 * @par Assumptions:
 *     Arrays x, h, and r do not overlap. <BR>                    
 *     x, h and r must be double word aligned. <BR>
 *     nr >= 4; nr % 4 == 0. <BR>               
 *     nh >= 4; nh % 4 == 0. <BR> 
 *
 * @par Implementation Notes:
 * @b Endian Support: The code supports both big and little endian modes. 
 * @b Interruptibility: The code is interruptible
 *
 */

void DSP_fir_sym (
    const short *restrict x,    /* Input samples                   */
    const short *restrict h,    /* Filter taps                     */
    short       *restrict r,    /* Output samples                  */
    int nh,                     /* Number of symmetric filter taps */
    int nr,                     /* Number of output samples        */
    int s                       /* Final output shift              */
);

#endif /* DSP_FIR_SYM_H_ */

/* ======================================================================= */
/*  End of file:  DSP_fir_sym.h                                            */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

