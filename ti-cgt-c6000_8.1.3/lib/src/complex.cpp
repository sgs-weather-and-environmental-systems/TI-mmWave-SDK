/******************************************************************************/
/* This file was taken from STLport <www.stlport.org> and modified by         */
/* Texas Instruments.                                                         */
/******************************************************************************/

/*
 * Copyright (c) 1999
 * Silicon Graphics Computer Systems, Inc.
 *
 * Copyright (c) 1999
 * Boris Fomitchev
 *
 * Copyright (c) 2014-2014 Texas Instruments Incorporated
 *
 * This material is provided "as is", with absolutely no warranty expressed
 * or implied. Any use is at your own risk.
 *
 * Permission to use or copy this software for any purpose is hereby granted
 * without fee, provided the above notices are retained on all copies.
 * Permission to modify the code and to distribute modified code is granted,
 * provided the above notices are retained, and a notice that the code was
 * modified is included with the above copyright notice.
 *
 */

#include "stlport_prefix.h"

#include <numeric>
#include <cmath>
#include <complex>

#if defined (_STLP_MSVC_LIB) && (_STLP_MSVC_LIB >= 1400)
// hypot is deprecated.
#  if defined (_STLP_MSVC)
#    pragma warning (disable : 4996)
#  endif
#endif

#ifdef __TI_STD_COMPLIANCE_FIX__
/******************************************************************************/
/* When including cmath, math operations should be declared in std:: and      */
/* not in ::.                                                                 */
/******************************************************************************/
#  define MATH_NS std
#else
#  define MATH_NS
#endif

_STLP_BEGIN_NAMESPACE

// Complex division and square roots.

// Absolute value
_STLP_TEMPLATE_NULL
_STLP_DECLSPEC float _STLP_CALL abs(const complex<float>& __z)
{ return MATH_NS::hypot(__z._M_re, __z._M_im); }
_STLP_TEMPLATE_NULL
_STLP_DECLSPEC double _STLP_CALL abs(const complex<double>& __z)
{ return MATH_NS::hypot(__z._M_re, __z._M_im); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_STLP_TEMPLATE_NULL
_STLP_DECLSPEC long double _STLP_CALL abs(const complex<long double>& __z)
{ return MATH_NS::hypot(__z._M_re, __z._M_im); }
#endif

// Phase

_STLP_TEMPLATE_NULL
_STLP_DECLSPEC float _STLP_CALL arg(const complex<float>& __z)
{ return MATH_NS::atan2(__z._M_im, __z._M_re); }

_STLP_TEMPLATE_NULL
_STLP_DECLSPEC double _STLP_CALL arg(const complex<double>& __z)
{ return MATH_NS::atan2(__z._M_im, __z._M_re); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_STLP_TEMPLATE_NULL
_STLP_DECLSPEC long double _STLP_CALL arg(const complex<long double>& __z)
{ return MATH_NS::atan2(__z._M_im, __z._M_re); }
#endif

// Construct a complex number from polar representation
_STLP_TEMPLATE_NULL
_STLP_DECLSPEC complex<float> _STLP_CALL polar(const float& __rho, const float& __phi)
{ return complex<float>(__rho * MATH_NS::cos(__phi), __rho * MATH_NS::sin(__phi)); }
_STLP_TEMPLATE_NULL
_STLP_DECLSPEC complex<double> _STLP_CALL polar(const double& __rho, const double& __phi)
{ return complex<double>(__rho * MATH_NS::cos(__phi), __rho * MATH_NS::sin(__phi)); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_STLP_TEMPLATE_NULL
_STLP_DECLSPEC complex<long double> _STLP_CALL polar(const long double& __rho, const long double& __phi)
{ return complex<long double>(__rho * MATH_NS::cos(__phi), __rho * MATH_NS::sin(__phi)); }
#endif

// Division
template <class _Tp>
static void _divT(const _Tp& __z1_r, const _Tp& __z1_i,
                  const _Tp& __z2_r, const _Tp& __z2_i,
                  _Tp& __res_r, _Tp& __res_i) {
  _Tp __ar = __z2_r >= 0 ? __z2_r : -__z2_r;
  _Tp __ai = __z2_i >= 0 ? __z2_i : -__z2_i;

  if (__ar <= __ai) {
    _Tp __ratio = __z2_r / __z2_i;
    _Tp __denom = __z2_i * (1 + __ratio * __ratio);
    __res_r = (__z1_r * __ratio + __z1_i) / __denom;
    __res_i = (__z1_i * __ratio - __z1_r) / __denom;
  }
  else {
    _Tp __ratio = __z2_i / __z2_r;
    _Tp __denom = __z2_r * (1 + __ratio * __ratio);
    __res_r = (__z1_r + __z1_i * __ratio) / __denom;
    __res_i = (__z1_i - __z1_r * __ratio) / __denom;
  }
}

template <class _Tp>
static void _divT(const _Tp& __z1_r,
                  const _Tp& __z2_r, const _Tp& __z2_i,
                  _Tp& __res_r, _Tp& __res_i) {
  _Tp __ar = __z2_r >= 0 ? __z2_r : -__z2_r;
  _Tp __ai = __z2_i >= 0 ? __z2_i : -__z2_i;

  if (__ar <= __ai) {
    _Tp __ratio = __z2_r / __z2_i;
    _Tp __denom = __z2_i * (1 + __ratio * __ratio);
    __res_r = (__z1_r * __ratio) / __denom;
    __res_i = - __z1_r / __denom;
  }
  else {
    _Tp __ratio = __z2_i / __z2_r;
    _Tp __denom = __z2_r * (1 + __ratio * __ratio);
    __res_r = __z1_r / __denom;
    __res_i = - (__z1_r * __ratio) / __denom;
  }
}

void _STLP_CALL
complex<float>::_div(const float& __z1_r, const float& __z1_i,
                     const float& __z2_r, const float& __z2_i,
                     float& __res_r, float& __res_i)
{ _divT(__z1_r, __z1_i, __z2_r, __z2_i, __res_r, __res_i); }

void _STLP_CALL
complex<float>::_div(const float& __z1_r,
                     const float& __z2_r, const float& __z2_i,
                     float& __res_r, float& __res_i)
{ _divT(__z1_r, __z2_r, __z2_i, __res_r, __res_i); }


void  _STLP_CALL
complex<double>::_div(const double& __z1_r, const double& __z1_i,
                      const double& __z2_r, const double& __z2_i,
                      double& __res_r, double& __res_i)
{ _divT(__z1_r, __z1_i, __z2_r, __z2_i, __res_r, __res_i); }

void _STLP_CALL
complex<double>::_div(const double& __z1_r,
                      const double& __z2_r, const double& __z2_i,
                      double& __res_r, double& __res_i)
{ _divT(__z1_r, __z2_r, __z2_i, __res_r, __res_i); }

#if !defined (_STLP_NO_LONG_DOUBLE)
void  _STLP_CALL
complex<long double>::_div(const long double& __z1_r, const long double& __z1_i,
                           const long double& __z2_r, const long double& __z2_i,
                           long double& __res_r, long double& __res_i)
{ _divT(__z1_r, __z1_i, __z2_r, __z2_i, __res_r, __res_i); }

void _STLP_CALL
complex<long double>::_div(const long double& __z1_r,
                           const long double& __z2_r, const long double& __z2_i,
                           long double& __res_r, long double& __res_i)
{ _divT(__z1_r, __z2_r, __z2_i, __res_r, __res_i); }
#endif

//----------------------------------------------------------------------
// Square root
template <class _Tp>
static complex<_Tp> sqrtT(const complex<_Tp>& z) {
  _Tp re = z._M_re;
  _Tp im = z._M_im;
  _Tp mag = MATH_NS::hypot(re, im);
  complex<_Tp> result;

  if (mag == 0.f) {
    result._M_re = result._M_im = 0.f;
  } else if (re > 0.f) {
    result._M_re = MATH_NS::sqrt(0.5f * (mag + re));
    result._M_im = im/result._M_re/2.f;
  } else {
    result._M_im = MATH_NS::sqrt(0.5f * (mag - re));
    if (im < 0.f)
      result._M_im = - result._M_im;
    result._M_re = im/result._M_im/2.f;
  }
  return result;
}

_SPECIALIZATION_PREFIX
complex<float> _STLP_CALL
sqrt(const complex<float>& z) { return sqrtT(z); }

_SPECIALIZATION_PREFIX
complex<double>  _STLP_CALL
sqrt(const complex<double>& z) { return sqrtT(z); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_SPECIALIZATION_PREFIX
complex<long double> _STLP_CALL
sqrt(const complex<long double>& z) { return sqrtT(z); }
#endif

// exp, log, pow for complex<float>, complex<double>, and complex<long double>
//----------------------------------------------------------------------
// exp
template <class _Tp>
static complex<_Tp> expT(const complex<_Tp>& z) {
  _Tp expx = MATH_NS::exp(z._M_re);
  return complex<_Tp>(expx * MATH_NS::cos(z._M_im),
                      expx * MATH_NS::sin(z._M_im));
}
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float>  _STLP_CALL exp(const complex<float>& z)
{ return expT(z); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL exp(const complex<double>& z)
{ return expT(z); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL exp(const complex<long double>& z)
{ return expT(z); }
#endif

//----------------------------------------------------------------------
// log10
template <class _Tp>
static complex<_Tp> log10T(const complex<_Tp>& z, const _Tp& ln10_inv) {
  complex<_Tp> r;

  r._M_im = MATH_NS::atan2(z._M_im, z._M_re) * ln10_inv;
  r._M_re = MATH_NS::log10(MATH_NS::hypot(z._M_re, z._M_im));
  return r;
}

static const float LN10_INVF = 1.f / MATH_NS::log(10.f);
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL log10(const complex<float>& z)
{ return log10T(z, LN10_INVF); }

#if defined(__TI_STD_COMPLIANCE_FIX__)
static const double LN10_INV = 1. / MATH_NS::log(10.);
#else
static const double LN10_INV = 1. / MATH_NS::log10(10.);
#endif
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL log10(const complex<double>& z)
{ return log10T(z, LN10_INV); }

#if !defined (_STLP_NO_LONG_DOUBLE)
static const long double LN10_INVL = 1.l / MATH_NS::log(10.l);
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL log10(const complex<long double>& z)
{ return log10T(z, LN10_INVL); }
#endif

//----------------------------------------------------------------------
// log
template <class _Tp>
static complex<_Tp> logT(const complex<_Tp>& z) {
  complex<_Tp> r;

  r._M_im = MATH_NS::atan2(z._M_im, z._M_re);
  r._M_re = MATH_NS::log(MATH_NS::hypot(z._M_re, z._M_im));
  return r;
}
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL log(const complex<float>& z)
{ return logT(z); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL log(const complex<double>& z)
{ return logT(z); }

#ifndef _STLP_NO_LONG_DOUBLE
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL log(const complex<long double>& z)
{ return logT(z); }
# endif

//----------------------------------------------------------------------
// pow
template <class _Tp>
static complex<_Tp> powT(const _Tp& a, const complex<_Tp>& b) {
  _Tp logr = MATH_NS::log(a);
  _Tp x = MATH_NS::exp(logr * b._M_re);
  _Tp y = logr * b._M_im;

  return complex<_Tp>(x * MATH_NS::cos(y), x * MATH_NS::sin(y));
}

template <class _Tp>
static complex<_Tp> powT(const complex<_Tp>& z_in, int n) {
  complex<_Tp> z = z_in;
  z = _STLP_PRIV __power(z, (n < 0 ? -n : n), multiplies< complex<_Tp> >());
  if (n < 0)
    return _Tp(1.0) / z;
  else
    return z;
}

template <class _Tp>
static complex<_Tp> powT(const complex<_Tp>& a, const _Tp& b) {
  _Tp logr = MATH_NS::log(MATH_NS::hypot(a._M_re,a._M_im));
  _Tp logi = MATH_NS::atan2(a._M_im, a._M_re);
  _Tp x = MATH_NS::exp(logr * b);
  _Tp y = logi * b;

  return complex<_Tp>(x * MATH_NS::cos(y), x * MATH_NS::sin(y));
}

template <class _Tp>
static complex<_Tp> powT(const complex<_Tp>& a, const complex<_Tp>& b) {
  _Tp logr = MATH_NS::log(MATH_NS::hypot(a._M_re,a._M_im));
  _Tp logi = MATH_NS::atan2(a._M_im, a._M_re);
  _Tp x = MATH_NS::exp(logr * b._M_re - logi * b._M_im);
  _Tp y = logr * b._M_im + logi * b._M_re;

  return complex<_Tp>(x * MATH_NS::cos(y), x * MATH_NS::sin(y));
}

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL pow(const float& a, const complex<float>& b)
{ return powT(a, b); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL pow(const complex<float>& z_in, int n)
{ return powT(z_in, n); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL pow(const complex<float>& a, const float& b)
{ return powT(a, b); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL pow(const complex<float>& a, const complex<float>& b)
{ return powT(a, b); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL pow(const double& a, const complex<double>& b)
{ return powT(a, b); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL pow(const complex<double>& z_in, int n)
{ return powT(z_in, n); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL pow(const complex<double>& a, const double& b)
{ return powT(a, b); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL pow(const complex<double>& a, const complex<double>& b)
{ return powT(a, b); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL pow(const long double& a,
                                                   const complex<long double>& b)
{ return powT(a, b); }


_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL pow(const complex<long double>& z_in, int n)
{ return powT(z_in, n); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL pow(const complex<long double>& a,
                                                   const long double& b)
{ return powT(a, b); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL pow(const complex<long double>& a,
                                                   const complex<long double>& b)
{ return powT(a, b); }
#endif

_STLP_END_NAMESPACE
