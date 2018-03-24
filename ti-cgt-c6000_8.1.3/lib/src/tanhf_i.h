/****************************************************************************/
/*  tanhf_i.h         v8.1.3                                                */
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

/* _CODE_ACCESS REAL TANHF(REAL x) */

    #define Ln_3_Over_2 CNST(0.54930614433405484570)

#if (REAL_MANTISSA <= 24)
    #define P_length 2
    static _DATA_ACCESS REAL P[2] =
      {KNST(-0.3831010665e-2),
       KNST(-0.8237728127e+0)};

    #define Q_length 1
    static _DATA_ACCESS REAL Q[1] =
      {KNST( 0.2471319654e+1)};

#elif (REAL_MANTISSA <= 36)
    #define P_length 2
    static _DATA_ACCESS REAL P[2] =
      {KNST(-0.93363475652401e+0),
       KNST(-0.21063958000245e+2)};

    #define Q_length 2
    static _DATA_ACCESS REAL Q[2] =
      {KNST(0.28077653470471e+2),
       KNST(0.63191874015582e+2)};

#elif (REAL_MANTISSA <= 48)
    #define P_length 3
    static _DATA_ACCESS REAL P[3] =
      {KNST(-0.36242421934642173e-3),
       KNST(-0.92318689451426177e+0),
       KNST(-0.19059522426982292e+2)};

    #define Q_length 2
    static _DATA_ACCESS REAL Q[2] =
      {KNST(0.25640987595178975e+2),
       KNST(0.57178567280965817e+2)};

#elif (REAL_MANTISSA <= 60)
    #define P_length 3
    static _DATA_ACCESS REAL P[3] =
      {KNST(-0.96437492777225469787e+0),
       KNST(-0.99225929672236083313e+2),
       KNST(-0.16134119023996228053e+4)};

    #define Q_length 3
    static _DATA_ACCESS REAL Q[3] =
      {KNST(0.11274474380534949335e+3),
       KNST(0.22337720718962312926e+4),
       KNST(0.48402357071988688686e+4)};
#else 
    #error "tanh constant table not available for this size mantissa"
#endif

    REAL g, y, Result;

    ABSF2(y,x);

    if GTRF(y, Ln_3_Over_2) 
    {
       if GTRF(y, TANH_Max) 
       {
          if LSZF(x) return M_ONE;
          return ONE;
       }
       SUBF3(Result, HALF,INVF((EXPF(ADDF(y,y)) + ONE)));
       ADDF2(Result, Result);
       if LSZF(x) NEGF1(Result);
       return Result;
    }

    /* probably not needed if underflow turns into 0.0 */
    /* if LSSF(y, RADIX_to_M_Hlf_MANTISSA) return x; */

    SQRF2(g,y);

    POLYF (Result,g,P,P_length);
    POLYbF(y,g,Q,Q_length);
    DIVF2(Result,y);

    return ADDF(x, MPYF(x,Result));
