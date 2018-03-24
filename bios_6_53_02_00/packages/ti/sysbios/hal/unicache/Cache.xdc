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
 *  ======== Cache.xdc ========
 */
package ti.sysbios.hal.unicache;

import xdc.rov.ViewInfo;
import xdc.runtime.Error;
import xdc.runtime.Types;

import ti.sysbios.interfaces.ICache;
import ti.sysbios.hal.Hwi;

/*!
 *  ======== Cache ========
 *  The unicache Cache module used by the omap4 Tesla and Ducati cores
 *
 *  The Tesla and Ducati UniCaches do not support separate program and
 *  data caches. Therefore none of the unique Cache_Type L1P/L1D/L2P/L2D
 *  operations can be precisely supported. The APIs in this module ignore
 *  the P/D and observe only the L1/L2 designations (ie Cache_Type_L1P
 *  is functionally equivalent to Cache_Type_L1D and Cache_Type_L1).
 *
 *  @a(Restrictions)
 *  When used within a dual M3 core (Ducati arrangement), care must be
 *  taken when initializing this shared resource.
 *  The "Shared Resources" note provided
 *  in the {@link ti.sysbios.family.arm.ducati ducati} package discusses
 *  the management of the various hardware and software resources
 *  shared by the two M3 cores.
 *
 *  As the unicache is shared between the two M3 cores, it should only
 *  be initialized and enabled once.
 *  It is intended that Core 0 will {@link #configureCache configure}
 *  the unicache at startup and then either {@link #enableCache enable}
 *  it at that time or later on by manually invoking
 *  {@link #enable Cache_enable()}.
 *
 *  The unicache Cache module is a Gated module. In a dual M3 core (Ducati)
 *  environment, the unicache Cache module employs a
 *  {@link ti.sysbios.family.arm.ducati.GateDualCore GateDualCore} gate
 *  to arbitrate the usage of the shared unicache registers. In a non
 *  shared environment such as the C64T core in an OMAP4 device, a
 *  {@link ti.sysbios.gates.GateHwi GateHwi} gate is used to avoid multi
 *  thread conflicts.
 *
 *  @a
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center">
 *    </colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th>
 *    <th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                  -->
 *    <tr><td> {@link #disable}     </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enable}      </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #inv}         </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wb}          </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbInv}       </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wait}        </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started
 *    (e.g. Cache_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started
 *    (e.g. Cache_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

@Gated

module Cache inherits ti.sysbios.interfaces.ICache
{

    // -------- Module Types --------

    /*!
     *  Runtime representation of the Cache registers
     */
    struct CACHE {
        UInt32 L1_INFO;         /* 0000 */
        UInt32 L1_CONFIG;       /* 0004 */
        UInt32 L1_INT;          /* 0008 */
        UInt32 L1_OCP;          /* 000C */
        UInt32 L1_MAINT;        /* 0010 */
        Ptr    L1_MTSTART;      /* 0014 */
        Ptr    L1_MTEND;        /* 0018 */
        Ptr    L1_CTADDR;       /* 001c */
        UInt32 L1_CTDATA;       /* 0020 */

        UInt32 Reserved[0x77];  /* 0024 - 001fc */

        UInt32 L2_INFO;         /* 0200 */
        UInt32 L2_CONFIG;       /* 0204 */
        UInt32 L2_INT;          /* 0208 */
        UInt32 L2_OCP;          /* 020C */
        UInt32 L2_MAINT;        /* 0210 */
        Ptr    L2_MTSTART;      /* 0214 */
        Ptr    L2_MTEND;        /* 0218 */
        Ptr    L2_CTADDR;       /* 021c */
        UInt32 L2_CTDATA;       /* 0220 */
    };

    /*!
     *  This device's unicache register set address.
     *  Initialized internally according to build target/device.
     */
    extern volatile CACHE cache;

    /*!
     *  OCP Interface Configuration Register Settings.
     */
    struct OCPConfig {
        UInt8 wrap;
        UInt8 wrbuffer;
        UInt8 prefetch;
        UInt8 cleanbuf;
    }

    /*!
     *  CONFIG Configuration Register Settings.
     */
    struct SecurityConfig {
        UInt8 secure;
        UInt8 nbypass;
        UInt8 secint;
        UInt8 secport;
        UInt8 secmain;
    }

    // -------- ROV view --------

    /*! @_nodoc */
    metaonly struct ModuleView {
        Bool        cacheEnabled;
    };

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Module',   {type: ViewInfo.MODULE,   viewInitFxn: 'viewInitModule',   structName: 'ModuleView'}],
           ]
       });

    // Errors

    /*!
     *  Error raised when a Cache interrupt occurs
     *  Reason bits are contents of Cache Interrupt Register
     */
    config Error.Id E_exception = {
        msg: "E_exception: L%d reason: 0x%x"
    };

    // -------- Configuration Parameters --------

    /*!
     *  L1_OCP register settings
     */
    metaonly config OCPConfig ocpL1 = {
        wrap : 0,
        wrbuffer : 0,
        prefetch : 0
    };

    /*!
     *  L1_CONFIG register settings
     */
    metaonly config SecurityConfig configL1 = {
        secure : 0,
        nbypass : 0,
        secint : 1,
        secport : 1,
        secmain : 1
    };

    /*!
     *  L2_OCP register settings
     */
    metaonly config OCPConfig ocpL2 = {
        wrap : 0,
        wrbuffer : 0,
        prefetch : 0,
        cleanbuf : 0
    };

    /*!
     *  L2_CONFIG register settings
     */
    metaonly config SecurityConfig configL2 = {
        secure : 0,
        nbypass : 0,
        secint : 1,
        secport : 1,
        secmain : 1
    };

    /*!
     *  Configure cache at startup?
     *
     *  It is possible to configure the Cache at startup and not
     *  {@link #enableCache enable} it.
     *  However, it is not possible to enable the Cache at startup
     *  without configuring it.
     *
     *  Enabling the Cache will automatically enable configuring
     *  the Cache.
     */
    config Bool configureCache = false;

    /*!
     *  Enable cache at startup?
     *
     *  Enabling the Cache at startup will force
     *  {@link #configureCache configuring} the Cache at startup.
     */
    config Bool enableCache = false;

    /*!
     *  Maximum buffer size to use discrete cache line operations with.
     *
     *  For buffers below a certain size, cache maintenance operations are
     *  more efficient if performed on single cache lines at a time
     *  rather than on an entire region.
     *
     *  For buffer sizes equal to or less than this setting, the {@link #inv},
     *  {@link #wb}, and {@link #wbInv} APIs will use a series of individual
     *  cache line operations. For buffer sizes large than this setting, a
     *  a single block mode operation will be performed.
     *
     *  For M3 cores, the default setting is 1024 bytes.
     *  For 64T cores, the default setting is 4096 bytes.
     */
    config SizeT maxLineModeBufSize;

    /*!
     *  L1 Interrupt Handler.
     *  Default is set to an internal L1 interrupt handler
     */
    metaonly config Hwi.FuncPtr l1InterruptHandler;

    /*!
     *  L1 Interrupt number.
     *  Default is device unique but can be set in the user config file.
     */
    metaonly config UInt l1InterruptNumber;

    /*!
     *  L1 Interrupt priority.
     *  Default is device unique but can be set in the user config file.
     */
    metaonly config UInt l1InterruptPriority;

    /*!
     *  L2 Interrupt Handler.
     *  Default is set to an internal L2 interrupt handler
     */
    metaonly config Hwi.FuncPtr l2InterruptHandler;

    /*!
     *  L2 Interrupt number.
     *  Default is device unique but can be set in the user config file.
     */
    metaonly config UInt l2InterruptNumber;

    /*!
     *  L2 Interrupt priority.
     *  Default is device unique but can be set in the user config file.
     */
    metaonly config UInt l2InterruptPriority;

    // -------- Module Functions --------

    /*!
     *  ======== lock ========
     *  Locks a memory block into the cache.
     *
     *  @param(blockPtr) start address of range to be locked
     *  @param(byteCnt)  number of bytes to be locked
     *  @param(type)     bit mask of Cache type
     *  @param(wait)     wait until the operation is completed
     */
    Void lock(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait);

    /*!
     *  ======== unlock ========
     *  Unlocks a cached memory block.
     *
     *  @param(blockPtr) start address of range to be locked
     *  @param(byteCnt)  number of bytes to be locked
     *  @param(type)     bit mask of Cache type
     *  @param(wait)     wait until the operation is completed
     */
    Void unlock(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait);

    /*!
     *  ======== preload ========
     *  Loads a memory block into the cache.
     *
     *  @param(blockPtr) start address of range to be loaded
     *  @param(byteCnt)  number of bytes to be loaded
     *  @param(type)     bit mask of Cache type
     *  @param(wait)     wait until the operation is completed
     */
    Void preload(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait);

    /*!
     *  ======== preloadLock ========
     *  Loads and locks a memory block into the cache.
     *
     *  @param(blockPtr) start address of range to be loaded
     *  @param(byteCnt)  number of bytes to be loaded
     *  @param(type)     bit mask of Cache type
     *  @param(wait)     wait until the operation is completed
     */
    Void preloadLock(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait);

    /*!
     *  ======== wbAll ========
     *  Write back all caches
     *
     *  Perform a global write back.
     *  All cache lines are left valid in L1 and L2 caches and the data in L1
     *  cache is written back to L2 or external.  All cache lines are left
     *  valid in L2 cache and the data in L2 cache is written back to
     *  external.
     *  Waits for completion.
     */
    override Void wbAll();

    /*!
     *  ======== invAll ========
     *  Invalidate all caches
     *
     *  Perform a global invalidate.  All cache lines are
     *  invalidated in L1 and L2 caches.
     *  Waits for completion.
     */
    Void invAll();

    /*!
     *  ======== wbInvAll ========
     *  Write back invalidate all caches
     *
     *  Perform a global write back.
     *  Then perform a global invalidate.
     *  All cache lines are invalidated in L1 and L2 caches.
     *  Waits for completion.
     */
    override Void wbInvAll();

    /*!
     *  ======== read ========
     *  Read a block of memory from the cache.
     *  Only whole numbers of 32 bit words are transferred.
     *  byteCnt is divided by 4 to convert to number of words.
     *
     *  @param(blockPtr) start address of range to be loaded
     *  @param(byteCnt)  number of bytes to be loaded
     *  @param(type)     bit mask of Cache type
     *  @param(destBuf)  address of destination buffer
     */
    Void read(Ptr blockPtr, SizeT byteCnt, Bits16 type, Ptr destBuf);

    /*!
     *  @_nodoc
     *  ======== dumpRegs ========
     *  formatted dump of cache registers
     */
    Void dumpRegs();

internal:

    /* initial L1 register settings */
    config Bits32 l1ocpConfig;
    config Bits32 l1secConfig;

    /* initial L2 register settings */
    config Bits32 l2ocpConfig;
    config Bits32 l2secConfig;

    /* device-specific L2 support enabled flag */
    readonly config Bool l2CacheSupported;

    /* base address of Cache registers */
    metaonly config Ptr baseAddr;

    /*!
     *  ======== seizeRegs ========
     *  seize the cache registers
     */
    UInt seizeRegs();

    /*!
     *  ======== releaseRegs ========
     *  release the cache registers
     */
    Void releaseRegs(UInt key);

    /*
     *  ======== ISR ========
     *  Cache Interrupt Service Routine
     */
    Void ISR(UArg level);

    /*
     *  ======== invAllI ========
     *  Invalidate all caches
     *
     *  Perform a global invalidate.  All cache lines are
     *  invalidated in L1 and L2 caches.
     *  Waits for completion.
     *
     *  This function does not seize the cache regs before
     *  accessing them.
     */
    Void invAllI();

    /*!
     *  ======== printInfo ========
     *  formatted dump of cache registers helper
     */
    Void printInfo(UInt info, UInt level);

    /*!
     *  ======== printConfig ========
     *  formatted dump of cache registers helper
     */
    Void printConfig(UInt cfg, UInt level);

    /*!
     *  ======== printOCP ========
     *  formatted dump of cache registers helper
     */
    Void printOCP(UInt cfg, UInt level);

    /*!
     *  ======== startup ========
     *  startup function to enable cache early during climb-up
     */
    Void startup();
}
