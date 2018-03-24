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
 *  ======== Timestamp.c ========
 */

#include <xdc/runtime/Types.h>
#include "package/internal/Timestamp.xdc.h"

/*
 *  ======== Timestamp_get32 ========
 */
Bits32 Timestamp_get32(Void)
{
    return (Timestamp_SupportProxy_get32());
}

/*
 *  ======== Timestamp_get64 ========
 */
Void Timestamp_get64(Types_Timestamp64 *result)
{
    Timestamp_SupportProxy_get64(result);
}

/*
 *  ======== Timestamp_getFreq ========
 */
Void Timestamp_getFreq(Types_FreqHz *freq)
{
    Timestamp_SupportProxy_getFreq(freq);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

