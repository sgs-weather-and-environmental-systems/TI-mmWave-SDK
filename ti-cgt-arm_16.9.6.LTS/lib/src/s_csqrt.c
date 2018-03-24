/*-
 * Copyright (c) 2014-2015 Texas Instruments Incorporated
 *
 * Copyright (c) 2007 David Schultz <das@FreeBSD.ORG>
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 * 1. Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 * 2. Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * THIS SOFTWARE IS PROVIDED BY THE AUTHOR AND CONTRIBUTORS ``AS IS'' AND
 * ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE
 * IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE
 * ARE DISCLAIMED.  IN NO EVENT SHALL THE AUTHOR OR CONTRIBUTORS BE LIABLE
 * FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL
 * DAMAGES (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS
 * OR SERVICES; LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION)
 * HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT
 * LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY
 * OUT OF THE USE OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF
 * SUCH DAMAGE.
 */

#include <complex.h>
#include <float.h>
#include <math.h>

#include "math_private.h"

/* We risk spurious overflow for components >= DBL_MAX / (1 + sqrt(2)). */
#define	THRESH	C(0x1.a827999fcef32p+1022)

__ieee64_t complex
F(csqrt)(__ieee64_t complex z)
{
	__ieee64_t complex result;
	__ieee64_t a, b;
	__ieee64_t t;
	int scale;

	a = F(creal)(z);
	b = F(cimag)(z);

	/* Handle special cases. */
	if (z == 0)
		return (F(cpack)(0, b));
	if (isinf(b))
		return (F(cpack)(INFINITY, b));
	if (isnan(a)) {
		t = (b - b) / (b - b);	/* raise invalid if b is not a NaN */
		return (F(cpack)(a, t));	/* return NaN + NaN i */
	}
	if (isinf(a)) {
		/*
		 * csqrt(inf + NaN i)  = inf +  NaN i
		 * csqrt(inf + y i)    = inf +  0 i
		 * csqrt(-inf + NaN i) = NaN +- inf i
		 * csqrt(-inf + y i)   = 0   +  inf i
		 */
		if (signbit(a))
			return (F(cpack)(F(fabs)(b - b), F(copysign)(a, b)));
		else
			return (F(cpack)(a, F(copysign)(b - b, b)));
	}
	/*
	 * The remaining special case (b is NaN) is handled just fine by
	 * the normal code path below.
	 */

	/* Scale to avoid overflow. */
	if (F(fabs)(a) >= THRESH || F(fabs)(b) >= THRESH) {
		a *= 0.25;
		b *= 0.25;
		scale = 1;
	} else {
		scale = 0;
	}

	/* Algorithm 312, CACM vol 10, Oct 1967. */
	if (a >= 0) {
		t = F(sqrt)((a + F(hypot)(a, b)) * 0.5);
		result = F(cpack)(t, b / (2 * t));
	} else {
		t = F(sqrt)((-a + F(hypot)(a, b)) * 0.5);
		result = F(cpack)(F(fabs)(b) / (2 * t), F(copysign)(t, b));
	}

	/* Rescale. */
	if (scale)
		return (result * 2);
	else
		return (result);
}

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double complex csqrtl(long double complex z) __attribute__((__alias__("csqrt")));
#endif
