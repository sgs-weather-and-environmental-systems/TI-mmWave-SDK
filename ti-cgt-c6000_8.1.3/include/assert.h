/*****************************************************************************/
/* assert.h   v8.1.3                                                         */
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

#ifndef _ASSERT
#define _ASSERT

#include <linkage.h>


#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-19.4") /* macros required for implementation */
#pragma CHECK_MISRA("-19.7") /* macros required for implementation */
#pragma CHECK_MISRA("-19.13") /* # and ## required for implementation */


#ifdef __cplusplus
/*---------------------------------------------------------------------------*/
/* <cassert> IS RECOMMENDED OVER <assert.h>.  <assert.h> IS PROVIDED FOR     */
/* COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++                  */
/*---------------------------------------------------------------------------*/

#define _NAMESPACE_PREFIX std::

extern "C" namespace std
{
#else
#define _NAMESPACE_PREFIX
#endif

/* this #ifndef can go away when C2000 uses extern C builtins */
#pragma diag_push
#pragma CHECK_MISRA("-16.4") /* false positives due to builtin declarations */
extern _CODE_ACCESS void _nassert(int expr);
extern _CODE_ACCESS void _assert(int expr, const char *string);
#pragma diag_pop

#if defined(__TMS320C6X__) && !defined(__C6X_MIGRATION__) && defined(__TI_EABI__)
extern _CODE_ACCESS void __c6xabi_abort_msg(const char *msg);
#else
extern _CODE_ACCESS void _abort_msg(const char *msg);
#endif

#define _STR(x)  __STR(x)
#define __STR(x) #x

#if defined(NDEBUG)
#define assert(_ignore) ((void)0)
#elif defined(NASSERT)
#define assert(_expr)   _NAMESPACE_PREFIX _nassert(_expr)
#else
     #define assert(_expr)   _NAMESPACE_PREFIX _assert((_expr) != 0,      \
                    "Assertion failed, (" _STR(_expr) "), file " __FILE__ \
                    ", line " _STR(__LINE__) "\n")
#endif /* NDEBUG, NASSERT */

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */

#pragma diag_pop

#endif /* _ASSERT */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::_nassert;


#endif /* _CPP_STYLE_HEADER */

#pragma diag_pop
