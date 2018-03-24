/* ======================================================================= */
/* DSP_fft16x16r.h -- 16x16r Mixed Radix FFT                               */
/*                    Serial ASM Implementation                            */
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

#ifndef DSP_FFT16X16R_H_
#define DSP_FFT16X16R_H_ 1

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup FFT */
/* @{ */

/** @defgroup DSP_fft16x16r */
/** @ingroup DSP_fft16x16r */
/* @{ */

/**
 *      This routine implements a complex forward mixed radix FFT 
 *      with scaling, rounding and digit reversal. Input data x[ ], 
 *      output data y[ ], and coefficients w[ ] are 16-bit. The output 
 *      is returned in the separate array y[ ] in normal order. Each 
 *      complex value is stored as interleaved 16-bit real and imaginary 
 *      parts. The code uses a special ordering of FFT coefficients
 *      (also called twiddle factors).
 *
 *      This redundant set of twiddle factors is size 2*N short samples.
 *      As pointed out in subsequent sections, dividing these twiddle 
 *      factors by 2 will give an effective divide by 4 at each stage 
 *      to guarantee no overflow. The function is accurate to about 68dB 
 *      of signal to noise ratio to the DFT function as follows.
 *
 *          @param  n      = length of fft in complex samples
 *          @param  ptr_x  = pointer to complex data input
 *          @param  ptr_w  = pointer to complex twiddle factor
 *          @param  ptr_y  = pointer to complex data output
 *          @param  radix  = smallest fft butterfly used in computation
 *          @param  offset = index in complex samples of sub-fft from start of main fft
 *          @param  n_max  = size of main fft in complex samples
 *
 * @par Algorithm:
 * DSP_fft16x16r_cn.c is the natural C equivalent of the optimized intrinsic
 * C code without restrictions. Note that the intrinsic C code is optimized
 * and restrictions may apply.  
 * 
 * @par Assumptions:
 *     In-place computation is not allowed. <BR>                            
 *     Size of FFT, nx, must be power of 2 and 16<=nx<=65536. <BR>                                 
 *     The arrays for the complex input data x[], complex output data y[]
 *        and twiddle factor w[] must be double word aligned. <BR>
 *     The input and output data are complex, with the real/imaginary 
 *        components stored in adjacent locations in the array.  The real
 *        components are stored at even array indices, and the imaginary 
 *        components are stored at odd array indices. <BR>
 *     All data are in short precision or Q.15 format. Allowed input 
 *        dynamic range is 16 - (log2(nx)-ceil[log4(nx)-1]). <BR>                    
 *
 * @par Implementation Notes:
 *    The intrinsic optimized C code supports both big and little endian modes. <BR> 
 *    The linear assembly code supports little endian mode only. <BR> 
 * @b Interruptibility: The code is interruptible. <BR>
 *
 */

void DSP_fft16x16r (
    int n,
    short * restrict ptr_x,
    const short * restrict ptr_w,
    short * restrict ptr_y,
    int radix,
    int offset,
    int n_max
);

#endif

/* ======================================================================== */
/*  End of file:  DSP_fft16x16r.h                                           */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

