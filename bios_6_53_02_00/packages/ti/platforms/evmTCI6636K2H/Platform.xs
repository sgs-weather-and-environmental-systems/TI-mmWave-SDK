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

    if (cpuId == "0") {
        return (Utils.getCpuDataSheet(this.$module.DSP));
    }
    else if (cpuId == "1") {
        return (Utils.getCpuDataSheet(this.$module.GPP));
    }
    else {
        this.$module.$logError("The platform " + this.$module.$name +
            " does not contain cpu with cpuId: " + cpuId, this.$module, null);
    }
}

/*
 *  ======== Platform.getCreateArgs ========
 */
function getCreateArgs()
{
    return (this.$private.args);
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
    var Utils = xdc.useModule('xdc.platform.Utils');

    var ExeContext = xdc.useModule('xdc.platform.ExeContext');

    /* create a default ExeContext execution context */
    var cpu;
    var core = this.$private.core;

    cpu = ExeContext.create(this.$module[core], this.$module.BOARD);

    /* Set the initial memory map from the cpu datasheet. Check if the user
     * tried to set cpuArgs, and if it's the case print a deprecation
     * warning message.
     */
    if (prog.build.cpuArgs != null) {
        this.$module.$logWarning("The parameter 'cpuArgs' in xdc.bld.Executable " +
            "is deprecated and will not be supported in future releases. " +
            "Please, use corresponding platform instance parameters to set " +
            "the initial register settings.", this.$module, null);

        for (var prop in prog.build.cpuArgs) {
            if (!(prop in this.$private.args)) {
                this.$private.args[prop] = prog.build.cpuArgs[prop];
            }
        }
    }
    cpu.memoryMap = Utils.assembleMemoryMap(cpu, this);

    // check for the overlap in the memory map
    var overlap = Utils.checkOverlap(cpu.memoryMap);

    if (overlap != null) {
        this.$module.$logError("Memory objects " + overlap + " overlap", this,
            overlap);
    }

    if (this.codeMemory == undefined) {
        switch(core) {
            case "DSP":
                this.codeMemory = "L2SRAM";
                break;
            case "GPP":
                this.codeMemory = "DDR3";
                break;
        }
    }

    if (this.dataMemory == undefined) {
        switch(core) {
            case "DSP":
                this.dataMemory = "L2SRAM";
                break;
            case "GPP":
                this.dataMemory = "DDR3";
                break;
        }
    }

    if (this.stackMemory == undefined) {
        switch(core) {
            case "DSP":
                this.stackMemory = "L2SRAM";
                break;
            case "GPP":
                this.stackMemory = "DDR3";
                break;
        }
    }

    Utils.checkDefaults(this, cpu.memoryMap);
    this.$seal();

    return (cpu);
}

/*
 *  ======== Platform.getExecCmd ========
 *  This Platform's implementation xdc.platform.IPlatform.getExecCmd.
 */
function getExecCmd(prog)
{
    var os = environment["xdc.hostOS"];
    var updateComment = "@$(ECHO) Check for updates to this package at:\n" +
    "@$(ECHO) https://www-a.ti.com/downloads/sds_support/targetcontent/rtsc/index.html";

    return("@$(ECHO) " + this.$package.$name + " platform package cannot " +
           "execute " + prog.name + " on " + os + "\n" + updateComment +
           "\n\t:");
}

/*
 *  ======== Platform.getLinkTemplate ========
 *  This is Platform's implementation xdc.platform.IPlatform.getLinkTemplate
 */
function getLinkTemplate(prog)
{
    /* use the target's linker command template */
    /* we compute the target because this same platform is supported by
     * many different tool chains; e.g., ti.targets, gnu.targets, ...
     */
    var tname = prog.build.target.$name;
    var tpkg = tname.substring(0, tname.lastIndexOf('.'));
    var tmplName = "/linkcmd.xdt";

    /* Use bare metal linker command file if appropriate */
    if (Program.build.target.$name.match(/gnu.targets.arm.A/)) {
        tmplName = "/linkcmd_bm_v7a.xdt";
    }

    var templateName = tpkg.replace(/\./g, "/") + tmplName;

    if (xdc.findFile(templateName) != null) {
        return (templateName);
    }
    else if (tname.indexOf("ti.targets.") == 0) {
        return ("ti/targets/linkcmd.xdt");
    }
    else {
        throw new Packages.xdc.services.global.XDCException(
            this.$package.$name + ".LINK_TEMPLATE_ERROR",
            "Target package " + tpkg + " does not contain linker command "
            + "template 'linkcmd.xdt'.");
    }
}

/*
 *  ======== Platform.Instance.init ========
 *  This function is called to initialize a newly created instance of a
 *  platform.  Platform instances are created just prior to running
 *  program configuration scripts.
 *
 *  Platform instances may also be created in the build domain.
 *
 *  this.$args.args is the object configured in config.bld via
 *  Build.platformTable.  This is an untyped object that may specify
 *  platform specific parameters.
 *
 *  this.$args.name is the name used to identify this instance (without
 *  the package name prefix).
 */
function instance$meta$init(name, args)
{
    /* cache the platform creation args and platform instance name for the
     * getExeContext method above.
     */
    this.$private.args = this.$args.args;    /* instance args structure */
    this.$private.name = this.$args.name;    /* instance name */

    if (args != null) {
        if ("sectMap" in args) {
            this.sectMap = args.sectMap;
        }

        if ("customMemoryMap" in args) {
            this.customMemoryMap = args.customMemoryMap;
        }

        if ("renameMap" in args) {
            this.renameMap = args.renameMap;
        }

        if ("externalMemoryMap" in args) {
            var Utils = xdc.useModule('xdc.platform.Utils');

            /* The external map has to be of the right type for this check to
             * work.
             */
            var external = new xdc.om['xdc.platform.IPlatform'].MemoryMap(
                args.externalMemoryMap);
            if (!Utils.checkFit(this.$module.PARAMS.externalMemoryMap,
                                external)) {
                this.$module.$logError("External memory map cannot fit in " +
                    "the available space.", this, null);
            }
            this.externalMemoryMap = external;
        }

        if("codeMemory" in args) {
            this.codeMemory = args.codeMemory;
        }

        if("dataMemory" in args) {
            this.dataMemory = args.dataMemory;
        }

        if("stackMemory" in args) {
            this.stackMemory = args.stackMemory;
        }
    }

    var thisMod = this.$module;
    var modArgs = {};

    if (name in thisMod) {
        modArgs = thisMod[name];
    }

    var dspChain = ["62", "64", "64P", "674", "66"];
    var gppChain = ["v7A15"];

    for (var i = 0; i < dspChain.length; i++) {
        if (dspChain[i] == Program.build.target.isa) {
            modArgs.core = "DSP";
            xdc.loadPackage(this.$module.DSP.catalogName);
        }
    }

    for (var i = 0; i < gppChain.length; i++) {
        if (gppChain[i] == Program.build.target.isa) {
            modArgs.core = "GPP";
            xdc.loadPackage(this.$module.GPP.catalogName);
        }
    }

    /* Save 'core' to avoid computing it again */
    this.$private.core = modArgs.core;
};
