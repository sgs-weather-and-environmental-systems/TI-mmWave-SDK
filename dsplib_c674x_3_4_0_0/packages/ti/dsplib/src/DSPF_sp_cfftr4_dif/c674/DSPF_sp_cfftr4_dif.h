/* ======================================================================= */
/* DSPF_sp_cfftr4_dif.h -- Complex Forward FFT with Radix 4 and DIF        */
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

#ifndef DSPF_SP_CFFTR4_DIF_H_
#define DSPF_SP_CFFTR4_DIF_H_

/** @ingroup FFT */
/* @{ */

/** @defgroup DSPF_sp_cfftr4_dif */
/** @ingroup DSPF_sp_cfftr4_dif */
/* @{ */

/**
 *   This routine implements the DIF (decimation in frequency) complex radix 4
 *   FFT with digit-reversed output and normal order input. The number of points,
 *   ‘n’, must be a power of 4 {4, 16, 64, 256, 1024, ...}. This routine is an in-place
 *   routine in the sense that the output is written over the input. It is not an in-place
 *   routine in the sense that the input is in normal order and the output is in digit-reversed
 *   order. There must be n complex points (2*n values), and 3*n/4 complex coefficients
 *   (3*n/2 values).
 *                                                                           
 *         @param x Pointer to an array holding the input and output floating-point array which contains ‘n’ complex points.
 *         @param w Pointer to an array holding the coefficient floating-point array which contains 3*n/4 complex numbers.
 *         @param n Number of complex points in x.
 *
 * @par Algorithm:
 * DSPF_sp_cfftr4_dif_cn.c is the natural C equivalent of the optimized linear assembly code without
 * restrictions. Note that the linear assembly code is optimized and restrictions may
 * apply.  
 * 
 * @par Assumptions:
 *     N needs to be power of 4 <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interrupt-tolerant but not interruptible. <BR>
 * @b Endian Support: The code supports both big and little endian modes. <BR>
 *
 */

void DSPF_sp_cfftr4_dif(float* x, float* w, unsigned short n);

/* @} */ /* ingroup */
/* @} */ /* ingroup */

#endif /* DSPF_SP_CFFTR4_DIF_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_cfftr4_dif.h                                     */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */
