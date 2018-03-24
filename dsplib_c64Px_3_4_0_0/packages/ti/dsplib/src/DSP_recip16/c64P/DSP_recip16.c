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
/* DSP_recip16.c -- Reciprocal Fucntion                                    */
/*                  Optimized C Implementation (w/ Intrinsics)             */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_recip16 (                                                  */
/*         const short *restrict x,                                        */
/*         short *restrict rfrac,                                          */
/*         short *restrict rexp,                                           */
/*         short nx                                                        */
/*     )                                                                   */
/*                                                                         */
/*  Description                                                            */
/*     This program performs a reciprocal on a vector of Q15 numbers.      */
/*     The result is stored in two parts: a Q15 part and an exponent       */
/*     (power of two) of the fraction.                                     */
/*     First, the input is loaded, then its absolute value is taken,       */
/*     then it is normalized, then divided using a loop of conditional     */
/*     subtracts, and finally it is negated if the original input was      */
/*     negative.                                                           */
/*                                                                         */
/*  Assumptions                                                            */
/*     Arrays x, rfrac, and rexp do not overlap                            */
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

#pragma CODE_SECTION(DSP_recip16, ".text:optimized");

#include "DSP_recip16.h"

void DSP_recip16 (
    const short *restrict x,    /* Input array                       */
    short *restrict rfrac,      /* Output array containg Fractions   */
    short *restrict rexp,       /* Output array containing Exponents */
    short nx                    /* Number of elements in arrays      */
)
{
    int i, j, a, b;
    short neg, normal;

    _nassert(nx % 4 == 0);
    _nassert(nx >= 4);

    _nassert((int)nx % 8 ==0);
    for(i = nx; i > 0; i--) {
        a = *(x++);
        
        if(a < 0) {                 /* take absolute value */
            a = -a;
            neg = 1;
        }
        else
            neg = 0;

        normal = _norm(a);          /* normalize           */
        a = a << normal;

        *(rexp++) = normal - 15;    /* store exponent      */
        b = 0x80000000;             /* dividend = 1        */

        for(j = 0; j < 15; j++)
            b = _subc(b, a);        /* divide              */

        b = b & 0x7FFF;             /* clear remainder     */

        if(neg) b = -b;             /* if negative, negate */

        *(rfrac++) = b;             /* store fraction      */
    }
}

/* ======================================================================= */
/*  End of file:  DSP_recip16.c                                            */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

