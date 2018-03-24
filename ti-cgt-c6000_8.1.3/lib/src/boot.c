/*****************************************************************************/
/* BOOT.C   v8.1.3 - Initialize the C60 C runtime environment                */
/*                                                                           */
/* Copyright (c) 1993-2017 Texas Instruments Incorporated                    */
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
#include <c6x.h>
#include "autoinit.h"

extern far int _args_main();
extern far void exit(int status);

/*---------------------------------------------------------------------------*/
/* ALLOCATE THE MEMORY FOR THE SYSTEM STACK.  THIS SECTION WILL BE SIZED     */
/* BY THE LINKER.                                                            */
/*---------------------------------------------------------------------------*/
#ifdef __VIRTUAL_ENCODING__
extern char _STACK_END[];
extern char __bss__[];
register volatile unsigned int __SP;
register volatile unsigned int __DP;
#else
#ifndef __TI_EABI__
__asm("\t.global __STACK_END");
#else
__asm("\t.global __TI_STACK_END");
__asm("\t.global __TI_STATIC_BASE");
#endif
#endif

#pragma DATA_ALIGN   (_stack, 8);
#pragma DATA_SECTION (_stack, ".stack");
char _stack[8];

/*---------------------------------------------------------------------------*/
/* Rename c_int00 so that the linkage name remains _c_int00 in ELF           */
/*---------------------------------------------------------------------------*/
#ifdef __TI_EABI__
#define c_int00 _c_int00
#endif

/*****************************************************************************/
/* C_INT00() - C ENVIRONMENT ENTRY POINT                                     */
/*****************************************************************************/
extern void __interrupt c_int00()
{

#ifdef __VIRTUAL_ENCODING__

#ifndef __TI_EABI__
    __SP = (_symval(_STACK_END) - 4) & ~7;
    __DP = _symval(__bss__);
#else
    __SP = (_symval(__STACK_END) - 4) & ~7;
    __DP = _symval(__TI_STATIC_BASE);
#endif

#else
   /*------------------------------------------------------------------------*/
   /* SET UP THE STACK POINTER IN B15.                                       */
   /* THE STACK POINTER POINTS 1 WORD PAST THE TOP OF THE STACK, SO SUBTRACT */
   /* 1 WORD FROM THE SIZE. ALSO THE SP MUST BE ALIGNED ON AN 8-BYTE BOUNDARY*/
   /*------------------------------------------------------------------------*/
#ifndef __TI_EABI__

   __asm("\t   MVKL\t\t   __STACK_END - 4, SP");
   __asm("\t   MVKH\t\t   __STACK_END - 4, SP");

#else

   __asm("\t   MVKL\t\t   __TI_STACK_END - 4, SP");
   __asm("\t   MVKH\t\t   __TI_STACK_END - 4, SP");

#endif

   __asm("\t   AND\t\t   ~7,SP,SP");               

   /*------------------------------------------------------------------------*/
   /* SET UP THE GLOBAL PAGE POINTER IN B14.                                 */
   /*------------------------------------------------------------------------*/
#ifndef __TI_EABI__

   __asm("\t   MVKL\t\t   $bss,DP");
   __asm("\t   MVKH\t\t   $bss,DP");

#else

   __asm("\t   MVKL\t\t   __TI_STATIC_BASE,DP");
   __asm("\t   MVKH\t\t   __TI_STATIC_BASE,DP");

#endif
#endif  /* Virtual Encoding */

   /*------------------------------------------------------------------------*/
   /* SET UP FLOATING POINT REGISTERS FOR C6700                              */
   /*------------------------------------------------------------------------*/
#ifdef _TMS320C6700
   FADCR = 0; FMCR  = 0;
#endif

   /*------------------------------------------------------------------------*/
   /* CALL THE AUTOINITIALIZATION ROUTINE.                                   */
   /*------------------------------------------------------------------------*/
   AUTO_INIT();
   
   _args_main();

   /*------------------------------------------------------------------------*/
   /* CALL EXIT.                                                             */
   /*------------------------------------------------------------------------*/
   exit(1);
}

