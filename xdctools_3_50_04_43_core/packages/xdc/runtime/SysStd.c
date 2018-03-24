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
 *  ======== SysStd.c ========
 */
 
#include <xdc/std.h>

#include <stdio.h>
#include <stdlib.h>

#include "package/internal/SysStd.xdc.h"

/* IAR Normal dlib does not have file descriptor support */
#if defined(__IAR_SYSTEMS_ICC__) && !(_DLIB_FILE_DESCRIPTOR)
#define fflush(stdout)
#endif

/*
 *  ======== SysStd_abort ========
 */
Void SysStd_abort(CString str)
{
    Char ch;
   
    if (str != NULL) {
        while ((ch = *str++) != '\0') {
            putchar(ch);
        }
    }
    fflush(stdout);
}

/*
 *  ======== SysStd_exit ========
 */
Void SysStd_exit(Int stat)
{
    fflush(stdout);
}

/*
 *  ======== SysStd_putch ========
 */
Void SysStd_putch(Char ch)
{
    putchar(ch);
}

/*
 *  ======== SysStd_flush ========
 */
Void SysStd_flush(Void)
{
    fflush(stdout);
}

/*
 *  ======== SysStd_ready ========
 */
Bool SysStd_ready(Void)
{
    return (TRUE);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

