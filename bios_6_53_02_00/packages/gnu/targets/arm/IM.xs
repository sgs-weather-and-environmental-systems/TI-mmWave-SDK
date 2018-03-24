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
 *  ======== IM.getISAChain ========
 *  M4 and M4F implementation for ITarget.getISAChain()
 */
function getISAChain (isa)
{
    var myChain = ["v7M", this.isa];
    var isaIn = (isa == null ? this.isa : isa)

    for (var i = 0; i < myChain.length; i++) {
        if (myChain[i] == isaIn) {
            break;
        }
    }

    if (i == myChain.length) {
        return (null);
    }
    else {
        return (myChain.slice(0, i + 1));
    }
}

/*
 *  ======== IM.genConstCustom ========
 *
 *  This function is invoked at the config time, therefore we can check the
 *  build profile.
 */
function genConstCustom(names, types)
{
    if (xdc.om.$name != 'cfg' || this.GCCVERS[0] < "4") {
        return (null);
    }

    var sb = new java.lang.StringBuilder();
    for (var i = 0; i < names.length; i++) {
        var adjName = names[i];
        if (names[i].match(/.*__A$/)) {
            adjName += "[]";
        }
        sb.append('const ' + types[i] + ' ' + adjName
            + " __attribute__ ((section (\".rodata_" + names[i]
            + "\")));\n");
    }
    return (sb.toString() + "");
}
/*
 *  @(#) gnu.targets.arm; 1, 0, 0,0; 11-8-2017 17:20:18; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

