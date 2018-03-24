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

#include <limits>
#include <locale>
#include <istream>

#  include <stdint.h>

#if defined (__linux__) || defined (__MINGW32__) || defined (__CYGWIN__) || \
    defined (__BORLANDC__) || defined (__DMC__) || defined (__HP_aCC)


union _ll {
  uint64_t i64;
  struct {
#  if defined (_STLP_BIG_ENDIAN)
    uint32_t hi;
    uint32_t lo;
#  elif defined (_STLP_LITTLE_ENDIAN)
    uint32_t lo;
    uint32_t hi;
#  else
#    error Unknown endianess
#  endif
  } i32;
};

#  if defined (__linux__)
#    include <ieee754.h>
#  else
union ieee854_long_double {
  long double d;

  /* This is the IEEE 854 double-extended-precision format.  */
  struct {
    unsigned int mantissa1:32;
    unsigned int mantissa0:32;
    unsigned int exponent:15;
    unsigned int negative:1;
    unsigned int empty:16;
  } ieee;
};

#    define IEEE854_LONG_DOUBLE_BIAS 0x3fff
#  endif
#endif

_STLP_BEGIN_NAMESPACE
_STLP_MOVE_TO_PRIV_NAMESPACE

//----------------------------------------------------------------------
// num_get

// Helper functions for _M_do_get_float.

#if !defined (_STLP_NO_WCHAR_T)
void  _STLP_CALL
_Initialize_get_float( const ctype<wchar_t>& ct,
                       wchar_t& Plus, wchar_t& Minus,
                       wchar_t& pow_e, wchar_t& pow_E,
                       wchar_t* digits) {
  char ndigits[11] = "0123456789";
  Plus  = ct.widen('+');
  Minus = ct.widen('-');
  pow_e = ct.widen('e');
  pow_E = ct.widen('E');
  ct.widen(ndigits + 0, ndigits + 10, digits);
}
#endif /* WCHAR_T */

/*
 * __string_to_double is just lifted from atof, the difference being
 * that we just use '.' for the decimal point, rather than let it
 * be taken from the current C locale, which of course is not accessible
 * to us.
 */
#if defined (_STLP_MSVC) || defined (__BORLANDC__) || defined (__ICL)
typedef unsigned long uint32;
typedef unsigned __int64 uint64;
#  define ULL(x) x##Ui64
#else
typedef uint32_t uint32;
typedef uint64_t uint64;
#  define ULL(x) x##ULL
#endif


void _STLP_CALL
__string_to_float(const __iostring& v, float& val)
{
  val = (float)strtod(v.c_str(), NULL);
}

void _STLP_CALL
__string_to_float(const __iostring& v, double& val)
{
  val = strtod(v.c_str(), NULL);
}

#if !defined (_STLP_NO_LONG_DOUBLE)
void _STLP_CALL
__string_to_float(const __iostring& v, long double& val) {
   val = strtold(v.c_str(), NULL);
}
#endif

_STLP_MOVE_TO_STD_NAMESPACE
_STLP_END_NAMESPACE

// Local Variables:
// mode:C++
// End:
