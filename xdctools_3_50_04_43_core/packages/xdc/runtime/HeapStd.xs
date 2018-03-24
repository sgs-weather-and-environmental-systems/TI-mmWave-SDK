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
 *  ======== HeapStd.xs ========
 */

var HeapStd = null;
var Program = null;
 
/*
 *  ======== module$use ========
 */
function module$use()
{    
    Program = xdc.module('xdc.cfg.Program');    
    xdc.useModule('xdc.runtime.Memory');
}
 
/*
 *  ======== module$static$init ========
 */
function module$static$init(mod, params)
{
    HeapStd = mod;
    
    /* Initialize module fields */
    HeapStd.remainRTSSize = Program.heap;    
}

/*
 *  ======== instance$static$init ========
 */
function instance$static$init(obj, params)
{
    /* Throw an error if the size is zero */
    if (params.size == 0) {
        Program.$logFatal("'size' parameter to HeapStd.create() cannot be 0.",
            this, "size");
    }
    
    /* if param.size == HeapStd_HEAP_MAX (special case), do not check */
    if (params.size != this.HEAP_MAX) {
        /* Make sure the rts size (Program.heap) is large enough) */
        if (HeapStd.remainRTSSize < params.size) {
            Program.$logFatal("The RTS heap (Program.heap = " + Program.heap 
                                 + ") is used up.", this, "size");
        }
        HeapStd.remainRTSSize -= params.size;
    }
    
    /* Fill in the instance internal fields */
    obj.remainSize = params.size;
    obj.startSize  = params.size;
}

/*
 *  ======== instance$view$init ========
 */
function instance$view$init(view, obj)
{
    view.address = obj.$addr;
    view.label = obj.$label;

    view.remainSize = obj.remainSize;
    view.startSize = obj.startSize;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

