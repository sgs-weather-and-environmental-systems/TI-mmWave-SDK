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
 *  ======== Mingw.archive ========
 */
function archive(goal)
{
    var result = this.$super.archive.$fxn.call(this, goal);
    var path = ".;$(rootDir)/bin;$(PATH)";
    result.path = path.split(";"); 
    return (result);
}

/*
 *  ======== Mingw.compile ========
 */
function compile(goal) {
    var result = this.$super.compile.$fxn.call(this, goal, false);
    var path = ".;$(rootDir)/bin;$(PATH)";
    result.path = path.split(";"); 
    return (result);
}


/*
 *  ======== Mingw.link ========
 */
function link(goal) {
    var result = this.$super.link.$fxn.call(this, goal);
    var path = ".;$(rootDir)/bin;$(PATH)";
    result.path = path.split(";"); 
    return (result);
}

/*
 *  ======== Mingw.scompile ========
 */
function scompile(goal) {
    var result = this.$super.scompile.$fxn.call(this, goal, true);
    var path = ".;$(rootDir)/bin;$(PATH)";
    result.path = path.split(";"); 
    return (result);
}


/*
 *  @(#) gnu.targets; 1, 0, 1,0; 11-8-2017 17:20:11; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

