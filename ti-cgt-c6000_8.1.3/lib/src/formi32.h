/****************************************************************************/
/*  formi32.h        v8.1.3                                                 */
/*                                                                          */
/* Copyright (c) 1997-2017 Texas Instruments Incorporated                   */
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

#ifndef __formi32__
#define __formi32__



#define PRECISION32_RADIX     2  /* radix (r)                                        */
#define PRECISION32_MANTISSA 24  /* radix digits in mantissa                         */
#define PRECISION32_EMAX    127  /* max e for which +/- f has MANTISSA digits        */
#define PRECISION32_EMIN  (-126) /* min e for which +/- f has MANTISSA digits        */
#define PRECISION32_DIGITS    6  /* FLRF(REAL_MANTISSA-1)*Ln_RADIX/Ln_10)            */
#define PRECISION32_FIXED_POINT_MANTISSA_SIZE 32

#define Round_To_Even

#define IEEE /* don't define "IEEE" at all if not ieee format */


#define PRECISION32_EXP_BITS 8   /* bits in unsigned_exp_field                    */
#define PRECISION32_FRC_BITS 23  /* bits in fraction_field                        */
#define PRECISION32_EXP_BIAS 127 /* exponent = unsigned_exp_field - REAL_EXP_BIAS */


#if BPLEAN==0 /* no next-smaller REAL? */
   #undef LEAN_DIGITS
   #undef LEAN_EXP_BITS
   #undef LEAN_FRC_BITS
   #undef LEAN_EXP_BIAS
#else
   #error "LEAN_* not yet defined for this size LEAN"
#endif

#define PRECISION32_MOST_POS  CNST( 3.402823466E+38)
#define PRECISION32_MOST_NEG  CNST(-3.402823466E+38)

#ifdef Support_DENORM
   #define PRECISION32_LEAST_POS CNST( 1.401298464E-45)  
   #define PRECISION32_LEAST_NEG CNST(-1.401298464E-45)  
   #define LEAST_POS_INVERTABLE_NOT_LEAST_POS 1
#else
   #define PRECISION32_LEAST_POS CNST( 1.175494351e-38)
   #define PRECISION32_LEAST_NEG CNST(-1.175494351e-38)
   #define LEAST_POS_INVERTABLE_NOT_LEAST_POS 0
#endif

#define PRECISION32_LEAST_POS_INVERTABLE CNST(1.1754943508e-38)
		/* usually (-EMIN<EMAX) ? RADIX**(EMIN-1) : 1/MOST_POS */


#define PRECISION32_CNST_RADIX                    CNST( 2.0) /* FLTIF(PRECISION32_RADIX   )*/
#define PRECISION32_CNST_MANTISSA                 CNST(24.0) /* FLTIF(PRECISION32_MANTISSA)*/

#define PRECISION32_CNSTLn_RADIX                 Ln_2   /* ln(RADIX)  */
#define PRECISION32_Sqrt_RADIX               Sqrt_2 /* sqrt(RADIX)*/

#define PRECISION32_RADIX_to(x)              SCLF(ONE,x) /* RADIX**x, x an integer       */

#define PRECISION32_RADIX_to_Hlf_MANTISSA_M2 CNST(1024.0)     /*    RADIX**((MANTISSA/2)-2)*/
#define PRECISION32_RADIX_to_Hlf_MANTISSA_M1 CNST(2048.0) 	  /*    RADIX**((MANTISSA/2)-1)*/
#define PRECISION32_RADIX_to_Hlf_MANTISSA    CNST(4096.0) 	  /*    RADIX**( MANTISSA/2)   */
#define PRECISION32_RADIX_to_MANTISSA        CNST(16777216.0) /* RADIX**( MANTISSA     )   */

#define PRECISION32_One_Over_RADIX          CNST(0.5)               /* RADIX**(-1         )*/
#define PRECISION32_RADIX_to_M_Hlf_MANTISSA CNST(2.44140625e-4)	/* RADIX**(-MANTISSA/2) */
#define PRECISION32_RADIX_to_One_M_MANTISSA CNST(1.1920928955E-7)	/* RADIX**(1-MANTISSA ) */
#define PRECISION32_RADIX_to_M_MANTISSA     CNST(5.9604644753E-8)	/* RADIX**( -MANTISSA ) */
#define PRECISION32_RADIX_to_EMIN           CNST(2.35098870164E-38)	/* RADIX**(EMIN       ) */

#ifndef BPint
   #error "target props .h file must be included before PRECISION32 format .h file"
#endif

#define PRECISION32_RND_GLITCH ((PRECISION32_MANTISSA+1) <= BPint)
#define PRECISION32_RND_P_GLITCH CNST( 16777216.0) /*\_RNDF glitch points. see fltsyntx.h */
#define PRECISION32_RND_M_GLITCH CNST(-16777215.0) /*/ if no round-to-even dont need these*/
#if (PRECISION32_RND_GLITCH)
   #define PRECISION32_RND_MAX_P1 PRECISION32_RND_P_GLITCH
   #define PRECISION32_RND_MIN    PRECISION32_RND_M_GLITCH
#else
   #define PRECISION32_RND_MAX_P1 INT_MOST_POS_P1
   #define PRECISION32_RND_MIN    INT_MOST_NEG
#endif

#define PRECISION32_RSQRT_Sz_Newtons 3 /* (int)FLOOR(LOG2((MANTISSA-1)/5))+1*/
#define PRECISION32_SQRT_Sz_Newtons  2 /* (int)FLOOR(LOG2((MANTISSA-1)/5))  */
#define PRECISION32_SQRT_CW_Newtons  3 /* (int)CEIL (LOG2( MANTISSA     ))-2*/

#define PRECISION32_EXP_Max CNST( 88.72283382) /* ln(MOST_POS   )*(1-RADIX**-MANTISSA)   */
#define PRECISION32_EXP_Min CNST(-86.64339241) /* ln(RADIX**EMIN)*(1-RADIX**-MANTISSA)   */

#define PRECISION32_POW_Ovfl CNST( 1418.0) /* FLOOR(16*ln(MOST_POS   )-1)*/
#define PRECISION32_POW_Unfl CNST(-1386.0) /* FLOOR(16*ln(RADIX**EMIN)+1)*/

#define PRECISION32_TANH_Max CNST(9.01091334725) /* (Ln_2+(MANTISSA+1)*Ln_RADIX)/2        */

#endif
