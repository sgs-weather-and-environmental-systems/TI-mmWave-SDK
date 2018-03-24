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
 *  ======== SemProcess.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Error.h>

#include "package/internal/SemProcess.xdc.h"

/*
 *  ======== SemProcess_Instance_init ========
 */
Int SemProcess_Instance_init(SemProcess_Handle obj, Int count, UInt32 key,
    const SemProcess_Params* params, Error_Block* eb)
{
    SemProcess_Proxy_Params proxyPrms;
    
    SemProcess_Proxy_Params_init(&proxyPrms);
    proxyPrms.mode = params->mode;
    
    obj->proxyHandle = SemProcess_Proxy_create(count, key, &proxyPrms, eb);

    return (0);
}

/*
 *  ======== SemProcess_Instance_finalize ========
 */
/* ARGSUSED */
Void SemProcess_Instance_finalize(SemProcess_Handle obj, Int status)
{
    if (obj->proxyHandle != NULL) {
        SemProcess_Proxy_delete(&obj->proxyHandle);
    }
}

/*
 *  ======== SemProcess_pend ========
 */
Int SemProcess_pend(SemProcess_Handle obj, UInt timeout, Error_Block *eb)
{
    return (SemProcess_Proxy_pend(obj->proxyHandle, timeout, eb));
}

/*
 *  ======== SemProcess_post ========
 */
Bool SemProcess_post(SemProcess_Handle obj, Error_Block *eb)
{
    return (SemProcess_Proxy_post(obj->proxyHandle, eb));
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

