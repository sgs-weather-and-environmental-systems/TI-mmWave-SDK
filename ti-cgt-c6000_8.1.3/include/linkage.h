/*****************************************************************************/
/* linkage.h   v8.1.3                                                        */
/*                                                                           */
/* Copyright (c) 1998-2017 Texas Instruments Incorporated                    */
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

#ifndef _LINKAGE
#define _LINKAGE

#pragma diag_push
#pragma CHECK_MISRA("-19.4") /* macros required for implementation */

/*--------------------------------------------------------------------------*/
/* Define _CODE_ACCESS ==> how to call RTS functions                        */
/*--------------------------------------------------------------------------*/
#ifndef _FAR_RTS
#define _CODE_ACCESS
#elif _FAR_RTS == 0
#define _CODE_ACCESS __near
#else
#define _CODE_ACCESS __far
#endif

/*--------------------------------------------------------------------------*/
/* Define _DATA_ACCESS ==> how to access RTS global or static data          */
/*--------------------------------------------------------------------------*/
#define _DATA_ACCESS __far
/*--------------------------------------------------------------------------*/
/* Define _DATA_ACCESS_NEAR ==> some C6000 RTS data must always be near     */
/*--------------------------------------------------------------------------*/
#define _DATA_ACCESS_NEAR __near

/*--------------------------------------------------------------------------*/
/* Define _IDECL ==> how inline functions are declared                      */
/*--------------------------------------------------------------------------*/
#ifdef _INLINE
#define _IDECL static __inline
#define _IDEFN static __inline
#else
#ifdef __cplusplus
#define _IDECL extern "C" _CODE_ACCESS
#else
#define _IDECL extern _CODE_ACCESS
#endif
#define _IDEFN _CODE_ACCESS
#endif

/*--------------------------------------------------------------------------*/
/* If compiling with non-TI compiler (e.g. GCC), nullify any TI-specific    */
/* language extensions.                                                     */
/*--------------------------------------------------------------------------*/

#pragma diag_pop

#endif /* ifndef _LINKAGE */
