/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*****************************************************************************/
/* _AUTO_INIT()   v1.0.0A11188 - Perform initialization of C variables.      */
/*                                                                           */
/* Copyright (c) 1993-2011 Texas Instruments Incorporated                    */
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
#include <string.h>
#include <cpy_tbl.h>
#include <stddef.h>
#include <xdc/runtime/Startup.h>

extern __FAR__ int xdc_runtime_Startup__EXECFXN__C;

typedef void (*PTRFUNC)();

#pragma WEAK(__TI_INITARRAY_Base);
#pragma WEAK(__TI_INITARRAY_Limit);

extern const PTRFUNC __TI_INITARRAY_Base[];
extern const PTRFUNC __TI_INITARRAY_Limit[];

typedef void (*handler_fptr)(const unsigned char* in, unsigned char* out);

#pragma WEAK(__TI_Handler_Table_Base);
#pragma WEAK(__TI_Handler_Table_Limit);

extern handler_fptr __TI_Handler_Table_Base[];
extern handler_fptr __TI_Handler_Table_Limit[];

#define HANDLER_TABLE (__TI_Handler_Table_Base)

#pragma WEAK(__TI_CINIT_Base);
#pragma WEAK(__TI_CINIT_Limit);

extern void * __TI_CINIT_Base;
extern void * __TI_CINIT_Limit;

void _auto_init(void)
{
   /*------------------------------------------------------------------------*/
   /* Process the compressed cinit table. The format is:                     */
   /*                                                                        */
   /* |4-byte load addr|4-byte run addr|                                     */
   /* |4-byte load addr|4-byte run addr|                                     */
   /*                                                                        */
   /* Processing steps:                                                      */
   /*   1. Read load and run address.                                        */
   /*   2. Read one byte at load address, say idx.                           */
   /*   3. Get pointer to handler at handler_start[idx]                      */
   /*   4. call handler(load_addr + 1, run_addr)                             */
   /*------------------------------------------------------------------------*/
   unsigned char** table_ptr;
   unsigned char** table_limit;

   if (!(&__TI_Handler_Table_Base >= &__TI_Handler_Table_Limit))
   {
      table_ptr   = (unsigned char**) &__TI_CINIT_Base;
      table_limit = (unsigned char**) &__TI_CINIT_Limit;
      while (table_ptr < table_limit)
      {
        unsigned char* load_addr  = *table_ptr++;
        unsigned char* run_addr   = *table_ptr++;
        unsigned char handler_idx = *load_addr++;

        handler_fptr handler = HANDLER_TABLE[handler_idx];

        (*handler)((const unsigned char*)load_addr, run_addr);
      }
   }

   /*------------------------------------------------------------------------*/
   /* Process XDC Startup                                                    */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__EXECFXN__C == (int*)1) {
      xdc_runtime_Startup_exec__E();
   }
   
   /*------------------------------------------------------------------------*/
   /* Process Pinit table for ELF.  The section is not NULL terminated.      */
   /* __TI_INITARRAY_Base and __TI_INITARRAY_Limit point to the beginning    */
   /* and end of the table.                                                  */
   /*------------------------------------------------------------------------*/
   if (__TI_INITARRAY_Base != __TI_INITARRAY_Limit)
   {
      int i = 0;
      while (&(__TI_INITARRAY_Base[i]) != __TI_INITARRAY_Limit)
         __TI_INITARRAY_Base[i++]();
   }
}
/*
 *  @(#) ti.targets.arp32.rts; 1, 0, 0,0; 11-8-2017 18:01:24; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

