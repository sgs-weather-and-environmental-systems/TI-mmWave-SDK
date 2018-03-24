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
 *  ======== Startup.c ========
 */

#include <xdc/runtime/System.h>
#include "package/internal/Startup.xdc.h"

/*
 *  ======== Startup_exec ========
 */
Void Startup_exec(Void)
{
    Int i;

    if (module->execFlag) {
        return;
    }

    module->execFlag = TRUE;

    for (i = 0; i < Startup_firstFxns.length; i++) {
        Startup_firstFxns.elem[i]();
    }

    (Startup_execImpl)();

    for (i = 0; i < Startup_lastFxns.length; i++) {
        Startup_lastFxns.elem[i]();
    }
}

/*
 *  ======== Startup_rtsDone ========
 */
Bool Startup_rtsDone(Void)
{
    return (module->rtsDoneFlag);
}

/*
 *  ======== Startup_startMods ========
 */
Void Startup_startMods(Int state[], Int len)
{
    Int curPass;
    Int i;
    Bool done = FALSE;

    /* We initialize 'state' before running any Startup function to have
     * the array look good in ROV. The runtime Startup functions must not 
     * depend on any other module already finished with the startup, so
     * they could run even before 'state' is fully initialized.
     */
    for (i = 0; i < len; i++) {
        state[i] = xdc_runtime_Startup_NOTDONE;
    }

    module->stateTab = state;

    for (i = 0; i < len; i++) {
        if (Startup_sfxnRts[i]) {
            state[i] = Startup_sfxnTab[i](Startup_NOTDONE);
        }
    }

    module->rtsDoneFlag = TRUE;

    for (curPass = 0; curPass < Startup_maxPasses; curPass++) {
        done = TRUE;
        for (i = 0; i < len; i++) {
            if (state[i] != Startup_DONE) {
                state[i] = Startup_sfxnTab[i](state[i]);
            }
            done &= (state[i] == Startup_DONE);
        }
        if (done) {
            break;
        }
    }

    if (!done) {
        System_abort("xdc.runtime.Startup: 'maxPasses' exceeded");
    }

    module->stateTab = NULL;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

