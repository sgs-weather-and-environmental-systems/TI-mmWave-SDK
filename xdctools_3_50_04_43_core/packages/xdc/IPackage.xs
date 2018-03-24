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
 *  ======== IPackage.init ========
 *  Define the default Package init function.
 */
function init () {}

/*
 *  ======== IPackage.close ========
 *  Define the default Package close function.
 */
function close () {}

/*
 *  ======== IPackage.validate ========
 *  Define the default Package validate function.
 */
function validate () {}

/*
 *  ======== IPackage.exit ========
 *  Define the default Package exit function.
 */
function exit () {}

/*
 *  ======== IPackage.getLibs ========
 *  Define the default Package getLibs function. This function deals with two
 *  different types of elements in the array 'this.build.libraries'. Until
 *  xdc-n36, the array contained strings with library names. Since xdc-n36,
 *  each element is a structure of two properties, 'name' is the name of the
 *  library, 'target' is the name of the target for which the library is built.
 *
 */
function getLibs (prog)
{
    /* if a getLibs was specified in the build script, use it */
    if (this.build.getLibs != null) {
	return (this.build.getLibs.call(this, prog));
    }

    /* if this package has any libraries in 'this.build', it means the
     * libraries were built by XDCtools.
     */
    if (this.build.libraries.length != 0) {
	var targLibs = [];
        /* We need to find find the most compatible suffix and find all
         * libraries for that suffix.
         */
        var bestSuffix = prog.build.target.findSuffix(this);
        for (var i = 0; i < this.build.libDesc.length; i++) {
            if (this.build.libDesc[i].suffix == bestSuffix) {
                targLibs.push(this.build.libraries[i]);
            }
	}

	/* if there is just one (or no) library, the choice is clear */
	if (targLibs.length == 1) {
	    return (targLibs[0]);
	}
	if (targLibs.length == 0) {
	    return (null);
	}

	/* otherwise, assume a default name */
	return ("lib/" + this.$name + ".a" + prog.build.target.suffix);
    }
    
    /* otherwise return null; i.e., no library is necessary */
    return (null);
}

/*
 *  ======== IPackage.getSects ========
 *  Define the default Package getSects function.
 */
function getSects ()
{
    return (null);
}
/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:07; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

