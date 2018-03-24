/****************************************************************************/
/*  setlocale.c v8.1.3                                                      */
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
#ifndef _LOCALE
#undef _INLINE
#endif

#include <linkage.h>
#include <locale.h>
#include <stddef.h>
#include <limits.h>
#include <string.h>

_CODE_ACCESS char *setlocale(int category, const char *locale)
{
   if (!locale || *locale == '\0' || !strcmp(locale, "C")) 
      return "C"; 

   return NULL;
}

_DATA_ACCESS static struct lconv C_locale = 
{
	/* char *decimal_point;       */    ".",
	/* char *grouping;            */    "",
	/* char *thousands_sep;       */    "",

	/* char *mon_decimal_point;   */    "",
	/* char *mon_grouping;        */    "",
	/* char *mon_thousands_sep;   */    "",

	/* char *negative_sign;       */    "",
	/* char *positive_sign;       */    "",

	/* char *currency_symbol;     */    "",

	/* char frac_digits;          */    CHAR_MAX,
	/* char n_cs_precedes;        */    CHAR_MAX,
	/* char n_sep_by_space;       */    CHAR_MAX,
	/* char n_sign_posn;          */    CHAR_MAX,
	/* char p_cs_precedes;        */    CHAR_MAX,
	/* char p_sep_by_space;       */    CHAR_MAX,
	/* char p_sign_posn;          */    CHAR_MAX,

	/* char *int_curr_symbol;     */    "",
	/* char int_frac_digits;      */    CHAR_MAX,
};

struct lconv *localeconv(void)
{
   return &C_locale;
}
