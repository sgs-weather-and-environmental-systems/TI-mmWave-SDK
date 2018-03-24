/* ======================================================================= */
/* DSP_recip16_cn.h -- Reciprocal Fucntion                                 */
/*                     Natural C Implementation                            */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_recip16_cn (                                               */
/*         const short * x,                                                */
/*         short * rfrac,                                                  */
/*         short * rexp,                                                   */
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

#pragma CODE_SECTION(DSP_recip16_cn, ".text:ansi");

#include "DSP_recip16_cn.h"

void DSP_recip16_cn (
    const short * x,    /* Input array                       */
    short * rfrac,      /* Output array containg Fractions   */
    short * rexp,       /* Output array containing Exponents */
    short nx            /* Number of elements in arrays      */
)
{
    int i, j, a, b;
    short neg, normal;

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

        for(j = 15; j > 0; j--)
            b = _subc(b, a);        /* divide              */

        b = b & 0x7FFF;             /* clear remainder     */

        if(neg) b = -b;             /* if negative, negate */

        *(rfrac++) = b;             /* store fraction      */
   }
}

/* ======================================================================= */
/*  End of file:  DSP_recip16_cn.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

