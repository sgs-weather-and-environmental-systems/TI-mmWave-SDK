/****************************************************************************/
/*  atanf_i.h         v8.1.3                                                */
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

/* _CODE_ACCESS REAL ATANF(REAL y) */

    #define Sqrt_3_Minus_1   CNST(0.73205080756887729353)
    #define Two_Minus_Sqrt_3 CNST(0.26794919243112270647)

    REAL f, g, Result;
    int n;

    ABSF2(f,y);

#if (REAL_MANTISSA <= 24) &&                        \
    (00*Adds_Per_Div + 80*Adds_Per_Mult + 100) <=   \
    (10*Adds_Per_Div + 60*Adds_Per_Mult +  90) &&   \
                                                    \
    (00*Adds_Per_Div + 80*Adds_Per_Mult + 100) <=   \
    (20*Adds_Per_Div + 50*Adds_Per_Mult +  80)
    {
       /* Adapted from "Software Manual for the Elementary Functions"   */
       /* Cody and Waite, Prentice Hall 1980. pages 150-163             */
       /* And from "Handbook of Mathematical Functions with Formulas,   */
       /* Graphs, and Mathematical Tables",                             */
       /* Milton Abramowitz and Irene A. Stegun,                        */
       /* National Bureau of Standards (Applied Mathematics Series 55), */
       /* Washington D.C., 1964 (reprinted 1970). 4.4.49, page 81       */

    #if (REAL_MANTISSA <= 25)
       #define arctan_consts_length 8
       static _DATA_ACCESS REAL arctan_consts[8] =
         {KNST( 0.0028662257),
          KNST(-0.0161657367),
          KNST( 0.0429096138),
          KNST(-0.0752896400),
          KNST( 0.1065626393),
          KNST(-0.1420889944),
          KNST( 0.1999355085),
          KNST(-0.3333314528)};
    #else
       #error "atan constant table not available for this size mantissa"
    #endif

       n = 0;
       if GTRF(f, ONE) { NEGF2(f, INVF(f)); n = 2; }

       SQRF2(g,f);

       POLYF(Result, g, arctan_consts, arctan_consts_length);
       ADDF3(Result, f, MPYF(f, Result));

       if NEZF(n) ADDF2(Result, Pi_Over_Two);
       if LSZF(y) NEGF1(Result);
       return Result;
    }
#else

    n = 0;
    if GTRF(f, ONE) { INVF1(f); n = 2; }

    if GTRF(f, Two_Minus_Sqrt_3) 
    {
       DIVF3(f, ADDF(SUBF(SUBF(MPYF(Sqrt_3_Minus_1,f),HALF),HALF),f),
                ADDF(Sqrt_3,f));
       n += 1;
    }

    SQRF2(g, f);

#if ( (REAL_MANTISSA <= 25) &&                     \
      (00*Adds_Per_Div + 30*Adds_Per_Mult + 30) <= \
      (10*Adds_Per_Div + 20*Adds_Per_Mult + 20)    \
    ) ||                                           \
                                                   \
    ( (REAL_MANTISSA >  25) &&                     \
      (REAL_MANTISSA <= 37) &&                     \
      (00*Adds_Per_Div + 50*Adds_Per_Mult + 50) <= \
      (10*Adds_Per_Div + 30*Adds_Per_Mult + 30)    \
    ) ||                                           \
                                                   \
    ( (REAL_MANTISSA >  37) &&                     \
      (REAL_MANTISSA <= 50) &&                     \
      (00*Adds_Per_Div + 80*Adds_Per_Mult + 80) <= \
      (10*Adds_Per_Div + 50*Adds_Per_Mult + 50)    \
    ) ||                                           \
                                                   \
    ( (REAL_MANTISSA >  50) &&                     \
      (REAL_MANTISSA <= 55) &&                     \
      (00*Adds_Per_Div + 80*Adds_Per_Mult + 80) <= \
      (10*Adds_Per_Div + 70*Adds_Per_Mult + 70)    \
    ) ||                                           \
						   \
    ( (REAL_MANTISSA >  55) &&		           \
      (REAL_MANTISSA <= 60) &&		           \
      (00*Adds_Per_Div +100*Adds_Per_Mult +100) <= \
      (10*Adds_Per_Div + 70*Adds_Per_Mult + 70)    \
    ) ||				           \
    (REAL_MANTISSA > 60)	 	  	  	        
    {
    #if (REAL_MANTISSA <= 25)
       #define arctan_consts_length 3
       static _DATA_ACCESS REAL arctan_consts[3] = /* max of 25 mantissa bits */
         {KNST(-1.28128822E-01), 
          KNST( 1.99356784E-01), 
          KNST(-3.33324221E-01)};

    #elif (REAL_MANTISSA <= 37)
       #define arctan_consts_length 5
       static _DATA_ACCESS REAL arctan_consts[5] = /* max of 37 mantissa bits */
         {KNST(-7.61199966284E-02), 
          KNST( 1.09962241177E-01), 
          KNST(-1.42815198524E-01), 
          KNST( 1.99999302364E-01), 
          KNST(-3.33333329073E-01)};

    #elif (REAL_MANTISSA <= 55)
       #define arctan_consts_length 8
       static _DATA_ACCESS REAL arctan_consts[8] = /* max of 55 mantissa bits */
         {KNST( 4.43866445452355097E-02), 
          KNST(-6.48311114205796814E-02), 
          KNST( 7.67935909024826520E-02), 
          KNST(-9.09037055918752267E-02), 
          KNST( 1.11110978784541423E-01), 
          KNST(-1.42857141024675987E-01), 
          KNST( 1.99999999987262364E-01), 
          KNST(-3.33333333333299198E-01)};

    #elif (REAL_MANTISSA <= 67)
       #define arctan_consts_length 10
       static _DATA_ACCESS REAL arctan_consts[10] = /* max of 67 mantissa bits */
         {KNST( 3.35156765377368663686E-02), 
          KNST(-5.03880113233286660560E-02), 
          KNST( 5.86147579567964335127E-02), 
          KNST(-6.66544337545558665438E-02), 
          KNST( 7.69226132474239149373E-02), 
          KNST(-9.09090795775675475016E-02), 
          KNST( 1.11111110938051506576E-01), 
          KNST(-1.42857142855598531341E-01), 
          KNST( 1.99999999999992924633E-01), 
          KNST(-3.33333333333333320680E-01)}; 

    #else
       #error "atan constant table not available for this size mantissa"
    #endif

       POLYF(Result, g, arctan_consts, arctan_consts_length);
    }
#else
    {
       REAL xnum,xden;

    #if (REAL_MANTISSA <= 24)
       #define P_length 2
       static _DATA_ACCESS REAL P[2] =
         {KNST(-0.5090958253e-1),
          KNST(-0.4708325141e+0)};

       #define Q_length 1
       static _DATA_ACCESS REAL Q[2] =
         {KNST( 0.1412500740e+1)};

    #elif (REAL_MANTISSA <= 32)
       #define P_length 2
       static _DATA_ACCESS REAL P[2] =
         {KNST(-0.720026848898e+0),
          KNST(-0.144008344874e+1)};

       #define Q_length 2
       static _DATA_ACCESS REAL Q[2] =
         {KNST( 0.475222584599e+1),
          KNST( 0.432025038919e+1)};

    #elif (REAL_MANTISSA <= 50)
       #define P_length 3
       static _DATA_ACCESS REAL P[3] =
         {KNST(-0.794391295408336251e+0),
          KNST(-0.427444985367930329e+1),
          KNST(-0.427432672026241096e+1)};

       #define Q_length 3
       static _DATA_ACCESS REAL Q[3] =
         {KNST(0.919789364835039806e+1),
          KNST(0.205171376564218456e+2),
          KNST(0.128229801607919841e+2)};

    #elif (REAL_MANTISSA <= 60)
       #define P_length 4
       static _DATA_ACCESS REAL P[4] =
         {KNST(-0.83758299368150059274e+0),
          KNST(-0.84946240351320683534e+1),
          KNST(-0.20505855195861651981e+2),
          KNST(-0.13688768894191926929e+2)};

       #define Q_length 4
       static _DATA_ACCESS REAL Q[4] =
         {KNST( 0.15024001160028576121e+2),
          KNST( 0.59578436142597344465e+2),
          KNST( 0.86157349597130242515e+2),
          KNST( 0.41066306682575781263e+2)};
    #else
       #error "atan constant table not available for this size mantissa"
    #endif

       /* xnum = (                (P1)*g + P0)*g */
       /* xnum = ((       (P2)*g + P1)*g + P0)*g */
       /* xnum = (((P3*g + P2)*g + P1)*g + P0)*g */
       POLYF (xnum, g, P, P_length);

       /* xden = (                           g + Q0) */
       /* xden = ((                  g + Q1)*g + Q0) */
       /* xden = (((         g + Q2)*g + Q1)*g + Q0) */
       /* xden = ((((g + Q3)*g + Q2)*g + Q1)*g + Q0) */
       POLYbF(xden, g, Q, Q_length);

       DIVF3(Result, xnum, xden);
    }
#endif

    ADDF3(Result, f, MPYF(f,Result));

    {
       static _DATA_ACCESS REAL A[4] =
         {KNST(0.0),
          KNST(3.14159265358979323846264338327950288419716939937510/6.0),
          KNST(3.14159265358979323846264338327950288419716939937510/2.0),
          KNST(3.14159265358979323846264338327950288419716939937510/3.0)};

       if GEZF(y)
          if (n > 1) RSBF2(Result, A[n]);
          else       ADDF2(Result, A[n]);
       else if (n > 1) SUBF2(Result, A[n]);
       else            SUBF3(Result, NEGF(Result), A[n]);
    }

    return Result;
#endif
