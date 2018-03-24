/*
 * Copyright (c) 2015-2016, Texas Instruments Incorporated
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
 *  ======== Examples.xs ========
 */

/* Read Target Options */
var TargetCapsule = xdc.loadCapsule("TargetOptions.xs");
var TargetOptions = TargetCapsule.targetOptions;

/* Read Example List */
var ExampleList = (xdc.loadCapsule("ExampleList.xs")).examplesList;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    var Examples = this;

    /* Generate MSP430 deviceId */
    TargetCapsule.populateDeviceIdMSP430();

    /* Read env variables */
    var productGroup = environment["productGroup"];
    var tirtosSupport = environment["tirtosSupport"];

    var rootString;

    if (tirtosSupport == "false") {
        rootString = "ti.sysbios.examples.root";
        Examples.templateGroupArr.$add({
            id          : rootString,
            name        : "SYS/BIOS",
            description : "SYS/BIOS Templates and Examples"
        });
    }
    else {
        rootString = "examples.root_" + productGroup;
        Examples.templateGroupArr.$add({
            id          : rootString,
            name        : "TI-RTOS for " + productGroup,
            description : "TI-RTOS Templates and Examples"
        });

        rootString = rootString + ".kernel";
        Examples.templateGroupArr.$add({
            id          : rootString,
            name        : "Kernel Examples",
            description : "SYS/BIOS Kernel Templates and Examples",
            groups      : ["examples.root_" + productGroup],
        });
    }

    Examples.templateGroupArr.$add({
        id          : rootString + ".targetsTI",
        name        : "TI Target Examples",
        description : "SYS/BIOS Kernel Templates and Examples for TI targets.",
        groups      : [rootString],
    });

    Examples.templateGroupArr.$add({
        id          : rootString + ".targetsGNU",
        name        : "GNU Target Examples",
        description : "SYS/BIOS Kernel Templates and Examples for GNU targets.",
        groups      : [rootString],
    });

    Examples.templateGroupArr.$add({
        id          : rootString + ".targetsTI.genericTI",
        name        : "Generic Examples",
        description : "Generic SYS/BIOS Examples. These examples are not" +
                      " optimized for code and data memory usage and may" +
                      " not build on platforms with memory constraints.",
        groups      : [rootString + ".targetsTI"],
    });

    Examples.templateGroupArr.$add({
        id          : rootString + ".targetsGNU.genericGNU",
        name        : "Generic Examples",
        description : "Generic SYS/BIOS Examples. These examples are not" +
                      " optimized for code and data memory usage and may" +
                      " not build on platforms with memory constraints.",
        groups      : [rootString + ".targetsGNU"],
    });

    Examples.templateGroupArr.$add({
        id          : rootString + ".targetsTI.msp430",
        name        : "MSP430 Specific Examples",
        description : "MSP430 specific SYS/BIOS Examples",
        groups      : [rootString + ".targetsTI"],
    });

    Examples.templateGroupArr.$add({
        id          : rootString + ".targetsTI.c28",
        name        : "28x Specific Examples",
        description : "28x specific SYS/BIOS Examples",
        groups      : [rootString + ".targetsTI"],
    });

    Examples.templateGroupArr.$add({
        id          : rootString + ".targetsTI.rm57d8xx_dualCoreExamples",
        name        : "Dual Core Examples",
        description : "RM57D8xx Dual Core SYS/BIOS Examples",
        groups      : [rootString + ".targetsTI"],
    });

    var ExModuleName = 'ti.sysbios.examples.Examples';
    generateExampleTemplates(Examples, TargetOptions,
    ExampleList, ExModuleName, productGroup);
}

function generateExampleTemplates(examples, targetOptions,
    exampleList, exModuleName, productGroup)
{
    var curGroup;
    var xdcPath = String(environment["xdc.path"]).split(';');

    /*
     * Add Examples module's directory to xdcPath.
     */
    var exModule = xdc.module(exModuleName);
    var exModuleDir =  xdc.getPackageBase(exModule.$package);
    xdcPath.push(exModuleDir);

    /*
     * Iterate through all supported toolchains (TI, GNU, etc.)
     */
    for (var toolchain in targetOptions) {
        /*
         * Iterate through device families (ARM, C2000, C6000, etc.)
         */
        for (var family in  targetOptions[toolchain]) {
            /*
             * Iterate through all target variants (M3, M4, A8, A9, etc.)
             * under each device family.
             */
            for (var variant in targetOptions[toolchain][family]) {
                var targetVariant = targetOptions[toolchain][family][variant];
                var devices = targetVariant.devices;

                /*
                 * Create an opts object to read and store the targetVariant
                 * options.
                 */
                var opts = new Object();
                initTargetOptions(opts);

                /*
                 * For each variant, iterate through the devices array.
                 * If devices array is of non-zero length then map the
                 * options for each device to the corresponding Example
                 * group else skip to next variant.
                 */
                for (device in devices) {

                    /*
                     * Read the variant's target options.
                     */
                    getTargetOptions(opts, targetVariant);

                    /*
                     * Get the options defined by each device.
                     *
                     * Note: The device's options will override the
                     *       options defined by variant.
                     */
                    getTargetOptions(opts, targetVariant.devices[device]);

                    if ((productGroup != "ALL") &&
                        (productGroup != opts.productGroup)) {
                        continue;
                    }

                    for (var j = 0; j < exampleList.length; j++) {
                        /* Select example group based on toolchain */
                        switch(toolchain) {
                            case "TI":
                                if ("groupsTI" in exampleList[j]) {
                                    curGroup = exampleList[j].groupsTI;
                                }
                                else {
                                    /*
                                     * If this example does not have a groupsTI
                                     * field skip it.
                                     */
                                    continue;
                                }
                                break;
                            case "GNU":
                                if ("groupsGNU" in exampleList[j]) {
                                    curGroup = exampleList[j].groupsGNU;
                                }
                                else {
                                    /*
                                     * If this example does not have a groupsGNU
                                     * field skip it.
                                     */
                                    continue;
                                }
                                break;
                            default:
                                throw new Error ("Toolchain not recognized!");
                        }

                        var cfgFilePath = exampleList[j].root +
                        opts.cfgPrefix + exampleList[j].cfgFile;

                        /*
                         * Search for the cfg file along xdcPath. If found,
                         * then create an example template else skip to
                         * next example.
                         */
                        var found = false;
                        for (var pathIdx in xdcPath) {
                            var fpath = xdc.findFile(xdcPath[pathIdx] +
                            "/" + cfgFilePath);
                            if (fpath != null) {
                                found = true;
                                break;
                            }
                        }

                        if (!found) {
                            continue;
                        }

                        var requiredProducts;
                        if ("requiredProducts" in exampleList[j]) {
                            requiredProducts = exampleList[j].requiredProducts;
                        }

                        examples.templateArr.$add({
                            buildProfile: "release",
                            filterArr: getTargetFilter(family, opts, toolchain),
                            target: opts.target,
                            platform: opts.platform,
                            linkerCommandFile: opts.linkerCommandFile,
                            compilerBuildOptions: opts.compilerBuildOptions,
                            linkerBuildOptions: opts.linkerBuildOptions,
                            title: exampleList[j].title,
                            name: exampleList[j].name,
                            description: exampleList[j].description,
                            fileList: [
                                {
                                    path: exampleList[j].root +
                                          exampleList[j].cFile
                                },
                                {
                                    path: exampleList[j].root +
                                          opts.cfgPrefix +
                                          exampleList[j].cfgFile
                                }
                            ],
                            isHybrid: exampleList[j].isHybrid,
                            groups: curGroup,
                            options: exampleList[j].options,
                            requiredProducts: requiredProducts
                        });

                        if (opts.cmdFile != undefined) {
                            var idx = examples.templateArr.length - 1;
                            var ex = examples.templateArr[idx];
                            ex.fileList.$add({path: opts.cmdFile});
                        }
                    }
                }
            }
        }
    }

    /* add common properties shared by all examples */
    for (var i = 0; i < examples.templateArr.length; i++) {
        var ex = examples.templateArr[i];

        /* add ./makefile.defs to all examples */
        ex.fileList.$add({path: "./makefile.defs"});

        /* add debugability to all examples using TI toolchain */
        var debug = true;
        for (var j = 0; j < ex.filterArr.length; j++) {
            if (ex.filterArr[j].toolChain != "TI") {
                debug = false;
            }
        }
        if (debug) {
            ex.configuroOptions =
            "--compileOptions &quot;-g --optimize_with_debug&quot;";
        }
    }
}

/*
 *  ======== getTargetFilter ========
 *  Construct the target filter using family, toolchain and target options.
 */
function getTargetFilter(family, opts, toolchain)
{
    var filter = [
    ];

    if ((opts.deviceId != "") && (opts.deviceVariant != "")) {
        filter.push({
                        deviceFamily: family,
                        deviceVariant: opts.deviceVariant,
                        deviceId: opts.deviceId,
                        toolChain: toolchain
                    });
    }
    else if (opts.deviceId != "") {
        filter.push({
                        deviceFamily: family,
                        deviceId: opts.deviceId,
                        toolChain: toolchain
                    });
    }
    else if (opts.deviceVariant != "") {
        filter.push({
                        deviceFamily: family,
                        deviceVariant: opts.deviceVariant,
                        toolChain: toolchain
                    });
    }
    else {
        filter.push({
                        deviceFamily: family,
                        toolChain: toolchain
                    });
    }

    return filter;
}

/*
 *  ======== initTargetOptions ========
 */
function initTargetOptions(opts)
{
    opts.deviceId = "";
    opts.deviceVariant = "";
}

/*
 *  ======== getTargetOptions ========
 *  Check if field exists and read it from deviceOpts structure into opts
 *  structure.
 */
function getTargetOptions(opts, deviceOpts)
{
    if ('deviceId' in deviceOpts) {
        opts.deviceId = deviceOpts.deviceId;
    }

    if ('deviceVariant' in deviceOpts) {
        opts.deviceVariant = deviceOpts.deviceVariant;
    }

    if ('cfgPrefix' in deviceOpts) {
        opts.cfgPrefix = deviceOpts.cfgPrefix;
    }

    if ('target' in deviceOpts) {
        opts.target = deviceOpts.target;
    }

    if ('platform' in deviceOpts) {
        opts.platform = deviceOpts.platform;
    }

    if ('linkerCommandFile' in deviceOpts) {
        opts.linkerCommandFile = deviceOpts.linkerCommandFile;
    }

    if ('compilerBuildOptions' in deviceOpts) {
        opts.compilerBuildOptions = deviceOpts.compilerBuildOptions;
    }

    if ('linkerBuildOptions' in deviceOpts) {
        opts.linkerBuildOptions = deviceOpts.linkerBuildOptions;
    }

    if ('productGroup' in deviceOpts) {
        opts.productGroup = deviceOpts.productGroup;
    }

    if ('cmdFile' in deviceOpts) {
        opts.cmdFile = deviceOpts.cmdFile;
    }
}
