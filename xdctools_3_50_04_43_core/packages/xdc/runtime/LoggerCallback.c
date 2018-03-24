/* 
 *  Copyright (c) 2012 Texas Instruments. All rights reserved. 
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
 *  ======== LoggerCallback.c ========
 */
#include <xdc/std.h>

#include <xdc/runtime/Log.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Startup.h>

#include "package/internal/LoggerCallback.xdc.h"

/*
 * ======== LoggerCallback_Module_startup ========
 */
Int LoggerCallback_Module_startup(Int state) 
{
    Int i;
    LoggerCallback_Object *obj;
  
    /* 
     *  Wait till all xdc runtime modules are initialized. This will allow 
     *  the user defined createInstFxn to use xdc runtime modules (for e.g.
     *  heap modules).
     */
    if (!Startup_rtsDone()) {
        return (Startup_NOTDONE);
    }
    
    /* 
     *  Loop through all statically configured instances  
     *  Call the createInstFxn and set the context for each instance.
     */
    for (i = 0; i < LoggerCallback_Object_count(); i++) {
        obj = LoggerCallback_Object_get(NULL, i);
        obj->context = LoggerCallback_createInstFxn(obj->arg);
    }
    
    return (Startup_DONE);
}

/*
 *  ======== LoggerCallback_Instance_init =========
 */
Void LoggerCallback_Instance_init(LoggerCallback_Object *obj,
    const LoggerCallback_Params *prms)
{
    obj->enabled = TRUE;
    obj->arg     = prms->arg;
    obj->context = LoggerCallback_createInstFxn(obj->arg);
}

/*
 *  ======== LoggerCallback_disable ========
 */
Bool LoggerCallback_disable(LoggerCallback_Object *obj)
{
    Bool prev = obj->enabled;
    obj->enabled = FALSE;

    return (prev);
}

/*
 *  ======== LoggerCallback_enable ========
 */
Bool LoggerCallback_enable(LoggerCallback_Object *obj)
{
    Bool prev = obj->enabled;
    obj->enabled = TRUE;

    return (prev);
}

/*
 *  ======== LoggerCallback_write0 =========
 */
Void LoggerCallback_write0(LoggerCallback_Object *obj, Types_Event evt,
    Types_ModuleId mid)
{
    Log_EventRec evrec;

    if (!obj->enabled) {
        return;
    }

    /* Fill in the event record */
    evrec.evt = Types_makeEvent(Log_getEventId(evt), mid);

    /* User supplied output callback function */
    LoggerCallback_outputFxn(obj->context, &evrec, 0);
}

/*
 *  ======== LoggerCallback_write1 =========
 */
Void LoggerCallback_write1(LoggerCallback_Object *obj, Types_Event evt,
    Types_ModuleId mid, IArg a1)
{
    Log_EventRec evrec;

    if (!obj->enabled) {
        return;
    }

    /* Fill in event record */
    evrec.evt = Types_makeEvent(Log_getEventId(evt), mid);
    evrec.arg[0] = a1;

    /* User supplied output callback function */
    LoggerCallback_outputFxn(obj->context, &evrec, 1);
}

/*
 *  ======== LoggerCallback_write2 =========
 */
Void LoggerCallback_write2(LoggerCallback_Object *obj, Types_Event evt,
    Types_ModuleId mid, IArg a1, IArg a2)
{
    Log_EventRec evrec;

    if (!obj->enabled) {
        return;
    }

    /* Fill in event record */
    evrec.evt = Types_makeEvent(Log_getEventId(evt), mid);
    evrec.arg[0] = a1;
    evrec.arg[1] = a2;

    /* User supplied output callback function */
    LoggerCallback_outputFxn(obj->context, &evrec, 2);
}

/*
 *  ======== LoggerCallback_write4 =========
 */
Void LoggerCallback_write4(LoggerCallback_Object *obj, Types_Event evt,
    Types_ModuleId mid, IArg a1, IArg a2, IArg a3, IArg a4)
{
    Log_EventRec evrec;

    if (!obj->enabled) {
        return;
    }

    /* Fill in event record */
    evrec.evt = Types_makeEvent(Log_getEventId(evt), mid);
    evrec.arg[0] = a1;
    evrec.arg[1] = a2;
    evrec.arg[2] = a3;
    evrec.arg[3] = a4;

    /* User supplied output callback function */
    LoggerCallback_outputFxn(obj->context, &evrec, 4);
}

/*
 *  ======== LoggerCallback_write8 =========
 */
Void LoggerCallback_write8(LoggerCallback_Object *obj, Types_Event evt,
    Types_ModuleId mid, IArg a1, IArg a2, IArg a3, IArg a4, IArg a5, IArg a6,
    IArg a7, IArg a8)
{
    Log_EventRec evrec;

    if (!obj->enabled) {
        return;
    }

    /* Fill in event record */
    evrec.evt = Types_makeEvent(Log_getEventId(evt), mid);
    evrec.arg[0] = a1;
    evrec.arg[1] = a2;
    evrec.arg[2] = a3;
    evrec.arg[3] = a4;
    evrec.arg[4] = a5;
    evrec.arg[5] = a6;
    evrec.arg[6] = a7;
    evrec.arg[7] = a8;

    /* User supplied output callback function */
    LoggerCallback_outputFxn(obj->context, &evrec, 8);
}

/*
 *  ======== xdc_runtime_LoggerCallback_defaultOutput  ========
 *  Default implementation of output callback function
 */
Void xdc_runtime_LoggerCallback_defaultOutput(UArg context, Log_EventRec *evt, 
    Int nargs)
{
}

/*
 *  ======== xdc_runtime_LoggerCallback_defaultCreate  ========
 *  Default implementation of create callback function
 */
UArg xdc_runtime_LoggerCallback_defaultCreate(UArg arg)
{
    return (0);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

