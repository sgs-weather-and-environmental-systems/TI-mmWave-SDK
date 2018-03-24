/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * e_coshf.c -- float version of e_cosh.c.
 * Conversion to float by Ian Lance Taylor, Cygnus Support, ian@cygnus.com.
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
#include "math.h"
#include "math_private.h"

_DATA_ACCESS static const float one = 1.0, half=0.5;

float
coshf(float x)
{
	float t,w;
	int32_t ix;

	GET_FLOAT_WORD(ix,x);
	ix &= 0x7fffffff;

    /* x is INF or NaN */
	if(ix>=0x7f800000) return fabsf(x);

    /* |x| in [0,0.5*ln2], return 1+expm1(|x|)^2/(2*exp(|x|)) */
	if(ix<0x3eb17218) {
	    t = expm1f(fabsf(x));
	    w = one+t;
	    if (ix<0x39800000) return one;	/* cosh(tiny) = 1 */
	    return one+(t*t)/(w+w);
	}

    /* |x| in [0.5*ln2,9], return (exp(|x|)+1/exp(|x|))/2; */
	if (ix < 0x41100000) {
		t = expf(fabsf(x));
		return half*t+half/t;
	}

    /* |x| in [9, log(maxfloat)] return half*exp(|x|) */
	if (ix < 0x42b17217)  return half*expf(fabsf(x));

    /* |x| in [log(maxfloat), overflowthresold] */
	if (ix<=0x42b2d4fc)
	    return __ldexp_expf(fabsf(x), -1);

    /* |x| > overflowthresold, cosh(x) overflow */
        __raise_overflow();
	return INFINITY;
}

#if DBL_MANT_DIG == FLT_MANT_DIG
double cosh(double x) __attribute__((__alias__("coshf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double coshl(long double x) __attribute__((__alias__("coshf")));
#endif
