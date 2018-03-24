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
 *  ======== HeapStd.xdc ========
 *!  Open Issues:
 *!  - Do not really know the largestFreeSize value in HeapStd_getStats()
 */

/*!
 *  ======== HeapStd ========
 *  Malloc/free based heap implementation.
 *
 *  This heap is based on the ANSI C Standard Library functions
 *  `malloc()` and `free()` and assumes that these functions are thread-safe.
 *  Please refer to the target specific documentation of the ANSI C Standard
 *  Library for details.
 *
 *  The largest free block that can be returned form `malloc()` cannot be
 *  determined. Therefore, the property `largestFreeSize` in
 *  `{@link Memory#Stats}` returned from `{@link #getStats()}` always returns
 *  0.
 *
 *  @a(Constraints)
 *  The `{@link #alloc()}` function only supports alignment requests up to
 *  value returned from
 *  `{@link Memory#getMaxDefaultTypeAlign()}`.
 */

@InstanceInitError  /* instance init can fail, call finalize if so */

module HeapStd inherits xdc.runtime.IHeap {

    /*! @_nodoc */
    @XmlDtd
    metaonly struct Instance_View {
        Ptr             address;
        String          label;
        Memory.Size     remainSize;
        Memory.Size     startSize;
    }

    /*!
     *  ======== HEAP_MAX ========
     *  Maximum heap size of HeapStd
     *
     *  This parameter defines maximum heap size that can be allocated to a
     *  `HeapStd` instance. Using this parameter to create `HeapStd` instances
     *  will disable the internal size checks in `HeapStd` module.
     */
    const SizeT HEAP_MAX = ~0U;

    /*!
     *  ======== E_noRTSMemory ========
     *  Error raised if all the RTS heap is used up
     *
     *  The total size of all `HeapStd` instance allocations added together
     *  cannot exceed the `malloc`/`free` heap size determined by
     *  `{@link xdc.cfg.Program#heap}`.
     */
    config Error.Id E_noRTSMemory = {
        msg: "The RTS heap is used up. Examine Program.heap."
    };

    /*!
     *  ======== A_zeroSize ========
     *  Assert that the `{@link #size}` is non-zero on the create
     */
    config Assert.Id A_zeroSize = {
        msg: "HeapStd_create cannot have a zero size value"
    };

    /*!
     *  ======== A_align ========
     *  Assert that the `{@link #size}` is a power of 2
     */
    config Assert.Id A_align = {
        msg: "HeapStd_alloc alignment must be a power of 2"
    };

    /*!
     *  ======== A_invalidTotalFreeSize ========
     *  Assert that remaining size is less than or equal to starting size.
     *
     *  If this assertion is raised, it means that either incorrect sizes
     *  were passed to `{@link #free}` or multiple calls to `{@link #free}`
     *  were made with the same buffer.
     */
    config Assert.Id A_invalidTotalFreeSize = {
        msg: "HeapStd instance totalFreeSize is greater than starting size"
    };

    /*!
     *  ======== A_invalidAlignment ========
     *  Assert that the alignment argument in alloc is valid
     *  @_nodoc
     *
     *  If this assertion is raised, it means that the requested alignment is
     *  greater than the maximum alignment allowed on the target.
     */
    config Assert.Id A_invalidAlignment = {
        msg: "HeapStd_alloc - requested alignment is greater than allowed"
    };

instance:

    /*!
     *  ======== create ========
     *  Create a `HeapStd` heap
     *
     *  This heap uses the ANSI C Standard Library functions
     *  `malloc()` and `free()` to manage memory and assumes that these
     *  functions are thread-safe.
     *
     *  @see HeapStd#Params
     */
    create();

    /*!
     *  ======== size ========
     *  Size (in MAUs) of the heap.
     *
     *  This parameter specifies the size of the heap managed by a
     *  `HeapStd` instance. `HeapStd` is built upon the ANSI C Standard
     *  Library functions `malloc()` and `free()`.
     *
     *  The total size of all `HeapStd` instance allocations added together
     *  cannot exceed the `malloc`/`free` heap size determined by
     *  `{@link xdc.cfg.Program#heap Program.heap}`.
     *
     *  This is a required parameter. It must be set by the caller. Failure
     *  to do so, will result in a build error for the static create or an
     *  assert for the runtime create.
     */
    config Memory.Size size = 0;

    /*!
     *  ======== alloc ========
     *  Allocates a block of memory from the heap.
     *
     *  @a(Constraints)
     *  The only alignment currently supported is the default
     *  alignment returned by the underlying `malloc()` implementation.
     *  The align value must be less than or equal to the value returned from
     *  `{@link Memory#getMaxDefaultTypeAlign()}`.
     *
     *  @see IHeap#alloc
     */
    override Ptr alloc(SizeT size, SizeT align, Error.Block *eb);

    /*!
     *  ======== isBlocking ========
     *  Returns whether the heap may block during an `HeapStd_alloc()` or
     *  `HeapStd_free()`.
     *
     *  @a(returns)
     *  Since the implementation of the underlaying ANSI C Standard Library
     *  is not known, this function always returns the more restrictive case
     *  which is `TRUE`.
     */
    override Bool isBlocking();

internal:

    struct Module_State {
        Memory.Size remainRTSSize;      /* Remaining size of rts heap      */
    };

    struct Instance_State {
        Memory.Size remainSize;         /* Size of the remaining heap.      */
        Memory.Size startSize;          /* Starting size of the heap.       */
    };
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

