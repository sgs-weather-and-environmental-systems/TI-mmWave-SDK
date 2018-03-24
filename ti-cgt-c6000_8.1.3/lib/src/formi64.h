/****************************************************************************/
/*  formi64.h        v8.1.3                                                 */
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

#ifndef __formi64__
#define __formi64__



#define PRECISION64_RADIX     2  /* radix (r)                                 */
#define PRECISION64_MANTISSA 53  /* radix digits in mantissa                  */
#define PRECISION64_EMAX   1023  /* max e for which +/- f has MANTISSA digits */
#define PRECISION64_EMIN (-1022) /* min e for which +/- f has MANTISSA digits */
#define PRECISION64_DIGITS   15  /* FLRF(PRECISION64_MANTISSA-1)*Ln_RADIX/Ln_10)     */

#define PRECISION64_FIXED_POINT_MANTISSA_SIZE 64
                             
#define Round_To_Even

#define IEEE /* don't define "IEEE" at all if not ieee format */


#define PRECISION64_EXP_BITS 11   /* bits in unsigned_exp_field                    */
#define PRECISION64_FRC_BITS 52   /* bits in fraction_field                        */
#define PRECISION64_EXP_BIAS 1023 /* exponent = unsigned_exp_field - PRECISION64_EXP_BIAS */

#if BPLEAN==0 /* no next-smaller PRECISION64 */
   #undef LEAN_DIGITS
   #undef LEAN_EXP_BITS
   #undef LEAN_FRC_BITS
   #undef LEAN_EXP_BIAS
#elif BPLEAN==32 /* shape of next-smaller PRECISION64 (for grow/slim routines) */

   #define LEAN_DIGITS 6
   #define LEAN_EXP_BITS 8   /* bits in unsigned_exp_field                */
   #define LEAN_FRC_BITS 23  /* bits in fraction_field                    */
   #define LEAN_EXP_BIAS 127 /* exponent=unsigned_exp_field-LEAN_EXP_BIAS */

#else
   #error "LEAN_* not yet defined for this size LEAN"
#endif

#define PRECISION64_MOST_POS  CNST( 1.7976931348623157e+308)
#define PRECISION64_MOST_NEG  CNST(-1.7976931348623157e+308)

#ifdef Support_DENORM
   #define PRECISION64_LEAST_POS CNST( 4.9406564584124654e-324) /* denormalized */
   #define PRECISION64_LEAST_NEG CNST(-4.9406564584124654e-324) /* denormalized */
   #define PRECISION64_LEAST_POS_INVERTABLE_NOT_LEAST_POS 1
#else
   #define PRECISION64_LEAST_POS CNST( 2.225073858507201383e-308)
   #define PRECISION64_LEAST_NEG CNST(-2.225073858507201383e-308)
   #define PRECISION64_LEAST_POS_INVERTABLE_NOT_LEAST_POS 0
#endif

#define PRECISION64_LEAST_POS_INVERTABLE CNST(2.225073858507201383e-308)
             /* usually (-EMIN<EMAX) ? RADIX**(EMIN-1) : 1/MOST_POS */


#define PRECISION64_CNST_RADIX                    CNST( 2.0) /* FLTIF(PRECISION64_RADIX   )*/
#define PRECISION64_CNST_MANTISSA                 CNST(53.0) /* FLTIF(PRECISION64_MANTISSA)*/

#define PRECISON64_Ln_RADIX                 Ln_2   /* ln(RADIX)  */
#define PRECISION64_Sqrt_RADIX               Sqrt_2 /* sqrt(RADIX)*/

#define PRECISION64_RADIX_to(x)              SCLF(ONE,x) /* RADIX**x, x an integer       */

#define PRECISION64_RADIX_to_Hlf_MANTISSA_M1 CNST(33554432.0) /* RADIX**((MANTISSA/2)-1)  */
#define PRECISION64_RADIX_to_Hlf_MANTISSA_M2 CNST(16777216.0) /* RADIX**((MANTISSA/2)-2)  */
#define PRECISION64_RADIX_to_Hlf_MANTISSA    CNST(67108864.0) /* RADIX**( MANTISSA/2   )  */
#define PRECISION64_RADIX_to_MANTISSA        CNST(9007199254740992.0) /* RADIX**MANTISSA */

#define PRECISION64_One_Over_RADIX          CNST(0.5)                       /* RDX**(-1    )*/
#define PRECISION64_RADIX_to_M_Hlf_MANTISSA CNST(1.490116119384765625e-08)	/* RDX**(-MNT/2)*/
#define PRECISION64_RADIX_to_One_M_MANTISSA CNST(2.220446049250313081e-16)	/* RDX**(1-MNT )*/
#define PRECISION64_RADIX_to_M_MANTISSA     CNST(1.110223024625156540e-16)	/* RDX**( -MNT )*/
#define PRECISION64_RADIX_to_EMIN           CNST(4.450147717014402766e-308)	/* RDX**(EMIN ) */

#ifndef BPint
   #error "target props .h file must be included before PRECISION64 format .h file"
#endif

#define PRECISION64_RND_GLITCH ((PRECISION64_MANTISSA+1) <= BPint)

#if (PRECISION64_RND_GLITCH)
   #define PRECISION64_RND_MAX_P1 PRECISION64_RND_P_GLITCH
   #define PRECISION64_RND_MIN    PRECISION64_RND_M_GLITCH
#else
   #define PRECISION64_RND_MAX_P1 INT_MOST_POS_P1
   #define PRECISION64_RND_MIN    INT_MOST_NEG
#endif

#define PRECISION64_RND_P_GLITCH RADIX_to_MANTISSA
#define PRECISION64_RND_M_GLITCH CNST(-9007199254740991.0) /* -(RADIX**MANTISSA-1) */

#define PRECISION64_SQRT_Sz_Newtons  3 /* (int)FLOOR(LOG2((MANTISSA-1)/5))  */
#define PRECISION64_SQRT_CW_Newtons  4 /* (int)CEIL (LOG2( MANTISSA     ))-2*/

#define PRECISION64_EXP_Max CNST(7.097827128933838594e+02)  /* ln(MOST_POS )*(1-RDX**-MNT) */
#define PRECISION64_EXP_Min CNST(-7.077032713517040747e+02)	/* ln(RDX**EMIN)*(1-RDX**-MNT) */

#define PRECISION64_POW_Ovfl CNST( 11355.0) /* FLOOR(16*ln(MOST_POS)-1)   */
#define PRECISION64_POW_Unfl CNST(-11323.0) /* FLOOR(16*ln(RADIX**EMIN)+1)*/

#define PRECISION64_TANH_Max CNST(1.906154746539849754e+01) /* (Ln_2+(MNT+1)*Ln_RADIX)/2   */

#endif
