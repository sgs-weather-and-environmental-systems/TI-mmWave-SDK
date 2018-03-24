/* ======================================================================= */
/* DSPF_sp_iirlat_opt.c -- Lattice IIR Filter                              */
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

#pragma CODE_SECTION(DSPF_sp_iirlat_opt, ".text:intrinsic");

void DSPF_sp_iirlat_opt(const float *x, int nx, const float *restrict k, 
                    int nk, float *restrict b, float *restrict y)
{
    float yt1, yt2, yt3, yt, temp1, temp2, temp3, temp4;
    int i, j;
    double bibim1;
    double bim2bim3;
    float bi, bim1, bim2, bim3;

    double kikim1;
    double kim2kim3;
    float  ki, kim1, kim2, kim3;
    
    //_nassert(nk >= 6);
    //_nassert(nk % 4 == 0);
    _nassert(nx > 0);
    _nassert((int)k % 8 == 0);
    _nassert((int)b % 8 == 0);
           
    #pragma MUST_ITERATE(1,,)
    for (j = 0; j < nx; j++)
    {
        /* starting value of yt */
        yt = x[j];

        #pragma MUST_ITERATE(1,,)
        for (i = nk - 1; i >= 3; i-=4)
        {
            /* load b[i-1] and b[i] */
            bibim1= _amemd8((void*)(b + i - 1));
            
            /* load b[i-2] and b[i-3] */
            bim2bim3= _amemd8((void*)(b + i - 3));
            
            /* fetch floats: b[i-3],b[i-2],b[i-1],b[i] */
            bi = _itof(_hi(bibim1));
            bim1 = _itof(_lo(bibim1));
            bim2 = _itof(_hi(bim2bim3));
            bim3 = _itof(_lo(bim2bim3));
            
            /* load k[i], k[i-1] */
            kikim1= _amemd8((void*)(k + i - 1));
            
            /* load k[i-2], k[i-3] */
            kim2kim3= _amemd8((void*)(k + i - 3));
            
            /* fetch floats: k[i-3],k[i-2],k[i-1],k[i] */
            ki = _itof(_hi(kikim1));
            kim1 = _itof(_lo(kikim1));
            kim2 = _itof(_hi(kim2kim3));
            kim3 = _itof(_lo(kim2kim3));
            
            temp1 = bi * ki;
            temp2 = temp1  + bim1 * kim1;
            temp3 = temp2 + bim2 * kim2;
            temp4 = temp3 + bim3 * kim3;
                                          
            /* update delays and find output for this input */
            yt1 = yt - temp1;
            b[i + 1] = bi + yt1 * ki; // b[i+1]    // was ptr

            yt2 = yt - temp2;
            b[i] = bim1 + yt2 * kim1; // b[i]    // was ptr
            
            yt3 = yt - temp3;
            b[i - 1] = bim2 + yt3 * kim2; // b[i-1] // was ptr
            
            /* yt = yt - (b[i]*k[i] + b[i-1]*k[i-1] + b[i-2]*k[i-2] + b[i-3]*k[i-3]) */
            yt = yt - temp4;
            b[i - 2] = bim3 + yt * kim3; // b[i-2] // was ptr
        }
        
       /* update first delay */
       b[0] = yt;
       /* store output */
       y[j] = yt;       
  }
}       

/* ======================================================================= */
/*  End of file:  DSPF_sp_iirlat_opt.c                                     */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

