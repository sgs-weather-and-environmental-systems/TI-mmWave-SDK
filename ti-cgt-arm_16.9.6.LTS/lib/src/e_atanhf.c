/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * e_atanhf.c -- float version of e_atanh.c.
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

_DATA_ACCESS static const float one = 1.0, huge = 1e30;

_DATA_ACCESS static const float zero = 0.0;

float
atanhf(float x)
{
	float t;
	int32_t hx,ix;
	GET_FLOAT_WORD(hx,x);
	ix = hx&0x7fffffff;
	if (ix>0x3f800000) 		/* |x|>1 */
        {
            __raise_invalid();
            return NAN;
        }
	if(ix==0x3f800000)
            return INFINITY;
	if(ix<0x31800000&&(huge+x)>zero) return x;	/* x<2**-28 */
	SET_FLOAT_WORD(x,ix);
	if(ix<0x3f000000) {		/* x < 0.5 */
	    t = x+x;
	    t = (float)0.5*log1pf(t+t*x/(one-x));
	} else
	    t = (float)0.5*log1pf((x+x)/(one-x));
	if(hx>=0) return t; else return -t;
}

#if DBL_MANT_DIG == FLT_MANT_DIG
double atanh(double x) __attribute__((__alias__("atanhf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double atanhl(long double x) __attribute__((__alias__("atanhf")));
#endif
