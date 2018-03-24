/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
# 
# Copyright (c) 1995-2017 Texas Instruments Incorporated
# http://www.ti.com/ 
# 
#  Redistribution and  use in source  and binary forms, with  or without
#  modification,  are permitted provided  that the  following conditions
#  are met:
# 
#     Redistributions  of source  code must  retain the  above copyright
#     notice, this list of conditions and the following disclaimer.
# 
#     Redistributions in binary form  must reproduce the above copyright
#     notice, this  list of conditions  and the following  disclaimer in
#     the  documentation  and/or   other  materials  provided  with  the
#     distribution.
# 
#     Neither the  name of Texas Instruments Incorporated  nor the names
#     of its  contributors may  be used to  endorse or  promote products
#     derived  from   this  software  without   specific  prior  written
#     permission.
# 
#  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS
#  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT
#  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR
#  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT
#  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,
#  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT
#  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,
#  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY
#  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT
#  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE
#  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
# 
 *
 * s_sinf.c -- float version of s_sin.c.
 * Conversion to float by Ian Lance Taylor, Cygnus Support, ian@cygnus.com.
 * Optimized by Bruce D. Evans.
 */

/*
 * ====================================================
 * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
 *
 * Developed at SunPro, a Sun Microsystems, Inc. business.
 * Permission to use, copy, modify, and distribute this
 * software is freely granted, provided that this notice
 * is preserved.
 * ====================================================
 */

#include <float.h>
#include <stdint.h>
#define __BSD_VISIBLE 1 /* for M_PI_2 */
#include "math.h"
#define	INLINE_KERNEL_COSDF
#define	INLINE_KERNEL_SINDF
#define INLINE_REM_PIO2F
#include "math_private.h"

#if __TI_HAS_F32_HARDWARE && !__TI_HAS_F64_HARDWARE
/*---------------------------------------------------------------------------*/
/* This hardware has fast 32-bit hardware, but not 64-bit hardware.  We      */
/* don't want to sacrifice the O(100x) speedup of hardware computation for   */
/* the rather small extra precision of 64-bit computation.                   */
/*---------------------------------------------------------------------------*/

#define INVSPI	  0.31830988618379067154f
#define HALFPI	  1.57079632679489661923f
#define C1	  3.140625f
#define C2	  9.67653589793e-4f
#define R1	 -0.1666665668e+0f
#define R2	  0.8333025139e-2f
#define R3	 -0.1980741872e-3f
#define R4	  0.2601903036e-5f

/****************************************************************************/
/*  SIN() - sine							    */
/*									    */
/*  Based on the algorithm from "Software Manual for the Elementary         */
/*  Functions", Cody and Waite, Prentice Hall 1980, chapter 8.              */
/*									    */
/*  N = round(x / PI)							    */
/*  f = x - N * PI							    */
/*  g = f * f								    */
/*  R = polynomial expansion 						    */
/*									    */
/*  result = f + f * R							    */
/*									    */
/*  if x < 0, result = - result 					    */
/*  if N is even, result = - result					    */
/*									    */
/*  This will return the wrong result for x >= MAXINT * PI		    */
/****************************************************************************/
float sinf(float x)
{
    float  xn, f, g, rg, result;
    int    sign = (x < 0);
    int    n;

    x  = fabsf(x);
    n  = (int) ((x * INVSPI) + 0.5f);
    xn = (float) n;

    /*************************************************************************/
    /* if n is odd, negate the sign                                          */
    /*************************************************************************/
    sign ^= ((n % 2) != 0);

    /*************************************************************************/
    /* f = x - xn * PI (but mathematically more stable)                      */
    /*************************************************************************/
    f = (x - xn * C1) - xn * C2;

    /*************************************************************************/
    /* determine polynomial expression                                       */
    /*************************************************************************/
    g = f * f;

    rg = (((R4 * g + R3) * g + R2) * g + R1) * g;

    result = f + f * rg;
    return sign ? -result : result;
}
#else
/*---------------------------------------------------------------------------*/
/* FREEBSD method - use one of several 64-bit kernel helpers for precision.  */
/*---------------------------------------------------------------------------*/
#include "e_rem_pio2f.c"
#include "k_cosf.c"
#include "k_sinf.c"

/* Small multiples of pi/2 rounded to double precision. */
_DATA_ACCESS static const long double
s1pio2 = 1.0*C(M_PI_2),			/* 0x3FF921FB, 0x54442D18 */
s2pio2 = 2.0*C(M_PI_2),			/* 0x400921FB, 0x54442D18 */
s3pio2 = 3.0*C(M_PI_2),			/* 0x4012D97C, 0x7F3321D2 */
s4pio2 = 4.0*C(M_PI_2);			/* 0x401921FB, 0x54442D18 */

float
sinf(float x)
{
	long double y;
	int32_t n, hx, ix;

	GET_FLOAT_WORD(hx,x);
	ix = hx & 0x7fffffff;

	if(ix <= 0x3f490fda) {		/* |x| ~<= pi/4 */
	    if(ix<0x39800000)		/* |x| < 2**-12 */
		if(((int)x)==0) return x;	/* x with inexact if x != 0 */
	    return __kernel_sindf(x);
	}
	if(ix<=0x407b53d1) {		/* |x| ~<= 5*pi/4 */
	    if(ix<=0x4016cbe3) {	/* |x| ~<= 3pi/4 */
		if(hx>0)
		    return __kernel_cosdf(x - s1pio2);
		else
		    return -__kernel_cosdf(x + s1pio2);
	    } else
		return __kernel_sindf((hx > 0 ? s2pio2 : -s2pio2) - x);
	}
	if(ix<=0x40e231d5) {		/* |x| ~<= 9*pi/4 */
	    if(ix<=0x40afeddf) {	/* |x| ~<= 7*pi/4 */
		if(hx>0)
		    return -__kernel_cosdf(x - s3pio2);
		else
		    return __kernel_cosdf(x + s3pio2);
	    } else
		return __kernel_sindf(x + (hx > 0 ? -s4pio2 : s4pio2));
	}

    /* sin(Inf or NaN) is NaN */
	else if (ix>=0x7f800000) return x-x;

    /* general argument reduction needed */
	else {
	    n = __rem_pio2f(x,&y);
	    switch(n&3) {
		case 0: return  __kernel_sindf(y);
		case 1: return  __kernel_cosdf(y);
		case 2: return  __kernel_sindf(-y);
		default:
			return -__kernel_cosdf(y);
	    }
	}
}
#endif

#if DBL_MANT_DIG == FLT_MANT_DIG
double sin(double x) __attribute__((__alias__("sinf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double sinl(long double x) __attribute__((__alias__("sinf")));
#endif
