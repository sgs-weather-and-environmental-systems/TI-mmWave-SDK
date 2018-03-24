/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * s_fabsf.c -- float version of s_fabs.c.
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

/*
 * fabsf(x) returns the absolute value of x.
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"

float
fabsf(float x)
{
	uint32_t ix;
	GET_FLOAT_WORD(ix,x);
	SET_FLOAT_WORD(x,ix&0x7fffffff);
        return x;
}

#if DBL_MANT_DIG == FLT_MANT_DIG
double fabs(double x) __attribute__((__alias__("fabsf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double fabsl(long double x) __attribute__((__alias__("fabsf")));
#endif
