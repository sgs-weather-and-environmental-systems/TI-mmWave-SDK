/****************************************************************************/
/*  frcdivf2_i.h         v8.1.3                                             */
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

/* int FRCDIVF(REAL_2UNS *q, REAL_2UNS *l, REAL_2UNS *r) */

/*---------------------------------------------------------------------------*/
/* FRaCtional DIVide                                                         */
/* Forms the quotient of l/r (each a fixed point                             */
/* operand in range 1..2-, with radix point at REAL_FRC_BITS).               */
/* Returns in q the uppermost bits as a fixed point number in the range      */
/* 1..2-, with the radix point at REAL_FRC_BITS, rounded.                    */
/* Returns -1 if the product had to be right shifted by 1 to be in the       */
/* range 1..2-, 0 otherwise.                                                 */
/*---------------------------------------------------------------------------*/

   #define MS (BPbigint/2-2)     /* 14*/
   #define MS_MASK ((((bigint)1)<<MS)-1)
   #define IW (BPbigint/2)       /* 16*/

   bigint rsh, inv_div, i, t; 

   /* bigint rm[4], dv[4], quo[4];  C6x compiler barfs on arrays this week.*/
   bigint rm_0, dv_0, quo_0;
   bigint rm_1, dv_1, quo_1;
   bigint rm_2, dv_2, quo_2;
   bigint rm_3, dv_3, quo_3;

   /* break up the left operand into multiply-sized chunks */
   rm_0 =   l->u.msh >> (REAL_FRC_MSBs-MS); 
   rm_1 = ((l->u.msh << (2*MS - REAL_FRC_MSBs)) +
            (l->u.lsh >> (BPbigint-2*MS+REAL_FRC_MSBs))) & MS_MASK;
   rm_2 = ( l->u.lsh >> (BPbigint-3*MS+REAL_FRC_MSBs) ) & MS_MASK;
   rm_3 = ( l->u.lsh << (4*MS-REAL_FRC_MSBs-BPbigint) ) & MS_MASK;

   /* same for right */
   dv_0 =   r->u.msh >> (REAL_FRC_MSBs-MS); 
   dv_1 = ((r->u.msh << (2*MS - REAL_FRC_MSBs)) +
            (r->u.lsh >> (BPbigint-2*MS+REAL_FRC_MSBs))) & MS_MASK;
   dv_2 =  (r->u.lsh >> (BPbigint-3*MS+REAL_FRC_MSBs) ) & MS_MASK;
   dv_3 =  (r->u.lsh << (4*MS-REAL_FRC_MSBs-BPbigint) ) & MS_MASK;

   /*------------------------------------------------------------------------*/
   /* Compute an approximate inverse of d, in the range 0.5..1.0,            */
   /* with radix point at IW bits                                            */
   /*------------------------------------------------------------------------*/
   /* linear approximation */
   inv_div = FIXPT(1.411622, MS) - ((FIXPT(0.470459,MS) * dv_0) >> MS);

   /* newton iteration */
   inv_div =
      ( (FIXPT(2.0,MS)-((inv_div * dv_0) >> MS))* inv_div) >> 2*MS-IW;
   inv_div =
      (((FIXPT(1.0,IW)-((inv_div * dv_0) >> MS))* inv_div) >> IW) + inv_div;

   /*------------------------------------------------------------------------*/
   /* Long division.                                                         */
   /* Estimate the quoient in MS * IW bits, keeping MS bits.                 */
   /* Then multiply by the divisor, subtract from the remainder              */
   /* to get a new remainder.   Left shift and do it again...                */
   /*------------------------------------------------------------------------*/
   t = 0;
   for (i = 0; i <= 3; i += 1) {
      bigint p = (t * inv_div) >> IW-MS;
      p += (rm_0 * inv_div) >> IW;
      rm_0 += t << MS; 

      /* quo[i] = p; */
      switch (i) {
       case 0: quo_0 = p; break;
       case 1: quo_1 = p; break;
       case 2: quo_2 = p; break;
       case 3: quo_3 = p; break;
      }
      t = -p;

      /* now form t * divisor in parts, and subtract from remainder */
      p = dv_0 * t;  rm_0 += p >> MS;  rm_1 += p & MS_MASK;
      p = dv_1 * t;  rm_1 += p >> MS;  rm_2 += p & MS_MASK;
      p = dv_2 * t;  rm_2 += p >> MS;  rm_3 += p & MS_MASK;
      p = dv_3 * t;  rm_3 += p >> MS;

      /* propagate carries */
      rm_2 += rm_3 >> MS;
      rm_1 += rm_2 >> MS;
      rm_0 += rm_1 >> MS;

      /* shift the remainder left by MS bits */
      t = rm_0;
      rm_0 = rm_1 & MS_MASK;
      rm_1 = rm_2 & MS_MASK;
      rm_2 = rm_3 & MS_MASK;
      rm_3 = p    & MS_MASK;
   }

   /* repackage into 2 words, with 2*MS bits each */
   quo_2 = (quo_2 << MS) + quo_3;
   quo_0 = (quo_0 << MS) + quo_1 + (quo_2 >> 2*MS);
   quo_1 =  quo_2 & ((((bigint)1)<<(2*MS))-1);

   /* check if left shift is needed for normalization */
   rsh = 0;
   if (quo_0 < (((bigint)1) << 2*MS)) {
      quo_0 <<= 1; quo_1 <<= 1; rsh = -1;
   }

   /* now round and re-align as needed for our result */
   quo_1   = ((quo_1 >> 4*MS-REAL_FRC_BITS-1) +1) >> 1;
   q->u.lsh =  (quo_0 << REAL_FRC_BITS-2*MS) + quo_1;
   q->u.msh = ((quo_1 >> REAL_FRC_BITS-2*MS) + quo_0) >>
               2*MS-REAL_FRC_MSBs;

   /* watch out for round up, which can only be FFFF => 10000 */
   if (q->u.msh >= REAL_HIDDEN_BIT*2) {
       q->u.msh = REAL_HIDDEN_BIT; rsh += 1;
   }

   return rsh;
