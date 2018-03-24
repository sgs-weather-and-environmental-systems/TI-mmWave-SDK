/* ======================================================================= */
/* DSPF_sp_fircirc.h -- Circular FIR Filter                                */
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

#ifndef DSPF_SP_FIRCIRC_H_
#define DSPF_SP_FIRCIRC_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSPF_sp_fircirc */
/** @ingroup DSPF_sp_fircirc */
/* @{ */

/**
 *   This routine implements a circularly addressed FIR filter. ‘nh’ is the 
 *   number of filter coefficients. ‘nr’ is the number of the output samples.
 *                                                                           
 *     @param x[]   Input array (circular buffer of 2^(csize+1) bytes). 
 *     @param h[nh] Filter coefficients array. Must be double-word aligned.
 *     @param y[ny] Output array
 *     @param index Offset by which to start reading from the input array. 
 *     @param csize Size of circular buffer x[] is 2^(csize+1) bytes.
 *     @param nh    Number of filter coefficients.
 *     @param ny    Number of output samples
 *
 * @par Algorithm:
 * DSPF_sp_fircirc_cn.c is the natural C equivalent of the optimized
 * linear assembly code without restrictions. Note that the linear
 * assembly code is optimized and restrictions may apply.  
 * 
 * @par Assumptions:
 *  The circular input buffer x[] must be aligned at a 2^(csize+1) byte boundary. <BR>
 *  h and y must be aligned at double word boundary. <BR>
 *  csize must lie in the range 2 <= csize <= 31. <BR>
 *  The number of coefficients (nh) must be a multiple of 2 and >= 4. <BR>
 *  The number of outputs (nr) must be a multiple of 4 and >= 4. <BR>
 *  The 'index' (offset to start reading input array) must be mutiple of 2. <BR>
 *  The coefficient array is assured to be in reverse order; i.e., h(nh-1) to h(0). <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility: The code is interruptible. <BR>
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 *
 */

void DSPF_sp_fircirc(const float *x, float *h, float *restrict y,
                     int index, int csize, int nh, int ny);

#endif /* DSPF_SP_FIRCIRC_H_ */

/* ======================================================================= */
/*  End of file:  DSPF_sp_fircirc.h                                        */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

