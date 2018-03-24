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
 *  ======== MemoryProtect.xdc ========
 *
 *
 */

package ti.sysbios.family.c64p;

/*!
 *  ======== MemoryProtect ========
 *  MemoryProtect Module
 *
 *  This module provide an API to {@link #getPA() get} and to
 *  {@link #setPA() set} the permission attributes of a memory range.
 *  A memory range can be set to user {@link #MPPA_UX executable}, 
 *  user {@link #MPPA_UW writable}, user {@link #MPPA_UR readable},
 *  supervisor {@link #MPPA_SX executable}, supervisor 
 *  {@link #MPPA_SW writable}, or supervisor {@link #MPPA_SR readable}.
 *  Setting a memory range to only user readable, writable or executable
 *  should be done with caution because BIOS executes in supervisor mode.
 *  Whenever setting the permission attributes of a memory range,
 *  the {@link #MPPA_LOCAL local} CPU access field must be set, if the
 *  local CPU accesses the memory range.  If the local field is not set,
 *  an exception is generated if the CPU tries to access the memory range.
 *
 *  This module is to be used in correlation with the
 *  {@link ti.sysbios.family.c64p.Exception Exception} module.
 *  When this module is in use, external exceptions are enabled by default.
 *  Any memory protection fault which arises generates an exception.
 *  This exception is processed and decoded by the Exception module.
 *
 *  An example of setting Local L2 RAM to be supervisor read-only and
 *  CPU accessible:
 *
 *  @p(code)
 *    UInt32 paMask;
 *    paMask = MemoryProtect_MPPA_LOCAL |
 *             MemoryProtect_MPPA_SR;
 *              
 *    MemoryProtect_setPA((Ptr)0x11800000, 0x40000, paMask);
 *  @p
 *
 *  @p(html)
 *  <h3> Calling Context </h3>
 *  <table border="1" cellpadding="3">
 *    <colgroup span="1"></colgroup> <colgroup span="5" align="center"></colgroup>
 *
 *    <tr><th> Function               </th><th>  Hwi   </th><th>  Swi   </th><th>  Task  </th><th>  Main  </th><th>  Startup  </th></tr>
 *    <!--                                                                                                                 -->
 *    <tr><td> {@link #getPA}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
 *    <tr><td> {@link #setPA}         </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td><td>   Y    </td></tr>
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
 *       </ul>
 *    </td></tr>
 *
 *  </table>
 *  @p
 */

@ModuleStartup
@DirectCall
module MemoryProtect
{
    // -------- Module Types --------

    /* 
     *  MPPA Permission Attribute Register bitmasks.
     */
    const UInt32 MPPA_UX    = 0x00000001;   /*! User mode may execute       */
    const UInt32 MPPA_UW    = 0x00000002;   /*! User mode may write         */
    const UInt32 MPPA_UR    = 0x00000004;   /*! User mode may read          */
    const UInt32 MPPA_SX    = 0x00000008;   /*! Supervisor mode may execute */
    const UInt32 MPPA_SW    = 0x00000010;   /*! Supervisor mode may write   */
    const UInt32 MPPA_SR    = 0x00000020;   /*! Supervisor mode read        */
    const UInt32 MPPA_LOCAL = 0x00000100;   /*! Local CPU may access        */

    /*!
     *  ======== getPA ========
     *  Gets the PA (Permission Attribute) corresponding to addr.
     *
     *  @param(addr)    address of memory location for which the PA applies
     *  @param(paMask)  ptr to location where PA mask for addr is stored
     *
     *  @b(returns)     if address doesn't belong to any configured MPC then
     *                  FALSE, otherwise TRUE and *paMask contains addr's
     *                  MPPA setting
     */
    Bool getPA(Ptr addr, UInt32 *paMask);

    /*!
     *  ======== setPA ========
     *  Sets the PA (Permission Attribute) corresponding to addr/size.
     *
     *  The PA is applied to all addresses that are spanned by the
     *  memory block.
     *
     *  @param(addr)    begin address of memory block for which the PA applies
     *  @param(size)    size of memory block
     *  @param(paMask)  PA mask to assign for the memory block
     *
     *  @b(returns)     if address doesn't belong to any configured MPC then
     *                  FALSE, otherwise TRUE and PA was written to addr's
     *                  MPPA register
     */
    Bool setPA(Ptr addr, SizeT size, UInt32 paMask);

    /*!@_nodoc
     *  ======== getPageSize ========
     *  Gets the page size corresponding to addr.
     *
     *  @param(addr)    address of memory location for which the PA applies
     *  @param(pageSize) pointer to location where the page size is stored
     *
     *  @b(returns)     FALSE - address doesn't belong to any configured MPC
     *                  TRUE - *pageSize contains addr's MPC page size
     */
    Bool getPageSize(Ptr addr, UInt *pageSize);
    
    /*!@_nodoc
     *  ======== getPrivMode ========
     *  Retrieves the current privilege mode
     *
     *  @b(returns)     current privilege mode
     */
    UInt getPrivMode();

    /*!@_nodoc
     *  ======== setPrivMode ========
     *  Sets the privilege mode
     *
     *  @param(mode)    the privilege mode to set
     */
    Void setPrivMode(UInt mode);

    
internal:

    /*!
     *  Struct defining the bit range of an address
     */
    struct BitRange {
        Char msb;
        Char lsb;
    };

    /*!
     *  Each MPC needs to implement MPLCK.
     *  DMC/PMC/UMA all conform to the struct below.
     */
    struct Lock {
        volatile UInt32 mpLk0;      /* lock bits 31-0 */
        volatile UInt32 mpLk1;      /* lock bits 63-32 */
        volatile UInt32 mpLk2;      /* lock bits 95-64 */
        volatile UInt32 mpLk3;      /* lock bits 127-96 */
        volatile UInt32 mpLkCmd;    /* lock command register */
        volatile UInt32 mpLkStat;   /* lock status register */
    };

    /*!
     *  Struct defining the fault registers
     */
    struct Fault {
        volatile UInt32 mpFar;      /* MPC Fault Address Register */
        volatile UInt32 mpFsr;      /* MPC Fault Status Register */
        volatile UInt32 mpFcr;      /* MPC Fault Clear Register */
    };

    /*!
     *  Key represents the 128-bit key used for locking
     *  and unlocking a controller's permission attribute entries.
     *  It is used for writing to the MPLK0-MPLK3 registers.
     */
    struct Key {
        UInt32  key0;       /* bits 0-31 of 128-bit key */
        UInt32  key1;       /* bits 32-63 of 128-bit key */
        UInt32  key2;       /* bits 64-95 of 128-bit key */
        UInt32  key3;       /* bits 96-127 of 128-bit key */
    };

    /*!
     *  Struct defining a controller
     */
    struct Controller {
        Fault   *mpFault;       /* addr of MP Fault registers */
        Lock    *mpLck;         /* addr of MP Lock registers */
        UInt32  *mppaTab;       /* addr of base of MP PA table */
        UInt32  *mpCfg;         /* addr of MP Configuration register */
        UInt32  nPages;         /* # pages in the MPC */
        UInt32  evtNum;         /* Event number for controller */
    };

    /*!
     *  The following values relate to indexing into the module state
     *  controller array.  Subtract 1 from the value before using it as an
     *  index into the 0-based array (NONE isn't used to index the array).
     */
    const UInt NONE  = 0;
    const UInt UMAP0 = 1;
    const UInt UMAP1 = 2;
    const UInt DMC   = 3;
    const UInt PMC   = 4;
    const UInt UMC   = UMAP0;
    
    /*! lock/unlock values */
    const UInt LCKUNLOCK  = 0x00000001;
    const UInt LCKLOCK    = 0x00000002;
    const UInt LCKKEYR    = 0x00000004;
    const UInt LKSTATLK   = 0x00000001;

    /*! The key values used for locking/unlocking PA table */
    config Key key = {
        key0: 0x90abcdef,
        key1: 0x12345678,
        key2: 0x87654321,
        key3: 0xfedcba09
    };

    /*!
     *  Region Extract Masks table indexed by [controller(0-3)][region(0-1)].
     *  The constants used are fixed based on the GEM architecture spec.
     *  They are based on the minimum theoretical page size (lower constant)
     *  and the number of pages (higher constant minus lower constant).
     *  However, in reality, the actual minimum page size is floored at
     *  some minimum (i.e., the "size" parameter can't, per the
     *  HW design spec, be lower than some minimum (2 for DMC/PMC, 6 for UMC).
     */
    config BitRange regExtMasks[4][2];

    /*!
     *  This array is used to map the MegaByte field of an address
     *  (0x00N00000) to the controller that controls that address.
     *  An MPC's address range falls within and is wholy contained
     *  in the MegaByte hex digit.
     */
    config Char megaByte2MPC[16];

    /*!
     *  Array of addresses that mark the begin of region 0 for each MPC.
     *  Each MPC contains two regions (0 & 1), however, the first two
     *  entries correspond to the two "regions" of UMC (UMC_P0 & UMC_P1),
     *  and as such the entries for them are forced to the max address
     *  value such that any compare that uses them will be < them,
     *  thus indicating region 0.
     */
    config UInt regionCompare[4];

    /*!
     *  Array of addresses that mark the end of region 0 for each MPC.
     */
    config UInt regionEnd[4];

    /*! L1 program memory controller */
    config Controller pmcCtrl;
    
    /*! L1 data memory controller */
    config Controller dmcCtrl;

    /*! L2 unified memory controller */
    config Controller umcCtrl;

    /*!
     *  ======== decodeRegion ========
     *  Determine the beginning and end page numbers for region.
     *
     *  Validate begAddr/endAddr range to be within internal address space.
     *  Return region (UMAP0/UMAP1/DMC/PMC), beginning and ending page
     *  numbers if valid.  Returns -1 if complete address range is not valid.
     */
    Int decodeRegion(UInt32 begAddr, UInt32 endAddr,
                     UInt32 *begPage, UInt32 *endPage);

    /*!
     *  ======== getAddrPageSize ========
     *  Returns the page size corresponding to addr.
     */
    Int getAddrPageSize(Ptr addr);

    /*!
     *  ======== lock ========
     *  Locks the permission attribute.
     *
     *  Locks the permission attribute table entries for the
     *  specified controller, using the specified key.
     */
    Void lock(Controller *ctrl, Key *key);
    
    /*!
     *  ======== makeLocal ========
     *  Convert address into a local address
     *
     *  Validate addr to be a GEM internal address & convert addr into
     *  its local address if global.  Returns TRUE if addr is a valid GEM
     *  internal address, and fills space with local/global code (1/0).
     *  Returns FALSE if addr is not a valid GEM internal address.  space
     *  is valid only when TRUE is returned.
     */
    Bool makeLocal(UInt *addr, UInt *space);
    
    /*!
     *  ======== readPA ========
     *  Reads the permission attribute
     *
     *  Returns the permission attribute for the specified
     *  page within the specified controller.
     */
    UInt32 readPA(Controller *ctrl, UInt page);
    
    /*!
     *  ======== unlock ========
     *  Unlocks the permission attribute.
     *
     *  Unlocks the permission attribute table entries for the
     *  specified controller, using the specified key.
     */
    Void unlock(Controller *ctrl, Key *key);

    /*!
     *  ======== writePA ========
     *  Writes the permission attribute
     *
     *  Writes the permission attribute perm for the specified
     *  page within the specified controller.  The permission attribute
     *  entries need to be unlocked first and then locked afterwards.
     */
    Void writePA(Controller *ctrl, UInt page, UInt32 perm);

    /* Module state */
    struct Module_State {
        Controller *controllers[];
    }
}
