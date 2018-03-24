/*
 * Copyright (c) 2014, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 *  ======== SysStd.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Gate.h>

#include <ti/sysbios/hal/Core.h>
#include <ti/sysbios/hal/Hwi.h>

#include <stdio.h>
#include <stdlib.h>

#include "package/internal/SysStd.xdc.h"

#if defined xdc_target__isaCompatible_v7A15
extern Void ti_sysbios_family_arm_a15_smp_Core_atexit__I(Int);
#define Core_atexit(a)  ti_sysbios_family_arm_a15_smp_Core_atexit__I(a)
#else
extern Void ti_sysbios_family_arm_ducati_Core_atexit__I(Int);
#define Core_atexit(a)  ti_sysbios_family_arm_ducati_Core_atexit__I(a)
#endif

/*
 *  ======== SysStd_abort ========
 */
Void SysStd_abort(CString str)
{
    if (str != NULL) {
        puts(str);
    }
    fflush(stdout);

    /*
     *  System_abort() in xdc/runtime/System.c enters the System gate
     *  before aborting, but does not leave the gate. Aforementioned
     *  System gate maps to the Inter-core gate entered by the Hwi lock.
     *  We Unlock Hwi before returning so all locks are released before
     *  exiting.
     */
     Core_unlock();

     /* Force the other core(s) to halt */
     Core_atexit(0);
}

/*
 *  ======== SysStd_exit ========
 */
Void SysStd_exit(Int stat)
{
    fflush(stdout);
}

/*
 *  ======== SysStd_putch ========
 */
Void SysStd_putch(Char ch)
{
    UInt coreId = Core_getId();
    UInt outidx;
    Char *outbuf;
    IArg key;

    /*
     * only disable local interrupts to place chars in
     * local line buffer
     */

    key = (IArg)Core_hwiDisable();

    outidx = module->lineBuffers[coreId].outidx;
    outbuf = module->lineBuffers[coreId].outbuf;

    if ((ch == '\n') || (outidx >= 255)) {

        outbuf[outidx] = 0;

        /*
         * disable interrupts globally to transfer lines
         * to the shared output buffer
         */

        Gate_enterSystem();

        puts(outbuf);

        SysStd_module->lineBuffers[coreId].outidx = 0;

        Gate_leaveSystem(key);
    }
    else {
        outbuf[outidx++] = ch;
        SysStd_module->lineBuffers[coreId].outidx = outidx;
        /* restore local interrupts */
        Core_hwiRestore((UInt)key);
    }
}

/*
 *  ======== SysStd_flush ========
 */
Void SysStd_flush()
{
    fflush(stdout);
}

/*
 *  ======== SysStd_ready ========
 */
Bool SysStd_ready()
{
    return (TRUE);
}
