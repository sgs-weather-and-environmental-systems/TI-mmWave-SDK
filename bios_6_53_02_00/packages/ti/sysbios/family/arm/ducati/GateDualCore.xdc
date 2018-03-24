/*
 * Copyright (c) 2013, Texas Instruments Incorporated
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
 *  ======== GateDualCore.xdc ========
 *
 */
package ti.sysbios.family.arm.ducati;

import xdc.rov.ViewInfo;

import xdc.runtime.Assert;
import xdc.runtime.Error;

/*!
 *  ======== GateDualCore ========
 *  A Gate for use by the two Ducati M3 cores to manage shared resources.
 *
 *  GateDualCore uses disabling and enabling of interrupts as well as a shared
 *  variable between the two M3 cores as the resource locking
 *  mechanism. Such a gate guarantees exclusive access to a resource
 *  shared between the cores.
 *
 *  Each gate consumes one 32 bit word of shared memory.
 *  An array of these gates is shared between the two M3 cores and
 *  therefore the address of this array must be known to both (see
 *  {@link #gateArrayAddress}).
 *
 *  By default, the array has 4 entries (see {@link #numGates})
 *  and is placed immediately below Core 0's default interrupt
 *  vector table address. It is the responsibility of the user to
 *  configure both cores with the same array address and size.
 *
 *  @a(Restrictions)
 *  In a dual core M3 (Ducati) environment, core 0 is responsible
 *  for initializing the shared gate variable, therefore core 0
 *  must be brought up BEFORE core 1 invokes GateDualCore_enter().
 *  This can be achieved by simply running core 0 to its main()
 *  function prior to loading and running core 1.
 *
 *  GateDualCore does not support nesting of {@link #enter}/{@link #leave}
 *  calls.
 *
 *  Global interrupts are disabled upon return from GateDualCore_enter().
 *  The duration between the enter and leave should be as short as possible
 *  to minimize Hwi latency and stalls by the other M3 core.
 *
 *  Gate zero (0) is reserved for the {@link ti.sysbios.hal.unicache.Cache}
 *  module and is internally configured for its use.
 *  @a
 */

@Template("./GateDualCore.xdt")  /* generates gateArray */
@ModuleStartup      /* generate a call to startup function */
@InstanceInitError  /* create requires EB */

module GateDualCore inherits xdc.runtime.IGateProvider
{

    /*! @_nodoc */
    metaonly struct BasicView {
        String      label;
        UInt        index;
        String      owner;
        String      gateValue;
        UInt        stalls;
        UInt        noStalls;
        UInt        totalStalls;
        UInt        maxStall;
    };

    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Basic',    {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitBasic',    structName: 'BasicView'}],
            ]
        });

    /*! Assert if nested "enter" called. */
    config Assert.Id A_nestedEnter = {
        msg: "A_nestedEnter: Can't nest 'enter' calls."
    };

    /*!
     *  Error raised if an invalid Gate index is provided
     */
    config Error.Id E_invalidIndex = {
        msg: "E_invalidIndex %d"
    };

    /*!
     *  Error raised if a Gate is already in use
     */
    config Error.Id E_gateInUse = {
        msg: "E_gateInUse %d"
    };

    /*!
     *  Base address of configurable Ducati Gate Array
     *
     *  Each gate consumes one 32 bit word of shared memory.
     *  The array is shared between the two M3 cores and therefore
     *  the address of this array must be the same for both.
     *
     *  By default, the array has 4 entries (see {@link #numGates})
     *  and is placed immediately below Core 1's default interrupt
     *  vector table address of 0x00000800 (see
     *  {@link ti.sysbios.family.arm.m3.Hwi#vectorTableAddress}).
     *
     *  Gate zero (0) is reserved for the
     *  {@link ti.sysbios.hal.unicache.Cache} module.
     */
    config Ptr gateArrayAddress = 0x000007f0;

    /*!
     *  Number of Gates that can be created. Default is 4.
     *
     *  Each gate consumes one 32 bit word of memory.
     *  (see {@link #gateArrayAddress}).
     */
    config UInt numGates = 4;

    /*!
     *  Gate initialize flag.
     *
     *  By default, core 0 initializes all of the
     *  gates in {@link #gateArray}.
     *  This behavior can be overridden by explicitly setting this
     *  flag within your config script.
     */
    config Bool initGates;

    /*!
     *  Gate statistics collection flag. Default is disabled.
     */
    config bool enableStats = false;

    /*!
     *  Shared array of gate variables.
     *
     *  This global variable is placed in its own data section
     *  and that section is placed at {@link #gateArrayAddress}.
     *
     *  The size of the array is determined by {@link #numGates}
     */
    extern UInt32 gateArray[numGates];

instance:

    /*! index of the gate variable in the shared gateArray table */
    config UInt index = 0;

    /*!
     *  @_nodoc
     *  ======== enter ========
     *  Enter this gate
     */
    override IArg enter();

    /*!
     *  @_nodoc
     *  ======== leave ========
     *  Leave this gate
     */
    override Void leave(IArg key);

    /*!
     *  Sync execution with the other M3 core.
     */
    Void sync();

internal:

    /*
     *  ======== postInit ========
     *  finish initializing gate instances
     */
    Void postInit(Object *gate);

    struct Instance_State {
        UInt            index;
        volatile UInt32 *gatePtr;
        volatile UInt8  *gateBytePtr;
        /* below are for stats collection */
        UInt            stalls;
        UInt            noStalls;
        UInt            totalStalls;
        UInt            maxStall;
    };

    struct Module_State {
        UInt8   usedGates[numGates];
    };
}
