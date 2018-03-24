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
 *  ======== Gate.c ========
 */
#include <xdc/std.h>

#include "package/internal/Gate.xdc.h"
#include <xdc/runtime/System.h>

/*
 *  ======== enterSystem ========
 *  Enter the "System" gate
 *
 *  This method enters the gate specified by
 *    1. System.common$.gate, if non-null, otherwise
 *    2. Defaults.common$.gate, if non-null, otherwise
 *    3. NULL is used with GateNull
 *
 *  See finalize() in package.xs for details.
 */
IArg Gate_enterSystem(Void)
{
    return (xdc_runtime_System_Module_GateProxy_enter(
        xdc_runtime_System_Module__gateObj__C));
}

/*
 *  ======== leaveSystem ========
 */
Void Gate_leaveSystem(IArg key)
{
    xdc_runtime_System_Module_GateProxy_leave(
        xdc_runtime_System_Module__gateObj__C, key);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

