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
    Gen = xdc.module(this.$package + '.Gen');
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(input)
{
    /*  TODO: this should really be in Template.xs and we should call
     *  $super.$capsule.instance$meta$init(input).
     *
     * this.input exists because Main isa ICmd and ICmd isa Template
     */

    /* find the template */
    this.input = input;
    this.inputPath = xdc.findFile(input);
    if (!this.inputPath) {
        throw new Error("can't find template " + input);
    }
}

/*
 *  ======== main ========
 */
function main(args)
{
    /* convert to a real array */
    if (args == null) {
        args = [];
    }
    else {
        var _args = [];
        for (var i = 0; i < args.length; i++) {
            _args.push(args[i]);
        }
        args = _args;
    }

    /* template name is always first positional argument */
    var template = args.shift();

    /* create the instance */
    var mod = this.$orig;
    var inst = mod.create(template);

    /* prevent error on no -o option */
    inst.output = null;

    var cmdr = xdc.module('xdc.tools.Cmdr').create(mod);
    cmdr.getopts(inst, args);

    /* if no output option, get second positional argument */
    var output = inst.output;
    if (!output) {
        output = args.shift();
    }

    try {
        /* call the real mkpkg function */
        _mkpkg.call(inst, output, args);
        return 0;
    }
    catch (e) {
        print(e);
        print(
            "usage: xs xdc.tools.mkpkg [-u] template output [ args... ]\n" +
            "where\n" +
            "  template\n" +
            "    names a .xdt template file or directory of template files\n" +
            "    to process, found either explicitly or along the package path.\n" +
            "  output\n" +
            "    names the file or directory to be generated.\n" +
            "  args\n" +
            "    optional arguments passed into the template.\n" +
            "options:\n" +
            "  -u   update only files whose contents must change"
        );
        return 1;
    }
}

/*
 *  ======== mkpkg ========
 */
function mkpkg(template, output, arguments)
{
    var mod = this.$orig;
    var inst = mod.create(template, {preserveModTime: mod.update});
    _mkpkg.call(inst, output, arguments);
}

/*
 *  ======== _mkpkg ========
 */
function _mkpkg(output, arguments)
{
    /* check usage */
    if (!this.input) {
        throw new Error('argument "template" is required');
    }
    if (!output) {
        throw new Error('argument "output" is required');
    }

    /* save the positional parameters */
    this.arguments = arguments;
    this.output = output;

    /* instantiate the template */
    var gen = Gen.create(this, output, {preserveModTime:this.preserveModTime});
    gen.gen();
}
