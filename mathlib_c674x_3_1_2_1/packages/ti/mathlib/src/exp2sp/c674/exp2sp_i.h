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
/* exp2sp_i.h - single precision floating point exp base 2                 */
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef EXP2SP_I_H_
#define EXP2SP_I_H_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divspMod_exp2spi, ".text:optci");
#endif

/* Pull in inline for divsp */
static inline float divspMod_exp2spi (float a, float b) {
  cmn_DIVSP (a,b);
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(exp2sp_i, ".text:optci");
#endif

static inline float exp2sp_i (float a)
{
  float Zeroe  =    0.0;
  float Halfe  =    0.5;
  float epse   =    9.313225746e-10;        /* [2^-29] / 2  */
  float LnMine = -126;
  float MAXe   =    3.40282347e+38;
  float LnMaxe =  128;
  float a0e    =    2.499999995e-1;
  float a1e    =    4.1602886268e-3;
  float b0e    =    0.5;
  float b1e    =    4.9987178778e-2;
  float CC1E   =    0.693359375;            /* 355/512 */
  float CC2E   =   -2.12194440055e-4;       /* lne(2) - 355/512 */
  float Ln2E   =    1.442695040889;         /* ln(base 2) of e */
  float k2e    =    0.69314718056;          /* log (base e) of  2 */

  float Ye, Xe, We, Re, Se, Be, Ce, De;
  int   Ne; 

  Ye = k2e*a;

  /* < epsilon returns unity */
  if (fabsf(Ye) < epse) {
    Ye = 0;
  }
        
  Ce = Ye*Ln2E;                             /* base e --> base 2 argument */           
  Ne =_spint(Ce);                           /* get unbiased exponent as int */
  Se = Ne;                                  /* float(int N) */
  Xe = (Ye - Se*CC1E) - Se*CC2E;            /* range reduction  */                                      
  We = Xe*Xe;
  Be = b1e*We + b0e;                        /* denominator  */
  De = (a1e*We + a0e)*Xe;                   /* numerator  */  

  Re = Halfe + divspMod_exp2spi (De,Be-De);       
  Se = _itof (_extu(Ne+128,23,0));
  Ce = Re*Se;                               /* scale by power of 2  */   

  /* < LnMin returns 0 */
  if (a < LnMine) {
    Ce = Zeroe; 
  }

  /* > LnMax returns MAX */   
  if (a > LnMaxe) {
    Ce = MAXe;
  }

  return Ce;
}

#endif

/* ======================================================================== */
/*  End of file: exp2sp_i.h                                                 */
/* ======================================================================== */



  
        
        
        
