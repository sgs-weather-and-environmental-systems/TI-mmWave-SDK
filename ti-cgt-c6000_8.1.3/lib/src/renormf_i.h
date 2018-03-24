/****************************************************************************/
/*  renormf_i.h         v8.1.3                                              */
/*                                                                          */
/* Copyright (c) 2007-2017 Texas Instruments Incorporated                   */
/* http://www.ti.com/                                                       */
/*                                                                          */
/*  Redistribution and  use in source  and binary forms, with  or without   */
/*  modification,  are permitted provided  that the  following conditions   */
/*  are met:                                                                */
/*                                                                          */
/*     Redistributions  of source  code must  retain the  above copyright   */
/*     notice, this list of conditions and the following disclaimer.        */
/*                                                                          */
/*     Redistributions in binary form  must reproduce the above copyright   */
/*     notice, this  list of conditions  and the following  disclaimer in   */
/*     the  documentation  and/or   other  materials  provided  with  the   */
/*     distribution.                                                        */
/*                                                                          */
/*     Neither the  name of Texas Instruments Incorporated  nor the names   */
/*     of its  contributors may  be used to  endorse or  promote products   */
/*     derived  from   this  software  without   specific  prior  written   */
/*     permission.                                                          */
/*                                                                          */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS   */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT   */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR   */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT   */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,   */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT   */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,   */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY   */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT   */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE   */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.    */
/*                                                                          */
/****************************************************************************/

/* _CODE_ACCESS int RENORMF(REAL_2UNS *ff) */

/*---------------------------------------------------------------------------*/
/* If ff contains 0, return ZCOUNT (why?).                                   */
/* Otherwise, shift ff left until it is normalized (ff >= REAL_HIDDEN_BIT)   */
/* and return the shift count minus 1.                                       */
/*---------------------------------------------------------------------------*/

   int shift;
   int offset = -1;
   biguns tmp;

   while ((tmp = ff->u.msh) == 0) {
      if (ff->u.lsh == 0) return ZCOUNT;

      /* top word is zero, so move some bottom bits up */
      ff->u.msh = ff->u.lsh >> BPbigint-(REAL_FRC_MSBs)-1;
      ff->u.lsh <<= (REAL_FRC_MSBs)+1;
      offset += (REAL_FRC_MSBs)+1;
   }
 #ifdef COUNT_LZERO
   shift = COUNT_LZERO(tmp)-BPbigint+(REAL_FRC_MSBs)+1;
   tmp <<= shift;
 #else
   shift = 0;
   while (tmp < REAL_HIDDEN_BIT) { shift += 1; tmp <<= 1; }
 #endif
   if (shift != 0) {
      /* fill in vacated bits with bits from the lower word */
      ff->u.msh = tmp | (ff->u.lsh >> BPbigint-shift);
      ff->u.lsh <<= shift;
   }

   return shift + offset;
