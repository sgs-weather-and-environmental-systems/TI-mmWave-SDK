/* ======================================================================= */
/* DSP_iir.h -- Real IIR Filter                                            */
/*              Intrinsic C Implementation                                 */
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

#ifndef DSP_IIR_H_
#define DSP_IIR_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup FILTCONV */
/* @{ */

/** @defgroup  DSP_iir */
/** @ingroup DSP_iir */
/* @{ */

/**
 *      This real IIR computes nr real output samples using 4 Autoregressive 
 *      filter coefficients and 5 Moving-average filter coefficients.     
 *      It operates on 16-bit data with a 32-bit accumulate. The implementation
 *      is done in Direct Form I, for the below difference equation <BR> 
 *
 *      r1(n) =  h2(0) * x(n)                     <BR> 
 *             + h2(1) * x(n-1) - h1(1) * r1(n-1) <BR> 
 *             + h2(2) * x(n-2) - h1(2) * r1(n-2) <BR> 
 *             + h2(3) * x(n-3) - h1(3) * r1(n-3) <BR> 
 *             + h2(4) * x(n-4) - h1(4) * r1(n-4) <BR>  
 *
 *         @param r1    Pointer to real output data used.
 *         @param x     Pointer to real input data. 
 *         @param r2    Pointer to real output data stored. 
 *         @param h2    Pointer to 5 Moving-average real filter coefficients.
 *         @param h1    Pointer to 4 Autoregressive real filter coefficients.                                 
 *         @param nr    Holds the value of number of real output samples.
 *
 * @par Algorithm:
 * DSP_iir_cn.c is the natural C equivalent of the optimized intrinsic C code without
 * restrictions. Note that the intrinsic C code is optimized and restrictions may
 * apply.  
 * 
 * @par Assumptions:
 *     Arrays x, h1, h2, r1 and r2 do not overlap <BR>                              
 *     x  must point to x[nr-4] <BR>
 *     h1 points to h1[0], h1[0] is not used, all the coefficients are real <BR>
 *     h2 points to h2[0], all the coefficietns are real <BR>
 *     r1 must point to r1[nr-4], current response depends on previous 4 responses <BR>
 *     r2 must point to r2[0], such that r1[4+i] = r2[nr], for i = 0 to nr; <BR>
 *     nr >= 1;  <BR>            
 *
 * @par Implementation Notes:
 * @b Interruptibility : The code is interruptible.
 * @b Endian support   : supports both Little and Big endian modes.
 *
 */

void DSP_iir (
    short *r1,        /* Pointer to real output data used/stored */ 
    const short *x,   /* Pointer to real input data */
    short *r2,        /* Pointer to real output data stored */
    const short *h2,  /* Pointer to 5 Moving-average real filter coefficients */
    const short *h1,  /* Pointer to 4 Autoregressive real filter coefficients */
    int nr            /* Holds the value of number of real output samples */
);

#endif /* DSP_IIR_H_ */

/* ======================================================================= */
/*  End of file:  DSP_iir.h                                                */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

