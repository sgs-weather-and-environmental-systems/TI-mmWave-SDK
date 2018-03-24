/****************************************************************************/
/*  fixfy_i.h         v8.1.3                                                */
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

#define Wrap_Around /* undef this if want saturation behavior for negatives*/

UNSIGN FIXFy(REAL x)
/*---------------------------------------------------------------------------*/
/* Convert REAL to unsigned, truncating towards zero.                        */
/* Produces saturated answers for out-of-range positive values.              */
#ifndef Wrap_Around
/* Returns 0 for negative values (saturation behavior).                      */
#else
/* Wrap-around behavior for negative values (returns all 1's for -1.0).      */
#endif
/* Handles +/- INFINITY, NAN (treated as out-of-range values).               */
/* Handles denormalized numbers.                                             */
/*---------------------------------------------------------------------------*/
{ 
#if (BPSIGNED == BPint)
 #define SIGNED_MOST_POS INT_MAX
 #define SIGNED_MOST_NEG INT_MIN
 #define UNSIGN_MOST_POS UINT_MAX
#elif (BPSIGNED == BPlong)
 #define SIGNED_MOST_POS LONG_MAX
 #define SIGNED_MOST_NEG LONG_MIN
 #define UNSIGN_MOST_POS ULONG_MAX
#elif (BPSIGNED == BPlonglong)
 #define SIGNED_MOST_POS LLONG_MAX
 #define SIGNED_MOST_NEG LLONG_MIN
 #define UNSIGN_MOST_POS ULLONG_MAX
#elif (BPSIGNED == BPchar)
 #define SIGNED_MOST_POS CHAR_MAX
 #define SIGNED_MOST_NEG CHAR_MIN
 #define UNSIGN_MOST_POS UCHAR_MAX
#elif (BPSIGNED == BPshrt)
 #define SIGNED_MOST_POS SHRT_MAX
 #define SIGNED_MOST_NEG SHRT_MIN
 #define UNSIGN_MOST_POS USHRT_MAX
#else
 #define SIGNED_MOST_POS ((SIGNED)(UNSIGN_MOST_POS >> 1))
 #define SIGNED_MOST_NEG (-SIGNED_MOST_POS-1)
 #define UNSIGN_MOST_POS ((UNSIGN)-1)
#endif

#if (BPSIGNED < BPbigint)
 #if (BPbigint == BPint)
   unsigned y = FIXFU(x);
   if (y > (unsigned)UNSIGN_MOST_POS) return UNSIGN_MOST_POS;
 #else
   unsigned long y = FIXFUL(x);
   if (y > (unsigned long)UNSIGN_MOST_POS) return UNSIGN_MOST_POS;
 #endif
   return (SIGNED)y;

#elif (BPREAL == BPbigint)
   UNSIGN rslt; biguns rfrc; int rexp;   /* frac and exp of result */

   REALasUNS(rfrc,x);
 #ifndef Wrap_Around
   if (rfrc & MINUS) return (UNSIGN)0;
 #endif

   rfrc &= ~MINUS;
   if ((rexp = (int)(rfrc >> REAL_FRC_BITS)) == 0) 
      return (UNSIGN)0; /* denorm or 0 */

   rfrc = (rfrc & REAL_FRC_MASK) + REAL_HIDDEN_BIT;    /* insert hidden bit */
   rexp = REAL_EXP_BIAS + BPSIGNED -1 -rexp;
   if (rexp < 0) { /* overflow  */

   #ifdef Wrap_Around
      {biguns u; REALasUNS(u,x); if (u & MINUS) return (UNSIGN)SIGNED_MOST_NEG;}
   #endif
      return UNSIGN_MOST_POS;
   }
   if (rexp >= BPSIGNED) return (UNSIGN)0; /* underflow */

   rslt = rfrc;
   rslt = (rslt << (BPSIGNED-REAL_FRC_BITS-1)) >> rexp;
 #ifdef Wrap_Around
   {biguns u;
    REALasUNS(u,x); 
    if (u & MINUS) 
	rslt = (((SIGNED)rslt) < 0) ? (UNSIGN)SIGNED_MOST_NEG : -rslt;}
 #endif
   return rslt;

#elif (BPREAL == BPbigint*2) && (BPSIGNED <= BPbigint*2)
   UNSIGN rslt; int rexp;  /* frc and exp of result */
   REAL_2UNS xx;

   xx.r = x;
 #ifndef Wrap_Around
   if (xx.u.msh & MINUS) return (UNSIGN)0;
 #endif

   if ((rexp = (xx.u.msh >> REAL_FRC_MSBs) & MASK(REAL_EXP_BITS))== 0)
      return (UNSIGN)0; /* denormalized or 0 */

   rexp = REAL_EXP_BIAS + BPSIGNED - 1 - rexp;
   if (rexp < 0) { /* overflow */

   #ifdef Wrap_Around
      if (xx.u.msh & MINUS) return (UNSIGN)SIGNED_MOST_NEG;
   #endif
      return UNSIGN_MOST_POS;
   }

   if (rexp >= BPSIGNED) return (UNSIGN)0; /* underflow */

   rslt =
      ( ( (UNSIGN)((xx.u.msh & REAL_FRC_MASK)+ REAL_HIDDEN_BIT)
          << (BPbigint - (REAL_FRC_MSBs+1) + BPSIGNED - BPbigint)
        )
       + ((UNSIGN)xx.u.lsh << (BPSIGNED-BPbigint) >> (REAL_FRC_MSBs+1))
      ) >> rexp;

 #ifdef Wrap_Around
   if (xx.u.msh & MINUS) 
      rslt = (((SIGNED)rslt) < 0) ? (UNSIGN)SIGNED_MOST_NEG : -rslt;
 #endif
   return rslt;

#else
   #error "FIXFy not yet implemented for this combination UNSIGN/REAL"
#endif
} /* FIXFy */
