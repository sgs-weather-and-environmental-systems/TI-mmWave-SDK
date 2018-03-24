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
 * scalbn (double x, int n)
 * scalbn(x,n) returns x* 2**n  computed by  exponent
 * manipulation rather than by actually performing an
 * exponentiation or a multiplication.
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"

_DATA_ACCESS static const __ieee64_t
two54   =  C(1.80143985094819840000e+16), /* 0x43500000, 0x00000000 */
twom54  =  C(5.55111512312578270212e-17), /* 0x3C900000, 0x00000000 */
tiny   = C(1.0e-300);

__ieee64_t
F(scalbn)(__ieee64_t x, int n)
{
	int32_t k,hx,lx;
	EXTRACT_WORDS(hx,lx,x);
        k = (hx&0x7ff00000)>>20;		/* extract exponent */
        if (k==0) {				/* 0 or subnormal x */
            if ((lx|(hx&0x7fffffff))==0) return x; /* +-0 */
	    x *= two54;
	    GET_HIGH_WORD(hx,x);
	    k = ((hx&0x7ff00000)>>20) - 54;
            if (n< -50000) return tiny*x; 	/*underflow*/
	    }
        if (k==0x7ff) return x+x;		/* NaN or Inf */
        k = k+n;
        if (k >  0x7fe)
        {
            __raise_overflow();
            return F(copysign)(INFINITY, x); /* overflow  */
        }
        if (k > 0) 				/* normal result */
	    {SET_HIGH_WORD(x,(hx&0x800fffff)|(k<<20)); return x;}
        if (k <= -54)
            if (n > 50000) 	/* in case integer overflow in n+k */
            {
                __raise_overflow();
                return F(copysign)(INFINITY, x); /* overflow  */
            }
	    else return tiny*F(copysign)(tiny,x); 	/*underflow*/
        k += 54;				/* subnormal result */
	SET_HIGH_WORD(x,(hx&0x800fffff)|(k<<20));
        return x*twom54;
}

/* For C2000, this makes scalbnl and ldexpl */
/* For others, this is   scalbn  and ldexp  */

#if DBL_MANT_DIG == 53
double ldexp(double x, int n) __attribute__((__alias__("scalbn")));
#else
long double ldexpl(long double x, int n) __attribute__((__alias__("scalbnl")));
#endif

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double scalbnl(long double x, int n) __attribute__((__alias__("scalbn")));
long double  ldexpl(long double x, int n) __attribute__((__alias__("scalbn")));
#endif
