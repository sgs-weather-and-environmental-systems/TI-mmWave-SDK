/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== HeapStd.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Gate.h>
#include <xdc/runtime/Memory.h>
#include "package/internal/HeapStd.xdc.h"

#include <stdlib.h>

/*
 *  ======== HeapStd_Instance_init ========
 *  Initialize the heap object's fields.
 *
 *  If there is not enough RTS heap memory, then fail by raising an error.
 *  The return value is only used by finalize methods which are not defined
 *  for this module.
 */
Int HeapStd_Instance_init(HeapStd_Object *obj, const HeapStd_Params *params,
    Error_Block *eb)
{
    /* Make sure size is non-zero */
    Assert_isTrue((params->size != 0), HeapStd_A_zeroSize);
    
    /* Make sure there is remaining memory in RTS */
    if ((params->size != HeapStd_HEAP_MAX) && (module->remainRTSSize < params->size)) {
       Error_raise(eb, HeapStd_E_noRTSMemory, 0, 0);
    }
    else {
        if (params->size != HeapStd_HEAP_MAX) {
            module->remainRTSSize -= params->size;
        }
    
        obj->remainSize = params->size;
        obj->startSize  = params->size;
    }

    return (0);        /* return status passed to finalize method */
}

/*
 *  ======== HeapStd_alloc ========
 *  This heap uses the 'C' rts malloc call. 
 *
 *  Only support alignment requests that will be honored by malloc.
 */
Ptr HeapStd_alloc(HeapStd_Object *obj, SizeT size, SizeT align, Error_Block *eb)
{
    Char       *alignBuf, *realBuf;
    SizeT      space, realSize, maxAlign;
    IArg       key;

    /* Assert that requested block size is non-zero */
    Assert_isTrue((size != 0), HeapStd_A_zeroSize);

    /* Assert that requested align is a power of 2 */
    Assert_isTrue(((align & (align - 1)) == 0), HeapStd_A_align);

    /* Memory_getMaxDefaultTypeAlign() is the maximum alignment for primitive
     * types, and that's the most restricted alignment that malloc returns.
     * Any smaller alignment requirement (but still power of 2) will be
     * met automatically.
     */
    maxAlign = Memory_getMaxDefaultTypeAlign();
    if (align <= maxAlign) {
        align = maxAlign;
    }

    /* space is needed when one maxAlign is not big enough to fit both buffer
     * displacement and the real size of the buffer.
     */
    if (maxAlign >= 2 * xdc_target__sizeof_Size) {
        space = 0;
    }
    else {
        space = maxAlign;
    }

    /* We add (align + space) to account for two things. The first is the space
     * that can be lost when the pointer returned by malloc is shifted to the
     * closest address with the requested alignment. That space is (align - 
     * maxAlign). We also need two SizeT to have enough space to store the
     * displacement between the address of the buffer returned to the caller
     * and the address of the buffer returned by malloc, and the real size of 
     * the buffer. If maxAlign is large enough for two SizeT, (align + space)
     * becomes align, which fits (align - maxAlign) for shift and maxAlign for
     * two SizeT. If maxAlign can fit only one SizeT, space gives us one more
     * maxAlign.
     * We use the displacement in free() to calculate the right address to
     * supply to the C library's free(). The real size of the buffer is needed
     * to keep track of the available space.
     */
    realSize = size + align + space;

    /* Determine if there is enough memory */
    key = Gate_enterSystem();
    if ((SizeT)(obj->remainSize) < realSize) {
        Gate_leaveSystem(key);
        return (NULL);
    }
    obj->remainSize -= realSize;
    Gate_leaveSystem(key);
    
    /* malloc the buffer! */
    if ((realBuf = malloc(realSize)) == NULL) {
        /* Undo the size change in case of a failure */
        key = Gate_enterSystem();
        obj->remainSize += realSize;
        Gate_leaveSystem(key);
        return (NULL);
    }

    /* Get the aligned address, by zeroing the last N bits, where 2^N==align.
     * This guarantees that there is at least enough space for one SizeT
     * between realBuf and alignBuf.
     */
    alignBuf = uargToPtr(((UArg)(realBuf + align + space) & (~(align - 1))));
    *((SizeT *)alignBuf - 1) = alignBuf - realBuf;
    *(SizeT *)realBuf = realSize;

    return (alignBuf);
}

/*
 *  ======== HeapStd_free ========
 *  Free the memory back and adjust the remaining free accordingly
 */
Void HeapStd_free(HeapStd_Object *obj, Ptr block, SizeT size)
{
    Char    *realBuf, *alignBuf;
    SizeT   realSize;
    IArg    key;

    alignBuf = (Char *)block;
    realBuf = alignBuf - *((SizeT *)alignBuf - 1);
    realSize = *(SizeT *)realBuf;

    free(realBuf);

    key = Gate_enterSystem();
    
    /* Adjust the remaining size */
    obj->remainSize += realSize;    
    
    /* Make sure something fishy is not going on */
    Assert_isTrue((obj->remainSize <= obj->startSize),
        HeapStd_A_invalidTotalFreeSize);
    
    Gate_leaveSystem(key);    
}

/*
 *  ======== HeapStd_isBlocking ========
 */
Bool HeapStd_isBlocking(HeapStd_Object *obj)
{
    return (TRUE);
}

/*
 *  ======== HeapStd_getStats ========
 *  Return the stats.
 */
Void HeapStd_getStats(HeapStd_Object *obj, Memory_Stats *stats)
{
    stats->totalSize         = obj->startSize;
    stats->totalFreeSize     = obj->remainSize;
    stats->largestFreeSize   = 0;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

