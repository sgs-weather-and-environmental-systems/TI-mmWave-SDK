/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*****************************************************************************/
/* BOOT.C   v4.0.0 - Initialize the MSP430 C runtime environment             */
/*                                                                           */
/* Copyright (c) 2003-2011 Texas Instruments Incorporated                    */
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
extern int xdc_runtime_Startup__RESETFXN__C;
extern void xdc_runtime_System_exit__E(int status);

/* this function is defined by link.xdt */
extern void ti_targets_msp430_rts430_noexit__I(int status);

extern int _args_main();
extern int main(int argc);
extern void _auto_init();
extern void __interrupt _c_int00();
extern void __interrupt _c_int00_noargs();
extern void __interrupt _c_int00_noinit();
extern void __interrupt _c_int00_noexit();
extern void __interrupt _c_int00_noinit_noexit();
extern void __interrupt _c_int00_mpu_init();
extern void __interrupt _c_int00_noargs_mpu_init();
extern void __interrupt _c_int00_noinit_mpu_init();
extern void __interrupt _c_int00_noexit_mpu_init();
extern void __interrupt _c_int00_noinit_noexit_mpu_init();
extern int  _system_pre_init(void);

void              (*__TI_cleanup_ptr)(void);
void _DATA_ACCESS (*__TI_dtors_ptr)(int);

/*---------------------------------------------------------------------------*/
/* Allocate the memory for the system stack.  This section will be sized     */
/* by the linker.                                                            */
/*---------------------------------------------------------------------------*/
__asm("\t.global __STACK_END");
#pragma DATA_SECTION (_stack, ".stack");
#if defined(__LARGE_DATA_MODEL__)
long _stack;
#else
int _stack;
#endif

/*---------------------------------------------------------------------------*/
/*  Initialize reset vector to point at _c_int00                             */
/*  _c_int00 must always be located in low-memory on MSP430X devices.        */
/*---------------------------------------------------------------------------*/
#if defined(__LARGE_CODE_MODEL__)
_Pragma("CODE_SECTION(_c_int00, \".text:_isr\")")
_Pragma("CODE_SECTION(_c_int00_noargs, \".text:_isr\")")
_Pragma("CODE_SECTION(_c_int00_noinit, \".text:_isr\")")
_Pragma("CODE_SECTION(_c_int00_noexit, \".text:_isr\")")
_Pragma("CODE_SECTION(_c_int00_noinit_noexit, \".text:_isr\")")
_Pragma("CODE_SECTION(_c_int00_mpu_init, \".text:_isr\")")
_Pragma("CODE_SECTION(_c_int00_noargs_mpu_init, \".text:_isr\")")
_Pragma("CODE_SECTION(_c_int00_noinit_mpu_init, \".text:_isr\")")
_Pragma("CODE_SECTION(_c_int00_noexit_mpu_init, \".text:_isr\")")
_Pragma("CODE_SECTION(_c_int00_noinit_noexit_mpu_init, \".text:_isr\")")
#endif

__asm("\t.global _reset_vector");
__asm("\t.sect   \".reset\"");
__asm("\t.align  2");
__asm("_reset_vector:\n\t.field _c_int00, 16");

/*---------------------------------------------------------------------------*/
/* Macro to initialize stack pointer.  Stack grows towards lower memory.     */
/*---------------------------------------------------------------------------*/
#if defined(__LARGE_DATA_MODEL__)
#define STACK_INIT() __asm("\t   MOVX.A\t   #__STACK_END,SP")
#else
#define STACK_INIT() __asm("\t   MOV.W\t    #__STACK_END,SP")
#endif

/*---------------------------------------------------------------------------*/
/* Macros to initialize required global variables.                           */
/*---------------------------------------------------------------------------*/
#if defined(__TI_EABI__)
#define INIT_EXIT_PTRS() do { } while(0)
#define INIT_LOCKS()     do { } while(0)
#else
#define INIT_EXIT_PTRS() do { __TI_cleanup_ptr = NULL; __TI_dtors_ptr = NULL; } while(0)
#define INIT_LOCKS()     do { _lock = _nop; _unlock = _nop; } while(0)
#endif

/*****************************************************************************/
/* C_INT00() - C ENVIRONMENT ENTRY POINT                                     */
/*****************************************************************************/
#pragma CLINK(_c_int00)
extern void __interrupt _c_int00()
{
   int preInitStatus;

   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   /*------------------------------------------------------------------------*/
   /* Allow for any application-specific low level initialization prior to   */
   /* initializing the C/C++ environment (global variable initialization,    */
   /* constructers).  If _system_pre_init() returns 0, then bypass C/C++     */
   /* initialization.  NOTE: BYPASSING THE CALL TO THE C/C++ INITIALIZATION  */
   /* ROUTINE MAY RESULT IN PROGRAM FAILURE.                                 */
   /*------------------------------------------------------------------------*/
   preInitStatus = _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_EXIT_PTRS();
   INIT_LOCKS();

   if (preInitStatus != 0) _auto_init();

   /*------------------------------------------------------------------------*/
   /* Handle any argc/argv arguments if supported by an MSP430 loader.       */
   /*------------------------------------------------------------------------*/
   xdc_runtime_System_exit__E(_args_main());
}


/*****************************************************************************/
/* C_INT00_NOARGS() - Specialized version of _c_int00 that does not handle   */
/*                    arguments passed to main.                              */
/*****************************************************************************/
#pragma CLINK(_c_int00_noargs)
extern void __interrupt _c_int00_noargs()
{
   int preInitStatus;

   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   preInitStatus = _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_EXIT_PTRS();
   INIT_LOCKS();

   if(preInitStatus != 0) _auto_init();

   xdc_runtime_System_exit__E(main(0));
}

/*****************************************************************************/
/* C_INT00_NOINIT() - Specialized version of _c_int00 that does not perform  */
/*                    auto initialization.                                   */
/*****************************************************************************/
#pragma CLINK(_c_int00_noinit)
extern void __interrupt _c_int00_noinit()
{
   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_EXIT_PTRS();
   INIT_LOCKS();

   xdc_runtime_System_exit__E(_args_main());
}

/*****************************************************************************/
/* C_INT00_NOEXIT() - Specialized version of _c_int00 that directly calls    */
/*                    abort and skips cleanup in exit.                       */
/*****************************************************************************/
#pragma CLINK(_c_int00_noexit)
extern void __interrupt _c_int00_noexit()
{
   int preInitStatus;

   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   preInitStatus = _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_LOCKS();

   if (preInitStatus != 0) _auto_init();

   ti_targets_msp430_rts430_noexit__I(main(0));
}

/*****************************************************************************/
/* C_INT00_NOINIT_NOEXIT() - Specialized version of _c_int00 that does not   */
/*                           perform auto initialization and calls abort     */
/*                           directly.                                       */
/*****************************************************************************/
#pragma CLINK(_c_int00_noinit_noexit)
extern void __interrupt _c_int00_noinit_noexit()
{
   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_LOCKS();

   ti_targets_msp430_rts430_noexit__I(main(0));
}

extern volatile unsigned int MPUCTL0;
extern volatile unsigned int MPUSEG;
extern volatile unsigned int MPUSAM;

extern unsigned int __mpuseg;
extern unsigned int __mpusam;

/*---------------------------------------------------------------------------*/
/* Macro to initialize the FRAM MPU.                                         */
/*---------------------------------------------------------------------------*/
#define MPU_INIT() do { \
     MPUCTL0 = 0xA500;                           /* Unlock MPU             */ \
     MPUSEG  = (unsigned int)_symval(&__mpuseg); /* Set segment boundaries */ \
     MPUSAM  = (unsigned int)_symval(&__mpusam); /* Set RWX permissions    */ \
     MPUCTL0 = 0xA501;                           /* Enable MPU             */ \
   } while (0)

/*****************************************************************************/
/* C_INT00_MPU_INIT() - Specialized version of _c_int00 that initializes the */
/*                      FRAM memory protection unit.                         */
/*****************************************************************************/
#pragma CLINK(_c_int00_mpu_init)
extern void __interrupt _c_int00_mpu_init()
{
   int preInitStatus;

   MPU_INIT();
   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   preInitStatus = _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_EXIT_PTRS();
   INIT_LOCKS();

   if (preInitStatus != 0)  _auto_init();

   xdc_runtime_System_exit__E(_args_main());
}

/*****************************************************************************/
/* C_INT00_NOARGS_MPU_INIT() - Specialized version of _c_int00 that          */
/*                             initializes the FRAM memory protection unit   */
/*                             and does not handle arguments passed to main. */
/*****************************************************************************/
#pragma CLINK(_c_int00_noargs_mpu_init)
extern void __interrupt _c_int00_noargs_mpu_init()
{
   int preInitStatus;

   MPU_INIT();
   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   preInitStatus = _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_EXIT_PTRS();
   INIT_LOCKS();

   if (preInitStatus != 0)  _auto_init();

   xdc_runtime_System_exit__E(main(0));
}

/*****************************************************************************/
/* C_INT00_NOINIT_MPU_INIT() - Specialized version of _c_int00 that          */
/*                             initializes the FRAM memory protection unit   */
/*                             and does not perform auto initialization.     */
/*****************************************************************************/
#pragma CLINK(_c_int00_noinit_mpu_init)
extern void __interrupt _c_int00_noinit_mpu_init()
{
   MPU_INIT();
   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_EXIT_PTRS();
   INIT_LOCKS();

   xdc_runtime_System_exit__E(_args_main());
}

/*****************************************************************************/
/* C_INT00_NOEXIT_MPU_INIT() - Specialized version of _c_int00 that          */
/*                             initializes the FRAM memory protection unit   */
/*                             and directly calls abort and skips cleanup in */
/*                             exit.                                         */
/*****************************************************************************/
#pragma CLINK(_c_int00_noexit_mpu_init)
extern void __interrupt _c_int00_noexit_mpu_init()
{
   int preInitStatus;

   MPU_INIT();
   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   preInitStatus = _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_LOCKS();

   if (preInitStatus != 0)  _auto_init();

   ti_targets_msp430_rts430_noexit__I(main(0));
}

/*****************************************************************************/
/* C_INT00_NOINIT_NOEXIT_MPU_INIT() - Specialized version of _c_int00 that   */
/*                                    initializes the FRAM memory protection */
/*                                    unit and does not perform auto         */
/*                                    initialization and calls abort         */
/*                                    directly.                              */
/*****************************************************************************/
#pragma CLINK(_c_int00_noinit_noexit_mpu_init)
extern void __interrupt _c_int00_noinit_noexit_mpu_init()
{
   MPU_INIT();
   STACK_INIT();

   /*------------------------------------------------------------------------*/
   /* Call hook configured into Startup_resetFxn                             */
   /*------------------------------------------------------------------------*/
   if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
      xdc_runtime_Startup_reset__I();
   }

   _system_pre_init(); /* moved here to allow clear of .bss */

   INIT_LOCKS();

   ti_targets_msp430_rts430_noexit__I(main(0));
}
/*
 *  @(#) ti.targets.msp430.rts430; 1, 0, 0,0; 11-8-2017 18:01:41; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

