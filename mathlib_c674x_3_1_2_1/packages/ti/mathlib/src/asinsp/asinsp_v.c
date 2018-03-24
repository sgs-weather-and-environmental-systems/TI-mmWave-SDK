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
/* asinsp_v.c - Single precision floating point arc_sine                   */
/*              optimized inlined C implementation (w/ intrinsics)         */
/*              vector version                                             */
/* ======================================================================= */

#include "asinsp.h"


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(asinsp_v, ".text:optvec");
#endif

/* ====================================================================== */
/* The type of calculation for asin(x) depends on the value of x:         */
/*                                                                        */
/* for x_abs <= 1/sqrt(2), res = pol_est_asinsp_i (input x)               */
/* for x_abs > 1/sqrt(2),  res = pi/2 - pol_est_asinsp_i (input z)        */
/*                         z = sqrt(1 - x^2)                              */
/* where x_abs is the absolute value of the input, a is calculated as     */
/* shown above and it's used as an input for the polynomial, and res is   */
/* the value for asin(x). This is repeated for every value in the array.  */
/* ====================================================================== */

void asinsp_v (const float a[restrict], float output[restrict], int size)
{
  const float pi2   = 1.570796327f;             /* pi/2 */
  const float rsqr2 = 0.7071067811f;            /* 1/sqrt(2) */
  float res, x_abs, x, z, temp, sign, pol1, pol2;

  int i;  
  for (i = 0; i < size; i ++) {
    x = a[i];
    sign = 1.0f;
    x_abs = _fabsf(x);

    pol1 = pol_est_asinsp_i(x_abs);             /* |x| <= 1/sqrt(2) */

    /* assume |x| > 1/sqrt(2) */
    temp = 1.0f - (x_abs * x_abs);
    z = sqrtsp_asinsp_i(temp);                  /* z= sqrt(1 - x^2) */
    pol2 = pol_est_asinsp_i(z);
    res = pi2 - pol2;

    /* set the result to the right answer */
    if(x_abs <= rsqr2){                          /* |x| <= 1/sqrt(2) */
      res = pol1;
    }

    if(x < 0.0f){
      sign = -sign;                             /* sign var */
    }
    /* x out of domain */
    if(x_abs > 1.0f){
      res = _itof(0x7FFFFFFFu);                  /* NaN */
    }

    output[i] = res*sign;                     /* restore sign for quadrant 3 & 4*/
  }
}

/* ======================================================================== */
/*  End of file: asinsp_v.c                                                 */
/* ======================================================================== */
