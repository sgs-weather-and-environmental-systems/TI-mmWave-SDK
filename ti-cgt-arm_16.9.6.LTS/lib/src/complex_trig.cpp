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


// Trigonometric and hyperbolic functions for complex<float>,
// complex<double>, and complex<long double>
#include <complex>
#include <cfloat>
#include <cmath>

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


//----------------------------------------------------------------------
// helpers
#  if defined (M_LN2) && defined (FLT_MAX_EXP)
  static const float float_limit = float(M_LN2 * FLT_MAX_EXP);
  static const double double_limit = M_LN2 * DBL_MAX_EXP;
#  else
  static const float float_limit = MATH_NS::log(FLT_MAX);
  static const double double_limit = MATH_NS::log(DBL_MAX);
#  endif
#  if !defined (_STLP_NO_LONG_DOUBLE)
#    if defined (M_LN2l)
  static const long double ldouble_limit = M_LN2l * LDBL_MAX_EXP;
#    else
  static const long double ldouble_limit = MATH_NS::log(LDBL_MAX);
#    endif
#  endif


//----------------------------------------------------------------------
// sin
template <class _Tp>
static complex<_Tp> sinT(const complex<_Tp>& z) {
  return complex<_Tp>(MATH_NS::sin(z._M_re) * MATH_NS::cosh(z._M_im),
                      MATH_NS::cos(z._M_re) * MATH_NS::sinh(z._M_im));
}

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL sin(const complex<float>& z)
{ return sinT(z); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL sin(const complex<double>& z)
{ return sinT(z); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL sin(const complex<long double>& z)
{ return sinT(z); }
#endif

//----------------------------------------------------------------------
// cos
template <class _Tp>
static complex<_Tp> cosT(const complex<_Tp>& z) {
  return complex<_Tp>(MATH_NS::cos(z._M_re) * MATH_NS::cosh(z._M_im),
                     -MATH_NS::sin(z._M_re) * MATH_NS::sinh(z._M_im));
}

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL cos(const complex<float>& z)
{ return cosT(z); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL cos(const complex<double>& z)
{ return cosT(z); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL cos(const complex<long double>& z)
{ return cosT(z); }
#endif

//----------------------------------------------------------------------
// tan
template <class _Tp>
static complex<_Tp> tanT(const complex<_Tp>& z, const _Tp& Tp_limit) {
  _Tp re2 = 2.f * z._M_re;
  _Tp im2 = 2.f * z._M_im;

  if (MATH_NS::abs(im2) > Tp_limit)
    return complex<_Tp>(0.f, (im2 > 0 ? 1.f : -1.f));
  else {
    _Tp den = MATH_NS::cos(re2) + MATH_NS::cosh(im2);
    return complex<_Tp>(MATH_NS::sin(re2) / den, MATH_NS::sinh(im2) / den);
  }
}

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL tan(const complex<float>& z)
{ return tanT(z, float_limit); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL tan(const complex<double>& z)
{ return tanT(z, double_limit); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL tan(const complex<long double>& z)
{ return tanT(z, ldouble_limit); }
#endif

//----------------------------------------------------------------------
// sinh
template <class _Tp>
static complex<_Tp> sinhT(const complex<_Tp>& z) {
  return complex<_Tp>(MATH_NS::sinh(z._M_re) * MATH_NS::cos(z._M_im),
                      MATH_NS::cosh(z._M_re) * MATH_NS::sin(z._M_im));
}

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL sinh(const complex<float>& z)
{ return sinhT(z); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL sinh(const complex<double>& z)
{ return sinhT(z); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL sinh(const complex<long double>& z)
{ return sinhT(z); }
#endif

//----------------------------------------------------------------------
// cosh
template <class _Tp>
static complex<_Tp> coshT(const complex<_Tp>& z) {
  return complex<_Tp>(MATH_NS::cosh(z._M_re) * MATH_NS::cos(z._M_im),
                      MATH_NS::sinh(z._M_re) * MATH_NS::sin(z._M_im));
}

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL cosh(const complex<float>& z)
{ return coshT(z); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL cosh(const complex<double>& z)
{ return coshT(z); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL cosh(const complex<long double>& z)
{ return coshT(z); }
#endif

//----------------------------------------------------------------------
// tanh
template <class _Tp>
static complex<_Tp> tanhT(const complex<_Tp>& z, const _Tp& Tp_limit) {
  _Tp re2 = 2.f * z._M_re;
  _Tp im2 = 2.f * z._M_im;
  if (MATH_NS::abs(re2) > Tp_limit)
    return complex<_Tp>((re2 > 0 ? 1.f : -1.f), 0.f);
  else {
    _Tp den = MATH_NS::cosh(re2) + MATH_NS::cos(im2);
    return complex<_Tp>(MATH_NS::sinh(re2) / den, MATH_NS::sin(im2) / den);
  }
}

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<float> _STLP_CALL tanh(const complex<float>& z)
{ return tanhT(z, float_limit); }

_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<double> _STLP_CALL tanh(const complex<double>& z)
{ return tanhT(z, double_limit); }

#if !defined (_STLP_NO_LONG_DOUBLE)
_SPECIALIZATION_PREFIX
_STLP_DECLSPEC complex<long double> _STLP_CALL tanh(const complex<long double>& z)
{ return tanhT(z, ldouble_limit); }
#endif

_STLP_END_NAMESPACE
