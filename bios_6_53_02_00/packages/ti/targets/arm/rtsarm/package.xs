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
 *  ======== Package.close ========
 */
function close()
{
    if (xdc.om.$name != 'cfg') {
        return;
    }
    if ((Program.build.target.isa == "v7M") ||
            (Program.build.target.isa == "v7M4")) {
        if (Program.sectMap[".bootVecs"] === undefined) {
            Program.sectMap[".bootVecs"] = new Program.SectionSpec();
            Program.sectMap[".bootVecs"].loadAddress = 0x0;
        }
    }
}

/*
 *  ======== Package.getLibs ========
 */
function getLibs(prog)
{
    var libs = "lib/boot.a" + prog.build.target.suffix
        + ";lib/auto_init.a" + prog.build.target.suffix;
    if (prog.targetModules().length > 0 && this.Settings.bootOnly == false) {
        libs = "lib/" + this.$name + ".a" + prog.build.target.suffix + ";"
            + libs;
    }
    return (libs);

}

function getSects() {
    if (Program.targetModules().length == 0) {
        return ("ti/targets/rts6000/link.xdt");
    }
    else {
        return (null);
    }
}
/*
 *  @(#) ti.targets.arm.rtsarm; 1, 0, 0,0; 11-8-2017 18:01:11; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

