/****************************************************************************/
/*  eqlf_i.h         v8.1.3                                                 */
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

/* _CODE_ACCESS int EQLF(REAL left, REAL right) */

/*---------------------------------------------------------------------------*/
/* IEEE equals                                                               */
/* return (left == right)                                                    */
/*                                                                           */
/* Handles denormalized numbers.                                             */
/* Handles +/- INFINITY, NANs.                                               */
/*---------------------------------------------------------------------------*/
 
#if IEEE_Hardware
   return left == right;
#else
#if (BPREAL == BPbigint)
   bigint lft;
   bigint rgt;
   REALasINT(lft, left);
   REALasINT(rgt,right);

   if ((lft^rgt) < 0)                        /* different signs?             */
      return ((lft | rgt) == MINUS);         /* 0 == 0, ignoring signs       */
   if (lft != rgt) return 0;                 /* not equal if bits not same   */
   return ((lft & ~MINUS) <= REAL_INFNAN);   /* NAN's are never equal.       */

#elif (BPREAL == (BPbigint*2))
   REAL_2UNS lft, rgt;
   bigint l,r;

   lft.r =  left; l = lft.u.msh;
   rgt.r = right; r = rgt.u.msh;

   if ((l^r) < 0)                             /* different signs?            */
      return (((l | r) == MINUS) &&
              ((lft.u.lsh | rgt.u.lsh) == 0));/* 0 == 0, ignoring signs      */
   if ((l != r) || (lft.u.lsh != rgt.u.lsh))  /* not equal if bits not same  */
      return 0;
   l &= ~MINUS;                               /* remove sign bit             */
   if (l < REAL_INFNAN) return 1;             /* equal if not INFINITY, NAN  */
   if (l > REAL_INFNAN) return 0;             /* not equal if NAN            */
   return (lft.u.lsh == 0);                   /* equal if INFINITY           */

#else
   #error "EQLF not yet implemented for this size REAL"
#endif
#endif
