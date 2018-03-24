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
 */

/*
 * Return the base 10 logarithm of x.  See e_log.c and k_log.h for most
 * comments.
 *
 *    log10(x) = (f - 0.5*f*f + k_log1p(f)) / ln10 + k * log10(2)
 * in not-quite-routine extra precision.
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"
#include "k_log.h"

_DATA_ACCESS static const __ieee64_t
two54      =  C(1.80143985094819840000e+16), /* 0x43500000, 0x00000000 */
ivln10hi   =  C(4.34294481878168880939e-01), /* 0x3fdbcb7b, 0x15200000 */
ivln10lo   =  C(2.50829467116452752298e-11), /* 0x3dbb9438, 0xca9aadd5 */
log10_2hi  =  C(3.01029995663611771306e-01), /* 0x3FD34413, 0x509F6000 */
log10_2lo  =  C(3.69423907715893078616e-13); /* 0x3D59FEF3, 0x11F12B36 */

_DATA_ACCESS static const __ieee64_t zero   =  0.0;

__ieee64_t
F(log10)(__ieee64_t x)
{
	__ieee64_t f,hfsq,hi,lo,r,val_hi,val_lo,w,y,y2;
	int32_t i,k,hx;
	uint32_t lx;

	EXTRACT_WORDS(hx,lx,x);

	k=0;
	if (hx < 0x00100000) {			/* x < 2**-1022  */
	    if (((hx&0x7fffffff)|lx)==0)
		return -INFINITY;		/* log(+-0)=-inf */
	    if (hx<0)
            {
                __raise_invalid();
                return NAN;			/* log(-#) = NaN */
            }
	    k -= 54; x *= two54; /* subnormal number, scale up x */
	    GET_HIGH_WORD(hx,x);
	}
	if (hx >= 0x7ff00000) return x+x;
	if (hx == 0x3ff00000 && lx == 0)
	    return zero;			/* log(1) = +0 */
	k += (hx>>20)-1023;
	hx &= 0x000fffff;
	i = (hx+0x95f64)&0x100000;
	SET_HIGH_WORD(x,hx|(i^0x3ff00000));	/* normalize x or x/2 */
	k += (i>>20);
	y = (__ieee64_t)k;
	f = x - 1.0;
	hfsq = 0.5*f*f;
	r = k_log1p(f);

	/* See e_log2.c for most details. */
	hi = f - hfsq;
	SET_LOW_WORD(hi,0);
	lo = (f - hi) - hfsq + r;
	val_hi = hi*ivln10hi;
	y2 = y*log10_2hi;
	val_lo = y*log10_2lo + (lo+hi)*ivln10lo + lo*ivln10hi;

	/*
	 * Extra precision in for adding y*log10_2hi is not strictly needed
	 * since there is no very large cancellation near x = sqrt(2) or
	 * x = 1/sqrt(2), but we do it anyway since it costs little on CPUs
	 * with some parallelism and it reduces the error for many args.
	 */
	w = y2 + val_hi;
	val_lo += (y2 - w) + val_hi;
	val_hi = w;

	return val_lo + val_hi;
}

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double log10l(long double x) __attribute__((__alias__("log10")));
#endif
