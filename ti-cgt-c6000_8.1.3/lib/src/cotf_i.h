/****************************************************************************/
/*  cotf_i.h         v8.1.3                                                 */
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

/* _CODE_ACCESS REAL COTF(REAL x) */

/* Adapted from "Software Manual for the Elementary Functions" */
/* Cody and Waite, Prentice Hall 1980. pages 150-163           */

#if (REAL_MANTISSA <= 32)
    #define C1 CNST(1.5703125) /* 8#1.444#*/
    #define C2 CNST(4.83826794897e-4)
#else
    #define C1 CNST(1.57080078125) /* 8#1.4442#*/
    #define C2 CNST(-0.4454455103380768678308e-5)
#endif

#if (REAL_MANTISSA <= 24)
    #define P_length 1
    static _DATA_ACCESS REAL P[1] =
       {KNST(-0.958017723e-1)};

    #define Q_length 2
    static _DATA_ACCESS REAL Q[2] =
       {KNST( 0.971685835e-2),
        KNST(-0.429135777e+0)};

#elif (REAL_MANTISSA <= 32)
    #define P_length 2
    static _DATA_ACCESS REAL P[2] =
       {KNST( 0.1075154738488e-2),
        KNST(-0.1113614403566e+0)};

    #define Q_length 2
    static _DATA_ACCESS REAL Q[2] =
       {KNST( 0.1597339213300e-1),
        KNST(-0.4446947720281e+0)};

#elif (REAL_MANTISSA <= 52)
    #define P_length 3
    static _DATA_ACCESS REAL P[3] =
       {KNST(-0.7483634966612065149e-5),
        KNST( 0.2805918241169988906e-2),
        KNST(-0.1282834704095743847e+0)};

    #define Q_length 3
    static _DATA_ACCESS REAL Q[3] =
       {KNST(-0.2084480442203870948e-3),
        KNST( 0.2334485282206872802e-1),
        KNST(-0.4616168037429048840e+0)};

#elif (REAL_MANTISSA <= 60)
    #define P_length 3
    static _DATA_ACCESS REAL P[3] =
       {KNST(-0.17861707342254426711e-4),
        KNST( 0.34248878235890589960e-2),
        KNST(-0.13338350006421960681e+0)};

    #define Q_length 4
    static _DATA_ACCESS REAL Q[4] =
       {KNST( 0.49819433993786512270e-6),
        KNST(-0.31181531907010027307e-3),
        KNST( 0.25663832289440112864e-1),
        KNST(-0.46671683339755294240e+0)};
#else
    #error "cot constant table not available for this size mantissa"
#endif

    REAL y, xn, f, g, x1, xnum, xden;
    int n;

    ABSF2(y, x);

#if (LEAST_POS_INVERTABLE_NOT_LEAST_POS)
    if LSSF(y, REAL_LEAST_POS_INVERTABLE) {
       if LSZF(x) return REAL_MOST_NEG;
       if EQZF(x) errno = EDOM;
       return REAL_MOST_POS;
    }
#endif

    MPYF3(xn, x, Two_Over_Pi);
#if (RND_GLITCH)
    if GEQF(y, RND_MAX_P1)
#else
    if GEQF(y, INT_MOST_POS_P1)
#endif
    {
       REAL ip;
       CPYF(xn,ROUNDF(xn));
       n = NEZF(MODFF(MPYF(xn,HALF),&ip)); /* n holds 0 or 1 */
       CPYF(x1,TRUNCF(x));
    } 
    else 
    {
       if GEZF(xn) FIXFI2(n, ADDF(xn,HALF));
       else        FIXFI2(n, SUBF(xn,HALF));
       FLTIF2(xn, n);
       TNCF2(x1, x);
    }

    /* f  = ((x1 - xn * C1) + (x - x1)) - xn * C2; */
    SUBF3(f, ADDF(SUBF(x1,MPYF(xn,C1)), SUBF(x,x1)), MPYF(xn,C2));

    /* protect against round-off and enhanced precision problems */
    if GTRF(ABSF(f), Pi_Over_Four)
       f = (GTZF(f) ? Pi_Over_Four : NEGF(Pi_Over_Four));

    SQRF2(g,f);

    /* xnum = ((                P1)*g*f + f); */
    /* xnum = (((       P2)*g + P1)*g*f + f); */
    /* xnum = (((P3*g + P2)*g + P1)*g*f + f); */
    POLYF(xnum, g, P, P_length)
    MPYF2(xnum,f);
    ADDF2(xnum,f);

    /* xden = ((((                Q2)*g + Q1)*g + 0.5) + 0.5); */
    /* xden = (((((       Q3)*g + Q2)*g + Q1)*g + 0.5) + 0.5); */
    /* xden = (((((Q4*g + Q3)*g + Q2)*g + Q1)*g + 0.5) + 0.5); */
    POLYF(xden, g, Q, Q_length);
    ADDF2(xden,HALF);  /* do not compose these two adds! */
    ADDF2(xden,HALF);

    if (n & 1)    return NEGF(DIVF(xnum, xden));
    if NEZF(xnum) return      DIVF(xden, xnum);

    errno = ERANGE;
    if LSZF(xden) return REAL_MOST_NEG;
    return REAL_MOST_POS;
