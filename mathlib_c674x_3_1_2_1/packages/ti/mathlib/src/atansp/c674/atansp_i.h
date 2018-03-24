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
/* atansp_i.h - single precision floating point arctangent                 */
/*              optimized inlined C Implementation (w/ Intrinsics)         */
/* ======================================================================= */

#ifndef ATANSP_I_
#define ATANSP_I_ 1

#include <ti/mathlib/src/common/common.h>

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(divspMod_atanspi, ".text:optci");
#endif

/* Pull in inline for divsp */
static inline float divspMod_atanspi (float a, float b) {
  cmn_DIVSP (b,a);
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(atan2f_sr1i_atanspi, ".text:optci");
#endif

static inline float atan2f_sr1i_atanspi (float g1, int s, int an)
{
	float coef;
	float	g2;
	float	g4;
	float	g6;
	float	g8;
	float	g10;
	float	g12;
	float	pol;
	float	tmp1;
	float	tmp2;
  float pih =  1.57079632679f;
	float	c1  =  0.00230158202f;
	float	c2  = -0.01394551000f;
	float	c3  =  0.03937087815f;
	float	c4  = -0.07235669163f;
	float	c5  =  0.10521499322f;
	float	c6  = -0.14175076797f;
	float	c7  =  0.19989300877f;
	float	c8  = -0.33332930041f;
	
	/* get coef based on the flags */
	coef = pih;
  if (!s) {
    coef = 0;
  }
  
  if (an) {
    coef = -coef;
  }
 
	/* calculate polynomial */
	g2  = g1*g1;
	g4  = g2*g2;
	g6  = g2*g4;
	g8  = g4*g4;
	g10 = g6*g4;
	g12 = g8*g4;

	tmp1 = ((c5 * g8) + (c6 * g6)) + ((c7 * g4) + (c8 * g2));
	tmp2 = (((c1 * g4 + c2 * g2) + c3) * g12) + (c4 * g10);

	pol = tmp1  + tmp2;
	pol = pol*g1 + g1;

	return (s ? (coef - pol) : (coef + pol));
}

#ifndef __cplusplus         /* FOR PROTECTION PURPOSE - C++ NOT SUPPORTED. */
#pragma CODE_SECTION(atansp_i, ".text:optci");
#endif

static inline float atansp_i (float a)
{
	float	g;
	float	res;
	float	temp = 1;
	int		an;
	int		s = 0;

	an = (a < 0) ? 1 : 0;   /* flag for a negative */

	/* swap a and b before calling division sub routine if a > b */
	if (_fabsf(a) > 1.0f) {
		temp = a;
		a    = 1;
		s    = 1;             /* swap flag */
	}

	g = divspMod_atanspi (temp, a);
	
	/* do polynomial estimation */
	res = atan2f_sr1i_atanspi (g, s, an);

  if (a == 0.0f) {
    res = 0.0f;
  }
	
	return (res);
}

#endif /* ATANSP_I_ */

/* ======================================================================== */
/*  End of file: atansp_i.h                                                 */
/* ======================================================================== */
