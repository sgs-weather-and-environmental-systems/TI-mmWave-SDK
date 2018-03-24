/* 
 *  Copyright (c) 2013 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */

function getLibs(prog)
{
    var libs = "lib/boot.a" + prog.build.target.suffix;
    if (prog.targetModules().length > 0 && this.Settings.bootOnly == false) {
        libs = "lib/" + this.$name + ".a" + prog.build.target.suffix + ";"
            + libs;
    }
    return (libs);
}

function getSects() 
{
    return ("ti/targets/msp430/rts430/link.xdt");
}
/*
 *  @(#) ti.targets.msp430.rts430; 1, 0, 0,0; 11-8-2017 18:01:41; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

