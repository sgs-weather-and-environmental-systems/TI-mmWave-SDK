/****************************************************************************/
/*  sinhf_i.h         v8.1.3                                                */
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

/* _CODE_ACCESS REAL SINHF(REAL x) */

   #define Ln_V             0.69316101074218750000E+0
   #define V_Over_2_Minus_1 0.13830277879601902638E-4
   #define Wmax ADDF(SUBF(EXP_Max,Ln_V),0.69)
  
#if (REAL_MANTISSA <= 24)
   #define P_length 2
   static _DATA_ACCESS REAL P[2] =
      {KNST(-0.190333399e+0),
       KNST(-0.713793159e+1)};

   #define Q_length 1
   static _DATA_ACCESS REAL Q[1] =
      {KNST(-0.428277109e+2)};

#elif (REAL_MANTISSA <= 40)
   #define P_length 3
   static _DATA_ACCESS REAL P[3] =
      {KNST( 0.34364140358506e+0),
       KNST( 0.31359756456058e+2),
       KNST( 0.10622288837151e+4)};

   #define Q_length 2
   static _DATA_ACCESS REAL Q[2] =
      {KNST(-0.13051012509199e+3),
       KNST( 0.63733733021822e+4)};

#elif (REAL_MANTISSA <= 50)
   #define P_length 4
   static _DATA_ACCESS REAL P[4] =
      {KNST( 0.77239398202941923e-2),
       KNST( 0.13286428669224229e+1),
       KNST( 0.85943284838549010e+2),
       KNST( 0.23941435923050069e+4)};

   #define Q_length 2
   static _DATA_ACCESS REAL Q[2] =
      {KNST(-0.20258336866427869e+3),
       KNST( 0.14364861553830292e+5)};

#elif (REAL_MANTISSA <= 60)
   #define P_length 4
   static _DATA_ACCESS REAL P[4] =
      {KNST(-0.78966127417357099479e+0),
       KNST(-0.16375798202630751372e+3),
       KNST(-0.11563521196851768270e+5),
       KNST(-0.35181283430177117881e+6)};

   #define Q_length 3
   static _DATA_ACCESS REAL Q[3] =
      {KNST(-0.27773523119650701667e+3),
       KNST( 0.36162723109421836460e+5),
       KNST(-0.21108770058106271242e+7)};

#else
    #error "sinh constant table not available for this size mantissa"
#endif

    REAL g, w, y, z, Result;

    /* Adapted from "Software Manual for the Elementary Functions" */
    /* Cody and Waite, Prentice Hall 1980. pages 217-228.          */

    ABSF2(y,x);
    if LEQF(y,ONE) 
    {
       if LSSF(y, RADIX_to_M_Hlf_MANTISSA) return x;
       SQRF2(g, x);

       POLYF(Result,g,P,P_length);
       POLYbF(z,g,Q,Q_length);
       DIVF2(Result, z);

       ADDF3(Result, x, MPYF(x,Result));
    }
    else 
    {
       if LEQF(y, EXP_Max) 
       {
          CPYF(z, EXPF(y));
          MPYF3(Result, SUBF(z, INVF(z)), HALF);
       }
       else 
       {
          SUBF3(w, y, Ln_V);
          if GTRF(w, Wmax) 
          {
             errno = EDOM;
             if LSZF(x) return -INFINITY;
             return INFINITY;
          }
          CPYF(z, EXPF(w));
          ADDF3(Result, z, MPYF(V_Over_2_Minus_1,z));
       }
       if LSZF(x) NEGF1(Result);
    }
    return Result;
