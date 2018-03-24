/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*****************************************************************************/
/* BOOT.C   v1.0.0A10308 - Initialize the MSP430 C runtime environment       */
/*                                                                           */
/* Copyright (c) 2003-2010 Texas Instruments Incorporated                    */
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
#include <stdlib.h>
#include <_lock.h>

#include <xdc/runtime/Startup.h>

extern __FAR__ int xdc_runtime_Startup__RESETFXN__C;
extern int _args_main();
extern void xdc_runtime_System_exit__E(int status);
extern void _auto_init();
extern void __interrupt _c_int00();
extern int  _system_pre_init(void);

void (*_cleanup_ptr)(void);
void _DATA_ACCESS (*_dtors_ptr)(int);

/*---------------------------------------------------------------------------*/
/* Allocate the memory for the system stack.  This section will be sized     */
/* by the linker.                                                            */
/*---------------------------------------------------------------------------*/
#pragma DATA_SECTION (_stack, ".stack");
int _stack;

/*---------------------------------------------------------------------------*/
/* Macro to initialize stack pointer.  Stack grows towards lower memory.     */
/* Note: No local variables should be added to _c_int00() below, otherwise   */
/*       the stack may reach beyond the end of the stack.                    */
/*---------------------------------------------------------------------------*/
__asm("\t.global __TI_STACK_END");
extern char *__TI_STACK_END;
register volatile unsigned int __SP;
#define STACK_INIT() __SP = ((unsigned int)_symval(&__TI_STACK_END) - 4)

/*---------------------------------------------------------------------------*/
/* Macro to include and initialize global data pointer to __TI_STATIC_BASE.  */
/* This symbol represents the base of .bss (grouped with .data).             */
/*---------------------------------------------------------------------------*/
__asm("\t.global __TI_STATIC_BASE");
extern char *__TI_STATIC_BASE;
register volatile unsigned int __GDP;
#define GDP_INIT()  __GDP = ((unsigned int)_symval(&__TI_STATIC_BASE));

/*---------------------------------------------------------------------------*/
/* Macros to initialize required global variables.                           */
/*---------------------------------------------------------------------------*/
#define INIT_EXIT_PTRS() _cleanup_ptr = NULL; _dtors_ptr = NULL
#define INIT_LOCKS()     _lock = _nop; _unlock = _nop

/*****************************************************************************/
/* C_INT00() - C ENVIRONMENT ENTRY POINT                                     */
/*****************************************************************************/
#pragma CLINK(_c_int00)
extern void __interrupt _c_int00()
{
   /*
    * Clear IER, IFR register.  This is necessary to prohibit left-over
    * interrupts from being serviced.
    */
   __asm("\t   MVK\t\t    0, R0");
   __asm("\t   MVC\t\t    R0, IER");
   __asm("\t   MVK\t\t    -1, R0");
   __asm("\t   MVC\t\t    R0, ICR");
   
   STACK_INIT();
   GDP_INIT();

   INIT_EXIT_PTRS();
   INIT_LOCKS();
   
   /*------------------------------------------------------------------------*/
   /* Allow for any application-specific low level initialization prior to   */
   /* initializing the C/C++ environment (global variable initialization,    */
   /* constructers).  If _system_pre_init() returns 0, then bypass C/C++     */
   /* initialization.  NOTE: BYPASSING THE CALL TO THE C/C++ INITIALIZATION  */
   /* ROUTINE MAY RESULT IN PROGRAM FAILURE.                                 */
   /*------------------------------------------------------------------------*/
   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
       xdc_runtime_Startup_reset__I();
   }
   
   if(_system_pre_init() != 0)  _auto_init();

   /*------------------------------------------------------------------------*/
   /* Handle any argc/argv arguments if supported by loader.                 */
   /* Call _args_main() this way so no local variable is required            */
   /*------------------------------------------------------------------------*/
   xdc_runtime_System_exit__E(_args_main());
}

/*
 *  @(#) ti.targets.arp32.rts; 1, 0, 0,0; 11-8-2017 18:01:24; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

