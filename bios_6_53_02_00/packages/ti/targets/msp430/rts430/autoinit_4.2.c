/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*****************************************************************************/
/* AUTOINIT.C     v4.2.0 - Perform initialization of C variables.            */
/*                                                                           */
/* Copyright (c) 1993-2013 Texas Instruments Incorporated                    */
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
#include <stddef.h>

#include <xdc/runtime/Startup.h>
extern int xdc_runtime_Startup__EXECFXN__C;

/*---------------------------------------------------------------------------*/
/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
/*!                                                                         !*/
/*!  NOTE: Below definition of _auto_init_hold_wdt() is followed by repeat  !*/
/*!  definition for _auto_init() with only difference being to hold the     !*/
/*!  watchdog timer around cinit portion.                                   !*/
/*!                                                                         !*/
/*!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!!*/
/*---------------------------------------------------------------------------*/



/*---------------------------------------------------------------------------*/
/* Watchdog timer                                                            */
/*---------------------------------------------------------------------------*/
#define WDTPW                (0x5A00)
#define WDTCNTCL             (0x0008)
#define WDTHOLD              (0x0080)
#define RESTORE_WDT(setting) (WDTPW | (0x00FF & (setting)) | WDTCNTCL)
#define HOLD_WDT             (WDTPW | WDTHOLD)
extern volatile unsigned int WDTCTL;


/*---------------------------------------------------------------------------*/
/* Common defs used for both _auto_init_hold_wdt() and _auto_init()          */
/*---------------------------------------------------------------------------*/
typedef void (*PTRFUNC)();

#ifndef __TI_EABI__

#define CINIT ((const void*)&__cinit__)

#define ALIGN_MASK 0x1
#if defined(__LARGE_DATA_MODEL__)
#define ALIGN_PTR(ptr) ((const unsigned*)(((unsigned long)ptr + ALIGN_MASK) & ~ALIGN_MASK))
#else
#define ALIGN_PTR(ptr) ((const unsigned*)(((unsigned)ptr + ALIGN_MASK) & ~ALIGN_MASK))
#endif

extern  const int __cinit__;
extern  const PTRFUNC __pinit__[];

/*---------------------------------------------------------------------------*/
/* __TI_auto_init indicates that the default TI auto initialization routine  */
/* is being used.  The linker makes assumptions about how initialization is  */
/* being performed when this symbols is seen.  This symbol should NOT be     */
/* defined if a customized auto initialization routine is used.              */
/*---------------------------------------------------------------------------*/
__asm("\t.global __TI_auto_init");
__asm("__TI_auto_init .set 1");

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

extern const handler_fptr __TI_Handler_Table_Base[];
extern const handler_fptr __TI_Handler_Table_Limit[];

#define HANDLER_TABLE (__TI_Handler_Table_Base)

#pragma WEAK(__TI_CINIT_Base);
#pragma WEAK(__TI_CINIT_Limit);

extern void * const __TI_CINIT_Base;
extern void * const __TI_CINIT_Limit;
#endif




/*---------------------------------------------------------------------------*/
/* _AUTO_INIT_HOLD_WDT()                                                     */
/*                                                                           */
/* Linker option --cinit_hold_wdt allows users to choose below routine that  */
/* holds the watchdog timer around cinit.                                    */
/*---------------------------------------------------------------------------*/
#ifndef __TI_EABI__
void _auto_init_hold_wdt()
{
   unsigned int initial_WDT = WDTCTL;
   WDTCTL = HOLD_WDT;

   const unsigned int *recptr = (const unsigned int *)CINIT;
   int length;

   if (recptr != (unsigned int*)-1)
      while ((length = *recptr++) != 0)
      {
         char *to, *from;
#if defined(__LARGE_DATA_MODEL__)
         to      = (void*) *((const unsigned long*)recptr);
         recptr += 2;
#else
         to      = (void*) *recptr++; 
#endif
         from = (void*) recptr; 

         memcpy(to, from, length); 

         from   += length;
         recptr  = ALIGN_PTR(from);
      }

   WDTCTL = RESTORE_WDT(initial_WDT);

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

void _auto_init_hold_wdt(void)
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
   unsigned int initial_WDT = WDTCTL;
   WDTCTL = HOLD_WDT;

#if defined(__LARGE_CODE_MODEL__) && !defined(__LARGE_DATA_MODEL__)
   const unsigned long * table_ptr;
   const unsigned long * table_limit;

   if (!(&__TI_Handler_Table_Base >= &__TI_Handler_Table_Limit))
   {
      table_ptr   = (const unsigned long *) &__TI_CINIT_Base;
      table_limit = (const unsigned long *) &__TI_CINIT_Limit;
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
   unsigned char * const * table_ptr;
   unsigned char * const * table_limit;

   if (!(&__TI_Handler_Table_Base >= &__TI_Handler_Table_Limit))
   {
      table_ptr   = (unsigned char * const *) &__TI_CINIT_Base;
      table_limit = (unsigned char * const *) &__TI_CINIT_Limit;
      while (table_ptr < table_limit)
      {
          const unsigned char * load_addr = *table_ptr++;
                unsigned char * run_addr  = *table_ptr++;
                unsigned char handler_idx = *load_addr++;
          
          handler_fptr handler = HANDLER_TABLE[handler_idx];
          
          (*handler)(load_addr, run_addr);
      }
   }
#endif

   WDTCTL = RESTORE_WDT(initial_WDT);

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





/*---------------------------------------------------------------------------*/
/* _AUTO_INIT()                                                              */
/*                                                                           */
/* Auto init routine that does not hold watchdog timer around cinit.         */
/*---------------------------------------------------------------------------*/
#ifndef __TI_EABI__
void _auto_init()
{
   const unsigned int *recptr = (const unsigned int *)CINIT;
   int length;

   if (recptr != (unsigned int*)-1)
      while ((length = *recptr++) != 0)
      {
         char *to, *from;
#if defined(__LARGE_DATA_MODEL__)
         to      = (void*) *((const unsigned long*)recptr);
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
   const unsigned long * table_ptr;
   const unsigned long * table_limit;

   if (!(&__TI_Handler_Table_Base >= &__TI_Handler_Table_Limit))
   {
      table_ptr   = (const unsigned long *) &__TI_CINIT_Base;
      table_limit = (const unsigned long *) &__TI_CINIT_Limit;
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
   unsigned char * const * table_ptr;
   unsigned char * const * table_limit;

   if (!(&__TI_Handler_Table_Base >= &__TI_Handler_Table_Limit))
   {
      table_ptr   = (unsigned char * const *) &__TI_CINIT_Base;
      table_limit = (unsigned char * const *) &__TI_CINIT_Limit;
      while (table_ptr < table_limit)
      {
          const unsigned char * load_addr = *table_ptr++;
                unsigned char * run_addr  = *table_ptr++;
                unsigned char handler_idx = *load_addr++;
          
          handler_fptr handler = HANDLER_TABLE[handler_idx];
          
          (*handler)(load_addr, run_addr);
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

