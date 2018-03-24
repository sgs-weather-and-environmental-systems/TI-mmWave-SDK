/****************************************************************************/
/*  divremx_i.h         v8.1.3                                              */
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

#define DIVIDE 1
#define REMAINDER 2
#define DIVIDE_AND_REMAINDER 3

#if (GENERATE == DIVIDE_AND_REMAINDER)
DIVREM_STRUCT DIVREMX (SIGNEDorUNSIGN num, SIGNEDorUNSIGN den)
{
   DIVREM_STRUCT local;
#else
SIGNEDorUNSIGN DIVREMX (SIGNEDorUNSIGN num, SIGNEDorUNSIGN den)
{
#endif
   register UNSIGN nm = num;
   register UNSIGN dn = den;
   register UNSIGN t, md;
   register int q, i, sh;

#if SIGNED_DIVREM
   int sign;
   if (sign = (num < 0)) nm = -nm;
   if (den <= 0) { 
      if (den == 0) { /* division by 0? */
       #if (GENERATE == DIVIDE_AND_REMAINDER)                        /* most-*/
         if      (sign   ) dn = (SIGNED) ((UNSIGN)1<<(BPSIGNED-1))   ;/*neg*/
         else if (nm != 0) dn = (SIGNED)(((UNSIGN)1<<(BPSIGNED-1))-1);/*pos*/
         else              dn = (SIGNED)0;
         local.quot = dn;
         local.rem = 0;
         return local;
       #elif (GENERATE == DIVIDE)                                   /* most-*/
         if (sign   ) return (SIGNED) ((UNSIGN)1<<(BPSIGNED-1))   ; /*neg*/
         if (nm != 0) return (SIGNED)(((UNSIGN)1<<(BPSIGNED-1))-1); /*pos*/
         return (SIGNED)0;
       #else
         return (SIGNED)0;
       #endif
      }
      dn = -dn;
    #if (GENERATE == DIVIDE)
      sign = !sign;
    #endif
   }
#else
   if (dn == 0)
    #if (GENERATE == DIVIDE_AND_REMAINDER)
      local.quot = (nm == 0) ? 0 : (SIGNED)-1; /* 0/0 is 0, nz/0 is most pos */
      local.rem = 0;
      return local;
    #elif (GENERATE == DIVIDE)
      return (nm == 0) ? 0 : (SIGNED)-1; /* 0/0 is 0, nz/0 is most pos */
    #else
      return 0;
    #endif
#endif
   
#ifdef _TMS320C6x
 #if (BPSIGNED == 40)
   {  int zn;
      /* {sh,zn} == 24 + # leading 0's in {dn,nm} */
      if ((sh = _lmbd(1,(unsigned)(dn>>32)))==32) sh+= _lmbd(1, (unsigned)dn);
      if ((zn = _lmbd(1,(unsigned)(nm>>32)))==32) zn+= _lmbd(1, (unsigned)nm);
      sh -= zn;
   }
 #else
   sh = _lmbd(1,(unsigned)(dn)) - _lmbd(1,(unsigned)(nm));
 #endif
 #if !SIGNED_DIVREM
   q = 0;
   if (sh <= 0) goto aligned;
   dn <<= sh;  /* align numerator and denominator */
   if ((SIGNED)nm < (SIGNED)0) {
      if ((SIGNED)(t = nm - dn) >= 0) {q = 2; nm = t;}
      dn >>= 1; sh -= 1;  /* top bit of dn now 0 */
   }
 #endif
#else
   sh = 0; 
 #if !SIGNED_DIVREM
   q = 0;
   if ((SIGNED)nm < (SIGNED)0) {
      while ((SIGNED)dn > (SIGNED)0) {dn <<= 1; sh++;}
      goto dn_looks_negative;
   } else while ((UNSIGN)nm > (UNSIGN)dn) {dn <<= 1; sh++;}
 #else
   while ((UNSIGN)nm > (UNSIGN)dn) {dn <<= 1; sh++;}
 #endif
#endif
   if ((SIGNED)dn < (SIGNED)0) {
 #if !SIGNED_DIVREM
   dn_looks_negative:
 #endif
      if (sh <= 0) goto aligned;
      if ((SIGNED)(t = nm - dn) >= 0) {q = 2; nm = t;}
      dn >>= 1; sh -= 1;  /* top bit of dn now 0 */
   }

   /* sh holds bits-1 of quotient */

   if (sh <= 0) { /* is nm < 2*dn ? */
   aligned:
      t = nm - dn;
    #define nm_geq_dn ((SIGNED)t >= 0)
    #if (GENERATE == DIVIDE_AND_REMAINDER)
     #if SIGNED_DIVREM
      local.quot = ((den < 0) ^ sign) ? -nm_geq_dn : nm_geq_dn;
      local.rem = nm_geq_dn ? (sign ? -t : t) : nm;
     #else
      local.quot = nm_geq_dn + q;
      local.rem  = nm_geq_dn ? t : nm;
     #endif
      return local;
    #elif (GENERATE == DIVIDE)
     #if SIGNED_DIVREM
      return sign ? -nm_geq_dn : nm_geq_dn;
     #else
      return nm_geq_dn + q;
     #endif
    #else
     #if SIGNED_DIVREM
      if nm_geq_dn return sign ? -t : t;
     #else
      if nm_geq_dn return t;
     #endif
      return nm;
   #endif
   }
#if SIGNED_DIVREM && defined(_TMS320C6x)
   /* align numerator and denominator */
   dn <<= sh;
#endif

 #if !SIGNED_DIVREM
   if ((SIGNED)(t = nm - dn) >= 0) {q += 1; nm = t;}
 #else
   if (q = ((SIGNED)(t = nm - dn) >= 0)) nm = t;
 #endif

   dn -= 1;  /* the bit that is used to build quotient */
   md = -dn;

   /* resultant nm is >= 0 here but might be full size so must */
   /* unroll 1st iteration of loop to hard-wire test against 0 */
   nm <<= 1;
   nm += md;

   for (i = sh-1; i > 0; i--) {
      nm = (((SIGNED)nm < 0) ? dn : md) + (nm << 1);
   }
   if ((SIGNED)nm < 0) nm += dn; /* overshot by 1 */

   /* remainder in upper bits, quotient is bottom sh bits + q<<sh */
#if (GENERATE == DIVIDE_AND_REMAINDER)
 #ifdef SHIFT_LEFT_THEN_RIGHT_IS_NOP
   dn = nm << (BPSIGNED-sh);
   dn >>= (BPSIGNED-sh);
   dn |= ((UNSIGN)q << sh);
   nm >>= sh;
 #else
   dn = ((nm << (BPSIGNED-sh)) >> (BPSIGNED-sh)) | ((UNSIGN)q << sh);
   nm >>= sh;
 #endif
 #if SIGNED_DIVREM
   if (sign)             nm = -nm;
   if ((den < 0) ^ sign) dn = -dn;
 #endif
   local.rem  = nm;
   local.quot = dn;
   return local;
#elif (GENERATE == DIVIDE)
 #ifdef SHIFT_LEFT_THEN_RIGHT_IS_NOP
   nm <<= (BPSIGNED-sh);
   nm >>= (BPSIGNED-sh);
   nm |= ((UNSIGN)q << sh);
 #else
   nm = ((nm << (BPSIGNED-sh)) >> (BPSIGNED-sh)) | ((UNSIGN)q << sh);
 #endif
 #if SIGNED_DIVREM
   return sign ? -nm : nm;
 #else
   return nm;
 #endif
#else
   nm >>= sh;
 #if SIGNED_DIVREM
   return sign ? -nm : nm;
 #else
   return nm;
 #endif
#endif
}
