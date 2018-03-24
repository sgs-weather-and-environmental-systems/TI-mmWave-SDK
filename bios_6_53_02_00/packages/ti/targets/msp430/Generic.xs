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
 *  ======== Generic.archive ========
 */
function archive(goal)
{
    var result = new xdc.om['xdc.bld.ITarget'].CommandSet;
    result.msg = "ar" + this.suffix + " $@ ...";
    result.cmds = ":";
    return (result);
}

/*
 *  ======== Generic.asmName ========
 */
function asmName(cname)
{
    return (cname);
}

/*
 *  ======== Generic.compile ========
 */
function compile(goal) 
{
    var result = new xdc.om['xdc.bld.ITarget'].CommandSet;
    result.msg = "cl" + this.suffix + " $@ ...";
    result.cmds = ":";
    return (result);
}

/*
 *  ======== Generic.genConstCustom ========
 */
function genConstCustom(names, types)
{
    return ("");
}

/*
 *  ======== Generic.genVisibleFxns ========
 */
function genVisibleFxns(types, names, args)
{
    return ("");
}

/*
 *  ======== Generic.genVisibleLibFxns ========
 */
function genVisibleLibFxns(types, names, args)
{
    return ("");
}

/*
 *  ======== Generic.getVersion ========
 */
function getVersion()
{
    return (this.$name + "{1,0,0");
}

/*
 *  ======== Generic.link ========
 */
function link(goal)
{
    var result = new xdc.om['xdc.bld.ITarget'].CommandSet;
    result.msg = "lnk" + this.suffix + " $@ ...";
    result.cmds = ":";
    return (result);
}

/*
 *  ======== Generic.scompile ========
 */
function scompile(goal) 
{
    return (null);
}

/*
 *  ======== Generic.getISAChain ========
 */
function getISAChain(isa) {
    return ([]);
}

/*
 *  ======== _compile ========
 */
function _compile(target, goal, asm)
{
}
/*
 *  @(#) ti.targets.msp430; 1, 0, 0,0; 11-8-2017 17:21:22; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

