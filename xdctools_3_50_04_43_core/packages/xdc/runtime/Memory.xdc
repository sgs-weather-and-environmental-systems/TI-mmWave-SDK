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
 *  ======== Memory.xdc ========
 */

/*!
 *  ======== Memory ========
 *  Static and run-time memory manager
 *
 *  All memory allocations are performed either by
 *  `{@link #staticPlace Memory.staticPlace()}` at build time or through
 *  `{@link #alloc Memory_alloc()}` (or its varients `Memory_calloc()`,
 *  `Memory_valloc()`, etc.) at run-time.
 *
 *  Run-time memory management is performed by modules that
 *  implement the `{@link xdc.runtime.IHeap}` interface.  The `Memory` module
 *  itself simply provides a common interface for any variety of system and
 *  application specific memory management policies implemented by `IHeap`
 *  modules; for example, `{@link HeadStd}` and `{@link HeadMin}`.
 *
 *  Heap instances are created statically or dynamically via heap specific
 *  create functions and these instances are then passed as an input
 *  parameter to the `Memory` calls that have a
 *  `{@link xdc.runtime.IHeap#Handle}` parameter.
 */
@DirectCall
module Memory {

    /*!
     *  ======== Q_BLOCKING ========
     *  Blocking quality
     *
     *  `{@link xdc.runtime.IHeap}`s with this "quality" may cause the
     *  calling thread to block; i.e., suspend execution until another thread
     *  leaves the gate.
     */
    const Int Q_BLOCKING = 1;

    /*!
     *  ======== Size ========
     *  Type to be used to specify heap buffer sizes
     */
    typedef UArg Size;

    /*!
     *  ======== Stats ========
     *  Memory heap statistics
     *
     *  This structure defines generic statistics that must be supplied
     *  by each module that implements the `{@link xdc.runtime.IHeap}`
     *  interface.
     *
     *  @field(totalSize)         total size (in MADUs) of heap.
     *  @field(totalFreeSize)     current size (in MADUs) of free memory in
     *                            the heap
     *  @field(largestFreeSize)   current largest contiguous free block
     *                            (in MADUs)
     */
    struct Stats {
        Size totalSize;
        Size totalFreeSize;
        Size largestFreeSize;
    };
     
    /*! @_nodoc */
    @XmlDtd
    metaonly struct Module_View {
        SizeT maxDefaultTypeAlignment;
    };

    /*!
     *  ======== defaultHeapInstance ========
     *  The default heap.
     *
     *  If no heap is specified in the `Memory` module's methods (i.e.
     *  heap == `NULL`) `defaultHeapInstance` is used. If
     *  `defaultHeapInstance` is not set (or set to `null`), a
     *  `{@link xdc.runtime.HeapStd}` heap instance is created and assigned
     *  to this configuration parameter. The size of the heap is determined
     *  by the `{@link #xdc.runtime.HeapStd.HEAP_MAX}` parameter.
     *
     *  By default, all modules are configured with a `null` instance heap.
     *  Instances created by modules with a `null` instance heap are
     *  allocated from the `defaultHeapInstance` heap.
     */
    config IHeap.Handle defaultHeapInstance;

    /*!
     *  ======== defaultHeapSize ========
     *  The size (in target MADUs) of the `defaultHeapInstance`.
     *
     *  This parameters is used when the `{@link #defaultHeapInstance}`
     *  is not configured. 
     */
    metaonly config int defaultHeapSize = 0x1000;

    /*!
     *  ======== alloc ========
     *  Allocate a block of memory from a heap.
     *
     *  @param(heap)    heap from which the memory is allocated
     *
     *                  The `heap` is created by a module that implements
     *                  the `{@link xdc.runtime.IHeap}` interface.
     *                  If `heap` is `NULL`, the 
     *                  `{@link #defaultHeapInstance}` is used.
     *
     *  @param(size)    requested memory block size (in MADUs)
     *  @param(align)   alignment (in MADUs) of the block of memory
     *
     *                  A value of 0 denotes maximum default type alignment.
     *
     *  @param(eb)      pointer to error block
     *
     *  @a(returns)     
     *  If the allocation was successful, `Memory_alloc()` returns non-`NULL` 
     *  pointer to the allocated and uninitialized block; otherwise it returns 
     *  `NULL` and the error block will indicate the cause of the error.     
     */
    Ptr alloc(IHeap.Handle heap, SizeT size, SizeT align, Error.Block *eb);

    /*!
     *  ======== calloc ========
     *  Allocate a block of memory from a heap and zero out the contents.
     *
     *  @param(heap)    heap from which the memory is allocated
     *
     *                  The `heap` is created by a module that implements
     *                  the `{@link xdc.runtime.IHeap}` interface.
     *                  If `heap` is `NULL`, the 
     *                  `{@link #defaultHeapInstance}` is used.
     *
     *  @param(size)    requested memory block size (in MADUs)
     *  @param(align)   alignment (in MADUs) of the block of memory
     *
     *                  A value of 0 denotes maximum default type alignment.
     *
     *  @param(eb)      pointer to error block
     *
     *  @a(returns)
     *  If the allocation was successful, `Memory_calloc()` returns non-`NULL` 
     *  pointer to the allocated and initialized block; otherwise it returns 
     *  `NULL` and the error block will indicate the cause of the error.     
     */
    Ptr calloc(IHeap.Handle heap, SizeT size, SizeT align, Error.Block *eb);

    /*!
     *  ======== free ========
     *  Frees the space if the heap manager offers such functionality.
     *
     *  @param(heap)   heap that the block of memory will be freed back to.
     *
     *                 The `heap` is created by a module that implements
     *                 the `{@link xdc.runtime.IHeap}` interface.
     *                 If `heap` is `NULL`, the 
     *                 `{@link #defaultHeapInstance}` is used.
     *
     *  @param(block)  block of memory to free back to the heap
     *  @param(size)   size (in MADUs) of the block of memory to free.
     *
     */
    Void free(IHeap.Handle heap, Ptr block, SizeT size);
    
    /*!
     *  ======== getStats ========
     *  Obtain statistics from a heap.
     *
     *  @param(heap)    the heap to get the statistics from
     *
     *                  The `heap` is created by a module that implements
     *                  the `{@link xdc.runtime.IHeap}` interface.
     *                  If `heap` is `NULL`, the 
     *                  `{@link #defaultHeapInstance}` is used.
     *
     *  @param(stats)   the output buffer for the returned statistics
     */
    Void getStats(IHeap.Handle heap, Stats *stats);
    
    /*!
     *  ======== query ========
     *  Test for a particular `{@link xdc.runtime.IHeap}` quality.
     *
     *  There currently is only one quality, namely `{@link #Q_BLOCKING}`.
     *
     *  @param(heap)    the heap to query
     *
     *                  The `heap` is created by a module that implements
     *                  the `{@link xdc.runtime.IHeap}` interface.  If `heap`
     *                  is `NULL`, the `{@link #defaultHeapInstance}`
     *                  is queried
     *
     *  @param(qual)    quality to test
     *
     *                   For example: `{@link #Q_BLOCKING}`.
     *
     *  @a(returns)
     *  If `heap` has the `qual` quality, this method returns `TRUE`,
     *  otherwise it returns `FALSE`.
     */
    Bool query(IHeap.Handle heap, Int qual);

    /*!
     *  ======== getMaxDefaultTypeAlignMeta ========
     *  Return the largest alignment required by the target
     *
     *  This method scans the standard base types supported by the current
     *  configuration's target
     *  (`{@link xdc.cfg.Program#build Program.build.target}`) and returns
     *  the largest alignment required for these types.
     *
     *  @a(returns)     Returns target-specific alignment in MADUs. 
     *
     *  @see xdc.bld.ITarget#stdTypes
     */
    metaonly SizeT getMaxDefaultTypeAlignMeta();
    
    /*!
     *  ======== getMaxDefaultTypeAlign ========
     *  Return the largest alignment required by the target
     *
     *  `getMaxDefaultTypeAlign` returns the largest alignment
     *   required for all the standard base types supported by the current
     *  configuration's target
     *  (`{@link xdc.cfg.Program#build Program.build.target}`) 
     *
     *  This is the runtime version of the
     *  `{@link #getMaxDefaultTypeAlignMeta}` function.      
     *
     *  @a(returns)     Returns target-specific alignment in MADUs. 
     *
     *  @see #getMaxDefaultTypeAlignMeta
     */
    SizeT getMaxDefaultTypeAlign();

    /*!
     *  ======== staticPlace ========
     *  Statically places buffers.
     *
     *  This function places the object specified by `obj` into the specified
     *  memory section. The section string is a target-specific name that is
     *  interpreted by the underlying target tool-chain.  In the case of TI
     *  tool-chains, this section can be a subsection (e.g.
     *  ".data:someSection").
     *
     *  The amount of memory that is created for `obj` is dependent on its
     *  size and the value of the property `length`. The length (number
     *  of elements in an array) is set before the `staticPlace()` is called.
     *  For example, setting `obj.length = 5;` before calling `staticPlace()`,
     *  will create `5 * sizeof (obj)` MADUs of memory.
     *
     *  If 0 is specified for the alignment, the allocated buffer is aligned 
     *  as determined by the target toolchain. For instance, if `obj` is an
     *  array of structs that have only 16-bit integers, the alignment would
     *  be on a 16-bit boundary. 
     *
     *  All non-zero alignments must be a power of 2. Not all targets support
     *  directives that allow one to specify alignment. The readonly config
     *  parameter
     *  `{@link xdc.cfg.Program#build Program.build.target.alignDirectiveSupported}`
     *  can be used to determine if the target supports alignment directives. 
     *
     *  @param(obj)     object to place
     *
     *      This object always has the `length` property; `obj.length`
     *      determines the size of the allocated buffer for `obj`
     *
     *  @param(align)   the alignment required by `obj`
     *
     *  @param(section) section name to contain `obj`
     *
     *      This parameter names the section where `obj` will be placed.  If
     *      this parameter is `null`, no explicit placement is done.
     *
     *  @a(returns)
     *  Returns `false` if the alignment request cannot be honored. The `obj` 
     *  is still placed regardless of the return code.
     */
    metaonly Bool staticPlace(any obj, SizeT align, String section);

    /*!
     *  ======== valloc ========
     *  Allocate a block of memory from a heap and initialize the contents
     *  to the value specified.
     *
     *  @param(heap)    heap from which the memory is allocated
     *
     *                  The `heap` is created by a module that implements
     *                  the `{@link xdc.runtime.IHeap}` interface.
     *                  If `heap` is `NULL`, the 
     *                  `{@link #defaultHeapInstance}` is used.
     *
     *  @param(size)    requested memory block size (in MADUs)
     *  @param(align)   alignment (in MADUs) of the block of memory
     *
     *                  A value of 0 denotes maximum default type alignment.
     *
     *  @param(value)   value to initialize the contents of the block
     *  @param(eb)      pointer to error block
     *
     *  @a(returns)
     *  If the allocation was successful, `Memory_valloc()` returns non-`NULL` 
     *  pointer to the allocated and initialized block; otherwise it returns 
     *  `NULL` and the error block will indicate the cause of the error.     
     */
    Ptr valloc(IHeap.Handle heap, SizeT size, SizeT align, Char value, 
               Error.Block *eb);

internal:

    proxy HeapProxy inherits IHeap;

    struct Module_State {
        SizeT maxDefaultTypeAlign;
    }
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

