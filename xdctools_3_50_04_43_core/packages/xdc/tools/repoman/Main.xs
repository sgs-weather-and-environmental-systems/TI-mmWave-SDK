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

var Date = xdc.loadCapsule('xdc/tools/gbl/Date.xs');

/*
 *  ======== file type ========
 */
var UNKNOWN_FILETYPE            = 0;
var TAR_FILETYPE                = 1;
var TARGZ_FILETYPE              = 2;
var ZIP_FILETYPE                = 3;
var ARCHIVE_DIRECTORY_FILETYPE  = 4;
var REPOSITORY_FILETYPE         = 5;
var PACKAGE_NAMES               = 6;
var PACKAGE_FILES               = 7;

/*
 *  ======== output type ========
 */
var ARRAY_OUTPUT  = 0;
var STRING_OUTPUT = 1;
var XML_OUTPUT    = 2;

/*
 *  ======== string constants ========
 */
var PACKAGE_STR =      "Package:      ";
var FILE_STR =         "File:         ";
var RELEASE_NAME_STR = "Release:      ";
var RELEASE_STR =      "Label:        "; 
var VERSION_STR =      "Version       ";
var DATE_STR =         "Date:         ";
var BUILDABLE_STR =    "Buildable:    ";
var REQUIRES_STR =     "Requires:     ";
var REFS_STR =         "References:   ";
var REPOS_STR =        "Repositories: ";
var REPO_STR =         "Repository:   ";
var PROVIDER_ID_STR =  "ProviderId:   ";
var ORIG_PROVIDER_STR ="Original Provider:   ";
var PRODUCER_ID_STR =  "ProducerId:   ";
var WRITABLE_STR =     "Writable:     ";
var PACKAGE_XDC_FILE_STR =   "package.xdc";
var CANNOT_DELETE_FILE_STR = "Cannot delete file ";
var CANNOT_DELETE_PKG_STR = "Error deleting package ";
var PACKAGES_REQUIRED_STR =   "one or more package arguments required";
var MUST_SPECIFY_BUNDLE_STR =   "one or more bundle file arguments required";
var NO_BUNDLES_STR = "Cannot identify any bundle files in args list";
var PACKAGE_BLD_XML_FILE_STR = "package.bld.xml";
var CANNOT_COPY_FILE_STR = "Cannot copy file ";
var REPO_ARG_STR =   "-r arg required";
var PATH_ARG_STR =   "-p arg required";
var REPOS_REQUIRED_STR =   "one or more repository arguments required";
var SEARCH_PATH_KEY_STR = "search path=";
var REPOSITORY_KEY_STR = "repository=";
var REPO_INDEX_MISMATCH_STR = "Index specification/destination repository mismatch";
var DEST_REPO_MISMATCH_STR = "Destination repository mismatch";
var FILE_ARG_STR =   "-f arg required";
var NOT_FOUND_STR = " not found";
var NOT_RESOLVED_STR = " cannot be resolved";
var PKGS_NOT_FOUND_STR = "packages not found: ";
var ERROR_FLAG_STR = "error: ";
var TOO_MANY_ARGS_STR = "Too many arguments";
var TOO_FEW_ARGS_STR = "Too few arguments";
var REPOXML_FILE = ".repo.xml";

var PACKAGE_INDEX = 0;
var REPO_INDEX = 1;
var FILE_INDEX = 1;
var RELEASE_NAME_INDEX = 2;
var LABEL_INDEX = 3;
var VERSION_INDEX = 4;
var DATE_INDEX = 5;
var ORIG_PROVIDER_INDEX = 7;
var PRODUCER_INDEX = 8;

/*
 *  ======== run ========
 */
function run(cmdr, args)
{
    var inst = this.$private;
    inst.self = this;

    for (var p in inst.self) {
        inst[p] = inst.self[p];
    }

    inst.cmdr = cmdr;
    inst.args = args;

    inst.cmdr.verbose(inst.verboseFlag);
    _validate(inst);
    if (inst.infoFlag || inst.namesFlag) {
        var status = '';
        if (inst.arrFlag) {       /* return an array */
            inst.resArr = [];
            status = _packageInfo(inst, ARRAY_OUTPUT);
            if (status.length) {
                inst.cmdr.error(status);
            }
            return (inst.resArr);
        }
        else if (inst.xmlFlag) {       /* return an XML struct */
            if (inst.infoFlag) {
                inst.resObj = new inst.self.$module.Results;
            }
            else {
                inst.resObj = new inst.self.$module.NameResults;
            }
            status = _packageInfo(inst, XML_OUTPUT);
            if (status.length) {
                inst.cmdr.error(status);
            }
            return (inst.resObj.$xml());
        }
        else {
            inst.resStr = "";
            status = _packageInfo(inst, STRING_OUTPUT);
            if (status.length) {
                inst.cmdr.error(status);
            }
            return (inst.resStr);
        }
    }
    else if (inst.extractFlag) {
        var status = '';
        if (inst.bundleRepositoryArg == null) {
            var destDir = inst.repositoryArg;
            if (destDir == null) {
                destDir = _getCurrentRepository();
            }
            else if (!java.io.File(destDir).exists()) {
                status = "Destination repository "
                         + java.io.File(destDir).getCanonicalPath()
                         + NOT_FOUND_STR;
            }
            if (!status.length) {
                status = _extractPackages(inst,
                                          java.io.File(destDir).getCanonicalPath(),
                                          !inst.forceFlag);
            }
        }
        else {
            if (inst.args.length > 1) {
                status = _extractPackagesFromBundle(inst);                
            }
            else {
                status = _extractRepositoryFromBundle(inst);
            }
        }
        if (status.length) {
            inst.cmdr.error(status);
        }
        return (status);
    }
    else if (inst.deleteFlag) {
        var status = "";
        var srcDir = inst.repositoryArg;
        if (srcDir == null) {
            srcDir = _getCurrentRepository();
        }
        else if (!java.io.File(srcDir).exists()) {
            status = "Repository " + java.io.File(srcDir).getCanonicalPath()
                      + NOT_FOUND_STR;
            inst.cmdr.error(status);
        }

        /* check if writable */
        if (!inst.forceFlag && !isRepositoryWritable(srcDir)) {
            status = "Repository " + java.io.File(srcDir).getCanonicalPath()
                     + " is not writable";
            inst.cmdr.error(status);
        }

        /* check if any args have wildcards */
        var hasWildcards = false;
        for each (var p in inst.args) {
            if (_containsWildcards(p)) {
                hasWildcards = true;
                break;
            }
        }

        /* if wildcards, must test all packages in repository */
        if (hasWildcards) {

            /* get an array of the packages in srcDir */
            var pkgArr = [];
            try {
                pkgArr = _getPackageNames(srcDir);
            }
            catch (e) {
                status = e.message;
            }

            /* look for matches in the args list */
            var pkgDeleted = false;
            for each (var p in pkgArr) {
                for each (var a in inst.args) {
                    if (_containsWildcards(a)) {
                        if (_wildMatch(a, p)) {
                            status = _deletePackage(inst, srcDir, p);
                            if (status.length) {
                                break;
                            }
                            status = _removePkgOriginalProviderId(srcDir, p);
                            if (status.length) {
                                break;
                            }
                            if (!pkgDeleted) {
                                pkgDeleted = true;
                            }
                        }
                    }
                    else if (("" + a) == ("" + p)) {
                        status = _deletePackage(inst, srcDir, p);
                        if (status.length) {
                            break;
                        }
                        status = _removePkgOriginalProviderId(srcDir, p);
                        if (status.length) {
                            break;
                        }
                        if (!pkgDeleted) {
                            pkgDeleted = true;
                        }
                    }
                }
                if (status.length) {
                    break;
                }
            }
            if (!status.length && !pkgDeleted) {
                status = 'No packages deleted';
            }
        }
        else { /* otherwise, just delete the packages in the args list */
            for each (var p in inst.args) {
                status = _deletePackage(inst, srcDir, p);
                if (status.length) {
                    break;
                }
                status = _removePkgOriginalProviderId(srcDir, p);
                if (status.length) {
                    break;
                }
            }
        }
        if (status.length) {
            inst.cmdr.error(status);
        }
        return (status);
    }
    else if (inst.copyFlag) {
        var status = "";
        var destDir = inst.repositoryArg;
        if (destDir == null) {
            destDir = _getCurrentRepository();
        }
        else if (!java.io.File(destDir).exists()) {
            status = "Repository " + java.io.File(destDir).getCanonicalPath()
                     + NOT_FOUND_STR;
            inst.cmdr.error(status);
        }
        var srcDir = inst.pathArg;
        if (srcDir == null) {
            srcDir = '.';
        }
        else if (!java.io.File(srcDir).exists()) {
            status = "Directory " + java.io.File(srcDir).getCanonicalPath()
                + NOT_FOUND_STR;
            inst.cmdr.error(status);
        }

        /* check if writable */
        if (!inst.forceFlag && !isRepositoryWritable(destDir)) {
            status = "Repository " + java.io.File(destDir).getCanonicalPath()
                     + " is not writable";
            inst.cmdr.error(status);
        }

        /* repo.xml and providerId stuff */
        var repoXmlExists = java.io.File(destDir + '/' + REPOXML_FILE).exists();
        var create = false;
        if (inst.provIdArg != null) {
            if (repoXmlExists) {
                setRepoProviderId(destDir, inst.provIdArg);
            }
            else {
                create = true;
            }
        }
        else if (!repoXmlExists) {
            create = true;
        }
        if (create) {
            status = createRepoXmlFile(destDir, 
                                       {providerId : inst.provIdArg,
                                        writable   : 'true'});
            if (status.length) {
                inst.cmdr.error(status);
            }
        }

        var origRepoXMLInf = getRepoXmlItems(srcDir);

        /* check if any args have wildcards */
        var hasWildcards = false;
        for each (var p in inst.args) {
            if (_containsWildcards(p)) {
                hasWildcards = true;
                break;
            }
        }

        /* if wildcards, must test all packages in repository */
        if (hasWildcards) {

            var pkgArr = [];
            try {
            /* get an array of the packages in srcDir */
                var pkgArr = _getPackageNames(srcDir);
            }
            catch (e) {
                status = e.message;
            }

            /* look for matches in the args list */
            var pkgCopied = false;
            for each (var p in pkgArr) {
                for each (var a in inst.args) {
                    if (_containsWildcards(a)) {
                        if (_wildMatch(a, p)) {
                            status = _copyPackage(inst, srcDir, destDir, p);
                            if (status.length) {
                                break;
                            }
                            status = _setPkgOriginalProviderId(destDir, p,
                                                               origRepoXMLInf);
                            if (status.length) {
                                break;
                            }
                            if (!pkgCopied) {
                                pkgCopied = true;
                            }
                        }
                    }
                    else if (("" + a) == ("" + p)) {
                        status = _copyPackage(inst, srcDir, destDir, p);
                        if (status.length) {
                            break;
                        }
                        status = _setPkgOriginalProviderId(destDir, p,
                                                           origRepoXMLInf);
                        if (status.length) {
                            break;
                        }
                        if (!pkgCopied) {
                            pkgCopied = true;
                        }
                    }
                }
                if (status.length) {
                    break;
                }
            }
            if (!status.length && !pkgCopied) {
                status = 'No packages copied';
            }
        }
        else { /* otherwise, just copy the packages in the args list */
            for each (var p in inst.args) {
                status = _copyPackage(inst, srcDir, destDir, p);
                if (status.length) {
                    break;
                }
                status = _setPkgOriginalProviderId(destDir, p, origRepoXMLInf);
                if (status.length) {
                    break;
                }
            }
        }
        if (status.length) {
            inst.cmdr.error(status);
        }
        return (status);
    }
    else if (inst.rsaveFlag) {
        var status = _saveRepositoryInfo(inst, inst.fileArg, inst.pathArg,
                                         inst.args);
        if (status.length) {
            inst.cmdr.error(status);
        }
        return (status);
    }
    else if (inst.rrestoreFlag || inst.rcreateFlag) {
        var destRepos = [];
        var repoIds = [];
        var status = "";
        var searchPath;
        var doc;
        if (!java.io.File(inst.fileArg).exists()) {
            status = java.io.File(inst.fileArg).getCanonicalPath() +
                     NOT_FOUND_STR;
            inst.cmdr.error(status);
        }

        inst.cmdr.info("reading " + " repository info from " + 
                       java.io.File(inst.fileArg).getCanonicalPath());

        try {
            doc = xdc.loadXML(inst.fileArg);
        }
        catch (e) {
            inst.cmdr.error(e.message);
        }

        var reposList = _readRepoInfo(inst, doc);
        if (java.lang.String(reposList).startsWith(ERROR_FLAG_STR)) {
            inst.cmdr.error(("" + reposList).substr(ERROR_FLAG_STR.length));
        }
        if (reposList.length == 0) {
            status = "No packages to restore";
            return (status);
        }

        if (inst.pathArg) {
            searchPath = inst.pathArg;
        }
        else {
            searchPath = doc.searchPath;
            if (searchPath == "") {
                status = "no search path found in " + inst.fileArg +
                         ", it must be specified using -p";
                inst.cmdr.error(status);
            }
        }
        if (inst.rrestoreFlag) {
            if (inst.args.length > 0 && inst.args[0] != null) {
                repoIds = _parseRepoIds(inst.args[0]);
                if (repoIds.length == 0) {
                    status = "Invalid repository ids: " + inst.args[0];
                    inst.cmdr.error(status);
                }
                reposList = _mapRepoIds(reposList, repoIds);
                if (java.lang.String(reposList).startsWith("error:")) {
                    inst.cmdr.error(("" + reposList).substr(ERROR_FLAG_STR.length));
                }
            }
        }
        else {
            repoIds = _parseRepoIds(inst.args[0]);
            if (repoIds.length > 0) {
                if (repoIds.length != inst.args.length - 1) {
                    inst.cmdr.error(REPO_INDEX_MISMATCH_STR);
                }
                reposList = _mapRepoIds(reposList, repoIds);
                if (java.lang.String(reposList).startsWith("error:")) {
                    inst.cmdr.error(("" + reposList).substr(ERROR_FLAG_STR.length));
                }
                for (var i = 1; i < inst.args.length; i++) {
                    destRepos.push(inst.args[i]);
                }
            }
            else {
                var testArr = reposList.split('\n');
                if (testArr.length != inst.args.length) {
                    inst.cmdr.error(DEST_REPO_MISMATCH_STR);
                }
                for (var i = 0; i < inst.args.length; i++) {
                    destRepos.push(inst.args[i]);
                }
            }

            for each (var dir in destRepos) {
                var f = java.io.File(dir);
                if (f.exists() && f.isDirectory() &&
                    f.list().length > 0) {

                    status = f.getCanonicalPath() +
                             " is not empty. Cannot create repository";
                    inst.cmdr.error(status);
                }
            }
        }
        var reposArr = reposList.split('\n');
        for each (var i = 0; i < reposArr.length; i++) {
            var pkgArr = reposArr[i].split(';');
            var srcRepo = pkgArr.shift();
            var cp = java.io.File(srcRepo).getCanonicalPath();
            var destRepo = (inst.rrestoreFlag) ? srcRepo : destRepos[i];

            /* verify first */
            var curStatus = _restoreRepository(inst, destRepo, pkgArr,
                                                searchPath, true);
            if (curStatus.length == 0) {
                /* this is the actual restore operation */
                curStatus = _restoreRepository(inst, destRepo, pkgArr,
                                               searchPath, false);
            }
            if (curStatus.length > 0) {
                if (java.lang.String(curStatus).startsWith(ERROR_FLAG_STR)) {
                    inst.cmdr.error(("" + curStatus).substr(ERROR_FLAG_STR.length));
                }
                else {
                    status +=  PKGS_NOT_FOUND_STR + srcRepo + ";" +
                              curStatus + "\n";
                }
            }
        }
        if (status.length) {
            inst.cmdr.error(status);
        }
        return (status);
    }
    else if (inst.provIdArg != null) {
        var status = "";
        var repos = [];
        if (inst.args.length == 0) {
            repos.push(_getCurrentRepository());
        }

        /* first, see if all repos exist */
        for (var i = 0; i < inst.args.length; i++) {
            if (java.io.File(inst.args[i]).exists()) {
                repos.push(inst.args[i]);
            }
            else {
                var str = "Repository " + java.io.File(inst.args[i]).getCanonicalPath()
                          + NOT_FOUND_STR;
                if (status.length) {
                    status += '\n';
                }
                status += str;
            }
        }

        /* next, see if they are writable */
        for each (var repoDir in repos) {
            if (!inst.forceFlag && !isRepositoryWritable(repoDir)) {
                var str = "Repository " + java.io.File(repoDir).getCanonicalPath()
                          + " is not writable";
                if (status.length) {
                    status += '\n';
                }
                status += str;
            }
        }

        if (status.length) {
            inst.cmdr.error(status);
        }

        /* if no errors, do the operation */
        for each (var repoDir in repos) {
            if (java.io.File(repoDir + '/' + REPOXML_FILE).exists()) {
                status = setRepoProviderId(repoDir, inst.provIdArg);
            }
            else {
                status = createRepoXmlFile(repoDir, 
                                           {providerId : inst.provIdArg,
                                            writable   : 'true'});
            }
            if (status.length) {
                inst.cmdr.error(status);
            }
        }
        return (status);
    }
    return ('');
}

/*
 *  ======== _isABundleArchive ========
 */
function _isABundleArchive(inst, pkg)
{
    var retval = false;

    if (_isAnArchive(pkg[FILE_INDEX])) {
        var tmpdir = Packages.xdc.services.global.Host.tmpdir();
        var tmpdirFile = java.io.File(tmpdir);
        var pkgBldXmlFile = _getPackageBldXml(inst, pkg, tmpdir);
        if (pkgBldXmlFile != null) {
            retval = _hasRepository(tmpdir + '/' + pkgBldXmlFile);
        }
        _deleteDirectoryContents(inst, tmpdirFile);
        tmpdirFile['delete']();
    }
    return (retval);
}

/*
 *  ======== _hasRepository ========
 */
function _hasRepository(pkgBldXmlFile)
{
    var retval = false;

    var props = ["name"];
    var doc = Packages.xdc.services.global.XML.parse(pkgBldXmlFile);
    var reps = Packages.xdc.services.global.XML.getHMaps(doc, "repositories",
                                                         props);
    
    for (var i = 0; i < reps.length; i++) {
        var name = reps[i].get("name");
        if (name != null && name.length() > 0) {
            retval = true;
            break;
        }
    }
    return (retval);
}


/*
 *  ======== _isAnArchive ========
 */
function _isAnArchive(str)
{
    var fileStr = java.lang.String(str);
    return (fileStr.endsWith(".tar") || fileStr.endsWith(".tar.gz") ||
            fileStr.endsWith(".zip"));
}

/*
 *  ======== _pkgArrElemStr ========
 *
 */
function _pkgArrElemStr(allInfo, pkgStr)
{
    var str;
    if (allInfo) {
        var pkg = pkgStr.split(';');
        str = pkg[PACKAGE_INDEX] + ';';
        str += pkg[REPO_INDEX] + ';';
        str += pkg[RELEASE_NAME_INDEX] + ';';
        str += pkg[LABEL_INDEX] + ';';
        str += pkg[VERSION_INDEX] + ';';
        str += Date.mkDate(pkg[DATE_INDEX]) + ';';
        str += ORIG_PROVIDER_STR + pkg[ORIG_PROVIDER_INDEX] + ';';
        str += PRODUCER_ID_STR + pkg[PRODUCER_INDEX] + ';';
        str += ';;;;';
    }
    else {
        str = pkgStr;
    }

    return (str);
}

/*
 *  ======== _pkgStr ========
 *
 */
function _pkgStr(allInfo, pkgStr)
{
    var str;
    if (allInfo) {
        var pkg = pkgStr.split(';');
        str = PACKAGE_STR + pkg[PACKAGE_INDEX] + '\n';
        str += REPO_STR + pkg[REPO_INDEX] + '\n';
        str += RELEASE_NAME_STR + pkg[RELEASE_NAME_INDEX] + '\n';
        str += RELEASE_STR + pkg[LABEL_INDEX] + '\n';
        str += VERSION_STR + pkg[VERSION_INDEX] + '\n';
        str += DATE_STR + Date.mkDate(pkg[DATE_INDEX]) + '\n';
        str += ORIG_PROVIDER_STR + pkg[ORIG_PROVIDER_INDEX] + '\n';
        str += PRODUCER_ID_STR + pkg[PRODUCER_INDEX] + '\n';
    }
    else {
        str = pkgStr;
    }

    return (str);
}

/*
 *  ======== _pkgXmlStruct ========
 *
 */
function _pkgXmlStruct(inst, pkgStr)
{
    if (inst.infoFlag) {
        var pkg = pkgStr.split(';');
        var pkgXml = new inst.self.$module.Pkg;
        pkgXml.name = pkg[PACKAGE_INDEX];
        pkgXml.file = pkg[REPO_INDEX];
        pkgXml.release = pkg[RELEASE_NAME_INDEX];
        pkgXml.label = pkg[LABEL_INDEX];
        pkgXml.version = pkg[VERSION_INDEX];
        pkgXml.date = Date.mkDate(pkg[DATE_INDEX]);
        pkgXml.originalProviderId = pkg[ORIG_PROVIDER_INDEX];
        pkgXml.producerId = pkg[PRODUCER_INDEX];
        pkgXml.buildable = "na";

        pkgXml.reqs = [];
        pkgXml.refs = [];
        pkgXml.repository = [];

        return (pkgXml);
    }

    return (pkgStr);
}

/*
 *  ======== _archiveArrElemStr ========
 *
 */
function _archiveArrElemStr(info, ar)
{
    var str;
    var desc = ar.getDesc();
    if (info) {
        str = desc.pkgName + ';';
        str += desc.tarName + ';';
        str += desc.relName + ';';
        str += desc.relLabel + ';';
        str += desc.version + ';';
        str += Date.mkDate(desc.mdate) + ';';
        str += desc.buildable + ';';
        str += ORIG_PROVIDER_STR + ';';
        str += PRODUCER_ID_STR + desc.producerId + ';';


        for (var i = 0; i < desc.reqs.length; i++) {
            var ref = desc.reqs[i];
            str += ref.pkgName + "[" + ref.version +"]|";
        }
        str += ';';
        for (var i = 0; i < desc.refs.length; i++) {
            var ref = desc.refs[i];
            str += ref.pkgName + "[" + ref.version + "]|";
        }
    }
    else {
        str = desc.pkgName;
    }
    str += ';';
    for (var i = 0; i < desc.reposDesc.length; i++) {
        var repo = desc.reposDesc[i];
        str += repo.repoName;
        for (var j = 0; j < repo.pkgs.length; j++) {
            str += "[" + repo.pkgs[j] + "]";
        }
        str += "|";
    }
    str += ';';


    return (str);
}

/*
 *  ======== _archiveStr ========
 *
 */
function _archiveStr(inst, ar)
{
    inst.cmdr.info('building a string...');

    var rindent;
    var pindent;
    var str;
    var desc = ar.getDesc();
    if (inst.infoFlag) {
        str = PACKAGE_STR + desc.pkgName + '\n';
        str += FILE_STR + desc.tarName + '\n';
        str += RELEASE_NAME_STR + desc.relName + '\n';
        str += RELEASE_STR + desc.relLabel + '\n';
        str += VERSION_STR + desc.version + '\n';
        str += DATE_STR + Date.mkDate(desc.mdate) + '\n';
        str += BUILDABLE_STR + desc.buildable + '\n';
        str += ORIG_PROVIDER_STR + 'na\n';
        str += PRODUCER_ID_STR + desc.producerId  + '\n';

        str += REQUIRES_STR;
        for (var i = 0; i < desc.reqs.length; i++) {
            var ref = desc.reqs[i];
            str += (i > 0 ? "              " : "") + ref.pkgName + "[" +
                    ref.version + "]\n";
        }
        if (!i) {
            str += '\n';
        }

        str += REFS_STR;
        for (i = 0; i < desc.refs.length; i++) {
            var ref = desc.refs[i];
            str += (i > 0 ? "              " : "") + ref.pkgName + "[" +
                   ref.version + "]\n";
        }
        if (!i) {
            str += '\n';
        }
        if (desc.reposDesc.length > 0) {
            str += REPOS_STR;
            rindent = "              ";
            pindent = rindent + "    ";
        }
    }
    else {
        str = desc.pkgName;
        if (desc.reposDesc.length > 0) {
            rindent = "  ";
            pindent = "    ";
            str += '\n' + rindent;
        }
    }
    if (desc.reposDesc.length > 0) {
        for (var i = 0; i < desc.reposDesc.length; i++) {
            var repo = desc.reposDesc[i];
            str += (i > 0 ? rindent : "") + repo.repoName + "/\n";
            for (var j = 0; j < repo.pkgs.length; j++) {
                str += pindent + repo.pkgs[j] + "\n";
            }
        }
    }

    return (str);
}

/*
 *  ======== _archiveXmlStruct ========
 *
 */
function _archiveXmlStruct(inst, ar)
{
    inst.cmdr.info('building an XML document...');

    var desc = ar.getDesc();
    if (inst.infoFlag) {
        var pkgXml = new inst.self.$module.Pkg;
        pkgXml.name = desc.pkgName;
        pkgXml.file = desc.tarName;
        pkgXml.release = desc.relName;
        pkgXml.label = desc.relLabel;
        pkgXml.version = desc.version;
        pkgXml.date = Date.mkDate(desc.mdate);
        pkgXml.buildable = desc.buildable ? "true" : "false";
        pkgXml.originalProviderId = "na";
        pkgXml.producerId = desc.producerId;

        var arr = [];
        for (var i = 0; i < desc.reqs.length; i++) {
            var ref = desc.reqs[i];
            arr.push(ref.pkgName + "[" + ref.version +"]");
        }
        pkgXml.reqs = arr;

        arr = [];
        for (i = 0; i < desc.refs.length; i++) {
            var ref = desc.refs[i];
            arr.push(ref.pkgName + "[" + ref.version + "]");
        }
        pkgXml.refs = arr;

        arr = [];
        for (i = 0; i < desc.reposDesc.length; i++) {
            var repoXml = new inst.self.$module.Repo;
            repoXml.name = desc.reposDesc[i].repoName;
            var pkgArr = [];
            for (var j = 0; j < desc.reposDesc[i].pkgs.length; j++) {
                pkgArr.push(desc.reposDesc[i].pkgs[j]);
            }
            repoXml.pkg = pkgArr;
            arr.push(repoXml);
        }
        pkgXml.repository = arr;

        return (pkgXml);
    }
    else {
        var nameXml = new inst.self.$module.PkgName;
        nameXml.name = desc.pkgName;
        var arr = [];
        for (var i = 0; i < desc.reposDesc.length; i++) {
            var repoXml = new inst.self.$module.Repo;
            repoXml.name = desc.reposDesc[i].repoName;
            var pkgArr = [];
            for (var j = 0; j < desc.reposDesc[i].pkgs.length; j++) {
                pkgArr.push(desc.reposDesc[i].pkgs[j]);
            }
            repoXml.pkg = pkgArr;
            arr.push(repoXml);
        }
        nameXml.repository = arr;
        return (nameXml);

    }

    return (desc.pkgName);
}

/*
 *  ======== _buildArchiveArray ========
 *
 */
function _buildArchiveArray(inst, srcDir)
{
    var archiveArray = [];

    var dirFile = java.io.File(srcDir);
    var ar = Packages.xdc.tools.repoman.Archive();

    var fnArr = dirFile.list();
    java.util.Arrays.sort(fnArr);
    for each (var fn in fnArr) {

        var f = java.io.File(dirFile, fn);
        if (f.isFile() && _isAnArchive(f.getName())) {

            var path = f.getCanonicalPath();

            var scanRet = ar.scan(path);
            if (scanRet == null) {
                archiveArray.push(ar.getDesc());
            }
            else {
                inst.cmdr.warning("Failed to retrieve package info for\n"
                                  + path + ":\n" + scanRet);
            }
        }
    }
    return (archiveArray);
}

/*
 *  ======== _closeInputStreams ========
 *
 */
function _closeInputStreams(streams)
{
    if (streams.inputStream) {
        streams.inputStream.close();
    }
    if (streams.gzis) {
        streams.gzis.close();
    }
    if (streams.fis) {
        streams.fis.close();
    }
}

/*
 *  ======== _containsWildcards ========
 *
 */
function _containsWildcards(str)
{
    return (("" + str).indexOf('*') != -1 || ("" + str).indexOf('?') != -1);
}

/*
 *  ======== _deletePkgIfItExists ========
 *
 */
function _deletePkgIfItExists(inst, pkgName, destDir)
{
    pkgName = "" + pkgName;
    var pkgDir = destDir + '/' + pkgName.replace(/\./g, '/');
    if (java.io.File(pkgDir + '/' + PACKAGE_XDC_FILE_STR).exists()) {
        _deletePackage(inst, destDir, pkgName);
    }
}

/*
 *  ======== _deleteDirectoryContents ========
 */
function _deleteDirectoryContents(inst, dirFile)
{
    if (inst) {
        inst.cmdr.info("deleting contents of directory " + dirFile);
    }
    for each (var f in dirFile.listFiles()) {
        if (f.isDirectory() && f.listFiles().length) {
            _deleteDirectoryContents(inst, f);
        }
        try {
            f['delete']();
        }
        catch (e) {
            inst.cmdr.warning(CANNOT_DELETE_FILE_STR +
                                         f.getCanonicalPath());
        }
    }
}

/*
 *  ======== _deletePackage ========
 */
function _deletePackage(inst, dir, pkgName)
{
    inst.cmdr.info("deleting " + pkgName + " from " + 
                    java.io.File(dir).getCanonicalPath());

    var status = '';
    var pkgDir = dir + '/' + pkgName.replace(/\./g, '/');
    var pkgXdcFile = pkgDir + '/' + PACKAGE_XDC_FILE_STR;
    pkgXdcFile = pkgXdcFile.replace(/\"/g, ''); /* in case dir has spaces */

    if (java.io.File(pkgXdcFile).exists()) {    /* found package directory */

        /* first check if it is a bundle and delete the repositories */
        if (_packageIsABundle(inst, dir, pkgName)) {

            /* create the package.bld.xml file name */
            pkgDir = String(dir).replace(/\\/g, '/') + '/' +
                     String(pkgName).replace(/\./g, '/');
            var pkgBldXmlFile = pkgDir + "/package/" +
                                PACKAGE_BLD_XML_FILE_STR;
            /* if dir has spaces */
            pkgBldXmlFile = pkgBldXmlFile.replace(/\"/g, '');

            var repoList = _getBundleRepositoryNames(pkgBldXmlFile);
            for each (var r in repoList) {
                var repoDirFile = java.io.File(pkgDir + '/' + r);
                if (repoDirFile.exists() && repoDirFile.isDirectory()) {
                    _deleteDirectoryContents(inst, repoDirFile);
                    try {
                        repoDirFile['delete']();
                    }
                    catch (e) {
                        return(CANNOT_DELETE_PKG_STR + ' ' + pkgName + ': ' +
                               e.message);
                    }
                }
            }
        }
 
        var pkgDirFile = java.io.File(pkgDir);
        var files = pkgDirFile.listFiles();
        var foundSubPackage = false;

        /* delete all non-directory files and */
        /* subdirectories that don't have any packages */
        for each (var f in files) {
            if (!f.isDirectory()) {
                try {
                    f['delete']();
                }
                catch (e) {
                    return(
                           f.getCanonicalPath());
                }
            }
            else if (!_hasPackage(f)) {
                _deleteDirectoryContents(inst, f);
                try {
                    f['delete']();
                }
                catch (e) {
                    return(CANNOT_DELETE_PKG_STR + ' ' + pkgName + ': ' +
                           e.message);
                }
            }
            else if (!foundSubPackage) {
                foundSubPackage = true;
            }
        }
        if (!foundSubPackage) {

            var dirFile = java.io.File(dir);
            var pkgParentFile = pkgDirFile.getParentFile();

            // go up the levels
            try {
                pkgDirFile['delete']();
            }
            catch (e) {
                return(CANNOT_DELETE_PKG_STR + ' ' + pkgName + ': ' +
                       e.message);
            }
            do {
                files = pkgParentFile.listFiles();
                if (!files.length) {
                    var tmpFile = pkgParentFile.getParentFile();
                    try {
                        pkgParentFile['delete']();
                    }
                    catch (e) {
                        return(CANNOT_DELETE_PKG_STR + ' ' + pkgName + ': ' +
                               e.message);
                    }
                    pkgParentFile = tmpFile;
                }
                else {
                    break;
                }
            } while (!pkgParentFile.equals(dirFile));

        }
    }
    else {
        status = pkgName + " not found in repository " +
                 java.io.File(dir).getCanonicalPath();
    }
    return (status);
}

/*
 *  ======== _extractPackageDependencies ========
 *
 */
function _extractPackageDependencies(inst, arArr, pkgDeps, destDir)
{
    inst.cmdr.info("extracting package dependencies...");

    var status = '';
    var found;
    for each (var req in pkgDeps) {
        found = false;
        for each (var desc in arArr) {
            if (req.pkgName == desc.pkgName) {
                if (req.version == "") {

                    /* found dependency! */
                    _deletePkgIfItExists(inst, desc.pkgName, destDir);
                    var tarName = ("" + desc.tarName).replace(/\"/g, '');
                    inst.cmdr.info("extracting " + desc.pkgName + " from "
                                   + tarName);
                    extractArchiveContents(inst, tarName, destDir);
                    found = true;
                    break;
                }
                else {
                    /* trim build count from desc.version */
                    var version = desc.version;
                    if (req.version == version.substr(0,
                                       version.lastIndexOf(','))) {

                        /* found dependency! */
                        _deletePkgIfItExists(inst, desc.pkgName, destDir);
                        var tarName = ("" + desc.tarName).replace(/\"/g, '');
                        inst.cmdr.info("extracting " + desc.pkgName +
                                       " from " + tarName);
                        extractArchiveContents(inst, tarName, destDir);
                        found = true;
                        break;
                    }
                }
            }
        }
        if (!found) {
            if (status.length) {
                status += '\n';
            }
            status += "Dependency " + req.pkgName + "[" + req.version + "]" +
                      NOT_FOUND_STR;
        }
    }
    return (status);
}

/*
 *  ======== _extractPackages ========
 *
 */
function _extractPackages(inst, destDir, check)
{
    inst.cmdr.info("extracting package(s)...");
    
    var status = '';

    var srcDir = inst.pathArg;

    if (srcDir == null) {
        srcDir = '.';
    }
    else if (!java.io.File(srcDir).exists()) {
        status = ("Directory " +
                    java.io.File(srcDir).getCanonicalPath() +
                    NOT_FOUND_STR);
        return (status);
    }
    var foundArr = []; /* associative array used to resolve collisions */
    var descArr = [];
    var arArr = [];
    var pkgDeps = [];   /* array of package dependencies */
    var pkgArr = [];
    if (inst.args.length > 0) {
        for each (var p in inst.args) {
            pkgArr.push(p);
        }
    }
    if (pkgArr.length == 0 ||
        _packageArgsType(srcDir, inst.args) == PACKAGE_NAMES) {

        var found;
        var notFoundArr = []; /* keep track of packages not found */
        arArr = _buildArchiveArray(inst, srcDir);

        if (pkgArr.length > 0) {
            for each (var p in pkgArr) {
                if (p.length == 0) {
                    continue;
                }
                found = false;
                if (_versionIsSpecified(p)) {
                    for each (var desc in arArr) {
                        if (_nameAndVersMatches(p, desc)) {
                            if (foundArr[desc.pkgName] == undefined) {
                                foundArr[desc.pkgName] = desc;
                                found = true;
                            }
                            else if (desc.mdate >
                                    foundArr[desc.pkgName].mdate) {
                                foundArr[desc.pkgName] = desc;
                                found = true;
                            }
                        }
                    }
                }
                else {
                    for each (var desc in arArr) {
                        if (_nameMatches(p, desc.pkgName)) {
                            if (foundArr[desc.pkgName] == undefined) {
                                foundArr[desc.pkgName] = desc;
                                found = true;
                            }
                            else if (desc.mdate > 
                                     foundArr[desc.pkgName].mdate) {
                                foundArr[desc.pkgName] = desc;
                                found = true;
                            }
                        }
                    }
                }
                if (!found) {
                    notFoundArr.push(p);
                }
            }
        }
        else {  /* all archives */
            for each (var desc in arArr) {
                if (foundArr[desc.pkgName] == undefined) {
                    foundArr[desc.pkgName] = desc;
                }
                else if (desc.mdate > foundArr[desc.pkgName].mdate) {
                    foundArr[desc.pkgName] = desc;
                }
            }
        }
        if (notFoundArr.length) {
            status = "No packages extracted. Could not find: " 
                     + notFoundArr;
            return (status);
        }

        /* put foundArr items into a regular array  */
        for each (var desc in foundArr) {
            descArr.push(desc);
        }

    }
    else {  /* package args are tar files */
        var tarFile;
        var tarName;
        var ar;
        var scanRet;

        /* resolve all files in args list */
        var pkgFilesObj = _resolvePkgFileArgs(inst, srcDir, pkgArr);
        if (pkgFilesObj.status.length) {
            return (pkgFilesObj.status);
        }
        var pkgFiles = pkgFilesObj.pkgFiles;

        /* scan each archive and save desc in array */
        for each (var p in pkgFiles) {
            if (isURL(p)) {
                tarName = p;
            }
            else {
                tarFile = java.io.File(p).isAbsolute() ?
                          java.io.File(p) : java.io.File(srcDir, p);
                tarName = tarFile.getCanonicalPath();
                if (!tarFile.exists()) {
                    status = "Cannot find " + tarName;
                    return (status);
                }
            }
            ar = Packages.xdc.tools.repoman.Archive();
            scanRet = ar.scan(tarName);
            if (scanRet == null) {
                if (foundArr[ar.getDesc().pkgName] == undefined) {
                    foundArr[ar.getDesc().pkgName] = ar.getDesc();
                }
                else if (ar.getDesc().mdate > 
                         foundArr[ar.getDesc().pkgName].mdate) {

                    foundArr[ar.getDesc().pkgName] = ar.getDesc();
                }
            }
            else {
                status = "Failed to retrieve package properties for\n" +
                         tarName + ":\n" + scanRet;
                return (status);
            }
        }

        /* put foundArr items into a regular array  */
        for each (var desc in foundArr) {
            descArr.push(desc);
        }
        if (inst.dependentFlag || inst.recursiveDepFlag) {

            var scanned = [];
            var tmpArr = [];
            var parent;
            /* build an arArr of all archives in all parent */
            /* directories for dependency search            */
            for each (var desc in descArr) {
                if (desc.reqs.length) {
                    parent = java.io.File(tarName).getParent();
                    if (scanned[parent] == undefined) {
                        tmpArr = _buildArchiveArray(inst, parent);
                        for each (var a in tmpArr) {
                            arArr.push(a);
                        }
                        scanned[parent] = true;
                    }
                }
            }
        }
    }

    if (check) {
        var list = [];
        for each (var desc in descArr) {
            var tarName = ("" + desc.tarName).replace(/\"/g, '');
            list.push(tarName);
        }
        var results = _preExtractCheckCompatibility(inst, list, destDir);

        if (results.length > 0) {
            status = results.join("\n");
            return (status);
        }
    }

    for each (var desc in descArr) {
        _deletePkgIfItExists(inst, desc.pkgName, destDir);
        var tarName = ("" + desc.tarName).replace(/\"/g, '');
        inst.cmdr.info("extracting " + desc.pkgName + " from " + tarName);

        try {
            extractArchiveContents(inst, tarName, destDir);
        }
        catch (e) {
            status = 'Error extracting ' + desc.pkgName + ' from ' + tarName +
                     ': ' + e.message;
            return (status);
        }

        if (inst.dependentFlag || inst.recursiveDepFlag) {
            /* save dependencies for untar later */
            for (var i =0; i < desc.reqs.length; i++) {

                var ref = desc.reqs[i];
                pkgDeps.push(new _packageReq(ref.pkgName, ref.version));
                if (inst.recursiveDepFlag) {
                    _findDependencies(ref.pkgName, ref.version, arArr,
                                      pkgDeps);
                }
            }
        }
    }
    if (pkgDeps.length > 0) {
        var depStatus = '';
        try {
            depStatus = _extractPackageDependencies(inst, arArr, pkgDeps, destDir);
        }
        catch (e) {
            depStatus = 'Error extracting package dependencies: ' + e.message;
        }
        if (depStatus.length) {
            inst.cmdr.warning(depStatus);
        }
    }
    return (status);
}

/*
 *  ======== _extractRepositoryFromBundle ========
 *
 */
function _extractRepositoryFromBundle(inst)
{
    var destDir = inst.repositoryArg;
    if (destDir == null) {
        destDir = '.';
    }
    else if (!java.io.File(destDir).exists()) {
        return("Destination repository " +
               java.io.File(destDir).getCanonicalPath() +
               NOT_FOUND_STR);
    }

    var srcDir = inst.pathArg;
    if (srcDir == null) {
        srcDir = '.';
    }
    else if (!java.io.File(srcDir).exists()) {
        return ("Directory " +
                java.io.File(srcDir).getCanonicalPath() +
                NOT_FOUND_STR);
    }

    var bundleFile = inst.args[0];

    if (isURL(bundleFile)) {
        if (!isValidURL(bundleFile)) {
            return ("Bundle " + bundleFile + NOT_RESOLVED_STR);
        }
    }
    else {
        if (!java.io.File(bundleFile).isAbsolute()) {
            bundleFile =
                java.io.File(srcDir, bundleFile).getCanonicalPath();
        }
        if (!java.io.File(bundleFile).exists()) {
            return ("Bundle file " +
                    java.io.File(bundleFile).getCanonicalPath() +
                    NOT_FOUND_STR);
        }
    }

    var status = '';
    try {
        status = _extractRepository(inst, srcDir, inst.args[0],
                                    inst.bundleRepositoryArg, destDir);
    }
    catch (e) {
        status = 'Error extracting ' + inst.bundleRepositoryArg +
                 ' from ' + inst.args[0] + ': ' + e.message;
    }

    return (status);
}

/*
 *  ======== _extractRepository ========
 *
 */
function _extractRepository(inst, srcDir, bundleFile, repoName, destDir)
{
    var status = '';
    if (!isURL(bundleFile)) {
        if (!java.io.File(bundleFile).isAbsolute()) {
            bundleFile = java.io.File(srcDir, bundleFile).getCanonicalPath();
        }
    }

    var fileType = _getFileType(bundleFile);
    if (fileType != TAR_FILETYPE && fileType != TARGZ_FILETYPE &&
        fileType != ZIP_FILETYPE) {

        return ("Invalid bundle file: " + 
                java.io.File(bundleFile).getCanonicalPath());
    }

    if (repoName == null) {
        repoName = "packages";
    }

    var repoEntry = _getBundleRepositoryEntry(bundleFile, fileType, repoName);
    if (repoEntry != null) {
        var repoPath =  String(repoEntry.getName().replace('\\', '/'));
        inst.cmdr.info("extracting repository " + repoName + " from " +
                       bundleFile);

        var entry;
        var name;
        var ar = Packages.xdc.tools.repoman.Archive();
        var streams = _getInputStreams(bundleFile, fileType);
        var inputStream = streams.inputStream;

        while ((entry = inputStream.getNextEntry()) != null) {
            if (entry.isDirectory()) {
                continue;
            }
            name = entry.getName();

            if (java.lang.String(name).startsWith(repoEntry.getName())) {
                name = String(name).substr(repoPath.length); /* strip prefix */
                var destFile = java.io.File(destDir, name);
                destFile.getParentFile().mkdirs();
                var fout = java.io.FileOutputStream(destFile); 
                if (fileType != ZIP_FILETYPE) {
                    inputStream.copyEntryContents(fout);
                }
                else {
                    ar.copyEntryContents(inputStream, fout);
                }
                fout.close();
            }
        }
        _closeInputStreams(streams);
    }
    else {
        status = "Repository " + repoName + "/ not found in " +
                  bundleFile;
    }
    return (status);
}

/*
 *  ======== _findDependencies ========
 *
 *  recursive dependency search
 *  saves name and version of all required packages
 *
 */
function _findDependencies(pkgName, version, arArr, pkgDeps)
{
    var found;
    for each (var desc in arArr) {
        found = false;
        if (desc.pkgName == ("" + pkgName) && 
            _versionMatches(desc.version, version)) {

            found = true;
        }
        if (found) {
            /* save dependencies for untar later */
            for (var i = 0; i < desc.reqs.length; i++) {
                var ref = desc.reqs[i];
                pkgDeps.push(new _packageReq(ref.pkgName, ref.version));
                _findDependencies(ref.pkgName, ref.version);
            }
        }
    }
}

/*
 *  ======== _getBundleRepositoryNames ========
 */
function _getBundleRepositoryNames(pkgBldXmlFile)
{
    var list = [];    

    var props = ["name"];
    var doc = Packages.xdc.services.global.XML.parse(pkgBldXmlFile);
    var reps = Packages.xdc.services.global.XML.getHMaps(doc, "repositories",
                                                         props);
    
    for (var i = 0; i < reps.length; i++) {
        var name = reps[i].get("name");
        if (name != null && name.length() > 0) {
            list.push(name);
        }
    }
    return (list);
}

/*
 *  ======== _getBundleRepositoryEntry ========
 *
 */
function _getBundleRepositoryEntry(bundleFile, fileType, repoName)
{
    var entry;
    var streams = _getInputStreams(bundleFile, fileType);
    var inputStream = streams.inputStream;
    var repoEntry = null;
    var entries = [];
    var name;
    var entryName;

    repoName = repoName.replace(/\\/g, '/');
    repoName = repoName.replace(/\/+$/, '');
    while ((entry = inputStream.getNextEntry()) != null) {
        if (entry.isDirectory()) {
            entryName = String(entry.getName()).replace(/\\/g, '/');
            entryName = entryName.replace(/\/+$/, '');
            if (entryName.length >= repoName.length) {
                if (repoName == entryName.substr(0 - repoName.length)) {
                    entries.push({name : entryName, entry : entry});
                }
            }
        }
    }
    _closeInputStreams(streams);
    if (entries.length > 0) {
        if (entries.length == 1) {
            repoEntry = entries[0].entry;
        }
        else {       /* get the shortest named entry, to eliminate    */
                     /* repos containing leading directory separators */
            var min = 0;
            for (var i = 1; i < entries.length; i++) {
                if (entries[i].name.length < entries[min].name.length) {
                    min = i;
                }
            }
            repoEntry = entries[min].entry;
        }
    }
    return (repoEntry);
}

/*
 *  ======== _getCurrentRepository ========
 *
 */
function _getCurrentRepository()
{
    var curRep = "" + Packages.xdc.services.global.Path.getCurPkgRoot();
    if (curRep == "") {
        return (".");
    }
    else {
        return (curRep.replace(/\\/g, '/'));
    }
}

/*
 *  ======== _getFileType ========
 */
function _getFileType(fileName)
{
    var fileType = UNKNOWN_FILETYPE;

    var file = java.io.File(fileName);

    if (file.getName().endsWith(".tar")) {
        fileType = TAR_FILETYPE;
    }
    else if (file.getName().endsWith(".tar.gz")) {
        fileType = TARGZ_FILETYPE;
    }
    else if (file.getName().endsWith(".zip")) {
        fileType = ZIP_FILETYPE;
    }
    else if (file.isDirectory()) {
        for each (var fn in file.list()) {
            var f = java.io.File(file, fn);
            if (f.isFile() && _isAnArchive(f.getName())) {

                fileType = ARCHIVE_DIRECTORY_FILETYPE;
                break;
            }
        }
        if (fileType == UNKNOWN_FILETYPE) {
            fileType = REPOSITORY_FILETYPE;
            /** TODO: do a better check for repository */
        }
    }
    return (fileType);
}

/*
 *  ======== _getHashLength ========
 *
 */
function _getHashLength(hash)
{
    var len = 0;
    for each (var v in hash) {
        ++len;
    }
    return (len);
}

/*
 *  ======== _getInputStreams ========
 *
 */
function _getInputStreams(inFile, fileType)
{
    var fis = null;
    var gzis = null;
    var inputStream = null;

    if (isURL(inFile)) {
        fis = java.net.URL(inFile).openStream();
    }
    else {
        var file = java.io.File(inFile);
        fis = java.io.FileInputStream(file);
    }

    if (fileType == TAR_FILETYPE) {
        inputStream = Packages.org.apache.tools.tar.TarInputStream(fis);
    }
    else if (fileType == TARGZ_FILETYPE) {
        gzis = java.util.zip.GZIPInputStream(fis);
        inputStream = Packages.org.apache.tools.tar.TarInputStream(gzis);
    }
    else if (fileType == ZIP_FILETYPE) {
        inputStream = java.util.zip.ZipInputStream(fis);
    }
    return {
        fis: fis,
        gzis: gzis,
        inputStream: inputStream
    };
}

/*
 *  ======== _getPackageBldXml ========
 *
 */
function _getPackageBldXml(inst, pkg, tmpDir)
{
    var entry;
    var name = null;
    var pkgName = pkg[PACKAGE_INDEX];
    var arFile = pkg[FILE_INDEX];

    var fileType = _getFileType(arFile);
    if (fileType != TAR_FILETYPE && fileType != TARGZ_FILETYPE &&
        fileType != ZIP_FILETYPE) {

        inst.cmdr.warning("Invalid file: " + arFile);
        return (name);
    }

    var pkgBldXml = pkg[PACKAGE_INDEX].replace(/\./g, '/') + 
                    '/package/package.bld.xml';

    var ar = Packages.xdc.tools.repoman.Archive();
    var streams = _getInputStreams(arFile, fileType);
    var inputStream = streams.inputStream;
    while ((entry = inputStream.getNextEntry()) != null) {
        if (entry.getName().equals(pkgBldXml)) {
            name = entry.getName();
            var destFile = java.io.File(tmpDir, name);
            destFile.getParentFile().mkdirs();
            var fout = java.io.FileOutputStream(destFile); 
            if (fileType == ZIP_FILETYPE) {
                ar.copyEntryContents(inputStream, fout);
            }
            else {
                inputStream.copyEntryContents(fout);
            }
            fout.close();
            break;
        }
    }
    _closeInputStreams(streams);
    return (name);
}

/*
 *  ======== _getPackageNames ========
 */
function _getPackageNames(dir)
{
    var args = ["-a", "-n", "-d"];
    args.push(dir);
    var pathMain = xdc.useModule('xdc.tools.path.Main');
    return (pathMain.exec(args));
}

/*
 *  ======== _hasPackage ========
 */
function _hasPackage(dirFile)
{

    var pkgXdcFile = dirFile.getCanonicalPath() + '/' + PACKAGE_XDC_FILE_STR;
    if (java.io.File(pkgXdcFile).exists()) {
        return (true);
    }
    else if (!_hasSubDirectory(dirFile)) {
        return (false);
    }
    else {
        var files = java.io.File(dirFile).listFiles();
        for each (var f in files) {
            if (f.isDirectory()) {
                return (_hasPackage(f));
            }
        }
    }

    return (false);
}

/*
 *  ======== _hasSubDirectory ========
 */
function _hasSubDirectory(dirFile)
{
    var files = java.io.File(dirFile).listFiles();
    for each (var f in files) {
        if (f.isDirectory()) {
            return (true);
        }
    }
    return (false);
}

/*
 *  ======== isURL ========
 *
 */
function isURL(fileName)
{
    var isURL = true;
    try {
        var url = java.net.URL(fileName);
    }
    catch (e) {
        isURL = false;
    }
    return (isURL);
}

/*
 *  ======== isValidURL ========
 *
 */
function isValidURL(url)
{
    var valid = true;

    try {
        var is = java.net.URL(url).openStream();
        is.close();
    }
    catch (e) {
        valid = false;
    }
    return (valid);
}

/*
 *  ======== _listArContents ========
 *
 *  for diagnostic use only
 *
 */
function _listArContents(inst, arFile)
{
    var entry;

    var fileType = _getFileType(arFile);
    if (fileType != TAR_FILETYPE && fileType != TARGZ_FILETYPE &&
        fileType != ZIP_FILETYPE) {

        inst.cmdr.warning("Invalid file: " + arFile);
        return;
    }

    var streams = _getInputStreams(arFile, fileType);
    var inputStream = streams.inputStream;
    while ((entry = inputStream.getNextEntry()) != null) {
        java.lang.System.out.println("entry: " + entry.getName());
    }
    _closeInputStreams(streams);
}

/*
 *  ======== _matchFiles ========
 *  
 */
function _matchFiles(dir, pattern)
{
    var files = [];

    var parentDir = (java.io.File(pattern).isAbsolute()) ?
                    java.io.File(pattern).getParent() :
                    java.io.File(dir);
    for each (var fn in parentDir.list()) {
        if (_wildMatch(pattern, fn)) {
            files.push (fn);
        }
    }
    return (files);
}

/*
 *  ======== _nameAndVersMatches ========
 *
 */
function _nameAndVersMatches(pkgName, desc)
{
    // **TODO: do a little sanity check on pkgName
    //         and its version
    var name = pkgName.slice(0, pkgName.indexOf('['));
    var vers = pkgName.substr(pkgName.indexOf('['));
    return (_nameMatches(name, desc.pkgName)
            && _prefixVersionMatches(vers, desc.version));
}

/*
 *  ======== _nameMatches ========
 *
 */
function _nameMatches(testStr, pkgName)
{
    return ((testStr == pkgName) 
            || (_containsWildcards(testStr) && _wildMatch(testStr, pkgName)));
}

/*
 *  ======== _packageArgsType ========
 *
 */
function _packageArgsType(srcDir, pkgArgs)
{
    for each (var p in pkgArgs) {
        /* first, look for obvious signs pkgArgs contains files */
        if (_isAnArchive(p)) {
            return (PACKAGE_FILES);
        }
        if (java.io.File(p).isAbsolute() ||
            ("" + p).indexOf(java.io.File.separator) != -1) {
            return (PACKAGE_FILES);
        }
        if (!_containsWildcards(p)) {
            /* next check if it is an existing file */
            var file = java.io.File(p).isAbsolute() ?
                       java.io.File(p) :
                       java.io.File(srcDir, p);
            if (file.exists()) {
                return (PACKAGE_FILES);
            }
        }
        else {
            /* last, see if wildcards match an existing file */
            if(_isAnArchive(p) && _matchFiles(srcDir, p).length) {
                return (PACKAGE_FILES);
            }
        }
    }
    return (PACKAGE_NAMES);
}

/*
 *  ======== _packageInfo ========
 *
 */
function _packageInfo(inst, output)
{
    inst.cmdr.info("building package info output...");
    
    if (output == XML_OUTPUT) {
        var xmlArr = [];
    }

    var srcDir = inst.pathArg;
    if (srcDir == null) {
        srcDir = '.';
    }
    else if (!java.io.File(srcDir).exists()) {
        return("Directory " +
               java.io.File(srcDir).getCanonicalPath() +
               NOT_FOUND_STR);
    }

    var pkgsMatchArr = [];
    if (inst.args.length > 0) {
        for each (var p in inst.args) {
            pkgsMatchArr.push(p);
        }
    }

    if (pkgsMatchArr.length == 0 ||
        _packageArgsType(srcDir, inst.args) == PACKAGE_NAMES) {

        var isArchiveDir = false;
        var dirFile = java.io.File(srcDir);
        var fnArr = dirFile.list();
        for each (var fn in fnArr) {
            var f = java.io.File(dirFile, fn);
            if (f.isFile() && _isAnArchive(f.getName())) {
                isArchiveDir = true;
                break;                                
            }
        }

        if (isArchiveDir) {
            var ar = Packages.xdc.tools.repoman.Archive();
            java.util.Arrays.sort(fnArr);
            for each (var fn in fnArr) {
                var f = java.io.File(dirFile, fn);
                if (f.isFile() && _isAnArchive(f.getName())) {

                    var path = f.getCanonicalPath();

                    var scanRet = ar.scan(path);
                    if (scanRet == null) {
                        if (pkgsMatchArr.length == 0) {
                            if (output == ARRAY_OUTPUT) {
                                 inst.resArr.push(_archiveArrElemStr(inst.infoFlag,
                                                                    ar));
                            }
                            else if (output == STRING_OUTPUT) {
                                inst.resStr += _archiveStr(inst, ar);
                                inst.resStr += '\n';
                            }
                            else {
                                xmlArr.push(_archiveXmlStruct(inst, ar));
                            }
                        }
                        else {
                            for each (var p in pkgsMatchArr) {
                                if (p.length != 0 &&
                                    _nameMatches(p, ar.getDesc().pkgName)) {

                                    if (output == ARRAY_OUTPUT) {
                                        inst.resArr.push(
                                                _archiveArrElemStr(inst.infoFlag,
                                                                   ar));
                                    }
                                    else if (output == STRING_OUTPUT) {
                                        inst.resStr += _archiveStr(inst, ar);
                                        inst.resStr += '\n';
                                    }
                                    else {
                                        xmlArr.push(_archiveXmlStruct(inst, ar));
                                        break;
                                    }
                                    break;
                                }
                            }
                        }
                    }
                    else {
                        return (
                            "Failed to retrieve package info for\n" + path + ":\n" +
                            scanRet);
                    }
                }
            }
        }
        else {  /* srcDir is a repository */

            var repoInfo;
            if (inst.infoFlag) {
                repoInfo = _getPackagesInfo(srcDir);
            }
            else {
                repoInfo = _getPackagesInfo(srcDir, true);
            }
            if (!(repoInfo instanceof Array)) {
                return (repoInfo);
            }
            if (repoInfo.length > 0) {

                if (inst.infoFlag) {
                    var repoXmlInf = getRepoXmlItems(srcDir);
                    if (output == XML_OUTPUT) {
                        inst.resObj.repository = srcDir;
                        inst.resObj.providerId = repoXmlInf.providerId;
                        inst.resObj.writable = repoXmlInf.writable;
                    }
                    else {
                        if (output == ARRAY_OUTPUT) {
                            var str = srcDir + ';' + repoXmlInf.providerId + ';' +
                                      repoXmlInf.writable;
                            inst.resArr.push(str);
                        }
                        else {  /* STRING_OUTPUT */
                            var str = REPO_STR + srcDir + '\n' + 
                            PROVIDER_ID_STR + repoXmlInf.providerId + '\n';
                            str += WRITABLE_STR + repoXmlInf.writable + '\n';
                            inst.resStr +=  str + '\n';
                        }
                    }
                }

                for each (var pkgStr in repoInfo) {
                    if (pkgStr.length == 0) {
                        continue;
                    }
                    if (pkgsMatchArr.length == 0) {
                        if (output == ARRAY_OUTPUT) {
                             inst.resArr.push(_pkgArrElemStr(inst.infoFlag,
                                                             pkgStr));
                        }
                        else if (output == STRING_OUTPUT) {
                            inst.resStr += _pkgStr(inst.infoFlag, pkgStr);
                            inst.resStr += '\n';
                        }
                        else {
                            xmlArr.push(_pkgXmlStruct(inst, pkgStr));
                        }
                    }
                    else {
                        for each (var p in pkgsMatchArr) {
                            if (p.length != 0) {
                                var name = (inst.infoFlag) ?
                                           pkgStr.split(';')[0] :
                                           pkgStr;
                                if (_nameMatches(p, name)) {

                                    if (output == ARRAY_OUTPUT) {
                                        inst.resArr.push(
                                                _pkgArrElemStr(inst.infoFlag,
                                                               pkgStr));
                                    }
                                    else if (output == STRING_OUTPUT) {
                                        inst.resStr += _pkgStr(inst.infoFlag,
                                                               pkgStr);
                                        inst.resStr += '\n';
                                    }
                                    else {
                                        xmlArr.push(_pkgXmlStruct(inst,
                                                                  pkgStr));
                                        break;
                                    }
                                    break;
                                }
                            }
                        }
                    }
                }
            }
        }
    }
    else {  /* package args are tar files */
        var tarFile;
        var tarName;
        var ar;
        var scanRet;

        var pkgFiles = [];
        /* make package list with any wildcards resolved */
        for each (var p in pkgsMatchArr) {
            if (_containsWildcards(p)) {
                var matchedFiles = _matchFiles(srcDir, p);
                for each (var f in matchedFiles) {
                    pkgFiles.push(f);
                }
            }
            else {
                pkgFiles.push(p);
            }
        }
        if (!pkgFiles.length) {
            return ('No packages found');
        }
        for each (var p in pkgFiles) {
            if (isURL(p)) {
                tarName = p;
            }
            else {
                tarFile = java.io.File(p).isAbsolute() ?
                          java.io.File(p) : java.io.File(srcDir, p);
                tarName = tarFile.getCanonicalPath();
                if (!tarFile.exists()) {
                    return (tarName + " does not exist");
                }
            }
            ar = Packages.xdc.tools.repoman.Archive();
            scanRet = ar.scan(tarName);
            if (scanRet == null) {
                if (output == ARRAY_OUTPUT) {
                    inst.resArr.push(_archiveArrElemStr(inst.infoFlag,
                                     ar));
                }
                else if (output == STRING_OUTPUT) {
                    inst.resStr += _archiveStr(inst, ar) + "\n";
                }
                else {
                    xmlArr.push(_archiveXmlStruct(inst, ar));
                }
            }
            else {
                return("Failed to retrieve package info for\n" + tarName +
                       ":\n" + scanRet);
            }
        }
    }
    if (output == XML_OUTPUT) {
        if (inst.infoFlag) {
            inst.resObj.pkg = xmlArr;
        }
        else {
            inst.resObj.pkgName = xmlArr;
        }
    }
    return ('');
}

/*
 *  ======== _packageIsABundle ========
 */
function _packageIsABundle(inst, dir, pkgName)
{
    inst.cmdr.info("checking if " + pkgName + " is a bundle ");
    
    var pkgDir = ("" + dir).replace(/\\/g, '/') + '/' +
                 ("" + pkgName).replace(/\./g, '/');
    var pkgBldXmlFile = pkgDir + "/package/" + PACKAGE_BLD_XML_FILE_STR;
    pkgBldXmlFile = pkgBldXmlFile.replace(/\"/g, ''); /* if dir has spaces */

    var props = ["name"];
    var doc = Packages.xdc.services.global.XML.parse(pkgBldXmlFile);
    var reps = Packages.xdc.services.global.XML.getHMaps(doc, "repositories",
                                                         props);
    
    for (var i = 0; i < reps.length; i++) {
        var name = reps[i].get("name");
        if (name != null && name.length() > 0) {
            inst.cmdr.info("    " + pkgName + " is a bundle.");
            return (true);
        }
    }

    inst.cmdr.info("    " + pkgName + " is not a bundle.");
    return (false);
}

/*
 *  ======== _packageReq ========
 *
 */
function _packageReq(pkgName, version)
{
    this.pkgName = "" + pkgName;
    this.version = "" + version;
}

/*
 *  ======== _preExtractCheckCompatibility ========
 *
 */
function _preExtractCheckCompatibility(inst, tarList, destDir)
{
    inst.cmdr.info("checking compatibility prior to extracting... ");

    inst.cmdr.verbose(false); /* don't echo these extracts */
    /* create a temp dir and extract archived packages to it */
    var tmpdir = Packages.xdc.services.global.Host.tmpdir();
    for each (var t in tarList) {
        var tarName = ("" + t).replace(/\"/g, '');
        extractArchiveContents(inst, tarName, tmpdir);
    }

    /* pass destDir & tmpdir to check tool for compatiblity check */
    var args = ["-a"];
    args.push("" + tmpdir);
    args.push("" + destDir);
    var checkMain = xdc.useModule('xdc.tools.check.Main');
    var checkRet = checkMain.exec(args);

    /* remove temp dir */
    var tmpdirFile = java.io.File(tmpdir);
    _deleteDirectoryContents(inst, tmpdirFile);
    tmpdirFile['delete']();
    inst.cmdr.verbose(inst.verboseFlag); /* restore */
    return (checkRet);
}

/*
 *  ======== _prefixVersionMatches ========
 *
 */
function _prefixVersionMatches(vers1, vers2)
{
    /*
       vers1 can be a prefix of a version in the format [n, n, ..]
       If the prefix matches the beginning of vers2, we have a match
     */

    vers1 = "" + vers1;
    vers2 = "" + vers2;

    /* strip any brackets */
    if (vers1.charAt(0) == '[') {
        vers1 = vers1.slice(1, vers1.length - 1);
    }
    if (vers2.charAt(0) == '[') {
        vers2 = vers2.slice(1, vers2.length - 1);
    }

    /* remove any spaces */
    vers1 = vers1.replace(/ /g, '');    
    vers2 = vers2.replace(/ /g, '');    

    /* count commas */
    var v1 = vers1.split(',');
    var v2 = vers2.split(',');

    if (v1.length < v2.length) {
        return (vers1 == vers2.substr(0, vers1.length));
    }
    else {
        return (vers1 == vers2);
    }
}

/*
 *  ======== _resolvePkgFileArgs ========
 *  
 */
function _resolvePkgFileArgs(inst, srcDir, argsArr)
{
    var pkgFiles = [];
    var status = '';
    var error = false;

    /* make a package list with any wildcards resolved */
    for each (var a in argsArr) {
        if (_containsWildcards(a)) {
            var matchedFiles = _matchFiles(srcDir, a);
            if (!matchedFiles.length) {
                error = true;
                break;
            }
            for each (var f in matchedFiles) {
                pkgFiles.push(f);
            }
        }
        else {
            if (isURL(a)) {
                if (isValidURL(a)) {
                    pkgFiles.push(a);
                }
                else {
                    error = true;
                    break;
                }
            }
            else {
                var file = java.io.File(a).isAbsolute() ?
                           java.io.File(a) :
                           java.io.File(srcDir, a);
                if (file.exists()) {
                    pkgFiles.push(a);
                }
                else {
                    error = true;
                    break;
                }
            }
        }
    }
    if (error) {
        status = "Cannot resolve " + a;
    }

    return {
        status : status,
        pkgFiles: pkgFiles
    };

}

/*
 *  ======== _scanDirExtractPackageDependencies ========
 *
 *  scans the archives in srcDir for packages contained
 *  in the array pkgDeps
 *
 *  doesn't track if any packages in pkgDeps aren't found
 *  in srcDir
 *
 */
function _scanDirExtractPackageDependencies(inst, pkgDeps, srcDir, destDir)
{
    inst.cmdr.info("extracting package dependencies from " + srcDir + "...");

    var dirFile = java.io.File(srcDir);
    var ar = Packages.xdc.tools.repoman.Archive();

    for each (var fn in dirFile.list()) {
        var f = java.io.File(dirFile, fn);
        if (f.isFile() && _isAnArchive(f.getName())) {

            var path = f.getCanonicalPath();

            var scanRet = ar.scan(path);
            if (scanRet == null) {
                for each (var req in pkgDeps) {
                    if (req.pkgName == ar.getDesc().pkgName) {
                        if (req.version == "") {

                            /* found dependency! */
                            _deletePkgIfItExists(inst, ar.getDesc().pkgName,
                                                 destDir);
                            inst.cmdr.info("extracting " +
                                           ar.getDesc().pkgName + " from " +
                                           f.getCanonicalPath());
                            extractArchiveContents(inst, f.getCanonicalPath(),
                                                    destDir);
                        }
                        else {
                            /* trim buildcount from Desc.version */
                            var version = ar.getDesc().version;
                            if (req.version == version.substr(0,
                                               version.lastIndexOf(','))) {

                                /* found dependency! */
                                _deletePkgIfItExists(inst,
                                                     ar.getDesc().pkgName,
                                                     destDir);
                                inst.cmdr.info("extracting " +
                                               ar.getDesc().pkgName +
                                               " from " +
                                               f.getCanonicalPath());
                                extractArchiveContents(inst,
                                                        f.getCanonicalPath(),
                                                        destDir);
                            }
                        }
                    }
                }
            }
            else {
                inst.cmdr.warning("Failed to retrieve package info for\n" +
                                  path + ":\n" + scanRet);
            }
        }
    }
}

/*
 *  ======== extractArchiveContents ========
 *
 */
function extractArchiveContents(inst, fileName, destDir)
{
    var fileType = _getFileType(fileName);

    if (fileType == TAR_FILETYPE || fileType == TARGZ_FILETYPE) {
        _unTar(inst, fileName, fileType, destDir);
    }
    else if (fileType == ZIP_FILETYPE) {
        _unZip(inst, fileName, destDir);
    }
}

/*
 *  ======== _unTar ========
 *
 */
function _unTar(inst, tarName, fileType, destDir)
{
    if (inst) {
        inst.cmdr.info("extracting " + tarName + " to " +
                       java.io.File(destDir).getCanonicalPath());
    }

    var entry;
    var name;
    var streams = _getInputStreams(tarName, fileType);
    var inputStream = streams.inputStream;

    while ((entry = inputStream.getNextEntry()) != null) {
        if (entry.isDirectory()) {
            continue;
        }
        name = entry.getName();

        var destFile = java.io.File(destDir, name);
        destFile.getParentFile().mkdirs();
        var fout = java.io.FileOutputStream(destFile); 
        inputStream.copyEntryContents(fout);   
        fout.close();                      
    }
    _closeInputStreams(streams);
}

/*
 *  ======== _unZip ========
 *
 */
function _unZip(inst, zipName, destDir)
{
    if (inst) {
        inst.cmdr.info("extracting " + zipName + " to " +
                       java.io.File(destDir).getCanonicalPath());
    }

    var entry;
    var name;
    var ar = Packages.xdc.tools.repoman.Archive();
    var streams = _getInputStreams(zipName, ZIP_FILETYPE);
    var inputStream = streams.inputStream;


    while ((entry = inputStream.getNextEntry()) != null) {
        if (entry.isDirectory()) {
            continue;
        }
        name = entry.getName();
        var destFile = java.io.File(destDir, name);
        destFile.getParentFile().mkdirs();
        var fout = java.io.FileOutputStream(destFile); 
        ar.copyEntryContents(inputStream, fout);   
        fout.close();                      
    }
    _closeInputStreams(streams);
}

/*
 *  ======== _validate ========
 *
 *  validate command line
 *
 */
function _validate(inst)
{
    if (!inst.infoFlag && !inst.namesFlag && !inst.extractFlag &&
        !inst.deleteFlag && !inst.copyFlag && !inst.rsaveFlag && 
        !inst.rcreateFlag && !inst.rrestoreFlag && !inst.provIdArg) {

        inst.cmdr.usage("-t, -n, -x, -d, -c, --providerId, --rsave, --rcreate or -rrestore flag required");
        return (false);
    }

    if ((inst.deleteFlag || inst.copyFlag) && inst.args.length == 0) {
        inst.cmdr.usage(PACKAGES_REQUIRED_STR);
        return (false);
    }
    if (inst.bundleRepositoryArg) {
        if (inst.args.length == 0) {
            inst.cmdr.usage(MUST_SPECIFY_BUNDLE_STR);
            return (false);
        }
    }
    if (inst.rsaveFlag) {
        if (!inst.fileArg) {
            inst.cmdr.usage(FILE_ARG_STR);
            return (false);
        }
        if (inst.args.length == 0) {
            inst.cmdr.usage(REPOS_REQUIRED_STR);
            return (false);
        }
    }
    if (inst.rrestoreFlag) {
        if (!inst.fileArg) {
            inst.cmdr.usage(FILE_ARG_STR);
            return (false);
        }
        if (inst.args.length > 1) {
            inst.cmdr.usage(TOO_MANY_ARGS_STR);
            return (false);
        }
    }
    if (inst.rcreateFlag) {
        if (!inst.fileArg) {
            inst.cmdr.usage(FILE_ARG_STR);
            return (false);
        }
        if (inst.args.length == 0) {
            inst.cmdr.usage(TOO_FEW_ARGS_STR);
            return (false);
        }
    }
    if ((inst.arrFlag && inst.xmlFlag) ||

        (inst.infoFlag && (inst.namesFlag || inst.extractFlag ||
         inst.deleteFlag || inst.copyFlag || inst.rsaveFlag ||
         inst.rrestoreFlag || inst.rcreateFlag)) ||

        (inst.namesFlag && (inst.extractFlag || inst.deleteFlag ||
         inst.copyFlag || inst.rsaveFlag || inst.rrestoreFlag ||
         inst.rcreateFlag)) ||

        (inst.extractFlag && (inst.deleteFlag || inst.copyFlag ||
         inst.rsaveFlag || inst.rrestoreFlag || inst.rcreateFlag ||
         inst.fileArg)) ||

        (inst.deleteFlag && (inst.copyFlag || inst.rsaveFlag ||
         inst.rrestoreFlag || inst.rcreateFlag || inst.pathArg)) ||

        (inst.copyFlag && (inst.rsaveFlag || inst.rrestoreFlag ||
         inst.rcreateFlag)) ||

        (inst.rsaveFlag &&
         (inst.rrestoreFlag || inst.rcreateFlag)) ||

        (inst.rrestoreFlag && inst.rcreateFlag) ||

        (inst.bundleRepositoryArg && !inst.extractFlag) ||

        (inst.fileArg && !(inst.rsaveFlag || inst.rrestoreFlag ||
         inst.rcreateFlag)) ||

        (inst.repositoryArg &&
         (inst.infoFlag || inst.namesFlag || inst.rsaveFlag ||
          inst.rrestoreFlag || inst.createFlag)) ||

        (inst.dependentFlag && inst.recursiveDepFlag) ||

        ((inst.xmlFlag || inst.arrFlag) &&
         !(inst.infoFlag || inst.namesFlag)) ||

        (inst.forceFlag && !(inst.copyFlag || inst.deleteFlag ||
          inst.extractFlag || inst.provIdArg)) ||

        (!inst.extractFlag && (inst.dependentFlag || inst.recursiveDepFlag))) {


        inst.cmdr.usage("invalid use of flags");        
        return (false);
    }
    return (true);
}

/*
 *  ======== _versionIsSpecified ========
 *
 */
function _versionIsSpecified(pkgName)
{
    return (pkgName.indexOf('[') != -1 && pkgName.indexOf(']') != -1);
}

/*
 *  ======== _versionMatches ========
 *
 */
function _versionMatches(vers1, vers2)
{
    /*
     * vers1 and vers2 can be either from a req.version or a desc.version,
     * meaning that they can be 0,0,0,1 or [] or 0,0,0,1,<buildcount>
     */
    vers1 = "" + vers1;
    vers2 = "" + vers2;

    /* strip any brackets */
    if (vers1.charAt(0) == '[') {
        vers1 = vers1.slice(1, vers1.length - 1);
    }
    if (vers2.charAt(0) == '[') {
        vers2 = vers2.slice(1, vers2.length - 1);
    }
    if (vers1 == "" || vers2 == "") {
        return (true);
    }
    else {
        /* count commas */
        var v1 = vers1.split(',');
        var v2 = vers2.split(',');

        if (v1.length == v2.length) {
            return (vers1 == vers2);
        }
        else if (v1.length > v2.length) {
            return (vers2 == vers1.substr(0, vers2.length));
        }
        else if (v1.length < v1.length) {
            return (vers1 == vers2.substr(0, vers1.length));
        }
    }

    return (false);
}

/*
 *  ======== _wildMatch ========
 *
 */
function _wildMatch(pat, str)
{
    var newpat = pat.replace(/\./g, '\.');
    newpat = newpat.replace(/\*/g, '.*');
    newpat = newpat.replace(/\?/g, '.');
    return (str.match('^' + newpat + '$'));
}

/*
 *  ======== _copyPackage ========
 */
function _copyPackage(inst, srcDir, destDir, pkgName)
{
    var status = '';
    var copyMsg = "copying " + pkgName 
        + " from " + java.io.File(srcDir).getCanonicalPath()
        + " to "   + java.io.File(destDir).getCanonicalPath();

    var pkgPre = pkgName.replace(/\./g, '/');
    var pkgDir = srcDir + '/' + pkgPre;
    var pkgXdcFile = pkgDir + '/' + PACKAGE_XDC_FILE_STR;
    pkgXdcFile = pkgXdcFile.replace(/\"/g, ''); /* in case dir has spaces */

    var destPkgDir = destDir + '/' + pkgPre;
    destPkgDir = destPkgDir.replace(/\"/g, ''); /* in case dir has spaces */

    if (java.io.File(pkgXdcFile).exists()) {    /* found package directory */

        /* delete any existing */
        _deletePkgIfItExists(inst, pkgName, destDir);

        /* copy all non-directory files and */
        /* subdirectories that don't have any packages */
        inst.cmdr.info(copyMsg);

        var pkgDirFile = java.io.File(pkgDir);
        var files = pkgDirFile.listFiles();

        for each (var f in files) {
            if (!f.isDirectory()) {
                try {
                    _copyFile(f, destPkgDir);
                }
                catch (e) {
                    status = 'Error copying package ' + pkgName + 'to ' + destPkgDir +
                             ': ' + e.message;
                    break;
                }
            }
            else {
                if (f.listFiles().length) {
                    if (!java.io.File(f.getCanonicalPath() + '/' +
                        PACKAGE_XDC_FILE_STR).exists()) {

                        status = _copyPackageDirectoryContents(inst, f, 
                                 destPkgDir + '/' + f.getName());
                        if (status.length) {
                            break;
                        }
                    }
                }
                else {
                    java.io.File(destPkgDir + '/' + f.getName()).mkdirs();
                }
            }
        }
    }
    else {
        status = pkgName + " not found in repository " +
                 java.io.File(srcDir).getCanonicalPath();
    }
    return (status);
}

/*
 *  ======== _copyFile ========
 */
function _copyFile(srcFile, dstDir)
{
    var dstFile = java.io.File(dstDir + '/' + srcFile.getName());
    dstFile.getParentFile().mkdirs();

    var outs;
    var ins;
    try {
        outs = new java.io.FileOutputStream(dstFile);
        ins = new java.io.FileInputStream(srcFile);
    }
    catch (e) {
        if (ins) ins.close();
        if (outs) outs.close();
        throw new Error(e.message);
    }

    var inc = ins.getChannel();
    var outc = outs.getChannel();
    inc.transferTo(0, inc.size(), outc);

    ins.close();
    outs.close();
}

/*
 *  ======== _copyPackageDirectoryContents ========
 */
function _copyPackageDirectoryContents(inst, dirFile, destDir)
{
    var status = '';
    for each (var f in dirFile.listFiles()) {
        if (!f.isDirectory()) {
            try {
                _copyFile(f, destDir);
            }
            catch (e) {
                status = CANNOT_COPY_FILE_STR +
                         f.getCanonicalPath() + "\n" +
                         e.message;
                break;                            
            }
        }
        else {
            if (f.listFiles().length) {
                if (!java.io.File(f.getCanonicalPath() + '/' +
                    PACKAGE_XDC_FILE_STR).exists()) {

                    status = _copyPackageDirectoryContents(inst, f, 
                             destDir + '/' + f.getName());
                    if (status.length) {
                        break;
                    }
                }
            }
            else {
                java.io.File(destDir + '/' + f.getName()).mkdirs();
            }
        }
    }
    return (status);
}

/*
 *  ======== _saveRepositoryInfo ========
 */
function _saveRepositoryInfo(inst, destFile, searchPath, repoList)
{   
    inst.cmdr.info("saving repository info to " + 
                    java.io.File(destFile).getCanonicalPath());

    var retStr = "";
    try {
        var doc = <xdcRepoman/>;
        doc.searchPath = (searchPath != null) ? searchPath : "";
        var repos = <repositories/>;

        for (var i = 0; i < repoList.length; i++) {
            var repo = <repository/>;
            repo.@path = repoList[i];
            if (java.io.File(repoList[i]).exists()) {
                var pkgsList = _getPackagesInfo(repoList[i]);
                for (var j = 0; j < pkgsList.length; j++) {
                    var pkgArr = pkgsList[j].split(';');
                    var pkg = <pkg/>;
                    pkg.@name = pkgArr[PACKAGE_INDEX];
                    //pkg.@release = pkgArr[RELEASE_NAME_INDEX];
                    pkg.@key = pkgArr[VERSION_INDEX];
                    repo.appendChild(pkg);
                }
            }
            repos.appendChild(repo);
        }
        doc.appendChild(repos);

        /* save the doc to file */
        var file = java.io.File(destFile);
        var toFile = java.io.RandomAccessFile(file, "rwd");
        toFile.setLength(0);
        toFile.writeBytes(doc.toXMLString());
        toFile.close();
    }
    catch (e) {
        inst.cmdr.warning(e.message);
        retStr = ERROR_FLAG_STR + e.message;

    }
    return (retStr);
}

/*
 *  ======== _readRepoInfo ========
 *
 */
function _readRepoInfo(inst, doc)
{
    var pkgList = "";
    var hasPackages = false;

    if (doc.repositories.repository.length() == 0) {
        pkgList = ERROR_FLAG_STR + "no repositories found in " +
                  java.io.File(srcFile).getCanonicalPath();

        return (pkgList);
    }

    /* create a string of repositories, newline delimited  */
    try {
        for (var i = 0; i < doc.repositories.repository.length(); i++) {
            var repo = doc.repositories.repository[i];
            var repoStr = repo.@path + ";";
            if (repo.pkg.length() > 0) {
                for (var j = 0; j < repo.pkg.length(); j++) {
                    repoStr += repo.pkg[j].@name + "[" + repo.pkg[j].@key +
                               "];";
                }
                if (hasPackages == false) {
                    hasPackages = true;
                }
            }
            if (i > 0) {
                pkgList += "\n";
            }
            pkgList += repoStr;
        }
    }
    catch (e) {
        inst.cmdr.warning(e.message);
        pkgList = ERROR_FLAG_STR + e.message;
        return (pkgList);
    }
    return ((hasPackages == true) ? pkgList : "");
}


/*
 *  ======== _getPackagesInfo ========
 */
function _getPackagesInfo(path, names)
{
    var args;
    var arr = [];
    var pathArgs = [];
    
    var testArr = path.split(';');
    for each (var t in testArr) {
        if (java.io.File(t).isDirectory()) {
            pathArgs.push(t);
        }
    }   
    if (pathArgs.length > 0) {
        if (names == undefined) {
            args = ['-a', '-d'].concat(pathArgs);
        }
        else {
            args = ['-n', '-a', '-d'].concat(pathArgs);
        }
        var pathMain = xdc.useModule('xdc.tools.path.Main');
        try {
            arr = pathMain.exec(args);
        }
        catch (e) {
            return (e.message);
        }
    }

    return (arr.sort());
}

/*
 *  ======== _getArchivedPackagesInfo ========
 */
function _getArchivedPackagesInfo(inst, pathList)
{
    var pkgArr = [];
    var pathArr = pathList.split(';');

    for each (var p in pathArr) {
        if (p.length == 0) {
            continue;
        }
        var isUrl = isURL(p);
        var file = java.io.File(p);
        if (isUrl) {
            if (!_isValidURL(p)) {
                continue;
            }
        }
        else if (!file.exists()) {
            continue;
        }
        var ar = Packages.xdc.tools.repoman.Archive();
        if (isUrl || (file.isFile() && _isAnArchive(file.getName()))) {

            var path = isUrl ? p : file.getCanonicalPath();

            var scanRet = ar.scan(path);
            if (scanRet == null) {
               pkgArr.push(_archiveArrElemStr(true, ar));
            }
            else {
                inst.cmdr.warning(
                    "Failed to retrieve package info for\n" + path +
                    ":\n" + scanRet);
            }
        }

        else if (file.isDirectory()) {
            var fnArr = file.list();
            java.util.Arrays.sort(fnArr);
            for each (var fn in fnArr) {
                var f = java.io.File(file, fn);
                if (f.isFile() && _isAnArchive(f.getName())) {

                    var path = f.getCanonicalPath();

                    var scanRet = ar.scan(path);
                    if (scanRet == null) {
                       pkgArr.push(_archiveArrElemStr(true, ar));
                    }
                    else {
                        inst.cmdr.warning(
                            "Failed to retrieve package info for\n" + path +
                            ":\n" + scanRet);
                    }
                }
            }
        }
    }
    return (pkgArr);
}


/*
 *  ======== _getBundlePackagesInfo ========
 */
function _getBundlePackagesInfo(inst, searchPath)
{
    var reposPath = "";
    var pathArr = ("" + searchPath).split(';');
    var searchPkgs = [];
    for each (var p in pathArr) {
        if (p.length == 0) {
            continue;
        }
        var info = _getPackagesInfo(p);
        if (info.length > 0) {
            searchPkgs += info;
        }
        else { /* dir may be a package */
            if (java.io.File(p + "/" + PACKAGE_XDC_FILE_STR).exists()) {
                var f = java.io.File(p);
                searchPkgs.push(f.getName() + ";" + f.getParent() + ";");
            }
        }
    }

    /* make a path string of repositories in bundles along searchPath */
    for each (var s in searchPkgs) {
        var pkg = s.split(';');
        if (_pkgLooksLikeABundle(pkg[FILE_INDEX], pkg[PACKAGE_INDEX])) {
            var bundleDir = java.io.File(pkg[FILE_INDEX] + 
                            '/' + pkg[PACKAGE_INDEX]).
                            getCanonicalPath();
            var repos = _getBundlePkgNameAndRepositories(bundleDir);
            if (repos.length > 0) {
                repos.shift();
                for each (var r in repos) {
                    if (java.io.File(bundleDir + '/' + r).exists()) {
                        reposPath += bundleDir + "/" + r + ";";
                    }
                }
            }
        }
    }

    if (reposPath != "") {
        searchPkgs = _getPackagesInfo(reposPath);
    }
    else {
        searchPkgs = [];
    }
    return (searchPkgs);
}


/*
 *  ======== _getArchivedBundlePackagesInfo ========
 */
function _getArchivedBundlePackagesInfo(inst, pkg, tmpdir)
{ 
    var bundleFile = pkg[FILE_INDEX];
    var searchPkgs = [];
    var reposPath = "";
    var pkgBldXmlFile = _getPackageBldXml(inst, pkg, tmpdir);
    var repoList = _getBundleRepositoryNames(tmpdir + '/' + pkgBldXmlFile);
    var isUrl = isURL(bundleFile);
    var srcdir = isUrl ? '' : java.io.File(bundleFile).getParent();
    var name = isUrl ? bundleFile : java.io.File(bundleFile).getName();
    for each (var repo in repoList) {
        var destdir = tmpdir + '/' + repo;
        java.io.File(destdir).mkdir();
        if (_extractRepository(inst, srcdir, bundleFile, repo, destdir)) {
            reposPath += java.io.File(destdir).getCanonicalPath() + ';';
        }
    }

    if (reposPath != "") {
        searchPkgs = _getPackagesInfo(reposPath);
    }
    return (searchPkgs);
}

/*
 *  ======== _getBundlePkgNameAndRepositories ========
 *
 *   if this directory is a bundle, return an array consisting
 *   of the package name, followed by the repositories in the
 *   bundle
 *   otherwise, return an empty array
 *
 */
function _getBundlePkgNameAndRepositories(dir)
{
    var list = [];
    var pkgXdcFile = java.io.File(dir).getCanonicalPath() + '/' +
                     PACKAGE_XDC_FILE_STR;
    if (java.io.File(pkgXdcFile).exists()) {
        var pkgBldXmlFile = java.io.File(dir).getCanonicalPath() +
                            "/package/" +
                            PACKAGE_BLD_XML_FILE_STR;
        if (java.io.File(pkgBldXmlFile).exists()) {

            /* get any repository names */
            var doc = Packages.xdc.services.global.XML.parse(pkgBldXmlFile);
            var props = ["name"];
            var reps = Packages.xdc.services.global.XML.getHMaps(doc,
                    "repositories", props);
            for (var i = 0; i < reps.length; i++) {
                var name = reps[i].get("name");
                if (name != null && name.length() > 0) {
                    list.push(name);
                }
            }
            if (list.length > 0) { /* get the package name */
                var name = doc.getElementsByTagName("package").item(0).
                        getAttributes().getNamedItem("name").getNodeValue();
                if (name != null) {
                    list.unshift(name);
                }
                else {
                    list = [];
                }
            }
        }
    }
    return (list);
}

/*
 *  ======== _pkgLooksLikeABundle ========
 *
 */
function _pkgLooksLikeABundle(repo, pkgName)
{   
    var bundleDir = java.io.File(repo + '/' + pkgName);
    return (bundleDir.exists() && bundleDir.isDirectory());     
}

/*
 *  ======== _restoreRepository ========
 *
 */
function _restoreRepository(inst, destRepo, pkgArr, searchPath, verify)
{
    var searchPkgs;
    var archivedPkgs;
    var found;
    var dPkg;
    var vers;
    var pkg;
    var retStr = "";
    var notFoundPkgs = [];

    try {
        var destRepoFile = java.io.File(destRepo);
        if (destRepoFile.exists()) {

            var destPkgs = _getPackagesInfo("" + destRepo);
            if (destPkgs.length > 0) {

                if (!verify) {
                    /* remove packages that aren't in list */
                    for each (var s in destPkgs) {
                        dPkg = s.split(';');
                        found = false;
                        for each (var p in pkgArr) {
                            if (!p.length) {
                                continue;
                            }
                            pkg = ("" + p).split("[");
                            if (dPkg[PACKAGE_INDEX] == pkg[0]) {
                                found = true;
                                break;
                            }
                        }
                        if (!found) {
                            _deletePackage(inst, destRepo,
                                           dPkg[PACKAGE_INDEX]);
                        }
                    }
                }

                /* search destination repository first, */    
                /*  some packages may already be there  */
                for each (var p in pkgArr) {
                    if (!p.length) {
                        continue;
                    }
                    pkg = ("" + p).split("[");
                    vers = pkg[1].substr(0, pkg[1].length - 1);
                    found = false;
                    for each (var s in destPkgs) {
                        dPkg = s.split(';');
                        if (dPkg[PACKAGE_INDEX] == pkg[0] &&
                            dPkg[VERSION_INDEX] == vers) {

                            found = true;
                            break;
                        }
                    }
                    if (!found) {
                        notFoundPkgs.push(p);
                    }
                }
            }
            else {
                notFoundPkgs = pkgArr;
            }
        }
        else {
            destRepoFile.mkdir();
            notFoundPkgs = pkgArr;
        }
    }
    catch (e) {
        return (ERROR_FLAG_STR + e.message);
    }
    if (notFoundPkgs.length > 0) {
        searchPkgs = _getPackagesInfo("" + searchPath);
        if (searchPkgs.length > 0) {
            notFoundPkgs = _restorePackages(inst, searchPkgs, notFoundPkgs,
                                            destRepo, verify);
        }
    }
    if (notFoundPkgs.length > 0) {
        archivedPkgs = _getArchivedPackagesInfo(inst, "" + searchPath);
        if (archivedPkgs.length > 0) {
            notFoundPkgs = _restorePackages(inst, archivedPkgs, notFoundPkgs,
                                            destRepo, verify);
        }
    }
    if (notFoundPkgs.length > 0) {
        try {
            var bundlePkgs = _getBundlePackagesInfo(inst, searchPath);
            if (bundlePkgs.length > 0) {
                notFoundPkgs = _restorePackages(inst, bundlePkgs, notFoundPkgs,
                                                destRepo, verify);
            }
        }
        catch (e) {
            return (ERROR_FLAG_STR + e.message);    
        }
    }

    /* if still not found, look for packages in  */
    /* archived bundle repositories              */
    if (notFoundPkgs.length > 0) {
        for each (var p in archivedPkgs) {
            pkg = p.split(';');
            if (_isABundleArchive(inst, pkg)) {
                var tmpdir = Packages.xdc.services.global.Host.tmpdir();
                var tmpdirFile = java.io.File(tmpdir);

                try {
                    searchPkgs = _getArchivedBundlePackagesInfo(inst, pkg,
                                                                tmpdir);
                    notFoundPkgs = _restorePackages(inst, searchPkgs,
                                                    notFoundPkgs, destRepo,
                                                    verify);
                    _deleteDirectoryContents(inst, tmpdirFile);
                    tmpdirFile['delete']();
                    if (notFoundPkgs.length == 0) {
                        break;
                    }
                }
                catch (e) {
                    return (ERROR_FLAG_STR + e.message);
                }
            }
        }
    }
    if (notFoundPkgs.length > 0) {
        retStr = notFoundPkgs.join(';'); 
    }
    return (retStr);
}

/*
 *  ======== _restorePackages ========
 */
function _restorePackages(inst, searchPkgs, destPkgs, destRepo, verify)
{
    var notFoundPkgs = [];

    for each (var p in destPkgs) {
        if (!p.length) {
            continue;
        }
        pkg = ("" + p).split("[");
        var vers = pkg[1].substr(0, pkg[1].length - 1);
        var found = false;
        for each (var s in searchPkgs) {
            var sPkg = s.split(';');
            if (sPkg[PACKAGE_INDEX] == pkg[0] &&
                sPkg[VERSION_INDEX] == vers) {
                var str = java.lang.String(sPkg[FILE_INDEX]);
                if (_isAnArchive(sPkg[FILE_INDEX])) {

                    if (!verify) {
                        _deletePkgIfItExists(inst, sPkg[PACKAGE_INDEX],
                                             destRepo);
                        extractArchiveContents(inst, sPkg[FILE_INDEX],
                                                destRepo);
                    }
                }
                else {
                    if (!verify) {
                        _copyPackage(inst, sPkg[REPO_INDEX], destRepo,
                                     pkg[0]);
                    }
                }
                found = true;
                break;
            }
        }
        if (!found) {
            notFoundPkgs.push(p);
        }
    }
    return (notFoundPkgs);
}

/*
 *  ======== _parseRepoIds ========
 *
 */
function _parseRepoIds(idsArg)
{
    var idsArr = [];
    idsArg = "" + idsArg;
    if (idsArg.indexOf(',') != -1) {
        var tmpArr = idsArg.split(',');
        for each (var id in tmpArr) {
            var val = parseInt(id);
            if (!isNaN(val)) {
                idsArr.push(val);
            }
            else {
                idsArr = [];
                break;
            }
        }
    }
    else if (idsArg.indexOf('-') != -1) { 
        var tmpArr = idsArg.split('-');
        if (tmpArr.length == 2) {
            var val1 = parseInt(tmpArr[0]);
            var val2 = parseInt(tmpArr[1]);
            if (!isNaN(val1) && !isNaN(val2)) {
                for (var id = val1; id <= val2; id++) {
                    idsArr.push(id);
                }
            }
        }
    }
    else {
        var val = parseInt(idsArg);
        if (!isNaN(val)) {
            idsArr.push(val);
        }
    }
    return (idsArr);
}

/*
 *  ======== _mapRepoIds ========
 *
 */
function _mapRepoIds(pkgList, repoIds)
{
    var error = false;
    var newPkgList = "";

    /* match repository ids to array indices */
    var pkgsArr = pkgList.split('\n');
    var foundPkgsArr = [];
    for each (var id in repoIds) {
        if (id >= 0 && id < pkgsArr.length) {
            foundPkgsArr.push(pkgsArr[id]);
        }
        else {
            newPkgList = ERROR_FLAG_STR + "repository id out of range";
            error = true;
            break;
        }
    }
    if (!error) {
        newPkgList = foundPkgsArr.join('\n');
    }
    return (newPkgList);
}



/*
 *  ======== _listArPackages ========
 *
 *  for diagnostic use only
 *
 */
function _listArPackages(inst, arFile)
{
    var entry;
    var name;

    var fileType = _getFileType(arFile);
    if (fileType != TAR_FILETYPE && fileType != TARGZ_FILETYPE
        && fileType != ZIP_FILETYPE) {

        inst.cmdr.warning("Invalid file: " + arFile);
        return;
    }

    var streams = _getInputStreams(arFile, fileType);
    var inputStream = streams.inputStream;
    while ((entry = inputStream.getNextEntry()) != null) {
        //if (entry.getName().matches(".*/package.xdc$|.*/package.bld$")) {
        name = entry.getName();
        if (name.endsWith("/package.xdc") || name.endsWith("/package.bld")) {
            java.lang.System.out.println("entry: " + name);
        }
    }
    _closeInputStreams(streams);
}

/*
 *  ======== createRepoXmlFile ========
 */
function createRepoXmlFile(repo, attrs)
{
    var status = '';
    if (attrs.providerId != null) {
        var providerId = attrs.providerId;
    }
    else {
        /* default providerId will be parent of repository */
        var dfile = java.io.File(repo);
        var path = String(dfile.getCanonicalPath());
        var name = String(dfile.getName());
        path = path.substr(0, path.length - name.length);
        var providerId = String(java.io.File(path).getName());
    }
    var filename = java.io.File(repo).getCanonicalPath() + '/' + REPOXML_FILE;
    var file = java.io.File(filename);
    try {
        var doc = <repository/>;
        doc.@name = java.io.File(repo).getName();
        doc.@providerId = providerId;
        doc.@writable = attrs.writable;

        /* save the doc to file */
        var toFile = java.io.RandomAccessFile(file, "rwd");
        toFile.setLength(0);
        toFile.writeBytes(doc.toXMLString());
        toFile.close();
    }
    catch (e) {
        status = 'Error creating ' + filename + ': ' + e.message;
    }
    return (status);
}

/*
 *  ======== setRepoProviderId ========
 */
function setRepoProviderId(repo, provId)
{
    var status = '';
    var filename = java.io.File(repo).getCanonicalPath() + '/' + REPOXML_FILE;
    var file = java.io.File(filename);
    if (file.exists()) {
        try {
            var doc = xdc.loadXML(filename);
            doc.@providerId = provId;

            /* save the doc to file */
            var toFile = java.io.RandomAccessFile(file, "rwd");
            toFile.setLength(0);
            toFile.writeBytes(doc.toXMLString());
            toFile.close();
        }
        catch (e) {
            status = e.message;
        }
    }
    else {
        status = filename + ' does not exist';
    }
    return (status);
}

/*
 *  ======== getRepoXmlItems ========
 */
function getRepoXmlItems(repo)
{
    var providerId = '';
    var writable = false;
    var origProviderId = [];

    var filename = java.io.File(repo).getCanonicalPath() + '/' + REPOXML_FILE;
    if (java.io.File(filename).exists()) {
        try {
            var doc = xdc.loadXML(filename);
            providerId = String(doc.@providerId);
            if (!providerId) {
                providerId = '';
            }
            writable = (doc.@writable == "true") ? true : false;
            var pkg = doc..pkg;
            if (pkg.length()) {
                for (var i = 0; i < pkg.length(); i++) {
                    origProviderId[String(pkg[i].@name)] =
                            String(pkg[i].@originalProviderId);
                }
            }
        }
        catch (e) {
            print('exception' + e);
        }
    }
    if (!providerId.length) {
        providerId = _getBundleFromRepo(repo);
    }
    return {
        providerId     : providerId,
        writable       : writable,
        origProviderId : origProviderId
    };
}

/*
 *  ======== _getBundleFromRepo ========
 */
function _getBundleFromRepo(repo)
{
    var repoFile = java.io.File(repo);
    var path = String(repoFile.getCanonicalPath());
    var name = String(repoFile.getName());
    path = path.substr(0, path.length - name.length);
    return (String(java.io.File(path).getName()));
}

/*
 *  ======== isRepositoryWritable ========
 */
function isRepositoryWritable(repo)
{
    var writable = false;
    var filename = java.io.File(repo).getCanonicalPath() + '/' + REPOXML_FILE;
    if (java.io.File(filename).exists()) {
        try {
            var doc = xdc.loadXML(filename);
            if (doc.@writable == "true") {
                writable = true;
            }
        }
        catch (e) {
        }
    }
    if (!writable) {
        if (java.io.File(repo).exists() &&
            java.io.File(repo).listFiles().length == 0) {

            writable = true;
        }
    }
    return (writable);
}

/*
 *  ======== _extractPackageFromBundle ========
 *
 */
function _extractPackageFromBundle(inst, arFile, fileType, repoName, pkgName,
                                   destDir)
{
    var name;
    var entry;
    var status = "";
    var pkgEntry = _getBundlePackageDirEntry(arFile, fileType, repoName,
                                             pkgName);
    if (pkgEntry != null) {

        /* extract package directory to temp dir */
        /* then copy the package to dest dir     */

        var tmpdir = Packages.xdc.services.global.Host.tmpdir();
        var streams = _getInputStreams(arFile, fileType);
        var inputStream = streams.inputStream;
        var ar = Packages.xdc.tools.repoman.Archive();
        var pkgPre = String(pkgEntry.getName()).replace(/\\/g, '/');
        pkgPre = pkgPre.replace(/\/+$/, '');
        pkgPre = pkgPre.substr(0, pkgPre.length - pkgName.length);

        while ((entry = inputStream.getNextEntry()) != null) {
            if (entry.isDirectory()) {
                continue;
            }
            name = entry.getName();
            if (java.lang.String(name).startsWith(pkgEntry.getName())) {
                name = String(name).substr(pkgPre.length); /* strip prefix */
                var destFile = java.io.File(tmpdir, name);
                destFile.getParentFile().mkdirs();
                var fout = java.io.FileOutputStream(destFile); 
                if (fileType != ZIP_FILETYPE) {
                    inputStream.copyEntryContents(fout);
                }
                else {
                    ar.copyEntryContents(inputStream, fout);
                }
                fout.close();
            }
        }
        _closeInputStreams(streams);
        status = _copyPackage(inst, tmpdir, destDir, pkgName)
        var tmpdirFile = java.io.File(tmpdir);
        _deleteDirectoryContents(inst, tmpdirFile);
        tmpdirFile['delete']();
    }
    else {
        status = "Package " + pkgName + " not found";
    }
    return (status);
}


/*
 *  ======== _getBundlePackageDirEntry ========
 *
 */
function _getBundlePackageDirEntry(arFile, fileType, repoName, pkgName)
{
    var entry;
    var entryName;
    var pkgEntry = null;
    var entries = [];
    var testStr = '/' + repoName.replace(/\\/g, '/') + '/' +
                  pkgName.replace(/\./g, '/');

    var streams = _getInputStreams(arFile, fileType);
    var inputStream = streams.inputStream;
    while ((entry = inputStream.getNextEntry()) != null) {
        if (entry.isDirectory()) {
            entryName = String(entry.getName()).replace(/\\/g, '/');
            entryName = entryName.replace(/\/+$/, '');
            if (entryName.length >= testStr.length) {
                if (testStr == entryName.substr(0 - testStr.length)) {
                    entries.push({name : entryName, entry : entry});
                }
            }
        }
    }
    _closeInputStreams(streams);
    if (entries.length > 0) {
        if (entries.length == 1) {
            pkgEntry = entries[0].entry;
        }
        else {       /* get the shortest named entry, to eliminate */
                     /* repos containing directory separators      */
            var min = 0;
            for (var i = 1; i < entries.length; i++) {
                if (entries[i].name.length < entries[i - 1].name.length) {
                    min = i;
                }
            }
            pkgEntry = entries[min].entry;
        }
    }
    return (pkgEntry);
}


/*
 *  ======== _extractPackagesFromBundle ========
 *
 */
function _extractPackagesFromBundle(inst)
{
    var status = '';
    var destDir = inst.repositoryArg;
    if (destDir == null) {
        destDir = '.';
    }
    else if (!java.io.File(destDir).exists()) {
        return("Destination repository " +
                java.io.File(destDir).getCanonicalPath() +
                NOT_FOUND_STR);
    }

    var srcDir = inst.pathArg;
    if (srcDir == null) {
        srcDir = '.';
    }
    else if (!java.io.File(srcDir).exists()) {
        return("Directory " +
               java.io.File(srcDir).getCanonicalPath() +
               NOT_FOUND_STR);
    }
    var bundleFile = inst.args[inst.args.length - 1];
    var fileType = _getFileType(bundleFile);
    if (fileType != TAR_FILETYPE && fileType != TARGZ_FILETYPE &&
        fileType != ZIP_FILETYPE) {

        return ("Invalid file: " + bundleFile);
    }

    if (isURL(bundleFile)) {
        if (!isValidURL(bundleFile)) {
            return ("Bundle " + bundleFile + NOT_RESOLVED_STR);
        }
    }
    else {
        if (!java.io.File(bundleFile).isAbsolute()) {
            bundleFile =
                java.io.File(srcDir, bundleFile).getCanonicalPath();
        }
        if (!java.io.File(bundleFile).exists()) {
            return("Bundle file " +
                   java.io.File(bundleFile).getCanonicalPath() +
                   NOT_FOUND_STR);
        }
    }

    var repoName = inst.bundleRepositoryArg;
    if (_getBundleRepositoryEntry(bundleFile, fileType, repoName) == null) {

        return("Repository " + repoName + " not found in " + bundleFile);
    }

    var hasWildcards = false;
    for (var i = 0; i < inst.args.length - 1; i++) {
        if (_containsWildcards(inst.args[i])) {
            hasWildcards = true;
            break;
        }
    }

    var extractPkgs = [];
    if (hasWildcards) {  /* must test all packages in repository */
        var pkgs = [];
        var ar = Packages.xdc.tools.repoman.Archive();
        var ret = ar.scan(bundleFile);
        if (ret == null) {
            var desc = ar.getDesc();
            for (var i = 0; i < desc.reposDesc.length; i++) {
                if (String(desc.reposDesc[i].repoName) == repoName) {

                    var repo = desc.reposDesc[i];
                    for (var j = 0; j < repo.pkgs.length; j++) {
                        pkgs.push(String(repo.pkgs[j]));
                    }
                    break;
                }
            }
        }
        else {
            return("Failed to retrieve package info for\n" +
                   bundleFile + ":\n" + ret);
        }

        /* look for matches in the args list */
        for each (var p in pkgs) {
            for (var i = 0; i < inst.args.length - 1; i++) {
                if (_containsWildcards(inst.args[i])) {
                    if (_wildMatch(inst.args[i], p)) {
                        extractPkgs.push(p);
                    }
                }
                else {
                     extractPkgs.push(inst.args[i]);
                }
            }
        }
        if (extractPkgs.length == 0) {
            return("Failed to find any matching packages");
        }
    }
    else {
        for (var i = 0; i < inst.args.length - 1; i++) {
            extractPkgs.push(inst.args[i]);
        }
    }
    for each (var p in extractPkgs) {
        try {
            status = _extractPackageFromBundle(inst, bundleFile, fileType,
                                               repoName, p, destDir);
        }
        catch (e) {
            status = 'Error extracting ' + p + ' from ' + bundleFile + ': ' +
                     e.message;
        }
        if (status.length) {
            break;
        }
    }
    return (status);
}



/*
 *  ======== _setPkgOriginalProviderId ========
 */
function _setPkgOriginalProviderId(repo, pkgName, origRepoXMLInf)
{
    var status = '';
    var filename = java.io.File(repo).getCanonicalPath() + '/' + REPOXML_FILE;
    var file = java.io.File(filename);
    if (file.exists()) {

        /* carry package's original if it exists, otherwise */
        /* use the repository's providerId                 */

        var origProvId = origRepoXMLInf.origProviderId[pkgName] ? 
                         origRepoXMLInf.origProviderId[pkgName] :
                         origRepoXMLInf.providerId;
        try {
            var doc = xdc.loadXML(filename);
            var pkg = doc.pkg.(@name == pkgName);
            if (pkg.length()) {
                pkg[0].@originalProviderId = origProvId;
            }
            else {
                var pkg = <pkg/>;
                pkg.@name = pkgName;
                pkg.@originalProviderId = origProvId;
                doc.appendChild(pkg);
            }
            /* save the doc to file */
            var toFile = java.io.RandomAccessFile(file, "rwd");
            toFile.setLength(0);
            toFile.writeBytes(doc.toXMLString());
            toFile.close();
        }
        catch (e) {
            status = e.message;
        }
    }
    else {
        status = filename + ' does not exist';
    }
    return (status);
}


/*
 *  ======== _removePkgOriginalProviderId ========
 */
function _removePkgOriginalProviderId(repo, pkgName)
{
    var status = '';
    var filename = java.io.File(repo).getCanonicalPath() + '/' + REPOXML_FILE;
    var file = java.io.File(filename);
    if (file.exists()) {
        try {
            var doc = xdc.loadXML(filename);
            var pkg = doc.pkg.(@name == pkgName);
            if (pkg.length()) {
                delete pkg[0];
                /* save the doc to file */
                var toFile = java.io.RandomAccessFile(file, "rwd");
                toFile.setLength(0);
                toFile.writeBytes(doc.toXMLString());
                toFile.close();
            }
        }
        catch (e) {
            status = e.message;
        }
    }
    return (status);
}
/*
 *  @(#) xdc.tools.repoman; 1, 0, 0,0; 1-9-2017 12:51:52; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

