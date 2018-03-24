/****************************************************************************/
/*  mpyf_i.h         v8.1.3                                                 */
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

/* _CODE_ACCESS REAL MPYF(REAL left, REAL right) */

/* ----- WARNING WARNING WARNING WARNING ----- */

/* BLH modified this file 2003/11/18 to make FRCMPYF return a Q7.25
 * number when BPREAL == BPbigint.  When BPREAL == (BPbigint*2) (C6x
 * double), FRCMPYF still returns Q8.24 (I haven't updated it yet.) */

/*---------------------------------------------------------------------------*/
/* IEEE floating multiply.  return left * right                              */
#ifdef Support_INFNAN
/* Handles +/- INFINITY, NAN.                                                */
#else
/* Does *NOT* handle +/- INFINITY, NAN.                                      */
#endif
#ifdef Support_DENORM
/* Handles denormalized numbers.                                             */
#else
/* Does *NOT* handle denormalized numbers.                                   */
#endif
/*---------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------*/
/* See also:								     */
/*                                                                           */
/* Knuth D., "The Art of Computer Programming", Volume 2, ch 4.2	     */
/* ("Floating Point Arithmetic")					     */
/*                                                                           */
/* Goldberg D., "What Every Computer Scientist Should Know About	     */
/* Floating-Point Arithmetic", ACM Computing Surveys, Vol 23, No 1, March    */
/* 1991									     */
/*                                                                           */
/* Goldberg D., "Computer arithmetic."  Appendix A in "Computer		     */
/* Architecture: A Quantitative Approach, Patterson and Hennessy.	     */
/*                                                                           */
/* IEEE-754 "IEEE Standard for Binary Floating-Point Arithmetic"             */
/*---------------------------------------------------------------------------*/

#if IEEE_Hardware
   return left * right;
#else
#if (BPREAL == BPbigint)
   biguns lfrc, rfrc, pfrc;     /* fraction of left, right and product */
   int    lexp, rexp, pexp;	/* exponent of left, right and product */
   biguns sign;

   /*------------------------------------------------------------------------*/
   /* Unpack fraction and exponent, ignoring signs for now.                  */
   /* Reinsert hidden bit or re-normalize fraction as appropriate.           */
   /*------------------------------------------------------------------------*/
   pfrc = 0;
   REALasUNS(lfrc,  left); sign =         lfrc         ; lfrc &= ~MINUS;
   REALasUNS(rfrc, right); sign = (sign ^ rfrc) & MINUS; rfrc &= ~MINUS;

#ifdef Support_INFNAN
   if (lfrc >= REAL_INFNAN) {        /*  left is INFINITY or NaN */
      pfrc = lfrc;
      if (lfrc < rfrc       ) return right; /* return larger NaN */
      if (lfrc > REAL_INFNAN) return left ; /* return NaN        */
      if (rfrc == 0) pfrc = REAL_NAN;       /* INF * 0           */
      goto resign;
   }
   if (rfrc >= REAL_INFNAN) {        /* right is INFINITY or NaN */
      if (rfrc > REAL_INFNAN) return right; /* return NaN        */
      pfrc = rfrc;
      if (lfrc == 0) pfrc = REAL_NAN;       /* 0 * INF           */
      goto resign;
   }
#endif

   if (lexp = (int)(lfrc >> REAL_FRC_MSBs)) {
      if (!(lfrc &= REAL_FRC_MASK)) {
         /* left is a power of two */
	 if (!(rexp = (rfrc >> REAL_FRC_MSBs))) {
         #ifdef Support_DENORM
            if (rfrc) { RENORMF(rfrc, rexp); pfrc = rfrc; }
            else goto resign;
         #else
            goto resign;
         #endif
	 } else pfrc = ((rfrc & REAL_FRC_MASK)+REAL_HIDDEN_BIT);
         pexp = lexp + rexp;
         goto insert_exponent;
      }
      lfrc += REAL_HIDDEN_BIT; /* insert hidden bit */
   }
#ifdef Support_DENORM
   else if (lfrc) RENORMF(lfrc, lexp);
#endif
   else goto resign;

   if (rexp = (int)(rfrc >> REAL_FRC_MSBs)) {
      if (!(rfrc &= REAL_FRC_MASK)) {
         /* right is a power of two */
         pexp = lexp + rexp;
         pfrc = lfrc;
         goto insert_exponent;
      }
      rfrc += REAL_HIDDEN_BIT; /*insert hidden bit*/
   }
#ifdef Support_DENORM
   else if (rfrc) RENORMF(rfrc, rexp);
#endif
   else goto resign;

   /*------------------------------------------------------------------------*/
   /* Compute product exponent and fraction.                                 */
   /* Round and normalize product if needed.                                 */
   /*------------------------------------------------------------------------*/
   pexp = lexp + rexp;

   pfrc = FRCMPYF(lfrc, rfrc);

   /*------------------------------------------------------------------------*/
   /* Assuming 32-bit float, pfrc is now in Q7.25 format, with two bits	     */
   /* for rounding.  First, normalize if the result is >= 2.xxxx	     */
   /*------------------------------------------------------------------------*/
   if (pfrc >= (REAL_HIDDEN_BIT<<3)) 
   { pfrc = (pfrc >> 1) | (pfrc & 1); pexp += 1; }

   /*------------------------------------------------------------------------*/
   /* Round to even.  If the rounding bits are exactly one half, round	     */
   /* the final result bit to the nearest even number (this may round down.) */
   /*------------------------------------------------------------------------*/
   if ((pfrc & 0x7) != 0x2) pfrc += 2;

   /*------------------------------------------------------------------------*/
   /* Discard the rounding bits.  pfrc is now in Q9.23 format.		     */
   /*------------------------------------------------------------------------*/
   pfrc >>= 2;

   /*------------------------------------------------------------------------*/
   /* If rounding rounded up past 2.xxx, renormalize.			     */
   /*------------------------------------------------------------------------*/
   if (pfrc >= (REAL_HIDDEN_BIT<<1)) { pfrc >>= 1; pexp += 1; }

insert_exponent:
   /*------------------------------------------------------------------------*/
   /* Check for overflow and underflow.                                      */
   /*------------------------------------------------------------------------*/
   if ((pexp -= REAL_EXP_BIAS) <= 0) {        /* underflow */
#ifdef Support_DENORM
      /* un-round, denormalize, and re-round the fraction */
      if (pexp > -REAL_FRC_BITS) pfrc = ((pfrc -1) >> (1-pexp)) +1;
      else
         pfrc = 0;      /* no significant bits remain */
#else
      pfrc = 0;      /* no significant bits remain */
#endif
      pexp = 0;
   }
   else if (pexp >= REAL_EXP_INFNAN) {    /* overflow */
   #if (defined(Support_INFNAN) || !defined(Support_SATURATION))
      pexp = REAL_EXP_INFNAN; pfrc = 0;
   #else /* most positive number*/
      pexp = REAL_EXP_INFNAN-1; pfrc = (biguns)-1;
   #endif
   }

   /*------------------------------------------------------------------------*/
   /* assemble result and return.                                            */
   /*------------------------------------------------------------------------*/
   pfrc = (pfrc & REAL_FRC_MASK) + (((bigint)pexp) << REAL_FRC_MSBs);

resign:;
   pfrc += sign;

   return_UNSasREAL(pfrc);

#elif (BPREAL == (BPbigint*2))
   bigint rfrc, lfrc, sign;
   int lexp, rexp, pexp;           /* exponent of left, right, product */
   REAL_2UNS lft, rgt, prd;        /* fraction of left, right, product */

   /*------------------------------------------------------------------------*/
   /* Unpack fraction and exponent, ignoring signs for now.                  */
   /* Reinsert hidden bit or re-normalize fraction as appropriate.           */
   /*------------------------------------------------------------------------*/

   prd.r = 0.0;
   lft.r = left; rgt.r = right;

   sign = (lft.u.msh ^ rgt.u.msh) & MINUS;

   lfrc = (lft.u.msh &= ~MINUS); 
   rfrc = (rgt.u.msh &= ~MINUS);

#ifdef Support_INFNAN
   if (lfrc >= REAL_INFNAN) {               /* left is Inf or NaN */
      if (lfrc < rfrc       ) return right; /*  return larger NaN */
      if (lfrc > REAL_INFNAN) return left ; /*  return        NaN */
      if (rfrc == 0 && rgt.u.lsh == 0) prd.u.msh = REAL_NAN; /* INF * 0 */
      else prd = lft;
      goto resign;
   }
   if (rfrc >= REAL_INFNAN) {               /* right is Inf or NaN */
      if (rfrc > REAL_INFNAN) return right; /*  return         NaN */
      if (lfrc == 0 && lft.u.lsh == 0) prd.u.msh = REAL_NAN; /* 0 * INF */
      else prd = rgt;
      goto resign;
   }
#endif
   if (lexp = lfrc >> REAL_FRC_MSBs) {       /* insert hidden bit */
      if (!(lfrc &= REAL_FRC_MASK) && !lft.u.lsh) {
         /* left is a power of two */
	 if (!(rexp = (rfrc >> REAL_FRC_MSBs))) {
      #ifdef Support_DENORM
            if ((rexp -= RENORMF(&rgt)) > 0) goto resign;
            rfrc = rgt.u.msh;
      #else
            goto resign;
      #endif
	 }
         prd.u.msh = (rfrc & REAL_FRC_MASK) + REAL_HIDDEN_BIT;
         pexp = lexp + rexp;
         prd.u.lsh = rgt.u.lsh;
         goto insert_exponent;
      }
      lft.u.msh = lfrc + REAL_HIDDEN_BIT;
   }
#ifdef Support_DENORM
   else if ((lexp -= RENORMF(&lft)) > 0) goto resign;
#else
   else goto resign;
#endif
   if (rexp = rfrc >> REAL_FRC_MSBs) {       /* insert hidden bit */
      if (!(rfrc &= REAL_FRC_MASK) && !rgt.u.lsh) {
         /* right is a power of two */
         pexp = lexp + rexp;
         prd.u.msh = lft.u.msh;
         prd.u.lsh = lft.u.lsh;
         goto insert_exponent;
      }
      rgt.u.msh = rfrc + REAL_HIDDEN_BIT;
   }
#ifdef Support_DENORM
   else if ((rexp -= RENORMF(&rgt)) > 0) goto resign;
#else
   else goto resign;
#endif

   /*------------------------------------------------------------------------*/
   /* Compute product exponent and fraction.                                 */
   /* Round and normalize product if needed.                                 */
   /*------------------------------------------------------------------------*/
   pexp = lexp + rexp;
   pexp += FRCMPYF(&prd, &lft, &rgt);

insert_exponent:
   /*------------------------------------------------------------------------*/
   /* Check for overflow and underflow.                                      */
   /*------------------------------------------------------------------------*/
   if ((pexp -= (REAL_EXP_BIAS+1)) < 0) {     /* underflow */
   #ifdef Support_DENORM
      /* should really un-round, denormalize, and re-round the fraction, */
      /* but it's a lot of pain and probably not worth it                */ 
      if (pexp < -REAL_FRC_BITS) { prd.r = 0.0; goto resign; }
      RIGHT_SHIFT(prd, -pexp); 
      pexp = 0; /* not -1 since no hidden bit to remove */
   #else
      prd.r = 0.0; goto resign;  /* no significant bits remain */
   #endif
   }
   else if (pexp >= (REAL_EXP_INFNAN-1)) {    /* overflow */
   #if (defined(Support_INFNAN) || !defined(Support_SATURATION))
      prd.u.lsh = 0;
      prd.u.msh = REAL_INFNAN;
   #else /* most positive number */
      prd.u.lsh = (bigint)-1;
      prd.u.msh = REAL_MOSTPOS;
   #endif
      goto resign;
   }

   /*------------------------------------------------------------------------*/
   /* assemble result and return.                                            */
   /* subtract the hidden bit and insert the exponent by adding pexp-1.      */
   /*------------------------------------------------------------------------*/
   prd.u.msh += ((bigint)pexp) << REAL_FRC_MSBs;

resign:;

   prd.u.msh += sign;
   return prd.r;
#else
   #error "MPYF not yet implemented for this size REAL"
#endif
#endif

