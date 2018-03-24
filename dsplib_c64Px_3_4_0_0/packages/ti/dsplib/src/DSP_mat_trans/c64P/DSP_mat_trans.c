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
/* DSP_mat_trans.c -- Matrix Transpose                                     */
/*                    Optimized C Implementation (w/ Intrinsics)           */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_mat_trans (                                                */
/*         const short *restrict x, // Input matrix                        */
/*         short rows,              // Height of input matrix              */
/*         short columns,           // Width of input matrix               */
/*         short *restrict r        // Output matrix                       */
/*     );                                                                  */
/*                                                                         */
/*  Description                                                            */
/*     The program transposes a matrix of 16-bit values and user-          */
/*     determined dimensions. The result of a matrix transpose is a        */
/*     matrix with the number of rows = number of columns of input matrix  */
/*     and number of columns = number of rows of input matrix The value    */
/*     of an elements of the output matrix is equal to the value of the    */
/*     element from the input matrix with switched coordinates (rows,      */
/*     columns).                                                           */
/*                                                                         */
/*  Assumptions                                                            */
/*     Arrays x and r do not overlap                                       */
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

#pragma CODE_SECTION(DSP_mat_trans, ".text:optimized");

#include "DSP_mat_trans.h"

#ifdef _LITTLE_ENDIAN
void DSP_mat_trans (
    const short *restrict   x,          /* Input matrix             */
    short                   rows,       /* Height of input matrix   */
    short                   columns,    /* Width of input matrix    */
    short *restrict         r           /* Output matrix            */
)
{
    int i, j, ij;

    unsigned int x3x2, x1x0;
    unsigned int y3y2, y1y0;
    unsigned int z3z2, z1z0;
    unsigned int a3a2, a1a0;

    unsigned int y0x0, a0z0;
    unsigned int y1x1, a1z1;
    unsigned int y2x2, a2z2;
    unsigned int y3x3, a3z3;

    double dword0, dword1;
    double dword2, dword3;

    /*-----------------------------------------------------------*/
    /* Inform the compiler that the number of rows and columns   */
    /* is a multiple of 4. Also inform the compiler that rows    */
    /* and columns should be greater than or equal to 4. In      */
    /* addition inform the compiler that the arrays are double   */
    /* word aligned. This approach however does not require the  */
    /* alignment of the arrays. This approach uses non-aligned   */
    /* loads, to avoid bank conflicts.                           */
    /*-----------------------------------------------------------*/
    _nassert(columns % 4 == 0);
    _nassert(columns >= 4);

    _nassert((int)(x) % 8 == 0);
    _nassert((int)(r) % 8 == 0);

    #pragma MUST_ITERATE(1,,1);
    for(i = j = ij = 0; ij < columns * rows; ij += 16)
    {
        /*--------------------------------------------------*/
        /* Load a double word from four columns. This is    */
        /* done using four non-aligned load double words.   */
        /*--------------------------------------------------*/
        dword0 = _memd8_const(&x[i + (columns * j)]);
        dword1 = _memd8_const(&x[i + (columns * (j + 1))]);
        dword2 = _memd8_const(&x[i + (columns * (j + 2))]);
        dword3 = _memd8_const(&x[i + (columns * (j + 3))]);

        /*--------------------------------------------------*/
        /* Access low and high halves of registers using    */
        /* _lo and _hi. Values from one row are numbered    */
        /* as yixi where "i" is row number. Thus y0x0 and   */
        /* and a0z0 are in row 0.                           */
        /*--------------------------------------------------*/
        y0x0 = _lo(dword0);
        a0z0 = _hi(dword0);
        y1x1 = _lo(dword1);
        a1z1 = _hi(dword1);
        y2x2 = _lo(dword2);
        a2z2 = _hi(dword2);
        y3x3 = _lo(dword3);
        a3z3 = _hi(dword3);

        /*-------------------------------------------------*/
        /* Perform local 4x4 transpose. This is done in    */
        /* the register file using pack2's and packh2's.   */
        /*-------------------------------------------------*/
        x1x0 = _pack2 (y1x1, y0x0);
        x3x2 = _pack2 (y3x3, y2x2);
        y1y0 = _packh2(y1x1, y0x0);
        y3y2 = _packh2(y3x3, y2x2);
        z1z0 = _pack2 (a1z1, a0z0);
        z3z2 = _pack2 (a3z3, a2z2);
        a1a0 = _packh2(a1z1, a0z0);
        a3a2 = _packh2(a3z3, a2z2);

        /*-------------------------------------------------*/
        /* Write out transposed data, this data is written */
        /* to the output array, that is "rows" apart.      */
        /* "Recall" that in the transposed matrix "rows"   */
        /* of the original matrix, that is rows of the     */
        /* transposed matrix are "rows" apart.             */
        /*-------------------------------------------------*/
        _amemd8(&r[((i + 0)*rows)+j]) = _itod(x3x2, x1x0);
        _amemd8(&r[((i + 1)*rows)+j]) = _itod(y3y2, y1y0);
        _amemd8(&r[((i + 2)*rows)+j]) = _itod(z3z2, z1z0);
        _amemd8(&r[((i + 3)*rows)+j]) = _itod(a3a2, a1a0);

        j += 4;

        if (j == rows) {
            j = 0;
            i += 4;
        }
    }
}
#else
void DSP_mat_trans (
    const short *restrict   x,          /* Input matrix             */
    short                   rows,       /* Height of input matrix   */
    short                   columns,    /* Width of input matrix    */
    short *restrict         r           /* Output matrix            */
)
{
    int i, j, ij;

    unsigned int x2x3, x0x1;
    unsigned int y2y3, y0y1;
    unsigned int z2z3, z0z1;
    unsigned int a2a3, a0a1;

    unsigned int y0x0, a0z0;
    unsigned int y1x1, a1z1;
    unsigned int y2x2, a2z2;
    unsigned int y3x3, a3z3;

    double dword0, dword1;
    double dword2, dword3;

    /*-----------------------------------------------------------*/
    /* Inform the compiler that the number of rows and columns   */
    /* is a multiple of 4. Also inform the compiler that rows    */
    /* and columns should be greater than or equal to 4. In      */
    /* addition inform the compiler that the arrays are double   */
    /* word aligned. This approach however does not require the  */
    /* alignment of the arrays. This approach uses non-aligned   */
    /* loads, to avoid bank conflicts.                           */
    /*-----------------------------------------------------------*/
    _nassert(columns % 4 == 0);
    _nassert(columns >= 4);

    _nassert((int)(x) % 8 == 0);
    _nassert((int)(r) % 8 == 0);

    #pragma MUST_ITERATE(1,,1);
    for(i = j = ij = 0; ij < columns * rows; ij += 16)
    {
        /*--------------------------------------------------*/
        /* Load a double word from four columns. This is    */
        /* done using four non-aligned load double words.   */
        /*--------------------------------------------------*/
        dword0 = _memd8_const(&x[i + (columns * j)]);
        dword1 = _memd8_const(&x[i + (columns * (j + 1))]);
        dword2 = _memd8_const(&x[i + (columns * (j + 2))]);
        dword3 = _memd8_const(&x[i + (columns * (j + 3))]);

        /*--------------------------------------------------*/
        /* Access low and high halves of registers using    */
        /* _lo and _hi. Values from one row are numbered    */
        /* as yixi where "i" is row number. Thus y0x0 and   */
        /* and a0z0 are in row 0.                           */
        /*--------------------------------------------------*/
        y0x0 = _lo(dword0);
        a0z0 = _hi(dword0);
        y1x1 = _lo(dword1);
        a1z1 = _hi(dword1);
        y2x2 = _lo(dword2);
        a2z2 = _hi(dword2);
        y3x3 = _lo(dword3);
        a3z3 = _hi(dword3);

        /*-------------------------------------------------*/
        /* Perform local 4x4 transpose. This is done in    */
        /* the register file using pack2's and packh2's.   */
        /*-------------------------------------------------*/
        x0x1 = _pack2 (y0x0, y1x1);
        x2x3 = _pack2 (y2x2, y3x3);
        y0y1 = _packh2(y0x0, y1x1);
        y2y3 = _packh2(y2x2, y3x3);
        z0z1 = _pack2 (a0z0, a1z1);
        z2z3 = _pack2 (a2z2, a3z3);
        a0a1 = _packh2(a0z0, a1z1);
        a2a3 = _packh2(a2z2, a3z3);

        /*-------------------------------------------------*/
        /* Write out transposed data, this data is written */
        /* to the output array, that is "rows" apart.      */
        /* "Recall" that in the transposed matrix "rows"   */
        /* of the original matrix, that is rows of the     */
        /* transposed matrix are "rows" apart.             */
        /*-------------------------------------------------*/
        _amemd8(&r[((i + 3)*rows)+j]) = _itod(x0x1, x2x3);
        _amemd8(&r[((i + 2)*rows)+j]) = _itod(y0y1, y2y3);
        _amemd8(&r[((i + 1)*rows)+j]) = _itod(z0z1, z2z3);
        _amemd8(&r[((i + 0)*rows)+j]) = _itod(a0a1, a2a3);

        j += 4;

        if (j == rows) {
            j = 0;
            i += 4;
        }
    }
}
#endif

/* ======================================================================= */
/*  End of file:  DSP_mat_trans.c                                          */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

