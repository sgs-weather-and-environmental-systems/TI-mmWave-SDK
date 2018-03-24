/* --COPYRIGHT--,EPL
 *  Copyright (c) 2009 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * --/COPYRIGHT--*/


import xdc.tools.product.IProduct;                          

metaonly module ExampleProduct inherits IProduct {
    
    override config String name = "Example Product";

    override config String id   = "xdc.tools.plugingen.examples";

    override config String featureId   = "xdc.tools.plugingen.examples";

    override config IProduct.UrlDescriptor updateSite = {
        url:"http://software-dl.ti.com/dsps/dsps_public_sw/sdo_ccstudio/TargetContent/Updates/full/site.xml",
        text:"Target Content Updates"
    };

    override config String version = "1.00.00.00";  

    override config String companyName = "Texas Instruments";

    override config IProduct.UrlDescriptor productDescriptor = {
        url:"http://www.ti.com",
        text:"Example product"
    };

    override config IProduct.UrlDescriptor licenseDescriptor = {
        url:"http://www.eclipse.org/legal/epl-v10.html",
        text:"Eclipse public license(EPL)"
    };

    override config String copyRightNotice =
        "Copyright Texas Instruments 2010";

    override config String repositoryArr[] = ["packages"];

    override config String docsLocArr[] = [
        "docs",
        "docs/cdoc",
    ];

    override config String templateModule = 
        "ti.mcu.msp430.csl.product.Examples";

    override config String productViewModule =
        "ti.mcu.msp430.csl.product.ProductView";

    override config String bundleName = "exampleprod";

    override config IProduct.Target targetArr[] = [
        {
         deviceNamePattern:"MSP430.*",
         deviceFamilyPattern:"MSP430.*",
         packageName:"ti.targets.msp430",
         baseTargetName:"MSP430"
        },

        {
         deviceNamePattern:"CC430.*",
         deviceFamilyPattern:"MSP430.*",
         packageName:"ti.targets.msp430",
         baseTargetName:"MSP430"
        }
    ];

    override config IProduct.HelpToc helpTocArr[] = [
        {
         label: "Release Notes",
         filePath: "grace_release_notes.html",
         tocFile:false
        },
        {
         label: "API Reference (cdoc)",
         filePath: "cdoc/eclipse_toc.xml",
         tocFile:true
        }
    ];


}
