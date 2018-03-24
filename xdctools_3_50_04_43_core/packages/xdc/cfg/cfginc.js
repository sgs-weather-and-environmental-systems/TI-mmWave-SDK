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
 *  ======== cfginc.js ========
 *  Generate the include (and dependency) files that cause each release to
 *  include the files included by a package's schema.
 *
 *  usage: xs -f cfginc.js packageName outputFile
 */

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

/*
 * ======================================================================
 * This is where xs executable loads a model, if needed, and then give the
 * control to the user script.
 */

/* After cfg.init(), xdc.om.$name is 'cfg'. However, this script is run only
 * at the beginning of the release phase and only if the package does not have
 * any configurations, so $name shouldn't be 'cfg' (see bugzilla 714 for more
 * information). It cannot be 'release' either because at this time, the
 * release model is not established yet.
 */
xdc.om.$$bind('$name', 'cfgnull');
var cfgModel = xdc.useModule('xdc.cfg.Main');
cfgModel.init();

/*
 *  ======== main ========
 */

/* clear the list of loaded files; so we only get what the package's
 * schema includes (beyond what's required for the config model itself).
 */
utils.loadedFiles = {};

/* import the package's schema */
xdc.loadPackage(arguments[0]);

/* generate the include file and the make dependencies */
utils.genDep("package/package.cfg", arguments[0], utils.loadedFiles);
/*
 *  @(#) xdc.cfg; 1, 0, 2,0; 11-8-2017 17:10:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

