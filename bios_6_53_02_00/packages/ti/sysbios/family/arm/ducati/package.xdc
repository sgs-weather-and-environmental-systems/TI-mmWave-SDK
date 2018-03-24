/*
 * Copyright (c) 2012, Texas Instruments Incorporated
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
 *  ======== package.xdc ========
 *
 */
requires ti.sysbios.interfaces;

/*!
 *  ======== ti.sysbios.family.arm.ducati ========
 *  Contains specifications for the Ducati device-specific SYS/BIOS functions.
 *
 *  The two M3 cores share a number of hardware and software resources.
 *
 *  The system software must carefully manage these resources when the 
 *  dynamic loading of applications is required.
 *
 *  Below is a list of the shared resources that SYS/BIOS modules utilize and
 *  manage.
 *
 *  Shared resources:
 *  
 *  AMMU
 *  @p(blist)
 *      -Must be configured before unicache is enabled.
 *      -Must have a page descriptor for EVERY memory address 
 *       accessed by either core before unicache is enabled.
 *      -AMMU is configured statically, no runtime APIs to modify 
 *       the AMMU configuration are provided.
 *      -Initialization is controlled by the
 *       {@link ti.sysbios.hal.ammu.AMMU#configureAmmu AMMU.configureAmmu} flag.
 *      -By default, this flag is true.
 *  @p
 *  
 *  Unicache
 *  @p(blist)
 *      -Must be configured and enabled.
 *      -Runtime APIs use GateDualCore[0] to arbitrate shared unicache
 *       register usage.
 *      -Initialization is controlled by the
 *       {@link ti.sysbios.hal.unicache.Cache#configureCache Cache.configureCache} flag.
 *      -By default this flag is false.
 *  @p
 *  
 *  CTM 2,3,4,5 used for timestamping
 *  @p(blist)
 *      -These counters are initialized by the 
 *       {@link TimestampProvider TimestampProvider} module, which
 *       is used by the {@link xdc.runtime.Timestamp} module to provide
 *       timestamp services.
 *      -Must be configured and started.
 *      -Configured and started by whichever core comes up first 
 *       and detects (by testing register contents) that the CTM 
 *       hasn't been configured and started.
 *  @p
 *  
 *  Reset Exception vector table (vectors 0-14)
 *  @p(blist)
 *      -The address of the Reset Exception vector table is shared by 
 *       both cores.
 *      -Vectors 0 and 1 at addresses 0x0 are fetched each time 
 *       a core is reset. At that time they must contain the SP and 
 *       address of c_int00 for the core being reset.
 *      -Exception vectors 2-14 are used by each core until it has 
 *       successfully configured its NVIC's Vector Table Offset Register (VTOR) 
 *       to point to the vector table that will be used afterwards. 
 *      -The Reset Exception vectors are required to be valid and unique 
 *       to the core being reset in case an exception occurs prior to the 
 *       VTOR being configured.
 *      -The Reset Exception vector table placement is controlled by the 
 *       {@link ti.sysbios.family.arm.m3.Hwi#resetVectorAddress Hwi.resetVectorAddress}
 *       config parameter.
 *      -By default, both cores place their Reset Exception vector table
 *       at 0x00000000. 
 *      -It is left to the system software design to guarantee
 *       that only one core is climbing up at a time.
 *  @p
 *  
 *  Runtime Exception and Interrupt vector table (vectors 0-79)
 *  @p(blist)
 *      -The address of the Runtime Exception and Interrupt vector table
 *       should be unique to each core.
 *      -The Runtime Exception and Interrupt vector table 
 *       placement is controlled by the 
 *       {@link ti.sysbios.family.arm.m3.Hwi#vectorTableAddress Hwi.vectorTableAddress}
 *       config parameter.
 *      -Default behavior is that core 0 places its runtime vector table 
 *       at 0x400 and core 1 places its runtime vector table at 0x800.
 *  @p
 *  
 *  GateDualCore[0] is used by the unicache module. 
 *  GateDualCore[1-n] can be used by applications to manage shared hardware/software resources
 *  @p(blist)
 *      -Initialization is controlled by the 
 *       {@link GateDualCore#initGates GateDualCore.initGates} flag.
 *      -By default, core 0 initializes the gate objects.
 *  @p
 *
 */
package ti.sysbios.family.arm.ducati [2,0,0,0] {
    module Core;
    module CTM;
    module GateDualCore;
    module GateSmp;
    module Timer;
    module TimerSupport;
    module TimestampProvider;
    module Wugen;
}
