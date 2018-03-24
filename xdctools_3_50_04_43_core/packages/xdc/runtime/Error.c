/* 
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
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
 *  ======== Error.c ========
 */

#include <xdc/runtime/Gate.h>
#include <xdc/runtime/System.h>
#include <xdc/runtime/Text.h>
#include <xdc/runtime/Types.h>
#include <xdc/runtime/Diags.h>
#include <xdc/runtime/Log.h>

#include <string.h>

#include "package/internal/Error.xdc.h"

/*
 *  ======== Error_init ========
 */
Void Error_init(Error_Block *eb)
{
    if (eb && eb != &xdc_runtime_Error_IgnoreBlock) {
        memset(eb, 0, sizeof (Error_Block));
    }
}

/*
 *  ======== Error_check ========
 */
Bool Error_check(Error_Block *eb)
{
    /* The condition eb->id != 0 rejects Error_IGNORE */
    return (Error_policy == Error_UNWIND && eb != NULL && eb->id != 0);
}

/*
 *  ======== Error_getData ========
 */
Error_Data *Error_getData(Error_Block *eb)
{
    return (&eb->data);
}

/*
 *  ======== Error_getCode ========
 */
UInt16 Error_getCode(Error_Block *eb)
{
    return (Error_idToCode(eb->id));
}

/*
 *  ======== Error_getId ========
 */
Error_Id Error_getId(Error_Block *eb)
{
    return (eb->id);
}

/*
 *  ======== Error_getMsg ========
 */
CString Error_getMsg(Error_Block *eb)
{
    return (eb->msg);
}

/*
 *  ======== Error_getSite ========
 */
Types_Site *Error_getSite(Error_Block *eb)
{
    return (&eb->site);
}

/*
 *  ======== Error_print ========
 */
Void Error_print(Error_Block *eb)
{
    if (eb == NULL || eb->unused != 0) {
        return;
    }

    if (eb->msg) {
        Text_putSite(Error_getSite(eb), NULL, -1);
        if (Text_isLoaded) {
            System_aprintf(eb->msg, eb->data.arg[0], eb->data.arg[1]);
        }
        else {
            System_aprintf("error {id:0x%x, args:[0x%x, 0x%x]}",
                eb->id, eb->data.arg[0], eb->data.arg[1]);
        }
        System_printf("\n");
    }
}

/*
 *  ======== Error_raiseX ========
 */
Void Error_raiseX(Error_Block *eb, Types_ModuleId mod, CString file,
    Int line, Error_Id id, IArg arg1, IArg arg2)
{
    Error_policyFxn(eb, mod, file, line, id, arg1, arg2);
}

/*
 *  ======== Error_policyDefault ========
 */
Void Error_policyDefault(Error_Block *eb, Types_ModuleId mod, CString file,
    Int line, Error_Id id, IArg arg1, IArg arg2)
{
    Error_Block defErr;
    IArg gateKey;
    UInt16 oldCount;
    Bool errorAbort = FALSE;

    if (eb == NULL || eb->unused != 0) {
        errorAbort = (eb == NULL);
        eb = &defErr;
    }

    /* fill in the error block */
    Error_setX(eb, mod, file, line, id, arg1, arg2);

    /*
     * Log the error, now that we've retrieved the error message.
     *
     * We call Log_put here instead of Log_write so that we can log the
     * caller's module id instead of the Error module's id.
     *
     * In logging this event, we'll use the Error module's mask and logger. We
     * don't have a way to reliably access the caller's diags mask and logger.
     * The caller isn't guaranteed to have a mask on the target, even if they
     * are performing logging.
     */
    if (Module__LOGDEF && Diags_query(Log_L_error)) {
        Log_put8(Log_L_error, mod, (IArg) file, line,
                 (IArg) eb->msg, arg1, arg2, 0, 0, 0);
    }

    /* count nesting level of errors */
    gateKey = Gate_enterSystem();
    oldCount = module->count;
    module->count++;
    Gate_leaveSystem(gateKey);

    /* call any provided error hook, unless we are too deeply nested */
    if (Error_raiseHook != NULL && oldCount < Error_maxDepth) {
        (Error_raiseHook)(eb);
    }

    if (Error_policy == Error_TERMINATE || errorAbort) {
        System_abort("xdc.runtime.Error.raise: terminating execution\n");
    }

    gateKey = Gate_enterSystem();
    module->count--;
    Gate_leaveSystem(gateKey);
}

/*
 *  ======== Error_policyMin ========
 */
Void Error_policyMin(Error_Block *eb, Types_ModuleId mod, CString file,
    Int line, Error_Id id, IArg arg1, IArg arg2)
{
    if (eb == NULL || Error_policy == Error_TERMINATE) {
        for(;;) {
        }
    }
    else if (eb != &xdc_runtime_Error_IgnoreBlock) {
        eb->id = id;
    }
    return;
}

/*
 *  ======== Error_policySpin ========
 */
Void Error_policySpin(Error_Block *eb, Types_ModuleId mod, CString file,
    Int line, Error_Id id, IArg arg1, IArg arg2)
{
    for(;;) {
    }
}
/*
 *  ======== Error_setX ========
 */
Void Error_setX(Error_Block *eb, Types_ModuleId mod, CString file,
    Int line, Error_Id id, IArg arg1, IArg arg2)
{
    Error_init(eb);

    eb->data.arg[0] = arg1;
    eb->data.arg[1] = arg2;
    eb->id = id;
    eb->msg = Text_isLoaded ? Text_ropeText((Text_RopeId)(id >> 16)) : "";
    eb->site.mod = mod;
    eb->site.file = file;
    eb->site.line = line;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:25; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

