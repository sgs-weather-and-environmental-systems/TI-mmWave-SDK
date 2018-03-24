/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
/*
Redistribution and use in source and binary forms are permitted
provided that the above copyright notice and this paragraph are
duplicated in all source code forms.  The name of Edison Design
Group, Inc. may not be used to endorse or promote products derived
from this software without specific prior written permission.
THIS SOFTWARE IS PROVIDED "AS IS" AND WITHOUT ANY EXPRESS OR
IMPLIED WARRANTIES, INCLUDING, WITHOUT LIMITATION, THE IMPLIED
WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE.
Any use of this software is at the user's own risk.
*/

/*

c99_cmplex.c -- Runtime support for lowered complex operations in C99.
                This implementation is for demonstration and testing
                purposes only.  It is neither particularly efficient, nor
                particularly precise (numerically speaking).

*/

/* Include the definition of EXTERN_C. */
#include "basics.h"

typedef struct _Complex_float {
  /* Lowered representation of the C99 type "_Complex float". */
  float _Vals[2];
} _Complex_float;


typedef struct _Complex_double {
  /* Lowered representation of the C99 type "_Complex double". */
  double _Vals[2];
} _Complex_double;


typedef struct _Complex_long_double {
  /* Lowered representation of the C99 type "_Complex long double". */
  long double _Vals[2];
} _Complex_long_double;


EXTERN_C _Complex_float __c99_complex_float_negate(_Complex_float z)
/*
Compute -z in lowered representation (single precision).
*/
{
  z._Vals[0] = -z._Vals[0];
  z._Vals[1] = -z._Vals[1];
  return z;
}  /* __c99_complex_float_negate */


EXTERN_C _Complex_double __c99_complex_double_negate(_Complex_double z)
/*
Compute -z in lowered representation (double precision).
*/
{
  z._Vals[0] = -z._Vals[0];
  z._Vals[1] = -z._Vals[1];
  return z;
}  /* __c99_complex_double_negate */


EXTERN_C _Complex_long_double __c99_complex_long_double_negate(
                                                        _Complex_long_double z)
/*
Compute -z in lowered representation (extended precision).
*/
{
  z._Vals[0] = -z._Vals[0];
  z._Vals[1] = -z._Vals[1];
  return z;
}  /* __c99_complex_long_double_negate */


EXTERN_C _Complex_float __c99_complex_float_conj(_Complex_float z)
/*
Compute the complex conjugate of z in lowered representation (single
precision).  (This is currently only needed to support the GNU complex
"~" operator.)
*/
{
  z._Vals[1] = -z._Vals[1];
  return z;
}  /* __c99_complex_float_conj */


EXTERN_C _Complex_double __c99_complex_double_conj(_Complex_double z)
/*
Compute the complex conjugate of z in lowered representation (double
precision).  (This is currently only needed to support the GNU complex
"~" operator.)

*/
{
  z._Vals[1] = -z._Vals[1];
  return z;
}  /* __c99_complex_double_conj */


EXTERN_C _Complex_long_double __c99_complex_long_double_conj(
                                                        _Complex_long_double z)
/*
Compute the complex conjugate of z in lowered representation (extended
precision).  (This is currently only needed to support the GNU complex
"~" operator.)

*/
{
  z._Vals[1] = -z._Vals[1];
  return z;
}  /* __c99_complex_long_double_conj */


EXTERN_C _Complex_float __c99_complex_float_add(_Complex_float z1,
                                                _Complex_float z2)
/*
Compute z1+z2 in lowered representation (single precision).
*/
{
  _Complex_float r;
  r._Vals[0] = z1._Vals[0] + z2._Vals[0];
  r._Vals[1] = z1._Vals[1] + z2._Vals[1];
  return r;
}  /* __c99_complex_float_add */


EXTERN_C _Complex_double __c99_complex_double_add(_Complex_double z1,
                                                  _Complex_double z2)
/*
Compute z1+z2 in lowered representation (double precision).
*/
{
  _Complex_double r;
  r._Vals[0] = z1._Vals[0] + z2._Vals[0];
  r._Vals[1] = z1._Vals[1] + z2._Vals[1];
  return r;
}  /* __c99_complex_double_add */


EXTERN_C _Complex_long_double __c99_complex_long_double_add(
                                                      _Complex_long_double z1,
                                                      _Complex_long_double z2)
/*
Compute z1+z2 in lowered representation (extended precision).
*/
{
  _Complex_long_double r;
  r._Vals[0] = z1._Vals[0] + z2._Vals[0];
  r._Vals[1] = z1._Vals[1] + z2._Vals[1];
  return r;
}  /* __c99_complex_long_double_add */


EXTERN_C _Complex_float __c99_complex_float_subtract(_Complex_float z1,
                                                     _Complex_float z2)
/*
Compute z1-z2 in lowered representation (single precision).
*/
{
  _Complex_float r;
  r._Vals[0] = z1._Vals[0] - z2._Vals[0];
  r._Vals[1] = z1._Vals[1] - z2._Vals[1];
  return r;
}  /* __c99_complex_float_subtract */


EXTERN_C _Complex_double __c99_complex_double_subtract(_Complex_double z1,
                                                       _Complex_double z2)
/*
Compute z1-z2 in lowered representation (double precision).
*/
{
  _Complex_double r;
  r._Vals[0] = z1._Vals[0] - z2._Vals[0];
  r._Vals[1] = z1._Vals[1] - z2._Vals[1];
  return r;
}  /* __c99_complex_double_subtract */


EXTERN_C _Complex_long_double __c99_complex_long_double_subtract(
                                                      _Complex_long_double z1,
                                                      _Complex_long_double z2)
/*
Compute z1-z2 in lowered representation (extended precision).
*/
{
  _Complex_long_double r;
  r._Vals[0] = z1._Vals[0] - z2._Vals[0];
  r._Vals[1] = z1._Vals[1] - z2._Vals[1];
  return r;
}  /* __c99_complex_long_double_subtract */


EXTERN_C _Complex_float __c99_complex_float_multiply(_Complex_float z1,
                                                     _Complex_float z2)
/*
Compute z1*z2 in lowered representation (single precision).
*/
{
  _Complex_float r;
  r._Vals[0] = z1._Vals[0] * z2._Vals[0] - z1._Vals[1] * z2._Vals[1];
  r._Vals[1] = z1._Vals[0] * z2._Vals[1] + z1._Vals[1] * z2._Vals[0];
  return r;
}  /* __c99_complex_float_multiply */


EXTERN_C _Complex_double __c99_complex_double_multiply(_Complex_double z1,
                                                       _Complex_double z2)
/*
Compute z1*z2 in lowered representation (double precision).
*/
{
  _Complex_double r;
  r._Vals[0] = z1._Vals[0] * z2._Vals[0] - z1._Vals[1] * z2._Vals[1];
  r._Vals[1] = z1._Vals[0] * z2._Vals[1] + z1._Vals[1] * z2._Vals[0];
  return r;
}  /* __c99_complex_double_multiply */


EXTERN_C _Complex_long_double __c99_complex_long_double_multiply(
                                                      _Complex_long_double z1,
                                                      _Complex_long_double z2)
/*
Compute z1*z2 in lowered representation (extended precision).
*/
{
  _Complex_long_double r;
  r._Vals[0] = z1._Vals[0] * z2._Vals[0] - z1._Vals[1] * z2._Vals[1];
  r._Vals[1] = z1._Vals[0] * z2._Vals[1] + z1._Vals[1] * z2._Vals[0];
  return r;
}  /* __c99_complex_long_double_multiply */


EXTERN_C _Complex_float __c99_complex_float_divide(_Complex_float z1,
                                                   _Complex_float z2)
/*
Compute z1/z2 in lowered representation (single precision).
*/
{
  _Complex_float r;
  float d = z2._Vals[0] * z2._Vals[0] + z2._Vals[1] * z2._Vals[1];
  r._Vals[0] = (z1._Vals[0] * z2._Vals[0] + z1._Vals[1] * z2._Vals[1]) / d;
  r._Vals[1] = (z1._Vals[1] * z2._Vals[0] - z1._Vals[0] * z2._Vals[1]) / d;
  return r;
}  /* __c99_complex_float_divide */


EXTERN_C _Complex_double __c99_complex_double_divide(_Complex_double z1,
                                                     _Complex_double z2)
/*
Compute z1/z2 in lowered representation (double precision).
*/
{
  _Complex_double r;
  double d = z2._Vals[0] * z2._Vals[0] + z2._Vals[1] * z2._Vals[1];
  r._Vals[0] = (z1._Vals[0] * z2._Vals[0] + z1._Vals[1] * z2._Vals[1]) / d;
  r._Vals[1] = (z1._Vals[1] * z2._Vals[0] - z1._Vals[0] * z2._Vals[1]) / d;
  return r;
}  /* __c99_complex_double_divide */


EXTERN_C _Complex_long_double __c99_complex_long_double_divide(
                                                      _Complex_long_double z1,
                                                      _Complex_long_double z2)
/*
Compute z1/z2 in lowered representation (extended precision).
*/
{
  _Complex_long_double r;
  long double d = z2._Vals[0] * z2._Vals[0] + z2._Vals[1] * z2._Vals[1];
  r._Vals[0] = (z1._Vals[0] * z2._Vals[0] + z1._Vals[1] * z2._Vals[1]) / d;
  r._Vals[1] = (z1._Vals[1] * z2._Vals[0] - z1._Vals[0] * z2._Vals[1]) / d;
  return r;
}  /* __c99_complex_long_double_divide */


EXTERN_C int __c99_complex_float_eq(_Complex_float z1,
                                    _Complex_float z2)
/*
Compute z1==z2 in lowered representation (float precision).
*/
{
  return z1._Vals[0] == z2._Vals[0] && z1._Vals[1] == z2._Vals[1];
}  /* __c99_complex_float_eq */


EXTERN_C int __c99_complex_double_eq(_Complex_double z1,
                                     _Complex_double z2)
/*
Compute z1==z2 in lowered representation (double precision).
*/
{
  return z1._Vals[0] == z2._Vals[0] && z1._Vals[1] == z2._Vals[1];
}  /* __c99_complex_double_eq */


EXTERN_C int __c99_complex_long_double_eq(_Complex_long_double z1,
                                          _Complex_long_double z2)
/*
Compute z1==z2 in lowered representation (extended precision).
*/
{
  return z1._Vals[0] == z2._Vals[0] && z1._Vals[1] == z2._Vals[1];
}  /* __c99_complex_long_double_eq */


EXTERN_C int __c99_complex_float_ne(_Complex_float z1,
                                    _Complex_float z2)
/*
Compute z1!=z2 in lowered representation (float precision).
*/
{
  return z1._Vals[0] != z2._Vals[0] || z1._Vals[1] != z2._Vals[1];
}  /* __c99_complex_float_ne */


EXTERN_C int __c99_complex_double_ne(_Complex_double z1,
                                     _Complex_double z2)
/*
Compute z1!=z2 in lowered representation (double precision).
*/
{
  return z1._Vals[0] != z2._Vals[0] || z1._Vals[1] != z2._Vals[1];
}  /* __c99_complex_double_ne */


EXTERN_C int __c99_complex_long_double_ne(_Complex_long_double z1,
                                          _Complex_long_double z2)
/*
Compute z1!=z2 in lowered representation (extended precision).
*/
{
  return z1._Vals[0] != z2._Vals[0] || z1._Vals[1] != z2._Vals[1];
}  /* __c99_complex_long_double_ne */


EXTERN_C _Complex_double __c99_cfloat_to_cdouble(_Complex_float z)
/*
Adjust precision of complex value.
*/
{
  _Complex_double r;
  r._Vals[0] = (double)z._Vals[0];
  r._Vals[1] = (double)z._Vals[1];
  return r;
}  /* __c99_cfloat_to_cdouble */


EXTERN_C _Complex_long_double __c99_cfloat_to_clong_double(_Complex_float z)
/*
Adjust precision of complex value.
*/
{
  _Complex_long_double r;
  r._Vals[0] = (long double)z._Vals[0];
  r._Vals[1] = (long double)z._Vals[1];
  return r;
}  /* __c99_cfloat_to_clong_double */


EXTERN_C _Complex_float __c99_cdouble_to_cfloat(_Complex_double z)
/*
Adjust precision of complex value.
*/
{
  _Complex_float r;
  r._Vals[0] = (float)z._Vals[0];
  r._Vals[1] = (float)z._Vals[1];
  return r;
}  /* __c99_cdouble_to_cfloat */


EXTERN_C _Complex_long_double __c99_cdouble_to_clong_double(_Complex_double z)
/*
Adjust precision of complex value.
*/
{
  _Complex_long_double r;
  r._Vals[0] = (long double)z._Vals[0];
  r._Vals[1] = (long double)z._Vals[1];
  return r;
}  /* __c99_cdouble_to_clong_double */


EXTERN_C _Complex_float __c99_clong_double_to_cfloat(_Complex_long_double z)
/*
Adjust precision of complex value.
*/
{
  _Complex_float r;
  r._Vals[0] = (float)z._Vals[0];
  r._Vals[1] = (float)z._Vals[1];
  return r;
}  /* __c99_clong_double_to_cfloat */


EXTERN_C _Complex_double __c99_clong_double_to_cdouble(_Complex_long_double z)
/*
Adjust precision of complex value.
*/
{
  _Complex_double r;
  r._Vals[0] = (double)z._Vals[0];
  r._Vals[1] = (double)z._Vals[1];
  return r;
}  /* __c99_long_cdouble_to_cdouble */


EXTERN_C _Complex_float __c99_ifloat_to_cfloat(float j)
/*
Promote imaginary value to complex value.
*/
{
  _Complex_float r;
  r._Vals[0] = (float)0.0;
  r._Vals[1] = (float)j;
  return r;
}  /* __c99_ifloat_to_cfloat */


EXTERN_C _Complex_double __c99_idouble_to_cdouble(double j)
/*
Promote imaginary value to complex value.
*/
{
  _Complex_double r;
  r._Vals[0] = (double)0.0;
  r._Vals[1] = (double)j;
  return r;
}  /* __c99_idouble_to_cdouble */


EXTERN_C _Complex_long_double __c99_ilong_double_to_clong_double(long double j)
/*
Promote imaginary value to complex value.
*/
{
  _Complex_long_double r;
  r._Vals[0] = (long double)0.0;
  r._Vals[1] = (long double)j;
  return r;
}  /* __c99_ilong_double_to_clong_double */


EXTERN_C _Complex_float __c99_float_to_cfloat(float j)
/*
Promote real value to complex value.
*/
{
  _Complex_float r;
  r._Vals[0] = (float)j;
  r._Vals[1] = (float)0.0;
  return r;
}  /* __c99_float_to_cfloat */


EXTERN_C _Complex_double __c99_double_to_cdouble(double j)
/*
Promote real value to complex value.
*/
{
  _Complex_double r;
  r._Vals[0] = (double)j;
  r._Vals[1] = (double)0.0;
  return r;
}  /* __c99_double_to_cdouble */


EXTERN_C _Complex_long_double __c99_long_double_to_clong_double(long double j)
/*
Promote real value to complex value.
*/
{
  _Complex_long_double r;
  r._Vals[0] = (long double)j;
  r._Vals[1] = (long double)0.0;
  return r;
}  /* __c99_long_double_to_clong_double */


EXTERN_C float __c99_cfloat_to_ifloat(_Complex_float z)
/*
Imaginary part of a complex value.
*/
{
  return z._Vals[1];
}  /* __c99_cfloat_to_ifloat */


EXTERN_C double __c99_cdouble_to_idouble(_Complex_double z)
/*
Imaginary part of a complex value.
*/
{
  return z._Vals[1];
}  /* __c99_cdouble_to_idouble */


EXTERN_C long double __c99_clong_double_to_ilong_double(_Complex_long_double z)
/*
Imaginary part of a complex value.
*/
{
  return z._Vals[1];
}  /* __c99_clong_double_to_ilong_double */


EXTERN_C float __c99_cfloat_to_float(_Complex_float z)
/*
Real part of a complex value.
*/
{
  return z._Vals[0];
}  /* __c99_cfloat_to_float */


EXTERN_C double __c99_cdouble_to_double(_Complex_double z)
/*
Real part of a complex value.
*/
{
  return z._Vals[0];
}  /* __c99_cdouble_to_double */


EXTERN_C long double __c99_clong_double_to_long_double(_Complex_long_double z)
/*
Real part of a complex value.
*/
{
  return z._Vals[0];
}  /* __c99_clong_double_to_long_double */


/******************************************************************************
*                                                             \  ___  /       *
* Edison Design Group C++ Runtime                               /   \         *
*                                                            - | \^/ | -      *
* Copyright 1992-2011 Edison Design Group, Inc.                 \   /         *
*                                                             /  | |  \       *
*                                                                [_]          *
*                                                                             *
******************************************************************************/
