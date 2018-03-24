/****************************************************************************/
/*  aeabi_portable.c v16.9.6                                                */
/*                                                                          */
/* Copyright (c) 2006-2017 Texas Instruments Incorporated                   */
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
#if defined(DNKLIB)
#include <yvals.h>
#endif

#define _AEABI_PORTABILITY_LEVEL 1

#include <string.h>
#include <stdlib.h>
#include <stdio.h>
#include <assert.h>

/*****************************************************************************/
/* ARM's CLIB ABI (GENC-003539) supports two models:                         */
/*   1. Compiler and RTS are from the same toolset.                          */
/*   2. Compiler and RTS are from different toolset.                         */
/* A toolset should provide a portable version of the C library functionality*/
/* to support model 2 above.  This file contains functions required by the   */
/* CLIB ABI under _AEABI_PORTABILITY_LEVEL!=0                                */
/*****************************************************************************/

/****************************************************************************/
/* __aeabi_assert() - Implements the assert macro. Unlike the TI version    */
/*                    the expr has already been evaluated before this       */
/*                    function is called.                                   */
/****************************************************************************/
void __aeabi_assert(const char *expr, const char *file, int line)
{
   int   size = strlen(expr) + strlen(file) + 38;
   char *buf  = (char *)malloc(size);
   if (!buf)
   {
      _abort_msg("malloc failed in assert"); 
      return;
   }  
   sprintf(buf,"Assertion failed, (%s), file %s, line %d\n", expr, file, line);
   _abort_msg(buf);
   return;
}

/****************************************************************************/
/* __aeabi_errno_addr() - return the address of the "global" aeabi_errno.   */
/*                        __aeabi_errno should be an "global" or TLS.       */
/****************************************************************************/
int __aeabi_errno = 0;

volatile int *__aeabi_errno_addr(void)
{
     return &__aeabi_errno;
}


/****************************************************************************/
/* __aeabi_MB_CUR_MAX - At this time, only NON multithread version is       */
/*                     provided.                                            */
/****************************************************************************/
int __aeabi_MB_CUR_MAX(void)
{
#if defined(DNKLIB)
    return ((_Sizet)_CSTD _Mbcurmax);
#else
    return 1;
#endif
}

/****************************************************************************/
/* __aeabi_localeconv - Like localeconv, but returns AEABI's __aeabi_lconv, */
/*                      which has the fields in a different order.  Because */
/*                      we don't actually allow users to change the locale, */
/*                      this doesn't have to communicate with localeconv.   */
/****************************************************************************/
#include <locale.h>
#include <limits.h>

static struct __aeabi_lconv C_locale = 
{
	/* char *decimal_point;       */    ".",
	/* char *thousands_sep;       */    "",
	/* char *grouping;            */    "",
	/* char *int_curr_symbol;     */    "",
	/* char *currency_symbol;     */    "",
	/* char *mon_decimal_point;   */    "",
	/* char *mon_thousands_sep;   */    "",
	/* char *mon_grouping;        */    "",
	/* char *positive_sign;       */    "",
	/* char *negative_sign;       */    "",
	/* char int_frac_digits;      */    CHAR_MAX,
	/* char frac_digits;          */    CHAR_MAX,
	/* char p_cs_precedes;        */    CHAR_MAX,
	/* char p_sep_by_space;       */    CHAR_MAX,
	/* char n_cs_precedes;        */    CHAR_MAX,
	/* char n_sep_by_space;       */    CHAR_MAX,
	/* char p_sign_posn;          */    CHAR_MAX,
	/* char n_sign_posn;          */    CHAR_MAX,
};

struct __aeabi_lconv *__aeabi_localeconv(void)
{
   return &C_locale;
}
