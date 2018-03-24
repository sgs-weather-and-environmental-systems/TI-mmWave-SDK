/*****************************************************************************/
/*  llshift.c v8.1.3                                                         */
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
#include <stdio.h>
#include <stdint.h>

typedef unsigned short ushort;
typedef unsigned int uint;

/*--------------------------------------------------------------------------*/
/* LLSHL - Long long shift left (sign of long long doesn't matter for SHL). */
/* Assumes a matcher rule exists to shift right a long long value by a const*/
/*--------------------------------------------------------------------------*/
#ifdef __TI_EABI__
_CODE_ACCESS uint64_t __c6xabi_llshl(uint64_t src1, uint src2)
#else
_CODE_ACCESS uint64_t _llshl(uint64_t src1, uint src2)
#endif
{
    uint src1_lo  = (uint)src1;
    uint src1_hi  = src1 >> 32;
    uint dst_lo, dst_hi;

    if (!src1 || !src2) return src1;

    /*----------------------------------------------------------------------*/
    /* Case 1: src2 < 32             					    */
    /*									    */
    /* We have 3 steps: shl hi word, shl lo word, and then OR some bits     */
    /* transferred from lo to hi.                      			    */
    /*----------------------------------------------------------------------*/
    if (src2 < 32)
    {
	uint lo_to_hi = 32 - src2;
	uint xfer_bits;

        dst_lo    =  src1_lo << src2;
	xfer_bits =  src1_lo >> lo_to_hi;
        dst_hi    =  (src1_hi << src2) | xfer_bits;

	return((uint64_t)_itoll(dst_hi, dst_lo));
    }

    /*----------------------------------------------------------------------*/
    /* Case 2: src2 > 32 && src2 < 64					    */
    /*									    */
    /* Move src1_lo over to dst_hi (implicit shift by 32) and then shift by */
    /* remaining amount.          		     			    */
    /*----------------------------------------------------------------------*/
    else if (src2 < 64)
    {
	uint rem = src2 - 32;
	
	dst_hi = src1_lo << rem;
        dst_lo = 0;

	return((uint64_t)_itoll(dst_hi, dst_lo));
    }

    /*----------------------------------------------------------------------*/
    /* Case 3: src2 >= 64 			                            */
    /*----------------------------------------------------------------------*/
    return(0);
}

/*--------------------------------------------------------------------------*/
/* LLSHR - Signed long long shift right.				    */
/* Assumes a matcher rule exists to shift right a long long value by a const*/
/*--------------------------------------------------------------------------*/
#ifdef __TI_EABI__
_CODE_ACCESS uint64_t __c6xabi_llshr(uint64_t src1, uint src2)
#else
_CODE_ACCESS int64_t _llshr(int64_t src1, uint src2)
#endif
{
    uint src1_lo  = (uint)src1;
    int src1_hi   = src1 >> 32;   /* Needs to be signed int */
    uint dst_lo, dst_hi;

    /*----------------------------------------------------------------------*/
    /* Case 1: src2 < 32             					    */
    /*									    */
    /* We have 3 steps: shr hi word, shr lo word, and then OR some bits     */
    /* transferred from hi to lo.                      			    */
    /*----------------------------------------------------------------------*/
    if (src2 < 32)
    {
	uint hi_to_lo = 32 - src2;
	uint xfer_bits;

        dst_lo    =  src1_lo >> src2;
	xfer_bits =  src1_hi << hi_to_lo;
	dst_lo   |=  xfer_bits;
        dst_hi    =  src1_hi >> src2;
    }

    /*----------------------------------------------------------------------*/
    /* Case 2: src2 > 32 && src2 < 64					    */
    /*									    */
    /* Move src1_hi over to dst_lo (implicit shift by 32) and then shift by */
    /* remaining amount. Sign extend dst_hi.    			    */
    /*----------------------------------------------------------------------*/
    else if (src2 < 64)
    {
	uint rem = src2 - 32;
	
	dst_lo = src1_hi >> rem;
        dst_hi = src1_hi >> 31;
    }

    /*----------------------------------------------------------------------*/
    /* Case 3: src2 >= 64 			                            */
    /*----------------------------------------------------------------------*/
    else
    {
	dst_lo = dst_hi = src1_hi >> 31;
    }

    return(_itoll(dst_hi, dst_lo));
}

/*--------------------------------------------------------------------------*/
/* LLSHRU - Unsigned long long shift right.				    */
/* Assumes a matcher rule exists to shift right a long long value by a const*/
/*--------------------------------------------------------------------------*/
#ifdef __TI_EABI__
_CODE_ACCESS uint64_t __c6xabi_llshru(uint64_t src1, uint src2)
#else
_CODE_ACCESS uint64_t _llshru(uint64_t src1, uint src2)
#endif
{
    uint src1_lo  = (uint)src1;
    uint src1_hi  = src1 >> 32;
    uint dst_lo, dst_hi;

    /*----------------------------------------------------------------------*/
    /* Case 1: src2 < 32             					    */
    /*									    */
    /* We have 3 steps: shr hi word, shr lo word, and then OR some bits     */
    /* transferred from hi to lo.                      			    */
    /*----------------------------------------------------------------------*/
    if (src2 < 32)
    {
	uint hi_to_lo = 32 - src2;
	uint xfer_bits;

        dst_lo    =  src1_lo >> src2;
	xfer_bits =  src1_hi << hi_to_lo;
	dst_lo   |=  xfer_bits;
        dst_hi    =  src1_hi >> src2;

        return((uint64_t)_itoll(dst_hi, dst_lo));
    }

    /*----------------------------------------------------------------------*/
    /* Case 2: src2 > 32 && src2 < 64					    */
    /*									    */
    /* Move src1_hi over to dst_lo (implicit shift by 32) and then shift by */
    /* remaining amount. Zero out dst_hi. 		    		    */
    /*----------------------------------------------------------------------*/
    else if (src2 < 64)
    {
	uint rem = src2 - 32;
	
	dst_lo = src1_hi >> rem;

        return((uint64_t)dst_lo);
    }

    /*----------------------------------------------------------------------*/
    /* Case 3: src2 >= 64 			                            */
    /*----------------------------------------------------------------------*/
    return(0);
}

