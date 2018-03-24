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
 *  ======== GateProcess.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Assert.h>
#include <xdc/runtime/Error.h>

#include "package/internal/GateProcess.xdc.h"

/*
 *  ======== GateProcess_Instance_init ========
 */
Int GateProcess_Instance_init(GateProcess_Handle gate, 
    const GateProcess_Params* params, Error_Block* eb)
{
    GateProcess_Proxy_Params proxyPrms;
    
    Assert_isTrue(params->key != -1, GateProcess_A_invalidKey);
        
    GateProcess_Proxy_Params_init(&proxyPrms);
    proxyPrms.key = params->key;
    
    gate->proxyHandle = 
        GateProcess_Proxy_create(&proxyPrms, eb);

    return (0);
}

/*
 *  ======== GateProcess_Instance_finalize ========
 */
/* ARGSUSED */
Void GateProcess_Instance_finalize(GateProcess_Handle gate, Int status)
{
    if (gate->proxyHandle != NULL) {
        GateProcess_Proxy_delete(&gate->proxyHandle);
    }
}

/*
 *  ======== GateProcess_enter ========
 */
IArg GateProcess_enter(GateProcess_Handle gate)
{
    return (GateProcess_Proxy_enter(gate->proxyHandle));
}

/*
 *  ======== GateProcess_leave ========
 */
Void GateProcess_leave(GateProcess_Handle gate, IArg key)
{
    GateProcess_Proxy_leave(gate->proxyHandle, key);
}

/*
 *  ======== GateProcess_getReferenceCount ========
 */
Int GateProcess_getReferenceCount(GateProcess_Handle gate, Error_Block *eb)
{
    return GateProcess_Proxy_getReferenceCount(gate->proxyHandle, eb);
}

/*
 *  ======== GateProcess_query ========
 */
Bool GateProcess_query(Int qual)
{
    return (GateProcess_Proxy_query(qual));
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

