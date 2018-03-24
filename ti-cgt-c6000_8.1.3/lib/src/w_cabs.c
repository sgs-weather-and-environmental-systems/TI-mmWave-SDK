/*
 * cabs() wrapper for hypot().
 *
 * Written by J.T. Conklin, <jtc@wimsey.com>
 * Placed into the Public Domain, 1994.
 */

#include <float.h>
#include <complex.h>
#include <math.h>

double
cabs(double complex z)
{
	return hypot(creal(z), cimag(z));
}

#if FLT_MANT_DIG == DBL_MANT_DIG
float cabsf(float complex z) __attribute__((__alias__("cabs")));
#endif

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double cabsl(long double complex z) __attribute__((__alias__("cabs")));
#endif

