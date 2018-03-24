/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
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
 * fabs(x) returns the absolute value of x.
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"

__ieee64_t
F(fabs)(__ieee64_t x)
{
	uint32_t high;
	GET_HIGH_WORD(high,x);
	SET_HIGH_WORD(x,high&0x7fffffff);
        return x;
}

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double fabsl(long double x) __attribute__((__alias__("fabs")));
#endif
