/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * e_sqrtf.c -- float version of e_sqrt.c.
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

#if !__TI_HAS_BUILTIN_SQRT32 && !defined(__TMS320C28XX_FPU32__)
_DATA_ACCESS static const float	one	= 1.0, tiny=1.0e-30;
#endif

float
sqrtf(float x)
{
#if __TI_HAS_BUILTIN_SQRT32
    /* x < 0 is a domain error. */
    if (x < 0) { __raise_invalid(); return NAN; }
	
    /* Call builtin sqrt function. x can be real, +inf, or NaN */
    return __ti_builtin_sqrt32(x);
#elif defined(__TMS320C28XX_FPU32__)
    /* x < 0 is a domain error. */
    if (x < 0) { __raise_invalid(); return NAN; }

    if (x == 0) return x;

    /* 
     * We'll compute 1/sqrt(x) using the Newton-Raphson method from an
     * initial approximation using EISQRTF32; this instruction gives
     * 1/sqrtf(x) "accurate to approximately 8 bits" (SPRUEO2A).  The
     * number of iterations used here may not be optimal for this
     * instruction.
     *
     * n.b. __eisqrtf32 cannot generate -0, NaN, or denormal values
     *
     * n.b. this loop is divergent for very small x
     */

    float x0 = __eisqrtf32(x);
    int i;

    for (i = 0; i < 3; i++)
      x0 *= (1.5 - x * 0.5 * x0 * x0);

    /* now sqrt(x) = x * 1/sqrt(x) */
    return x * x0;
#else
	float z;
	uint32_t sign = 0x80000000;
	int32_t ix,s,q,m,t,i;
	uint32_t r;

	GET_FLOAT_WORD(ix,x);

    /* take care of Inf and NaN */
	if((ix&0x7f800000)==0x7f800000) {
	    return x*x+x;		/* sqrt(NaN)=NaN, sqrt(+inf)=+inf
					   sqrt(-inf)=sNaN */
	}
    /* take care of zero */
	if(ix<=0) {
	    if((ix&(~sign))==0) return x;/* sqrt(+-0) = +-0 */
	    else
            {
                __raise_invalid();
		return NAN;
            }
	}
    /* normalize x */
	m = (ix>>23);
	if(m==0) {				/* subnormal x */
	    for(i=0;(ix&0x00800000)==0;i++) ix<<=1;
	    m -= i-1;
	}
	m -= 127;	/* unbias exponent */
	ix = (ix&0x007fffff)|0x00800000;
	if(m&1)	/* odd m, double x to make it even */
	    ix += ix;
	m >>= 1;	/* m = [m/2] */

    /* generate sqrt(x) bit by bit */
	ix += ix;
	q = s = 0;		/* q = sqrt(x) */
	r = 0x01000000;		/* r = moving bit from right to left */

	while(r!=0) {
	    t = s+r;
	    if(t<=ix) {
		s    = t+r;
		ix  -= t;
		q   += r;
	    }
	    ix += ix;
	    r>>=1;
	}

    /* use floating add to find out rounding direction */
	if(ix!=0) {
            __raise_inexact();
	    z = one-tiny; /* trigger inexact flag */
	    if (z>=one) {
	        z = one+tiny;
		if (z>one)
		    q += 2;
		else
		    q += (q&1);
	    }
	}
	ix = (q>>1)+0x3f000000;
	ix += (m <<23);
	SET_FLOAT_WORD(z,ix);
	return z;
#endif
}

#if DBL_MANT_DIG == FLT_MANT_DIG
double sqrt(double x) __attribute__((__alias__("sqrtf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double sqrtl(long double x) __attribute__((__alias__("sqrtf")));
#endif
