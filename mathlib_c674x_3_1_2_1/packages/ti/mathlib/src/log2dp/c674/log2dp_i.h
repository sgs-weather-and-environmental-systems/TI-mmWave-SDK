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
/* log2dp_i.h - double precision floating point log base 2                 */
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef LOG2DP_I_H_
#define LOG2DP_I_H_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divdpMod_log2dpi, ".text:optci");
#endif

/* Pull in inline for divdp */
static inline double divdpMod_log2dpi (double a, double b) {
  cmn_DIVDP (a,b);
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(log2dp_i, ".text:optci");
#endif

static inline double log2dp_i (double a)
{
  double Half   =    0.5;
  double MAXe   =    1.7976931348623157e+308;
  double srHalf =    0.70710678118654752440;      /* sqrt(0.5) */
  double MINe   =    2.2250738585072014e-308;
  double a0     =   -0.64124943423745581147e+2;
  double a1     =    0.16383943563021534222e+2;
  double a2     =   -0.78956112887491257267e+0;
  double b0     =   -0.76949932108494879777e+3;
  double b1     =    0.31203222091924532844e+3;
  double b2     =   -0.35667977739034646171e+2;   /* Note b3 = 1.0 */
  double c1     =    0.693359375;       		      /*  355/512      */
  double c2     =   -2.121944400546905827679e-4 ;
  double c2e    =    1.4426950408889634074;       /* log (base 2) of e */
  double W, X, Y, Z;
  double zn, zd;
  double Rz, Sa, Bd, Cn, Da;
  int    N, exp, upper; 

  /* get unbiased exponent */
  Y = a;
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

  X  = divdpMod_log2dpi(zn,zd);
  W  = X*X;
  Bd = ((W + b2)*W + b1)*W + b0;
  Cn = (W*a2 + a1)*W + a0;
  Rz = W * divdpMod_log2dpi(Cn,Bd);
  Sa = X + X*Rz;
  Cn = N;
  Da = (Cn*c2 + Sa) + Cn*c1;
  Da = c2e*Da;

  if (Y < MINe) {
    Da = -MAXe;
  }
  if (Y > MAXe) {
    Da = 1024;
  }
  
  return (Da);
}

#endif

/* ======================================================================== */
/*  End of file: log2dp_i.h                                                 */
/* ======================================================================== */

