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
/* sinhsp_v.c - single precision floating point hyperbolic sine            */
/*              optimized inlined C implementation (w/ intrinsics)         */
/*              vector version                                             */
/* ======================================================================= */

#include "sinhsp.h"


#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(sinhsp_v, ".text:optvec");
#endif

/* ====================================================================== */
/* The type of calculation for sinh(x) depends on the value of x:         */
/*                                                                        */
/* for x_abs <= 1,          res = pol_est_sinhsp_i (input x)              */
/*                                e^-|x| is negligible                    */
/* for 1 < x_abs,           res = (e^x - e^-x)/2,                         */
/*                                e^x = 2 * expsp_sinhsp_i (input x)      */
/* where x_abs is the absolute value of the input, sign has a value of 1  */
/* or -1 depending on the sign of the input, and res is the value         */
/* for sinh(x). This is repeated for every value in the array.            */
/* ====================================================================== */

void sinhsp_v (const float a[restrict], float output[restrict], int size)
{
  const float half   = 0.5f;
  const float Max    = 89.41598629f;
  const float pol_bound = 1.0f;                     /* polynomial boundary */
  const float bound  = 16.0f;
  float res, recip_exp, exp_, x, x_abs;
  float sign, temp, exp_two;
  int i;  

  /* Vector loop */
  for (i = 0; i < size; i++) {
    x = a[i];
    sign = 1.0f;

    x_abs = _fabsf(x);

    if(x < 0.0f){
        sign = -sign;                           /* sign variable */
    }

    /* estimate sinh for |x| <= 1 */
    temp = pol_est_sinhsp_i(x_abs);

    /* estimate cosh for |x| > 16, e^-|x| is negligible */
    exp_ = expsp_sinhsp_i(x_abs);                /* e^x/2 */

    /* assume sinh for 1 < |x| <= 16 */
    exp_two = exp_ * 2.0f;
    recip_exp = recipsp_sinhsp_i(exp_two);      /* e^-x */
    res = (exp_two - recip_exp) * half;             /* (e^x - e^-x)/2 */

    /* set the result to the right answer */
    if(x_abs <= pol_bound){                     /* |x| <= 1 */
      res = temp;
    }
    if(x_abs > bound){                          /* |x| > 16 */
      res= exp_;
    }

    if (x_abs > Max) {                          /* reached max */
      res =  _itof(0x7F800000u);
    }
    output[i] = res * sign;
  }
}

/* ======================================================================== */
/*  End of file: sinhsp_v.c                                                 */
/* ======================================================================== */
