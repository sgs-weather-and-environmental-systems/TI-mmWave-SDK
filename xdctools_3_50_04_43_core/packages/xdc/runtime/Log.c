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
 *  ======== Log.c ========
 */
#include <xdc/std.h>

#include <xdc/runtime/System.h>
#include <xdc/runtime/Text.h>
#include <xdc/runtime/Types.h>

#include "package/internal/Log.xdc.h"

/*
 * Conditionally set the format string depending on the width of data
 * primitives. This should be removed once System_printf supports
 * 32-bit format strings
 */
#if (xdc_target__bitsPerChar * xdc_target__sizeof_Int) == 32
#define SERIAL "#%010u "
#define HI "%0.8x:"
#define LO "%0.8x] "
#elif (xdc_target__bitsPerChar * xdc_target__sizeof_Long) == 32 
#define SERIAL "#%010lu "
#define HI "%0.8lx:"
#define LO "%0.8lx] "
#else
#error xdc.runtime.Log does not support this target.
#endif


/*
 *  ======== doPrint ========
 */
Void Log_doPrint(Log_EventRec *er)
{
    Text_RopeId rope;
    CString fmt;
    Bits32 hi, lo;

    /* print serial number if there is one; 0 isn't a valid serial number */
    if (er->serial) {
        System_printf(SERIAL, er->serial);
    }

    /* print timestamp if there is one; ~0 isn't a valid timestamp value */
    hi = er->tstamp.hi;
    lo = er->tstamp.lo;
    if (lo != ~0 && hi != ~0) {
        System_printf("[t=0x");
        if (hi) {
            System_printf(HI, hi);
        }
        System_printf(LO, lo);
    }

    /* print module name */
    Text_putMod((Text_RopeId)Types_getModuleId(er->evt), NULL, -1);
    System_printf(": ");

    /* print event */
    rope = Types_getEventId(er->evt);   /* the event id is the message rope */
    if (rope == 0) {
        /* Log_print() event */
        System_aprintf((String)iargToPtr(er->arg[0]),
            er->arg[1], er->arg[2], er->arg[3], er->arg[4], 
            er->arg[5], er->arg[6], 0, 0);
    }
    else if (!Text_isLoaded) {
        /* If Text is disabled, Event Ids are not entries in Text_charTab but
         * internal IDs assigned by the Log module.
         */
        System_aprintf("{evt: %d, args=[0x%x, 0x%x ...]}", rope, er->arg[0],
            er->arg[1]);
    }
    else {
        /* Log_write() event */
        fmt = Text_ropeText(rope);
        System_aprintf(fmt, er->arg[0], er->arg[1], er->arg[2], er->arg[3],
                            er->arg[4], er->arg[5], er->arg[6], er->arg[7]);
    }

    System_putch('\n');
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

