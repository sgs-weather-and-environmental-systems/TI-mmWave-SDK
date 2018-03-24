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
 *  ======== Memory.c ======== 
 */
 
#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/IHeap.h>

#include "package/internal/Memory.xdc.h"

#include <string.h>

/*
 *  ======== Memory_alloc ========
 *  If eb has an error already set, we preserve the error if we can.  We
 *  could do better by creating a separate error block for the proxy
 *  allocation, but this would cost more than it's worth; the normal case
 *  would pay a constant time overhead for the rare case of allocation
 *  failing when eb already has an error set.
 */
Ptr Memory_alloc(IHeap_Handle heap, SizeT size, SizeT align, Error_Block *eb)
{
    Ptr block;
    Bool prior = Error_check(eb);
    
    /* if align == 0, use default alignment */
    if (align == 0) {
        align = Memory_getMaxDefaultTypeAlign();
    }

    /* allocate using a non-NULL appropriate heap */
    block = Memory_HeapProxy_alloc(heap ? heap : Memory_defaultHeapInstance, 
                        size, align, eb);

    /* if the allocator returned NULL and either
     *     the error was already set or
     *     it didn't set the error
     */
    if (block == NULL && (prior || !Error_check(eb))) {
        Error_raise(eb, Error_E_memory, (IArg)heap, (IArg)size);
    }

    return (block);
}

/*
 *  ======== Memory_calloc ========
 */
Ptr Memory_calloc(IHeap_Handle heap, SizeT size, SizeT align, Error_Block *eb)
{
    /* Call valloc with a value of zero */
    return (Memory_valloc(heap, size, align, 0, eb));
}

/*
 *  ======== Memory_getStats ========
 */
Void Memory_getStats(IHeap_Handle heap, Memory_Stats *stats)
{
    Memory_HeapProxy_getStats(heap ? heap : Memory_defaultHeapInstance, stats);
}

/*
 *  ======== Memory_getMaxDefaultTypeAlign ========
 */
SizeT Memory_getMaxDefaultTypeAlign(Void)
{
    return (module->maxDefaultTypeAlign);
}

/*
 *  ======== Memory_free ========
 */
Void Memory_free(IHeap_Handle heap, Ptr block, SizeT size)
{
    Memory_HeapProxy_free(
        heap ? heap : Memory_defaultHeapInstance, block, size);
}

/*
 *  ======== Memory_query ======== 
 */
Bool Memory_query(IHeap_Handle heap, Int qual)
{
    Bool flag = FALSE;
    
    switch (qual) {
        case Memory_Q_BLOCKING:
            flag = Memory_HeapProxy_isBlocking(
                heap ? heap : Memory_defaultHeapInstance);
            break;
        default: 
            break;
    }
    
    return (flag);
}

/*
 *  ======== Memory_valloc ========
 */
Ptr Memory_valloc(IHeap_Handle heap, SizeT size, SizeT align, Char value, 
                  Error_Block *eb)
{
    Ptr block = Memory_alloc(heap, size, align, eb);
    if (block != NULL) {
        memset(block, value, size);
    }
    return (block);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

