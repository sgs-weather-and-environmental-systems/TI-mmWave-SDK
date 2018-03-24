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
/* atan2dp_i.h - double precision floating point arctangent two arguement      */
/*              optimized inlined C implementation (w/ intrinsics)             */
/*                                                                             */
/* =========================================================================== */


#ifndef ATAN2DP_I_H_
#define ATAN2DP_I_H_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divdpMod_atan2dpi, ".text:optci");
#endif

/* Pull in inline for divdp */
static inline double divdpMod_atan2dpi (double a, double b) {
  cmn_DIVDP (a,b);
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(atandpMod_atan2dpi, ".text:optci");
#endif

/* Copy of inline for atandp */
static inline double atandpMod_atan2dpi (double a)
{
  double  MIN   =  1.490116119384e-8; 
  double  p0    = -1.3688768894191926929e+1; 
  double  p1    = -2.0505855195861651981e+1; 
  double  p2    = -8.4946240351320683534e+0; 
  double  p3    = -8.3758299368150059274e-1; 
  double  q0    =  4.1066306682575781263e+1; 
  double  q1    =  8.6157349597130242515e+1; 
  double  q2    =  5.9578436142597344465e+1; 
  double  q3    =  1.5024001160028576121e+1; 
  double  sqrt3 =  1.7320508075688772935e+0; 
  double  iims3 =  2.6794919243112270647e-1; 
  double  F, G, H, R, RN, RD;                 
  int     N, Sign;                            
                                              
  Sign = 0;                                   
  F    = a;                                   
  N    = 0;                                   
                                              
  if (F < 0.0) {                              
    F    = -F;                                
    Sign = 1;                                 
  }                                           
                                              
  if (F > 1.0) {                              
    F = divdpMod_atan2dpi (1,F);                           
    N = 2;                                    
  }                                           
                                              
  if (F > iims3) {                            
    N = N + 1;                                
    F = divdpMod_atan2dpi ((F * sqrt3 - 1.0),(F + sqrt3)); 
  }                                           
                                              
  H = F;                                      
                                              
  if (H < 0.0) {                              
    H = -H;                                   
  }                                           
                                              
  if (H > MIN) {                              
    G  = H * H;                               
    RN = (((p3*G + p2)*G + p1)*G + p0)*G;     
    RD = (((G + q3)*G + q2)*G + q1)*G + q0;   
    R  = divdpMod_atan2dpi (RN,RD);                        
    F  = (F + F*R);                           
  }                                           
                                              
  if (N > 1) {                                
    F = -F;                                   
  }                                           
                                              
  H = F + ti_math_vTable[N];                               
                                              
  if (Sign == 1) {                            
    H = -H;                                   
  }                                           
                                              
  return (H);                                 
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(atan2dp_i, ".text:optci");
#endif

static inline double atan2dp_i (double a, double b)
{
  double HalfPI = 1.57079632679489661923;
  double PI     = 3.14159265358979323846;
  double Maxv   = 1.7976931348623157e+308;
  double X, Y, Z, W, res;

  Y = a;
  X = b;
  Z = divdpMod_atan2dpi (Y, X);
  W = atandpMod_atan2dpi (Z);
  res = W;

  if (X < 0.0) {
    res = PI + W;
    if (W > 0.0) {
      res = W - PI;
    }
  }
  
  if (X == 0.0f) {
    res = (Y > 0.0f ? HalfPI : -HalfPI); 
  }
  if (Y == 0.0f) {
    res = (X >= 0.0f ? 0 : PI);
  }
  if (Z > Maxv) {
    res = HalfPI;
  }
  if (Z < -Maxv) {
    res = -HalfPI;
  }

  return (res);
}

#endif /* ATAN2DP_I_H_ */

/* ======================================================================== */
/*  End of file: atan2dp_i.h                                                */
/* ======================================================================== */
