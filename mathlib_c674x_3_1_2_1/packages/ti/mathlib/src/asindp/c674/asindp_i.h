/* ======================================================================== *
 * MATHLIB -- TI doubleing-Point Math Function Library                       *
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

/* =========================================================================== */
/* asindp_i.h - Double precision doubleing point arc_sine                      */
/*               optimized inlined C implementation (w/ intrinsics)            */
/* =========================================================================== */

#ifndef ASINDP_I_H_
#define ASINDP_I_H_ 1

#include <ti/mathlib/src/common/common.h>


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(sqrtdp_asindp_i, ".text:optci");
#endif

/* =========================================================================== */
/* The sqrtsp function returns the square root of a real floating-point value  */
/* =========================================================================== */

static inline double sqrtdp_asindp_i (double x)
{
  const double  half  =  0.5;
  const double  OneP5 =  1.5;
  double  y, y0, y1, y2;

  y0 = _rsqrdp (x);                            /* y0 = 1/sqrt(x) */
  y1 = y0     * (OneP5 - (x*y0*y0*half));
  y2 = y1     * (OneP5 - (x*y1*y1*half));
  y = x * y2 * (OneP5 - (x*y2*y2*half));

  if (x <= 0.0) {
    y = 0.0;
  }

  return (y);
} /* sqrtdp_asindp_i */

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(asindp_i, ".text:optci");
#endif

/* =========================================================================== */
/* The type of calculation for asin(x) depends on the value of x:              */
/*   x_abs <= 0.5,               res = pol_est_asindp_i (input x)              */
/*                                                                             */
/*   1 > x_abs > sqrt(3)/2,      res = pi/2 - pol_est_asindp_i (input a)       */
/*                                 a = sqrt(1 - x^2)                           */
/*                                                                             */
/*   sqrt(3)/2 =>x_abs> 1/sqrt(2), res = pi/4 +(1/2)*pol_est_asindp_i (input a)*/
/*                                   a = 2x^2 - 1                              */
/*                                                                             */
/*   1/sqrt(2) => x_abs > 0.5,   res = 1/2 (pi/2 - pol_est_asindp_i (input a)  */
/*                                 a = 1 - 2x^2                                */
/* where x_abs is the absolute value of the input, a is defined for each       */
/* interval as shown above and it's used as an input for the polynomial, and   */
/* res is the value for asin(x).                                               */
/* =========================================================================== */

static inline double asindp_i (double x)
{
  const double pi2      =  1.5707963267948966192;  /* pi/2 */
  const double pi4      =  0.78539816339744830962; /* pi/4 */
  const double rsqr2    =  0.70710678118654752440; /* 1/sqrt(2) */
  const double sqr3div2 =  0.86602540378443864876; /* sqrt(3)/2 */
  const double half     =  0.5;
  double       sign     =  1.0;
  double res, x_abs, x2, temp, a;

  x_abs = _fabs(x);
  x2 = x * x;

  if(x_abs > rsqr2){                         /* |x| > 1/sqrt(2) */
    if(x_abs > sqr3div2){
      temp = 1 - x2;
      a = sqrtdp_asindp_i(temp);             /* a = sqrt(1 - x^2) */
      temp = pol_est_asindp_i(a);
      res = pi2 - temp;                      /* pi/6 < |res| < pi */
    }
    else{
      a = 2 * x2 -1;                         /* a = 2x^2 - 1 */
      temp = pol_est_asindp_i(a);
      res = pi4 + half * temp;               /* pi/4 < |res| < pi/6 */
    }
  }
  else{                                      /* |x| <= 1/sqrt(2) */
    if(x_abs > half){
      a = 1 - 2*(x2);                        /* a = 1 - 2x^2 */
      temp = pol_est_asindp_i(a);
      res = half * (pi2 - temp);             /* pi/3 < |res| < pi/4 */
    }
    else{
      res = pol_est_asindp_i(x_abs);         /* 0 < |res| < pi/3 */
    }
  }

  if(x < 0){
    sign = -sign;                            /* sign var */
  }
  res = res * sign;                          /* restore sign for quadrant 3 & 4*/

  return (res);
}

#endif /* ASINDP_I_H_ */

/* ======================================================================== */
/*  End of file: asindp_i.h                                                 */
/* ======================================================================== */
