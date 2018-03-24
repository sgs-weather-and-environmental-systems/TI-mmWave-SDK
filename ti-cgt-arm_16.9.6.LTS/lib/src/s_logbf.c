/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * s_logbf.c -- float version of s_logb.c.
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
two25 = 3.355443200e+07;		/* 0x4c000000 */

float
logbf(float x)
{
	int32_t ix;
	GET_FLOAT_WORD(ix,x);
	ix &= 0x7fffffff;			/* high |x| */
	if(ix==0) return (float)-1.0/fabsf(x);
	if(ix>=0x7f800000) return x*x;
	if(ix<0x00800000) {
		x *= two25;		 /* convert subnormal x to normal */
		GET_FLOAT_WORD(ix,x);
		ix &= 0x7fffffff;
		return (float) ((ix>>23)-127-25);
	} else
		return (float) ((ix>>23)-127);
}

#if DBL_MANT_DIG == FLT_MANT_DIG
double logb(double x) __attribute__((__alias__("logbf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double logbl(long double x) __attribute__((__alias__("logbf")));
#endif
