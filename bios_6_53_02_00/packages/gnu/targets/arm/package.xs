/* 
 *  Copyright (c) 2008-2017 Texas Instruments and others.
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
 *  ======== init ========
 *  Initialize this package.
 *
 *  This is called after all modules in this package are defined and
 *  initialized.  It is called before config.bld.
 */
function init()
{
    /* Remove target checks */
    environment["xdc.cfg.check.exclude"] = ".*";

    /* initialize module configuration params that are computed */
    var ma = this.$modules;
    var gnuTargets = xdc.loadPackage('gnu.targets');
    for (var i = 0; i < ma.length; i++) {
        if (ma[i] instanceof gnuTargets.ITarget.Module) {
            var targ = gnuTargets.ITarget.Module(ma[i]);
            var isas = targ.getISAChain(null);

            if (isas.length > 0) {
                /* add target-specific assembly-language extensions */
                for (var idx = 0; idx < isas.length; idx++) {
                    var ext = ".s" + isas[idx];
                    targ.extensions.$putHead(ext,
                        new xdc.om['xdc.bld.ITarget.Extension'](
                            {suf: ext, typ: "asm"}
                        )
                    );
                }
            }
            else {
                print("Warning: ISAChain is empty for target " + targ);
            }

            /* add .s<suffix> to list of recognized extensions */
            var ext = ".s" + targ.suffix;
            targ.extensions.$putHead(ext,new xdc.om['xdc.bld.ITarget.Extension']({
                suf: ext,   typ: "asm"
            }));
            /*
             * map 4.6.x tools to be compatible with 4.7 tools
             */
            ma[i].versionMap["gcc4.6.1"] = "1,0,4.7";
            ma[i].versionMap["gcc4.6.2"] = "1,0,4.7";
            ma[i].versionMap["gcc4.6.3"] = "1,0,4.7";
            ma[i].versionMap["gcc4.6.4"] = "1,0,4.7";

        }
    }
}

/*
 *  @(#) gnu.targets.arm; 1, 0, 0,0; 11-8-2017 17:20:19; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

