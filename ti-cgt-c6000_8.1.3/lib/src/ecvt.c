/****************************************************************************/
/*  ecvt v8.1.3                                                             */
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
#include <math.h>
#include <linkage.h>
#include <_tls.h>

extern int ltoa(long val, char *buffer);

/*--------------------------------------------------------------------------*/
/* ecvt() uses a static output buffer that can be modified by each caller.  */
/* To protect against multiple threads modifying the same buffer at the     */
/* same time, each thread is given its own copy of the ecvt_out buffer.     */
/*--------------------------------------------------------------------------*/
__TI_TLS_ARR_DEF(static, char, ecvt_out, 100);

_CODE_ACCESS char *ecvt(long double value, register int ndigit, int *decpt,
			int *sign)
{
    register int   digits = 0;         /* NUMBER OF DIGITS BEFORE .       */
    register char *pout   = __TI_TLS_ARR(ecvt_out);
    register char *pos    = pout + 1;
    register int   temp;

    pout[0] = '0';                     /* JUST IN CASE WE ROUND.          */
    ndigit++;                          /* DO ONE EXTRA DIGIT FOR ROUNDING */

    /*--------------------------------------------------------------------*/
    /* IF TRYING TO CONVERT INFINITY, RETURN HUGE_VALL OF PROPER SIGN     */
    /*--------------------------------------------------------------------*/
    { 
	unsigned exp_part = _hi(value);

	if (((exp_part >> 20) & 0x7ff) == 0x7ff) 
	    value = (exp_part & 0x80000000) ? -HUGE_VALL : HUGE_VALL;
    }

    /*--------------------------------------------------------------------*/
    /* PERFORM PRESCALING - MAKE SURE NUMBER HAS INTEGRAL WHOLE PART      */
    /*--------------------------------------------------------------------*/
    if (*sign = (value < 0)) value = -value;
    while (value > 0x7FFFFFFF) { value /= 10; digits++; }
    while (value && value < 1) { value *= 10; digits--; }

    /*--------------------------------------------------------------------*/
    /* WRITE OUT INTEGRAL PART OF NUMBER.                                 */
    /*--------------------------------------------------------------------*/
    pos    += temp    = ltoa((long)value, pos);
    *decpt  = digits + temp;

    /*--------------------------------------------------------------------*/
    /* WRITE OUT FRACTIONAL PART OF NUMBER                                */
    /*--------------------------------------------------------------------*/
    if (temp >= ndigit) 
	 pos = pout + ndigit + 1;
    else if ((ndigit -= temp) > 0) do
    {
         value -= (int) value;
	 *pos++ = (int)(value *= 10.0) + '0';
    }
    while (--ndigit);

    /*--------------------------------------------------------------------*/
    /* PERFORM ROUNDING.  NOTE THAT pos IS CURRENTLY POINTING AT AN EXTRA */
    /* DIGIT WHICH WAS CONVERTED FOR THIS PURPOSE.                        */
    /*--------------------------------------------------------------------*/
    if (*--pos >= '5')
    {
	register char *ptr = pos;
	while ((*--ptr += 1) > '9') *ptr = '0';
	if (ptr == pout) { *--pos = 0; *decpt += 1; return(pout); }
    }
	
    *pos = 0;
    return(pout + 1);
}

