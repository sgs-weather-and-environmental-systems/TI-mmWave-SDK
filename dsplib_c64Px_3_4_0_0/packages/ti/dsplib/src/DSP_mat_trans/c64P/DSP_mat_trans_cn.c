/* ======================================================================= */
/* DSP_mat_trans_cn.c -- Matrix Transpose                                  */
/*                       Natural C Implementation                          */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*     This routine is C-callable and can be called as:                    */
/*                                                                         */
/*     void DSP_mat_trans_cn (                                             */
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

#pragma CODE_SECTION(DSP_mat_trans_cn, ".text:ansi");

#include "DSP_mat_trans_cn.h"

void DSP_mat_trans_cn (
    const short *restrict   x,          /* Input matrix             */
    short                   rows,       /* Height of input matrix   */
    short                   columns,    /* Width of input matrix    */
    short *restrict         r           /* Output matrix            */
)
{
    int i, j;

#ifdef NOASSUME
    _nassert(columns % 4 == 0);
    _nassert(rows % 4 == 0);
    _nassert((int)(x) % 8 == 0);
    _nassert((int)(r) % 8 == 0);
    _nassert(columns >= 8);
    _nassert(rows >= 8);
#endif

    /* ------------------------------------------------------------------- */
    /*  Write each column of 'x' to a row of 'r'.                          */
    /* ------------------------------------------------------------------- */
    for (i = 0; i < columns; i++) {
        for (j = 0; j < rows; j++) {
            r[(i * rows) + j] = x[i + (columns * j)];
        }
    }
}

/* ======================================================================= */
/*  End of file:  DSP_mat_trans_cn.c                                       */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

