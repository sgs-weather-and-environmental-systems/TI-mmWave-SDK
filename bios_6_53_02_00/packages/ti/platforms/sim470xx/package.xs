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
 *  ======== Package.getLibs ========
 *  This package's implementation of xdc.IPackage.getLibs.
 */
function getLibs()
{
    return (null);    /* no library required for this package */
}

/*
 *  ======== Package.init ========
 *  This function is called when this package is included
 */
function init()
{
}

/*
 *  ======== Package.close ========
 */
function close()
{

    /* Only in cfg step, there is a Program object. */
    if (xdc.om.$name != "cfg") {
        return;
    }

    /* XML file is created from a template because the original XML file
     * from FTSuite 1.0.5 uses bigEndian model, so if we need littleEndian,
     * we need a different XML file.
     */
    if (Program.platform.$private.ftpath != undefined &&
        Program.endian == "little") {
        var cwd = java.lang.System.getProperty("user.dir") + "";
        cwd = cwd.replace(/\\/g, "/");
        var filename = cwd + "/package/cfg/" + Program.name + ".Sim_ARM.xml";

        var file = new java.io.File(filename);
        file["delete"]();
        var fos = new java.io.PrintStream(file);

        var xmlTemp = xdc.loadTemplate(this.packageBase + "Sim_ARM.xml.xdt");
        xmlTemp.genStream(fos, Program.platform, null);
        fos.close();
    }
}
