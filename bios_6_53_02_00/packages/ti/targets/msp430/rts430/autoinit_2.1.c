/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*****************************************************************************/
/* _AUTO_INIT()   v4.0.0 - Perform initialization of C variables.            */
/*  Copyright (c) 1993-2010  Texas Instruments Incorporated                  */
/*****************************************************************************/
#include <string.h>
#include <stddef.h>

#include <xdc/runtime/Startup.h>
extern int xdc_runtime_Startup__EXECFXN__C;
typedef void (*PTRFUNC)();

#ifndef __TI_EABI__

#define CINIT ((void*)&__cinit__)

#define ALIGN_MASK 0x1
#if defined(__LARGE_DATA_MODEL__)
#define ALIGN_PTR(ptr) ((unsigned*)(((unsigned long)ptr + ALIGN_MASK) & ~ALIGN_MASK))
#else
#define ALIGN_PTR(ptr) ((unsigned*)(((unsigned)ptr + ALIGN_MASK) & ~ALIGN_MASK))
#endif

extern  int __cinit__;
extern  const PTRFUNC __pinit__[];

/*---------------------------------------------------------------------------*/
/* __TI_auto_init indicates that the default TI auto initialization routine  */
/* is being used.  The linker makes assumptions about how initialization is  */
/* being performed when this symbols is seen.  This symbol should NOT be     */
/* defined if a customized auto initialization routine is used.              */
/*---------------------------------------------------------------------------*/
__asm("\t.global __TI_auto_init");
__asm("__TI_auto_init .set 1");

void _auto_init()
{
   const unsigned int *recptr = CINIT;
   int length;

   if (recptr != (unsigned int*)-1)
      while ((length = *recptr++) != 0)
      {
         char *to, *from;
#if defined(__LARGE_DATA_MODEL__)
         to      = (void*) *((unsigned long*)recptr);
         recptr += 2;
#else
         to      = (void*) *recptr++; 
#endif
         from = (void*) recptr; 

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
#pragma diag_suppress 770
#pragma diag_suppress 70 
   if ((int)__pinit__ != -1)
#pragma diag_default 70
#pragma diag_default 770
   {
      int i = 0;
      while (__pinit__[i] != NULL )
         __pinit__[i++]();
   }
}
#else

#pragma WEAK(__TI_INITARRAY_Base)
#pragma WEAK(__TI_INITARRAY_Limit)

extern const PTRFUNC __TI_INITARRAY_Base[];
extern const PTRFUNC __TI_INITARRAY_Limit[];

#if defined(__LARGE_CODE_MODEL__) && !defined(__LARGE_DATA_MODEL__)
typedef void (*handler_fptr)(unsigned long in, unsigned long out);
#else
typedef void (*handler_fptr)(const unsigned char* in, unsigned char* out);
#endif

#pragma WEAK(__TI_Handler_Table_Base)
#pragma WEAK(__TI_Handler_Table_Limit)

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
   /* If EABI, process the compressed cinit table. The format is:            */
   /*                                                                        */
   /* For small model:                                                       */
   /* |2-byte load addr|2-byte run addr|                                     */
   /* |2-byte load addr|2-byte run addr|                                     */
   /*                                                                        */
   /* For large data or large code model:                                    */
   /* |4-byte load addr|4-byte run addr|                                     */
   /* |4-byte load addr|4-byte run addr|                                     */
   /*                                                                        */
   /* Processing steps:                                                      */
   /*   1. Read load and run address.                                        */
   /*   2. Read one byte at load address, say idx.                           */
   /*   3. Get pointer to handler at handler_start[idx]                      */
   /*   4. call handler(load_addr + 1, run_addr)                             */
   /*------------------------------------------------------------------------*/
#if defined(__LARGE_CODE_MODEL__) && !defined(__LARGE_DATA_MODEL__)
   unsigned long* table_ptr;
   unsigned long* table_limit;

   if (!(&__TI_Handler_Table_Base >= &__TI_Handler_Table_Limit))
   {
      table_ptr   = (unsigned long*) &__TI_CINIT_Base;
      table_limit = (unsigned long*) &__TI_CINIT_Limit;
      while (table_ptr < table_limit)
      {
          unsigned long load_addr  = *table_ptr++;
          unsigned long run_addr   = *table_ptr++;
          unsigned char handler_idx = __data20_read_char(load_addr++);
          
          handler_fptr handler = HANDLER_TABLE[handler_idx];
          
          (*handler)(load_addr, run_addr);
      }
   }
#else
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
#endif

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
#endif
/*
 *  @(#) ti.targets.msp430.rts430; 1, 0, 0,0; 11-8-2017 18:01:40; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

