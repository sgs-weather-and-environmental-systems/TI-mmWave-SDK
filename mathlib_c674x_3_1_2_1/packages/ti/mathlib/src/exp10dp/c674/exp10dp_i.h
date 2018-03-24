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
/* exp10dp_i.h - double precision floating point exp base 10               */
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef EXP10DP_I_H_
#define EXP10DP_I_H_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divdpMod_exp10dpi, ".text:optci");
#endif

/* Pull in inline for divdp */
static inline double divdpMod_exp10dpi (double a, double b) {
  cmn_DIVDP (a,b);
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(exp10dp_i, ".text:optci");
#endif

static inline double exp10dp_i (double a)
{
  double Halfe  =   0.5;
  double Maxe   =   1.7976931348623157e+308;
  double LnMaxe = 308.254715974092;
  double LnMine =-307.652655568589;
  double a0e    =   0.249999999999999993;
  double a1e    =   0.694360001511792852e-2;
  double a2e    =   0.165203300268279130e-4;
  double b0e    =   0.5;
  double b1e    =   0.555538666969001188e-1;
  double b2e    =   0.495862884905441294e-3; 
  double c1e    =   0.693359375;              /* 355/512 */
  double C2e    =  -2.1219444005469058277e-4;
  double L2e    =   1.4426950408889634074;    /* log (base 2) of e */ 
  double Ln10   =   2.302585092994046;
  double Ye, Xe, We, Re, Se, Be, Ce, De;
  int    Ne, upper; 

  Ye = Ln10*a;
  Ce = Ye*L2e;                                /* base e --> base 2 argument */           
  Ne = _dpint (Ce);                           /* get unbiased exponent as int */
  Se = Ne;                                    /* double(int N) */ 
  Xe = (Ye - Se*c1e) - Se*C2e;                /*  range reduction  */ 
  We = Xe*Xe;
  Be = ( b2e*We + b1e)*We + b0e;              /* denominator  */
  De = ((a2e*We + a1e)*We + a0e)*Xe;          /* numerator  */
  Re = Halfe + divdpMod_exp10dpi (De,(Be-De));
  
  upper = 1024 + Ne;
  upper = _extu (upper,20,0); 
  Se    = _itod (upper,0x00000000);
	Ce    = Re*Se;                              /* scale by power of 2  */ 

  /* > LnMax returns MAX  */
  if (a > LnMaxe) {
    Ce = (Maxe);  
  }
  
  /* > LnMin returns 0 */
  if (a < LnMine) {
    Ce = 0.0;  
  }
  
  return (Ce);
}

#endif /* EXP10DP_I_H_ */

/* ======================================================================== */
/*  End of file: exp10dp_i.h                                                */
/* ======================================================================== */
