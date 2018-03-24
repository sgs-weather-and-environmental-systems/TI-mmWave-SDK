/*
 *  ======== MemoryProtect.c ========
 *
 */

#include <xdc/std.h>
#include <xdc/runtime/Startup.h>
#include <ti/sysbios/hal/Hwi.h>
#include <ti/sysbios/family/c64p/Exception.h>

#include "package/internal/MemoryProtect.xdc.h"

#include <c6x.h>  /* for intrinsics like _extu() */

/*
 * EXTRACTBITS extracts the bitfield defined by hibit-lobit (inclusive)
 * from val and shifts the bitfield down to bit 0.
 */
#define EXTRACTBITS(val, hibit, lobit) \
    ( _extu((val), 31 - (hibit), (31 - (hibit)) + (lobit)) )

/*
 *************************************************************************
 *                       Module functions
 *************************************************************************
 */

 /*
 *  ======== MemoryProtect_startup ========
 */
Int MemoryProtect_Module_startup(Int phase)
{
    /*
     *  MemoryProtect uses Exception, needs to wait for its startup.
     */
    if (!Exception_Module_startupDone()) {
        return (Startup_NOTDONE);
    }

    /* Set the Module state controller array */
    MemoryProtect_module->controllers[0] =
        (MemoryProtect_Controller *)&MemoryProtect_umcCtrl;
    MemoryProtect_module->controllers[1] =
        (MemoryProtect_Controller *)&MemoryProtect_umcCtrl;
    MemoryProtect_module->controllers[2] =
        (MemoryProtect_Controller *)&MemoryProtect_dmcCtrl;
    MemoryProtect_module->controllers[3] =
        (MemoryProtect_Controller *)&MemoryProtect_pmcCtrl;
    
    /* okay to proceed with initialization */
    return (Startup_DONE);
}

/*
 *  ======== MemoryProtect_getPA ========
 *  Gets the PA (Permission Attribute) corresponding to addr.
 */
Bool MemoryProtect_getPA(Ptr addr, UInt32 *paMask)
{
    Int mpc;
    UInt page;

    mpc = MemoryProtect_decodeRegion((UInt32)addr, (UInt32)addr, &page, &page);
    
    if (mpc == -1) {
        return (FALSE);
    }
    else {
        *paMask = MemoryProtect_readPA(MemoryProtect_module->controllers[mpc], page);

        return (TRUE);
    }
}

/*
 *  ======== MemoryProtect_getPageSize ========
 *  Gets the MemoryProtect page size corresponding to addr.
 */
Bool MemoryProtect_getPageSize(Ptr addr, UInt *pageSize)
{
    Int size;

    size = MemoryProtect_getAddrPageSize(addr);
    
    if (size == -1) {
        return (FALSE);
    }
    
    *pageSize = size;

    return (TRUE);
}

/*
 *  ======== MemoryProtect_getPrivMode ========
 *  Retrieves the current privilege mode (user/supervisor)
 */
UInt32 MemoryProtect_getPrivMode(Void)
{
    extern cregister volatile UInt TSR;
    UInt tsr;
    UInt priv;

    tsr = TSR;
    priv = tsr & Exception_TSRCXM;
    priv >>= Exception_TSRCXMSHIFT;

    return (priv);
}

/*
 *  ======== MemoryProtect_setPA ========
 *  Sets the PA (Permission Attribute) corresponding to
 *  the memory block defined by addr/size to perm.
 */
Bool MemoryProtect_setPA(Ptr addr, SizeT size, UInt32 paMask)
{
    MemoryProtect_Controller *controller;
    UInt beg, end;
    UInt begPage, endPage;
    Int mpc;
    UInt page;

    /* the beginning address */
    beg = (UInt32)addr;
    
    /* need to subtract 1 from end address since it is "inclusive" */
    end = beg + size - 1;
    
    mpc = MemoryProtect_decodeRegion(beg, end, &begPage, &endPage);
    
    if (mpc == -1) {
        return (FALSE);
    }
    else {
        controller = MemoryProtect_module->controllers[mpc];

        for (page = begPage; page <= endPage; page++) {
            MemoryProtect_writePA(controller, page, paMask);
        }

        return (TRUE);
    }
}

/*
 *************************************************************************
 *                       Internal functions
 *************************************************************************
 */

/*
 *  ======== MemoryProtect_decodeRegion ========
 *  Validate begAddr/endAddr range to be within GEM internal address space.
 *  Return region (UMAP0/UMAP1/DMC/PMC), beginning and ending page numbers if
 *  valid.  Returns -1 if complete address range is not valid.
 */
Int MemoryProtect_decodeRegion(UInt32 begAddr, UInt32 endAddr,
                     UInt32 *begPage, UInt32 *endPage)
{
    MemoryProtect_BitRange begBR, endBR;
    UInt begSpace, endSpace;
    UInt spaceIndex;
    UInt bp, ep;
    UInt br, er;
    UInt begRegionField, endRegionField;
    UInt rc;

    /* transform global address to local and indicate global/local in space */
    if (MemoryProtect_makeLocal(&begAddr, &begSpace) == FALSE ||
        MemoryProtect_makeLocal(&endAddr, &endSpace) == FALSE) {
        /*
         * Either begAddr or endAddr is not a valid global
         * address (all non-global, i.e., local, addresses
         * deemed valid at this point - invalid local address
         * will get flagged later).
         */
        return (-1);
    }

    /* ensure addresses are either both local or both global */
    if (begSpace != endSpace) {
        return (-1);
    }

    /* retrieve "MegaByte (MB)" field and use as index into MPC array */
    begSpace = MemoryProtect_megaByte2MPC[EXTRACTBITS(begAddr, 23, 20)];
    endSpace = MemoryProtect_megaByte2MPC[EXTRACTBITS(endAddr, 23, 20)];

    if (endSpace == MemoryProtect_NONE ||    // no mem behind address range
        endSpace != begSpace) {     // can't span MemoryProtects
        return (-1);
    }

    /*
     * At this point, begSpace and endSpace are equal and set to:
     *    1 for UMAP0
     *    2 for UMAP1
     *    3 for DMC
     *    4 for PMC
     * Subtract 1 to make it zero-based.
     */
    spaceIndex = begSpace - 1;

    /* extract region field (bits 19-15) */
    begRegionField = EXTRACTBITS(begAddr, 19, 15);
    endRegionField = EXTRACTBITS(endAddr, 19, 15);

    if (begRegionField > MemoryProtect_regionEnd[spaceIndex] ||
        endRegionField > MemoryProtect_regionEnd[spaceIndex]) {
        /* addr > end of controller's memory */
        return (-1);
    }

    /* get region 0 ending addr for MPC */
    rc = MemoryProtect_regionCompare[spaceIndex];

    /* assign begin and end regions (0/1) */
    if (rc == 0) {
        /* if regionCompare is 0, there is no region 0 */
        br = er = 1;        /* force region 1 */
    }
    else {
        br = begRegionField > rc;
        er = endRegionField > rc;
    }

    /* get appropriate BitRange for page extraction from addrs */
    begBR = MemoryProtect_regExtMasks[spaceIndex][br];
    endBR = MemoryProtect_regExtMasks[spaceIndex][er];

    /* extract page numbers within region (0-15) for begin and end addrs */
    bp = EXTRACTBITS(begAddr, begBR.msb, begBR.lsb);
    ep = EXTRACTBITS(endAddr, endBR.msb, endBR.lsb);

    /* add 16 to page numbers for region 1 pages */
    *begPage = bp + (br * 16);
    *endPage = ep + (er * 16);

    /* return controller index */
    return (spaceIndex);
}

/*
 *  ======== MemoryProtect_getAddrPageSize ========
 *  Returns the page size corresponding to addr.
 */
Int MemoryProtect_getAddrPageSize(Ptr addr)
{
    Int mpcIndex;
    UInt regionField;
    UInt rc;
    UInt region;
    UInt space;
    MemoryProtect_BitRange bitrange;

    /* transform global address to local and indicate global/local in space */
    if (MemoryProtect_makeLocal((UInt *)&addr, &space) == FALSE) {
        return (-1);
    }

    mpcIndex = MemoryProtect_megaByte2MPC[EXTRACTBITS((UInt)addr, 23, 20)];
    if (mpcIndex == MemoryProtect_NONE) {
        return (-1);
    }

    /* subtract 1 to make it 0-based */
    mpcIndex--;

    regionField = EXTRACTBITS((UInt)addr, 19, 15);
    
    rc = MemoryProtect_regionCompare[mpcIndex];
    if (rc == 0) {
        /* if regionCompare is 0, there is no region 0 */
        region = 1;     /* force region 1 */
    }
    else {
        region = regionField > rc;
    }
    
    bitrange = MemoryProtect_regExtMasks[mpcIndex][region];

    return (1 << bitrange.lsb);
}

/*
 *  ======== MemoryProtect_lock ========
 *  locks the permission attribute table entries for the
 *  specified controller, using the specified key.
 */
Void MemoryProtect_lock(MemoryProtect_Controller *ctrl, MemoryProtect_Key *keyreg)
{
    MemoryProtect_Lock *lock;
    UInt key;

    lock = ctrl->mpLck;

    key = Hwi_disable();

    /* it's illegal to lock the MemoryProtect when already locked */
    if (!(lock->mpLkStat & MemoryProtect_LKSTATLK)) {
        lock->mpLkCmd = MemoryProtect_LCKKEYR;
        /* must write all four key regs exactly once */
        lock->mpLk0 = keyreg->key0;
        lock->mpLk1 = keyreg->key1;
        lock->mpLk2 = keyreg->key2;
        lock->mpLk3 = keyreg->key3;
        lock->mpLkCmd = MemoryProtect_LCKLOCK;
    }

    Hwi_restore(key);
}

/*
 *  ======== MemoryProtect_makeLocal ========
 *  Validate addr to be a GEM internal address & convert addr into
 *  its local address if global.  Returns TRUE if addr is a valid GEM
 *  internal address, and fills space with local/global code (1/0).
 *  Returns FALSE if addr is not a valid GEM internal address.  space
 *  is valid only when TRUE is returned.
 */
Bool MemoryProtect_makeLocal(UInt *addr, UInt *space)
{
    UInt globalBits;
    UInt deviceNum;
    extern cregister volatile UInt DNUM;

    /* extract global address bits (top byte) */
    globalBits = EXTRACTBITS(*addr, 31, 24);
    
    if (globalBits == 0) {
        /* local address */
        deviceNum = 0;

        /* indicate local address */
        *space = 1;
    }
    else {
        /* global address */
        /* construct 0x1N, where N is the core number */
        deviceNum = DNUM | 0x10;

        /* turn off global bits (0x1N) */
        globalBits ^= deviceNum;

        /* put global address bits for this core back in MSB */
        deviceNum <<= 24;

        /* indicate global address */
        *space = 0;
    }

    /*
     * If global address bits match this core's global address bits, or
     * local address, success.
     */
    if (globalBits == 0) {
        /* turn off global address bits to convert to a local address */
        *addr ^= deviceNum;

        return (TRUE);
    }
    else {
        /* not a valid global address for this core */
        return (FALSE);
    }
}

/*
 *  ======== MemoryProtect_readPA ========
 *  MemoryProtect_readPA returns the permission attribute for the specified
 *  page within the specified controller.
 */
UInt32 MemoryProtect_readPA(MemoryProtect_Controller *ctrl, UInt page)
{
    return (ctrl->mppaTab[page]);
}

/*
 *  ======== MemoryProtect_unlock ========
 *  unlocks the permission attribute table entries for the
 *  specified controller, using the specified key.
 */
Void MemoryProtect_unlock(MemoryProtect_Controller *ctrl, MemoryProtect_Key *keyreg)
{
    MemoryProtect_Lock *lock;
    UInt key;

    lock = ctrl->mpLck;

    key = Hwi_disable();

    /* it's illegal to unlock the MemoryProtect when already unlocked */
    if (lock->mpLkStat & MemoryProtect_LKSTATLK) {
        lock->mpLkCmd = MemoryProtect_LCKKEYR;
        /* must write all four key regs exactly once */
        lock->mpLk0 = keyreg->key0;
        lock->mpLk1 = keyreg->key1;
        lock->mpLk2 = keyreg->key2;
        lock->mpLk3 = keyreg->key3;
        lock->mpLkCmd = MemoryProtect_LCKUNLOCK;
    }

    Hwi_restore(key);
}

/*
 *  ======== MemoryProtect_writePA ========
 *  writes the permission attribute perm for the specified
 *  page within the specified controller.  The permission attribute
 *  entries need to be unlocked first and then locked afterwards.
 */
Void MemoryProtect_writePA(MemoryProtect_Controller *ctrl, UInt page, UInt32 perm)
{
    MemoryProtect_unlock(ctrl, (MemoryProtect_Key *)&MemoryProtect_key);

    ctrl->mppaTab[page] = perm;

    MemoryProtect_lock(ctrl, (MemoryProtect_Key *)&MemoryProtect_key);
}
