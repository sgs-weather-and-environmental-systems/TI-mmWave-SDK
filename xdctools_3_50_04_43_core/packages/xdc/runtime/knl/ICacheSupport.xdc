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
 *  ======== ICacheSupport.xdc ========
 */

import xdc.runtime.Error;

/*!
 *  ======== ICacheSupport ========
 *  Interface for OS specific back-end.
 *
 *  The {@link xdc.runtime.knl} package contains modules that provide typical
 *  OS services. These xdc.runtime.knl modules require proxies to be
 *  bound to an OS specific delegate. This specifies the interface to
 *  be implemented by the OS specific delegate for
 *  {@link xdc.runtime.knl#Cache} module.
 *
 */
@DirectCall

interface ICacheSupport
{
    /*!
     *  ======== inv ========
     *  Invalidates range of memory.
     *
     *  Invalidate the range of memory within the specified starting
     *  address and byte count.  The range of addresses operated on
     *  gets quantized to whole cache lines in each cache.  All lines
     *  in range are invalidated for all the 'type' caches.
     *
     *  @param(blockPtr) start address of range to be invalidated
     *  @param(byteCnt)  number of bytes to be invalidated
     *  @param(wait)     wait until the operation is completed
     *  @param(eb)       error block
     *  @a(returns)  true for success; false for error.
     */
    Bool inv(Ptr blockPtr, SizeT byteCnt, Bool wait, Error.Block *eb);

    /*!
     *  ======== wb ========
     *  Writes a range of memory from all cache(s)
     *
     *  Writes the range of memory within the specified starting
     *  address and byte count.  The range of addresses operated on
     *  gets quantized to whole cache lines in each cache.  All lines
     *  within the range are left valid in the 'type' caches and the data
     *  within the range will be written      to the source memory.
     *
     *  @param(blockPtr) start address of range to be invalidated
     *  @param(byteCnt)  number of bytes to be invalidated
     *  @param(wait)     wait until the operation is completed
     *  @param(eb)       error block
     *  @a(returns)  true for success; false for error.
     */
    Bool wb(Ptr blockPtr, SizeT byteCnt, Bool wait, Error.Block *eb);

    /*!
     *  ======== wbInv ========
     *  Writes back and invalidates range fo memory.
     *
     *  Writes and invalidates the range of memory within the
     *  specified starting address and byte count.  The range of
     *  addresses operated on gets quantized to whole cache lines in
     *  each cache.  All lines within the range are written      to the
     *  source memory and then invalidated for all 'type' caches.
     *
     *  @param(blockPtr) start address of range to be invalidated
     *  @param(byteCnt)  number of bytes to be invalidated
     *  @param(wait)     wait until the operation is completed
     *  @param(eb)       error block
     *  @a(returns)  true for success; false for error.
     */
    Bool wbInv(Ptr blockPtr, SizeT byteCnt, Bool wait, Error.Block *eb);

    /*!
     *  ======== wait ========
     *  Wait for a previous cache operation to complete
     *
     *  Wait for the cache wb/wbInv/inv operation to complete.  A cache
     *  operation is not truly complete until it has worked its way
     *  through all buffering and all memory writes have landed in the
     *  source memory.
     *
     *  @a(returns)  true for success; false for error.
     */
    Bool wait(Error.Block *eb);

}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

