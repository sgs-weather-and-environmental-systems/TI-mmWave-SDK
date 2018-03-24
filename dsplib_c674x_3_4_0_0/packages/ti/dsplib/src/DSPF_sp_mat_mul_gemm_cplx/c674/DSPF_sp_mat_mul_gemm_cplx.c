/* ======================================================================= */
/* DSPF_sp_mat_mul_gemm_cplx.c -- Complex Matrix Multiply “y = a*x1*x2+y"  */
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

#pragma CODE_SECTION(DSPF_sp_mat_mul_gemm_cplx, ".text:optimized");

#include "DSPF_sp_mat_mul_gemm_cplx.h"
#ifdef __TI_COMPILER_VERSION__
#include "c6x.h"
#endif

void DSPF_sp_mat_mul_gemm_cplx(float *restrict x1, float const a, const int r1, const int c1,
    float *restrict x2, const int c2, float *restrict y)
{
    int    i, j, k, xoff1, xoff2;
    float *restrict y1, *restrict y2, *restrict ptr_x, *restrict ptr_y;
    __float2_t sum00, sum01, sum10, sum11, sum20, sum21, sum30, sum31, aa, temp;
    __float2_t x00, x01, y00, y01, y10, y11, x10, x11;

    _nassert(r1 > 0);
    _nassert(c1 > 0);
    _nassert(c2 > 0);
    _nassert( (int) x1 % 8 == 0 );
    _nassert( (int) x2 % 8 == 0 );
    _nassert( (int) y  % 8 == 0 );
    _nassert( c1 % 2 == 0 );
    _nassert( c2 % 2 == 0 );
    _nassert( r1 % 2 == 0 );

    aa = _ftof2(-a,a);

    #pragma MUST_ITERATE(1,,)
    for (j = 0; j < c2; j+=2) {
        xoff2 = j * c1;
        y1 = &y[2 * (j + 0) * r1];
        y2 = &y[2 * (j + 1) * r1];

        #pragma MUST_ITERATE(1,,)
        for (i = 0; i < r1; i+=2) {     
			/* reset sums*/
            xoff1 = i * c1;                            
            sum00 = 0;
            sum10 = 0;
            sum20 = 0;
            sum30 = 0;
            sum01 = 0;
            sum11 = 0;
            sum21 = 0;
            sum31 = 0;

            ptr_x = &x1[2 * xoff1];
            ptr_y = &x2[2 * xoff2];

            #pragma MUST_ITERATE(1,,)
            for (k = 0; k < c1; k+=2,ptr_x+=4,ptr_y+=4) {
				/* load four elements of the matrix */
                x00 = _mem8_f2((void *) ptr_x);
                x01 = _mem8_f2((void *)(ptr_x + 2));
                x10 = _mem8_f2((void *)(ptr_x + 2*c1));
                x11 = _mem8_f2((void *)(ptr_x + 2*c1 + 2));
                y00 = _mem8_f2((void *) ptr_y);
                y10 = _mem8_f2((void *)(ptr_y + 2));
                y01 = _mem8_f2((void *)(ptr_y + 2*c1));
                y11 = _mem8_f2((void *)(ptr_y + 2*c1 + 2));

				/* perform complex matrix multiplication */
                temp = _ftof2((_hif2(x00)*_hif2(y00))-(_lof2(x00)*_lof2(y00)),(_hif2(x00)*_lof2(y00))+(_lof2(x00)*_hif2(y00)));
                sum00 = _ftof2(_hif2(sum00)+_hif2(temp), _lof2(sum00)+_lof2(temp));
                temp = _ftof2((_hif2(x01)*_hif2(y10))-(_lof2(x01)*_lof2(y10)),(_hif2(x01)*_lof2(y10))+(_lof2(x01)*_hif2(y10)));
                sum01 = _ftof2(_hif2(sum01)+_hif2(temp), _lof2(sum01)+_lof2(temp));
                temp = _ftof2((_hif2(x00)*_hif2(y01))-(_lof2(x00)*_lof2(y01)),(_hif2(x00)*_lof2(y01))+(_lof2(x00)*_hif2(y01)));
                sum10 = _ftof2(_hif2(sum10)+_hif2(temp), _lof2(sum10)+_lof2(temp));
                temp = _ftof2((_hif2(x01)*_hif2(y11))-(_lof2(x01)*_lof2(y11)),(_hif2(x01)*_lof2(y11))+(_lof2(x01)*_hif2(y11)));
                sum11 = _ftof2(_hif2(sum11)+_hif2(temp), _lof2(sum11)+_lof2(temp));
                temp = _ftof2((_hif2(x10)*_hif2(y00))-(_lof2(x10)*_lof2(y00)),(_hif2(x10)*_lof2(y00))+(_lof2(x10)*_hif2(y00)));
                sum20 = _ftof2(_hif2(sum20)+_hif2(temp), _lof2(sum20)+_lof2(temp));
                temp = _ftof2((_hif2(x11)*_hif2(y10))-(_lof2(x11)*_lof2(y10)),(_hif2(x11)*_lof2(y10))+(_lof2(x11)*_hif2(y10)));
                sum21 = _ftof2(_hif2(sum21)+_hif2(temp), _lof2(sum21)+_lof2(temp));
                temp = _ftof2((_hif2(x10)*_hif2(y01))-(_lof2(x10)*_lof2(y01)),(_hif2(x10)*_lof2(y01))+(_lof2(x10)*_hif2(y01)));
                sum30 = _ftof2(_hif2(sum30)+_hif2(temp), _lof2(sum30)+_lof2(temp));
                temp = _ftof2((_hif2(x11)*_hif2(y11))-(_lof2(x11)*_lof2(y11)),(_hif2(x11)*_lof2(y11))+(_lof2(x11)*_hif2(y11)));
                sum31 = _ftof2(_hif2(sum31)+_hif2(temp), _lof2(sum31)+_lof2(temp));
            }

			/*combine sums*/
            sum00 = _ftof2(_hif2(sum00)+_hif2(sum01), _lof2(sum00)+_lof2(sum01));
            sum10 = _ftof2(_hif2(sum10)+_hif2(sum11), _lof2(sum10)+_lof2(sum11));
            sum20 = _ftof2(_hif2(sum20)+_hif2(sum21), _lof2(sum20)+_lof2(sum21));
            sum30 = _ftof2(_hif2(sum30)+_hif2(sum31), _lof2(sum30)+_lof2(sum31));

			/*multiply matrix by complex variable a*/
            sum00 = _ftof2(_hif2(aa)*_hif2(sum00), _lof2(aa)*_lof2(sum00));
            sum10 = _ftof2(_hif2(aa)*_hif2(sum10), _lof2(aa)*_lof2(sum10));
            sum20 = _ftof2(_hif2(aa)*_hif2(sum20), _lof2(aa)*_lof2(sum20));
            sum30 = _ftof2(_hif2(aa)*_hif2(sum30), _lof2(aa)*_lof2(sum30));

			/*load results into memory*/
            _amem8_f2(&y1[2 * i     ]) = _ftof2(_lof2(sum00), _hif2(sum00));
            _amem8_f2(&y2[2 * i     ]) = _ftof2(_lof2(sum10), _hif2(sum10));
            _amem8_f2(&y1[2 *(i + 1)]) = _ftof2(_lof2(sum20), _hif2(sum20));
            _amem8_f2(&y2[2 *(i + 1)]) = _ftof2(_lof2(sum30), _hif2(sum30));
        }
    }                        
}
/* ======================================================================= */
/*  End of file:  DSPF_sp_mat_mul_gemm_cplx.c                              */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */



