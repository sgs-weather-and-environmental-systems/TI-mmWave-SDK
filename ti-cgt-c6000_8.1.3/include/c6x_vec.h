/*****************************************************************************/
/*  C6X_VEC.H v8.1.3                                                         */
/*                                                                           */
/* Copyright (c) 2013-2017 Texas Instruments Incorporated                    */
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
/*  http://www.ti.com/                                                       */
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

#ifndef __TI_C6X_VECTOR_H__
#define __TI_C6X_VECTOR_H__

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */

/*****************************************************************************/
/*                                                                           */
/* OpenCL-style Vector Data Types in TI Compiler                             */
/*                                                                           */
/* A OpenCL-style Vector Data Type Name consists of the following:           */
/* - main part: char, short, int, longlong, float, double                    */
/* - prefix: 'c' for complex (TI extension!!)                                */
/* - prefix: 'u' for unsigned                                                */
/* - suffix: digits for number of elements in the vector (valid: 2,3,4,8,16) */
/*                                                                           */
/* e.g. uint2: a 64-bit vector consisting of 2 unsigned int elements         */
/* e.g. char4: a 32-bit vector consisting of 4 signed chars                  */
/* e.g. cfloat: a 64-bit complex float consisting of a float real (R) and    */
/*                                              a float imaginary (I)        */
/* e.g. cushort4: a 128-bit vector consisting of 4 complex unsigned shorts   */
/*                                                                           */
/* Note 1 on longlong:                                                       */
/*   OpenCL defines "long" to be 64-bit.  To avoid confusion in C6x          */
/*   programs, we use name "longlong".                                       */
/*                                                                           */
/* Note 2 on complex:                                                        */
/*   In memory, (R,I) are in array order, R in [0], I in [1].                */
/*   In C6x register, R,I ordering are endianness depedent. For Big Endian,  */
/*   R is in msb, I is in lsb. Ordering of R and I is reversed in Litter     */
/*   Endian registers.  Compiler will automatically swap R and I ordering    */
/*   in registers before and after native complex instructions when needed.  */
/*   Implementation-wise, type package represents cfloat type as float2 with */
/*   a complex flag, hence, cfloat needs vector support.                     */
/*   Valid vector length for complex vectors are reduced to: 1, 2, 4, 8      */
/*   New componenet access operators for complex (TI extension!): .r, .i     */
/*   cfloat2.r returns 2 reals of cfloat2 in float2 type (Impl: float4.even) */
/*   cuint4.i returns 4 imags of cuint4 in uint4 type    (Impl: uint8.odd)   */
/*                                                                           */
/*****************************************************************************/

/*****************************************************************************/
/* The following native vector types are defined by the compiler as of v8.1  */
/* of the C6000 compiler. (v8.0.x compiler packages defined these types      */
/* here.) The same types without the double-underscore are defined by the    */
/* compiler if --vectypes=on is used.                                        */
/*****************************************************************************/


#ifndef __USE_VECTYPES_ONLY__
/*****************************************************************************/
/*                                                                           */
/* OpenCL-style Vector Operators and Built-in Functions (BiF) on C6x         */
/* - Available on >= C6400 C6x architectures                                 */
/* - The listing provides the correspondence between the new BiF/intrinsic   */
/*   names and the old c6x.h intrinsics names.                               */
/* FORMAT:   New BiF Name                  //@ Old Intrinsics Name in c6x.h  */
/*****************************************************************************/
#define __OVBIF  __attribute__((overloadable,builtin))
#define __BIF    __attribute__((builtin))

/*---------------------------------------------------------------------------*/
/* BiF Section 1: Handling old __float2_t types                              */
/*---------------------------------------------------------------------------*/

/* New: float2                    //@ Old: __float2_t                        */
/* New float2 operators listed below are language builtins                   */
// as_float2(longlong)            //@ __float2_t _lltof2(long long)
// as_longlong(float2)            //@ long long _f2toll(__float2_t)
// (float2) (float, float)        //@ __float2_t _ftof2(float, float)
// float2.y  (memory order!)      //@ float _hif2(__float2_t)
// float2.x  (memory order!)      //@ float _lof2(__float2_t)
// *(float2 *)                    //@ __float2_t & _amem8_f2(void *)
//                                //@ __float2_t & _amem8_f2_const(void *)
// float4.hi (memory order!)      //@ __float2_t _hif2_128(__x128_t)
// float4.lo (memory order!)      //@ __float2_t _lof2_128(__x128_t)
// (float4) (float2, float2)      //@ __x128_t _f2to128(__float2_t, __float2_t)
/*---------------------------------------------------------------------------*/
/* END BiF Section 1                                                         */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* BiF Section 2: Intrinsics that can be represented with Vector Operators   */
/*---------------------------------------------------------------------------*/

// short2 + short2                //@ int _add2(int, int);
// short2 - short2                //@ int _sub2(int, int);
// uint2.hi                       //@ unsigned _hi(double);
// float2.hi                      //@ float _hif(double);
// uint2.hi                       //@ unsigned _hill(long long);
// uint2.lo                       //@ unsigned _lo(double);
// float2.lo                      //@ float _lof(double);
// uint2.lo                       //@ unsigned _loll(long long);
// (uint2) (uint, uint)           //@ double _itod(unsigned, unsigned);
// (float2) (float, float)        //@ double _ftod(float, float);
// (uint2) (uint, uint)           //@ long long _itoll(unsigned, unsigned);
// as_float(uint)                 //@ float _itof(unsigned);
// as_uint(float)                 //@ unsigned _ftoi(float);
// as_longlong(double)            //@ long long _dtoll(double);
// as_double(longlong)            //@ double _lltod(long long);
// char4 + char4                  //@ int _add4(int, int);
// short2 == short2               //@ int _cmpeq2(int,int); + u _xpnd2(unsigned)
// ushort2 == ushort2             //@ int _cmpeq2(int,int); + u _xpnd2(unsigned)
// char4 == char4                 //@ int _cmpeq4(int,int); + u _xpnd4(unsigned)
// uchar4 == uchar4               //@ int _cmpeq4(int,int); + u _xpnd4(unsigned)
// short2 > short2                //@ int _cmpgt2(int,int); + u _xpnd2(unsigned)
// uchar4 > uchar4                //@ unsigned _cmpgtu4(u, u); + u _xpnd4(u);
// (ushort2) (ushort2.lo, ushort2.lo)     //@ unsigned _pack2(u, unsigned);
// (ushort2) (ushort2.hi, ushort2.hi)     //@ unsigned _packh2(u, unsigned);
// (uchar4) (uchar4.odd, uchar4.odd)      //@ unsigned _packh4(u, unsigned);
// (ushort2) (ushort2.lo, ushort2.hi)     //@ unsigned _packhl2(u, unsigned);
// (uchar4) (uchar4.even, uchar4.even)    //@ unsigned _packl4(u, unsigned);
// (ushort2) (ushort2.hi, ushort2.lo)     //@ unsigned _packlh2(u, unsigned);
// short2 >> uint                 //@ int _shr2(int, unsigned);
// ushort2 >> uint                //@ unsigned _shru2(unsigned, unsigned);
// char4 - char4                  //@ int _sub4(int, int);
// uchar4 - uchar4                //@ int _sub4(int, int);
// (uint2) (uint, uint)           //@ long long _dmv(unsigned, unsigned);
// (float2) (float, float)        //@ double _fdmv(float, float);
// int2 + int2                    //@ long long _dadd(long long, long long);
// int + int2                     //@ long long _dadd_c(int, long long);
// short4 + short4                //@ long long _dadd2(long long, long long);
// int2 - int2                    //@ long long _dsub(long long, long long);
// int2 >> uint                   //@ long long _dshr(long long, unsigned);
// uint2 >> uint                  //@ long long _dshru(long long, unsigned);
// int2 << uint                   //@ long long _dshl(long long, unsigned);
// short4 >> ushort               //@ long long _dshr2(long long, unsigned);
// ushort4 >> ushort              //@ long long _dshru2(long long, unsigned);
// ushort2 << ushort              //@ unsigned _shl2(unsigned , unsigned);
// ushort4 << ushort              //@ long long _dshl2(long long, unsigned);
// short4 > short4                //@ u _dcmpgt2(llong,llong);+llong _dxpnd2(u);
// short4 == short4               //@ u _dcmpeq2(llong,llong);+llong _dxpnd2(u);
// uchar8 > uchar8                //@ u _dcmpgtu4(llong,llong);+llong _dxpnd4(u)
// uchar8 == uchar8               //@ u _dcmpeq4(llong,llong);+llong _dxpnd4(u);
// convert_ushort4(char4);        //@ long long _unpkbu4(unsigned);
// convert_int2(short2);          //@ long long _unpkh2(unsigned);
// convert_uint2(ushort2);        //@ long long _unpkhu2(unsigned);
// float2 * float2                //@ __float2_t _dmpysp(__float2_t,__float2_t);
// float2 + float2                //@ __float2_t _daddsp(__float2_t,__float2_t);
// float2 - float2                //@ __float2_t _dsubsp(__float2_t,__float2_t);
// convert_float2(short2)         //@ __float2_t _dinthsp(unsigned);
// convert_float2(ushort2)        //@ __float2_t _dinthspu(unsigned);
// convert_float2(int2)           //@ __float2_t _dintsp(long long);
// convert_float2(uint2)          //@ __float2_t _dintspu(long long);
// convert_short2(float2)         //@ unsigned _dspinth(__float2_t);
// convert_int2(float2)           //@ long long _dspint(__float2_t);
// int4 * int4                    //@ __x128_t _qmpy32(__x128_t, __x128_t);
// float4 * float4                //@ __x128_t _qmpysp(__x128_t, __x128_t);
// (uint4) (uint, uint, uint, uint) //@ __x128_t _ito128(u, u, u, u);
// (float4) (float, float, float, float) //@ __x128_t _fto128(f,f,f,f);
// (longlong2) (longlong, longlong) //@ __x128_t _llto128(long long, long long);
// (double2) (double, double)       //@ __x128_t _dto128(double, double);
// longlong2.hi                   //@ long long _hi128(__x128_t);
// double2.hi                     //@ double _hid128(__x128_t);
// longlong2.lo                   //@ long long _lo128(__x128_t);
// double2.lo                     //@ double _lod128(__x128_t);
// uint4.s0 (.s1, .s2, .s3)       //@ u _get32_128(__x128_t, __CONST(0,3) u);
// float4.s0 (.s1, .s2, .s3)      //@ f _get32f_128(__x128_t, __CONST(0,3) u);
// (uint4) (uint)                 //@ __x128_t _dup32_128(unsigned);
// cfloat * cfloat                //@ d _complex_mpysp(d, d); // CMPYSP+DADDSP
/*---------------------------------------------------------------------------*/
/* END BiF Section 2                                                         */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* BiF Section 3: Element-wise vector built-in functions                     */
/*---------------------------------------------------------------------------*/

// Average with Rounding: rhadd(a:short, b:short) -> (a+b+1)>>1 :short
//                        rhadd(a:uchar, b:uchar) -> (a+b+1)>>1 :uchar
short   __OVBIF __rhadd(short   a, short   b);
short2  __OVBIF __rhadd(short2  a, short2  b); //@ int _avg2(int, int);
short3  __OVBIF __rhadd(short3  a, short3  b);
short4  __OVBIF __rhadd(short4  a, short4  b); //@ llong _davg2(llong,ll);
short8  __OVBIF __rhadd(short8  a, short8  b);
short16 __OVBIF __rhadd(short16 a, short16 b);
uchar   __OVBIF __rhadd(uchar   a, uchar   b);
uchar2  __OVBIF __rhadd(uchar2  a, uchar2  b);
uchar3  __OVBIF __rhadd(uchar3  a, uchar3  b);
uchar4  __OVBIF __rhadd(uchar4  a, uchar4  b); //@ unsigned _avgu4(u, u);
uchar8  __OVBIF __rhadd(uchar8  a, uchar8  b); //@ llong _davgu4(llong,ll);
uchar16 __OVBIF __rhadd(uchar16 a, uchar16 b);
#define __rhadd(a,b) __overload("__rhadd",(a),(b))((a),(b))

// Average: hadd(a:short, b:short) -> (a+b)>>1 :short
//          hadd(a:uchar, b:uchar) -> (a+b)>>1 :uchar
short   __OVBIF __hadd(short   a, short   b);
short2  __OVBIF __hadd(short2  a, short2  b);
short3  __OVBIF __hadd(short3  a, short3  b);
short4  __OVBIF __hadd(short4  a, short4  b);  //@ llong _davgnr2(ll, ll);
short8  __OVBIF __hadd(short8  a, short8  b);
short16 __OVBIF __hadd(short16 a, short16 b);
uchar   __OVBIF __hadd(uchar   a, uchar   b);
uchar2  __OVBIF __hadd(uchar2  a, uchar2  b);
uchar3  __OVBIF __hadd(uchar3  a, uchar3  b);
uchar4  __OVBIF __hadd(uchar4  a, uchar4  b);
uchar8  __OVBIF __hadd(uchar8  a, uchar8  b);  //@ llong _davgnru4(ll, ll);
uchar16 __OVBIF __hadd(uchar16 a, uchar16 b);
#define __hadd(a,b) __overload("__hadd",(a),(b))((a),(b))

// Maxium/Mininum: {max,min}(a:short, b:short) -> short
//                 {max,min}(a:uchar, b:uchar) -> uchar
short   __OVBIF __max(short   a, short   b);
short2  __OVBIF __max(short2  a, short2  b);  //@ int _max2(int, int);
short3  __OVBIF __max(short3  a, short3  b);
short4  __OVBIF __max(short4  a, short4  b);  //@ llong _dmax2(llong, ll);
short8  __OVBIF __max(short8  a, short8  b);
short16 __OVBIF __max(short16 a, short16 b);
uchar   __OVBIF __max(uchar   a, uchar   b);
uchar2  __OVBIF __max(uchar2  a, uchar2  b);
uchar3  __OVBIF __max(uchar3  a, uchar3  b);
uchar4  __OVBIF __max(uchar4  a, uchar4  b);  //@ unsigned _maxu4(u, u);
uchar8  __OVBIF __max(uchar8  a, uchar8  b);  //@ llong _dmaxu4(llong, ll);
uchar16 __OVBIF __max(uchar16 a, uchar16 b);
short   __OVBIF __min(short   a, short   b);
short2  __OVBIF __min(short2  a, short2  b);  //@ int _min2(int, int);
short3  __OVBIF __min(short3  a, short3  b);
short4  __OVBIF __min(short4  a, short4  b);  //@ llong _dmin2(llong, ll);
short8  __OVBIF __min(short8  a, short8  b);
short16 __OVBIF __min(short16 a, short16 b);
uchar   __OVBIF __min(uchar   a, uchar   b);
uchar2  __OVBIF __min(uchar2  a, uchar2  b);
uchar3  __OVBIF __min(uchar3  a, uchar3  b);
uchar4  __OVBIF __min(uchar4  a, uchar4  b);  //@ unsigned _minu4(u, u);
uchar8  __OVBIF __min(uchar8  a, uchar8  b);  //@ llong _dminu4(llong, ll);
uchar16 __OVBIF __min(uchar16 a, uchar16 b);
#define __max(a,b) __overload("__max",(a),(b))((a),(b))
#define __min(a,b) __overload("__min",(a),(b))((a),(b))

// Saturated Add: add_sat(a:uchar,  b:uchar) -> uchar
// Saturated Add: add_sat(a:ushort, b:short) -> ushort
// Saturated Add/Subtract: {add,sub}_sat(a:short, b:short) -> short
// Saturated Add/Subtract: {add,sub}_sat(a:int,   b:int)   -> int
uchar    __OVBIF __add_sat(uchar    a, uchar   b);
uchar2   __OVBIF __add_sat(uchar2   a, uchar2  b);
uchar3   __OVBIF __add_sat(uchar3   a, uchar3  b);
uchar4   __OVBIF __add_sat(uchar4   a, uchar4  b); //@ u _saddu4(u, u);
uchar8   __OVBIF __add_sat(uchar8   a, uchar8  b);
uchar16  __OVBIF __add_sat(uchar16  a, uchar16 b);
ushort   __OVBIF __add_sat(ushort   a, short   b);
ushort2  __OVBIF __add_sat(ushort2  a, short2  b); //@ int _saddus2(u, int);
ushort3  __OVBIF __add_sat(ushort3  a, short3  b);
ushort4  __OVBIF __add_sat(ushort4  a, short4  b);
ushort8  __OVBIF __add_sat(ushort8  a, short8  b);
ushort16 __OVBIF __add_sat(ushort16 a, short16 b);
short    __OVBIF __add_sat(short    a, short   b);
short2   __OVBIF __add_sat(short2   a, short2  b); //@ int _sadd2(int, int);
short3   __OVBIF __add_sat(short3   a, short3  b);
short4   __OVBIF __add_sat(short4   a, short4  b); //@ ll _dsadd2(ll, ll);
short8   __OVBIF __add_sat(short8   a, short8  b);
short16  __OVBIF __add_sat(short16  a, short16 b);
int      __OVBIF __add_sat(int      a, int     b); //@ int _sadd(int, int);
int2     __OVBIF __add_sat(int2     a, int2    b); //@ ll _dsadd(ll, ll);
int3     __OVBIF __add_sat(int3     a, int3    b);
int4     __OVBIF __add_sat(int4     a, int4    b);
int8     __OVBIF __add_sat(int8     a, int8    b);
int16    __OVBIF __add_sat(int16    a, int16   b);
short    __OVBIF __sub_sat(short    a, short   b);
short2   __OVBIF __sub_sat(short2   a, short2  b); //@ int _ssub2(int, int);
short3   __OVBIF __sub_sat(short3   a, short3  b);
short4   __OVBIF __sub_sat(short4   a, short4  b); //@ ll _dssub2(ll, ll);
short8   __OVBIF __sub_sat(short8   a, short8  b);
short16  __OVBIF __sub_sat(short16  a, short16 b);
int      __OVBIF __sub_sat(int      a, int     b); //@ int _ssub(int, int);
int2     __OVBIF __sub_sat(int2     a, int2    b); //@ llong _dssub(ll, ll);
int3     __OVBIF __sub_sat(int3     a, int3    b);
int4     __OVBIF __sub_sat(int4     a, int4    b);
int8     __OVBIF __sub_sat(int8     a, int8    b);
int16    __OVBIF __sub_sat(int16    a, int16   b);
#define __add_sat(a,b) __overload("__add_sat",(a),(b))((a),(b))
#define __sub_sat(a,b) __overload("__sub_sat",(a),(b))((a),(b))

// Absolute Difference: abs_diff(a:uchar, b:uchar) -> uchar
uchar   __OVBIF __abs_diff(uchar   a, uchar   b);
uchar2  __OVBIF __abs_diff(uchar2  a, uchar2  b);
uchar3  __OVBIF __abs_diff(uchar3  a, uchar3  b);
uchar4  __OVBIF __abs_diff(uchar4  a, uchar4  b); //@ int _subabs4(int, int);
uchar8  __OVBIF __abs_diff(uchar8  a, uchar8  b);
uchar16 __OVBIF __abs_diff(uchar16 a, uchar16 b);
#define __abs_diff(a,b) __overload("__abs_diff",(a),(b))((a),(b))

// Absolute Value: abs(a:short) -> ushort
ushort   __OVBIF __abs(short   a);
ushort2  __OVBIF __abs(short2  a);                 //@ int _abs2(int);
ushort3  __OVBIF __abs(short3  a);
ushort4  __OVBIF __abs(short4  a);                 //@ ll _dapys2(ll, ll);
ushort8  __OVBIF __abs(short8  a);
ushort16 __OVBIF __abs(short16 a);
#define __abs(a) __overload("__abs",(a))((a))

// Count Number of Non-Zero Bits: popcount(a:uchar) -> uchar
uchar   __OVBIF __popcount(uchar   a);
uchar2  __OVBIF __popcount(uchar2  a);
uchar3  __OVBIF __popcount(uchar3  a);
uchar4  __OVBIF __popcount(uchar4  a);  //@ unsigned _bitc4(unsigned);
uchar8  __OVBIF __popcount(uchar8  a);
uchar16 __OVBIF __popcount(uchar16 a);
#define __popcount(a) __overload("__popcount",(a))((a))

// Multiply, extended precision: a:short  * b:short  -> int
//                               a:ushort * b:ushort -> uint
//                               a:char   * b:uchar  -> short
//                               a:uchar  * b:uchar  -> ushort
int      __OVBIF __mpy_ext(short   a, short   b);   //@ int _mpy(int, int);
int2     __OVBIF __mpy_ext(short2  a, short2  b);   //@ ll _mpy2ll(int, int);
int3     __OVBIF __mpy_ext(short3  a, short3  b);
int4     __OVBIF __mpy_ext(short4  a, short4  b);   //@ x128 _dmpy2(ll, ll);
int8     __OVBIF __mpy_ext(short8  a, short8  b);
int16    __OVBIF __mpy_ext(short16 a, short16 b);
uint     __OVBIF __mpy_ext(ushort   a, ushort   b); //@ u _mpyu(u, u);
uint2    __OVBIF __mpy_ext(ushort2  a, ushort2  b); //@ ll _mpyu2(u, u);
uint3    __OVBIF __mpy_ext(ushort3  a, ushort3  b);
uint4    __OVBIF __mpy_ext(ushort4  a, ushort4  b); //@ x128 _dmpyu2(ll, ll);
uint8    __OVBIF __mpy_ext(ushort8  a, ushort8  b);
uint16   __OVBIF __mpy_ext(ushort16 a, ushort16 b);
short    __OVBIF __mpy_ext(char   a, uchar   b);
short2   __OVBIF __mpy_ext(char2  a, uchar2  b);
short3   __OVBIF __mpy_ext(char3  a, uchar3  b);
short4   __OVBIF __mpy_ext(char4  a, uchar4  b);   //@ ll _mpysu4ll(int, u);
short8   __OVBIF __mpy_ext(char8  a, uchar8  b);   //@ x128 _dmpysu4(ll, ll);
short16  __OVBIF __mpy_ext(char16 a, uchar16 b);
ushort   __OVBIF __mpy_ext(uchar   a, uchar   b);
ushort2  __OVBIF __mpy_ext(uchar2  a, uchar2  b);
ushort3  __OVBIF __mpy_ext(uchar3  a, uchar3  b);
ushort4  __OVBIF __mpy_ext(uchar4  a, uchar4  b);  //@ ll _mpyu4ll(u, u);
ushort8  __OVBIF __mpy_ext(uchar8  a, uchar8  b);  //@ x128 _dmpyu4(ll, ll);
ushort16 __OVBIF __mpy_ext(uchar16 a, uchar16 b);
#define __mpy_ext(a,b) __overload("__mpy_ext",(a),(b))((a),(b))

// Fixed Point Multiply: a:short_Q15 * b:short_Q15 -> int_Q31
int   __OVBIF __mpy_fx_ext(short  , short  );      //@ int _smpy(int, int);
int2  __OVBIF __mpy_fx_ext(short2 , short2 );      //@ ll _smpy2ll(int, int);
int3  __OVBIF __mpy_fx_ext(short3 , short3 );
int4  __OVBIF __mpy_fx_ext(short4 , short4 );      //@ x128 _dsmpy2(ll, ll);
int8  __OVBIF __mpy_fx_ext(short8 , short8 );
int16 __OVBIF __mpy_fx_ext(short16, short16);
#define __mpy_fx_ext(a,b) __overload("__mpy_fx_ext",(a),(b))((a),(b))

// Conjugate Complex Multiply: conj(a:cfloat) * b:cfloat -> cfloat
cfloat  __OVBIF __conj_cmpy(cfloat  a, cfloat  b); //@ double _complex_conjugate_mpysp(double, double); // CMPYSP + DSUBSP
cfloat2 __OVBIF __conj_cmpy(cfloat2 a, cfloat2 b);
cfloat4 __OVBIF __conj_cmpy(cfloat4 a, cfloat4 b);
cfloat8 __OVBIF __conj_cmpy(cfloat8 a, cfloat8 b);
#define __conj_cmpy(a,b) __overload("__conj_cmpy",(a),(b))((a),(b))

// Complex Multiply, extended precision: a:cshort * b:cshort -> cint
cint  __OVBIF __cmpy_ext(cshort  a, cshort  b);    //@ llong _cmpy(u,  u);
cint2 __OVBIF __cmpy_ext(cshort2 a, cshort2 b);    //@ x128 _dcmpy(ll, ll);
cint4 __OVBIF __cmpy_ext(cshort4 a, cshort4 b);
cint8 __OVBIF __cmpy_ext(cshort8 a, cshort4 b);
#define __cmpy_ext(a,b) __overload("__cmpy_ext",(a),(b))((a),(b))

#if defined(_TMS320C6400_PLUS) || defined(_TMS320C6740) || defined(_TMS320C6600)
// Fixed Point Complex Multiply: a:cshort_Q15 * b:cshort_Q15 -> cshort_Q1.14
// Fixed Point Complex Multiply: a:cshort_Q15 * b:cshort_Q15 -> cshort_Q15
cshort  __OVBIF __cmpyr_fx(cshort  a, cshort  b);  //@ u _cmpyr(u,u);
cshort2 __OVBIF __cmpyr_fx(cshort2 a, cshort2 b);
cshort4 __OVBIF __cmpyr_fx(cshort4 a, cshort4 b);
cshort8 __OVBIF __cmpyr_fx(cshort8 a, cshort8 b);
cshort  __OVBIF __cmpy_fx(cshort  a, cshort  b);   //@ u _cmpyr1(u, u);
cshort2 __OVBIF __cmpy_fx(cshort2 a, cshort2 b);   //@ ll _dcmpyr1
cshort4 __OVBIF __cmpy_fx(cshort4 a, cshort4 b);
cshort8 __OVBIF __cmpy_fx(cshort8 a, cshort8 b);
#define __cmpyr_fx(a,b) __overload("__cmpyr_fx",(a),(b))((a),(b))
#endif  // >= C6400_PLUS

#if defined(_TMS320C6600)
#undef __cmpy_ext
// Complex Multiply, extended precision: a:cfloat * b:cfloat -> float4
// Endianness Independent Result: { a.r*b.r, a.r*b.i, -a.i*b.i, a.i*b.r }
// Little endian may be less performant due to additional swaps.
float4  __OVBIF __cmpy_ext(cfloat  a, cfloat  b);  //@ x128 _cmpysp(d, d)
float8  __OVBIF __cmpy_ext(cfloat2 a, cfloat2 b);
float16 __OVBIF __cmpy_ext(cfloat4 a, cfloat4 b);
#define __cmpy_ext(a,b) __overload("__cmpy_ext",(a),(b))((a),(b))

// Fixed Point Complex Multiply: a:cint_Q31 * b:cint_Q31 -> cint_Q31
// Fixed Point Conj Complex Multiply: conj(a:cint_Q31) * b:cint_Q31 -> cint_Q31
cint  __OVBIF __cmpy_fx(cint  a, cint  b);         //@ ll _cmpy32r1
cint2 __OVBIF __cmpy_fx(cint2 a, cint2 b);
cint4 __OVBIF __cmpy_fx(cint4 a, cint4 b);
cint8 __OVBIF __cmpy_fx(cint8 a, cint8 b);
cint  __OVBIF __conj_cmpy_fx(cint  a, cint  b);    //@ ll _ccmpy32r1
cint2 __OVBIF __conj_cmpy_fx(cint2 a, cint2 b);
cint4 __OVBIF __conj_cmpy_fx(cint4 a, cint4 b);
cint8 __OVBIF __conj_cmpy_fx(cint8 a, cint8 b);
#define __conj_cmpy_fx(a,b) __overload("__conj_cmpy_fx",(a),(b))((a),(b))

// Complex Rotation: 90 degrees, 270 degrees
cshort  __OVBIF __crot90(cshort  a);               //@ int _crot90(int);
cshort2 __OVBIF __crot90(cshort2 a);               //@ ll _dcrot90(ll);
cshort4 __OVBIF __crot90(cshort4 a);
cshort8 __OVBIF __crot90(cshort8 a);
cshort  __OVBIF __crot270(cshort  a);              //@ int _crot270(int);
cshort2 __OVBIF __crot270(cshort2 a);              //@ ll _dcrot270(ll);
cshort4 __OVBIF __crot270(cshort4 a);
cshort8 __OVBIF __crot270(cshort8 a);
#define __crot90(a)  __overload("__crot90", (a))((a))
#define __crot270(a) __overload("__crot270",(a))((a))
#endif  // >= C6600

#define __cmpy_fx(a,b)  __overload("__cmpy_fx",(a),(b))((a),(b))
/*---------------------------------------------------------------------------*/
/* END BiF Section 3                                                         */
/*---------------------------------------------------------------------------*/


/*---------------------------------------------------------------------------*/
/* BiF Section 4: Target-specific vector built-in functions                  */
/* - Not necessarily element-wise                                            */
/*---------------------------------------------------------------------------*/

// Dot Product, extended precision: a DOTP b
int      __OVBIF __dot_ext  (short2 a, short2 b);  //@ int _dotp2(int, int);
longlong __OVBIF __dot_extll(short2 a, short2 b);  //@ int40_t _ldotp2(i,i);
int      __OVBIF __dot_ext  (char4  a, uchar4 b);  //@ int _dotpsu4(int, u);
uint     __OVBIF __dot_ext  (uchar4 a, uchar4 b);  //@ u _dotpu4(u, u);

// Fixed Point Dot Product: a:Q15*2 DOTP b:UQ16*2 -> Q15
int      __BIF   __dot_fx(short2 a, ushort2 b);    //@ i _dotprsu2(i, u);

// Galois Field Multiply
uchar4   __BIF   __gmpy(uchar4 a, uchar4 b);       //@ int _gmpy4(int, int);

#if defined(_TMS320C6400_PLUS) || defined(_TMS320C6740) || defined(_TMS320C6600)
// 2-way Dot Product, extended precision: (a DOTP b.lo, a DOTP b.hi)
int2     __OVBIF __ddot_ext(short2 a, char4 b);    //@ ll _ddotp4(u, u);

// Fixed Point Multiply: a:short2_Q15, b:int_Q31 -> (a.lo*b :Q31, a.hi*b :Q31)
int2     __OVBIF __mpy_fx(short2 a, int b);        //@ ll _mpy2ir(u, int);
#endif  // >= C6400_PLUS

#if defined(_TMS320C6600)
// Dot Product, extended precision: a DOTP b
int      __OVBIF __dot_ext  (short4 a, short4  b); //@ int _dotp4h(ll, ll);
longlong __OVBIF __dot_extll(short4 a, short4  b); //@ ll _dotp4hll(ll, ll);
int      __OVBIF __dot_ext  (short4 a, ushort4 b); //@ int _dotpsu4h(ll, ll);
longlong __OVBIF __dot_extll(short4 a, ushort4 b); //@ ll _dotpsu4hll(ll,ll);


// 2-way Dot Product, extended precision: (a.lo DOTP b.lo, a.hi DOTP b.hi)
int2     __OVBIF __ddot_ext(short8 a, short8  b);  //@ ll _ddotp4h(x128,x128);
int2     __OVBIF __ddot_ext(short8 a, ushort8 b);  //@ ll _ddotpsu4h

// Apply Sign: f(i) = a.si < 0 ? sat(-b.si) : b.si -> (f(0), f(1), f(2), f(3))
short4   __BIF   __apply_sign(short4 a, short4 b); //@ ll _dapys2(ll, ll);

// Fixed Point Multiply: a_Q31 * b_Q31 -> Q31
int4     __OVBIF __mpy_fx(int4 a, int4 b);         //@ x128 _qsmpy32r1

// Complex Multiply Conjugate, ext.prec.: a:cshort2 * conj(b:cshort2) -> cint2
cint2    __BIF   __cmpy_conj_ext(cshort2 a, cshort2 b); //@ x128 _dccmpy(ll,ll)

// Fixed Point Complex Multiply Conjugate: 
//                          a:cshort2_Q15 * conj(b:cshort2_Q15) -> cshort2:Q15
cshort2  __BIF   __cmpy_conj_fx(cshort2 a, cshort2 b);  //@ _dccmpyr1

// (Conjugate) Complex Matrix Multiply, extended precison: 
//                          a:cshort2_[1x2] * b:cshort4_[2x2] -> cint2_[1x2]
//                    conj(a:cshort2_[1x2]) * b:cshort4_[2x2] -> cint2_[1x2]
cint2    __BIF        __cmatmpy_ext(cshort2 a, cshort4 b); //@ x128 _cmatmpy
cint2    __BIF   __conj_cmatmpy_ext(cshort2 a, cshort4 b); //@ x128 _ccmatmpy

// Fixed Point (Conjugate) Complex Matrix Multiply:
//               a:cshort2_Q15[1x2] * b:cshort4_Q15[2x2] -> cshort2_Q15[1x2]
//         conj(a:cshort2_Q15[1x2]) * b:cshort4_Q15[2x2] -> cshort2_Q15[1x2]
cshort2  __BIF        __cmatmpy_fx(cshort2 a, cshort4 b);  //@ ll _cmatmpyr1
cshort2  __BIF   __conj_cmatmpy_fx(cshort2 a, cshort4 b);  //@ ll _ccmatmpyr1
#endif  // >= C6600

#define __dot_ext(a,b)   __overload("__dot_ext",(a),(b))((a),(b))
#define __dot_extll(a,b) __overload("__dot_extll",(a),(b))((a),(b))
#define __ddot_ext(a,b)  __overload("__ddot_ext",(a),(b))((a),(b))
#define __mpy_fx(a,b)    __overload("__mpy_fx",(a),(b))((a),(b))
/*---------------------------------------------------------------------------*/
/* END BiF Section 4                                                         */
/*---------------------------------------------------------------------------*/

/*---------------------------------------------------------------------------*/
/* BiF Section 5: Endianness-dependent vector built-in functions             */
/* - Endianness dependent, map directly to instruction, use with CAUTION!!!  */
/* - Will NOT be supported on future DSP architectures!!!                    */
/*---------------------------------------------------------------------------*/
// CMPYSP instruction, extended precision: a:float2 * b:float2 -> float4
// Little Endian Result: { a.x*b.y, -a.x*b.x, a.y*b.x, a.y*b.y }
// Big    Endian Result: { a.x*b.x, a.x*b.y, -a.y*b.y, a.y*b.x }
// Big Endian should use future-proof __cmpy_ext() instead!
float4  __OVBIF __cmpysp_ext(float2 a, float2 b);  //@ x128 _cmpysp(d, d)
float8  __OVBIF __cmpysp_ext(float4 a, float4 b);
float16 __OVBIF __cmpysp_ext(float8 a, float8 b);
#define __cmpysp_ext(a,b)   __overload("__cmpysp_ext",(a),(b))((a),(b))
/*---------------------------------------------------------------------------*/
/* END BiF Section 5                                                         */
/*---------------------------------------------------------------------------*/

/* ------------------------------------------------------------------------- */
/*** Element-wise cast/conversion:   convert_newtypen(oldtypen)            ***/
/*** Whole-vector re-interpretation: as_newtypen(oldtypen)                 ***/
/*** OpenCL built-in, no need to declare: e.g. convert_uchar4_sat(short4)  ***/
/*** OpenCL built-in, no need to declare: e.g. as_int2(short4)             ***/
/* ------------------------------------------------------------------------- */


/*---------------------------------------------------------------------------*/
/* Old c6x.h intrinsics remain in c6x.h and not vec-converted because they   */
/* - work on scalar types                                                    */
/* - work directly on register parts, which are endianness dependent         */
/*---------------------------------------------------------------------------*/
/*---------------------------------------------------------------------------*/
/* END Old c6x.h intrinsics remain in c6x.h                                  */
/*---------------------------------------------------------------------------*/
#endif  // #ifndef __USE_VECTYPES_ONLY__

#ifdef __cplusplus
}
#endif /* __cplusplus */

#endif   // __TI_C6X_VECTOR_H__

