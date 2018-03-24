/*****************************************************************************/
/* ctype.h    v8.1.3                                                         */
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

/************************************************************************/
/*                                                                      */
/*  CHARACTER TYPING FUNCTIONS AND MACROS                               */
/*                                                                      */
/*  Note that in this implementation, either macros or functions may    */
/*  be used.  Macros are prefixed with an underscore.                   */
/*                                                                      */
/************************************************************************/
#ifndef _CTYPE
#define _CTYPE

#include <linkage.h>


#pragma diag_push
#pragma CHECK_MISRA("-6.3") /* standard types required for standard headers */
#pragma CHECK_MISRA("-8.5") /* need to define inline function */
#pragma CHECK_MISRA("-19.1") /* #includes required for implementation */
#pragma CHECK_MISRA("-19.7") /* macros required for implementation */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */


#ifdef __cplusplus
/*---------------------------------------------------------------------------*/
/* <cctype> IS RECOMMENDED OVER <ctype.h>.  <ctype.h> IS PROVIDED FOR        */
/* COMPATIBILITY WITH C AND THIS USAGE IS DEPRECATED IN C++                  */
/*---------------------------------------------------------------------------*/
extern "C" namespace std
{
#endif /* __cplusplus */

extern const _DATA_ACCESS unsigned char _ctypes_[257];

/************************************************************************/
/*   FUNCTION DECLARATIONS                                              */
/************************************************************************/
#include "_isfuncdcl.h"

_IDECL int toupper(int ch);
_IDECL int tolower(int ch);

#ifdef __cplusplus
} /* extern "C" namespace std */
#endif /* __cplusplus */


/************************************************************************/
/*  On this ELSE path, all the TI ctype table and ctype bit flags are   */
/*  defined.                                                            */
/************************************************************************/
/************************************************************************/
/*  MACRO DEFINITIONS                                                   */
/************************************************************************/
#define _U_   ((unsigned char)0x01)       /* control chars     */
#define _L_   ((unsigned char)0x02)       /* lower case letter */
#define _N_   ((unsigned char)0x04)       /* digit             */
#define _S_   ((unsigned char)0x08)       /* white space       */
#define _P_   ((unsigned char)0x10)       /* punctuation       */
#define _C_   ((unsigned char)0x20)       /* control chars     */
#define _H_   ((unsigned char)0x40)       /* A-F, a-f and 0-9  */
#define _B_   ((unsigned char)0x80)       /* blank             */

#define _isalnum(a)  (_ctypes_[(a)+1] & (_U_ | _L_ | _N_))
#define _isalpha(a)  (_ctypes_[(a)+1] & (_U_ | _L_))
#define _iscntrl(a)  (_ctypes_[(a)+1] & _C_)
#define _isdigit(a)  (_ctypes_[(a)+1] & _N_)
#define _isgraph(a)  (_ctypes_[(a)+1] & (_U_ | _L_ | _N_ | _P_))
#define _islower(a)  (_ctypes_[(a)+1] & _L_)
#define _isprint(a)  (_ctypes_[(a)+1] & (_B_ | _U_ | _L_ | _N_ | _P_))
#define _ispunct(a)  (_ctypes_[(a)+1] & _P_)
#define _isspace(a)  (_ctypes_[(a)+1] & _S_)
#define _isupper(a)  (_ctypes_[(a)+1] & _U_)
#define _isxdigit(a) (_ctypes_[(a)+1] & _H_)


#define _isascii(a)  (((unsigned int)(a) & ~(unsigned int)0x7F) == 0u)
#define _toupper(b)  ((_islower(b)) ? (b) - ('a' - 'A') : (b))
#define _tolower(b)  ((_isupper(b)) ? (b) + ('a' - 'A') : (b))
#define _toascii(a)  ((unsigned int)(a) & (unsigned int)0x7F)

#ifdef _INLINE

#ifdef __cplusplus
using std::_ctypes_;
namespace std {
#endif /* __cplusplus */

#include "_isfuncdef.h"

/****************************************************************************/
/*  tolower                                                                 */
/****************************************************************************/
static __inline int tolower(int ch)
{
   /*
    This code depends on two assumptions: (1) all of the letters of the
    alphabet of a given case are contiguous, and (2) the lower and upper
    case forms of each letter are displaced from each other by the same
    constant value.
   */

   if ( ((unsigned int)ch  - (unsigned int)'A') <=
        ((unsigned int)'Z' - (unsigned int)'A'))
   {
      ch += (int)'a' - (int)'A';
   }

   return ch;
}

/****************************************************************************/
/*  toupper                                                                 */
/****************************************************************************/
static __inline int toupper(int ch)
{
   /*
    This code depends on two assumptions: (1) all of the letters of the
    alphabet of a given case are contiguous, and (2) the lower and upper
    case forms of each letter are displaced from each other by the same
    constant value.
   */

   if ( ((unsigned int)ch  - (unsigned int)'a') <=
        ((unsigned int)'z' - (unsigned int)'a'))
   {
      ch -= (int)'a' - (int)'A';
   }

   return ch;
}

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif /* _INLINE */

#pragma diag_pop

#endif /* ! _CTYPE */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::_ctypes_;
using std::isalnum;
using std::isalpha;
using std::iscntrl;
using std::isdigit;
using std::isgraph;
using std::islower;
using std::isprint;
using std::ispunct;
using std::isspace;
using std::isupper;
using std::isxdigit;
using std::isascii;
using std::toupper;
using std::tolower;
using std::toascii;
#endif /* ! _CPP_STYLE_HEADER */

#pragma diag_pop
