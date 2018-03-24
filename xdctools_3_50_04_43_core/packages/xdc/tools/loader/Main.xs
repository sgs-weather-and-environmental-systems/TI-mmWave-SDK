/* 
 *Copyright (c) 2008 Texas Instruments and others.
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
 *  ======== run ========
 */
function run(cmdr, args)
{
    /* Platforms look for xdc.hostOS to determine which loader to use. */
    environment["xdc.hostOS"] = java.lang.System.getProperty("os.name") + "";
    if (environment["xdc.hostOS"].match(/^Windows/i)) {
        environment["xdc.hostOS"] = "Windows";
    }

    var inst = this.$private;
    inst.self = this;
 
    for (p in inst.self) inst[p] = inst.self[p];
 
    inst.cmdr = cmdr;
    inst.args = args;
 
    if (inst.args.length == 0) {
        inst.cmdr.error("one or more arguments are required");
    }
 
    var progName = inst.args[0];
 
    var versCmd = "\"" + environment["xdc.root"] + "/vers\" \"" + progName
                + "\"";
    var versStat = {};
 
    xdc.exec(versCmd, {}, versStat);
 
    var m = versStat.output.match(/__ASM__ = (.+)$/m);
    if (!m) {
        inst.cmdr.error("program file contains no assembly information");
    }

    var cap = xdc.loadCapsule(m[1] + '.rov.xs');
    var prog = {};
    prog.build = cap.build;
    prog.name = progName;
 
    m = versStat.output.match(/__PLAT__ = (.+)$/m);
    if (!m) {
        inst.cmdr.error("program file contains no platform information");
    }
 
    var platMod = xdc.useModule(m[1] + '.Platform');
    var platInst = platMod.create("");
    
    var execCmd = platInst.getExecCmd(prog, platMod.$package.packageBase);
    execCmd = execCmd.replace('$(1) ', '');
    for (var i = 1; i < args.length; i++) {
        execCmd += ' ' + args[i];
    }
    var execStat = {};
 
    xdc.exec(execCmd, {}, execStat);
    java.lang.System.out.print(execStat.output);
}
/*
 *  @(#) xdc.tools.loader; 1, 0, 0,0; 1-9-2017 12:51:34; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

