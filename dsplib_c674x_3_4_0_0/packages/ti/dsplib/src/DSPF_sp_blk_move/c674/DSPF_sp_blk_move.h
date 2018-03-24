/* ======================================================================= */
/* DSPF_sp_blk_move.h -- Move a block of memory                            */
/*                   Intrinsic C Implementation                            */
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

#ifndef DSPF_sp_BLK_MOVE_H_
#define DSPF_sp_BLK_MOVE_H_ 1

#ifndef __TI_COMPILER_VERSION__           // for non TI compiler
#include "assert.h"                       // intrinsics prototypes
#include "C6xSimulator.h"                 // intrinsics prototypes
#include "C6xSimulator_type_modifiers.h"  // define/undefine typing keywords
#endif

/** @ingroup MISC */
/* @{ */

/** @defgroup DSPF_sp_blk_move */
/** @ingroup DSPF_sp_blk_move */
/* @{ */

/**
 *     This routine moves nx float elements from one memory location pointed to
 *     by x to another pointed to by y. The source and destination blocks can be
 *     overlapped.
 * 
 *      @param x  = Block of data to be moved
 *      @param y  = Destination of block of data
 *      @param nx = Number of elements in block
 * 
 * @par Algorithm:
 * DSPF_sp_blk_move.c is the natural C equivalent of the optimized intrinsic C code 
 * without restrictions note that the intrinsic C code is optimized and 
 * restrictions may apply.
 * 
 * @par Assumptions:
 *    nx must be a multiple of 4 and greater than or equal to 4. <BR>
 *    x and y must be double word aligned. <BR>
 * 
 * @par Implementation notes:
 * @b Endian Support: The code supports both big and little endian modes. <BR> 
 * @b Interruptibility: The code is interruptible. <BR> 
 * 
 */
 
 /* }@ */ /* ingroup */
 /* }@ */ /* ingroup */

void DSPF_sp_blk_move(const float * x, float *restrict y, const int n);

#endif

/* ======================================================================== */
/*  End of file:  DSPF_sp_blk_move.h                                        */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

