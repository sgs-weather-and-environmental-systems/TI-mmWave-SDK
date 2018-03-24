/* 
 *Copyright (c) 2008 Texas Instruments and others.
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
 *  ======== Main.xs ========
 */
 
/*
 *  ======== run ========
 */
function run(cmdr, args)
{
    var inst = this.$private;
    inst.self = this;

    for (p in inst.self) {
        inst[p] = inst.self[p];
    }

    inst.cmdr = cmdr;
    inst.args = args;

    if (inst.verboseFlag) {
        utils.traceEnable("Check.xs");
        inst.cmdr.verbose(inst.verboseFlag);
    }

    _validateArgs(inst);

    try {
        var Check = xdc.loadCapsule('xdc/tools/check/Check.xs');
        var pkgs = _findPackages(inst);

        inst.results = Check.scanBuiltWith(pkgs, inst.target, inst.exclude);
    }
    catch (e) {
        inst.cmdr.error(e.message);
    }
    
    if (inst.arrFlag) {
        return (_outputArr(inst));
    }
    else if (inst.xmlFlag) {
        return (_outputXml(inst));
    }

    return (_outputStr(inst));
}

/*
 *  ======== _outputArr ========
 */
function _outputArr(inst)
{
    inst.cmdr.info('building a string array...');

    var out = [];

    for each (var msg in inst.results.msgs) {
        if (msg.errors.length > 0) {
            var text = "Error: " + msg.text + ', ' + msg.errors.join(', ');
            out.push(text);
        }
        if (msg.warnings.length > 0) {
            var text = "Warning: " + msg.text + ', ' + msg.warnings.join(', ');
            out.push(text);
        }
    }

    if (inst.header) {
        out.push(inst.header);
    }

    return (out);
}

/*
 *  ======== _outputStr ========
 */
function _outputStr(inst)
{
    inst.cmdr.info('building a string...');

    var eCount = 0;
    var wCount = 0;
    
    var array = _outputArr(inst);
    var text = array.join('\n');
    if (text.length > 0) {
        text += '\n';
    }
    
    /* finally add summary stats */
    for each (var msg in inst.results.msgs) {
        if (msg.errors.length > 0) {
            eCount++;
        }
        if (msg.warnings.length > 0) {
            wCount++;
        }
    }
    text = text.concat(eCount + " errors, " + wCount + " warnings");

    return (text);
}

/*
 *  ======== _outputXml ========
 */
function _outputXml(inst)
{
    inst.cmdr.info('building an XML document...');

    var resObj = new inst.self.$module.Results;
    
    resObj.header = inst.header;
    for each (var msg in inst.results.msgs) {
        if (msg.errors.length > 0) {
            resObj.errors[resObj.errors.length++] =
                msg.text + msg.errors.join(', ');
        }
        if (msg.warnings.length > 0) {
            resObj.warnings[resObj.warnings.length++] =
                msg.text + msg.warnings.join(', ');
        }
    }

    /* convert Check's targets output to XML object */
    for each (var targ in inst.results.targets) {

        /* map target keys to array of packages */
        var keyHash = {};
        for (var pname in targ.keys) {
            var key = targ.keys[pname];
            if (keyHash[key] == null) {
                keyHash[key] = [];
            }
            keyHash[key].push(pname);
        }

        /* create array of {key:, packages:[]} objects */
        var keyArray = [];
        for (var key in keyHash) {
            keyArray.push({
                key: key,
                packages: keyHash[key]
            });
        }

        if (keyArray.length > 1 || inst.verboseFlag) {
            resObj.targets[resObj.targets.length++] = {
                name: targ.name, 
                keys: keyArray
            };
        }
    }

    return (resObj.$xml());
}

/*
 *  ======== _validateArgs ========
 */
function _validateArgs(inst)
{
    if (inst.args.length == 0) {
        inst.cmdr.info("checking packages on current package path ...");
    }
}

/*
 *  ======== _findPackages ========
 */
function _findPackages(inst)
{
    var pkgs = [];
    var args = ["-a", "-Pr"];
    var list = inst.args;
    
    if (list.length == 0) {
        list = xdc.curPath().split(';');
    }

    for each (var n in list) {
        inst.cmdr.info("searching for packages in " + n + " ...");
        args.push(n);
    }

    var pathMain = xdc.useModule('xdc.tools.path.Main');
    try {
        list = pathMain.exec(args);
    }
    catch (e) {
        throw new Error(e.message);
    }
    
    var phash = {};
    for each (var n in list) {
        var pinfo = n.split(';');
        var pname = pinfo[0];

        /* only add the first occurance of a package */
        if (inst.multipleFlag || phash[pname] != true) {
            phash[pname] = true;
            var pkg = {
                name: pinfo[0],
                base: pinfo[1] + '/' + pinfo[0].replace(/\./g, '/'),
                vers: pinfo[4].replace(/ /g, ""),
            };
            pkgs.push(pkg);
            inst.cmdr.info("checking package " + pkg.name
                + "[" + pinfo[4] + "] ...");
        }
    }

    return (pkgs);
}
/*
 *  @(#) xdc.tools.check; 1, 0, 0,0; 1-9-2017 12:51:20; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

