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
 *  ======== Repository.addPackages ========
 */
function addPackages(names) {

    var priv = this.$private;
    var BuildEnvironment = xdc.om['xdc.bld.BuildEnvironment'];
    
    for (var i = 0; i < names.length; i++) {
	var na = names[i].split(":");
	var pname = na[0];
	var rname = na[1];
	
	/* ensure a release id was specified */
	if (rname == null) {
	    throw new Error(
		"addPackages was passed a name without a release identifier: '"
		+ names[i] + "'");
	}

	/* ensure uniqueness of package name */
	if (priv.packages[pname] != null) {
	    throw new Error("addPackages was passed '" + pname +
		"' more than once for the repository '" + this.name + "'");
	}

	/* package must be be in the requires list of this package */
	var inList = false;
	for (var j = 0; j < priv.pkg.imports.length; j++) {
	    var imp = String(priv.pkg.imports[j]).split("{");
	    if (pname == imp[0]
                || (imp[0][0] == '*' && pname == imp[0].substring(1))) {
		inList = true;
		break;
	    }
	}
	if (inList != true) {
	    throw new Error("addPackages was passed '" + pname +
		"', but this package is not in " + priv.pkg.name
		+ "'s requires list.");
	}

	/*  allow release names that don't contain the file extension; this
	 *  will allow us to change from .tar to .zip or .tar.gz without
	 *  breaking existing scripts.
         *
         *  TODO: BUG(?) if rname has a '.' it may still not be a complete
         *  file name (the release name might be a package name with dots).
         *  In this case, we erroneously treat rname as an archive name
         *  rather than a release name.
	 */
        var rdesc = {};
	var dotIndex = rname.lastIndexOf(".");
	if (dotIndex <= 0 || rname.substring(dotIndex).indexOf("/") != -1) {
	    /* release file extension was not specified */

            /* redefine rname to be physical name of archive file */
            var relDescs = BuildEnvironment.getReleaseDescs(pname);
            for (var j = 0; j < relDescs.length; j++) {
                if (rname == relDescs[j].name) {
                    rdesc = relDescs[j];
                    rname = rdesc.aname;
                    break;
                }
            }
	}

	/* TODO: rname should be in the release list for package pname but we
	 * can't know this until the external package's makefile has been 
	 * built.  Since there is normally no order for the construction of
         * makefiles either we impose a build order or we defer this check
         * until some later time.
	 */
	priv.packages[pname] = {
            name:  pname,
            rname: rname,
            fname: pname.replace(/\./g, "/") + "/" + rname,
            rdesc: rdesc
        };
    }
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

