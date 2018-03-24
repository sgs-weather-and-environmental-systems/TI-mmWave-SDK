/* ======================================================================= */
/* DSP_irr_lat.h -- IIR Lattice Filter                                     */
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

#ifndef DSP_IIR_LAT_H_
#define DSP_IIR_LAT_H_ 1

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSP_iir_lat */
/** @ingroup DSP_iir_lat */
/* @{ */

/**
 *      This routine implements a real all-pole IIR filter in lattice  
 *      structure (AR lattice). The filter consists of nk lattice stages.  
 *      Each stage requires one reflection coefficient k and one delay     
 *      element b. The routine takes an input vector x[] and returns the   
 *      filter output in r[]. Prior to the first call of the routine the   
 *      delay elements in b[] should be set to zero. The input data may    
 *      have to be pre-scaled to avoid overflow or achieve better SNR. The 
 *      reflections coefficients lie in the range -1.0 < k < 1.0. The      
 *      order of the coefficients is such that k[nk-1] corresponds to the  
 *      first lattice stage after the input and k[0] corresponds to the    
 *      last stage.                                                        
 *                                                                         
 *
 *      @param  x[nx]   = Input vector (16-bit)                                    
 *      @param  nx      = Length of input vector.                                  
 *      @param  k[nk]   = Reflection coefficients in Q.15 format                   
 *      @param  nk      = Number of reflection coefficients/lattice stages         
 *      @param  b[nk+1] = Delay line elements from previous call. Should be        
 *                        initialized to all zeros prior to the first call.        
 *      @param  r[nx]   = Output vector (16-bit)   
 *
 * @par Algorithm:
 * DSP_iir_lat_cn.c is the natural C equivalent of the optimized intrinsic
 * C code withoutrestrictions. Note that the intrinsic C code is optimized
 * and restrictions may apply.  
 *
 * @par Assumptions:
 *    There are no assumptions. <BR>
 *
 * @par Implementation Notes:
 * @b Interruptibility : The code is interruptible. <BR>
 * @b Endian support   : supports both Little and Big endian modes. <BR>
 *
 */

void DSP_iir_lat (
    short       *x,
    int         nx,
    const short *restrict k,
    int         nk,
    int         *restrict b,
    short       *r
);

#endif /* DSP_IIR_LAT_H_ */

/* ======================================================================= */
/*  End of file:  DSP_iir_lat.h                                            */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

