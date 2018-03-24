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
/* DSP_iir_lat.c -- IIR LAT Filter                                         */
/*                  Optimized C Implementation (w/ Intrinsics)             */
/*                                                                         */
/* Rev 0.0.1                                                               */
/*                                                                         */
/*  Usage                                                                  */
/*      This routine is C-callable and can be called as:                   */
/*                                                                         */
/*      void DSP_iirlat (                                                  */
/*          short       *x,                                                */
/*          int          nx,                                               */
/*          const short *restrict k,                                       */
/*          int          nk,                                               */
/*          int         *restrict b,                                       */
/*          short       *r                                                 */
/*      );                                                                 */
/*                                                                         */
/*      x[nx]   : Input vector (16-bit)                                    */
/*      nx      : Length of input vector.                                  */
/*      k[nk]   : Reflection coefficients in Q.15 format                   */
/*      nk      : Number of reflection coefficients/lattice stages         */
/*      b[nk+1] : Delay line elements from previous call. Should be        */
/*                initialized to all zeros prior to the first call.        */
/*      r[nx]   : Output vector (16-bit)                                   */
/*                                                                         */
/*  DESCRIPTION                                                            */
/*      This routine implements a real all-pole IIR filter in lattice      */
/*      structure (AR lattice). The filter consists of nk lattice stages.  */
/*      Each stage requires one reflection coefficient k and one delay     */
/*      element b. The routine takes an input vector x[] and returns the   */
/*      filter output in r[]. Prior to the first call of the routine the   */
/*      delay elements in b[] should be set to zero. The input data may    */
/*      have to be pre-scaled to avoid overflow or achieve better SNR. The */
/*      reflections coefficients lie in the range -1.0 < k < 1.0. The      */
/*      order of the coefficients is such that k[nk-1] corresponds to the  */
/*      first lattice stage after the input and k[0] corresponds to the    */
/*      last stage.                                                        */
/*                                                                         */
/*  NOTE                                                                   */
/*     The all-pass output of the filter could be easily obtained by       */
/*     returning b[nk]. See also Matlab documentation of lattic filters.   */
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

#pragma CODE_SECTION(DSP_iir_lat, ".text:optimized");

#include "DSP_iir_lat.h"

#ifdef _LITTLE_ENDIAN
void DSP_iir_lat (
	short       *x,
	int         nx,
	const short *restrict k,
	int         nk,
	int         *restrict b,
	short       *r
)
{
	int i, j, rt;
	int b_0, b_1, b_2, b_3, b_4;
	int k_32, k_10;
	short k_3, k_2, k_1, k_0;

	double k_3210, b_32, b_10;

	for (j = 0; j < nx; j++) {
		rt = x[j] << 16;

		for (i = nk - 1; i > 0; i -= 4) {
			b_32 = _amemd8(&b[i]);
			b_10 = _amemd8(&b[i-2]);

			b_3 = _hi(b_32);
			b_2 = _lo(b_32);
			b_1 = _hi(b_10);
			b_0 = _lo(b_10);

			k_3210 = _amemd8_const(&k[i]);

			k_32 = _hi(k_3210);
			k_10 = _lo(k_3210);

			k_3 = k_32 >> 16;
			k_2 = k_32;
			k_1 = k_10 >> 16;
			k_0 = k_10;

			rt -= _smpyhl(b_3, k_3);
			b_4 = b_3 + _smpyhl(rt, k_3);

			rt -= _smpyhl(b_2, k_2);
			b_3 = b_2 + _smpyhl(rt, k_2);

			rt -= _smpyhl(b_1, k_1);
			b_2 = b_1 + _smpyhl(rt, k_1);

			rt -= _smpyhl(b_0, k_0);
			b_1 = b_0 + _smpyhl(rt, k_0);

			_memd8(&b[i]) = _itod(b_4, b_3);
			_memd8(&b[i-2]) = _itod(b_2, b_1);
		}
		b[0] = rt;
		r[j] = rt >> 16;
	}
}

/*-----------------------------------------------------------*/
/*  Big Endian version                                       */
/*-----------------------------------------------------------*/
#else
void DSP_iir_lat (
	short       *x,
	int         nx,
	const short *restrict k,
	int         nk,
	int         *restrict b,
	short       *r
)
{
	int i, j, rt;
	int b_0, b_1, b_2, b_3, b_4;
	int k_23, k_01;
	short k_3, k_2, k_1, k_0;

	double k_0123, b_23, b_01;

	for (j = 0; j < nx; j++) {
		rt = x[j] << 16;

		for (i = nk - 1; i > 0; i -= 4) {
			b_23 = _amemd8(&b[i]);
			b_01 = _amemd8(&b[i-2]);

			b_3 = _lo(b_23);
			b_2 = _hi(b_23);
			b_1 = _lo(b_01);
			b_0 = _hi(b_01);

			k_0123 = _amemd8_const(&k[i]);

			k_23 = _lo(k_0123);
			k_01 = _hi(k_0123);

			k_3 = k_23;
			k_2 = k_23 >> 16;
			k_1 = k_01;
			k_0 = k_01 >> 16;

			rt -= _smpyhl(b_3, k_3);
			b_4 = b_3 + _smpyhl(rt, k_3);

			rt -= _smpyhl(b_2, k_2);
			b_3 = b_2 + _smpyhl(rt, k_2);

			rt -= _smpyhl(b_1, k_1);
			b_2 = b_1 + _smpyhl(rt, k_1);

			rt -= _smpyhl(b_0, k_0);
			b_1 = b_0 + _smpyhl(rt, k_0);

			_memd8(&b[i]) = _itod(b_3, b_4);
			_memd8(&b[i-2]) = _itod(b_1, b_2);
		}
		b[0] = rt;
		r[j] = rt >> 16;
	}
}
#endif

/* ======================================================================= */
/*  End of file:  DSP_iir_lat.c                                            */
/* ----------------------------------------------------------------------- */
/*            Copyright (c) 2011 Texas Instruments, Incorporated.          */
/*                           All Rights Reserved.                          */
/* ======================================================================= */

