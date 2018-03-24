/* ======================================================================= */
/* DSPF_sp_autocor.c -- Autocorrelation                                    */
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

#pragma CODE_SECTION(DSPF_sp_autocor, ".text:optimized");

#include "DSPF_sp_autocor.h"

void DSPF_sp_autocor(float *restrict r,
    float *restrict x, const int nx, const int nr)
{
     int i, k;
     float sum1, sum2, sum3, sum4;
     float x_k, x_k_1, x_k_i_3, x_k_i_2, 
         x_k_i_1, x_k_i, x_k_i_p1;

     _nassert(nx % 2 == 0);
     _nassert(nr % 4 == 0);
     _nassert(nr >= 4);
     _nassert(nx >= nr);
     _nassert((int)x % 8 == 0);

     #pragma MUST_ITERATE(1, ,1);
     for (i = 0; i < nr; i+=4)
     {
        /* Initialise the accumulators */
        sum1 = 0;
        sum2 = 0;
        sum3 = 0;                                                              
        sum4 = 0;
     
        #pragma MUST_ITERATE(2, ,1);
        for (k = nr; k < nx+nr; k+=2)
        {    
            /* load x[k] & x[k+1] */
            x_k=_itof(_lo(_amemd8( (void *)(x+k) ) ));
            x_k_1=_itof(_hi(_amemd8( (void *)(x+k) ) ));
            
            /* load x[k-i] * x[k-i+1] */
            x_k_i=_itof(_lo(_amemd8( (void *)(x+k-i) ) ));
            x_k_i_p1=_itof(_hi(_amemd8( (void *)(x+k-i) ) ));
            
            /* load x[k-i-2] and x[k-i-1] */
            x_k_i_2=_itof(_lo(_amemd8( (void *)(x+k-i-2) ) ));
            x_k_i_1=_itof(_hi(_amemd8( (void *)(x+k-i-2) ) ));
            
            /* load x[k-i-3] */
            x_k_i_3=_itof( _amem4( (void *)(x+k-i-3) ) );
            
            sum1 += x_k   * x_k_i;
            sum2 += x_k   * x_k_i_1;
            sum3 += x_k   * x_k_i_2;
            sum4 += x_k   * x_k_i_3;
            sum1 += x_k_1 * x_k_i_p1;
            sum2 += x_k_1 * x_k_i;
            sum3 += x_k_1 * x_k_i_1;
            sum4 += x_k_1 * x_k_i_2;
        }
        /* Store the result */
        r[i] = sum1 ;
        r[i+1] = sum2 ;
        r[i+2] = sum3 ;
        r[i+3] = sum4 ;
     }
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_autocor.c                                        */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

