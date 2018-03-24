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
 *  ======== Linux86.xdc ========
 *  Native 32-bit x86 Linux target (ILP32)
 *
 *  This module defines the native target for 32-bit (ILP32) Linux
 *  on an x86 platform.
 */
metaonly module Linux86 inherits gnu.targets.ITarget {
    override readonly config string name                = "Linux86";
    override readonly config string os                  = "Linux";
    override readonly config string suffix              = "86U";
    override readonly config string isa                 = "i686";
    override readonly config xdc.bld.ITarget.Model model= {
        endian: "little"
    };
    override readonly config string rts                 = "gnu.targets.rts86U";
    override config string platform                     = "host.platforms.PC";

    /*!
     *  ======== cc ========
     *  The command used to compile C/C++ source files into object files
     *
     *  The `-m32` flag is required to ensure that this target supports
     *  32-bit Linux systems.
     */
    override readonly config xdc.bld.ITarget2.Command cc = {
        cmd: "$(rootDir)/bin/gcc -c -MD -MF $@.dep",
        opts: "-m32"
    };

    /*!
     *  ======== asm ========
     *  The command used to assembles assembly source files into object files
     */
    override readonly config xdc.bld.ITarget2.Command asm = {
        cmd: "$(rootDir)/bin/gcc -c -x assembler",
        opts: "-m32"
    };

    /*!
     *  ======== lnk ========
     *  The command used to link executables.
     *
     *  The `-m32` flag is required to ensure that this target supports
     *  32-bit Linux systems.
     */
    override readonly config xdc.bld.ITarget2.Command lnk = {
        cmd: "$(rootDir)/bin/gcc",
        opts: "-m32"
    };

    /*
     *  ======== ccOpts ========
     */
    override config xdc.bld.ITarget2.Options ccOpts = {
        prefix: "-fPIC -Wunused",
        suffix: "-Dfar="
    };

    /*
     *  ======== includeOpts ========
     *  $(rootDir)/include        - contains compiler specific headers
     *
     *  GCC compilers for Linux automatically add this directory, but at least
     *  in some cases, the directory is added searched after standard system
     *  directories. This way, we ensure $(rootDir)/include is searched
     *  before standard system directories.
     */
    override config string includeOpts = "-isystem $(rootDir)/include";

    /*
     *  ======== stdTypes ========
     */
    override readonly config xdc.bld.ITarget.StdTypes stdTypes = {
        t_IArg          : { size: 4, align: 4 },
        t_Char          : { size: 1, align: 1 },
        t_Double        : { size: 8, align: 4 },
        t_Float         : { size: 4, align: 4 },
        t_Fxn           : { size: 4, align: 4 },
        t_Int           : { size: 4, align: 4 },
        t_Int8          : { size: 1, align: 1 },
        t_Int16         : { size: 2, align: 2 },
        t_Int32         : { size: 4, align: 4 },
        t_Int64         : { size: 8, align: 4 },
        t_Long          : { size: 4, align: 4 },
        t_LDouble       : { size: 12, align: 4 },
        t_LLong         : { size: 8, align: 4 },
        t_Ptr           : { size: 4, align: 4 },
        t_Short         : { size: 2, align: 2 },
        t_Size          : { size: 4, align: 4 },
    };
}
/*
 *  @(#) gnu.targets; 1, 0, 1,0; 11-8-2017 17:20:10; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

