/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * e_acoshf.c -- float version of e_acosh.c.
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

_DATA_ACCESS static const float
one	= 1.0,
ln2	= 6.9314718246e-01;  /* 0x3f317218 */

float
acoshf(float x)
{
	float t;
	int32_t hx;
	GET_FLOAT_WORD(hx,x);
	if(hx<0x3f800000) {		/* x < 1 */
            __raise_invalid();
            return NAN;
	} else if(hx >=0x4d800000) {	/* x > 2**28 */
	    if(hx >=0x7f800000) {	/* x is inf of NaN */
	        return x+x;
	    } else
		return logf(x)+ln2;	/* acosh(huge)=log(2x) */
	} else if (hx==0x3f800000) {
	    return 0.0;			/* acosh(1) = 0 */
	} else if (hx > 0x40000000) {	/* 2**28 > x > 2 */
	    t=x*x;
	    return logf((float)2.0*x-one/(x+sqrtf(t-one)));
	} else {			/* 1<x<2 */
	    t = x-one;
	    return log1pf(t+sqrtf((float)2.0*t+t*t));
	}
}

#if DBL_MANT_DIG == FLT_MANT_DIG
double acosh(double x) __attribute__((__alias__("acoshf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double acoshl(long double x) __attribute__((__alias__("acoshf")));
#endif
