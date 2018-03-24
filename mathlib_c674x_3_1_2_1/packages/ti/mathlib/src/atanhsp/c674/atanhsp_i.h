/* ======================================================================== *
 * MATHLIB -- TI Floating-Point Math Function Library                       *
 *                                                                          *
 *                                                                          *
 * Copyright (C) 2011 Texas Instruments Incorporated - http://www.ti.com/   *
 *                                                                          *
 *                                                                          *
 *  Redistribution and use in source and binary forms, with or without      *
 *  modification, are permitted provided that the following conditions      *
 *  are met:                                                                *
 *                                                                          *
 *    Redistributions of source code must retain the above copyright        *
 *    notice, this list of conditions and the following disclaimer.         *
 *                                                                          *
 *    Redistributions in binary form must reproduce the above copyright     *
 *    notice, this list of conditions and the following disclaimer in the   *
 *    documentation and/or other materials provided with the                *
 *    distribution.                                                         *
 *                                                                          *
 *    Neither the name of Texas Instruments Incorporated nor the names of   *
 *    its contributors may be used to endorse or promote products derived   *
 *    from this software without specific prior written permission.         *
 *                                                                          *
 *  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS     *
 *  "AS IS" AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT       *
 *  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   *
 *  A PARTICULAR PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT    *
 *  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   *
 *  SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT        *
 *  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   *
 *  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   *
 *  THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT     *
 *  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   *
 *  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    *
 * ======================================================================== */

/* ======================================================================= */
/* atanhsp_i.h - single precision floating point inverse hyperbolic tangent*/
/*              optimized inlined C implementation (w/ intrinsics)         */
/* ======================================================================= */

#ifndef ATANHSP_I_
#define ATANHSP_I_ 1

#include <ti/mathlib/src/common/common.h>
#include <float.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(logsp_atanhsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the logarithm value of a real floating-point       */
/* argument x. The return value is the base e logarithmic value of x.       */
/* ======================================================================== */

static inline float logsp_atanhsp_i (float x)
{
  /* coefficients for the polynomial p(r) */
  const float   c1   = -0.2302894f;
  const float   c2   =  0.1908169f;
  const float   c3   = -0.2505905f;
  const float   c4   =  0.3333164f;
  const float   c5   = -0.5000002f;

  const double  ln2  =  0.693147180559945;
  float   pol, r1, r2, r3, r4, res;
  double  dr, frcpax, rcp, T;
  int     N, T_index;

  /* r = x * frcpa(x) -1 */
  rcp = _rcpdp((double) x);
  frcpax = _itod(_clr(_hi(rcp),0,16), 0);
  dr = frcpax * (double) x  - 1.0;

  /* calculate power of r */
  r1 = (float) dr;
  r2 = r1*r1;
  r3 = r1*r2;
  r4 = r2*r2; 

  /* Polynomial p(r) that approximates ln(1+r) - r */
  pol = c5*r2 + ((c4*r3) + ((c2*r1 + c3) + c1*r2)*r4);

  /* Reconstruction: result = T + r + p(r) */
  N       = _extu(_hi(frcpax),  1, 21) - 1023;
  T_index = _extu(_hi(frcpax), 12, 29);
  T       = ti_math_logtable[T_index] - ln2 * (double) N;
  res     = (dr + T) + (pol);

  return (res);
} /* End of logsp_atanhsp_i */


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divsp_atanhsp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the division result of two real floating-point    */
/* values, a and b. The return value is a/b.                               */
/* ======================================================================= */

static inline float divsp_atanhsp_i (float a, float b)
{
  const float two  = 2.0f;
  float x1, x2, res;

  x1 = _rcpsp(b);
  x1 = x1*(two - b*x1);
  x2 = x1*(two - b*x1);
  res = a*x2;

  return (res);
} /* End of divsp_atanhsp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(atanhsp_i, ".text:optci");
#endif

/* ======================================================================== */
/* The type of calculation for atanh(x) depends on the value of x:          */
/*   x_abs > 0.1, res =  0.5 * ln((1 + x)/(1 - x))                          */
/*                                                                          */
/*   x_abs <= 0.1, res = polynomial estimation (input x)                    */
/* where x_abs is the absolute value of the input and res is the calculated */
/* value for atanh(x)                                                       */
/*                                                                          */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2 x^3 + c4 x^5                                              */
/* where x is the input, c2 through c4 are the corresponding coefficients   */
/* for the polynomial, and pol is the result of the polynomial.             */
/* ======================================================================== */

static inline float atanhsp_i(float x)
{
  const float pol_bound  =  0.1f;
  const float half       =  0.5f;
  const float limit      =  1.0f;
  float sign             =  1.0f;

  /* Coefficients for the polynomial */
  const float c2         = 0.333327051f;
  const float c4         = 0.202017226f;

  float res, temp1, temp2, x_abs;
  float x2, x4, pol, div;

  x_abs = _fabsf(x);

  if(x < 0.0f){
    sign = -sign;
  }

  /* set the result to the right value depending on the input value */
  if(x_abs <= pol_bound){
    /* powers of x */
    x2 = x * x;
    x4 = x2 * x2;

    /* use polynomial estimation for |x| <= 0.1 */
    /* polynomial to estimate atanh(x) for small inputs */
    pol = (c2 * x2) + (c4 * x4);
    pol = pol * x_abs + x_abs;
    res = pol;
  }
  else{
    /* calculate atanh(x) based on atanh(x) = 0.5*ln((1+ x) / (1- x)) */
    temp1 = 1.0f + x_abs;
    temp2 = 1.0f - x_abs;

    div = divsp_atanhsp_i(temp1,temp2);         /* (1+ x) / (1- x) */
    res = logsp_atanhsp_i(div);                 /* ln((1 + x)/(1 - x)) */
    res = res * half;                           /* divide by 2*/
  }

  if(x_abs == limit){
    res = _itof(0x7F800000);                    /* INF */
  }

  res = res * sign;                             /* restore sign */
  return res;
}

#endif /* ATANHSP_I_ */

/* ======================================================================== */
/*  End of file: atanhsp_i .h                                               */
/* ======================================================================== */

