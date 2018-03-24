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
 *  ======== SyncSemThread.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/knl/ISemaphore.h>
#include <xdc/runtime/knl/SemThread.h>
#include <xdc/runtime/knl/ISync.h>

#include "package/internal/SyncSemThread.xdc.h"

/*
 *  ======== SyncSemThread_Instance_init ========
 */
/* ARGSUSED */
Int SyncSemThread_Instance_init(SyncSemThread_Object *obj,
    const SyncSemThread_Params *params, Error_Block *eb)
{
    SemThread_Params semParams;

    /* initialize object data */
    obj->semThread = NULL;

    /* create the semaphore */
    SemThread_Params_init(&semParams);
    semParams.mode = SemThread_Mode_BINARY;
    obj->semThread = SemThread_create(0, &semParams, eb);

    return (0);
}

/*
 *  ======== SyncSemThread_Instance_finalize ========
 */
/* ARGSUSED */
Void SyncSemThread_Instance_finalize(SyncSemThread_Object *obj, Int status)
{
    if (obj->semThread != NULL) {
        SemThread_delete(&obj->semThread);
    }
}

/*
 *  ======== SyncSemThread_query ========
 */
/* ARGSUSED */
Bool SyncSemThread_query(SyncSemThread_Object *obj, Int qual)
{
    if (qual == ISync_Q_BLOCKING) {
        return (TRUE);
    }
    else {
        return (FALSE);
    }
}

/*
 *  ======== SyncSemThread_signal ========
 */
Void SyncSemThread_signal(SyncSemThread_Object *obj)
{
    SemThread_post(obj->semThread, NULL);
}

/*
 *  ======== SyncSemThread_wait ========
 */
Int SyncSemThread_wait(SyncSemThread_Object *obj, UInt timeout, Error_Block *eb)
{
    Int retc;

    if (timeout == SyncSemThread_WAIT_FOREVER) {
        timeout = SemThread_FOREVER;
    }

    retc = SemThread_pend(obj->semThread, timeout, eb);

    if (retc == ISemaphore_PendStatus_SUCCESS) {
        return (ISync_WaitStatus_SUCCESS);
    }
    else if (retc == ISemaphore_PendStatus_TIMEOUT) {
        return (ISync_WaitStatus_TIMEOUT);
    }
    else {
        return (ISync_WaitStatus_ERROR);
    }
}
 
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

