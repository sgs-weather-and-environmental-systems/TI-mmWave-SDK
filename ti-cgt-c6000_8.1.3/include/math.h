/****************************************************************************/
/*  math.h           v8.1.3                                                 */
/*                                                                          */
/* Copyright (c) 1997-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/

#ifndef __math__
#define __math__

#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-19.1") /* #includes required for implementation */
#pragma CHECK_MISRA("-19.7") /* macros required for implementation */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */

#ifndef EDOM
#if defined(__TMS320C6X__) && defined(__TI_EABI__)
#define EDOM  33 
#else
#define EDOM   1
#endif
#endif

#ifndef ERANGE
#if defined(__TMS320C6X__) && defined(__TI_EABI__)
#define ERANGE 34
#else
#define ERANGE 2
#endif
#endif

#define HUGE_VALF (__INFINITY__)
#define HUGE_VAL  ((double)__INFINITY__)
#define HUGE_VALL ((long double)__INFINITY__)
#define NAN (__NAN__)
#define INFINITY (__INFINITY__)

#define	MATH_ERRNO	1
#define	MATH_ERREXCEPT	2
#define	math_errhandling (MATH_ERRNO)

#include <linkage.h>
#include <elfnames.h>

/****************************************************************************/
/* TYPE GENERIC MACROS                                                      */
/****************************************************************************/
#define _TG_CALL(i, f, d, l) \
        ( \
            sizeof(i) == sizeof(double) ? \
                (d)(i) \
              : sizeof(i) == sizeof(float) ? \
                    (f)(i) \
                  : (l)(i) \
        )

#ifdef __cplusplus
//----------------------------------------------------------------------------
// <cmath> IS RECOMMENDED OVER <math.h>.  <math.h> IS PROVIDED FOR 
// COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++
//----------------------------------------------------------------------------
extern "C" namespace std {
#endif

_CODE_ACCESS double sqrt (double x);
_CODE_ACCESS double exp  (double x);
_CODE_ACCESS double log  (double x);
_CODE_ACCESS double log10(double x);
_CODE_ACCESS double pow  (double x, double y);
_CODE_ACCESS double sin  (double x);
_CODE_ACCESS double cos  (double x);
_CODE_ACCESS double tan  (double x);
_CODE_ACCESS double asin (double x);
_CODE_ACCESS double acos (double x);
_CODE_ACCESS double atan (double x);
_CODE_ACCESS double atan2(double y, double x);
_CODE_ACCESS double sinh (double x);
_CODE_ACCESS double cosh (double x);
_CODE_ACCESS double tanh (double x);

_IDECL double ceil (double x);
_IDECL double floor(double x);

#pragma diag_push
#pragma CHECK_MISRA("-16.4") /* false positives due to builtin declarations */
_CODE_ACCESS double fabs (double x);
#pragma diag_pop

_CODE_ACCESS double ldexp(double x, int n);
_CODE_ACCESS double frexp(double x, int *_exp);
_CODE_ACCESS double modf (double x, double *ip);
_CODE_ACCESS double fmod (double x, double y);

#if defined (__cplusplus)
#define _STD_NS std::
#else
#define _STD_NS
#endif
_CODE_ACCESS double log1p(double x);
_CODE_ACCESS double hypot(double x, double y);
_CODE_ACCESS double copysign(double x, double y);

_CODE_ACCESS int _signbitf(float x);
_CODE_ACCESS int _signbit(double x);
_CODE_ACCESS int _signbitl(long double x);
#define signbit(x) (_TG_CALL((x), _STD_NS _signbitf, \
                                  _STD_NS _signbit, \
                                  _STD_NS _signbitl))

/* An inline version of fmod that works for limited domain only */
/* See comments in implementation below */
_IDECL double _FMOD(double x, double y);

/* these present in many linked images, so we'll tell you about them. */
_CODE_ACCESS double _nround(double x); /* round-to-nearest */
_CODE_ACCESS double _trunc(double x); /* truncate towards 0 */

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */

/* the ANSI-optional *f and *l routines */
#include <mathf.h>
#include <mathl.h>

#include <linkage.h>

#ifdef __cplusplus
extern "C" namespace std {
#endif

/* ------------------------------------------------- */
/* Routines below are an addition to ANSI math.h     */
/* Some (noted with "9x" in comment) will become ANSI*/
/* once C9x is approved.                             */
/* ------------------------------------------------- */

_CODE_ACCESS double rsqrt(double x); /*   == 1/sqrt(x) but *MUCH* faster         */
_CODE_ACCESS double exp2 (double x); /*9x mathematically equiv to pow(2.0 ,x)    */
_CODE_ACCESS double exp10(double x); /*   mathematically equiv to pow(10.0,x)    */
_CODE_ACCESS double log2 (double x); /*9x mathematically equiv to log(x)/log(2.0)*/

_CODE_ACCESS double powi(double x, int i); /* equiv to pow(x,(double)i) */

_CODE_ACCESS double cot  (double x);
_CODE_ACCESS double acot (double x);
_CODE_ACCESS double acot2(double x, double y);

_CODE_ACCESS double coth (double x);

_CODE_ACCESS double asinh(double x); /* 9x */
_CODE_ACCESS double acosh(double x); /* 9x */
_CODE_ACCESS double atanh(double x); /* 9x */
_CODE_ACCESS double acoth(double x);

#ifndef __INLINE_ISINF__
#define __INLINE_ISINF__ 0
#endif

#if __INLINE_ISINF__
_IDECL int __isinf(double x);
#else
_CODE_ACCESS int __isinf(double x);
#endif

_IDECL int __isnan(volatile double x);
_IDECL int __isfinite(double x);
_IDECL int __isnormal(double x);
_CODE_ACCESS int __fpclassify(double x);

#define isinf(x) (sizeof(x) == sizeof(double) ? __isinf(x) : \
                  sizeof(x) == sizeof(float) ? __isinff(x) : __isinfl(x))

#define isnan(x) (sizeof(x) == sizeof(double) ? __isnan(x) : \
                  sizeof(x) == sizeof(float) ? __isnanf(x) : __isnanl(x))

#define isfinite(x) (sizeof(x) == sizeof(double) ? __isfinite(x) : \
                     sizeof(x) == sizeof(float) ? __isfinitef(x) : \
                     __isfinitel(x))

#define isnormal(x) (sizeof(x) == sizeof(double) ? __isnormal(x) : \
                     sizeof(x) == sizeof(float) ? __isnormalf(x) : \
                     __isnormall(x))

#define fpclassify(x) (sizeof(x) == sizeof(double) ? __fpclassify(x) : \
                       sizeof(x) == sizeof(float) ? __fpclassifyf(x) : \
                       __fpclassifyl(x))

#pragma diag_push

/* keep macros as direct #defines and not function-like macros or function
   names surrounded by parentheses to support all original supported use cases
   including taking their address through the macros and prefixing with
   namespace macros */
#pragma CHECK_MISRA("-19.4")

#define round _nround /* 9x round-to-nearest   */
#define trunc _trunc /* 9x truncate towards 0 */

#pragma diag_pop

/*Definitions of classification macros used in fp_classify 
  We do not support subnormal numbers yet, but the classification exists for
  when they are supported */

#define FP_INFINITE  1
#define FP_NAN       2
#define FP_NORMAL    3
#define FP_ZERO      4
#define FP_SUBNORMAL 5

#ifdef __cplusplus
} /* extern "C" namespace std */

#endif /* __cplusplus */


#ifdef _INLINE

#pragma diag_push /* functions */

/* MISRA exceptions to avoid changing inline versions of the functions that
   would be linked in instead of included inline at different mf levels */
/* these functions are very well-tested, stable, and efficient; it would
   introduce a high risk to implement new, separate MISRA versions just for the
   inline headers */

#pragma CHECK_MISRA("-5.7") /* keep names intact */
#pragma CHECK_MISRA("-8.5") /* need to define inline functions */
#pragma CHECK_MISRA("-9.1") /* false positives on use after indirect assign */
#pragma CHECK_MISRA("-10.1") /* use implicit casts */
#pragma CHECK_MISRA("-10.2") /* use implicit casts */
#pragma CHECK_MISRA("-12.1") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.2") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.4") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.5") /* avoid changing expressions */
#pragma CHECK_MISRA("-13.3") /* need FP compares */
#pragma CHECK_MISRA("-14.7") /* use multiple return points */
#pragma CHECK_MISRA("-14.9") /* use non-compound statements */

#pragma diag_suppress 551 /* false positives on use after indirect assign */

/****************************************************************************/
/*  Inline versions of floor, ceil, fmod                                    */
/****************************************************************************/

#ifdef __cplusplus
namespace std {
#endif

static __inline double floor(double x) 
{
   double y; 
   return (modf(x, &y) < 0 ? y - 1 : y);
}

static __inline double ceil(double x)
{
   double y; 
   return (modf(x, &y) > 0 ? y + 1 : y);
}

/* 
   The implementation below does not work correctly for all cases.
   Consider the case of fmod(Big, 3), for any Big > 2**(MANT_DIG+2).
   The correct result is one of 0,1, or 2.
   But the implementation below will *always* return 0 
   because the quotient is only an approximation.
*/
static __inline double _FMOD(double x, double y)
{
   double d = fabs(x); 
   if (d - fabs(y) == d) return (0);
   modf(x/y, &d);  
   return (x - d * y);
}

#if __INLINE_ISINF__
#ifndef REAL_TO_REALNUM
#error isinf can only be inlined in the compilation of the rts
#endif

static __inline int __isinf(double x)
{
  realnum _x;
  REAL_TO_REALNUM(x, _x);
  return _x.exp == (REAL_EMAX + 1) && (_x.mantissa << 1) == 0;
}

#endif /* __INLINE_ISINF___ */

#pragma diag_suppress 681
static __inline int __isnan(volatile double x)
{
  return x != x;
}
#pragma diag_default 681

static __inline int __isfinite(double x)
{
  return (!__isinf(x) && !__isnan(x));
}

static __inline int __isnormal(double x)
{
  return (__isfinite(x) && x != 0.0);
}

#ifdef __cplusplus
} /* namespace std */
#endif /* __cplusplus */

#pragma diag_pop

#endif /* _INLINE */

/*******************************************************************************/
/* CQ35082 : Overloaded version of math functions for float and long double    */
/*           removed from here, and include in cmath instead (see Section 26.5 */
/*           of C++ standard for details). Thus cpp_inline_math.h is now       */
/*           included in cmath .                                               */
/*******************************************************************************/

#pragma diag_pop

#endif /* __math__ */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::sqrt; 
using std::exp; 
using std::log; 
using std::log10; 
using std::pow; 
using std::sin; 
using std::cos; 
using std::tan; 
using std::asin; 
using std::acos;
using std::atan;
using std::atan2;
using std::sinh;
using std::cosh;
using std::tanh;
using std::ceil;
using std::floor;
using std::fabs;
using std::ldexp;
using std::frexp;
using std::modf;
using std::fmod;
using std::hypot;
using std::log1p;
using std::copysign;

using std::rsqrt;
using std::exp2;
using std::exp10;
using std::log2;
using std::powi;
using std::cot;
using std::acot;
using std::acot2;
using std::coth;
using std::asinh;
using std::acosh;
using std::atanh;
using std::acoth;

#endif /* _CPP_STYLE_HEADER */

#if defined(__cplusplus)
using std::__isnan;
using std::__isinf;
using std::__isfinite;
using std::__isnormal;
using std::__fpclassify;
using std::_nround; /* round-to-nearest */
using std::_trunc;
#endif /* __cplusplus */

#pragma diag_pop
