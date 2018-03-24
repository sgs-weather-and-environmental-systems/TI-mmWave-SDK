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

package ti.sysbios.family.arm.arm9;

/*!
 *  ======== Cache ========
 *  ARM Cache Module
 *
 *  This module manages the data and instruction caches on ARM processors.
 *  It provides a list of functions that perform cache operations.  The
 *  functions operate on a per cache line except for the 'All' functions
 *  which operate on the entire cache specified.  Any Address that is not
 *  aligned to a cache line gets rounded down to the address of
 *  the nearest cache line.
 *
 *  The L1 data and program caches are enabled 
 *  by default early during the startup sequence (prior to any Module_startup()s).  
 *  Data caching requires the MMU to be enabled and the cacheable 
 *  attribute of the section/page descriptor for a corresponding
 *  memory region to be enabled.  
 *  Program caching does not require the MMU to be enabled and therefore 
 *  occurs when the L1 program cache is enabled.
 *
 *  Note: See the {@link ti.sysbios.family.arm.arm9.Mmu} module for 
 *        information about the MMU.
 *
 *  Unconstrained Functions
 *  All functions
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function                 </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #disable}     </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enable}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #inv}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #invL1dAll}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #invL1pAll}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wait}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wb}          </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbInv}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbInvL1dAll} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbL1dAll}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started (e.g. Cache_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started (e.g. Cache_Module_startupDone() returns FALSE).</li>
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
    const UInt sizeL1dCacheLine = 32;

    /*!
     *  Size of L1 program cache Line
     */
    const UInt sizeL1pCacheLine = 32;
    
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
     *  ======== invL1d ========
     *  Invalidates range in L1 data cache.
     */
    Void invL1d(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*!
     *  ======== invL1p ========
     *  Invalidates range in L1 program cache.
     */
    Void invL1p(Ptr blockPtr, SizeT byteCnt, Bool wait);

}
