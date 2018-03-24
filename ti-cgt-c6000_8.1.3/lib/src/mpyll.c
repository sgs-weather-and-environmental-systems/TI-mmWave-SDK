/*****************************************************************************/
/*  mpyll.c v8.1.3                                                           */
/*                                                                           */
/* Copyright (c) 2002-2017 Texas Instruments Incorporated                    */
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
#include <limits.h>
#include <c6x.h>
#include <stdlib.h>
#include <stdint.h>

typedef unsigned short ushort;
typedef unsigned int uint;

/*---------------------------------------------------------------------------*/
/* MPYLL: Generic long long mpy routine				     	     */
/*									     */
/* Assumes matcher rule exists to shift left/right a long long value by a    */
/* const.								     */
/*									     */
/* Method of implementation:						     */
/*  Each src is divided into four 16-bit quantities, as shown below          */
/*       _______________________________				     */
/*       | top(T)|  hi(H)| mid(M)| lo(L)|				     */
/*    	 --------------------------------				     */
/* We compute partial results as follows:				     */
/* c1 = src1.L*src2.L							     */
/* c2 = (uint64_t)(src1.M*src2.L + src2.M*src1.L) << 16			     */
/* c3 = ((uint64_t)(src1.H*src2.L+src1.M*src2.M+src2.H*src1.L)) << 32        */
/* c4 = {(uint64_t)( ((int)(src1.T*src2.L+src2.T+src1.L))+		     */
/*                 (uint)(src1.H*src2.M+src2.H*src1.M) )} << 48	     	     */
/* dst = c1+c2+c3+c4							     */
/*---------------------------------------------------------------------------*/
#ifdef __TI_EABI__
_CODE_ACCESS uint64_t __c6xabi_mpyll(uint64_t src1, uint64_t src2)
#else
_CODE_ACCESS uint64_t _mpyll(uint64_t src1, uint64_t src2)
#endif /* __TI_EABI__ */
{
    uint      src1_lo, src2_lo, src1_hi, src2_hi;
    uint      temp1, temp3, temp5;
    uint64_t  temp2, temp4, temp6;
    uint64_t   dst;

    src1_lo = (uint)src1;
    src1_hi = src1 >> 32;
    src2_lo = (uint)src2;
    src2_hi = src2 >> 32;
    /*-----------------------------------------------------------------------*/
    /* Begin computing partial results. Compute (1.lo*2.lo) first. This gets */
    /* added directly (with no left shifts).			             */
    /*-----------------------------------------------------------------------*/
    temp1 = _mpyu(src1_lo, src2_lo);  /* 1.lo * 2.lo */

    /*-----------------------------------------------------------------------*/
    /* Compute (1.M*2.lo)+(2.M*1.lo), save result as long, and shl by 16     */
    /*-----------------------------------------------------------------------*/
    temp2 = ((uint64_t)_mpyhlu(src1_lo, src2_lo) + 
	     (uint64_t)_mpyhlu(src2_lo, src1_lo)) << 16;

    /*-----------------------------------------------------------------------*/
    /* Compute (1.M*2.M)+(1.H*2.lo)+(2.H*1.lo) and add them together. An     */
    /* integer addition would suffice as this is going to be left shifted by */
    /* 32 and we'll lose the upper bits anyway.				     */
    /*-----------------------------------------------------------------------*/
    temp3 = _mpyhu(src1_lo, src2_lo) + _mpyu(src1_hi, src2_lo) +
	    _mpyu (src2_hi, src1_lo); 
    temp4 = ((uint64_t)temp3) << 32;

    /*-----------------------------------------------------------------------*/
    /* Compute (1.T * 2.lo)+(2.T*1.lo) as signed mpy. Add the result with    */
    /* (1.H*2.M)+(2.H*1.M). Shift result left by 32 and save as long long    */	
    /*-----------------------------------------------------------------------*/
    temp5 =  _mpyhlu (src1_hi, src2_lo) + _mpyhlu (src2_hi, src1_lo) 
           + _mpyhlu (src2_lo, src1_hi) + _mpyhlu (src1_lo, src2_hi);
    temp6 = ((uint64_t)temp5) << 48; 

    /*-----------------------------------------------------------------------*/
    /* Finally, add all partial results					     */
    /*-----------------------------------------------------------------------*/
    dst = temp1 + temp2 + temp4 + temp6;

    return(dst);
}

