/* ======================================================================= */
/* DSP_minerror_cn.c -- Minimum Energy Error Search                        */
/*                      Natural C Implementation                           */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_minerror_cn (                                              */
/*         const short *restrict GSP0_TABLE,                               */
/*         const short *restrict errCoefs,                                 */
/*         int         *restrict max_index                                 */
/*     )                                                                   */
/*                                                                         */
/*     GSP0_TABLE[256*9] :  Pointer to GSP0 terms array.                   */
/*                          Must be double-word aligned.                   */
/*     errCoefs[9]       :  Array of error coefficients.                   */
/*     max_index         :  Index to GSP0_TABLE[max_index], the first      */
/*                          element of the 9-element vector that resulted  */
/*                          in the maximum dot product.                    */
/*     return int        :  Maximum dot product result.                    */
/*                                                                         */
/*  Description                                                            */
/*      Performs a dot product on 256 pairs of 9 element vectors and       */
/*      searches for the pair of vectors which produces the maximum dot    */
/*      product result and returns the value of the highest dot product.   */
/*      This is a large part of the VSELP vocoder codebook search.         */
/*                                                                         */
/*  Assumptions                                                            */
/*     Arrays GSP0_TABLE, errCoefs, and max_index do not overlap           */
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

#pragma CODE_SECTION(DSP_minerror_cn, ".text:ansi");

#include "DSP_minerror_cn.h"

#define GSP0_TERMS 9
#define GSP0_NUM 256

int DSP_minerror_cn (
    const short *restrict GSP0_TABLE, /* Pointer to GSP0 terms array          */
    const short *restrict errCoefs,   /* Array of error coefficients          */
    int *restrict max_index           /* Index to the 9-element vector that   */
                                      /*  resulted in the maximum dot product */
)
{
    int i, j;
    int val;
    int maxVal = -32767;    /* Min val for ints */

#ifndef NOASSUME
    _nassert((int) GSP0_TABLE % 8 == 0);
#endif

    for (i = 0; i < GSP0_NUM; i++) {
        for (val = 0, j = 0; j < GSP0_TERMS; j++)
            val += GSP0_TABLE[i*GSP0_TERMS + j] * errCoefs[j];

        if (val > maxVal) {
            maxVal = val;
            *max_index = i * GSP0_TERMS;
        }
    }

    return(maxVal);
}

/* ======================================================================= */
/*  End of file:  DSP_minerror_cn.c                                        */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

