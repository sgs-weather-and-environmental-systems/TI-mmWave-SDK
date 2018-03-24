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

var Date;
var CheckPath;
var repomanMain;

var XDCPKG_L_ARG    = '-l:%n;%t;%r;%l;%v;%d ';
var XDCPKG_NAME_ARG = '-l:%n ';

/* REPO_INDEX must be %t position in XDCPKG_L_ARG */
var REPO_INDEX = 1;

/* DATE_INDEX must be %d position in XDCPKG_L_ARG */
var DATE_INDEX = 5;

var fName = ["Package Name:      ",
             "Repository:        ",
             "Release Name:      ",
             "Label:             ",
             "Compatibility Key: ",
             "Date:              "
];

var PROVIDER_FNAME = "Provider Id:       ";
var PRODUCER_FNAME = "Producer Id:       ";
var ORIG_PROVIDER_FNAME = "Original Provider: ";

/*
 *  ======== run ========
 */
function run(cmdr, args)
{
    var inst = this.$private;
    inst.self = this;
    var xdcPath = null;
    var xdcPkgCmd;

    for (var p in inst.self) {
        inst[p] = inst.self[p];
    }

    inst.cmdr = cmdr;
    inst.args = args;

    inst.cmdr.verbose(inst.verboseFlag);

    _validate(inst);

    /* don't load unnecessary packages */
    if (!inst.shortFlag || inst.checkFlag) {
        Date = xdc.loadCapsule('xdc/tools/gbl/Date.xs');
        CheckPath = xdc.loadCapsule('xdc/tools/repoman/CheckPath.xs');
        repomanMain = xdc.loadCapsule('xdc/tools/repoman/Main.xs');
    }

    if (!inst.repositoriesFlag && !inst.directoriesFlag && !inst.recurseFlag) {
        /* no directories explicitly specified use xdc path, use pkg path */
        xdcPath = environment['xdc.path'];

        /* replace backslashes with forward slashes */
        xdcPath = xdcPath.replace(/\\/g, '/');
    }

    if (inst.pathFlag) {              /* echo xdc path or -P* args */

        if (inst.repositoriesFlag || inst.directoriesFlag ||
            inst.recurseFlag) {

            /* echo directory args */
            if (inst.arrFlag) {       /* return as an array */
                inst.resArr = [];
                _pathDirArr(inst);
                return (inst.resArr);
            }
            else if (inst.xmlFlag) {  /* return XML */
                inst.resObj = new inst.self.$module.DirResults;
                _pathDirXml(inst);
                return (inst.resObj.$xml());
            }
            else {
                inst.resStr = '';     /* return a string */
                _pathDirStr(inst);
                return (inst.resStr);
            }
        }
        else {
            /* echo xdc path */
            if (inst.arrFlag) {       /* return an array */
                inst.resArr = [];
                _pathArr(inst, xdcPath);
                return (inst.resArr);
            }
            else if (inst.xmlFlag) {  /* return XML */
                inst.resObj = new inst.self.$module.PathResults;
                _pathXml(inst, xdcPath);
                return (inst.resObj.$xml());
            }
            else {
                inst.resStr = '';     /* return a string */
                _pathStr(inst, xdcPath);
                return (inst.resStr);
            }
        }
    }
    else {     /* list packages on xdc path or in -P* args */

        /* create a string that executes xcdpkg */
        xdcPkgCmd = _buildXdcPkgCmd(inst, xdcPath);

        var status = {output: ""};
        if (xdcPkgCmd != "") {
            /* execute the command */
            var ecode = xdc.exec(xdcPkgCmd, {}, status);
            if (ecode) {
                inst.cmdr.error("error: the command '" + xdcPkgCmd +
                                "' failed (exit status = " + ecode +
                                "): " + status.output);
            }
        }
        if (inst.arrFlag) {           /* return an array */
            inst.resArr = [];
            _pkgsArr(inst, status.output, xdcPath);
            return (inst.resArr);
        }
        else if (inst.xmlFlag) {      /* return XML */
            if (inst.shortFlag) {
                inst.resObj = new inst.self.$module.NameResults;
            }
            else {
                inst.resObj = new inst.self.$module.Results;
            }
            _pkgsXml(inst, status.output, xdcPath);
            return (inst.resObj.$xml());
        }
        else {
            inst.resStr = '';         /* return a string */
            _pkgsStr(inst, status.output, xdcPath);
            return (inst.resStr);
        }
    }
}

/*
 *  ======== _buildRepArray ========
 */
function _buildRepArray(inst, xdcPath)
{
    /* create hash of unique directories to search */
    var dirs = {};
    var result = [];
    var list = xdcPath == null ? inst.args : xdcPath.split(';');
    for each (var a in list) {
        var dname = a.replace(/\"/g, '');
        if (dname.length == 0) {
            continue;
        }

        /* try/catch handles badly formed pathname syntax */
        var e;
        try {
            var dirfile = java.io.File(dname);
            if (!dirfile.exists()) {
                continue;
            }
            var cp = dirfile.getCanonicalPath();
        }
        catch (e) {
            continue;
        }

        /* don't add the dir if we already have it */
        if (dirs[cp] == 1) {
            continue;
        }

        /* surround in quotes if it contains a space char */
        if (cp.indexOf(' ') != -1) {
            result.push('"' + cp + '"');
        }
        else {
            result.push(cp);
        }

        /* remember that we've seen it */
        dirs[cp] = 1;
    }

    return (result);
}

/*
 *  ======== _buildXdcPkgCmd ========
 *
 *  build string to execute xdcpkg.exe
 *  with param xdcPath as the only arg or with -P* args as the arguments
 *
 */
function _buildXdcPkgCmd(inst, xdcPath)
{
    var osName = String(environment['os.name']);
    var suffix = osName.match(/^Windows/i)? ".exe" : "";

    var xdcPkgCmd = environment['config.rootDir'] + "/bin/xdcpkg" + suffix;
    if (!java.io.File(xdcPkgCmd).exists()) { /* in an engineering tree */
        var prefix = xdc.getPackageBase("xdc.services.host.bin") + "/xdcpkg";
        if (osName == 'Linux') {
            suffix = ".x86U";
        }
        else if (osName == 'SunOS') {
            suffix = ".x5";
        }
        xdcPkgCmd = prefix + suffix;
    }

    /* look for non-buildable packages too */
    xdcPkgCmd +=  " -a ";

    if (inst.repositoriesFlag) {
        /* restrict to repositories only, if -Pr is specified */
        xdcPkgCmd +=  "-r ";
    }
    else if (inst.directoriesFlag) {
        /* don't recurse if only -P is specified */
        xdcPkgCmd +=  "-s ";
    }
    else if (!inst.recurseFlag) {
        xdcPkgCmd +=  "-r ";
    }

    /* decide what to print -- long or short description */
    if (inst.shortFlag) {
        xdcPkgCmd += XDCPKG_NAME_ARG;
    }
    else {
        xdcPkgCmd += XDCPKG_L_ARG;
    }

    /* append directories to search */
    var dirs = _buildRepArray(inst, xdcPath);
    if (dirs.length == 0) {
        xdcPkgCmd = "";
    }
    else {
        xdcPkgCmd += dirs.join(' ');
    
        xdcPkgCmd = xdcPkgCmd.replace(/\\/g, '/');   /* replace backslashes */
    }

    return (xdcPkgCmd);
}

/*
 *  ======== _checkResultsArrStr ========
 *
 */
function _checkResultsArrStr(checkResults)
{
    var str = '';
    for (var i = 0; i < checkResults.length; i++) {
        if (checkResults[i].warning) {
            if (i > 0 && str.length > 0) {
                str += ';';
            }
            str += 'Warning: ' +
                    CheckPath.getWarningString(checkResults[i], true, true);
        }
    }
    return (str);
}

/*
 *  ======== _checkResultsStr ========
 *
 */
function _checkResultsStr(checkResults)
{
    var str = '';
    for each (var repoCheck in checkResults) {
        if (repoCheck.warning) {
            str += 'Warning: ' +
                   CheckPath.getWarningString(repoCheck, true, false) + '\n';
        }
    }
    return (str);
}

/*
 *  ======== _checkResultsXml ========
 *
 */
function _checkResultsXml(inst, checkResults)
{
    var ckResultsArr = [];
    for (var i = 0; i < checkResults.length; i++) {
        if (checkResults[i].warning) {
            var xmlCkResults = new inst.self.$module.CheckResults;
            xmlCkResults.repository = checkResults[i].path;
            var wstr = CheckPath.getWarningString(checkResults[i], false,
                                                  true);
            xmlCkResults.warnings = wstr.split('\n');
            ckResultsArr.push(xmlCkResults);
        }
    }
    return (ckResultsArr);
}

/*
 *  ======== _getPkgProducerId ========
 *
 */
function _getPkgProducerId(repo, pkgName)
{
    var producerId = '';
    var filename = repo.replace(/\\/g, '/') + '/' +
                   pkgName.replace(/\./g, '/') + '/package/package.rel.xml';
    if (java.io.File(filename).exists()) {
        try {
            var doc = xdc.loadXML(filename);
            producerId = doc.@producerId;
            if (!producerId) {
                producerId = '';
            }
        }
        catch (e) {
        }
    }
    return (String(producerId));
}

/*
 *  ======== _pathArr ========
 *
 *  fill inst.resArr with semicolon delimited strings from
 *  path param, with optional header as first elem
 *
 */
function _pathArr(inst, path)
{
    inst.cmdr.info('building a string array...');

    if (inst.header) {
        inst.resArr.push(inst.header);
    }

    var dirArr = path.split(';');

    if (inst.checkFlag) {

        var checkResults = CheckPath.checkPackagePathRepositories(dirArr);
        if (checkResults.length) {
            inst.resArr.push(_checkResultsArrStr(checkResults));
        }
    }

    for each (var a in dirArr) {
        if (a.length != 0) {
            inst.resArr.push(a);
        }
    }
}

/*
 *  ======== _pathDirArr ========
 *
 *  fill inst.resArr with -P* args, with
 *  optional header as first elem
 *
 */
function _pathDirArr(inst)
{
    inst.cmdr.info('building a string array...');

    if (inst.header) {
        inst.resArr.push(inst.header);
    }
    var dirArr = [];
    for each (var a in inst.args) {
        dirArr.push(a.replace(/\\/g, '/'));
    }

    if (inst.checkFlag) {

        var checkResults = CheckPath.checkPackagePathRepositories(dirArr);
        if (checkResults.length) {
            inst.resArr.push(_checkResultsArrStr(checkResults));
        }
    }

    for each (var dir in dirArr) {
        inst.resArr.push(dir);
    }
}

/*
 *  ======== _pathDirStr ========
 *
 *  set inst.resStr to -P* args, newline delimited, 
 *  preceded by optional header
 *
 */
function _pathDirStr(inst)
{
    inst.cmdr.info('building a string...');

    if (inst.header) {
        inst.resStr += inst.header + ':\n';
    }

    var dirArr = [];
    for each (var a in inst.args) {
        dirArr.push(a.replace(/\\/g, '/'));
    }
    for each (var dir in dirArr) {
        inst.resStr += dir + '\n';
    }
    if (inst.checkFlag) {

        var checkResults = CheckPath.checkPackagePathRepositories(dirArr);
        if (checkResults.length) {
            inst.resStr += _checkResultsStr(checkResults);
        }
    }
}

/*
 *  ======== _pathDirXml ========
 *
 *  fill inst.resObj with -P* args
 *  and optional header
 *
 */
function _pathDirXml(inst)
{
    inst.cmdr.info('building an XML document...');

    inst.resObj.header = inst.header;

    var dirs = inst.args;
    for each (var i = 0; i < dirs.length; i++) {
        dirs[i] = dirs[i].replace(/\\/g, '/'); /* replace any backslashes */
    }
    inst.resObj.dir = dirs;

    if (inst.checkFlag) {

        var checkResults = CheckPath.checkPackagePathRepositories(dirs);
        if (checkResults.length) {
            inst.resObj.checkResults = _checkResultsXml(inst, checkResults);
        }
    }
}

/*
 *  ======== _pathStr ========
 *
 *  set inst.resStr to path param with,
 *  optional header
 *
 */
function _pathStr(inst, path)
{
    inst.cmdr.info('building a string...');

    if (inst.header) {
        inst.resStr += inst.header + ': ';
    }
    inst.resStr += path;

    if (inst.checkFlag) {
        var dirArr = path.split(';');

        var checkResults = CheckPath.checkPackagePathRepositories(dirArr);
        if (checkResults.length) {
            inst.resStr += '\n' + _checkResultsStr(checkResults);
        }
    }
}

/*
 *  ======== _pathXml ========
 *
 *  fill inst.resObj struct with path
 *  param and optional header
 *
 */
function _pathXml(inst, path)
{
    inst.cmdr.info('building an XML document...');

    inst.resObj.header = inst.header;
    inst.resObj.path = path;

    if (inst.checkFlag) {
        var arr = path.split(';');

        var checkResults = CheckPath.checkPackagePathRepositories(arr);
        if (checkResults.length) {
            inst.resObj.checkResults = _checkResultsXml(inst, checkResults);
        }
    }
}

/*
 *  ======== _pkgsArr ========
 *
 *  fill inst.resArr with package pathnames
 *  from newline delimited pkgs param,
 *  with optional header as first elem
 *
 */
function _pkgsArr(inst, pkgs, path)
{
    inst.cmdr.info('building a string array...');

    if (inst.header) {
        inst.resArr.push(inst.header);
    }

    if (inst.checkFlag) {
        var dirArr = path == null ? inst.args : path.split(';');

        var checkResults = CheckPath.checkPackagePathRepositories(dirArr);
        if (checkResults.length) {
            inst.resArr.push(_checkResultsArrStr(checkResults));
        }
    }
    
    var pkgArr = pkgs.split('\n');
    if (inst.shortFlag) {
        for each (var a in pkgArr) {
            if (a.length != 0) {
                inst.resArr.push(a);
            }
        }
    }
    else {
        var repoXmlMap = [];
        for each (var a in pkgArr) {
            if (a.length != 0) {
                var arr = a.split(';');
                if (repoXmlMap[arr[1]] == undefined) {
                    repoXmlMap[arr[1]] = repomanMain.getRepoXmlItems(arr[1]);
                }
                var origProvId = 
                    (repoXmlMap[arr[1]].origProviderId[arr[0]]) ?
                    (repoXmlMap[arr[1]].origProviderId[arr[0]]) :
                    "";

                inst.resArr.push(a + ';' + repoXmlMap[arr[1]].providerId +
                                 ';' + origProvId +
                                 ';' + _getPkgProducerId(arr[1], arr[0]));
            }
        }
    }
}

/*
 *  ======== _pkgsStr ========
 *
 *  set inst.resStr to pkgs param,
 *  with optional header
 *
 */
function _pkgsStr(inst, pkgs, path)
{
    inst.cmdr.info('building a string...');

    if (inst.header) {
        inst.resStr += inst.header + ": \n";
    }

    if (inst.checkFlag) {
        var dirArr = path == null ? inst.args : path.split(';');

        var checkResults = CheckPath.checkPackagePathRepositories(dirArr);
        if (checkResults.length) {
            inst.resStr += _checkResultsStr(checkResults) + '\n';
        }
    }

    var pkgArr = pkgs.split('\n');

    for each (var line in pkgArr) {
        var pkgInfo = line.split(';');
        var repoXmlMap = [];
        for (var i = 0; i < pkgInfo.length; i++) {
            if (pkgInfo[i].length != 0) {
                if (i == DATE_INDEX) {
                    inst.resStr += fName[i] + Date.mkDate(pkgInfo[i]) + "\n";
                }
                else if (i == REPO_INDEX) {
                    inst.resStr += fName[i] + pkgInfo[i] + "\n";
                }
                else {
                    if (inst.shortFlag) {
                        inst.resStr += pkgInfo[i];
                    }
                    else {
                        inst.resStr += fName[i] + pkgInfo[i] + "\n";
                    }
                }
            }
        }
        if (!inst.shortFlag && pkgInfo.length > 1 && pkgInfo[1].length != 0) {
            if (repoXmlMap[pkgInfo[1]] == undefined) {
                repoXmlMap[pkgInfo[1]] = repomanMain.getRepoXmlItems(pkgInfo[1]);
            }
            inst.resStr += PROVIDER_FNAME + repoXmlMap[pkgInfo[1]].providerId + "\n";
            var origProvId = repoXmlMap[pkgInfo[1]].origProviderId[pkgInfo[0]] ?
                             repoXmlMap[pkgInfo[1]].origProviderId[pkgInfo[0]] : '';
            inst.resStr += ORIG_PROVIDER_FNAME + origProvId + "\n";
            inst.resStr += PRODUCER_FNAME + _getPkgProducerId(pkgInfo[1],
                           pkgInfo[0]) + "\n";
        }
        inst.resStr += "\n";
    }
}

/*
 *  ======== _pkgsXml ========
 *
 *  fill inst.resObj with package names
 *  from newline delimited pkgs param,
 *  and optional header
 */
function _pkgsXml(inst, pkgs, path)
{
    inst.cmdr.info('building an XML document...');

    inst.resObj.header = inst.header;

    if (path == null) {     /* fill the path field */
        inst.resObj.path = "";
        for each (var dir in inst.args) {
            dir = dir.replace(/\\/g, '/');
            inst.resObj.path += dir + ';';
        }
    }
    else {
        inst.resObj.path = path;
    }

    if (inst.checkFlag) {
        var dirArr = path == null ? inst.args : path.split(';');
        var checkResults = CheckPath.checkPackagePathRepositories(dirArr);
        if (checkResults.length) {
            inst.resObj.checkResults = _checkResultsXml(inst, checkResults);
        }
    }

    var pkgArr = pkgs.split('\n'); 
    while (pkgArr.length > 0 && pkgArr[pkgArr.length - 1].length == 0) {
        --pkgArr.length;
    }

    var arr = [];
    var repoXmlMap = [];
    for each (var line in pkgArr) {
        var pkgInfo = line.split(';');
        if (inst.shortFlag) {
           arr.push(pkgInfo[0]);
        }
        else {
            var pkgXml = new inst.self.$module.Pkg;
            pkgXml.name = pkgInfo[0];
            pkgXml.repository = ("" + pkgInfo[1]).replace(/\\/g, '/');
            pkgXml.release = pkgInfo[2];
            pkgXml.label = pkgInfo[3];
            pkgXml.key = pkgInfo[4];
            pkgXml.date = Date.mkDate(pkgInfo[5]);
            if (repoXmlMap[pkgInfo[1]] == undefined) {
                repoXmlMap[pkgInfo[1]] = repomanMain.getRepoXmlItems(pkgInfo[1]);
            }
            pkgXml.providerId = repoXmlMap[pkgInfo[1]].providerId;
            pkgXml.originalProviderId = 
                    (repoXmlMap[pkgInfo[1]].origProviderId[pkgInfo[0]]) ?
                    (repoXmlMap[pkgInfo[1]].origProviderId[pkgInfo[0]]) :
                    "";
            pkgXml.producerId = _getPkgProducerId(pkgInfo[1], pkgInfo[0]);
            arr.push(pkgXml);
        }
    }
    if (inst.shortFlag) {
        inst.resObj.name = arr;
    }
    else {
        inst.resObj.pkg = arr;
    }
}

/*
 *  ======== _validate ========
 *
 *  validate command line
 *
 */
function _validate(inst)
{
    if (inst.arrFlag && inst.xmlFlag) {
        inst.cmdr.usage("invalid use of flags");
        return (false);
    }

    var c = inst.repositoriesFlag + inst.directoriesFlag + inst.recurseFlag;

    if (c > 1) {
        inst.cmdr.usage("only one of -P, -PR or -Pr may be specified");
        return (false);
    }

    if (c > 0 && inst.args.length == 0) {
        inst.cmdr.usage("one or more directory arguments are required");
        return (false);
    }

    
    return (true);
}
/*
 *  @(#) xdc.tools.path; 1, 0, 0,0; 1-9-2017 12:51:40; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

