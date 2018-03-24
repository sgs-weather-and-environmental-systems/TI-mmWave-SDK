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
 *
 */

package ti.sysbios.family.arm.a9;

import xdc.rov.ViewInfo;

import xdc.runtime.Assert;

import ti.sysbios.family.arm.gic.Hwi;

/*!
 *  ======== Cache ========
 *  ARM Cache Module
 *
 *  This module manages the data and instruction caches on Cortex A9
 *  processors.
 *
 *  It provides a list of functions that perform cache operations.  The
 *  functions operate on a per cache line except for the 'All' functions
 *  which operate on the entire cache specified.  Any Address that is not
 *  aligned to a cache line gets rounded down to the address of
 *  the nearest cache line.
 *
 *  The L1 data and program caches as well as the L2 cache are enabled
 *  by default early during the startup sequence (prior to any
 *  Module_startup()s).
 *
 *  Data caching requires the MMU to be enabled and the cacheable
 *  attribute of the section/page descriptor for a corresponding
 *  memory region to be enabled.
 *  Program caching does not require the MMU to be enabled and therefore
 *  occurs when the L1 program cache is enabled.
 *
 *  Note: See the {@link ti.sysbios.family.arm.a8.Mmu} module for
 *        information about the MMU.
 *
 *  Here's an example showing how to enable L2 interrupt and register an
 *  interrupt callback function:
 *
 *  *.cfg config script:
 *  @p(code)
 *  ...
 *
 *  var Cache = xdc.useModule('ti.sysbios.family.arm.a9.Cache');
 *  Cache.enableL2Interrupt = true;
 *  Cache.l2InterruptFunc = '&cacheIntHandler';
 *  @p
 *
 *  C source file:
 *  @p(code)
 *  ...
 *
 *  Void cacheIntHandler(UArg arg0)
 *  {
 *      System_printf("Interrupt Mask: %u \n", arg0);
 *  }
 *  @p
 *
 *  Notes:
 *  @p(blist)
 *      - See the {@link http://infocenter.arm.com/help/topic/com.arm.doc.ddi0406c/index.html ARM v7AR Architecture Reference Manual} and {@link http://infocenter.arm.com/help/topic/com.arm.doc.subset.primecell.system/index.html#pl310 ARM PL310 Cache Controller Reference Manual} for more info.
 *  @p
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
 *    <tr><td> {@link #configureL2EventCounter}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disable}     </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disableL1Prefetch}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disableL2EventCounters}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enable}      </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enableL1Prefetch}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enableL2EventCounters}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #resetL2EventCounter}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getL2EventCount}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getL2PrefetchControl}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setL2PrefetchControl}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getL2AuxControlReg}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setL2AuxControlReg}     </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #inv}         </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #invL1dAll}   </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #invL1pAll}   </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #invL2All}   </td><td>   Y    </td><td>   Y    </td>
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
    /*! Lists of bitmask for event counter interrupt generation types */
    enum L2CounterIntType {
        L2CounterIntType_DISABLED,  /*! Disabled                           */
        L2CounterIntType_INCREMENT, /*! Interrupt generated on counter
                                        increment                          */
        L2CounterIntType_OVERFLOW   /*! Interrupt generated on counter
                                        overflow                           */
    };

    /*! Lists of bitmask for event sources to the L2 Cache event counter */
    enum L2EventSource {
        L2EventSource_DISABLED = 0,  /*! Counter Disabled.                    */
        L2EventSource_CO = 4,        /*! Eviction of a line from the L2 cache */
        L2EventSource_DRHIT = 8,     /*! Data read hit in the L2 cache.       */
        L2EventSource_DRREQ = 12,    /*! Data read lookup to the L2 cache.
                                         Results in a hit or miss.            */
        L2EventSource_DWHIT = 16,    /*! Data write hit in the L2 cache.      */
        L2EventSource_DWREQ = 20,    /*! Data write lookup to the L2 cache.
                                         Results in a hit or miss.            */
        L2EventSource_DWTREQ = 24,   /*! Data write lookup to L2 cache with
                                         Write-Through attribute. Results in
                                         a hit or miss.                       */
        L2EventSource_IRHIT = 28,    /*! Instruction read hit in the L2 cache */
        L2EventSource_IRREQ = 32,    /*! Instruction read lookup to the L2
                                         cache. Results in a hit or miss.     */
        L2EventSource_WA = 36,       /*! Allocation into L2 cache caused by a
                                         write, with Write-Allocate attribute.
                                         Result of a cache miss.              */
        L2EventSource_IPFALLOC = 40, /*! Allocation of a prefetch generated by
                                         L2 cache controller into L2 cache.   */
        L2EventSource_EPFHIT = 44,   /*! Prefetch hint hits in the L2 cache.  */
        L2EventSource_EPFALLOC = 48, /*! Prefetch hint allocated into L2
                                         cache.                               */
        L2EventSource_SRRCVD = 52,   /*! Speculative read received by slave
                                         port S0/1.                           */
        L2EventSource_SRCONF = 56,   /*! Speculative read confirmed in slave
                                         port S0/1.                           */
        L2EventSource_EPFRCVD = 60   /*! Prefetch hint received by slave port
                                         S0/1.                                */
    };

    /*!
     *  ======== sizeL1dCacheLine ========
     *  Size of L1 data cache Line
     */
    const UInt sizeL1dCacheLine = 32;

    /*!
     *  ======== sizeL1pCacheLine ========
     *  Size of L1 program cache Line
     */
    const UInt sizeL1pCacheLine = 32;
    
    /*!
     *  ======== sizeL2CacheLine ========
     *  Size of L2 cache Line
     */
    const UInt sizeL2CacheLine = 32;

    /*! Cache interrupt handler function type definition. */
    typedef Void (*CacheIntHandlerFuncPtr)(UArg);

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
     *  ======== ErrorStatusView ========
     *  @_nodoc
     */
    metaonly struct ErrorStatusView {
        String      DecodeError;
        String      DataRAMReadError;
        String      TagRAMReadError;
        String      DataRAMWriteError;
        String      TagRAMWriteError;
        String      DataRAMParityError;
        String      TagRAMParityError;
        String      SlaveError;
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
                                  structName: 'WayInfoView'}],
                ['L2 Error Status', { type: ViewInfo.MODULE_DATA,
                                  viewInitFxn: 'viewInitErrorStatus',
                                  structName: 'ErrorStatusView'}]
            ]
        });

    /*!
     *  ======== A_badBlockLength ========
     *  Asserted in Cache_lock (see {@link #lock Cache_lock} for more info).
     */
    config Assert.Id A_badBlockLength = {
        msg: "A_badBlockLength: Block length too large. Must be <= L2 way size."
    };

    /*!
     *  ======== A_blockCrossesPage ========
     *  Asserted in Cache_lock (see {@link #lock Cache_lock} for more info).
     */
    config Assert.Id A_blockCrossesPage = {
        msg: "A_blockCrossesPage: Memory block crosses L2 way page boundary."
    };

    /*!
     *  ======== A_badInvCallWithL2En ========
     *  Assert raised when Cache invalidate called with L2 enabled
     */
    config xdc.runtime.Assert.Id A_badInvCallWithL2En  = {
        msg: "A_badInvCallWithL2En: Cannot call cache Invalidate with L2 cache enabled."
    };

    /*!
     *  ======== A_noNonSecureInterruptAccess ========
     *  Assert raised when enableL2CacheInterruot is set to true, but interrupt
     *  control through non-secure access is not allowed.
     */
    config xdc.runtime.Assert.Id A_noNonSecureInterruptAccess  = {
        msg: "A_noNonSecureInterruptAccess: Non-secure interrupt access control disabled."
    };

    /*!
     *  ======== A_noNonSecureLockdown ========
     *  Assert raised when Cache_lock() called but non-secure lockdown is not
     *  enabled.
     */
    config xdc.runtime.Assert.Id A_noNonSecureLockdown  = {
        msg: "A_noNonSecureLockdown: Non-secure lockdown is not enabled."
    };

    /*!
     *  ======== A_invalidL2CounterId ========
     *  Assert raised when invalid counter id passed to L2 cache event counter
     *  APIs.
     */
    config xdc.runtime.Assert.Id A_invalidL2CounterId  = {
        msg: "A_invalidL2CounterId: Invalid L2 cache event counter Id passed."
    };

    /*!
     *  ======== A_badL2CacheOperation ========
     *  Assert raised when attempting to perform a L2 Cache maintenance
     *  operation with L2 configured as SRAM memory.
     */
    config xdc.runtime.Assert.Id A_badL2CacheOperation  = {
        msg: "A_badL2CacheOperation: Cannot perform L2 Cache maintenance when L2 configured as SRAM."
    };

    /*!
     *  ======== A_l1PrefetchApiNotSupported ========
     *  Assert raised when an unsupported API is called.
     */
    config xdc.runtime.Assert.Id A_l1PrefetchApiNotSupported  = {
        msg: "A_l1PrefetchApiNotSupported: Cache_enableL1Prefetch()/Cache_disableL1Prefetch() APIs not supported on this device."
    };

    /*!
     *  ======== enableCache ========
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
     *  ======== unlockL2Cache ========
     *  Unlock all L2 cache ways at startup, default is true.
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
     *  ======== branchPredictionEnabled ========
     *  Enable Branch Prediction at startup, default is true.
     *
     *  This flag controls whether Branch Prediction should be automatically
     *  enabled or disabled during system startup.
     *
     *  @a(NOTE)
     *  Upon reset, the A9's Program Flow Prediction (Branch Prediction) 
     *  feature is disabled.
     */
    config Bool branchPredictionEnabled = true;

    /*!
     *  ======== configureL2Sram ========
     *  Configure L2 as cache or SRAM memory
     *
     *  By default, when the device resets, it will be set
     *  as cache. If this parameter is set to "true",
     *  L2 cache will be configured as SRAM memory during
     *  startup.
     *
     *  @a(NOTE)
     *  This config param is only supported on AM437X.
     */
    config Bool configureL2Sram = false;

    /*!
     *  @_nodoc
     *  ======== controlModuleReg ========
     *  Base address of Control Module registers
     */
    config Ptr controlModuleReg = null;

    /*!
     *  ======== enableL2Interrupt ========
     *  This flag controls whether L2 Cache Controller interrupt is enabled.
     *  (default is true)
     *
     *  If this flag is enabled, this cache module will enable all L2 cache
     *  controller interrupts and register a L2 cache interrupt handler that
     *  will call the l2InterruptFunc if a callback function is registered.
     *  The callback function is passed the contents of the Masked Interrupt
     *  Status Register.
     *
     *  The L2 cache interrupt handler will detect any L2 cache errors
     *  and the errors will be visible in this module's ROV view. The handler
     *  also ackowledges the interrupt.
     */
    config Bool enableL2Interrupt = true;

    /*!
     *  ======== l2DataPrefetchEnable ========
     *  Enable L2 Data prefetching
     */
    config Bool l2DataPrefetchEnable = true;

    /*!
     *  ======== l2InstructionPrefetchEnable ========
     *  Enable L2 Instruction prefetching
     */
    config Bool l2InstructionPrefetchEnable = true;

    /*!
     *  ======== l2PrefetchDropEnable ========
     *  Enable L2 prefetch drop
     *
     *  @a(NOTE)
     *  This config param is only supported on AM437X.
     */
    config Bool l2PrefetchDropEnable = false;

    /*!
     *  ======== l2DoubleLinefillEnable ========
     *  Enable L2 Double Linefill
     *
     *  @a(NOTE)
     *  This config param is only supported on AM437X.
     */
    config Bool l2DoubleLinefillEnable = true;

    /*!
     *  ======== l2WrapDoubleLinefillEnable ========
     *  Enable L2 Double Linefill on Wrapping reads
     *
     *  @a(NOTE)
     *  This config param is only supported on AM437X.
     */
    config Bool l2WrapDoubleLinefillEnable = false;

    /*!
     *  ======== l2IncrDoubleLinefillEnable ========
     *  Enable L2 Double Linefill on Incrementing reads
     *
     *  @a(NOTE)
     *  This config param is only supported on AM437X.
     */
    config Bool l2IncrDoubleLinefillEnable = false;

    /*!
     *  ======== l2PrefetchOffset ========
     *  Prefetch offset for subsequent cache line prefetches
     *
     *  L2C-310 supports offset values of 0-7, 15, 23 and 31 only.
     *
     *  @a(NOTE)
     *  This field has affect only if L2 data/instruction
     *  prefetching is enabled.
     */
    config UInt8 l2PrefetchOffset = 0;

    /*!
     *  ======== l2InterruptFunc ========
     *  Function called when a L2 cache Interrupt occurs
     *
     *  The function is passed the contents of the Masked Interrupt Status
     *  Register as an argument.
     *
     *  @p(code)
     *  Masked Interrupt Status Register bit assignments
     *   ----------------------------------------------------------------------
     *  |  Bits | Field                                        | Description   |
     *   ----------------------------------------------------------------------
     *  |  31:9 | Reserved                                     | Read as 0     |
     *   ----------------------------------------------------------------------
     *  |   8   | Decode error received on master port from L3 |               |
     *   ------------------------------------------------------                |
     *  |   7   | Slave error received on master port from L3  | A 1 indicates |
     *   ------------------------------------------------------  the status of |
     *  |   6   | Error on L2 data RAM read                    | the input line|
     *   ------------------------------------------------------  triggering    |
     *  |   5   | Error on L2 tag RAM read                     | an interrupt. |
     *   ------------------------------------------------------                |
     *  |   4   | Error on L2 data RAM write                   | A 0 indicates |
     *   ------------------------------------------------------  either no     |
     *  |   3   | Error on L2 tag RAM write                    | interrupt has |
     *   ------------------------------------------------------  been generated|
     *  |   2   | Parity error on L2 data RAM read             | or the        |
     *   ------------------------------------------------------  interrupt is  |
     *  |   1   | Parity error on L2 tag RAM read              | masked.       |
     *   ------------------------------------------------------                |
     *  |   0   | Event counter 0/1 overflow/increment         |               |
     *   ----------------------------------------------------------------------
     *  @p
     */
    config CacheIntHandlerFuncPtr l2InterruptFunc = null;

    /*!
     *  ======== l2InterruptMask ========
     *  L2 cache Interrupt mask
     *
     *  This mask controls which L2 cache Interrupts are enabled when
     *  {@link #enableL2Interrupt} is true. By default, all interrupts
     *  are enabled.
     */
    config UInt32 l2InterruptMask = 0x1FF;

    /*!
     *  PL310 L2 Cache controller registers. Symbol "Cache_l2ControllerRegs"
     *  is a physical device.
     */
    struct L2ControllerRegs {
        UInt32 CACHEID;         /*! 0x000 Cache Id Register */
        UInt32 CACHETYPE;       /*! 0x004 Cache Type Register */
        UInt32 hole0[62];       /*! 0x008-0x0FC */
        UInt32 CONTROL;         /*! 0x100 Control Register */
        UInt32 AUXCONTROL;      /*! 0x104 Auxiliary Control Register */
        UInt32 TAGRAMCONTROL;   /*! 0x108 Tag RAM Latency Control Register */
        UInt32 DATARAMCONTROL;  /*! 0x10C Data RAM Latency Control Register */
        UInt32 hole1[60];       /*! 0x110-0x1FC */
        UInt32 EVCOUNTERCTRL;   /*! 0x200 Event Counter Control Register */
        UInt32 EVCOUNTER1CFG;   /*! 0x204 Event Counter1 Config Register */
        UInt32 EVCOUNTER0CFG;   /*! 0x208 Event Counter0 Config Register */
        UInt32 EVCOUNTER1;      /*! 0x20C Event Counter1 Value Register */
        UInt32 EVCOUNTER0;      /*! 0x210 Event Counter0 Value Register */
        UInt32 INTMASK;         /*! 0x214 Interrupt Mask Register */
        UInt32 INTMASKSTATUS;   /*! 0x218 Interrupt Mask Status Register */
        UInt32 INTRAWSTATUS;    /*! 0x21C Interrupt Raw Status Register */
        UInt32 INTCLEAR;        /*! 0x220 Interrupt Clear Register */
        UInt32 hole2[323];      /*! 0x224-0x72C */
        UInt32 CACHESYNC;       /*! 0x730 Cache Sync Register */
        UInt32 hole3[15];       /*! 0x734-0x76C */
        UInt32 INVPA;           /*! 0x770 Invalidate By Physical Address */
        UInt32 hole4[2];        /*! 0x774-0x778 */
        UInt32 INVWAY;          /*! 0x77C Invalidate By Way Number */
        UInt32 hole5[12];       /*! 0x780-0x7AC */
        UInt32 CLEANPA;         /*! 0x7B0 Clean By Physical Address */
        UInt32 hole6[1];        /*! 0x7B4 */
        UInt32 CLEANINDEX;      /*! 0x7B8 Clean by Set or Way */
        UInt32 CLEANWAY;        /*! 0x7BC Clean by Way */
        UInt32 hole7[12];       /*! 0x7C0-0x7EC */
        UInt32 CLEANINVPA;      /*! 0x7F0 Clean & Invalidate by Phy Address */
        UInt32 hole8[1];        /*! 0x7F4 */
        UInt32 CLEANINVINDEX;   /*! 0x7F8 Clean & Invalidate By Set or Way */
        UInt32 CLEANINVWAY;     /*! 0x7FC Clean & Invalidate By Way */
        UInt32 hole9[64];       /*! 0x800-0x8FC */
        UInt32 LOCKDOWN[16];    /*! 0x900-0x93C D & I Cache Lockdown regs */
        UInt32 hole10[4];       /*! 0x940-0x94C */
        UInt32 LOCKLINEEN;      /*! 0x950 Lock Line Enable */
        UInt32 UNLOCKWAY;       /*! 0x954 Unlock Way */
        UInt32 hole11[170];     /*! 0x958-0xBFC */
        UInt32 ADDRFILTERSTART; /*! 0xC00 Address Filtering Start */
        UInt32 ADDRFILTEREND;   /*! 0xC04 Address Filtering End */
        UInt32 hole12[206];     /*! 0xC08-0xF3C */
        UInt32 DEBUGCTRL;       /*! 0xF40 Debug Register */
        UInt32 hole13[7];       /*! 0xF44-0xF5C */
        UInt32 PREFETCHCTRL;    /*! 0xF60 Prefetch Control Register */
        UInt32 hole14[7];       /*! 0xF64-0xF7C */
        UInt32 POWERCTRL;       /*! 0xF80 Power Control Register */
    };

    extern volatile L2ControllerRegs l2ControllerRegs;

    /*! @_nodoc
     *  ======== getEnabled ========
     *  Get the 'type' bitmask of cache(s) enabled.
     */
    Bits16 getEnabled();

    /*!
     *  ======== wait ========
     *  Backend for `{@link ti.sysbios.hal.Cache#wait()}`
     *
     *  Implementation for this API uses Data Synchronization Barrier (DSB)
     *  ARM instruction.
     *
     *  @see ti.sysbios.hal.Cache#wait
     */
    override Void wait();

    /*!
     *  ======== disable ========
     *  Backend for `{@link ti.sysbios.hal.Cache#disable()}`
     *
     *  @a(Note)
     *  This function disables interrupts while performing L1 and L2 cache
     *  maintenance operations. It can affect interrupt latency and should
     *  not be called unless absolutely necessary.
     *
     *  @see ti.sysbios.hal.Cache#disable
     */
    override Void disable(Bits16 type);

    /*!
     *  ======== wb ========
     *  Backend for `{@link ti.sysbios.hal.Cache#wb()}`
     *
     *  @a(Note)
     *  This function ignores the 'type' argument and does a write-back
     *  on both L1 data and L2 caches.
     *
     *  @see ti.sysbios.hal.Cache#wb
     */
    override Void wb(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait);

    /*!
     *  ======== wbInv ========
     *  Backend for `{@link ti.sysbios.hal.Cache#wbInv()}`
     *
     *  @a(Note)
     *  This function ignores the 'type' argument and does a write-back
     *  invalidate on both L1 data and L2 caches.
     *
     *  @see ti.sysbios.hal.Cache#wbInv
     */
    override Void wbInv(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait);

    /*!
     *  ======== invL1dAll ========
     *  Invalidate all of L1 data cache.
     *
     *  This function should be used with caution.  In general, the
     *  L1 data cache may contain some stack variable or valid data
     *  that should not be invalidated.  This function should be used
     *  only when all contents of L1 data cache are unwanted.
     */
    Void invL1dAll();

    /*!
     *  ======== invL1pAll ========
     *  Invalidate all of L1 program cache.
     */
    Void invL1pAll();
 
    /*!
     *  ======== invL2All ========
     *  Invalidate entire L2 unified cache.
     *
     *  @p(Note)
     *  This function should only be called with the L2 cache disabled.
     *  If called with cache enabled, it will generate an assertion failure.
     */
    Void invL2All();

    /*!
     *  ======== lock ========
     *  Loads and locks a memory block into the L2 cache.
     *
     *  A block of memory is loaded into the L2 cache and
     *  a corresponding L2 cache "way" is locked.
     *
     *  The memory block is loaded into cache one L2 cache line at a time.
     *
     *  The returned key is a bitmask of the L2 cache "way"
     *  used to lock the memory block. This key should be passed in
     *  a subsequent call to {@link #unlock Cache_unlock()} if the memory
     *  block is to be unlocked.
     *
     *  If the key returned is zero, then the lock operation failed
     *  due to insufficient cache "ways" remaining to perform the operation.
     *  The locking algorithm requires at least two unlocked cache ways:
     *  one for the memory block, and one for the locking code itself.
     *
     *  The A9 external L2 cache can be an 8 or 16 way cache. Locking a cache
     *  way consumes 1/8 or 1/16 of the total L2 cache, regardless of the
     *  actual memory block size. For instance, if the size of L2 cache is
     *  256K bytes and the L2 is configured as a 16 way cache, locking ANY size
     *  memory block into a way will tie up 16K bytes of L2 cache.
     *
     *  The byteCnt argument must be less than or equal to an L2 "way"
     *  size. Locking memory blocks larger than a way page size requires
     *  calling this API multiple times. An assert is generated if this rule
     *  is violated.
     *
     *  The memory block must not cross an L2 "way" page boundary.
     *  Locking memory blocks that cross way page boundaries requires
     *  calling this API multiple times. An assert is generated if this rule
     *  is violated.
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
     *  Multiple L2 cache "ways" can be unlocked simultaneously by "or-ing"
     *  together the bitmasks returned from several invocations of Cache_lock().
     *
     *  @param(key)     Key returned by Cache_lock()
     */
    Void unlock(UInt key);

    /*!
     *  ======== enableBP ========
     *  Enable Branch Prediction
     *
     *  Calling this API will enable branch prediction.
     *
     *  @a(NOTE)
     *  Upon reset, the A9's Program Flow Prediction (Branch Prediction) 
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
     *  Upon reset, the A9's Program Flow Prediction (Branch Prediction) 
     *  feature is disabled.
     */
    Void disableBP();

    /*!
     *  ======== enableL2EventCounters ========
     *  Enables the L2 Cache event counters
     */
    Void enableL2EventCounters();

    /*!
     *  ======== disableL2EventCounters ========
     *  Disables the L2 Cache event counters
     */
    Void disableL2EventCounters();

    /*!
     *  ======== resetL2EventCounter ========
     *  Reset the specified L2 Cache event counter
     *
     *  @param(counterId)       Event counter Id (0/1)
     */
    Void resetL2EventCounter(UInt counterId);

    /*!
     *  ======== configureL2EventCounter ========
     *  Sets the event source and interrupt generation type for the specified
     *  L2 Cache event counter
     *
     *  @param(counterId)       Event counter Id (0/1)
     *  @param(eventSource)     Counter event source
     *  @param(interruptType)   Bit mask of event counter interrupt generation
     *                          type
     *
     *  @a(NOTE)
     *  This API disables the event counter before updating the event counter
     *  config registers.
     */
    Void configureL2EventCounter(UInt counterId, L2EventSource eventSource,
        L2CounterIntType interruptType);

    /*!
     *  ======== getL2EventCount ========
     *  Return counter register value for the specified L2 Cache event counter.
     *
     *  @param(counterId)       Event counter Id (0/1)
     *  @b(returns)             Event count
     */
    UInt32 getL2EventCount(UInt counterId);

    /*!
     *  ======== enableL1Prefetch ========
     *  Enable L1 data prefetching
     *
     *  @a(NOTE)
     *  This API is only supported on AM437X.
     */
    Void enableL1Prefetch();

    /*!
     *  ======== disableL1Prefetch ========
     *  Disable L1 data prefetching
     *
     *  @a(NOTE)
     *  This API is only supported on AM437X.
     */
    Void disableL1Prefetch();

    /*!
     *  ======== getL2AuxControlReg ========
     *  Get current L2 Aux Control register contents
     *
     *  Refer {@link http://infocenter.arm.com/help/topic/com.arm.doc.subset.primecell.system/index.html#pl310 ARM PL310 Cache Controller Reference Manual}
     *  for a description of the Auxiliary Control Register.
     */
    Bits32 getL2AuxControlReg();

    /*!
     *  ======== setL2AuxControlReg ========
     *  Set L2 Aux Control register
     *
     *  Refer {@link http://infocenter.arm.com/help/topic/com.arm.doc.subset.primecell.system/index.html#pl310 ARM PL310 Cache Controller Reference Manual}
     *  for a description of the Auxiliary Control Register.
     */
    Void setL2AuxControlReg(Bits32 arg);

    /*!
     *  ======== getL2PrefetchControl ========
     *  Get current L2 prefetch control register contents
     *
     *  Refer {@link http://infocenter.arm.com/help/topic/com.arm.doc.subset.primecell.system/index.html#pl310 ARM PL310 Cache Controller Reference Manual}
     *  for a description of the Prefetch Control Register.
     */
    Bits32 getL2PrefetchControl();

    /*!
     *  ======== setL2PrefetchControl ========
     *  Set L2 prefetch control register
     *
     *  Refer {@link http://infocenter.arm.com/help/topic/com.arm.doc.subset.primecell.system/index.html#pl310 ARM PL310 Cache Controller Reference Manual}
     *  for a description of the Prefetch Control Register.
     */
    Void setL2PrefetchControl(UInt32 regVal);

internal:

    /*!
     *  ======= isOMAP4 ========
     */
    config Bool isOMAP4 = false;

    /*!
     *  ======== l2CacheControllerAddress ========
     *  PL310 L2 cache controller Register base address
     */
    metaonly config Ptr l2CacheControllerAddress;

    /*!
     *  ======== startup ========
     *  startup function to enable cache early during climb-up
     */
    Void startup();

    /*!
     *  ======== disableL1d ========
     *  Disable L1 data cache
     */
    Void disableL1d();

    /*!
     *  ======== disableL1p ========
     *  Disable L1 Program cache
     *
     *  This function performs an invalidate all of L1 program cache
     *  after it disables the cache.
     */
    Void disableL1p();

    /*!
     *  ======== disableL2 ========
     *  Disable L2 Unified Cache
     */
    Void disableL2();

    /*!
     *  ======== disableWbInvL2 ========
     *  Disable, Write-Back and Invalidate L2 Unified Cache
     *
     *  This function first cleans and invalidates the L2 cache and then
     *  disables it.
     */
    Void disableWbInvL2();

    /*!
     *  ======== enableL1d ========
     *  Enable L1 data cache.
     */
    Void enableL1d();

    /*!
     *  ======== enableL1p ========
     *  Enable L1 program cache.
     *
     *  This function performs an invalidate all of L1 program cache
     *  before it enables the cache.
     */
    Void enableL1p();

    /*!
     *  ======== enableL2 ========
     *  Enable L2 Unified Cache
     */
    Void enableL2();

    /*!
     *  ======== initL2Sram ========
     *  Configure L2 as SRAM
     */
    Void initL2Sram();

    /*!
     *  ======== sync ========
     *  Sync L2 cache operation
     */
    Void sync();

    /*!
     *  ======== debugWriteL2 ========
     *  Write L2 debug register
     */
    Void debugWriteL2(UInt32 regVal);

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
     *  ======== invL2 ========
     *  Invalidates range in L2 unified cache.
     */
    Void invL2(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*!
     *  ======== wbL1d ========
     *  Write back range in L1 data cache.
     */
    Void wbL1d(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*!
     *  ======== wbL2 ========
     *  Write back range in L2 unified cache.
     */
    Void wbL2(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*!
     *  ======== wbInvL1d ========
     *  Write back and invalidate range in L1 data cache.
     */
    Void wbInvL1d(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*!
     *  ======== wbInvL2 ========
     *  Write back and invalidate range in L2 unified cache.
     */
    Void wbInvL2(Ptr blockPtr, SizeT byteCnt, Bool wait);

    /*!
     *  ======== invL1dAllInternal ========
     *  Invalidate all of L1 data cache.
     *
     *  This function does not save any registers to avoid data
     *  accesses and cache line buffer fills. This function is
     *  meant for internal use by other cache functions only.
     *
     *  Corrupted Registers: r4, r5, r7, r9, r10 & r11
     *
     *  Cache_invL1dAll() is a wrapper function that saves these
     *  registers and should be called instead of this function.
     */
    Void invL1dAllInternal();

    /*!
     *  ======== wbL1dAll ========
     *  Write back entire L1 data cache.
     */
    Void wbL1dAll();

    /*!
     *  ======== wbL2All ========
     *  Write back entire L2 unified cache.
     */
    Void wbL2All();

    /*!
     *  ======== wbInvL1dAll ========
     *  Write back and Invalidate entire L1 data cache.
     */
    Void wbInvL1dAll();

    /*!
     *  ======== wbInvL2All ========
     *  Write back and Invalidate entire L2 unified cache.
     */
    Void wbInvL2All();

    /*!
     *  ======== getLockdownReg ========
     *  Return current L2 Cache lockdown register value
     */
    Bits32 getLockdownReg();

    /*!
     *  ======== setLockdownReg ========
     *  Set L2 Cache lockdown register
     */
    Void setLockdownReg(Bits32 wayMask);

    /*!
     *  ======== wayLoadLock ========
     *  Lock a block of memory into the L2 cache way specified by 'wayNum'.
     */
    Void wayLoadLock(Ptr blockPtr, SizeT byteCnt, UInt wayNum);

    /*!
     *  ======== setL1Prefetch ========
     *  Enable and disable L1 data prefetching
     *
     *  Pass argument 0x1 to enable prefetching and 0x0 to disable.
     *
     *  @a(NOTE)
     *  This API is only supported on AM437X.
     */
    Void setL1Prefetch(UInt32 regVal);

    /*!
     *  ======== getCacheLevelInfo ========
     *  reads and returns Cache Size Id Register of corresponding Cache level
     *
     *  level values
     *      0 = L1D
     *      1 = L1P
     */
    Bits32 getCacheLevelInfo(UInt level);

    /*!
     *  ======== l2InterruptHandler ========
     *  L2 cache interrupt handler function.
     */
    Void l2InterruptHandler(UArg arg);

    struct Module_State {
        Bits32      l1dInfo;
        Bits32      l1pInfo;
        Bits32      l2Info;
        SizeT       l2WaySize;
        UInt        l2NumWays;
        UInt        l2NumSets;
        Bits32      lockRegister;          /* last write to lock register */
        Hwi.Handle  l2CacheHwi;
        UInt        pl310RTLRelease;
        Bits32      l2ErrorStatus;         /* ORed L2 Interrupt Status Reg */
        Ptr         baseAddresses[16];     /* L2 associativity can be 8 or 16 */
    }
}
