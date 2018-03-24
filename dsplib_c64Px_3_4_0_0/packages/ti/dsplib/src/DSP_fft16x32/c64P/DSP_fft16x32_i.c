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
/*  NAME                                                                   */
/*      DSP_fft16x32 -- Radix-4 FFT with digit reversal                    */
/*                                                                         */
/*                                                                         */
/*  USAGE                                                                  */
/*                                                                         */
/*      This routine is C-callable and can be called as:                   */
/*                                                                         */
/*      void DSP_fft16x32_i                                                */
/*      (                                                                  */
/*          short * w,                                                     */
/*          int nx,                                                        */
/*          int * x,                                                       */
/*          int * y                                                        */
/*      )                                                                  */
/*                                                                         */
/*      w[2*nx]:    Pointer to vector of Q.15 FFT coefficients of size     */
/*                  2*nx elements.                                         */
/*                                                                         */
/*      nx:         Number of complex elements in vector x.                */
/*                                                                         */
/*      x[2*nx]:    Pointer to input vector of size 2*nx elements.         */
/*                                                                         */
/*      y[2*nx]:    Pointer to output vector of size 2*nx elements.        */
/*                                                                         */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*                                                                         */
/*      This code performs a Radix-4 FFT with digit reversal.  The code    */
/*      uses a special ordering of twiddle factors and memory accesses     */
/*      to improve performance in the presence of cache.  It operates      */
/*      largely in-place, but the final digit-reversed output is written   */
/*      out-of-place.                                                      */
/*                                                                         */
/*      This code requires a special sequence of twiddle factors stored    */
/*      in Q1.15 fixed-point format.  The following C code illustrates     */
/*      one way to generate the desired twiddle-factor array:              */
/*                                                                         */
/*      #include <math.h>                                                  */
/*                                                                         */
/*                                                                         */
/*      short d2s(double d)                                                */
/*      {                                                                  */
/*         d = floor(0.5 + d);  // Explicit rounding to integer //         */
/*         if (d >=  32767.0) return  32767;                               */
/*         if (d <= -32768.0) return -32768;                               */
/*         return (short)d;                                                */
/*      }                                                                  */
/*                                                                         */
/*      void gen_twiddle_fft_c(short *w, int n)                            */
/*      {                                                                  */
/*         double M = 32767.5;                                             */
/*         const double PI = 3.141592654;                                  */
/*         int i, j, k;                                                    */
/*                                                                         */
/*         for (j = 1, k = 0; j < n >> 2; j = j << 2)                      */
/*         {                                                               */
/*            for (i = 0; i < n >> 2; i += j << 1)                         */
/*            {                                                            */
/*              w[k + 11] = d2s(M * cos(6.0 * PI * (i + j) / n));          */
/*              w[k + 10] = d2s(M * sin(6.0 * PI * (i + j) / n));          */
/*              w[k +  9] = d2s(M * cos(6.0 * PI * (i    ) / n));          */
/*              w[k +  8] = d2s(M * sin(6.0 * PI * (i    ) / n));          */
/*                                                                         */
/*              w[k +  7] = d2s(M * cos(4.0 * PI * (i + j) / n));          */
/*              w[k +  6] = d2s(M * sin(4.0 * PI * (i + j) / n));          */
/*              w[k +  5] = d2s(M * cos(4.0 * PI * (i    ) / n));          */
/*              w[k +  4] = d2s(M * sin(4.0 * PI * (i    ) / n));          */
/*                                                                         */
/*              w[k +  3] = d2s(M * cos(2.0 * PI * (i + j) / n));          */
/*              w[k +  2] = d2s(M * sin(2.0 * PI * (i + j) / n));          */
/*              w[k +  1] = d2s(M * cos(2.0 * PI * (i    ) / n));          */
/*              w[k +  0] = d2s(M * sin(2.0 * PI * (i    ) / n));          */
/*                                                                         */
/*              k += 12;                                                   */
/*            }                                                            */
/*           }                                                             */
/*         w[2*n - 1] = w[2*n - 3] = w[2*n - 5] = 32767;                   */
/*         w[2*n - 2] = w[2*n - 4] = w[2*n - 6] = 0;                       */
/*      }                                                                  */
/*                                                                         */
/*                                                                         */
/*  TECHNIQUES                                                             */
/*                                                                         */
/*      The following C code represents an implementation of the Cooley    */
/*      Tukey radix 4 DIF FFT. It accepts the inputs in normal order and   */
/*      produces the outputs in digit reversed order. The natural C code   */
/*      shown in this file on the other hand, accepts the inputs in nor-   */
/*      mal order and produces the outputs in normal order.                */
/*                                                                         */
/*      Several transformations have been applied to the original Cooley   */
/*      Tukey code to produce the natural C code description shown here.   */
/*      In order to understand these it would first be educational to      */
/*      understand some of the issues involved in the conventional Cooley  */
/*      Tukey FFT code.                                                    */
/*                                                                         */
/*      void radix4(int n, short x[], short wn[])                          */
/*      {                                                                  */
/*          int    n1,  n2,  ie,   ia1,  ia2, ia3;                         */
/*          int    i0,  i1,  i2,    i3,    i, j,     k;                    */
/*          short  co1, co2, co3,  si1,  si2, si3;                         */
/*          short  xt0, yt0, xt1,  yt1,  xt2, yt2;                         */
/*          short  xh0, xh1, xh20, xh21, xl0, xl1,xl20,xl21;               */
/*                                                                         */
/*          n2 = n;                                                        */
/*          ie = 1;                                                        */
/*          for (k = n; k > 1; k >>= 2)                                    */
/*          {                                                              */
/*              n1 = n2;                                                   */
/*              n2 >>= 2;                                                  */
/*              ia1 = 0;                                                   */
/*                                                                         */
/*              for (j = 0; j < n2; j++)                                   */
/*              {                                                          */
/*                   ia2 = ia1 + ia1;                                      */
/*                   ia3 = ia2 + ia1;                                      */
/*                                                                         */
/*                   co1 = wn[2 * ia1    ];                                */
/*                   si1 = wn[2 * ia1 + 1];                                */
/*                   co2 = wn[2 * ia2    ];                                */
/*                   si2 = wn[2 * ia2 + 1];                                */
/*                   co3 = wn[2 * ia3    ];                                */
/*                   si3 = wn[2 * ia3 + 1];                                */
/*                   ia1 = ia1 + ie;                                       */
/*                                                                         */
/*                   for (i0 = j; i0< n; i0 += n1)                         */
/*                   {                                                     */
/*                       i1 = i0 + n2;                                     */
/*                       i2 = i1 + n2;                                     */
/*                       i3 = i2 + n2;                                     */
/*                                                                         */
/*                                                                         */
/*                       xh0  = x[2 * i0    ] + x[2 * i2    ];             */
/*                       xh1  = x[2 * i0 + 1] + x[2 * i2 + 1];             */
/*                       xl0  = x[2 * i0    ] - x[2 * i2    ];             */
/*                       xl1  = x[2 * i0 + 1] - x[2 * i2 + 1];             */
/*                                                                         */
/*                       xh20 = x[2 * i1    ] + x[2 * i3    ];             */
/*                       xh21 = x[2 * i1 + 1] + x[2 * i3 + 1];             */
/*                       xl20 = x[2 * i1    ] - x[2 * i3    ];             */
/*                       xl21 = x[2 * i1 + 1] - x[2 * i3 + 1];             */
/*                                                                         */
/*                       x[2 * i0    ] = xh0 + xh20;                       */
/*                       x[2 * i0 + 1] = xh1 + xh21;                       */
/*                                                                         */
/*                       xt0  = xh0 - xh20;                                */
/*                       yt0  = xh1 - xh21;                                */
/*                       xt1  = xl0 + xl21;                                */
/*                       yt2  = xl1 + xl20;                                */
/*                       xt2  = xl0 - xl21;                                */
/*                       yt1  = xl1 - xl20;                                */
/*                                                                         */
/*                       x[2 * i1    ] = (xt1 * co1 + yt1 * si1) >> 15;    */
/*                       x[2 * i1 + 1] = (yt1 * co1 - xt1 * si1) >> 15;    */
/*                       x[2 * i2    ] = (xt0 * co2 + yt0 * si2) >> 15;    */
/*                       x[2 * i2 + 1] = (yt0 * co2 - xt0 * si2) >> 15;    */
/*                       x[2 * i3    ] = (xt2 * co3 + yt2 * si3) >> 15;    */
/*                       x[2 * i3 + 1] = (yt2 * co3 - xt2 * si3) >> 15;    */
/*                   }                                                     */
/*             }                                                           */
/*                                                                         */
/*             ie <<= 2;                                                   */
/*         }                                                               */
/*     }                                                                   */
/*                                                                         */
/*      The conventional Cooley Tukey FFT, is written using three loops.   */
/*      The outermost loop "k" cycles through the stages. There are log    */
/*      N to the base 4 stages in all. The loop "j" cycles through the     */
/*      groups of butterflies with different twiddle factors, loop "i"     */
/*      reuses the twiddle factors for the different butterflies within    */
/*      a stage. It is interesting to note the following:                  */
/*                                                                         */
/* ----------------------------------------------------------------------- */
/*      Stage#     #Groups     # Butterflies with common     #Groups*Bflys */
/*                               twiddle factors                           */
/* ----------------------------------------------------------------------- */
/*       1         N/4          1                            N/4           */
/*       2         N/16         4                            N/4           */
/*       ..                                                                */
/*       logN      1            N/4                          N/4           */
/* ----------------------------------------------------------------------- */
/*                                                                         */
/*      The following statements can be made based on above observations:  */
/*                                                                         */
/*      a) Inner loop "i0" iterates a variable number of times. In         */
/*      particular the number of iterations quadruples every time from     */
/*      1..N/4. Hence software pipelining a loop that iterates a variable  */
/*      number of times is not profitable.                                 */
/*                                                                         */
/*      b) Outer loop "j" iterates a variable number of times as well.     */
/*      However the number of iterations is quartered every time from      */
/*      N/4 ..1. Hence the behaviour in (a) and (b) are exactly opposite   */
/*      to each other.                                                     */
/*                                                                         */
/*      c) If the two loops "i" and "j" are colaesced together then they   */
/*      will iterate for a fixed number of times namely N/4. This allows   */
/*      us to combine the "i" and "j" loops into 1 loop. Optimized impl-   */
/*      ementations will make use of this fact.                            */
/*                                                                         */
/*      In addition the Cooley Tukey FFT accesses three twiddle factors    */
/*      per iteration of the inner loop, as the butterflies that re-use    */
/*      twiddle factors are lumped together. This leads to accessing the   */
/*      twiddle factor array at three points each sepearted by "ie". Note  */
/*      that "ie" is initially 1, and is quadrupled with every iteration.  */
/*      Therfore these three twiddle factors are not even contiguous in    */
/*      the array.                                                         */
/*                                                                         */
/*      In order to vectorize the FFT, it is desirable to access twiddle   */
/*      factor array using double word wide loads and fetch the twiddle    */
/*      factors needed. In order to do this a modified twiddle factor      */
/*      array is created, in which the factors WN/4, WN/2, W3N/4 are       */
/*      arranged to be contiguous. This eliminates the seperation between  */
/*      twiddle factors within a butterfly. However this implies that as   */
/*      the loop is traversed from one stage to another, that we maintain  */
/*      a redundant version of the twiddle factor array. Hence the size    */
/*      of the twiddle factor array increases as compared to the normal    */
/*      Cooley Tukey FFT.  The modified twiddle factor array is of size    */
/*      "2 * N" where the conventional Cooley Tukey FFT is of size"3N/4"   */
/*      where N is the number of complex points to be transformed. The     */
/*      routine that generates the modified twiddle factor array was       */
/*      presented earlier. With the above transformation of the FFT,       */
/*      both the input data and the twiddle factor array can be accessed   */
/*      using double-word wide loads to enable packed data processing.     */
/*                                                                         */
/*      The final stage is optimised to remove the multiplication as       */
/*      w0 = 1.  This stage also performs digit reversal on the data,      */
/*      so the final output is in natural order.                           */
/*                                                                         */
/*      The fft() code shown here performs the bulk of the computation     */
/*      in place. However, because digit-reversal cannot be performed      */
/*      in-place, the final result is written to a separate array, y[].    */
/*                                                                         */
/*      There is one slight break in the flow of packed processing that    */
/*      needs to be comprehended. The real part of the complex number is   */
/*      in the lower half, and the imaginary part is in the upper half.    */
/*      The flow breaks in case of "xl0" and "xl1" because in this case    */
/*      the real part needs to be combined with the imaginary part because */
/*      of the multiplication by "j". This requires a packed quantity like */
/*      "xl21xl20" to be rotated as "xl20xl21" so that it can be combined  */
/*       using add2's and sub2's. Hence the natural version of C code      */
/*      shown below is transformed using packed data processing as shown:  */
/*                                                                         */
/*                       xl0  = x[2 * i0    ] - x[2 * i2    ];             */
/*                       xl1  = x[2 * i0 + 1] - x[2 * i2 + 1];             */
/*                       xl20 = x[2 * i1    ] - x[2 * i3    ];             */
/*                       xl21 = x[2 * i1 + 1] - x[2 * i3 + 1];             */
/*                                                                         */
/*                       xt1  = xl0 + xl21;                                */
/*                       yt2  = xl1 + xl20;                                */
/*                       xt2  = xl0 - xl21;                                */
/*                       yt1  = xl1 - xl20;                                */
/*                                                                         */
/*                       xl1_xl0   = _sub2(x21_x20, x21_x20)               */
/*                       xl21_xl20 = _sub2(x32_x22, x23_x22)               */
/*                       xl20_xl21 = _rotl(xl21_xl20, 16)                  */
/*                                                                         */
/*                       yt2_xt1   = _add2(xl1_xl0, xl20_xl21)             */
/*                       yt1_xt2   = _sub2(xl1_xl0, xl20_xl21)             */
/*                                                                         */
/*      Also notice that xt1, yt1 endup on seperate words, these need to   */
/*      be packed together to take advantage of the packed twiddle fact    */
/*      ors that have been loaded. In order for this to be achieved they   */
/*      are re-aligned as follows:                                         */
/*                                                                         */
/*      yt1_xt1 = _packhl2(yt1_xt2, yt2_xt1)                               */
/*      yt2_xt2 = _packhl2(yt2_xt1, yt1_xt2)                               */
/*                                                                         */
/*      The packed words "yt1_xt1" allows the loaded"sc" twiddle factor    */
/*      to be used for the complex multiplies. The real part os the        */
/*      complex multiply is implemented using _dotp2. The imaginary        */
/*      part of the complex multiply is implemented using _dotpn2          */
/*      after the twiddle factors are swizzled within the half word.       */
/*                                                                         */
/*      (X + jY) ( C + j S) = (XC + YS) + j (YC - XS).                     */
/*                                                                         */
/*      The actual twiddle factors for the FFT are cosine, - sine. The     */
/*      twiddle factors stored in the table are csine and sine, hence      */
/*      the sign of the "sine" term is comprehended during multipli-       */
/*      cation as shown above.                                             */
/*                                                                         */
/*                                                                         */
/*  ASSUMPTIONS                                                            */
/*                                                                         */
/*      The size of the FFT, n, must be a power of 4 and greater than      */
/*      or equal to 16 and less than 32768.                                */
/*                                                                         */
/*      The arrays 'x[]', 'y[]', and 'w[]' all must be aligned on a        */
/*      double-word boundary for the "optimized" implementations.          */
/*                                                                         */
/*      The input and output data are complex, with the real/imaginary     */
/*      components stored in adjacent locations in the array.  The real    */
/*      components are stored at even array indices, and the imaginary     */
/*      components are stored at odd array indices.                        */
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

#pragma CODE_SECTION(DSP_fft16x32_i, ".text:optimized");

#include "DSP_fft16x32_i.h"

static inline void radix_2(int *restrict ptr_x, int *restrict ptr_y, int npoints);
static inline void radix_4(int *restrict ptr_x, int *restrict ptr_y, int npoints);

#ifdef _LITTLE_ENDIAN
void DSP_fft16x32_i (
    const short * restrict ptr_w,
    int npoints,
    int * restrict ptr_x,
    int * restrict ptr_y
)
{
    const short * restrict w;
    int * restrict x;
    int * restrict xa, * restrict xa2, * restrict xa0;
    int * restrict xb, * restrict xb2, * restrict xb0;

    int i, j, l1, l2, h2, predj, tw_offset, stride, fft_jmp, radix;
    int xt0_0, yt0_0, xt0_1, yt0_1;
    int x_0o, x_1o, x_2o, x_3o;
    int xl1_0o, xl1_1o, xl1_2o, xl1_3o;
    int xl2_0o, xl2_1o, xl2_2o, xl2_3o;
    int xh2_0o, xh2_1o, xh2_2o, xh2_3o;

    double co20si20_co10si10, co11si11_co30si30, co31si31_co21si21;
    double x_10, x_32, x_l1_10, x_l1_32, x_l2_10, x_l2_32, x_h2_10, x_h2_32;

    long long p2_p0, p1_p3, p6_p4, p5_p7, pa_p8, p9_pb, pe_pc, pd_pf;
    long long p12_p10, p11_p13, p16_p14, p15_p17;
    long long xh0_0_xl0_0, xh1_0_xl1_0, xh0_1_xl0_1, xh1_1_xl1_1;
    long long xh21_0_xl21_0, xh20_0_xl20_0, xh20_1_xl20_1, xh21_1_xl21_1;
    long long xt1_0_xt2_0, yt2_0_yt1_0, xt1_1_xt2_1, yt2_1_yt1_1;

    /*---------------------------------------------------------------------*/
    /* Determine the magnitude od the number of points to be transformed.  */
    /* Check whether we can use a radix4 decomposition or a mixed radix    */
    /* transformation, by determining modulo 2.                            */
    /*---------------------------------------------------------------------*/
    radix = ((_norm(npoints) & 1) ? 2 : 4);

    /*----------------------------------------------------------------------*/
    /* The stride is quartered with every iteration of the outer loop. It   */
    /* denotes the seperation between any two adjacent inputs to the butter */
    /* -fly. This should start out at N/4, hence stride is initially set to */
    /* N. For every stride, 6*stride twiddle factors are accessed. The      */
    /* "tw_offset" is the offset within the current twiddle factor sub-     */
    /* table. This is set to zero, at the start of the code and is used to  */
    /* obtain the appropriate sub-table twiddle pointer by offseting it     */
    /* with the base pointer "ptr_w".                                       */
    /*----------------------------------------------------------------------*/
    stride = npoints;
    tw_offset = 0;
    fft_jmp = 6 * stride;

    _nassert(stride > 4);
    #pragma MUST_ITERATE(1,,1);
    while (stride > radix) {
        /*-----------------------------------------------------------------*/
        /* At the start of every iteration of the outer loop, "j" is set   */
        /* to zero, as "w" is pointing to the correct location within the  */
        /* twiddle factor array. For every iteration of the inner loop     */
        /* 6 * stride twiddle factors are accessed. For eg,                */
        /*                                                                 */
        /* #Iteration of outer loop  # twiddle factors    #times cycled    */
        /*  1                          6 N/4               1               */
        /*  2                          6 N/16              4               */
        /*  ...                                                            */
        /*-----------------------------------------------------------------*/
        j = 0;
        fft_jmp >>= 2;

        /*-----------------------------------------------------------------*/
        /* Set up offsets to access "N/4", "N/2", "3N/4" complex point or  */
        /* "N/2", "N", "3N/2" half word                                    */
        /*-----------------------------------------------------------------*/
        h2 = stride >> 1;
        l1 = stride;
        l2 = stride + (stride >> 1);

        /*-----------------------------------------------------------------*/
        /*  Reset "x" to point to the start of the input data array.       */
        /* "tw_offset" starts off at 0, and increments by "6 * stride"     */
        /*  The stride quarters with every iteration of the outer loop     */
        /*-----------------------------------------------------------------*/
        xa = ptr_x;
        xb = ptr_x + 2;
        w = ptr_w + tw_offset;
        tw_offset += fft_jmp;
        stride >>= 2;

        /*----------------------------------------------------------------*/
        /* The following loop iterates through the different butterflies, */
        /* within a given stage. Recall that there are logN to base 4     */
        /* stages. Certain butterflies share the twiddle factors. These   */
        /* are grouped together. On the very first stage there are no     */
        /* butterflies that share the twiddle factor, all N/4 butter-     */
        /* flies have different factors. On the next stage two sets of    */
        /* N/8 butterflies share the same twiddle factor. Hence after     */
        /* half the butterflies are performed, j the index into the       */
        /* factor array resets to 0, and the twiddle factors are reused.  */
        /* When this happens, the data pointer 'x' is incremented by the  */
        /* fft_jmp amount. In addition the following code is unrolled to  */
        /* perform "2" radix4 butterflies in parallel.                    */
        /*----------------------------------------------------------------*/
        _nassert((int)(w) % 8 == 0);
        _nassert((int)(x) % 8 == 0);
        _nassert(h2 % 8 == 0);
        _nassert(l1 % 8 == 0);
        _nassert(l2 % 8 == 0);
        #pragma MUST_ITERATE(16,,16);
        for (i = 0; i < (npoints >> 3); i++) {
            /*------------------------------------------------------------*/
            /* Read the first 12 twiddle factors, six of which are used   */
            /* for one radix 4 butterfly and six of which are used for    */
            /* next one.                                                  */
            /*------------------------------------------------------------*/
            co20si20_co10si10 = _amemd8_const(&w[j]);
            co11si11_co30si30 = _amemd8_const(&w[j + 4]);
            co31si31_co21si21 = _amemd8_const(&w[j + 8]);

            /*------------------------------------------------------------*/
            /* Read in the first complex input for the butterflies.       */
            /* 1st complex input to 1st butterfly: x[0] + jx[1]           */
            /* 1st complex input to 2nd butterfly: x[2] + jx[3]           */
            /*------------------------------------------------------------*/
            xb      = xa + 2;
            x_10    = _amemd8(&xa[0]);
            x_32    = _amemd8(&xb[0]);
            x_l1_10 = _amemd8(&xa[l1]);
            x_l1_32 = _amemd8(&xb[l1]);
            x_l2_10 = _amemd8(&xa[l2]);
            x_l2_32 = _amemd8(&xb[l2]);
            x_h2_10 = _amemd8(&xa[h2]);
            x_h2_32 = _amemd8(&xb[h2]);

            /*-----------------------------------------------------------*/
            /* Two butterflies are evaluated in parallel. The following  */
            /* results will be shown for one butterfly only, although    */
            /* both are being evaluated in parallel.                     */
            /*                                                           */
            /* Perform radix2 style DIF butterflies.                     */
            /*-----------------------------------------------------------*/
            xh0_0_xl0_0 = _addsub((_lo(x_10)), (_lo(x_l1_10)));
            xh1_0_xl1_0 = _addsub((_hi(x_10)), (_hi(x_l1_10)));
            xh0_1_xl0_1 = _addsub((_lo(x_32)), (_lo(x_l1_32)));
            xh1_1_xl1_1 = _addsub((_hi(x_32)), (_hi(x_l1_32)));


            xh21_0_xl21_0 = _addsub((_hi(x_h2_10)), (_hi(x_l2_10)));
            xh20_0_xl20_0 = _addsub((_lo(x_h2_10)), (_lo(x_l2_10)));
            xh20_1_xl20_1 = _addsub((_lo(x_h2_32)), (_lo(x_l2_32)));
            xh21_1_xl21_1 = _addsub((_hi(x_h2_32)), (_hi(x_l2_32)));

            /*-----------------------------------------------------------*/
            /* Derive output pointers using the input pointer "x"        */
            /*-----------------------------------------------------------*/
            xa0 = (int *) _mvd((int) xa);
            xa2 = (int *) _mvd((int) xa0);

            xb0 = (int *) _mvd((int) xb);
            xb2 = (int *) _mvd((int) xb0);

            /*-----------------------------------------------------------*/
            /* When the twiddle factors are not to be re-used, j is      */
            /* incremented by 12, to reflect the fact that 12 half words */
            /* are consumed in every iteration. The input data pointer   */
            /* increments by 4. Note that within a stage, the stride     */
            /* does not change and hence the offsets for the other three */
            /* legs, 0, h2, l1, l2.                                      */
            /*-----------------------------------------------------------*/
            j += 12;
            predj = ((j - fft_jmp) != 0);
            j = _mpy(j, predj);
            xa += _mpy(fft_jmp, !predj) + 4;

            //;-------------------------------------------------------------;
            //;  x0[0]  =  xh0_0  +  xh20_0  x0[1]  =  xh1_0  +  xh21_0     ;
            //;  x0[2]  =  xh0_1  +  xh20_1  x0[3]  =  xh1_1  +  xh21_1     ;
            //;-------------------------------------------------------------;
            x_0o = (_hill(xh20_0_xl20_0)) + (_hill(xh0_0_xl0_0));
            x_1o = (_hill(xh21_0_xl21_0)) + (_hill(xh1_0_xl1_0));
            x_2o = (_hill(xh20_1_xl20_1)) + (_hill(xh0_1_xl0_1));
            x_3o = (_hill(xh21_1_xl21_1)) + (_hill(xh1_1_xl1_1));

            //;-------------------------------------------------------------;
            //;   xt0_0 = xh0_0 - xh20_0     yt0_0 = xh1_0 - xh21_0         ;
            //;   xt0_1 = xh0_1 - xh20_1     yt0_1 = xh1_1 - xh21_1         ;
            //;-------------------------------------------------------------;
            yt0_0 = (_hill(xh1_0_xl1_0)) - (_hill(xh21_0_xl21_0));
            xt0_0 = (_hill(xh0_0_xl0_0)) - (_hill(xh20_0_xl20_0));
            yt0_1 = (_hill(xh1_1_xl1_1)) - (_hill(xh21_1_xl21_1));
            xt0_1 = (_hill(xh0_1_xl0_1)) - (_hill(xh20_1_xl20_1));

            //;-------------------------------------------------------------;
            //;  xt1_0  =  xl0_0  +  xl21_0   yt2_0  =  xl1_0  +  xl20_0    ;
            //;  xt1_1  =  xl0_1  +  xl21_1   yt2_1  =  xl1_1  +  xl20_1    ;
            //;  xt2_0  =  xl0_0  -  xl21_0   yt1_0  =  xl1_0  -  xl20_0    ;
            //;  xt2_1  =  xl0_1  -  xl21_1   yt1_1  =  xl1_1  -  xl20_1    ;
            //;-------------------------------------------------------------;
            xt1_0_xt2_0 = _addsub((_loll(xh0_0_xl0_0)), (_loll(xh21_0_xl21_0)));
            yt2_0_yt1_0 = _addsub((_loll(xh1_0_xl1_0)), (_loll(xh20_0_xl20_0)));
            xt1_1_xt2_1 = _addsub((_loll(xh0_1_xl0_1)), (_loll(xh21_1_xl21_1)));
            yt2_1_yt1_1 = _addsub((_loll(xh1_1_xl1_1)), (_loll(xh20_1_xl20_1)));

            //;-------------------------------------------------------------;
            //;   x2[h2  ] = (si10 * yt1_0 + co10 * xt1_0) >> 15            ;
            //;   x2[h2+1] = (co10 * yt1_0 - si10 * xt1_0) >> 15            ;
            //;   x2[h2+2] = (si11 * yt1_1 + co11 * xt1_1) >> 15            ;
            //;   x2[h2+3] = (co11 * yt1_1 - si11 * xt1_1) >> 15            ;
            //;-------------------------------------------------------------;
            p2_p0  = _mpy2ir((_lo(co20si20_co10si10)), (_loll(yt2_0_yt1_0)));
            p1_p3  = _mpy2ir((_lo(co20si20_co10si10)), (_hill(xt1_0_xt2_0)));
            xh2_0o = (_loll(p2_p0)) + (_hill(p1_p3));
            xh2_1o = (_hill(p2_p0)) - (_loll(p1_p3));

            p6_p4  = _mpy2ir((_hi(co11si11_co30si30)), (_loll(yt2_1_yt1_1)));
            p5_p7  = _mpy2ir((_hi(co11si11_co30si30)), (_hill(xt1_1_xt2_1)));
            xh2_2o = (_loll(p6_p4)) + (_hill(p5_p7));
            xh2_3o = (_hill(p6_p4)) - (_loll(p5_p7));

            //;-------------------------------------------------------------;
            //;   x2[l1  ] = (si20 * yt0_0 + co20 * xt0_0) >> 15            ;
            //;   x2[l1+1] = (co20 * yt0_0 - si20 * xt0_0) >> 15            ;
            //;   x2[l1+2] = (si21 * yt0_1 + co21 * xt0_1) >> 15            ;
            //;   x2[l1+3] = (co21 * yt0_1 - si21 * xt0_1) >> 15            ;
            //;-------------------------------------------------------------;
            pa_p8  = _mpy2ir((_hi(co20si20_co10si10)), yt0_0);
            p9_pb  = _mpy2ir((_hi(co20si20_co10si10)), xt0_0);
            xl1_0o = (_loll(pa_p8)) + (_hill(p9_pb));
            xl1_1o = (_hill(pa_p8)) - (_loll(p9_pb));

            pe_pc  = _mpy2ir((_lo(co31si31_co21si21)), yt0_1);
            pd_pf  = _mpy2ir((_lo(co31si31_co21si21)), xt0_1);
            xl1_2o = (_loll(pe_pc)) + (_hill(pd_pf));
            xl1_3o = (_hill(pe_pc)) - (_loll(pd_pf));

            //;-------------------------------------------------------------;
            //;   x2[l2  ] = (si30 * yt2_0 + co30 * xt2_0) >> 15            ;
            //;   x2[l2+1] = (co30 * yt2_0 - si30 * xt2_0) >> 15            ;
            //;   x2[l2+2] = (si31 * yt2_1 + co31 * xt2_1) >> 15            ;
            //;   x2[l2+3] = (co31 * yt2_1 - si31 * xt2_1) >> 15            ;
            //;-------------------------------------------------------------;
            p12_p10 = _mpy2ir((_lo(co11si11_co30si30)), (_hill(yt2_0_yt1_0)));
            p11_p13 = _mpy2ir((_lo(co11si11_co30si30)), (_loll(xt1_0_xt2_0)));
            xl2_0o  = (_loll(p12_p10)) + (_hill(p11_p13));
            xl2_1o  = (_hill(p12_p10)) - (_loll(p11_p13));

            p16_p14 = _mpy2ir((_hi(co31si31_co21si21)), (_hill(yt2_1_yt1_1)));
            p15_p17 = _mpy2ir((_hi(co31si31_co21si21)), (_loll(xt1_1_xt2_1)));
            xl2_2o  = (_loll(p16_p14)) + (_hill(p15_p17));
            xl2_3o  = (_hill(p16_p14)) - (_loll(p15_p17));

            _amemd8(&xa2[0])  = _itod(x_1o, x_0o);
            _amemd8(&xb2[0])  = _itod(x_3o, x_2o);
            _amemd8(&xa2[h2]) = _itod(xh2_1o, xh2_0o);
            _amemd8(&xb2[h2]) = _itod(xh2_3o, xh2_2o);
            _amemd8(&xa2[l1]) = _itod(xl1_1o, xl1_0o);
            _amemd8(&xb2[l1]) = _itod(xl1_3o, xl1_2o);
            _amemd8(&xa2[l2]) = _itod(xl2_1o, xl2_0o);
            _amemd8(&xb2[l2]) = _itod(xl2_3o, xl2_2o);
        }
    } 

    if (radix == 2)
        radix_2(ptr_x, ptr_y, npoints);
    else if (radix == 4)
        radix_4(ptr_x, ptr_y, npoints);

    return;
}


void radix_2 (
    int * restrict ptr_x,
    int * restrict ptr_y,
    int npoints
)
{
    int * restrict x0, * restrict x2;
    int * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    int * restrict yb0, * restrict yb1, * restrict yb2, * restrict yb3;
    int j0, n0, j, i, h2, l1;
    int n00, n10, n20, n30, n01, n11, n21, n31;
    int n02, n12, n22, n32, n03, n13, n23, n33;

    double x10, x32, x54, x76, x98, xBA, xDC, xFE;

    /*-----------------------------------------------------------------*/
    /* The following code performs either a standard radix4 pass or a  */
    /* radix2 pass. Two pointers are used to access the input data.    */
    /* The input data is read "N/4" complex samples apart or "N/2"     */
    /* words apart using pointers "x0" and "x2". This produces out-    */
    /* puts that are 0, N/8, N/2, 3N/8 for radix 2.                    */
    /*-----------------------------------------------------------------*/
    y0 = ptr_y;
    y2 = ptr_y + (int)npoints;
    x0 = ptr_x;
    x2 = ptr_x + (int)(npoints >> 1);

    /*----------------------------------------------------------------*/
    /* The pointers are set at the following locations which are half */
    /* the offsets of a radix4 FFT.                                   */
    /*----------------------------------------------------------------*/
    y1 = y0 + (int)(npoints >> 2);
    y3 = y2 + (int)(npoints >> 2);
    l1 = _norm(npoints) + 1;
    j0 = 8;
    n0 = npoints >> 1;

    yb0 = y0 + 2;
    yb1 = y1 + 2;
    yb2 = y2 + 2;
    yb3 = y3 + 2;

    /*--------------------------------------------------------------------*/
    /* The following code reads data identically for either a radix 4     */
    /* or a radix 2 style decomposition. It writes out at different       */
    /* locations though. It checks if either half the points, or a        */
    /* quarter of the complex points have been exhausted to jump to       */
    /* pervent double reversal.                                           */
    /*--------------------------------------------------------------------*/
    j = 0;

    _nassert((int)(npoints) % 4  == 0);
    _nassert((int)(ptr_x) % 8 == 0);
    _nassert((int)(ptr_y) % 8 == 0);
    _nassert((int)(x0) % 8 == 0);
    _nassert((int)(x2) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < npoints; i += 8) {
        /*----------------------------------------------------------------*/
        /* Digit reverse the index starting from 0. The increment to "j"  */
        /* is either by 4, or 8.                                          */
        /*----------------------------------------------------------------*/
        h2 = _deal(j);
        h2 = _bitr(h2);
        h2 = _rotl(h2, 16);
        h2 = _shfl(h2);
        h2 >>= l1;

        /*----------------------------------------------------------------*/
        /* Read in the input data. These are transformed as a radix 2.    */
        /*----------------------------------------------------------------*/
        x10 = _amemd8(&x0[0]);
        x32 = _amemd8(&x0[2]);
        x54 = _amemd8(&x0[4]);
        x76 = _amemd8(&x0[6]);
        x0 += 8;

        x98 = _amemd8(&x2[0]);
        xBA = _amemd8(&x2[2]);
        xDC = _amemd8(&x2[4]);
        xFE = _amemd8(&x2[6]);
        x2 += 8;

        /*-------------------------------------------------------------*/
        /* Perform radix2 style decomposition.                         */
        /*-------------------------------------------------------------*/
        n00 = _lo(x10) + _lo(x32);    n01 = _hi(x10) + _hi(x32);
        n20 = _lo(x10) - _lo(x32);    n21 = _hi(x10) - _hi(x32);
        n10 = _lo(x54) + _lo(x76);    n11 = _hi(x54) + _hi(x76);
        n30 = _lo(x54) - _lo(x76);    n31 = _hi(x54) - _hi(x76);

        n02 = (_lo(x98)) + (_lo(xBA));    n03 = (_hi(x98)) + (_hi(xBA));
        n22 = (_lo(x98)) - (_lo(xBA));    n23 = (_hi(x98)) - (_hi(xBA));
        n12 = (_lo(xDC)) + (_lo(xFE));    n13 = (_hi(xDC)) + (_hi(xFE));
        n32 = (_lo(xDC)) - (_lo(xFE));    n33 = (_hi(xDC)) - (_hi(xFE));

        /*-----------------------------------------------------------------*/
        /* Points that are read from succesive locations map to y, y[N/8]  */
        /* y[N/2],y[5N/8] in a radix2 scheme.                              */
        /*-----------------------------------------------------------------*/
        _amemd8(&y0[2*h2]) = _itod(n01, n00);
        _amemd8(&y1[2*h2]) = _itod(n11, n10);
        _amemd8(&y2[2*h2]) = _itod(n21, n20);
        _amemd8(&y3[2*h2]) = _itod(n31, n30);

        _amemd8(&yb0[2*h2]) = _itod(n03, n02);
        _amemd8(&yb1[2*h2]) = _itod(n13, n12);
        _amemd8(&yb2[2*h2]) = _itod(n23, n22);
        _amemd8(&yb3[2*h2]) = _itod(n33, n32);

        j += j0;
        if (j == n0) {
            j  += n0;
            x0 += (int)npoints >> 1;
            x2 += (int)npoints >> 1;
        }
    }
}

void radix_4 (
    int * restrict ptr_x,
    int * restrict ptr_y,
    int npoints
)
{
    int * restrict x0, * restrict x2;
    int * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    int * restrict yb0, * restrict yb1, * restrict yb2, * restrict yb3;
    int j0, n0, j, i, h2, l1;

    double x10, x32, x54, x76, x98, xba, xdc, xfe;
    long long xh0_0_xl0_0, xh1_0_xl1_0, xh0_1_xl0_1, xh1_1_xl1_1;
    long long n00_20, n01_21, n10_30, n31_11;

    /*-----------------------------------------------------------------*/
    /* The following code performs either a standard radix2 pass. Two  */
    /* pointers are used to access the input data. The input data is   */
    /* read "N/4" complex samples apart or "N/2" words apart using     */
    /* pointers "x0" and "x2". This produces outputs that are 0, N/4,  */
    /* N/2, 3N/4 for a radix4 FFT.                                     */
    /*-----------------------------------------------------------------*/
    y0 = ptr_y;
    y2 = ptr_y + (int)npoints;
    x0 = ptr_x;
    x2 = ptr_x + (int)(npoints >> 1);

    /*----------------------------------------------------------------*/
    /* The pointers are set at the following locations                */
    /*----------------------------------------------------------------*/
    y1 = y0 + (int)(npoints >> 1);
    y3 = y2 + (int)(npoints >> 1);
    l1 = _norm(npoints) + 2;
    j0 = 4;
    n0 = npoints >> 2;

    yb0 = y0 + 2;
    yb1 = y1 + 2;
    yb2 = y2 + 2;
    yb3 = y3 + 2;
   
    /*--------------------------------------------------------------------*/
    /* The following code reads data identically for either a radix 4     */
    /* or a radix 2 style decomposition. It writes out at different       */
    /* locations though. It checks if either half the points, or a        */
    /* quarter of the complex points have been exhausted to jump to       */
    /* pervent double reversal.                                           */
    /*--------------------------------------------------------------------*/
    j = 0;
    
    _nassert((int)(npoints) % 4  == 0);
    _nassert((int)(x0) % 8 == 0);
    _nassert((int)(x2) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    _nassert(npoints >= 16);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < npoints; i += 8) {
        /*----------------------------------------------------------------*/
        /* Digit reverse the index starting from 0. The increment to "j"  */
        /* is either by 4, or 8.                                          */
        /*----------------------------------------------------------------*/
        h2 = _deal(j);
        h2 = _bitr(h2);
        h2 = _rotl(h2, 16);
        h2 = _shfl(h2);
        h2 >>= l1;

        /*----------------------------------------------------------------*/
        /* Read in the input data, from the first eight locations. These  */
        /* are transformed as a radix4.                                   */
        /*----------------------------------------------------------------*/
        x10 = _amemd8(&x0[0]);
        x32 = _amemd8(&x0[2]);
        x54 = _amemd8(&x0[4]);
        x76 = _amemd8(&x0[6]);
        x0 += 8;

        xh0_0_xl0_0 = _addsub(_lo(x10), _lo(x54));
        xh0_1_xl0_1 = _addsub(_lo(x32), _lo(x76));
        xh1_0_xl1_0 = _addsub(_hi(x10), _hi(x54));
        xh1_1_xl1_1 = _addsub(_hi(x32), _hi(x76));

        n00_20 = _addsub(_hill(xh0_0_xl0_0), _hill(xh0_1_xl0_1));
        n01_21 = _addsub(_hill(xh1_0_xl1_0), _hill(xh1_1_xl1_1));
        n10_30 = _addsub(_loll(xh0_0_xl0_0), _loll(xh1_1_xl1_1));
        n31_11 = _addsub(_loll(xh1_0_xl1_0), _loll(xh0_1_xl0_1));

        _amemd8(&y0[2*h2]) = _itod(    (_hill(n01_21)), _mvd(_hill(n00_20)));
        _amemd8(&y1[2*h2]) = _itod(_mvd(_loll(n31_11)), _mvd(_hill(n10_30)));
        _amemd8(&y2[2*h2]) = _itod(_mvd(_loll(n01_21)), _mvd(_loll(n00_20)));
        _amemd8(&y3[2*h2]) = _itod(    (_hill(n31_11)), _mvd(_loll(n10_30)));

        /*----------------------------------------------------------------*/
        /* Read in the next eight inputs and perform radix4 decomposition */
        /*----------------------------------------------------------------*/
        x98 = _amemd8(&x2[0]);
        xba = _amemd8(&x2[2]);
        xdc = _amemd8(&x2[4]);
        xfe = _amemd8(&x2[6]);
        x2 += 8;

        xh0_0_xl0_0 = _addsub(_lo(x98), _lo(xdc));
        xh0_1_xl0_1 = _addsub(_lo(xba), _lo(xfe));
        xh1_0_xl1_0 = _addsub(_hi(x98), _hi(xdc));
        xh1_1_xl1_1 = _addsub(_hi(xba), _hi(xfe));

        n00_20 = _addsub(_hill(xh0_0_xl0_0), _hill(xh0_1_xl0_1));
        n01_21 = _addsub(_hill(xh1_0_xl1_0), _hill(xh1_1_xl1_1));
        n10_30 = _addsub(_loll(xh0_0_xl0_0), _loll(xh1_1_xl1_1));
        n31_11 = _addsub(_loll(xh1_0_xl1_0), _loll(xh0_1_xl0_1));

        /*-----------------------------------------------------------------*/
        /* Points that are read from succesive locations map to y, y[N/4]  */
        /* y[N/2], y[3N/4] in a radix4 scheme.                             */
        /*-----------------------------------------------------------------*/
        _amemd8(&yb0[2*h2]) = _itod(    (_hill(n01_21)), _mvd(_hill(n00_20)));
        _amemd8(&yb1[2*h2]) = _itod(_mvd(_loll(n31_11)), _mvd(_hill(n10_30)));
        _amemd8(&yb2[2*h2]) = _itod(_mvd(_loll(n01_21)), _mvd(_loll(n00_20)));
        _amemd8(&yb3[2*h2]) = _itod(    (_hill(n31_11)), _mvd(_loll(n10_30)));

        j += j0;
        if (j == n0) {
            j += n0;
            x0 += (int)npoints >> 1;
            x2 += (int)npoints >> 1;
        }
    }
}
#else
void DSP_fft16x32_i (
    const short * restrict ptr_w,
    int npoints,
    int * restrict ptr_x,
    int * restrict ptr_y
)
{
    const short * restrict w;
    int * restrict x;
    int * restrict xa, * restrict xa2, * restrict xa0;
    int * restrict xb, * restrict xb2, * restrict xb0;

    int i, j, l1, l2, h2, predj, tw_offset, stride, fft_jmp, radix;
    int xt0_0, yt0_0, xt0_1, yt0_1;
    int x_0o, x_1o, x_2o, x_3o;
    int xl1_0o, xl1_1o, xl1_2o, xl1_3o;
    int xl2_0o, xl2_1o, xl2_2o, xl2_3o;
    int xh2_0o, xh2_1o, xh2_2o, xh2_3o;

    double si10co10_si20co20, si30co30_si11co11, si21co21_si31co31;
    double x_01, x_23, x_l1_01, x_l1_23, x_l2_01, x_l2_23, x_h2_01, x_h2_23;

    long long p0_p2, p3_p1, p4_p6, p7_p5, p8_pa, pb_p9, pc_pe, pf_pd;
    long long p10_p12, p13_p11, p14_p16, p17_p15;
    long long xh0_0_xl0_0, xh1_0_xl1_0, xh0_1_xl0_1, xh1_1_xl1_1;
    long long xh21_0_xl21_0, xh20_0_xl20_0, xh20_1_xl20_1, xh21_1_xl21_1;
    long long xt1_0_xt2_0, yt2_0_yt1_0, xt1_1_xt2_1, yt2_1_yt1_1;

    /*---------------------------------------------------------------------*/
    /* Determine the magnitude od the number of points to be transformed.  */
    /* Check whether we can use a radix4 decomposition or a mixed radix    */
    /* transformation, by determining modulo 2.                            */
    /*---------------------------------------------------------------------*/
    radix = ((_norm(npoints) & 1) ? 2 : 4);

    /*----------------------------------------------------------------------*/
    /* The stride is quartered with every iteration of the outer loop. It   */
    /* denotes the seperation between any two adjacent inputs to the butter */
    /* -fly. This should start out at N/4, hence stride is initially set to */
    /* N. For every stride, 6*stride twiddle factors are accessed. The      */
    /* "tw_offset" is the offset within the current twiddle factor sub-     */
    /* table. This is set to zero, at the start of the code and is used to  */
    /* obtain the appropriate sub-table twiddle pointer by offseting it     */
    /* with the base pointer "ptr_w".                                       */
    /*----------------------------------------------------------------------*/
    stride = npoints;
    tw_offset = 0;
    fft_jmp = 6 * stride;

    _nassert(stride > 4);
    #pragma MUST_ITERATE(1,,1);
    while (stride > radix) {
        /*-----------------------------------------------------------------*/
        /* At the start of every iteration of the outer loop, "j" is set   */
        /* to zero, as "w" is pointing to the correct location within the  */
        /* twiddle factor array. For every iteration of the inner loop     */
        /* 6 * stride twiddle factors are accessed. For eg,                */
        /*                                                                 */
        /* #Iteration of outer loop  # twiddle factors    #times cycled    */
        /*  1                          6 N/4               1               */
        /*  2                          6 N/16              4               */
        /*  ...                                                            */
        /*-----------------------------------------------------------------*/
        j = 0;
        fft_jmp >>= 2;

        /*-----------------------------------------------------------------*/
        /* Set up offsets to access "N/4", "N/2", "3N/4" complex point or  */
        /* "N/2", "N", "3N/2" half word                                    */
        /*-----------------------------------------------------------------*/
        h2 = stride >> 1;
        l1 = stride;
        l2 = stride + (stride >> 1);

        /*-----------------------------------------------------------------*/
        /*  Reset "x" to point to the start of the input data array.       */
        /* "tw_offset" starts off at 0, and increments by "6 * stride"     */
        /*  The stride quarters with every iteration of the outer loop     */
        /*-----------------------------------------------------------------*/
        xa = ptr_x;
        xb = ptr_x + 2;
        w = ptr_w + tw_offset;
        tw_offset += fft_jmp;
        stride >>= 2;

        /*----------------------------------------------------------------*/
        /* The following loop iterates through the different butterflies, */
        /* within a given stage. Recall that there are logN to base 4     */
        /* stages. Certain butterflies share the twiddle factors. These   */
        /* are grouped together. On the very first stage there are no     */
        /* butterflies that share the twiddle factor, all N/4 butter-     */
        /* flies have different factors. On the next stage two sets of    */
        /* N/8 butterflies share the same twiddle factor. Hence after     */
        /* half the butterflies are performed, j the index into the       */
        /* factor array resets to 0, and the twiddle factors are reused.  */
        /* When this happens, the data pointer 'x' is incremented by the  */
        /* fft_jmp amount. In addition the following code is unrolled to  */
        /* perform "2" radix4 butterflies in parallel.                    */
        /*----------------------------------------------------------------*/
        _nassert((int)(w) % 8 == 0);
        _nassert((int)(x) % 8 == 0);
        _nassert(h2 % 8 == 0);
        _nassert(l1 % 8 == 0);
        _nassert(l2 % 8 == 0);
        #pragma MUST_ITERATE(16,,16);
        for (i = 0; i < (npoints >> 3); i++) {
            /*------------------------------------------------------------*/
            /* Read the first 12 twiddle factors, six of which are used   */
            /* for one radix 4 butterfly and six of which are used for    */
            /* next one.                                                  */
            /*------------------------------------------------------------*/
            si10co10_si20co20 = _amemd8_const(&w[j]);
            si30co30_si11co11 = _amemd8_const(&w[j + 4]);
            si21co21_si31co31 = _amemd8_const(&w[j + 8]);

            /*------------------------------------------------------------*/
            /* Read in the first complex input for the butterflies.       */
            /* 1st complex input to 1st butterfly: x[0] + jx[1]           */
            /* 1st complex input to 2nd butterfly: x[2] + jx[3]           */
            /*------------------------------------------------------------*/
            xb      = xa + 2;
            x_01    = _amemd8(&xa[0]);
            x_23    = _amemd8(&xb[0]);
            x_l1_01 = _amemd8(&xa[l1]);
            x_l1_23 = _amemd8(&xb[l1]);
            x_l2_01 = _amemd8(&xa[l2]);
            x_l2_23 = _amemd8(&xb[l2]);
            x_h2_01 = _amemd8(&xa[h2]);
            x_h2_23 = _amemd8(&xb[h2]);

            /*-----------------------------------------------------------*/
            /* Two butterflies are evaluated in parallel. The following  */
            /* results will be shown for one butterfly only, although    */
            /* both are being evaluated in parallel.                     */
            /*                                                           */
            /* Perform radix2 style DIF butterflies.                     */
            /*-----------------------------------------------------------*/
            xh0_0_xl0_0 = _addsub((_hi(x_01)), (_hi(x_l1_01)));
            xh1_0_xl1_0 = _addsub((_lo(x_01)), (_lo(x_l1_01)));
            xh0_1_xl0_1 = _addsub((_hi(x_23)), (_hi(x_l1_23)));
            xh1_1_xl1_1 = _addsub((_lo(x_23)), (_lo(x_l1_23)));


            xh21_0_xl21_0 = _addsub((_lo(x_h2_01)), (_lo(x_l2_01)));
            xh20_0_xl20_0 = _addsub((_hi(x_h2_01)), (_hi(x_l2_01)));
            xh20_1_xl20_1 = _addsub((_hi(x_h2_23)), (_hi(x_l2_23)));
            xh21_1_xl21_1 = _addsub((_lo(x_h2_23)), (_lo(x_l2_23)));

            /*-----------------------------------------------------------*/
            /* Derive output pointers using the input pointer "x"        */
            /*-----------------------------------------------------------*/
            xa0 = (int *) _mvd((int) xa);
            xa2 = (int *) _mvd((int) xa0);

            xb0 = (int *) _mvd((int) xb);
            xb2 = (int *) _mvd((int) xb0);

            /*-----------------------------------------------------------*/
            /* When the twiddle factors are not to be re-used, j is      */
            /* incremented by 12, to reflect the fact that 12 half words */
            /* are consumed in every iteration. The input data pointer   */
            /* increments by 4. Note that within a stage, the stride     */
            /* does not change and hence the offsets for the other three */
            /* legs, 0, h2, l1, l2.                                      */
            /*-----------------------------------------------------------*/
            j += 12;
            predj = ((j - fft_jmp) != 0);
            j = _mpy(j, predj);
            xa += _mpy(fft_jmp, !predj) + 4;

            //;-------------------------------------------------------------;
            //;  x0[0]  =  xh0_0  +  xh20_0  x0[1]  =  xh1_0  +  xh21_0     ;
            //;  x0[2]  =  xh0_1  +  xh20_1  x0[3]  =  xh1_1  +  xh21_1     ;
            //;-------------------------------------------------------------;
            x_0o = (_hill(xh20_0_xl20_0)) + (_hill(xh0_0_xl0_0));
            x_1o = (_hill(xh21_0_xl21_0)) + (_hill(xh1_0_xl1_0));
            x_2o = (_hill(xh20_1_xl20_1)) + (_hill(xh0_1_xl0_1));
            x_3o = (_hill(xh21_1_xl21_1)) + (_hill(xh1_1_xl1_1));

            //;-------------------------------------------------------------;
            //;   xt0_0 = xh0_0 - xh20_0     yt0_0 = xh1_0 - xh21_0         ;
            //;   xt0_1 = xh0_1 - xh20_1     yt0_1 = xh1_1 - xh21_1         ;
            //;-------------------------------------------------------------;
            yt0_0 = (_hill(xh1_0_xl1_0)) - (_hill(xh21_0_xl21_0));
            xt0_0 = (_hill(xh0_0_xl0_0)) - (_hill(xh20_0_xl20_0));
            yt0_1 = (_hill(xh1_1_xl1_1)) - (_hill(xh21_1_xl21_1));
            xt0_1 = (_hill(xh0_1_xl0_1)) - (_hill(xh20_1_xl20_1));

            //;-------------------------------------------------------------;
            //;  xt1_0  =  xl0_0  +  xl21_0   yt2_0  =  xl1_0  +  xl20_0    ;
            //;  xt1_1  =  xl0_1  +  xl21_1   yt2_1  =  xl1_1  +  xl20_1    ;
            //;  xt2_0  =  xl0_0  -  xl21_0   yt1_0  =  xl1_0  -  xl20_0    ;
            //;  xt2_1  =  xl0_1  -  xl21_1   yt1_1  =  xl1_1  -  xl20_1    ;
            //;-------------------------------------------------------------;
            xt1_0_xt2_0 = _addsub((_loll(xh0_0_xl0_0)), (_loll(xh21_0_xl21_0)));
            yt2_0_yt1_0 = _addsub((_loll(xh1_0_xl1_0)), (_loll(xh20_0_xl20_0)));
            xt1_1_xt2_1 = _addsub((_loll(xh0_1_xl0_1)), (_loll(xh21_1_xl21_1)));
            yt2_1_yt1_1 = _addsub((_loll(xh1_1_xl1_1)), (_loll(xh20_1_xl20_1)));

            //;-------------------------------------------------------------;
            //;   x2[h2  ] = (si10 * yt1_0 + co10 * xt1_0) >> 15            ;
            //;   x2[h2+1] = (co10 * yt1_0 - si10 * xt1_0) >> 15            ;
            //;   x2[h2+2] = (si11 * yt1_1 + co11 * xt1_1) >> 15            ;
            //;   x2[h2+3] = (co11 * yt1_1 - si11 * xt1_1) >> 15            ;
            //;-------------------------------------------------------------;
            p0_p2  = _mpy2ir((_hi(si10co10_si20co20)), (_loll(yt2_0_yt1_0)));
            p3_p1  = _mpy2ir((_hi(si10co10_si20co20)), (_hill(xt1_0_xt2_0)));
            xh2_0o = (_hill(p0_p2)) + (_loll(p3_p1));
            xh2_1o = (_loll(p0_p2)) - (_hill(p3_p1));

            p4_p6  = _mpy2ir((_lo(si30co30_si11co11)), (_loll(yt2_1_yt1_1)));
            p7_p5  = _mpy2ir((_lo(si30co30_si11co11)), (_hill(xt1_1_xt2_1)));
            xh2_2o = (_hill(p4_p6)) + (_loll(p7_p5));
            xh2_3o = (_loll(p4_p6)) - (_hill(p7_p5));

            //;-------------------------------------------------------------;
            //;   x2[l1  ] = (si20 * yt0_0 + co20 * xt0_0) >> 15            ;
            //;   x2[l1+1] = (co20 * yt0_0 - si20 * xt0_0) >> 15            ;
            //;   x2[l1+2] = (si21 * yt0_1 + co21 * xt0_1) >> 15            ;
            //;   x2[l1+3] = (co21 * yt0_1 - si21 * xt0_1) >> 15            ;
            //;-------------------------------------------------------------;
            p8_pa  = _mpy2ir((_lo(si10co10_si20co20)), yt0_0);
            pb_p9  = _mpy2ir((_lo(si10co10_si20co20)), xt0_0);
            xl1_0o = (_hill(p8_pa)) + (_loll(pb_p9));
            xl1_1o = (_loll(p8_pa)) - (_hill(pb_p9));

            pc_pe  = _mpy2ir((_hi(si21co21_si31co31)), yt0_1);
            pf_pd  = _mpy2ir((_hi(si21co21_si31co31)), xt0_1);
            xl1_2o = (_hill(pc_pe)) + (_loll(pf_pd));
            xl1_3o = (_loll(pc_pe)) - (_hill(pf_pd));

            //;-------------------------------------------------------------;
            //;   x2[l2  ] = (si30 * yt2_0 + co30 * xt2_0) >> 15            ;
            //;   x2[l2+1] = (co30 * yt2_0 - si30 * xt2_0) >> 15            ;
            //;   x2[l2+2] = (si31 * yt2_1 + co31 * xt2_1) >> 15            ;
            //;   x2[l2+3] = (co31 * yt2_1 - si31 * xt2_1) >> 15            ;
            //;-------------------------------------------------------------;
            p10_p12 = _mpy2ir((_hi(si30co30_si11co11)), (_hill(yt2_0_yt1_0)));
            p13_p11 = _mpy2ir((_hi(si30co30_si11co11)), (_loll(xt1_0_xt2_0)));
            xl2_0o  = (_hill(p10_p12)) + (_loll(p13_p11));
            xl2_1o  = (_loll(p10_p12)) - (_hill(p13_p11));

            p14_p16 = _mpy2ir((_lo(si21co21_si31co31)), (_hill(yt2_1_yt1_1)));
            p17_p15 = _mpy2ir((_lo(si21co21_si31co31)), (_loll(xt1_1_xt2_1)));
            xl2_2o  = (_hill(p14_p16)) + (_loll(p17_p15));
            xl2_3o  = (_loll(p14_p16)) - (_hill(p17_p15));

            _amemd8(&xa2[0])  = _itod(x_0o, x_1o);
            _amemd8(&xb2[0])  = _itod(x_2o, x_3o);
            _amemd8(&xa2[h2]) = _itod(xh2_0o, xh2_1o);
            _amemd8(&xb2[h2]) = _itod(xh2_2o, xh2_3o);
            _amemd8(&xa2[l1]) = _itod(xl1_0o, xl1_1o);
            _amemd8(&xb2[l1]) = _itod(xl1_2o, xl1_3o);
            _amemd8(&xa2[l2]) = _itod(xl2_0o, xl2_1o);
            _amemd8(&xb2[l2]) = _itod(xl2_2o, xl2_3o);
        }
    } 

    if (radix == 2)
        radix_2(ptr_x, ptr_y, npoints);
    else if (radix == 4)
        radix_4(ptr_x, ptr_y, npoints);

    return;
}


void radix_2 (
    int * restrict ptr_x,
    int * restrict ptr_y,
    int npoints
)
{
    int * restrict x0, * restrict x2;
    int * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    int * restrict yb0, * restrict yb1, * restrict yb2, * restrict yb3;
    int j0, n0, j, i, h2, l1;
    int n00, n10, n20, n30, n01, n11, n21, n31;
    int n02, n12, n22, n32, n03, n13, n23, n33;

    double x01, x23, x45, x67, x89, xAB, xCD, xEF;

    /*-----------------------------------------------------------------*/
    /* The following code performs either a standard radix4 pass or a  */
    /* radix2 pass. Two pointers are used to access the input data.    */
    /* The input data is read "N/4" complex samples apart or "N/2"     */
    /* words apart using pointers "x0" and "x2". This produces out-    */
    /* puts that are 0, N/8, N/2, 3N/8 for radix 2.                    */
    /*-----------------------------------------------------------------*/
    y0 = ptr_y;
    y2 = ptr_y + (int)npoints;
    x0 = ptr_x;
    x2 = ptr_x + (int)(npoints >> 1);

    /*----------------------------------------------------------------*/
    /* The pointers are set at the following locations which are half */
    /* the offsets of a radix4 FFT.                                   */
    /*----------------------------------------------------------------*/
    y1 = y0 + (int)(npoints >> 2);
    y3 = y2 + (int)(npoints >> 2);
    l1 = _norm(npoints) + 1;
    j0 = 8;
    n0 = npoints >> 1;

    yb0 = y0 + 2;
    yb1 = y1 + 2;
    yb2 = y2 + 2;
    yb3 = y3 + 2;

    /*--------------------------------------------------------------------*/
    /* The following code reads data identically for either a radix 4     */
    /* or a radix 2 style decomposition. It writes out at different       */
    /* locations though. It checks if either half the points, or a        */
    /* quarter of the complex points have been exhausted to jump to       */
    /* pervent double reversal.                                           */
    /*--------------------------------------------------------------------*/
    j = 0;

    _nassert((int)(npoints) % 4  == 0);
    _nassert((int)(ptr_x) % 8 == 0);
    _nassert((int)(ptr_y) % 8 == 0);
    _nassert((int)(x0) % 8 == 0);
    _nassert((int)(x2) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < npoints; i += 8) {
        /*----------------------------------------------------------------*/
        /* Digit reverse the index starting from 0. The increment to "j"  */
        /* is either by 4, or 8.                                          */
        /*----------------------------------------------------------------*/
        h2 = _deal(j);
        h2 = _bitr(h2);
        h2 = _rotl(h2, 16);
        h2 = _shfl(h2);
        h2 >>= l1;

        /*----------------------------------------------------------------*/
        /* Read in the input data. These are transformed as a radix 2.    */
        /*----------------------------------------------------------------*/
        x01 = _amemd8(&x0[0]);
        x23 = _amemd8(&x0[2]);
        x45 = _amemd8(&x0[4]);
        x67 = _amemd8(&x0[6]);
        x0 += 8;

        x89 = _amemd8(&x2[0]);
        xAB = _amemd8(&x2[2]);
        xCD = _amemd8(&x2[4]);
        xEF = _amemd8(&x2[6]);
        x2 += 8;

        /*-------------------------------------------------------------*/
        /* Perform radix2 style decomposition.                         */
        /*-------------------------------------------------------------*/
        n00 = _hi(x01) + _hi(x23);    n01 = _lo(x01) + _lo(x23);
        n20 = _hi(x01) - _hi(x23);    n21 = _lo(x01) - _lo(x23);
        n10 = _hi(x45) + _hi(x67);    n11 = _lo(x45) + _lo(x67);
        n30 = _hi(x45) - _hi(x67);    n31 = _lo(x45) - _lo(x67);

        n02 = (_hi(x89)) + (_hi(xAB));    n03 = (_lo(x89)) + (_lo(xAB));
        n22 = (_hi(x89)) - (_hi(xAB));    n23 = (_lo(x89)) - (_lo(xAB));
        n12 = (_hi(xCD)) + (_hi(xEF));    n13 = (_lo(xCD)) + (_lo(xEF));
        n32 = (_hi(xCD)) - (_hi(xEF));    n33 = (_lo(xCD)) - (_lo(xEF));

        /*-----------------------------------------------------------------*/
        /* Points that are read from succesive locations map to y, y[N/8]  */
        /* y[N/2],y[5N/8] in a radix2 scheme.                              */
        /*-----------------------------------------------------------------*/
        _amemd8(&y0[2*h2]) = _itod(n00, n01);
        _amemd8(&y1[2*h2]) = _itod(n10, n11);
        _amemd8(&y2[2*h2]) = _itod(n20, n21);
        _amemd8(&y3[2*h2]) = _itod(n30, n31);

        _amemd8(&yb0[2*h2]) = _itod(n02, n03);
        _amemd8(&yb1[2*h2]) = _itod(n12, n13);
        _amemd8(&yb2[2*h2]) = _itod(n22, n23);
        _amemd8(&yb3[2*h2]) = _itod(n32, n33);

        j += j0;
        if (j == n0) {
            j  += n0;
            x0 += (int)npoints >> 1;
            x2 += (int)npoints >> 1;
        }
    }
}

void radix_4 (
    int * restrict ptr_x,
    int * restrict ptr_y,
    int npoints
)
{
    int * restrict x0, * restrict x2;
    int * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    int * restrict yb0, * restrict yb1, * restrict yb2, * restrict yb3;
    int j0, n0, j, i, h2, l1;

    double x01, x23, x45, x67, x89, xab, xcd, xef;
    long long xh0_0_xl0_0, xh1_0_xl1_0, xh0_1_xl0_1, xh1_1_xl1_1;
    long long n00_20, n01_21, n10_30, n31_11;

    /*-----------------------------------------------------------------*/
    /* The following code performs either a standard radix2 pass. Two  */
    /* pointers are used to access the input data. The input data is   */
    /* read "N/4" complex samples apart or "N/2" words apart using     */
    /* pointers "x0" and "x2". This produces outputs that are 0, N/4,  */
    /* N/2, 3N/4 for a radix4 FFT.                                     */
    /*-----------------------------------------------------------------*/
    y0 = ptr_y;
    y2 = ptr_y + (int)npoints;
    x0 = ptr_x;
    x2 = ptr_x + (int)(npoints >> 1);

    /*----------------------------------------------------------------*/
    /* The pointers are set at the following locations                */
    /*----------------------------------------------------------------*/
    y1 = y0 + (int)(npoints >> 1);
    y3 = y2 + (int)(npoints >> 1);
    l1 = _norm(npoints) + 2;
    j0 = 4;
    n0 = npoints >> 2;

    yb0 = y0 + 2;
    yb1 = y1 + 2;
    yb2 = y2 + 2;
    yb3 = y3 + 2;
   
    /*--------------------------------------------------------------------*/
    /* The following code reads data identically for either a radix 4     */
    /* or a radix 2 style decomposition. It writes out at different       */
    /* locations though. It checks if either half the points, or a        */
    /* quarter of the complex points have been exhausted to jump to       */
    /* pervent double reversal.                                           */
    /*--------------------------------------------------------------------*/
    j = 0;
    
    _nassert((int)(npoints) % 4  == 0);
    _nassert((int)(x0) % 8 == 0);
    _nassert((int)(x2) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    _nassert(npoints >= 16);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < npoints; i += 8) {
        /*----------------------------------------------------------------*/
        /* Digit reverse the index starting from 0. The increment to "j"  */
        /* is either by 4, or 8.                                          */
        /*----------------------------------------------------------------*/
        h2 = _deal(j);
        h2 = _bitr(h2);
        h2 = _rotl(h2, 16);
        h2 = _shfl(h2);
        h2 >>= l1;

        /*----------------------------------------------------------------*/
        /* Read in the input data, from the first eight locations. These  */
        /* are transformed as a radix4.                                   */
        /*----------------------------------------------------------------*/
        x01 = _amemd8(&x0[0]);
        x23 = _amemd8(&x0[2]);
        x45 = _amemd8(&x0[4]);
        x67 = _amemd8(&x0[6]);
        x0 += 8;

        xh0_0_xl0_0 = _addsub(_hi(x01), _hi(x45));
        xh0_1_xl0_1 = _addsub(_hi(x23), _hi(x67));
        xh1_0_xl1_0 = _addsub(_lo(x01), _lo(x45));
        xh1_1_xl1_1 = _addsub(_lo(x23), _lo(x67));

        n00_20 = _addsub(_hill(xh0_0_xl0_0), _hill(xh0_1_xl0_1));
        n01_21 = _addsub(_hill(xh1_0_xl1_0), _hill(xh1_1_xl1_1));
        n10_30 = _addsub(_loll(xh0_0_xl0_0), _loll(xh1_1_xl1_1));
        n31_11 = _addsub(_loll(xh1_0_xl1_0), _loll(xh0_1_xl0_1));

        _amemd8(&y0[2*h2]) = _itod(_mvd(_hill(n00_20)), (_hill(n01_21)));
        _amemd8(&y1[2*h2]) = _itod(_mvd(_hill(n10_30)), _mvd(_loll(n31_11)));
        _amemd8(&y2[2*h2]) = _itod(_mvd(_loll(n00_20)), _mvd(_loll(n01_21)));
        _amemd8(&y3[2*h2]) = _itod(_mvd(_loll(n10_30)), (_hill(n31_11)));

         /*----------------------------------------------------------------*/
        /* Read in the next eight inputs and perform radix4 decomposition */
        /*----------------------------------------------------------------*/
        x89 = _amemd8(&x2[0]);
        xab = _amemd8(&x2[2]);
        xcd = _amemd8(&x2[4]);
        xef = _amemd8(&x2[6]);
        x2 += 8;

        xh0_0_xl0_0 = _addsub(_hi(x89), _hi(xcd));
        xh0_1_xl0_1 = _addsub(_hi(xab), _hi(xef));
        xh1_0_xl1_0 = _addsub(_lo(x89), _lo(xcd));
        xh1_1_xl1_1 = _addsub(_lo(xab), _lo(xef));
        
        n00_20 = _addsub(_hill(xh0_0_xl0_0), _hill(xh0_1_xl0_1));
        n01_21 = _addsub(_hill(xh1_0_xl1_0), _hill(xh1_1_xl1_1));
        n10_30 = _addsub(_loll(xh0_0_xl0_0), _loll(xh1_1_xl1_1));
        n31_11 = _addsub(_loll(xh1_0_xl1_0), _loll(xh0_1_xl0_1));

        /*-----------------------------------------------------------------*/
        /* Points that are read from succesive locations map to y, y[N/4]  */
        /* y[N/2], y[3N/4] in a radix4 scheme.                             */
        /*-----------------------------------------------------------------*/
        _amemd8(&yb0[2*h2]) = _itod(_mvd(_hill(n00_20)), (_hill(n01_21)));
        _amemd8(&yb1[2*h2]) = _itod(_mvd(_hill(n10_30)), _mvd(_loll(n31_11)));
        _amemd8(&yb2[2*h2]) = _itod(_mvd(_loll(n00_20)), _mvd(_loll(n01_21)));
        _amemd8(&yb3[2*h2]) = _itod(_mvd(_loll(n10_30)), (_hill(n31_11)));

        j += j0;
        if (j == n0) {
            j += n0;
            x0 += (int)npoints >> 1;
            x2 += (int)npoints >> 1;
        }
    }
}
#endif
/* ======================================================================== */
/*  End of file: DSP_fft16x32_i.c                                           */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */

