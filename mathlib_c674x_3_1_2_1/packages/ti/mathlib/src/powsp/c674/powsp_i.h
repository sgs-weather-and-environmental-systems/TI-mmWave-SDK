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

/* =========================================================================== */
/* powsp_i.h - single precision floating point raise to a power                */
/*              optimized inlined C implementation (w/ intrinsics)             */
/* =========================================================================== */

#ifndef POWSP_I_
#define POWSP_I_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(logspMod_powspi, ".text:optci");
#endif

static inline float logspMod_powspi (float a)
{
  double  ln2  =  0.693147180559945;
  float   MAXe =  3.402823466E+38;
  float   c1   = -0.2302894f;
  float   c2   =  0.1908169f;
  float   c3   = -0.2505905f;
  float   c4   =  0.3333164f;
  float   c5   = -0.5000002f;
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

  pol  = c5*r2 + ((c4*r3) + ((c2*r1 + c3) + c1*r2)*r4);

  /* Reconstruction: result = T + r + p(r) */
  N       = _extu(_hi(frcpax),  1, 21) - 1023;
  T_index = _extu(_hi(frcpax), 12, 29);
  T       = ti_math_logtable[T_index] - ln2 * (double) N;
  res     = (dr + T) + (double) pol;
 
  if (a > MAXe) {
    res = 88.72283905313;
  }

  return (res);
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(expspMod_powspi, ".text:optci");
#endif

static inline float expspMod_powspi (float a)
{
  float log2_base_x16 =   1.442695041 * 16.0;
  float Halfe         =   0.5f;
  float LnMine        = -87.33654475;
  float LnMaxe        =  88.72283905;
  float Maxe          =   3.402823466E+38;
  float c0            =   0.1667361910f;
  float c1            =   0.4999999651f;
  float c2            =   0.9999998881f;
  float P1            =   0.04331970214844;
  float P2            =   1.99663646e-6;
  float pol, r, r2, r3, res;
  unsigned int Ttemp;
  int          J, K, N;
  double       dT;

  /* Get N such that |N - x*16/ln(2)| is minimized */
  N = (int) (a * log2_base_x16 + Halfe);
  if ((a * log2_base_x16) < -Halfe) {
    N--;
  }

  /* Argument reduction, r, and polynomial approximation pol(r) */
  r  = (a - P1 * (float) N) - P2 * (float) N;
  r2 = r * r;
  r3 = r * r2;
  
  pol = (r * c2) + ((r3 * c0) + (r2 * c1));
 
  /* Get index for ktable and jtable */
  K  = _extu (N, 28, 30);
  J  = N & 0x3;
  dT = ti_math_kTable[K] * ti_math_jTable[J];

  /* Scale exponent to adjust for 2^M */
  Ttemp = _hi(dT) + (unsigned int) ((N >> 4) << 20);
  dT    = _itod(Ttemp, _lo(dT));

  res = (float) (dT * (1.0f + pol));
  
  /* Early exit for small a */
  if (_extu(_ftoi(a), 1, 24) < 114) {
    res = (1.0f + a);               
  }

  /* < LnMin returns 0 */
  if (a < LnMine) {
    res = 0.0; 
  }

  /* > LnMax returns MAX */   
  if (a > LnMaxe) {
    res = Maxe;
  } 

  return(res);
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(powsp_i, ".text:optci");
#endif

static inline float powsp_i (float a, float b)
{
  float arg, W, X2;
  int   y, Sign = 1;
    
  y = _spint(b);

  if ((a < 0.0) & (b == (float)y)) {
    if (y & 1) {
      Sign = -1;  
    }
  } 
    
  arg = _fabsf(a);
  W   = b    * logspMod_powspi (arg);
  if (arg == 1.0) {
    W = 0.0;
  }
  X2  = Sign * expspMod_powspi (W);
  
  if ((a < 0.0) & (b != (float)y)) {
    X2 = _itof(0x7fffffff);
  }

  if (a == 0.0) {
    X2 = (b >= 0.0) ? 0.0 : _itof(0x7F800000);
  }

  if (b == 0.0) {
    X2 = 1.0;
  }

  return (X2); 
}

#endif

/* ======================================================================== */
/*  End of file: powsp_i.h                                                  */
/* ======================================================================== */
