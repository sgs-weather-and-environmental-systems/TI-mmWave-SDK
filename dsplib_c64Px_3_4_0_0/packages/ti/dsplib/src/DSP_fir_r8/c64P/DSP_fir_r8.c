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
/* DSP_fir_r8.c -- FIR Filter (Radix 8)                                    */
/*                 Optimized C Implementation (w/ Intrinsics)              */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_fir_r8 (                                                   */
/*         const short *restrict x,                                        */
/*         const short *restrict h,                                        */
/*         short *restrict r,                                              */
/*         int nh,                                                         */
/*         int nr,                                                         */
/*     )                                                                   */
/*                                                                         */
/*  Description                                                            */
/*     Computes a real FIR filter (direct-form) using coefficients         */
/*     stored in vector h.  The real data input is stored in vector x.     */
/*     The filter output result is stored in vector r.  Input data and     */
/*     filter taps are 16-bit, with intermediate values kept at 32-bit     */
/*     precision.  Filter taps are expected in Q15 format.                 */
/*                                                                         */
/*  Assumptions                                                            */
/*     Arrays x, h, and r do not overlap                                   */
/*     nr >= 4; nr % 4 == 0                                                */
/*     nh >= 8; nh % 8 == 0                                                */
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

#pragma CODE_SECTION(DSP_fir_r8, ".text:optimized");

#include "DSP_fir_r8.h"

#ifdef _LITTLE_ENDIAN
void DSP_fir_r8 (
    const short *restrict x,    /* Input array [nr+nh-1 elements] */
    const short *restrict h,    /* Coeff array [nh elements]      */
    short       *restrict r,    /* Output array [nr elements]     */
    int nh,                     /* Number of coefficients         */
    int nr                      /* Number of output samples       */
)
{
    int i, j;
    int h_76, h_54, h_32, h_10;
    int r_32, r_10;
    int x_BA, x_98, x_76, x_54, x_32, x_10, x_3A, x_18;
    int h_21, h_43, h_65, h_07;
    int sum_3, sum_2, sum_1, sum_0;

    long long h_3210, h_7654;
    long long x_3210, x_7654, x_BA98;

    _nassert(nh % 8 == 0);
    _nassert(nh >= 8);
    _nassert(nr % 4 == 0);
    _nassert(nr >= 4);
    for (j = 0; j < nr; j += 4) {
        /*-------------------------------------------------------------------*/
        /* Four output samples are to be computed in parallel. This requires */
        /* 4 accumulators. These accumulators are initialized to 0.          */
        /*-------------------------------------------------------------------*/
        sum_0 = 0;
        sum_1 = 0;
        sum_2 = 0;
        sum_3 = 0;

        _nassert(nh % 8 == 0);
        _nassert(nh >= 8);
        _nassert(nr % 4 == 0);
        _nassert(nr >= 4);
        for (i = 0; i < nh; i += 8) {
            /*----------------------------------------------------------------*/
            /* Use aligned double word wide loads to access the filter array  */
            /*----------------------------------------------------------------*/
            h_7654 = _amem8_const(&h[i + 4]);
            h_3210 = _amem8_const(&h[i]);

            /*----------------------------------------------------------------*/
            /* Use aligned double word wide loads to access the data array    */
            /*----------------------------------------------------------------*/
            x_BA98 = _amem8_const(&x[i + j + 8]);
            x_7654 = _amem8_const(&x[i + j + 4]);
            x_3210 = _amem8_const(&x[i + j]);

            /*----------------------------------------------------------------*/
            /* Access low and high words of double word, using _lo and _hi    */
            /*----------------------------------------------------------------*/
            h_76 = _hill(h_7654);
            h_54 = _loll(h_7654);
            h_32 = _hill(h_3210);
            h_10 = _loll(h_3210);

            /*---------------------------------------------------------------*/
            /* Prepare other combinations of filter taps using pack instru-  */
            /* ctions as opposed to non-aligned loads.                       */
            /*---------------------------------------------------------------*/
            h_65 = _packlh2(h_76, h_54);
            h_43 = _packlh2(h_54, h_32);
            h_21 = _packlh2(h_32, h_10);
            h_07 = _packlh2(h_10, h_76);

            /*---------------------------------------------------------------*/
            /*  Similarly access low and high halves of input data loaded.   */
            /*---------------------------------------------------------------*/
            x_BA = _hill(x_BA98);
            x_98 = _loll(x_BA98);
            x_76 = _hill(x_7654);
            x_54 = _loll(x_7654);
            x_32 = _hill(x_3210);
            x_10 = _loll(x_3210);

            /*---------------------------------------------------------------*/
            /* Prepare other combinations of input data using pack instru-   */
            /* ctions as opposed  to non_aligned loads.                      */
            /*---------------------------------------------------------------*/
            x_3A = _packhl2(x_32, x_BA);
            x_18 = _packhl2(x_10, x_98);

            /*---------------------------------------------------------------*/
            /* The following block computes x7h7 + x6h6 , x5h5 + x4h4        */
            /*                              x3h3 + x2h2 , x1h1 + x0h0        */
            /* Sum up partial products for output sample 0                   */
            /*---------------------------------------------------------------*/
            sum_0 += _dotp2(x_76, h_76);
            sum_0 += _dotp2(x_54, h_54);
            sum_0 += _dotp2(x_32, h_32);
            sum_0 += _dotp2(x_10, h_10);

            /*---------------------------------------------------------------*/
            /* The following block computes x7h6 + x6h5 , x5h4 + x4h3        */
            /*                              x3h2 + x2h1 , x1h0 + x8h7        */
            /* Sum up partial products for output sample 1                   */
            /*---------------------------------------------------------------*/
            sum_1 += _dotp2(x_76, h_65);
            sum_1 += _dotp2(x_54, h_43);
            sum_1 += _dotp2(x_32, h_21);
            sum_1 += _dotp2(x_18, h_07);

            /*---------------------------------------------------------------*/
            /* The following block computes x9h7 + x8h6 , x7h5 + x6h4        */
            /*                              x5h3 + x4h2 , x3h1 + x2h0        */
            /* Sum up partial products for output sample 2                   */
            /*---------------------------------------------------------------*/
            sum_2 += _dotp2(x_98, h_76);
            sum_2 += _dotp2(x_76, h_54);
            sum_2 += _dotp2(x_54, h_32);
            sum_2 += _dotp2(x_32, h_10);

            /*---------------------------------------------------------------*/
            /* The following block computes x9h6 + x8h5 , x7h4 + x6h3        */
            /*                              x5h2 + x4h1 , x3h0 + xAh7        */
            /* Sum up partial products for output sample 3                   */
            /*---------------------------------------------------------------*/
            sum_3 += _dotp2(x_98, h_65);
            sum_3 += _dotp2(x_76, h_43);
            sum_3 += _dotp2(x_54, h_21);
            sum_3 += _dotp2(x_3A, h_07);
        }
        /*---------------------------------------------------------------*/
        /* Shift accumulators by 15, for Q15 math and pack results tog-  */
        /* ether so that four output samples may be stored as a double   */
        /* word minimizing the number of memory operations.              */
        /*---------------------------------------------------------------*/
        r_10 = _pack2(sum_1 >> 15, sum_0 >> 15);
        r_32 = _pack2(sum_3 >> 15, sum_2 >> 15);

        /*-----------------------------------------------------------*/
        /* Store out four output samples at a time using STDW        */
        /*-----------------------------------------------------------*/
        _amem8(&r[j]) = _itoll(r_32, r_10);
    }
}

/*-----------------------------------------------------------*/
/*  Big Endian version                                       */
/*-----------------------------------------------------------*/
#else
void DSP_fir_r8 (
    const short *restrict x,    /* Input array [nr+nh-1 elements] */
    const short *restrict h,    /* Coeff array [nh elements]      */
    short       *restrict r,    /* Output array [nr elements]     */
    int nh,                     /* Number of coefficients         */
    int nr                      /* Number of output samples       */
)
{
    int i, j;
    int h_67, h_45, h_23, h_01;
    int r_23, r_01;
    int x_AB, x_89, x_67, x_45, x_23, x_01, x_A3, x_81;
    int h_12, h_34, h_56, h_70;
    int sum_3, sum_2, sum_1, sum_0;

    long long h_0123, h_4567;
    long long x_0123, x_4567, x_89AB;

    _nassert(nh % 8 == 0);
    _nassert(nh >= 8);
    _nassert(nr % 4 == 0);
    _nassert(nr >= 4);
    for (j = 0; j < nr; j += 4) {
        /*-------------------------------------------------------------------*/
        /* Four output samples are to be computed in parallel. This requires */
        /* 4 accumulators. These accumulators are initialized to 0.          */
        /*-------------------------------------------------------------------*/
        sum_0 = 0;
        sum_1 = 0;
        sum_2 = 0;
        sum_3 = 0;

        _nassert(nh % 8 == 0);
        _nassert(nh >= 8);
        _nassert(nr % 4 == 0);
        _nassert(nr >= 4);
        for (i = 0; i < nh; i += 8) {
            /*----------------------------------------------------------------*/
            /* Use aligned double word wide loads to access the filter array  */
            /*----------------------------------------------------------------*/
            h_4567 = _amem8_const(&h[i + 4]);
            h_0123 = _amem8_const(&h[i]);

            /*----------------------------------------------------------------*/
            /* Use aligned double word wide loads to access the data array    */
            /*----------------------------------------------------------------*/
            x_89AB = _amem8_const(&x[i + j + 8]);
            x_4567 = _amem8_const(&x[i + j + 4]);
            x_0123 = _amem8_const(&x[i + j]);

            /*----------------------------------------------------------------*/
            /* Access low and high words of double word, using _lo and _hi    */
            /*----------------------------------------------------------------*/
            h_67 = _loll(h_4567);
            h_45 = _hill(h_4567);
            h_23 = _loll(h_0123);
            h_01 = _hill(h_0123);

            /*---------------------------------------------------------------*/
            /* Prepare other combinations of filter taps using pack instru-  */
            /* ctions as opposed to non-aligned loads.                       */
            /*---------------------------------------------------------------*/
            h_56 = _packlh2(h_45, h_67);
            h_34 = _packlh2(h_23, h_45);
            h_12 = _packlh2(h_01, h_23);
            h_70 = _packlh2(h_67, h_01);

            /*---------------------------------------------------------------*/
            /*  Similarly access low and high halves of input data loaded.   */
            /*---------------------------------------------------------------*/
            x_AB = _loll(x_89AB);
            x_89 = _hill(x_89AB);
            x_67 = _loll(x_4567);
            x_45 = _hill(x_4567);
            x_23 = _loll(x_0123);
            x_01 = _hill(x_0123);

            /*---------------------------------------------------------------*/
            /* Prepare other combinations of input data using pack instru-   */
            /* ctions as opposed  to non_aligned loads.                      */
            /*---------------------------------------------------------------*/
            x_A3 = _packhl2(x_AB, x_23);
            x_81 = _packhl2(x_89, x_01);

            /*---------------------------------------------------------------*/
            /* The following block computes x7h7 + x6h6 , x5h5 + x4h4        */
            /*                              x3h3 + x2h2 , x1h1 + x0h0        */
            /* Sum up partial products for output sample 0                   */
            /*---------------------------------------------------------------*/
            sum_0 += _dotp2(x_67, h_67);
            sum_0 += _dotp2(x_45, h_45);
            sum_0 += _dotp2(x_23, h_23);
            sum_0 += _dotp2(x_01, h_01);

            /*---------------------------------------------------------------*/
            /* The following block computes x7h6 + x6h5 , x5h4 + x4h3        */
            /*                              x3h2 + x2h1 , x1h0 + x8h7        */
            /* Sum up partial products for output sample 1                   */
            /*---------------------------------------------------------------*/
            sum_1 += _dotp2(x_67, h_56);
            sum_1 += _dotp2(x_45, h_34);
            sum_1 += _dotp2(x_23, h_12);
            sum_1 += _dotp2(x_81, h_70);

            /*---------------------------------------------------------------*/
            /* The following block computes x9h7 + x8h6 , x7h5 + x6h4        */
            /*                              x5h3 + x4h2 , x3h1 + x2h0        */
            /* Sum up partial products for output sample 2                   */
            /*---------------------------------------------------------------*/
            sum_2 += _dotp2(x_89, h_67);
            sum_2 += _dotp2(x_67, h_45);
            sum_2 += _dotp2(x_45, h_23);
            sum_2 += _dotp2(x_23, h_01);

            /*---------------------------------------------------------------*/
            /* The following block computes x9h6 + x8h5 , x7h4 + x6h3        */
            /*                              x5h2 + x4h1 , x3h0 + xAh7        */
            /* Sum up partial products for output sample 3                   */
            /*---------------------------------------------------------------*/
            sum_3 += _dotp2(x_89, h_56);
            sum_3 += _dotp2(x_67, h_34);
            sum_3 += _dotp2(x_45, h_12);
            sum_3 += _dotp2(x_A3, h_70);
        }
        /*---------------------------------------------------------------*/
        /* Shift accumulators by 15, for Q15 math and pack results tog-  */
        /* ether so that four output samples may be stored as a double   */
        /* word minimizing the number of memory operations.              */
        /*---------------------------------------------------------------*/
        r_01 = _pack2(sum_0 >> 15, sum_1 >> 15);
        r_23 = _pack2(sum_2 >> 15, sum_3 >> 15);

        /*-----------------------------------------------------------*/
        /* Store out four output samples at a time using STDW        */
        /*-----------------------------------------------------------*/
        _amem8(&r[j]) = _itoll(r_01, r_23);
    }
}
#endif

/* ======================================================================= */
/*  End of file:  DSP_fir_r8.c                                             */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

