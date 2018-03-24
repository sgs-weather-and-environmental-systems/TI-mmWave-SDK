/****************************************************************************/
/*  strtoul v8.1.3                                                          */
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
#include <limits.h>
#include <ctype.h>
#include <errno.h>

_CODE_ACCESS unsigned long strtoul(const char *st, char **endptr, int base)
{
    register unsigned long result = 0;
    register char          cp;
    register const char   *fst = st;
    int                    digits = 0;
    int                    minus = 0;

    while (_isspace(*fst)) ++fst;  /* SKIP WHITE SPACE */
    if (base > 36) base = 0;  

    if ((cp = *fst) == '+') cp = *++fst;
    else if ((cp = *fst) == '-') { cp = *++fst; minus = 1; }

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
    /* CONVERT THE NUMBER USING THE SPECIFIED BASE.                      */
    /*-------------------------------------------------------------------*/
    for (;; cp = *++fst)
    {
	register unsigned long addval;

	if (!((_isdigit(cp) && (addval = cp - '0')      < base) ||
	      (_isupper(cp) && (addval = cp - 'A' + 10) < base) ||
	      (_islower(cp) && (addval = cp - 'a' + 10) < base)))  break;

        if (result == (addval = (result * base + addval))/base) result = addval;
	else 
	{   
	    errno = ERANGE;
	    if (endptr) *endptr = (char *)st;        
	    return ULONG_MAX; 
	}

	digits++;
    }

    /*-------------------------------------------------------------------*/
    /* MARK THE END OF THE CONVERTED INPUT.                              */
    /*-------------------------------------------------------------------*/
    if (endptr) *endptr = (char *)(digits ? fst : st);

    return minus ? -result : result;
}

