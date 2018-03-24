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

/* atanh(x)
 * Method :
 *    1.Reduced x to positive by atanh(-x) = -atanh(x)
 *    2.For x>=0.5
 *                  1              2x                          x
 *	atanh(x) = --- * log(1 + -------) = 0.5 * log1p(2 * --------)
 *                  2             1 - x                      1 - x
 *	
 * 	For x<0.5
 *	atanh(x) = 0.5*log1p(2x+2x*x/(1-x))
 *
 * Special cases:
 *	atanh(x) is NaN if |x| > 1 with signal;
 *	atanh(NaN) is that NaN with no signal;
 *	atanh(+-1) is +-INF with signal.
 *
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"

_DATA_ACCESS static const __ieee64_t one = 1.0, huge = C(1e300);
_DATA_ACCESS static const __ieee64_t zero = 0.0;

__ieee64_t
F(atanh)(__ieee64_t x)
{
	__ieee64_t t;
	int32_t hx,ix;
	uint32_t lx;
	EXTRACT_WORDS(hx,lx,x);
	ix = hx&0x7fffffff;
	if ((ix|((lx|(-lx))>>31))>0x3ff00000) /* |x|>1 */
        {
            __raise_invalid();
            return NAN;
        }
	if(ix==0x3ff00000) 
	    return INFINITY;
	if(ix<0x3e300000&&(huge+x)>zero) return x;	/* x<2**-28 */
	SET_HIGH_WORD(x,ix);
	if(ix<0x3fe00000) {		/* x < 0.5 */
	    t = x+x;
	    t = 0.5*F(log1p)(t+t*x/(one-x));
	} else 
	    t = 0.5*F(log1p)((x+x)/(one-x));
	if(hx>=0) return t; else return -t;
}

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double atanhl(long double x) __attribute__((__alias__("atanh")));
#endif
