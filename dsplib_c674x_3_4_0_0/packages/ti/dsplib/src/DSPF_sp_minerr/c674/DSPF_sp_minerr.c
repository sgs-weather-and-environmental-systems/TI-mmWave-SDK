/* ======================================================================= */
/* DSPF_sp_minerr.c -- Vocoder Codebook Search                             */
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

#pragma CODE_SECTION(DSPF_sp_minerr, ".text:optimized");

#include "DSPF_sp_minerr.h"

#define GSP0_NUM    (256)
#define GSP0_TERMS    (9)

float DSPF_sp_minerr(const float* GSP0_TABLE,
    const float* errCoefs, int *restrict max_index)
{
    float maxVal = _itof(0xFF800000), m0, m1, m2, m3, m4, m5, m6, m7, m8;
    float m = 0, m01, m23, m45, m67, m801, m67801, m2345;
    int i, index;

    _nassert((int)errCoefs % 8 == 0);
    
    #pragma MUST_ITERATE(GSP0_NUM,GSP0_NUM,)
    for (i = 0; i < GSP0_NUM ; i ++)
    {
        m0 = *GSP0_TABLE++ * errCoefs[0];
        m1 = *GSP0_TABLE++ * errCoefs[1];
        m2 = *GSP0_TABLE++ * errCoefs[2];
        m3 = *GSP0_TABLE++ * errCoefs[3];
        m4 = *GSP0_TABLE++ * errCoefs[4];
        m5 = *GSP0_TABLE++ * errCoefs[5];
        m6 = *GSP0_TABLE++ * errCoefs[6];
        m7 = *GSP0_TABLE++ * errCoefs[7];
        m8 = *GSP0_TABLE++ * errCoefs[8]; 
        
        m01 = m0 + m1;
        m23 = m2 + m3;
        m45 = m4 + m5;
        m67 = m6 + m7;
        
        m801 = m8 + m01;
        m67801 = m801 + m67;
        m2345 = m23 + m45;
        m = m2345 + m67801;

        if (m > maxVal)
        { 
            maxVal = m;
            index = i;
        }
    }

    *max_index = index * GSP0_TERMS;  

    return (maxVal);
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_minerr.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

