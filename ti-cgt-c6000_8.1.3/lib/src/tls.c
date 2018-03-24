/******************************************************************************/
/* tls.c  v8.1.3                                                              */
/*                                                                            */
/* Copyright (c) 2012-2017 Texas Instruments Incorporated                     */
/* http://www.ti.com/                                                         */
/*                                                                            */
/*  Redistribution and  use in source  and binary forms, with  or without     */
/*  modification,  are permitted provided  that the  following conditions     */
/*  are met:                                                                  */
/*                                                                            */
/*     Redistributions  of source  code must  retain the  above copyright     */
/*     notice, this list of conditions and the following disclaimer.          */
/*                                                                            */
/*     Redistributions in binary form  must reproduce the above copyright     */
/*     notice, this  list of conditions  and the following  disclaimer in     */
/*     the  documentation  and/or   other  materials  provided  with  the     */
/*     distribution.                                                          */
/*                                                                            */
/*     Neither the  name of Texas Instruments Incorporated  nor the names     */
/*     of its  contributors may  be used to  endorse or  promote products     */
/*     derived  from   this  software  without   specific  prior  written     */
/*     permission.                                                            */
/*                                                                            */
/*  THIS SOFTWARE  IS PROVIDED BY THE COPYRIGHT  HOLDERS AND CONTRIBUTORS     */
/*  "AS IS"  AND ANY  EXPRESS OR IMPLIED  WARRANTIES, INCLUDING,  BUT NOT     */
/*  LIMITED TO, THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR     */
/*  A PARTICULAR PURPOSE ARE DISCLAIMED.  IN NO EVENT SHALL THE COPYRIGHT     */
/*  OWNER OR CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL,     */
/*  SPECIAL,  EXEMPLARY,  OR CONSEQUENTIAL  DAMAGES  (INCLUDING, BUT  NOT     */
/*  LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE,     */
/*  DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY     */
/*  THEORY OF  LIABILITY, WHETHER IN CONTRACT, STRICT  LIABILITY, OR TORT     */
/*  (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE     */
/*  OF THIS SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.      */
/*                                                                            */
/*                                                                            */
/* This module contains the functions to support Thread-Local Storage (TLS).  */
/******************************************************************************/
#include <inttypes.h>
#include <tls.h>

#ifdef __TI_EABI__

/*****************************************************************************/
/* EABI declarations                                                         */
/*****************************************************************************/

typedef void (*handler_fn_t)(const char *in, char *out);

extern __attribute__((weak)) _DATA_ACCESS
    handler_fn_t const __TI_Handler_Table_Base[];
extern __attribute__((weak)) _DATA_ACCESS
    handler_fn_t const __TI_Handler_Table_Limit[];

extern __attribute__((weak)) _DATA_ACCESS
    unsigned char const *__TI_TLS_INIT_Base;
extern __attribute__((weak)) _DATA_ACCESS
    unsigned char const *__TI_TLS_INIT_Limit;

/******************************************************************************/
/* __TI_tls_init()   - This function initializes a thread's Thread-Local      */
/*                     variables. The caller must pass the thread's TLS       */
/*                     block address. If NULL is passed in, the main          */
/*                     thread's TLS block is initialized.                     */
/******************************************************************************/
extern void __tdeh_init();
#pragma CODE_SECTION(__TI_tls_init, ".text:tls:init")
void __TI_tls_init(void * TLS_block_addr)
{
   unsigned char** table_ptr;
   unsigned char** table_limit;
   /*------------------------------------------------------------------------*/
   /* Process TLS init table to initialize the given TLS block. The TLS init */
   /* table layout is same as CINIT table layout and is as follows:          */
   /* |4-byte load addr|4-byte run_addr|                                     */
   /* |4-byte load addr|4-byte run addr|                                     */
   /*                                                                        */
   /* The load address is the address of the TLS initialization image and    */
   /* the run address is the address of the main thread's TLS block.         */
   /*------------------------------------------------------------------------*/
   if (__TI_Handler_Table_Base != __TI_Handler_Table_Limit &&
       !(&__TI_TLS_INIT_Base >= &__TI_TLS_INIT_Limit))
   {
      table_ptr   = (unsigned char**) &__TI_TLS_INIT_Base;
      table_limit = (unsigned char**) &__TI_TLS_INIT_Limit;
      unsigned char* mt_base_addr = *(table_ptr+1);

      while (table_ptr < table_limit)
      {
        unsigned char* load_addr  = *table_ptr++;
        unsigned char* run_addr   = *table_ptr++;

        /*-------------------------------------------------------------------*/
        /* If non-NULL TLS_block_addr is passed, it must be initialized.     */
        /* Use the destination address in the table to calculate the offset  */
        /* and initialize the given TLS block.                               */
        /*-------------------------------------------------------------------*/
        if (TLS_block_addr)
        {
           unsigned char* mt_run_addr = run_addr;
           ptrdiff_t      offset  = mt_run_addr - mt_base_addr;
           run_addr = (unsigned char *)TLS_block_addr + offset;
        }

        unsigned char handler_idx = *load_addr++;
        handler_fn_t handler = __TI_Handler_Table_Base[handler_idx];
        handler((char const *)load_addr, (char *)run_addr);
      }
   }

   /*------------------------------------------------------------------------*/
   /* Set up C++ exception stack for current thread.                         */
   /*------------------------------------------------------------------------*/
#if defined(__TI_TABLE_DRIVEN_EXCEPTIONS)
   __tdeh_init();
#endif
}


/*****************************************************************************/
/* __TI_tls_block_size() - Return the size of the Thread-Local Storage block */
/*****************************************************************************/
#pragma CODE_SECTION(__TI_tls_block_size, ".text:tls:block_size")
#pragma WEAK(__TI_TLS_BLOCK_SIZE);
extern far size_t __TI_TLS_BLOCK_SIZE;
size_t __TI_tls_block_size()
{
   return _symval(&__TI_TLS_BLOCK_SIZE); 
}

/*****************************************************************************/
/* __TI_tls_main_thread_base() - Return the base address of the main         */
/*                               thread's TLS Block.                         */
/*                                                                           */
/*  Every program has at least one thread, the thread of execution started   */
/*  by the boot routine. This thread is called the main thread.              */
/*  The thread library shall use this function to get the main thread's      */
/*  TP. The thread library knows the Thread Pointer (TP) value for the       */
/*  threads it creates as it allocates the TLS blocks for thread threads.    */
/*  The main thread is not created by the thread library and hence it must   */
/*  use this function to get the main thread's TP.                           */
/*****************************************************************************/
#pragma CODE_SECTION(__TI_tls_main_thread_base, ".text:tls:main_base")
#pragma WEAK(__TI_TLS_MAIN_THREAD_Base);
extern char __TI_TLS_MAIN_THREAD_Base[];
void * __TI_tls_main_thread_base()
{
   return (void*) _symval(__TI_TLS_MAIN_THREAD_Base);
}

/******************************************************************************/
/* __c6xabi_get_addr() - This function returns the address of the Thread      */
/*                       Local variable. The compiler generates a call to     */
/*                       this routine to get the address of a weak TLS        */
/*                       symbol.                                              */
/*                                                                            */
/*   NOTE: This function must call __c6xabi_get_tp() explicitly and must not  */
/*         inline the RTS version of this function. In case the thread        */
/*         library provides the __c6xabi_get_tp(), this function must call    */
/*         the thread library version.                                        */
/*                                                                            */
/******************************************************************************/
#pragma CODE_SECTION(__c6xabi_get_addr, ".text:tls:get_addr")
void * __c6xabi_get_addr(ptrdiff_t TPR_offset)
{
   if (TPR_offset == -1)
      return NULL;
   else 
      return (void*)((char *)__c6xabi_get_tp() + TPR_offset);
}

#endif
