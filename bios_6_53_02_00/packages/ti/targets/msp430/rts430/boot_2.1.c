/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*****************************************************************************/
/* BOOT.C   v2.1.0A07130 - Initialize the MSP430 C runtime environment       */
/* Copyright (c) 2003-2007  Texas Instruments Incorporated                   */
/*****************************************************************************/
#define CINIT   ((void*)&__cinit__)

extern int  __cinit__;
extern int _args_main();
extern void xdc_runtime_System_exit__E(int status);
extern void _auto_init(const void *cinit);
extern void __interrupt _c_int00();
extern int  _system_pre_init(void);

/*---------------------------------------------------------------------------*/
/* Allocate the memory for the system stack.  This section will be sized     */
/* by the linker.                                                            */
/*---------------------------------------------------------------------------*/
__asm("\t.global __STACK_SIZE");
#pragma DATA_SECTION (_stack, ".stack");
int  _stack;

/*---------------------------------------------------------------------------*/
/*  Initialize reset vector to point at _c_int00                             */
/*---------------------------------------------------------------------------*/
#pragma DATA_SECTION(_reset_vector,".reset")

#if defined(__LARGE_CODE_MODEL__)
_Pragma("CODE_SECTION(_c_int00, \".text:_isr\")")
_Pragma("diag_suppress 1107")
void * const _reset_vector = (void *) (long) &_c_int00;
#else
void (* const _reset_vector)() = &_c_int00;
#endif

/*****************************************************************************/
/* C_INT00() - C ENVIRONMENT ENTRY POINT                                     */
/*****************************************************************************/
extern void __interrupt _c_int00()
{
   /*------------------------------------------------------------------------*/
   /* Initialize stack pointer. Stack grows toward lower memory.             */
   /*------------------------------------------------------------------------*/
   __asm("\t   MOV.W\t    #_stack + __STACK_SIZE,SP");

   /*------------------------------------------------------------------------*/
   /* Allow for any application-specific low level initialization prior to   */
   /* initializing the C/C++ environment (global variable initialization,    */
   /* constructers).  If _system_pre_init() returns 0, then bypass C/C++     */
   /* initialization.  NOTE: BYPASSING THE CALL TO THE C/C++ INITIALIZATION  */
   /* ROUTINE MAY RESULT IN PROGRAM FAILURE.                                 */
   /*------------------------------------------------------------------------*/
   if(_system_pre_init() != 0)  _auto_init(CINIT);

   /*------------------------------------------------------------------------*/
   /* Handle any argc/argv arguments if supported by an MSP430 loader.       */
   /*------------------------------------------------------------------------*/
   xdc_runtime_System_exit__E(_args_main());
}

/*
 *  @(#) ti.targets.msp430.rts430; 1, 0, 0,0; 11-8-2017 18:01:41; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

