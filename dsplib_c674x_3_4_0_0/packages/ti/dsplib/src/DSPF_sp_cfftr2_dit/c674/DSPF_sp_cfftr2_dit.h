/* ======================================================================= */
/* DSPF_sp_cfftr2_dit.h -- Complex Forward FFT with Radix 2 and DIT        */
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

#ifndef DSPF_SP_CFFTR2_DIT_H_
#define DSPF_SP_CFFTR2_DIT_H_

/** @ingroup FFT */
/* @{ */

/** @defgroup DSPF_sp_cfftr2_dit */
/** @ingroup DSPF_sp_cfftr2_dit */
/* @{ */

/**
 *   This routine performs the decimation-in-time (DIT) radix-2 FFT of the input
 *   array x. x has N complex floating-point numbers arranged as successive real
 *   and imaginary number pairs. Input array x contains N complex points (N*2 elements).
 *   The coefficients for the FFT are passed to the function in array w which
 *   contains N/2 complex numbers (N elements) as successive real and imaginary
 *   number pairs. The FFT coefficients w are in N/2 bit-reversed order The
 *   elements of input array x are in normal order The assembly routine performs
 *   4 output samples (2 real and 2 imaginary) for a pass through inner loop.
 *                                                                           
 *         @param x Pointer to complex data input.
 *         @param w Pointer to complex twiddle factor in bit-reverse order.
 *         @param n Length of FFT in complex samples, power of 2 such that n>=32.
 *
 * @par Algorithm:
 * DSPF_sp_cfftr2_dit_cn.c is the natural C equivalent of the optimized linear assembly code without
 * restrictions. Note that the linear assembly code is optimized and restrictions may
 * apply.  
 * 
 * @par Assumptions:
 *     N needs to be power of 2 and N >= 32 <BR>
 *     x, and w should be align on the double-word boundary <BR>
 *     The FFT Coefficients w are in bit-reversed order <BR>
 *     The elements of input array x are in normal order <BR>
 *     The imaginary coefficients of w are negated as {cos(d*0), sin(d*0),
 *     cos(d*1), sin(d*1) ...} as opposed to the normal sequence of {cos(d*0),
 *     -sin(d*0), cos(d*1), -sin(d*1) ...} where d = 2*PI/n. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interrupt-tolerant but not interruptible. <BR>
 * @b Endian Support: The code supports both big and little endian modes. <BR>
 *
 */

void DSPF_sp_cfftr2_dit(float* x, float* w, unsigned short n);

/* @} */ /* ingroup */
/* @} */ /* ingroup */

#endif /* DSPF_SP_CFFTR2_DIT_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_cfftr2_dit.h                                     */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */
