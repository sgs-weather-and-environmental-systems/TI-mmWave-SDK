/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

function run(cmdr, args)
{
    /* Check for command line parameters */
    if (
        (this.deviceModuleName == null) ||
        (this.registerSettings == null)) {
        cmdr.usage();
    }

    var e4x =  new XML(this.registerSettings);
    var regs = {};
    for each(var c in e4x.register) {
        regs[c.name[0]] = c.value[0];
    }

    var deviceModule = xdc.useModule(this.deviceModuleName);
    var inst = deviceModule.create("test");

    var memMap = inst.getMemoryMap(regs);
    var memSecClass =
        xdc.jre.org.eclipse.rtsc.xdctools.ui.cdt.wizards.platform.MemorySection;
    /* Checking for 'object' is how we distinguish between a reference to a
     * class that doesn't exist, and the one that exist for which typeof returns
     * 'function'.
     */
    if (typeof memSecClass == "object") {
        memSecClass =
            xdc.jre.org.eclipse.rtsc.xdctools.ui.wizards.platform.MemorySection;
    }

    var memList = new java.util.ArrayList();
    for (var c in memMap) {
        if (memMap[c].name != undefined) {
            var memSec = new memSecClass(memMap[c].name,memMap[c].base,
                memMap[c].len, memMap[c].space, memMap[c].access);
            memList.add(memSec);
        }
    }
    return memList;
}
/*
 *  @(#) xdc.tools.platformWizard.memoryMap; 1,0,0,0; 1-9-2017 12:51:45; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

