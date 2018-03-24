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
 *  ======== Mmu.xdc ========
 */

package ti.sysbios.family.shared.vayu;

import xdc.rov.ViewInfo;

import xdc.runtime.Assert;

/*!
 *  ======== Mmu ========
 *  DSP Memory Management Unit (MMU0) Manager.
 *
 *  This module allows the processor to map a virtual address to a
 *  different physical address and enable/disable the MMU.  It does this
 *  through a translation table in memory.  The translation table is
 *  16KB and manages only the first level descriptor table.  Each entry
 *  in the table defines the memory translation of a page of size 1MB
 *  (or 16MB if using supersections).
 *
 *  By default, the MMU translation table is initialized with
 *  entries for every memory segment defined in the platform.
 *  Entries are also added for the peripheral addresses used by
 *  SYS/BIOS (i.e. Timers, Interrupt controller).
 *
 *  The translation table is placed in
 *  an output section called "ti.sysbios.family.shared.vayu.mmuTableSection".
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
 *  for the address range 0x80000000-0x90000000 in the *.cfg file:
 *
 *  @p(code)
 *
 *    var Mmu = xdc.useModule('ti.sysbios.family.shared.vayu.Mmu');
 *
 *    // Enable the MMU
 *    Mmu.enableMMU = true;
 *
 *    // descriptor attribute structure
 *    var attrs = {
 *        type: Mmu.FirstLevelDesc_SECTION,  // SECTION descriptor
 *        supersection: false
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
 *        var sectionName = "ti.sysbios.family.shared.vayu.mmuTableSection";
 *        Program.sectMap[sectionName] = new Program.SectionSpec();
 *        Program.sectMap[sectionName].type = "NOINIT"; // NOLOAD for GNU Tools
 *        Program.sectMap[sectionName].loadSegment = "DDR";
 *    }
 *    else {
 *        print("No DDR memory segment was found");
 *    }
 *
 *  @p
 *
 *  The following is an example of how to add TLB entries and lock them:
 *
 *  @p(code)
 *  #include <ti/sysbios/family/shared/vayu/Mmu.h>
 *
 *  Int main()
 *  {
 *      Int i, j;
 *      Bool ret;
 *
 *      // Add and lock 16 TLB entries. Once the entries are locked, they
 *      // cannot be evicted by the table walking logic when the MMU is enabled.
 *      for (i = 0x90000000, j = 0; j < 16; i+= 0x1000, j++) {
 *          ret = Mmu_writeTLBEntry((Ptr)i, (Ptr)i, Mmu_PageSize_SMALL);
 *          if (!ret) {
 *              // FAILED: Could not lock TLB entry. TLB is full with locked
 *              // entries.
 *              ...
 *          }
 *      }
 *      ...
 *      BIOS_start();
 *  }
 *  @p
 *
 *  The following is an example of how to unlock and clear TLB entries:
 *
 *  @p(code)
 *  #include <ti/sysbios/family/shared/vayu/Mmu.h>
 *
 *  Int func()
 *  {
 *      Int i, j;
 *
 *      // Unlock all TLB entries by setting locked entries base value to 0
 *      Mmu_setTLBLockBaseValue(0);
 *
 *      // Clear (or flush) TLB entries pointed to by given virtual address.
 *      for (i = 0x90000000, j = 0; j < 16; i+= 0x1000, j++) {
 *          Mmu_clearTLBEntry((Ptr)i);
 *      }
 *      ...
 *  }
 *  @p
 *
 *  The following example shows how to add a second level descriptor table:
 *
 *  @p(code)
 *  #include <ti/sysbios/BIOS.h>
 *  #include <ti/sysbios/family/shared/vayu/Mmu.h>
 *
 *  #define MMU_LEVEL2DESC_LARGEPAGE    0x1
 *  #define MMU_LEVEL2DESC_SMALLPAGE    0x2
 *
 *  #pragma DATA_ALIGN(mmuL2Table, 4096);    // align to 4KB
 *
 *  UInt32 mmuL2Table[256];
 *
 *  Void main(Int argc, Char * argv[])
 *  {
 *      Mmu_FirstLevelDescAttrs attrs;
 *      Int i, j;
 *
 *      // initialize the second level descriptors
 *      for (i = 0x80000000, j = 0; j < 256; i+= 0x1000, j++) {
 *          mmuL2Table[j] = (i & 0xFFFFF000) | MMU_LEVEL2DESC_SMALLPAGE;
 *
 *          // For large pages use below line instead:
 *          // mmuL2Table[j] = (i & 0xFFFF0000) | MMU_LEVEL2DESC_LARGEPAGE;
 *      }
 *
 *      // first level descriptor properites
 *      Mmu_initDescAttrs(&attrs);
 *      attrs.type = Mmu_FirstLevelDesc_PAGE_TABLE; // set to a page table descriptor
 *
 *      // Set the first level descriptor for the virtual address 0x80000000.
 *      // No need to disable the MMU. The API should internally disable and
 *      // re-enable it.
 *      Mmu_setFirstLevelDesc((Ptr)0x80000000, &mmuL2Table, &attrs);
 *
 *      BIOS_start();
 *  }
 *
 *  ...
 *  @p
 *
 *  Notes:
 *  @p(blist)
 *      -There are size and alignment requirements on the second
 *       level descriptor tables depending on the page size.
 *      -See the SoC Reference Manual for more info.
 *  @p
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
 *    <tr><td> {@link #clearTLBEntry}</td><td>   N    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #disable}    </td><td>   N    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #enable}     </td><td>   N    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #initDescAttrs}   </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #isEnabled}   </td><td>   Y    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setFirstLevelDesc}</td><td>   N    </td><td>   Y    </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setTLBLockBaseValue}</td><td>   N    </td><td>   Y  </td>
 *    <td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #writeTLBEntry}</td><td>   N    </td><td>   Y    </td>
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

@Template ("./Mmu.xdt") /* generate function to init MMU page table */
@ModuleStartup          /* call to initTableBuf() in startup */
@DirectCall

module Mmu
{
    // -------- ROV views --------

    /*! @_nodoc */
    metaonly struct PageView {
        String      Type;
        Ptr         AddrVirtual;
        Ptr         AddrPhysical;
        Ptr         Level2TablePtr;
        Bool        SuperSection;
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
     */
    enum FirstLevelDesc {
        FirstLevelDesc_FAULT = 0,      /*! Virtual address is unmapped     */
        FirstLevelDesc_PAGE_TABLE = 1, /*! Page table addr descriptor      */
        FirstLevelDesc_SECTION = 2     /*! Section descriptor              */
    };

    /*!
     *  Page size
     */
    enum PageSize {
        PageSize_SECTION = 0,          /*! Section (1 MB) */
        PageSize_LARGE = 1,            /*! Large page (64 KB) */
        PageSize_SMALL = 2,            /*! Small page (4 KB) */
        PageSize_SUPERSECTION = 3      /*! Supersection (16 MB) */
    };

    /*!
     *  Structure for setting first level descriptor entries
     *
     *  See the 'Memory Management Units' section of the device TRM for
     *  more details.
     */
    struct FirstLevelDescAttrs {
        FirstLevelDesc type;    /*! first level descriptor type             */
        Bool supersection;      /*! is a supersection                       */
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

    /*!
     *  ======== A_baseValueOutOfRange ========
     *  Assert raised when TLB lock entries base value out of range
     */
    config Assert.Id A_baseValueOutOfRange  = {
        msg: "A_baseValueOutOfRange: TLB lock entries base value out of range"
    };

    /*! default descriptor attributes structure */
    config FirstLevelDescAttrs defaultAttrs = {
        type: FirstLevelDesc_SECTION,   /* SECTION descriptor */
        supersection: false,            /* false by default   */
    };

    /*!
     *  ======== enableMMU ========
     *  Configuration parameter to enable MMU.
     */
    config Bool enableMMU = false;

    /*!
     *  ======== baseAddr ========
     *  MMU base address.
     *
     *  If not specified, will be automatically set at runtime.
     */
    config Regs *baseAddr = null;

    /*!
     *  @_nodoc
     *  MMU Registers.
     */
    struct Regs {
        UInt32 REVISION;            /*! 0x000 */
        UInt32 hole1[3];            /*! 0x004-0x00C */
        UInt32 SYSCONFIG;           /*! 0x010 */
        UInt32 SYSSTATUS;           /*! 0x014 */
        UInt32 IRQSTATUS;           /*! 0x018 */
        UInt32 IRQENABLE;           /*! 0x01C */
        UInt32 hole2[8];            /*! 0x020-0x03C */
        UInt32 WALKING_ST;          /*! 0x040 */
        UInt32 CNTL;                /*! 0x044 */
        UInt32 FAULT_AD;            /*! 0x048 */
        UInt32 TTB;                 /*! 0x04C */
        UInt32 LOCK;                /*! 0x050 */
        UInt32 LD_TLB;              /*! 0x054 */
        UInt32 CAM;                 /*! 0x058 */
        UInt32 RAM;                 /*! 0x05C */
        UInt32 GFLUSH;              /*! 0x060 */
        UInt32 FLUSH_ENTRY;         /*! 0x064 */
        UInt32 READ_CAM;            /*! 0x068 */
        UInt32 READ_RAM;            /*! 0x06C */
        UInt32 EMU_FAULT_AD;        /*! 0x070 */
        UInt32 hole3[3];            /*! 0x074-0x07C */
        UInt32 FAULT_PC;            /*! 0x080 */
        UInt32 FAULT_STATUS;        /*! 0x084 */
        UInt32 GPR;                 /*! 0x088 */
        UInt32 BYPASS_REGION1_ADDR; /*! 0x090 */
        UInt32 BYPASS_REGION1_SIZE; /*! 0x094 */
        UInt32 BYPASS_REGION2_ADDR; /*! 0x098 */
        UInt32 BYPASS_REGION2_SIZE; /*! 0x09C */
        UInt32 BYPASS_REGION3_ADDR; /*! 0x0A0 */
        UInt32 BYPASS_REGION3_SIZE; /*! 0x0A4 */
        UInt32 BYPASS_REGION4_ADDR; /*! 0x0A8 */
        UInt32 BYPASS_REGION4_SIZE; /*! 0x0AC */
    };

    /*!
     *  ======== numTLBEntries ========
     *  Number of TLB Cache entries.
     */
    config UInt numTLBEntries = 32;

    /*!
     *  ======== setFirstLevelDescMeta ========
     *  Statically sets the descriptor for the virtual address.
     *
     *  The first level table entry for the virtual address is mapped
     *  to the physical address or points to the level 2 descriptor
     *  table. The descriptor table is effective when the MMU is enabled.
     *
     *  @param(virtualAddr)  The modified virtual address
     *  @param(phyAddr)      The physical address
     *  @param(attrs)        Pointer to first level descriptor attribute struct
     */
    metaonly Void setFirstLevelDescMeta(Ptr virtualAddr, Ptr phyAddr,
                                        FirstLevelDescAttrs attrs);

    /*!
     *  ======== disable ========
     *  Disables the mmu.
     *
     *  If the MMU is already disabled, then simply return.
     *  Otherwise this function does the following:
     *  If the L1 data cache is enabled, write back invalidate all
     *  of L1 data cache.  If the L1 program cache is enabled,
     *  invalidate all of L1 program cache. This function does not
     *  change the cache L1 data/program settings. If the L2 unified
     *  cache is enabled, it is written back and invalidated.
     *  This function also disables the table walking logic and
     *  performs a global TLB flush. The global TLB flush does not
     *  affect protected TLB entries.
     *
     *  @a(Note)
     *  The MMU hardware does not permit disabling the MMU
     *  while an interrupt is pending. If this API is called with
     *  an interrupt still pending, the MMU will generate an error.
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
     *  data/program cache settings. If the L2 unified cache is
     *  enabled, it is written back and invalidated.
     *  This function also explicitly enables the table walking
     *  logic and performs a global TLB flush. The global TLB
     *  flush does not affect protected TLB entries.
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
     *  @a(Note)
     *  This API internally disables and re-enables the MMU.
     *  Since the MMU hardware does not permit disabling the MMU
     *  while an interrupt is pending, this API should not be called
     *  with any interrupts still pending. It is recommended to
     *  call this function from within main() before calling
     *  BIOS_start().
     *
     *  @param(virtualAddr)  The modified virtual address
     *  @param(phyAddr)      The physical address
     *  @param(attrs)        Pointer to first level descriptor attribute struct
     */
    Void setFirstLevelDesc(Ptr virtualAddr, Ptr phyAddr,
                           FirstLevelDescAttrs *attrs);

    /*!
     *  ======== writeTLBEntry ========
     *  Manually adds a TLB entry and locks it
     *
     *  This function ready the TLB lock base value and uses it to
     *  select a victim TLB entry to write to. Once the new TLB
     *  entry is written, it increments the TLB lock base value to
     *  lock the entry. The TLB entries added using this function
     *  are marked as protected and therefore are not affected by
     *  global TLB flush operations.
     *
     *  @a(Note)
     *  Due to the mechanism used to lock TLB entries, it is
     *  not possible to unlock a random locked TLB entry. All TLB
     *  entries in front need to be unlocked first. For example,
     *  if the first 4 TLB entries (i.e. TLB index 0, 1, 2 & 3) are
     *  locked and the second TLB entry (i.e. TLB index 1) needs to
     *  be unlocked, then the TLB entries with indices 1, 2 & 3
     *  have to all be unlocked in order to unlock TLB entry
     *  with index 1. This can be done by calling
     *  {@link #setTLBLockBaseValue}() function.
     *
     *  @a(Note)
     *  This API internally disables and re-enables the MMU.
     *  Since the MMU hardware does not permit disabling the MMU
     *  while an interrupt is pending, this API should not be called
     *  with any interrupts still pending. It is recommended to
     *  call this function from within main() before calling
     *  BIOS_start().
     *
     *  @param(virtualAddr)  The modified virtual address
     *  @param(phyAddr)      The physical address
     *  @param(size)         TLB page size.
     *  @b(returns)          TRUE - Entry succesfully written and locked, OR,
     *                       FALSE - Write failed. No free TLB entries.
     */
    Bool writeTLBEntry(Ptr virtualAddr, Ptr physicalAddr, PageSize size);

    /*!
     *  ======== clearTLBEntry ========
     *  Clears (or flushes) a TLB entry
     *
     *  This function flushes all TLB entries (including protected
     *  entries) pointed to by the given virtual address. It can be
     *  used to delete a TLB entry after it has been unlocked.
     *
     *  @a(Note)
     *  This API internally disables and re-enables the MMU.
     *  Since the MMU hardware does not permit disabling the MMU
     *  while an interrupt is pending, this API should not be called
     *  with any interrupts still pending.
     *
     *  @param(virtualAddr)  The modified virtual Address
     */
    Void clearTLBEntry(Ptr virtualAddr);

    /*!
     *  ======== setTLBLockBaseValue ========
     *  Sets the TLB locked entries base value to the given value.
     *
     *  First n TLB entries (with n < total number of TLB entries) can be
     *  protected from being overwritten with new translations. n is equal
     *  to the TLB locked entries base value.
     *
     *  This function can be used to unlock TLB entries. Once an
     *  entry is unlocked, it can be cleared using {@link #clearTLBEntry}()
     *  function.
     *
     *  @a(Note)
     *  This API internally disables and re-enables the MMU.
     *  Since the MMU hardware does not permit disabling the MMU
     *  while an interrupt is pending, this API should not be called
     *  with any interrupts still pending.
     *
     *  @param(basevalue)    TLB locked entries base value
     */
    Void setTLBLockBaseValue(UInt basevalue);

internal:

    /*! static array to hold first level dscriptor table */
    metaonly config UInt32 tableBuf[];

    /*!
     *  ======== init ========
     *  initialize mmu registers
     */
    Void init();

    /*! function generated to initialize first level descriptor table */
    Void initTableBuf(UInt32 *mmuTableBuf);

    /*! Module state */
    struct Module_State {
        volatile Regs *regs;
        UInt32        tableBuf[];  /*! 16KB array for first-level descriptors */
    }
}
