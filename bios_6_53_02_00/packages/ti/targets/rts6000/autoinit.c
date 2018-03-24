/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*****************************************************************************/
/* _AUTO_INIT()   v7.0.3 - Perform initialization of C variables.            */
/*  Copyright (c) 1993-2016  Texas Instruments Incorporated                  */
/*****************************************************************************/
#include <string.h>

#include <xdc/runtime/Startup.h>

extern __FAR__ int xdc_runtime_Startup__EXECFXN__C;

#define ALIGN_MASK 0x7
#define ALIGN_PTR(ptr) \
   ((unsigned *)(((unsigned)ptr + ALIGN_MASK) & ~ALIGN_MASK))

typedef void (*PTRFUNC)();
#ifndef __TI_EABI__

   extern far const PTRFUNC __pinit__[];

#else

extern void __TI_tls_init(void * TLS_block_addr);

#pragma WEAK(__TI_INITARRAY_Limit);
#pragma WEAK(__TI_INITARRAY_Base);

extern far const PTRFUNC __TI_INITARRAY_Base[];
extern far const PTRFUNC __TI_INITARRAY_Limit[];

typedef void (*handler_fptr)(const unsigned char* in, unsigned char* out);

#define HANDLER_TABLE __TI_Handler_Table_Base
#pragma WEAK(HANDLER_TABLE);

extern far unsigned int HANDLER_TABLE;

#pragma WEAK(__TI_Handler_Table_Limit);
extern far unsigned int __TI_Handler_Table_Limit;

#pragma WEAK(__TI_CINIT_Base);
#pragma WEAK(__TI_CINIT_Limit);

extern far unsigned char* __TI_CINIT_Base;
extern far unsigned char* __TI_CINIT_Limit;

#endif

#ifndef __TI_EABI__
void _auto_init(const void *cinit)
{
   const unsigned int *recptr = cinit;
   int length;

   if ((int)recptr != -1)
      while ((length = *recptr++) != 0)
      {
         char *to   = (void*) *recptr++; 
         char *from = (void*) recptr; 

         memcpy(to, from, length); 

         from   += length;
         recptr  = ALIGN_PTR(from);
      }

   /*------------------------------------------------------------------------*/
   /* Process XDC Startup                                                    */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__EXECFXN__C == (int*)1) {
      xdc_runtime_Startup_exec__E();
   }

   /*------------------------------------------------------------------------*/
   /* Process Pinit table.                                                   */
   /* consists of pointers to init functions.                                */
   /* section is NULL terminated                                             */
   /* pointer is = -1 if section does not exist.                             */
   /*------------------------------------------------------------------------*/

   if ((int)__pinit__ != -1)
   {
      int i = 0;
      while (__pinit__[i] != NULL )
         __pinit__[i++]();
   }
}
      
#else

void _auto_init_elf(void)
{
   /*------------------------------------------------------------------------*/
   /* If elfabi, process the compressed cinit table. The format              */
   /* is as follows:                                                         */
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

        handler_fptr handler      = (handler_fptr)(&HANDLER_TABLE)[handler_idx];

        (*handler)((const unsigned char*)load_addr, run_addr);
      }
   }

   /*------------------------------------------------------------------------*/
   /* Process XDC Startup                                                    */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__EXECFXN__C == (int*)1) {
      xdc_runtime_Startup_exec__E();
   }

   __TI_tls_init(NULL);

   /*------------------------------------------------------------------------*/
   /* Process Pinit table for ELF.                                           */
   /* The section is not NULL terminated, but can be accessed by pointers    */
   /* which point to the beginning and end of the section.                   */
   /*------------------------------------------------------------------------*/
   if (__TI_INITARRAY_Base != __TI_INITARRAY_Limit)
   {
      int i = 0;
      while (&(__TI_INITARRAY_Base[i]) != __TI_INITARRAY_Limit)
         __TI_INITARRAY_Base[i++]();
   }
}

#endif
/*
 *  @(#) ti.targets.rts6000; 1, 0, 0,0; 11-8-2017 18:02:34; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

