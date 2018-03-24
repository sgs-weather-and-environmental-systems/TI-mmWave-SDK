/*****************************************************************************/
/* memset v8.1.3                                                             */
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

_CODE_ACCESS void *memset(void *dst, int fill, size_t len)
{   
       char  *restrict dst1, *restrict dst2;
       int    pre_bytes, post_bytes, wfill, i;
       double dfill1, dfill2;

       dst1   = (char *)dst;

       /*--------------------------------------------------------------------*/
       /* Replicate the 8-bit value in fill into all 4 bytes of wfill        */
       /*--------------------------------------------------------------------*/
       wfill  = _pack2 (fill,  fill);
       wfill  = _packl4(wfill, wfill); 
       dfill1 = _itod  (wfill, wfill);
       dfill2 = _itod  (wfill, wfill);

       /*--------------------------------------------------------------------*/
       /* Calculate number of bytes to pre-copy to get to an alignment of 8  */
       /*--------------------------------------------------------------------*/
       pre_bytes = (8 - (int) dst) & 7;

       if (len > pre_bytes)
       {
           len -= pre_bytes;
           if (pre_bytes & 1) { *dst1        = fill;  dst1 += 1; }
           if (pre_bytes & 2) { _amem2(dst1) = wfill; dst1 += 2; }
           if (pre_bytes & 4) { _amem4(dst1) = wfill; dst1 += 4; }
       }

       /*--------------------------------------------------------------------*/
       /* Double word fills                                                  */
       /*--------------------------------------------------------------------*/
       post_bytes = len > 0 ? len : 0;   
       dst2       = dst1 + 8;

       if (len > 15)
         for (i = 0; i < len >> 4; i++)
         {
            _amemd8(dst1) = dfill1; dst1 += 16;
            _amemd8(dst2) = dfill2; dst2 += 16;
            post_bytes -= 16;
         }

       /*--------------------------------------------------------------------*/
       /* Finish transfer with 8, 4, 2 and/or 1-byte writes                  */
       /*--------------------------------------------------------------------*/
       if (post_bytes & 8) { _memd8(dst1) = dfill1; dst1 += 8; }
       if (post_bytes & 4) { _mem4 (dst1) = wfill;  dst1 += 4; }
       if (post_bytes & 2) {  dst1[0]     = wfill;  
                              dst1[1]     = wfill;  dst1 += 2; }
       if (post_bytes & 1) { *dst1        = fill;   dst1 += 1; }
       return dst;
}
