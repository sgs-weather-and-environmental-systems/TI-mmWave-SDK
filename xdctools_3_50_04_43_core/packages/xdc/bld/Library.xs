/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */
/*
 *  ======== Library.addObjects ========
 */
function addObjects (names, objAttrs)
{
    var priv = this.$private;
    
    for (var i = 0; i < names.length; i++) {
	if (priv.objects[names[i]] != null) {
	    throw new Error("addObjects was passed '" + names[i] +
		"' more than once for the library '" + this.name + "'");
	    
	}
	var obj = this.$package.Object.create();
	obj.name = names[i];
	obj.attrs = objAttrs;
	priv.objects[obj.name] = obj;
    }
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

