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
 *  ======== rcl.js ========
 *
 *  This command performs all file post-processing for a release of a
 *  package.
 *
 *  usage: rcl.js [opts] manifest-file output-tar-file output-deps [relScript]
 *
 *  where
 *      manifest-file is a tar manifest file (i.e., a file containing one
 *          file name per line and is suitable for passing to tar via tar's
 *          -I option),
 *
 *      output-tar-file is the name of the tar file that contains the
 *          post-processed results.
 *
 *      output-deps is the filename to put relScript dependencies in
 *
 *      relScript is a Release Model script that can specifies what
 *          post-processing should occur with the specified files,
 */

var Manifest;

/*
 *  ======== main ========
 */
function main(args)
{
    utils.loadCapsule('xdc/xdc.tci');
        
    /* om2.xs capsule accesses xdc.global assuming it's the top-level scope,
     * while xdc.tci sets xdc.global to the local scope of the capsule.
     */
    xdc.global = this;
    /* setCurPkgBase must be called before loadCapsule is called because
     * setCurPkgBase impacts the path in loadCapsule, when '^' is used.
     */
    xdc.setCurPkgBase(".");
    xdc.loadCapsule('xdc/om2.xs');
        
    /* This is where xs executable loads a model, if needed, and then give the
     * control to the user script.
     */
    /* ----------------------------------------------------------------------*/
                
    xdc.$$make_om('rel');           /* create and name this object model */
        
    /* java run-time functions */
    xdc.loadPackage('xdc.services.intern.cmd');
        
    Manifest = xdc.useModule('xdc.bld.Manifest');
    xdc.om.$$bind('$root', Manifest);
        
    utils.importFile("rcl.tci");
                
    if (args.length >= 1) {
        var manifestFile = args.shift();
                    
        if (args.length < 1) {
            throw new Error("no output file specified (manifest = '"
			    + manifestFile + "'");
        }
        var outputFileName = args.shift();
                    
        if (args.length < 1) {
            throw new Error(
                "no output file for dependencies specified (outputFileName = '"
                    + outputFileName + "'");
        }
        var depFileName = args.shift();
                    
        var scriptFileName = null;
        if (args.length >= 1) {
            scriptFileName = args.shift();
        }

        /* compute release name (from the archive file name) */
        var releaseName = outputFileName.replace(/\.(tar|zip)$/, "");
                
        /* populate the release model from the manifest file */
        rcl.scan(releaseName, manifestFile);
                        
        /* run the user's script */
        if (scriptFileName != null) {
//          print("running release script '" + scriptFileName + "'");
            var spath = ".;" + xdc.curPath();
            var fullName = utils.findFile(scriptFileName, spath, ';');
            if (fullName == null) {
                throw new Error("can't find '" + scriptFileName
                    + "' along the path '" + spath + "'");
            }
            utils.load(fullName);
        }

        /* finalize each imported package */
        if (!(utils.hasReportedError())) {
            for (var i = xdc.om.$packages.length - 1; i >= 0; i--) {
                var pkg = xdc.om.xdc.IPackage.Module(xdc.om.$packages[i]);
                pkg.close();
            }
        }
                
        /* the model is now "sealed"; let each package validate */
        if (!(utils.hasReportedError())) {
            for (var i = xdc.om.$packages.length - 1; i >= 0; i--) {
                var pkg = xdc.om.xdc.IPackage.Module(xdc.om.$packages[i]);
                pkg.validate();
            }
        }
                        
        /* generate the post-processed files */
        if (!(utils.hasReportedError())) {
            
            /* create release archive output file */
//          print("creating release archive '" + outputFileName + "'");
            rcl.gen(outputFileName);
                
            /* generate dependencies on files used during release processing */
            print("generating rcl dependencies " + depFileName);
            rcl.genDep(outputFileName, depFileName, utils.loadedFiles);
        }
                
        /* allow each imported package to exit */
        if (!(utils.hasReportedError())) {
            for (var i = xdc.om.$packages.length - 1; i >= 0; i--) {
                var pkg = xdc.om.xdc.IPackage.Module(xdc.om.$packages[i]);
                pkg.exit();
            }
        }
    }
}

main(arguments);
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

