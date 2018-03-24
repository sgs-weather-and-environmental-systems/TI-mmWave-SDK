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
 *  Platform support for evmTI814X
 *
 */

var Utils = xdc.useModule('xdc.platform.Utils');

/*
 *  ======== Platform.getCpuDataSheet ========
 *  This Platform's implementation xdc.platform.IPlatform.getCpuDataSheet.
 *
 *  Return the xdc.platform.ICpuDataSheet.Instance object that corresponds
 *  to the device that runs executables loaded on the specified cpuId.
 */
function getCpuDataSheet(cpuId)
{
    if (cpuId == "0") {
        return (Utils.getCpuDataSheet(this.$module.GEM));
    }
    else if (cpuId == "1") {
        return (Utils.getCpuDataSheet(this.$module.DSS));
    }
    else if (cpuId == "2") {
        return (Utils.getCpuDataSheet(this.$module.GPP));
    }
    else {
        this.$module.$logError("The platform " + this.$module.$name +
            " does not contain cpu with cpuId: " + cpuId, this.$module, null);
    }
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
    var cpu;
    var core;
    var gppChain = ["470", "v4T", "v5T", "v5TE", "v5t", "v6", "v7A", "v7A8"];
    var armChain = ["v7M"];
    var dspChain = ["62", "64", "64P", "674"];
    for (var i = 0; i < dspChain.length; i++) {
        if (dspChain[i] == prog.build.target.isa) {
            xdc.loadPackage(this.$module.GEM.catalogName);
            cpu = ExeContext.create(this.$module.GEM, this.$module.BOARD);
            core = "DSP";
        }
    }
    if (cpu == undefined) {
        /* haven't found it yet, keep looking... */
        for (var i = 0; i < armChain.length; i++) {
            if (armChain[i] == prog.build.target.isa) {
                xdc.loadPackage(this.$module.DSS.catalogName);
                cpu = ExeContext.create(this.$module.DSS, this.$module.BOARD);
                core = "M3";
            }
        }
    }
    if (cpu == undefined) {
        /* haven't found it yet, keep looking... */
        for (var i = 0; i < gppChain.length; i++) {
            if (gppChain[i] == prog.build.target.isa) {
                xdc.loadPackage(this.$module.GPP.catalogName);
                cpu = ExeContext.create(this.$module.GPP, this.$module.BOARD);
                core = "HOST";
            }
        }
    }
    if (cpu == undefined) {
        this.$module.$logError("The build target " + prog.build.target.$name +
            " is incompatible with this platform.", this.$module, null);
    }

    /* Set the initial memory map from the cpu datasheet. */
    cpu.memoryMap = Utils.assembleMemoryMap(cpu, this);

    if (this.codeMemory == undefined) {
        switch(core) {
            case "DSP":
                this.codeMemory = "DDR3_DSP";
                break;
            case "M3":
                this.codeMemory = "DDR3_M3";
                break;
            case "HOST":
                this.codeMemory = "DDR3_HOST";
                break;
        }
    }

    if (this.dataMemory == undefined) {
        switch(core) {
            case "DSP":
                this.dataMemory = "DDR3_DSP";
                break;
            case "M3":
                this.dataMemory = "DDR3_M3";
                break;
            case "HOST":
                this.dataMemory = "DDR3_HOST";
                break;
        }
    }

    if (this.stackMemory == undefined) {
        switch(core) {
            case "DSP":
                this.stackMemory = "DDR3_DSP";
                break;
            case "M3":
                this.stackMemory = "DDR3_M3";
                break;
            case "HOST":
                this.stackMemory = "DDR3_HOST";
                break;
        }
    }

    // check for the overlap in the memory map
    var overlap = Utils.checkOverlap(cpu.memoryMap);

    if (overlap != null) {
        this.$module.$logError("Memory objects " + overlap + " overlap", this,
            overlap);
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
    "@$(ECHO) http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/rtsc/index.html";

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

    /* Use bare metal linker command file if appropriate */
    if (Program.build.target.$name.match(/gnu.targets.arm.A/) ||
        Program.build.target.$name.match(/gnu.targets.arm.M/)) {
        var templateName = tpkg.replace(/\./g, "/") + "/linkcmd_bm_v7a.xdt";
    }
    else {
        var templateName = tpkg.replace(/\./g, "/") + "/linkcmd.xdt";
    }

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
 *  @param(name)        the name used to identify this instance (without
 *                      the package name prefix).
 */
function instance$meta$init(name)
{
}
