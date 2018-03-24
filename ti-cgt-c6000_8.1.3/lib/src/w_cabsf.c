/*
 * cabsf() wrapper for hypotf().
 *
 * Written by J.T. Conklin, <jtc@wimsey.com>
 * Placed into the Public Domain, 1994.
 */

#include <float.h>
#include <complex.h>
#include <math.h>

#if FLT_MANT_DIG != DBL_MANT_DIG

float
cabsf(float complex z)
{
	return hypotf(crealf(z), cimagf(z));
}

#endif
