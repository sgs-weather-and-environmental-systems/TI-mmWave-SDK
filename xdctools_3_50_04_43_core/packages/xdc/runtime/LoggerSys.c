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
 *  ======== LoggerSys.c ========
 */
#include <xdc/std.h>

#include <xdc/runtime/Log.h>
#include <xdc/runtime/Types.h>

#include "package/internal/LoggerSys.xdc.h"

/*
 *  ======== Instance_init =========
 */
Void LoggerSys_Instance_init(LoggerSys_Object *obj,
    const LoggerSys_Params *prms)
{
    obj->enabled = TRUE;
}

/*
 *  ======== LoggerSys_disable ========
 */
Bool LoggerSys_disable(LoggerSys_Object *obj)
{
    Bool prev = obj->enabled;
    obj->enabled = FALSE;
    return (prev);
}

/*
 *  ======== LoggerSys_enable ========
 */
Bool LoggerSys_enable(LoggerSys_Object *obj)
{
    Bool prev = obj->enabled;
    obj->enabled = TRUE;
    return (prev);
}

/*
 *  ======== write0 =========
 */
Void LoggerSys_write0(LoggerSys_Object *obj, Log_Event evt,
                      Types_ModuleId mid)
{
    LoggerSys_write8(obj, evt, mid, 0, 0, 0, 0, 0, 0, 0, 0);
}

/*
 *  ======== write1 =========
 */
Void LoggerSys_write1(LoggerSys_Object *obj, Log_Event evt,
                      Types_ModuleId mid, IArg a1)
{
    LoggerSys_write8(obj, evt, mid, a1, 0, 0, 0, 0, 0, 0, 0);
}

/*
 *  ======== write2 =========
 */
Void LoggerSys_write2(LoggerSys_Object *obj, Log_Event evt,
                      Types_ModuleId mid, IArg a1, IArg a2)
{
    LoggerSys_write8(obj, evt, mid, a1, a2, 0, 0, 0, 0, 0, 0);
}

/*
 *  ======== write4 =========
 */
Void LoggerSys_write4(LoggerSys_Object *obj, Log_Event evt,
                      Types_ModuleId mid, IArg a1, IArg a2, IArg a3, IArg a4)
{
    LoggerSys_write8(obj, evt, mid, a1, a2, a3, a4, 0, 0, 0, 0);
}

/*
 *  ======== write8 =========
 */
Void LoggerSys_write8(LoggerSys_Object *obj, Log_Event evt,
                      Types_ModuleId mid, IArg a1, IArg a2, IArg a3, IArg a4,
                      IArg a5, IArg a6, IArg a7, IArg a8)
{
    Log_EventRec evrec;

    if (!obj->enabled) {
        return;
    }

    LoggerSys_TimestampProxy_get64(&evrec.tstamp);

    evrec.serial = 0;
    evrec.evt = Types_makeEvent(Log_getEventId(evt), mid);
    evrec.arg[0] = a1;
    evrec.arg[1] = a2;
    evrec.arg[2] = a3;
    evrec.arg[3] = a4;
    evrec.arg[4] = a5;
    evrec.arg[5] = a6;
    evrec.arg[6] = a7;
    evrec.arg[7] = a8;

    Log_doPrint(&evrec);
}

/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

