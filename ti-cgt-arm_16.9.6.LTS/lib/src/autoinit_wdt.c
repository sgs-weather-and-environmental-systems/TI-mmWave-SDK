/*****************************************************************************/
/* AUTO_INIT_WDT()   v16.9.6 - Perform initialization of C variables.        */
/*                                                                           */
/* Copyright (c) 2014-2017 Texas Instruments Incorporated                    */
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
#include "boot_hooks.h"
#include <inttypes.h>
#include <string.h>

#define WDTPW                (0x5A00)
#define WDTCNTCL             (0x0008)
#define WDTHOLD              (0x0080)
#define RESTORE_WDT(setting) (WDTPW | (0x00FF & (setting)) | WDTCNTCL)
#define HOLD_WDT             (WDTPW | WDTHOLD)

#define WDTCTL WDTCTL_SYM

extern volatile uint16_t WDTCTL;

void AUTO_INIT_HOLD_WDT(void)
{
    run_binit();

    uint16_t initial_WDT = WDTCTL;
    WDTCTL = HOLD_WDT;

    run_cinit();

    WDTCTL = RESTORE_WDT(initial_WDT);

    /*-----------------------------------------------------------------------*/
    /* Call the startup hook function.                                       */
    /*-----------------------------------------------------------------------*/
    _system_post_cinit();

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
