/****************************************************************************/
/*  atanhf_i.h         v8.1.3                                               */
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


   /* Taken from "Handbook of Mathematical Functions                        */
   /* with Formulas, Graphs and Mathematical Tables",                       */
   /* Milton Abramowitz and Irene A. Stegun,                                */
   /* National Bureau of Standards (Applied Mathematics Series 55),         */
   /* Washington D.C., 1964 (reprinted 1970). 4.6.22, page 87.              */

#if (REAL_MANTISSA <= 25)
    #define atanh_consts_length 5
    static _DATA_ACCESS REAL atanh_consts[5] = /* max of 25 mantissa bits */
      {KNST( 1.83766196E-01), 
       KNST( 8.10419885E-02), 
       KNST( 1.47040305E-01), 
       KNST( 1.99744113E-01), 
       KNST( 3.33338978E-01)};

#elif (REAL_MANTISSA <= 33)
    #define atanh_consts_length 7
    static _DATA_ACCESS REAL atanh_consts[7] = /* max of 33 mantissa bits */
      {KNST( 1.7739483769E-01), 
       KNST( 2.3152725329E-02), 
       KNST( 1.0334333099E-01), 
       KNST( 1.0957263705E-01), 
       KNST( 1.4295872106E-01), 
       KNST( 1.9999673962E-01), 
       KNST( 3.3333337294E-01)};

#elif (REAL_MANTISSA <= 53)
    #define atanh_consts_length 12
    static _DATA_ACCESS REAL atanh_consts[12] = /* max of 53 mantissa bits */
      {KNST( 2.1228942626427469E-01), 
       KNST(-1.1748303955885372E-01), 
       KNST( 1.2434577315837858E-01), 
       KNST( 3.0206143982156029E-02), 
       KNST( 6.3136302499099010E-02), 
       KNST( 6.6105770662158143E-02), 
       KNST( 7.6972523228749300E-02), 
       KNST( 9.0906189426936578E-02), 
       KNST( 1.1111121987477515E-01), 
       KNST( 1.4285714043936430E-01), 
       KNST( 2.0000000002784950E-01), 
       KNST( 3.3333333333320755E-01)};

#elif (REAL_MANTISSA <= 56)
    #define atanh_consts_length 13
    static _DATA_ACCESS REAL atanh_consts[13] = /* max of 56 mantissa bits */
      {KNST( 2.25724641804188644E-01), 
       KNST(-1.54513116667531851E-01), 
       KNST( 1.46156288173382231E-01), 
       KNST( 1.40184457921711518E-02), 
       KNST( 5.99819851747404234E-02), 
       KNST( 5.77128457104497097E-02), 
       KNST( 6.67837027607393057E-02), 
       KNST( 7.69145421940022278E-02), 
       KNST( 9.09095112570522965E-02), 
       KNST( 1.11111097748667961E-01), 
       KNST( 1.42857143110872902E-01), 
       KNST( 1.99999999997491454E-01), 
       KNST( 3.33333333333343084E-01)};

#elif (REAL_MANTISSA <= 64) 
    #define atanh_consts_length 15
    static _DATA_ACCESS REAL atanh_consts[15] = /* max of 64 mantissa bits */
      {KNST( 2.5928908833682308852E-01), 
       KNST(-2.4482190449809847818E-01), 
       KNST( 2.1357409410352487367E-01), 
       KNST(-3.0283813627342418954E-02), 
       KNST( 6.2621370615614544624E-02), 
       KNST( 4.3906651631651125356E-02), 
       KNST( 5.3153718682975750855E-02), 
       KNST( 5.8770027207750129918E-02), 
       KNST( 6.6670633822593706197E-02), 
       KNST( 7.6922867851694542563E-02), 
       KNST( 9.0909098497105452305E-02), 
       KNST( 1.1111111093080071285E-01), 
       KNST( 1.4285714285972850410E-01), 
       KNST( 1.9999999999998055998E-01), 
       KNST( 3.3333333333333339103E-01)};

#else
    #error "atanh constant table not available for this size mantissa"
#endif

   REAL g, Result, One_Plus_G, One_Minus_G;

   ABSF2(g,x);
   if GTRF(g,HALF) 
   {
      if GEQF(g,ONE)
      {
         errno = (EQLF(g,ONE) ? ERANGE : EDOM);
         if GEQF(x,ONE) return INFINITY;
         return -INFINITY;
      } else CPYF(g,x);

      /* Apply the identity: atanh(x) = 0.5 * log((1.0 + x) / (1.0 - x)) */
      ADDF3(One_Minus_G, SUBF(HALF,g), HALF);
      ADDF3(One_Plus_G , ADDF(HALF,g), HALF);
      return MPYF(HALF,LOGF(DIVF(One_Plus_G,One_Minus_G)));
   }

   SQRF2(g,x);

   POLYF(Result,g,atanh_consts,atanh_consts_length);

   return ADDF(x,MPYF(x,Result));

