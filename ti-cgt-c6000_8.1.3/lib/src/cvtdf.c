/****************************************************************************/
/*  cvtdf.c          v8.1.3                                                 */
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

#include "double_config.h"
#include "reald.h"



#if (BPdouble > BPfloat)
#define LEAN float
#define BPLEAN BPfloat
#include "ieeemask.h"

#include "renormd.h"
/*#include "frcaddd.h" */
#include "frcmpyd.h"
#include "frcdivd.h"

_CODE_ACCESS float _cvtdf(double x)
/*---------------------------------------------------------------------------*/
/* Shink REAL to LEAN.                                                       */
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
{ 
#if IEEE_Hardware
   return (LEAN)x;
#else
#if (BPREAL == 2*BPbigint) && (BPLEAN == BPbigint)
   int exp;
   bigint frc;
   CREAL crx;

   REALasCREAL(crx, x);

   /* catenate the fraction bits, keeping one extra */
   frc = ((crx.u.msh & REAL_FRC_MASK) <<
           LEAN_FRC_MSBs+1-REAL_FRC_MSBs) +
	 (crx.u.lsh >> BPbigint+REAL_FRC_MSBs-LEAN_FRC_MSBs-1);

   exp = (int)((crx.u.msh >> REAL_FRC_MSBs) & REAL_EXP_MASK);

   /* check for overflow and underflow */
   if ((exp -= REAL_EXP_BIAS-LEAN_EXP_BIAS) <= 0) {	/* underflow */
   #ifdef Support_DENORM
      /* denormalize and round the fraction */
      if (exp > -LEAN_FRC_MSBs)
	 frc = (frc + LEAN_HIDDEN_BIT*2) >> (1-exp);
      else
   #endif
	 frc = 0;	/* no significant bits remain */
      exp = 0;
   }
   else if (exp >= LEAN_EXP_INFNAN) {	/* overflow */
      /* Make an infinity unless original was a NaN,     */
      /* in which case preserve the MSBs of the fraction */
      if (exp == REAL_EXP_INFNAN-REAL_EXP_BIAS+LEAN_EXP_BIAS) {
	 if (frc || crx.u.lsh) frc |= LEAN_NSNAN_BIT*2;
	 frc &= ((biguns)-2);
      }
      else frc = 0;
      exp = LEAN_EXP_INFNAN;
   }

   /* Round, assemble result and return */
   frc = ((frc+1) >> 1) + ((bigint)exp << LEAN_FRC_MSBs);
   if (((bigint)crx.u.msh) < 0) frc += MINUS;

   return_INTasLEAN(frc);

#else
   #error "SLIMF not yet implemented for this size REAL/LEAN"
#endif
#endif
} /* SLIMF */
#endif


