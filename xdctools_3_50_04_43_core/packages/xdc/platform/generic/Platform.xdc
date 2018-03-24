/*
 *  ======== Platform.xdc ========
 */

/*!
 *  ======== Platform ========
 *  A generic platform that supports any HW platform
 *
 *  This module implements xdc.platform.IPlatform and defines configuration
 *  parameters that correspond to this platform's Cpu's, Board's, etc.
 */
metaonly module Platform inherits xdc.platform.IPlatform
{
    config xdc.platform.IPlatform.Board BOARD = { 
        id:             "0",
        boardName:	"generic",
        boardFamily:    null,
        boardRevision:  null
    };

instance:

    config xdc.platform.IExeContext.Cpu CPU = { 
        id:		"0",
	clockRate:	0,
        catalogName:	null,
	deviceName:	null,
	revision:	"",
    };

    /*!
     *  ======== deviceName ========
     *  The CPU provided by this platform
     *
     *  This parameter is required and named a module within a "catalog"
     *  package that implements the `xdc.platform.ICpuDataSheet` interface.
     *
     *  @see xdc.platform.ICpuDataSheet
     *  @see #catalogName
     */
    config string deviceName;

    /*!
     *  ======== catalogName ========
     *  The name of the package that contains the module 'deviceName'.
     *
     *  This parameter is required.
     *
     *  @see #deviceName
     */
    config string catalogName;

    /*!
     *  ======== clockRate ========
     *  The clock rate for the simulated device.
     *
     *  This parameter is required. There are no checks to determine if the
     *  device can actually support the given clock rate.
     *
     *  This clock rate is used to compute CPU loads and may be used
     *  by configuration scripts to configure/check on-device timers.
     */
    config Double clockRate;

    /*
     *  ======== codeMemory ========
     *  See xdc.platform.IPlatform
     */
    override config string codeMemory = null;
    
    /*
     *  ======== dataMemory ========
     *  See xdc.platform.IPlatform
     */
    override config string dataMemory = null;

    /*
     *  ======== stackMemory ========
     *  See xdc.platform.IPlatform
     */
    override config string stackMemory = null;

    /*!
     *  ======== verbose ========
     *  The flag for printing debug info.
     */
    config Bool verbose;
};
/*
 *  @(#) xdc.platform.generic; 1, 0, 0,0; 11-8-2017 17:10:49; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

