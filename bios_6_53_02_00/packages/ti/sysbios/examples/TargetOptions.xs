/*
 * Copyright (c) 2015-2017, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
/*
 *  ======== TargetOptions.xs ========
 */

/*
 * Target Options tree.
 *
 * Tree Structure:
 *
 * targetOptions
 * |
 * |---------------------------------------------|
 * |                                             |
 * TI                                           GCC           <- Toolchain
 * |                                             |
 * |------|------|-------|------|             |-----|
 * ARM  C2000  C6000   MSP430  EVE           ARM  MSP430      <- Family
 * |                                          |
 * |---|---|--- ...                      |----|----|--- ...
 * A8  A9  M3                           M3   M4   M4F         <- Variant
 *         |                                  |
 *      |--------|--- ...                |---------|-- ...    <- Devices
 *   Generic   CC26xx                 Generic   CC32xx
 * (Stellaris)                        (Tiva)
 *
 *
 * !!!MUST READ!!!
 *
 * The variant node defines default options that are inherited
 * by each device listed in the devices array. The device node
 * can override the default options by redefining them.
 *
 * The deviceId and deviceVariant options are special in that
 * one of them should be defined for a device. If the variant
 * node defines deviceId and the device node needs to override it
 * with a deviceVariant, the device node should set the deviceId
 * to "". Same is true if variant node defines deviceVariant by
 * default and the device node needs to use deviceId.
 *
 * Example:
 * ...
 *    "A8": {
 *        deviceId: ".*(AM335)*.",
 *        ...
 *        devices: {
 *            "AM35x": {
 *                deviceId: "",  <-- Change deviceId to "" so deviceVariant
 *                                   is used.
 *                deviceVariant: "CortexA8",
 *                ...
 *            },
 *        },
 *     },
 */
var targetOptions = {
    /* Toolchain */
    "TI": {
        /* Family */
        "ARM": {
            /* Variant */
            "GENERIC": {
                cfgPrefix: "default/",
                linkerCommandFile: "",
                compilerBuildOptions: "",
                linkerBuildOptions: "",
                productGroup: "",
                devices: {
                    "GENERIC": {
                        deviceId: "~.*(Cortex A|TM4C|TM4E|LM3|F28M3|LM4|" +
                            "RM4|TMS570LS|ARM7|ARM11|Generic|EVMDMRX45X" +
                            "|CC13|CC25|CM25|CC26|CC32|TMS470M|DM350|DM357|" +
                            "DM368|P401R|RM57D8|AM57|TDA2|TDA3|AWR14|AWR16|" +
                            "IWR14|IWR16).*",
                    }
                }
            },
            "A8": {
                deviceVariant: "CortexA8",
                cfgPrefix: "default/",
                linkerCommandFile: "",
                compilerBuildOptions: "",
                linkerBuildOptions: "",
                devices: {
                    "GENERIC": {
                        productGroup: "Sitara",
                    }
                }
            },
            "R4F": {
                cfgPrefix: "default/",
                target: "ti.targets.arm.elf.R4F",
                compilerBuildOptions: "",
                linkerBuildOptions: "",
                devices: {
                    "AWR14XX": {
                        deviceId: ".*(AWR14).*",
                        platform: "ti.platforms.cortexR:AWR14XX",
                        linkerCommandFile: "ti/platforms/cortexR/include/" +
                            "AWR14XX.cmd",
                        productGroup: "Sitara",
                    },
                    "AWR16XX": {
                        deviceId: ".*(AWR16).*",
                        platform: "ti.platforms.cortexR:AWR16XX",
                        linkerCommandFile: "ti/platforms/cortexR/include/" +
                            "AWR16XX.cmd",
                        productGroup: "Sitara",
                    },
                    "IWR14XX": {
                        deviceId: ".*(IWR14).*",
                        platform: "ti.platforms.cortexR:IWR14XX",
                        linkerCommandFile: "ti/platforms/cortexR/include/" +
                            "IWR14XX.cmd",
                        productGroup: "Sitara",
                    },
                    "IWR16XX": {
                        deviceId: ".*(IWR16).*",
                        platform: "ti.platforms.cortexR:IWR16XX",
                        linkerCommandFile: "ti/platforms/cortexR/include/" +
                            "IWR16XX.cmd",
                        productGroup: "Sitara",
                    }
                }
            },
            "R5F": {
                cfgPrefix: "default/",
                target: "ti.targets.arm.elf.R5F",
                compilerBuildOptions: "",
                linkerBuildOptions: "",
                devices: {
                    "RM57L8XX": {
                        deviceId: ".*(RM57L8).*",
                        platform: "ti.platforms.cortexR:$DeviceId$",
                        linkerCommandFile: "ti/platforms/cortexR/include/" +
                            "$DeviceId$.cmd",
                        productGroup: "Sitara",
                    },
                    "RM57D8XX": {
                        cfgPrefix: "rm57d8xx/",
                        deviceId: ".*(RM57D8).*",
                        platform: "ti.platforms.cortexR:$DeviceId$",
                        linkerCommandFile: "ti/platforms/cortexR/include/" +
                            "$DeviceId$.cmd",
                        productGroup: "RM57D8xx",
                    },
                    "RM57D8XX_CORE0": {
                        cfgPrefix: "rm57d8xx_core0/",
                        deviceId: ".*(RM57D8).*",
                        platform: "ti.platforms.cortexR:$DeviceId$",
                        linkerCommandFile: "ti/platforms/cortexR/include/" +
                            "$DeviceId$.cmd",
                        productGroup: "RM57D8xx",
                    },
                    "RM57D8XX_CORE1": {
                        cfgPrefix: "rm57d8xx_core1/",
                        deviceId: ".*(RM57D8).*",
                        platform: "ti.platforms.cortexR:$DeviceId$_Core1",
                        linkerCommandFile: "ti/platforms/cortexR/include/" +
                            "$DeviceId$_Core1.cmd",
                        productGroup: "RM57D8xx",
                    }
                }
            },
            "M3": {
                cfgPrefix: "cortexm/",
                target: "ti.targets.arm.elf.M3",
                compilerBuildOptions:
                    " -mv7M3 --code_state=16 --abi=eabi -me -g" +
                    " --display_error_number --diag_warning=255" +
                    " --diag_wrap=off --gen_func_subsections=on" +
                    " --float_support=vfplib",
                linkerBuildOptions:
                    " --warn_sections --display_error_number --diag_wrap=off" +
                    " --rom_model",
                devices: {
                    /* exclude CC26XX because it needs driverlib ...
                    "CC26XX": {
                        cfgPrefix: "cc26xx/",
                        deviceId: ".*(CC26|CC13).*",
                        platform: "ti.platforms.simplelink:$DeviceId$",
                        productGroup: "SimpleLink"
                    },
                    */
                    "CONCERTO": {
                        deviceId: ".*F28M3.*",
                        platform: "ti.platforms.concertoM3:$DeviceId$",
                        linkerCommandFile: "ti/platforms/concertoM3/include/" +
                            "$DeviceId$.cmd",
                        productGroup: "C2000"
                    }
                }
            },
            "M4": {
                cfgPrefix: "cortexm/",
                target: "ti.targets.arm.elf.M4",
                compilerBuildOptions:
                    " -mv7M4 --code_state=16 --abi=eabi -me -g" +
                    " --display_error_number --diag_warning=255" +
                    " --diag_wrap=off --gen_func_subsections=on" +
                    " --float_support=vfplib",
                linkerBuildOptions:
                    " --warn_sections --display_error_number --diag_wrap=off" +
                    " --rom_model",
                devices: {
                    "CC32XX": {
                        deviceId: ".*CC32.*",
                        platform: "ti.platforms.simplelink:$DeviceId$",
                        linkerCommandFile:"ti/platforms/simplelink/include/" +
                            "$DeviceId$.cmd",
                        productGroup: "SimpleLink"
                    },
                    "DRA7XX": {
                        deviceVariant: "Cortex_M4",
                        deviceId: ".*(AM57|TDA2|TDA3).*",
                        platform: "",
                        linkerCommandFile: "",
                        productGroup: "Sitara"
                    }
                }
            },
            "M4F": {
                cfgPrefix: "cortexm/",
                target: "ti.targets.arm.elf.M4F",
                compilerBuildOptions:
                    " -mv7M4 --code_state=16 --abi=eabi -me -g" +
                    " --display_error_number --diag_warning=255" +
                    " --diag_wrap=off --gen_func_subsections=on" +
                    " --float_support=FPv4SPD16",
                linkerBuildOptions:
                    " --warn_sections --display_error_number --diag_wrap=off" +
                    " --rom_model",
                devices: {
                    "TIVA": {
                        deviceId: ".*(TM4C|TM4E|P401R).*",
                        platform: "ti.platforms.tiva:$DeviceId$",
                        linkerCommandFile: "ti/platforms/tiva/include/" +
                            "$DeviceId$.cmd",
                        productGroup: "TivaC",
                    }
                }
            }
        },
        /* Family */
        "MSP432": {
            /* Variant */
            "M4F": {
                cfgPrefix: "cortexm/",
                target: "ti.targets.arm.elf.M4F",
                compilerBuildOptions:
                    " -mv7M4 --code_state=16 --abi=eabi -me -g" +
                    " --display_error_number --diag_warning=255" +
                    " --diag_wrap=off --gen_func_subsections=on" +
                    " --float_support=FPv4SPD16",
                linkerBuildOptions:
                    " --warn_sections --display_error_number --diag_wrap=off" +
                    " --rom_model",
                productGroup: "MSP430",
                devices: {
                    "GENERIC": {
                        deviceId: ".*MSP432.*",
                        platform: "ti.platforms.msp432:$DeviceId$",
                        linkerCommandFile: "ti/platforms/msp432/include/" +
                            "$DeviceId$.cmd",
                    }
                }
            }
        },
        /* Family */
        "C2000": {
            /* Variant */
            "C28": {
                cfgPrefix: "c28/",
                target: "ti.targets.C28_float",
                compilerBuildOptions:
                    " -ml --float_support=fpu32 --gen_func_subsections=on" +
                    " --display_error_number --diag_warning=255" +
                    " --diag_wrap=off",
                linkerBuildOptions:
                    " --warn_sections --display_error_number --diag_wrap=off" +
                    " --rom_model",
                productGroup: "C2000",
                devices: {
                    "GENERIC": {
                        deviceId: "~((.*(F28M3|Generic|G00883|" +
                            "TMS320C280|TMS320C281|TMS320C282|" +
                            "TMS320F2801|TMS320F2802|TMS320F2803|" +
                            "TMS320F2804|TMS320F2823).*)|TMS320F2801|" +
                            "TMS320F2802|TMS320F2806|TMS320F2808|" +
                            "TMS320F2809|TMS320F2810|TMS320F2811|" +
                            "TMS320F2812)",
                        platform: "ti.platforms.tms320x28:$DeviceId$",
                        linkerCommandFile: "ti/platforms/tms320x28/include/" +
                            "$DeviceId$.cmd",
                    },
                    "CONCERTO": {
                        deviceId: ".*F28M3.*",
                        platform: "ti.platforms.concertoC28:$DeviceId$",
                        linkerCommandFile: "ti/platforms/concertoC28/include/" +
                            "$DeviceId$.cmd"
                    }
                }
            },
            "C28_Large": {
                cfgPrefix: "c28/",
                target: "ti.targets.C28_large",
                compilerBuildOptions: "",
                linkerBuildOptions: "",
                productGroup: "C2000",
                devices: {
                    "GENERIC": {
                        deviceId: "(.*(TMS320C280|TMS320C281|TMS320C282|" +
                            "TMS320F2801|TMS320F2802|TMS320F2803|" +
                            "TMS320F2804|TMS320F2823).*)|TMS320F2801|" +
                            "TMS320F2802|TMS320F2806|TMS320F2808|" +
                            "TMS320F2809|TMS320F2810|TMS320F2811|" +
                            "TMS320F2812",
                        platform: "ti.platforms.tms320x28:$DeviceId$",
                        linkerCommandFile: "ti/platforms/tms320x28/include/" +
                            "$DeviceId$.cmd",
                    }
                }
            }
        },
        /* Family */
        "C6000": {
            /* Variant */
            "GENERIC": {
                cfgPrefix: "default/",
                linkerCommandFile: "",
                compilerBuildOptions: "",
                linkerBuildOptions: "",
                productGroup: "C6000",
                devices: {
                    "GENERIC": {
                        deviceId: "~.*(TMS320C670|TMS320C671|TMS320C672|" +
                                  "DSK6713|GenericC62xxDevice|" +
                                  "GenericC64xxDevice|GenericC67xxDevice|" +
                                  "GenericC67xPlusDevice|C641|AWR16|IWR16).*",
                    },
                    "AWR16XX": {
                        deviceId: ".*(AWR16).*",
                        platform: "ti.platforms.c6x:AWR16XX",
                        linkerCommandFile: "ti/platforms/c6x/include/" +
                            "AWR16XX.cmd",
                    },
                    "IWR16XX": {
                        deviceId: ".*(IWR16).*",
                        platform: "ti.platforms.c6x:IWR16XX",
                        linkerCommandFile: "ti/platforms/c6x/include/" +
                            "IWR16XX.cmd",
                    }
                }
            }
        },
        /* Family */
        "EVE": {
            /* Variant */
            "ARP32": {
                deviceId: "EVE|ARP32",
                cfgPrefix: "default/",
                linkerCommandFile: "",
                compilerBuildOptions: "",
                linkerBuildOptions: "",
                productGroup: "",
                devices: {
                    "GENERIC": {
                    }
                }
            }
        },
        /* Family */
        "MSP430": {
            /* Variant */
            "MSP430": {
                cfgPrefix: "msp430/",
                target: "ti.targets.msp430.elf.MSP430X",
                deviceId: "", /* Array populated dynamically by a function */
                compilerBuildOptions:
                    " -vmspx --abi=eabi --data_model=restricted -g" +
                    " --display_error_number --diag_warning=255" +
                    " --diag_wrap=off",
                linkerBuildOptions:
                    " --warn_sections --display_error_number --diag_wrap=off" +
                    " --rom_model",
                productGroup: "MSP430",
                devices: {
                    "GENERIC": {
                        platform: "ti.platforms.msp430:$DeviceId$",
                    }
                }
            }
        }
    },
    /* Toolchain */
    "GNU": {
        /* Family */
        "ARM": {
            /* Variant */
            "A8": {
                deviceVariant: "CortexA8",
                cfgPrefix: "default/",
                target: "gnu.targets.arm.A8F",
                linkerCommandFile: "",
                compilerBuildOptions: "-mfloat-abi=hard"
                + " -I${xdc_find:gnu/targets/arm/libs/install-native/"
                + "arm-none-eabi/include/newlib-nano:${ProjName}}",
                linkerBuildOptions: "-nostartfiles -static --gc-sections -lgcc"
                + " -lc -lm -lnosys -L${xdc_find:gnu/targets/"
                + "arm/libs/install-native/arm-none-eabi/lib/hard:${ProjName}}"
                + " --specs=nano.specs",
                productGroup: "Sitara",
                devices: {
                    "GENERIC": {
                    },
                    "SEMIHOST": {
                        cfgPrefix: "cortexa_semihost/",
                        linkerBuildOptions: "-nostartfiles -static"
                        + " --gc-sections -lgcc -lc -lm -lrdimon"
                        + " -L${xdc_find:gnu/targets/arm/libs/i"
                        + "install-native/arm-none-eabi/lib/hard:${ProjName}}"
                        + " --specs=nano.specs"
                    }
                }
            },
            "A9": {
                deviceVariant: "CortexA9",
                cfgPrefix: "default/",
                target: "gnu.targets.arm.A9F",
                linkerCommandFile: "",
                compilerBuildOptions: "-mfloat-abi=hard"
                + " -I${xdc_find:gnu/targets/arm/libs/install-native/"
                + "arm-none-eabi/include/newlib-nano:${ProjName}}",
                linkerBuildOptions: "-nostartfiles -static --gc-sections -lgcc"
                + " -lc -lm -lnosys -L${xdc_find:gnu/targets/arm/"
                + "libs/install-native/arm-none-eabi/lib/hard:${ProjName}}"
                + " --specs=nano.specs",
                productGroup: "Sitara",
                devices: {
                    "GENERIC": {
                    },
                    "SEMIHOST": {
                        cfgPrefix: "cortexa_semihost/",
                        linkerBuildOptions: "-nostartfiles -static"
                        + " --gc-sections -lgcc -lc -lm -lrdimon"
                        + " -L${xdc_find:gnu/targets/arm/libs/"
                        + "install-native/arm-none-eabi/lib/hard:${ProjName}}"
                        + " --specs=nano.specs"
                    }
                }
            },
            "A15": {
                deviceVariant: "CortexA15",
                cfgPrefix: "default/",
                target: "gnu.targets.arm.A15F",
                linkerCommandFile: "",
                compilerBuildOptions: "-mfloat-abi=hard"
                + " -I${xdc_find:gnu/targets/arm/libs/install-native/"
                + "arm-none-eabi/include/newlib-nano:${ProjName}}",
                linkerBuildOptions: "-nostartfiles -static --gc-sections -lgcc"
                + " -lc -lm -lnosys -L${xdc_find:gnu/targets/arm/"
                + "libs/install-native/arm-none-eabi/lib/hard:${ProjName}}"
                + " --specs=nano.specs",
                productGroup: "Sitara",
                devices: {
                    "GENERIC": {
                    },
                    "SEMIHOST": {
                        cfgPrefix: "cortexa_semihost/",
                        linkerBuildOptions: "-nostartfiles -static"
                        + " --gc-sections -lgcc -lc -lm -lrdimon"
                        + " -L${xdc_find:gnu/targets/arm/libs/"
                        + "install-native/arm-none-eabi/lib/hard:${ProjName}}"
                        + " --specs=nano.specs"
                    }
                }
            },
            "M3": {
                deviceVariant: "CortexM3",
                cfgPrefix: "cortexm/",
                target: "gnu.targets.arm.M3",
                compilerBuildOptions:
                    " -mcpu=cortex-m3 -march=armv7-m -mthumb" +
                    " -mfloat-abi=soft -ffunction-sections -fdata-sections" +
                    " -g -gstrict-dwarf -Wall -I${xdc_find:gnu/targets/arm/" +
                    "libs/install-native/arm-none-eabi/include/newlib-nano:" +
                    "${ProjName}}",
                linkerBuildOptions:
                    " -march=armv7-m -mthumb -nostartfiles -static" +
                    " -Wl,--gc-sections -L${xdc_find:gnu/targets/arm/libs" +
                    "/install-native/arm-none-eabi/lib/thumb/v7-m:${ProjName}}" +
                    " -lgcc -lc -lm -lnosys --specs=nano.specs",
                productGroup: "",
                devices: {
                    "SEMIHOST": {
                        cfgPrefix: "cortexm_semihost/",
                        deviceId: "~.*(CC26|CC13).*",
                        platform: "ti.platforms.tiva:$DeviceId$",
                        linkerCommandFile: "ti/platforms/tiva/include_gnu/" +
                            "$DeviceId$.lds",
                        linkerBuildOptions:
                            " -mthumb -march=armv7-m -nostartfiles -static" +
                            " -Wl,--gc-sections -L${xdc_find:gnu/targets/arm" +
                            "/libs/install-native/arm-none-eabi/lib/thumb" +
                            "/v7-m:${ProjName}} -lgcc -lc -lm -lrdimon" +
                            " --specs=nano.specs"
                    },
                    /* exclude CC26XX because it needs driverlib ...
                    "CC26XX": {
                        cfgPrefix: "cc26xx/",
                        deviceId: ".*(CC26|CC13).*",
                        linkerCommandFile: "ti/platforms/simplelink/include_gnu/" +
                                           "cc2650.lds",
                        platform: "ti.platforms.simplelink:$DeviceId$",
                        productGroup: "SimpleLink"
                    },
                    "CC26XX_SEMIHOST": {
                        cfgPrefix: "cc26xx_semihost/",
                        deviceId: ".*(CC26|CC13).*",
                        linkerCommandFile: "ti/platforms/simplelink/include_gnu/" +
                                           "cc2650.lds",
                        linkerBuildOptions: "-nostartfiles -static"
                        + " --gc-sections -lgcc -lc -lm -lrdimon "
                        + "-L${xdc_find:gnu/targets/arm/libs/"
                        + "install-native/arm-none-eabi/lib/armv7-m:${ProjName}}",
                    },
                    */
                }
            },
            "M4": {
                deviceVariant: "CortexM4",
                cfgPrefix: "cortexm/",
                target: "gnu.targets.arm.M4",
                compilerBuildOptions:
                    " -mcpu=cortex-m4 -march=armv7e-m -mthumb" +
                    " -mfloat-abi=soft -ffunction-sections -fdata-sections" +
                    " -g -gstrict-dwarf -Wall -I${xdc_find:gnu/targets/arm/" +
                    "libs/install-native/arm-none-eabi/include/newlib-nano:" +
                    "${ProjName}}",
                linkerBuildOptions:
                    " -march=armv7e-m -mthumb -nostartfiles -static" +
                    " -Wl,--gc-sections -L${xdc_find:gnu/targets/arm/libs" +
                    "/install-native/arm-none-eabi/lib/thumb/v7e-m:${ProjName}}" +
                    " -lgcc -lc -lm -lnosys --specs=nano.specs",
                devices: {
                    "CC32XX": {
                        deviceId: ".*CC32.*",
                        platform: "ti.platforms.simplelink:$DeviceId$",
                        linkerCommandFile: "ti/platforms/simplelink" +
                            "/include_gnu/$DeviceId$.lds",
                        productGroup: "SimpleLink"
                    },
                    "SEMIHOST": {
                        cfgPrefix: "cortexm_semihost/",
                        deviceId: ".*CC32.*",
                        platform: "ti.platforms.simplelink:$DeviceId$",
                        linkerCommandFile: "ti/platforms/simplelink" +
                            "/include_gnu/$DeviceId$.lds",
                        linkerBuildOptions:
                            " -mthumb -march=armv7e-m -nostartfiles -static" +
                            " -Wl,--gc-sections -L${xdc_find:gnu/targets/arm" +
                            "/libs/install-native/arm-none-eabi/lib/thumb/" +
                            "v7e-m:${ProjName}} -lgcc -lc -lm -lrdimon" +
                            " --specs=nano.specs",
                        productGroup: "SimpleLink"
                    }
                }
            },
            "M4F": {
                cfgPrefix: "cortexm/",
                target: "gnu.targets.arm.M4F",
                compilerBuildOptions:
                    " -mcpu=cortex-m4 -march=armv7e-m -mthumb" +
                    " -mfloat-abi=hard -mfpu=fpv4-sp-d16 -ffunction-sections" +
                    " -fdata-sections -g -gstrict-dwarf -Wall" +
                    " -I${xdc_find:gnu/targets/arm/libs/install-native/" +
                    "arm-none-eabi/include/newlib-nano:${ProjName}}",
                linkerBuildOptions:
                    " -march=armv7e-m -mthumb -mfloat-abi=hard" +
                    " -mfpu=fpv4-sp-d16 -nostartfiles -static" +
                    " -Wl,--gc-sections -L${xdc_find:gnu/targets/arm/libs" +
                    "/install-native/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/" +
                    "hard:${ProjName}} -lgcc -lc -lm -lnosys" +
                    " --specs=nano.specs",
                productGroup: "TivaC",
                devices: {
                    "TIVA": {
                        deviceId: ".*(TM4C|TM4E|P401R).*",
                        platform: "ti.platforms.tiva:$DeviceId$",
                        linkerCommandFile: "ti/platforms/tiva/include_gnu/" +
                            "$DeviceId$.lds",
                    },
                    "SEMIHOST": {
                        cfgPrefix: "cortexm_semihost/",
                        deviceId: ".*(TM4C|TM4E|P401R).*",
                        platform: "ti.platforms.tiva:$DeviceId$",
                        linkerCommandFile: "ti/platforms/tiva/include_gnu/" +
                            "$DeviceId$.lds",
                        linkerBuildOptions:
                            " -march=armv7e-m -mthumb -mfloat-abi=hard" +
                            " -mfpu=fpv4-sp-d16 -nostartfiles -static" +
                            " -Wl,--gc-sections -L${xdc_find:gnu/targets/arm" +
                            "/libs/install-native/arm-none-eabi/lib/thumb" +
                            "/v7e-m/fpv4-sp/hard:${ProjName}} -lgcc -lc -lm" +
                            " -lrdimon --specs=nano.specs",
                    }
                }
            },
        },
        "MSP432": {
            "M4F": {
                cfgPrefix: "cortexm/",
                target: "gnu.targets.arm.M4F",
                compilerBuildOptions:
                    " -mcpu=cortex-m4 -march=armv7e-m -mthumb" +
                    " -mfloat-abi=hard -mfpu=fpv4-sp-d16 -ffunction-sections" +
                    " -fdata-sections -g -gstrict-dwarf -Wall" +
                    " -I${xdc_find:gnu/targets/arm/libs/install-native/" +
                    "arm-none-eabi/include/newlib-nano:${ProjName}}",
                linkerBuildOptions:
                    " -march=armv7e-m -mthumb -mfloat-abi=hard" +
                    " -mfpu=fpv4-sp-d16 -nostartfiles -static" +
                    " -Wl,--gc-sections -L${xdc_find:gnu/targets/arm/libs" +
                    "/install-native/arm-none-eabi/lib/thumb/v7e-m/fpv4-sp/" +
                    "hard:${ProjName}} -lgcc -lc -lm -lnosys" +
                    " --specs=nano.specs",
                productGroup: "MSP430",
                devices: {
                    "MSP432": {
                        deviceId: ".*MSP432.*",
                        platform: "ti.platforms.msp432:$DeviceId$",
                        linkerCommandFile: "ti/platforms/msp432/include_gnu/" +
                            "$DeviceId$.lds",
                    },
                    "SEMIHOST": {
                        cfgPrefix: "cortexm_semihost/",
                        deviceId: ".*MSP432.*",
                        platform: "ti.platforms.msp432:$DeviceId$",
                        linkerCommandFile: "ti/platforms/msp432/include_gnu/" +
                            "$DeviceId$.lds",
                        linkerBuildOptions:
                            " -march=armv7e-m -mthumb -mfloat-abi=hard" +
                            " -mfpu=fpv4-sp-d16 -nostartfiles -static" +
                            " -Wl,--gc-sections -L${xdc_find:gnu/targets/arm" +
                            "/libs/install-native/arm-none-eabi/lib/thumb" +
                            "/v7e-m/fpv4-sp/hard:${ProjName}}" +
                            " -lgcc -lc -lm -lrdimon --specs=nano.specs"
                    }
                }
            }
        }
    },
    /* Toolchain */
    "IAR": {
        /* Family */
        "ARM": {
            /* Variant */
            "M3": {
                cfgPrefix: "cortexm/",
                target: "iar.targets.arm.M3",
                compilerBuildOptions:
                    " --debug --silent",
                linkerBuildOptions:
                    " --silent --cpu=Cortex-M3" +
                    " --entry=__iar_program_start" +
                    " --redirect _Printf=_PrintfSmall" +
                    " --redirect _Scanf=_ScanfSmall",
            },
            /* Variant */
            "M4": {
                cfgPrefix: "cortexm/",
                target: "iar.targets.arm.M4",
                compilerBuildOptions:
                    " --debug --silent",
                linkerBuildOptions:
                    " --silent --cpu=Cortex-M4" +
                    " --entry=__iar_program_start" +
                    " --redirect _Printf=_PrintfSmall" +
                    " --redirect _Scanf=_ScanfSmall",
            },
            /* Variant */
            "M4F": {
                cfgPrefix: "cortexm/",
                target: "iar.targets.arm.M4F",
                compilerBuildOptions:
                    " --debug --silent",
                linkerBuildOptions:
                    " --silent --cpu=Cortex-M4F" +
                    " --entry=__iar_program_start" +
                    " --redirect _Printf=_PrintfSmall" +
                    " --redirect _Scanf=_ScanfSmall",
            },
        },
        /* Family */
        "MSP432": {
            /* Variant */
            "M4F": {
                cfgPrefix: "cortexm/",
                target: "iar.targets.arm.M4F",
                compilerBuildOptions:
                    " --debug --silent",
                linkerBuildOptions:
                    " --silent --cpu=Cortex-M4F" +
                    " --entry=__iar_program_start" +
                    " --redirect _Printf=_PrintfSmall" +
                    " --redirect _Scanf=_ScanfSmall",
            }
        },
        /* Family */
        "MSP430": {
            /* Variant */
            "MSP430": {
                cfgPrefix: "msp430/",
                target: "iar.targets.msp430.MSP430X_small",
                compilerBuildOptions:
                    " --debug --silent --diag_suppress=Pa050,Go005",
                linkerBuildOptions:
                    " -S -xens -e_PrintfSmall=_Printf -e_ScanfSmall=_Scanf",
            }
        }
    }
}

/*
 *  ======== populateDeviceIdMSP430 ========
 *  Generate a deviceId list for MSP430 based on the devices listed in
 *  msp430Settings.xs and populate the deviceId array in targetOptions.
 */
function populateDeviceIdMSP430()
{
    try {
        var msp430 =
        xdc.loadCapsule("ti/sysbios/family/msp430/msp430Settings.xs");
    }
    catch (err) {
        return;
    }

    var devices = msp430.devices[0];

    for (var i = 1; i < msp430.devices.length; i++) {
        devices += "|" + msp430.devices[i];
    }

    targetOptions["TI"]["MSP430"]["MSP430"].deviceId = devices;
}
