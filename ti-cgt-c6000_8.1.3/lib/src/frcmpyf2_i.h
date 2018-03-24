/****************************************************************************/
/*  frcmpyf2_i.h         v8.1.3                                             */
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

/* _CODE_ACCESS int FRCMPYF(REAL_2UNS *p, REAL_2UNS *l, REAL_2UNS *r) */

/*---------------------------------------------------------------------------*/
/* Fractional MultiPlY                                                       */
/* Forms the product (2*REAL_FRC_BITS bits) of l and r (each a fixed point   */
/* operand in range 1..2-, with radix point at REAL_FRC_BITS).               */
/* Returns in p the uppermost bits as a fixed point number in the range      */
/* 1..2-, with the radix point at REAL_FRC_BITS.                             */
/* Returns 1 if the product had to be right shifted by 1 to be in the        */
/* range 1..2-, 0 otherwise.                                                 */
/*---------------------------------------------------------------------------*/

#ifdef _TMS320C6x
   #define MS (BPbigint/2)
   #define MS_MASK ((((unsigned long)1)<<MS)-1)

   REAL_2UNS lp = *l;
   REAL_2UNS rp = *r;

   unsigned __int40_t p0, p1, p2, p3, msh;

   /* shift left so that format is: */
   /* 01.xxxxxxxxxxxxxxxxxxxxxxxxxxxxx xxxxxxxxxxxxxxxxxxxxxxx0000000000 */

   LEFT_SHIFT(lp, BPint - REAL_FRC_MSBs - 2);
   LEFT_SHIFT(rp, BPint - REAL_FRC_MSBs - 2);

   p0 = _mpyhu (lp.u.msh, rp.u.msh);
   p1 = _mpyhlu(lp.u.msh, rp.u.msh);
   p2 = _mpyhu (lp.u.msh, rp.u.lsh);
   p3 = _mpyhlu(lp.u.msh, rp.u.lsh);

   /* note that accumulates are 40-bits big so that no bits are lost */
   p1 += _mpylhu(lp.u.msh, rp.u.msh);
   p2 += _mpyu  (lp.u.msh, rp.u.msh);
   p3 += _mpylhu(lp.u.msh, rp.u.lsh);

   p2 += _mpyhu (lp.u.lsh, rp.u.msh);
   p3 += _mpyhlu(lp.u.lsh, rp.u.msh);

   p3 += _mpylhu(lp.u.lsh, rp.u.msh);

   /* sum propagate, repackage into 2 int's, keeping one more bit than    */
   /* needed, round, then carry propagate                                 */

   p0 += p1 >> MS;
   p1 =  ((p1 & MS_MASK) << MS) + p2 + (p3 >> MS);

   p1 =  (p1 >> ((2*BPint-4)-REAL_FRC_BITS-1))+1;  /*right align & round */
   msh = p0 + (p1 >> (REAL_FRC_BITS-(BPint-4)+1));  /*carry propagate*/

   /* Repackage the result into the desired fixed point format.       */
   /* At this point the extra bit we kept for rounding is eliminated. */

   if (msh >= (((long)1) << (BPbigint-3))) 
   {                                                    /* normalize */
      p1 = ((((p1-1) >> 1) + 1) >> 1);  /* right shift and re-round */
      p->u.lsh = (int)p1 + (int)(p0 << (REAL_FRC_BITS-(BPint-4)-1));
      p->u.msh = (((p1 >> (REAL_FRC_BITS-(BPint-4)-1)) + p0) >> 
                       ((BPint-4)-REAL_FRC_MSBs+1));
      return 1;  
   }

   p->u.lsh = (int)(p1 >> 1) + (int)(p0 << (REAL_FRC_BITS-(BPint-4)));
   p->u.msh = (msh >> (BPint-4)-REAL_FRC_MSBs);

   return 0;
#else
   /*------------------------------------------------------------------------*/
   /* Form cross products working in small chunks so that C integer multiply */
   /* does not overflow.                                                     */
   /*------------------------------------------------------------------------*/

   #define MS (BPbigint/2-2)
   #define MS_MASK ((((biguns)1)<<MS)-1)

 #if ((2*BPint) == BPbigint)
   int lp[4], rp[4];
 #elif ((2*BPshrt) == BPbigint)
   short lp[4], rp[4];
 #elif ((2*BPchar) == BPbigint)
   signed char lp[4], rp[4];
 #else
   bigint lp[4], rp[4];
 #endif

   bigint prod[4];

   /* break up the left operand into multiply-sized chunks */
   lp[0] =   l->u.msh >> (REAL_FRC_MSBs-MS); 
   lp[1] = ((l->u.msh << (2*MS - REAL_FRC_MSBs)) +
            (l->u.lsh >> (BPbigint-2*MS+REAL_FRC_MSBs))) & MS_MASK;
   lp[2] =  (l->u.lsh >> (BPbigint-3*MS+REAL_FRC_MSBs) ) & MS_MASK;
   lp[3] =  (l->u.lsh << (4*MS-REAL_FRC_MSBs-BPbigint) ) & MS_MASK;

   /* same for right */
   rp[0] =   r->u.msh >> (REAL_FRC_MSBs-MS); 
   rp[1] = ((r->u.msh << (2*MS - REAL_FRC_MSBs)) +
            (r->u.lsh >> (BPbigint-2*MS+REAL_FRC_MSBs))) & MS_MASK;
   rp[2] =  (r->u.lsh >> (BPbigint-3*MS+REAL_FRC_MSBs) ) & MS_MASK;
   rp[3] =  (r->u.lsh << (4*MS-REAL_FRC_MSBs-BPbigint) ) & MS_MASK;

   /* OKAY... let's multiply */

   /* All these multiplies are:             */
   /*  signed     x signed     -> signed    */
   /*  MS-bits    x MS-bits    -> 2*MS-bits */

   /* make sure to cast the operands to bigint, as they might be */
   /* arrays of a type shorter than bigint                       */

   prod[0] = (bigint)lp[0] * rp[0];
   prod[1] = (bigint)lp[0] * rp[1];
   prod[2] = (bigint)lp[0] * rp[2];
   prod[3] = (bigint)lp[0] * rp[3];

   prod[1] += (bigint)lp[1] * rp[0];
   prod[2] += (bigint)lp[1] * rp[1];
   prod[3] += (bigint)lp[1] * rp[2];

   prod[2] += (bigint)lp[2] * rp[0];
   prod[3] += (bigint)lp[2] * rp[1];

   prod[3] += (bigint)lp[3] * rp[0];

   /* sum propagate, repackage into 2 bigint's, keeping one more bit than */
   /* needed, round, then carry propagate                                 */
   prod[0] += prod[1] >> MS;
   prod[1] = ((((prod[1] & MS_MASK) << MS) +  prod[2] + (prod[3] >> MS))
              >> (4*MS - REAL_FRC_BITS-1)) +1;
   p->u.msh = prod[0] + (prod[1] >> (REAL_FRC_BITS-2*MS+1));/*carry propagate*/

   /* Repackage the result into the desired fixed point format.       */
   /* At this point the extra bit we kept for rounding is eliminated. */

   if (p->u.msh >= (((bigint)1) << 2*MS+1)) {      /* normalize */
      prod[1] = (((prod[1]-1) >> 1) + 1) >> 1;  /* right shift and re-round */
      p->u.lsh = prod[1] + (prod[0] << (REAL_FRC_BITS-2*MS-1));
      p->u.msh = ((prod[1] >> (REAL_FRC_BITS-2*MS-1)) + prod[0])
                  >> (2*MS-REAL_FRC_MSBs+1);
      return 1;
   }
   p->u.lsh = (prod[1] >> 1) + (prod[0] << (REAL_FRC_BITS-2*MS));
   p->u.msh >>= 2*MS-REAL_FRC_MSBs;

   return 0;
#endif

