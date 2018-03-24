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
 *  ======== Mmu.xdc ========
 */

package ti.sysbios.family.arm.a8;

import xdc.rov.ViewInfo;

import xdc.runtime.Assert;

/*!
 *  ======== Mmu ========
 *  Memory Management Unit Manager.
 *
 *  This module allows the ARM processor to map a virtual address to a
 *  different physical address and enable/disable the MMU.  It does this
 *  through a translation table in memory.  The translation table is
 *  16KB and manages only the first level descriptor table.  Each entry
 *  in the table defines the properties of memory areas of size 1MB.
 *  These properties include memory access permissions, cacheability,
 *  bufferability, and domain access.
 *
 *  By default, the MMU translation table is initialized with
 *  cache-enabled entries for every memory segment defined in the platform.
 *  Cache-disabled entries are also added for the peripheral
 *  addresses used by SYS/BIOS (i.e. Timers, Interrupt controller).
 *
 *  The translation table is placed in
 *  an output section called "ti.sysbios.family.arm.a8.mmuTableSection".
 *  This section is placed into the platform's default dataMemory and
 *  in order to minimize object file size, specified to not be initialized
 *  via the "NOLOAD" type on GNU compilers and "NOINIT" on TI compilers.
 *
 *  This module does not manage the second level descriptor tables.
 *  A 'SECTION' mapped access requires only a first level fetch.  In
 *  this case, there is no need for a second level descriptor table.
 *  A 'PAGE_TABLE' mapped access requires a second level
 *  descriptor table which can be supplied by the user.
 *
 *  The following is an example of how to place the MMU table
 *  and how to enable L1 data + L2 caching for the address range
 *  0x80000000-0x90000000 in the *.cfg file:
 *
 *  @p(code)
 *
 *    // For Cortex-A8
 *    var Cache = xdc.useModule('ti.sysbios.family.arm.a8.Cache');
 *    // For Cortex-A9
 *    var Cache = xdc.useModule('ti.sysbios.family.arm.a9.Cache');
 *
 *    var Mmu = xdc.useModule('ti.sysbios.family.arm.a8.Mmu');
 *
 *    // Enable the cache
 *    Cache.enableCache = true;
 *
 *    // Enable the MMU (Required for L1/L2 data caching)
 *    Mmu.enableMMU = true;
 *
 *    // descriptor attribute structure for marking the memory region
 *    // as normal cacheable memory (write-back and write-allocate)
 *    var attrs = {
 *        type: Mmu.FirstLevelDesc_SECTION,  // SECTION descriptor
 *        tex: 0x1,
 *        bufferable: true,                  // bufferable
 *        cacheable: true,                   // cacheable
 *    };
 *
 *    // Set the descriptor for each entry in the address range
 *    for (var i=0x80000000; i < 0x90000000; i = i + 0x00100000) {
 *        // Each 'SECTION' descriptor entry spans a 1MB address range
 *        Mmu.setFirstLevelDescMeta(i, i, attrs);
 *    }
 *
 *    var memmap = Program.cpu.memoryMap;
 *    var DDR = null;
 *
 *    // Find DDR in memory map
 *    for (var i=0; i < memmap.length; i++) {
 *        if (memmap[i].name == "DDR") {
 *            DDR = memmap[i];
 *        }
 *    }
 *
 *    // Place the MMU table in the DDR memory segment if it exists
 *    if (DDR != null) {
 *        var sectionName = "ti.sysbios.family.arm.a8.mmuTableSection";
 *        Program.sectMap[sectionName] = new Program.SectionSpec();
 *        Program.sectMap[sectionName].type = "NOLOAD"; // NOINIT for TI Tools
 *        Program.sectMap[sectionName].loadSegment = "DDR";
 *    }
 *    else {
 *        print("No DDR memory segment was found");
 *    }
 *
 *  @p
 *
 *  The following example demonstrates how to add a peripheral's address
 *  to the MMU table so that it can be accessed by code at runtime:
 *
 *  @p(code)
 *    // For Cortex-A8
 *    var Cache = xdc.useModule('ti.sysbios.family.arm.a8.Cache');
 *    // For Cortex-A9
 *    var Cache = xdc.useModule('ti.sysbios.family.arm.a9.Cache');
 *
 *    var Mmu = xdc.useModule('ti.sysbios.family.arm.a8.Mmu');
 *
 *    // Enable the cache
 *    Cache.enableCache = true;
 *
 *    // Enable the MMU (Required for L1/L2 data caching)
 *    Mmu.enableMMU = true;
 *
 *    // Force peripheral section to be NON cacheable strongly-ordered memory
 *    var peripheralAttrs = {
 *        type : Mmu.FirstLevelDesc_SECTION, // SECTION descriptor
 *        tex: 0,
 *        bufferable : false,                // bufferable
 *        cacheable  : false,                // cacheable
 *        shareable  : false,                // shareable
 *        noexecute  : true,                 // not executable
 *    };
 *
 *    // Define the base address of the 1 Meg page
 *    // the peripheral resides in.
 *    var peripheralBaseAddr = 0xa0400000;
 *
 *    // Configure the corresponding MMU page descriptor accordingly
 *    Mmu.setFirstLevelDescMeta(peripheralBaseAddr,
 *                              peripheralBaseAddr,
 *                              peripheralAttrs);
 *  @p
 *
 *  @a(Memory region attributes)
 *  Memory regions can be configured as different memory types by setting
 *  the {@link #FirstLevelDescAttrs bufferable},
 *  {@link #FirstLevelDescAttrs cacheable} and {@link #FirstLevelDescAttrs tex}
 *  (type extension) fields of the {@link #FirstLevelDescAttrs} structure
 *  which is passed as an argument to {@link #setFirstLevelDesc}. The three
 *  memory types supported by the hardware are "Normal" (cacheable), "Device"
 *  and "Strongly-ordered" memory. "Device" and "Strongly-ordered" memory
 *  types are recommended for mapping peripheral address space like
 *  memory-mapped registers. These two types ensure that the memory accesses
 *  to the peripheral memory are not performed speculatively, are not repeated
 *  and are performed in order. The "Normal" memory type is recommended for
 *  mapping memory regions storing application code and data.
 *
 *  Here are some common settings for the
 *  {@link #FirstLevelDescAttrs bufferable},
 *  {@link #FirstLevelDescAttrs cacheable} and {@link #FirstLevelDescAttrs tex}
 *  fields to define different memory region types:
 *
 *  @p(code)
 *  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *  + Memory Type                             | bufferable | cacheable | tex +
 *  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *  + Shareable Strongly-ordered memory       |    false   |   false   |  0  +
 *  +-----------------------------------------+------------+-----------+-----+
 *  + Shareable Device memory                 |    true    |   false   |  0  +
 *  +-----------------------------------------+------------+-----------+-----+
 *  + Outer & Inner Non-cacheable             |    false   |   false   |  1  +
 *  +-----------------------------------------+------------+-----------+-----+
 *  + Outer & Inner Write-back Write-allocate |    true    |   true    |  1  +
 *  + cacheable                               |            |           |     +
 *  ++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++++
 *  @p
 *
 *  For an exhaustive list of all different memory type settings and a
 *  detailed explanation of the memory region attributes, please read the
 *  'Short-descriptor translation table format' section of the ARM v7-AR
 *  Architecture Reference Manual issue C.
 *
 *  Notes:
 *  @p(blist)
 *      -The 'Supersection' table descriptor is NOT supported.
 *      -The 'not global' page descriptor setting is NOT supported.
 *      -The 'non-secure' page descriptor setting is NOT supported.
 *      -There are size and alignment requirements on the second
 *       level descriptor tables depending on the page size.
 *      -See the ARM Architecture Reference Manual for more info.
 *  @p
 *
 */

@Template ("./Mmu.xdt") /* generate function to init MMU page table */
@ModuleStartup          /* call to initTableBuf() in startup */
@DirectCall

module Mmu
{
    // -------- ROV views --------

    /*! @_nodoc */
    metaonly struct PageView {
        String      Type;
        String      Tex;
        Ptr         AddrVirtual;
        Ptr         AddrPhysical;
        Ptr         Level2TablePtr;
        Bool        Bufferable;
        Bool        Cacheable;
        Bool        Shareable;
        Bool        Noexecute;
        Bool        NotGlobal;
        String      L1DWritePolicy;
        UInt        IMP;
        UInt        Domain;
        String      Access;
    };

    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
                ['0x0-0x7FFFFFFF', {
                    type: ViewInfo.MODULE_DATA,
                    viewInitFxn: 'viewPages1',
                    structName: 'PageView'
                }],
                ['0x80000000-0x9FFFFFFF', {
                    type: ViewInfo.MODULE_DATA,
                    viewInitFxn: 'viewPages2',
                    structName: 'PageView'
                }],
                ['0xA0000000-0xBFFFFFFF', {
                    type: ViewInfo.MODULE_DATA,
                    viewInitFxn: 'viewPages3',
                    structName: 'PageView'
                }],
                ['0xC0000000-0xDFFFFFFF', {
                    type: ViewInfo.MODULE_DATA,
                    viewInitFxn: 'viewPages4',
                    structName: 'PageView'
                }],
                ['0xE0000000-0xFFFFFFFF', {
                    type: ViewInfo.MODULE_DATA,
                    viewInitFxn: 'viewPages5',
                    structName: 'PageView'
                }]
           ]
       });

    /*!
     *  First Level descriptors
     *
     *  Different descriptor type encodings:
     *  0b00    ->  Invalid or Fault entry
     *  0b01    ->  Page table entry
     *  0b10    ->  Section descriptor
     *  0b11    ->  Reserved
     */
    enum FirstLevelDesc {
        FirstLevelDesc_FAULT = 0,      /*! Virtual address is unmapped     */
        FirstLevelDesc_PAGE_TABLE = 1, /*! Page table addr descriptor      */
        FirstLevelDesc_SECTION = 2,    /*! Section descriptor              */
        FirstLevelDesc_RESERVED = 3    /*! Reserved                        */
    };

    /*!
     *  Structure for setting first level descriptor entries
     *
     *  The B (Bufferable), C (Cacheable), and TEX (Type extension) bits
     *  in the translation table descriptor define the memory region
     *  attributes.
     *
     *  See the 'Short-descriptor translation table format' section of the
     *  ARM v7-AR Architecture Reference Manual issue C for more details.
     */
    struct FirstLevelDescAttrs {
        FirstLevelDesc type;    /*! first level descriptor type             */
        Bool  bufferable;       /*! is memory section bufferable            */
        Bool  cacheable;        /*! is memory section cacheable             */
        Bool  shareable;        /*! is memory section shareable             */
        Bool  noexecute;        /*! is memory section not executable        */
        UInt8 imp;              /*! implementation defined                  */
        UInt8 domain;           /*! domain access control value 0-15        */
        UInt8 accPerm;          /*! access permission bits value 0-7        */
        UInt8 tex;              /*! memory region attr type extension field */
        Bool  notGlobal;        /*! not global bit                          */
    };

    // Asserts

    /*!
     *  ======== A_nullPointer ========
     *  Assert raised when a pointer is null
     */
    config Assert.Id A_nullPointer  = {
        msg: "A_nullPointer: Pointer is null"
    };

    /*!
     *  ======== A_unknownDescType ========
     *  Assert raised when the descriptor type is not recognized.
     */
    config Assert.Id A_unknownDescType = {
        msg: "A_unknownDescType: Descriptor type is not recognized"
    };

    /*! default descriptor attributes structure */
    config FirstLevelDescAttrs defaultAttrs = {
        type: FirstLevelDesc_SECTION,   /* SECTION descriptor */
        bufferable: false,              /* false by default     */
        cacheable: false,               /* false by default     */
        shareable: false,               /* false by default */
        noexecute: false,               /* false by default     */
        imp: 1,                         /* set to 1 for A8/A9 devices */
        domain: 0,                      /* default Domain is 0 */
        accPerm: 3,                     /* allow read/write */
        tex: 1,                         /* 1 by default */
        notGlobal: false                /* global by default */
    };

    /*!
     *  ======== enableMMU ========
     *  Configuration parameter to enable MMU.
     */
    config Bool enableMMU = true;

    /*!
     *  ======== cachePlatformMemory ========
     *  Flag to automatically mark platform's code/data/stack memory as
     *  cacheable in MMU descriptor table
     *
     *  By default, all memory regions defined in the platform an
     *  application is built with are marked as cacheable.
     *
     *  @see xdc.bld.Program#platform
     *
     *  If manual configuration of memory regions is required, set
     *  this config parameter to 'false'.
     */
    metaonly config Bool cachePlatformMemory = true;

    /*!
     *  ======== setFirstLevelDescMeta ========
     *  Statically sets the descriptor for the virtual address.
     *
     *  The first level table entry for the virtual address is mapped
     *  to the physical address with the attributes specified. The
     *  descriptor table is effective when the MMU is enabled.
     *
     *  @param(virtualAddr)  The modified virtual address
     *  @param(phyAddr)      The physical address
     *  @param(attrs)        Pointer to first level descriptor attribute struct
     */
    metaonly Void setFirstLevelDescMeta(Ptr virtualAddr, Ptr phyAddr,
                                        FirstLevelDescAttrs attrs);

    /*!
     *  ======== disable ========
     *  Disables the MMU.
     *
     *  If the MMU is already disabled, then simply return.
     *  Otherwise this function does the following:
     *  If the L1 data cache is enabled, write back invalidate all
     *  of L1 data cache.  If the L1 program cache is enabled,
     *  invalidate all of L1 program cache. This function does not
     *  change the cache L1 data/program settings.
     */
    Void disable();

    /*!
     *  ======== enable ========
     *  Enables the MMU.
     *
     *  If the MMU is already enabled, then simply return.
     *  Otherwise this function does the following:
     *  If the L1 program cache is enabled, invalidate all of L1
     *  program cache.  This function does not change the L1
     *  data/program cache settings.
     */
    Void enable();

    /*!
     *  ======== initDescAttrs() ========
     *  Initializes the first level descriptor attribute structure
     *
     *  @param(attrs)      Pointer to first level descriptor attribute struct
     */
    Void initDescAttrs(FirstLevelDescAttrs *attrs);

    /*!
     *  ======== isEnabled ========
     *  Determines if the MMU is enabled
     */
    Bool isEnabled();

    /*!
     *  ======== setFirstLevelDesc ========
     *  Sets the descriptor for the virtual address.
     *
     *  The first level table entry for the virtual address is mapped
     *  to the physical address with the attributes specified. The
     *  descriptor table is effective when the MMU is enabled.
     *
     *  @param(virtualAddr)  The modified virtual address
     *  @param(phyAddr)      The physical address
     *  @param(attrs)        Pointer to first level descriptor attribute struct
     */
    Void setFirstLevelDesc(Ptr virtualAddr, Ptr phyAddr,
                           FirstLevelDescAttrs *attrs);

    /*!
     *  ======== getPhysicalAddr ========
     *  Returns the translated physical address for the given virtual address.
     *  If the virtual address cannot be translated i.e. the virtual address
     *  would generate a fault if translated, ~(0) is returned.
     *
     *  @param(virtualAddr)  virtual address
     *  @b(returns)          translated physical address
     */
    Ptr getPhysicalAddr(Ptr virtualAddr);

    /*!
     *  @_nodoc
     *  ======== getMmuTableAddr ========
     *  Returns the MMU table base address
     *
     *  @b(returns)          MMU table base address
     */
    Ptr getMmuTableAddr();

    /*!
     *  ======== getDomainAccessCtrlReg ========
     *  Returns the domain access control register value (DACR)
     *
     *  @b(returns)          Domain Access Ctrl Register value
     */
    UInt32 getDomainAccessCtrlReg();

    /*!
     *  ======== setDomainAccessCtrlReg ========
     *  Write the passed argument to domain access control register (DACR)
     *
     *  The domain access control register has 16 2-bit fields to control
     *  the access permissions of each domain.
     *
     *  @p(code)
     *         |31 30|29 28|27 26|25 24|23 22| ... |7   6|5   4|3   2|1   0|
     *          -----------------------------------------------------------
     *  Domain | D15 | D14 | D13 | D12 | D11 | ... | D3  | D2  | D1  |  D0 |
     *          -----------------------------------------------------------
     *
     *  Possible domain access permission value for each field:
     *  0b00   No access. Any domain access will generate a fault.
     *  0b01   Accesses are checked against translation table permission bits.
     *  0b11   No access permission checking is performed for this domain.
     *  @p
     *
     *  @param(regVal)       Contents to be written to DACR register
     */
    Void setDomainAccessCtrlReg(UInt32 regVal);

    /*!
     *  @_nodoc
     *  ======== switchContext ========
     *  Switches the ASID and changes the MMU table base address
     *
     *  Note: This function does not validate the mmuTable pointer
     *
     *  @param(asid)        ASID to switch to
     *  @param(mmuTable)    MMU table base address to switch to
     */
    Void switchContext(UInt8 asid, Ptr mmuTable);

    /*!
     *  @_nodoc
     *  ======== getAsid ========
     *  Returns the current ASID
     *
     *  @b(returns)         Current ASID
     */
    UInt8 getAsid();

    /*!
     *  ======== tlbInvAll ========
     *  Invalidate entire TLB (both data and instruction)
     */
    Void tlbInvAll();

internal:

    /*! static array to hold first level dscriptor table */
    metaonly config UInt32 tableBuf[];

    /*!
     *  ======== init ========
     *  initialize mmu registers
     */
    Void init();

    /*!
     *  ======== enableAsm ========
     *  Assembly function to enable the MMU.
     */
    Void enableAsm();

    /*!
     *  ======== disableAsm ========
     *  Assembly function to disable the MMU.
     */
    Void disableAsm();

    /*! function generated to initialize first level descriptor table */
    Void initTableBuf(UInt32 *mmuTableBuf);

    /*!
     *  ======== getPhysicalAddrI ========
     *  Returns the translated physical address for the given virtual address.
     *  If the virtual address cannot be translated i.e. the virtual address
     *  would generate a fault if translated, ~(0) is returned.
     */
    Ptr getPhysicalAddrI(Ptr virtualAddr);

    /*! Module state */
    struct Module_State {
        UInt32 tableBuf[];      /*! 16KB array for first-level descriptors */
    }
}
