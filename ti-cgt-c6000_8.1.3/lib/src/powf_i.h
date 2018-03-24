/****************************************************************************/
/*  powf_i.h         v8.1.3                                                 */
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

/* _CODE_ACCESS REAL POWF(REAL x, REAL y) */

/* Adapted from "Software Manual for the Elementary Functions"               */
/* Cody and Waite, Prentice Hall 1980. pages 84-112.                         */
    #define K CNST(0.44269504088896340736)

#if (REAL_MANTISSA == 24)
    static _DATA_ACCESS REAL A1[17] = /* 24 mantissa bits */
      {KNST( 1.0000000000000E+00), 
       KNST( 9.5760327577590E-01), 
       KNST( 9.1700404882431E-01), 
       KNST( 8.7812608480453E-01), 
       KNST( 8.4089642763137E-01), 
       KNST( 8.0524516105651E-01), 
       KNST( 7.7110540866851E-01), 
       KNST( 7.3841309547424E-01), 
       KNST( 7.0710676908493E-01), 
       KNST( 6.7712777853012E-01), 
       KNST( 6.4841979742050E-01), 
       KNST( 6.2092888355255E-01), 
       KNST( 5.9460353851318E-01), 
       KNST( 5.6939429044723E-01), 
       KNST( 5.4525387287139E-01), 
       KNST( 5.2213686704635E-01), 
       KNST( 5.0000000000000E-01)};

    static _DATA_ACCESS REAL A2[8] = /* 24 mantissa bits */
      {KNST( 4.9226642231081E-09), 
       KNST(-4.6178851705532E-09), 
       KNST( 4.9181085994022E-09), 
       KNST(-2.2504493508369E-08), 
       KNST(-5.0616744854603E-09), 
       KNST( 2.2484190754765E-08), 
       KNST( 2.6931110719430E-08), 
       KNST( 2.4167350718989E-08)};

#elif (REAL_MANTISSA == 32)
    static _DATA_ACCESS REAL A1[17] = /* 32 mantissa bits */
      {KNST( 1.0000000000000000E+00), 
       KNST( 9.5760328066535294E-01), 
       KNST( 9.1700404323637485E-01), 
       KNST( 8.7812608014792203E-01), 
       KNST( 8.4089641529135406E-01), 
       KNST( 8.0524516594596207E-01), 
       KNST( 7.7110541262663900E-01), 
       KNST( 7.3841307288967072E-01), 
       KNST( 7.0710678119212388E-01), 
       KNST( 6.7712777340784668E-01), 
       KNST( 6.4841977739706635E-01), 
       KNST( 6.2092890613712370E-01), 
       KNST( 5.9460355760529637E-01), 
       KNST( 5.6939431745558977E-01), 
       KNST( 5.4525386635214090E-01), 
       KNST( 5.2213689126074314E-01), 
       KNST( 5.0000000000000000E-01)};

    static _DATA_ACCESS REAL A2[8] = /* 32 mantissa bits */
      {KNST( 3.3220706376918428E-11), 
       KNST( 3.8727702524097887E-11), 
       KNST( 2.8665082670998126E-11), 
       KNST( 8.0078926056307744E-11), 
       KNST( 6.0599674924764205E-11), 
       KNST(-1.0038167965976526E-10), 
       KNST(-7.7243944418836810E-11), 
       KNST(-4.7036221013333167E-11)};

#elif (REAL_MANTISSA == 53)
    static _DATA_ACCESS REAL A1[17] = /* 53 mantissa bits */
      {KNST( 1.0000000000000000000000E+00), 
       KNST( 9.5760328069857370003603E-01), 
       KNST( 9.1700404320467121532800E-01), 
       KNST( 8.7812608018664972675537E-01), 
       KNST( 8.4089641525371450203607E-01), 
       KNST( 8.0524516597462714173616E-01), 
       KNST( 7.7110541270397037205697E-01), 
       KNST( 7.3841307296974967311342E-01), 
       KNST( 7.0710678118654757273731E-01), 
       KNST( 6.7712777346844632564426E-01), 
       KNST( 6.4841977732550482027562E-01), 
       KNST( 6.2092890603674200100670E-01), 
       KNST( 5.9460355750136051344867E-01), 
       KNST( 5.6939431737834578228785E-01), 
       KNST( 5.4525386633262884483741E-01), 
       KNST( 5.2213689121370687740153E-01), 
       KNST( 5.0000000000000000000000E-01)};

    static _DATA_ACCESS REAL A2[8] = /* 53 mantissa bits */
      {KNST(-5.3099730280915798358278E-17), 
       KNST( 1.4800703477186887541150E-17), 
       KNST( 1.2353596284702224819370E-17), 
       KNST(-1.7419972784343138430526E-17), 
       KNST( 3.8504741898901862864758E-17), 
       KNST( 2.3290137959059464613378E-17), 
       KNST( 4.4564063380522338321302E-17), 
       KNST( 4.2759448527536717652507E-17)};

#elif (REAL_MANTISSA == 56)
    static _DATA_ACCESS REAL A1[17] = /* 56 mantissa bits */
      {KNST( 1.00000000000000000000000E+00), 
       KNST( 9.57603280698573644524884E-01), 
       KNST( 9.17004043204671229205793E-01), 
       KNST( 8.78126080186649740633164E-01), 
       KNST( 8.40896415253714543669438E-01), 
       KNST( 8.05245165974627155613951E-01), 
       KNST( 7.71105412703970413690335E-01), 
       KNST( 7.38413072969749659235638E-01), 
       KNST( 7.07106781186547531103947E-01), 
       KNST( 6.77127773468446367277628E-01), 
       KNST( 6.48419777325504834153413E-01), 
       KNST( 6.20928906036742028762276E-01), 
       KNST( 5.94603557501360527326461E-01), 
       KNST( 5.69394317378345823921215E-01), 
       KNST( 5.45253866332628830959627E-01), 
       KNST( 5.22136891213706919034898E-01), 
       KNST( 5.00000000000000000000000E-01)};

    static _DATA_ACCESS REAL A2[8] = /* 56 mantissa bits */
      {KNST( 2.41142095034202866290350E-18), 
       KNST( 9.22915669372430785854714E-19), 
       KNST(-1.52419152311223193592441E-18), 
       KNST(-3.54218497652868167523152E-18), 
       KNST(-3.12862152454150740112787E-18), 
       KNST(-4.46543765656944889721214E-18), 
       KNST( 2.93069995707896805541641E-18), 
       KNST( 1.12608510409334738662090E-18)};
#else
    #error "pow constant table not available for this size mantissa"
#endif

#if (REAL_MANTISSA <= 24)
    #define P_length 1
    static _DATA_ACCESS REAL P[1] =
       {KNST(0.83357541e-1)};

#elif (REAL_MANTISSA <= 36)
    #define P_length 2
    static _DATA_ACCESS REAL P[5] =
       {KNST(0.125064850052E-1),
	KNST(0.833333286245E-1)};

#elif (REAL_MANTISSA <= 50)
    #define P_length 3
    static _DATA_ACCESS REAL P[3] =
       {KNST(0.2233824352815418e-2),
	KNST(0.1249999796500608e-1),
	KNST(0.8333333333412136e-1)};

#elif (REAL_MANTISSA <= 64)
    #define P_length 4
    static _DATA_ACCESS REAL P[4] =
       {KNST(0.43445775672163119635e-3),
        KNST(0.22321421285924258967e-2),
        KNST(0.12500000000503799174e-1),
        KNST(0.83333333333333211405e-1)};
#else
    #error "pow constant table not available for this size mantissa"
#endif

#if (REAL_MANTISSA <= 24)
    #define Q_length 3
    static _DATA_ACCESS REAL Q[3] =
       {KNST(0.54360383e-1),
	KNST(0.24018510e+0),
	KNST(0.69314675e+0)};

#elif (REAL_MANTISSA <= 45)
    #define Q_length 5
    static _DATA_ACCESS REAL Q[5] =
       {KNST(0.130525515942810E-2),
	KNST(0.961620659583789E-2),
	KNST(0.555040488130765E-1),
	KNST(0.240226506144710),
        KNST(0.693147180556341)};

#elif (REAL_MANTISSA <= 52)
    #define Q_length 6
    static _DATA_ACCESS REAL Q[6] =
       {KNST(0.150774061788142382e-3),
	KNST(0.133308101134082075e-2),
	KNST(0.961811769138724104e-2),
	KNST(0.555041084247568661e-1),
	KNST(0.240226506956777522e+0),
        KNST(0.693147180559937815e+0)};

#elif (REAL_MANTISSA <= 64)
    #define Q_length 7
    static _DATA_ACCESS REAL Q[7] =
       {KNST(0.14928852680595608186e-4),
	KNST(0.15400290440989764601e-3),
	KNST(0.13333541313585784703e-2),
	KNST(0.96181290595172416964e-2),
	KNST(0.55504108664085595326e-1),
	KNST(0.24022650695909537056e+0),
        KNST(0.69314718055994529629e+0)};
#else
    #error "pow constant table not available for this size mantissa"
#endif

    REAL g, z, v, r, u1, u2, w1, w2, w3, y1, y2, w, ip;
    EXPONENT_TYPE m;
    int p, iw1, i;

    if LEZF(x) 
    {
       if LSZF(x) 
       {
          if (NEQF(TRUNCF(y), y)) {errno = EDOM; return POWF(x,(ROUNDF(y)));}
          CPYF(z, POWF(ABSF(x),y));
          if (GEQF(y, INT_MOST_NEG) && LSSF(y, INT_MOST_POS_P1)){
             if (FIXFI(y) & 1) NEGF1(z); /* odd */
	  } else {
             if NEZF(MODFF(MPYF(y,HALF),&ip)) NEGF1(z);
          }
          return z;
      }
      if LSZF(y) { errno = EDOM; return REAL_MOST_NEG; }
      if EQZF(y) return ONE;
      return x; /* x holds 0 */
    }
     
    if EQLF(x, ONE) return x;         /* pow(1.0,y) == 1.0 */
    if EQLF(y, ONE) return x;         /* pow(x,1.0) == 1.0 */

    if EQLF(y, REAL_MOST_POS)
    {
        if EQLF(x, REAL_MOST_POS) { errno = ERANGE; return INFINITY; }
        if EQLF(x, REAL_LEAST_POS) return ZERO;
    }


    RIPF(x, g, m);

    /* fast more accurate path for (RADIX**(m-1))**y, y is whole number */
    if EQLF(g,One_Over_RADIX)
    {
       p = FIXFI(y); /* overflow OK here */
       if EQLF(FLTIF(p),y) /*EQZF(MODFF(y,&ip))*/
          return SCLF(ONE,(m-1)*p);
    }

    p = 1;
    if LEQF(g, A1[  (9-1)]) p =  9;
    if LEQF(g, A1[p+(4-1)]) p += 4;
    if LEQF(g, A1[p+(2-1)]) p += 2;

    CPYF(z,A1[p+(1-1)]);

    /* z = ((g - z) - A2[(p+(1-1))/2])/(g + z); */
    DIVF3(z, SUBF(SUBF(g,z), 
                  A2[(p+1)/2-1]),
             ADDF(g, z));

    ADDF2(z,z);
    SQRF2(v,z);

    POLYF(r,v,P,P_length);
    MPYF2(r,z);

    ADDF2(r, MPYF(K,r));
    ADDF3(u2, ADDF(r, MPYF(z, K)), z);
    MPYF3(u1, FLTIF(m*16 - p), SIXTEENTH);
    if (GEQF(y, DIVF(INT_MOST_POS_P1,SIXTEEN)) ||
        LSSF(y, DIVF(INT_MOST_NEG   ,SIXTEEN)))
       MPYF3(y1, ROUNDF(SCLF(y,4)), SIXTEENTH);
    else
       MPYF3(y1, RNDF(MPYF(SIXTEEN, y)), SIXTEENTH);

    SUBF3(y2, y, y1);
    ADDF3(w, MPYF(u2,y), MPYF(u1,y2));
    if (GEQF(w, DIVF(INT_MOST_POS_P1,SIXTEEN)) ||
        LSSF(w, DIVF(INT_MOST_NEG   ,SIXTEEN)))
       MPYF3(w1, ROUNDF(SCLF(w,4)),SIXTEENTH);
    else
       MPYF3(w1, RNDF(MPYF(SIXTEEN,w)), SIXTEENTH);

    SUBF3(w2, w, w1);
    ADDF3(w, w1, MPYF(u1,y1));

    if GTRF(w, POW_Ovfl) 
    {
       errno = ERANGE; return REAL_MOST_POS;
    }
    if LSSF(w, POW_Unfl) return ZERO;

    MPYF3(w1, RNDF(MPYF(SIXTEEN,w)), SIXTEENTH);
    ADDF2(w2, SUBF(w, w1));
    MPYF3(w3, RNDF(MPYF(SIXTEEN,w2)), SIXTEENTH);
    FIXFI2(iw1, MPYF(SIXTEEN, ADDF(w1, w3)));
    SUBF2(w2, w3);

    if GTZF(w2) 
    {
       SUBF2(w2, SIXTEENTH);
       iw1 += 1;
    }

    i = ((iw1 < 0) ? 0 : 1);
    m = (EXPONENT_TYPE)(i + iw1/16);
    p = 16*(int)(m) - iw1;

    POLYF(z,w2,Q,Q_length);

    ADDF3(z, A1[p+(1-1)], 
             MPYF(A1[p+(1-1)], z));

    return SCLF(z, m);
