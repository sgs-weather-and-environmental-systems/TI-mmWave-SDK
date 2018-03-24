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
/* sinhdp_i.h - Double precision floating point hyperbolic sine            */
/*              optimized inlined C implementation (w/ intrinsics)         */
/* ======================================================================= */

#ifndef SINHDP_I_H_
#define SINHDP_I_H_ 1

#include <ti/mathlib/src/common/common.h>
#include <c6x.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divdp_sinhdp_i, ".text:optci");
#endif

/* ======================================================================= */
/* This function returns the division result of two real floating-point    */
/* values, a and b. The return value is a/b.                               */
/* ======================================================================= */

static inline double divdp_sinhdp_i (double a, double b)
{
  double  X;
  double  TWO   =  2.0;

  X = _rcpdp(b);
  X = X * (TWO - b*X);
  X = X * (TWO - b*X);
  X = X * (TWO - b*X);
  X = X * a;

  if (a == 0.0) {
    X = 0.0;
  }

  return (X);
} /* divdp_sinhdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(expdp_sinhdp_i, ".text:optci");
#endif

static inline double expdp_sinhdp_i (double x)
{
  const double Half  =   0.5;
  const double a0    =   0.249999999999999993;
  const double a1    =   0.694360001511792852e-2;
  const double a2    =   0.165203300268279130e-4;
  const double b0    =   0.5;
  const double b1    =   0.555538666969001188e-1;
  const double b2    =   0.495862884905441294e-3;
  const double c1    =   0.693359375;                 /* 355/512 */
  const double c2    =  -2.1219444005469058277e-4;
  const double L2    =   1.4426950408889634074;       /* log (base 2) of e */
  double Y, Z, W, R, S, B, C, D;
  int    N, upper;

  Y = x;
  C = Y*L2;                                 /* base e --> base 2 argument */
  N = _dpint (C);                           /* get unbiased exponent as int */
  S = N;                                    /* double(int N) */
  Z = (Y - S*c1) - S*c2;                    /*  range reduction  */
  W = Z*Z;
  B = ( b2*W + b1)*W + b0;                  /* denominator  */
  D = ((a2*W + a1)*W + a0)*Z;               /* numerator  */
  R = Half + divdp_sinhdp_i (D,(B-D));

  /* ======================================================================= */
  /* upper is used to calculate the exponent. 1024 produces overflow for     */
  /* large numbers, 1022 corrects overflow and it is adjusted by a factor    */
  /* of 4 later (2^2).                                                       */
  /* ======================================================================= */

  upper = 1022 + N;

  upper = _extu (upper,20,0); 
  S     = _itod (upper,0x00000000);
  C     = R*S*4;                            /* scale by power of 2  */

  return (C);
} /* expdp_sinhdp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(pol_est_sinhdp_i, ".text:optci");
#endif

/* ======================================================================== */
/* Polynomial calculation to estimate the hyperbolic sine funtion.          */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7 + c8 x^9 + c10 x^11 + c12 x^13      */
/* where x is the input, c2 through c12 are the corresponding coefficients  */
/* to the polynomial, and pol is the result of the polynomial. This         */
/* polynomial only covers inputs in the range [-1, 1].                      */
/* ======================================================================== */

static inline double pol_est_sinhdp_i (double x)
{
  const double c12  = 1.60590438368216e-10;
  const double c10  = 2.50521083854417e-8;
  const double c8   = 2.75573192239859e-6;
  const double c6   = 0.000198412698412698;
  const double c4   = 0.00833333333333333;
  const double c2   = 0.166666666666667;

  double x2, x4, x6;
  double pol, tmp1, tmp2;

  /* calculate the power of x */
  x2 = x * x;
  x4 = x2 * x2;
  x6 = x4 * x2;

  /* ====================================================================== */
  /* In order to reduce the number of multiplications x is factored out of  */
  /* the polynomial and multiplied by later.                                */
  /*   tmp1 =  c2 x^2 + c4 x^4 + c6 x^6 + c8 x^8                            */
  /*   tmp2 =  c10 x^10 + c12 x^12                                          */
  /* ====================================================================== */

  tmp1 = ((c2 * x2) + (c4 * x4)) + (x6 * (c6 + c8 * x2));
  tmp2 = x6 * (c10 * x4 + c12 * x6);

  pol = (tmp1 + tmp2) * x + x;

  return pol;
} /* pol_est_sinhdp_i */


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(sinhdp_i, ".text:optci");
#endif

/* ====================================================================== */
/* The type of calculation for sinh(x) depends on the value of x:         */
/*                                                                        */
/* for x_abs <= 1,          res = pol_est_sinhdp_i (input x)              */
/* for x_abs > 25,          res = sign * expsp_sinhdp_i (input temp),     */
/*                               temp = x_abs - log_e(2)                  */
/* for 1 < x_abs <= 25,     res = (e^x - e^-x)/2,                         */
/*                                e^x = expsp_sinhsp_i (input x)          */
/* where x_abs is the absolute value of the input, sign has a value of 1  */
/* or -1 depending on the sign of the input, and res is the value         */
/* for sinh(x).                                                           */
/* ====================================================================== */

static inline double sinhdp_i (double x)
{
  const double half   =   0.5;
  const double bound  =   25.0;
  const double ln2    =   0.693147180559945;   /*  log_e(2) */
  const double Max    =   710.475860073944;
  const double lowMin =   1;                   /* polynomial boundary */
  double sign   =   1;
  double res, temp, x_abs, exp;

  x_abs = _fabs(x);

  if(x < 0){
    sign = -sign;                              /* sign variable */
  }

  /* e^-|x| is negligible */
  if(x_abs > bound){                           /* |x| > 25 */
    temp  = x_abs - ln2;
    res = expdp_sinhdp_i(temp);                /* res = sign*e^(|x|- log_e(2)) */
  }
  else if(x_abs <= lowMin){                    /* |x| < 1 */
    res = pol_est_sinhdp_i(x_abs);
  }
  else{                                        /* 1 < |x| <= 25 */
    exp = expdp_sinhdp_i(x_abs);                   /* e^x */
    temp = divdp_sinhdp_i(1,exp);              /* e^-x */
    res = (exp - temp) * half;                 /* (e^x - e^-x)/2 */
  }

  if (x_abs > Max) {                           /* reached max */
      res = _lltod(0x7FF0000000000000);
    }

  return res * sign;
} /* sinhdp_i */

#endif /* SINHDP_I_H_ */

/* ======================================================================== */
/*  End of file: sinhdp_i.h                                                 */
/* ======================================================================== */

