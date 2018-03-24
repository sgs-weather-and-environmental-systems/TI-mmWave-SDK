/*****************************************************************************/
/* visibility.h    v8.1.3                                                    */
/*                                                                           */
/* Copyright (c) 2008-2017 Texas Instruments Incorporated                    */
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

#ifndef _ELF_LINKAGE_H 
#define _ELF_LINKAGE_H

/*****************************************************************************/
/* Define Macros to control the symbol visibility:                           */
/*                                                                           */
/*    TI_IMPORT int foo(void);                                               */
/*       foo() is imported from a different module. Compiler can assume that */
/*       the definition of foo() will not be found in the same module and    */
/*       potentially optimize the access. This cannot be specified for       */
/*       symbol definitions.                                                 */
/*                                                                           */
/*    TI_EXPORT int foo(void);                                               */
/*       The definition of foo() is visible outside the module. Other        */
/*       modules can import this definition.                                 */
/*                                                                           */
/*    TI_PATCHABLE int foo(void);                                            */
/*       The definition of foo() is visible outside the module. Other module */
/*       can import this definition. Also, a call to foo() can be patched to */
/*       a different definition if needed. Such calls go through indirection */
/*       to enable patching. This is also called symbol preemption.          */
/*                                                                           */
/*    TI_DEFAULT int foo(void);                                              */
/*       foo() can be either imported or exported. The definition of foo()   */
/*       is visible outside the module. Other modules can import this        */
/*       definition. A call to foo() can also be patched.                    */
/*                                                                           */
/*    TI_PROTECTED int foo(void);                                            */
/*       The definition of foo() is visible outside the module. Other module */
/*       can import this definition. However, a call to foo() can never be   */
/*       patched (non preemptable).                                          */
/*                                                                           */
/*    TI_HIDDEN int foo(void);                                               */
/*       The definition of foo() is not visible outside the module.          */
/*                                                                           */
/*    TI_INTERNAL int foo(void);                                             */
/*       Same as TI_HIDDEN for now.                                          */
/*                                                                           */
/*    NOTE: These macros can be applied to both functions and variables.     */
/*          They can also be applied to classes as a whole or class members. */
/*                                                                           */
/*****************************************************************************/
#if defined(__TI_EABI__) || defined(__TI_EABI_SUPPORT__)
 #define TI_IMPORT       __declspec(dllimport)
 #define TI_EXPORT       __declspec(dllexport)
#else
 #define TI_IMPORT
 #define TI_EXPORT
#endif /* if defined(__TI_EABI__) || defined(__TI_EABI_SUPPORT__) */

#if defined(__TMS320C6X__) && defined(__TI_EABI__)
 #define TI_PATCHABLE    __attribute__((visibility("default")))
 #define TI_DEFAULT      __attribute__((visibility("default")))
 #define TI_PROTECTED    __attribute__((visibility("protected")))
 #define TI_HIDDEN       __attribute__((visibility("hidden")))
 #define TI_INTERNAL     __attribute__((visibility("internal")))
#else
 #define TI_PATCHABLE    
 #define TI_DEFAULT      
 #define TI_PROTECTED    
 #define TI_HIDDEN       
 #define TI_INTERNAL     
#endif /* defined(__TMS320C6X__) && defined(__TI_EABI__) */

#endif /* ifndef _ELF_LINKAGE_H  */
