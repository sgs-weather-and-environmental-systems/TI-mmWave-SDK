/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */
/*
 *  ======== ARP32.asmName ========
 */
function asmName(CName)
{
    return (CName);
}

/*
 *  ======== ARP32.link ========
 */
function link(goal)
{
    var target = this;
    
    var cap = xdc.loadCapsule("ti/targets/ITarget.xs");
    cap._initTabs();

    var result = null;
    var tool2cmd = cap._targetCmds[target.suffix];

    if (tool2cmd != null) {
        result = new xdc.om['xdc.bld.ITarget'].CommandSet;
        result.msg = "lnk" + target.suffix + " $@ ...";
        cap._setEnv(target, result);

        var cmd = tool2cmd["link"];
        var pre = target.lnkOpts == null ? "" :
            (goal.dllMode ? "" : target.lnkOpts.prefix);

        result.cmds = xdc.useModule('xdc.bld.Utils').expandString(cmd, {
            LOPTS_P: pre,
            LOPTS_S: target.lnkOpts == null ? "" :
                (goal.dllMode ? "-r -m $(XDCCFGDIR)/$@.map" :
                                target.lnkOpts.suffix),
            lopts:   goal.opts,
            files:   goal.files
        });

        if (goal.dllMode) {
            result.cmds += "$(MV) $@ $(XDCCFGDIR)/$@.obj\n";
            result.cmds += "$(TOUCH) $@\n";
        }
    }

    return (result);
}
/*
 *  @(#) ti.targets.arp32.elf; 1, 0, 0,0; 11-8-2017 17:21:04; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

