/* ======================================================================= */
/* DSPF_sp_fircirc.c -- Circular FIR Filter                                */
/*              Optimized C Implementation (w/ Intrinsics)                 */
/*                                                                         */
/* Rev 0.0.1                                                               */
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

#pragma CODE_SECTION(DSPF_sp_fircirc, ".text:optimized");

#include "DSPF_sp_fircirc.h"

void DSPF_sp_fircirc(const float *x, float *h, float *restrict y,
    const int index, const int csize, const int nh, const int ny)
{
    int i, j;
    //Circular Buffer block size = ((2^(csize + 1)) / 4) floating point numbers
    int mod = (1 << (csize - 1)); 
    float y0, y1, y2, y3;
    float x_0, x_1, x_2, x_3;

    //Assumptions:
    //1)    'h' array is aligned to double word boundary
    //2)    'nh' i.e. no. of coefficients is multiple of 2 and >=4
    //3)    'nr' i.e. no. of output samples is multiple of 4
     
    _nassert ((int) h % 8 == 0);
    _nassert (nh % 2 == 0);
    _nassert (nh >= 4);
    _nassert (ny % 4 == 0);
    _nassert (ny > 0);
    
    for (i = 0; i < ny; i += 4) 
    {           
        y0 = 0;
        y1 = 0;
        y2 = 0;
        y3 = 0;
        
        x_0 = x[(i + index) & (mod - 1)];
        x_1 = x[(i + 1 + index) & (mod - 1)];
        x_2 = x[(i + 2 + index) & (mod - 1)];
        
        #pragma MUST_ITERATE(2,,)
        for (j = 0; j < nh; j++)
        {
            x_3 = x[(i + j + 3 + index) & (mod - 1)];
            
            y0 += x_0 * h[j];
            y1 += x_1 * h[j];
            y2 += x_2 * h[j];
            y3 += x_3 * h[j];
            
            x_0 = x_1;
            x_1 = x_2;
            x_2 = x_3;
        }
        
        y[i] = y0;
        y[i + 1] = y1;
        y[i + 2] = y2;
        y[i + 3] = y3;
    }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_fircirc.c                                        */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

