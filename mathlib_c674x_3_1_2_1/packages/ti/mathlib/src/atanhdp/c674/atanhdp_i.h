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
/* atanhdp_i.h - Double precision floating point inverse hyperbolic tangent*/
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef ATANHDP_I_
#define ATANHDP_I_ 1

#include <ti/mathlib/src/common/common.h>
#include <float.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divdp_atanhdp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the division result of two real floating-point    */
/* values, a and b. The return value is a/b.                               */
/* ======================================================================= */

static inline double divdp_atanhdp_i (double a, double b)
{
  double  y, x1, x2, x3;
  double  two   =  2.0;

  x1 = _rcpdp(b);
  x1 = x1 * (two - b*x1);
  x2 = x1 * (two - b*x1);
  x3 = x2 * (two - b*x2);
  y = x3 * a;

  if (a == 0.0) {
    y = 0.0;
  }

  return (y);
} /* End of divdp_atanhdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(logdp_atanhdp_i, ".text:optci");
#endif

/* ======================================================================== */
/* This function returns the logarithm value of a real floating-point       */
/* argument x. The return value is the base e logarithmic value of x.       */
/* ======================================================================== */

static inline double logdp_atanhdp_i (double x)
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
  double W, X, Y, Z;
  double zn, zd;
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

  if (Z > srHalf) { 
    zn = (Z - Half) - Half; 
    zd = Z*Half + Half; 
  }
  else { 
    zn = Z - Half; 
    zd = zn*Half + Half; 
    N  = N - 1; 
  }

  X  = divdp_atanhdp_i(zn,zd);
  W  = X*X;
  Bd = ((W + b2)*W + b1)*W + b0;
  Cn = (W*a2 + a1)*W + a0;
  Rz = W * divdp_atanhdp_i(Cn,Bd);
  Sa = X + X*Rz;
  Cn = N;
  Da = (Cn*c2 + Sa) + Cn*c1;

  return (Da);
} /* End of logdp_atanhdp_i */


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(atanhdp_i, ".text:optci");
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
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7                                     */
/* where x is the input, c2 through c6 are the corresponding coefficients   */
/* for the polynomial, and pol is the result of the polynomial.             */
/* ======================================================================== */

static inline double atanhdp_i(double x)
{
  const double pol_bound   =  0.1;
  const double half        =  0.5;
  const double limit       =  1.0;
  double sign        =  1;

  /* Coefficients for the polynomial */
  const double c2          =  0.333333357308678;
  const double c4          =  0.199986699941523;
  const double c6          =  0.145059552096944;

  double res, pol, temp1, temp2, div;
  double x2, x4, x6, x_abs;

  x_abs = _fabs(x);

  if(x < 0){
    sign = -sign;
  }

  /* set the value of the result depending on the input value */
  if(x_abs <= pol_bound){                   /* |x| <= 0.1 */
    /* powers of x */
    x2 = x * x;
    x4 = x2 * x2;
    x6 = x4 * x2;

    /* polynomial to estimate atanh(x) for small inputs*/
    pol = ((x2 * c2) + (x4 * c4)) + (x6 * c6) ;
    pol = pol * x_abs + x_abs;
    res = pol;
  }
  else {                                    /* |x| > 0.1 */
    /* atanh(x) calculation for values greater than 0.1 */
    temp1 = 1 + x_abs;
    temp2 = 1 - x_abs;

    div = divdp_atanhdp_i(temp1,temp2);
    res = logdp_atanhdp_i(div);             /*  ln((1 + x)/(1 - x)) */
    res = res * half;                       /* divide by 2*/
  }

  if(x_abs > limit){
    res = _lltod(0x7FFFFFFFFFFFFFFF);       /* NaN */
  }

  if(x_abs == limit){
    res = _lltod(0x7FF0000000000000);      /* INF */
  }

  return (res * sign);
}

#endif /* ATANHDP_I_ */

/* ======================================================================= */
/*  End of file: atanhdp_i.h                                               */
/* ======================================================================= */

