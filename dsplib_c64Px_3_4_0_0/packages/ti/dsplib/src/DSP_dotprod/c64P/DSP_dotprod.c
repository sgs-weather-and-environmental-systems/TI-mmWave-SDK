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
/* DSP_dotprod.c -- Dot Product implementation                             */
/*                  Intrinsic C Implementation                             */
/*                                                                         */
/* REV 0.0.1                                                               */
/*                                                                         */
/* USAGE                                                                   */
/*                                                                         */
/*      This routine has the following C prototype:                        */
/*                                                                         */
/*      int DSP_dotprod                                                    */
/*      (                                                                  */
/*          short *x,    // Pointer to first vector                        */
/*          short *y,    // Pointer to second vector                       */
/*          int    nx    // Length of vectors.                             */
/*      )                                                                  */
/*                                                                         */
/*      The "DSP_dotprod" function implements a dot product of two input   */
/*      vectors, returning the scalar result.  Each element of the         */
/*      first array is multiplied with the corresponding element of the    */
/*      second array, and the products are summed.  The sum is returned.   */
/*                                                                         */
/* ASSUMPTIONS                                                             */
/*                                                                         */
/*      - The input count is a multiple of 4                               */
/*      - Both the input pointers are double word aligned                  */
/*                                                                         */
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

#pragma CODE_SECTION(DSP_dotprod, ".text:optimized");

#include "DSP_dotprod.h"

int DSP_dotprod (
    short * restrict x,
    short * restrict y,
    int nx
)
{
    int i;
    int sum1 = 0;
    int sum2 = 0;

    /* The kernel assumes that the data pointers are double word aligned */
    _nassert((int)x % 8 == 0);
    _nassert((int)y % 8 == 0);
    _nassert(nx % 4 == 0);

    /* The kernel assumes that the input count is multiple of 4 */
    for (i = 0; i < nx; i+=4) {
        sum1 += _dotp2(_loll(_amem8_const(&x[i])),  _loll(_amem8_const(&y[i])));
        sum2 += _dotp2(_hill(_amem8_const(&x[i])),  _hill(_amem8_const(&y[i])));
    }

    return (sum1+sum2);
}

/* ======================================================================== */
/*  End of file:  DSP_dotprod.c                                             */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

