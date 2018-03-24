/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * ====================================================
 * Copyright (C) 1993 by Sun Microsystems, Inc. All rights reserved.
 *
 * Developed at SunSoft, a Sun Microsystems, Inc. business.
 * Permission to use, copy, modify, and distribute this
 * software is freely granted, provided that this notice 
 * is preserved.
 * ====================================================
 *
 */

/* lgamma(x)
 * Return the logarithm of the Gamma function of x.
 *
 * Method: call lgamma_r
 */

#include <float.h>
#define __BSD_VISIBLE 1
#include "math.h"
#include "math_private.h"

__ieee64_t
F(lgamma)(__ieee64_t x)
{
        int signgam;

	return __lgamma_r(x,&signgam);
}

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double lgammal(long double x) __attribute__((__alias__("lgamma")));
#endif
