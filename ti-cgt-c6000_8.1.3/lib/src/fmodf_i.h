/****************************************************************************/
/*  fmodf_i.h         v8.1.3                                                */
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

/* _CODE_ACCESS REAL FMODF(REAL x, REAL y) */

/*---------------------------------------------------------------------------*/
/* desired algorithm:                                                        */
/* {                                                                         */
/*    infinite_precision_float Xip, Yip, Q;                                  */
/*                                                                           */
/*    Xip = (infinite_precision_float)x;                                     */
/*    Yip = (infinite_precision_float)y;                                     */
/*    Q = Xip/Yip;                                                           */
/*    Q = Truncate_Towards_0(Q);                                             */
/*    return (REAL)(Xip - Yip*Q);                                            */
/* }                                                                         */
/*---------------------------------------------------------------------------*/
    EXPONENT_TYPE e;
    REAL f, Quo, Remaindr, absY;
    REAL X_Upper, X_Lower;
    REAL Y_Upper, Y_Lower;

    if EQZF(y) { errno = EDOM; return ZERO; }

    /* don't overflow doing abs!*/
    if NEQF(y, REAL_MOST_NEG) ABSF2(absY,y);

    if (EQLF(y, REAL_MOST_NEG) ||
        (NEQF(x, REAL_MOST_NEG)) && (GEQF(absY, ABSF(x)))) {
       DIVF3(Quo, x, y);
       CPYF(Quo,TRUNCF(Quo));
       if EQLF(Quo, ZERO      ) return x;
       if EQLF(Quo, CNST(-1.0)) return ADDF(x, y);
       if EQLF(Quo, ONE       ) return SUBF(x, y);
       return x;
    }

    /*------------------------------------*/
    /* factor y into upper and lower bits */
    /*------------------------------------*/
    RIPF(y, f, e);
    {
       EXPONENT_TYPE x_e;
       int diff;
       FREXPF(x, &x_e);

       /* check for out-of-range quotient */
       if ((diff = (x_e - e) - ((REAL_EMAX+1)-1)) > 0) {
          REMF1(x, SCLF(y, diff));

       /* make sure that Y_Lower is expressable. */
       /* don't need to worry about X_Lower since x > y. */
       } else if ((diff = ((REAL_EMIN + 1) + REAL_MANTISSA + 1) - e) > 0) {
          return SCLF(REMF(SCLF(x, diff), SCLF(y, diff)), -diff);
       }
    }
    Y_Upper = SCLF(ROUNDF(MPYF(f, RADIX_to_Hlf_MANTISSA)),
                   e - (REAL_MANTISSA/2));
    SUBF3(Y_Lower, y,Y_Upper);

    /*----------------------------------------------------------------------*/
    /* Do long-hand division with factored pieces to avoid loosing ANY bits */
    /*----------------------------------------------------------------------*/
    CPYF(Remaindr,x);
    do {
       /*------------------------------------*/
       /* Get another batch of quotient bits */
       /*------------------------------------*/
       CPYF(Quo, TRUNCF(DIVF(Remaindr, y)));

       /*----------------------------------------------------*/
       /* Compute new Remaindr by forming:  Remaindr-(Quo*y) */
       /*----------------------------------------------------*/
#if (defined(Floating_Sub_Has_Guard_Digit)&&(Floating_Sub_Has_Guard_Digit ==1))
       RIPF(Quo, f, e);

       SCLF3(Quo,
             TRUNCF(MPYF(f,RADIX_to_Hlf_MANTISSA_M1)),
             e-((REAL_MANTISSA/2)-1));
       SUBF2(Remaindr, MPYF(Quo, Y_Upper));
       SUBF2(Remaindr, MPYF(Quo, Y_Lower));
#else
       /* factor Remaindr into upper and lower bits*/
       RIPF(Remaindr, f, e);
       SCLF3(X_Upper,TRUNCF(MPYF(f,RADIX_to_Hlf_MANTISSA)),
                     e-(REAL_MANTISSA/2));
       SUBF3(X_Lower, Remaindr, X_Upper);

       RIPF(Quo, f, e);
       SCLF3(Quo, TRUNCF(MPYF(f,RADIX_to_Hlf_MANTISSA_M2)),
                  e-((REAL_MANTISSA/2)-2));
       SUBF2(X_Upper, MPYF(Quo, Y_Upper));
       SUBF2(X_Lower, MPYF(Quo, Y_Lower));
       ADDF3(Remaindr, X_Upper, X_Lower);
#endif
    } while (GEQF(ABSF(Remaindr), absY));

    return Remaindr;
