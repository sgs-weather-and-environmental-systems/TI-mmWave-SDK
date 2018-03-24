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
 * from: @(#)fdlibm.h 5.1 93/09/24
 * $FreeBSD$
 */

#ifndef _MATH_PRIVATE_H_
#define	_MATH_PRIVATE_H_

#include <float.h>
#include <_defs.h>

/* For targets for which double is 32 bits and long double is 32 bits,
   we alter the 64-bit implementation files to use the long double
   name for the function.  We'll use "__ieee64_t" instead of
   "double".  For MSP430 COFF, no such type exists. */

#if DBL_MANT_DIG == 53
#define __ieee64_t double
#define IEEE64_EPSILON DBL_EPSILON
#define C(f) f
#define F(n) n
#elif LDBL_MANT_DIG == 53
#define __ieee64_t long double
#define IEEE64_EPSILON LDBL_EPSILON
#define _PASTE(x,y) x ## y
#define C(f) _PASTE(f, L)
#define F(n) _PASTE(n, l)
#else
/* use long double, the best we have */
#define _PASTE(x,y) x ## y
#define C(f) _PASTE(f, L)
#define F(n) _PASTE(n, l)
#endif

/* macros expected by FreeBSD source code */

#define GET_LOW_WORD(dst,d)  (dst=__f64_lower_bits_as_u32(d))
#define GET_HIGH_WORD(dst,d) (dst=__f64_upper_bits_as_u32(d))

#define SET_LOW_WORD(dst,u)  (dst=__u32x2_bits_as_f64(__f64_upper_bits_as_u32(dst),u))
#define SET_HIGH_WORD(dst,u) (dst=__u32x2_bits_as_f64(u,__f64_lower_bits_as_u32(dst)))

#define GET_FLOAT_WORD(dst,f) (dst=__f32_bits_as_u32(f))
#define SET_FLOAT_WORD(dst,u) (dst=__u32_bits_as_f32(u))

#define EXTRACT_WORDS(hidst,lodst,d) (hidst=__f64_upper_bits_as_u32(d),\
                                      lodst=__f64_lower_bits_as_u32(d))

#define INSERT_WORDS(dst,hi,lo) (dst = __u32x2_bits_as_f64(hi,lo))

#define EXTRACT_WORD64(dst,d) (dst=__f64_bits_as_u64(d))

#define INSERT_WORD64(dst,u) (dst=__u64_bits_as_f64(u))

/*
 * Attempt to get strict C99 semantics for assignment with non-C99 compilers.
 */
#define	STRICT_ASSIGN(type, lval, rval)	((lval) = (rval))


#ifdef _COMPLEX_H

/*
 * C99 specifies that complex numbers have the same representation as
 * an array of two elements, where the first element is the real part
 * and the second element is the imaginary part.
 */
typedef union {
	float complex f;
	float a[2];
} float_complex;
typedef union {
	double complex f;
	double a[2];
} double_complex;
typedef union {
	long double complex f;
	long double a[2];
} long_double_complex;
#define	REALPART(z)	((z).a[0])
#define	IMAGPART(z)	((z).a[1])

/*
 * Inline functions that can be used to construct complex values.
 *
 * The C99 standard intends x+I*y to be used for this, but x+I*y is
 * currently unusable in general since gcc introduces many overflow,
 * underflow, sign and efficiency bugs by rewriting I*y as
 * (0.0+I)*(y+0.0*I) and laboriously computing the full complex product.
 * In particular, I*Inf is corrupted to NaN+I*Inf, and I*-0 is corrupted
 * to -0.0+I*0.0.
 */
_CODE_ACCESS static __inline float complex
cpackf(float x, float y)
{
	float_complex z;

	REALPART(z) = x;
	IMAGPART(z) = y;
	return (z.f);
}

_CODE_ACCESS static __inline double complex
cpack(double x, double y)
{
	double_complex z;

	REALPART(z) = x;
	IMAGPART(z) = y;
	return (z.f);
}

_CODE_ACCESS static __inline long double complex
cpackl(long double x, long double y)
{
	long_double_complex z;

	REALPART(z) = x;
	IMAGPART(z) = y;
	return (z.f);
}
#endif /* _COMPLEX_H */
 
/* fdlibm kernel function */
int	           __kernel_rem_pio2(long double*, long double*, int, int, int);

/* double precision kernel functions */
#if defined(IEEE64_EPSILON)
#ifndef INLINE_REM_PIO2
int	           __rem_pio2(__ieee64_t, __ieee64_t*);
#endif
#endif
long double	   __kernel_sin(long double, long double, int);
long double	   __kernel_cos(long double, long double);
#if defined(IEEE64_EPSILON)
/* These functions access the bits directly */
__ieee64_t	   __kernel_tan(__ieee64_t, __ieee64_t, int);
__ieee64_t	   __ldexp_exp(__ieee64_t, int);
#ifdef _COMPLEX_H
__ieee64_t complex __ldexp_cexp(__ieee64_t complex, int);
#endif
#endif

/* float precision kernel functions */
#ifndef INLINE_REM_PIO2F
int	           __rem_pio2f(float, long double*);
#endif
#ifndef INLINE_KERNEL_SINDF
float	           __kernel_sindf(long double);
#endif
#ifndef INLINE_KERNEL_COSDF
float	           __kernel_cosdf(long double);
#endif
#ifndef INLINE_KERNEL_TANDF
float	           __kernel_tandf(long double, int);
#endif

float	           __ldexp_expf(float, int);
#ifdef _COMPLEX_H
float complex      __ldexp_cexpf(float complex, int);
#endif


/* BSD-style reentrant lgamma functions */
_CODE_ACCESS float	__lgammaf_r(float, int *);
#if LDBL_MANT_DIG >= 53
_CODE_ACCESS __ieee64_t	__lgamma_r(__ieee64_t, int *);
#endif

#if defined(math_errhandling)

 #if math_errhandling & MATH_ERREXCEPT
 #include <fenv.h>
 #define __raise_fpe(e) feraiseexcept(e)
 #else
 #define __raise_fpe(e) /* nothing */
 #endif

 #if math_errhandling & MATH_ERRNO
 #include <errno.h>
 #define __set_errno(n) (errno=(n))
 #else
 #define __set_errno(n) /* nothing */
 #endif

#define __raise_invalid()    do { __raise_fpe(FE_INVALID);   __set_errno(EDOM);   } while(0)
#define __raise_divzero()    do { __raise_fpe(FE_DIVZERO);   __set_errno(ERANGE); } while(0)
#define __raise_overflow()   do { __raise_fpe(FE_OVERFLOW);  __set_errno(ERANGE); } while(0)
#define __raise_underflow()  do { __raise_fpe(FE_UNDERFLOW); __set_errno(ERANGE); } while(0)
#define __raise_inexact()    do { __raise_fpe(FE_INEXACT);                        } while(0)

#endif /* math_errhandling */

#endif /* !_MATH_PRIVATE_H_ */
