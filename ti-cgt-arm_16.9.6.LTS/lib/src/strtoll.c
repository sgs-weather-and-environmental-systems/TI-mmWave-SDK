/****************************************************************************/
/*  strtoll v16.9.6                                                         */
/*                                                                          */
/* Copyright (c) 2000-2017 Texas Instruments Incorporated                   */
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
#include <limits.h>
#include <ctype.h>
#include <errno.h>
#include <linkage.h>

_CODE_ACCESS long long strtoll(const char *st, char **endptr, int base)
{
    register unsigned long long   result = 0;
    register unsigned int         uns_base;
    register char                 cp;
    register const char          *fst    = st;
    int                           digits = 0;
    unsigned long long            sign = 0;
    unsigned long long            max_prev_result;
    unsigned long long            max_curr_addval;
    unsigned long long            range_limit;

    while (_isspace(*fst)) ++fst;  /* SKIP WHITE SPACE */

    if ((cp = *fst) == '-')
    {
       sign = 1;
       cp = *++fst;
    }
    else if (cp == '+') cp = *++fst;

    if (base > 36) base = 0;

    /*-------------------------------------------------------------------*/
    /* DETERMINE BASE IF ZERO BASE ASKED FOR.                            */
    /*-------------------------------------------------------------------*/
    switch (base)
    {
	case  0 : if      (cp != '0')           base = 10;
		  else if ((cp = *++fst) == 'x' || cp == 'X')
		     if   (_isxdigit(fst[1])) { base = 16; cp = *++fst; }
		     else                     { base = 10; cp = *--fst; }
		  else 
		  {
		     base = 8; 
		     if (cp < '0' || cp > '7')  cp = *--fst;
		  } 
	          break;

        case 16 : if (cp == '0' && ((fst[1] == 'x') || (fst[1] == 'X')) &&
		      _isxdigit(fst[2]))
	             cp = *(fst += 2);
     }

    /*-------------------------------------------------------------------*/
    /* DETERMINE VALUES NEEDED TO DETECT RANGE ERROR.  THE MAX UNSIGNED  */
    /* VALUE THAT IS IN RANGE IS BASED ON THE SIGN OF THE INPUT STRING:  */
    /*   sign == 1 - RESULT WILL BE NEGATIVE, SO MUST BE <= LLONG_MAX+1  */
    /*   sign == 0 - RESULT WILL BE POSITIVE, SO MUST BE <= LLONG_MAX    */
    /* SO range_limit is LLONG_MAX + sign.                               */
    /*                                                                   */
    /* ALSO NEED max_prev_result AND max_curr_addval WHERE:              */
    /*    max_prev_result * uns_base + max_curr_addval == range_limit    */
    /*                                                                   */
    /* THIS ALLOWS US TO TEST FOR RANGE ERROR BEFORE WE COMPUTE THE NEXT */
    /* RESULT.  WE HAVE TWO CASES:                                       */
    /*  - PREVIOUS result IS GREATER THAN max_prev_result, SO NEXT       */
    /*    RESULT MUST BE OUT OF RANGE.                                   */
    /*  - PREVIOUS result IS EQUAL TO max_prev_result, SO NEXT RESULT    */
    /*    IS OUT OF RANGE IF addval >  max_curr_addval.                  */
    /*-------------------------------------------------------------------*/
    uns_base = (unsigned int) base;
    range_limit = (unsigned long long)LLONG_MAX + sign;
    max_prev_result = range_limit / uns_base;
    max_curr_addval = range_limit % uns_base;

    /*-------------------------------------------------------------------*/
    /* CONVERT THE NUMBER USING THE SPECIFIED BASE.                      */
    /*-------------------------------------------------------------------*/
    for (;; cp = *++fst)
    {
	register unsigned long long addval;

	if (!((_isdigit(cp) && (addval = cp - '0')      < uns_base) ||
	      (_isupper(cp) && (addval = cp - 'A' + 10) < uns_base) ||
	      (_islower(cp) && (addval = cp - 'a' + 10) < uns_base)))  break;

        /*--------------------------------------------------------------*/
        /* CHECK OVERFLOW STATUS BEFORE COMPUTATION.                    */
        /* result CONTAINS THE RESULT OF THE PREVIOUS COMPUTATION       */
        /*--------------------------------------------------------------*/
        if (result > max_prev_result ||
            (result == max_prev_result && addval > max_curr_addval))
        {
           /* SET ERRNO   */
            errno = ERANGE;
            if (endptr) *endptr = (char *)st;
            return sign ? LLONG_MIN : LLONG_MAX;
        }

        /*--------------------------------------------------------------*/
        /* COMPUTE NEXT RESULT.                                         */
        /*--------------------------------------------------------------*/
        result = result * uns_base + addval;

	digits++;
    }

    /*-------------------------------------------------------------------*/
    /* MARK THE END OF THE CONVERTED INPUT.  NEGATE THE RESULT IF A      */
    /* MINUS SIGN WAS SEEN.                                              */
    /*-------------------------------------------------------------------*/
    if (endptr) *endptr = (char *)(digits ? fst : st);
    if (sign)
        return (long long)-result;

    return (long long)result;
}

