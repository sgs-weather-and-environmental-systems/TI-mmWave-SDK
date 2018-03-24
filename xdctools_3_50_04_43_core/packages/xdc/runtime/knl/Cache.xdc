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
 *  ======== Cache.xdc ========
 */

import xdc.runtime.Error;
import xdc.runtime.knl.ICacheSupport;

/*!
 *  ======== Cache ========
 *  Cache Services
 *
 *  The Cache module provide APIs to allow applications to maintain cache
 *  coherency.
 *
 *  This module will use an OS specific delegate (back-end) to manipulate the
 *  cache.
 *  This module has a module wide config parameter {@link #Proxy} which needs to
 *  be bound to an OS specific delegate before this module can be used.
 *
 *  Here is an example showing how the proxy is bound to an BIOS 6.x specific
 *  delegate.
 *
 *  @p(code)
 *  var Cache = xdc.useModule('xdc.runtime.knl.Cache');
 *  Cache.Proxy = xdc.useModule('ti.sysbios.xdcruntime.CacheSupport');
 *  @p
 *
 *  Typically the package containing the delegates have a Settings module that
 *  will bind all {@link xdc.runtime.knl} proxies. The following
 *  example sets up all the xdc.runtime.knl proxies.
 *
 *  @p(code)
 *  xdc.useModule("ti.sysbios.xdcruntime.Settings");
 *  @p
 */
@DirectCall

module Cache
{
    /*!
     *  ======== Proxy ========
     *  ICacheSupport proxy
     *
     *  Cache will use this proxy to access the cache hardware using
     *  OS specific APIs.
     */
    proxy Proxy inherits ICacheSupport;

    /*!
     *  ======== inv ========
     *  Invalidate range of memory for all cache(s)
     *
     *  Invalidate the range of memory within the specified starting
     *  address and byte count.  The range of addresses operated on
     *  gets quantized to whole cache lines in each cache.  All lines
     *  in range are invalidated for all cache types.
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
     *  Writes back a range of memory from all cache(s)
     *
     *  Writes back the range of memory within the specified starting
     *  address and byte count.  The range of addresses operated on
     *  gets quantized to whole cache lines in each cache.  All lines
     *  within the range are left valid in all caches and the data
     *  within the range will be written back to the source memory.
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
     *  Write back and invalidate range of memory.
     *
     *  Writes back and invalidates the range of memory within the
     *  specified starting address and byte count.  The range of
     *  addresses operated on gets quantized to whole cache lines in
     *  each cache.  All lines within the range are written back to the
     *  source memory and then invalidated for all cache types.
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
     *  @param(eb)       error block
     *  @a(returns)  true for success; false for error.
     */
    Bool wait(Error.Block *eb);
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

