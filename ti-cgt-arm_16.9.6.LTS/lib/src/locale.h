/*****************************************************************************/
/* locale.h v16.9.6                                                          */
/*                                                                           */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                    */
/* http://www.ti.com/                                                        */
/*                                                                           */
/*  Redistribution and  use in source  and binary forms, with  or without    */
/*  modification,  are permitted provided  that the  following conditions    */
/*  are met:                                                                 */
/*                                                                           */
/*     Redistributions  of source  code must  retain the  above copyright    */
/*     notice, this list of conditions and the following disclaimer.         */
/*                                                                           */
/*     Redistributions in binary form  must reproduce the above copyright    */
/*     notice, this  list of conditions  and the following  disclaimer in    */
/*     the  documentation  and/or   other  materials  provided  with  the    */
/*     distribution.                                                         */
/*                                                                           */
/*     Neither the  name of Texas Instruments Incorporated  nor the names    */
/*     of its  contributors may  be used to  endorse or  promote products    */
/*     derived  from   this  software  without   specific  prior  written    */
/*     permission.                                                           */
/*                                                                           */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS    */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT    */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR    */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT    */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,    */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT    */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,    */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY    */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT    */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE    */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.     */
/*                                                                           */
/*****************************************************************************/
#ifndef _LOCALE
#define _LOCALE


#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */

/*---------------------------------------------------------------------------*/
/* A header file conforming to ARM CLIB ABI (GENC-003539), should            */
/* define _AEABI_PORTABLE when _AEABI_PORTABILITY_LEVEL is defined.          */
/*---------------------------------------------------------------------------*/
#if defined(_AEABI_PORTABILITY_LEVEL) && !defined(_AEABI_PORTABLE)
#define _AEABI_PORTABLE
#endif

/*---------------------------------------------------------------------------*/
/* The macro definition that guards CLIB ABI (GENC-003539) requirements.     */
/*---------------------------------------------------------------------------*/
#if defined(__TI_EABI_SUPPORT__)
#define _AEABI_PORTABILITY_CHECK (defined(__TMS470__) && \
                                  defined(__TI_EABI_SUPPORT__) && \
                                  defined(_AEABI_PORTABILITY_LEVEL) && \
                                  _AEABI_PORTABILITY_LEVEL != 0)
#else
#define _AEABI_PORTABILITY_CHECK 0
#endif

#ifdef __cplusplus
extern "C" namespace std {
#endif

#ifndef NULL
 #define NULL	0
#endif

		/* LOCALE CATEGORY INDEXES */
#if defined(_AEABI_PORTABILITY_CHECK) && _AEABI_PORTABILITY_CHECK
extern const int __aeabi_LC_COLLATE;
extern const int __aeabi_LC_CTYPE;
extern const int __aeabi_LC_MONETARY;
extern const int __aeabi_LC_NUMERIC;
extern const int __aeabi_LC_TIME;
extern const int __aeabi_LC_ALL;

#define LC_COLLATE (  __aeabi_LC_COLLATE )
#define LC_CTYPE (  __aeabi_LC_CTYPE )
#define LC_MONETARY ( __aeabi_LC_MONETARY )
#define LC_NUMERIC ( __aeabi_LC_NUMERIC )
#define LC_TIME ( __aeabi_LC_TIME )
#define LC_ALL ( __aeabi_LC_ALL )

#else /* _AEABI_PORTABILITY_CHECK */

#define LC_ALL                  0
#define LC_COLLATE		1
#define LC_CTYPE		2
#define LC_MONETARY	        3
#define LC_NUMERIC		4
#define LC_TIME		        5
#define LC_MESSAGES	        6

#endif/* _AEABI_PORTABILITY_CHECK */

		/* TYPE DEFINITIONS */
#if defined(_AEABI_PORTABILITY_CHECK) && _AEABI_PORTABILITY_CHECK
struct __aeabi_lconv {
    char *decimal_point;
    char *thousands_sep;
    char *grouping;
    char *int_curr_symbol;
    char *currency_symbol;
    char *mon_decimal_point;
    char *mon_thousands_sep;
    char *mon_grouping;
    char *positive_sign;
    char *negative_sign;
    char int_frac_digits;
    char frac_digits;
    char p_cs_precedes;
    char p_sep_by_space;
    char n_cs_precedes;
    char n_sep_by_space;
    char p_sign_posn;
    char n_sign_posn;
};

#else /* _AEABI_PORTABILITY_CHECK */
struct lconv
{
    /* LC_NUMERIC */
    char *decimal_point;
    char *grouping;
    char *thousands_sep;
    /* LC_MONETARY */
    char *mon_decimal_point;
    char *mon_grouping;
    char *mon_thousands_sep;

    char *negative_sign;
    char *positive_sign;

    char *currency_symbol;

    char frac_digits;
    char n_cs_precedes;
    char n_sep_by_space;
    char n_sign_posn;
    char p_cs_precedes;
    char p_sep_by_space;
    char p_sign_posn;

    char *int_curr_symbol;
    char int_frac_digits;
};
#endif /* _AEABI_PORTABILITY_CHECK */

		/* DECLARATIONS */
#if defined(_AEABI_PORTABILITY_CHECK) && _AEABI_PORTABILITY_CHECK
extern struct __aeabi_lconv *__aeabi_localeconv(void);
extern void _get_aeabi_lconv(struct __aeabi_lconv *result);
#else /* _AEABI_PORTABILITY_CHECK */
struct lconv *localeconv(void);
#endif/* _AEABI_PORTABILITY_CHECK */

char *setlocale(int category, const char *locale);

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */

#pragma diag_pop

#endif /* _LOCALE */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)

using std::lconv; using std::localeconv; using std::setlocale;

#if _AEABI_PORTABILITY_CHECK
using std::__aeabi_LC_COLLATE;
using std::__aeabi_LC_CTYPE;
using std::__aeabi_LC_MONETARY;
using std::__aeabi_LC_NUMERIC;
using std::__aeabi_LC_TIME;
using std::__aeabi_LC_ALL;
#endif

#endif /* _CPP_STYLE_HEADER */

#pragma diag_pop
