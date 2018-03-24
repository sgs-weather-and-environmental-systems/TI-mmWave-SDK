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
/* asinhdp_v.c - Double precision floating point inverse hyperbolic sine   */
/*              optimized inlined C implementation (w/ intrinsics)         */
/*              vector version                                             */
/* ======================================================================= */

#include "asinhdp.h"

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(asinhdp_v, ".text:optvec");
#endif

/* ======================================================================== */
/* The type of calculation for asinh(x) depends on the value of x:          */
/*   x_abs > 0.3, res =  ln( x + sqrt (x^2 + 1))                            */
/*   This equation is modified as follows to avoid overflow for a large x;  */
/*     ln([x + sqrt(x^2 + 1)]/2] + ln(2)                                    */
/*                                                                          */
/*   x_abs <= 0.3, res = polynomial estimation (input x)                    */
/* where x_abs is the absolute value of the input and res is the calculated */
/* value for asinh(x)                                                       */
/*                                                                          */
/* The polynomial used is as follows:                                       */
/*   pol = x + c2 x^3 + c4 x^5 + c6 x^7 + c8 x^8                            */
/* where x is the input, c2 through c8 are the corresponding coefficients   */
/* for the polynomial, and pol is the result of the polynomial. This is     */
/* repeated for every value in the array.                                   */
/* ======================================================================== */

void asinhdp_v (const double a[restrict], double output[restrict], int size)
{
  const double ln2         =  0.693147180559945;   /* ln(2) */
  const double pol_bound   =  0.3;
  const double half        =  0.5;

  /* Coefficients for the polynomial */
  const double c2          = -0.166666692592182;
  const double c4          =  0.0750025275672600;
  const double c6          = -0.0447153024904795;
  const double c8          =  0.0310957306366509;
  const double c10         = -0.0229667510576129;

  double res, sqrt_, pol;
  double x, x2, x4, x_abs;
  double temp, sign;
  int i;

  /* Using integers instead of booleans to appease MISRA */
  t_bool cond, not_cond;


  /* Vector loop */
  for (i = 0; i < size; i++) {
    x= a[i];
    sign = 1.0;
    x_abs = _fabs(x);

    /* Conditions used to determine the range of the value x */
    cond = (x_abs > pol_bound) ? TRUE : FALSE;
    not_cond = (cond == FALSE) ? TRUE : FALSE;

    if(x < 0.0){
         sign = -sign;
    }

    /* calculate the powers of x */
    x2 = x * x;
    x4 = x2 * x2;

    /* polynomial to estimate asinh(x) for small inputs*/
    pol = (x2 * c2) + (x4 * (c4 + (x2 * c6) + (x4 * (c8 + (x2 * c10)))));
    res = (pol * x) + x;


    /* asinh(x) estimation for values greater than 0.5 */
    /* prevent overflow for large x, log(2x) where x > max/2 */
    sqrt_ = sqrtdp_asinhdp_i(x2 + 1.0, x_abs);           /* sqrt(x^2 + 1) */
    temp = (x_abs * half) + (sqrt_ * half);                /* (x+sqrt(x^2 + 1))/2 */
    temp = logdp_asinhdp_i(temp) + ln2;               /* ln((x + sqrt(x^2 + 1))/2) +ln(2) */

    /* set the value of the result depending on the input value */
    res = ((double)cond * temp * sign) + ((double)not_cond * res);

    output[i] = res;
  }
}

/* ======================================================================== */
/*  End of file: asinhdp_v.c                                                */
/* ======================================================================== */
