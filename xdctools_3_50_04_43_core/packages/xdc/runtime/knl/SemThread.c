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
 *  ======== SemThread.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Error.h>

#include "package/internal/SemThread.xdc.h"

/*
 *  ======== SemThread_Instance_init ========
 */
/* ARGSUSED */
Int SemThread_Instance_init(SemThread_Handle obj, Int count,
        const SemThread_Params* params, Error_Block* eb)
{
    SemThread_Proxy_Params proxyPrms;
    
    SemThread_Proxy_Params_init(&proxyPrms);
    proxyPrms.mode = params->mode;
    
    obj->proxyHandle= SemThread_Proxy_create(count, &proxyPrms, eb);

    return (0);
}

/*
 *  ======== SemThread_Instance_finalize ========
 */
/* ARGSUSED */
Void SemThread_Instance_finalize(SemThread_Handle obj, Int status)
{
    if (obj->proxyHandle != NULL) {
        SemThread_Proxy_delete(&obj->proxyHandle);
    }
}

/*
 *  ======== SemThread_pend ========
 */
Int SemThread_pend(SemThread_Handle obj, UInt timeout, Error_Block *eb)
{
    return (SemThread_Proxy_pend(obj->proxyHandle, timeout, eb));
}

/*
 *  ======== SemThread_post ========
 */
Bool SemThread_post(SemThread_Handle obj, Error_Block *eb)
{
    return (SemThread_Proxy_post(obj->proxyHandle, eb));
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

