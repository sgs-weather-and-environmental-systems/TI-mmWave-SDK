/*
 *  ======== Platform.xdc ========
 */

package ti.platforms.evmDM37XX;

/*!
 *  ======== Platform ========
 *  Platform support for the evmDM37XX
 *
 *  This module implements xdc.platform.IPlatform and defines configuration
 *  parameters that correspond to this platform's Cpu's, Board's, etc.
 *
 *  The configuration parameters are initialized in this package's
 *  configuration script (package.cfg) and "bound" to the TCOM object
 *  model.  Once they are part of the model, these parameters are
 *  queried by a program's configuration script.
 *
 *  This particular platform has multiple CPUs, and therefore, declares
 *  multiple CPU configuration objects.
 */
metaonly module Platform inherits xdc.platform.IPlatform
{
    readonly config xdc.platform.IPlatform.Board BOARD = {
        id:             "0",
        boardName:      "evmDM37XX",
        boardFamily:    "evmDM37XX",
        boardRevision:  null,
    };

    readonly config xdc.platform.IExeContext.Cpu DSP = {
        id:             "0",
        clockRate:      332.0,
        catalogName:    "ti.catalog.c6000",
        deviceName:     "DM37XX",
        revision:       "",
    };

    readonly config xdc.platform.IExeContext.Cpu GPP = {
        id:             "1",
        clockRate:      332.0,
        catalogName:    "ti.catalog.arm.cortexa8",
        deviceName:     "DM37XX",
        revision:       "1.0",
    };
instance:

    override readonly config xdc.platform.IPlatform.Memory
        externalMemoryMap[string] = [
            [
                "DDR",
                {
                    name: "DDR",
                    base: 0x80000000,
                    len: 0x04000000
                }
            ]
        ];

    /*
     *  ======== sectMap ========
     *  Define a placement of compiler generated output sections into
     *  memory regions defined in the memTab above.
     */
    override config string codeMemory = "DDR";

    override config string dataMemory = "DDR";

    override config string stackMemory = "DDR";

    /*
     *  ======== l1PMode ========
     *  Define the amount of L1P RAM used for L1 Program Cache.
     *
     *  Check the device documentation for valid values.
     */
    config String l1PMode = "32k";

    /*
     *  ======== l1DMode ========
     *  Define the amount of L1D RAM used for L1 Data Cache.
     *
     *  Check the device documentation for valid values.
     */
    config String l1DMode = "32k";

    /*
     *  ======== l2Mode ========
     *  Define the amount of L2 RAM used for L2 Cache.
     *
     *  Check the device documentation for valid values.
     */
    config String l2Mode = "0k";

};
