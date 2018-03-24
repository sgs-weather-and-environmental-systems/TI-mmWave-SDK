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
/* powdp_i.h - double precision floating point raise to a power                */
/*              optimized inlined C implementation (w/ intrinsics)             */
/* =========================================================================== */

#ifndef POWDP_I_
#define POWDP_I_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divdpMod_powdpi, ".text:optci");
#endif

/* Pull in inline for divdp */
static inline double divdpMod_powdpi (double a, double b) {
  cmn_DIVDP (a,b);
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(logdpMod_powdpi, ".text:optci");
#endif

static inline double logdpMod_powdpi (double a)
{
  double Half   =  0.5;
  double MAXe   =  1.7976931348623157e+308;
  double srHalf =  0.70710678118654752440;      /* sqrt(0.5) */
  double a0     = -0.64124943423745581147e+2;
  double a1     =  0.16383943563021534222e+2;
  double a2     = -0.78956112887491257267e+0;
  double b0     = -0.76949932108494879777e+3;
  double b1     =  0.31203222091924532844e+3;
  double b2     = -0.35667977739034646171e+2;   /* Note b3 = 1.0 */
  double c1     =  0.693359375;       		      /*  355/512      */
  double c2     = -2.121944400546905827679e-4 ;
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

  X  = divdpMod_powdpi(zn,zd);
  W  = X*X;
  Bd = ((W + b2)*W + b1)*W + b0;
  Cn = (W*a2 + a1)*W + a0;
  Rz = W * divdpMod_powdpi(Cn,Bd);
  Sa = X + X*Rz;
  Cn = N;
  Da = (Cn*c2 + Sa) + Cn*c1;
        
  if (Y > MAXe) {
    Da = 709.782712893384;
  }
  
  return (Da);
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(expdpMod_powdpi, ".text:optci");
#endif

static inline double expdpMod_powdpi (double a)
{
  double Halfe  =   0.5;
  double Maxe   =   1.7976931348623157e+308;
  double LnMaxe = 709.78271289338;
  double LnMine =-708.3964185322641;
  double a0e    =   0.249999999999999993;
  double a1e    =   0.694360001511792852e-2;
  double a2e    =   0.165203300268279130e-4;
  double b0e    =   0.5;
  double b1e    =   0.555538666969001188e-1;
  double b2e    =   0.495862884905441294e-3; 
  double c1e    =   0.693359375;                 /* 355/512 */
  double C2e    =  -2.1219444005469058277e-4;
  double L2e    =   1.4426950408889634074;       /* log (base 2) of e */ 
  double Ye, Xe, We, Re, Se, Be, Ce, De;
  int    Ne, upper; 

  Ye = a;
  Ce = Ye*L2e;                                /* base e --> base 2 argument */           
  Ne = _dpint (Ce);                           /* get unbiased exponent as int */
  Se = Ne;                                    /* double(int N) */ 
  Xe = (Ye - Se*c1e) - Se*C2e;                /*  range reduction  */ 
  We = Xe*Xe;
  Be = ( b2e*We + b1e)*We + b0e;              /* denominator  */
  De = ((a2e*We + a1e)*We + a0e)*Xe;          /* numerator  */
  Re = Halfe + divdpMod_powdpi (De,(Be-De));

  upper = 1024 + Ne;
  upper = _extu (upper,20,0); 
  Se    = _itod (upper,0x00000000);
	Ce    = Re*Se;                              /* scale by power of 2  */ 

  /* > LnMax returns MAX */
  if (a > LnMaxe) {
    Ce = (Maxe);  
  }
  
  /* > LnMin returns 0 */
  if (a < LnMine) {
    Ce = 0.0;  
  }
  
  return (Ce);
}
	
#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(powdp_i, ".text:optci");
#endif
        
static inline double powdp_i (double a, double b)
{
  double  arg, W, X2;
  int     y;
  int     Sign = 1;
		
  y = _dpint (b);

  if ((a < 0) && (b == (double)y)) {
    if (y & 1) {
      Sign = -1;	
    }
  }	
		
  arg = _fabs (a);
  W   = b    * logdpMod_powdpi (arg);
  if (arg == 1.0) {
    W = 0.0;
  }

  X2  = Sign * expdpMod_powdpi (W);

  if ((a < 0.0) && (b != (double)y)) {
    X2 = _lltod (0x7fffffffffffffff); 
  }

  if ((a == 0.0) && (b < 0.0)) {
    X2 = _lltod (0x7ff0000000000000);
  }

  return (X2); 
}

#endif

/* ======================================================================== */
/*  End of file: powdp_i.h                                                  */
/* ======================================================================== */
