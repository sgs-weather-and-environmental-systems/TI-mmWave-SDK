/*****************************************************************************/
/*  C6X_VECLIB.H v8.1.3                                                      */
/*                                                                           */
/* Copyright (c) 2013-2017 Texas Instruments Incorporated                    */
/* http://www.ti.com/                                                        */
/*                                                                           */
/*  Redistribution and  use in source  and binary forms, with  or without    */
/*  modification,  are permitted provided  that the  following conditions    */
/*  are met:                                                                 */
/*                                                                           */
/*     Redistributions  of source  code must  retain the  above copyright    */
/*     notice, this list of conditions and the following disclaimer.         */
/*                                                                           */
/*     Redistributions in binary form  must reproduce the above copyright    */
/*     notice, this  list of conditions  and the following  disclaimer in    */
/*     the  documentation  and/or   other  materials  provided  with  the    */
/*     distribution.                                                         */
/*                                                                           */
/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
/*     of its  contributors may  be used to  endorse or  promote products    */
/*     derived  from   this  software  without   specific  prior  written    */
/*     permission.                                                           */
/*                                                                           */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
/*                                                                           */
/*****************************************************************************/
#include <limits.h>

#define __USE_VECTYPES_ONLY__
#include "c6x_vec.h"

/*----------------------------------------------------------------------------
* Built-In Functions: base cases implemented in RTS library
*----------------------------------------------------------------------------*/


/*----------------------------------------------------------------------------
* add_sat, sub_sat: saturated add, saturated subtract
*----------------------------------------------------------------------------*/
uchar uchar_sat(int tmp)
{
  return (uchar) ( tmp > UCHAR_MAX ? UCHAR_MAX : 
                  (tmp < 0         ? 0         : tmp));
}
short short_sat(int tmp)
{
  return (short) ( tmp > SHRT_MAX ? SHRT_MAX : 
                  (tmp < SHRT_MIN ? SHRT_MIN : tmp));
}
short ushort_sat(int tmp)
{
  return (ushort) ( tmp > USHRT_MAX ? USHRT_MAX : 
                   (tmp < 0         ? 0         : tmp));
}
int   int_sat(long long tmp)
{
  return (int) ( tmp > INT_MAX ? INT_MAX : 
                (tmp < INT_MIN ? INT_MIN : tmp));
}

uchar  __attribute__((overloadable,builtin)) __add_sat(uchar a, uchar b)
{
  return uchar_sat((int) a + (int) b);
}
short  __attribute__((overloadable,builtin)) __add_sat(short a, short b)
{
  return short_sat((int) a + (int) b);
}
ushort __attribute__((overloadable,builtin)) __add_sat(ushort a, short b)
{
  return ushort_sat((int) a + (int) b);
}
short  __attribute__((overloadable,builtin)) __sub_sat(short a, short b)
{
  return short_sat((int) a - (int) b);
}


/*----------------------------------------------------------------------------
* convert_typen_sat(), *to*_sat: conversion with saturation
* Mangled by FE to: __SCALARTYPE1toSCALARTYPE2_sat_roundingmode
*----------------------------------------------------------------------------*/
short __attribute__((overloadable,builtin)) __itos_sat(int a)
{
  return short_sat(a);
}
uchar __attribute__((overloadable,builtin)) __stouc_sat(short a)
{
  return uchar_sat(a);
}

short __attribute__((overloadable,builtin)) __ftos_sat(float a)
{
  int tmp = (int) a;
  return short_sat(tmp);
}

short __attribute__((overloadable,builtin)) __ftos_sat_rtz(float a)
{
  int tmp = (int) a;
  return short_sat(tmp);
}

/*----------------------------------------------------------------------------
* rhadd(a,b): average, (a+b+1)>>1
*  hadd(a,b): average, (a+b)>>1
*----------------------------------------------------------------------------*/
short __attribute__((overloadable,builtin)) __rhadd(short a, short b)
{
  return (short) (((int) a + (int) b + 1) >> 1);
}
uchar __attribute__((overloadable,builtin)) __rhadd(uchar a, uchar b)
{
  return (uchar) (((int) a + (int) b + 1) >> 1);
}
short __attribute__((overloadable,builtin)) __hadd(short a, short b)
{
  return (short) (((int) a + (int) b) >> 1);
}
uchar __attribute__((overloadable,builtin)) __hadd(uchar a, uchar b)
{
  return (uchar) (((int) a + (int) b) >> 1);
}

/*----------------------------------------------------------------------------
* max(a,b): (a>b)?a:b
* min(a,b): (a<b)?a:b
*----------------------------------------------------------------------------*/
short __attribute__((overloadable,builtin)) __max(short a, short b)
{
  return (a > b ? a : b);
}
uchar __attribute__((overloadable,builtin)) __max(uchar a, uchar b)
{
  return (a > b ? a : b);
}
short __attribute__((overloadable,builtin)) __min(short a, short b)
{
  return (a < b ? a : b);
}
uchar __attribute__((overloadable,builtin)) __min(uchar a, uchar b)
{
  return (a < b ? a : b);
}

/*----------------------------------------------------------------------------
* abs_diff(a,b): (a-b)<0 ? (b-a) : (a-b)
*----------------------------------------------------------------------------*/
uchar __attribute__((overloadable,builtin)) __abs_diff(uchar a, uchar b)
{
  int tmp = (int) a - (int) b;
  return (uchar) (tmp < 0 ? -tmp : tmp);
}

/*----------------------------------------------------------------------------
* abs(a): a<0 ? (-a) : (a)
*----------------------------------------------------------------------------*/
ushort __attribute__((overloadable,builtin)) __abs(short a)
{
  return (ushort) (a < 0 ? -a : a);
}

/*----------------------------------------------------------------------------
* popcount(a): counting number of non-0 bits
*----------------------------------------------------------------------------*/
uchar4 __attribute__((overloadable,builtin)) __popcount(uchar4 a);
uchar  __attribute__((overloadable,builtin)) __popcount(uchar a)
{
#define __popcount(a) __overload("__popcount",(a))((a))
  uchar4 tsrc = as_uchar4((uint) a);
  uchar4 tdst = __popcount(tsrc);   // guaranteed BITC4 on >= C64
  // TODO: to use this (vector for scalar) method for other BIFs when possible
  // TODO: OR, this could actually go into MD, say: c60_veclib.md
  return (uchar) as_uint(tdst);
  // uchar4 tsrc;  tsrc.s0 = a; 
  // uchar4 tdst = __popcount(tsrc);
  // return tdst.s0;
}

/*----------------------------------------------------------------------------
* mpy_ext(a, b): char  * char  -> short
*                uchar * uchar -> ushort
*----------------------------------------------------------------------------*/
short  __attribute__((overloadable,builtin)) __mpy_ext(char a, uchar b)
{
  return (short) ((int) a * (int) b);
}
ushort __attribute__((overloadable,builtin)) __mpy_ext(uchar a, uchar b)
{
  return (ushort) ((int) a * (int) b);
}


/*----------------------------------------------------------------------------
* cmpy(), cdiv(): complex multiplication, complex division
* conj_cmpy(a, b): conj(a) * b, conjuate complex multiplication
*----------------------------------------------------------------------------*/
#define __COMPLEXMPY(CTYPE) \
CTYPE __attribute__((overloadable,builtin)) __cmpy(CTYPE a, CTYPE b) \
{ \
  return (CTYPE) (a.r*b.r - a.i*b.i,  a.r*b.i + a.i*b.r); \
}

#define __COMPLEXCONJMPY(CTYPE) \
CTYPE __attribute__((overloadable,builtin)) __conj_cmpy(CTYPE a, CTYPE b) \
{ \
  return (CTYPE) (a.r*b.r + a.i*b.i, a.r*b.i - a.i*b.r); \
}

#define __COMPLEXDIV(CTYPE) \
CTYPE __attribute__((overloadable,builtin)) __cdiv(CTYPE a, CTYPE b) \
{ \
  return (CTYPE) ((a.r*b.r + a.i*b.i) / (b.r*b.r + b.i*b.i), \
                  (a.i*b.r - a.r*b.i) / (b.r*b.r + b.i*b.i) ); \
}

__COMPLEXMPY(cchar)
__COMPLEXMPY(cshort)
__COMPLEXMPY(cint)
__COMPLEXMPY(clonglong)
__COMPLEXMPY(cfloat)
__COMPLEXMPY(cdouble)

__COMPLEXCONJMPY(cchar)
__COMPLEXCONJMPY(cshort)
__COMPLEXCONJMPY(cint)
__COMPLEXCONJMPY(clonglong)
__COMPLEXCONJMPY(cfloat)
__COMPLEXCONJMPY(cdouble)

__COMPLEXDIV(cchar)
__COMPLEXDIV(cshort)
__COMPLEXDIV(cint)
__COMPLEXDIV(clonglong)
__COMPLEXDIV(cfloat)
__COMPLEXDIV(cdouble)

/*----------------------------------------------------------------------------
* cmpy_ext(): complex multiplication, results in extended precision
*----------------------------------------------------------------------------*/
// TODO: use MPY,MPYHH,MPYHL,MPYLH for efficient multiplication of cshort
#define __COMPLEXMPYEXT(CTYPE1,STYPE2,CTYPE2) \
CTYPE2 __attribute__((overloadable,builtin)) __cmpy_ext(CTYPE1 a, CTYPE1 b) \
{ \
  return (CTYPE2) ((STYPE2)a.r*(STYPE2)b.r - (STYPE2)a.i*(STYPE2)b.i, \
                   (STYPE2)a.r*(STYPE2)b.i + (STYPE2)a.i*(STYPE2)b.r); \
}

__COMPLEXMPYEXT(cshort,int,cint)
// do we need cint to clonglong? Or cchar to cshort?



