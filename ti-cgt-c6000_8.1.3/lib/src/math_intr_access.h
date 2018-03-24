/*****************************************************************************/
/* math_intr_access.h v8.1.3                                                 */
/*                                                                           */
/* Copyright (c) 2014-2017 Texas Instruments Incorporated                    */
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


#ifndef _MATH_INTR_ACCESS_H
#define _MATH_INTR_ACCESS_H
#include <float.h>
#include <stdint.h>

#define _TI_TARGET_USES_BITS_INTRINSICS \
    (defined(__MSP430__) || defined(__ARP32__) || \
     defined(__TMS320C2000__) || defined(__PRU__))

/*---------------------------------------------------------------------------*/
/*                  FLOATING POINT INTRINSICS - FLOAT DEFINES                */
/*---------------------------------------------------------------------------*/
#define _TI_FBIAS_FLOAT _FBIAS
#define _TI_FBITS_FLOAT FLT_MANT_DIG
#define _TI_FMAXEXP_FLOAT FLT_MAX_EXP
#define _TI_BIT_MASK_FLOAT(n) (((uint32_t)(1) << (n)) - 1)
#define _TI_EXP_BITS_MASK_FLOAT ((_TI_FMAXEXP_FLOAT << 1) - 1)
#define _TI_SGN_TEST_MASK_FLOAT ((uint32_t)(1) << (32-1))
#define _TI_EXP_TEST_MASK_FLOAT 0x7f80

#if _TI_TARGET_USES_BITS_INTRINSICS
 #define _TI_FTOU_FLOAT __f32_bits_as_u32
 #define _TI_UTOF_FLOAT __u32_bits_as_f32
#else
 #define _TI_FTOU_FLOAT _ftoi
 #define _TI_UTOF_FLOAT _itof
#endif 

#define _TI_SIGN_BIT_ZERO_FLOAT(f) \
    ((_TI_FTOU_FLOAT(f) & _TI_SGN_TEST_MASK_FLOAT) == 0)

#define _TI_BIASED_EXP_FLOAT(f) \
   (((unsigned int)(_TI_FTOU_FLOAT(f) >> 23)) & _TI_EXP_BITS_MASK_FLOAT)

#define _TI_BIASED_EXP_IS_MAX_FLOAT(f) \
   ((((unsigned int)(_TI_FTOU_FLOAT(f) >> 16)) & \
     _TI_EXP_TEST_MASK_FLOAT) == _TI_EXP_TEST_MASK_FLOAT)

#define _TI_FRAC_PART_FLOAT(f) \
   (_TI_FTOU_FLOAT(f) & _TI_BIT_MASK_FLOAT(_TI_FBITS_FLOAT-1))

#define _TI_FRAC_PART_IS_ZERO_FLOAT(f) (_TI_FRAC_PART_FLOAT(f) == 0)

#define _TI_DISCARD_N_FRAC_BITS_FLOAT(v,n) \
    _TI_UTOF_FLOAT(_TI_FTOU_FLOAT(v) & ~_TI_BIT_MASK_FLOAT(n))

#define _TI_DISCARD_EXP_AND_FRAC_PARTS_FLOAT(v) \
    _TI_UTOF_FLOAT(_TI_FTOU_FLOAT(v) & _TI_SGN_TEST_MASK_FLOAT)

#define _TI_UNBIASED_EXP_FLOAT(f) \
   (_TI_BIASED_EXP_FLOAT(f) - (_TI_FBIAS_FLOAT+1))

#define _TI_BIASED_EXP_PART_IS_ZERO_FLOAT(f) (_TI_BIASED_EXP_FLOAT(f) == 0)

#define _TI_EXP_AND_FRAC_PART_IS_ZERO_FLOAT(f) \
    ((_TI_FTOU_FLOAT(f) & ~_TI_SGN_TEST_MASK_FLOAT)==0)

#define _TI_HAS_BF_SQRT_FLOAT \
    (defined(__TMS470__) && defined(__TI_VFP_SUPPORT__))

#define _TI_TYPED_SQRT_FLOAT(n) __sqrtf(n)

/*---------------------------------------------------------------------------*/
/*                 FLOATING POINT INTRINSICS - DOUBLE DEFINES                */
/*---------------------------------------------------------------------------*/
#if defined(_32_BIT_DOUBLE)
#define _TI_FBIAS_DOUBLE _TI_FBIAS_FLOAT
#define _TI_EXP_TEST_MASK_DOUBLE _TI_EXP_TEST_MASK_FLOAT
#else
#define _TI_FBIAS_DOUBLE _DBIAS
#define _TI_EXP_TEST_MASK_DOUBLE 0x7ff0
#endif
#define _TI_FBITS_DOUBLE DBL_MANT_DIG
#define _TI_FMAXEXP_DOUBLE DBL_MAX_EXP
#define _TI_EXP_BITS_MASK_DOUBLE ((_TI_FMAXEXP_DOUBLE << 1) - 1)

/*---------------------------------------------------------------------------*/
/* This code requires the target to support type-punning intrinsics.  These  */
/* intrinsics treat the bits of a floating-point value as if it were an      */
/* integer, to allow fast access to the sign, exponent, and fractional bits. */
/* We need to know whether the target has an intrinsic that can represent    */
/* the entire floating-point type with one integral type.                    */
/*---------------------------------------------------------------------------*/

#if DBL_MANT_DIG == 24 /* DBL_MANT_DIG == 24 implies _32_BIT_DOUBLE */
 #define _TI_DOUBLE_SIZE 32
#else
 #define _TI_DOUBLE_SIZE 64
#endif

#if _TI_DOUBLE_SIZE == 32
 #define _TI_BIT_MASK_DOUBLE      _TI_BIT_MASK_FLOAT
 #define _TI_SGN_TEST_MASK_DOUBLE _TI_SGN_TEST_MASK_FLOAT   
 #define _TI_FTOU_DOUBLE          _TI_FTOU_FLOAT
 #define _TI_UTOF_DOUBLE          _TI_UTOF_FLOAT
#elif !_TI_TARGET_USES_BITS_INTRINSICS
 #define _TI_BIT_MASK_DOUBLE(n) (((uint32_t)(1) << (n)) - 1)
 #define _TI_SGN_TEST_MASK_DOUBLE \
     ((uint32_t)(1) << (31))
/* Do not define _TI_FTOU_DOUBLE or _TI_UTOF_DOUBLE since the target
   does not support them.                                                    */
#else
 #define _TI_BIT_MASK_DOUBLE(n) (((uint64_t)(1) << (n)) - 1)
 #define _TI_SGN_TEST_MASK_DOUBLE \
     ((uint64_t)(1) << (63))

 #define _TI_FTOU_DOUBLE __f64_bits_as_u64
 #define _TI_UTOF_DOUBLE __u64_bits_as_f64
#endif

#if _TI_TARGET_USES_BITS_INTRINSICS

 #define _TI_SIGN_BIT_ZERO_DOUBLE(f) \
    ((_TI_FTOU_DOUBLE(f) & _TI_SGN_TEST_MASK_DOUBLE) == 0)

 #define _TI_BIASED_EXP_DOUBLE(f) \
    ((_TI_FTOU_DOUBLE(f) >> (_TI_FBITS_DOUBLE-1)) & _TI_EXP_BITS_MASK_DOUBLE)

 #define _TI_BIASED_EXP_IS_MAX_DOUBLE(f) \
    ((((unsigned int)(_TI_FTOU_DOUBLE(f) >> 48)) &  \
      _TI_EXP_TEST_MASK_DOUBLE) == _TI_EXP_TEST_MASK_DOUBLE)

 #define _TI_FRAC_PART_DOUBLE(f) \
    (_TI_FTOU_DOUBLE(f) & _TI_BIT_MASK_DOUBLE(_TI_FBITS_DOUBLE-1))

 #define _TI_FRAC_PART_IS_ZERO_DOUBLE(f) (_TI_FRAC_PART_DOUBLE(f) == 0)

 #define _TI_DISCARD_N_FRAC_BITS_DOUBLE(v,n) \
    _TI_UTOF_DOUBLE(_TI_FTOU_DOUBLE(v) & ~_TI_BIT_MASK_DOUBLE(n))

 #define _TI_DISCARD_EXP_AND_FRAC_PARTS_DOUBLE(v) \
    _TI_UTOF_DOUBLE(_TI_FTOU_DOUBLE(v) & _TI_SGN_TEST_MASK_DOUBLE)

 #define _TI_UNBIASED_EXP_DOUBLE(f) \
    (_TI_BIASED_EXP_DOUBLE(f) - (_TI_FBIAS_DOUBLE+1))

 #define _TI_BIASED_EXP_PART_IS_ZERO_DOUBLE(f) \
    (_TI_BIASED_EXP_DOUBLE(f) == 0)

 #define _TI_EXP_AND_FRAC_PART_IS_ZERO_DOUBLE(f) \
    ((_TI_FTOU_DOUBLE(f) & ~_TI_SGN_TEST_MASK_DOUBLE)==0)

#else /* !_TI_TARGET_USES_BITS_INTRINSICS */

 #define _TI_SIGN_BIT_ZERO_DOUBLE(f) \
    ((_hi(f) & _TI_SGN_TEST_MASK_DOUBLE) == 0)

 #define _TI_FRAC_PART_HI_DOUBLE(f) \
    (_hi(f) & _TI_BIT_MASK_DOUBLE(_TI_FBITS_DOUBLE-1-32))

 #define _TI_FRAC_PART_LO_DOUBLE(f) (_lo(f))

 #define _TI_BIASED_EXP_DOUBLE(f) \
    ((_hi(f) >> (_TI_FBITS_DOUBLE-1-32)) & _TI_EXP_BITS_MASK_DOUBLE)

 #define _TI_BIASED_EXP_IS_MAX_DOUBLE(f) \
    (((_hi(f) >> 16) & _TI_EXP_TEST_MASK_DOUBLE) == _TI_EXP_TEST_MASK_DOUBLE)

 #define _TI_FRAC_PART_IS_ZERO_DOUBLE(f) \
    ((_TI_FRAC_PART_HI_DOUBLE(f) & \
    _TI_BIT_MASK_DOUBLE(_TI_FBITS_DOUBLE-1-32)) == 0 && \
    _TI_FRAC_PART_LO_DOUBLE(f) == 0)

 #define _TI_DISCARD_N_FRAC_BITS_DOUBLE(v,n) \
    (n >= 32 ? (_itod(_hi(v) & ~_TI_BIT_MASK_DOUBLE(n-32), 0)): \
    (_itod(_hi(v), _lo(v) & ~_TI_BIT_MASK_DOUBLE(n))))

 #define _TI_DISCARD_EXP_AND_FRAC_PARTS_DOUBLE(v) \
    _itod(_hi(v) & _TI_SGN_TEST_MASK_DOUBLE, 0)

 #define _TI_UNBIASED_EXP_DOUBLE(f) \
    (_TI_BIASED_EXP_DOUBLE(f) - (_TI_FBIAS_DOUBLE+1))

 #define _TI_BIASED_EXP_PART_IS_ZERO_DOUBLE(f) \
    (_TI_BIASED_EXP_DOUBLE(f) == 0)

 #define _TI_EXP_AND_FRAC_PART_IS_ZERO_DOUBLE(f) \
    (((_hi(f) & ~_TI_SGN_TEST_MASK_DOUBLE)==0)&&(_lo(f)==0))

#endif /* _TI_TARGET_USES_BITS_INTRINSICS */

#define _TI_HAS_BF_SQRT_DOUBLE (!defined(_32_BIT_DOUBLE) && \
                               defined(__TMS470__) && \
                               defined(__TI_VFP_SUPPORT__) && \
                              !defined(__TI_FPv4SPD16_SUPPORT__))

#define _TI_TYPED_SQRT_DOUBLE(n)  __sqrt(n)

/*---------------------------------------------------------------------------*/
/*             FLOATING POINT INTRINSICS - LONG DOUBLE DEFINES               */
/*---------------------------------------------------------------------------*/
#if defined(_32_BIT_LDOUBLE)
#define _TI_FBIAS_LONG _TI_FBIAS_FLOAT
#define _TI_EXP_TEST_MASK_LONG _TI_EXP_TEST_MASK_FLOAT
#elif _DLONG == 0
#define _TI_FBIAS_LONG _DBIAS
#define _TI_EXP_TEST_MASK_LONG 0x7ff0
#else
#error "80-bit and 128-bit long double not supported"
#endif
#define _TI_FBITS_LONG LDBL_MANT_DIG
#define _TI_FMAXEXP_LONG LDBL_MAX_EXP
#define _TI_EXP_BITS_MASK_LONG ((_TI_FMAXEXP_LONG << 1) - 1)

/*---------------------------------------------------------------------------*/
/* This code requires the target to support type-punning intrinsics.  These  */
/* intrinsics treat the bits of a floating-point value as if it were an      */
/* integer, to allow fast access to the sign, exponent, and fractional bits. */
/* We need to know whether the target has an intrinsic that can represent    */
/* the entire floating-point type with one integral type.                    */
/*---------------------------------------------------------------------------*/

#if LDBL_MANT_DIG == 24 /* LDBL_MANT_DIG == 24 implies _32_BIT_DOUBLE */
 #define _TI_LONG_DOUBLE_SIZE 32
#else
 #define _TI_LONG_DOUBLE_SIZE 64
#endif

#if _TI_LONG_DOUBLE_SIZE == _TI_DOUBLE_SIZE
 #define _TI_BIT_MASK_LONG      _TI_BIT_MASK_DOUBLE
 #define _TI_SGN_TEST_MASK_LONG _TI_SGN_TEST_MASK_DOUBLE
 #define _TI_FTOU_LONG          _TI_FTOU_DOUBLE
 #define _TI_UTOF_LONG          _TI_UTOF_DOUBLE
#elif _TI_TARGET_USES_BITS_INTRINSICS
 #if _TI_LONG_DOUBLE_SIZE != 64
   #error LONG DOUBLE REQUIRED TO BE 64 BITS
 #endif
 #define _TI_BIT_MASK_LONG(n) (((uint64_t)(1) << (n)) - 1)
 #define _TI_SGN_TEST_MASK_LONG ((uint64_t)(1) << (63))
 #define _TI_FTOU_LONG __f64_bits_as_u64
 #define _TI_UTOF_LONG __u64_bits_as_f64
#else
 #error _TI_LONG_DOUBLE_SIZE != _TI_DOUBLE_SIZE REQUIRES _TI_TARGET_USES_BITS_INTRINSICS
#endif

#if _TI_TARGET_USES_BITS_INTRINSICS

 #define _TI_SIGN_BIT_ZERO_LONG(f) \
    ((_TI_FTOU_LONG(f) & _TI_SGN_TEST_MASK_LONG) == 0)

 #define _TI_BIASED_EXP_LONG(f) \
    ((_TI_FTOU_LONG(f) >> (_TI_FBITS_LONG-1)) & _TI_EXP_BITS_MASK_LONG)

 #define _TI_BIASED_EXP_IS_MAX_LONG(f) \
    ((((unsigned int)(_TI_FTOU_LONG(f) >> 48)) &  \
      _TI_EXP_TEST_MASK_LONG) == _TI_EXP_TEST_MASK_LONG)

 #define _TI_FRAC_PART_LONG(f) \
    (_TI_FTOU_LONG(f) & _TI_BIT_MASK_LONG(_TI_FBITS_LONG-1))

 #define _TI_FRAC_PART_IS_ZERO_LONG(f) (_TI_FRAC_PART_LONG(f) == 0)

 #define _TI_DISCARD_N_FRAC_BITS_LONG(v,n) \
    _TI_UTOF_LONG(_TI_FTOU_LONG(v) & ~_TI_BIT_MASK_LONG(n))

 #define _TI_DISCARD_EXP_AND_FRAC_PARTS_LONG(v) \
    _TI_UTOF_LONG(_TI_FTOU_LONG(v) & _TI_SGN_TEST_MASK_LONG)

 #define _TI_UNBIASED_EXP_LONG(f) \
    (_TI_BIASED_EXP_LONG(f) - (_TI_FBIAS_LONG+1))

 #define _TI_BIASED_EXP_PART_IS_ZERO_LONG(f) (_TI_BIASED_EXP_LONG(f) == 0)

 #define _TI_EXP_AND_FRAC_PART_IS_ZERO_LONG(f) \
    ((_TI_FTOU_LONG(f) & ~_TI_SGN_TEST_MASK_LONG)==0)

#else

 #define _TI_SIGN_BIT_ZERO_LONG(f) ((_hi(f) & _TI_SGN_TEST_MASK_LONG) == 0)

 #define _TI_FRAC_PART_HI_LONG(f) \
    (_hi(f) & _TI_BIT_MASK_LONG(_TI_FBITS_LONG-1-32))

 #define _TI_FRAC_PART_LO_LONG(f) (_lo(f))

 #define _TI_BIASED_EXP_LONG(f) \
    ((_hi(f) >> (_TI_FBITS_LONG-1-32)) & _TI_EXP_BITS_MASK_LONG)

 #define _TI_BIASED_EXP_IS_MAX_LONG(f) \
    (((_hi(f) >> 16) & _TI_EXP_TEST_MASK_LONG) == _TI_EXP_TEST_MASK_LONG)

 #define _TI_FRAC_PART_IS_ZERO_LONG(f) \
    ((_TI_FRAC_PART_HI_LONG(f) & \
    _TI_BIT_MASK_LONG(_TI_FBITS_LONG-1-32))== 0 && \
    _TI_FRAC_PART_LO_LONG(f) == 0)

 #define _TI_DISCARD_N_FRAC_BITS_LONG(v,n) \
     (n >= 32 ? (_itod(_hi(v) & ~_TI_BIT_MASK_LONG(n-32), 0)) : \
     (_itod(_hi(v), _lo(v) & ~_TI_BIT_MASK_LONG(n))))

 #define _TI_DISCARD_EXP_AND_FRAC_PARTS_LONG(v) \
    _itod(_hi(v) & _TI_SGN_TEST_MASK_LONG, 0)

 #define _TI_UNBIASED_EXP_LONG(f) \
    (_TI_BIASED_EXP_LONG(f) - (_TI_FBIAS_LONG+1))

 #define _TI_BIASED_EXP_PART_IS_ZERO_LONG(f) (_TI_BIASED_EXP_LONG(f) == 0)

 #define _TI_EXP_AND_FRAC_PART_IS_ZERO_LONG(f) \
    (((_hi(f) & ~_TI_SGN_TEST_MASK_LONG)==0)&&(_lo(f)==0))

#endif /* _TI_TARGET_USES_BITS_INTRINSICS */

#define _TI_HAS_BF_SQRT_LONG ( defined(__TMS470__) && \
                             defined(__TI_VFP_SUPPORT__) && \
                             !defined(__TI_FPv4SPD16_SUPPORT__))

#define _TI_TYPED_SQRT_LONG(n)  __sqrt(n)

#endif
