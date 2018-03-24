/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

#if __TI_COMPILER_VERSION__ >= 4004000
/*****************************************************************************/
/* AUTO_INIT_WDT()   v4.4.2 - Perform initialization of C variables.         */
/*                                                                           */
/* Copyright (c) 2014-2014 Texas Instruments Incorporated                    */
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
#include <inttypes.h>
#include <string.h>

#include <xdc/runtime/Startup.h>
extern int xdc_runtime_Startup__EXECFXN__C;

#define WDTPW                (0x5A00)
#define WDTCNTCL             (0x0008)
#define WDTHOLD              (0x0080)
#define RESTORE_WDT(setting) (WDTPW | (0x00FF & (setting)) | WDTCNTCL)
#define HOLD_WDT             (WDTPW | WDTHOLD)


extern volatile uint16_t WDTCTL;

void AUTO_INIT_HOLD_WDT(void)
{
    run_binit();

    uint16_t initial_WDT = WDTCTL;

    run_cinit();

    WDTCTL = RESTORE_WDT(initial_WDT);

    /*------------------------------------------------------------------------*/
    /* Process XDC Startup                                                    */
    /*------------------------------------------------------------------------*/
    if (&xdc_runtime_Startup__EXECFXN__C == (int*)1) {
       xdc_runtime_Startup_exec__E();
    }

    run_pinit();
}
#endif
/*
 *  @(#) ti.targets.msp430.rts430; 1, 0, 0,0; 11-8-2017 18:01:41; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

