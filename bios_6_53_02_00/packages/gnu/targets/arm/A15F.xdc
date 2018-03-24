/*
 *  Copyright 2017 by Texas Instruments Incorporated.
 *
 */

/*
 *  Copyright (c) 2012-2017 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 */
import xdc.bld.ITarget2;

/*!
 *  ======== A15F.xdc ========
 *  Embedded Cortex A15, little endian, hard-float, bare metal target
 *
 *  This module defines an embedded bare metal target on Cortex A15. The target
 *  generates code compatible with the "v7A" architecture.
 *
 */
metaonly module A15F inherits gnu.targets.arm.ITarget {
    override readonly config string name                = "A15F";
    override readonly config string suffix              = "a15fg";
    override readonly config string isa                 = "v7A15";
    override readonly config xdc.bld.ITarget.Model model= {
        endian: "little",
        shortEnums: true
    };

    override readonly config Bool alignDirectiveSupported = true;

    override readonly config string rts = "gnu.targets.arm.rtsv7A";
    override config string platform     = "ti.platforms.sdp5430";

    override config string GCCTARG = "arm-none-eabi";

    override readonly config String stdInclude = "gnu/targets/arm/std.h";

    override readonly config ITarget2.Command cc = {
        cmd: "$(rootDir)/bin/$(GCCTARG)-gcc -c -MD -MF $@.dep",
        opts: "-mcpu=cortex-a15 -mfpu=neon -mfloat-abi=hard -mabi=aapcs -g"
    };

    readonly config ITarget2.Command ccBin = {
        cmd: "bin/arm-none-eabi-gcc -c -MD -MF $@.dep",
        opts: "-mcpu=cortex-a15 -mfpu=neon -mfloat-abi=hard -mabi=aapcs -g"
    };

    override config ITarget2.Options ccOpts = {
        prefix: "-Wunused -Wunknown-pragmas -ffunction-sections -fdata-sections ",
        suffix: "-Dfar= -D__DYNAMIC_REENT__ "
    };

    /*!
     *  ======== ccConfigOpts ========
     *  User configurable compiler options for the generated config C file.
     */
    override config ITarget2.Options ccConfigOpts = {
        prefix: "$(ccOpts.prefix)",
        suffix: "$(ccOpts.suffix)"
    };

    override readonly config ITarget2.Command asm = {
        cmd: "$(rootDir)/bin/$(GCCTARG)-gcc -c -x assembler-with-cpp",
        opts: "-mcpu=cortex-a15 -mfpu=neon -mfloat-abi=hard"
    };

    readonly config ITarget2.Command asmBin = {
        cmd: "bin/arm-none-eabi-gcc -c -x assembler-with-cpp",
        opts: "-mcpu=cortex-a15 -mfpu=neon -mfloat-abi=hard"
    };

    override config ITarget2.Options lnkOpts = {
        prefix: "-mfloat-abi=hard -nostartfiles -Wl,-static -Wl,--gc-sections",
        suffix: "-L$(packageBase)/libs/install-native/$(GCCTARG)/lib/hard -Wl,--start-group -lgcc -lc -lm -Wl,--end-group --specs=nano.specs -Wl,-Map=$(XDCCFGDIR)/$@.map"
    };

    readonly config ITarget2.Command arBin = {
        cmd: "bin/arm-none-eabi-ar ",
        opts: ""
    };

    /*!
     *  ======== bspLib ========
     *  bspLib is assigned the name of the BSP library. The specified library
     *  is included on the link line.
     *
     *  Possible values for this field are "nosys" and "rdimon" with the default
     *  being "nosys".
     */
    override config string bspLib = "nosys";

    /*!
     *  ======== includeOpts ========
     *  Additional user configurable target-specific include path options
     *
     *  This target uses newlib-nano run-time.
     */
    override config string includeOpts = "-I$(packageBase)/libs/install-native/$(GCCTARG)/include/newlib-nano -I$(packageBase)/libs/install-native/$(GCCTARG)/include";

    /*
     *  ======== profiles ========
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
                copts: " -O2 ",
            },
            linkOpts: " ",
        }],
    ];

    /*
     *  ======== compatibleSuffixes ========
     */
    override config String compatibleSuffixes[] = [];

    override readonly config xdc.bld.ITarget.StdTypes stdTypes = {
        t_IArg          : { size: 4, align: 4 },
        t_Char          : { size: 1, align: 1 },
        t_Double        : { size: 8, align: 8 },
        t_Float         : { size: 4, align: 4 },
        t_Fxn           : { size: 4, align: 4 },
        t_Int           : { size: 4, align: 4 },
        t_Int8          : { size: 1, align: 1 },
        t_Int16         : { size: 2, align: 2 },
        t_Int32         : { size: 4, align: 4 },
        t_Int64         : { size: 8, align: 8 },
        t_Long          : { size: 4, align: 4 },
        t_LDouble       : { size: 8, align: 8 },
        t_LLong         : { size: 8, align: 8 },
        t_Ptr           : { size: 4, align: 4 },
        t_Short         : { size: 2, align: 2 },
        t_Size          : { size: 4, align: 4 },
    };
}
/*
 *  @(#) gnu.targets.arm; 1, 0, 0,0; 11-8-2017 17:20:16; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

