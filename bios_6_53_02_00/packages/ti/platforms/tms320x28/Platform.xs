/*
 * Copyright (c) 2016-2017, Texas Instruments Incorporated
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
 *  Generic platform support for any TMS320x28 devices.
 */

var Utils = xdc.useModule('xdc.platform.Utils');

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    if (xdc.om.$name != "cfg") {
        return;
    }
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
    var dataSheet = Utils.getCpuDataSheet(cpuAttrs);

    xdc.om["ti.catalog.c2800." + this.CPU.deviceName + ".Instance"].
        $patch('getMemoryMap', this.$private.getMap);

    return (dataSheet);
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
    cpu.memoryMap = Utils.assembleMemoryMap(cpu, this);
    cpu.deviceName = this.deviceName;

    /* We replace whatever map the catalog module returned with the memory
     * map extracted from the linker command file.
     */
    cpu.memoryMap = this.$private.getMap.memMap;

    /* check for the overlap in the memory map */
    var overlap = Utils.checkOverlap(cpu.memoryMap);

    if (overlap != null) {
        this.$module.$logError("Memory objects " + overlap + " overlap", this,
            overlap);
    }

    _initDefaultMemory(this, cpu.memoryMap);
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
    var doNotKnow = "@$(ECHO) ti.platforms.tms320x28 platform package cannot "
        + "execute " + prog.name + " on " + os + "\n";
    return (doNotKnow);
}

/*
 *  ======== Platform.getLinkTemplate ========
 *  This Platform's implementation xdc.platform.IPlatform.getLinkTemplate
 */
function getLinkTemplate(prog)
{
    return ("ti/platforms/tms320x28/linkcmd.xdt");
}

/*
 *  ======== Platform.Instance.init ========
 *  This function is called to initialize a newly created instance of a
 *  platform.  Platform instances are created just prior to running
 *  program configuration scripts.
 *
 *  Platform instances may also be created in the build domain.
 *
 *  @param(name)    the name used to identify this instance (without
 *              the package name prefix)
 *
 *  For this platform, 'name' must identify a catalog module. Besides the
 *  catalog module, this parameter may encode values for other configuration
 *  parameters, as defined by `nameFormat`. The values are separated by ':'.
 */
function instance$meta$init(name)
{
    var maxParamsLength = this.$module.nameFormat.split(":").length;
    var nameParams = name.split(":");

    if (nameParams.length > maxParamsLength) {
        this.$module.$logWarning("The platform ti.platforms.tms320x28 accepts "
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
            + "'ti.platforms.tms320x28:TMS320X28XX', where TMS320X28XX is the "
            + "name of the selected device.", this, this.deviceName);
    }

    if (nameParams[1] != "false" && Boolean(nameParams[1]).valueOf()) {
        this.includeLinkCmdFile = true;
    }

    if (nameParams[2] != undefined && !isNaN(parseFloat(nameParams[2]))) {
        this.clockRate = parseFloat(nameParams[2]);
    }

    if (this.externalMemoryMap.length != 0) {
        this.$module.$logWarning(this.$package.$name + " does not support "
            + "external memory map, and the parameter 'externalMemoryMap' is "
            + "ignored.", this, this.externalMemoryMap);
    }

    this.CPU.clockRate = this.clockRate;

    /* We need the device name so we can include the right linker command file,
     * in case the user requests it.
     */
    var dev = this.deviceName.match(/TMS320([CFR])(\d+)/);
    if (dev == null || dev.length != 3) {
    dev = this.deviceName.match(/([F])(\d+)/);
    if (dev == null) {
            this.$module.$logFatal("Device " + this.deviceName
                + " is not supported.", this.$module);
        }
    }

    if (this.includeLinkCmdFile) {
        var deviceType = dev[1];
        var deviceNumber = dev[2];

        /* Some of the devices do not have a dedicated linker command file. The
         * mapping of such devices to linker command files is done by copying
         * what CCSv4 does for those devices. Also, we use FLASH linker command
         * files for all devices except for the ones starting with '2834', and
         * TMS320R28 devices.
         */
        var dn = deviceNumber;
        if (deviceType == "R" && deviceNumber == "2810") {
            dn = "2812";
        }
        if (deviceNumber == "2811") {
            dn = "2812";
        }
        if (deviceNumber.substring(0, 3) == "282") {
            dn = "283" + deviceNumber.substring(3);
        }

        if (this.deviceName.match(/2837/) || this.deviceName.match(/2807/) ||
        this.deviceName.match(/28004/)) {
            this.$private.linkerFile = xdc.findFile("ti/platforms/tms320x28/"
                + "include/" + this.deviceName + ".cmd");
        }
        else if (dn.substr(0, 4) != "2834" && deviceType != "R") {
            this.$private.linkerFile = xdc.findFile("ti/platforms/tms320x28/"
                + "include/TMS320F" + dn + ".cmd");
        }
        else {
            this.$private.linkerFile = xdc.findFile("ti/platforms/tms320x28/"
                + "include/TMS320C" + dn + ".cmd");
        }
    }

    var memMap = new xdc.om['xdc.platform.IPlatform'].MemoryMap();

    /* We want to use an empty memory map defined here instead of a memory map
     * returned from a catalog module. That same empty memory map has to be
     * used in other functions in this platform instance. If not for the
     * function getCpuDataSheet(), we would simply keep the map as a private
     * object and use it. However, the the function getCpuDataSheet() is
     * supposed to return an object, on which the function getMemoryMap can be
     * called. The object is a CpuDataSheet from the catalog package, but its
     * getMemoryMap function would not return the memory map defined by this
     * platform instance. That's why we need a new function to patch the object
     * from the catalog package.
     */
    this.$private.getMap = function() {
        return (arguments.callee.memMap);
    }
    this.$private.getMap.memMap = memMap;

    /* If we have the device available, we'll use it. Otherwise, we pass
     * 2812 so that an ICpuDataSheet instance will still be generated.
     */
    var catalog = xdc.loadPackage("ti.catalog.c2800");
    if (this.deviceName in catalog) {
        this.CPU.deviceName = this.deviceName;
    }
    else if (this.deviceName.replace(/TMS320[FR]/, "TMS320C") in catalog) {
        this.CPU.deviceName = this.deviceName.replace(/TMS320[FR]/, "TMS320C");
    }
    else {
        this.CPU.deviceName = "TMS320C2812";
    }

    if (this.deviceName.match(/2837/) || this.deviceName.match(/2807/) ||
        this.deviceName.match(/28004/)) {
        var Boot = xdc.useModule('ti.catalog.c2800.initF2837x.Boot');

        Boot.configureClocks = true;
    }
    else {
        var Boot = xdc.useModule('ti.catalog.c2800.init.Boot');

        Boot.disableWatchdog = true;
        Boot.configurePll = true;
        Boot.pllcrDIV = 10;
        Boot.pllstsDIVSEL = 2;


        /*
         * Set the Boot.pllType based on device name.  We set pllType
         * to undefined for the devices that we don't support.
         */
        if (this.deviceName.match(/2802[0-9]/) ||
            this.deviceName.match(/2803[0-9]/) ||
            this.deviceName.match(/2805[0-9]/) ||
            this.deviceName.match(/2806[0-9]/)) {
            Boot.pllType = Boot.Type_2802x_2803x_2806x;
        }
        else if (this.deviceName.match(/2823[0-9]/) ||
            this.deviceName.match(/2833[0-9]/)) {
            Boot.pllType = Boot.Type_282xx_283xx;
        }
        else if (this.deviceName.match(/2834[0-9]/)) {
            Boot.pllType = Boot.Type_2834x;
        }
        else {
            Boot.configurePll = false;    /* do not set up PLL */
            Boot.pllType = undefined;     /* unknown device */
        }
    }
}

/*
 *  ======== _initDefaultMemory ========
 *  Initialize platform's config parameters that define in which memory
 *  segments to place code and data sections.
 */
function _initDefaultMemory(plat, memMap)
{
    plat.dataMemory = null;
    plat.stackMemory = null;
    plat.codeMemory = null;
}
