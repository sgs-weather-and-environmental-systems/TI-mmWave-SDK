/* ======================================================================= */
/* DSPF_sp_fir_cplx.h -- Complex FIR Filter                                */
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

#ifndef DSPF_SP_FIR_CPLX_H_
#define DSPF_SP_FIR_CPLX_H_

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSPF_sp_fir_cplx */
/** @ingroup DSPF_sp_fir_cplx */
/* @{ */

/**
 *   This function implements the FIR filter for complex input data. 
 *   The filter has nr output samples and nh coefficients. Each array 
 *   consists of an even and odd term with even terms representing the 
 *   real part and the odd terms the imaginary part of the element. 
 *   The coefficients are expected in normal order.
 *                                                                           
 *     @param x[2*(nr+nh-1)]  Pointer to complex input array. 
 *                            The input data pointer x must point to 
 *                            the (nh)th complex element.
 *     @param h[2*nh]         Pointer to complex coefficient array.
 *     @param r[2*nr]         Pointer to complex output array.
 *     @param nh              Number of complex coefficients in vector h.
 *     @param nr              Number of complex output samples to calculate.
 *
 * @par Algorithm:
 * DSPF_sp_fir_cplx_cn.c is the natural C equivalent of the optimized
 * linear assembly code without restrictions. Note that the linear
 * assembly code is optimized and restrictions may apply.  
 * 
 * @par Assumptions:
 *    nr is a multiple of 2 and greater than or equal to 2. <BR>
 *    nh is a multiple of 2 and greater than or equal to 5. <BR>
 *    x, h and r are double-word aligned. <BR>
 *    x points to 2*(nh-1)th input element. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interruptible. <BR>
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 *
 */

void DSPF_sp_fir_cplx(const float * x, const float * h,
    float * restrict y, int nh, int nr);

void DSPF_sp_fir_cplx_opt(const float * x, const float * h,
    float * restrict y, int nh, int ny);

#endif /* DSPF_SP_FIR_CPLX_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_fir_cplx.h                                       */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

