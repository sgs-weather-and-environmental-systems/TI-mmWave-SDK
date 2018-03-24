/*
 * Copyright (c) 2015-2015 Texas Instruments Incorporated
 *
 * e___rem_pio2f.c -- float version of e___rem_pio2.c
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

/* __rem_pio2f(x,y)
 *
 * return the remainder of x rem pi/2 in *y
 * use double precision for everything except passing x
 * use __kernel_rem_pio2() for large x
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"

/*
 * invpio2:  53 bits of 2/pi
 * pio2_1:   first 25 bits of pi/2
 * pio2_1t:  pi/2 - pio2_1
 */

_DATA_ACCESS static const long double
invpio2 =  6.36619772367581382433e-01L, /* 0x3FE45F30, 0x6DC9C883 */
pio2_1  =  1.57079631090164184570e+00L, /* 0x3FF921FB, 0x50000000 */
pio2_1t =  1.58932547735281966916e-08L; /* 0x3E5110b4, 0x611A6263 */

_CODE_ACCESS static __inline __attribute((__always_inline__))
int
__rem_pio2f_small(float x, long double *y)
{
        /* Used when |x| ~< 2^28*(pi/2), medium size, or
           the target does not support a 64-bit type. */
	long double w,r,fn;
	int32_t n;

        /* n = integer part of x/(pi/2), or x*(2/pi) */

        /* Use a specialized rint() to get fn.  Assume round-to-nearest. */

#if LDBL_MANT_DIG == 53
        /* Given that x ~< 2^28*(pi/2), x*(2/pi) will be ~< 0x1p+28.
           This sequence forces rounding away at least 24 bits */
        STRICT_ASSIGN(long double,fn,x*invpio2+0x1.8p52);
        fn = fn-0x1.8p52;
#else
        /* We will reach here for values of x up to roughly
           2^128*(pi/2) when long double is 32 bits.  It's probably
           pointless to round like this for that case.  */
        STRICT_ASSIGN(long double,fn,x*invpio2+0x1.8p23);
        fn = fn-0x1.8p23;
#endif

#ifdef HAVE_EFFICIENT_IRINT
        n  = irint(fn);
#else
        n  = (int32_t)fn;
#endif
        r  = x-fn*pio2_1;
        w  = fn*pio2_1t;
        *y = r-w;
        return n;
}

#ifdef INLINE_REM_PIO2F
_CODE_ACCESS static __inline __attribute((__always_inline__))
#endif
int
__rem_pio2f(float x, long double *y)
{
#if LDBL_MANT_DIG == FLT_MANT_DIG
        return __rem_pio2f_small(x, y);
#else
	int32_t n;
	long double tx[1],ty[1];
	float z;
	int32_t e0,ix,hx;
	GET_FLOAT_WORD(hx,x);
	ix = hx&0x7fffffff;
    /* 33+53 bit pi is good enough for medium size */
	if(ix<0x4dc90fdb) 		/* |x| ~< 2^28*(pi/2), medium size */
            return __rem_pio2f_small(x, y);

    /*
     * all other (large) arguments
     */
	if(ix>=0x7f800000) {		/* x is inf or NaN */
	    *y=x-x; return 0;
	}
    /* set z = scalbn(|x|,ilogb(|x|)-23) */
	e0 = (ix>>23)-150;		/* e0 = ilogb(|x|)-23; */
	SET_FLOAT_WORD(z, ix - ((int32_t)(e0<<23)));
	tx[0] = z;
	n  =  __kernel_rem_pio2(tx,ty,e0,1,0);
	if(hx<0) {*y = -ty[0]; return -n;}
	*y = ty[0]; return n;
#endif
}
