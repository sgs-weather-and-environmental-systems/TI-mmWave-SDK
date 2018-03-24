/* 
 *  Copyright (c) 2014-2015 Texas Instruments Incorporated
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */

/*!
 *  ======== IM0.xdc ========
 *  Cortex M0 little endian thumb2 target
 */
metaonly interface IM0 inherits ti.targets.arm.elf.IArm {
    override readonly config string isa         = "v6M";

    override config string platform   = "ti.platforms.simCM3";

    override readonly config xdc.bld.ITarget.Model model = {
        endian: "little",
        codeModel: "thumb2",
        shortEnums: true
    };

    override readonly config xdc.bld.ITarget2.Command lnk = {
        cmd:  "armcl",
        opts: "--silicon_version=6M0 -z --strict_compatibility=on"
    };
}
/*
 *  @(#) ti.targets.arm.elf; 1, 0, 0,0; 11-8-2017 17:20:58; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

