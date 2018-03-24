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
 *  ======== Platform.getCpuDataSheet ========
 *  This Platform's implementation xdc.platform.IPlatform.getCpuDataSheet.
 *
 *  Return the xdc.platform.ICpuDataSheet.Instance object that corresponds
 *  to the device that runs executables loaded on the specified cpuId.
 */
function getCpuDataSheet(cpuId)
{
    var Utils = xdc.useModule('xdc.platform.Utils');
    return (Utils.getCpuDataSheet(this.$module.CPU));
}

/*
 *  ======== Platform.getExeContext ========
 *  This Platform's implementation xdc.platform.IPlatform.getExeContext.
 *
 *  Return the xdc.platform.IPlatform.ExeContext object that will run the
 *  specified program prog.
 */
function getExeContext(prog)
{
    var ExeContext = xdc.useModule('xdc.platform.ExeContext');

    /* create a default ExeContext execution context */
    var cpu = ExeContext.create(this.$module.CPU, this.$module.BOARD);

    return (cpu);
}

/*
 *  ======== Platform.getExecCmd ========
 *  This Platform's implementation xdc.platform.IPlatform.getExecCmd.
 */
function getExecCmd(prog)
{
    var tos = prog.build.target.os;
    var bos = environment["xdc.hostOS"] + "";

    if (bos == tos) {
	return ("./" + prog.name);
    }
    else if (bos == "Linux" || bos == "Windows") {
	return (this.$package.packageBase + "/" + bos + "/exec " + prog.name);
    }

    return ("@$(ECHO) host.platforms.PC package does not know how to " +
        "execute " + prog.name + " on " + tos + "\n");
}

/*
 *  ======== Platform.getLinkTemplate ========
 *  This is Platform's implementation xdc.platform.IPlatform.getLinkTemplate
 */
function getLinkTemplate(prog)
{
    /* use the target's linker command template */

    /* we compute the target because this same platform is supported by
     * many different tool chains; e.g., gnu.targets, microsoft.targets, ...
     */
    var tname = Program.build.target.$name;
    var tpkg = tname.substring(0, tname.lastIndexOf('.'));
    return (tpkg.replace(/\./g, "/") + "/linkcmd.xdt");
}

/*
 *  ======== Platform.Instance.init ========
 *  This function is called to initialize a newly created instance of a
 *  platform.  Platform instances are created just prior to running
 *  program configuration scripts.
 *
 *  Platform instances may also be created in the build domain.
 *
 *  name is the name used to identify this instance (without
 *  the package name prefix).
 */
function instance$meta$init(name)
{
}
/*
 *  @(#) host.platforms.PC; 1, 0, 0,0; 11-8-2017 17:09:36; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

