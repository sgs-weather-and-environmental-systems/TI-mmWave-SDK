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
 *  ======== rel.js ========
 */

/*
 *  ======== rel.js ========
 *  This command performs all release data gathering and validation
 *  for a package.
 *
 *  Generate package/package.rel.xml files, check that the declared import
 *  requirements are consistent with the actual versions imported via
 *  the package path, and check that all import requirements are
 *  (recursively) consistent.
 *
 *  usage: rel.js [-f] package-base-dir [output-file]
 *
 *  Options:
 *      -f      (force) consistency checks to not fail; check failures are
 *               always displayed, but the creation of the release normally
 *               fails if compatibility failures are detected.
 *
 *      -v      verbose mode; display information during processing
 */

/* set-up the om */
utils.loadCapsule('xdc/xdc.tci');
        
/* om2.xs capsule accesses xdc.global assuming it's the top-level scope, while
 * xdc.tci sets xdc.global to the local scope of the capsule.
 */
xdc.global = this;
/* setCurPkgBase must be called before loadCapsule is called because
 * setCurPkgBase impacts the path in loadCapsule, when '^' is used.
 */
xdc.setCurPkgBase(".");
xdc.loadCapsule('xdc/om2.xs');

/* This is where xs executable loads a model, if needed, and then gives
 * control to the user script.
 */
/* -------------------------------------------------------------------------*/
        
xdc.$$make_om('rel');
utils.importFile("rel.tci");
        
/*
 *  ======== main ========
 */
if (arguments.length >= 1) {
        
    var verbose = false;
    var topdir = arguments.shift();
        
    if (topdir[0] == '-') {
        switch (topdir[1]) {
            case 'f': {
                environment["xdc.bld.release.check.fatal"] = "false";
                topdir = arguments.shift();
                break;
            }
            case 'v': {
		verbose = true;
                environment["xdc.bld.release.verbose"] = "true";
                topdir = arguments.shift();
                break;
            }
            default: {
                print("usage: rel.js [-f] package-base-dir [output-file]");
                java.lang.System.exit(1);
            }
        }
    }
        
    var outputFileName = null;
    if (arguments.length >= 1) {
        outputFileName = arguments.shift();
    }
        
    /* set the package path for the current package under review */
    var ppath = rel.getPackagePath(topdir + '/.xdcenv.mak');
    environment["xdc.path"] = ppath;

    /* load java run-time support */
    xdc.loadPackage('xdc.services.intern.cmd');

    /* generate the referenced package information first; this ensures that
     * we have the information about references even if the import
     * requirements are determined to be incompatible with the package path.
     */
    var builtWith = rel.genXML(topdir, outputFileName);

    /* get the current package name */
    var curPkg = new Packages.xdc.services.intern.cmd.Scan(
        xdc.$$private.Env
    );
    var curPkgName = "" + curPkg.read(topdir + "/package.xdc");
            
    if (verbose == true) {
	print("Package " + curPkgName + " built with the following packages:");
	for (var p in builtWith) {
	    print("    " + p + " [" + builtWith[p] + "]");
	}
    }

    /* verify consistency of existing verses required imports */
    if (verbose == true) {
	print("Checking that the requirements of " + curPkgName
	      + " match versions actually built with ... ");
    }
    rel.checkImports(curPkg.getImports(), builtWith, curPkgName);
        
    /* check compatibility of import statements and built-with versions */
    if (verbose == true) {
	print("Checking compatibility of " + curPkgName
	      + "'s requirements with packages imported ... ");
    }
    rel.verify([curPkgName]);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

