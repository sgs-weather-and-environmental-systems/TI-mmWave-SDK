/* ======================================================================= */
/* DSP_bexp_c.c -- Block exponent of a vector                              */
/*                 Natural C Implementation                                */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     int DSP_bexp_cn                                                     */
/*     (                                                                   */
/*         const int *x,     // Input Data                                 */
/*         short      nx     // Number of elements                         */
/*     );                                                                  */
/*                                                                         */
/*  Description                                                            */
/*     The bexp function, performs a determination of the block            */
/*     exponent of the vector of elements and returns the maximum          */
/*     exponent.  This information can then be used to re-normalize        */
/*     the vector.  This operation is useful when auto-scaling is          */
/*     required as in a FFT.  The bexp operation returns the minimum       */
/*     norm of the vector.  The minimum norm corresponds to the            */
/*     maximum exponent.                                                   */
/*                                                                         */
/*  Assumptions                                                            */
/*     Arrays x and r do not overlap                                       */
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

#pragma CODE_SECTION(DSP_bexp_cn, ".text:ansi");

#include "DSP_bexp_cn.h"

int DSP_bexp_cn (
    const int *x,   /* Input data           */
    short nx        /* Number of elements   */
)
{
    int i, x_abs;
    unsigned int mask, mag;

    mask = 0;

    /* -------------------------------------------------------------------- */
    /*  Merge the absolute values of all the elements together.  The        */
    /*  leftmost bit-change on this mask gives us the magnitude we desire.  */
    /* -------------------------------------------------------------------- */
#ifndef NOASSUME
    _nassert((int)x % 4 == 0);
    _nassert(nx % 4 == 0);
    #pragma MUST_ITERATE(4,,4);
#endif
    for (i = 0; i < nx; i++) {
      x_abs = x[i];
      if (x_abs < 0) {
        x_abs = -x_abs;
      }
      mask |= x_abs;
    }

    /* -------------------------------------------------------------------- */
    /*  Find the magnitude of the mask.                                     */
    /* -------------------------------------------------------------------- */
    for (mag = 0; (1 << mag) < mask; mag++)
        ;

    return 31 - mag;
}

/* ======================================================================= */
/*  End of file:  DSP_bexp_c.c                                             */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

