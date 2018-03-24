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
 *  ======== ITarget.scompile ========
 *  Default implementation for ITarget.scompile().
 *
 *  This allows targets to not implement this method and have the build
 *  engine assume that all targets do implement this method.
 */
function scompile (goal)
{
    return (null);
}

/*
 *  ======== ITarget.getVersion ========
 *  Default implementation for ITarget.getVersion()
 *
 *  This allows targets to not implement this method and have the build
 *  engine assume that all targets do implement this method.
 */
function getVersion ()
{
    return (this.$name + "{");
}

/*
 *  ======== ITarget.getISAChain ========
 *  Default implementation for ITarget.getISAChain()
 *
 *  This allows targets to not implement this method and have the build
 *  engine assume that all targets do implement this method.
 */
function getISAChain (isa)
{
    return ([isa == null ? this.isa : isa]);
}

/*
 *  ======== findSuffix ========
 */
function findSuffix(pkg)
{
    if (arguments.length < 1) {
        throw new Error("The function ITarget.findSuffix() requires an "
            + "argument");
    }

    /* Instead of searching through an array, it's easier to create an
     * object with suffixes as properties, so we can use the operator 'in'.
     */
    var suffixMap = {};

    if ("build" in pkg) {
        var build = pkg.build;
        /* if this package has any libraries, get their target's suffixes */
        if (build.libraries.length != 0) {
            for (var i = 0; i < build.libDesc.length; i++) {
		suffixMap[build.libDesc[i].suffix] = "";
	    }
        }
    }
    else if ('length' in pkg) {
        /* 'pkg' is a simple array of suffixes */
        for (var i = 0; i < pkg.length; i++) {
            suffixMap[pkg[i]] = "";
        }
        //throw new Error("The argument supplied to ITarget.findSuffix() is not"
        //    + " a package");
    }
    else {
        throw new Error("An invalid argument type supplied to "
            + "ITarget.findSuffix()");
    }

    /* this.compatibleSuffixes comes as an object, not an array, so we
     * convert it into an array to be able to look up its length.
     */
    var compTargs = [];
    for (var prop in this.compatibleSuffixes) {
        compTargs[prop] = this.compatibleSuffixes[prop];
    }

    /* If this target is supported by the package `pkg`, this target's suffix
     * is returned without even checking `compatibleSuffixes`.
     */
    if (this.suffix in suffixMap) {
        return (this.suffix);
    }

    if (compTargs.length < 1) {
        return (null);
    }

    for (var i = 0; i < compTargs.length; i++) {
        if (compTargs[i] in suffixMap) {
            return (compTargs[i]);
        }
    }
   
    return (null);
}

/*
 *  ======== selectSuffix ========
 */
function selectSuffix(list)
{

    /* Instead of searching through an array, it's easier to create an
     * object with suffixes as properties, so we can use the operator 'in'.
     */
    var suffixMap = {};

    for (var i = 0; i < list.length; i++) {
        suffixMap[list[i]] = "";
    }

    /* this.compatibleSuffixes comes as an object, not an array, so we
     * convert it into an array to be able to look up its length.
     */
    var compTargs = [];
    for (var prop in this.compatibleSuffixes) {
        compTargs[prop] = this.compatibleSuffixes[prop];
    }

    /* If this target is supported by the package `pkg`, this target's suffix
     * is returned without even checking `compatibleSuffixes`.
     */
    if (this.suffix in suffixMap) {
        return (this.suffix);
    }

    if (compTargs.length < 1) {
        return (null);
    }

    for (var i = 0; i < compTargs.length; i++) {
        if (compTargs[i] in suffixMap) {
            return (compTargs[i]);
        }
    }
   
    return (null);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

