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
 *  ======== HeapMin.xdc ========
 */

import xdc.rov.ViewInfo;

/*!
 *  ======== HeapMin ========
 *  Growth-only based heap implementation.
 *
 *  `HeapMin` is a minimal footprint heap implementation. This module is 
 *  is designed for applications that only create module instances and
 *  generally only allocate memory at runtime, but never delete created
 *  instances or free memory explicitly.
 *  
 *  For configuration-time `HeapMin.create`, the heap is aligned to 
 *  `{@link Memory#getMaxDefaultTypeAlignMeta()}` for those targets that support
 *  static alignment. For targets that do not support static alignment, the
 *  buffer alignment is undefined.
 *
 *  When calling `{@link #create()}` at runtime, the client 
 *  is responsible for aligning the buffer.
 */

module HeapMin inherits xdc.runtime.IHeap {

    /*! @_nodoc */
    @XmlDtd
    metaonly struct BasicView {
        String          label;
        Ptr             buffer;
        Memory.Size     remainSize;
        Memory.Size     startSize;
    }

    /*! @_nodoc */
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo =
        ViewInfo.create({
            viewMap: [
            [
                'Basic',
                {
                    type: ViewInfo.INSTANCE,
                    viewInitFxn: 'viewInitBasic',
                    structName: 'BasicView'
                }
            ],
            ]
        });
    
    /*!
     *  ======== A_zeroSize ========
     *  Assert that the `{@link #size}` is non-zero on the create
     */     
    config Assert.Id A_zeroSize  =
        {msg: "HeapMin_create cannot have a zero size value"};
        
    /*! 
     *  ======== E_freeError ========
     *  Error raised if `{@link #free()}` is called.
     *
     *  This error is only raised if a `{@link #free()}`
     *  is called and `{@link #freeError}` is true.
     */
    config Error.Id E_freeError = {
        msg: "free() invalid in growth-only HeapMin"
    };

    /*!
     *  ======== freeError ========
     *  Flag to control whether `{@link #E_freeError}` is enabled.
     * 
     *  If true, a `{@link #E_freeError}` error occurs when trying 
     *  to free a buffer. 
     *
     *  If false, no error occurs and the `{@link #free()}` does nothing.
     */
    config Bool freeError = true;

instance:

    /*!
     *  ======== align ========
     *  Alignment of the buffer being managed by this heap instance.
     *
     *  In the static HeapMin.create() call, the buffer allocated for the
     *  HeapMin instance will have the alignment specified by this parameter
     *  on targets that support static alignment.
     *
     *  In the dynamic case, the client must supply the buffer, so it is the
     *  client's responsibility to manage the buffer's alignment, and there is
     *  no 'align' parameter.
     *
     *  The specified `align` parameter must be a power of 2.
     *
     *  The default alignment of zero causes the buffer to get aligned using
     *  {@link Memory#getMaxDefaultTypeAlignMeta()}.
     */
    metaonly config SizeT align;

    /*!
     *  ======== create ========
     *  Create a `HeapMin` heap
     *
     *  This heap is a growth-only heap that is intended to be used by
     *  systems that never delete objects or free memory.  Objects can be
     *  created at runtime based on values determined at runtime, but
     *  objects can not be deleted.
     *
     *  @see HeapMin#Params
     */
    create();
    
    /*!
     *  ======== sectionName ========
     *  Section name of the heap
     *
     *  When creating heaps during configuration, this parameter specifies
     *  where the heap's buffer will be placed. This parameter is passed as
     *  the section name in the `{@link Memory#staticPlace}` function.
     *
     *  @see Memory#staticPlace
     */
    metaonly config String sectionName = null;

    /*!
     *  ======== buf ========
     *  Buffer that will be managed by the heap instance.
     *
     *  When creating a heap at runtime, the user must supply the memory
     *  that the heap will manage.  It is up to the caller to align
     *  the buffer as needed.
     *
     *  This parameter is ignored when creating heaps during configuration.
     */
    config Ptr buf = 0;

    /*!
     *  ======== size ========
     *  Size (in MADUs) of the heap.
     *
     *  This parameter specifies the size of the heap managed by a
     *  `HeapMin` instance.  In the static case, a buffer of length `size` 
     *  will be created.  In the dynamic case, `size` specifies the size of 
     *  the buffer (i.e. parameter `buf`) that the caller provides.
     *
     *  This is a required parameter. It must be set by the caller. Failure
     *  to do so, will result in a build error for the static create or an
     *  `{@link #A_zeroSize}` assert for the runtime create.
     */
    config Memory.Size size = 0;
    
    /*!
     *  ======== alloc ========
     *  Allocate a block of memory from the heap.
     *
     *  @a(Constraints)
     *  The alignment must be a power of 2.
     *
     *  @see IHeap#alloc
     */
    override Ptr alloc(SizeT size, SizeT align, Error.Block *eb);    

    /*!
     *  ======== free ========
     *  Free a block of memory back to the heap.
     *
     *  This is a growth only heap. Calling the `HeapMin_free` function
     *  will result in a `{@link #E_freeError}` error unless
     *  `{@link #freeError}` is set to `false`.
     *
     *  @see IHeap#free
     */
    override Void free(Ptr block, SizeT size);
    
    /*!
     *  ======== isBlocking ========
     *  Can this heap block the caller
     *
     *  @a(returns)
     *  `HeapMin` always returns `FALSE` since it never blocks on a
     *  resource.
     */
    override Bool isBlocking();    

internal:

    struct Instance_State {
        Char        buf[];             /* Address of buffer being managed  */
        Memory.Size remainSize;        /* Size of remaining heap           */
        Memory.Size startSize;         /* Size of heap at the start        */
    };
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

