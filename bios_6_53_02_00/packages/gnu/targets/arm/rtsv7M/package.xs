/* 
 *  Copyright (c) 2015 Texas Instruments and others.
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
 *  ======== Package.getLibs ========
 */
function getLibs(prog)
{
    var libs = "lib/boot.a" + Program.build.target.suffix + ";lib/syscalls.a"
        + Program.build.target.suffix;

    if (prog.targetModules().length > 0 && this.Settings.bootOnly == false) {
        libs = "lib/" + this.$name + ".a" + Program.build.target.suffix + ";"
            + libs;
    }
    return (libs);
}

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
            Program.sectMap[".intvecs (0) : AT(0) { KEEP(*(.bootVecs)) }"] = new Program.SectionSpec();
            Program.sectMap[".intvecs (0) : AT(0) { KEEP(*(.bootVecs)) }"].runSegment = Program.platform.codeMemory;
        }
    }
}
/*
 *  @(#) gnu.targets.arm.rtsv7M; 1, 0, 0,0; 11-8-2017 17:59:56; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

