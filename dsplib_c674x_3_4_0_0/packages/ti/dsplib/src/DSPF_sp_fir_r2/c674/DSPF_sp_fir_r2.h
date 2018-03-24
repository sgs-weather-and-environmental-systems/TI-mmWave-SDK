/* ======================================================================= */
/* DSPF_sp_fir_r2.h -- FIR Filter                                          */
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

#ifndef DSPF_SP_FIR_R2_H_
#define DSPF_SP_FIR_R2_H_

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSPF_sp_fir_r2 */
/** @ingroup DSPF_sp_fir_r2 */
/* @{ */

/**
 *   Computes a real FIR filter (direct-form) using coefficients stored in 
 *   vector h[]. The real data input is stored in vector x[]. The filter 
 *   output result is stored in vector r[]. The filter calculates nr output 
 *   samples using nh coefficients. The coefficients are expected to be in 
 *   reverse order.
 *                                                                           
 *     @param x[nr+nh-1]  Pointer to input array of size nr+nh-1.
 *     @param h[nh]       Pointer to coefficient array of size nh (in reverse order).
 *     @param r[nr]       Pointer to output array of size nr.
 *     @param nh          Number of coefficents
 *     @param nr          Number of output samples
 *
 * @par Algorithm:
 * DSPF_sp_fir_r2_cn.c is the natural C equivalent of the optimized
 * linear assembly code without restrictions. Note that the linear
 * assembly code is optimized and restrictions may apply.  
 * 
 * @par Assumptions:
 *   nr is a multiple of 2 and greater than or equal to 2. <BR>
 *   nh is a multiple of 2 and greater than or equal to 8. <BR>
 *   x, h and r are double-word aligned. <BR>
 *   Coefficients in array h are expected to be in reverse order. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interruptible. <BR>
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 *
 */

void DSPF_sp_fir_r2(const float * x, const float * h,
    float *restrict r, const int nh, const int nr);

void DSPF_sp_fir_r2_opt(const float * x, const float * h,
    float *restrict y, const int nh, const int ny);

#endif /* DSPF_SP_FIR_R2_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_fir_r2.h                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

