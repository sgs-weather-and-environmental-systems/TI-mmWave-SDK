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
/*!
 *  @_nodoc
 *  ======== A8F.xdc ========
 *  Cortex A8 little endian with floating point support (NEON) (ELF)
 */
metaonly module A8F inherits ti.targets.arm.elf.IA8 {
    override readonly config string name        = "A8F";
    override readonly config string suffix      = "ea8f";
    override readonly config string rts         = "ti.targets.arm.rtsarm";

    override readonly config xdc.bld.ITarget.Model model = {
        endian: "little",
        shortEnums: true
    };

    override readonly config xdc.bld.ITarget2.Command cc = {
        cmd:  "armcl -c",
        opts: "--neon --endian=little -mv7A8 --abi=eabi"
    };

    override readonly config xdc.bld.ITarget2.Command asm = {
        cmd:  "armcl -c",
        opts: "--neon --endian=little -mv7A8 --abi=eabi"
    };
}
/*
 *  @(#) ti.targets.arm.elf; 1, 0, 0,0; 11-8-2017 17:20:57; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

