/*****************************************************************************/
/*  errno    v8.1.3                                                          */
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
#include <errno.h>

#if defined(__TMS320C6X__) && defined(__TI_EABI__)

#include <_tls.h>

/*---------------------------------------------------------------------------*/
/* The use of a function call in the 'errno' macro definition in errno.h     */
/* introduces an EABI object incompatibility between any 7.4 RTS library     */
/* and 7.0 -> 7.3.x EABI objects that use errno. Old objects will try to     */
/* access errno directly. If left unaddressed, this will cause the linker to */
/* generate an unresolved reference error to 'errno'.                        */
/*                                                                           */
/* If it is possible to recompile the object that uses errno, then the issue */
/* can be corrected by including the errno.h from 7.4 (or later) and the     */
/* old reference to errno will turn into a function call to access the RTS'  */
/* internal implementation of errno.                                         */
/*                                                                           */
/* If it is not possible to re-compile an old EABI object reference to errno,*/
/* then the issue can still be resolved by defining an 'errno' symbol at the */
/* same address as the internal implementation (__errno). That is the long   */
/* story behind the inclusion of the following asm statements in the errno.c */
/* source.                                                                   */
/*                                                                           */
/* NOTE: If the application requires the use of a TLS version of errno, then */
/*       it *MUST* be compiled with v7.4 (or later) and linked with a        */
/*       thread-safe version of the RTS library.                             */
/*---------------------------------------------------------------------------*/
asm("      .global errno");
asm("errno .set __errno");

/*---------------------------------------------------------------------------*/
/* The internal implementation of 'errno' is controlled via the __TI_USE_TLS */
/* symbol. For a thread-safe library, __errno will be given a __thread       */
/* qualifier (making it TLS). For non-thread-safe libraries, __errno is      */
/* defined as a scalar int.                                                  */
/*---------------------------------------------------------------------------*/
__TI_TLS_DATA_DEF(extern, int, __errno, 0);

/*---------------------------------------------------------------------------*/
/* __c6xabi_errno_addr() - return the address of the internal implementation */
/*                         of 'errno'. This function is used by the errno    */
/*                         macro definition in errno.h to hide whether errno */
/*                         is implemented as TLS or not from the user app    */
/*                         POV. This will prevent the user from having to    */
/*                         know beforehand whether they need to compile a    */
/*                         a use of errno.h with TLS or not.                 */
/*---------------------------------------------------------------------------*/
int *__c6xabi_errno_addr()
{
   return __TI_TLS_DATA_PTR(__errno);
}

#else /* neither C6000 EABI nor ARM EABI */

_DATA_ACCESS int errno = 0;

#endif /* defined(__TMS320C6X__) && defined(__TI_EABI__) */
