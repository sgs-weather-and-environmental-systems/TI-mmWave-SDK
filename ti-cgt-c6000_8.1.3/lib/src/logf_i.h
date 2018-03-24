/****************************************************************************/
/*  logf_i.h         v8.1.3                                                 */
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

/* _CODE_ACCESS REAL LOGF(REAL x) */

    if LEZF(x)
    { 
       errno = (EQZF(x) ? ERANGE : EDOM); 
       return -INFINITY;
    }

#if (( (REAL_MANTISSA <= 24) &&                       \
       (                  100*Adds_Per_Mult + 120) <= \
       (20*Adds_Per_Div +  60*Adds_Per_Mult +  60)    \
     ) ||                                             \
                                                      \
     ( (REAL_MANTISSA >  24) &&                       \
       (REAL_MANTISSA <= 32) &&                       \
       (                  130*Adds_Per_Mult + 150) <= \
       (20*Adds_Per_Div +  70*Adds_Per_Mult +  70)    \
     ) ||                                             \
                                                      \
     ( (REAL_MANTISSA >  32) &&                       \
       (REAL_MANTISSA <= 40) &&                       \
       (                  160*Adds_Per_Mult + 180) <= \
       (20*Adds_Per_Div +  80*Adds_Per_Mult +  90)    \
     ) ||                                             \
                                                      \
     ( (REAL_MANTISSA >  40) &&                       \
       (REAL_MANTISSA <= 48) &&                       \
       (                  210*Adds_Per_Mult + 230) <= \
       (20*Adds_Per_Div +  80*Adds_Per_Mult +  90)    \
     ) ||                                             \
                                                      \
     ( (REAL_MANTISSA >  48) &&                       \
       (REAL_MANTISSA <= 53) &&                       \
       (                  210*Adds_Per_Mult + 230) <= \
       (20*Adds_Per_Div +  90*Adds_Per_Mult + 100)    \
     ) ||                                             \
                                                      \
     ( (REAL_MANTISSA >  53) &&                       \
       (REAL_MANTISSA <= 60) &&                       \
       (                  250*Adds_Per_Mult + 270) <= \
       (20*Adds_Per_Div + 100*Adds_Per_Mult + 110)    \
     ) ||                                             \
                                                      \
     (REAL_MANTISSA > 60)                             \
    )
{
    REAL    result, f;
    EXPONENT_TYPE n;


#if (REAL_MANTISSA <= 24) /* ieee single and c3x 32-bit*/

    #define log_consts_length 8
    static _DATA_ACCESS REAL log_consts[8] = /* max of 24 mantissa bits */
      {KNST( 8.7416954E-02), 
       KNST(-1.4376735E-01), 
       KNST( 1.4949567E-01), 
       KNST(-1.6560792E-01), 
       KNST( 1.9956945E-01), 
       KNST(-2.5002149E-01), 
       KNST( 3.3334184E-01), 
       KNST(-4.9999987E-01)};

#elif (REAL_MANTISSA <= 32) /* c3x 40-bit format*/

    #define log_consts_length 11
    static _DATA_ACCESS REAL log_consts[11] = /* max of 32 mantissa bits */
      {KNST(-5.9948876422E-02), 
       KNST( 1.0740858928E-01), 
       KNST(-1.0879955514E-01), 
       KNST( 1.1019579267E-01), 
       KNST(-1.2410574674E-01), 
       KNST( 1.4285630078E-01), 
       KNST(-1.6670485228E-01), 
       KNST( 2.0000109075E-01), 
       KNST(-2.4999933278E-01), 
       KNST( 3.3333331567E-01), 
       KNST(-5.0000000331E-01)};

#elif (REAL_MANTISSA <= 40)

    #define log_consts_length 14
    static _DATA_ACCESS REAL log_consts[14] = /* max of 40 mantissa bits */
      {KNST( 4.384785804275E-02), 
       KNST(-8.566675910180E-02), 
       KNST( 8.741857936426E-02), 
       KNST(-8.290469519717E-02), 
       KNST( 8.951441396745E-02), 
       KNST(-9.990210180317E-02), 
       KNST( 1.111985273203E-01), 
       KNST(-1.250092976683E-01), 
       KNST( 1.428543403284E-01), 
       KNST(-1.666663594152E-01), 
       KNST( 2.000000436132E-01), 
       KNST(-2.500000039109E-01), 
       KNST( 3.333333330693E-01), 
       KNST(-4.999999999865E-01)};

#elif (REAL_MANTISSA <= 53) /* ieee single has 53 bits*/

    #define log_consts_length 19
    static _DATA_ACCESS REAL log_consts[19] = /* max of 53 mantissa bits */
      {KNST(-2.8320346823389751E-02), 
       KNST( 6.3377487278468469E-02), 
       KNST(-6.7989403577853224E-02), 
       KNST( 5.9730372621315949E-02), 
       KNST(-6.0368740625679260E-02), 
       KNST( 6.6207560420972032E-02), 
       KNST(-7.1608576653549746E-02), 
       KNST( 7.6978956356277541E-02), 
       KNST(-8.3325094121990836E-02), 
       KNST( 9.0905658194290721E-02), 
       KNST(-1.0000019801950231E-01), 
       KNST( 1.1111122908987891E-01), 
       KNST(-1.2499999800018303E-01), 
       KNST( 1.4285714061889064E-01), 
       KNST(-1.6666666666434965E-01), 
       KNST( 2.0000000002119229E-01), 
       KNST(-2.5000000000013650E-01), 
       KNST( 3.3333333333325586E-01), 
       KNST(-4.9999999999999963E-01)};

#elif (REAL_MANTISSA <= 56) /* C3x 64-bit float has 56 bits*/

    #define log_consts_length 20
    static _DATA_ACCESS REAL log_consts[20] = /* max of 56 mantissa bits */
      {KNST( 2.61772515982749177E-02), 
       KNST(-6.00995302636955039E-02), 
       KNST( 6.53378571493355612E-02), 
       KNST(-5.67830341690497835E-02), 
       KNST( 5.65748113142806050E-02), 
       KNST(-6.19394897532471993E-02), 
       KNST( 6.68613655882409203E-02), 
       KNST(-7.15002373346330142E-02), 
       KNST( 7.69142031272224894E-02), 
       KNST(-8.33285567695006977E-02), 
       KNST( 9.09092774252929761E-02), 
       KNST(-1.00000183975689229E-01), 
       KNST( 1.11111111062023799E-01), 
       KNST(-1.24999995900431353E-01), 
       KNST( 1.42857142790488397E-01), 
       KNST(-1.66666666716087053E-01), 
       KNST( 2.00000000000972817E-01), 
       KNST(-2.49999999999727481E-01), 
       KNST( 3.33333333333329279E-01), 
       KNST(-5.00000000000000445E-01)};

#elif (REAL_MANTISSA <= 64) /* ieee 80-bit has 63 bits*/

    #define log_consts_length 23
    static _DATA_ACCESS REAL log_consts[23] = /* max of 64 mantissa bits */
      {KNST(-2.0939815930657012912E-02), 
       KNST( 5.1747593931902145886E-02), 
       KNST(-5.8780969560205103428E-02), 
       KNST( 4.9873837795411210999E-02), 
       KNST(-4.7478134920689058684E-02), 
       KNST( 5.1716595217663079831E-02), 
       KNST(-5.5775474906849027241E-02), 
       KNST( 5.8956557694683903068E-02), 
       KNST(-6.2492570948513219480E-02), 
       KNST( 6.6655894175565864348E-02), 
       KNST(-7.1428337122436565306E-02), 
       KNST( 7.6923614788679565500E-02), 
       KNST(-8.3333365888026232021E-02), 
       KNST( 9.0909073928383202553E-02), 
       KNST(-9.9999998663167513373E-02), 
       KNST( 1.1111111144482012011E-01), 
       KNST(-1.2500000002760578658E-01), 
       KNST( 1.4285714285328289890E-01), 
       KNST(-1.6666666666637705516E-01), 
       KNST( 2.0000000000002330918E-01), 
       KNST(-2.5000000000000133157E-01), 
       KNST( 3.3333333333333327702E-01), 
       KNST(-4.9999999999999999825E-01)};

#else
    #error "log constant table not available for this size mantissa"
#endif

    RIPF(x, f, n);

    if LEQF(f, One_Over_Sqrt_2) 
    {
       ADDF2(f, f);
       n -= 1;
    }

    SUBF3(f,SUBF(f,HALF),HALF); /* do it this way to avoid losing bits */

    /* abs(F) < .414213562... at this point */

    POLYF(result,f,log_consts,log_consts_length);

    ADDF3(result, f, MPYF(f, result)); /* result = f+f*result; */

    /* return result + (REAL)n * Ln_2; */
    return ADDF(result, MPYF(FLTIF(n), Ln_2));
}
#else
    /* Adapted from "Software Manual for the Elementary Functions" */
    /* Cody and Waite, Prentice Hall 1980. pages 35-45             */
{
    REAL    result, f, z, xn, zden, znum, w;
    EXPONENT_TYPE n;

#if (REAL_MANTISSA <= 24)

    #define A_length 1
    static _DATA_ACCESS REAL A[1] = 
       {KNST(-0.5527074855e+0)};

    #define B_length 1
    static _DATA_ACCESS REAL B[1] = 
       {KNST(-0.6632718214e+1)};

#elif (REAL_MANTISSA <= 32)

    #define A_length 2
    static _DATA_ACCESS REAL A[2] = 
       {KNST(-0.4649062303464e+0),
        KNST( 0.1360095468621e-1)};

    #define B_length 1
    static _DATA_ACCESS REAL B[1] = 
       {KNST(-0.5578873750242e+1)};

#elif (REAL_MANTISSA <= 48)

    #define A_length 3
    static _DATA_ACCESS REAL A[3] = 
       {KNST(-0.44445515109803323e-2),
        KNST(-0.63260866233859665e+0),
        KNST( 0.37339168963160866e+1)};

    #define B_length 2
    static _DATA_ACCESS REAL B[2] = 
       {KNST(-0.14312354355885324e+2),
        KNST( 0.44807002755736436e+2)};

#elif (REAL_MANTISSA <= 60)

    #define A_length 3
    static _DATA_ACCESS REAL A[3] = 
       {KNST(-0.78956112887491257267e+0),
        KNST( 0.16383943563021534222e+2),
        KNST(-0.64124943423745581147e+2)};

    #define B_length 3
    static _DATA_ACCESS REAL B[3] = 
       {KNST(-0.35667977739034646171e+2),
        KNST( 0.31203222091924532844e+3),
        KNST(-0.76949932108494879777e+3)};

#else
    #error "log constant table not available for this size mantissa"
#endif

#define C0 CNST(0.70710678118654752440)

    RIPF(x, f, n);

    SUBF3(znum, f, HALF);
    if GTRF(f, C0) 
    {
       SUBF2(znum,HALF);
       MPYF3(zden, f, HALF);
    }
    else 
    {
       n -= 1;
       MPYF3(zden, znum, HALF);
    }

    DIVF3(z, znum, ADDF(zden, HALF));

    SQRF2(w, z);

    POLYF(znum, w, A, A_length);
    POLYbF(zden, w, B, B_length);

    DIVF3(result, znum, zden); 
    ADDF3(result, z, MPYF(z, result));

    if (n == 0) return result;

    FLTIF2(xn, n);

    #define C1 CNST(0.693359375) /* 355/512 */
    #define C2 CNST(-2.121944400546905827679E-4)

    return ADDF(ADDF(MPYF(xn,C2),
                     result),
                MPYF(xn,C1));
}
#endif

