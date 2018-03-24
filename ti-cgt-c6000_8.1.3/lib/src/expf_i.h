/****************************************************************************/
/*  expf_i.h         v8.1.3                                                 */
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

/* _CODE_ACCESS REAL EXPF(REAL x) */

   #define C1 CNST(0.693359375)
   #define C2 CNST(-2.1219444005469058277E-4)

   if GTRF(x, EXP_Max)
   { 
      errno = ERANGE;
      return INFINITY;
   }
   if LSSF(x, EXP_Min) return ZERO;
   if LSSF(ABSF(x), RADIX_to_One_M_MANTISSA) return ONE;

#if ( (REAL_MANTISSA <= 29) &&                         \
      ((                  100*Adds_Per_Mult +110) <=   \
       (10*Adds_Per_Div +  70*Adds_Per_Mult + 80))     \
    ) ||                                               \
    ( (REAL_MANTISSA >  29) &&                         \
      (REAL_MANTISSA <= 32) &&                         \
      ((                  100*Adds_Per_Mult + 110) <=  \
       (10*Adds_Per_Div +  60*Adds_Per_Mult +  70))    \
    )
   {
      /* Adapted from "Handbook of Mathematical Functions with Formulas,    */
      /* Graphs, and Mathematical Tables", Milton Abramowitz and            */
      /* Irene A. Stegun, National Bureau of Standards (Applied Mathematics */
      /* Series 55), Washington D.C., 1964 (reprinted 1970). 4.2.45, page 71*/

      REAL          xn, x1, f, g;
      EXPONENT_TYPE n;

   #if (REAL_MANTISSA <= 15)
      #define exp_consts_length 4
      static _DATA_ACCESS REAL exp_consts[4] =
         {KNST(0.0293641),
          KNST(0.1595332),
          KNST(0.4982926),
          KNST(0.9998684)};

   #elif (REAL_MANTISSA <= 32)
      #define exp_consts_length 7
      static _DATA_ACCESS REAL exp_consts[7] =
         {KNST(0.0001413161),
          KNST(0.0013298820),
          KNST(0.0083013598),
          KNST(0.0416573475),
          KNST(0.1666653019),
          KNST(0.4999999206),
          KNST(0.9999999995)};
   #else
      #error "exp constant table not available for this size mantissa"
   #endif

      x1 = MPYF(x, One_Over_Ln_2);
      n  = (EXPONENT_TYPE)FIXFI(FLRF(x1));
      n  += 1;
      FLTIF2(xn, n);
      FLRF2(x1, x);

      /* g  = ((x1 - xn * C1) + (x-x1)) - xn * C2; */
      SUBF3(g,
            ADDF(SUBF(x1,
                      MPYF(xn,C1)),
                 SUBF(x,x1)),
            MPYF(xn, C2));
       
      /* -ln(2) =< g < 0 */

      POLYF(f, g, exp_consts, exp_consts_length);

      ADDF2(f, ONE);

      /* 1/2 <= F < 1  (exponent of F is -1) */
      return SCLF(f, n);
   }
#else
   {
      /* Adapted from "Software Manual for the Elementary Functions"      */
      /* Cody and Waite, Prentice Hall 1980. pages 60-70.                 */

      REAL          xn, x1, f, g, z, gp, q;
      EXPONENT_TYPE n;

   #if (REAL_MANTISSA <= 29)
      #define P_length 2
      static _DATA_ACCESS REAL P[2] =
         {KNST(0.41602886268e-2),
          KNST(0.24999999950e+0)};

      #define Q_length 2
      static _DATA_ACCESS REAL Q[2] =
         {KNST(0.49987178778e-1),
          KNST(0.50000000000e+0)};

   #elif (REAL_MANTISSA <= 42)
      #define P_length 2
      static _DATA_ACCESS REAL P[2] =
         {KNST(0.59504254977591e-2),
          KNST(0.24999999999992e+0)};

      #define Q_length 3
      static _DATA_ACCESS REAL Q[3] =
         {KNST(0.29729363682238e-1),
          KNST(0.53567517645222e-1),
          KNST(0.50000000000000e+0)};

   #elif (REAL_MANTISSA <= 56)
      #define P_length 3
      static _DATA_ACCESS REAL P[3] =
         {KNST(0.165203300268279130e-4),
          KNST(0.694360001511792852e-2),
          KNST(0.249999999999999993e+0)};

      #define Q_length 3
      static _DATA_ACCESS REAL Q[3] =
         {KNST(0.495862884905441294e-3),
          KNST(0.555538666969001188e-1),
          KNST(0.500000000000000000e+0)};

   #elif (REAL_MANTISSA <= 65)
      #define P_length 3
      static _DATA_ACCESS REAL P[3] =
         {KNST(0.31555192765684646356e-4),
          KNST(0.75753180159422776666e-2),
          KNST(0.25000000000000000000e+0)};

      #define Q_length 4
      static _DATA_ACCESS REAL Q[4] =
         {KNST(0.75104028399870046114e-6),
          KNST(0.56817302698551221787e-1),
          KNST(0.63121894374398503557e-3),
          KNST(0.50000000000000000000e+0)};
   #else
      #error "exp constant table not available for this size mantissa"
   #endif
      MPYF3(xn, x, One_Over_Ln_2);
      n = (GEZF(xn)? FIXFI((ADDF(xn,HALF))) :  /* n = (int)round(xn); */
                     FIXFI((SUBF(xn,HALF))));
      xn = FLTIF(n);

      x1 = TNCF(x); /* trunc(x), x int range */

      /* g  = ((x1 - xn*C1) + (x-x1)) - xn*C2; */
      SUBF3(g,ADDF(SUBF(x1,
                        MPYF(xn,C1)),
                   SUBF(x,x1)), 
              MPYF(xn,C2));

      SQRF2(z,g);

      POLYaF(gp,z,P,P_length); 
      MPYF2(gp,g);
      POLYaF(q,z,Q,Q_length);

      /* f = 0.5 + (gp/(q - gp)); */
      ADDF3(f, HALF, 
               DIVF(gp, 
                    SUBF(q, gp)));

      return SCLF(f, n+1);
   }
#endif
