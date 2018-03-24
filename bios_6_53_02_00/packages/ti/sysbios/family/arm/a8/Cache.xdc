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
 *  ======== Cache.xdc ========
 *
 */

package ti.sysbios.family.arm.a8;

import xdc.rov.ViewInfo;

import xdc.runtime.Assert;

/*!
 *  ======== Cache ========
 *  ARM Cache Module
 *
 *  This module manages the data and instruction caches on Cortex A8
 *  processors.
 *  It provides a list of functions that perform cache operations.  The
 *  functions operate on a per cache line except for the 'All' functions
 *  which operate on the entire cache specified.  Any Address that is not
 *  aligned to a cache line gets rounded down to the address of
 *  the nearest cache line.
 *
 *  The L1 data and program caches as well as the L2 cache are enabled
 *  by default early during the startup sequence (prior to any
 *  Module_startup()s).
 *  Data caching requires the MMU to be enabled and the cacheable
 *  attribute of the section/page descriptor for a corresponding
 *  memory region to be enabled.
 *  Program caching does not require the MMU to be enabled and therefore
 *  occurs when the L1 program cache is enabled.
 *
 *  Note: See the {@link ti.sysbios.family.arm.a8.Mmu} module for
 *        information about the MMU.
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
 *    <tr><td> {@link #wbInv}       </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbInvL1dAll} </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbL1dAll}    </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #lock}       </td><td>   Y    </td><td>   Y     </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #unlock}       </td><td>   Y    </td><td>   Y   </td>
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
     *  Size of L1 data cache Line
     */
    const UInt sizeL1dCacheLine = 64;

    /*!
     *  Size of L1 program cache Line
     */
    const UInt sizeL1pCacheLine = 64;

    /*!
     *  Size of L2 cache Line
     */
    const UInt sizeL2CacheLine = 64;

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
     *  ======== WayInfoView ========
     *  @_nodoc
     */
    metaonly struct WayInfoView {
        UInt        number;
        Bool        locked;
        Ptr         baseAddress;
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
                                  structName: 'CacheInfoView'}],
                ['L2 Way Info', { type: ViewInfo.MODULE_DATA,
                                  viewInitFxn: 'viewInitWays',
                                  structName: 'WayInfoView'}]
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
     *  Enable L1 and L2 data and program caches.
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
     *  Unlock all 8 L2 cache ways at startup, default is true.
     *
     *  Ordinarily, the L2 cache ways should all be unlocked at
     *  system startup.
     *
     *  During development using CCS, if the application exits
     *  while L2 cache ways are locked, the soft-reset function
     *  DOES NOT unlock the L2 cache ways. To overcome this problem,
     *  the L2 cache ways are unlocked during Cache module startup.
     *
     *  If for any reason this behavior is undesirable, setting this
     *  config parameter to false will disable the automatic unlocking
     *  of the L2 cache ways.
     */
    config Bool unlockL2Cache = true;

    /*!
     *  Enable Branch Prediction at startup, default is true.
     *
     *  This flag controls whether Branch Prediction should be automatically
     *  enabled or disabled during system startup.
     *
     *  @a(NOTE)
     *  Upon reset, the A8's Program Flow Prediction (Branch Prediction)
     *  feature is disabled.
     */
    config Bool branchPredictionEnabled = true;

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
     *  ======== lock ========
     *  Loads and locks a memory block into the L2 cache.
     *
     *  A block of memory is loaded into the L2 cache and
     *  a corresponding L2 cache "way" is locked.
     *
     *  The memory block is loaded into cache one L2 cache line at time.
     *
     *  The returned key is a bitmask of the L2 cache "way"
     *  used to lock the memory block.
     *  This key should be passed in
     *  a subsequent call to {@link #unlock Cache_unlock()}
     *  if the memory block is to be unlocked.
     *
     *  If the key returned is zero, then the lock operation failed
     *  due to insufficient cache "ways" remaining to perform the operation.
     *  The locking algorithm requires at least two unlocked cache ways:
     *  one for the memory block, and one for the locking code itself.
     *
     *  As the A8 L2 cache is always an 8 way cache, locking a cache way
     *  consumes 1/8 of the total L2 cache, regardless of the actual memory
     *  block size. For instance, if the size of L2 cache is 256K bytes,
     *  locking ANY size memory block into a way will tie up 32K bytes
     *  of L2 cache.
     *
     *  The byteCnt argument must be less than or equal to an L2 "way"
     *  size.
     *  Locking memory blocks larger than a way page size requires
     *  calling this API multiple times.
     *  An assert is generated if this rule is violated.
     *
     *  The memory block must not cross an L2 "way" page boundary.
     *  Locking memory blocks that cross way page boundaries requires
     *  calling this API multiple times.
     *  An assert is generated if this rule is violated.
     *
     *  Except for the normal L1 instruction cache behavior
     *  during code execution, the L1 instruction cache is
     *  unaffected by this API.
     *  The L1 data cache will be temporarily polluted by the contents
     *  of the referenced memory block.
     *
     *  @a(NOTE)
     *  Interrupts are disabled for the entire time the memory block
     *  is being loaded into cache. For this reason, use of this API
     *  is probably best at system intialization time
     *  (ie: within 'main()').
     *
     *  @param(blockPtr) start address of range to be locked
     *  @param(byteCnt)  number of bytes to be locked
     *  @b(returns)      key = bitmask of L2 cache "way" used
     */
    UInt lock(Ptr blockPtr, SizeT byteCnt);

    /*!
     *  ======== unlock ========
     *  Unlocks an L2 cache way.
     *
     *  Unlocks the L2 cache "way" locked by {@link #lock Cache_lock()}.
     *
     *  @a(NOTE)
     *  multiple L2 cache "ways" can be unlocked simultaneously by "or-ing"
     *  together the bitmasks returned from several invocations of Cache_lock().
     *
     *  @param(key) key returned by lock.
     */
    Void unlock(UInt key);

    /*!
     *  ======== enableBP ========
     *  Enable Branch Prediction
     *
     *  Calling this API will enable branch prediction.
     *
     *  @a(NOTE)
     *  Upon reset, the A8's Program Flow Prediction (Branch Prediction)
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
     *  Upon reset, the A8's Program Flow Prediction (Branch Prediction)
     *  feature is disabled.
     */
    Void disableBP();

internal:

    /*!
     *  ======== startup ========
     *  startup function to enable cache early during climb-up
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
     *  ======== disableL2 ========
     *  Disable L2 Unified Cache
     */
    Void disableL2();

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

    /*!
     *  ======== enableL2 ========
     *  Enable L2 Unified Cache
     */
    Void enableL2();

    /*!
     *  ======== invL1d ========
     *  Invalidates range in L1 data cache.
     */
    Void invL1d(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*!
     *  ======== invL1p ========
     *  Invalidates range in L1 program cache.
     */
    Void invL1p(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*!
     *  ======== getL2AuxControlReg ========
     *  get current L2 Aux Control register contents
     */
    Bits32 getL2AuxControlReg();

    /*!
     *  ======== setL2AuxControlReg ========
     *  set L2 Aux Control register
     */
    Void setL2AuxControlReg(Bits32 wayMask);

    /*!
     *  ======== getLockdownReg ========
     *  get current L2 Cache lockdown register contents
     */
    Bits32 getLockdownReg();

    /*!
     *  ======== setLockdownReg ========
     *  set L2 Cache lockdown register
     */
    Void setLockdownReg(Bits32 wayMask);

    /*!
     *  ======== wayLoadLock ========
     *  lock a block of memory into the L2 cache way specified by 'wayBit'.
     */
    Void wayLoadLock(Ptr blockPtr, SizeT byteCnt, UInt wayBit);

    /*!
     *  ======== getCacheLevelInfo ========
     *  returns Cache Size Id Register of corresponding Cache level
     *
     *  level values
     *      0 = L1D
     *      1 = L1P
     *      2 = L2
     */
    Bits32 getCacheLevelInfo(UInt level);

    struct Module_State {
        Bits32  l1dInfo;
        Bits32  l1pInfo;
        Bits32  l2Info;
        SizeT   l2WaySize;
        Bits32  lockRegister;           /* last write to lock register */
        Ptr     baseAddresses[8];
    }
}
