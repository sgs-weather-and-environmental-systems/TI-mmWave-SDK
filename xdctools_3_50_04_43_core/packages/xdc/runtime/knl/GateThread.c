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
 *  ======== GateThread.c ========
 */

#include <xdc/std.h>

#include <xdc/runtime/Error.h>

#include "package/internal/GateThread.xdc.h"

/*
 *  ======== GateThread_Instance_init ========
 */
/* ARGSUSED */
Int GateThread_Instance_init(GateThread_Handle gate, 
    const GateThread_Params* params, Error_Block* eb)
{    
    gate->proxyHandle = 
        GateThread_Proxy_create(NULL, eb);

    return (0);
}

/*
 *  ======== GateThread_Instance_finalize ========
 */
/* ARGSUSED */
Void GateThread_Instance_finalize(GateThread_Handle gate, Int status)
{
    if (gate->proxyHandle != NULL) {
        GateThread_Proxy_delete(&gate->proxyHandle);
    }
}

/*
 *  ======== GateThread_enter ========
 */
IArg GateThread_enter(GateThread_Handle gate)
{
    return (GateThread_Proxy_enter(gate->proxyHandle));
}

/*
 *  ======== GateThread_leave ========
 */
Void GateThread_leave(GateThread_Handle gate, IArg key)
{
    GateThread_Proxy_leave(gate->proxyHandle, key);
}

/*
 *  ======== GateThread_query ========
 */
Bool GateThread_query(Int qual)
{
    return (GateThread_Proxy_query(qual));
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

