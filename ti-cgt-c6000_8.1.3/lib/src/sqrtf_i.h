/****************************************************************************/
/*  sqrtf_i.h         v8.1.3                                                */
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

/* _CODE_ACCESS REAL SQRTF(REAL x) */

    if(isinf(x))
       return x;

    if LEZF(x) 
    {
       if EQZF(x) return ZERO;
       errno = EDOM;

       /* Assume that an argument of < 0.0 got that way because of finite    */
       /* precision during preceeding calculations and that the ideal        */
       /* value is actually 0.0.                                             */
       return ZERO;
    }

    /* Choose between TARTAN or Cody/Waite algorithm.                       */
    /* All factors scaled by 10 (1.0 written as "10").                      */
    /* Scale operation is counted same as multiply.                         */
    /*                                                                      */
    /* As of April 2011, the equation below doesn't precisely reflect       */
    /* the computation requirements in TARTAN case for C67xx ISAs; the      */
    /* initial approximation is achieved by intrinsics(rsqrsp/rsqrdp).      */

#if (((20*Adds_Per_Mult + 10) +                   \
      (40*Adds_Per_Mult + 20) *                   \
         SQRT_Sz_Newtons +                        \
      (50*Adds_Per_Mult + 20)                     \
     ) <                                          \
     ((30*Adds_Per_Mult + 10) +                   \
      (10*Adds_Per_Div + 10*Adds_Per_Mult + 10) * \
         SQRT_CW_Newtons +                        \
      (10*Adds_Per_Mult)                          \
     )                                            \
    )
    {
       int  i;
       REAL y, z;

       /* Compute y, the approximation of the answer z.  If specialized     */
       /* hardware is available, use it.                                    */

       /* Using intrinsics for initial approx. for C67x ISAs                */
#if   (defined(_TMS320C6700) && (BPREAL == BPbigint))
       y = _rsqrsp(x);
#elif (defined(_TMS320C6700) && (BPREAL == BPbigint * 2))
       y = _rsqrdp(x);
#else
       {
          REAL    f;
          EXPONENT_TYPE e;

          RIPF(x, f, e);

          /* TARTAN derived algorithm. */

          #define Sqrt_4C1 CNST(-1.145508) /* slope of linear estimate * 4*/
          #define Sqrt_2C2 CNST( 2.528320) /* base  of linear estimate * 2*/

          /* First form an estimate of the inverse-square-root.  The         */
          /* accuracy of the estimate determines the number of required      */
          /* Newton iterations to compute the required n-bit mantissa        */
          /* result.  Given a number expressed as x = f* 2**e, an estimate   */
          /* of 1/SQRT(x), may be computed as:                               */
          /*   1/SQRT(x)                                                     */
          /* = 1/SQRT(f * 2**e)                                              */
          /* = 1/SQRT(f)      * 1/SQRT(2**e)                                 */
          /*~= (C1*f + C2)    * 1/SQRT(2**(e&1)) * 1/SQRT(2**(e-(e & 1)))    */
          /* = (C1*f + C2)    * 1/SQRT(2**(e&1)) * (2**-((e-(e & 1))/2))     */
          /* = (C1*f + C2)    * 1/SQRT(2**(e&1)) * (2**-((e-(e & 1))/2)-1)*2 */
          /* = (C1*f + C2)    * 1/SQRT(2**(e&1)) * (2**-((e-(e & 1))/2)-1)*2 */
          /* = 2*(C1*f + C2)  * 1/SQRT(2**(e&1)) * (2**-((e-(e & 1))/2)-1)   */
          /* =(2*C1*f + 2*C2) * 1/SQRT(2**(e&1)) * (2**-((e-(e & 1))/2)-1)   */
          /* =(2*C1*f + 2*C2) * {1 or 1/SQRT(2)}   * (2**-((e-(e & 1))/2)-1) */

          /* .5 <= f < 1, we need 1 <= f < 2, so... */

          /* e = e - 1 ; -- moved below.  Maybe CPU has LSB test as */
          /* byproduct.                                             */

          /* f = f * 2.0; -- subsumed into calculation below */

          ADDF3(f, MPYF(Sqrt_4C1,f), Sqrt_2C2);

          e -= 1;
          if (e & 1) 
          {
              e -= 1;
              MPYF2(f, One_Over_Sqrt_2);
          }
          SCLF3(y, f, ~(e >> 1));  /* note: last use of "e" */
       }
#endif

       /* Estimate of 1/sqrt in y now good to about 5 mantissa bits. */
       /* Refine estimate with Newton iterations.                    */

       /* Do one less newton iterations than is required.            */
       /* Accuracy roughly doubles each time through the loop.       */
       /* Haven't determined actual accuracy vs. iterations yet.     */
       /* Thresholds on loop choices are thus overly conservative.   */
       /* Note: Cannot square y below for reasons of over/under-flow.*/
       for (i = 1; i <= SQRT_Sz_Newtons; i++)
          /* y = y+y*(0.5-((x*y)*0.5)*y); */
          ADDF2(y,MPYF(y,SUBF(HALF,MPYF(MPYF(MPYF(x,y),HALF),y))));

       MPYF3(z,x,y);

       /* Here's the last iteration! */
       /* return z+z*(0.5-((x*y)*0.5)*y); */
       return ADDF(z,MPYF(z,SUBF(HALF,MPYF(MPYF(MPYF(x,y),HALF),y))));
    }
#else
    {
       int     i;
       REAL    f, y;
       EXPONENT_TYPE e;

       /* Adapted from "Software Manual for the Elementary Functions" */
       /* Cody and Waite, Prentice Hall 1980. pages 17-24             */

       #define C1 CNST(0.41731)
       #define C2 CNST(0.59016)

       RIPF(x, f, e);

       ADDF3(y,C1,MPYF(C2,f));  /* y = C1 + C2*f; */

       if (e & 1) 
       {
          MPYF2(y, One_Over_Sqrt_2);
          MPYF2(f, HALF);
          e = e + 1;
       }
       e = e / 2;

       /* Accuracy of estimate is in y now about 7 mantissa bits.  */

       /* Do as many Newton iterations as is required by the       */
       /* Mantissa.  Accuracy roughly doubles each time            */
       /* through the loop. (actual is 7.04, 15.08, 31.16, 63.32). */
       for (i = 1; i <= SQRT_CW_Newtons; i++)
          MPYF3(y,ADDF(y,DIVF(f,y)),HALF);  /* y = (y + f/y)*0.5; */

       return SCLF(y, e);
    }
#endif
