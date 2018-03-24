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
/* DSP_fir_sym.c -- Symmetric FIR Filter                                   */
/*                  Optimized C Implementation (w/ Intrinsics)             */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_fir_sym (                                                  */
/*         const short *restrict x,                                        */
/*         const short *restrict h,                                        */
/*         short *restrict r,                                              */
/*         int nh,                                                         */
/*         int nr,                                                         */
/*         int s,                                                          */
/*     )                                                                   */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*     This function applies a symmetric filter to the input samples.      */
/*     The filter tap array h[] provides 'nh + 1' total filter taps.       */
/*     The filter tap at h[nh] forms the center point of the filter.       */
/*     The taps at h[nh - 1] through h[0] form a symmetric filter          */
/*     about this central tap.  The effective filter length is thus        */
/*     2*nh + 1 taps.                                                      */
/*                                                                         */
/*     The filter is performed on 16-bit data with 16-bit coefficients,    */
/*     accumulating intermediate results to 40-bit precision.  The         */
/*     accumulator is rounded and truncated according to the value         */
/*     provided in 's'.  This allows a variety of Q-points to be used.     */
/*                                                                         */
/*     Note that samples are added together before multiplication, and     */
/*     so overflow *may* result for large-scale values, despite the        */
/*     40-bit accumulation.                                                */
/*                                                                         */
/*  ASSUMPTIONS                                                            */
/*     nr >= 4; nr % 4 == 0                                                */
/*     nh >= 4; nh % 8 == 0                                                */
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

#pragma CODE_SECTION(DSP_fir_sym, ".text:optimized");

#include "DSP_fir_sym.h"

#ifdef _LITTLE_ENDIAN
void DSP_fir_sym (
    const short *restrict x,    /* Input samples                   */
    const short *restrict h,    /* Filter taps                     */
    short       *restrict r,    /* Output samples                  */
    int nh,                     /* Number of symmetric filter taps */
    int nr,                     /* Number of output samples        */
    int s                       /* Final output shift              */
)
{
    int i, j, round;
    int h_32, h_10, h_23, h_01, h_00;
    int x_76, x_54, x_32, x_10, x_12, x_34, x_56;
    int xf_76, xf_54, xf_32, xf_10, xf_12, xf_56, xf_70;
    int sum0_0, sum0_1, sum1_0, sum1_1;
    int sum2_0, sum2_1, sum3_0, sum3_1;
    int r_10, r_32;

    int y_0, y_1, y_2, y_3;

    double prod_f10, prod_f32;
    double h_3210;
    double x_3210, x_7654;
    double xf_3210, xf_7654;

    round = 1 << (s - 1);

    /* Preload center coefficent */
    h_10 = _amem4_const(&h[nh]);
    h_00 = _pack2(h_10, h_10);

    /*------------------------------------------------------------------*/
    /* Infrom the compiler that the number of filter taps is gretaer    */
    /* than 0, and a multiple of eight. In addition inform the compi-   */
    /* ler that the number of output samples is greater than zero and   */
    /* a multiple of 2.                                                 */
    /*------------------------------------------------------------------*/
    _nassert((nh > 0) && (nh % 4 == 0));
    _nassert((nr > 0) && (nr % 4 == 0));
    for (j = 0; j < nr; j += 4) {

        /*-------------------------------------------------------------*/
        /* Initialize the four accumulators to the round value before  */
        /* the start of the FIR computation.                           */
        /*-------------------------------------------------------------*/
        y_0 = round;
        y_1 = round;
        y_2 = round;
        y_3 = round;

        /*-------------------------------------------------------------*/
        /* The inner loop processes eight filter taps in parallel for  */
        /* four output samples.                                        */
        /*-------------------------------------------------------------*/
        for (i = 0; i < nh; i += 4) {
            /*---------------------------------------------------------*/
            /* Load eight input data samples from both ends as filter  */
            /* coefficients are being shared.                          */
            /*---------------------------------------------------------*/
            x_3210 = _amemd8_const(&x[j + i]);
            x_7654 = _amemd8_const(&x[j + i + 4]);

            xf_3210 = _amemd8_const(&x[2*nh + j - i]);
            xf_7654 = _amemd8_const(&x[2*nh + j - i - 4]);

            /*--------------------------------------------------------*/
            /* Load eight filter taps                                 */
            /*--------------------------------------------------------*/
            h_3210 = _amemd8_const(&h[i]);

            /*--------------------------------------------------------*/
            /* Access low and high halves of each double word using   */
            /* the _lo and _hi intrinsic.                             */
            /*--------------------------------------------------------*/
            h_10 = _lo(h_3210);
            h_32 = _hi(h_3210);

            h_01 = _rotl(h_10, 16);
            h_23 = _rotl(h_32, 16);

            x_10 = _lo(x_3210);
            x_32 = _hi(x_3210);
            x_54 = _lo(x_7654);
            x_76 = _hi(x_7654);

            x_12 = _packhl2(x_10, x_32);
            x_34 = _packhl2(x_32, x_54);
            x_56 = _packhl2(x_54, x_76);

            xf_10 = _lo(xf_3210);
            xf_32 = _hi(xf_3210);
            xf_54 = _lo(xf_7654);
            xf_76 = _hi(xf_7654);

            xf_12 = _packhl2(xf_10, xf_32);
            xf_56 = _packhl2(xf_54, xf_76);
            xf_70 = _packhl2(xf_76, xf_10);

            /*--------------------------------------------------------*/
            /* Since filter coefficients are going to be re-used,     */
            /* the multiplies are saved by performing add's using     */
            /* the add2 instruction.                                  */
            /*--------------------------------------------------------*/
            sum0_0 = _add2(x_10, xf_70);
            sum0_1 = _add2(x_32, xf_56);

            sum1_0 = _add2(x_12, xf_10);
            sum1_1 = _add2(x_34, xf_76);

            sum2_0 = _add2(x_32, xf_12);
            sum2_1 = _add2(x_54, xf_70);

            sum3_0 = _add2(x_34, xf_32);
            sum3_1 = _add2(x_56, xf_10);

            /*--------------------------------------------------------*/
            /* The partial products are multiplied and accumulated    */
            /* using dotp2 instructions.                              */
            /* The four partial accumulated sums for each output      */
            /* sample are then accumulated with the main accumulator  */
            /* y_0..y_3                                               */
            /*--------------------------------------------------------*/
            y_0 += _dotp2(sum0_0, h_10);
            y_0 += _dotp2(sum0_1, h_32);

            y_1 += _dotp2(sum1_0, h_01);
            y_1 += _dotp2(sum1_1, h_23);

            y_2 += _dotp2(sum2_0, h_10);
            y_2 += _dotp2(sum2_1, h_32);

            y_3 += _dotp2(sum3_0, h_01);
            y_3 += _dotp2(sum3_1, h_23);
        }

        /*------------------------------------------------------------*/
        /* Perform four multiplies required for the four output sam-  */
        /* ples with this coefficient. Extract individual results     */
        /* using _lo and _hi. Add these last results to the accumu-   */
        /* mulator.                                                   */
        /*------------------------------------------------------------*/
        prod_f10 = _mpy2(x_54, h_00);
        prod_f32 = _mpy2(x_76, h_00);

        y_0 += _lo(prod_f10);
        y_1 += _hi(prod_f10);
        y_2 += _lo(prod_f32);
        y_3 += _hi(prod_f32);

        /*------------------------------------------------------------*/
        /* Perform 's' bit shifts and pack the resulting quantities.  */
        /* The pack instruction accepts 32 bit quantities, and hence  */
        /* the shifted quantities are cast as int's. The packed       */
        /* quantities are stored out as a double word.                */
        /*------------------------------------------------------------*/
        r_10 = _pack2((int) y_1 >> s, (int) y_0 >> s);
        r_32 = _pack2((int) y_3 >> s, (int) y_2 >> s);

        _amemd8(&r[j]) = _itod(r_32, r_10);
    }
}

/*-----------------------------------------------------------*/
/*  Big Endian version                                       */
/*-----------------------------------------------------------*/
#else
void DSP_fir_sym (
    const short *restrict x,    /* Input samples                   */
    const short *restrict h,    /* Filter taps                     */
    short       *restrict r,    /* Output samples                  */
    int nh,                     /* Number of symmetric filter taps */
    int nr,                     /* Number of output samples        */
    int s                       /* Final output shift              */
)
{
    int i, j, round;
    int h_23, h_01, h_32, h_10, h_00;
    int x_67, x_45, x_23, x_01, x_21, x_43, x_65;
    int xf_67, xf_45, xf_23, xf_01, xf_21, xf_65, xf_07;
    int sum0_0, sum0_1, sum1_0, sum1_1;
    int sum2_0, sum2_1, sum3_0, sum3_1;
    int r_01, r_23;

    int y_0, y_1, y_2, y_3;

    double prod_f01, prod_f23;
    double h_0123;
    double x_0123, x_4567;
    double xf_0123, xf_4567;

    round = 1 << (s - 1);

    /* Preload center coefficent */
    h_01 = _amem4_const(&h[nh]);
    h_00 = _packh2(h_01, h_01);

    /*------------------------------------------------------------------*/
    /* Infrom the compiler that the number of filter taps is gretaer    */
    /* than 0, and a multiple of eight. In addition inform the compi-   */
    /* ler that the number of output samples is greater than zero and   */
    /* a multiple of 2.                                                 */
    /*------------------------------------------------------------------*/
    _nassert((nh > 0) && (nh % 4 == 0));
    _nassert((nr > 0) && (nr % 4 == 0));
    for (j = 0; j < nr; j += 4) {

        /*-------------------------------------------------------------*/
        /* Initialize the four accumulators to the round value before  */
        /* the start of the FIR computation.                           */
        /*-------------------------------------------------------------*/
        y_0 = round;
        y_1 = round;
        y_2 = round;
        y_3 = round;

        /*-------------------------------------------------------------*/
        /* The inner loop processes eight filter taps in parallel for  */
        /* four output samples.                                        */
        /*-------------------------------------------------------------*/
        for (i = 0; i < nh; i += 4) {
            /*---------------------------------------------------------*/
            /* Load eight input data samples from both ends as filter  */
            /* coefficients are being shared.                          */
            /*---------------------------------------------------------*/
            x_0123 = _amemd8_const(&x[j + i]);
            x_4567 = _amemd8_const(&x[j + i + 4]);

            xf_0123 = _amemd8_const(&x[2*nh + j - i]);
            xf_4567 = _amemd8_const(&x[2*nh + j - i - 4]);

            /*--------------------------------------------------------*/
            /* Load eight filter taps                                 */
            /*--------------------------------------------------------*/
            h_0123 = _amemd8_const(&h[i]);

            /*--------------------------------------------------------*/
            /* Access low and high halves of each double word using   */
            /* the _lo and _hi intrinsic.                             */
            /*--------------------------------------------------------*/
            h_01 = _hi(h_0123);
            h_23 = _lo(h_0123);

            h_10 = _rotl(h_01, 16);
            h_32 = _rotl(h_23, 16);

            x_01 = _hi(x_0123);
            x_23 = _lo(x_0123);
            x_45 = _hi(x_4567);
            x_67 = _lo(x_4567);

            x_21 = _packhl2(x_23, x_01);
            x_43 = _packhl2(x_45, x_23);
            x_65 = _packhl2(x_67, x_45);

            xf_01 = _hi(xf_0123);
            xf_23 = _lo(xf_0123);
            xf_45 = _hi(xf_4567);
            xf_67 = _lo(xf_4567);

            xf_21 = _packhl2(xf_23, xf_01);
            xf_65 = _packhl2(xf_67, xf_45);
            xf_07 = _packhl2(xf_01, xf_67);

            /*--------------------------------------------------------*/
            /* Since filter coefficients are going to be re-used,     */
            /* the multiplies are saved by performing add's using     */
            /* the add2 instruction.                                  */
            /*--------------------------------------------------------*/
            sum0_0 = _add2(x_01, xf_07);
            sum0_1 = _add2(x_23, xf_65);

            sum1_0 = _add2(x_21, xf_01);
            sum1_1 = _add2(x_43, xf_67);

            sum2_0 = _add2(x_23, xf_21);
            sum2_1 = _add2(x_45, xf_07);

            sum3_0 = _add2(x_43, xf_23);
            sum3_1 = _add2(x_65, xf_01);

            /*--------------------------------------------------------*/
            /* The partial products are multiplied and accumulated    */
            /* using dotp2 instructions.                              */
            /* The four partial accumulated sums for each output      */
            /* sample are then accumulated with the main accumulator  */
            /* y_0..y_3                                               */
            /*--------------------------------------------------------*/
            y_0 += _dotp2(sum0_0, h_01);
            y_0 += _dotp2(sum0_1, h_23);

            y_1 += _dotp2(sum1_0, h_10);
            y_1 += _dotp2(sum1_1, h_32);

            y_2 += _dotp2(sum2_0, h_01);
            y_2 += _dotp2(sum2_1, h_23);

            y_3 += _dotp2(sum3_0, h_10);
            y_3 += _dotp2(sum3_1, h_32);
        }

        /*------------------------------------------------------------*/
        /* Perform four multiplies required for the four output sam-  */
        /* ples with this coefficient. Extract individual results     */
        /* using _lo and _hi. Add these last results to the accumu-   */
        /* mulator.                                                   */
        /*------------------------------------------------------------*/
        prod_f01 = _mpy2(x_45, h_00);
        prod_f23 = _mpy2(x_67, h_00);
        y_0 += _hi(prod_f01);
        y_1 += _lo(prod_f01);
        y_2 += _hi(prod_f23);
        y_3 += _lo(prod_f23);

        /*------------------------------------------------------------*/
        /* Perform 's' bit shifts and pack the resulting quantities.  */
        /* The pack instruction accepts 32 bit quantities, and hence  */
        /* the shifted quantities are cast as int's. The packed       */
        /* quantities are stored out as a double word.                */
        /*------------------------------------------------------------*/
        r_01 = _pack2((int) y_0 >> s, (int) y_1 >> s);
        r_23 = _pack2((int) y_2 >> s, (int) y_3 >> s);

        _amemd8(&r[j]) = _itod(r_01, r_23);
    }
}

#endif

/* ======================================================================= */
/*  End of file:  DSP_fir_sym.c                                            */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

