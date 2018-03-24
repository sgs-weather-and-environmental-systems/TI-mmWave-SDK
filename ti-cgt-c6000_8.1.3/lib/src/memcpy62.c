/*****************************************************************************/
/* memcpy62   v8.1.3 - Memcpy for C6200 & C6700                              */
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
#undef _INLINE
#include <string.h>

#if !defined(_TMS320C6400) && !defined(_TMS320C6740) && !defined(_TMS320C6600) \
    || _TI_USE_C_MEMCPY

_CODE_ACCESS void *memcpy(void *dst, const void *src, size_t len)
{
   char *restrict d0    = (char*) dst;
   char *restrict s0    = (char*) src;
   int            s_aln = ((int)s0 & 0x3);
   int            d_aln = ((int)d0 & 0x3);
   int            prebytes;
   unsigned int   i;

   /*------------------------------------------------------------------------*/
   /* IF OUR SOURCE AND DESTINATION ARE NOT ALIGNED CORRECTLY FOR WORD       */
   /* COPIES, OR OUR LENGTH IS LESS THAN EIGHT BYTES, JUST DO A BYTE COPY.   */
   /*------------------------------------------------------------------------*/
   if ((s_aln != d_aln) || len < 27)
   {
      if (len & 1) *d0++ = *s0++;
      if (len & 2) {*d0++ = *s0++; *d0++ = *s0++;}
      if (len & 4) {*d0++ = *s0++; *d0++ = *s0++; *d0++ = *s0++; *d0++ = *s0++;}

      len &= ~7;

      if (len)
      {
          #pragma MUST_ITERATE(6);
          for (i = 0; i < len; i++) d0[i] = s0[i]; 
      }
      return dst;
   }

   /*------------------------------------------------------------------------*/
   /* PRECOPY 4-S_ALN BYTES, TO ALIGN SRC AND DST TO A WORD BOUNDRY.         */
   /*------------------------------------------------------------------------*/
   prebytes = (4 - s_aln) & 3;
   if (prebytes & 0x1)  *d0++ = *s0++;
   if (prebytes & 0x2)  { _amem2(d0) = _amem2(s0); d0 +=2; s0 += 2; }

   len -= prebytes;

   /*------------------------------------------------------------------------*/
   /* COPY BYTES IN WORD CHUNKS.                                             */
   /*------------------------------------------------------------------------*/
   #pragma MUST_ITERATE(6)
   for (i = 0; i < (len >> 2); i++)
      { _amem4(d0) = _amem4(s0); d0 += 4; s0 += 4; }

   /*------------------------------------------------------------------------*/
   /* COPY REMAINING BYTES.                                                  */
   /*------------------------------------------------------------------------*/
   if (len & 0x2) { _amem2(d0) = _amem2(s0); d0 += 2; s0 += 2; }
   if (len & 0x1) *d0 = *s0;

   return dst;
}
#endif
