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
 *  ======== ARP32.xdc ========
 *
 */

/*!
 *  ======== ARP32 ========
 *  TI ARP32 default runtime model (little endian)
 */
metaonly module ARP32 inherits IARP32 {
    override readonly config string name            = "ARP32";  
    override readonly config string suffix          = "earp32";

    override readonly config xdc.bld.ITarget.Model model = {
        endian: "little",
        dataModel: "far_aggregates",
        shortEnums: true
    };

    override readonly config xdc.bld.ITarget2.Command cc = {
        cmd: "cl-arp32 -c --gen_func_subsections",
        opts: "--mem_model:data=far_aggregates --silicon_version=v210"
    };

    override readonly config xdc.bld.ITarget2.Command asm = {
        cmd: "cl-arp32 -c --gen_func_subsections",
        opts: "--mem_model:data=far_aggregates --silicon_version=v210"
    };

}

/*
 *  @(#) ti.targets.arp32.elf; 1, 0, 0,0; 11-8-2017 17:21:03; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

