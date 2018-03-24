/* ======================================================================= */
/* DSPF_sp_maxidx.c -- Max Value Index                                     */
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

#pragma CODE_SECTION(DSPF_sp_maxidx, ".text:optimized");

#include "DSPF_sp_maxidx.h"
#include "float.h"
#ifdef __TI_COMPILER_VERSION__
#include "c6x.h"
#endif

int DSPF_sp_maxidx(const float* x, const int nx)
{
    int   i, idx1, idx2, idx3, idx4;
    float max1, max2, max3, max4;
    __float2_t x_1_2, x_3_4;
 
    max1 = -FLT_MAX;
    max2 = -FLT_MAX;
    max3 = -FLT_MAX;
    max4 = -FLT_MAX;
           
    _nassert((int)x % 8 == 0);
    _nassert(nx % 4 == 0);
    _nassert(nx > 0);

    #pragma MUST_ITERATE(1,,1)
    for (i = 0; i < nx; i+=4)
    {
        x_1_2 = _amem8_f2((void *)&x[i]);
        x_3_4 = _amem8_f2((void *)&x[i+2]);
        
        if (_lof2(x_1_2) > max1) {
            max1 = _lof2(x_1_2);
            idx1 = i;
        }

        if (_hif2(x_1_2) > max2) {
            max2 = _hif2(x_1_2);
            idx2 = i + 1;
        }
        
        if (_lof2(x_3_4) > max3) {
            max3 = _lof2(x_3_4);
            idx3 = i + 2;
        }

        if (_hif2(x_3_4) > max4) {
            max4 = _hif2(x_3_4);
            idx4 = i + 3;
        }
    }

    if (max2 > max1)
    {
        max1 = max2;
        idx1 = idx2;
    }
    if (max4 > max3)
    {
        max3 = max4;
        idx3 = idx4;
    }
    if (max3 > max1)
        return idx3;
    else
        return idx1;
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_maxidx.c                                         */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

