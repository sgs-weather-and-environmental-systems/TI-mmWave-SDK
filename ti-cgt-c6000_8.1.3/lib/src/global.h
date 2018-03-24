/****************************************************************************/
/*  global.h           v8.1.3                                               */
/*                                                                          */
/* Copyright (c) 2007-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/

/***********************************************************************
 *The purpose of this head file is to provide macros and definitions 
 *that are "global" to all targets and formats.
 ***********************************************************************/

#ifndef __GLOBAL_FLOAT_CONFIG__
#define __GLOBAL_FLOAT_CONFIG__

/*All implementations are written abstractly to use the REAL data type
 *These macros are used to convert all references to REAL_XXXX to
 *PRECISION##_XXXX.  
 */

#define XGET_PRECISION(BPREAL, X) PRECISION ## BPREAL ## _ ## X
#define GET_PRECISION(BPREAL, X) XGET_PRECISION(BPREAL, X)


#define REAL_RADIX	GET_PRECISION(BPREAL, RADIX)
#define REAL_MANTISSA	GET_PRECISION(BPREAL, MANTISSA)
#define REAL_EMAX	GET_PRECISION(BPREAL, EMAX)
#define REAL_EMIN	GET_PRECISION(BPREAL, EMIN)
#define REAL_DIGITS	GET_PRECISION(BPREAL, DIGITS)
#define REAL_EXP_BITS	GET_PRECISION(BPREAL, EXP_BITS)
#define REAL_FRC_BITS	GET_PRECISION(BPREAL, FRC_BITS)
#define REAL_EXP_BIAS	GET_PRECISION(BPREAL, EXP_BIAS)
#define REAL_MOST_POS	GET_PRECISION(BPREAL, MOST_POS)
#define REAL_MOST_NEG	GET_PRECISION(BPREAL, MOST_NEG)
#define REAL_LEAST_POS	GET_PRECISION(BPREAL, LEAST_POS)
#define REAL_LEAST_NEG	GET_PRECISION(BPREAL, LEAST_NEG)
#define REAL_LEAST_POS_INVERTABLE	GET_PRECISION(BPREAL, LEAST_POS_INVERTABLE)
#define CNST_RADIX	GET_PRECISION(BPREAL, CNST_RADIX)
#define CNST_MANTISSA	GET_PRECISION(BPREAL, CNST_MANTISSA)
#define Ln_RADIX	GET_PRECISION(BPREAL, Ln_RADIX)
#define Sqrt_RADIX	GET_PRECISION(BPREAL, Sqrt_RADIX)
#define RADIX_to(x)	GET_PRECISION(BPREAL, RADIX_to(x))
#define RADIX_to_Hlf_MANTISSA_M2	GET_PRECISION(BPREAL, RADIX_to_Hlf_MANTISSA_M2)
#define RADIX_to_Hlf_MANTISSA_M1	GET_PRECISION(BPREAL, RADIX_to_Hlf_MANTISSA_M1)
#define RADIX_to_Hlf_MANTISSA	GET_PRECISION(BPREAL, RADIX_to_Hlf_MANTISSA)
#define One_Over_RADIX	GET_PRECISION(BPREAL, One_Over_RADIX)
#define RADIX_to_M_Hlf_MANTISSA	GET_PRECISION(BPREAL, RADIX_to_M_Hlf_MANTISSA)
#define RADIX_to_One_M_MANTISSA	GET_PRECISION(BPREAL, RADIX_to_One_M_MANTISSA)
#define RADIX_to_M_MANTISSA	GET_PRECISION(BPREAL, RADIX_to_M_MANTISSA)
#define RADIX_to_MANTISSA	GET_PRECISION(BPREAL, RADIX_to_MANTISSA)
#define RADIX_to_EMIN	GET_PRECISION(BPREAL, RADIX_to_EMIN)
#define RND_GLITCH	GET_PRECISION(BPREAL, RND_GLITCH)
#define RND_P_GLITCH	GET_PRECISION(BPREAL, RND_P_GLITCH)
#define RND_M_GLITCH	GET_PRECISION(BPREAL, RND_M_GLITCH)
#define RND_MAX_P1      GET_PRECISION(BPREAL, RND_MAX_P1)
#define RND_MIN         GET_PRECISION(BPREAL, RND_MIN)
#define RSQRT_Sz_Newtons	GET_PRECISION(BPREAL, RSQRT_Sz_Newtons)
#define SQRT_Sz_Newtons	GET_PRECISION(BPREAL, SQRT_Sz_Newtons)
#define SQRT_CW_Newtons	GET_PRECISION(BPREAL, SQRT_CW_Newtons)
#define EXP_Max	GET_PRECISION(BPREAL, EXP_Max)
#define EXP_Min GET_PRECISION(BPREAL, EXP_Min)
#define POW_Ovfl	GET_PRECISION(BPREAL, POW_Ovfl)
#define POW_Unfl	GET_PRECISION(BPREAL, POW_Unfl)
#define TANH_Max	GET_PRECISION(BPREAL, TANH_Max)

#define LEAN_DIGITS     GET_PRECISION(BPLEAN, DIGITS)
#define LEAN_EXP_BITS   GET_PRECISION(BPLEAN, EXP_BITS)
#define LEAN_FRC_BITS   GET_PRECISION(BPLEAN, FRC_BITS)
#define LEAN_EXP_BIAS   GET_PRECISION(BPLEAN, EXP_BIAS)

#define REAL_FIXED_POINT_MANTISSA_SIZE GET_PRECISION(BPREAL, FIXED_POINT_MANTISSA_SIZE)

/*realnum is a structure that is used to abstract the targets underlying
 *floating point structure so that functions like _addd and _mpyd can be
 *written in a general way and be compiled for any target.  Currently only
 *division uses it.
 *
 *The macros FLOAT_TO_REALNUM and DOUBLE_TO_REALNUM are target specific and
 *are included in the specific targets header file i.e. ld3.h
 */

#if REAL_FIXED_POINT_MANTISSA_SIZE == 32
typedef uint32_t mantissa_t;
#define REAL_FIXED_POINT_ONE 0x80000000
#elif REAL_FIXED_POINT_MANTISSA_SIZE == 64
typedef uint64_t mantissa_t;
#define REAL_FIXED_POINT_ONE 0x8000000000000000
#else
#error FIXED_POINT_MANTISSA_SIZE IS TOO LARGE
#endif

#define REAL_IS_NAN(x)  (x.exp == (REAL_EMAX + 1)               && \
                         x.mantissa != REAL_FIXED_POINT_ONE)
#define REAL_IS_INF(x)  (x.exp == (REAL_EMAX + 1)               && \
                         x.mantissa == REAL_FIXED_POINT_ONE)
#define REAL_IS_ZERO(x) (x.exp == (uint32_t)(REAL_EMIN - 1)     && \
                         x.mantissa == REAL_FIXED_POINT_ONE)

typedef struct{
  uint_least8_t sign;
  uint32_t exp;
  mantissa_t mantissa;
}realnum;


#define REAL_TO_REALNUM(x, y) \
do{ \
if (sizeof(REAL) == sizeof(float)) \
FLOAT_TO_REALNUM(x, y); \
else \
DOUBLE_TO_REALNUM(x, y); \
}while(0)

#define REALNUM_TO_REAL(x, y) \
do{ \
if (sizeof(REAL) == sizeof(float)) \
REALNUM_TO_FLOAT(x, y); \
else \
REALNUM_TO_DOUBLE(x, y); \
}while(0)

#endif
