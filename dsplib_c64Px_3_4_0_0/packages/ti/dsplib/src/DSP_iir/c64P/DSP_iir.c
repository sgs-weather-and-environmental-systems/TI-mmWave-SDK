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
/* DSP_iir.c -- Real IIR Filter                                            */
/*              Intrinsic C Implementation                                 */
/*                                                                         */
/* REV 0.0.1                                                               */
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

#pragma CODE_SECTION(DSP_iir, ".text:optimized");

void DSP_iir (
    short *restrict r1,        /* Pointer to real output data used/stored */ 
    const short *restrict x,   /* Pointer to real input data */
    short *restrict r2,        /* Pointer to real output data stored */
    const short *restrict h2,  /* Pointer to 5 Moving-average real filter coefficients */
    const short *restrict h1,  /* Pointer to 4 Autoregressive real filter coefficients */
    int nr                     /* Holds the value of number of real output samples */
)
{

      int sum1,sum2, sum3, sum4, sum5, i;
      int h2_3_h1_4, x_5_r_4;

        h2_3_h1_4 = _pack2(h2[3],h1[4]);

        sum1 = (      h2[0] * x[4]  
                    + h2[1] * x[3] - h1[1] * r1[3]  
                    + h2[2] * x[2] - h1[2] * r1[2]
                    + h2[3] * x[1] - h1[3] * r1[1]
                    + h2[4] * x[0] - h1[4] * r1[0]
               );

        sum2 = (      h2[1] * x[4]  
                    + h2[2] * x[3] - h1[2] * r1[3]
                    + h2[3] * x[2] - h1[3] * r1[2]
                    + h2[4] * x[1] - h1[4] * r1[1]
               );

        sum3 = (      h2[2] * x[4]  
                    + h2[3] * x[3] - h1[3] * r1[3]
                    + h2[4] * x[2] - h1[4] * r1[2]
               );

        sum4 = (      h2[3] * x[4]  
                    + h2[4] * x[3] - h1[4] * r1[3]
               );        

        sum5 = (      h2[4] * x[4]  
               );        

#pragma MUST_ITERATE(1);

        for (i = 0; i < nr-1; i++ )  {

            r1[i+4] = sum1 >> 15;
            r2[i]   = r1[i+4];
            x_5_r_4 = _pack2(x[i+5], r1[i+4]);

            sum1 = sum2 + _mpy (h2[0], x[i+5]) - _mpy (h1[1], r1[i+4]);  
            sum2 = sum3 + _mpy (h2[1], x[i+5]) - _mpy (h1[2], r1[i+4]);
            sum3 = sum4 + _mpy (h2[2], x[i+5]) - _mpy (h1[3], r1[i+4]);         
            sum4 = sum5 + _dotpn2(h2_3_h1_4, x_5_r_4);
            sum5 = _mpy (h2[4], x[i+5]);              
        }
        r1[nr+3] = sum1 >> 15;
        r2[nr-1] = r1[nr+3];

}

/* ======================================================================= */
/*  End of file:  Dsp_iir.c                                                */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

