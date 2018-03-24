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
var Cmdr;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    Cmdr = this;
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(cmdmod, params)
{
    var inst = this.$private;

    inst.self = this;

    inst.cmdmod = cmdmod;
    inst.cmdname = cmdmod.$spec.name == 'Main'
        ? cmdmod.$spec.pkgName : cmdmod.$spec.qualName;
    inst.timer = 0;
    inst.verbose = false;
}

/*
 *  ======== error ========
 */
function error(msg)
{
    var inst = this.$private;

    switch (inst.self.context) {

        case Cmdr.SCRIPT:
            throw new Error(inst.cmdname
                + ": "  + (msg ? msg : 'fatal error'));
            break;
        case Cmdr.SHELL:
            throw new Error(this.$private.cmdname
                + ": "  + (msg ? msg : 'fatal error'));
            break;
    }
}

/*
 *  ======== getopts ========
 */
function getopts(cmdinst, args)
{
    var inst = this.$private;

    /* for scalar configs, overwrite the previous option value */
    function setScalar(type) {
        return (function(obj, prop, value) {
            obj[prop] = type(value);
        });
    };
    /* for array configs, add the option value onto the end */
    function extendArray(type) {
        return (function(obj, prop, value) {
            obj[prop].$add(type(value));
        });
    };
    var consmap = {
        b: setScalar(Boolean), Ab: extendArray(Boolean),
        n: setScalar(Number),  An: extendArray(Number),
        s: setScalar(String),  As: extendArray(String)
    };

    var cfgarr = [];
    var optmap = {};

    for each (var cfg in inst.cmdmod.$spec.configs.toArray()) {
        var co;
        if ((co = cfg.attrString('@CommandOption')) != null) {
            var opts = _decodeCommandOption(co);

            /* save the config */
            cfgarr.push(cfg);

            /* add each alias */
            for (var i = 0; i < opts.length; i++) {
                optmap[opts[i]] = cfg;
            }
        }
    }

    while (args.length && args[0][0] == '-') {

        var a = args.shift();

        if (a == '--help') {
            return _help(inst, cfgarr);
        }

        if (a == '--time') {
            inst.timer = java.lang.System.currentTimeMillis();
            continue;
        }

        /* search for the longest matching option */
        var opt = undefined;
        cfg = undefined;
        for (var _opt in optmap) {
            if (a.substr(0, _opt.length) != _opt) {
                /* doesn't match at all */
                continue;
            }

            if (opt && _opt.length < opt.length) {
                /* shorter than the current match */
                continue;
            }

            /* remember it */
            opt = _opt;
            cfg = optmap[opt];
        }

        if (!cfg) {
            return inst.self.usage('unknown option: ' + a);
        }

        /* see whether and how the user passed a value as a suffix */
        var m = a.substr(opt.length).match(/^([:=]?)(.*)/);
        var valFlag = m[1];
        var valText = m[2];

        var val = undefined;
        if (cfg.typeCode == 'b') {
            /* if the user passed a value, get it */
            if (valFlag) {
                val = valText;
                if (val == "0" || val == "false") {
                    val = false;
                }
            }
            else {
                /* the config is a boolean, no value is needed */
                val = true;

                /* process concatenated single-character flags */
                if (opt.match(/^-.$/) && valText) {
                    args.unshift('-' + valText);
                }
            }
        }
        else if (valFlag || valText) {
            /* user passed the value as a suffix -- get it */
            val = valText;
        }
        else {
            /* the value is in the next argument */
            val = args.shift();
        }

        if (val === undefined) {
            return inst.self.usage('value required: ' + a);
        }

        /*
         * if the config parameter is a vector, push the new value
         * onto the end.
         */
        var typeCode = cfg.typeCode;
        if (typeCode in consmap) {
            consmap[typeCode](cmdinst, cfg.name, val);
        }
        else {
            throw new Error('unsupported typeCode ('
                            + typeCode
                            + ') for a command line parameter in config '
                            + cfg.getQualName());
        }
    }

    for (var cn in optmap) {
        cfg = optmap[cn];
        if (cmdinst[cfg.name] === undefined) {
            return inst.self.usage('undefined parameter: ' + cn);
        }
    }

    return (undefined);
}

/*
 *  ======== info ========
 */
function info(msg)
{
    var inst = this.$private;

    if (inst.verbose) {
        java.lang.System.out.println(inst.cmdname + ": " + msg);
    }
}

/*
 *  ======== read ========
 */

function read()
{
    var inst = this.$private;

    if (inst.self.tid) {
        return (new java.lang.String(inst.self.socket.takeFromClient()));
    }
    else if (java.lang.System['in'].readLine) {
        /* System.in has already been redirected to a BufferedReader */
        return java.lang.System['in'].readLine();
    }
    else if (inst.br) {
        /* already have a local BufferedReader wrapper */
        return inst.br.readLine();
    }
    else {
        /* create a BufferedReader wrapping System.in */
        inst.br = new java.io.BufferedReader(
            new java.io.InputStreamReader(java.lang.System['in']));
        return inst.br.readLine();
    }
}

/*
 *  ======== usage ========
 */
function usage(msg)
{
    var inst = this.$private;

    if (inst.self.context == Cmdr.SCRIPT) {
        inst.self.error(msg);
    }

    if (msg) {
        java.lang.System.err.println(inst.cmdname + ": " + msg);
    }
    return _usage(inst);
}

/*
 *  ======== time ========
 */
function time(msg)
{
    var inst = this.$private;

    if (!inst.timer) {
        return;
    }

    java.lang.System.err.print(inst.cmdname + '['
        + (java.lang.System.currentTimeMillis() - inst.timer) + 'ms]');
    java.lang.System.err.println(msg ? (': ' + msg) : '');
}

/*
 *  ======== verbose ========
 */
function verbose(flag)
{
    var inst = this.$private;
    inst.verbose = Boolean(flag);
}

/*
 *  ======== warning ========
 */
function warning(msg)
{
    if (msg) {
        java.lang.System.err.println(this.$private.cmdname + ": " + msg);
    }
}

/*
 *  ======== write ========
 */
function write(s)
{
    var inst = this.$private;

    if (inst.self.tid) {
        inst.self.socket.giveToClient(s);
    }
    else {
        java.lang.System.out.println(s);
    }

    return;
}

/*
 *  ======== _decodeCommandOption ========
 */
function _decodeCommandOption(co) 
{
    co = (co+'').replace(/^\s+|\s+$/g,'').replace(/[\s,]+/, ',').split(',');
    var opts = [];
    for (var i = 0; i < co.length; i++) {
        var opt = co[i];
        if (opt == '') {
            /* ignore empty options */
            continue;
        }
        else if (opt[0] == '-') {
            /* option already includes a dash prefix */
            opts.push(opt);
        }
        else if (opt.length == 1) {
            /* short option names start with '-' */
            opts.push('-' + opt);
        }
        else {
            /* long option names start with '--' */
            opts.push('--' + opt);
        }
    }

    return opts;
}

/*
 *  ======== _deleteDirectory ========
 */
function _deleteDirectory(dir)
{
    var dirFile = java.io.File(dir);
    if (dirFile.exists() && dirFile.isDirectory()) {
        for each (var f in dirFile.listFiles()) {
            if (f.isDirectory() && f.listFiles().length) {
                _deleteDirectory(f);
            }
            try {
                f['delete']();
            }
            catch (e) {
                java.lang.System.err.println("Cannot delete file: " +
                                             f.getCanonicalPath());
            }
        }
        dirFile['delete']();
    }
}

/*
 *  ======== _help ========
 */
function _help(inst, cfgarr)
{
    var xdoc = inst.cmdmod.$spec.makeXDoc();
    java.lang.System.err.println('\nSummary: ' + xdoc.summary + '\n');

    _usage(inst);

    java.lang.System.err.println('Options:');
    for each (var cfg in cfgarr) {
        xdoc = cfg.makeXDoc();
        var names = _decodeCommandOption(cfg.attrString('@CommandOption'));
        java.lang.System.err.println('\t' + names.join(',') + '\t' 
                                     + xdoc.summary);
    }

    var xmlDir = inst.cmdmod.$package.packageBase + 'package';
    if (!java.io.File(xmlDir + '/package.doc.xml').exists()) {
        try {
            var tmpdir = String(Packages.xdc.services.global.Host.tmpdir())
                + '/';
            var Xml = xdc.loadCapsule('xdc/tools/cdoc/Xml.xs');
            xmlDir = Xml.gen(inst.cmdmod.$package.packageBase, tmpdir, []);
        }
        catch (e) {
            print('warning: error generating package.doc.xml from ' +
                  inst.cmdmod.$package.packageBase + '. ' + e);
            return 0;
        }
    }
    var xml = xdc.loadXML(java.io.File(xmlDir + '/package.doc.xml').getAbsolutePath());
    var details = xml.unit.(@name == 'Main').docSect.(@name == 'details').docPara;
    if (details.length()) {
        java.lang.System.err.println('Details:');
        for each (var node in details) {
            java.lang.System.err.println();
            var s = String(java.net.URLDecoder.decode(node.@content, 'UTF-8'));
            s = s.replace(/^(\s*)/gm, '\t');
            java.lang.System.err.println(s);
        }
    }
    if (tmpdir) {
        _deleteDirectory(tmpdir);
    }
    /* exit shell with a zero error status */
    return 0;
}

/*
 *  ======== _usage ========
 */
function _usage(inst)
{
    java.lang.System.err.println('Usage: xs ' + inst.cmdname + " [--help]");
    for each (var line in inst.cmdmod.usage) {
        java.lang.System.err.println('\t' + line);
    }

    /* exit with an error code of 1 */
    return 1;
}
/*
 *  @(#) xdc.tools; 1, 0, 0,0; 11-8-2017 17:13:28; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

