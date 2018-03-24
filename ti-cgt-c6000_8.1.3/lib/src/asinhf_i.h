/****************************************************************************/
/*  asinhf_i.h         v8.1.3                                               */
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

/*_CODE_ACCESS REAL ASINHF(REAL x) */

   /* Taken from "Handbook of Mathematical Functions with Formulas, Graphs,  */
   /* and Mathematical Tables",                                              */
   /* Milton Abramowitz and Irene A. Stegun,                                 */
   /* National Bureau of Standards (Applied Mathematics Series 55),          */
   /* Washington D.C., 1964 (reprinted 1970). 4.6.20, page 87.               */

#if (REAL_MANTISSA <= 25)
   #define asinh_consts_length 4
   static _DATA_ACCESS REAL asinh_consts[4] = /* max of 25 mantissa bits */
     {KNST( 1.98887612E-02), 
      KNST(-4.25708399E-02), 
      KNST( 7.48242149E-02), 
      KNST(-1.66661337E-01)};

#elif (REAL_MANTISSA <= 34)
   #define asinh_consts_length 6
   static _DATA_ACCESS REAL asinh_consts[6] = /* max of 34 mantissa bits */
     {KNST( 9.0809922363E-03), 
      KNST(-1.9910658732E-02), 
      KNST( 2.9991729686E-02), 
      KNST(-4.4610152272E-02), 
      KNST( 7.4998675362E-02), 
      KNST(-1.6666664637E-01)};

#elif (REAL_MANTISSA <= 56)
   #define asinh_consts_length 11
   static _DATA_ACCESS REAL asinh_consts[11] = /* max of 56 mantissa bits */
     {KNST(-2.16989595698168691E-03), 
      KNST( 5.77365635202187448E-03), 
      KNST(-8.89613248556152165E-03), 
      KNST( 1.13604085054945323E-02), 
      KNST(-1.39361311669709167E-02), 
      KNST( 1.73498471338541638E-02), 
      KNST(-2.23719621474302462E-02), 
      KNST( 3.03819359645514891E-02), 
      KNST(-4.46428569265288321E-02), 
      KNST( 7.49999999971403928E-02), 
      KNST(-1.66666666666651829E-01)};

#elif (REAL_MANTISSA <= 64)
   #define asinh_consts_length 13
   static _DATA_ACCESS REAL asinh_consts[13] = /* max of 64 mantissa bits */
     {KNST(-1.3558821927071787737E-03), 
      KNST( 3.9103004916794742066E-03), 
      KNST(-6.3140118795406126745E-03), 
      KNST( 8.1166904354286070529E-03), 
      KNST(-9.7084439671565330688E-03), 
      KNST( 1.1544421217136481139E-02), 
      KNST(-1.3964114173869449902E-02), 
      KNST( 1.7352713797699014750E-02), 
      KNST(-2.2372156694805935446E-02), 
      KNST( 3.0381944370718041189E-02), 
      KNST(-4.4642857141494777778E-02), 
      KNST( 7.4999999999986837678E-02), 
      KNST(-1.6666666666666661650E-01)};
#else
   #error "asinh constant table not available for this size mantissa"
#endif

   REAL g, Result;

   ABSF2(g,x);
   if GTRF(g, HALF)
   {
      /* Apply the identity: asinh(x) = log(x + sqrt(x*x + 1.0)).         */
      /* We need not compute sqrt(x*x + 1.0) if x*x is so big that the    */
      /* 1.0 term is lost.                                                */
      /* The biggest positive number that can be held in REAL             */
      /* that still has a 1's digit is RADIX**REAL_MANTISSA -1,           */
      /* so the cut-off is about sqrt(RADIX**REAL_MANTISSA) or            */
      /* RADIX**(REAL_MANTISSA/2)                                         */

      if LSSF(g, RADIX_to_Hlf_MANTISSA)
         CPYF(Result, LOGF(ADDF(g,SQRTF(ADDF(SQRF(x),ONE)))));
      else ADDF3(Result,LOGF(g),Ln_2);
      if LSZF(x) NEGF1(Result);
      return Result;
   }

   SQRF2(g, x);
   POLYF(Result, g, asinh_consts, asinh_consts_length);

   return ADDF(x,MPYF(x,Result));
