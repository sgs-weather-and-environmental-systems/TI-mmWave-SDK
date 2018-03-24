/* ======================================================================= */
/* DSP_minerror.h -- Minimum Energy Error Search                           */
/*                   Optimized C Implementation (w/ Intrinsics)            */
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

#ifndef DSP_MINERROR_H_
#define DSP_MINERROR_H_

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup MISC */
/* @{ */

/** @defgroup DSP_minerror */
/** @ingroup DSP_minerror */
/* @{ */

/**
 *      Returns Maximum dot product result
 * 
 * 			@param GSP0_TABLE[9*256] = GSP0 terms array. Must be double-word aligned
 *      @param errCoefs[9]       = Array of error coefficients
 * 			@param max_index         = Pointer to GSP0_TABLE[max_index] found
 * 
 * @par Algorithm:
 * DSP_minerror_cn.c is the natural C equivalent of the optimized intrinsic
 * C code without restrictions note that the intrinsic C code is optimized
 * and restrictions may apply.
 *
 * @par Assumptions:
 * 		Array GSP0_TABLE[] must be double-word aligned. <BR>
 * 
 * @par Implementation notes:
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 * @b Interruptibility: The code is interruptible. <BR> 
 * 
 */
 
 /* }@ */ /* ingroup */
 /* }@ */ /* ingroup */

int DSP_minerror (
    const short *restrict GSP0_TABLE,  /* Pointer to GSP0 terms array         */
    const short *restrict errCoefs,    /* Array of error coefficients         */
    int *restrict max_index            /* Index to the 9-element vector that  */
                                       /* resulted in the maximum dot product */
);

#endif /* DSP_MINERROR_H_ */

/* ======================================================================= */
/*  End of file:  DSP_minerror.h                                           */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

