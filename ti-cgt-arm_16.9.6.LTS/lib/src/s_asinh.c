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

/* asinh(x)
 * Method :
 *	Based on
 *		asinh(x) = sign(x) * log [ |x| + sqrt(x*x+1) ]
 *	we have
 *	asinh(x) := x  if  1+x*x=1,
 *		 := sign(x)*(log(x)+ln2)) for large |x|, else
 *		 := sign(x)*log(2|x|+1/(|x|+sqrt(x*x+1))) if|x|>2, else
 *		 := sign(x)*log1p(|x| + x^2/(1 + sqrt(1+x^2)))
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"

_DATA_ACCESS static const __ieee64_t
one =  C(1.00000000000000000000e+00), /* 0x3FF00000, 0x00000000 */
ln2 =  C(6.93147180559945286227e-01), /* 0x3FE62E42, 0xFEFA39EF */
huge=  C(1.00000000000000000000e+300);

__ieee64_t
F(asinh)(__ieee64_t x)
{
	__ieee64_t t,w;
	int32_t hx,ix;
	GET_HIGH_WORD(hx,x);
	ix = hx&0x7fffffff;
	if(ix>=0x7ff00000) return x+x;	/* x is inf or NaN */
	if(ix< 0x3e300000) {	/* |x|<2**-28 */
	    if(huge+x>one) return x;	/* return x inexact except 0 */
	}
	if(ix>0x41b00000) {	/* |x| > 2**28 */
	    w = F(log)(F(fabs)(x))+ln2;
	} else if (ix>0x40000000) {	/* 2**28 > |x| > 2.0 */
	    t = F(fabs)(x);
	    w = F(log)(2.0*t+one/(F(sqrt)(x*x+one)+t));
	} else {		/* 2.0 > |x| > 2**-28 */
	    t = x*x;
            w =F(log1p)(F(fabs)(x)+t/(one+F(sqrt)(one+t)));
	}
	if(hx>0) return w; else return -w;
}

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double asinhl(long double x) __attribute__((__alias__("asinh")));
#endif
