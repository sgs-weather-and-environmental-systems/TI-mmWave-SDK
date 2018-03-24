/****************************************************************************/
/*  strtod v8.1.3                                                           */
/*                                                                          */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                   */
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
#include <stdlib.h>
#include <ctype.h>
#include <float.h>
#include <errno.h>
#include <math.h>
#include <linkage.h>
#include <stdio.h>
#include <limits.h>

#if (DBL_MAX_10_EXP >= 256)  
static const _DATA_ACCESS double powerof10[]  = { 1.e1, 1.e2, 1.e4, 1.e8, 
						  1.e16, 1.e32, 1.e64, 1.e128,
						  1.e256};
#else 			    
static const _DATA_ACCESS double powerof10[]  = { 1.e1, 1.e2, 1.e4, 1.e8, 
						  1.e16, 1.e32};
#endif

static const _DATA_ACCESS double digits[] = { 0, 1, 2, 3, 4, 5, 6, 7, 8, 9 };

_CODE_ACCESS double strtod(const char * __restrict st, 
                           char ** __restrict endptr)
{
    double      result = 0;
    char        cp;
    const char *fst    = st;
    int         exp    = 0;               /* EXPONENT              */
    int         count  = 0;               /* EXPONENT CALCULATION  */
    int         value  = 0;               /* SUCCESSFUL PARSE      */
    int         sign;
    int         plus_or_minus = 0;        /* READ IN EXPONENT SIGN (+/-) */

    while (_isspace(*fst)) ++fst;  /* SKIP WHITE SPACE */
    if ((sign = ((cp = *fst) == '-')) || (cp == '+')) { ++fst; value = 1; }

    /*----------------------------------------------------------------------*/
    /* READ IN FRACTIONAL PART OF NUMBER, UNTIL AN 'E' IS REACHED.          */
    /* COUNT DIGITS AFTER DECIMAL POINT.                                    */
    /*----------------------------------------------------------------------*/
    for (; _isdigit(cp = *fst); ++fst) 
    {
       result = result * 10 + digits[cp - '0']; 
       value  = 1;
    }

    if (cp == '.') {
       while (_isdigit(cp = *++fst)) 
       {
          result = result * 10 + digits[cp - '0']; 
          value  = 1;
	  --exp;
       }
    }

    if (sign) result = -result;  /* IF NEGATIVE NUMBER, REVERSE SIGN */

    /*----------------------------------------------------------------------*/
    /* READ IN EXPLICIT EXPONENT AND CALCULATE REAL EXPONENT.               */
    /* IF EXPONENT IS BOGUS (i.e. "1.234empty" or "1.234e+mpty") RESTORE    */
    /* BOGUS EXPONENT BACK ONTO RETURNED STRING (endptr).                   */
    /*----------------------------------------------------------------------*/
    if (value && _toupper(*fst) == 'E')
    {
       if ((sign = ((cp = *++fst) == '-')) || (cp == '+'))
       {
          cp = *++fst;
          plus_or_minus = 1;
       }
 
       if (!_isdigit(cp))
       {
          if (plus_or_minus) *--fst;
          *--fst;
          goto skip_loop;
       }

       for (count = 0; _isdigit(cp); cp = *++fst)
       {
	  if ((INT_MAX - abs(exp) - (cp - '0')) / 10 > count)
          {
             count *= 10; 
	     count += cp - '0';
	  } else
	  {
	    count = INT_MAX - exp;
	    break;
	  }
       }

skip_loop:

       if (sign) exp -= count;
       else      exp += count;
    }

    /*----------------------------------------------------------------------*/
    /* ADJUST NUMBER BY POWERS OF TEN SPECIFIED BY FORMAT AND EXPONENT.     */
    /*----------------------------------------------------------------------*/
    if (result != 0.0)
    {
       if (exp > DBL_MAX_10_EXP) 
	  { errno = ERANGE; result = (result < 0) ? -HUGE_VAL : HUGE_VAL; }
       else if (exp < DBL_MIN_10_EXP) 
	  { errno = ERANGE; result = 0.0; }
       else if (exp < 0) {
	    for (count = 0, exp = -exp; exp; count++, exp >>= 1)
	        { if (exp & 1) result /= powerof10[count]; }
       }
       else {
	    for (count = 0; exp; count++, exp >>= 1)
	        { if (exp & 1) result *= powerof10[count]; }
       }
    }

    if (endptr) *endptr = (char *)(value ? fst : st);
    return result;
}

#if FLT_MANT_DIG == DBL_MANT_DIG
float strtof(const char * __restrict st, char ** __restrict endptr) __attribute__((__alias__("strtod")));
#endif

#if LDBL_MANT_DIG == DBL_MANT_DIG
long double strtold(const char * __restrict st, char ** __restrict endptr) __attribute__((__alias__("strtod")));
#endif
