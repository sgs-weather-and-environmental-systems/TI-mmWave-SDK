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
 *  ======== HeapMin.xs ========
 */

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, params)
{
    var Memory = xdc.module('xdc.runtime.Memory');

    if (params.size == 0) {
        Program.$logFatal(
            "'size' parameter to HeapMin.create() cannot be 0.", this, "size");
    }
    
    /* Verify requested alignment is a power of 2 */
    if ((params.align != 0) &&
        ((params.align - 1) & params.align) != 0) {
        HeapMin.$logFatal("Requested alignment must be a power of 2.", this, "align");
    }

    /* Get default alignment from target */
    if (!params.align) {
        params.align = Memory.getMaxDefaultTypeAlignMeta();
    }

    /* Reserve the memory */
    obj.buf.length = params.size;

    Memory.staticPlace(obj.buf, params.align, params.sectionName);
    
    /* Fill in the remaining instance internal fields */
    obj.remainSize = params.size;
    obj.startSize  = params.size;
}

/*
 *  ======== module$use ========
 *
 *  The only place where the module Memory is used in the target code is the
 *  type of a parameter in getStats(). If we ever decide to try to optimize out
 *  Memory whenever possible, we might reconsider changing the type for
 *  Memory_Stats.
 */
function module$use()
{
    xdc.useModule('xdc.runtime.Memory');
}

/*
 *  ======== viewInitBasic ========
 */
function viewInitBasic(view, obj)
{
    var Program = xdc.useModule('xdc.rov.Program');

    view.label = Program.getShortName(obj.$label);
    view.buffer = "0x" + obj.buf.$addr.toString(16);
    view.remainSize = obj.remainSize;
    view.startSize = obj.startSize;
}

/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

