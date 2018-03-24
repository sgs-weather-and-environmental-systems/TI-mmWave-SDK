/******************************************************************************/
/* This file was taken from STLport <www.stlport.org> and modified by         */
/* Texas Instruments.                                                         */
/******************************************************************************/

/*
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

#ifndef _STLP_INTERNAL_CMATH
#define _STLP_INTERNAL_CMATH

/* gcc do not like when a using directive appear after a function
 * declaration. cmath have abs overloads and cstdlib a using directive
 * so cstdlib has to be included first.
 */

#if defined (_STLP_USE_NEW_C_HEADERS)
#  if defined (_STLP_HAS_NO_NAMESPACES) && !defined (exception)
#    define exception __math_exception
#  endif
#  if defined (_STLP_HAS_INCLUDE_NEXT)
#    include_next <cmath>
#  else
#    include _STLP_NATIVE_CPP_C_HEADER(cmath)
#  endif
#  if defined (_STLP_HAS_NO_NAMESPACES)
#    undef exception
#  endif
#else
#  define __INCLUDED_FROM_CMATH
#  include <math.h>
#  undef  __INCLUDED_FROM_CMATH
#endif




#  define _STLP_CMATH_FUNC_NAMESPACE

#  define _STLP_MATH_INLINE(float_type, func, cfunc) \
     inline float_type func (float_type x) { return _STLP_CMATH_FUNC_NAMESPACE::cfunc(x); }
#  define _STLP_MATH_INLINE2(float_type, type, func, cfunc) \
     inline float_type func (float_type x, type y) { return _STLP_CMATH_FUNC_NAMESPACE::cfunc(x, y); }
#  define _STLP_MATH_INLINE_D(float_type, func, cfunc)
#  define _STLP_MATH_INLINE2_D(float_type, type, func, cfunc)

/** macros to define math functions
These macros (having an X somewhere in the name) forward to the C library's
double functions but cast the arguments and return values to the given type. */

#define _STLP_MATH_INLINEX(__type,func,cfunc) \
  inline __type func (__type x) \
  { return __STATIC_CAST(__type, _STLP_CMATH_FUNC_NAMESPACE::cfunc((double)x)); }
#define _STLP_MATH_INLINE2X(__type1,__type2,func,cfunc) \
  inline __type1 func (__type1 x, __type2 y) \
  { return __STATIC_CAST(__type1, _STLP_CMATH_FUNC_NAMESPACE::cfunc((double)x, y)); }
#define _STLP_MATH_INLINE2PX(__type,func,cfunc) \
  inline __type func (__type x, __type *y) { \
    double tmp1, tmp2; \
    tmp1 = _STLP_CMATH_FUNC_NAMESPACE::cfunc(__STATIC_CAST(double, x), &tmp2); \
    *y = __STATIC_CAST(__type, tmp2); \
    return __STATIC_CAST(__type, tmp1); \
  }
#define _STLP_MATH_INLINE2XX(__type,func,cfunc) \
  inline __type func (__type x, __type y) \
  { return __STATIC_CAST(__type, _STLP_CMATH_FUNC_NAMESPACE::cfunc((double)x, (double)y)); }


/** rough characterization of compiler and native C library
For the compiler, it can either support long double or not. If it doesn't, the
macro _STLP_NO_LONG_DOUBLE is not defined and we don't define any long double
overloads.
For the native C library the question is whether it has variants with an 'f'
suffix (for float as opposed to double) or an 'l' suffix (for long double). If
the float variants are missing, _STLP_NO_VENDOR_MATH_F is defined, when the
long double variants are missing, _STLP_NO_VENDOR_MATH_L is defined. Of course
the latter doesn't make sense anyway when the compiler already has no long
double support.

Those two traits determine a) which overloads get defined and b) how they are
defined.

Meaning of suffixes:
""   : function returning and taking a float_type
"2"  : function returning a float_type and taking to float_types
"2P" : function returning a float_type and taking a float_type and a float_type*
"2PI": function returning a float_type and taking a float_type and an int*
"2I" : function returning a float_type and taking a float_Type and an int
*/

#if !defined (_STLP_NO_LONG_DOUBLE) && !defined (_STLP_NO_VENDOR_MATH_L) && !defined (_STLP_NO_VENDOR_MATH_F)
   // long double support and both e.g. sinl(long double) and sinf(float)
   // This is the default for a correct and complete native library.
#  define _STLP_DEF_MATH_INLINE(func,cf) \
  _STLP_MATH_INLINE(float,func,cf##f) \
  _STLP_MATH_INLINE_D(double,func,cf) \
  _STLP_MATH_INLINE(long double,func,cf##l)
#  define _STLP_DEF_MATH_INLINE2(func,cf) \
  _STLP_MATH_INLINE2(float,float,func,cf##f) \
  _STLP_MATH_INLINE2_D(double,double,func,cf) \
  _STLP_MATH_INLINE2(long double,long double,func,cf##l)
#  define _STLP_DEF_MATH_INLINE2P(func,cf) \
  _STLP_MATH_INLINE2(float,float *,func,cf##f) \
  _STLP_MATH_INLINE2_D(double,double *,func,cf) \
  _STLP_MATH_INLINE2(long double,long double *,func,cf##l)
#  define _STLP_DEF_MATH_INLINE2PI(func,cf) \
  _STLP_MATH_INLINE2(float,int *,func,cf##f) \
  _STLP_MATH_INLINE2_D(double,int *,func,cf) \
  _STLP_MATH_INLINE2(long double,int *,func,cf##l)
#  define _STLP_DEF_MATH_INLINE2I(func,cf) \
  _STLP_MATH_INLINE2(float,int,func,cf##f) \
  _STLP_MATH_INLINE2_D(double,int,func,cf) \
  _STLP_MATH_INLINE2(long double,int,func,cf##l)
#else
#  if !defined (_STLP_NO_LONG_DOUBLE)
#    if !defined (_STLP_NO_VENDOR_MATH_F)
       // long double support and e.g. sinf(float) but not e.g. sinl(long double)
#      define _STLP_DEF_MATH_INLINE(func,cf) \
      _STLP_MATH_INLINE(float,func,cf##f) \
      _STLP_MATH_INLINEX(long double,func,cf)
#      define _STLP_DEF_MATH_INLINE2(func,cf) \
      _STLP_MATH_INLINE2(float,float,func,cf##f) \
      _STLP_MATH_INLINE2XX(long double,func,cf)
#      define _STLP_DEF_MATH_INLINE2P(func,cf) \
      _STLP_MATH_INLINE2(float,float *,func,cf##f) \
      _STLP_MATH_INLINE2PX(long double,func,cf)
#      define _STLP_DEF_MATH_INLINE2PI(func,cf) \
      _STLP_MATH_INLINE2(float,int *,func,cf##f) \
      _STLP_MATH_INLINE2X(long double,int *,func,cf)
#      define _STLP_DEF_MATH_INLINE2I(func,cf) \
      _STLP_MATH_INLINE2(float,int,func,cf##f) \
      _STLP_MATH_INLINE2X(long double,int,func,cf)
#    elif !defined (_STLP_NO_VENDOR_MATH_L)
       // long double support and e.g. sinl(long double) but not e.g. sinf(float)
#      define _STLP_DEF_MATH_INLINE(func,cf) \
      _STLP_MATH_INLINEX(float,func,cf) \
      _STLP_MATH_INLINE(long double,func,cf##l)
#      define _STLP_DEF_MATH_INLINE2(func,cf) \
      _STLP_MATH_INLINE2XX(float,func,cf) \
      _STLP_MATH_INLINE2(long double,long double,func,cf##l)
#      define _STLP_DEF_MATH_INLINE2P(func,cf) \
      _STLP_MATH_INLINE2PX(float,func,cf) \
      _STLP_MATH_INLINE2(long double,long double *,func,cf##l)
#      define _STLP_DEF_MATH_INLINE2PI(func,cf) \
      _STLP_MATH_INLINE2X(float,int *,func,cf) \
      _STLP_MATH_INLINE2(long double,int *,func,cf##l)
#      define _STLP_DEF_MATH_INLINE2I(func,cf) \
      _STLP_MATH_INLINE2X(float,int,func,cf) \
      _STLP_MATH_INLINE2(long double,int,func,cf##l)
#    else
#      define _STLP_DEF_MATH_INLINE(func,cf) \
      _STLP_MATH_INLINEX(float,func,cf) \
      _STLP_MATH_INLINEX(long double,func,cf)
#      define _STLP_DEF_MATH_INLINE2(func,cf) \
      _STLP_MATH_INLINE2XX(float,func,cf) \
      _STLP_MATH_INLINE2XX(long double,func,cf)
#      define _STLP_DEF_MATH_INLINE2P(func,cf) \
      _STLP_MATH_INLINE2PX(float,func,cf) \
      _STLP_MATH_INLINE2PX(long double,func,cf)
#      define _STLP_DEF_MATH_INLINE2PI(func,cf) \
      _STLP_MATH_INLINE2X(float,int *,func,cf) \
      _STLP_MATH_INLINE2X(long double,int *,func,cf)
#      define _STLP_DEF_MATH_INLINE2I(func,cf) \
      _STLP_MATH_INLINE2X(float,int,func,cf) \
      _STLP_MATH_INLINE2X(long double,int,func,cf)
#    endif
#  else
#    if !defined (_STLP_NO_VENDOR_MATH_F)
#      define _STLP_DEF_MATH_INLINE(func,cf) \
      _STLP_MATH_INLINE(float,func,cf##f)
#      define _STLP_DEF_MATH_INLINE2(func,cf) \
      _STLP_MATH_INLINE2(float,float,func,cf##f)
#      define _STLP_DEF_MATH_INLINE2P(func,cf) \
      _STLP_MATH_INLINE2(float,float *,func,cf##f)
#      define _STLP_DEF_MATH_INLINE2PI(func,cf) \
      _STLP_MATH_INLINE2(float,int *,func,cf##f)
#      define _STLP_DEF_MATH_INLINE2I(func,cf) \
      _STLP_MATH_INLINE2(float,int,func,cf##f)
#    else // _STLP_NO_VENDOR_MATH_F
       // neither long double support nor e.g. sinf(float) functions
#      define _STLP_DEF_MATH_INLINE(func,cf) \
      _STLP_MATH_INLINEX(float,func,cf)
#      define _STLP_DEF_MATH_INLINE2(func,cf) \
      _STLP_MATH_INLINE2XX(float,func,cf)
#      define _STLP_DEF_MATH_INLINE2P(func,cf) \
      _STLP_MATH_INLINE2PX(float,func,cf)
#      define _STLP_DEF_MATH_INLINE2PI(func,cf) \
      _STLP_MATH_INLINE2X(float,int *,func,cf)
#      define _STLP_DEF_MATH_INLINE2I(func,cf) \
      _STLP_MATH_INLINE2X(float,int,func,cf)
#    endif // _STLP_NO_VENDOR_MATH_F
#  endif
#endif

#if defined (_STLP_WCE) || \
   (defined(_STLP_MSVC) && (_STLP_MSVC <= 1300) && defined (_MSC_EXTENSIONS) /* && !defined(_STLP_WCE_NET) */)
/*
 * dums: VC6 has all the required C++ functions but only define them if
 * _MSC_EXTENSIONS is not defined (a bug?). STLport just do the same
 * thing also when _MSC_EXTENSIONS is defined.
 * TODO: above check (_STLP_MSVC <= 1300) also catches VC7.0, is that intended?
 */
//We have to tell the compilers that abs, acos ... math functions are not intrinsic
//otherwise we have Internal Compiler Error in release mode...
#  pragma warning(push)
#  pragma warning(disable: 4162) // no function with C linkage found
#  pragma warning(disable: 4163) // not available as an intrinsic function
#  pragma function (abs, acos, asin, atan, atan2, cos, cosh, exp, fabs, fmod, log, log10, sin, sinh, sqrt, tan, tanh)
#  if defined (_STLP_WCE)
#    pragma function (ceil, floor)
#  endif
#  define _STLP_RESTORE_FUNCTION_INTRINSIC
#endif // _STLP_MSVC && _STLP_MSVC <= 1300 && !_STLP_WCE && _MSC_EXTENSIONS



/* MSVC native lib starting with .Net 2003 has already all math functions
 * in global namespace.
 * HP-UX native lib has math functions in the global namespace.
 */
  /* We have these already defined in our library so we don't
   * need the definitions below. */
#  include "cpp_inline_math.h"

#if (defined (_STLP_MSVC) && !defined (_STLP_WCE)) || defined (__ICL) || defined (__sun)
#  if defined (_STLP_MSVC) && (_STLP_MSVC >= 1400)
#    pragma warning (push)
#    pragma warning (disable : 4996) // hypot is deprecated.
#  endif
_STLP_MATH_INLINE2XX(float, hypot, hypot)
inline long double hypot(long double x, long double y) { return sqrt(x * x + y * y); }
#  if defined (_STLP_MSVC) && (_STLP_MSVC >= 1400)
#    pragma warning (pop)
#  endif
#else
#  if defined (_STLP_USE_UCLIBC)
inline double hypot(double x, double y) { return sqrt(x * x + y * y); }
_STLP_DEF_MATH_INLINE2(hypot, hypot)
#  elif defined (_STLP_WCE)
   /* CE has a double _hypot(double,double) which we use */
inline double hypot(double __x, double __y) { return _hypot(__x,__y); }
_STLP_DEF_MATH_INLINE2(hypot, _hypot)
#  endif
#endif

#if defined (_STLP_RESTORE_FUNCTION_INTRINSIC)
//restoration of the default intrinsic status of those functions:
#  pragma intrinsic (abs, acos, asin, atan, atan2, cos, cosh, exp, fabs, fmod, log, log10, sin, sinh, sqrt, tan, tanh)
#  if defined (_STLP_WCE)
#    pragma intrinsic (ceil, floor)
#  endif
#  pragma warning(pop)
#  undef _STLP_RESTORE_FUNCTION_INTRINSIC
#endif // _STLP_MSVC && _STLP_MSVC <= 1300 && !_STLP_WCE && _MSC_EXTENSIONS

/* C++ Standard is unclear about several call to 'using ::func' if new overloads
 * of ::func appears between 2 successive 'using' calls. To avoid this potential
 * problem we provide all abs overload before the 'using' call.
 * Beware: This header inclusion has to be after all abs overload of this file.
 *         The first 'using ::abs' call is going to be in the other header.
 */
#ifndef _STLP_INTERNAL_CSTDLIB
#  include <s__cstdlib.h>
#endif

#if defined (_STLP_IMPORT_VENDOR_CSTD) && !defined (_STLP_NO_CSTD_FUNCTION_IMPORTS)
_STLP_BEGIN_NAMESPACE
using ::abs;
using ::acos;
using ::asin;
using ::atan;
using ::atan2;
using ::ceil;
using ::cos;
using ::cosh;
using ::exp;
using ::fabs;
using ::floor;
using ::fmod;
using ::frexp;
/*
   Because of some weird interaction between STLport headers
   and native HP-UX headers, when compiled with _STLP_DEBUG
   macro defined with aC++, hypot() is not declared.
   At some point we'll need to get to the bottom line of
   this problem.
*/
using ::ldexp;
using ::log;
using ::log10;
using ::modf;
using ::pow;
using ::sin;
using ::sinh;
using ::sqrt;
using ::tan;
using ::tanh;
_STLP_END_NAMESPACE
#endif

#endif /* _STLP_INTERNAL_CMATH */

// Local Variables:
// mode:C++
// End:
