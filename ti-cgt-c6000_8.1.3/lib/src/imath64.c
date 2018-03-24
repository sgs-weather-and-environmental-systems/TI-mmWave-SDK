/*****************************************************************************/
/* IMATH64.C   v8.1.3 - Long Long int arithmetic                             */
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

#ifdef __TI_EABI__
#define _divull __c6xabi_divull
#define _divlli __c6xabi_divlli
#endif


unsigned long long _divull (unsigned long long x1, unsigned long long x2);
long long          _divlli (long long a, long long b);

/***********************************************************************/
/*                                                                     */
/* _lmbdull() - Same as _lmbd(int, int) but takes (int, ulong long).   */
/*                                                                     */
/***********************************************************************/
static __inline unsigned _lmbdull(int val, unsigned long long src)
{
    unsigned int p1 = src >> 32; 
    unsigned p2 = src;
    unsigned int pos;

    if ((pos = _lmbd(val, p1)) == 32)
      return _lmbd(val, p2) + 32;
    else return pos;
}

/***********************************************************************/
/*                                                                     */
/* _subcull() - Same as _subc(int, int), but takes 		       */
/* (ulong long, ulong long).      				       */
/*                                                                     */
/***********************************************************************/
_CODE_ACCESS unsigned long long _subcull(unsigned long long src1, 
					    unsigned long long src2)
{
    unsigned long long res1 = ((src1-src2) << 1) | 0x1;
    unsigned long long res2 = src1 << 1;
    if (src1 >= src2)
      return res1;
    else
      return res2;
}

/***********************************************************************/
/*                                                                     */
/* _remull() - Unsigned 64-bit remainder.                              */
/*                                                                     */
/***********************************************************************/
#ifdef __TI_EABI__
_CODE_ACCESS unsigned long long __c6xabi_remull (unsigned long long a, 
#else
_CODE_ACCESS unsigned long long _remull (unsigned long long a, 
#endif
					 unsigned long long b)
{
    return a - _divull(a,b) * b;
}

/***********************************************************************/
/*                                                                     */
/* _divull() - Unsigned 64-bit division.                               */
/*                                                                     */
/***********************************************************************/
#ifdef __TI_EABI__
_CODE_ACCESS unsigned long long __c6xabi_divull(unsigned long long x1, unsigned long long x2)
#else
_CODE_ACCESS unsigned long long _divull(unsigned long long x1, unsigned long long x2)
#endif
{
    register int i;
    register unsigned long long num;
    register unsigned long long den;
    register int shift;
    unsigned long long first_div = 0;
    unsigned long long num64;

    shift = _lmbdull(1, x2) - _lmbdull(1, x1);

    if (x1 < x2) return 0;
    if (x1 == 0) return 0;
    /* ! if (x2 == 0) return  -1;  */
    if (x2 == 0) return (unsigned long long) -1;      

    num = x1;
    den = x2 << shift;

    num64 = (_lmbdull(1, x1) == 0);

    first_div = num64 << shift;

    if (den > num) first_div >>= 1; 

    if (num64)
    {
	if(den > num) { den >>= 1; num -= den; }
	else          { num -= den; den >>= 1; }
    }
    else
	shift++;

    for (i = 0; i < shift; i++)
    {
      num = _subcull(num, den);
    }

    if (shift)
        return num << (64-shift) >> (64-shift) | first_div;
    else
	return first_div;
}

/***********************************************************************/
/*                                                                     */
/* _remlli() - Signed 64-bit remainder.                                */
/*                                                                     */
/***********************************************************************/
#ifdef __TI_EABI__
_CODE_ACCESS long long __c6xabi_remlli (long long a, long long b)
#else
_CODE_ACCESS long long _remlli (long long a, long long b)
#endif
{
    return a - _divlli(a,b) * b;
}

/***********************************************************************/
/*                                                                     */
/* _divlli() - Signed 64-bit division.                                 */
/*                                                                     */
/***********************************************************************/
#ifdef __TI_EABI__
_CODE_ACCESS long long __c6xabi_divlli(long long a, long long b)
#else
_CODE_ACCESS long long _divlli(long long a, long long b)
#endif
{
   /*-----------------------------------------------------------------------*/
   /* CHECK SIGNS, TAKE ABSOLUTE VALUE, AND USED UNSIGNED DIVIDE.           */
   /*-----------------------------------------------------------------------*/
   long long sign        = (a ^ b) >> 63;
   unsigned long long ua = (a == LLONG_MIN ? a : llabs(a));
   unsigned long long ub = (b == LLONG_MIN ? b : llabs(b));
   unsigned long long q  = _divull(ua, ub);

   if (b == 0) return a ? (((unsigned long long)-1) >> 1) ^ sign : 0;
			/* saturation value or 0 */

   return sign ? -q : q;
}
