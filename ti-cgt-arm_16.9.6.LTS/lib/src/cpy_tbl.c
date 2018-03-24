/*****************************************************************************/
/* cpy_tbl.c  v16.9.6                                                        */
/*                                                                           */
/* Copyright (c) 2003-2017 Texas Instruments Incorporated                    */
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
/*                                                                           */
/* General purpose copy routine.  Given the address of a linker-generated    */
/* COPY_TABLE data structure, effect the copy of all object components       */
/* that are designated for copy via the corresponding LCF table() operator.  */
/*                                                                           */
/*****************************************************************************/
#include <cpy_tbl.h>
#include <string.h>
#include "autoinit.h"

/*****************************************************************************/
/* COPY_IN()                                                                 */
/*****************************************************************************/
void copy_in(COPY_TABLE *tp)
{
   unsigned short i;

   for (i = 0; i < tp->num_recs; i++)
   {
      COPY_RECORD crp = tp->recs[i];
      char *load_addr = (char*)crp.load_addr;
      char *run_addr = (char *)crp.run_addr;

      if (crp.size)
      {
         /*------------------------------------------------------------------*/
         /* Copy record has a non-zero size so the data is not compressed.   */
         /* Just copy the data.                                              */
         /*------------------------------------------------------------------*/
         memcpy(run_addr, load_addr, crp.size);
      }
#ifdef __TI_EABI__
      else if (__TI_Handler_Table_Base != __TI_Handler_Table_Limit)
      {
         /*------------------------------------------------------------------*/
         /* Copy record has size zero so the data is compressed. The first   */
         /* byte of the load data has the handler index. Use this index with */
         /* the handler table to get the handler for this data. Then call    */
         /* the handler by passing the load and run address.                 */
         /*------------------------------------------------------------------*/
         char handler_idx = *load_addr++;
         handler_fn_t handler = __TI_Handler_Table_Base[handler_idx];
         handler(load_addr, run_addr);
      }
#endif
   }
}

