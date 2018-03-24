/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSPF_sp_fftSPXSP.sa -- Optimized linear assembly Implementation    */
/*                                                                         */
/*  USAGE                                                                  */
/*      single precision floating point Forward FFT with mixed radix       */
/*                                                                         */
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

#ifndef DSPF_SP_fftSPxSP_H_
#define DSPF_SP_fftSPxSP_H_

/** @ingroup FFT */
/* @{ */

/** @defgroup  DSPF_sp_fftSPXSP */
/** @ingroup DSPF_sp_fftSPXSP */
/* @{ */

/**
 *   The benchmark performs a mixed radix forwards fft.
 *                                                                           
 *         @param N         length of FFT in complex samples
 *         @param ptr_x     pointer to complex data input
 *         @param ptr_w     pointer to complex twiddle factor
 *         @param ptr_y     pointer to complex output data
 *         @param brev      pointer to bit reverse table containing 64 entries
 *         @param n_min     should be 4 if N can be represented as Power of 4 else, n_min should be 2
 *         @param offset    index in complex samples of sub-fft from start of main fft
 *         @param n_max     size of main fft in complex samples
 *
 * @par Algorithm:
 * DSPF_sp_fftSPxSP_cn.c is the natural C equivalent of the optimized linear assembly code without
 * restrictions. Note that the linear assembly code is optimized and restrictions may
 * apply.  
 * 
 * @par Assumptions:
 *     N needs to be power of 2 <BR>
 *     8 <= N <= 131072 <BR>
 *     Arrays pointed by ptr_x, ptr_w, and ptr_y should not overlap <BR>
 *     Arrays pointed by ptr_x, ptr_w, and ptr_y should align on the double words boundary <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interrupt-tolerant but not interruptible. <BR>
 * @b Endian Support: The code supports both big and little endian modes. <BR>
 *
 */

void DSPF_sp_fftSPxSP(int N, float *ptr_x, float *ptr_w, float *ptr_y, unsigned char *brev, int n_min, int offset, int n_max);

/* @} */ /* ingroup */
/* @} */ /* ingroup */

#endif /* DSPF_SP_fftSPxSP_H_ */
