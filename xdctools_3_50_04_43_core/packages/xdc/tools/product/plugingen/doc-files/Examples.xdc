/* --COPYRIGHT--,EPL
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * --/COPYRIGHT--*/

/*
 *  ======== Examples.xdc ========
 */
import xdc.tools.product.IProductTemplate;

/*!
 *  ======== Examples ========
 *  Sample IProductTemplate implementation
 */
metaonly module Examples inherits IProductTemplate 
{


    config IProductTemplate.TemplateGroup root = {
        id          : "xdc.tools.product.plugingen.examples.root",
        name        : "Example Product",
        description : "Examples"
    };

    config IProductTemplate.TemplateGroup level1 = {
        id          : "xdc.tools.product.plugingen.examples.root.level1",
        name        : "MCU Examples",
        description : "MCU Examples for product",
        groups      : ["xdc.tools.product.plugingen.examples.root"]
    };

    config IProductTemplate.TemplateGroup level1_1 = {
        id          : "xdc.tools.product.plugingen.examples.root.level1_1",
        name        : "Legacy TCF",
        description : "TCF Examples",
        groups      : ["xdc.tools.product.plugingen.examples.root"]
    };

    config IProductTemplate.TemplateGroup level2 = {
        id          : "xdc.tools.product.plugingen.examples.root.level1.level2",
        name        : "MSP430 Examples",
        description : "MSP430 Examples for product",
        groups      : ["xdc.tools.product.plugingen.examples.root.level1"]
    };

    override config IProductTemplate.TemplateGroup templateGroupArr [] =
                                  [root, level1, level1_1, level2];

    /*!
     *  ======== tcf ========
     *  Legacy TCF project
     */
    config IProductTemplate.TemplateInfo tcf = {
        title:       "Legacy TCF project",
        fileList:    [{path:"examples/tcf/hello.c"},
                      {path:"examples/tcf/hello.tcf"},
                      {path:"examples/tcf/bios.a64P"},
                     ],
        description: "Legacy TCF project",
        linkerCommandFile: "",
        groups:["xdc.tools.product.plugingen.examples.root.level1_1"],
        legacyTcf:true,
        filterArr:[{deviceFamily:"C6000",toolChain:"TI"}]
    };


    /*!
     *  ======== empty ========
     *  Empty ExampleProd Project
     */
    config IProductTemplate.TemplateInfo empty = {
        title:       "Empty ExampleProd Project",
        fileList:    [{path:"examples/grace/empty/template.c"},
                      {path:"examples/grace/empty/makefile.defs"},
                      {path:"examples/grace/empty/makefile.targets"},
                      {path:"examples/grace/empty/template.cfg",openOnCreation:true}
                     ],
        description: "Enables the use of Grace (Graphical Code Engine) within your project. You can then use Grace to graphically configure your peripherals.\\n\\nThis project simply initializes the peripherals according to the settings made within the graphical configuration tool.This template defines a minimal configuration of the MSP430",
        linkerCommandFile: "",
        target:   "ti.targets.msp430.MSP430",
        platform: "ti.platforms.ez430_rf2500",
        buildProfile: "debug",
        groups:["com.ti.common.project.core.emptyProjectTemplates","xdc.tools.product.plugingen.examples.root"],
        isHybrid:true,
        filterArr:[{deviceFamily:"MSP430",toolChain:"TI"}]
    };

    /*!
     *  ======== blinkLed ========
     *  Blink LED Example Project
     */
    config IProductTemplate.TemplateInfo blinkLed = {
        title:       "Blink LED Example Project",
        fileList:    [{path:"examples/grace/blink/led.c"},
                      {path:"examples/grace/blink/makefile.defs"},
                      {path:"examples/grace/blink/makefile.targets"},
                      {path:"examples/grace/blink/led.cfg",openOnCreation:true}
                     ],
        description: "Minimal GPIO example that simply toggles the LED on P1.0 at approximately 4Hz (with default DCO setting of 1 MHz). \\n\\nTry changing the DCO or the example's delay time and observe the affect on the  LED's blink rate.",
        linkerCommandFile: "",
        target:   "ti.targets.msp430.MSP430",
        platform: "ti.platforms.ez430_rf2500",
        buildProfile: "debug",
        groups:["xdc.tools.product.plugingen.examples.root.level1.level2"],
        isHybrid:true,
        filterArr:[{deviceFamily:"MSP430",toolChain:"TI"}]
    };

    /*!
     *  ======== hello ========
     *  Hello World Project 
     */
        config IProductTemplate.TemplateInfo hello = {
        title:       "ExampleProd Hello Project",
        fileList:    [{path:"examples/grace/hello/hello.c"},
                      {path:"examples/grace/hello/makefile.defs"},
                      {path:"examples/grace/hello/makefile.targets"},
                      {path:"examples/grace/hello/hello.cfg",openOnCreation:true}
                     ],
        description: "Simple printf example that outputs to the serial port at 9600 baud, 8 bits, no parity.\\n\\nTry changing the format string to display different messages or values computed by the example.",
        linkerCommandFile: "",
        target:   "ti.targets.msp430.MSP430",
        platform: "ti.platforms.ez430_rf2500",
        buildProfile: "debug",
        groups:["xdc.tools.product.plugingen.examples.root.level1.level2"],
        isHybrid:true,
        filterArr:[{deviceFamily:"MSP430",toolChain:"TI"}]
    };

    /*!
     *  ======== configProject ========
     *  RTSC configuration project that depends on BIOS and IPC.
     *  Uses generic MSP430 platform.
     */
        config IProductTemplate.TemplateInfo configProject = {
        title:       "ExampleProd Configuration Project",
        fileList:    [{path:"examples/grace/hello/hello.cfg",openOnCreation:false}
                     ],
        description: "RTSC configuration project that depends on BIOS and IPC.\\nUses generic MSP430 platform.",
        linkerCommandFile: "",
        target:   "ti.targets.msp430.MSP430",
        platform: "ti.platforms.msp430:$DeviceId$",
        buildProfile: "debug",
        groups:["xdc.tools.product.plugingen.examples.root.level1.level2"],
        configOnly:true,
        requiredProducts: ["com.ti.rtsc.SYSBIOS","com.ti.rtsc.IPC"],
        filterArr:[{deviceFamily:"MSP430",toolChain:"TI"}]
    };

    /*!
     *  ======== projectPair ========
     *  Creates a project pair. 
     */
        config IProductTemplate.TemplateInfo projectPair = {
        title:       "Project pair",
        fileList:    [
                      {path:"examples/grace/hello/hello.c"},
                      {path:"examples/grace/hello/hello.cfg"},
                      {path:"examples/grace/hello/makefile.defs",copyIntoConfiguration:true,excludeFromBuild:true},
                      {path:"examples/grace/hello/makefile.targets",copyIntoConfiguration:false,excludeFromBuild:true}, 
                     ],
        description: "Creates a project pair.",
        target:   "ti.targets.msp430.MSP430",
        platform: "ti.platforms.msp430:$DeviceId$",
        buildProfile: "debug",
        groups:["xdc.tools.product.plugingen.examples.root.level1"],
        isHybrid:false,
        requiredProducts: ["com.ti.rtsc.SYSBIOS","com.ti.rtsc.IPC"],
        filterArr:[{deviceFamily:"MSP430",toolChain:"TI"}]
    };
 

    /*!
     *  ======== notFilter ========
     *  Demonstrates the NOT filter
     */
        config IProductTemplate.TemplateInfo notFilter = {
        title:       "NOT filter",
        fileList:    [
                      {path:"examples/grace/hello/hello.c"},
                      {path:"examples/grace/hello/hello.cfg"},
                     ],
        description: "Demonstrates the NOT filter",
        buildProfile: "debug",
        groups:["xdc.tools.product.plugingen.examples.root"],
        isHybrid:false,
        requiredProducts: ["com.ti.rtsc.SYSBIOS","com.ti.rtsc.IPC"],
        filterArr:[{deviceFamily:"~MSP430",toolChain:"TI"}]
    };

    /*!
     *  ======== regexFilter ========
     *  Demonstrates the Regex filter
     */
        config IProductTemplate.TemplateInfo regexFilter = {
        title:       "Regex filter",
        fileList:    [
                      {path:"examples/grace/hello/hello.c"},
                      {path:"examples/grace/hello/hello.cfg"},
                     ],
        description: "Demonstrates the Regex filter",
        buildProfile: "debug",
        isHybrid:false,
        groups:["xdc.tools.product.plugingen.examples.root"],
        requiredProducts: ["com.ti.rtsc.SYSBIOS","com.ti.rtsc.IPC"],
        filterArr:[{deviceId:"MSP430F54*",toolChain:"TI"}]
    };

    /*!
     *  ======== multiFilter ========
     *  Demonstrates multiple filters
     */
        config IProductTemplate.TemplateInfo multiFilter  = {
        title:       "Multi filter",
        fileList:    [
                      {path:"examples/grace/hello/hello.c"},
                      {path:"examples/grace/hello/hello.cfg"},
                     ],
        description: "Demonstrates the Regex filter",
        buildProfile: "debug",
        isHybrid:false,
        groups:["xdc.tools.product.plugingen.examples.root"],
        requiredProducts: ["com.ti.rtsc.SYSBIOS","com.ti.rtsc.IPC"],
        filterArr:[{deviceId:"MSP430F5438",toolChain:"TI"},{deviceId:"MSP430F5529",toolChain:"TI"}]
    };


    override config IProductTemplate.TemplateInfo templateArr [] = [
        tcf, empty, blinkLed, hello, configProject, projectPair, notFilter,
        regexFilter, multiFilter]; 



}
