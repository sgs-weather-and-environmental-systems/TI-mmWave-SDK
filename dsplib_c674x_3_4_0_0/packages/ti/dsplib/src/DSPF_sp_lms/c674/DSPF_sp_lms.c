/* ======================================================================= */
/* DSPF_sp_lms.c -- LMS Adaptive Filter                                    */
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

#pragma CODE_SECTION(DSPF_sp_lms, ".text:optimized");

#include "DSPF_sp_lms.h"

float DSPF_sp_lms(const float *x, float *restrict h, const float *y_i,
    float *restrict y_o, const float ar, float error, const int nh, const int ny)
{
    int i,j;
    float sum;
    float temp;                   
    float ae1, ae2;
    float x0, x1, h0, h1;
    
    _nassert(nh % 2 == 0);
    //_nassert(nh > 0);
    _nassert(ny > 0);
        
    temp = 0.0f;
    
    #pragma MUST_ITERATE(1,,)
    for (i = 0; i < ny; i++)
    {
        sum = 0.0f;
        ae1 = ar * error ;
        ae2 = ar * error ; 
        
        //#pragma MUST_ITERATE(1,,)
        for (j = 0; j < nh; j+=2)         
        {
            x0 = x[i + j    ];
            x1 = x[i + j + 1];                        
            
            h0 = h[j    ];
            h1 = h[j + 1];
            
            h0 += (ae2 * temp);                        
            sum += h0 * x0;                        
            
            h1 += (ae1 * x0);                        
            sum += h1 * x1;                        
            
            h[j    ] = h0;
            h[j + 1] = h1;
           
            temp = x1;
        }                      
                         
        y_o[i] = sum;
        error = y_i[i] - sum; 
        temp = x[i];                             
   }
       
   return error;
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_lms.c                                            */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

