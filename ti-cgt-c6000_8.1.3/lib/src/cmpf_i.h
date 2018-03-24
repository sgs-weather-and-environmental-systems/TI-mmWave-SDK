/****************************************************************************/
/*  cmpf_i.h         v8.1.3                                                 */
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

/* _CODE_ACCESS int CMPF(REAL left, REAL right) */

/*---------------------------------------------------------------------------*/
/* IEEE floating compare.                                                    */
/*                                                                           */
#ifdef Support_INFNAN
/* return UNORDERED if either left or right is NaN.                          */
/* UNORDERED is most-negative int.                                           */
#endif
/* return <0 if left <  right                                                */
/* return  0 if left == right                                                */
/* return >0 if left >  right                                                */
/*                                                                           */
/* Handles denormalized numbers.                                             */
/* Handles +/- INFINITY.                                                     */
/*                                                                           */
#ifndef Support_INFNAN
/* Returns |NAN| > |INFINITY|                                                */
#endif
/*---------------------------------------------------------------------------*/ 
#if IEEE_Hardware
   return (left < right) ? -1 : ((left == right) ? 0 : 1);
#else
#if (BPREAL == BPbigint)
   bigint lft;
   bigint rgt;

   REALasINT(lft, left);
   REALasINT(rgt, right);
#ifdef Support_INFNAN
   if ((lft & ~MINUS) > REAL_INFNAN) return UNORDERED; /*NAN's are unordered */
   if ((rgt & ~MINUS) > REAL_INFNAN) return UNORDERED; /*NAN's are unordered */
#endif

   if ((lft^rgt) < 0) {                      /* different signs?             */
      if ((lft | rgt) == MINUS) return 0;    /* 0 == 0, ignoring signs       */
#ifdef Support_INFNAN
      return ((lft < 0) ? (int)-1 : (int)1);
#else
      lft |= 1;                              /* make sure lft != 0           */
#endif
   } else {                                  /* same signs                   */
      lft -= rgt;
      if (rgt < 0) lft = -lft;               /* deal with sign-magnitude     */
   }
 #if (BPbigint == BPint)
   return lft;
 #else
   return ((lft < 0) ? (int)-1 : (int)(lft > 0));
 #endif

#elif (BPREAL == (BPbigint*2))
   REAL_2UNS lft, rgt;
   bigint l,r;

   lft.r =  left; l = lft.u.msh;
   rgt.r = right; r = rgt.u.msh;

#ifdef Support_INFNAN
   if ((l & ~MINUS) >= REAL_INFNAN) {  /*NAN's are unordered */
      if ((l & ~MINUS) > REAL_INFNAN) return UNORDERED;
      if (lft.u.lsh != 0) return UNORDERED;
   }
   if ((r & ~MINUS) >= REAL_INFNAN) {  /*NAN's are unordered */
      if ((r & ~MINUS) > REAL_INFNAN) return UNORDERED;
      if (rgt.u.lsh != 0) return UNORDERED;
   }
#endif

   if ((l^r) < 0) {                           /* different signs?            */
      if (((l | r) == MINUS) &&               /* one is zero or denorm       */
          ((lft.u.lsh | rgt.u.lsh) == 0))     /* filter denorms              */
         return 0;                            /* 0 == 0, ignoring signs      */
      l |= 1;                                 /* make sure l != 0            */
   } else {                                   /* same signs                  */
      l -= r;
      if (l==0) {                             /* msh bits equal (uncommon)   */
         biguns ul = lft.u.lsh;
         biguns ur = rgt.u.lsh;
         l = (ul < ur) ? -1 : (ul != ur);     /*l indicates magnitude compare*/
      }
      if (r < 0) l = -l;                      /* deal with sign-magnitude    */
   }
#if (BPbigint != BPint)
   return ((l < 0) ? (int)-1 : (int)(l > 0));
#elif defined(Support_INFNAN)
   return ((l>>1)|l);                         /* make sure l != UNORDERED    */
#else
   return l;
#endif

#else
   #error "CMPF not yet implemented for this size REAL"
#endif

#endif


