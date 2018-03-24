/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

package xdc.tools.platformWizard.memoryMap;

/*
 * @_nodoc
 */
metaonly module Main inherits xdc.tools.ICmd {

    override config String usage[] = [
        ' -m <Module Name>',
        ' -r <Register Settings>'
    ];

instance:
        
        @CommandOption("m")
        config String deviceModuleName = null;

        @CommandOption("r")
        config String registerSettings = null;
        
    override Any run(xdc.tools.Cmdr.Instance cmdr, String args[]);

}
/*
 *  @(#) xdc.tools.platformWizard.memoryMap; 1,0,0,0; 1-9-2017 12:51:45; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

