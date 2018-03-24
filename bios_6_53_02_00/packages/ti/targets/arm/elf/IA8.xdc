/* 
 *  Copyright (c) 2008-2015 Texas Instruments Incorporated
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
 *  ======== IA8.xdc ========
 *  Cortex A8 little endian target
 */
metaonly interface IA8 inherits ti.targets.arm.elf.IArm {
    override readonly config string isa         = "v7A";

    /*
     *  ======== compatibleSuffixes ========
     */
    override config String compatibleSuffixes[] = ["e9", "e7", "e9t"];

    override config string platform   = "ti.platforms.evmDM8168";

    override readonly config xdc.bld.ITarget2.Command lnk = {
        cmd:  "armcl",
        opts: "--silicon_version=7A8 -z --strict_compatibility=on"
    };
}
/*
 *  @(#) ti.targets.arm.elf; 1, 0, 0,0; 11-8-2017 17:20:58; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

