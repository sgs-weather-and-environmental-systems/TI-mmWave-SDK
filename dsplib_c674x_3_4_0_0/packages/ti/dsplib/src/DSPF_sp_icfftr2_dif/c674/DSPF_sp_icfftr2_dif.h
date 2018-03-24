/* ======================================================================= */
/* DSPF_sp_icfftr2_dif.h -- Complex Inverse FFT with Radix 2 and DIF       */
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

#ifndef DSPF_SP_ICFFTR2_DIF_H_
#define DSPF_SP_ICFFTR2_DIF_H_

/** @ingroup FFT */
/* @{ */

/** @defgroup DSPF_sp_icfftr2_dif */
/** @ingroup DSPF_sp_icfftr2_dif */
/* @{ */

/**
 *   This routine is used to compute the inverse, complex, radix-2, decimation-infrequency
 *   Fast Fourier Transform of a single-precision complex sequence of
 *   size n, and a power of 2. The routine requires bit-reversed input and bit-reversed
 *   coefficents (twiddle factors) and produces results that are in normal order.
 *                                                                           
 *         @param x Input and output sequences (dim-n) (input/output) x has n complex numbers (2*n SP values). The real and imaginary
 *                   values are interleaved in memory. The input is in bit-reversed order nad output is in normal order.
 *         @param w FFT coefficients (dim-n/2) (input) w has n/2 complex numbers (n SP values). FFT coeficients must be in
 *                   bit-reversed order. The real and imaginary values are interleaved in memory.
 *         @param n FFT size (input).
 *
 * @par Algorithm:
 * DSPF_sp_icfftr2_dif_cn.c is the natural C equivalent of the optimized linear assembly code without
 * restrictions. Note that the linear assembly code is optimized and restrictions may
 * apply.  
 * 
 * @par Assumptions:
 *    Both input x and coefficient w should be aligned on double-word boundary. <BR>
 *    x should be padded with 4 words. <BR>
 *    n should be greater than 8. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interrupt-tolerant but not interruptible. <BR>
 * @b Endian Support: The code supports both big and little endian modes. <BR>
 *
 */

void DSPF_sp_icfftr2_dif(float* x, float* w, unsigned short n);

/* @} */ /* ingroup */
/* @} */ /* ingroup */

#endif /* DSPF_SP_ICFFTR2_DIF_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_icfftr2_dif.h                                    */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */
