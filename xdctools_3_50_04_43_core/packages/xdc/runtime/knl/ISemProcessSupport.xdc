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
 *  ======== ISemProcessSupport.xdc ========
 */

import xdc.runtime.Error;

/*! 
 *  ======== ISemProcessSupport ========
 *  Interface for OS specific back-end.
 *
 *  The {@link xdc.runtime.knl} package contains modules that provide typical
 *  OS services. These xdc.runtime.knl modules however require proxies to be
 *  bound to an OS specific delegate. This specifies the interface to 
 *  be implemented by the OS specific delegate for 
 *  {@link xdc.runtime.knl#SemProcess} module.
 *
 *  create() takes a 32-bit integer key parameter to be used for identifying
 *  the semaphore to create across processes. For example, for Linux System V
 *  semaphores, the key is necessary so that different processes can access
 *  the same semaphore.
 */
interface ISemProcessSupport inherits ISemaphore
{

instance:

   /*!
    *  ======== create ========
    *  Create a SemProcess object.
    *
    *  This function creates a new `SemProcess` object which is 
    *  initialized to count.  
    *  All semaphores created with the same key reference the same
    *  underlying synchronization object and work between processes.  The
    *  underlying synchronization object should be automatically deleted when
    *  all references to it have been deleted, and the reference count should
    *  be maintained consistently across process forks or similar operations.
    *  An implementation for a platform on which this is technically impossible
    *  (e.g. an operating system that does not support multiple processes) may
    *  provide a 'toy' implementation with behavior matching that of
    *  `{@link ISemProcessSupport}`.
    *
    *  @param(count)    initial semaphore count
    *  @param(key)      globally unique key
    */
    create(Int count, Int key);

}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

