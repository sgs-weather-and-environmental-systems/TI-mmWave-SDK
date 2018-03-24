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
 * s_tanf.c -- float version of s_tan.c.
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

#define __BSD_VISIBLE 1
#include "math.h"
#define	INLINE_KERNEL_TANDF
#define INLINE_REM_PIO2F
#include "math_private.h"

#if __TI_HAS_F32_HARDWARE && !__TI_HAS_F64_HARDWARE
/*---------------------------------------------------------------------------*/
/* This hardware has fast 32-bit hardware, but not 64-bit hardware.  We      */
/* don't want to sacrifice the O(100x) speedup of hardware computation for   */
/* the rather small extra precision of 64-bit computation.                   */
/*---------------------------------------------------------------------------*/

#define TWOINVPI  0.63661977236758134308f
#define C5	  1.5703125f
#define C6	  4.83826794897e-4f
#define TAP1	 -0.958017723e-1f
#define TAQ1	 -0.429135777e+0f
#define TAQ2	  0.971685835e-2f

/****************************************************************************/
/*  TAN() - Tangent							    */
/*									    */
/*  Based on the algorithm from "Software Manual for the Elementary         */
/*  Functions", Cody and Waite, Prentice Hall 1980, chapter 9.              */
/*									    */
/*  N = round(x * 2 / PI) 						    */
/*  f = mantissa x							    */
/*  g = f * f								    */
/*  xnum = f * p1 * g + 1						    */
/*  xden = (q2 * g + q1) * g + 1					    */
/*									    */
/*  if N is even, result = xnum / xden					    */
/*  if N is odd, result = xden / - xnum 				    */
/*									    */
/*  This will return the wrong result for x >= MAXINT * PI		    */
/****************************************************************************/
float tanf(float x)
{
    float xn, f, g, xnum, xden;
    int n;

    /*************************************************************************/
    /* n = round(x * 2/PI)                                                   */
    /*************************************************************************/
    if (x < 0.0) n = (int) (x * TWOINVPI - 0.5f);  /* since (int) -1.5 = -1.0 */
    else         n = (int) (x * TWOINVPI + 0.5f);

    xn = (float) n;

    /*************************************************************************/
    /* f = x - xn * PI / 2 (but more mathematically stable)                  */
    /*************************************************************************/
    f = (x - xn * C5) - xn * C6;

    /*************************************************************************/
    /* determine polynomial expression                                       */
    /*************************************************************************/
    g = f * f;

    xnum = TAP1 * g * f + f;
    xden = (TAQ2 * g + TAQ1) * g + 0.5f + 0.5f;

    /*************************************************************************/
    /* if n is odd                                                           */
    /*************************************************************************/
    if (n % 2 == 0) return (xnum / xden);
    else            return (xden / -xnum);
}

#else
/*---------------------------------------------------------------------------*/
/* FREEBSD method - use one of several 64-bit kernel helpers for precision.  */
/*---------------------------------------------------------------------------*/
#include "e_rem_pio2f.c"
#include "k_tanf.c"

/* Small multiples of pi/2 rounded to double precision. */
_DATA_ACCESS static const long double
t1pio2 = 1.0*C(M_PI_2),			/* 0x3FF921FB, 0x54442D18 */
t2pio2 = 2.0*C(M_PI_2),			/* 0x400921FB, 0x54442D18 */
t3pio2 = 3.0*C(M_PI_2),			/* 0x4012D97C, 0x7F3321D2 */
t4pio2 = 4.0*C(M_PI_2);			/* 0x401921FB, 0x54442D18 */

float
tanf(float x)
{
	long double y;
	int32_t n, hx, ix;

	GET_FLOAT_WORD(hx,x);
	ix = hx & 0x7fffffff;

	if(ix <= 0x3f490fda) {		/* |x| ~<= pi/4 */
	    if(ix<0x39800000)		/* |x| < 2**-12 */
		if(((int)x)==0) return x;	/* x with inexact if x != 0 */
	    return __kernel_tandf(x,1);
	}
	if(ix<=0x407b53d1) {		/* |x| ~<= 5*pi/4 */
	    if(ix<=0x4016cbe3)		/* |x| ~<= 3pi/4 */
		return __kernel_tandf(x + (hx>0 ? -t1pio2 : t1pio2), -1);
	    else
		return __kernel_tandf(x + (hx>0 ? -t2pio2 : t2pio2), 1);
	}
	if(ix<=0x40e231d5) {		/* |x| ~<= 9*pi/4 */
	    if(ix<=0x40afeddf)		/* |x| ~<= 7*pi/4 */
		return __kernel_tandf(x + (hx>0 ? -t3pio2 : t3pio2), -1);
	    else
		return __kernel_tandf(x + (hx>0 ? -t4pio2 : t4pio2), 1);
	}

    /* tan(Inf or NaN) is NaN */
	else if (ix>=0x7f800000)
        {
            if (isinf(x)) __raise_invalid();
            return NAN;
        }

    /* general argument reduction needed */
	else {
	    n = __rem_pio2f(x,&y);
	    /* integer parameter: 1 -- n even; -1 -- n odd */
	    return __kernel_tandf(y,1-((n&1)<<1));
	}
}
#endif

#if DBL_MANT_DIG == FLT_MANT_DIG
double tan(double x) __attribute__((__alias__("tanf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double tanl(long double x) __attribute__((__alias__("tanf")));
#endif
