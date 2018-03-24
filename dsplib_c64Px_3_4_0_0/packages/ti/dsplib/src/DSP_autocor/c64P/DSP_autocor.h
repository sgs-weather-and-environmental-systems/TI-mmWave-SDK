/* ======================================================================= */
/*  NAME                                                                   */
/*      DSP_autocor -- Autocorrelation                                     */
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

#ifndef DSP_AUTOCOR_H_
#define DSP_AUTOCOR_H_ 1

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup CORRELATION */
/* @{ */

/** @defgroup DSP_autocor */
/** @ingroup DSP_autocor */
/* @{ */

/**
 *        This routine performs an autocorrelation of an input vector      
 *        x. The length of the autocorrelation is nx samples. Since nr      
 *        such autocorrelations are performed, input vector x needs to be   
 *        of length nx + nr. This produces nr output results which are      
 *        stored in an output array r.                                      
 *                                                                          
 *        The following diagram illustrates how the correlations are        
 *        obtained.                                                         
 *                                                                          
 *        Example for nr=8, nx=24: <BR>                                           
 *        0       nr                  nx+nr-1 <BR>                                
 *        |-------|----------------------|  <- x[]  <BR>                         
 *        |       |----------------------|  -> r[0] <BR>                         
 *        |      |----------------------|   -> r[1] <BR>                         
 *        |     |----------------------|    -> r[2] <BR>                         
 *        |    |----------------------|     -> r[3] <BR>                         
 *        |   |----------------------|      -> r[4] <BR>                         
 *        |  |----------------------|       -> r[5] <BR>                         
 *        | |----------------------|        -> r[6] <BR>                         
 *                                                                          
 *        Note that x[0] is never used, but is required for padding to make 
 *        x[nr] double-word aligned.
 *  
 * 			@param r = Output data array of shorts
 * 			@param x = Input data array of shorts
 * 			@param nx = Length of autocorrelation
 * 			@param nr = Number of lags
 * 
 * @par Algorithm:
 * DSP_autocor_cn.c is the natural C equivalent of the optimized intrinsic 
 * C code without restrictions note that the intrinsic C code is optimized 
 * and restrictions may apply.
 * 
 * @par Assumptions:
 * 		The first nr elements are assumed to be zero. <BR> 
 *    NX >= 8;    NX % 8 == 0 <BR>                                            
 *    NR >= 4;    NR % 4 == 0 <BR> 
 * 		x[] must be double word alligned <BR> 
 * 
 * @par Implementation notes:
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 * @b Interruptibility: The code is interruptible. <BR>
 * 
 */
 
 /* }@ */ /* ingroup */
 /* }@ */ /* ingroup */


void DSP_autocor (
    short *restrict r,
    const short *restrict x,
    int nx,
    int nr
);

#endif

/* ======================================================================== */
/*  End of file:  DSP_autocor.h                                             */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

