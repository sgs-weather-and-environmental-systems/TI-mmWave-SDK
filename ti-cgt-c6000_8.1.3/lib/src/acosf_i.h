/****************************************************************************/
/*  acosf_i.h         v8.1.3                                                */
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

/* _CODE_ACCESS REAL acosf(REAL x) */

#if ( (REAL_MANTISSA <= 24) &&         \
      (00*Adds_Per_Div + 70*Adds_Per_Mult <  \
       10*Adds_Per_Div + 60*Adds_Per_Mult)   \
    ) ||                                     \
                                             \
    ( (REAL_MANTISSA >  24) &&         \
      (REAL_MANTISSA <= 32) &&         \
      (00*Adds_Per_Div + 90*Adds_Per_Mult <  \
       10*Adds_Per_Div + 80*Adds_Per_Mult)   \
    ) ||                                     \
                                             \
    ( (REAL_MANTISSA >  32) &&         \
      (REAL_MANTISSA <= 36) &&         \
      (00*Adds_Per_Div +150*Adds_Per_Mult <  \
       10*Adds_Per_Div +100*Adds_Per_Mult)   \
    ) ||                                     \
                                             \
    ( (REAL_MANTISSA >  36) &&         \
      (REAL_MANTISSA <= 48) &&         \
      (00*Adds_Per_Div +150*Adds_Per_Mult <  \
       10*Adds_Per_Div +120*Adds_Per_Mult)   \
    ) ||                                     \
                                             \
    ( (REAL_MANTISSA >  48) &&         \
      (REAL_MANTISSA <= 55) &&         \
      (00*Adds_Per_Div +150*Adds_Per_Mult <  \
       10*Adds_Per_Div +140*Adds_Per_Mult)   \
    ) ||                                     \
                                             \
    ( (REAL_MANTISSA >  55) &&         \
      (REAL_MANTISSA <= 60) &&         \
      (00*Adds_Per_Div +180*Adds_Per_Mult <  \
       10*Adds_Per_Div +140*Adds_Per_Mult)   \
    ) ||                                     \
                                             \
    (REAL_MANTISSA > 60)
    {

    #if (REAL_MANTISSA <= 24)
       /* NOTE: this is the table for 2**-23 error. */
       /* The lost precision is very small.         */
       /* The 2**-24 table has one extra term.      */
       #define asin_consts_length 4
       static _DATA_ACCESS REAL asin_consts[4] = /* max of 23 mantissa bits */
         {KNST( 5.0505363E-02), 
          KNST( 3.9721134E-02), 
          KNST( 7.5464795E-02), 
          KNST( 1.6665163E-01)};

    #elif (REAL_MANTISSA <= 32)
       /* NOTE: this is the table for 2**-31 error. */
       /* The lost precision is very small.         */
       /* The 2**-32 table has one extra term.      */
       #define asin_consts_length 6
       static _DATA_ACCESS REAL asin_consts[6] = /* max of 31 mantissa bits */
          {KNST( 3.7806361520E-02), 
           KNST( 1.4198827965E-02), 
           KNST( 3.1884142973E-02), 
           KNST( 4.4505242015E-02), 
           KNST( 7.5005915019E-02), 
           KNST( 1.6666657213E-01)};

    #elif (REAL_MANTISSA <= 55)
       #define asin_consts_length 12
       static _DATA_ACCESS REAL asin_consts[12] = /* max of 55 mantissa bits*/
         {KNST( 3.20113401984953224E-02), 
          KNST(-1.63844362782365558E-02), 
          KNST( 1.96423966100052853E-02), 
          KNST( 6.48085538386000953E-03), 
          KNST( 1.21816790811969532E-02), 
          KNST( 1.38830278305348564E-02), 
          KNST( 1.73599699654365820E-02), 
          KNST( 2.23717366032023795E-02), 
          KNST( 3.03819602714948831E-02), 
          KNST( 4.46428567912157295E-02), 
          KNST( 7.50000000040485847E-02), 
          KNST( 1.66666666666648389E-01)};

    #elif (REAL_MANTISSA <= 67)
       #define asin_consts_length 15
       static _DATA_ACCESS REAL asin_consts[15] = /* max of 67 mantissa bits*/
         {KNST( 3.50097233287744160735E-02), 
          KNST(-3.19231927358398389441E-02), 
          KNST( 2.90925129347176907741E-02), 
          KNST(-2.82942472873752257758E-03), 
          KNST( 9.83526101569203071822E-03), 
          KNST( 7.90167517883753693383E-03), 
          KNST( 9.83027595393178364380E-03), 
          KNST( 1.15447699971302804266E-02), 
          KNST( 1.39653647716623968176E-02), 
          KNST( 1.73527369788878168682E-02), 
          KNST( 2.23721600865339137858E-02), 
          KNST( 3.03819444207947394834E-02), 
          KNST( 4.46428571431961682460E-02), 
          KNST( 7.49999999999974517938E-02), 
          KNST( 1.66666666666666674228E-01)};

    #else
       #error "acos constant table not available for this size mantissa"
    #endif

       REAL g, y, Result;

       ABSF2(y,x);

       if GTRF(y, HALF) 
       {
          if GTRF(y, ONE) { errno = EDOM; CPYF(y, ONE); }

          MPYF3(g, ADDF(SUBF(HALF,y), HALF), HALF);
          MPYF3(y, CNST(-2.0), SQRTF(g));

          POLYF(Result, g, asin_consts, asin_consts_length);

 	  ADDF3(Result, y,  MPYF(y, Result));
 	  if LEZF(x) 
             ADDF3(Result, ADDF(Pi_Over_Two, Result), Pi_Over_Two);
          else NEGF1(Result);

       } 
       else /* y < 0.5 */
       { 
          SQRF2(g,y);

          POLYF(Result, g, asin_consts, asin_consts_length);

          ADDF3(Result, y, MPYF(y, Result));
 	  if LEZF(x)
             ADDF3(Result, ADDF(Pi_Over_Four, Result), Pi_Over_Four);
          else
             ADDF3(Result, SUBF(Pi_Over_Four, Result), Pi_Over_Four);
       }
       return Result;
    }
#else
    {
       /* Adapted from "Software Manual for the Elementary Functions" */
       /* Cody and Waite, Prentice Hall 1980. pages 174-184           */

       REAL g, y, Result, z, xnum, xden;

    #if (REAL_MANTISSA <= 24)
       #define P_length 2
       static _DATA_ACCESS REAL P[2] =
         {KNST(-0.504400557e+0),
          KNST( 0.933935835e+0)};

       #define Q_length 2
       static _DATA_ACCESS REAL Q[2] =
         {KNST(-0.554846723e+1),
          KNST( 0.560363004e+1)};

    #elif (REAL_MANTISSA <= 36)
       #define P_length 3
       static _DATA_ACCESS REAL P[3] =
         {KNST(-0.59450144193246e+0),
          KNST( 0.29058762374859e+1),
          KNST(-0.27516555290596e+1)};

       #define Q_length 3
       static _DATA_ACCESS REAL Q[3] =
         {KNST(-0.10333867072113e+2),
          KNST( 0.24864728969164e+2),
          KNST(-0.16509933202424e+2)};

    #elif (REAL_MANTISSA <= 48)
       #define P_length 4
       static _DATA_ACCESS REAL P[4] =
         {KNST(-0.654040689993350_09e+0),
          KNST( 0.596831576177515_34e+1),
          KNST(-0.134287079134253_12e+2),
          KNST( 0.853721643667719_50e+1)};

       #define Q_length 4
       static _DATA_ACCESS REAL Q[4] =
         {KNST(-0.164295575574951_70e+2),
          KNST( 0.687195976538088_06e+2),
          KNST(-0.103622731864014_80e+3),
          KNST( 0.512232986201096_91e+2)};

    #elif (REAL_MANTISSA <= 60)
       #define P_length 5
       static _DATA_ACCESS REAL P[5] =
         {KNST(-0.69674573447350646411e+0),
          KNST( 0.10152522233806463645e+2),
          KNST(-0.39688862997504877339e+2),
          KNST( 0.57208227877891731407e+2),
          KNST(-0.27368494524164255994e+2)};

       #define Q_length 5
       static _DATA_ACCESS REAL Q[5] =
         {KNST(-0.23823859153670238830e+2),
          KNST( 0.15095270841030604719e+3),
          KNST(-0.38186303361750149284e+3),
          KNST( 0.41714430248260412556e+3),
          KNST(-0.16421096714498560795e+3)};

    #else
       #error "acos constant table not available for this size mantissa"
    #endif

       ABSF2(y,x);

       if GTRF(y, HALF)
       {
          if GTRF(y, ONE) { errno = EDOM; CPYF(y, ONE); }

          MPYF3(g, ADDF(SUBF(HALF,y), HALF), HALF); /* g=((0.5-y)+0.5)*0.5; */
          MPYF3(y, CNST(-2.0), SQRTF(g));           /* y= -2.0*sqrt(g); */
          POLYF(xnum, g, P, P_length);
          POLYbF(xden, g, Q, Q_length);

          /* Result = xnum/xden */
          DIVF3(Result, xnum, xden);

 	  ADDF3(Result, y, MPYF(y, Result));
 	  if LEZF(x)
              ADDF3(Result, ADDF(Pi_Over_Two, Result), Pi_Over_Two);
          else NEGF1(Result);
       }
       else 
       {
          SQRF2(g,y);
          POLYF(xnum, g, P, P_length);
          POLYbF(xden, g, Q, Q_length);

          /* Result = xnum/xden */
          DIVF3(Result, xnum, xden);

          ADDF3(Result, y, MPYF(y, Result));
 	  if LEZF(x) 
             ADDF3(Result, ADDF(Pi_Over_Four, Result), Pi_Over_Four);
          else
             ADDF3(Result, SUBF(Pi_Over_Four, Result), Pi_Over_Four);
       }
       return Result;
    }
#endif
