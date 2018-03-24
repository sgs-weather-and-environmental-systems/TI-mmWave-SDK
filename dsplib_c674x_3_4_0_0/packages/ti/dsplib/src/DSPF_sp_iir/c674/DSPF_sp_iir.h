/* ======================================================================= */
/* DSPF_sp_iir.h -- IIR Filter                                             */
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

#ifndef DSPF_SP_IIR_H_
#define DSPF_SP_IIR_H_

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSPF_sp_iir */
/** @ingroup DSPF_sp_iir */
/* @{ */

/**
 *   The IIR performs an auto-regressive moving-average (ARMA) filter with 4
 *   auto-regressive filter coefficients and 5 moving-average filter coefficients
 *   for nr output samples. The output vector is stored in two locations. This
 *   routine is used as a high pass filter in the VSELP vocoder. The 4 values 
 *   in the r1 vector store the initial values of the delays.
 *                                                                           
 *     @param y1[nr+4]  Delay element values (i/p and o/p).
 *     @param x[nr]     Pointer to the input array.
 *     @param y2[nr+4]  Pointer to the output array.
 *     @param hb[5]     Auto-regressive filter coefficients.
 *     @param ha[5]     Moving average filter coefficients.
 *     @param nr        Number of output samples.
 *
 * @par Algorithm:
 * DSPF_sp_iir_cn.c is the natural C equivalent of the optimized
 * linear assembly code without restrictions. Note that the linear
 * assembly code is optimized and restrictions may apply.  
 * 
 * @par Assumptions:
 *    The value of ‘nr’ must be a multiple of 2. <BR>
 *    Extraneous loads are allowed in the program. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interruptible.
 * @b Endian Support: The code supports both big and little endian modes. 
 *
 */

void DSPF_sp_iir (float* restrict y1,
    const float* x,
    float* restrict y2,
    const float* hb,
    const float* ha,
    int nr);

void DSPF_sp_iir_opt (float *restrict y1,
    const float * x,
    float *restrict y2,
    const float * hb,
    const float * ha,
    int nr);

#endif /* DSPF_SP_IIR_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_iir.h                                            */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

