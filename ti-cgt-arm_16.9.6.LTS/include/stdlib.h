/*****************************************************************************/
/* stdlib.h   v16.9.6                                                        */
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

#ifndef _STDLIB
#define _STDLIB


#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-8.5") /* need to define inline function */
#pragma CHECK_MISRA("-19.1") /* #includes required for implementation */
#pragma CHECK_MISRA("-19.7") /* need function-like macros */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */

/*---------------------------------------------------------------------------*/
/* Attributes are only available in relaxed ANSI mode.                       */
/*---------------------------------------------------------------------------*/
#ifndef __ATTRIBUTE
#if __TI_STRICT_ANSI_MODE__
#define __ATTRIBUTE(attr)
#else
#define __ATTRIBUTE(attr) __attribute__(attr)
#endif
#endif

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
/*---------------------------------------------------------------------------*/
/* <cstdlib> IS RECOMMENDED OVER <stdlib.h>.  <stdlib.h> IS PROVIDED FOR     */
/* COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++                  */
/*---------------------------------------------------------------------------*/
extern "C" namespace std {
#endif /* !__cplusplus */

#pragma diag_push
#pragma CHECK_MISRA("-5.7") /* keep names intact */

typedef struct { int quot, rem; } div_t;

typedef struct { int quot, rem; } ldiv_t;

#define _LLONG_AVAILABLE 1
typedef struct { long long quot, rem; } lldiv_t;

#pragma diag_pop

#if defined(_AEABI_PORTABILITY_CHECK) && _AEABI_PORTABILITY_CHECK
extern int __aeabi_MB_CUR_MAX(void);
#define MB_CUR_MAX ( __aeabi_MB_CUR_MAX() )
#else
#define MB_CUR_MAX    1
#endif /* _AEABI_PORTABILITY_CHECK */

#ifndef NULL
#define NULL          0
#endif

#ifndef _SIZE_T
#define _SIZE_T
typedef __SIZE_T_TYPE__ size_t;
#endif

#ifndef __cplusplus
#ifndef _WCHAR_T
#define _WCHAR_T
typedef __WCHAR_T_TYPE__ wchar_t;
#endif
#endif

#define EXIT_FAILURE  1
#define EXIT_SUCCESS  0

#define RAND_MAX      32767

#include <linkage.h>

/*---------------------------------------------------------------*/
/* NOTE - Normally, abs, labs, and fabs are expanded inline, so  */
/*        no formal definition is really required. However, ANSI */
/*        requires that they exist as separate functions, so     */
/*        they are supplied in the library.  The prototype is    */
/*        here mainly for documentation.                         */
/*---------------------------------------------------------------*/
#pragma diag_push
#pragma CHECK_MISRA("-16.4") /* false positives due to builtin declarations */
    _CODE_ACCESS  int       abs(int _val); 
    _CODE_ACCESS  long      labs(long _val);
#if defined(_LLONG_AVAILABLE)
    _CODE_ACCESS  long long llabs(long long _val);
#endif
#pragma diag_pop

    _CODE_ACCESS int       atoi(const char *_st);
    _CODE_ACCESS long      atol(const char *_st);
#if defined(_LLONG_AVAILABLE)
    _CODE_ACCESS long long atoll(const char *_st);
#endif
    _CODE_ACCESS int       ltoa(long val, char *buffer);
          _IDECL double    atof(const char *_st);

    _CODE_ACCESS long      strtol(const char *_st, char **_endptr, int _base);
    _CODE_ACCESS unsigned long strtoul(const char *_st, char **_endptr,
    					  int _base);
#if defined(_LLONG_AVAILABLE)
    _CODE_ACCESS long long strtoll(const char *_st, char **_endptr, int _base);
    _CODE_ACCESS unsigned long long strtoull(const char *_st, char **_endptr,
					     int _base);
#endif
    _CODE_ACCESS float     strtof(const char * _st, 
                                  char ** _endptr);
    _CODE_ACCESS double    strtod(const char * _st, 
                                  char ** _endptr);
    _CODE_ACCESS long double strtold(const char * _st, 
                                     char ** _endptr);
    
    _CODE_ACCESS int    rand(void);
    _CODE_ACCESS void   srand(unsigned _seed);
    
    _CODE_ACCESS void  *calloc(size_t _num, size_t _size)
               __ATTRIBUTE((malloc));
    _CODE_ACCESS void  *malloc(size_t _size)
               __ATTRIBUTE((malloc));
    _CODE_ACCESS void  *realloc(void *_ptr, size_t _size)
               __ATTRIBUTE((malloc));
    _CODE_ACCESS void   free(void *_ptr);
    _CODE_ACCESS void  *memalign(size_t _aln, size_t _size)
               __ATTRIBUTE((malloc));
    
    _CODE_ACCESS void   abort(void); 

    typedef void (*__TI_atexit_fn)(void);
    _CODE_ACCESS int    atexit(__TI_atexit_fn _func);

    typedef int (*__TI_compar_fn)(const void *_a,const void *_b);
    _CODE_ACCESS void  *bsearch(const void *_key, const void *_base,
                                size_t _nmemb, size_t _size, 
                                __TI_compar_fn compar);
    _CODE_ACCESS void   qsort(void *_base, size_t _nmemb, size_t _size, 
                              __TI_compar_fn compar);

    _CODE_ACCESS void   exit(int _status);
    
    _CODE_ACCESS div_t  div(int _numer, int _denom);
    _CODE_ACCESS ldiv_t ldiv(long _numer, long _denom);
#if defined(_LLONG_AVAILABLE)
    _CODE_ACCESS lldiv_t lldiv(long long _numer, long long _denom);
#endif

    _CODE_ACCESS char  *getenv(const char *_string);
    _CODE_ACCESS int    system(const char *_name);

    _CODE_ACCESS int    mblen(const char *_s, size_t _n);
    _CODE_ACCESS size_t mbstowcs(wchar_t *_dest, const char *_src, size_t _n);
    _CODE_ACCESS int    mbtowc(wchar_t *_dest, const char *_src, size_t _n);

    _CODE_ACCESS size_t wcstombs(char *_dest, const wchar_t *_src, size_t _n);
    _CODE_ACCESS int    wctomb(char *_s, wchar_t _wc);

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */


#ifdef _INLINE

#ifdef __cplusplus
namespace std {
#endif

static __inline double atof(const char *_st) 
{
  return strtod(_st, (char **)0); 
}

#ifdef __cplusplus
} /* namespace std */
#endif

#endif  /* _INLINE */

#ifdef __cplusplus
#if __TI_STRICT_ANSI_MODE__
namespace std {
    _CODE_ACCESS inline int atexit(void (*func)(void))
        {
            return atexit((__TI_atexit_fn)func);
        }

    _CODE_ACCESS inline void  *bsearch(const void *_key, const void *_base,
                                       size_t _nmemb, size_t _size, 
                                       int (*compar)(const void *,const void *))
        {
            return bsearch(_key, _base, _nmemb, _size, (__TI_compar_fn)compar);
        }

    _CODE_ACCESS inline void   qsort(void *_base, size_t _nmemb, size_t _size, 
                                     int (*_compar)(const void *, const void *))
        {
            return qsort(_base, _nmemb, _size, (__TI_compar_fn)_compar);
        }
}
#endif
#endif

#pragma diag_pop

#endif  /* ! _STDLIB */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::div_t;
using std::ldiv_t;
#if defined(_LLONG_AVAILABLE)
using std::lldiv_t;
#endif
using std::size_t;
using std::abs;
using std::labs;
using std::atoi;
using std::atol;
#if defined(_LLONG_AVAILABLE)
using std::llabs;
using std::atoll;
#endif
using std::atof;
using std::strtol;
using std::strtoul;
#if defined(_LLONG_AVAILABLE)
using std::strtoll;
using std::strtoull;
#endif
using std::strtof;
using std::strtod;
using std::strtold;
using std::rand;
using std::srand;
using std::calloc;
using std::malloc;
using std::realloc;
using std::free;
using std::memalign;
using std::abort;
using std::atexit;
using std::bsearch;
using std::qsort;
using std::exit;
using std::div;
using std::ldiv;
#if defined(_LLONG_AVAILABLE)
using std::lldiv;
#endif
using std::getenv;
using std::system;
using std::mblen;
using std::mbtowc;
using std::wctomb;
using std::mbstowcs;
using std::wcstombs;
#if _AEABI_PORTABILITY_CHECK
using std::__aeabi_MB_CUR_MAX;
#endif /* _AEABI_PORTABILITY_CHECK */
#endif /* ! _CPP_STYLE_HEADER */

#pragma diag_pop

#pragma diag_push

/* C2000-specific additions to header implemented with #include */
#pragma CHECK_MISRA("-19.1")
#pragma CHECK_MISRA("-19.15")


#pragma diag_pop
