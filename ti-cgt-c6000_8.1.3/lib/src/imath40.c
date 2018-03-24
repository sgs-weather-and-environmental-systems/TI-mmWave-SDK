/*****************************************************************************/
/* IMATH40.C   v8.1.3 - 40_bit int arithmetic                                */
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
#include <stdio.h>
#include <limits.h>
#include <c6x.h>

#ifdef __TI_EABI__
#define _divul __c6xabi_divul
#define _divli __c6xabi_divli
#endif

unsigned __int40_t _divul (unsigned __int40_t x1, unsigned __int40_t x2);
__int40_t          _divli (__int40_t a, __int40_t b);

/***********************************************************************/
/*                                                                     */
/* _lmbdul() - Same as _lmbd(int, int) but takes (int, u__int40_t).    */
/*                                                                     */
/***********************************************************************/
static __inline unsigned _lmbdul(int val, unsigned __int40_t src)
{
    unsigned p1 = src >> 32; 
    unsigned p2 = src;
    unsigned pos;

    if (!val) p1 |= 0xffffff00;
    
    if ((pos = _lmbd(val, p1)) == 32)
	return _lmbd(val, p2) + 32;
    else return pos;
}

/***********************************************************************/
/*                                                                     */
/* _subcul() - Same as _subc(int,int), but takes                       */
/*             (unsigned __int40_t, unsigned int40_t)                  */
/*                                                                     */
/***********************************************************************/
static __inline unsigned __int40_t _subcul(unsigned __int40_t src1, 
                                           unsigned __int40_t src2)
{
    unsigned __int40_t res1 = ((src1-src2) << 1) | 0x1;
    unsigned __int40_t res2 = src1 << 1;
    if (src1 >= src2)
	return res1;
    else
	return res2;
}

/***********************************************************************/
/*                                                                     */
/* _remul() - Unsigned 40-bit remainder.                               */
/*                                                                     */
/***********************************************************************/
#ifdef __TI_EABI__
_CODE_ACCESS unsigned __int40_t __c6xabi_remul (unsigned __int40_t a, 
                                                unsigned __int40_t b)
#else
_CODE_ACCESS unsigned __int40_t _remul (unsigned __int40_t a, 
                                        unsigned __int40_t b)
#endif
{
    return a - _divul(a,b) * b;
}

/***********************************************************************/
/*                                                                     */
/* _divul() - Unsigned 40-bit division.                                */
/*                                                                     */
/***********************************************************************/
#ifdef __TI_EABI__
_CODE_ACCESS unsigned __int40_t __c6xabi_divul (unsigned __int40_t x1, 
                                                unsigned __int40_t x2)
#else
_CODE_ACCESS unsigned __int40_t _divul (unsigned __int40_t x1, 
                                        unsigned __int40_t x2)
#endif
{
    register int i;
    register unsigned __int40_t num;
    register unsigned __int40_t den;
    register int shift;
    unsigned __int40_t first_div = 0;
    unsigned __int40_t num40;

    shift = _lmbdul(1, x2) - _lmbdul(1, x1);

    if (x1 < x2) return 0;
    if (x1 == 0) return 0;
    /* ! if (x2 == 0) return  -1;  */
    if (x2 == 0) return (unsigned __int40_t) -1;      

    num = x1;
    den = x2 << shift;

    num40 = (_lmbdul(1, x1) == 24);

    first_div = num40 << shift;

    if (den > num) first_div >>= 1; 

    if (num40)
    {
	if(den > num) { den >>= 1; num -= den; }
	else          { num -= den; den >>= 1; }
    }
    else
	shift++;

    for (i = 0; i < shift; i++)
      num = _subcul(num, den);

    if (shift)
	return num << (40-shift) >> (40-shift) | first_div;
    else
	return first_div;
}

/***********************************************************************/
/*                                                                     */
/* _remli() - Signed 40-bit remainder.                                 */
/*                                                                     */
/***********************************************************************/
#ifdef __TI_EABI__
_CODE_ACCESS __int40_t __c6xabi_remli (__int40_t a, __int40_t b)
#else
_CODE_ACCESS __int40_t _remli (__int40_t a, __int40_t b)
#endif
{
    return a - _divli(a,b) * b;
}

/***********************************************************************/
/*                                                                     */
/* _divli() - Signed 40-bit division.                                  */
/*                                                                     */
/***********************************************************************/
#ifdef __TI_EABI__
_CODE_ACCESS __int40_t __c6xabi_divli(__int40_t a, __int40_t b)
#else
_CODE_ACCESS __int40_t _divli(__int40_t a, __int40_t b)
#endif
{
   /*-----------------------------------------------------------------------*/
   /* CHECK SIGNS, TAKE ABSOLUTE VALUE, AND USED UNSIGNED DIVIDE.           */
   /*-----------------------------------------------------------------------*/
   __int40_t sign    = (a ^ b) >> 39;
   unsigned __int40_t ua = (a == INT40_T_MIN ? a : _labs(a));
   unsigned __int40_t ub = (b == INT40_T_MIN ? b : _labs(b));
   unsigned __int40_t q  = _divul(ua, ub);

   if (b == 0) return a ? (((unsigned __int40_t)-1) >> 1) ^ sign : 0;
			/* saturation value or 0 */

   return sign ? -q : q;
}
