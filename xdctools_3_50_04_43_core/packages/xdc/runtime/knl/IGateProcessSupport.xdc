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
 *  ======== IGateProcessSupport.xdc ========
 */

import xdc.runtime.Error;

/*!
 *  ======== IGateProcessSupport ========
 *  Interface for OS specific back-end.
 *
 *  The {@link xdc.runtime.knl} package contains modules that provide typical
 *  OS services. These xdc.runtime.knl modules require proxies to be
 *  bound to an OS specific delegate. This specifies the interface to 
 *  be implemented by the OS specific delegate for 
 *  {@link xdc.runtime.knl#GateProcess} module.
 *  
 *  The implementation of IGateThreadSupport should try to implement a gate
 *  that supports priority inversion.
 */
interface IGateProcessSupport inherits IGateThreadSupport
{

    /*! Status returned by {@link #getReferenceCount} when there is an error */
    const Int GETREFCOUNT_FAILED = -1;

instance:

    config Int key = -1; /*! globally unique key for SysV-style semaphore */

   /*!
    *  ======== create ========
    *  Create a GateProcess object.
    *
    *  This function creates a new `GateProcess` object which is initialized to
    *  count.  All gates created with the same key reference the same
    *  underlying synchronization object and work between processes.  The
    *  underlying synchronization object should be automatically deleted when
    *  all references to it have been deleted, and the reference count should
    *  An implementation for a platform on which this is technically impossible
    *  (e.g. an operating system that does not support multiple processes) may
    *  provide a 'toy' implemenation with behavior matching that of
    *  IGateProcessSupport.
    */
    override create();

    /*!
     *  ======== getReferenceCount ========
     *  Get the number of processes with references to this Gate.
     *
     *  @param(err)     Pointer to Error.Block
     *  @a(returns)     Returns the number of processes that possess a 
     *          reference to this gate, or GETREFCOUNT_FAILED if an 
     *          error occured.  
     *                  A 'toy' implementation should always return 0.
     */
    Int getReferenceCount(Error.Block* err);

}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

