/*
 * Copyright (c) 2014-2017, Texas Instruments Incorporated
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
 *
 */

package ti.sysbios.family.c64p;

import xdc.rov.ViewInfo;

import xdc.runtime.Error;

/*!
 *  ======== Cache ========
 *  Cache Module
 *
 *  This Cache module provides C64+ family-specific implementations of the
 *  APIs defined in {@link ti.sysbios.interfaces.ICache ICache}.  It also
 *  provides additional C64+ specific cache functions.
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
 *    <tr><td> {@link #disable}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enable}     </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getMar*}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getMode*}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #getSize*}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #inv}        </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #invL1pAll*} </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setMar*}    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setMode*}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setSize*}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wait}       </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wb}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbAll*}     </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbL1dAll}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbInv}      </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbInvAll}   </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #wbInvL1dAll}</td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td colspan="6"> Definitions: <br />
 *       <ul>
 *         <li> <b>Hwi</b>: API is callable from a Hwi thread. </li>
 *         <li> <b>Swi</b>: API is callable from a Swi thread. </li>
 *         <li> <b>Task</b>: API is callable from a Task thread. </li>
 *         <li> <b>Main</b>: API is callable during any of these phases: </li>
 *           <ul>
 *             <li> In your module startup after this module is started (e.g. Mod_Module_startupDone() returns TRUE). </li>
 *             <li> During xdc.runtime.Startup.lastFxns. </li>
 *             <li> During main().</li>
 *             <li> During BIOS.startupFxns.</li>
 *           </ul>
 *         <li> <b>Startup</b>: API is callable during any of these phases:</li>
 *           <ul>
 *             <li> During xdc.runtime.Startup.firstFxns.</li>
 *             <li> In your module startup before this module is started (e.g. Mod_Module_startupDone() returns FALSE).</li>
 *           </ul>
 *       <li> <b>*</b>: These APIs are intended to be made at initialization time, but are not restricted to this. </li>
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

@ModuleStartup

module Cache inherits ti.sysbios.interfaces.ICache
{
    // -------- Module Types --------

    /*!
     *  ======== ModuleView ========
     *  @_nodoc
     */
    metaonly struct ModuleView {
        String  L1PCacheSize;
        String  L1PMode;
        String  L1DCacheSize;
        String  L1DMode;
        String  L2CacheSize;
        String  L2Mode;
    };

    /*!
     *  ======== MarRegisterView ========
     *  @_nodoc
     */
    metaonly struct MarRegisterView {
        UInt    number;
        Ptr     addr;
        Ptr     startAddrRange;
        Ptr     endAddrRange;
    };

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['Module',
                    {
                        type: ViewInfo.MODULE,
                        viewInitFxn: 'viewInitModule',
                        structName: 'ModuleView'
                    }
                ],
                ['EnableMARs',
                    {
                        type: xdc.rov.ViewInfo.MODULE_DATA,
                        viewInitFxn: 'viewInitMarRegisters',
                        structName: 'MarRegisterView'
                    }
                ]
            ]
        });

    /*! Lists of cache modes for L1/L2 caches */
    enum Mode {
        Mode_FREEZE,    /*! No new cache lines are allocated */
        Mode_BYPASS,    /*! All access result in long-distance access */
        Mode_NORMAL     /*! Normal operation of cache */
    };

    /*! Level 1 cache size type definition. Can be used for both L1D & L1P */
    enum L1Size {
        L1Size_0K = 0,  /*! Amount of cache is 0K, Amount of SRAM is 32K */
        L1Size_4K = 1,  /*! Amount of cache is 4K, Amount of SRAM is 28K */
        L1Size_8K = 2,  /*! Amount of cache is 8K, Amount of SRAM is 24K */
        L1Size_16K = 3, /*! Amount of cache is 16K, Amount of SRAM is 16K */
        L1Size_32K = 4  /*! Amount of cache is 32K, Amount of SRAM is 0K */
    };

    /*! Level 2 cache size type definition. */
    enum L2Size {
        L2Size_0K = 0,   /*! L2 is all SRAM */
        L2Size_32K = 1,  /*! Amount of cache is 32K */
        L2Size_64K = 2,  /*! Amount of cache is 64K */
        L2Size_128K = 3, /*! Amount of cache is 128K */
        L2Size_256K = 4, /*! Amount of cache is 256K */
        L2Size_512K = 5, /*! Amount of cache is 512K */
        L2Size_1024K = 6 /*! Amount of cache is 1024K */
    };

    /*! MAR register setting type definition. */
    enum Mar {
        Mar_DISABLE = 0, /*! The Permit Copy bit of MAR register is disabled */
        Mar_ENABLE = 1   /*! The Permit Copy bit of MAR register is enabled */
    };

    /*! Structure for specifying all cache sizes. */
    struct Size {
        L1Size l1pSize;         /*! L1 Program cache size */
        L1Size l1dSize;         /*! L1 Data data size */
        L2Size l2Size;          /*! L2 cache size */
    };

    /*!
     * Cache sizes.
     *
     * When this parameter is set in user's cfg script, user set cache sizes
     * override those specified by the Cache module or the platform.
     */
    config Size initSize = {
        l1pSize: L1Size_32K,
        l1dSize: L1Size_32K,
        l2Size: L2Size_0K
    };

    /*!
     *  EMIF A configuration address.
     *
     *  By default, this is set to the physical address. On devices with
     *  a MMU where the physical address is mapped to a virtual address,
     *  the virtual address must be specified here.
     */
    config UInt *EMIFA_CFG;

    /*!
     *  EMIF A base register address.
     *
     *  By default, this is set to the emif A base register physical address.
     *  On devices with a MMU where the physical address is mapped to a virtual
     *  address, the virtual address must be specified here.
     */
    config UInt EMIFA_BASE;

    /*!
     *  EMIF A address space length.
     */
    config UInt EMIFA_LENGTH;

    /*!
     *  EMIF B configuration address.
     *
     *  By default, this is set to the physical address. On devices with
     *  a MMU where the physical address is mapped to a virtual address,
     *  the virtual address must be specified here.
     */
    config UInt *EMIFB_CFG;

    /*!
     *  EMIF B base register address.
     *
     *  By default, this is set to the emif B base register physical address.
     *  On devices with a MMU where the physical address is mapped to a virtual
     *  address, the virtual address must be specified here.
     */
    config UInt EMIFB_BASE;

    /*!
     *  EMIF B address space length.
     */
    config UInt EMIFB_LENGTH;

    /*!
     *  EMIF C configuration address.
     *
     *  By default, this is set to the physical address. On devices with
     *  a MMU where the physical address is mapped to a virtual address,
     *  the virtual address must be specified here.
     */
    config UInt *EMIFC_CFG;

    /*!
     *  EMIF C base register address.
     *
     *  By default, this is set to the emif C base register physical address.
     *  On devices with a MMU where the physical address is mapped to a virtual
     *  address, the virtual address must be specified here.
     */
    config UInt EMIFC_BASE;

    /*!
     *  EMIF C address space length.
     */
    config UInt EMIFC_LENGTH;

    /*!
     *  MAR 00 - 31 register bitmask. (for addresses 0x00000000 - 0x1FFFFFFF)
     *
     *  If undefined by the user, this parameter is configured to match the
     *  memory map of the platform.
     *  Each memory region defined in the platform will have all of its
     *  corresponding MAR bits set.
     *
     *  To override the default behavior you must initialize this parameter
     *  in your configuration script:
     *
     *  @p(code)
     *  // disable MAR bits for addresses 0x00000000 to 0x1FFFFFFF
     *  Cache.MAR0_31 = 0x00000000;
     *  @p
     */
    config UInt32 MAR0_31;

    /*!
     *  MAR 32 - 63 register bitmask (for addresses 0x20000000 - 0x3FFFFFFF)
     *
     *  see {@link #MAR0_31} for more info
     */
    config UInt32 MAR32_63;

    /*!
     *  MAR 64 - 95 register bitmask (for addresses 0x40000000 - 0x5FFFFFFF)
     *
     *  see {@link #MAR0_31} for more info
     */
    config UInt32 MAR64_95;

    /*!
     *  MAR 96 - 127 register bitmask (for addresses 0x60000000 - 0x7FFFFFFF)
     *
     *  see {@link #MAR0_31} for more info
     */
    config UInt32 MAR96_127;

    /*!
     *  MAR 128 - 159 register bitmask (for addresses 0x80000000 - 0x9FFFFFFF)
     *
     *  see {@link #MAR0_31} for more info
     */
    config UInt32 MAR128_159;

    /*!
     *  MAR 160 - 191 register bitmask (for addresses 0xA0000000 - 0xBFFFFFFF)
     *
     *  see {@link #MAR0_31} for more info
     */
    config UInt32 MAR160_191;

    /*!
     *  MAR 192 - 223 register bitmask (for addresses 0xC0000000 - 0xDFFFFFFF)
     *
     *  see {@link #MAR0_31} for more info
     */
    config UInt32 MAR192_223;

    /*!
     *  MAR 224 - 255 register bitmask (for addresses 0xE0000000 - 0xFFFFFFFF)
     *
     *  see {@link #MAR0_31} for more info
     */
    config UInt32 MAR224_255;

    /*!
     *  Error raised when invalid L1 cache size defined
     */
    config Error.Id E_invalidL1CacheSize = {
        msg: "E_invalidL1CacheSize: Invalid L1 cache size %d"
    };

    /*!
     *  Error raised when invalid L2 cache size defined
     */
    config Error.Id E_invalidL2CacheSize = {
        msg: "E_invalidL2CacheSize: Invalid L2 cache size %d"
    };

    /*!
     *  ======== disable ========
     *  Disables the 'type' cache(s)
     *
     *  Disabling of L2 cache is currently not supported.
     */
    override Void disable(Bits16 type);

    /*!
     *  ======== setMode ========
     *  Set mode of a cache
     *
     *  @param(type)    bit mask of cache type
     *  @param(mode)    mode of cache
     *
     *  @b(returns)     previous mode of cache
     */
    Mode setMode(Bits16 type, Mode mode);

    /*!
     *  ======== getMode ========
     *  Get mode of a cache
     *
     *  @param(type)     bit mask of cache type
     *  @b(returns)      mode of specified level of cache
     */
    Mode getMode(Bits16 type);

    /*!
     *  ======== setSize ========
     *  Set sizes of all caches
     *
     *  @param(size)    pointer to structure of type Cache_Size
     */
    Void setSize(Size *size);

    /*!
     *  ======== getSize ========
     *  Get sizes of all caches
     *
     *  @param(size)    pointer to structure of type Cache_Size
     */
    Void getSize(Size *size);

    /*!
     *  ======== getMar ========
     *  Get the value of the MAR register defined for the specified
     *  base address
     *
     *  @param(baseAddr)        address for which MAR is requested
     *
     *  @b(returns)     value of MAR register associated with  specified address
     */
    Mar getMar(Ptr baseAddr);

    /*!
     *  ======== setMar ========
     *  Set the MAR register(s) that corresponds to the specified
     *  address range.
     *
     *  @param(baseAddr)        start address for which to set MAR
     *  @param(byteSize)        size (in bytes) of memory block
     *  @param(value)           enum of type Cache_Mar
     */
    Void setMar(Ptr baseAddr, SizeT byteSize, Mar value);

    /*!
     *  ======== inv ========
     *  Invalidate the range of memory within the specified starting address and
     *  byte count.  The range of addresses operated on gets quantized to whole
     *  cache lines in each cache.  All cache lines in range are invalidated in
     *  L1P cache.  All cache lines in range are invalidated in L1D cache.
     *  All cache lines in range are invaliated in L2 cache.
     */
    override Void inv(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait);

    /*!
     *  ======== wb ========
     *  Writes back the range of memory within the specified starting address
     *  and byte count.  The range of addresses operated on gets quantized to
     *  whole cache lines in each cache.  There is no effect on L1P cache.
     *  All cache lines within the range are left valid in L1D cache and the
     *  data within the range in L1D cache will be written back to L2 or
     *  external memory. All cache lines within the range are left valid in
     *  L2 cache and the data within the range in L2 cache will be written back
     *  to external memory.
     */
    override Void wb(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait);

    /*!
     *  ======== wbInv ========
     *  Writes back and invalidates the range of memory within the specified
     *  starting address and byte count.  The range of addresses operated on
     *  gets quantized to whole cache lines in each cache.  All cache lines
     *  within range are invalidated in L1P cache.  All cache lines within the
     *  range are written back to L2 or external and then invalidated in L1D
     *  cache. All cache lines within the range are written back to external
     *  memory and then invalidated in L2 cache.
     */
    override Void wbInv(Ptr blockPtr, SizeT byteCnt, Bits16 type, Bool wait);

    /*!
     *  ======== invL1pAll ========
     *  Invalidate all of L1 Program cache
     *
     *  Performs a global invalidate of L1P cache.
     *  Polls the L1P invalidate register until done.
     */
    Void invL1pAll();

    /*!
     *  ======== wbAll ========
     *  Write back all caches
     *
     *  Perform a global write back.  There is no effect on L1P cache.
     *  All cache lines are left valid in L1D cache and dirty lines in L1D cache
     *  are written back to L2 or external.  All cache lines are left valid in
     *  L2 cache and dirty lines in L2 cache are written back to external.
     *  This function does not wait for write back operation to perculate
     *  through the whole memory system before returing. Call Cache_wait(),
     *  after this function if necessary.
     */
    override Void wbAll();

    /*!
     *  ======== wbL1dAll ========
     *  Write back L1D cache
     *
     *  Perform a global write back of L1D cache. There is no effect on L1P
     *  or L2 cache.  All cache lines are left valid in L1D cache and the
     *  dirty lines in L1D cache are written back to L2 or external.
     *  This function does not wait for write back operation to perculate
     *  through the whole memory system before returing. Call Cache_wait(),
     *  after this function if necessary.
     */
    Void wbL1dAll();

    /*!
     *  ======== wbInvAll ========
     *  Write back invalidate all caches
     *
     *  Performs a global write back and invalidate.  All cache lines are
     *  invalidated in L1P cache.  All dirty cache lines are written back to L2
     *  or external and then invalidated in L1D cache.  All dirty cache lines
     *  are written back to external and then invalidated in L2 cache.
     *  This function does not wait for write back operation to perculate
     *  through the whole memory system before returing. Call Cache_wait(),
     *  after this function if necessary.
     */
    override Void wbInvAll();

    /*!
     *  ======== wbInvL1dAll ========
     *  Write back invalidate L1D cache
     *
     *  Performs a global write back and invalidate of L1D cache.
     *  All dirty cache lines are written back to L2 or
     *  external and then invalidated in L1D cache.
     *  This function does not wait for write back operation to perculate
     *  through the whole memory system before returing. Call Cache_wait(),
     *  after this function if necessary.
     */
    Void wbInvL1dAll();

internal:

    Void all(volatile UInt32 *cacheReg);

    /*
     *  ======== block ========
     *  This internal function used by the block cache APIs.
     */
    Void block(Ptr blockPtr, SizeT byteCnt, Bool wait,
               volatile UInt32 *barReg);

    /*
     *  ======== getL1DInitSize ========
     */
    Void getL1DInitSize(Size *size);

    /*
     *  ======== getL1PInitSize ========
     */
    Void getL1PInitSize(Size *size);

    /*
     *  ======== getL2InitSize ========
     */
    Void getL2InitSize(Size *size);

    /*
     *  ======== marInit ========
     *  This function initializes the MAR registers
     */
    Void marInit(UInt32 mask, UInt32 index);

    /* cache configuration registers */
    const UInt32 L2CFG  = 0x01840000;
    const UInt32 L1PCFG = 0x01840020;
    const UInt32 L1PCC  = 0x01840024;
    const UInt32 L1DCFG = 0x01840040;
    const UInt32 L1DCC  = 0x01840044;
    const UInt32 MAR    = 0x01848000;

    struct Module_State {
        volatile UInt32 *emifAddr;      /*! Emif configuration address */
    }
}
