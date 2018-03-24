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
/* DSP_w_vec.c -- Weighted Vector Sum                                      */
/*                Intrinsic C Implementation                               */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  USAGE                                                                  */
/*      This routine is C-callable and can be called as:                   */
/*                                                                         */
/*          void DSP_w_vec (                                               */
/*              const short *x,     // Vector being weighted  //           */
/*              const short *y,     // Non-weighted vector    //           */
/*              short m,            // weighting factor       //           */
/*              short *restrict r,  // Result vector          //           */
/*              int nr              // Number of samples.     //           */
/*          );                                                             */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      The benchmark performs a weighted vector sum.  The elements        */
/*      of the x[] vector are weighted according to the Q15 value 'm',     */
/*      and then added to the corresponding elements of the y[] vector.    */
/*      The results are written to the r[] vector.                         */
/*                                                                         */
/*  C CODE                                                                 */
/*      The following is a C code description of the algorithm.  This      */
/*      implementation may have restrictions, as noted under               */
/*      "ASSUMPTIONS" below.                                               */
/*                                                                         */
/*          void w_vec                                                     */
/*          (                                                              */
/*              const short *x,     // Vector being weighted  //           */
/*              const short *y,     // Non-weighted vector    //           */
/*              short m,            // weighting factor       //           */
/*              short *restrict r,  // Result vector          //           */
/*              int nr              // Number of samples.     //           */
/*          )                                                              */
/*          {                                                              */
/*              int i;                                                     */
/*                                                                         */
/*              for (i = 0; i < nr; i++)                                   */
/*                  r[i] = ((m * x[i]) >> 15) + y[i];                      */
/*          }                                                              */
/*                                                                         */
/*  ASSUMPTIONS                                                            */
/*      m is not -32768.                                                   */
/*      nr >= 8, nr is multiple of eight.                                  */
/*      Input and output arrays must be double-word aligned.               */
/*                                                                         */
/*  TECHNIQUES                                                             */
/*      1.  Load double words for input data.                              */
/*      2.  Use packed data processing to sustain throughput.              */
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

#pragma CODE_SECTION(DSP_w_vec, ".text:optimized");

#include "DSP_w_vec.h"

void DSP_w_vec (
    const short * restrict x,   /* Vector being weighted  */
    const short * restrict y,   /* Non-weighted vector    */
    short m,                    /* weighting factor       */
    short * restrict r,         /* Result vector          */
    int nr                      /* Number of samples.     */
)
{
    int i;
    unsigned w = _pack2(m, m);
    unsigned wx76, wx54, wx32, wx10;
    unsigned r_76, r_54, r_32, r_10;
    double wx76d, wx54d, wx32d, wx10d;

    /* -------------------------------------------------------------------- */
    /*  Process 8 elements at a time.                                       */
    /* -------------------------------------------------------------------- */
    for (i = 0; i < nr; i += 8) {
        /* ---------------------------------------------------------------- */
        /*  This multiplies the elements by our weighting factor and then   */
        /*  shifts them left by one.  When combined with the PACKH2 below,  */
        /*  this corresponds to the ">> 15" step in the original C code.    */
        /*  Because we use SMPY2 here, we will get slightly different       */
        /*  results when w = 0x8000, but then the original code would give  */
        /*  meaningless results in that case anyway.                        */
        /* ---------------------------------------------------------------- */
        wx76d  = _smpy2(w, _hi(_amemd8_const(&x[i + 4])));
        wx54d  = _smpy2(w, _lo(_amemd8_const(&x[i + 4])));
        wx32d  = _smpy2(w, _hi(_amemd8_const(&x[i + 0])));
        wx10d  = _smpy2(w, _lo(_amemd8_const(&x[i + 0])));

        wx76   = _packh2(_hi(wx76d), _lo(wx76d));
        wx54   = _packh2(_hi(wx54d), _lo(wx54d));
        wx32   = _packh2(_hi(wx32d), _lo(wx32d));
        wx10   = _packh2(_hi(wx10d), _lo(wx10d));

        /* ---------------------------------------------------------------- */
        /*  Add the weighted values to the second vector and store results. */
        /* ---------------------------------------------------------------- */
        r_76   = _add2(wx76, _hi(_amemd8_const(&y[i + 4])));
        r_54   = _add2(wx54, _lo(_amemd8_const(&y[i + 4])));
        r_32   = _add2(wx32, _hi(_amemd8_const(&y[i + 0])));
        r_10   = _add2(wx10, _lo(_amemd8_const(&y[i + 0])));

        _amemd8(&r[i + 4]) = _itod(r_76, r_54);
        _amemd8(&r[i + 0]) = _itod(r_32, r_10);
    }
}

/* ======================================================================== */
/*  End of file:  DSP_w_vec.c                                               */
/* ------------------------------------------------------------------------ */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.           */
/*                           All Rights Reserved.                           */
/* ======================================================================== */

