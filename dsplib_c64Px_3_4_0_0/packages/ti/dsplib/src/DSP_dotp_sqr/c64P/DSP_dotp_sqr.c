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
/* DSP_dotp_sqr.c --  Vector Dot Product and Square implementation         */
/*                    Intrinsic C Implementation                           */
/*                                                                         */
/* REV 0.0.1                                                               */
/*                                                                         */
/* USAGE                                                                   */
/*                                                                         */
/*      This routine has the following C prototype:                        */
/*                                                                         */
/*    int DSP_dotp_sqr                                                     */
/*    (                                                                    */
/*        int G,            // Sum-of-y-squared initial value              */
/*        const short  *x,  // First input array                           */
/*        const short  *y,  // Second input array.                         */ 
/*        int *restrict r,  // Accumulation of x[] * y[].                  */
/*        int nx            // Length of the input vector.                 */
/*    )                                                                    */
/*                                                                         */
/*      This routine computes the dot product of x[] and y[] arrays,       */
/*      adding it to the value in the location pointed to by 'd'.          */
/*                                                                         */
/*      Additionally, it computes the sum of the squares of the terms      */
/*      in the y[] array, adding it to the argument G.  The final value    */
/*      of G is given as the return value of the function.  This value     */
/*      is used by the VSELP vocoder.                                      */
/*                                                                         */
/* ASSUMPTIONS                                                             */
/*      - The input count is a multiple of 4                               */
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

#pragma CODE_SECTION(DSP_dotp_sqr, ".text:optimized");

#include "DSP_dotp_sqr.h"

int DSP_dotp_sqr
(
    int G,
    const short * restrict x,
    const short * restrict y,
    int *restrict r,
    int nx
)
{
    int i;
    int sum = *r;

    /* The kernel assumes that the input count is multiple of 4 */
    for (i = 0; i < nx; i += 4) {
        sum += _dotp2(_loll(_mem8_const(&x[i])),  _loll(_mem8_const(&y[i]))) +
               _dotp2(_hill(_mem8_const(&x[i])),  _hill(_mem8_const(&y[i])));

        G   += _dotp2(_loll(_mem8_const(&y[i])),  _loll(_mem8_const(&y[i]))) +
               _dotp2(_hill(_mem8_const(&y[i])),  _hill(_mem8_const(&y[i])));
    }
    *r = sum;
    return (G);
}

/* ======================================================================== */
/*  End of file:  DSP_dotp_sqr.c                                            */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

