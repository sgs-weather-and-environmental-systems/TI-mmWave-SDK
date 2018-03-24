/*****************************************************************************/
/*  ERRNO.H  v8.1.3                                                          */
/*                                                                           */
/* Copyright (c) 1995-2017 Texas Instruments Incorporated                    */
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

#ifndef _ERRNO
#define _ERRNO


#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-19.1") /* #includes required for implementation */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */


#ifdef __cplusplus
//----------------------------------------------------------------------------
// <cerrno> IS RECOMMENDED OVER <errno.h>.  <errno.h> IS PROVIDED FOR
// COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++
//----------------------------------------------------------------------------
extern "C" namespace std
{
#endif /* __cplusplus */

#include <linkage.h>
#include <_tls.h>

#if (defined(__TMS320C6X__) && defined(__TI_EABI__)) ||  \
      defined(__TMS470__) || defined(__MSP430__) || defined(__FROZEN__)
    #define EDOM   33
    #define ERANGE 34
    #define ENOENT 2
    #define EFPOS  152
    #define EILSEQ 88
#else
    #define EDOM   1
    #define ERANGE 2
    #define ENOENT 3
    #define EFPOS  5
    #define EILSEQ 6
#endif

#if !defined(__C6X_MIGRATION__) && defined(__TMS320C6X__) && defined(__TI_EABI__)
    /*------------------------------------------------------------------------*/
    /* Under EABI, use function to access errno since it likely has TLS in    */
    /* a thread-safe version of the RTS library.                              */
    /*------------------------------------------------------------------------*/
    extern int *__c6xabi_errno_addr(void);
    __TI_TLS_DATA_DECL(int, __errno);

    #ifdef __cplusplus
     #define errno (* ::std::__c6xabi_errno_addr())
    #else
     #define errno (* __c6xabi_errno_addr())
    #endif
#else
    extern _DATA_ACCESS int errno;
    #pragma diag_push
    /* errno is not allowed under MISRA, anyway */
    #pragma CHECK_MISRA("-5.6") /* duplicated name in another scope (errno) */
    #pragma CHECK_MISRA("-19.4") /* macro expands to parenthesized */
    #ifdef __cplusplus
      #define errno ::std::errno
    #else
      #define errno errno
    #endif
    #pragma diag_pop
#endif

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */

#pragma diag_pop

#endif  /* _ERRNO */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)


#endif /* _CPP_STYLE_HEADER */

#pragma diag_pop
