/*****************************************************************************/
/*  VECT.H v8.1.3                                                            */
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

#ifndef _VECT
#define _VECT

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */

#include <stdint.h>

typedef float float32_t;

#define __CONST(lb, ub) __attribute__((constrange((lb), (ub))))
#define __BUILTIN __attribute__((builtin))
#define __ALN(x) __attribute__((aligned(x)))
#define __VECTOR __attribute__((vector_type))
#define __VEC16  __ALN(16)  __VECTOR

#define __MKVECTORSTRUCT128(T,N,T2) struct __simd128_##T { T2 _v[N]; } __VEC16

#define __VECTORSTRUCT128(T,N) struct __simd128_##T

#define __VECNAME(vs, t, l) t##x##l##_t

#define __VECTOR128int(typ, l,typ2) __MKVECTORSTRUCT128(typ##_t, l, typ2); \
        typedef __VECTORSTRUCT128(typ##_t, l) __VECNAME(128,typ,l)

#ifdef _TMS320C6600
#define __VECTOR128(T,L) __VECTOR128int(T,L,T ## _t)

__VECTOR128(int32,   4);

typedef int32x4_t __x128_t;
#endif

#ifdef __cplusplus
} /* extern "C" */
#endif /* __cplusplus */
#endif /* _VECT */
