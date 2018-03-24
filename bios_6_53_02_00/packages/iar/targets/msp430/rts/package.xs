/* 
 *  Copyright (c) 2012 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */

function getLibs (prog)
{
    var suffix = prog.build.target.suffix;
    var profile = this.profile;
    var lib = "lib/" + profile + "/boot.a" + suffix;

    if (suffix == null) {
        return (null);
    }

    if (!(java.io.File(this.packageBase + lib).exists())) {
        prog.$logWarning("Rts library for " + this. profile  + " profile is not"
            + " available. Instead a rts library for release profile will" 
            + " be linked", prog);
        lib = "lib/release/boot.a" + suffix;
        profile = "release";
    }
    if (prog.targetModules().length > 0 && this.Settings.bootOnly == false) {
        lib = "lib/" + profile + "/" + this.$name + ".a" + suffix + ";" + lib;
    }

    return (lib);
}

function getSects() {
    if (Program.targetModules().length == 0) {
        return ("iar/targets/msp430/rts/link.xdt");
    }
    else {
        return (null);
    }
}
/*
 *  @(#) iar.targets.msp430.rts; 1, 0, 0,0; 11-8-2017 18:00:50; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

