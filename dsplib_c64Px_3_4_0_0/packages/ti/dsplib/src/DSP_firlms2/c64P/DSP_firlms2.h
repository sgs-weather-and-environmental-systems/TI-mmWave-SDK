/* ======================================================================= */
/* DSP_firlms2.h -- Least Mean Square Adaptive Filter                      */
/*                  Intrinsic C source                                     */
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

#ifndef DSP_FIRLMS2_H_
#define DSP_FIRLMS2_H_ 1

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup ADAPTIVEFILTER */
/* @{ */

/** @defgroup DSP_firlms2 */
/** @ingroup DSP_firlms2 */
/* @{ */

/**
 *     The Least Mean Square Adaptive Filter computes an update of all nh
 *     coefficients by adding the weighted error times the inputs to the original
 *     coefficients. The input array includes the last nh inputs followed by a new
 *     single sample input. The coefficient array includes nh coefficients.
 *  
 * 			@param h = Coefficient Array
 * 			@param x = Input array
 * 			@param b = Error from previous FIR
 * 			@param nh = Number of coefficients. Must be multiple of 4
 * 
 * @par Algorithm:
 *  DSP_firlms2_cn.c is the natural C equivalent of the optimized 
 *  intrinsic C code without restrictions note that the intrinsic 
 *  C code is optimized and restrictions may apply.
 *
 * @par Assumptions: 
 *     This routine assumes 16-bit input and output. <BR>
 *     The number of coefficients nh must be a multiple of 4. <BR>
 *
 * @par Implementation notes:
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 * @b Interruptibility: The code is interruptible. <BR>
 *  
 */
 
 /* }@ */ /* ingroup */
 /* }@ */ /* ingroup */

int DSP_firlms2 (
    short *restrict h,  /* Filter Coefficients */
    short *restrict x,  /* Input Data          */
    short           b,  /* Error from previous FIR */
    int             nh  /* Number of Coefficients  */
);

#endif /* DSP_FIRLMS2_H_ */

/* ======================================================================== */
/*  End of file:  DSP_firlms2.h                                             */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

