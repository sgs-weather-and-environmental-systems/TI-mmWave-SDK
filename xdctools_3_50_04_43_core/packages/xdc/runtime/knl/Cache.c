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
 *  ======== Cache.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include "package/internal/Cache.xdc.h"

/*
 *  ======== Cache_inv ========
 */
Bool Cache_inv(Ptr blockPtr, SizeT byteCnt, Bool wait, Error_Block *eb)
{
    return (Cache_Proxy_inv(blockPtr, byteCnt, wait, eb));
}

/*
 *  ======== Cache_wb ========
 */
Bool Cache_wb(Ptr blockPtr, SizeT byteCnt, Bool wait, Error_Block *eb)
{
    return (Cache_Proxy_wb(blockPtr, byteCnt, wait, eb));
}

/*
 *  ======== Cache_wbInv ========
 */
Bool Cache_wbInv(Ptr blockPtr, SizeT byteCnt, Bool wait, Error_Block *eb)
{
    return (Cache_Proxy_wbInv(blockPtr, byteCnt, wait, eb));
}

/*
 *  ======== Cache_wait ========
 */
Bool Cache_wait(Error_Block *eb)
{
    return (Cache_Proxy_wait(eb));
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

