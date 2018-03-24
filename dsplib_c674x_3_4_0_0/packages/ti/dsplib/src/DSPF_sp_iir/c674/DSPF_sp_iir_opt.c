/* ======================================================================= */
/* DSPF_sp_iir_opt.c -- IIR Filter                                         */
/*                 Optimized C Implementation with Intrinsics              */
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

#pragma CODE_SECTION(DSPF_sp_iir_opt, ".text:intrinsic");

void DSPF_sp_iir_opt(float *restrict y1,
    const float * x,
    float *restrict y2,
    const float * hb,
    const float * ha,
    int nr)
{
    float sum1,sum2, sum3, sum4, sum5;
    int i;

    sum1 = (  hb[0] * x[4]  
            + hb[1] * x[3] - ha[1] * y1[3]  
            + hb[2] * x[2] - ha[2] * y1[2]
            + hb[3] * x[1] - ha[3] * y1[1]
            + hb[4] * x[0] - ha[4] * y1[0]
           );

    sum2 = (  hb[1] * x[4]  
            + hb[2] * x[3] - ha[2] * y1[3]
            + hb[3] * x[2] - ha[3] * y1[2]
            + hb[4] * x[1] - ha[4] * y1[1]
           );

    sum3 = (  hb[2] * x[4]  
            + hb[3] * x[3] - ha[3] * y1[3]
            + hb[4] * x[2] - ha[4] * y1[2]
           );

    sum4 = (  hb[3] * x[4]  
            + hb[4] * x[3] - ha[4] * y1[3]
           );     

    sum5 = (  hb[4] * x[4]  
           );        


    _nassert(nr >= 2);
    _nassert(nr % 2 == 0);

    for (i = 0; i < nr-1; i++ )  {

        y1[i+4] = sum1;
        y2[i]   = sum1;

        sum1 = sum2 + hb[0] * x[i+5] - ha[1] * y1[i+4];  
        sum2 = sum3 + hb[1] * x[i+5] - ha[2] * y1[i+4];
        sum3 = sum4 + hb[2] * x[i+5] - ha[3] * y1[i+4];         
        sum4 = sum5 + hb[3] * x[i+5] - ha[4] * y1[i+4];
        sum5 = hb[4] * x[i+5];              
    }
    y1[nr+3] = sum1;
    y2[nr-1] = sum1;
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_iir_opt_opt.c                                    */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

