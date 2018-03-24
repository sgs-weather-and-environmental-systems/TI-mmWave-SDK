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

/* acosh(x)
 * Method :
 *	Based on 
 *		acosh(x) = log [ x + sqrt(x*x-1) ]
 *	we have
 *		acosh(x) := log(x)+ln2,	if x is large; else
 *		acosh(x) := log(2x-1/(sqrt(x*x-1)+x)) if x>2; else
 *		acosh(x) := log1p(t+sqrt(2.0*t+t*t)); where t=x-1.
 *
 * Special cases:
 *	acosh(x) is NaN with signal if x<1.
 *	acosh(NaN) is NaN without signal.
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"

_DATA_ACCESS static const __ieee64_t
one	= 1.0,
ln2	= C(6.93147180559945286227e-01);  /* 0x3FE62E42, 0xFEFA39EF */

__ieee64_t
F(acosh)(__ieee64_t x)
{
	__ieee64_t t;
	int32_t hx;
	uint32_t lx;
	EXTRACT_WORDS(hx,lx,x);
	if(hx<0x3ff00000) {		/* x < 1 */
            __raise_invalid();
            return NAN;
	} else if(hx >=0x41b00000) {	/* x > 2**28 */
	    if(hx >=0x7ff00000) {	/* x is inf of NaN */
	        return x+x;
	    } else 
		return F(log)(x)+ln2;	/* acosh(huge)=log(2x) */
	} else if(((hx-0x3ff00000)|lx)==0) {
	    return 0.0;			/* acosh(1) = 0 */
	} else if (hx > 0x40000000) {	/* 2**28 > x > 2 */
	    t=x*x;
	    return F(log)(2.0*x-one/(x+F(sqrt)(t-one)));
	} else {			/* 1<x<2 */
	    t = x-one;
	    return F(log1p)(t+F(sqrt)(2.0*t+t*t));
	}
}

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double acoshl(long double x) __attribute__((__alias__("acosh")));
#endif
