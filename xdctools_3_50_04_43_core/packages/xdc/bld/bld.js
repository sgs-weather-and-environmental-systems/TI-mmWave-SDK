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
 *  ======== bld.js ========
 *  This top-level script (run by xs) initializes the Build Object Model,
 *  runs a package's build script, and (if no errors occur) generates a
 *  GNU-make compatible makefile for the package.
 *
 *  Usage: xs -f bld.js [startup-file [build-script [output-makefile arg ...]]]
 *      where,
 *        startup-file    - custom "global" build model settings
 *        build-script    - package build script
 *        output-makefile - output makefile (if not specified output goes to
 *                          stdout)
 *        arg ...         - any remaining arguments are passed to the
 *                          specified build script.
 *
 *  Exit status: 0        - makefile generation succeeded
 *               non-zero - makefile generation failed
 */


/* declare global objects (other than xdc) referenced by build scripts */
var Pkg, Build;

/*
 *  ======== main ========
 */
function main(args)
{
    /* import generic object model definitions */
    utils.importFile('xdc/xdc.tci');
        
    /* setCurPkgBase must be called before loadCapsule is called because
     * setCurPkgBase impacts the path in loadCapsule, when '^' is used.
     */
    xdc.setCurPkgBase(".");
    xdc.loadCapsule('xdc/om2.xs');
    xdc.$$make_om('bld');       /* create and name this object model */
       
    var _Clock = xdc.module("xdc.services.global.Clock");
    _Clock.reset();
//    _Clock.enable = true;
    
    _Clock.print("bld: object model initialized.");

    /* load build model's modules and interfaces */
    xdc.loadPackage('xdc.bld');   
            
    /* init global objects */
    Pkg = xdc.om['xdc.bld.PackageContents'];
    Build = xdc.om['xdc.bld.BuildEnvironment'];
        
    /* bind the root object for this model in the generic "OM" */
    xdc.om.$$bind('$root', Pkg);
            
    _Clock.print("bld: build model loaded.");

    /* scan the package's modules and interfaces */
    Build.$private.scanPkg(Pkg);
            
    _Clock.print("bld: scanned package specs.");
            
    /* source the "global" tools configuration script */
    if (args.length >= 1) {
            
       /* create an arguments array for the config.bld script */
       var $save = utils.global.arguments;
       var $tmp = [args.shift()];
       for (var i = 2; i < args.length; i++) {
           $tmp[i - 1] = args[i];
       }
       utils.global.arguments = $tmp; /* ["config.bld", "arg0", ...] */
            
       /* run the config.bld script */
       Build.$private.sourceCfg($tmp[0]);
                        
       /* restore arguments array for the remaining parts of this fxn */
       utils.global.arguments = $save;
    }

    _Clock.print("bld: config.bld processing complete.");
        
    /* process arguments and generate build files (as appropriate) */
    if (args.length >= 1) {
        var file = new java.io.File(args.shift());
        if (file.exists()) {
            var out = new java.io.OutputStreamWriter(java.lang.System.out);
            if (args.length >= 1 ) {
                var fileName = args.shift();
                if (fileName != '-') {
                    out = new java.io.BufferedWriter(
                        new java.io.FileWriter(fileName));
                }
            }
            
            /* load the package's build script */
            utils.load(file.getName());
            
            _Clock.print("bld: package.bld complete.");
                    
            /* close each imported package */
            if (!(utils.hasReportedError())) {
                for (var i = xdc.om.$packages.length - 1; i >= 0; i--) {
                    var pkg =
                        xdc.om['xdc.IPackage.Module'](xdc.om.$packages[i]);
                    pkg.close();
                }
            }
        
            /* the model is now "sealed"; let each package validate */
            if (!(utils.hasReportedError())) {
                for (var i = xdc.om.$packages.length - 1; i >= 0; i--) {
                    var pkg = 
                        xdc.om['xdc.IPackage.Module'](xdc.om.$packages[i]);
                    pkg.validate();
                }
            }
                    
            _Clock.print("bld: model validated.");
        
            /* generate package.mak */
            if (!(utils.hasReportedError())) {
                xdc.om['xdc.bld.PackageContents'].$private.gen(out, args);
                out.flush();
            }
        
            /* allow each imported package to exit */
            if (!(utils.hasReportedError())) {
                for (var i = xdc.om.$packages.length - 1; i >= 0; i--) {
                    var pkg =
                        xdc.om['xdc.IPackage.Module'](xdc.om.$packages[i]);
                    pkg.exit();
                }
            }
            out.close();
        }
    }
        
    _Clock.print("bld: package.mak generation complete.  Total bld time: "
        + _Clock.getElapsedTime());
}

main(arguments);

/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

