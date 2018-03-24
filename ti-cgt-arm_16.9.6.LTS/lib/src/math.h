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

#ifndef _TI_MATH_H_
#define	_TI_MATH_H_

#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-16.4") /* identifiers in fn defn/decl identical??? fabs/fabsf */
#pragma CHECK_MISRA("-19.1") /* only comments and preproc before #include */
#pragma CHECK_MISRA("-19.7") /* macros required for implementation */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */

#include <linkage.h>
#include <_defs.h>

/*---------------------------------------------------------------------------*/
/* A header file conforming to ARM CLIB ABI (GENC-003539), should            */
/* define _AEABI_PORTABLE when _AEABI_PORTABILITY_LEVEL is defined.          */
/*---------------------------------------------------------------------------*/
#if defined(_AEABI_PORTABILITY_LEVEL) && !defined(_AEABI_PORTABLE)
#define _AEABI_PORTABLE
#endif

/*---------------------------------------------------------------------------*/
/* The macro definition that guards CLIB ABI (GENC-003539) requirements.     */
/*---------------------------------------------------------------------------*/
#if defined(__TMS470__) && defined(__TI_EABI_SUPPORT__)
#define _AEABI_PORTABILITY_CHECK (defined(__TMS470__) && \
                                  defined(__TI_EABI_SUPPORT__) && \
                                  defined(_AEABI_PORTABILITY_LEVEL) && \
                                  _AEABI_PORTABILITY_LEVEL != 0)
#else
#define _AEABI_PORTABILITY_CHECK 0
#endif

/*
 * ANSI/POSIX
 */

#if defined(__cplusplus) && _AEABI_PORTABILITY_CHECK
  extern "C" namespace std {
    extern const double      __aeabi_HUGE_VAL;
    extern const long double __aeabi_HUGE_VALL;
    extern const float       __aeabi_HUGE_VALF;
    extern const float       __aeabi_INFINITY;
    extern const float       __aeabi_NAN;
  }
#define	HUGE_VAL	__aeabi_HUGE_VAL
#define	HUGE_VALF	__aeabi_HUGE_VALF
#define	HUGE_VALL	__aeabi_HUGE_VALL
#define	INFINITY	__aeabi_INFINITY
#define	NAN		__aeabi_NAN
#else
#define	HUGE_VAL	((double)__INFINITY__)
#define	HUGE_VALF	(__INFINITY__)
#define	HUGE_VALL	((long double)__INFINITY__)
#define	INFINITY	(__INFINITY__)
#define	NAN		(__NAN__)
#endif

#define	FP_ILOGB0	(-__INT_MAX)
#define	FP_ILOGBNAN	(__INT_MAX)

#define	MATH_ERRNO	1
#define	MATH_ERREXCEPT	2
#define	math_errhandling (MATH_ERRNO)

#if defined(__TI_VFPLIB_SUPPORT__)
#if defined(__TI_FPV4SPD16_SUPPORT__)
#define	FP_FAST_FMAF	1
#else
#define	FP_FAST_FMA	1
#define	FP_FAST_FMAF	1
#define	FP_FAST_FMAL	1
#endif
#endif /* __TI_VFPLIB_SUPPORT__ */

/* Symbolic constants to classify floating point numbers. */
#define	FP_INFINITE	(__FP_INFINITE)
#define	FP_NAN		(__FP_NAN)
#define	FP_NORMAL	(__FP_NORMAL)
#define	FP_SUBNORMAL	(__FP_SUBNORMAL)
#define	FP_ZERO		(__FP_ZERO)

#if (__STDC_VERSION__ >= 199901L) && defined(__EDG_VERSION__)
#define	__fp_type_select(x, f, d, ld) __generic((x),,, d, f, ld,,,)(x)
#elif (__STDC_VERSION__ >= 201112L && defined(__clang__))
#define	__fp_type_select(x, f, d, ld) _Generic((x),			\
    float: f(x),							\
    double: d(x),							\
    long double: ld(x),							\
    volatile float: f(x),						\
    volatile double: d(x),						\
    volatile long double: ld(x),					\
    volatile const float: f(x),						\
    volatile const double: d(x),					\
    volatile const long double: ld(x),					\
    const float: f(x),							\
    const double: d(x),							\
    const long double: ld(x))
#else
#define	 __fp_type_select(x, f, d, ld)					\
    ((sizeof(x) == sizeof(float)) ? (f)(x)				\
    : (sizeof(x) == sizeof(double)) ? (d)(x)				\
    : (ld)(x))
#endif

#define	fpclassify(x) (__fp_type_select((x), __fpclassifyf, __fpclassify, __fpclassifyl))
#define	isfinite(x) (__fp_type_select((x), __isfinitef, __isfinite, __isfinitel))
#define	isinf(x) (__fp_type_select((x), __isinff, __isinf, __isinfl))
#define	isnan(x) (__fp_type_select((x), __isnanf, __isnan, __isnanl))
#define	isnormal(x) (__fp_type_select((x), __isnormalf, __isnormal, __isnormall))

#ifdef __MATH_BUILTIN_RELOPS
#define	isgreater(x, y)		__builtin_isgreater((x), (y))
#define	isgreaterequal(x, y)	__builtin_isgreaterequal((x), (y))
#define	isless(x, y)		__builtin_isless((x), (y))
#define	islessequal(x, y)	__builtin_islessequal((x), (y))
#define	islessgreater(x, y)	__builtin_islessgreater((x), (y))
#define	isunordered(x, y)	__builtin_isunordered((x), (y))
#else
#define	isgreater(x, y)		(!isunordered((x), (y)) && (x) > (y))
#define	isgreaterequal(x, y)	(!isunordered((x), (y)) && (x) >= (y))
#define	isless(x, y)		(!isunordered((x), (y)) && (x) < (y))
#define	islessequal(x, y)	(!isunordered((x), (y)) && (x) <= (y))
#define	islessgreater(x, y)	(!isunordered((x), (y)) && \
					((x) > (y) || (y) > (x)))
#define	isunordered(x, y)	(isnan(x) || isnan(y))
#endif /* __MATH_BUILTIN_RELOPS */

#define	signbit(x) (__fp_type_select((x), __signbitf, __signbit, __signbitl))

/*
 * XOPEN/SVID
 */
#ifdef __BSD_VISIBLE
#define	M_E		2.7182818284590452354	/* e */
#define	M_LOG2E		1.4426950408889634074	/* log 2e */
#define	M_LOG10E	0.43429448190325182765	/* log 10e */
#define	M_LN2		0.69314718055994530942	/* log e2 */
#define	M_LN10		2.30258509299404568402	/* log e10 */
#define	M_PI		3.14159265358979323846	/* pi */
#define	M_PI_2		1.57079632679489661923	/* pi/2 */
#define	M_PI_4		0.78539816339744830962	/* pi/4 */
#define	M_1_PI		0.31830988618379067154	/* 1/pi */
#define	M_2_PI		0.63661977236758134308	/* 2/pi */
#define	M_2_SQRTPI	1.12837916709551257390	/* 2/sqrt(pi) */
#define	M_SQRT2		1.41421356237309504880	/* sqrt(2) */
#define	M_SQRT1_2	0.70710678118654752440	/* 1/sqrt(2) */
#endif /* __BSD_VISIBLE */

#ifdef __cplusplus
extern "C" namespace std {
#endif

/*---------------------------------------------------------------------------*/
/* If --fp_mode=relaxed is used and VFP is enabled, use the hardware square  */
/* root directly instead of calling the sqrtx routine. This will not set     */
/* errno if the argument is negative.                                        */
/*                                                                           */
/* This is done by defining sqrt to _relaxed_sqrt to allow other translation */
/* units to use the normal sqrt routine under strict mode.                   */
/*---------------------------------------------------------------------------*/

#if defined(__TI_VFP_SUPPORT__)  && !__TI_STRICT_FP_MODE__
#pragma CHECK_MISRA("-19.4") /* macro defined to be an identifier is OK */
#pragma CHECK_MISRA("-8.1") /* function definition with no prototype visible */
#pragma CHECK_MISRA("-8.5") /* function definitions required */
#pragma CHECK_MISRA("-8.11") /* non-static function definition OK */

#pragma diag_suppress 1558 /* --float_operations_allowed checks */

#define sqrtf __relaxed_sqrtf
__inline float __relaxed_sqrtf(float x)
{
    return __sqrtf(x);
}

/*---------------------------------------------------------------------------*/
/* The FPv4SP supported on Cortex-M4 does not have double precision hardware */
/* so avoid using the intrinsic.                                             */
/*---------------------------------------------------------------------------*/
#if !defined(__TI_FPv4SPD16_SUPPORT__)
#define sqrt  __relaxed_sqrt
__inline double __relaxed_sqrt(double x)
{
    return __sqrt(x);
}

#define sqrtl __relaxed_sqrtl
__inline long double __relaxed_sqrtl(long double x)
{
    return __sqrt(x);
}
#endif /* !defined(__TI_FPv4SPD16_SUPPORT__) */
#endif /* defined(__TI_VFP_SUPPORT__)  && !__TI_STRICT_FP_MODE__ */

/*---------------------------------------------------------------------------*/
/* TMU SUPPORT AND RELAXED MODE: USE INSTRINSICS.                            */
/*---------------------------------------------------------------------------*/
#if defined(__TMS320C28XX_TMU__)  && !__TI_STRICT_FP_MODE__
#pragma CHECK_MISRA("-19.4") /* macro defined to be an identifier is OK */
#pragma CHECK_MISRA("-8.1") /* function definition with no prototype visible */
#pragma CHECK_MISRA("-8.5") /* function definitions required */
#pragma CHECK_MISRA("-8.11") /* non-static function definition OK */

#pragma diag_suppress 1558 /* --float_operations_allowed checks */

/* Float cases */
#define sqrtf  __relaxed_sqrtf
__inline float __relaxed_sqrtf(float x)
{
    return __sqrt(x);
}
#define sinf   __relaxed_sinf
__inline float __relaxed_sinf(float x)
{
    return __sin(x);
}
#define cosf   __relaxed_cosf
__inline float __relaxed_cosf(float x)
{
    return __cos(x);
}
#define atanf  __relaxed_atanf
__inline float __relaxed_atanf(float x)
{
  return __atan2(x, 1.0);
}
#define atan2f __relaxed_atan2f
__inline float __relaxed_atan2f(float y, float x)
{
  return __atan2(y,x);
}

/* Double cases */
#ifndef __TI_EABI__
#define sqrt  __relaxed_sqrt
__inline double __relaxed_sqrt(double x)
{
    return __sqrt(x);
}
#define sin   __relaxed_sin
__inline double __relaxed_sin(double x)
{
    return __sin(x);
}
#define cos   __relaxed_cos
__inline double __relaxed_cos(double x)
{
    return __cos(x);
}
#define atan  __relaxed_atan
__inline double __relaxed_atan(double x)
{
  return __atan2(x, 1.0);
}
#define atan2 __relaxed_atan2
__inline double __relaxed_atan2(double y, double x)
{
  return __atan2(y,x);
}
#endif
#endif /* defined(__TMS320C28XX_TMU__)  && !__TI_STRICT_FP_MODE__ */

/* Disable double_t and float_t for C28x because of Motorware (AY 2015) */
#ifndef __TMS320C28XX__
#define __TI_HAS_FLOAT_DBL_T 1
/* These typedefs depend on the value of FLT_EVAL_METHOD */
typedef	double	double_t;
typedef	float	float_t;
#endif

_CODE_ACCESS double      acos(double x);
_CODE_ACCESS float       acosf(float x);
_CODE_ACCESS long double acosl(long double x);
_CODE_ACCESS double      asin(double x);
_CODE_ACCESS float       asinf(float x);
_CODE_ACCESS long double asinl(long double x);
_CODE_ACCESS double      atan(double x);
_CODE_ACCESS float       atanf(float x);
_CODE_ACCESS long double atanl(long double x);
_CODE_ACCESS double      atan2(double y, double x);
_CODE_ACCESS float       atan2f(float y, float x);
_CODE_ACCESS long double atan2l(long double y, long double x);
_CODE_ACCESS double      cos(double x);
_CODE_ACCESS float       cosf(float x);
_CODE_ACCESS long double cosl(long double x);
_CODE_ACCESS double      sin(double x);
_CODE_ACCESS float       sinf(float x);
_CODE_ACCESS long double sinl(long double x);
_CODE_ACCESS double      tan(double x);
_CODE_ACCESS float       tanf(float x);
_CODE_ACCESS long double tanl(long double x);
_CODE_ACCESS double      acosh(double x);
_CODE_ACCESS float       acoshf(float x);
_CODE_ACCESS long double acoshl(long double x);
_CODE_ACCESS double      asinh(double x);
_CODE_ACCESS float       asinhf(float x);
_CODE_ACCESS long double asinhl(long double x);
_CODE_ACCESS double      atanh(double x);
_CODE_ACCESS float       atanhf(float x);
_CODE_ACCESS long double atanhl(long double x);
_CODE_ACCESS double      cosh(double x);
_CODE_ACCESS float       coshf(float x);
_CODE_ACCESS long double coshl(long double x);
_CODE_ACCESS double      sinh(double x);
_CODE_ACCESS float       sinhf(float x);
_CODE_ACCESS long double sinhl(long double x);
_CODE_ACCESS double      tanh(double x);
_CODE_ACCESS float       tanhf(float x);
_CODE_ACCESS long double tanhl(long double x);
_CODE_ACCESS double      exp(double x);
_CODE_ACCESS float       expf(float x);
_CODE_ACCESS long double expl(long double x);
_CODE_ACCESS double      exp2(double x);
_CODE_ACCESS float       exp2f(float x);
_CODE_ACCESS long double exp2l(long double x);
_CODE_ACCESS double      expm1(double x);
_CODE_ACCESS float       expm1f(float x);
_CODE_ACCESS long double expm1l(long double x);
_CODE_ACCESS double      frexp(double val, int *e);
_CODE_ACCESS float       frexpf(float val, int *e);
_CODE_ACCESS long double frexpl(long double val, int *e);
_CODE_ACCESS int         ilogb(double x);
_CODE_ACCESS int         ilogbf(float x);
_CODE_ACCESS int         ilogbl(long double x);
_CODE_ACCESS double      ldexp(double x, int e);
_CODE_ACCESS float       ldexpf(float x, int e);
_CODE_ACCESS long double ldexpl(long double x, int e);
_CODE_ACCESS double      log(double x);
_CODE_ACCESS float       logf(float x);
_CODE_ACCESS long double logl(long double x);
_CODE_ACCESS double      log10(double x);
_CODE_ACCESS float       log10f(float x);
_CODE_ACCESS long double log10l(long double x);
_CODE_ACCESS double      log1p(double x);
_CODE_ACCESS float       log1pf(float x);
_CODE_ACCESS long double log1pl(long double x);
_CODE_ACCESS double      log2(double x);
_CODE_ACCESS float       log2f(float x);
_CODE_ACCESS long double log2l(long double x);
_CODE_ACCESS double      logb(double x);
_CODE_ACCESS float       logbf(float x);
_CODE_ACCESS long double logbl(long double x);
_CODE_ACCESS double      modf(double val, double *iptr);
_CODE_ACCESS float       modff(float val, float *iptr);
_CODE_ACCESS long double modfl(long double val, long double *iptr);
_CODE_ACCESS double      scalbn(double x, int n);
_CODE_ACCESS float       scalbnf(float x, int n);
_CODE_ACCESS long double scalbnl(long double x, int n);
_CODE_ACCESS double      scalbln(double x, long n);
_CODE_ACCESS float       scalblnf(float x, long n);
_CODE_ACCESS long double scalblnl(long double x, long n);
_CODE_ACCESS double      cbrt(double x);
_CODE_ACCESS float       cbrtf(float x);
_CODE_ACCESS long double cbrtl(long double x);
_CODE_ACCESS double      fabs(double x);
_CODE_ACCESS float       fabsf(float x);
_CODE_ACCESS long double fabsl(long double x);
_CODE_ACCESS double      hypot(double x, double y);
_CODE_ACCESS float       hypotf(float x, float y);
_CODE_ACCESS long double hypotl(long double x, long double y);
_CODE_ACCESS double      pow(double x, double y);
_CODE_ACCESS float       powf(float x, float y);
_CODE_ACCESS long double powl(long double x, long double y);
_CODE_ACCESS double      sqrt(double x);
_CODE_ACCESS float       sqrtf(float x);
_CODE_ACCESS long double sqrtl(long double x);
_CODE_ACCESS double      erf(double x);
_CODE_ACCESS float       erff(float x);
_CODE_ACCESS long double erfl(long double x);
_CODE_ACCESS double      erfc(double x);
_CODE_ACCESS float       erfcf(float x);
_CODE_ACCESS long double erfcl(long double x);
_CODE_ACCESS double      lgamma(double x);
_CODE_ACCESS float       lgammaf(float x);
_CODE_ACCESS long double lgammal(long double x);
_CODE_ACCESS double      tgamma(double x);
_CODE_ACCESS float       tgammaf(float x);
_CODE_ACCESS long double tgammal(long double x);
_CODE_ACCESS double      ceil(double x);
_CODE_ACCESS float       ceilf(float x);
_CODE_ACCESS long double ceill(long double x);
_CODE_ACCESS double      floor(double x);
_CODE_ACCESS float       floorf(float x);
_CODE_ACCESS long double floorl(long double x);
_CODE_ACCESS double      nearbyint(double x);
_CODE_ACCESS float       nearbyintf(float x);
_CODE_ACCESS long double nearbyintl(long double x);
_CODE_ACCESS double      rint(double x);
_CODE_ACCESS float       rintf(float x);
_CODE_ACCESS long double rintl(long double x);
_CODE_ACCESS long        lrint(double x);
_CODE_ACCESS long        lrintf(float x);
_CODE_ACCESS long        lrintl(long double x);
_CODE_ACCESS long long   llrint(double x);
_CODE_ACCESS long long   llrintf(float x);
_CODE_ACCESS long long   llrintl(long double x);
_CODE_ACCESS double      round(double x);
_CODE_ACCESS float       roundf(float x);
_CODE_ACCESS long double roundl(long double x);
_CODE_ACCESS long        lround(double x);
_CODE_ACCESS long        lroundf(float x);
_CODE_ACCESS long        lroundl(long double x);
_CODE_ACCESS long long   llround(double x);
_CODE_ACCESS long long   llroundf(float x);
_CODE_ACCESS long long   llroundl(long double x);
_CODE_ACCESS double      trunc(double x);
_CODE_ACCESS float       truncf(float x);
_CODE_ACCESS long double truncl(long double x);
_CODE_ACCESS double      fmod(double x, double y);
_CODE_ACCESS float       fmodf(float x, float y);
_CODE_ACCESS long double fmodl(long double x, long double y);
_CODE_ACCESS double      remainder(double x, double y);
_CODE_ACCESS float       remainderf(float x, float y);
_CODE_ACCESS long double remainderl(long double x, long double y);
_CODE_ACCESS double      remquo(double x, double y, int *quo);
_CODE_ACCESS float       remquof(float x, float y, int *quo);
_CODE_ACCESS long double remquol(long double x, long double y, int *quo);
_CODE_ACCESS double      copysign(double x, double y);
_CODE_ACCESS float       copysignf(float x, float y);
_CODE_ACCESS long double copysignl(long double x, long double y);
_CODE_ACCESS double      nan(const char *tagp);
_CODE_ACCESS float       nanf(const char *tagp);
_CODE_ACCESS long double nanl(const char *tagp);
_CODE_ACCESS double      nextafter(double x, double y);
_CODE_ACCESS float       nextafterf(float x, float y);
_CODE_ACCESS long double nextafterl(long double x, long double y);
_CODE_ACCESS double      nexttoward(double x, long double y);
_CODE_ACCESS float       nexttowardf(float x, long double y);
_CODE_ACCESS long double nexttowardl(long double x, long double y);
_CODE_ACCESS double      fdim(double x, double y);
_CODE_ACCESS float       fdimf(float x, float y);
_CODE_ACCESS long double fdiml(long double x, long double y);
_CODE_ACCESS double      fmax(double x, double y);
_CODE_ACCESS float       fmaxf(float x, float y);
_CODE_ACCESS long double fmaxl(long double x, long double y);
_CODE_ACCESS double      fmin(double x, double y);
_CODE_ACCESS float       fminf(float x, float y);
_CODE_ACCESS long double fminl(long double x, long double y);
_CODE_ACCESS double      fma(double x, double y, double z);
_CODE_ACCESS float       fmaf(float x, float y, float z);
_CODE_ACCESS long double fmal(long double x, long double y, long double z);

#ifdef __cplusplus
    }
#endif

#pragma diag_pop

#endif /* !_MATH_H_ */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(__INCLUDED_FROM_CMATH)

using std::acos;
using std::acosf;
using std::acosl;
using std::asin;
using std::asinf;
using std::asinl;
using std::atan;
using std::atanf;
using std::atanl;
using std::atan2;
using std::atan2f;
using std::atan2l;
using std::cos;
using std::cosf;
using std::cosl;
using std::sin;
using std::sinf;
using std::sinl;
using std::tan;
using std::tanf;
using std::tanl;
using std::acosh;
using std::acoshf;
using std::acoshl;
using std::asinh;
using std::asinhf;
using std::asinhl;
using std::atanh;
using std::atanhf;
using std::atanhl;
using std::cosh;
using std::coshf;
using std::coshl;
using std::sinh;
using std::sinhf;
using std::sinhl;
using std::tanh;
using std::tanhf;
using std::tanhl;
using std::exp;
using std::expf;
using std::expl;
using std::exp2;
using std::exp2f;
using std::exp2l;
using std::expm1;
using std::expm1f;
using std::expm1l;
using std::frexp;
using std::frexpf;
using std::frexpl;
using std::ilogb;
using std::ilogbf;
using std::ilogbl;
using std::ldexp;
using std::ldexpf;
using std::ldexpl;
using std::log;
using std::logf;
using std::logl;
using std::log10;
using std::log10f;
using std::log10l;
using std::log1p;
using std::log1pf;
using std::log1pl;
using std::log2;
using std::log2f;
using std::log2l;
using std::logb;
using std::logbf;
using std::logbl;
using std::modf;
using std::modff;
using std::modfl;
using std::scalbn;
using std::scalbnf;
using std::scalbnl;
using std::scalbln;
using std::scalblnf;
using std::scalblnl;
using std::cbrt;
using std::cbrtf;
using std::cbrtl;
using std::fabs;
using std::fabsf;
using std::fabsl;
using std::hypot;
using std::hypotf;
using std::hypotl;
using std::pow;
using std::powf;
using std::powl;
using std::sqrt;
using std::sqrtf;
using std::sqrtl;
using std::erf;
using std::erff;
using std::erfl;
using std::erfc;
using std::erfcf;
using std::erfcl;
using std::lgamma;
using std::lgammaf;
using std::lgammal;
using std::tgamma;
using std::tgammaf;
using std::tgammal;
using std::ceil;
using std::ceilf;
using std::ceill;
using std::floor;
using std::floorf;
using std::floorl;
using std::nearbyint;
using std::nearbyintf;
using std::nearbyintl;
using std::rint;
using std::rintf;
using std::rintl;
using std::lrint;
using std::lrintf;
using std::lrintl;
using std::llrint;
using std::llrintf;
using std::llrintl;
using std::round;
using std::roundf;
using std::roundl;
using std::lround;
using std::lroundf;
using std::lroundl;
using std::llround;
using std::llroundf;
using std::llroundl;
using std::trunc;
using std::truncf;
using std::truncl;
using std::fmod;
using std::fmodf;
using std::fmodl;
using std::remainder;
using std::remainderf;
using std::remainderl;
using std::remquo;
using std::remquof;
using std::remquol;
using std::copysign;
using std::copysignf;
using std::copysignl;
using std::nan;
using std::nanf;
using std::nanl;
using std::nextafter;
using std::nextafterf;
using std::nextafterl;
using std::nexttoward;
using std::nexttowardf;
using std::nexttowardl;
using std::fdim;
using std::fdimf;
using std::fdiml;
using std::fmax;
using std::fmaxf;
using std::fmaxl;
using std::fmin;
using std::fminf;
using std::fminl;
using std::fma;
using std::fmaf;
using std::fmal;

#ifdef __TI_HAS_FLOAT_DBL_T
using std::float_t;
using std::double_t;
#endif

#if _AEABI_PORTABILITY_CHECK
using std::__aeabi_HUGE_VAL;
using std::__aeabi_HUGE_VALL;
using std::__aeabi_HUGE_VALF;
using std::__aeabi_INFINITY;
using std::__aeabi_NAN;
#endif

#endif /* defined(__INCLUDED_FROM_CMATH) */

#pragma diag_pop
