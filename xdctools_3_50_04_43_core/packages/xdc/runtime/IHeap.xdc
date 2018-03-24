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
 *  ======== IHeap.xdc ========
 *! - if we ever change the name of this interface, we should change it to
 *!   IMemoryProvider
 */

/*!
 *  ======== IHeap ========
 *  Interface to heap functions.
 *
 *  All heap implementations inherit from this interface.
 *  The implementations can have additional configuration
 *  parmeters and functions.
 *
 */
@DirectCall

interface IHeap {

instance:

    /*!
     *  ======== alloc ========
     *  Allocates a block of memory from the heap.
     *
     *  This method returns a block of memory from the heap.
     *  It is called by the `{@link xdc.runtime.Memory#alloc()}` function.
     *
     *  @param(size)     size (in MADUs) of the block
     *  @param(align)    alignment (in MADUs)  of the block
     *  @param(eb)       pointer to error block
     *
     *  @a(returns)      Returns the address of the allocated memory.
     */
    Ptr alloc(SizeT size, SizeT align, Error.Block *eb);

    /*!
     *  ======== create ========
     *  Create a heap.
     *
     *  See specific `IHeap` implementation for parameters used.
     */
    create();

    /*!
     *  ======== free ========
     *  Free a block of memory back to the heap.
     *
     *  This method gives back a block of memory to a heap.
     *  It is called by the `{@link xdc.runtime.Memory#free()}` function.
     *
     *  @param(block)    non-`NULL` address of allocated block to free
     *  @param(size)     size (in MADUs) of the block of memory to free
     */
    Void free(Ptr block, SizeT size);

    /*!
     *  ======== isBlocking ========
     *  Returns whether the heap may block during an `{@link #alloc()}` or
     *  `{@link #free()}`.
     *
     *  @a(returns)      If the heap might block, `TRUE` is returned.
     *                   If the heap does not block, `FALSE` is returned.
     */
    Bool isBlocking();

    /*!
     *  ======== getStats ========
     *  Retrieve the statistics from the heap.
     *
     *  The caller passes in a pointer to a `{@link xdc.runtime.Memory#Stats}`
     *  structure and `getStats` fills in this structure.
     *
     *  This function is called by the `{@link xdc.runtime.Memory#getStats()}`
     *  function.
     *
     *  @param(stats)    non-`NULL` pointer to an output buffer
     */
    Void getStats(Memory.Stats *stats);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

