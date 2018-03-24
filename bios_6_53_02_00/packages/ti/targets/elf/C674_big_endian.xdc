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
 *  ======== C674_big_endian.xdc ========
 *
 */

/*!
 *  ======== C674_big_endian ========
 *  TI C674 big endian (ELF)
 */
metaonly module C674_big_endian inherits ITarget {
    override readonly config string name                 = "C674_big_endian";
    override readonly config string suffix               = "e674e";
    override readonly config string isa                  = "674"; 
    override readonly config xdc.bld.ITarget.Model model = {
        endian: "big",
        shortEnums: false
    };
    override readonly config xdc.bld.ITarget.Module base = ti.targets.elf.C64P;

    /*
     *  ======== compatibleSuffixes ========
     */
    override config String compatibleSuffixes[] = ["e64Pe"];

    override config string platform     = "ti.platforms.evmDA830";

    override readonly config xdc.bld.ITarget2.Command cc = {
        cmd: "cl6x -c",
        opts: "-me -mv6740 --abi=eabi"
    };

    override readonly config xdc.bld.ITarget2.Command asm = {
        cmd: "cl6x -c",
        opts: "-me -mv6740 --abi=eabi"
    };

    override readonly config Int bitsPerChar = ti.targets.elf.C64P.bitsPerChar;
}
/*
 *  @(#) ti.targets.elf; 1, 0, 0,0; 11-8-2017 17:21:10; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

