/*****************************************************************************/
/* string.h   v16.9.6                                                        */
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

#ifndef _STRING
#define _STRING


#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-19.1") /* #includes required for implementation */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */

#ifdef __cplusplus
/*---------------------------------------------------------------------------*/
/* <cstring> IS RECOMMENDED OVER <string.h>.  <string.h> IS PROVIDED FOR     */
/* COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++                  */
/*---------------------------------------------------------------------------*/
extern "C" namespace std
{
#endif /* __cplusplus */
 
#ifndef NULL
#define NULL 0
#endif

#ifndef _SIZE_T
#define _SIZE_T
typedef __SIZE_T_TYPE__ size_t;
#endif

#include <linkage.h>

#pragma diag_push
#pragma CHECK_MISRA("-19.4") /* macros required for implementation */

#if defined(_OPTIMIZE_FOR_SPACE) && (defined(__TMS470__) || 		\
				     defined(__TMS320C2000__)  ||       \
                                     defined(__MSP430__))
#define _OPT_IDECL
#else
#define _OPT_IDECL	_IDECL
#endif

#pragma diag_pop

_OPT_IDECL size_t  strlen(const char *string);

_OPT_IDECL char *strcpy(char *dest, const char *src);
_OPT_IDECL char *strncpy(char *dest, const char *src, size_t n);
_OPT_IDECL char *strcat(char *string1, const char *string2);
_OPT_IDECL char *strncat(char *dest, const char *src, size_t n);
_OPT_IDECL char *strchr(const char *string, int c);
_OPT_IDECL char *strrchr(const char *string, int c);

_OPT_IDECL int  strcmp(const char *string1, const char *string2);
_OPT_IDECL int  strncmp(const char *string1, const char *string2, size_t n);

_CODE_ACCESS int     strcoll(const char *string1, const char *_string2);
_CODE_ACCESS size_t  strxfrm(char *to, const char *from, size_t n);
_CODE_ACCESS char   *strpbrk(const char *string, const char *chs);
_CODE_ACCESS size_t  strspn(const char *string, const char *chs);
_CODE_ACCESS size_t  strcspn(const char *string, const char *chs);
_CODE_ACCESS char   *strstr(const char *string1, const char *string2);
_CODE_ACCESS char   *strtok(char *str1, const char *str2);
_CODE_ACCESS char   *strerror(int _errno);
_CODE_ACCESS char   *strdup(const char *string);


_CODE_ACCESS void   *memmove(void *s1, const void *s2, size_t n);
#pragma diag_push
#pragma CHECK_MISRA("-16.4") /* false positives due to builtin declarations */
_CODE_ACCESS void   *memcpy(void *s1, const void *s2, size_t n);
#pragma diag_pop

_OPT_IDECL int     memcmp(const void *cs, const void *ct, size_t n);
_OPT_IDECL void   *memchr(const void *cs, int c, size_t n);

_CODE_ACCESS void   *memset(void *mem, int ch, size_t length);


#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */

#if defined(_INLINE) || defined(_STRING_IMPLEMENTATION)

#if (defined(_STRING_IMPLEMENTATION) ||					\
     !(defined(_OPTIMIZE_FOR_SPACE) && (defined(__TMS470__) || 		\
					defined(__TMS320C2000__)  ||    \
                                        defined(__MSP430__))))

#ifdef __cplusplus
namespace std {
#endif

#pragma diag_push
#pragma CHECK_MISRA("-19.4") /* macros required for implementation */

#if (defined(_OPTIMIZE_FOR_SPACE) && (defined(__TMS470__) || 		\
				      defined(__TMS320C2000__) ||       \
                                      defined(__MSP430__)))
#define _OPT_IDEFN
#else
#define _OPT_IDEFN	_IDEFN
#endif

#pragma diag_pop

#pragma diag_push /* functions */

/* MISRA exceptions to avoid changing inline versions of the functions that
   would be linked in instead of included inline at different mf levels */
/* these functions are very well-tested, stable, and efficient; it would
   introduce a high risk to implement new, separate MISRA versions just for the
   inline headers */

#pragma CHECK_MISRA("-5.7") /* keep names intact */
#pragma CHECK_MISRA("-6.1") /* false positive on use of char type */
#pragma CHECK_MISRA("-8.5") /* need to define inline functions */
#pragma CHECK_MISRA("-10.1") /* use implicit casts */
#pragma CHECK_MISRA("-10.3") /* need casts */
#pragma CHECK_MISRA("-11.5") /* casting away const required for standard impl */
#pragma CHECK_MISRA("-12.1") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.2") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.4") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.5") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.6") /* avoid changing expressions */
#pragma CHECK_MISRA("-12.13") /* ++/-- needed for reasonable implementation */
#pragma CHECK_MISRA("-13.1") /* avoid changing expressions */
#pragma CHECK_MISRA("-14.7") /* use multiple return points */
#pragma CHECK_MISRA("-14.8") /* use non-compound statements */
#pragma CHECK_MISRA("-14.9") /* use non-compound statements */
#pragma CHECK_MISRA("-17.4") /* pointer arithmetic needed for reasonable impl */
#pragma CHECK_MISRA("-17.6") /* false positive returning pointer-typed param */

#if defined(_INLINE) || defined(_STRLEN)
_OPT_IDEFN size_t strlen(const char *string)
{
   size_t      n = (size_t)-1;
   const char *s = string;

   do n++; while (*s++);
   return n;
}
#endif /* _INLINE || _STRLEN */

#if defined(_INLINE) || defined(_STRCPY)
_OPT_IDEFN char *strcpy(register char *dest, register const char *src)
{
     register char       *d = dest;     
     register const char *s = src;

     while (*d++ = *s++);
     return dest;
}
#endif /* _INLINE || _STRCPY */

#if defined(_INLINE) || defined(_STRNCPY)
_OPT_IDEFN char *strncpy(register char *dest,
		     register const char *src,
		     register size_t n)
{
     if (n) 
     {
	 register char       *d = dest;
	 register const char *s = src;
	 while ((*d++ = *s++) && --n);              /* COPY STRING         */
	 if (n-- > 1) do *d++ = '\0'; while (--n);  /* TERMINATION PADDING */
     }
     return dest;
}
#endif /* _INLINE || _STRNCPY  */

#if defined(_INLINE) || defined(_STRCAT)
_OPT_IDEFN char *strcat(char *string1, const char *string2)
{
   char       *s1 = string1;
   const char *s2 = string2;

   while (*s1) s1++;		     /* FIND END OF STRING   */
   while (*s1++ = *s2++);	     /* APPEND SECOND STRING */
   return string1;
}
#endif /* _INLINE || _STRCAT */

#if defined(_INLINE) || defined(_STRNCAT)
_OPT_IDEFN char *strncat(char *dest, const char *src, register size_t n)
{
    if (n)
    {
	char       *d = dest;
	const char *s = src;

	while (*d) d++;                      /* FIND END OF STRING   */

	while (n--)
	  if (!(*d++ = *s++)) return dest; /* APPEND SECOND STRING */
	*d = 0;
    }
    return dest;
}
#endif /* _INLINE || _STRNCAT */

#if defined(_INLINE) || defined(_STRCHR)
_OPT_IDEFN char *strchr(const char *string, int c)
{
   char        tch, ch  = c;
   const char *s        = string;

   for (;;)
   {
       if ((tch = *s) == ch) return (char *) s;
       if (!tch)             return (char *) 0;
       s++;
   }
}
#endif /* _INLINE || _STRCHR */

#if defined(_INLINE) || defined(_STRRCHR)
_OPT_IDEFN char *strrchr(const char *string, int c)
{
   char        tch, ch = c;
   char       *result  = 0;
   const char *s       = string;

   for (;;)
   {
      if ((tch = *s) == ch) result = (char *) s;
      if (!tch) break;
      s++;
   }

   return result;
}
#endif /* _INLINE || _STRRCHR */

#if defined(_INLINE) || defined(_STRCMP)
_OPT_IDEFN int strcmp(register const char *string1,
		  register const char *string2)
{
   register int c1, res;

   for (;;)
   {
       c1  = (unsigned char)*string1++;
       res = c1 - (unsigned char)*string2++;

       if (c1 == 0 || res != 0) break;
   }

   return res;
}
#endif /* _INLINE || _STRCMP */

#if defined(_INLINE) || defined(_STRNCMP)
_OPT_IDEFN int strncmp(const char *string1, const char *string2, size_t n)
{
     if (n) 
     {
	 const char *s1 = string1;
	 const char *s2 = string2;
	 unsigned char cp;
	 int         result;

	 do 
	    if (result = (unsigned char)*s1++ - (cp = (unsigned char)*s2++))
                return result;
	 while (cp && --n);
     }
     return 0;
}
#endif /* _INLINE || _STRNCMP */

#if defined(_INLINE) || defined(_MEMCMP)
_OPT_IDEFN int memcmp(const void *cs, const void *ct, size_t n)
{
   if (n) 
   {
       const unsigned char *mem1 = (unsigned char *)cs;
       const unsigned char *mem2 = (unsigned char *)ct;
       int                 cp1, cp2;

       while ((cp1 = *mem1++) == (cp2 = *mem2++) && --n);
       return cp1 - cp2;
   }
   return 0;
}
#endif /* _INLINE || _MEMCMP */

#if defined(_INLINE) || defined(_MEMCHR)
_OPT_IDEFN void *memchr(const void *cs, int c, size_t n)
{
   if (n)
   {
      const unsigned char *mem = (unsigned char *)cs;   
      unsigned char        ch  = c;

      do 
         if ( *mem == ch ) return (void *)mem;
         else mem++;
      while (--n);
   }
   return NULL;
}
#endif /* _INLINE || _MEMCHR */


#ifdef __cplusplus
} /* namespace std */
#endif

#endif /* (_STRING_IMPLEMENTATION || !(_OPTIMIZE_FOR_SPACE && __TMS470__)) */

#endif /* (_INLINE || _STRING_IMPLEMENTATION) */

#pragma diag_pop

#endif /* ! _STRING */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::size_t;
using std::strlen;
using std::strcpy;
using std::strncpy;
using std::strcat;
using std::strncat;
using std::strchr;
using std::strrchr;
using std::strcmp;
using std::strncmp;
using std::strcoll;
using std::strxfrm;
using std::strpbrk;
using std::strspn;
using std::strcspn;
using std::strstr;
using std::strtok;
using std::strerror;
using std::strdup;
using std::memmove;
using std::memcpy;
using std::memcmp;
using std::memchr;
using std::memset;


#endif /* _CPP_STYLE_HEADER */

#pragma diag_pop
