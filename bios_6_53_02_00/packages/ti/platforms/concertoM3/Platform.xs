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
 *  Generic platform support for concerto M3 devices.
 */

var Utils = xdc.useModule('xdc.platform.Utils');

/*
 *  ======== module$use ========
 */
function module$meta$init()
{
    /* nullify xdc runtime's .bootVecs */
    Program.sectMap[".bootVecs"] = new Program.SectionSpec();
    Program.sectMap[".bootVecs"].type = "DSECT";
}

/*
 *  ======== Platform.getCpuDataSheet ========
 *  This Platform's implementation xdc.platform.IPlatform.getCpuDataSheet.
 *
 *  Return the xdc.platform.ICpuDataSheet.Instance object that corresponds
 *  to the device that runs executables loaded on the specified cpuId.
 */
function getCpuDataSheet(cpuId)
{
    var cpuAttrs = this.CPU.$copy();
    cpuAttrs.deviceName = this.deviceName;
    return (Utils.getCpuDataSheet(cpuAttrs));
}

/*
 *  ======== Platform.getExeContext ========
 *  This Platform's implementation xdc.platform.IPlatform.getExeContext.
 *
 *  Return the xdc.platform.IExeContext.Instance object that will run the
 *  specified program prog.
 */
function getExeContext(prog)
{
    /* create a default ExeContext execution context */
    var ExeContext = xdc.useModule('xdc.platform.ExeContext');
    var cpu = ExeContext.create(this.CPU, this.$module.BOARD);

    /* This is where we have peripherals available, so we can get their base
     * addresses and other info.
     */

    cpu.memoryMap = Utils.assembleMemoryMap(cpu, this);
    cpu.deviceName = this.CPU.revision;
    cpu.revision = "";

    /* check for the overlap in the memory map */
    var overlap = Utils.checkOverlap(cpu.memoryMap);

    if (overlap != null) {
        this.$module.$logError("Memory objects " + overlap + " overlap", this,
            overlap);
    }

    this.$seal();
    return (cpu);
}

/*
 *  ======== Platform.getExecCmd ========
 *  This Platform's implementation xdc.platform.IPlatform.getExecCmd.
 */
function getExecCmd(prog, packagePath)
{
    var os = environment["xdc.hostOS"];
    var doNotKnow = "@$(ECHO) ti.platforms.msp430 platform package cannot "
        + "execute " + prog.name + " on " + os + "\n";
    return (doNotKnow);
}

/*
 *  ======== Platform.getLinkTemplate ========
 *  This Platform's implementation xdc.platform.IPlatform.getLinkTemplate
 */
function getLinkTemplate(prog)
{
    return ("ti/platforms/concertoM3/linkcmd.xdt");
}

/*
 *  ======== Platform.Instance.init ========
 *  This function is called to initialize a newly created instance of a
 *  platform.  Platform instances are created just prior to running
 *  program configuration scripts.
 *
 *  Platform instances may also be created in the build domain.
 *
 *  @param(name)        the name used to identify this instance (without
 *                      the package name prefix).
 *
 *  For this platform, 'name' must identify a device. Besides the catalog
 *  module, this parameter may encode values for other configuration
 *  parameters, as defined by `nameFormat`. The values are separated by ':'.
 */
function instance$meta$init(name)
{
    var maxParamsLength = this.$module.nameFormat.split(":").length;
    var nameParams = name.split(":");

    if (nameParams.length > maxParamsLength) {
        this.$module.$logWarning("The platform ti.platforms.concertoM3 accepts "
            + "only " + maxParamsLength + " instance parameters in its name. "
            + "The supplied string '" + name + "' contains additional values, "
            + "which will be ignored.", this, this.$module.nameFormat);
    }

    if (nameParams[0] != "" && this.deviceName != null
        && this.deviceName != nameParams[0]) {
        this.$module.$logError(this.$package.$name
            + " was passed two different device names: '" + nameParams[0]
            + "' and '" + this.deviceName + "'.", this, this.deviceName);
    }
    else if (nameParams[0] != "") {
        this.deviceName = nameParams[0];
    }

    if (this.deviceName == null) {
        this.$module.$logFatal("A device name must be specified for the "
            + "platform '" + this.$package.$name + "'. A device name can be "
            + "specified in the platform name, as "
            + "'ti.platforms.concertoM3:F28M35XXXXX', where F28M35XXXXX "
            + "is the name of the selected device.", this, this.deviceName);
    }

    if (nameParams[1] != "false" && Boolean(nameParams[1]).valueOf()) {
        this.includeLinkCmdFile = true;
    }

    if (this.externalMemoryMap.length != 0) {
        this.$module.$logWarning(this.$package.$name + " does not support "
            + "external memory map, and the parameter 'externalMemoryMap' is "
            + "ignored.", this, this.externalMemoryMap);
    }

    /* Use 'revision' to pass 'the catalog device name'. */
    this.CPU.revision = this.deviceName;

    if (this.includeLinkCmdFile) {
        this.$private.linkerFile = xdc.findFile("ti/platforms/concertoM3/"
            + "include/" + this.deviceName + ".cmd");
    }

    /* if in the configuration model ... */
    if (xdc.om.$name == "cfg") {

        /* figure out the clock configuration */
        var Boot = xdc.useModule('ti.catalog.arm.cortexm3.concertoInit.Boot');

        Boot.configureClocks = true;
        Boot.OSCCLK = 20;

        if (this.deviceName.match(/F28M35E/)) {
            Boot.SPLLIMULT = 6;
            Boot.SPLLFMULT = Boot.Fract_0;
            Boot.SYSDIVSEL = Boot.Div_1;
            Boot.M3SSDIVSEL = Boot.M3Div_1;
        }
        else if (this.deviceName.match(/F28M35M/)) {
            Boot.SPLLIMULT = 15;
            Boot.SPLLFMULT = Boot.Fract_0;
            Boot.SYSDIVSEL = Boot.Div_2;
            Boot.M3SSDIVSEL = Boot.M3Div_1;
        }
        else if (this.deviceName.match(/F28M35H/)) {
            Boot.SPLLIMULT = 15;
            Boot.SPLLFMULT = Boot.Fract_0;
            Boot.SYSDIVSEL = Boot.Div_1;
            Boot.M3SSDIVSEL = Boot.M3Div_2;
        }
        else if (this.deviceName.match(/F28M36/)) {
            /* Default here sets M3 = 75Mhz */
            Boot.SPLLIMULT = 15;
            Boot.SPLLFMULT = Boot.Fract_0;
            Boot.SYSDIVSEL = Boot.Div_1;
            Boot.M3SSDIVSEL = Boot.M3Div_2;
        }
        else {
            this.$module.$logError(this.$package.$name
                + " was passed unrecognized device name: '"
                + this.deviceName + "'.", this);
        }
    }
}
