/* ======================================================================= */
/* DSPF_sp_mat_mul_opt.c -- Matrix Multiply                                */
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

#pragma CODE_SECTION(DSPF_sp_mat_mul_opt, ".text:intrinsic");

void DSPF_sp_mat_mul_opt(float *x1, const int r1, const int c1,
    float *x2, const int c2, float *restrict y)
{
    int i, j, k, ok_01, ok_10, ok_11, k_odd;
    float sum, sum1, sum2, sum3;
    float *ptr_x, *ptr_y;
    float x00, x01, y0, y1, yc20, yc21, xc10, xc11;
    unsigned int xoff;

    _nassert(r1 > 0);
    _nassert(c1 > 0);
    _nassert(c2 > 0);

    // ---------------------------------------------------- //
    //  Multiply each row in x1 by each column in x2.  The    //
    //  product of row m in x1 and column n in x2 is placed   //
    //  in position (m,n) in the result.                    //
    // ---------------------------------------------------- //

    #pragma MUST_ITERATE(1,,)
    for (i = 0; i < r1; i+=2) /*Loop Unrolled twice*/
    {
        xoff =    i*c1;

        #pragma MUST_ITERATE(1,,)
        for (j = 0; j < c2; j+=2) /*Loop Unrolled twice*/
        {                                                     
            sum  = 0;
            sum1 = 0;
            sum2 = 0;
            sum3 = 0;
            
            ptr_x = &x1[xoff];
            ptr_y = &x2[j];
            
            #pragma MUST_ITERATE(1,,)
            for (k = 0; k < c1 - 1; k+=2,ptr_x+=2,ptr_y+=2*c2) /*Loop Unrolled twice*/
            {
                x00 = ptr_x[0];
                x01 = ptr_x[1];
                y0 = ptr_y[0];
                y1 = ptr_y[1];
                yc20 = ptr_y[c2];
                yc21 = ptr_y[c2 + 1];
                xc10 = ptr_x[c1];
                xc11 = ptr_x[c1 + 1];
                
                sum  += x00 * y0 + x01 * yc20;
                sum1 += x00 * y1 + x01 * yc21;
                sum2 += xc10 * y0 + xc11 * yc20;
                sum3 += xc10 * y1 + xc11 * yc21;
            }
            
            k_odd = c1 & 1;
            if (k_odd) sum  += ptr_x[0]  * ptr_y[0];
            if (k_odd) sum1 += ptr_x[0]  * ptr_y[1];
            if (k_odd) sum2 += ptr_x[c1] * ptr_y[0];
            if (k_odd) sum3 += ptr_x[c1] * ptr_y[1];
      
            ok_01 = (j + 1 < c2);
            ok_10 = (i + 1 < r1);
            ok_11 = ok_01 & ok_10;
     
                       y[(i + 0)*c2 + (j + 0)] = sum;
            if (ok_01) y[(i + 0)*c2 + (j + 1)] = sum1;
            if (ok_10) y[(i + 1)*c2 + (j + 0)] = sum2;
            if (ok_11) y[(i + 1)*c2 + (j + 1)] = sum3;        
        }
    }                                                     
}

/* ======================================================================= */
/*  End of file:  DSPF_sp_mat_mul_opt.c                                    */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */



