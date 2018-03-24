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
 *  ======== Package.getLibs ========
 */
function getLibs(prog)
{
    var libs = "lib/boot.a" + Program.build.target.suffix + ";lib/syscalls.a"
        + Program.build.target.suffix;

    if (Program.build.target.os == "Linux") {
        libs = "";
    }

    if (prog.targetModules().length > 0 && this.Settings.bootOnly == false) {
        libs = "lib/" + this.$name + ".a" + Program.build.target.suffix + ";"
            + libs;
    }
    return (libs);
}
/*
 *  @(#) gnu.targets.arm.rtsv7A; 1, 0, 0,0; 11-8-2017 17:59:48; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

