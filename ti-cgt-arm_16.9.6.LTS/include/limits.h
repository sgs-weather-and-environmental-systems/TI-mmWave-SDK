/*****************************************************************************/
/* limits.h   v16.9.6                                                        */
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

#ifndef _LIMITS_H_
#define _LIMITS_H_

#pragma diag_push
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */

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
#if defined(__TMS470__) && defined(__TI_EABI_SUPPORT__)
#define _AEABI_PORTABILITY_CHECK (defined(__TMS470__) && \
                                  defined(__TI_EABI_SUPPORT__) && \
                                  defined(_AEABI_PORTABILITY_LEVEL) && \
                                  _AEABI_PORTABILITY_LEVEL != 0)
#else
#define _AEABI_PORTABILITY_CHECK 0
#endif

#define CHAR_BIT                 8       /* NUMBER OF BITS IN TYPE CHAR      */
#define SCHAR_MIN    (-SCHAR_MAX-1)      /* MIN VALUE FOR SIGNED CHAR        */
#define SCHAR_MAX              127       /* MAX VALUE FOR SIGNED CHAR        */
#define UCHAR_MAX              255       /* MAX VALUE FOR UNSIGNED CHAR      */

#if (!defined(__TMS320C2000__) && \
    !(defined(__TMS320C6X__) && !defined(__C6X_MIGRATION__))) && \
    defined(__unsigned_chars__)
#define CHAR_MIN                 0       /* MIN VALUE FOR CHAR               */
#define CHAR_MAX        (UCHAR_MAX)      /* MAX VALUE FOR CHAR               */
#else
#define CHAR_MIN        (SCHAR_MIN)      /* MIN VALUE FOR PLAIN CHAR         */
#define CHAR_MAX        (SCHAR_MAX)      /* MAX VALUE FOR PLAIN CHAR         */
#endif /* __CHAR_UNSIGNED__ */

#if defined(_AEABI_PORTABILITY_CHECK) && _AEABI_PORTABILITY_CHECK > 0
  #if defined(__cplusplus)
  extern "C" namespace std {
  #endif
      extern const int __aeabi_MB_LEN_MAX;
  #if defined(__cplusplus)
  }
  #endif
  #define MB_LEN_MAX (__aeabi_MB_LEN_MAX)
#else
#define MB_LEN_MAX               8       /* MAX # BYTES IN MULTI-BYTE        */
#endif

#define SHRT_MIN      (-SHRT_MAX-1)      /* MIN VALUE FOR SHORT              */
#define SHRT_MAX             32767       /* MAX VALUE FOR SHORT              */
#define USHRT_MAX            65535       /* MAX VALUE FOR UNSIGNED SHORT     */

#define INT_MIN         (-INT_MAX-1)     /* MIN VALUE FOR INT                */
#define INT_MAX         2147483647       /* MAX VALUE FOR INT                */
#define UINT_MAX        4294967295U      /* MAX VALUE FOR UNSIGNED INT       */

#define LONG_MIN        (-LONG_MAX-1)    /* MIN VALUE FOR LONG               */
#define LONG_MAX         2147483647      /* MAX VALUE FOR LONG               */
#define ULONG_MAX       4294967295U      /* MAX VALUE FOR UNSIGNED LONG      */


#define LLONG_MIN         (-LLONG_MAX-1) /* MIN VALUE FOR LONG LONG          */
#define LLONG_MAX    9223372036854775807 /* MAX VALUE FOR LONG LONG          */
#define ULLONG_MAX 18446744073709551615U /* MAX VALUE FOR UNSIGNED LONG LONG */

#pragma diag_pop

#endif /* #ifndef _LIMITS_H_ */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__TMS470__) && defined(__TI_EABI_SUPPORT__) && \
    defined(_AEABI_PORTABILITY_LEVEL) && _AEABI_PORTABILITY_LEVEL > 0
  #if defined(__cplusplus) && !defined(__INCLUDED_FROM_CLIMITS)
      using std::__aeabi_MB_LEN_MAX;
  #endif
#endif

#pragma diag_pop
