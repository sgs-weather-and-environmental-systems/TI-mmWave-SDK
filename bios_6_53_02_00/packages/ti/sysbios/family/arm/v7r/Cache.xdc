/*
 * Copyright (c) 2015, Texas Instruments Incorporated
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

package ti.sysbios.family.arm.v7r;

import xdc.rov.ViewInfo;

import xdc.runtime.Assert;

/*!
 *  ======== Cache ========
 *  ARMv7-R Cache Module
 *
 *  This module manages the data and instruction caches on Cortex-R5
 *  processors. It provides a list of functions that perform cache operations.
 *  The functions operate on a per cache line except for the 'All' functions
 *  which operate on the entire cache specified.  Any Address that is not
 *  aligned to a cache line gets rounded down to the address of the nearest
 *  cache line.
 *
 *  The L1 data and program caches are enabled by default early during the
 *  startup sequence (prior to any Module_startup()s).
 *  Data caching requires the MPU to be enabled and attributes for the
 *  memory region to be set as cacheable.
 *  Program caching does not require the MPU to be enabled and therefore
 *  occurs when the L1 program cache is enabled.
 *
 *  (See the {@link ti.sysbios.family.arm.Mpu} module for information
 *   about the MPU.)
 *
 *  Unconstrained Functions
 *  All functions
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center">
 *    </colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th>
 *    <th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                               -->
 *    <tr><td> {@link #disable}     </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enable}      </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #inv}         </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #invL1dAll}   </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #invL1pAll}   </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wait}        </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wb}          </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbAll}      </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbInv}       </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbInvAll}   </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started
 *   (e.g. Cache_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started
 *   (e.g. Cache_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

module Cache inherits ti.sysbios.interfaces.ICache
{
    /*!
     *  ======== ModView ========
     *  @_nodoc
     */
    metaonly struct CacheInfoView {
        String      cache;
        SizeT       cacheSize;
        SizeT       lineSize;
        UInt        ways;
        SizeT       waySize;
    };

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Cache Info',  { type: ViewInfo.MODULE_DATA,
                                  viewInitFxn: 'viewInitCacheInfo',
                                  structName: 'CacheInfoView'}]
            ]
        });

    /*! Asserted in Cache_lock */
    config Assert.Id A_badBlockLength = {
        msg: "A_badBlockLength: Block length too large. Must be <= L2 way size."
    };

    /*! Asserted in Cache_lock */
    config Assert.Id A_blockCrossesPage = {
        msg: "A_blockCrossesPage: Memory block crosses L2 way page boundary."
    };

    /*!
     *  Enable L1 data and program caches.
     *
     *  To enable a subset of the caches, set this parameter
     *  to 'false' and call Cache_enable() within main, passing it only
     *  the {@link Cache#Type Cache_Type(s)} to be enabled.
     *
     *  Data caching requires the MMU and the memory section/page
     *  descriptor cacheable attribute to be enabled.
     */
    config Bool enableCache = true;

    /*!
     *  Enable Branch Prediction at startup, default is true.
     *
     *  This flag controls whether Branch Prediction should be automatically
     *  enabled or disabled during system startup.
     *
     *  @a(NOTE)
     *  Upon reset, Cortex-R core's Program Flow Prediction (Branch Prediction)
     *  feature is disabled.
     */
    config Bool branchPredictionEnabled = true;

    /*!
     *  ======== disable ========
     *  Disables the 'type' cache(s)
     *
     *  This function internally disables interrupts to ensure the cache
     *  operations performed before disabling the cache are not interrupted.
     *  Since cache maintenance operations can take a long time, this
     *  function may disable interrupts for a long period of time.
     *
     *  On certain Cortex-R devices, the FIQ interrupt cannot be disabled
     *  by software. Therefore, this function only disables IRQ interrupts
     *  on such devices. If this function needs to be called to disable
     *  interrupts, then care must be take that the FIQ ISR does not
     *  interfere with the cache flush maintenance operations performed
     *  by this function before disabling the cache.
     */
    override Void disable(Bits16 type);

    /*! @_nodoc
     *  ======== getEnabled ========
     *  Get the 'type' bitmask of cache(s) enabled.
     */
    Bits16 getEnabled();

    /*!
     *  ======== invL1dAll ========
     *  Invalidate all of L1 data cache.
     *
     *  This function should be used with caution.  In general, the
     *  L1 data cache may contain some stack variable or valid data
     *  that should not be invalidated.  This function should be used
     *  only when all contents of L1 data cache is unwanted.
     */
    Void invL1dAll();

    /*!
     *  ======== invL1pAll ========
     *  Invalidate all of L1 program cache.
     */
    Void invL1pAll();

    /*!
     *  ======== enableBP ========
     *  Enable Branch Prediction
     *
     *  Calling this API will enable branch prediction.
     *
     *  @a(NOTE)
     *  Upon reset, the R5's Program Flow Prediction (Branch Prediction)
     *  feature is disabled.
     */
    Void enableBP();

    /*!
     *  ======== disableBP ========
     *  Disable Branch Prediction
     *
     *  Calling this API will disable branch prediction.
     *
     *  @a(NOTE)
     *  Upon reset, the R5's Program Flow Prediction (Branch Prediction)
     *  feature is disabled.
     */
    Void disableBP();

    /*!
     *  ======== invBPAll ========
     *  Invalidate all branch predictors
     *
     *  Invalidates all branch predictors on this core. If running in SMP mode,
     *  this operation is broadcast to all other cores.
     */
    Void invBPAll();

internal:

    /*
     *  ======== initModuleState ========
     *  Initializes the module state.
     *
     *  This function initializes module state fields like
     *  L1D/L1P cache size and number of cache lines/sets. It
     *  is registered as a first function.
     */
    Void initModuleState();

    /*
     *  ======== startup ========
     *  startup function to enable cache early during climb-up (run as a reset
     *  function)
     */
    Void startup();

    /*!
     *  ======== disableL1d ========
     *  Disable L1 data cache
     *
     *  This function performs a write back invalidate all of
     *  L1 data cache before it disables the cache.
     */
    Void disableL1d();

    /*!
     *  ======== disableL1p ========
     *  Disable L1 Program cache
     *
     *  This function performs an invalidate all of L1 program cache
     *  before it disables the cache.
     */
    Void disableL1p();

    /*!
     *  ======== enableL1d ========
     *  Enable L1 data cache.
     */
    Void enableL1d();

    /*!
     *  ======== enableL1p ========
     *  Enable L1 program cache.
     */
    Void enableL1p();

    /*
     *  ======== invL1d ========
     *  Invalidates range in L1 data cache.
     */
    Void invL1d(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*
     *  ======== invL1p ========
     *  Invalidates range in L1 program cache.
     */
    Void invL1p(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*
     *  ======== wbInvAllI ========
     *  Write back invalidate all caches
     */
    Void wbInvAllI();

    /*
     *  ======== getCacheLevelInfo ========
     *  returns Cache Size Id Register of corresponding Cache level
     *
     *  level values
     *      0 = L1D
     *      1 = L1P
     */
    Bits32 getCacheLevelInfo(UInt level);

    struct Module_State {
        UInt8   l1dCacheLineSize;   // Size of L1D cache line in bytes
        UInt8   l1pCacheLineSize;   // Size of L1P cache line in bytes
        Bits32  l1dInfo;
        Bits32  l1pInfo;
    }
}
