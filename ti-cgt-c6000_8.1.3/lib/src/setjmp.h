/*****************************************************************************/
/* setjmp.h   v8.1.3                                                         */
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

#ifndef _SETJMP
#define _SETJMP

#include <linkage.h>


#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-19.7") /* macros required for implementation */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */


#ifdef __cplusplus
extern "C" namespace std {
#endif

#pragma diag_push
#pragma CHECK_MISRA("-19.4") /* macro oddness */
#if defined(__TMS320C6X__) && defined(__TI_EABI__)
    #define setjmp(x) setjmp(x)
#else
    #define setjmp(x) _setjmp(x)
#endif
#pragma diag_pop

    typedef int jmp_buf[13];
    #if defined(__EDG_JMP_BUF_NUM_ELEMENTS)
       #if __EDG_JMP_BUF_NUM_ELEMENTS !=13
          #error "Front end and runtime disagree on size of jmp_buf"
       #endif
    #endif

#pragma diag_push
#pragma CHECK_MISRA("-20.7") /* standard headers must define standard names */
#pragma CHECK_MISRA("-5.6") /* macro oddness */

#if defined(__TMS320C6X__) && defined(__TI_EABI__)
_CODE_ACCESS int  setjmp(jmp_buf env); 
#else
_CODE_ACCESS int  _setjmp(jmp_buf env); 
#endif

_CODE_ACCESS void longjmp(jmp_buf env, int val);

#pragma diag_pop


#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */

#pragma diag_pop

#endif /* _SETJMP */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::jmp_buf;
#if defined(__TMS320C6X__) && defined(__TI_EABI__)
using std::setjmp;
#else
using std::_setjmp;
#endif
using std::longjmp;
#endif /* _CPP_STYLE_HEADER */

#pragma diag_pop
