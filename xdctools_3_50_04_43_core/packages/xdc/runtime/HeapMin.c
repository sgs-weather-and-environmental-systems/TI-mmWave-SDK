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
 *  ======== HeapMin.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/Gate.h>
#include <xdc/runtime/Memory.h>

#include "package/internal/HeapMin.xdc.h"

/*
 *  ======== HeapMin_Instance_init ========
 *  Set-up the object's fields.
 */
Void HeapMin_Instance_init(HeapMin_Object *obj, const HeapMin_Params *params)
{
    /* Make sure size is non-zero */
    Assert_isTrue((params->size != 0), HeapMin_A_zeroSize);
    
    obj->buf                = params->buf;
    obj->remainSize         = params->size;
    obj->startSize          = params->size;
}

/*
 *  ======== HeapMin_alloc ========
 *  This is a simple growth-only heap. This function returns the current
 *  location of the top of unused buffer.
 */
Ptr HeapMin_alloc(HeapMin_Object *obj, SizeT size, SizeT align,
    Error_Block *eb)
{
    Ptr block;
    IArg key;
    SizeT offset = 0;    

    key = Gate_enterSystem();
    /*
     * If the current buffer is not on the requested alignment, 
     * determine the offset needed.
     */
    if ((UArg)(obj->buf) & (align - 1)) {
        offset = align - ((UArg)(obj->buf) & (align - 1));
    }
    
    /* Make sure there is enough memory.  Must factor in the offset. */
    if (((SizeT)obj->remainSize) < size + offset) {
        Gate_leaveSystem(key);
        return (NULL);
    }
    
    /* Determine the addr based off the current buf and the needed offset. */
    block = obj->buf + offset;
    
    /* Update the two instance fields accordingly */
    obj->remainSize -= (size + offset);
    obj->buf        += (size + offset);    
    Gate_leaveSystem(key);
    
    return (block);
}

/*
 *  ======== HeapMin_free ========
 *  This is a growth-only heap, so free does nothing.
 */
Void HeapMin_free(HeapMin_Object *obj, Ptr block, SizeT size)
{
    if (HeapMin_freeError == TRUE) {
        Error_raise(NULL, HeapMin_E_freeError, 0, 0);
    }
}

/*
 *  ======== HeapMin_isBlocking ======== 
 */
Bool HeapMin_isBlocking(HeapMin_Object *obj)
{
    return (FALSE);
}

/*
 *  ======== HeapMin_getStats ======== 
 *  Return the stats.
 */
Void HeapMin_getStats(HeapMin_Object *obj, Memory_Stats *stats)
{
    stats->totalSize         = obj->startSize;

    /* try to ensure that obj->remainSize is accessed just once to avoid
     * the need for a lock; two reads may result in different values of
     * largestFreeSize and totalFreeSize being observed by the caller
     */
    stats->totalFreeSize     = obj->remainSize;
    stats->largestFreeSize   = stats->totalFreeSize;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

