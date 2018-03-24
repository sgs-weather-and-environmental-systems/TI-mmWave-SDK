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
 * double logb(x)
 * IEEE 754 logb. Included to pass IEEE test suite. Not recommend.
 * Use ilogb instead.
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"

_DATA_ACCESS static const __ieee64_t
two54 = C(1.80143985094819840000e+16);	/* 43500000 00000000 */

__ieee64_t
F(logb)(__ieee64_t x)
{
	int32_t lx,ix;
	EXTRACT_WORDS(ix,lx,x);
	ix &= 0x7fffffff;			/* high |x| */
	if((ix|lx)==0) return -1.0/F(fabs)(x);
	if(ix>=0x7ff00000) return x*x;
	if(ix<0x00100000) {
		x *= two54;		 /* convert subnormal x to normal */
		GET_HIGH_WORD(ix,x);
		ix &= 0x7fffffff;
		return (__ieee64_t) ((ix>>20)-1023-54);
	} else
		return (__ieee64_t) ((ix>>20)-1023);
}

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double logbl(long double x) __attribute__((__alias__("logb")));
#endif
