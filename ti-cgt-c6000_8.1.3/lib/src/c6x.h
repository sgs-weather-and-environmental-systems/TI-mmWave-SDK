/*****************************************************************************/
/*  C6X.H v8.1.3                                                             */
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

#include "vect.h"

#ifdef __cplusplus
extern "C"
{
#endif /* __cplusplus */

/*****************************************************************************/
/*                                                                           */
/* NOTICE TO THOSE WHO USE INTRINSICS AND PACKED DATA                        */
/*                                                                           */
/* This note contains information on a new __float2_t type.                  */
/* It also contains recommendations on the use of the "double" type.         */
/*                                                                           */
/* In order to better support packed data compiler optimizations in the      */
/* future, the use of the type "double" for packed data is now discouraged   */
/* and its support may be discontinued in the future.                        */
/*                                                                           */
/* There are several recommendations and changes as a result.  Note that     */
/* these changes do NOT break compatibility with older code (source files    */
/* or object files).                                                         */
/*                                                                           */
/* (1) long long should be used for 64-bit packed integer data.  The double  */
/*     type should be used only for double-precision floating point values.  */
/*                                                                           */
/* (2) There is a new type, __float2_t, that holds two floats and should     */
/*     be used instead of double for holding two floats.  For now, this new  */
/*     type is typedef'ed to double in c6x.h, but could be changed in the    */
/*     future to a structure or vector type to allow better optimization of  */
/*     packed data floats.  We recommend the use of __float2_t for any       */
/*     float x2 data instead of double.                                      */
/*                                                                           */
/* (3) There are new __float2_t manipulation intrinsics (see below) that     */
/*     should be used to create and manipulate objects of type __float2_t.   */
/*                                                                           */
/* (4) C66 intrinsics that deal with packed float data are now declared      */
/*     using __float2_t instead of double.  (Those intrinsics are declared   */
/*     in this file, c6x.h.)                                                 */
/*                                                                           */
/* (5) When using any intrinsic that involves __float2_t, c6x.h must be      */
/*     included.                                                             */
/*                                                                           */
/* (6) Certain intrinsics that used double to store fixed-point packed       */
/*     data have been deprecated.  They will still be supported in the       */
/*     near future, but their descriptions will be removed from the          */
/*     compiler user's guide (spru187).  Deprecated: _mpy2, _mpyhi, _mpyli,  */
/*     _mpysu4, _mpyu4, and _smpy2.  Use the long long versions instead.     */
/*                                                                           */
/* Please see                                                                */
/* http://processors.wiki.ti.com/index.php/C6000_Intrinsics_and_Type_Double  */
/* and the C6000 Compiler User's Guide (v7.2), spru187, for more             */
/* information.                                                              */
/*                                                                           */
/*****************************************************************************/
/* If not using host intrinsics, define __float2_t items. */
#ifndef __FLOAT2_DEFINES__
#define __FLOAT2_DEFINES__
  typedef double   __float2_t;
  /*-------------------------------------------------------------------------*/
  /* __float2_t manipulation intrinsics                                      */
  /*                                                                         */
  /* Since __float2_t is just a typedef to double at this time, we simply    */
  /* use #defines to "create" the __float2_t manipulation intrinsics.  The   */
  /* __float2_t intrinsics are listed in this comment for convenience.       */
  /*                                                                         */
  /* __float2_t _lltof2(long long)   Reinterpret long long as __float2_t     */
  /* long long  _f2toll(__float2_t)  Reinterpret __float2_t as long long     */
  /* __float2_t _ftof2(float, float) Create a __float2_t from 2 floats       */
  /* float      _hif2(__float2_t)    Return the hi 32 bits of a __float2_t   */
  /* float      _lof2(__float2_t)    Return the lo 32 bits of a __float2_t   */
  /* __int40_t  _f2tol(__float2_t)   Reinterpret __float2_t as 40-bit type   */
  /* __float2_t _ltof2(__int40_t)    Reinterpret 40-bit type as __float2_t   */
  /*                                                                         */
  /* __float2_t & _amem8_f2(void *)         |                                */
  /* __float2_t & _amem8_f2_const(void *)   | Allows (un)aligned loads and   */
  /* __float2_t & _mem8_f2(void *)          | stores of 8 bytes to and from  */
  /* __float2_t & _mem8_f2_const(void *)    | memory.                        */
  /*                                                                         */
  /* __float2_t _fdmv_f2(float, float)  Move two floats with one instruction */
  /* __float2_t _hif2_128(__x128_t)     Return hi 64 bits of __x128_t        */
  /* __float2_t _lof2_128(__x128_t)     Return hi 64 bits of __x128_t        */
  /* __x128_t   _f2to128(__float2_t, __float2_t)  Compose __x128_t           */
  /* __float2_t _fdmvd_f2(float, float) Delayed move of two floats           */
  /*-------------------------------------------------------------------------*/
  #define _lltof2  _lltod
  #define _f2toll  _dtoll
  #define _ftof2   _ftod
  #define _hif2    _hif
  #define _lof2    _lof
  #define _f2tol   _dtol
  #define _ltof2   _ltod

  #define _amem8_f2          _amemd8
  #define _amem8_f2_const    _amemd8_const

  /* _mem8_f2 and _mem8_f2_const for C6400 and compatible */
  #if defined(_TMS320C6400) || defined (_TMS320C6740) || \
      defined(_TMS320C6600)
    #define _mem8_f2         _memd8
    #define _mem8_f2_const   _memd8_const
  #endif

  /* _fdmv_f2 for C6400+ and compatible */
  #if defined(_TMS320C6400_PLUS) || defined(_TMS320C6740) || \
      defined(_TMS320C6600)
    #define _fdmv_f2   _fdmv
  #endif

  /* __float2_t manipulation intrinsics for __x128_t and C6600 */
  #ifdef _TMS320C6600
    #define _hif2_128  _hid128
    #define _lof2_128  _lod128
    #define _f2to128   _dto128
    #define _fdmvd_f2  _fdmvd
  #endif

#endif

unsigned  _extu	   (unsigned, unsigned, unsigned);
int       _ext	   (int,      unsigned, unsigned);
unsigned  _set	   (unsigned, unsigned, unsigned);
unsigned  _clr	   (unsigned, unsigned, unsigned);
unsigned  _extur   (unsigned, int);
int       _extr	   (int,      int);
unsigned  _setr	   (unsigned, int);
unsigned  _clrr	   (unsigned, int);
int       _sadd	   (int,      int);
int	  _ssub	   (int,      int);
int       _sshl	   (int,      unsigned);
int	  _add2	   (int,      int);
int	  _sub2	   (int,      int);
unsigned  _subc	   (unsigned, unsigned);
unsigned  _lmbd	   (unsigned, unsigned);
int       _abs	   (int);
__int40_t _labs	   (__int40_t);
unsigned  _norm	   (int);
int	  _smpy	   (int,      int);
int	  _smpyhl  (int,      int);
int	  _smpylh  (int,      int);
int	  _smpyh   (int,      int);
int	  _mpy	   (int,      int);
int	  _mpyus   (unsigned, int);
int	  _mpysu   (int,      unsigned);
unsigned  _mpyu	   (unsigned, unsigned);
int	  _mpyhl   (int,      int);
int	  _mpyhuls (unsigned, int);
int	  _mpyhslu (int,      unsigned);
unsigned  _mpyhlu  (unsigned, unsigned);
int	  _mpylh   (int,      int);
int	  _mpyluhs (unsigned, int);
int	  _mpylshu (int,      unsigned);
unsigned  _mpylhu  (unsigned, unsigned);
int	  _mpyh	   (int,      int);
int	  _mpyhus  (unsigned, int);
int	  _mpyhsu  (int,      unsigned);
unsigned  _mpyhu   (unsigned, unsigned);

__int40_t _lsadd   (int, __int40_t);
__int40_t _lssub   (int, __int40_t);
int       _sat	   (__int40_t);
unsigned  _lnorm   (__int40_t);

#ifdef _TMS320C6700
double    _fabs    (double);
float     _fabsf   (float);
long long _mpyidll (int,      int);
int    	  _spint   (float);
int    	  _dpint   (double);
float  	  _rcpsp   (float);
double 	  _rcpdp   (double);
float  	  _rsqrsp  (float);
double 	  _rsqrdp  (double);

/*double    _mpyid   (int,      int);  Deprecated.  Use _mpyidll instead. */
#endif

unsigned  _hi(double);      /* Return the hi 32 bits of a double as an int    */
float     _hif(double);     /* Return the hi 32 bits of a double as a float   */
unsigned  _hill(long long); /* Return the hi 32 bits of a long long as an int */
unsigned  _lo(double);      /* Return the lo 32 bits of a double as an int    */
float     _lof(double);     /* Return the lo 32 bits of a double as a float   */
unsigned  _loll(long long); /* Return the lo 32 bits of a long long as an int */
  
double 	  _itod(unsigned, unsigned);  /* Create a double from 2 ints    */
double 	  _ftod(float,    float);     /* Create a double from 2 floats  */
long long _itoll(unsigned, unsigned); /* Create a long long from 2 ints */
float  	  _itof(unsigned);            /* Reinterpret int as float.      */
unsigned  _ftoi(float);               /* Reinterpret float as int.      */

__int40_t _dtol(double);              /* Reinterpret double as 40-bit type    */
double    _ltod(__int40_t);           /* Reinterpret 40-bit type as double    */
long long _dtoll(double);             /* Reinterpret double as long long      */
double    _lltod(long long);          /* Reinterpret long long as double      */

#if defined(_TMS320C6400) || defined(_TMS320C6740) || defined(_TMS320C6600)
  /* Define pseudo intrinsics for some pseudo instructions */
  #ifndef _cmplt2
  #define _cmplt2(src1, src2) _cmpgt2((src2), (src1))
  #endif
  #ifndef _cmpltu4
  #define _cmpltu4(src1, src2) _cmpgtu4((src2), (src1))
  #endif
  #ifndef _dotpnrus2
  #define _dotpnrus2(src1, src2) _dotpnrsu2((src2), (src1))
  #endif
  #ifndef _dotpus4
  #define _dotpus4(src1, src2) _dotpsu4((src2), (src1))
  #endif
  #ifndef _mpyihll
  #define _mpyihll(src1, src2) _mpyhill((src2), (src1))
  #endif
  #ifndef _mpyihr
  #define _mpyihr(src1, src2) _mpyhir((src2), (src1))
  #endif
  #ifndef _mpyilll
  #define _mpyilll(src1, src2) _mpylill((src2), (src1))
  #endif
  #ifndef _mpyilr
  #define _mpyilr(src1, src2) _mpylir((src2), (src1))
  #endif
  #ifndef _mpyus4ll
  #define _mpyus4ll(src1, src2) _mpysu4ll((src2), (src1))
  #endif
  #ifndef _saddsu2
  #define _saddsu2(src1, src2) _saddus2((src2), (src1))
  #endif
  #ifndef _swap2
  #define _swap2(src) _packlh2((src), (src))
  #endif
int       _add4      (int,      int);
int       _avg2      (int,      int);
unsigned  _avgu4     (unsigned, unsigned);
int       _cmpeq2    (int,      int);
int       _cmpeq4    (int,      int);
int       _cmpgt2    (int,      int);
unsigned  _cmpgtu4   (unsigned, unsigned);
int       _dotp2     (int,      int);
int       _dotpn2    (int,      int);
int       _dotpnrsu2 (int,      unsigned);
int       _dotprsu2  (int,      unsigned);
int       _dotpsu4   (int,      unsigned);
unsigned  _dotpu4    (unsigned, unsigned);
int       _gmpy4     (int,      int);
__int40_t _ldotp2    (int,      int);
int       _max2      (int,      int);
unsigned  _maxu4     (unsigned, unsigned);
int       _min2      (int,      int);
unsigned  _minu4     (unsigned, unsigned);
long long _mpy2ll    (int,      int);
long long _mpyhill   (int,      int);
int       _mpyhir    (int,      int);
long long _mpylill   (int,      int);
int       _mpylir    (int,      int);
long long _mpysu4ll  (int,      unsigned);
long long _mpyu4ll   (unsigned, unsigned);
unsigned  _pack2     (unsigned, unsigned);
unsigned  _packh2    (unsigned, unsigned);
unsigned  _packh4    (unsigned, unsigned);
unsigned  _packhl2   (unsigned, unsigned);
unsigned  _packl4    (unsigned, unsigned);
unsigned  _packlh2   (unsigned, unsigned);
unsigned  _rotl      (unsigned, unsigned);
int       _sadd2     (int,      int);
unsigned  _saddu4    (unsigned, unsigned);
int       _saddus2   (unsigned, int);
unsigned  _shlmb     (unsigned, unsigned);
int       _shr2      (int,      unsigned);
unsigned  _shrmb     (unsigned, unsigned);
unsigned  _shru2     (unsigned, unsigned);
long long _smpy2ll   (int,      int);
int       _spack2    (int,      int);
unsigned  _spacku4   (int,      int);
int       _sshvl     (int,      int);
int       _sshvr     (int,      int);
int       _sub4      (int,      int);
int       _subabs4   (int,      int);
     
int       _abs2      (int);
unsigned  _bitc4     (unsigned);
unsigned  _bitr      (unsigned);
unsigned  _deal      (unsigned);
int       _mvd       (int);
unsigned  _shfl      (unsigned);
unsigned  _swap4     (unsigned);
unsigned  _unpkhu4   (unsigned);
unsigned  _unpklu4   (unsigned);
unsigned  _xpnd2     (unsigned);
unsigned  _xpnd4     (unsigned);

/*double  _mpy2      (int,      int);  Deprecated: use _mpy2ll instead */
/*double  _mpyhi     (int,      int);  Deprecated: use _mpyhill instead */
/*double  _mpysu4    (int,      unsigned);  Deprecated: use _mpysu4ll instead */
/*double  _mpyu4     (unsigned, unsigned);  Deprecated: use _mpyu4ll instead */
/*double  _smpy2     (int,      int);  Deprecated: use _smpy2ll instead */
#endif


#if defined(_TMS320C6400_PLUS) || defined(_TMS320C6740) || defined(_TMS320C6600)
long long _addsub    (int,       int);
long long _addsub2   (unsigned,  unsigned);
long long _cmpy      (unsigned,  unsigned);
unsigned  _cmpyr     (unsigned,  unsigned);
unsigned  _cmpyr1    (unsigned,  unsigned);
long long _ddotph2   (long long, unsigned);
unsigned  _ddotph2r  (long long, unsigned);
long long _ddotpl2   (long long, unsigned);
unsigned  _ddotpl2r  (long long, unsigned);
long long _ddotp4    (unsigned,  unsigned);
long long _dpack2    (unsigned,  unsigned);
long long _dpackx2   (unsigned,  unsigned);
long long _dmv       (unsigned,  unsigned);
double    _fdmv      (float,     float);
unsigned  _gmpy      (unsigned,  unsigned);
long long _mpy32ll   (int,       int);
int       _mpy32     (int,       int);
long long _mpy32su   (int,       unsigned);
long long _mpy32us   (unsigned,  int);
long long _mpy32u    (unsigned,  unsigned);
long long _mpy2ir    (unsigned,  int);
unsigned  _rpack2    (unsigned,  unsigned);
long long _saddsub   (int,       int);
long long _saddsub2  (unsigned,  unsigned);
long long _shfl3     (unsigned,  unsigned);
int       _smpy32    (int,       int);
int       _ssub2     (int,       int);
unsigned  _xormpy    (unsigned,  unsigned);
#endif

#if defined(_TMS320C6600)
long long  _dcmpyr1    (long long, long long);
long long  _dccmpyr1   (long long, long long);
long long  _cmpy32r1   (long long, long long);
long long  _ccmpy32r1  (long long, long long);
long long  _mpyu2      (unsigned,  unsigned);
int        _dotp4h     (long long, long long);
long long  _dotp4hll   (long long, long long);
int        _dotpsu4h   (long long, long long);
long long  _dotpsu4hll (long long, long long);
long long  _dadd       (long long, long long);
long long  _dadd_c     (int,       long long);
long long  _dsadd      (long long, long long);
long long  _dadd2      (long long, long long);
long long  _dsadd2     (long long, long long);
long long  _dsub       (long long, long long);
long long  _dssub      (long long, long long);
long long  _dssub2     (long long, long long);
long long  _dapys2     (long long, long long);
long long  _dshr       (long long, unsigned);
long long  _dshru      (long long, unsigned);
long long  _dshl       (long long, unsigned);
long long  _dshr2      (long long, unsigned);
long long  _dshru2     (long long, unsigned);
unsigned   _shl2       (unsigned , unsigned);
long long  _dshl2      (long long, unsigned);
long long  _dxpnd4     (unsigned);
long long  _dxpnd2     (unsigned);
int        _crot90     (int);
long long  _dcrot90    (long long);
int        _crot270    (int);
long long  _dcrot270   (long long);
long long  _dmax2      (long long, long long);
long long  _dmin2      (long long, long long);
long long  _dmaxu4     (long long, long long);
long long  _dminu4     (long long, long long);
unsigned   _dcmpgt2    (long long, long long);
unsigned   _dcmpeq2    (long long, long long);
unsigned   _dcmpgtu4   (long long, long long);
unsigned   _dcmpeq4    (long long, long long);
long long  _davg2      (long long, long long);
long long  _davgu4     (long long, long long);
long long  _davgnr2    (long long, long long);
long long  _davgnru4   (long long, long long);
long long  _unpkbu4    (unsigned);
long long  _unpkh2     (unsigned);
long long  _unpkhu2    (unsigned);
long long  _dpackl2    (long long, long long);
long long  _dpackh2    (long long, long long);
long long  _dpackhl2   (long long, long long);
long long  _dpacklh4   (unsigned,  unsigned);
long long  _dpackl4    (long long, long long);
long long  _dpackh4    (long long, long long);
long long  _dspacku4   (long long, long long);
void       _mfence     ();
__float2_t _dmpysp     (__float2_t, __float2_t);
__float2_t _daddsp     (__float2_t, __float2_t);
__float2_t _dsubsp     (__float2_t, __float2_t);
__float2_t _dinthsp    (unsigned);
__float2_t _dinthspu   (unsigned);
__float2_t _dintsp     (long long);
__float2_t _dintspu    (long long);
unsigned   _dspinth    (__float2_t);
long long  _dspint     (__float2_t);

int        _land       (int, int);
int        _landn      (int, int);
int        _lor        (int, int);

long long  _dmvd       (int,       int);
double     _fdmvd      (float,     float);

__float2_t _complex_mpysp           (__float2_t, __float2_t); /* CMPYSP then DADDSP */
__float2_t _complex_conjugate_mpysp (__float2_t, __float2_t); /* CMPYSP then DSUBSP */

long long  _xorll_c    (int, long long);

__x128_t   __BUILTIN _dcmpy      (long long, long long);
__x128_t   __BUILTIN _dccmpy     (long long, long long);
long long  __BUILTIN _cmatmpyr1  (long long, __x128_t);
long long  __BUILTIN _ccmatmpyr1 (long long, __x128_t);
__x128_t   __BUILTIN _cmatmpy    (long long, __x128_t);
__x128_t   __BUILTIN _ccmatmpy   (long long, __x128_t);
__x128_t   __BUILTIN _qsmpy32r1  (__x128_t,  __x128_t);
__x128_t   __BUILTIN _qmpy32     (__x128_t,  __x128_t);
__x128_t   __BUILTIN _dsmpy2     (long long, long long);
__x128_t   __BUILTIN _dmpy2      (long long, long long);
__x128_t   __BUILTIN _dmpyu2     (long long, long long);
__x128_t   __BUILTIN _dmpysu4    (long long, long long);
__x128_t   __BUILTIN _dmpyu4     (long long, long long);
__x128_t   __BUILTIN _cmpysp     (__float2_t, __float2_t);
__x128_t   __BUILTIN _qmpysp     (__x128_t,  __x128_t);
long long  __BUILTIN _ddotp4h    (__x128_t,  __x128_t);
long long  __BUILTIN _ddotpsu4h  (__x128_t,  __x128_t);

__x128_t   __BUILTIN _ito128  (unsigned,  unsigned, unsigned, unsigned);
__x128_t   __BUILTIN _fto128  (float,     float,    float,    float);
__x128_t   __BUILTIN _llto128 (long long, long long);
__x128_t   __BUILTIN _dto128  (double,    double);

long long  __BUILTIN _hi128   (__x128_t);
double     __BUILTIN _hid128  (__x128_t);
long long  __BUILTIN _lo128   (__x128_t);
double     __BUILTIN _lod128  (__x128_t);

unsigned  __BUILTIN _get32_128  (__x128_t, __CONST(0,3) unsigned);
float     __BUILTIN _get32f_128 (__x128_t, __CONST(0,3) unsigned);

__x128_t  __BUILTIN _dup32_128 (unsigned);

#endif

extern __cregister volatile unsigned int AMR;
extern __cregister volatile unsigned int CSR;
extern __cregister volatile unsigned int IFR;
extern __cregister volatile unsigned int ISR;
extern __cregister volatile unsigned int ICR;
extern __cregister volatile unsigned int IER;
extern __cregister volatile unsigned int ISTP;
extern __cregister volatile unsigned int IRP;
extern __cregister volatile unsigned int NRP;

#if defined(_TMS320C6400) || defined(_TMS320C6740) || defined(_TMS320C6600)
extern __cregister volatile unsigned int GFPGFR;
extern __cregister volatile unsigned int DIER;
#endif

#ifdef _TMS320C6700
extern __cregister volatile unsigned int FADCR;
extern __cregister volatile unsigned int FAUCR;
extern __cregister volatile unsigned int FMCR;
#endif

#ifdef _TMS320C6700_PLUS
extern __cregister volatile unsigned int DESR;
extern __cregister volatile unsigned int DETR;
#endif

#if defined(_TMS320C6400_PLUS) || defined(_TMS320C6740) || defined(_TMS320C6600)
extern __cregister volatile unsigned int REP;
extern __cregister volatile unsigned int TSCL;
extern __cregister volatile unsigned int TSCH;
extern __cregister volatile unsigned int ARP;
extern __cregister volatile unsigned int ILC;
extern __cregister volatile unsigned int RILC;
extern __cregister volatile unsigned int PCE1;
extern __cregister volatile unsigned int DNUM;
extern __cregister volatile unsigned int SSR;
extern __cregister volatile unsigned int GPLYA;
extern __cregister volatile unsigned int GPLYB;
extern __cregister volatile unsigned int TSR;
extern __cregister volatile unsigned int ITSR;
extern __cregister volatile unsigned int NTSR;
extern __cregister volatile unsigned int ECR;
extern __cregister volatile unsigned int EFR;
extern __cregister volatile unsigned int IERR;

extern __cregister volatile unsigned int DMSG;
extern __cregister volatile unsigned int CMSG;
extern __cregister volatile unsigned int DT_DMA_ADDR;
extern __cregister volatile unsigned int DT_DMA_DATA;
extern __cregister volatile unsigned int DT_DMA_CNTL;
extern __cregister volatile unsigned int TCU_CNTL;
extern __cregister volatile unsigned int RTDX_REC_CNTL;
extern __cregister volatile unsigned int RTDX_XMT_CNTL;
extern __cregister volatile unsigned int RTDX_CFG;
extern __cregister volatile unsigned int RTDX_RDATA;
extern __cregister volatile unsigned int RTDX_WDATA;
extern __cregister volatile unsigned int RTDX_RADDR;
extern __cregister volatile unsigned int RTDX_WADDR;
extern __cregister volatile unsigned int MFREG0;
extern __cregister volatile unsigned int DBG_STAT;
extern __cregister volatile unsigned int BRK_EN;
extern __cregister volatile unsigned int HWBP0_CNT;
extern __cregister volatile unsigned int HWBP0;
extern __cregister volatile unsigned int HWBP1;
extern __cregister volatile unsigned int HWBP2;
extern __cregister volatile unsigned int HWBP3;
extern __cregister volatile unsigned int OVERLAY;
extern __cregister volatile unsigned int PC_PROF;
extern __cregister volatile unsigned int ATSR;
extern __cregister volatile unsigned int TRR;
extern __cregister volatile unsigned int TCRR;
#endif

#ifdef __cplusplus
} /* extern "C" */
#endif /* __cplusplus */

/*****************************************************************************/
/* DATA_IS_ALIGNED_2, DATA_IS_ALIGNED_4, DATA_IS_ALIGNED_8 -                 */
/*     Tell the compiler that data is already aligned to a 2-byte, 4-byte    */
/*     or 8-byte boundary.  Note: this macro does not change the             */
/*     alignment of data.  Use DATA_ALIGN to change alignment.               */
/*****************************************************************************/
#define DATA_IS_ALIGNED_2(x)	(_nassert(((unsigned int)(x) & 0x1) == 0))
#define DATA_IS_ALIGNED_4(x)	(_nassert(((unsigned int)(x) & 0x3) == 0))
#define DATA_IS_ALIGNED_8(x)	(_nassert(((unsigned int)(x) & 0x7) == 0))


/*****************************************************************************/
/* SAVE_AMR -                                                                */
/*     Define a local 'volatile unsigned int' variable in your interrupt     */
/*     routine.                                                              */
/*     When invoking this macro, pass that local variable to save the AMR.   */
/*                                                                           */
/*     If you interrupted an assembly coded routine that may be using        */
/*     circular addressing, and you interrupt into a C coded interrupt       */
/*     service routine, you need to set the AMR to 0 for the C code and save */
/*     off the AMR register, so that it will have the correct value upon     */
/*     leaving the C interrupt service routine and returning to the assembly */
/*     code.                                                                 */
/*                                                                           */
/*     Add this routine immediately after your local variable definitions    */
/*     and before the start of your C interrupt code.                        */
/*****************************************************************************/
#define SAVE_AMR(temp_AMR)                                                    \
        do {                                                                  \
            temp_AMR = AMR;                                                   \
            AMR = 0;                                                          \
        } while (0)

/*****************************************************************************/
/* RESTORE_AMR -                                                             */
/*    When invoking this macro, pass the same local variable that was passed */
/*    to the SAVE_AMR macro.  This macro will restore the AMR to the value   */
/*    it had when interrupted out of the hand assembly routine.              */
/*                                                                           */
/*    Add this macro immediately before exiting the C interrupt service      */
/*    routine.                                                               */ 
/*****************************************************************************/
#define RESTORE_AMR(temp_AMR)                                                 \
        do {                                                                  \
            AMR = temp_AMR;                                                   \
        } while (0)

/*****************************************************************************/
/* SAVE_SAT -                                                                */
/*     Define a local 'volatile unsigned int' variable in your interrupt     */
/*     routine.                                                              */
/*     When invoking this macro, pass that local variable to save the SAT    */
/*     bit.                                                                  */
/*                                                                           */
/*     If you interrupted a routine that was performing saturated arithmetic */
/*     and the interrupt service routine is also performing saturated        */
/*     arithmetic, then you must save and restore the SAT bit in your        */
/*     interrupt service routine.                                            */
/*                                                                           */
/*     Add this routine immediately after your local variable definitions    */
/*     and before the start of your C interrupt code.                        */
/*****************************************************************************/
#define SAVE_SAT(temp_SAT)                                                    \
        do {                                                                  \
            temp_SAT = _extu(CSR, 22, 31);                                    \
        } while (0)

/*****************************************************************************/
/* RESTORE_SAT -                                                             */
/*    When invoking this macro, pass the same local variable that was passed */
/*    to the SAVE_SAT macro.  This macro will restore the SAT bit to the     */
/*    value it had when your application was interrupted.                    */
/*                                                                           */
/*    Add this macro immediately before exiting the C interrupt service      */
/*    routine.                                                               */ 
/*****************************************************************************/
#define RESTORE_SAT(temp_SAT)                                                 \
        do {                                                                  \
            CSR      = _clr(CSR, 9, 9);                                       \
            temp_SAT = _sshl(temp_SAT, 31);                                   \
        } while (0)
