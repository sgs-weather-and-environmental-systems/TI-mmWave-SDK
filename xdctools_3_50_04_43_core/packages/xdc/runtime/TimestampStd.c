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
 *  ======== TimestampStd.c ========
 */

#include <xdc/std.h>
#include <xdc/runtime/Types.h>

#include <time.h>

#include "package/internal/TimestampStd.xdc.h"


/*
 *  ======== TimestampStd_get32 ========
 */
Bits32 TimestampStd_get32(Void)
{
    return ((Bits32)clock());
}

/*
 *  ======== TimestampStd_get64 ========
 */
Void TimestampStd_get64(Types_Timestamp64 *result)
{
    Long res = clock();

    result->lo = (Bits32)(res & 0xFFFFFFFF);
#if xdc_target__sizeof_Long > xdc_target__sizeof_Int32
    result->hi = (Bits32)(res >> 32);
#else
    result->hi = 0;
#endif
}

/*
 *  ======== TimestampStd_getFreq ========
 */
Void TimestampStd_getFreq(Types_FreqHz *freq)
{
    freq->lo = 1;
    freq->hi = 0;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

