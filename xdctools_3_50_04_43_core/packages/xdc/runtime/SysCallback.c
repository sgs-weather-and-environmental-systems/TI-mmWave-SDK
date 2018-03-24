/* 
 *  Copyright (c) 2014 Texas Instruments. All rights reserved.
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
 *  ======== SysCallback.c ========
 */

#include <xdc/std.h>
#include "package/internal/SysCallback.xdc.h"

/*
 *  ======== SysCallback_abort ========
 */
Void SysCallback_abort(CString str)
{
    SysCallback_abortFxn(str);
}

/*
 *  ======== SysCallback_exit ========
 */
Void SysCallback_exit(Int stat)
{
    SysCallback_exitFxn(stat);
}

/*
 *  ======== SysCallback_putch ========
 */
Void SysCallback_putch(Char ch)
{
    SysCallback_putchFxn(ch);
}

/*
 *  ======== SysCallback_flush ========
 */
Void SysCallback_flush(Void)
{
    SysCallback_flushFxn();
}

/*
 *  ======== SysCallback_ready ========
 */
Bool SysCallback_ready(Void)
{
    return (SysCallback_readyFxn());
}

/*
 *  ======== xdc_runtime_SysCallback_defaultReady  ========
 *  Default implementation of ready callback function
 */
Bool xdc_runtime_SysCallback_defaultReady(Void)
{
    return (TRUE);
}

/*
 *  ======== xdc_runtime_SysCallback_defaultFlush ========
 *  Default implementation of flush callback function
 */
Void xdc_runtime_SysCallback_defaultFlush(Void)
{
}

/*
 *  ======== xdc_runtime_SysCallback_defaultAbort ========
 *  Default implementation of abort callback function
 */
Void xdc_runtime_SysCallback_defaultAbort(CString str)
{
    for (;;) {
        /* spin forever */
    }
}

/*
 *  ======== xdc_runtime_SysCallback_defaultExit ========
 *  Default implementation of exit callback function
 */
Void xdc_runtime_SysCallback_defaultExit(Int stat)
{
}

/*
 *  ======== xdc_runtime_SysCallback_defaultPutch ========
 *  Default implementation of putch callback function
 */
Void xdc_runtime_SysCallback_defaultPutch(Char c)
{
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

