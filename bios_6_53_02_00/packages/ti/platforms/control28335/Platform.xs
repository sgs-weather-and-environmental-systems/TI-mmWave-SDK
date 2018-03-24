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

var Boot = null;
var Utils = xdc.useModule('xdc.platform.Utils');

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    if (xdc.om.$name != "cfg") {
        return;
    }

    Boot = xdc.useModule('ti.catalog.c2800.init.Boot');

    Boot.disableWatchdog = true;
    Boot.pllType = Boot.Type_2802x_2803x_2806x;
    Boot.configurePll = true;
    Boot.pllOSCCLK = 30;
    Boot.pllcrDIV = 10;
    Boot.pllstsDIVSEL = 2;
}

/*
 *  ======== module$use ========
 */
function module$use()
{
    /*
     * Force the boot code into internal memory so that it
     * can safely configure the XINTF
     */
    if (Program.sectMap[".text:.bootCodeSection"] === undefined) {
        Program.sectMap[".text:.bootCodeSection"] = new Program.SectionSpec();
        Program.sectMap[".text:.bootCodeSection"].loadSegment = "L47SARAM";
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

    cpu.memoryMap = Utils.assembleMemoryMap(cpu, this);

    for (var i = 0; i < cpu.memoryMap.length; i++) {
        if (cpu.memoryMap[i].page == null) {
            if (cpu.memoryMap[i].name == "PIEVECT") {
                cpu.memoryMap[i].page = 1;
            }
            else {
                cpu.memoryMap[i].page = 0;
            }
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
    "@$(ECHO) https://www-a.ti.com/downloads/sds_support/targetcontent/rtsc/index.html"
    + "\n\t:";

    if (os == "Solaris") {
        try {
            var gdb = xdc.loadPackage("ti.platforms.utils.gdb");
            return ("$(SHELL) " + gdb.packageBase + "/gdbexec $(1) "
                + prog.name);
        }
        catch (e) {
            return("@$(ECHO) " + this.$package.$name + " platform package " +
                "cannot execute " + prog.name + " on " + os + "\n" +
                 updateComment);
        }
    }
    else if (os == "Windows") {
        return("cscript runtest.js " +
               java.io.File(prog.name).getCanonicalPath());
    }
    else {
        return("@$(ECHO) " + this.$package.$name + " platform package " +
               "cannot execute " + java.io.File(prog.name).getCanonicalPath() +
               " on " + os + "\n" + updateComment);
    }
}

/*
 *  ======== Platform.getLinkTemplate ========
 *  This is Platform's implementation xdc.platform.IPlatform.getLinkTemplate
 */
function getLinkTemplate(prog)
{
    return ("ti/targets/linkcmd.xdt");
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
 */
function instance$meta$init(name)
{
};
