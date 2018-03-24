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
xdc.loadPackage('xdc.services.intern.cmd');

/* add any .jar file dependencies to the generated makefile */
var args = arguments;
var deps = xdc.$$addJars();
if (deps != null) {
    arguments.push("-D");
    args = arguments.concat(deps);
}

Packages.xdc.services.intern.cmd.Builder.main(args);

/*
 *  @(#) xdc.services.intern.cmd; 1, 0, 0,0; 11-8-2017 17:12:14; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

