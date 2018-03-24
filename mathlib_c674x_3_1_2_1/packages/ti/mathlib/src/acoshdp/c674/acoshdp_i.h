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
/* acoshdp_i.h - Double precision floating point inverse hyperbolic cosine */
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef ACOSHDP_I_
#define ACOSHDP_I_ 1

#include <ti/mathlib/src/common/common.h>
#include <float.h>
#include <c6x.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divdp_acoshdp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the division result of two real floating-point    */
/* values, a and b. The return value is a/b.                               */
/* ======================================================================= */

static inline double divdp_acoshdp_i (double a, double b)
{
  double  y, x1, x2, x3;
  const double  two   =  2.0;

  x1 = _rcpdp(b);
  x1 = x1 * (two - b*x1);
  x2 = x1 * (two - b*x1);
  x3 = x2 * (two - b*x2);
  y = x3 * a;

  if (a == 0.0) {
    y = 0.0;
  }

  return (y);
} /* End of divdp_acoshdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(logdp_acoshdp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the logarithm value of a real floating-point       */
/* argument x. The return value is the base e logarithmic value of x.       */
/* ======================================================================== */

static inline double logdp_acoshdp_i (double x)
{
  const double Half   =  0.5;
  const double srHalf =  0.70710678118654752440;      /* sqrt(0.5) */
  const double a0     = -0.64124943423745581147e+2;
  const double a1     =  0.16383943563021534222e+2;
  const double a2     = -0.78956112887491257267e+0;
  const double b0     = -0.76949932108494879777e+3;
  const double b1     =  0.31203222091924532844e+3;
  const double b2     = -0.35667977739034646171e+2;   /* Note b3 = 1.0 */
  const double c1     =  0.693359375;                 /*  355/512      */
  const double c2     = -2.121944400546905827679e-4 ;
  const double max    =  709.782712893384;
  double W, X, Y, Z;
  double zn, zd, zn_2, zd_2;
  double Rz, Sa, Bd, Cn, Da;
  int    N, exp, upper; 

  /* get unbiased exponent */
  Y = x;
  exp = _extu(_hi(Y),1,21);
  N = exp - 1022;
    
  /* force SP exp = 1022 if not zero */
  upper = _clr(_hi(Y),20,31);
  upper = 0x3fe00000 | upper;
  Z = _itod(upper,_lo(Y));

  if (exp == 0) {
    Z = 0;
  }

  zn = (Z - Half) - Half;
  zd = Z*Half + Half;

  zn_2 = Z - Half;
  zd_2 = zn_2*Half + Half;

  if (Z <= srHalf) {
    zn = zn_2;
    zd = zd_2;
    N  = N - 1; 
  }

  X  = divdp_acoshdp_i(zn,zd);
  W  = X*X;
  Bd = ((W + b2)*W + b1)*W + b0;
  Cn = (W*a2 + a1)*W + a0;
  Rz = W * divdp_acoshdp_i(Cn,Bd);
  Sa = X + X*Rz;
  Cn = N;
  Da = (Cn*c2 + Sa) + Cn*c1;

  if (x > DBL_MAX) {
    Da = max;
  }

  return (Da);
} /* End of logdp_acoshdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(sqrtdp_acoshdp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the square root of the argument a. This function   */
/* has been modified to return the argument x when a = x*x. The argument a  */
/* is equal to x * x + 1, if a = x* x then +1 is irrelevant or x * x        */
/* overflows and the real sqrt of a is lost.                                */
/* ======================================================================== */

static inline double sqrtdp_acoshdp_i (double a, double x)
{

  const double  half  =  0.5;
  const double  OneP5 =  1.5;
  double  x0, x1, x2, res;

  x0 = _rsqrdp (a);

  x1 = x0     * (OneP5 - (a*x0*x0*half));
  x2 = x1     * (OneP5 - (a*x1*x1*half));
  res = a * x2 * (OneP5 - (a*x2*x2*half));

  if(a == x* x){
    res = x;
  }

  if(a == 0){
    res = 0.0;
  }

  return (res);
} /* sqrtdp_acoshdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(acoshdp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the value of acosh(x), which is estimated as       */
/* follows:                                                                 */
/*   res = ln( x + sqrt (x^2 + 1))                                          */
/* where x is the input, sqrt stands for the square root function, and      */
/* res is the calculated value for acosh(x). This equation is modified as   */
/* follows to avoid overflow for a large x;                                 */
/*     ln([x + sqrt(x^2 + 1)]/2] + ln(2)                                    */
/* ======================================================================== */

static inline double acoshdp_i(double x)
{
  const double ln2   =  0.6931471805599453;
  const double half  =  0.5;

  double res, sqrt,  x2, x_abs, temp;

  x_abs = _fabs(x);
  x2 = x * x;                                       /* x^2 */

  sqrt = sqrtdp_acoshdp_i(x2 - 1, x_abs);           /* sqrt(x^2 + 1) */

  /* prevent overflow for large x, log(2x) where x > max/2 */
  temp = x_abs* half + sqrt* half;                  /* x+sqrt(x^2 + 1)*/

  res = logdp_acoshdp_i(temp) + ln2;                /* ln((x + sqrt(x^2 + 1))/2) +ln(2) */

  /* function not defined for number in this range */
  if(x <= 1 - DBL_EPSILON){
    res = _lltod(0x7FFFFFFFFFFFFFFF);               /* NaN */
  }

  return res;
}

#endif  /* ACOSHDP_I_ */

/* ======================================================================= */
/*  End of file: acoshdp_i.h                                               */
/* ======================================================================= */

