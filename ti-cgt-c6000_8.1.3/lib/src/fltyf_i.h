/****************************************************************************/
/*  fltyf_i.h         v8.1.3                                                */
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

_CODE_ACCESS REAL FLTyF(UNSIGN x)
/*---------------------------------------------------------------------------*/
/* Convert UNSIGN (unsigned integer) to REAL (floating-pt).                  */
/*---------------------------------------------------------------------------*/

{
#if (BPSIGNED < BPbigint)
 #if (BPbigint == BPint)
   return FLTUF((biguns)x); /* grow and call FLTIF routine to do real work */
 #else
   return FLTULF((biguns)x); /* grow and call FLTULF routine to do real work */
 #endif

#elif (BPREAL == BPbigint)
   UNSIGN rfrc; int rexp; /* frc and exp of result */
   biguns rslt;

   if ((rfrc = x) == (UNSIGN)0) return ZERO;

 #ifdef COUNT_LZERO
  #if (BPSIGNED > BPbigint)
   if ((rexp = 
          COUNT_LZERO((biguns)(rfrc>>BPbigint))-(2*BPbigint-BPSIGNED)) ==
             (BPbigint-(2*BPbigint-BPSIGNED)))
      rexp += COUNT_LZERO((biguns)(rfrc));
  #else
   rexp = COUNT_LZERO(rfrc); /* no of consecutive 0 MSBs */
  #endif
   rfrc <<= rexp; rexp = REAL_EXP_BIAS + BPSIGNED -2 -rexp;
 #else
   rexp = REAL_EXP_BIAS + BPSIGNED -2;
   if (rfrc < (((UNSIGN)1)<<(BPSIGNED/2))) {  /* halfword shift */
      rfrc <<= BPSIGNED/2; rexp -= BPSIGNED/2;
   }
   if (rfrc < (((UNSIGN)1)<<(3*BPSIGNED/4))) { /* quarterword shift */
      rfrc <<= BPSIGNED/4; rexp -= BPSIGNED/4;
   }
   while (rfrc < (((UNSIGN)1) << BPSIGNED-1)) { rfrc <<= 1; rexp -= 1; }
 #endif

   /* align for mantissa field and round */
   #define SHIFT_COUNT (BPSIGNED-REAL_FRC_BITS-1)
   #if (SHIFT_COUNT >= 0)
      rslt = (biguns)(((rfrc >> (SHIFT_COUNT-1)) +1) >> 1);
   #else
      rslt = (biguns)(rfrc << -SHIFT_COUNT);
   #endif
   #undef SHIFT_COUNT

   /*------------------------------------------------------------------------*/
   /* The exponent field in rfrc now holds 1 or maybe 2 if the fraction      */
   /* rounded up.  ADD in rexp to simultaneously combine exponent/fraction   */
   /* and also increment the exponent by the appropriate amount.             */
   /*------------------------------------------------------------------------*/
   rslt += ((biguns)rexp) << REAL_FRC_BITS;

   return_UNSasREAL(rslt);

#elif (BPREAL == BPbigint*2) && (BPSIGNED <= BPbigint*2)
   UNSIGN rfrc; int rexp;	/* frac and exp of result */
   biguns rmsh;
   REAL_2UNS rslt;

   if ((rfrc = x) == 0) return ZERO;

 #ifdef COUNT_LZERO
  #if (BPSIGNED > BPbigint)
   if ((rexp = 
          COUNT_LZERO((biguns)(rfrc>>BPbigint))-(2*BPbigint-BPSIGNED)) ==
             (BPbigint-(2*BPbigint-BPSIGNED)))
      rexp += COUNT_LZERO((biguns)(rfrc));
  #else
   rexp = COUNT_LZERO(rfrc); /* no of consecutive 0 MSBs */
  #endif
   rfrc <<= rexp; rexp = REAL_EXP_BIAS + BPSIGNED -2 -rexp;
 #else
   rexp = REAL_EXP_BIAS+BPSIGNED-2;
   if (rfrc < (((UNSIGN)1)<<(BPSIGNED/2))) {   /* halfword shift */
       rfrc <<= BPSIGNED/2; rexp -= BPSIGNED/2;
   }
   if (rfrc < (((UNSIGN)1)<<(3*BPSIGNED/4))) { /* quarterword shift */
       rfrc <<= BPSIGNED/4; rexp -= BPSIGNED/4;
   }
   while (rfrc < (((UNSIGN)1)<<BPSIGNED-1)) { rfrc <<= 1; rexp -= 1; }
 #endif

   /* align for mantissa field and round */
   #define SHIFT_COUNT (REAL_FRC_MSBs+1-BPSIGNED+BPbigint)
   #if (SHIFT_COUNT >= 0)
      rslt.u.lsh = (biguns)(rfrc <<  SHIFT_COUNT);
   #else
      rslt.u.lsh = (biguns)(rfrc >> -SHIFT_COUNT);
   #endif
   #undef SHIFT_COUNT

   #define SHIFT_COUNT (BPSIGNED -REAL_FRC_MSBs -1)
   #if (SHIFT_COUNT >= 0)
      rmsh = (biguns)(rfrc >>  SHIFT_COUNT);
   #else
      rmsh = (biguns)(rfrc << -SHIFT_COUNT);
   #endif
   #undef SHIFT_COUNT

   /*------------------------------------------------------------------------*/
   /* The exponent field in rfrc now holds 1.                                */
   /* ADD in rexp to simultaneously combine fraction/exponent and also       */
   /* increment the exponent by the appropriate amount.                      */
   /*------------------------------------------------------------------------*/

   rmsh += ((biguns)rexp) << REAL_FRC_MSBs;

   rslt.u.msh = rmsh;

   return rslt.r;

#else
   #error "FLTyF not yet implemented for this combination UNSIGN/REAL"
#endif
} /* FLTyF */

