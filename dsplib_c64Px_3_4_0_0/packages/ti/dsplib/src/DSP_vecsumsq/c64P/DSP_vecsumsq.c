/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  DSPLIB  DSP Signal Processing Library                                  */
/*                                                                         */
/*  This library contains proprietary intellectual property of Texas       */
/*  Instruments, Inc.  The library and its source code are protected by    */
/*  various copyrights, and portions may also be protected by patents or   */
/*  other legal protections.                                               */
/*                                                                         */
/*  This software is licensed for use with Texas Instruments TMS320        */
/*  family DSPs.  This license was provided to you prior to installing     */
/*  the software.  You may review this license by consulting the file      */
/*  TI_license.PDF which accompanies the files in this library.            */
/*                                                                         */
/* ----------------------------------------------------------------------- */
/*                                                                         */
/* DSP_vecsumsq.c -- Sum of Squares                                        */
/*                   Intrinsic C Implementation                            */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  USAGE                                                                  */
/*      This routine is C callable, and has the following C prototype:     */
/*                                                                         */
/*          int DSP_vecsum_sq (                                            */
/*              const short *x,    // Pointer to vector  //                */
/*              int          nx    // Length of vector.  //                */
/*          );                                                             */
/*                                                                         */
/*      This routine returns the sum of squares as its return value.       */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      The "vecsum_sq" function returns the sum of squares of the         */
/*      elements contained in vector "x".                                  */
/*                                                                         */
/*  C CODE                                                                 */
/*      The following C code is a general implementation without           */
/*      restrictions.  This implementation may have restrictions, as       */
/*      noted under "ASSUMPTIONS" below.                                   */
/*                                                                         */
/*          int DSP_vecsumsq (                                             */
/*              const short *x,    // Pointer to vector  //                */
/*              int          nx    // Length of vector.  //                */
/*          )                                                              */
/*          {                                                              */
/*              int i, sum = 0;                                            */
/*                                                                         */
/*              for (i = 0; i < nx; i++)                                   */
/*                  sum += x[i] * x[i];                                    */
/*                                                                         */
/*              return sum;                                                */
/*          }                                                              */
/*                                                                         */
/*  TECHNIQUES                                                             */
/*      The code is unrolled 4 times to enable full memory and multiplier  */
/*      bandwidth to be utilized.                                          */
/*                                                                         */
/*  ASSUMPTIONS                                                            */
/*      The input length is a multiple of 4 and at >= 4                    */
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

#pragma CODE_SECTION(DSP_vecsumsq, ".text:optimized");

#include "DSP_vecsumsq.h"

int DSP_vecsumsq (
    const short * x,
    int   nx
)
{
    int i;
    int sum = 0;

    #pragma MUST_ITERATE(4,,4);
    for (i = 0; i < nx; i++)
        sum += x[i] * x[i];

    return sum;
}

/* ======================================================================== */
/*  End of file:  DSP_vecsumsq.c                                            */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

