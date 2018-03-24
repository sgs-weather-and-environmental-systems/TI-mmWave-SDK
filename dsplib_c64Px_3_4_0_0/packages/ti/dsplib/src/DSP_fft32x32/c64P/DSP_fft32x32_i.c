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
/*      DSP_fft32x32 -- fft32x32                                           */
/*                                                                         */
/*  USAGE                                                                  */
/*                                                                         */
/*      This routine is C-callable and can be called as:                   */
/*                                                                         */
/*      void DSP_fft32x32_i                                                */
/*      (                                                                  */
/*          int * w,                                                       */
/*          int nx,                                                        */
/*          int * x,                                                       */
/*          int * y                                                        */
/*      )                                                                  */
/*                                                                         */
/*      w[2*nx]:    Pointer to vector of Q.31 FFT coefficients of size     */
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
/*      in Q1.31 fixed-point format.  The following C code illustrates     */
/*      one way to generate the desired twiddle-factor array:              */
/*                                                                         */
/*      #include <math.h>                                                  */
/*                                                                         */
/*      #ifndef PI                                                         */
/*      # define PI (3.14159265358979323846)                               */
/*      #endif                                                             */
/*                                                                         */
/*                                                                         */
/*      static int d2i(double d)                                           */
/*      {                                                                  */
/*         if (d >=  2147483647.0) return (int)0x7FFFFFFF;                 */
/*         if (d <= -2147483648.0) return (int)0x80000000;                 */
/*         return (int)d;                                                  */
/*      }                                                                  */
/*                                                                         */
/*                                                                         */
/*      int gen_twiddle_fft32x32(int *w, int n, double scale)              */
/*      {                                                                  */
/*          int i, j, k, s=0, t;                                           */
/*                                                                         */
/*          for (j = 1, k = 0; j < n >> 2; j = j << 2, s++)                */
/*          {                                                              */
/*              for (i = t=0; i < n >> 2; i += j, t++)                     */
/*              {                                                          */
/*                 w[k +  5] = d2i(scale * cos(6.0 * PI * i / n));         */
/*                 w[k +  4] = d2i(scale * sin(6.0 * PI * i / n));         */
/*                                                                         */
/*                 w[k +  3] = d2i(scale * cos(4.0 * PI * i / n));         */
/*                 w[k +  2] = d2i(scale * sin(4.0 * PI * i / n));         */
/*                                                                         */
/*                 w[k +  1] = d2i(scale * cos(2.0 * PI * i / n));         */
/*                 w[k +  0] = d2i(scale * sin(2.0 * PI * i / n));         */
/*                                                                         */
/*                                                                         */
/*                 k += 6;                                                 */
/*                 }                                                       */
/*             }                                                           */
/*                                                                         */
/*          return k;                                                      */
/*        }                                                                */
/*                                                                         */
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

#pragma CODE_SECTION(DSP_fft32x32_i, ".text:optimized");

#include "DSP_fft32x32_i.h"

static inline void radix_2(int *restrict ptr_x, int *restrict ptr_y, int npoints);
static inline void radix_4(int *restrict ptr_x, int *restrict ptr_y, int npoints);

#ifdef _LITTLE_ENDIAN
void DSP_fft32x32_i (
    const int * restrict ptr_w,
    int npoints,
    int * restrict ptr_x,
    int * restrict ptr_y
)
{
    int * restrict w;
    int * restrict x, * restrict x2, * restrict x0;
    int i, j, l1, l2, h2, predj, tw_offset, stride, fft_jmp, radix;
    int si10, si20, si30, co10, co20, co30;
    int si11, si21, si31, co11, co21, co31;
    int xt0_0, yt0_0, yt0_1, xt0_1;
    int xt1_0, yt2_0, xt1_1, yt2_1, xt2_0, yt1_0, xt2_1, yt1_1; 
    int p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, pA, pB, pC, pD, pE, pF;
    int p10, p11, p12, p13, p14, p15, p16, p17;
    int xh2_0o, xh2_1o, xh2_2o, xh2_3o;
    int xl1_0o, xl1_1o, xl1_2o, xl1_3o;
    int xl2_0o, xl2_1o, xl2_2o, xl2_3o;

    double x_10, x_32;
    double x_l1_10, x_l1_32, x_l2_10, x_l2_32, x_h2_10,x_h2_32;
    double co10_si10, co20_si20, co30_si30;
    double co11_si11, co21_si21, co31_si31;

    long long xh20_0_xl20_0, xh21_0_xl21_0, xh20_1_xl20_1, xh21_1_xl21_1; 
    long long xt1_0_xt2_0, yt2_0_yt1_0, xt1_1_xt2_1, yt2_1_yt1_1; 
    long long xh0_0_xl0_0, xh1_0_xl1_0, xh0_1_xl0_1, xh1_1_xl1_1; 
    long long x_0o_xt0_0, x_1o_yt0_0, x_2o_xt0_1, x_3o_yt0_1;

    /*---------------------------------------------------------------------*/
    /* Determine the magnitude od the number of points to be transformed.  */
    /* Check whether we can use a radix4 decomposition or a mixed radix    */
    /* transformation, by determining modulo 2.                            */
    /*---------------------------------------------------------------------*/
    radix = _norm(npoints) & 1 ? 2 :  4;

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
        j =  0;
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
        x = ptr_x;
        w = (int *)ptr_w + tw_offset;
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
        /* fft_jmp amount.                                                */
        /*----------------------------------------------------------------*/
        _nassert((int)(w) % 8 == 0);
        _nassert((int)(x) % 8 == 0);
        _nassert(h2 % 8 == 0);
        _nassert(l1 % 8 == 0);
        _nassert(l2 % 8 == 0);
        _nassert(npoints >= 16);
        #pragma MUST_ITERATE(16,,16);
        for (i = 0; i < (npoints >> 3); i++) {
            /*------------------------------------------------------------*/
            /*  Read the first six twiddle factor values. This loop       */
            /*  computes two radix 4 butterflies at a time.               */
            /* si10 = w[0] co10 = w[1]  si20 = w[2]  co20 = w[3]          */
            /* si30 = w[4] co30 = w[5]  si11 = w[6]  co11 = w[7]          */
            /* si21 = w[8] co21 = w[9]  si31 = w[a]  co31 = w[b]          */
            /*------------------------------------------------------------*/
            co10_si10 = _amemd8_const(&w[j]);
            co20_si20 = _amemd8_const(&w[j + 2]);
            co30_si30 = _amemd8_const(&w[j + 4]);

            co11_si11 = _amemd8_const(&w[j + 6]);
            co21_si21 = _amemd8_const(&w[j + 8]);
            co31_si31 = _amemd8_const(&w[j + 10]);

            si10 = _lo(co10_si10);
            co10 = _hi(co10_si10);
            si20 = _lo(co20_si20);
            co20 = _hi(co20_si20);
            si30 = _lo(co30_si30);
            co30 = _hi(co30_si30);

            si11 = _lo(co11_si11);
            co11 = _hi(co11_si11);
            si21 = _lo(co21_si21);
            co21 = _hi(co21_si21);
            si31 = _lo(co31_si31);
            co31 = _hi(co31_si31);

            /*-------------------------------------------------------------*/
            /* Read in the data elements for the eight inputs of two       */
            /* radix4 butterflies.                                         */
            /*  x[0]       x[1]       x[2]       x[3]                      */
            /*  x[h2+0]    x[h2+1]    x[h2+2]    x[h2+3]                   */
            /*  x[l1+0]    x[l1+1]    x[l1+2]    x[l1+3]                   */
            /*  x[l2+0]    x[l2+1]    x[l2+2]    x[l2+3]                   */
            /*-------------------------------------------------------------*/
            x_10    = _amemd8(&x[0]);
            x_32    = _amemd8(&x[2]);
            x_l1_10 = _amemd8(&x[l1]);
            x_l1_32 = _amemd8(&x[l1 + 2]);
            x_l2_10 = _amemd8(&x[l2]);
            x_l2_32 = _amemd8(&x[l2 + 2]);
            x_h2_10 = _amemd8(&x[h2]);
            x_h2_32 = _amemd8(&x[h2 + 2]);

            /*-------------------------------------------------------------*/
            /* xh0_0 = x[0] + x[l1];    xh1_0 = x[1] + x[l1+1]             */
            /* xh0_1 = x[2] + x[l1+2];  xh1_1 = x[3] + x[l1+3]             */
            /* xl0_0 = x[0] - x[l1];    xl1_0 = x[1] - x[l1+1]             */
            /* xl0_1 = x[2] - x[l1+2];  xl1_1 = x[3] - x[l1+3]             */
            /*-------------------------------------------------------------*/
            xh0_0_xl0_0 = _addsub(_lo(x_10), _lo(x_l1_10));
            xh1_0_xl1_0 = _addsub(_hi(x_10), _hi(x_l1_10));
            xh0_1_xl0_1 = _addsub(_lo(x_32), _lo(x_l1_32));
            xh1_1_xl1_1 = _addsub(_hi(x_32), _hi(x_l1_32));

            /*------------------------------------------------------------*/
            /* xh20_0 = x[h2  ] + x[l2  ]; xh21_0 = x[h2+1] + x[l2+1]     */
            /* xh20_1 = x[h2+2] + x[l2+2]; xh21_1 = x[h2+3] + x[l2+3]     */
            /* xl20_0 = x[h2  ] - x[l2  ]; xl21_0 = x[h2+1] - x[l2+1]     */
            /* xl20_1 = x[h2+2] - x[l2+2]; xl21_1 = x[h2+3] - x[l2+3]     */
            /*------------------------------------------------------------*/
            xh20_0_xl20_0 = _addsub(_lo(x_h2_10), _lo(x_l2_10));
            xh21_0_xl21_0 = _addsub(_hi(x_h2_10), _hi(x_l2_10));
            xh20_1_xl20_1 = _addsub(_lo(x_h2_32), _lo(x_l2_32));
            xh21_1_xl21_1 = _addsub(_hi(x_h2_32), _hi(x_l2_32));

            /*-------------------------------------------------------------*/
            /*    x_0o  = xh0_0 + xh20_0;    x_1o  = xh1_0 + xh21_0;       */
            /*    x_2o  = xh0_1 + xh20_1;    x_3o  = xh1_1 + xh21_1;       */
            /*    xt0_0 = xh0_0 - xh20_0;    yt0_0 = xh1_0 - xh21_0;       */
            /*    xt0_1 = xh0_1 - xh20_1;    yt0_1 = xh1_1 - xh21_1;       */
            /*-------------------------------------------------------------*/
            x_0o_xt0_0 = _addsub(_hill(xh0_0_xl0_0), _hill(xh20_0_xl20_0));
            x_1o_yt0_0 = _addsub(_hill(xh1_0_xl1_0), _hill(xh21_0_xl21_0));
            x_2o_xt0_1 = _addsub(_hill(xh0_1_xl0_1), _hill(xh20_1_xl20_1));
            x_3o_yt0_1 = _addsub(_hill(xh1_1_xl1_1), _hill(xh21_1_xl21_1));

            /*-------------------------------------------------------------*/
            /*    xt1_0 = xl0_0 + xl21_0;    yt2_0 = xl1_0 + xl20_0;       */
            /*    xt1_1 = xl0_1 + xl21_1;    yt2_1 = xl1_1 + xl20_1;       */
            /*    xt2_0 = xl0_0 - xl21_0;    yt1_0 = xl1_0 - xl20_0;       */
            /*    xt2_1 = xl0_1 - xl21_1;    yt1_1 = xl1_1 - xl20_1;       */
            /*-------------------------------------------------------------*/
            xt1_0_xt2_0 = _addsub(_loll(xh0_0_xl0_0), _loll(xh21_0_xl21_0));
            yt2_0_yt1_0 = _addsub(_loll(xh1_0_xl1_0), _loll(xh20_0_xl20_0));
            xt1_1_xt2_1 = _addsub(_loll(xh0_1_xl0_1), _loll(xh21_1_xl21_1));
            yt2_1_yt1_1 = _addsub(_loll(xh1_1_xl1_1), _loll(xh20_1_xl20_1));

            xt0_0 = _loll(x_0o_xt0_0);
            xt0_1 = _loll(x_2o_xt0_1);
            yt0_0 = _loll(x_1o_yt0_0);
            yt0_1 = _loll(x_3o_yt0_1);

            xt1_0 = _hill(xt1_0_xt2_0);
            xt1_1 = _hill(xt1_1_xt2_1);
            yt1_0 = _loll(yt2_0_yt1_0);
            yt1_1 = _loll(yt2_1_yt1_1);

            xt2_0 = _loll(xt1_0_xt2_0);
            xt2_1 = _loll(xt1_1_xt2_1);
            yt2_0 = _hill(yt2_0_yt1_0);
            yt2_1 = _hill(yt2_1_yt1_1);

            /*-------------------------------------------------------------*/
            /*   x2[h2  ] = (si10 * yt1_0 + co10 * xt1_0) >> 15            */
            /*   x2[h2+1] = (co10 * yt1_0 - si10 * xt1_0) >> 15            */
            /*   x2[h2+2] = (si11 * yt1_1 + co11 * xt1_1) >> 15            */
            /*   x2[h2+3] = (co11 * yt1_1 - si11 * xt1_1) >> 15            */
            /*-------------------------------------------------------------*/
            p0 = _smpy32(si10, yt1_0);
            p1 = _smpy32(co10, xt1_0);
            xh2_0o = p0 + p1;

            p2 = _smpy32(co10, yt1_0);
            p3 = _smpy32(si10, xt1_0);
            xh2_1o = p2 - p3;

            p4 = _smpy32(si11, yt1_1);
            p5 = _smpy32(co11, xt1_1);
            xh2_2o = p4 + p5;

            p6 = _smpy32(co11, yt1_1);
            p7 = _smpy32(si11, xt1_1);
            xh2_3o = p6 - p7;

            /*-------------------------------------------------------------*/
            /*   x2[l1  ] = (si20 * yt0_0 + co20 * xt0_0) >> 15            */
            /*   x2[l1+1] = (co20 * yt0_0 - si20 * xt0_0) >> 15            */
            /*   x2[l1+2] = (si21 * yt0_1 + co21 * xt0_1) >> 15            */
            /*   x2[l1+3] = (co21 * yt0_1 - si21 * xt0_1) >> 15            */
            /*-------------------------------------------------------------*/
            p8 = _smpy32(si20, yt0_0);
            p9 = _smpy32(co20, xt0_0);
            xl1_0o = p8 + p9;

            pA = _smpy32(co20, yt0_0);
            pB = _smpy32(si20, xt0_0);
            xl1_1o = pA - pB;

            pC = _smpy32(si21, yt0_1);
            pD = _smpy32(co21, xt0_1);
            xl1_2o = pC + pD;

            pE = _smpy32(co21, yt0_1);
            pF = _smpy32(si21, xt0_1);
            xl1_3o = pE - pF;

            /*-------------------------------------------------------------*/
            /*   x2[l2  ] = (si30 * yt2_0 + co30 * xt2_0) >> 15            */
            /*   x2[l2+1] = (co30 * yt2_0 - si30 * xt2_0) >> 15            */
            /*   x2[l2+2] = (si31 * yt2_1 + co31 * xt2_1) >> 15            */
            /*   x2[l2+3] = (co31 * yt2_1 - si31 * xt2_1) >> 15            */
            /*-------------------------------------------------------------*/
            p10 = _smpy32(si30, yt2_0);
            p11 = _smpy32(co30, xt2_0);
            xl2_0o = p10 + p11;

            p12 = _smpy32(co30, yt2_0);
            p13 = _smpy32(si30, xt2_0);
            xl2_1o = p12 - p13;

            p14 = _smpy32(si31, yt2_1);
            p15 = _smpy32(co31, xt2_1);
            xl2_2o = p14 + p15;

            p16 = _smpy32(co31, yt2_1);
            p17 = _smpy32(si31, xt2_1);
            xl2_3o = p16 - p17;

             /*-----------------------------------------------------------*/
            /* Derive output pointers using the input pointer "x"        */
            /*-----------------------------------------------------------*/
            x0 = (int *) _mvd((int) x);
            x2 = (int *) _mvd((int) x0);

            /*-------------------------------------------------------------*/
            /*  Store eight outputs - four legs of each butterfly          */
            /*-------------------------------------------------------------*/
            _amemd8(&x2[0])    = _itod(_hill(x_1o_yt0_0), _hill(x_0o_xt0_0));;
            _amemd8(&x2[2])    = _itod(_hill(x_3o_yt0_1), _hill(x_2o_xt0_1));

            _amemd8(&x2[h2])   = _itod(xh2_1o, xh2_0o);
            _amemd8(&x2[h2+2]) = _itod(xh2_3o, xh2_2o);

            _amemd8(&x2[l1])   = _itod(xl1_1o, xl1_0o);
            _amemd8(&x2[l1+2]) = _itod(xl1_3o, xl1_2o);

            _amemd8(&x2[l2])   = _itod(xl2_1o, xl2_0o);
            _amemd8(&x2[l2+2]) = _itod(xl2_3o, xl2_2o);

            /*-----------------------------------------------------------*/
            /* When the twiddle factors are not to be re-used, j is      */
            /* incremented by 12, to reflect the fact that 6 words       */
            /* are consumed in every iteration. The input data pointer   */
            /* increments by 4. Note that within a stage, the stride     */
            /* does not change and hence the offsets for the other three */
            /* legs, 0, h2, l1, l2.                                      */
            /*-----------------------------------------------------------*/
            j += 12;
            x += 4;
            predj = (j - fft_jmp);
            if (!predj) x += fft_jmp;
            if (!predj) j = 0;
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
    int n0, j0;
    int * restrict x2, * restrict x0;
    int * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    int i, j, l1, h2;
    double x_10, x_32, x_54, x_76, x_98, x_BA, x_DC, x_FE;
    long long n00_n20, n01_n21, n10_n30, n11_n31;
    long long n02_n22, n03_n23, n12_n32, n13_n33;

    /*-----------------------------------------------------------------*/
    /* The following code performs a standard radix2 pass.             */
    /* Two pointers are used to access the input data.                 */
    /* The input data is read "N/4" complex samples apart or "N/2"     */
    /* words apart using pointers "x0" and "x2". This produces out-    */
    /* puts that are 0, N/8, N/2, 3N/8 for radix 2.                    */
    /*-----------------------------------------------------------------*/
    y0 = ptr_y;
    y2 = ptr_y + (int)npoints;
    x0 = ptr_x;
    x2 = ptr_x + (int)(npoints >> 1);

    /*------------------------------------------------------------*/
    /* The pointers are set at the following locations which are  */
    /* half the offsets of a radix4 FFT.                          */
    /*------------------------------------------------------------*/
    y1  = y0 + (int)(npoints >> 2);
    y3  = y2 + (int)(npoints >> 2);
    l1  = _norm(npoints) + 1;
    j0  = 8;
    n0  = npoints >> 1;

    /*-----------------------------------------------------------------*/
    /* The following code reads data indentically for either a radix 4 */
    /* or a radix 2 style decomposition. It writes out at different    */
    /* locations though. It checks if either half the points, or a     */
    /* quarter of the complex points have been exhausted to jump to    */
    /* pervent double reversal.                                        */
    /*-----------------------------------------------------------------*/
    j = 0;

    _nassert((int)(n0) % 4 == 0);
    _nassert((int)(ptr_x) % 8 == 0);
    _nassert((int)(ptr_y) % 8 == 0);
    _nassert((int)(x0) % 8 == 0);
    _nassert((int)(x2) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < npoints; i += 8) {
        /*-------------------------------------------------------------*/
        /* Digit reverse the index starting from 0. The increment to   */
        /* "j" is either by 4, or 8.                                   */
        /*-------------------------------------------------------------*/
        h2 = _deal(j);
        h2 = _bitr(h2);
        h2 = _rotl(h2, 16);
        h2 = _shfl(h2);
        h2 >>= l1;

        /*-------------------------------------------------------------*/
        /* Read in the input data, from the first eight locations.     */
        /* These are transformed as a radix2.                          */
        /*-------------------------------------------------------------*/
        x_10 = _amemd8(&x0[0]);
        x_32 = _amemd8(&x0[2]);
        x_54 = _amemd8(&x0[4]);
        x_76 = _amemd8(&x0[6]);
        x0 += 8;

        /*--------------------------------------------------------*/
        /* Perform radix2 style decomposition.                    */
        /*    n00 = x_0 + x_2;    n01 = x_1 + x_3;                */
        /*    n20 = x_0 - x_2;    n21 = x_1 - x_3;                */
        /*    n10 = x_4 + x_6;    n11 = x_5 + x_7;                */
        /*    n30 = x_4 - x_6;    n31 = x_5 - x_7;                */
        /*--------------------------------------------------------*/
        n00_n20 = _addsub(_lo(x_10), _lo(x_32));
        n01_n21 = _addsub(_hi(x_10), _hi(x_32));
        n10_n30 = _addsub(_lo(x_54), _lo(x_76));
        n11_n31 = _addsub(_hi(x_54), _hi(x_76));

        /*-------------------------------------------------------------*/
        /*  Store out the four outputs of 2 radix2 butterflies.        */
        /*-------------------------------------------------------------*/
        _amemd8(&y0[2*h2]) = _itod(_hill(n01_n21), _hill(n00_n20));
        _amemd8(&y1[2*h2]) = _itod(_hill(n11_n31), _hill(n10_n30));
        _amemd8(&y2[2*h2]) = _itod(_loll(n01_n21), _loll(n00_n20));
        _amemd8(&y3[2*h2]) = _itod(_loll(n11_n31), _loll(n10_n30));

        /*-------------------------------------------------------------*/
        /* Read in the next set of inputs from pointer "x2". These will*/
        /* produce outputs that are contiguous to the previous outputs.*/
        /*-------------------------------------------------------------*/
        x_98 = _amemd8(&x2[0]);
        x_BA = _amemd8(&x2[2]);
        x_DC = _amemd8(&x2[4]);
        x_FE = _amemd8(&x2[6]);

        x2 += 8;

        /*-------------------------------------------------------------*/
        /* Perform radix2 style decompositions.                        */
        /*    n02 = x_8 + x_A;    n03 = x_9 + x_B;                     */
        /*    n22 = x_8 - x_A;    n23 = x_9 - x_B;                     */
        /*    n12 = x_C + x_E;    n13 = x_D + x_F;                     */
        /*    n32 = x_C - x_E;    n33 = x_D - x_F;                     */
        /*-------------------------------------------------------------*/
        n02_n22 = _addsub(_lo(x_98), _lo(x_BA));
        n03_n23 = _addsub(_hi(x_98), _hi(x_BA));
        n12_n32 = _addsub(_lo(x_DC), _lo(x_FE));
        n13_n33 = _addsub(_hi(x_DC), _hi(x_FE));

        /*----------------------------------------------------------------*/
        /* Points that are read from succesive locations map              */
        /* to y, y[N/8], y[N/2],y[5N/8] in a radix4 scheme                */
        /*----------------------------------------------------------------*/
        _amemd8(&y0[2*h2 + 2]) = _itod(_hill(n03_n23), _hill(n02_n22));
        _amemd8(&y1[2*h2 + 2]) = _itod(_hill(n13_n33), _hill(n12_n32));
        _amemd8(&y2[2*h2 + 2]) = _itod(_loll(n03_n23), _loll(n02_n22));
        _amemd8(&y3[2*h2 + 2]) = _itod(_loll(n13_n33), _loll(n12_n32));

        /*---------------------------------------------------------------*/
        /* Increment j by "j0", if j is equal to n0, increment j by n0,  */
        /* that double reversal is avoided.                              */
        /*---------------------------------------------------------------*/
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
    int n0, j0;
    int * restrict x2, * restrict x0;
    int * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    int i, j, l1, h2;
    int xh0_2, xh1_2, xl0_2, xl1_2, xh0_3, xh1_3, xl0_3, xl1_3;
    int n02, n12, n22, n32, n03, n13, n23, n33;
    int xh0_0, xh1_0, xh0_1, xh1_1, xl0_0, xl1_0, xl0_1, xl1_1;
    double x_10, x_32, x_54, x_76, x_98, x_BA, x_DC, x_FE;
    long long xh0_0_xl0_0, xh1_0_xl1_0, xh0_1_xl0_1, xh1_1_xl1_1;
    long long xh0_2_xl0_2, xh1_2_xl1_2, xh0_3_xl0_3, xh1_3_xl1_3;
    long long n00_n20, n10_n30, n01_n21, n31_n11;
    long long n02_n22, n12_n32, n03_n23, n33_n13;

    /*-----------------------------------------------------------------*/
    /* The following code performs either a standard radix4 pass or a  */
    /* radix2 pass. Two pointers are used to access the input data.    */
    /* The input data is read "N/4" complex samples apart or "N/2"     */
    /* words apart using pointers "x0" and "x2". This produces out-    */
    /* puts that are 0, N/4, N/2, 3N/4 for a radix4 FFT, and 0, N/8    */
    /* N/2, 3N/8 for radix 2.                                          */
    /*-----------------------------------------------------------------*/
    y0 = ptr_y;
    y2 = ptr_y + (int)npoints;
    x0 = ptr_x;
    x2 = ptr_x + (int)(npoints >> 1);

    /*------------------------------------------------------------*/
    /* The pointers are set at the following locations.           */
    /*------------------------------------------------------------*/
    y1 = y0 + (int)(npoints >> 1);
    y3 = y2 + (int)(npoints >> 1);
    l1 = _norm(npoints) + 2;
    j0 = 4;
    n0 = npoints >> 2;

    /*-----------------------------------------------------------------*/
    /* The following code reads data indentically for either a radix 4 */
    /* or a radix 2 style decomposition. It writes out at different    */
    /* locations though. It checks if either half the points, or a     */
    /* quarter of the complex points have been exhausted to jump to    */
    /* pervent double reversal.                                        */
    /*-----------------------------------------------------------------*/
    j = 0;

    _nassert((int)(n0) % 4  == 0);
    _nassert((int)(x0) % 8 == 0);
    _nassert((int)(x2) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    _nassert(npoints >= 16);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < npoints; i += 8) {
        /*-------------------------------------------------------------*/
        /* Digit reverse the index starting from 0. The increment to   */
        /* "j" is either by 4, or 8.                                   */
        /*-------------------------------------------------------------*/
        h2 = _deal(j);
        h2 = _bitr(h2);
        h2 = _rotl(h2, 16);
        h2 = _shfl(h2);
        h2 >>= l1;

        /*-------------------------------------------------------------*/
        /* Read in the input data, from the first eight locations.     */
        /* These are transformed either as a radix4 or as a radix 2.   */
        /*-------------------------------------------------------------*/
        x_10 = _amemd8(&x0[0]);
        x_32 = _amemd8(&x0[2]);
        x_54 = _amemd8(&x0[4]);
        x_76 = _amemd8(&x0[6]);
        x0 += 8;

        xh0_0_xl0_0 = _addsub(_lo(x_10), _lo(x_54));
        xh1_0_xl1_0 = _addsub(_hi(x_10), _hi(x_54));
        xh0_1_xl0_1 = _addsub(_lo(x_32), _lo(x_76));
        xh1_1_xl1_1 = _addsub(_hi(x_32), _hi(x_76));

        xh0_0 = _hill(xh0_0_xl0_0);
        xh1_0 = _hill(xh1_0_xl1_0);
        xh0_1 = _hill(xh0_1_xl0_1);
        xh1_1 = _hill(xh1_1_xl1_1);
        xl0_0 = _loll(xh0_0_xl0_0);
        xl1_1 = _loll(xh1_1_xl1_1);
        xl1_0 = _loll(xh1_0_xl1_0);
        xl0_1 = _loll(xh0_1_xl0_1);

        n00_n20 = _addsub(xh0_0, xh0_1);
        n10_n30 = _addsub(xl0_0, xl1_1);
        n01_n21 = _addsub(xh1_0, xh1_1);
        n31_n11 = _addsub(xl1_0, xl0_1);

        /*-------------------------------------------------------------*/
        /*  Store out the four outputs of 1 radix4 butterfly or 2      */
        /*  radix2 butterflies.                                        */
        /*-------------------------------------------------------------*/
        _amemd8(&y0[2*h2]) = _itod(_hill(n01_n21), _hill(n00_n20));
        _amemd8(&y1[2*h2]) = _itod(_loll(n31_n11), _hill(n10_n30));
        _amemd8(&y2[2*h2]) = _itod(_loll(n01_n21), _loll(n00_n20));
        _amemd8(&y3[2*h2]) = _itod(_hill(n31_n11), _loll(n10_n30));

        /*-------------------------------------------------------------*/
        /* Read in the next set of inputs from pointer "x2". These will*/
        /* produce outputs that are contiguous to the previous outputs.*/
        /*-------------------------------------------------------------*/
        x_98 = _amemd8(&x2[0]);
        x_BA = _amemd8(&x2[2]);
        x_DC = _amemd8(&x2[4]);
        x_FE = _amemd8(&x2[6]);

        x2 += 8;

        /*-------------------------------------------------------------*/
        /* Perform radix4 style decompositions and overwrite results   */
        /* if it is dtermined that the radix to be used is radix 2.    */
        /*-------------------------------------------------------------*/
        xh0_2_xl0_2 = _addsub(_lo(x_98), _lo(x_DC));
        xh1_2_xl1_2 = _addsub(_hi(x_98), _hi(x_DC));
        xh0_3_xl0_3 = _addsub(_lo(x_BA), _lo(x_FE));
        xh1_3_xl1_3 = _addsub(_hi(x_BA), _hi(x_FE));

        xh0_2 = _hill(xh0_2_xl0_2);
        xh1_2 = _hill(xh1_2_xl1_2);
        xh0_3 = _hill(xh0_3_xl0_3);
        xh1_3 = _hill(xh1_3_xl1_3);
        xl0_2 = _loll(xh0_2_xl0_2);
        xl1_2 = _loll(xh1_2_xl1_2);
        xl0_3 = _loll(xh0_3_xl0_3);
        xl1_3 = _loll(xh1_3_xl1_3);

        n02_n22 = _addsub(xh0_2, xh0_3);
        n12_n32 = _addsub(xl0_2, xl1_3);
        n03_n23 = _addsub(xh1_2, xh1_3);
        n33_n13 = _addsub(xl1_2, xl0_3);

        n02 = _hill(n02_n22);
        n12 = _hill(n12_n32);
        n03 = _hill(n03_n23);
        n33 = _hill(n33_n13);
        n22 = _loll(n02_n22);
        n32 = _loll(n12_n32);
        n23 = _loll(n03_n23);
        n13 = _loll(n33_n13);

        /*----------------------------------------------------------------*/
        /* Points that are read from succesive locations map to y, y[N/4] */
        /* y[N/2], y[3N/4] in a radix4 scheme, y, y[N/8], y[N/2],y[5N/8]  */
        /*----------------------------------------------------------------*/
        _amemd8(&y0[2*h2 + 2]) = _itod(n03, n02);
        _amemd8(&y1[2*h2 + 2]) = _itod(n13, n12);
        _amemd8(&y2[2*h2 + 2]) = _itod(n23, n22);
        _amemd8(&y3[2*h2 + 2]) = _itod(n33, n32);
        /*---------------------------------------------------------------*/
        /* Increment j by "j0", if j is equal to n0, increment j by n0,  */
        /* that double reversal is avoided.                              */
        /*---------------------------------------------------------------*/
        j += j0;

        if (j == n0) {
            j += n0;
            x0 += (int)npoints >> 1;
            x2 += (int)npoints >> 1;
        }
    }
}
#else
void DSP_fft32x32_i (
    const int * restrict ptr_w,
    int npoints,
    int * restrict ptr_x,
    int * restrict ptr_y
)
{
    int * restrict w;
    int * restrict x, * restrict x2, * restrict x0;
    int i, j, l1, l2, h2, predj, tw_offset, stride, fft_jmp, radix;
    int si10, si20, si30, co10, co20, co30;
    int si11, si21, si31, co11, co21, co31;
    int xt0_0, yt0_0, yt0_1, xt0_1;
    int xt1_0, yt2_0, xt1_1, yt2_1, xt2_0, yt1_0, xt2_1, yt1_1; 
    int p0, p1, p2, p3, p4, p5, p6, p7, p8, p9, pA, pB, pC, pD, pE, pF;
    int p10, p11, p12, p13, p14, p15, p16, p17;
    int xh2_0o, xh2_1o, xh2_2o, xh2_3o;
    int xl1_0o, xl1_1o, xl1_2o, xl1_3o;
    int xl2_0o, xl2_1o, xl2_2o, xl2_3o;

    double x_01, x_23;
    double x_l1_01, x_l1_23, x_l2_01, x_l2_23, x_h2_01,x_h2_23;
    double si10_co10, si20_co20, si30_co30;
    double si11_co11, si21_co21, si31_co31;

    long long xh20_0_xl20_0, xh21_0_xl21_0, xh20_1_xl20_1, xh21_1_xl21_1; 
    long long xt1_0_xt2_0, yt2_0_yt1_0, xt1_1_xt2_1, yt2_1_yt1_1; 
    long long xh0_0_xl0_0, xh1_0_xl1_0, xh0_1_xl0_1, xh1_1_xl1_1; 
    long long x_0o_xt0_0, x_1o_yt0_0, x_2o_xt0_1, x_3o_yt0_1;

    /*---------------------------------------------------------------------*/
    /* Determine the magnitude od the number of points to be transformed.  */
    /* Check whether we can use a radix4 decomposition or a mixed radix    */
    /* transformation, by determining modulo 2.                            */
    /*---------------------------------------------------------------------*/
    radix = _norm(npoints) & 1 ? 2 :  4;

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
        j =  0;
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
        x = ptr_x;
        w = (int *)ptr_w + tw_offset;
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
        /* fft_jmp amount.                                                */
        /*----------------------------------------------------------------*/
        _nassert((int)(w) % 8 == 0);
        _nassert((int)(x) % 8 == 0);
        _nassert(h2 % 8 == 0);
        _nassert(l1 % 8 == 0);
        _nassert(l2 % 8 == 0);
        _nassert(npoints >= 16);
        #pragma MUST_ITERATE(16,,16);
        for (i = 0; i < (npoints >> 3); i++) {
            /*------------------------------------------------------------*/
            /*  Read the first six twiddle factor values. This loop       */
            /*  computes two radix 4 butterflies at a time.               */
            /* si10 = w[0] co10 = w[1]  si20 = w[2]  co20 = w[3]          */
            /* si30 = w[4] co30 = w[5]  si11 = w[6]  co11 = w[7]          */
            /* si21 = w[8] co21 = w[9]  si31 = w[a]  co31 = w[b]          */
            /*------------------------------------------------------------*/
            si10_co10 = _amemd8_const(&w[j]);
            si20_co20 = _amemd8_const(&w[j + 2]);
            si30_co30 = _amemd8_const(&w[j + 4]);

            si11_co11 = _amemd8_const(&w[j + 6]);
            si21_co21 = _amemd8_const(&w[j + 8]);
            si31_co31 = _amemd8_const(&w[j + 10]);

            co10 = _lo(si10_co10);
            si10 = _hi(si10_co10);
            co20 = _lo(si20_co20);
            si20 = _hi(si20_co20);
            co30 = _lo(si30_co30);
            si30 = _hi(si30_co30);

            co11 = _lo(si11_co11);
            si11 = _hi(si11_co11);
            co21 = _lo(si21_co21);
            si21 = _hi(si21_co21);
            co31 = _lo(si31_co31);
            si31 = _hi(si31_co31);

            /*-------------------------------------------------------------*/
            /* Read in the data elements for the eight inputs of two       */
            /* radix4 butterflies.                                         */
            /*  x[0]       x[1]       x[2]       x[3]                      */
            /*  x[h2+0]    x[h2+1]    x[h2+2]    x[h2+3]                   */
            /*  x[l1+0]    x[l1+1]    x[l1+2]    x[l1+3]                   */
            /*  x[l2+0]    x[l2+1]    x[l2+2]    x[l2+3]                   */
            /*-------------------------------------------------------------*/
            x_01    = _amemd8(&x[0]);
            x_23    = _amemd8(&x[2]);
            x_l1_01 = _amemd8(&x[l1]);
            x_l1_23 = _amemd8(&x[l1 + 2]);
            x_l2_01 = _amemd8(&x[l2]);
            x_l2_23 = _amemd8(&x[l2 + 2]);
            x_h2_01 = _amemd8(&x[h2]);
            x_h2_23 = _amemd8(&x[h2 + 2]);

            /*-------------------------------------------------------------*/
            /* xh0_0 = x[0] + x[l1];    xh1_0 = x[1] + x[l1+1]             */
            /* xh0_1 = x[2] + x[l1+2];  xh1_1 = x[3] + x[l1+3]             */
            /* xl0_0 = x[0] - x[l1];    xl1_0 = x[1] - x[l1+1]             */
            /* xl0_1 = x[2] - x[l1+2];  xl1_1 = x[3] - x[l1+3]             */
            /*-------------------------------------------------------------*/
            xh0_0_xl0_0 = _addsub(_hi(x_01), _hi(x_l1_01));
            xh1_0_xl1_0 = _addsub(_lo(x_01), _lo(x_l1_01));
            xh0_1_xl0_1 = _addsub(_hi(x_23), _hi(x_l1_23));
            xh1_1_xl1_1 = _addsub(_lo(x_23), _lo(x_l1_23));

            /*------------------------------------------------------------*/
            /* xh20_0 = x[h2  ] + x[l2  ]; xh21_0 = x[h2+1] + x[l2+1]     */
            /* xh20_1 = x[h2+2] + x[l2+2]; xh21_1 = x[h2+3] + x[l2+3]     */
            /* xl20_0 = x[h2  ] - x[l2  ]; xl21_0 = x[h2+1] - x[l2+1]     */
            /* xl20_1 = x[h2+2] - x[l2+2]; xl21_1 = x[h2+3] - x[l2+3]     */
            /*------------------------------------------------------------*/
            xh20_0_xl20_0 = _addsub(_hi(x_h2_01), _hi(x_l2_01));
            xh21_0_xl21_0 = _addsub(_lo(x_h2_01), _lo(x_l2_01));
            xh20_1_xl20_1 = _addsub(_hi(x_h2_23), _hi(x_l2_23));
            xh21_1_xl21_1 = _addsub(_lo(x_h2_23), _lo(x_l2_23));

            /*-------------------------------------------------------------*/
            /*    x_0o  = xh0_0 + xh20_0;    x_1o  = xh1_0 + xh21_0;       */
            /*    x_2o  = xh0_1 + xh20_1;    x_3o  = xh1_1 + xh21_1;       */
            /*    xt0_0 = xh0_0 - xh20_0;    yt0_0 = xh1_0 - xh21_0;       */
            /*    xt0_1 = xh0_1 - xh20_1;    yt0_1 = xh1_1 - xh21_1;       */
            /*-------------------------------------------------------------*/
            x_0o_xt0_0 = _addsub(_hill(xh0_0_xl0_0), _hill(xh20_0_xl20_0));
            x_1o_yt0_0 = _addsub(_hill(xh1_0_xl1_0), _hill(xh21_0_xl21_0));
            x_2o_xt0_1 = _addsub(_hill(xh0_1_xl0_1), _hill(xh20_1_xl20_1));
            x_3o_yt0_1 = _addsub(_hill(xh1_1_xl1_1), _hill(xh21_1_xl21_1));

            /*-------------------------------------------------------------*/
            /*    xt1_0 = xl0_0 + xl21_0;    yt2_0 = xl1_0 + xl20_0;       */
            /*    xt1_1 = xl0_1 + xl21_1;    yt2_1 = xl1_1 + xl20_1;       */
            /*    xt2_0 = xl0_0 - xl21_0;    yt1_0 = xl1_0 - xl20_0;       */
            /*    xt2_1 = xl0_1 - xl21_1;    yt1_1 = xl1_1 - xl20_1;       */
            /*-------------------------------------------------------------*/
            xt1_0_xt2_0 = _addsub(_loll(xh0_0_xl0_0), _loll(xh21_0_xl21_0));
            yt2_0_yt1_0 = _addsub(_loll(xh1_0_xl1_0), _loll(xh20_0_xl20_0));
            xt1_1_xt2_1 = _addsub(_loll(xh0_1_xl0_1), _loll(xh21_1_xl21_1));
            yt2_1_yt1_1 = _addsub(_loll(xh1_1_xl1_1), _loll(xh20_1_xl20_1));

            xt0_0 = _loll(x_0o_xt0_0);
            xt0_1 = _loll(x_2o_xt0_1);
            yt0_0 = _loll(x_1o_yt0_0);
            yt0_1 = _loll(x_3o_yt0_1);

            xt1_0 = _hill(xt1_0_xt2_0);
            xt1_1 = _hill(xt1_1_xt2_1);
            yt1_0 = _loll(yt2_0_yt1_0);
            yt1_1 = _loll(yt2_1_yt1_1);

            xt2_0 = _loll(xt1_0_xt2_0);
            xt2_1 = _loll(xt1_1_xt2_1);
            yt2_0 = _hill(yt2_0_yt1_0);
            yt2_1 = _hill(yt2_1_yt1_1);

            /*-------------------------------------------------------------*/
            /*   x2[h2  ] = (si10 * yt1_0 + co10 * xt1_0) >> 15            */
            /*   x2[h2+1] = (co10 * yt1_0 - si10 * xt1_0) >> 15            */
            /*   x2[h2+2] = (si11 * yt1_1 + co11 * xt1_1) >> 15            */
            /*   x2[h2+3] = (co11 * yt1_1 - si11 * xt1_1) >> 15            */
            /*-------------------------------------------------------------*/
            p0 = _smpy32(si10, yt1_0);
            p1 = _smpy32(co10, xt1_0);
            xh2_0o = p0 + p1;

            p2 = _smpy32(co10, yt1_0);
            p3 = _smpy32(si10, xt1_0);
            xh2_1o = p2 - p3;

            p4 = _smpy32(si11, yt1_1);
            p5 = _smpy32(co11, xt1_1);
            xh2_2o = p4 + p5;

            p6 = _smpy32(co11, yt1_1);
            p7 = _smpy32(si11, xt1_1);
            xh2_3o = p6 - p7;

            /*-------------------------------------------------------------*/
            /*   x2[l1  ] = (si20 * yt0_0 + co20 * xt0_0) >> 15            */
            /*   x2[l1+1] = (co20 * yt0_0 - si20 * xt0_0) >> 15            */
            /*   x2[l1+2] = (si21 * yt0_1 + co21 * xt0_1) >> 15            */
            /*   x2[l1+3] = (co21 * yt0_1 - si21 * xt0_1) >> 15            */
            /*-------------------------------------------------------------*/
            p8 = _smpy32(si20, yt0_0);
            p9 = _smpy32(co20, xt0_0);
            xl1_0o = p8 + p9;

            pA = _smpy32(co20, yt0_0);
            pB = _smpy32(si20, xt0_0);
            xl1_1o = pA - pB;

            pC = _smpy32(si21, yt0_1);
            pD = _smpy32(co21, xt0_1);
            xl1_2o = pC + pD;

            pE = _smpy32(co21, yt0_1);
            pF = _smpy32(si21, xt0_1);
            xl1_3o = pE - pF;

            /*-------------------------------------------------------------*/
            /*   x2[l2  ] = (si30 * yt2_0 + co30 * xt2_0) >> 15            */
            /*   x2[l2+1] = (co30 * yt2_0 - si30 * xt2_0) >> 15            */
            /*   x2[l2+2] = (si31 * yt2_1 + co31 * xt2_1) >> 15            */
            /*   x2[l2+3] = (co31 * yt2_1 - si31 * xt2_1) >> 15            */
            /*-------------------------------------------------------------*/
            p10 = _smpy32(si30, yt2_0);
            p11 = _smpy32(co30, xt2_0);
            xl2_0o = p10 + p11;

            p12 = _smpy32(co30, yt2_0);
            p13 = _smpy32(si30, xt2_0);
            xl2_1o = p12 - p13;

            p14 = _smpy32(si31, yt2_1);
            p15 = _smpy32(co31, xt2_1);
            xl2_2o = p14 + p15;

            p16 = _smpy32(co31, yt2_1);
            p17 = _smpy32(si31, xt2_1);
            xl2_3o = p16 - p17;

            /*-----------------------------------------------------------*/
            /* Derive output pointers using the input pointer "x"        */
            /*-----------------------------------------------------------*/
            x0 = (int *) _mvd((int) x);
            x2 = (int *) _mvd((int) x0);

            /*-------------------------------------------------------------*/
            /*  Store eight outputs - four legs of each butterfly          */
            /*-------------------------------------------------------------*/
            _amemd8(&x2[0])    = _itod(_hill(x_0o_xt0_0), _hill(x_1o_yt0_0));;
            _amemd8(&x2[2])    = _itod(_hill(x_2o_xt0_1), _hill(x_3o_yt0_1));

            _amemd8(&x2[h2])   = _itod(xh2_0o, xh2_1o);
            _amemd8(&x2[h2+2]) = _itod(xh2_2o, xh2_3o);

            _amemd8(&x2[l1])   = _itod(xl1_0o, xl1_1o);
            _amemd8(&x2[l1+2]) = _itod(xl1_2o, xl1_3o);

            _amemd8(&x2[l2])   = _itod(xl2_0o, xl2_1o);
            _amemd8(&x2[l2+2]) = _itod(xl2_2o, xl2_3o);

            /*-----------------------------------------------------------*/
            /* When the twiddle factors are not to be re-used, j is      */
            /* incremented by 12, to reflect the fact that 6 words       */
            /* are consumed in every iteration. The input data pointer   */
            /* increments by 4. Note that within a stage, the stride     */
            /* does not change and hence the offsets for the other three */
            /* legs, 0, h2, l1, l2.                                      */
            /*-----------------------------------------------------------*/
            j += 12;
            x += 4;
            predj = (j - fft_jmp);
            if (!predj) x += fft_jmp;
            if (!predj) j = 0;
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
    int n0, j0;
    int * restrict x2, * restrict x0;
    int * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    int i, j, l1, h2;
    double x_01, x_23, x_45, x_67, x_89, x_AB, x_CD, x_EF;
    long long n00_n20, n01_n21, n10_n30, n11_n31;
    long long n02_n22, n03_n23, n12_n32, n13_n33;

    /*-----------------------------------------------------------------*/
    /* The following code performs a standard radix2 pass.             */
    /* Two pointers are used to access the input data.                 */
    /* The input data is read "N/4" complex samples apart or "N/2"     */
    /* words apart using pointers "x0" and "x2". This produces out-    */
    /* puts that are 0, N/8, N/2, 3N/8 for radix 2.                    */
    /*-----------------------------------------------------------------*/
    y0 = ptr_y;
    y2 = ptr_y + (int)npoints;
    x0 = ptr_x;
    x2 = ptr_x + (int)(npoints >> 1);

    /*------------------------------------------------------------*/
    /* The pointers are set at the following locations which are  */
    /* half the offsets of a radix4 FFT.                          */
    /*------------------------------------------------------------*/
    y1  = y0 + (int)(npoints >> 2);
    y3  = y2 + (int)(npoints >> 2);
    l1  = _norm(npoints) + 1;
    j0  = 8;
    n0  = npoints >> 1;

    /*-----------------------------------------------------------------*/
    /* The following code reads data indentically for either a radix 4 */
    /* or a radix 2 style decomposition. It writes out at different    */
    /* locations though. It checks if either half the points, or a     */
    /* quarter of the complex points have been exhausted to jump to    */
    /* pervent double reversal.                                        */
    /*-----------------------------------------------------------------*/
    j = 0;

    _nassert((int)(n0) % 4 == 0);
    _nassert((int)(ptr_x) % 8 == 0);
    _nassert((int)(ptr_y) % 8 == 0);
    _nassert((int)(x0) % 8 == 0);
    _nassert((int)(x2) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < npoints; i += 8) {
        /*-------------------------------------------------------------*/
        /* Digit reverse the index starting from 0. The increment to   */
        /* "j" is either by 4, or 8.                                   */
        /*-------------------------------------------------------------*/
        h2 = _deal(j);
        h2 = _bitr(h2);
        h2 = _rotl(h2, 16);
        h2 = _shfl(h2);
        h2 >>= l1;

        /*-------------------------------------------------------------*/
        /* Read in the input data, from the first eight locations.     */
        /* These are transformed as a radix2.                          */
        /*-------------------------------------------------------------*/
        x_01 = _amemd8(&x0[0]);
        x_23 = _amemd8(&x0[2]);
        x_45 = _amemd8(&x0[4]);
        x_67 = _amemd8(&x0[6]);
        x0 += 8;

        /*--------------------------------------------------------*/
        /* Perform radix2 style decomposition.                    */
        /*    n00 = x_0 + x_2;    n01 = x_1 + x_3;                */
        /*    n20 = x_0 - x_2;    n21 = x_1 - x_3;                */
        /*    n10 = x_4 + x_6;    n11 = x_5 + x_7;                */
        /*    n30 = x_4 - x_6;    n31 = x_5 - x_7;                */
        /*--------------------------------------------------------*/
        n00_n20 = _addsub(_hi(x_01), _hi(x_23));
        n01_n21 = _addsub(_lo(x_01), _lo(x_23));
        n10_n30 = _addsub(_hi(x_45), _hi(x_67));
        n11_n31 = _addsub(_lo(x_45), _lo(x_67));

        /*-------------------------------------------------------------*/
        /*  Store out the four outputs of 2 radix2 butterflies.        */
        /*-------------------------------------------------------------*/
        _amemd8(&y0[2*h2]) = _itod(_hill(n00_n20), _hill(n01_n21));
        _amemd8(&y1[2*h2]) = _itod(_hill(n10_n30), _hill(n11_n31));
        _amemd8(&y2[2*h2]) = _itod(_loll(n00_n20), _loll(n01_n21));
        _amemd8(&y3[2*h2]) = _itod(_loll(n10_n30), _loll(n11_n31));

        /*-------------------------------------------------------------*/
        /* Read in the next set of inputs from pointer "x2". These will*/
        /* produce outputs that are contiguous to the previous outputs.*/
        /*-------------------------------------------------------------*/
        x_89 = _amemd8(&x2[0]);
        x_AB = _amemd8(&x2[2]);
        x_CD = _amemd8(&x2[4]);
        x_EF = _amemd8(&x2[6]);

        x2 += 8;

        /*-------------------------------------------------------------*/
        /* Perform radix2 style decompositions.                        */
        /*    n02 = x_8 + x_A;    n03 = x_9 + x_B;                     */
        /*    n22 = x_8 - x_A;    n23 = x_9 - x_B;                     */
        /*    n12 = x_C + x_E;    n13 = x_D + x_F;                     */
        /*    n32 = x_C - x_E;    n33 = x_D - x_F;                     */
        /*-------------------------------------------------------------*/
        n02_n22 = _addsub(_hi(x_89), _hi(x_AB));
        n03_n23 = _addsub(_lo(x_89), _lo(x_AB));
        n12_n32 = _addsub(_hi(x_CD), _hi(x_EF));
        n13_n33 = _addsub(_lo(x_CD), _lo(x_EF));

        /*----------------------------------------------------------------*/
        /* Points that are read from succesive locations map              */
        /* to y, y[N/8], y[N/2],y[5N/8] in a radix4 scheme                */
        /*----------------------------------------------------------------*/
        _amemd8(&y0[2*h2 + 2]) = _itod(_hill(n02_n22), _hill(n03_n23));
        _amemd8(&y1[2*h2 + 2]) = _itod(_hill(n12_n32), _hill(n13_n33));
        _amemd8(&y2[2*h2 + 2]) = _itod(_loll(n02_n22), _loll(n03_n23));
        _amemd8(&y3[2*h2 + 2]) = _itod(_loll(n12_n32), _loll(n13_n33));

        /*---------------------------------------------------------------*/
        /* Increment j by "j0", if j is equal to n0, increment j by n0,  */
        /* that double reversal is avoided.                              */
        /*---------------------------------------------------------------*/
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
    int n0, j0;
    int * restrict x2, * restrict x0;
    int * restrict y0, * restrict y1, * restrict y2, * restrict y3;
    int i, j, l1, h2;
    int xh0_2, xh1_2, xl0_2, xl1_2, xh0_3, xh1_3, xl0_3, xl1_3;
    int n02, n12, n22, n32, n03, n13, n23, n33;
    int xh0_0, xh1_0, xh0_1, xh1_1, xl0_0, xl1_0, xl0_1, xl1_1;
    double x_01, x_23, x_45, x_67, x_89, x_AB, x_CD, x_EF;
    long long xh0_0_xl0_0, xh1_0_xl1_0, xh0_1_xl0_1, xh1_1_xl1_1;
    long long xh0_2_xl0_2, xh1_2_xl1_2, xh0_3_xl0_3, xh1_3_xl1_3;
    long long n00_n20, n10_n30, n01_n21, n31_n11;
    long long n02_n22, n12_n32, n03_n23, n33_n13;

    /*-----------------------------------------------------------------*/
    /* The following code performs either a standard radix4 pass or a  */
    /* radix2 pass. Two pointers are used to access the input data.    */
    /* The input data is read "N/4" complex samples apart or "N/2"     */
    /* words apart using pointers "x0" and "x2". This produces out-    */
    /* puts that are 0, N/4, N/2, 3N/4 for a radix4 FFT, and 0, N/8    */
    /* N/2, 3N/8 for radix 2.                                          */
    /*-----------------------------------------------------------------*/
    y0 = ptr_y;
    y2 = ptr_y + (int)npoints;
    x0 = ptr_x;
    x2 = ptr_x + (int)(npoints >> 1);

    /*------------------------------------------------------------*/
    /* The pointers are set at the following locations.           */
    /*------------------------------------------------------------*/
    y1 = y0 + (int)(npoints >> 1);
    y3 = y2 + (int)(npoints >> 1);
    l1 = _norm(npoints) + 2;
    j0 = 4;
    n0 = npoints >> 2;

    /*-----------------------------------------------------------------*/
    /* The following code reads data indentically for either a radix 4 */
    /* or a radix 2 style decomposition. It writes out at different    */
    /* locations though. It checks if either half the points, or a     */
    /* quarter of the complex points have been exhausted to jump to    */
    /* pervent double reversal.                                        */
    /*-----------------------------------------------------------------*/
    j = 0;

    _nassert((int)(n0) % 4  == 0);
    _nassert((int)(x0) % 8 == 0);
    _nassert((int)(x2) % 8 == 0);
    _nassert((int)(y0) % 8 == 0);
    _nassert(npoints >= 16);
    #pragma MUST_ITERATE(2,,2);
    for (i = 0; i < npoints; i += 8) {
        /*-------------------------------------------------------------*/
        /* Digit reverse the index starting from 0. The increment to   */
        /* "j" is either by 4, or 8.                                   */
        /*-------------------------------------------------------------*/
        h2 = _deal(j);
        h2 = _bitr(h2);
        h2 = _rotl(h2, 16);
        h2 = _shfl(h2);
        h2 >>= l1;

        /*-------------------------------------------------------------*/
        /* Read in the input data, from the first eight locations.     */
        /* These are transformed either as a radix4 or as a radix 2.   */
        /*-------------------------------------------------------------*/
        x_01 = _amemd8(&x0[0]);
        x_23 = _amemd8(&x0[2]);
        x_45 = _amemd8(&x0[4]);
        x_67 = _amemd8(&x0[6]);
        x0 += 8;

        xh0_0_xl0_0 = _addsub(_hi(x_01), _hi(x_45));
        xh1_0_xl1_0 = _addsub(_lo(x_01), _lo(x_45));
        xh0_1_xl0_1 = _addsub(_hi(x_23), _hi(x_67));
        xh1_1_xl1_1 = _addsub(_lo(x_23), _lo(x_67));

        xh0_0 = _hill(xh0_0_xl0_0);
        xh1_0 = _hill(xh1_0_xl1_0);
        xh0_1 = _hill(xh0_1_xl0_1);
        xh1_1 = _hill(xh1_1_xl1_1);
        xl0_0 = _loll(xh0_0_xl0_0);
        xl1_1 = _loll(xh1_1_xl1_1);
        xl1_0 = _loll(xh1_0_xl1_0);
        xl0_1 = _loll(xh0_1_xl0_1);

        n00_n20 = _addsub(xh0_0, xh0_1);
        n10_n30 = _addsub(xl0_0, xl1_1);
        n01_n21 = _addsub(xh1_0, xh1_1);
        n31_n11 = _addsub(xl1_0, xl0_1);

        /*-------------------------------------------------------------*/
        /*  Store out the four outputs of 1 radix4 butterfly or 2      */
        /*  radix2 butterflies.                                        */
        /*-------------------------------------------------------------*/
        _amemd8(&y0[2*h2]) = _itod(_hill(n00_n20), _hill(n01_n21));
        _amemd8(&y1[2*h2]) = _itod(_hill(n10_n30), _loll(n31_n11));
        _amemd8(&y2[2*h2]) = _itod(_loll(n00_n20), _loll(n01_n21));
        _amemd8(&y3[2*h2]) = _itod(_loll(n10_n30), _hill(n31_n11));

        /*-------------------------------------------------------------*/
        /* Read in the next set of inputs from pointer "x2". These will*/
        /* produce outputs that are contiguous to the previous outputs.*/
        /*-------------------------------------------------------------*/
        x_89 = _amemd8(&x2[0]);
        x_AB = _amemd8(&x2[2]);
        x_CD = _amemd8(&x2[4]);
        x_EF = _amemd8(&x2[6]);

        x2 += 8;

        /*-------------------------------------------------------------*/
        /* Perform radix4 style decompositions and overwrite results   */
        /* if it is dtermined that the radix to be used is radix 2.    */
        /*-------------------------------------------------------------*/
        xh0_2_xl0_2 = _addsub(_hi(x_89), _hi(x_CD));
        xh1_2_xl1_2 = _addsub(_lo(x_89), _lo(x_CD));
        xh0_3_xl0_3 = _addsub(_hi(x_AB), _hi(x_EF));
        xh1_3_xl1_3 = _addsub(_lo(x_AB), _lo(x_EF));

        xh0_2 = _hill(xh0_2_xl0_2);
        xh1_2 = _hill(xh1_2_xl1_2);
        xh0_3 = _hill(xh0_3_xl0_3);
        xh1_3 = _hill(xh1_3_xl1_3);
        xl0_2 = _loll(xh0_2_xl0_2);
        xl1_2 = _loll(xh1_2_xl1_2);
        xl0_3 = _loll(xh0_3_xl0_3);
        xl1_3 = _loll(xh1_3_xl1_3);

        n02_n22 = _addsub(xh0_2, xh0_3);
        n12_n32 = _addsub(xl0_2, xl1_3);
        n03_n23 = _addsub(xh1_2, xh1_3);
        n33_n13 = _addsub(xl1_2, xl0_3);

        n02 = _hill(n02_n22);
        n12 = _hill(n12_n32);
        n03 = _hill(n03_n23);
        n33 = _hill(n33_n13);
        n22 = _loll(n02_n22);
        n32 = _loll(n12_n32);
        n23 = _loll(n03_n23);
        n13 = _loll(n33_n13);

        /*----------------------------------------------------------------*/
        /* Points that are read from succesive locations map to y, y[N/4] */
        /* y[N/2], y[3N/4] in a radix4 scheme, y, y[N/8], y[N/2],y[5N/8]  */
        /*----------------------------------------------------------------*/
        _amemd8(&y0[2*h2 + 2]) = _itod(n02, n03);
        _amemd8(&y1[2*h2 + 2]) = _itod(n12, n13);
        _amemd8(&y2[2*h2 + 2]) = _itod(n22, n23);
        _amemd8(&y3[2*h2 + 2]) = _itod(n32, n33);

        /*---------------------------------------------------------------*/
        /* Increment j by "j0", if j is equal to n0, increment j by n0,  */
        /* that double reversal is avoided.                              */
        /*---------------------------------------------------------------*/
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
/*  End of file: DSP_fft32x32_i.c                                           */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */

