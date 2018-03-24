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

/* remainder(x,p)
 * Return :                  
 * 	returns  x REM p  =  x - [x/p]*p as if in infinite 
 * 	precise arithmetic, where [x/p] is the (infinite bit) 
 *	integer nearest x/p (in half way case choose the even one).
 * Method : 
 *	Based on fmod() return x-[x/p]chopped*p exactlp.
 */

#include <float.h>
#include <stdint.h>
#include "math.h"
#include "math_private.h"

_DATA_ACCESS static const __ieee64_t zero = 0.0;


__ieee64_t
F(remainder)(__ieee64_t x, __ieee64_t p)
{
	int32_t hx,hp;
	uint32_t sx,lx,lp;
	__ieee64_t p_half;

	EXTRACT_WORDS(hx,lx,x);
	EXTRACT_WORDS(hp,lp,p);
	sx = hx&0x80000000;
	hp &= 0x7fffffff;
	hx &= 0x7fffffff;

    /* purge off exception values */
	if((hp|lp)==0) return (x*p)/(x*p); 	/* p = 0 */
	if((hx>=0x7ff00000)||			/* x not finite */
	  ((hp>=0x7ff00000)&&			/* p is NaN */
	  (((hp-0x7ff00000)|lp)!=0)))
	    return ((__ieee64_t)x*p)/((__ieee64_t)x*p); /* ?? */


	if (hp<=0x7fdfffff) x = F(fmod)(x,p+p);	/* now x < 2p */
	if (((hx-hp)|(lx-lp))==0) return zero*x;
	x  = F(fabs)(x);
	p  = F(fabs)(p);
	if (hp<0x00200000) {
	    if(x+x>p) {
		x-=p;
		if(x+x>=p) x -= p;
	    }
	} else {
	    p_half = 0.5*p;
	    if(x>p_half) {
		x-=p;
		if(x>=p_half) x -= p;
	    }
	}
	GET_HIGH_WORD(hx,x);
	if ((hx&0x7fffffff)==0) hx = 0;
	SET_HIGH_WORD(x,hx^sx);
	return x;
}

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double remainderl(long double x, long double p) __attribute__((__alias__("remainder")));
#endif
