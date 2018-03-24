/*
 * Copyright (c) 2016, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */

/*
 *  ======== Platform.xs ========
 *
 */

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
    return (Utils.getCpuDataSheet(this.$private.cpuAttrs));
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

    if (prog.build.target.$name.match("ti.targets")) {
        this.$module.$logError("This platform is intended to be used with "
            + "non-TI targets. Please use 'ti.platforms.generic' for TI "
            + "targets.", this, prog.build.target.$name);
    }

    /* create a default ExeContext execution context */
    var cpu = ExeContext.create(this.$private.cpuAttrs, this.$module.BOARD);

    return (cpu);
}

/*
 *  ======== Platform.getExecCmd ========
 *  This Platform's implementation xdc.platform.IPlatform.getExecCmd.
 */
function getExecCmd(prog)
{
    return ("@$(ECHO) host.platforms.arm package does not know how to " +
        "execute " + prog.name + "\n");
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
    /*  cache the platform instance name for the methods above. */
    this.$private.name = name;

    /*  Determine an appropriate CPU to simulate
     */

    var cpuAttrs = new xdc.om['xdc.platform'].IExeContext.Cpu({clockRate: 0});

    if (this.deviceName != undefined) {
        if ((typeof this.deviceName) != "string") {
            this.$module.$logError(this.$package.$name + ": 'deviceName' must "
                + "be a string", this, this.deviceName);
        }
    }
    else {
        this.$module.$logError("Parameter deviceName must be specified for "
            + "'host.platforms.arm' platform.", this, this.deviceName);
    }

    if (this.catalogName != undefined) {
        if ((typeof this.catalogName) != "string") {
            this.$module.$logError(this.$package.$name + ": catalog name must "
                + "be a string", this, this.catalogName);
        }

        /* this platform doesn't know the catalog package until now, so it
         * must dynamically import it here; "real" platforms would declare
         * its catalog package statically in their package.xdc file.
         */
        xdc.loadPackage(this.catalogName);

        if (!(this.deviceName in xdc.om[this.catalogName])) {
            this.$module.$logError("Device " + this.deviceName + " does not"
                + " exist in " + this.catalogName, this, this.deviceName);
        }
    }
    else {
        this.$module.$logError("Parameter catalogName must be specified for "
            + "'host.platforms.arm' platform.", this, this.deviceName);
    }

    if (this.externalMemoryMap.length > 0 || this.customMemoryMap.length > 0
        || this.renameMap.lenght > 0 || this.sectMap.length > 0
        || this.codeMemory != undefined || this.dataMemory != undefined
        || this.stackMemory != undefined) {
        this.$module.$logWarning("The platform 'host.platforms.arm' ignores "
            + "the following configuration parameters: 'sectMap',"
            + " 'customMemoryMap', 'renameMap', 'externalMemoryMap', "
            + " 'codeMemory', 'dataMemory' and 'stackMemory'.", this, null);
    }

    cpuAttrs.deviceName = this.deviceName;
    cpuAttrs.catalogName = this.catalogName;
    this.$private.cpuAttrs = cpuAttrs;
}
