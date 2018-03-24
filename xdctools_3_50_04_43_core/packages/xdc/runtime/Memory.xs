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
 *  ======== Memory.xs ========
 */

/*
 *  ======== module$static$init ========
 */
function module$static$init(obj)
{
    obj.maxDefaultTypeAlign = getMaxDefaultTypeAlignMeta();
}

/*
 *  ======== staticPlace ========
 */
function staticPlace(obj, align, sectionName)
{
    var Program = xdc.module('xdc.cfg.Program');
    var target  = Program.build.target;    

    obj.$$alloc(sectionName, align);    

    if ((target.alignDirectiveSupported == false) && (align != 0) &&
        (align != 1)) {
        return (false);
    }

    return (true);
}

/*
 *  ======== getMaxDefaultTypeAlignMeta ========
 */
function getMaxDefaultTypeAlignMeta()
{
    var Program = xdc.module('xdc.cfg.Program');
    var target  = Program.build.target;

    var align = 0;

    for (var k in target.stdTypes) {
        if (align < target.stdTypes[k].align) {
            align = target.stdTypes[k].align;
        }
    }
    return (align);
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

