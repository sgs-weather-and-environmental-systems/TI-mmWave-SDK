/****************************************************************************/
/*  addf_i.h         v8.1.3                                                 */
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

/* REAL _addf(REAL left, REAL right) */

#if IEEE_Hardware
  return left + right;
#else
#if (BPREAL == BPbigint)
   bigint lft , rgt ; /* int register versions of left,right REAL params   */
   bigint lfrc, rfrc; /* fraction of left/dest operand and right operand   */
   int    lexp, rexp; /* exponent of left/dest operand and right operand   */
   bigint sign;
   int    expdif;

   bigint guard_bit = 0, round_bit = 0, sticky_bit = 0;

   /*------------------------------------------------------------------------*/
   /* Transfer the left,right bits to lft,rgt.                               */
   /* REALasINT may force left and right to memory if dumb compiler.         */
   /* This is OK since they won't be needed again except for unusual cases.  */
   /* lft,rgt will hopefully wind up in integer registers.                   */
   /*------------------------------------------------------------------------*/
   REALasINT(lft,left); 
   REALasINT(rgt,right);

   /*------------------------------------------------------------------------*/
   /* Unpack fraction and exponent, ignoring signs for now.                  */
   /* Reinsert hidden bit or re-normalize fraction as appropriate.           */
   /*------------------------------------------------------------------------*/

   if ((lfrc = lft & ~MINUS) == 0) {        /* signed 0 + 0 rules */
      rfrc = rgt;
      if ((rfrc & ~MINUS) == 0) rfrc &= lft;
      return_INTasREAL(rfrc);
   }
   if ((rfrc = rgt & ~MINUS) == 0) return left;

#ifdef Support_INFNAN
   if (lfrc >= REAL_INFNAN) {       /*  lft == +/- INFINITY or NaN */
      if (lfrc < rfrc) return right;  /* return larger NaN */
      if ((lfrc == REAL_INFNAN) &&
          (lft ^ rgt) == MINUS) { /* INF-INF */
          lft = REAL_NAN;
          return_INTasREAL(lft);
      }
      return left;
   }
   if (rfrc >= REAL_INFNAN) return right;        /* INF or NaN */
#endif

   if (lexp = lfrc >> REAL_FRC_MSBs)
      lfrc = (lfrc & REAL_FRC_MASK) + REAL_HIDDEN_BIT; /*insert hidden bit*/
   else
#ifdef Support_DENORM
      RENORMF(lfrc, lexp);
#else
      return right;
#endif

   if (rexp = rfrc >> REAL_FRC_MSBs)
      rfrc = (rfrc & REAL_FRC_MASK) + REAL_HIDDEN_BIT; /*insert hidden bit*/
   else
#ifdef Support_DENORM
      RENORMF(rfrc, rexp);
#else
      return left;
#endif

   /*---------------------------------------------------------------------*/
   /* This algorithm relies on the fact that the left operand has	  */
   /* equal or large magnitude (exponent only).  Swap if necessary.	  */
   /*---------------------------------------------------------------------*/
   if (rexp > lexp) 
   {
       long temp_frc = lfrc;
       int temp_exp = lexp;
       lfrc = rfrc;
       rfrc = temp_frc;
       lexp = rexp;
       rexp = temp_exp;
       sign = rgt & MINUS;
   }
   else sign = lft & MINUS;

   /*------------------------------------------------------------------------*/
   /* If the signs of the inputs differ, negate the right significand.	     */
   /*------------------------------------------------------------------------*/
   if ((lft ^ rgt) & MINUS) rfrc = -rfrc; 

   /*------------------------------------------------------------------------*/
   /* Shift the rfrc to align radix point and add, keeping track of guard    */
   /* and rounding bits.						     */
   /*------------------------------------------------------------------------*/
   expdif = lexp - rexp;

   if (expdif < REAL_FRC_BITS+2)
   {
     lfrc += (rfrc >> expdif);

       if (expdif == 0) guard_bit = round_bit = sticky_bit = 0;
       else
       {
	   guard_bit = (rfrc << (BPbigint-expdif)) & MINUS;
	   if (expdif == 1) round_bit = sticky_bit = 0;
	   else
	   {
	       round_bit = (rfrc << (BPbigint-expdif+1)) & MINUS;
	       if (expdif == 2) sticky_bit = 0;
	       else sticky_bit = (rfrc << (BPbigint-expdif+2));
	   }
       }
   }

   /*------------------------------------------------------------------------*/
   /* If the result is negative, negate the significand.  This will only     */
   /* happen if (lexp-rexp==0).						     */
   /*------------------------------------------------------------------------*/
   if (lfrc <= 0 && !guard_bit) 
   {
      if (lfrc == 0) return_INTasREAL(lfrc);
      lfrc = -lfrc; sign ^= MINUS;
   }

   /*------------------------------------------------------------------------*/
   /* Round and normalize the result                                         */
   /*------------------------------------------------------------------------*/
   if (lfrc >= (REAL_HIDDEN_BIT << 1))
   {
       sticky_bit = guard_bit | round_bit | sticky_bit;
       round_bit = lfrc & 0x1;
       lfrc >>= 1;
       lexp++;
   }
   else if (lfrc < REAL_HIDDEN_BIT)
   {
       int count;
 
       for (count = 0; lfrc < REAL_HIDDEN_BIT; count++)
       {
	   lfrc <<= 1;
	   lexp--;
	   if (count == 0) lfrc |= (guard_bit != 0);
	   if (count == 1) round_bit = sticky_bit = 0;
       }
   }
   else 
   {
       sticky_bit = round_bit | sticky_bit;
       round_bit = guard_bit;
   }

   /*------------------------------------------------------------------------*/
   /* Round to even.  If the rounding bits are exactly one-half, round	     */
   /* the final result bit to an even number (this may round down).	     */
   /*------------------------------------------------------------------------*/
   if (round_bit && ((lfrc & 0x1) || sticky_bit)) lfrc += 1;

   /*------------------------------------------------------------------------*/
   /* Re-normalize if necessary                                              */
   /*------------------------------------------------------------------------*/
   if (lfrc >= (REAL_HIDDEN_BIT << 1))
   {
       lfrc >>= 1;
       lexp++;
   }

   /*------------------------------------------------------------------------*/
   /* Check for overflow and underflow                                       */
   /*------------------------------------------------------------------------*/
   if (lexp <= 0) { /* underflow? */
#ifdef Support_DENORM
      /* un-round, denormalize, and re-round the fraction */
      if (lexp > -REAL_FRC_BITS) lfrc = ((lfrc -1) >> (1-lexp)) +1;
      else lfrc = 0;  /* no significant bits remain */
#else
      lfrc = 0;  /* no significant bits remain */
#endif
      lexp = 0;
   }
   else if (lexp >= REAL_EXP_INFNAN) { /* overflow? */
#if defined(Support_INFNAN) || !defined(Support_SATURATION)
      lexp = REAL_EXP_INFNAN; lfrc = 0;
#else
      lexp = REAL_EXP_INFNAN-1; lfrc = (biguns)-1;
#endif
   }

   /*------------------------------------------------------------------------*/
   /* Assemble result and return                                             */
   /*------------------------------------------------------------------------*/
   lfrc = (lfrc & REAL_FRC_MASK) + (((bigint)lexp) << REAL_FRC_MSBs) +sign;

   return_INTasREAL(lfrc);

#elif (BPREAL == (BPbigint*2))
   /*------------------------------------------------------------------------*/
   /* The IEEE format is exactly as big as two int's (or two long's)         */
   /*------------------------------------------------------------------------*/

   bigint lexp, rexp;
   REAL_2UNS lft, rgt;
   bigint lsign, rsign;

   /*------------------------------------------------------------------------*/
   /* Unpack fraction and exponent, ignoring signs for now.                  */
   /* Reinsert hidden bit or re-normalize fraction as appropriate.           */
   /*------------------------------------------------------------------------*/
   lft.r = left; 
   rgt.r = right;

   lsign = lft.u.msh & MINUS;
   rsign = rgt.u.msh & MINUS;

   lexp = lft.u.msh - lsign;       /* remove sign bit but don't shift yet */
   rexp = rgt.u.msh - rsign;

#ifdef Support_INFNAN
   if (lexp >= REAL_INFNAN) {                       /* left is INF or NAN */
      if ((lexp < rexp) ||
          (lexp == rexp && lft.u.lsh < rgt.u.lsh))
         return right;                              /* return larger NaN */
        
      if ((lexp == REAL_INFNAN) &&
          ((lft.u.msh ^ rgt.u.msh) == MINUS) &&
          (lft.u.lsh == 0)) {                       /* INF-INF */
         lft.u.msh = REAL_NAN;
         return lft.r;
      }
      return left;
   }
   if (rexp >= REAL_INFNAN) return right;           /* INFINITY or NaN */
#endif

   lft.u.msh = (lexp & REAL_FRC_MASK) + REAL_HIDDEN_BIT; /* - exp + hidden */
   if (!(lexp >>= (REAL_FRC_MSBs))) {
#ifdef Support_DENORM
      lft.u.msh -= REAL_HIDDEN_BIT;
      if ((lexp -= RENORMF(&lft)) > 0) {
         if ((rexp == 0) && (rgt.u.lsh == 0)) {         /* signed 0+0 rules */
            lft.r = left; rgt.u.msh &= lft.u.msh;
         }
         return rgt.r;
      }
#else
      if (rexp == 0) {                                  /* signed 0+0 rules */
         lft.r = left; rgt.u.msh &= lft.u.msh;
      }
      return rgt.r;
#endif
   }
   if (lsign) NEG2sCOMP(lft);                       /* make 2's complement */


   rgt.u.msh = (rexp & REAL_FRC_MASK) + REAL_HIDDEN_BIT; /* - exp + hidden */
   if (!(rexp >>= (REAL_FRC_MSBs))) {
   #ifdef Support_DENORM
      rgt.u.msh -= REAL_HIDDEN_BIT;
      if ((rexp -= RENORMF(&rgt)) > 0) return left;
   #else
      return left;
   #endif
   }
   if (rsign) NEG2sCOMP(rgt);                       /* make 2's complement */
 
   lexp = FRCADDF(lexp, &lft, rexp, &rgt);

   /*-----------------------------------------------------------------------*/
   /* Check for overflow and underflow                                      */
   /*-----------------------------------------------------------------------*/
   if ((lexp -= 1) < 0) {    /* underflow */
   #ifdef Support_DENORM
      /* Should really un-round, denormalize, and re-round the fraction, */
      /* but it's a lot of pain and probably not worth it.               */
      if (lexp > -REAL_FRC_BITS-1) {
         bigint sign = lft.u.msh & MINUS; lft.u.msh &= MASK(REAL_FRC_MSBs+1);
         RIGHT_SHIFT(lft, -lexp);
         lft.u.msh |= sign;
      } else
   #endif
         lft.r = 0.0;   /* no significant bits remain */
   }
   else if (lexp >= REAL_EXP_INFNAN-1) {        /* overflow */
   #if defined(Support_INFNAN) || !defined(Support_SATURATION)
      lft.u.msh = (lft.u.msh & MINUS) + REAL_INFNAN;
      lft.u.lsh = 0;
   #else
      /* saturate at REAL_MOST_POS or REAL_MOST_NEG, as appropriate */
      lft.u.msh = (lft.u.msh & MINUS) + REAL_MOSTPOS;
      lft.u.lsh = (biguns)-1;
   #endif
   }
   else lft.u.msh += (((bigint)lexp) << REAL_FRC_MSBs);

   return lft.r;
#else
    #error "ADDF not yet implemented for this size REAL"
#endif
#endif
