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
 *  ======== SyncNull.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Error.h>
#include <xdc/runtime/knl/ISync.h>
#include "package/internal/SyncNull.xdc.h"

/*
 *  ======== SyncNull_query ========
 */
/* ARGSUSED */
Bool  SyncNull_query(SyncNull_Object *obj, Int qual)
{
    return (FALSE);
}

/*
 *  ======== SyncNull_wait ========
 */
/* ARGSUSED */
Int SyncNull_wait(SyncNull_Object *obj, UInt timeout, Error_Block *eb)
{
    return (ISync_WaitStatus_TIMEOUT);
}

/*
 *  ======== SyncNull_signal ========
 */
/* ARGSUSED */
Void SyncNull_signal(SyncNull_Object *obj)
{
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

