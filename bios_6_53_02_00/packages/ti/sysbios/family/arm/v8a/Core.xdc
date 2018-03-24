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

/*!
 *  ======== Core ========
 *  ICore implementation for default BIOS CoreDelegate
 */
module Core inherits ti.sysbios.interfaces.ICore
{
    /*!
     *  ======== id ========
     *  Non SMP Core ID, default is Core 0
     *
     *  Used for making static decisions based on Core ID
     */
    config UInt id = 0;

    /*!
     *  @_nodoc
     *  ======== baseClusterId ========
     */
    config UInt baseClusterId = 0;

    override config UInt numCores = 1;

    /*!
     *  ======== bootMaster ========
     *  Boolean flag indicating whether this core is boot master
     *
     *  If a core is marked as a boot master then, it will initialize
     *  shared global peripherals like the GIC distributor. This
     *  config param should be set to false for secondary cores
     *  running in an AMP system.
     */
    metaonly config Bool bootMaster = true;

    /*!
     *  ======== getClusterId ========
     *  Returns the core's cluster Id
     */
    UInt getClusterId();

    /*!
     *  @_nodoc
     *  ======== getRevisionNumber ========
     *  Returns the major and minor revision number for the Cortex-A
     *  processor as a 2-nibble quantity [Major revision: Minor revision]
     *
     *  This API is used internally by different modules to check
     *  the ARM IP revision number and determine whether or not an
     *  errata applies and requires a workaround.
     */
    UInt8 getRevisionNumber();

internal:

    /*
     *  ======== reset ========
     *  Switch CPU execution level from EL3/EL2 to EL1
     */
    Void reset();

    /*
     *  ======== getGicxAddr ========
     *  Return GIC redistributor RD_base/SGI_base address for this core
     */
    Ptr getGicrBaseAddr(Ptr gicRedistributorBaseAddress);
}
