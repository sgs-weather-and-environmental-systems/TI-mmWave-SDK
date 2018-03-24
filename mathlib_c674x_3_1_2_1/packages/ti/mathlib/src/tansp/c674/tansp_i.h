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
/* tansp_i.h - single precision floating point tangent                     */
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef TANSP_I_
#define TANSP_I_ 1

#include <ti/mathlib/src/common/common.h>
#include <c6x.h>
#include <float.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(recipsp_tansp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the reciprocal of the real floating-point value   */
/* a. The return value is precisely 1/a.                                   */
/* ======================================================================= */

static inline double recipsp_tansp_i (float a)
{
  const float two  = 2.0f;
  float x1, y;

  x1 = _rcpsp(a);
  x1 = x1*(two - a*x1);
  y = x1*(two - a*x1);

  if (a == 0.0f) {
    y = 0.0f;
  }

  return (y);
} /* End of recipsp_tansp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_tansp_i, ".text:optci");
#endif

/* ======================================================================== */
/* Polynomial calculation to estimate the tangent funtion.                  */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7 + c8 x^9 + c10 x^11 + c12 x^13      */
/*                                                                          */
/* where x is the input, c2 through c12 are the corresponding coefficients  */
/* to the polynomial, and pol is the result of the polynomial. This         */
/* polynomial only covers inputs in the range [0, PI/4].                    */
/* ======================================================================== */

static inline float pol_est_tansp_i (float x)
{
  /* coefficients for the polynomial for tan(x)*/
  const float c12  =  0.00457708084094171f;
  const float c10  =  0.00867365970442499f;
  const float c8   =  0.0236488997700456f;
  const float c6   =  0.0523817525811416f;
  const float c4   =  0.133766510899828f;
  const float c2   =  0.333299506194791f;

  float x2, x4, x6, x8, pol;
  float tmp1, tmp2;

 
  /* calculate the powers of x */
  x2  = x * x;
  x4  = x2 * x2;
  x6  = x2 * x4;
  x8  = x4 * x4;

  /* ====================================================================== */
  /* The polynomial calculation is done in two seperate parts.              */
  /*   tmp1 =  c2 x^2 + c4 x^4 + c6 x^6 + c8 x^8                            */
  /*   tmp2 =  c10 x^10 + c12 x^12                                          */
  /* In order to reduce the number of multiplications x is factored out of  */
  /* the polynomial and multiplied by later.                                */
  /* ====================================================================== */

  tmp1 = ((c8 * x8) + (c6 * x6))+ ((c4 * x4) + (c2 * x2));
  tmp2 = x8 * ((c10 * x2) + (c12 * x4));

  pol = (tmp1 + tmp2) * x + x;

  return pol;
} /* End of pol_est_tansp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(tansp_i, ".text:optci");
#endif

/* ====================================================================== */
/* To calculate tan(x), x must be mapped to the range [0,pi/2]            */
/* y = x within range. Then the calculation for tan(y) depends on the     */
/* value of y:                                                            */
/*                                                                        */
/* for y_abs <= pi/4, res = pol_est_tansp_i (input y)                     */
/* for y_abs > pi/4,  res = 1 / pol_est_tansp_i (input a)                 */
/*                         a = pi/2 - y                                   */
/* where y_abs is the absolute value of the y, a is calculated as         */
/* shown above and it's used as an input for the polynomial, and res is   */
/* the value for tan(x).                                                  */
/* ====================================================================== */

static inline float tansp_i (float x)
{
  const float pi4   =  0.785398163f;             /* pi/4 */
  const float pi2_h =  1.570796f;
  const float pi2_l =  3.26794896476912e-7f;     /* pi2_h + pi2_l = pi/2 */
  const float pi    =  3.14159265358979f;
  const float C1    =  3.140625f;
  const float C2    =  9.676535e-4f;
  const float C3    =  8.97930618748433e-11f;    /* C1 + C2 + C3 = PI */
  const float invPI =  0.318309886183791;        /* 1/pi */
  float sign  =  1.0f;

  float res, y, temp;
  int N;

  /* extract multiples of pi */
  temp =  x * invPI;
  N = _spint(temp);                           /* N = multiple of pi in x  */
  y = ((x - (float)N * C1) - (float)N * C2) - (float) N * C3;

  if(y > pi2_h){
    y = y - pi;                               /* x is in the range [-pi/2, pi/2] */
  }

  if(y < 0.0f){
    sign = -sign;                             /* sign variable */
    y = -y;
  }

  /* calculate tan(y) */
  if(y > pi4){                                /* |y| > pi/4 */
    y = (pi2_h - y) + pi2_l;                  /* pi/2 - y */
    temp = pol_est_tansp_i(y);
    res = recipsp_tansp_i(temp);              /* 1/tan(pi/2 - y) */
  }
  else{                                       /* |y| <= pi/4 */
    res = pol_est_tansp_i(y);
  }

  res = res * sign;                           /* sign for Quadrant 2 & 4 */
  return (res);
}

#endif /* TANSP_I_ */

/* ======================================================================== */
/*  End of file: tansp_i.h                                                  */
/* ======================================================================== */
