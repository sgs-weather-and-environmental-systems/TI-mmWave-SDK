/****************************************************************************/
/*  sinf_i.h         v8.1.3                                                 */
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

/* _CODE_ACCESS REAL SINF(REAL x) */

/* Adapted from "Software Manual for the Elementary Functions" */
/* Cody and Waite, Prentice Hall 1980. pages 127-133           */

#if (REAL_MANTISSA <= 32)
    #define C1 CNST(3.140625) /* 8#3.11#;*/
    #define C2 CNST(9.67653589793e-4)
#else
    #define C1 CNST(3.1416015625) /* 8#3.1104#;*/
    #define C2 CNST(-0.8908910206761537356617e-5)
#endif

#if (REAL_MANTISSA <= 24)
    #define R_length 4
    static _DATA_ACCESS REAL R[4] = 
       {KNST( 0.2601903036e-5),
        KNST(-0.1980741872e-3),
        KNST( 0.8333025139e-2),
        KNST(-0.1666665668e+0)};

#elif (REAL_MANTISSA <= 32)
    #define R_length 5
    static _DATA_ACCESS REAL R[5] = 
       {KNST(-0.2386834640601e-7),
        KNST( 0.2752397106775e-5),
        KNST(-0.1984083282313e-3),
        KNST( 0.8333330720556e-2),
        KNST(-0.1666666660883e-0)};

#elif (REAL_MANTISSA <= 50)
    #define R_length 7
    static _DATA_ACCESS REAL R[7] = 
       {KNST(-0.737066277507114174e-12),
        KNST( 0.160478446323816900e-9),
        KNST(-0.250518708834705760e-7),
        KNST( 0.275573164212926457e-5),
        KNST(-0.198412698232225068e-3),
        KNST( 0.833333333327592139e-2),
        KNST(-0.166666666666659653e-0)};

#elif (REAL_MANTISSA <= 60)
    #define R_length 8
    static _DATA_ACCESS REAL R[8] =
       {KNST( 0.27204790957888846175e-14),
        KNST(-0.76429178068910467734e-12),
        KNST( 0.16058936490371589114e-9),
        KNST(-0.25052106798274584544e-7),
        KNST( 0.27557319210152756119e-5),
        KNST(-0.19841269841201840457e-3),
        KNST( 0.83333333333331650314e-2),
        KNST(-0.16666666666666665052e+0)};
#else 
    #error "sin constant table not available for this size mantissa"
#endif

    int MustNegate, n;
    REAL f, g, xn, x1, Result, y;

    MustNegate = LSZF(x);
    ABSF2(y, x);
    CPYF(f, x); /* fast code for -PI/2..PI/2 */
    if GTRF(y, Pi_Over_Two) 
    {
       MPYF3(xn, y, One_Over_Pi);
#if (RND_GLITCH)
       if GEQF(xn, RND_MAX_P1)
#else
       if GEQF(y, INT_MOST_POS_P1)
#endif
       {
          REAL ip;
          CPYF(xn, ROUNDF(xn));
          n = NEZF(MODFF(MPYF(xn,HALF),&ip)); /* n holds 0 or 1 */
          CPYF(x1,TRUNCF(y));
       }
       else
       { 
          FIXFI2(n, ADDF(xn,HALF)); /* round (xn > 0) */
          FLTIF2(xn, n);
          TNCF2(x1, y);
       }

       /* f = ((x1 - xn * C1) + (y - x1)) - xn * C2; */
       SUBF3(f, ADDF(SUBF(x1, 
                          MPYF(xn,C1)), 
                     SUBF(y,x1)), 
                MPYF(xn,C2));

       /* protect against round-off and enhanced precision problems */
       if GTRF(ABSF(f), Pi_Over_Two)
          CPYF(f, (GTZF(f) ? Pi_Over_Two : NEGF(Pi_Over_Two)));

       if (MustNegate ^ (n & 1)) NEGF1(f);
    }

    SQRF2(g, f);

    POLYF(Result, g, R, R_length);

    ADDF3(Result, f, MPYF(f, Result));

    /* deal with round-off errors */
    if GTRF(ABSF(Result), ONE)
       Result = (GTRF(Result,ONE) ? ONE : CNST(-1.0));

    return Result;
