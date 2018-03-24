/* ======================================================================= */
/* DSP_iir_ss_cn.c -- IIR Filter                                           */
/*                 Natural C Implementation                                */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_iir_ss_cn (                                                */
/*         short                 Input,                                    */
/*         const short *restrict ptr_Coefs,                                */
/*         int                   nCoefs,                                   */
/*         short       *restrict ptr_State                                 */
/*     )                                                                   */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      This function implements an IIR filter, with a number of biquad    */
/*      stages given by "nCoefs" / 4.  It accepts a single sample of       */
/*      input and returns a single sample of output.  Coefficients are     */
/*      are expected to be in the range [-2.0, 2.0) with Q14 precision.    */
/*                                                                         */
/*  SOURCE                                                                 */
/*      This algorithm is taken from the BDTI99 spec,                      */
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

#pragma CODE_SECTION(DSP_iir_ss_cn, ".text:ansi");

#include "DSP_iir_ss_cn.h"

short DSP_iir_ss_cn (
    short         Input,
    const short * Coefs,
    int           nCoefs,
    short       * State
)
{
    int x, p0, p1, i, j;

#ifndef NOASSUME
    _nassert((int) Coefs % 8 == 0);
    _nassert((int) State % 8 == 0);
    _nassert((int) nCoefs % 4 == 0);
    _nassert((int) nCoefs >= 4);
#endif

    x = (int) Input;
    for (i = j = 0; i < nCoefs; i += 4, j += 2) {
        p0 = Coefs[i + 2] * State[j] + Coefs[i + 3] * State[j + 1];
        p1 = Coefs[i] * State[j] + Coefs[i + 1] * State[j + 1];

        State[j + 1] = State[j];

        State[j] = x + (p0 >> 14);
        x += (p0 + p1) >> 14;
    }

    return x;
}

/* ======================================================================= */
/*  End of file:  DSP_iir_ss_cn.c                                          */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

