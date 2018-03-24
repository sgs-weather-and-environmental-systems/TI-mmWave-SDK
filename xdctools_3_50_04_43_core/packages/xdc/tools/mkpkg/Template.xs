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

/* initialize module references */
var Gen;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    Gen = xdc.module('xdc.tools.mkpkg.Gen');
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init()
{
    this.input = this.$orig.$module.$package.$name;

    /* TODO: replace this with = this.$orig.$package.packageBase; */
    this.inputPath = this.$orig.$module.$package.$spec.getBaseDir();
}

/*
 *  ======== main ========
 */
function main(args)
{
    var mod = this.$orig;
    var inst = mod.create();

    if (args == null) {
        args = [];
    }

    var cmdr = xdc.module('xdc.tools.Cmdr').create(mod);
    cmdr.getopts(inst, args);

    /* instantiate the template */
    var gen = Gen.create(inst, output);
    gen.gen();
}
