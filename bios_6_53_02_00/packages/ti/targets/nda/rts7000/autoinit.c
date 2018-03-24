/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*****************************************************************************/
/* _AUTO_INIT()   v1.0.0A15352 - Perform initialization of C variables.      */
/*                                                                           */
/* Copyright (c) 1993-2016 Texas Instruments Incorporated                    */
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
#include "autoinit.h"

extern void __tdeh_init();

/*****************************************************************************/
/* binit */
/*****************************************************************************/


/*****************************************************************************/
/* Standard top-level autoinit */
/*****************************************************************************/
void AUTO_INIT(void)
{
    run_binit();
    run_cinit();

   /*------------------------------------------------------------------------*/
   /* For those targets that support table driven exception handling,        */
   /* initialize the global exception stack data structure here before       */
   /* calling C++ global constructors to prepare for the first exception.    */
   /*------------------------------------------------------------------------*/
   /* C6x will call __tdeh_init() from within __TI_tls_init() since each     */
   /* thread must set up its own private exception stack.                    */
   /*------------------------------------------------------------------------*/
#if defined(__TI_TABLE_DRIVEN_EXCEPTIONS)
    __tdeh_init();
#endif

    run_pinit();
}

#ifdef __TI_RTS_BUILD
/*---------------------------------------------------------------------------*/
/* __TI_default_auto_init indicates that the default TI auto initialization  */
/* routine is being used.  The linker makes assumptions about how            */
/* initialization is being performed when this symbols is seen.  This symbol */
/* should NOT be defined if a customized auto initialization routine is used.*/
/*---------------------------------------------------------------------------*/
__asm("__TI_default_auto_init .set 1");
#endif

/*****************************************************************************/
/* C6x __TI_cpp_init symbol */
/*****************************************************************************/
/*
 *  @(#) ti.targets.nda.rts7000; 1, 0, 0,0; 11-8-2017 18:01:51; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

