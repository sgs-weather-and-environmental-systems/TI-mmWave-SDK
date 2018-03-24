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
 *  ======== ITarget2.genConstCustom ========
 *  Default implementation for ITarget2.genConstCustom().
 *
 *  This allows targets to not implement this method and have the build
 *  engine assume that all targets do implement this method.
 */
function genConstCustom(constants)
{
    return (null);
}

/*
 *  ======== ITarget2.genVisibleData ========
 *  Default implementation for ITarget2.genVisibleData().
 */
function genVisibleData(quals, types, names)
{
    return (null);
}

/*
 *  ======== ITarget2.genVisibleFxns ========
 *  Default implementation for ITarget2.genVisibleFxns().
 */
function genVisibleFxns(types, names, args)
{
    return (null);
}

/*
 *  ======== ITarget2.genVisibleLibFxns ========
 *  Default implementation for ITarget2.genVisibleLibFxns().
 */
function genVisibleLibFxns(types, names, args)
{
    return (null);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

