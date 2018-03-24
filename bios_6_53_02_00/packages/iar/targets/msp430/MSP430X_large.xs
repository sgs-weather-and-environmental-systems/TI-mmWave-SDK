/* 
 *  Copyright (c) 2014 Texas Instruments and others.
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
 *  ======== MSP430X_large.getRawVersion ========
 */
var checkVers =  true;

function getRawVersion()
{
    var result = this.$super.getRawVersion.$fxn.call(this);

    if (checkVers && parseFloat(result).toFixed(2) < 6.10) {
        for (var i in this.profiles) {
            /* Older toolchains have different naming conventions */
            var copts = this.profiles[i].compileOpts.copts;
            copts = copts.replace(/dl430xllf/, "dl430xlf");
            this.profiles[i].compileOpts.copts = copts; 

            var linkOpts = this.profiles[i].linkOpts;
            linkOpts = linkOpts.replace(/dl430xllf/, "dl430xlf");
            this.profiles[i].linkOpts = linkOpts;
        }
        checkVers = false;
    }

    return (result);
}
/*
 *  @(#) iar.targets.msp430; 1, 0, 0,0; 11-8-2017 17:20:38; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

