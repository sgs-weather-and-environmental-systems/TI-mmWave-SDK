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
 *  ======== Platform.xdc ========
 */
package ti.platforms.msp430;

/*!
 *  ======== Platform ========
 *  A generic platform that supports any MSP430 device
 *
 *  The device to be used by this platform is passed as the platform instance
 *  name. On the `xdc.tools.configuro` command line, it is done in the
 *  following way:
 *  @p(code)
 *  xs xdc.tools.configuro ... -p "ti.platforms.msp430:MSP430F2274"
 *  @p
 *
 *  In package.bld, the platform instance is selected as in:
 *  @p(code)
 *  Pkg.addExecutable("test", target, "ti.platforms.msp430:MSP430F5438");
 *  @
 */
metaonly module Platform inherits xdc.platform.IPlatform
{
    config xdc.platform.IPlatform.Board BOARD = {
        id:             "0",
        boardName:      "msp430",
        boardFamily:    null,
        boardRevision:  null
    };

    /*!
     *  ======== nameFormat ========
     *  Encoding of instance creation parameters in the instance's name
     *
     *  For this platform, the parameters `deviceName` and `includeLinkCmdFile`
     *  can be encoded in the instance name supplied on `xdc.tools.configuro`
     *  command line, for example:
     *  @p(code)
     *      xs xdc.tools.configuro ... -p ti.platforms.MSP430:MSP430F5438:1
     *  @p
     *  Optional parameters can be omitted:
     *  @p(code)
     *      xs xdc.tools.configuro ... -p ti.platforms.MSP430:MSP430F5438
     *  @p
     */
     readonly config String nameFormat = "$(deviceName):$(includeLinkCmdFile)";

instance:

    config xdc.platform.IExeContext.Cpu CPU = {
        id:             "0",
        clockRate:      1.0,
        catalogName:    "ti.catalog.msp430",
        deviceName:     "MSP430",
        revision:       "",
    };

    /*!
     *  ======== deviceName ========
     *  The name of an `ICpuDataSheet` module for the device
     *
     *  This parameter is optional; the device name name also be specified
     *  in the name of the the instance.
     */
    config String deviceName;

    /*!
     *  ======== clockRate ========
     *  The clock rate for this device.
     */
    config Double clockRate = 1.0;

    override config String codeMemory = null;

    override config String dataMemory = null;

    override config String stackMemory = null;

    /*!
     *  ======== includeLinkCmdFile ========
     *  Include the default linker command file for the specified device
     *
     *  By default, the user is responsible for adding a linker command file
     *  that defines the device memory map to the linker command line.
     *  However, if this flag is set, this platform will include a default
     *  linker command file for the selected device.
     *
     *  The default linker command files are found along the package path.
     */
    config Bool includeLinkCmdFile = false;
};
