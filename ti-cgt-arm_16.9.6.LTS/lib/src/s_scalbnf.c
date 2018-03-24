/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * s_scalbnf.c -- float version of s_scalbn.c.
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
two25   =  3.355443200e+07,	/* 0x4c000000 */
twom25  =  2.9802322388e-08,	/* 0x33000000 */
tiny   = 1.0e-30;

float
scalbnf (float x, int n)
{
	int32_t k,ix;
	GET_FLOAT_WORD(ix,x);
        k = (ix&0x7f800000)>>23;		/* extract exponent */
        if (k==0) {				/* 0 or subnormal x */
            if ((ix&0x7fffffff)==0) return x; /* +-0 */
	    x *= two25;
	    GET_FLOAT_WORD(ix,x);
	    k = ((ix&0x7f800000)>>23) - 25;
            if (n< -50000) return tiny*x; 	/*underflow*/
	    }
        if (k==0xff) return x+x;		/* NaN or Inf */
        k = k+n;
        if (k >  0xfe)
        {
            __raise_overflow();
            return copysignf(INFINITY, x); /* overflow  */
        }
        if (k > 0) 				/* normal result */
	    {SET_FLOAT_WORD(x,(ix&0x807fffff)|(k<<23)); return x;}
        if (k <= -25)
            if (n > 50000) 	/* in case integer overflow in n+k */
            {
                __raise_overflow();
                return copysignf(INFINITY, x); /* overflow  */
            }
	    else return tiny*copysignf(tiny,x);	/*underflow*/
        k += 25;				/* subnormal result */
	SET_FLOAT_WORD(x,(ix&0x807fffff)|(k<<23));
        return x*twom25;
}

float ldexpf(float x, int n) __attribute__((__alias__("scalbnf")));

#if DBL_MANT_DIG == FLT_MANT_DIG
double scalbn(double x, int n) __attribute__((__alias__("scalbnf")));
double ldexp (double x, int n) __attribute__((__alias__("scalbnf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double scalbnl(long double x, int n) __attribute__((__alias__("scalbnf")));
long double ldexpl (long double x, int n) __attribute__((__alias__("scalbnf")));
#endif

