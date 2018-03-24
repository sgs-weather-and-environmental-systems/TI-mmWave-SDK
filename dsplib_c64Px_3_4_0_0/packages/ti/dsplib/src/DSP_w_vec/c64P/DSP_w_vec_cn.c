/* ======================================================================== */
/* DSP_w_vec_cn.c -- Weighted Vector Sum                                    */
/*                   Natural C Implementation                               */
/*                                                                          */
/* Rev 0.0.1                                                                */
/*                                                                          */
/*  USAGE                                                                   */
/*      This routine is C-callable and can be called as:                    */
/*                                                                          */
/*          void DSP_w_vec_cn (                                             */
/*              const short *x,     // Vector being weighted  //            */
/*              const short *y,     // Non-weighted vector    //            */
/*              short m,            // weighting factor       //            */
/*              short *restrict r,  // Result vector          //            */
/*              int nr              // Number of samples.     //            */
/*          );                                                              */
/*                                                                          */
/*  DESCRIPTION                                                             */
/*      The benchmark performs a weighted vector sum.  The elements         */
/*      of the x[] vector are weighted according to the Q15 value 'm',      */
/*      and then added to the corresponding elements of the y[] vector.     */
/*      The results are written to the r[] vector.                          */
/*                                                                          */
/*  ASSUMPTIONS                                                             */
/*      m is not -32768.                                                    */
/*                                                                          */
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

#pragma CODE_SECTION(DSP_w_vec_cn, ".text:ansi");

#include "DSP_w_vec_cn.h"

void DSP_w_vec_cn (
    const short *x,     /* Vector being weighted  */
    const short *y,     /* Non-weighted vector    */
    short m,            /* weighting factor       */
    short *r,           /* Result vector          */
    int nr              /* Number of samples.     */
)
{
    int i;

#ifndef NOASSUME
    _nassert(m != -32768);
    _nassert((int)x % 8 == 0);
    _nassert((int)y % 8 == 0);
    _nassert((int)r % 8 == 0);
    #pragma MUST_ITERATE(16, ,8);
#endif

    for (i = 0; i < nr; i++) 
        r[i] = ((m * x[i]) >> 15) + y[i];
}

/* ======================================================================== */
/*  End of file:  DSP_w_vec_cn.c                                            */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

