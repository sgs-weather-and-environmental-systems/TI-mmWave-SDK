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
/* logsp_i.h - single precision floating point log                         */
/*              optimized inlined C implementation (w/ intrinsics)         */
/* ======================================================================= */

#ifndef LOGSP_I_
#define LOGSP_I_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(logsp_i, ".text:optci");
#endif

static inline float logsp_i (float a)
{
  double  ln2  =  0.693147180559945;
  float   c1   = -0.2302894f;
  float   c2   =  0.1908169f;
  float   c3   = -0.2505905f;
  float   c4   =  0.3333164f;
  float   c5   = -0.5000002f;
  float   MAXe =  3.402823466E+38;
  float   pol, r1, r2, r3, r4, res;
  double  dr, frcpax, rcp, T;
  int     N, T_index;

  /* r = x * frcpa(x) -1 */
  rcp = _rcpdp((double) a);
  frcpax = _itod(_clr(_hi(rcp),0,16), 0);
  dr = frcpax * (double) a  - 1.0; 

  /* Polynomial p(r) that approximates ln(1+r) - r */
  r1 = (float) dr;
  r2 = r1*r1;
  r3 = r1*r2;
  r4 = r2*r2; 

  pol = c5*r2 + ((c4*r3) + ((c2*r1 + c3) + c1*r2)*r4);

  /* Reconstruction: result = T + r + p(r) */
  N       = _extu(_hi(frcpax),  1, 21) - 1023;
  T_index = _extu(_hi(frcpax), 12, 29);
  T       = ti_math_logtable[T_index] - ln2 * (double) N;
  res     = (dr + T) + (pol);

  if (a <= 0.0f) {
    res = _itof(0xFF800000);
  }
  if (a > MAXe) {
    res = 709.7827f;
  }

  return (res);
}

#endif

/* ======================================================================== */
/*  End of file: logsp_i .h                                                 */
/* ======================================================================== */

