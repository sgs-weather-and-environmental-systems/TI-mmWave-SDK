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
/*!
 *  ======== gnu.targets.arm.ITarget ========
 *  Interface to GCC compatible Arm compilers
 */
metaonly interface ITarget inherits gnu.targets.ITarget {
    /*!
     *  ======== ar ========
     *  The command used to create an archive
     */
    override readonly config xdc.bld.ITarget2.Command ar = {
        cmd: "$(rootDir)/bin/$(GCCTARG)-ar",
        opts: "cr"
    };

    /*!
     *  ======== lnk ========
     *  The command used to link executables.
     */
    override readonly config xdc.bld.ITarget2.Command lnk = {
        cmd: "$(rootDir)/bin/$(GCCTARG)-gcc",
        opts: ""
    };

    /*!
     *  ======== cc ========
     *  The command used to compile C/C++ source files into object files
     */
    override readonly config xdc.bld.ITarget2.Command cc = {
        cmd: "$(rootDir)/bin/$(GCCTARG)-gcc -c -MD -MF $@.dep",
        opts: ""
    };

    /*!
     *  ======== asm ========
     *  The command used to assembles assembly source files into object files
     */
    override readonly config xdc.bld.ITarget2.Command asm = {
        cmd: "$(rootDir)/bin/$(GCCTARG)-gcc -c -x assembler",
        opts: ""
    };

    /*
     *  ======== profiles ========
     *
     *  -fdata-sections is removed from "release" because of
     *  https://bugs.launchpad.net/gcc-linaro/+bug/1329080. It applies only to
     *  Linux-on-Arm targets. The bare metal targets specify -fdata-sections
     *  in their ccOpts, so this change doesn't affect them.
     */
    override config xdc.bld.ITarget.OptionSet profiles[string] = [
        ["debug", {
            compileOpts: {
                copts: "-g",
                defs:  "-D_DEBUG_=1",
            },
            linkOpts: "-g",
        }],

        ["release", {
            compileOpts: {
                copts: "-O2 -ffunction-sections",
            },
            linkOpts: "-Wl,--gc-sections",
        }],

        ["profile", {
            compileOpts: {
                copts: "-g -pg",
            },
            linkOpts: "-pg"     /* can't use -static here */
        }],

        ["coverage", {
            compileOpts: {
                copts: "-fprofile-arcs -ftest-coverage",
            },
            linkOpts: "-fprofile-arcs -ftest-coverage",
        }],
    ];



}
/*
 *  @(#) gnu.targets.arm; 1, 0, 0,0; 11-8-2017 17:20:18; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

