/*****************************************************************************/
/* stdarg.h   v16.9.6                                                        */
/*                                                                           */
/* Copyright (c) 1996-2017 Texas Instruments Incorporated                    */
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

#ifndef _STDARG
#define _STDARG

#pragma diag_push
#pragma CHECK_MISRA("-19.7") /* need function-like macros */
#pragma CHECK_MISRA("-19.10") /* need types as macro arguments */
#pragma CHECK_MISRA("-20.1") /* standard headers must define standard names */
#pragma CHECK_MISRA("-20.2") /* standard headers must define standard names */

#ifdef __cplusplus
#define _NS_PREFIX std::
namespace std {
#else
#define _NS_PREFIX
#endif /* __cplusplus */

#ifdef __TI_EABI_SUPPORT__
typedef struct __va_list {
    void * __ap;
} va_list;
#else
typedef char *va_list;
#endif

#ifdef __cplusplus
} /* namespace std */
#endif

#define _VA_RNDUP(sz) 	(((sz) + 3) & ~3)
#define _VA_MASK(tp)     ((__ALIGNOF__(tp) == 8) ? 7 : 3)
#define _VA_ALN(ap,tp)  (((int)(ap) + _VA_MASK(tp)) & ~(_VA_MASK(tp)))

#ifdef __TI_EABI_SUPPORT__
#define va_start(ap, parmN)						      \
   ((ap).__ap = ((void *)((((int)__va_parmadr(parmN))&~3) +                   \
		                              _VA_RNDUP(sizeof(parmN)))))
#else
#define va_start(ap, parmN)						      \
   ((ap) = (__va_argref(parmN) 						      \
	    ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 )	      \
	    : (sizeof(parmN) < sizeof(int)) 				      \
	      ? (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + 4 & ~3)	      \
	      : (_NS_PREFIX va_list)((int)__va_parmadr(parmN) + sizeof(parmN))))
#endif

#ifdef __big_endian__
#ifdef __TI_EABI_SUPPORT__
#define va_arg(_ap, _type)					 	      \
    (((_ap).__ap = (void*)(_VA_ALN((_ap).__ap, _type) +                       \
			                         _VA_RNDUP(sizeof(_type)))),  \
     (*(_type *)((int)(_ap).__ap -                                            \
		   (__va_argcsu(_type) ? _VA_RNDUP(sizeof(_type))	      \
		                       : (sizeof(_type))))))
#else
#define va_arg(_ap, _type)                                       	      \
        (__va_argref(_type)                                		      \
	 ? ((_ap += sizeof(_type*)),(**(_type**)(_ap-(sizeof(_type*)))))      \
	 : ((_ap += _VA_RNDUP(sizeof(_type))),(*(_type*)(_ap-(sizeof(_type))))))
#endif
#else
#ifdef __TI_EABI_SUPPORT__
#define va_arg(_ap, _type) 						      \
   (((_ap).__ap = (void *)(_VA_ALN((_ap).__ap,_type) +                        \
			   _VA_RNDUP(sizeof(_type)))),                        \
	     (*(_type *) ((int)(_ap).__ap - _VA_RNDUP(sizeof(_type)))))
#else
#define va_arg(_ap, _type)                                       	      \
        (__va_argref(_type)                         		              \
	 ? ((_ap += sizeof(_type*)), (**(_type**)(_ap- sizeof(_type*))))      \
	 : ((_ap += _VA_RNDUP(sizeof(_type))),				      \
	     (*(_type*)(_ap- _VA_RNDUP(sizeof(_type))))))
#endif
#endif

#define va_end(ap) ((void)0)
#define va_copy(dst, src) ((dst)=(src))


#pragma diag_pop

#endif /* _STDARG */

#pragma diag_push

/* using declarations must occur outside header guard to support including both
   C and C++-wrapped version of header; see _CPP_STYLE_HEADER check */
/* this code is for C++ mode only and thus also not relevant for MISRA */
#pragma CHECK_MISRA("-19.15")

#if defined(__cplusplus) && !defined(_CPP_STYLE_HEADER)
using std::va_list;
#endif /* _CPP_STYLE_HEADER */

#pragma diag_pop
