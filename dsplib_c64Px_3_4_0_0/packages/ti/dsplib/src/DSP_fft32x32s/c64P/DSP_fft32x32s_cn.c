/* ======================================================================= */
/*  TEXAS INSTRUMENTS, INC.                                                */
/*                                                                         */
/*  NAME                                                                   */
/*      DSP_fft32x32s_cn -- fft32x32s                                      */
/*                                                                         */
/*     USAGE                                                               */
/*           This routine is C-callable and can be called as:              */
/*                                                                         */
/*          void fft32x32s_cn (                                            */
/*              const int * ptr_w,                                         */
/*              int npoints,                                               */
/*              int * ptr_x,                                               */
/*              int * ptr_y                                                */
/*          );                                                             */
/*                                                                         */
/*            ptr_w   =  input twiddle factors                             */
/*            npoints =  number of points                                  */
/*            ptr_x   =  transformed data reversed                         */
/*            ptr_y   =  linear transformed data                           */
/*                                                                         */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      The following code performs a mixed radix FFT for "npoints" which  */
/*      is either a multiple of 4 or 2. It uses logN4 - 1 stages of radix4 */
/*      transform and performs either a radix2 or radix4 transform on the  */
/*      last stage depending on "npoints". If "npoints" is a multiple of 4 */
/*      then this last stage is also a radix4 transform, otherwise it is a */
/*      radix2 transform.                                                  */
/*                                                                         */
/*                                                                         */
/*                                                                         */
/*                                                                         */
/*  ASSUMPTIONS                                                            */
/*      This code works for  both "npoints" a multiple of 2 or 4.          */
/*      The arrays 'x[]', 'y[]', and 'w[]' all must be aligned on a        */
/*      double-word boundary for the "optimized" implementations.          */
/*      The input and output data are complex, with the real/imaginary     */
/*      components stored in adjacent locations in the array.  The real    */
/*      components are stored at even array indices, and the imaginary     */
/*      components are stored at odd array indices. The input, twiddle     */
/*      factors are in 32 bit precision. The 32 by 32 multiplies are       */
/*      done with the CMPYR instruction.                                   */
/*                                                                         */
/*  TECHNIQUES                                                             */
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
/*      a) Inner loop "i0" iterates a veriable number of times. In         */
/*      particular the number of iterations quadruples every time from     */
/*      1..N/4. Hence software pipelining a loop that iterates a vraiable  */
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
/*      In the folllowing code since all data elements are 32 bits, add2   */
/*      sub2 are replaced with normal 32 bit add's and subtracts.          */
/*      The packed words "yt1_xt1" allows the loaded"sc" twiddle factor    */
/*      to be used for the complex multiplies. The real part of the        */
/*      multiply and the imaginary part of the multiply are performed      */
/*      as 16x32 multiplies using MPYLIR and MPYHIR                        */
/*                                                                         */
/*      (X + jY) ( C + j S) = (XC + YS) + j (YC - XS).                     */
/*                                                                         */
/*      The actual twiddle factors for the FFT are cosine, - sine. The     */
/*      twiddle factors stored in the table are csine and sine, hence      */
/*      the sign of the "sine" term is comprehended during multipli-       */
/*      cation as shown above.                                             */
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

#pragma CODE_SECTION(DSP_fft32x32s_cn, ".text:ansi");

#include "DSP_fft32x32s_cn.h"

/*--------------------------------------------------------------------------*/
/* The following macro is used to obtain a digit reversed index, of a given */
/* number i, into j where the number of bits in "i" is "m". For the natural */
/* form of C code, this is done by first interchanging every set of "2 bit" */
/* pairs, followed by exchanging nibbles, followed by exchanging bytes, and */
/* finally halfwords. To give an example, condider the following number:    */
/*                                                                          */
/* N = FEDCBA9876543210, where each digit represents a bit, the following   */
/* steps illustrate the changes as the exchanges are performed:             */
/* M = DCFE98BA54761032 is the number after every "2 bits" are exchanged.   */
/* O = 98BADCFE10325476 is the number after every nibble is exchanged.      */
/* P = 1032547698BADCFE is the number after every byte is exchanged.        */
/* Since only 16 digits were considered this represents the digit reversed  */
/* index. Since the numbers are represented as 32 bits, there is one more   */
/* step typically of exchanging the half words as well.                     */
/*--------------------------------------------------------------------------*/ 

#if 0
# define DIG_REV(i, m, j) ((j) = (_shfl(_rotl(_bitr(_deal(i)), 16)) >> (m)))
#else
# define DIG_REV(i, m, j)                                                   \
    do {                                                                    \
        unsigned _ = (i);                                                   \
        _ = ((_ & 0x33333333) <<  2) | ((_ & ~0x33333333) >>  2);           \
        _ = ((_ & 0x0F0F0F0F) <<  4) | ((_ & ~0x0F0F0F0F) >>  4);           \
        _ = ((_ & 0x00FF00FF) <<  8) | ((_ & ~0x00FF00FF) >>  8);           \
        _ = ((_ & 0x0000FFFF) << 16) | ((_ & ~0x0000FFFF) >> 16);           \
        (j) = _ >> (m);                                                     \
    } while (0)
#endif           

#define SMPY_32(x,y)\
             (int)(((long long)(x)*(long long)(y))>>31)


void DSP_fft32x32s_cn (
    const int * ptr_w,
    int npoints,
    int * ptr_x,
    int * ptr_y
)
{
    int   i, j, l1, l2, h2, predj, tw_offset, stride, fft_jmp;
    int   xt0_0, yt0_0, xt1_0, yt1_0, xt2_0, yt2_0;
    int   xh0_0, xh1_0, xh20_0, xh21_0, xl0_0, xl1_0, xl20_0, xl21_0;
    int   xh0_1, xh1_1, xl0_1, xl1_1;
    int   x_0, x_1, x_2, x_3, x_l1_0, x_l1_1, x_l2_0, x_l2_1;
    int   xh0_2, xh1_2, xl0_2, xl1_2, xh0_3, xh1_3, xl0_3, xl1_3;
    int   x_4, x_5, x_6, x_7, x_h2_0, x_h2_1;
    int   x_8, x_9, x_a, x_b, x_c, x_d, x_e, x_f;
    int   si10, si20, si30, co10, co20, co30;
    const int   *w;
    int   *x, *x2, *x0;
    int   *y0, *y1, *y2, *y3;
    int   n00, n10, n20, n30, n01, n11, n21, n31;
    int   n02, n12, n22, n32, n03, n13, n23, n33;
    int   n0, j0;
    int   radix;
    int   norm;
    int   m;

    /*---------------------------------------------------------------------*/
    /* Determine the magnitude od the number of points to be transformed.  */
    /* Check whether we can use a radix4 decomposition or a mixed radix    */
    /* transformation, by determining modulo 2.                            */
    /*---------------------------------------------------------------------*/

    for (i = 31, m = 1; (npoints & (1 << i)) == 0; i--, m++) ;
    radix     = m & 1 ? 2 :  4;
    norm      = m - 2;          

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

    stride    =   npoints; 
    tw_offset =   0;
    fft_jmp   =   6 * stride;

    #ifndef NOASSUME
    _nassert(stride > 4);
    #pragma MUST_ITERATE(1,,1);
    #endif  

    while (stride > radix)
    {
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

        j         =  0;
        fft_jmp >>=  2;

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
        w = ptr_w + tw_offset;
        tw_offset += fft_jmp;

        stride >>=  2;

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

        #ifndef NOASSUME
        _nassert((int)(w)%8 == 0);
        _nassert((int)(x)%8 == 0);
        _nassert(h2 %8 == 0);
        _nassert(l1 %8 == 0);
        _nassert(l2 %8 == 0);
        _nassert(npoints >= 16);
        #pragma MUST_ITERATE(4, , 1);
        #endif      

        for (i = 0; i < npoints; i += 4)
        {
            /*------------------------------------------------------------*/
            /*  Read the first three twiddle factor values. This loop co- */
            /*  mputes one radix 4 butterfly at a time.                   */
            /*------------------------------------------------------------*/

            co10 = w[j+1];            si10 = w[j+0];
            co20 = w[j+3];            si20 = w[j+2];
            co30 = w[j+5];            si30 = w[j+4];
     
            /*-----------------------------------------------------------*/
            /* Read in the data elements for the four inputs of radix4   */
            /* butterfly.                                                */
            /*-----------------------------------------------------------*/

            x_0    = x[0];            x_1    = x[1];
            x_l1_0 = x[l1  ];         x_l1_1 = x[l1+1];
            x_l2_0 = x[l2  ];         x_l2_1 = x[l2+1];
            x_h2_0 = x[h2  ];         x_h2_1 = x[h2+1];

            /*-----------------------------------------------------------*/
            /* Perform radix2 style DIF butterflies, for initial radix4  */
            /*-----------------------------------------------------------*/    

            xh0_0    =   x_0        +       x_l1_0;      
            xh1_0    =   x_1        +       x_l1_1;
            xl0_0    =   x_0        -       x_l1_0;      
            xl1_0    =   x_1        -       x_l1_1;
            xh20_0   =   x_h2_0     +       x_l2_0;      
            xh21_0   =   x_h2_1     +       x_l2_1;
            xl20_0   =   x_h2_0     -       x_l2_0;      
            xl21_0   =   x_h2_1     -       x_l2_1;

            /*-----------------------------------------------------------*/
            /* Derive output pointers using the input pointer "x"        */
            /*-----------------------------------------------------------*/ 

            x0 = x;
            x2 = x0;

            /*-----------------------------------------------------------*/
            /* When the twiddle factors are not to be re-used, j is      */
            /* incremented by 6, to reflect the fact that 6 half words   */
            /* are consumed in every iteration. The input data pointer   */
            /* increments by 2. Note that within a stage, the stride     */
            /* does not change and hence the offsets for the other three */
            /* legs, 0, h2, l1, l2.                                      */
            /*-----------------------------------------------------------*/  

            j    += 6;
            x    += 2;
            predj = (j - fft_jmp);
            if (!predj) x += fft_jmp;
            if (!predj) j = 0;

            /*----------------------------------------------------------*/
            /* These four partial results can be re-written to show     */
            /* the underlying DIF structure similar to radix2 as        */
            /* follows:                                                 */
            /*                                                          */
            /* X(4k)  = (x(n)+x(n + N/2)) + (x(n+N/4)+ x(n + 3N/4))     */
            /* X(4k+1)= (x(n)-x(n + N/2)) -j(x(n+N/4) - x(n + 3N/4))    */
            /* x(4k+2)= (x(n)+x(n + N/2)) - (x(n+N/4)+ x(n + 3N/4))     */
            /* X(4k+3)= (x(n)-x(n + N/2)) +j(x(n+N/4) - x(n + 3N/4))    */
            /*                                                          */
            /* which leads to the real and imaginary values as foll:    */
            /*                                                          */
            /* y0r = x0r + x2r +  x1r +  x3r    =  xh0 + xh20           */
            /* y0i = x0i + x2i +  x1i +  x3i    =  xh1 + xh21           */
            /* y1r = x0r - x2r + (x1i -  x3i)   =  xl0 + xl21           */
            /* y1i = x0i - x2i - (x1r -  x3r)   =  xl1 - xl20           */
            /* y2r = x0r + x2r - (x1r +  x3r)   =  xh0 - xh20           */
            /* y2i = x0i + x2i - (x1i +  x3i    =  xh1 - xh21           */
            /* y3r = x0r - x2r - (x1i -  x3i)   =  xl0 - xl21           */
            /* y3i = x0i - x2i + (x1r -  x3r)   =  xl1 + xl20           */
            /* ---------------------------------------------------------*/    


            x0[0] = (xh0_0 + xh20_0) >> 1; 
            x0[1] = (xh1_0 + xh21_0) >> 1;

            xt0_0 = xh0_0 - xh20_0;        yt0_0 = xh1_0 - xh21_0;
            xt1_0 = xl0_0 + xl21_0;        yt2_0 = xl1_0 + xl20_0;
            xt2_0 = xl0_0 - xl21_0;        yt1_0 = xl1_0 - xl20_0;

            /*-----------------------------------------------------------*/
            /* The following multiplies are close to a true 32 by 32     */
            /* multiply instruction.                                     */
            /* Perform twiddle factor multiplies of three terms,top      */
            /* term does not have any multiplies. Note the twiddle       */
            /* factors for a normal FFT are C + j (-S). Since the        */
            /* factors that are stored are C + j S, this is              */
            /* corrected for in the multiplies.                          */
            /*                                                           */
            /* Y1 = (xt1 + jyt1) (c + js) = (xc + ys) + (yc -xs)         */ 
            /* There is a loss of 1.5 bits of accuracy. This arises be-  */
            /* cause the result of the low sixteen by sixteen bits is    */
            /* not computed and the multiply of the low by high is       */
            /* shifted by 16, and results in a loss of 1 bit.            */
            /* Multiplies are performed for all the three legs of the    */
            /* radix4 butterfly are performed. In addition note that     */
            /* themiddle two legs are swapped. This is based on work     */
            /* done by Panos Papamichalis, on obtaining bit reversed     */
            /* order from a radix 4 butterfly. This allows the last      */
            /* stage to be performed either as a radix4 or a radix2      */
            /* pass for this stage.                                      */
            /*-----------------------------------------------------------*/

            x2[h2  ] = SMPY_32(si10,yt1_0) + SMPY_32(co10, xt1_0);
            x2[h2+1] = SMPY_32(co10,yt1_0) - SMPY_32(si10, xt1_0);  
            x2[l1]   = SMPY_32(si20,yt0_0) + SMPY_32(co20, xt0_0);   
            x2[l1+1] = SMPY_32(co20,yt0_0) - SMPY_32(si20, xt0_0); 
            x2[l2]   = SMPY_32(si30,yt2_0) + SMPY_32(co30, xt2_0);
            x2[l2+1] = SMPY_32(co30,yt2_0) - SMPY_32(si30, xt2_0);
        }
    } 

    /*-----------------------------------------------------------------*/
    /* The following code performs either a standard radix4 pass or a  */
    /* radix2 pass. Two pointers are used to access the input data.    */
    /* The input data is read "N/4" complex samples apart or "N/2"     */
    /* words apart using pointers "x0" and "x2". This produces out-    */
    /* puts that are 0, N/4, N/2, 3N/4 for a radix4 FFT, and 0, N/8    */
    /* N/2, 3N/8 for radix 2.                                          */
    /*-----------------------------------------------------------------*/      

    y0 = ptr_y;
    y2 = ptr_y + (int) npoints;
    x0 = ptr_x;
    x2 = ptr_x + (int) (npoints>>1);

    if (radix == 2)
    {
        /*------------------------------------------------------------*/
        /* The pointers are set at the following locations which are  */
        /* half the offsets of a radix4 FFT.                          */
        /*------------------------------------------------------------*/ 

        y1  = y0 + (int) (npoints >> 2);
        y3  = y2 + (int) (npoints >> 2);
        l1  = norm + 1;
        j0  = 8;
        n0  = npoints >> 1;
    } 
    else 
    {
        y1  = y0 + (int) (npoints >> 1);
        y3  = y2 + (int) (npoints >> 1);
        l1  = norm + 2;
        j0  = 4;
        n0  = npoints >> 2;
    }

    /*-----------------------------------------------------------------*/
    /* The following code reads data indentically for either a radix 4 */
    /* or a radix 2 style decomposition. It writes out at different    */
    /* locations though. It checks if either half the points, or a     */
    /* quarter of the complex points have been exhausted to jump to    */
    /* pervent double reversal.                                        */
    /*-----------------------------------------------------------------*/

    j = 0;

    #ifndef NOASSUME
    _nassert((int)(n0)%4  == 0);
    _nassert((int)(x0)%8 == 0);
    _nassert((int)(x2)%8 == 0);
    _nassert((int)(y0)%8 == 0);
    #pragma MUST_ITERATE(2,,2);
    #endif 

    for (i = 0; i < npoints; i += 8)
    {
        /*-------------------------------------------------------------*/
        /* Digit reverse the index starting from 0. The increment to   */
        /* "j" is either by 4, or 8.                                   */
        /*-------------------------------------------------------------*/

        DIG_REV(j, l1, h2);

        /*-------------------------------------------------------------*/
        /* Read in the input data, from the first eight locations.     */
        /* These are transformed either as a radix4 or as a radix 2.   */
        /*-------------------------------------------------------------*/  

        x_0 = x0[0];         x_1 = x0[1];
        x_2 = x0[2];         x_3 = x0[3];
        x_4 = x0[4];         x_5 = x0[5];
        x_6 = x0[6];         x_7 = x0[7];
        x0 += 8;

        xh0_0 = x_0 + x_4; xh1_0 = x_1 + x_5;
        xl0_0 = x_0 - x_4; xl1_0 = x_1 - x_5;
        xh0_1 = x_2 + x_6; xh1_1 = x_3 + x_7;
        xl0_1 = x_2 - x_6; xl1_1 = x_3 - x_7;

        n00 = xh0_0 + xh0_1; n01 = xh1_0 + xh1_1;
        n10 = xl0_0 + xl1_1; n11 = xl1_0 - xl0_1;
        n20 = xh0_0 - xh0_1; n21 = xh1_0 - xh1_1;
        n30 = xl0_0 - xl1_1; n31 = xl1_0 + xl0_1; 

        if (radix == 2)
        {
             /*--------------------------------------------------------*/
             /* Perform radix2 style decomposition.                    */
             /*--------------------------------------------------------*/ 
  
             n00 = x_0 + x_2;     n01 = x_1 + x_3;
             n20 = x_0 - x_2;     n21 = x_1 - x_3;
             n10 = x_4 + x_6;     n11 = x_5 + x_7;
             n30 = x_4 - x_6;     n31 = x_5 - x_7;
        }

        /*-------------------------------------------------------------*/
        /*  Store out the four outputs of 1 radix4 butterfly or 2      */
        /*  radix2 butterflies.                                        */
        /*-------------------------------------------------------------*/

        y0[2*h2] = n00;            y0[2*h2 + 1] = n01;
        y1[2*h2] = n10;            y1[2*h2 + 1] = n11;
        y2[2*h2] = n20;            y2[2*h2 + 1] = n21;
        y3[2*h2] = n30;            y3[2*h2 + 1] = n31;

        /*-------------------------------------------------------------*/
        /* Read in the next set of inputs from pointer "x2". These will*/
        /* produce outputs that are contiguous to the previous outputs.*/
        /*-------------------------------------------------------------*/

        x_8 = x2[0];               x_9 = x2[1];
        x_a = x2[2];               x_b = x2[3];
        x_c = x2[4];               x_d = x2[5];
        x_e = x2[6];               x_f = x2[7];
        x2 += 8;

        /*-------------------------------------------------------------*/
        /* Perform radix4 style decompositions and overwrite results   */
        /* if it is dtermined that the radix to be used is radix 2.    */
        /*-------------------------------------------------------------*/

        xh0_2 = x_8 + x_c;         xh1_2  =  x_9    +  x_d;
        xl0_2 = x_8 - x_c;         xl1_2  =  x_9    -  x_d;
        xh0_3 = x_a + x_e;         xh1_3  =  x_b    +  x_f;
        xl0_3 = x_a - x_e;         xl1_3  =  x_b    -  x_f;

        n02 = xh0_2 + xh0_3;       n03    =  xh1_2  +  xh1_3;
        n12 = xl0_2 + xl1_3;       n13    =  xl1_2  -  xl0_3;
        n22 = xh0_2 - xh0_3;       n23    =  xh1_2  -  xh1_3;
        n32 = xl0_2 - xl1_3;       n33    =  xl1_2  +  xl0_3; 

        if (radix == 2)
        {
          n02 = x_8 + x_a;         n03 = x_9   +   x_b;
          n22 = x_8 - x_a;         n23 = x_9   -   x_b;
          n12 = x_c + x_e;         n13 = x_d   +   x_f;
          n32 = x_c - x_e;         n33 = x_d   -   x_f;
        }

        /*----------------------------------------------------------------*/
        /* Points that are read from succesive locations map to y, y[N/4] */
        /* y[N/2], y[3N/4] in a radix4 scheme, y, y[N/8], y[N/2],y[5N/8]  */
        /*----------------------------------------------------------------*/ 

        y0[2*h2+2] = n02;          y0[2*h2+3] = n03;
        y1[2*h2+2] = n12;          y1[2*h2+3] = n13;
        y2[2*h2+2] = n22;          y2[2*h2+3] = n23;
        y3[2*h2+2] = n32;          y3[2*h2+3] = n33;

        /*---------------------------------------------------------------*/
        /* Increment j by "j0", if j is equal to n0, increment j by n0,  */
        /* that double reversal is avoided.                              */
        /*---------------------------------------------------------------*/

        j += j0;
   
        if (j == n0)
        {
            j  += n0;
            x0 += (int) npoints >> 1;
            x2 += (int) npoints >> 1;
        }
   }

}

/* ======================================================================== */
/*  End of file: DSP_fft32x32s_cn.c                                         */
/* ------------------------------------------------------------------------ */
/*          Copyright (C) 2011 Texas Instruments, Incorporated.             */
/*                          All Rights Reserved.                            */
/* ======================================================================== */

