/****************************************************************************/
/*  fixfx_i.h         v8.1.3                                                */
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

_CODE_ACCESS SIGNED FIXFx(REAL x)
/*---------------------------------------------------------------------------*/
/* Convert REAL to integer, truncating towards zero.                         */
/* Produces saturated answers for out-of-range values.                       */
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
   int y = FIXFI(x);
   if (y > (int)SIGNED_MOST_POS) return SIGNED_MOST_POS;
   if (y < (int)SIGNED_MOST_NEG) return SIGNED_MOST_NEG;
 #else
   long y = FIXFLI(x);
   if (y > (long)SIGNED_MOST_POS) return SIGNED_MOST_POS;
   if (y < (long)SIGNED_MOST_NEG) return SIGNED_MOST_NEG;
 #endif
   return (SIGNED)y;

#elif (BPREAL == BPbigint)
   SIGNED rslt; biguns rfrc; int rexp;   /* frac and exp of result */

   REALasUNS(rfrc,x); rfrc &= ~MINUS;
   if ((rexp = (int)(rfrc >> REAL_FRC_BITS)) == 0) 
      return (SIGNED)0; /* denorm or 0 */

   rfrc = (rfrc & REAL_FRC_MASK) + REAL_HIDDEN_BIT;    /* insert hidden bit */
   rexp = REAL_EXP_BIAS + BPSIGNED -1 -rexp;
   if (rexp <= 0) {	/* overflow */
      rslt = SIGNED_MOST_POS;
      {biguns u; REALasUNS(u,x); if (u & MINUS) rslt = SIGNED_MOST_NEG;}
      return rslt;
   }
   if (rexp >= BPSIGNED) return 0; /* underflow */
   rslt = rfrc;
   rslt = (UNSIGN)(rslt << (BPSIGNED-REAL_FRC_BITS-1)) >> rexp;
   {biguns u; REALasUNS(u,x); if (u & MINUS) rslt = -rslt;}
   return rslt;

#elif (BPREAL == BPbigint*2) && (BPSIGNED <= BPbigint*2)
   SIGNED rslt; int rexp;  /* frc and exp of result */
   REAL_2UNS xx;

   xx.r = x;
   if ((rexp = (xx.u.msh >> REAL_FRC_MSBs) & MASK(REAL_EXP_BITS))== 0)
      return (SIGNED)0;  /* denorm or 0 */

   rexp = REAL_EXP_BIAS + BPSIGNED - 1 - rexp;
   if (rexp <= 0) { /* return saturated answers for overflow */
      rslt = SIGNED_MOST_POS;
      if (xx.u.msh & MINUS) rslt = SIGNED_MOST_NEG;
      return (SIGNED)rslt;
   }
   if (rexp >= BPSIGNED) return (SIGNED)0; /* underflow */

   rslt = 
      ( ( (UNSIGN)((xx.u.msh & REAL_FRC_MASK)+ REAL_HIDDEN_BIT)
          << (BPbigint - (REAL_FRC_MSBs+1) + BPSIGNED - BPbigint)
	 )
	+ ((UNSIGN)xx.u.lsh << (BPSIGNED-BPbigint) >> (REAL_FRC_MSBs+1))
      ) >> rexp;

   if (xx.u.msh & MINUS) rslt = -rslt;

   return rslt;

#else
   #error "FIXFx not yet implemented for this combination SIGNED/REAL"
#endif
} /* FIXFx */




