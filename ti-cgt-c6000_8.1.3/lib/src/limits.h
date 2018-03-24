/*****************************************************************************/
/* limits.h   v8.1.3                                                         */
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


#define CHAR_BIT                 8       /* NUMBER OF BITS IN TYPE CHAR      */
#define SCHAR_MIN    (-SCHAR_MAX-1)      /* MIN VALUE FOR SIGNED CHAR        */
#define SCHAR_MAX              127       /* MAX VALUE FOR SIGNED CHAR        */
#define UCHAR_MAX              255       /* MAX VALUE FOR UNSIGNED CHAR      */

#define CHAR_MIN        (SCHAR_MIN)      /* MIN VALUE FOR PLAIN CHAR         */
#define CHAR_MAX        (SCHAR_MAX)      /* MAX VALUE FOR PLAIN CHAR         */

#define MB_LEN_MAX               1       /* MAX # BYTES IN MULTI-BYTE        */

#define SHRT_MIN      (-SHRT_MAX-1)      /* MIN VALUE FOR SHORT              */
#define SHRT_MAX             32767       /* MAX VALUE FOR SHORT              */
#define USHRT_MAX            65535       /* MAX VALUE FOR UNSIGNED SHORT     */

#define INT_MIN         (-INT_MAX-1)     /* MIN VALUE FOR INT                */
#define INT_MAX         2147483647       /* MAX VALUE FOR INT                */
#define UINT_MAX        4294967295U      /* MAX VALUE FOR UNSIGNED INT       */

#if defined(__TMS320C6X__) && !defined(__C6X_MIGRATION__) && !defined(__TI_32BIT_LONG__)
#define LONG_MIN        (-LONG_MAX-1)    /* MIN VALUE FOR LONG               */
#define LONG_MAX         549755813887    /* MAX VALUE FOR LONG               */
#define ULONG_MAX      1099511627775U    /* MAX VALUE FOR UNSIGNED LONG      */
#else
#define LONG_MIN        (-LONG_MAX-1)    /* MIN VALUE FOR LONG               */
#define LONG_MAX         2147483647      /* MAX VALUE FOR LONG               */
#define ULONG_MAX       4294967295U      /* MAX VALUE FOR UNSIGNED LONG      */
#endif

#define INT40_T_MIN    (-INT40_T_MAX-1)  /* MIN VALUE FOR __INT40_T          */
#define INT40_T_MAX     549755813887I40  /* MAX VALUE FOR __INT40_T          */
#define UINT40_T_MAX  1099511627775UI40  /* MAX VALUE FOR UNSIGNED __INT40_T */

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


#pragma diag_pop
