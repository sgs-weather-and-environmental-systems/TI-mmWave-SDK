/*
 * Copyright (c) 2016, Texas Instruments Incorporated
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
 *  ======== Core.xdc ========
 */

import xdc.runtime.Error;

/*!
 *  ======== Core ========
 *  Core Identification Module.
 *
 *  The Core module is used to define which core within a dual core
 *  "R5" subsystem an application is being built for.
 *
 *  At runtime, a comparison is made between the configured Core.id
 *  and the value of MPIDR (bits 7:0). If they do not agree, an Error
 *  is raised.
 *
 *  Core 0's vector table is placed at 0x100 and Core 1's vector table
 *  is placed at 0x20000.
 *
 *  @a(Bootup sequence)
 *  When each Cortex-R core comes out of reset, it initializes the
 *  stack pointer and calls the reset callback function
 *  (see {@link #resetFunc}) and then continues executing the
 *  bootup sequence.
 *
 *  On a lockstep device, the bootup sequence involves calling
 *  _c_int00() while on dual-core devices, the bootup sequence
 *  involves setting up IPC between the 2 Cortex-R cores to
 *  synchronize their startup.
 *
 *  The reset callback function is called very early in the
 *  bootup sequence and can be used to detect the reset source and
 *  take the appropriate action. Here's an example showing how to
 *  register a reset callback function:
 *
 *  @p(code)
 *  var Core = xdc.useModule('ti.sysbios.family.arm.v7r.keystone3.Core');
 *  Core.resetFunc = '&myfunc';
 *  @p
 */

@ModuleStartup          /* to configure static timers */
@Template ("./Core.xdt")

module Core inherits ti.sysbios.interfaces.ICore
{
    /*! Reset function type definition. */
    typedef Void (*ResetFuncPtr)(void);

    /*!
     *  Error raised if Core.id does not match the contents
     *  of MPIDR [7:0] register.
     */
    config Error.Id E_mismatchedIds = {
        msg: "E_mismatchedIds: Core_Id: %d does not match hardware core Id: %d"
    };

    override config UInt numCores;

    /*!
     *  R5 Core ID, default is Core 0
     *
     *  Used for making static decisions based on Core ID
     */
    config UInt id = 0;

    /*!
     *  ======== resetFunc ========
     *  Reset Function Pointer
     */
    metaonly config ResetFuncPtr resetFunc = null;

    @Macro
    override UInt hwiDisable();

    @Macro
    override UInt hwiEnable();

    @Macro
    override Void hwiRestore(UInt key);

internal:

    /*
     *  ======== overrideHwiResetFunc ========
     *  This flag is set if this module installs its own resetFunc
     *  as Hwi.resetFunc and is used by various sections of code to
     *  determine whether or not to generate certain functions.
     */
    metaonly config Bool overrideHwiResetFunc = false;

    /*
     *  ======== startCore1 ========
     *  Signal Core1. Called by Core0.
     */
    Void startCore1();

    /*
     *  ======== resetC ========
     */
    Void resetC();
}
