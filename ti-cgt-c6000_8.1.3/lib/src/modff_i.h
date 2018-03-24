/****************************************************************************/
/*  modff_i.h         v8.1.3                                                */
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

/* _CODE_ACCESS REAL MODFF(REAL x, REAL *ip) */

/*---------------------------------------------------------------------------*/
/* Decompose x into w and f such that                                        */
/* x == w + f, abs(f) < 1, floor(w) == w (w is whole number),                */
/* and signs of x, w, f are all same.                                        */
/* Return w in *ip and f as function result.                                 */
/*---------------------------------------------------------------------------*/

#define OPTIMIZATION_BLOCK __asm(" ")

#ifdef IEEE
   REAL y;
 #if (FLT_FIX_Faster_Than_MODF)
   if (GEQF(x,INT_MOST_NEG) && LSSF(x,INT_MOST_POS_P1)) FLTIF2(y,FIXFI(x));
   else 
 #endif
   {
   /* Deals properly with NAN, +/- INFINITY, +/- ZERO, denormalized numbers */
   #define BPsexp (REAL_EXP_BITS+1) /* Bits Per Sign/EXPonent part*/
   #define BIAS (REAL_EXP_BIAS-1)
   #define KEEP_EXP ((1<<REAL_EXP_BITS)-1)
   #define MSBs (((BPREAL/BPint)-1)*(MSB_In_Hi_Addr))
   #define LSBs (((BPREAL/BPint)-1)*(MSB_In_Hi_Addr^1))
   #define Clear_Int_Bits(p) if (MSB_In_Hi_Addr) *p++ = 0; else *p-- = 0

      int e, msbs;
      
   #if defined(_TMS320C6x) && (BPREAL == BPint)
      CPYF(y,x);
      msbs = (int)_ftoi(y);
   #elif defined(_TMS320C6x) && (BPREAL == 2*BPint)
      CPYF(y,x);
      msbs = (int)_hi(y);
   #else
      int *ptr;
      CPYF(y,x);
      ptr = (int *)(&y) + MSBs;
      msbs = *ptr;
      ptr += (LSBs-MSBs); /* point to LSBs of y, hope for auto increment */
   #endif
      e = ((msbs >> (BPint-BPsexp)) & KEEP_EXP) - BIAS;

      if (e <= 0) { CPYF(*ip,ZERO); return x; } /* no integer part */
      /* above also covers ZERO's and denormalized numbers */
      
      if (e >= REAL_MANTISSA) {CPYF(*ip,x); return ZERO;}/*no fractional part*/
      /* above also covers INFINITY and NAN */

      /* truncate towards 0 by clearing (REAL_MANTISSA-e) mantissa LSBs */
   #if defined(_TMS320C6x) && (BPREAL == BPbigint) && (BPbigint == BPint)
      y =_itof(msbs & ~(( (biguns)1 << (REAL_MANTISSA-e))-1));
   #elif defined(_TMS320C6x) && (BPREAL == 2*BPbigint) && (BPbigint == BPint)
      if (e <= (REAL_MANTISSA-BPint))
         y = _itod(msbs & ~(( (biguns)1 << ((REAL_MANTISSA-BPint)-e))-1), 0);
      else
         y = _itod(msbs, _lo(y) & ~((1 << (REAL_MANTISSA-e))-1));
   #elif (BPREAL <= BPint)
      *ptr = msbs & ~((1 << (REAL_MANTISSA-e))-1);
   #elif (BPREAL <= 2*BPint)
      if (e <= (REAL_MANTISSA-BPint))
      {
         Clear_Int_Bits(ptr);
         *ptr = msbs & ~((1 << ((REAL_MANTISSA-BPint)-e))-1);
      }
      else *ptr &= ~((1 << (REAL_MANTISSA-e))-1);
   #else
      {
         int Bits_To_Clear = REAL_MANTISSA-e;
         int i; 
         for (i=1; i<= Bits_To_Clear/BPint; i++) Clear_Int_Bits(ptr);
         *ptr &= ~((1 << (Bits_To_Clear % BPint))-1);
      }
   #endif
   }
 #if !defined(_TMS320C6x) /* handled above*/
   OPTIMIZATION_BLOCK;/* make sure *ptr is written before trying to read y */
 #endif
   CPYF(*ip, y);      /* return the integer part in *ip */
   return SUBF(x,y);  /* get fractional part by subtracting integer part */

#elif defined(C3x_Float_Format)
   REAL y;
   if (GTRF(x,INT_MOST_NEG_M1) && LSSF(x,INT_MOST_POS_P1)) {
      FLTIF2(y,FIXFI(x));
      CPYF(*ip, y);      /* return the integer part in *ip */
      return SUBF(x,y);  /* get fractional part by subtracting integer part */
   } else { /* not possible to have fractional part */
      CPYF(*ip,x);
      return ZERO;
   }
#else
   #error "modf not yet implemented for cases other than IEEE"
#endif
