/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * s_cbrtf.c -- float version of s_cbrt.c.
 * Conversion to float by Ian Lance Taylor, Cygnus Support, ian@cygnus.com.
 * Debugged and optimized by Bruce D. Evans.
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

/* cbrtf(x)
 * Return cube root of x
 */
_DATA_ACCESS static const uint32_t
	B1 = 709958130, /* B1 = (127-127.0/3-0.03306235651)*2**23 */
	B2 = 642849266; /* B2 = (127-127.0/3-24/3-0.03306235651)*2**23 */

float
cbrtf(float x)
{
	float t;
	int32_t hx;
	uint32_t sign;
	uint32_t high;

	GET_FLOAT_WORD(hx,x);
	sign=hx&0x80000000; 		/* sign= sign(x) */
	hx  ^=sign;
	if(hx>=0x7f800000) return(x+x); /* cbrt(NaN,INF) is itself */

    /* rough cbrt to 5 bits */
	if(hx<0x00800000) { 		/* zero or subnormal? */
	    if(hx==0)
		return(x);		/* cbrt(+-0) is itself */
	    SET_FLOAT_WORD(t,0x4b800000); /* set t= 2**24 */
	    t*=x;
	    GET_FLOAT_WORD(high,t);
	    SET_FLOAT_WORD(t,sign|((high&0x7fffffff)/3+B2));
	} else
	    SET_FLOAT_WORD(t,sign|(hx/3+B1));

#if __TI_HAS_F32_HARDWARE && !__TI_HAS_F64_HARDWARE
/*---------------------------------------------------------------------------*/
/* This hardware has fast 32-bit hardware, but not 64-bit hardware.  We      */
/* don't want to sacrifice the O(100x) speedup of hardware computation for   */
/* the rather small extra precision of 64-bit computation.                   */
/*---------------------------------------------------------------------------*/
/* Taken from s_cbrt.c                                                       */
/*---------------------------------------------------------------------------*/
_DATA_ACCESS static const float
P0 =  1.87595182427177009643f,		/* 0x3ffe03e6, 0x0f61e692 */
P1 = -1.88497979543377169875f,		/* 0xbffe28e0, 0x92f02420 */
P2 =  1.621429720105354466140f,		/* 0x3ff9f160, 0x4a49d6c2 */
P3 = -0.758397934778766047437f,		/* 0xbfe844cb, 0xbee751d9 */
P4 =  0.145996192886612446982f;		/* 0x3fc2b000, 0xd4e4edd7 */
	float r;

    /*
     * New cbrt to 23 bits:
     *    cbrt(x) = t*cbrt(x/t**3) ~= t*P(t**3/x)
     * where P(r) is a polynomial of degree 4 that approximates 1/cbrt(r)
     * to within 2**-23.5 when |r - 1| < 1/10.  The rough approximation
     * has produced t such than |t/cbrt(x) - 1| ~< 1/32, and cubing this
     * gives us bounds for r = t**3/x.
     *
     * Try to optimize for parallel evaluation as in k_tanf.c.
     */
	r=(t*t)*(t/x);
	t=t*((P0+r*(P1+r*P2))+((r*r)*r)*(P3+r*P4));

        return t;
#else
    /*
     * First step Newton iteration (solving t*t-x/t == 0) to 16 bits.  In
     * double precision so that its terms can be arranged for efficiency
     * without causing overflow or underflow.
     */
	long double r,T;

	T=t;
	r=T*T*T;
	T=T*((long double)x+x+r)/(x+r+r);

    /*
     * Second step Newton iteration to 47 bits.  In double precision for
     * efficiency and accuracy.
     */
	r=T*T*T;
	T=T*((long double)x+x+r)/(x+r+r);

    /* rounding to 24 bits is perfect in round-to-nearest mode */
	return(T);
#endif
}

#if DBL_MANT_DIG == FLT_MANT_DIG
double cbrt(double x) __attribute__((__alias__("cbrtf")));
#endif

#if LDBL_MANT_DIG == FLT_MANT_DIG
long double cbrtl(long double x) __attribute__((__alias__("cbrtf")));
#endif
