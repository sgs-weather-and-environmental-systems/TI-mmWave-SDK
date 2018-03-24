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
/* DSP_fir_r8_h16.c -- FIR 16 Coefficient Filter (Radix 8)                 */
/*                          Optimized C Implementation (w/ Intrinsics)     */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_fir_r8_h16 (                                               */
/*         const short *restrict x,                                        */
/*         const short *restrict h,                                        */
/*         short *restrict r,                                              */
/*         int nr,                                                         */
/*     )                                                                   */
/*                                                                         */
/*  Description                                                            */
/*     Computes a real FIR filter (direct-form) using 16 coefficients      */
/*     stored in vector h.  The real data input is stored in vector x.     */
/*     The filter output result is stored in vector r.  Input data and     */
/*     filter taps are 16-bit, with intermediate values kept at 32-bit     */
/*     precision.  Filter taps are expected in Q15 format.                 */
/*                                                                         */
/*  Assumptions                                                            */
/*     Arrays x, h, and r do not overlap                                   */
/*     nr >= 4; nr % 4 == 0                                                */
/*     nh == 16                                                            */
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

#pragma CODE_SECTION(DSP_fir_r8_h16, ".text:optimized");

#include "DSP_fir_r8_h16.h"
#ifdef __TI_COMPILER_VERSION__
#include "c6x.h"
#endif

void DSP_fir_r8_h16 (
    const short *restrict x,    /* Input array [nr+16-1 elements] (A4)*/
    const short *restrict h,    /* Coeff array [16 elements]      (B4)*/
    short       *restrict r,    /* Output array [nr elements]     (A6)*/
    int nr                      /* Number of output samples       (A8)*/
)
{
    /* 16 Coefficient FIR Radix 8 implementation */
    int j;
    long long h_FEDC, h_BA98, h_7654, h_3210;
    int h_FE, h_DC, h_BA, h_98, h_76, h_54, h_32, h_10;

    long long x_3210, x_7654, x_BA98;
    long long x_4321, x_9876, x_A987;
    long long r0,r1,r2,r3,r4,r5,r6,r7,r8,r9,ra,rb,rc,rd,re,rf;
    long long ddot_0, ddot_1, ddot_2, ddot_3, ddot_4, ddot_5, ddot_6, ddot_7;
    long long sum_20, sum_31;
    int sum_20h, sum_20l, sum_31h, sum_31l;

    /* Preload the sixteen filter array coefficients using aligned double word
     * wide loads and form two 128-bit quad register pair */
    h_FEDC = _mem8_const(&h[12]);
    h_BA98 = _mem8_const(&h[8]);
    h_7654 = _mem8_const(&h[4]);
    h_3210 = _mem8_const(&h[0]);
    h_FE = _hill(h_FEDC);
    h_DC = _loll(h_FEDC);
    h_BA = _hill(h_BA98);
    h_98 = _loll(h_BA98);
    h_76 = _hill(h_7654);
    h_54 = _loll(h_7654);
    h_32 = _hill(h_3210);
    h_10 = _loll(h_3210);

    /* Four results will be computed per loop iteration */
    _nassert(nr % 4 == 0);
    _nassert(nr >= 4);
    for (j = 0; j < nr; j += 4)
    {
        /* Compute first half of each result using coefficients 0 - 7 (8 used)
         * and data array inputs 0 - 11 (12 total - 11 used) */

    	/* Load the first eleven elements of the data array using
    	* double word wide loads */
    	x_BA98 = _mem8_const(&x[j+8]);
    	x_7654 = _mem8_const(&x[j+4]);
    	x_3210 = _mem8_const(&x[j]);

    	/* Form filter taps */
    	x_9876 = _itoll(_loll(x_BA98),_hill(x_7654));
    	x_4321 = _mem8_const(&x[j+1]);

    	/*Compute values for dot products */
    	r0 = _ddotpl2(x_3210,h_10); //x2h1+x1h0;x1h1+x0h0
    	r1 = _ddotph2(x_4321,h_10); //x4h1+x3h0;x3h1+x2h0
    	r2 = _ddotph2(x_4321,h_32); //x4h3+x3h2;x3h3+x2h2
    	r3 = _ddotpl2(x_7654,h_32); //x6h3+x5h2;x5h3+x4h2
    	r4 = _ddotpl2(x_7654,h_54); //x6h5+x5h4;x5h5+x4h4
    	r5 = _ddotpl2(x_9876,h_54); //x8h5+x7h4;x7h5+x6h4
    	r6 = _ddotpl2(x_9876,h_76); //x8h7+x7h6;x7h7+x6h6
    	r7 = _ddotpl2(x_BA98,h_76); //xah7+x9h6;x9h7+x8h6

    	/* Compute result 0 double dot product
         * x7h7 + x6h6 + x5h5 + x4h4 ; x3h3 + x2h2 + x1h1 + x0h0 */
        ddot_0 = _itoll(_loll(r6)+_loll(r4),_loll(r2)+_loll(r0));
        /* Compute result 1 double dot product
         * x8h7 + x7h6 + x6h5 + x5h4 ; x4h3 + x3h2 + x2h1 + x1h0 */
        ddot_1 = _itoll(_hill(r6)+_hill(r4),_hill(r2)+_hill(r0));
        /* Compute result 2 double dot product
         * x9h7 + x8h6 + x7h5 + x6h4 ; x5h3 + x4h2 + x3h1 + x2h0 */
        ddot_2 = _itoll(_loll(r7)+_loll(r5),_loll(r3)+_loll(r1));
        /* Compute result 3 double dot product
         * xAh7 + x9h6 + x8h5 + x7h4 ; x6h3 + x5h2 + x4h1 + x3h0 */
        ddot_3 = _itoll(_hill(r7)+_hill(r5),_hill(r3)+_hill(r1));

        /* Compute second half of each result using coefficients 8 - 15 (8 used)
         * and data array inputs 8 - 20 (12 total - 11 used) */

        /* Load the second eleven elements of the data array using aligned
         * double word wide loads */
        x_3210 = x_BA98;
        x_BA98 = _mem8_const(&x[j+16]);
        x_7654 = _mem8_const(&x[j+12]);

    	/* Form filter taps */
    	x_9876 = _itoll(_loll(x_BA98),_hill(x_7654));
    	x_4321 = _mem8_const(&x[j+9]);

    	/*Compute values for dot products */
    	r8 = _ddotpl2(x_3210,h_98); //x2h1+x1h0;x1h1+x0h0
    	r9 = _ddotph2(x_4321,h_98); //x4h1+x3h0;x3h1+x2h0
    	ra = _ddotph2(x_4321,h_BA); //x4h3+x3h2;x3h3+x2h2
    	rb = _ddotpl2(x_7654,h_BA); //x6h3+x5h2;x5h3+x4h2
    	rc = _ddotpl2(x_7654,h_DC); //x6h5+x5h4;x5h5+x4h4
    	rd = _ddotpl2(x_9876,h_DC); //x8h5+x7h4;x7h5+x6h4
    	re = _ddotpl2(x_9876,h_FE); //x8h7+x7h6;x7h7+x6h6
    	rf = _ddotpl2(x_BA98,h_FE); //xah7+x9h6;x9h7+x8h6

    	/* Compute second half of result 0 double dot product and add to
         * the first half.
         * xFhF + xEhE + xDhD + xChC ; xBhB + xAhA + x9h9 + x8h8 */
        ddot_4 = _itoll(_loll(re)+_loll(rc),_loll(ra)+_loll(r8));
        ddot_0 = _itoll(_hill(ddot_0)+_hill(ddot_4),_loll(ddot_0)+_loll(ddot_4));

    	/* Compute second half of result 1 double dot product and add to
         * the first half.
         * x10hF + xFhE + xEhD + xDhC ; xChB + xBhA + xAh9 + x9h8 */
        ddot_5 = _itoll(_hill(re)+_hill(rc),_hill(ra)+_hill(r8));
        ddot_1 = _itoll(_hill(ddot_1)+_hill(ddot_5),_loll(ddot_1)+_loll(ddot_5));

    	/* Compute second half of result 2 double dot product and add to
         * the first half.
         * x11hF + x10hE + xFhD + xEhC ; xDhB + xChA + xBh9 + xAh8 */
        ddot_6 =  _itoll(_loll(rf)+_loll(rd),_loll(rb)+_loll(r9));
        ddot_2 = _itoll(_hill(ddot_2)+_hill(ddot_6),_loll(ddot_2)+_loll(ddot_6));

    	/* Compute second half of result 3 double dot product and add to
         * the first half.
         * x12hF + x11hE + x10hD + xFhC ; xEhB + xDhA + xCh9 + xBh8 */
        ddot_7 =  _itoll(_hill(rf)+_hill(rd),_hill(rb)+_hill(r9));
        ddot_3 = _itoll(_hill(ddot_3)+_hill(ddot_7),_loll(ddot_3)+_loll(ddot_7));

        /* Sum the high and low portions of each ddot_X register pair to
         * form each results complete sum.  Then shift down 15 to convert
         * to Q15 format. */
        sum_20 = _itoll(_hill(ddot_2)+_loll(ddot_2), _hill(ddot_0)+_loll(ddot_0));
        sum_20h = (int) _hill(sum_20) >> 15;
        sum_20l = (int) _loll(sum_20) >> 15;
        sum_20 = _itoll(sum_20h,sum_20l);

        sum_31 = _itoll(_hill(ddot_3)+_loll(ddot_3), _hill(ddot_1)+_loll(ddot_1));
        sum_31h = (int) _hill(sum_31) >> 15;
        sum_31l = (int) _loll(sum_31) >> 15;
        sum_31 = _itoll(sum_31h,sum_31l);

        /* Store out four output samples at a time using STDW */
        _mem8(&r[j]) = _itoll(_pack2(_hill(sum_31), _hill(sum_20)), _pack2(_loll(sum_31),_loll(sum_20)));
    }
}

/* ======================================================================= */
/*  End of file:  DSP_fir_r8_h16.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */
