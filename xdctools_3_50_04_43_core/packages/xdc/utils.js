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
/**
 *  ======== utils ========
 *
 *  utils is a global object that that encapsulates several utility
 *  functions useful in the startup script.  By placing these functions
 *  in the utils object, we minimize the chance of name conflicts with
 *  other scripts.
 *<P>
 *  These functions often take advantage of "environment" variable
 *  settings made by the tconf runtime:<P>
 *<DD>  config.rootDir      - root directory of the tconf support
 *<DD>  config.path         - path used to locate tconf components
 *<P>
 *  The following environment variables are optionally specified on the
 *  command-line of tconf:<P>
 *<DD>  config.importPath   - path used to search for imported files
 *
 *  @see none
 *
 */
var utils = {};

/*
 *  ======== utils.csd ========
 *  The current script directory.
 *
 *  utils.csd is always the directory of the script file that is currently
 *  being loaded; at any point in time there is always exactly one script
 *  file that is loading.  Note that this file is not necessarily the same
 *  as the file containing the function currently executing.
 *
 *  During the load of a script, the script can refer to its location and
 *  posibly load/read/write files relative to this location.  When a
 *  function defined by the script runs, however, the directory of currently
 *  loading script (utils.csd) may not be the directory of the script where
 *  the function is defined.
 *
 *  utils.csd is initialized by utils.init() below and is set to the
 *  directory containing the script being loaded just prior to loading the
 *  script and restored to its previous value after the loading completes.
 *
 *  utils.csd always ends with a directory separator so that clients can
 *  simply append this string to the beginning of a relative path to obtain
 *  an absolute path; there is no need for clients to use a host platform
 *  specific directory separator.
 */
utils.csd = "./";

/*
 *  ======== utils.cwd ========
 *  The current working directory.
 *
 *  utils.cwd is the beginning point for file searches using the
 *  utils.findFile() function, when the path name begin with "./".
 *
 *  The initial value of utils.cwd is the Java current working directory,
 *  which is a global constant within each JVM invocation.
 *
 *  utils.cwd always ends with a directory separator so that clients can
 *  simply append this string to the beginning of a relative path to obtain
 *  an absolute path.
 */
utils.cwd = environment['user.dir'].replace(/\\/g, "/") + "/";

/*
 *  ======== utils.global ========
 *  Save the top-most object.  This object is the "global" object that
 *  contains all variables defined at the top level of the shell.
 */
utils.global = this;

/*
 *  ======== utils.global.$trace ========
 *  $trace must be available whenever a script is evaluated. This function
 *  is called from within scripts evaluated through load() and from within
 *  templates. Capsules get $trace attached to them, and that version masks
 *  the global $trace function.
 *  Whenever a Rhino evaluation function is invoked, $tracePath has to be set
 *  if this version of $trace is not masked.
 */
utils.global.$tracePath = "utils.tci";
utils.global.$trace = function(inMsg, level, groups) {
    var msg = utils.global.$tracePath + ": " + inMsg;
    var pkg = utils.global.$tracePath.replace(/\//g, ".");
    if (!level) {
        level = 0;
    }
            
    var groupsArr;
    if (!groups) {
        groupsArr = ["all"];
    }
    else if (typeof(groups) == "string") {
        groupsArr = [groups, "all"];
    }
    else if (groups instanceof Array) {
        groups.push("all");
        groupsArr = groups;
    }
    utils._tracePrint(msg, utils.global.$tracePath, pkg, groupsArr, level);
};

/*
 *  ======== utils.hasReportedError ========
 *  The replacement for config.hasReportedError.
 */
utils.hasReportedError = function()
{
    var cx = Packages.org.mozilla.javascript.Context.getCurrentContext();
    var er = cx.getErrorReporter();
    return (er.hasReportedError());
};

/*
 *  ======== utils.loadedFiles ========
 *  This table maintains all files that have been loaded.
 */
utils.loadedFiles = {};

/* If a user creates a variable 'load', it would break utils.load(), which
 * calls load(). To avoid that problem, utils.load() calls utils.$$load().
 */
utils.$$load = load;

/**
 *  ======== utils.compareFiles ========
 *  Compare two files and return true iff they are equal.
 */
utils.compareFiles = function(file, gold)
{
    var status = true;

    var f, g;
    try {
        f = new java.io.BufferedReader(new java.io.FileReader(file));
        g = new java.io.BufferedReader(new java.io.FileReader(gold));
    }
    catch (e) {
        return (false);
    }

    do {
        var fline = f.readLine();
        var gline = g.readLine();
        if (("" + fline) != ("" + gline)) { // add "" to force string compare
            status = false;
            break;
        }
    } while (fline != null && gline != null);

    if (fline != null || gline != null) {
        status = false;
    }

    f.close();      /* close the files so we can delete them as necessary */
    g.close();

    return (status);
};

/**
 *  ======== utils.deprecate ========
 */
utils.deprecate = function(name)
{
    print("remark: the function '" + name + "' has been deprecated.");
};

/**
 *  ======== utils.evaluateScript ========
 *  Evaluate an XS script provided as an argument
 *
 *  @param   script - String containing the 'XS' script to be evaluated
 *
 *  @return  none
 *
 *  @throws  'Error' exception in case of errors in interpreting the
 *           script.
 */
utils.evaluateScript = function(script)
{
    try {
        var cx = Packages.org.mozilla.javascript.Context.getCurrentContext();
        var rdr = new java.io.BufferedReader(new java.io.StringReader(script));
        Packages.config.Shell.evaluateLoad(cx, utils.global, rdr, "", 1);
    }
    finally {
        rdr.close();
    }
};

/**
 *  ======== utils.exec ========
 *  Execute an arbitrary shell command and optionally put output
 *  into a file.  Both stderr and stdout are combined into a single output
 *  stream.
 *
 *  @command        command string to execute
 *
 *  @param attrs    optional set of attributes used to control the
 *                  environment of the command:<P>
 *<DD>                  envs    - array of environment variable settings
 *<DD>                  cwd     - the command's current working directory
 *<DD>                  outName - the name of the output file to create; if
 *                                the file exists, output is appended to the
 *                                end of the file.
 *                      filter  - regular expression used to filter command
 *                                output
 *
 *  @param status   optional output parameter: if non-null, the following
 *                  fields are set:<P>
 *<DD>                  output - string containing all output from command
 *<DD>                  exitStatus - exit status of the command
 *
 *  @return command's exit status
 */
utils.exec = function(command, attrs, status)
{

    /* WARNING: loading xdc.tci and calling xdc functions induces circularity
     * between utils and xdc objects. That may not be too important unless we
     * ever decide to release Tconf without XDC ever again.
     * XDC users should move to xdc.exec, but there is no deprecation notice
     * here as of now, because there may be some more 5.xx releases, in which
     * Tconf scripts are used. Tconf scripts have utils object available, but
     * not xdc, so a deprecation warning would be confusing.
     */

    utils.importFile("xdc/xdc.tci");
    return (xdc.exec(command, attrs, status));
};

/**
 *  ======== utils.findFile ========
 *
 *  Find the file name fileName along the path specified by
 *  <CODE>path</CODE>.  If no path is specified, findFile looks
 *  along the path ".;config.path;config.rootDir/include;
 *  config.rootDir/packages;config.importPath".
 *
 *  If fileName is absolute or begins with the string "./", then path is
 *  ignored and findFile returns null if the (as specified) file does not
 *  exist; otherwise it simply returns the file's name.
 *
 *  @param fileName name of file to locate
 *
 *  @param path optional path to use to search for fileName.  If no path
 *              is specified, a default path of
 *              ". config.path config.rootDir/include config.rootDir/packages"
 *              is used, where config.path and config.rootDir are defined by
 *              tconf.
 *
 *  @param pathSep optional character separating directories in path.  If
 *                 not specified pathSep defaults to the path separator
 *                 defined by the Java runtime: path.separator.
 *
 *  @return full path name of file found along path; otherwise
 *          null
 *
 *  @see tconf
 */
utils.findFile = function (fileName, path, pathSep)
{
    var fileSep = environment["file.separator"];

    if (fileName == null || fileName == "") {
        return (null);
    }

    var file = new java.io.File(fileName);

    /* if file name is absolute, don't search path */
    if (file.isAbsolute()) {
        return (file.exists() ? (file.getPath() + "") : null);
    }

    /* ensure that fileName is a javascript string */
    fileName = String(fileName);

    /* if file name starts with "./", use utils.cwd */
    if (fileName[0] == '.'
            && (fileName[1] == '/' || fileName[1] == '\\')) {
        file = new java.io.File(utils.cwd, fileName);
        return (file.exists() ? (file.getPath() + "") : null);
    }

    /* if path separator is not supplied, assume host OS's default  */
    if (pathSep == null) {
        pathSep = environment["path.separator"];
    }

    /* if path argument is not supplied, create a default path */
    if (path == null) {
        path = "." + pathSep + environment["config.path"]
                + pathSep + environment["config.rootDir"] + "/include"
                + pathSep + environment["config.rootDir"] + "/packages";
        var imp = environment["config.importPath"];
        if (imp != null) {
            path += pathSep + imp.replace(/\s*;\s*/g, pathSep);
        }
    }

    /* search along path for specified file */
    var dirArray = path.split(pathSep);
    for (var i = 0; i < dirArray.length; i++) {
        var dir = (dirArray[i] == ".") ? utils.cwd : dirArray[i];
        file = new java.io.File(dir, fileName);
        if (file.exists()) {
            return (file.getCanonicalPath() + "");   /* + "" makes a JavaScript string*/
        }
    }

    /* if file is not found, return null */
    return (null);
};

/**
 *  ======== utils.findPkgFile ========
 *
 *  Created qualified file name (concat package name with file name and
 *  replace '.' with '/') and then call utils.findFile() to find the file.
 *
 *  @param pkgName name of package containing fileName
 *
 *  @param fileName name of file to locate
 *
 *  @param path optional path to use to search for fileName
 *
 *  @param pathSep optional character separating directories in path
 *
 *  @return full path name of file found along path; otherwise null
 *
 *  @see tconf
 */
utils.findPkgFile = function(pkgName, fileName, path, pathSep)
{
    if (pkgName == undefined) {
        return (null);
    }

    var base = utils.findFile(pkgName.replace(/\./g, '/') + '/' + fileName);
    if (base == null) {
        return (null);
    }

    var apath = java.io.File(base).getAbsolutePath() + "";
    apath = apath.replace(/\\/g, "/");

    return (apath);
};

/**
 *  ======== utils.importFile ========
 *  Load the specified script.  If the script file name is a relative
 *  path, utils.importFile searches for the file along the path:
 *
 *      utils.csd;config.importPath;config.rootDir/include;
 *      config.rootDir/packages
 *
 *  where utils.csd is the directory containing the script that calls
 *  utils.importFile, config.importPath is the path specified on the
 *  tconf command line, "config.rootDir/include" is the include
 *  sub-directory of the tconf installation directory, and
 *  "config.rootDir/packages" is the packages repository of the xdc
 *  installation directory.
 *
 *  If pathPrefix is defined, the following path is used:
 *
 *      pathPrefix;config.rootDir/include;config.rootDir/packages
 *
 *  If neither pathPrefix nor config.importPath is defined the path
 *  defaults to:
 *
 *      utils.csd;config.rootDir/include;config.rootDir/packages
 *
 *  If the file name specified does not have an extension (e.g.,
 *  "foo") and is not found along the path, the extensions ".tci"
 *  and ".js" are successively appended to the file name and the
 *  search is repeated.
 *
 *  @param fileName name of the script to load
 *  @param pathPrefix optional search path (directories separated with ';')
 *  @param silent optional flag if false (or undefined), throw exception on
 *                 error; otherwise return error string
 *  @param status optional object if non-null, status.name is set to the file
 *              name imported.
 *  @return string error message on error; otherwise null
 */
utils.importFile = function (fileName, pathPrefix, silent, status)
{
    var tmp;
    var path = utils.csd;
    var err = null;

    /* build up path from arguments, importPath and rootDir/include */
    if (pathPrefix != null) {
        path = pathPrefix;
    }
    else if (environment["config.importPath"] != null) {
        path += ";" + environment["config.importPath"];
    }
    if (environment["config.rootDir"] != null) {
        path += ";" + environment["config.rootDir"] + "/include";
        path += ";" + environment["config.rootDir"] + "/packages";
    }

    utils._tracePrint("importFile: searching for " + fileName
        + " along the path: " + path, "utils.tci");

    /* look for file along path */
    if ((tmp = utils.findFile(fileName, path, ";")) == null) {
        err = "Can't find import file: '" + fileName
                + "' (not found along '" + path + "')";

        /* if fileName doesn't have an extension, try suitable extensions */
        if (String(fileName).match(/.*\.(\w*)$/) == null) {
            if ((tmp = utils.findFile(fileName + ".tci", path, ";")) != null
                || (tmp = utils.findFile(fileName+".js", path, ";")) != null) {
                err = null;
            }
        }
    }

    if (tmp != null) {
        /* the file was found, so load it up! */
        utils.load(tmp);
    }
    else {
        if (silent == null || silent == false) {
            throw new Error(err);
        }
    }

    /* return loaded file name, if requested */
    if (status != null) {
        status.name = tmp;
    }

    return (err);
};

/*
 *  ======== utils.importPkgFile ========
 */
utils.importPkgFile = function(pkgName, fileName, sflg)
{
    utils.importFile(pkgName.replace(/\./g, '/') + '/' + fileName, null, sflg);
};

/**
 *  ======== utils.init ========
 *  Initialize the utils package.  This function is called implicitly when
 *  loading utils.tci.
 *
 *  @param void
 *
 *  @return void
 */
utils.init = function ()
{
    /* remove leading and trailing spaces from the import path so that
     * path searches don't have inadvertent spaces in file names
     */
    var imp = environment["config.importPath"];
    if (imp != null) {
        environment["config.importPath"] = imp.replace(/\s*;\s*/g, ";");
    }

    /* initialize the "current script directory", it must end with the
     * directory separator
     */
    utils.csd = environment["user.dir"] + '/';
};

/*
 *  ======== utils.load ========
 *  Load the specified script if it has not already been loaded.  No
 *  searching is performed by this function.
 *
 *  Note: All script loads must come through this function; we track the
 *  current script directory here and a "rogue" load will spoof
 *  utils.loadFile's ability to locate files relative to the current script.
 */
utils.load = function (name)
{
    /* only load a file once */
    var uname = "" + (new java.io.File(name)).getCanonicalPath();
    if (utils.loadedFiles[uname] == null) {
        utils.loadedFiles[uname] = String(name);

        /* load it using the built-in load function */
        var save = utils.csd;
        utils.csd = uname.substr(0, uname.replace(/\\/g, '/').lastIndexOf('/')) + '/';
        var pathSave = utils.global.$tracePath;
        utils.global.$tracePath = uname;
        utils.$$load(uname);
        utils.global.$tracePath = pathSave;
        utils.csd = save;
    }
};

/*
 *  ======== utils.loadCapsule ========
 *  Load capsule specified by fname
 *
 *  @param  fname - string file name of the capsule to be loaded.  The actual
 *                  file used is determined as follows:
 *                      1. If fname is an absolute path or begins with "./"
 *                         and exists, fname is used directly
 *                      2. If fname is a relative path that does not start
 *                         with "./", then the following directories are
 *                         searched in order:
 *                            1. the current script directory (see utils.csd())
 *                            2. the directories specified by the XDC package
 *                               path
 *
 *  @param  noTrack - if true, don't record this capsule in the list of
 *                    loaded files
 *
 *  @param  searchPath - if set, the file is searched for on the supplied
 *                       path
 *
 *  @return capsule object
 *
 *  @throws  an Error exception if fname can not be found, or
 *      Exceptions due to syntax errors in the loaded capsule
 */
utils.$$capmap = {};
utils.loadCapsule = function(fname, noTrack, searchPath)
{
    /* get the package path from the local environment */
    var xdcpath = environment['xdc.path'];

    /* if not set in the local environment, derive it */
    if (xdcpath === undefined) {
        /* use a temp instance of Env to compute the package path */
        var env = new Packages.xdc.services.global.Env(environment);
        xdcpath = env.curpath();

        /* undo the side-effect of setting xdc.path property, to avoid
         * prematurely fixing the value of "^".
         */
        env.properties.remove('xdc.path');
    }

    var spath = utils.csd + ';' + xdcpath;
    if (searchPath != null) {
        spath = searchPath;
    }

    utils._tracePrint("loadCapsule: searching for " + fname
        + " along the path: " + spath, "utils.tci");

    var path = utils.findFile(fname, spath, ';');
    if (path == null) {
        throw new Error("utils.loadCapsule: can't find '" + fname
            + "' along the path '" + spath + "'");
    }

    var file = new java.io.File(path);
    var cname = "" + file.getCanonicalPath();
    if (!file.isFile()) {
        throw new Error("utils.loadCapsule: can't load capsule file '" + cname
            + "': it's not an ordinary file");
    }
    var cap = utils.$$capmap[cname];
    if (!cap) {
        /* make sure that we record the fact that we depend on this capsule */
        if (!noTrack) {
            utils.loadedFiles[cname] = path;
        }

        /* setup utils.csd */
        var oldcsd = utils.csd;
        utils.csd = file.getParentFile().getCanonicalPath();

        /* create the capsule object */
        cap = {
            prototype:  utils.global,
            $path:      cname,
            $private:   {path: cname},
            $capsule:   undefined      /* set to cap below */
        };
        /* 'this.$capsule' is always cap object; even if 'this' is a Module */
        cap.$capsule = cap;

        /* set-up trace infrastructure */
        cap.$trace = function(inMsg, level, groups) {
            var msg = this.$capsule.$path + ": " + inMsg;
            var pkg = this.$capsule.$path.replace(/\//g, ".");
            if (!level) {
                level = 0;
            }
            
            if (!groups) {
                var groupsArr = ["all"];
            }
            else if (typeof(groups) == "string") {
                groupsArr = [groups, "all"];
            }
            else if (groups instanceof Array) {
                groups.push("all");
                groupsArr = groups;
            }
            
            utils._tracePrint(msg, this.$capsule.$path, pkg, groupsArr, level);
        };
        cap.$traceQuery = function(groups, lvl) {
       	    if (lvl && utils.trace.level < lvl) {
       	    	/* default message level is 0 */
                return (false);
            }

            if (utils._traceQuery(this.$capsule.$path, "capsule")) {
                return (true);
            }
            else if (utils._traceQuery(this.$capsule.$path.replace(/\//g, "."),
            	"package")) {
                return (true);
            }
            else if (groups) {
            	if (typeof(groups) == "string") {
            	    return (utils._traceQuery(groups, "group"));
            	}
            	else {
            	    for (var i = 0; i < groups.length; i++) {
                        if (utils._traceQuery(groups[i], "group")) {
                            return (true);
                        }
                    }
                }
            }
            return (false);
        };

        /* load the capsule */
        try {
            var cx = Packages.org.mozilla.javascript.Context.getCurrentContext();
            var rdr = new java.io.BufferedReader(new java.io.FileReader(cname));
            Packages.config.Shell.evaluateLoad(cx, cap, rdr, cname, 1);
        }
        finally {
            
            /* Close stream */
            if (rdr) {
                rdr.close();
            }
        
            /* restore the current script directory */
            utils.csd = oldcsd;

            /* save the capsule object */
            utils.$$capmap[cname] = cap;
        }

    }

    return (cap);
};

/**
 *  ======== utils.saveFile ========
 *  Save string to a file only if the string differs from what is
 *  already in the file.
 *
 *  @param content the contents of the file to save (in a string)
 *  @param fileName the name of the file to create/update (if necessary)
 *  @return true if the file was not updated; otherwise false
 */
utils.saveFile = function (content, fileName)
{
    return (Packages.xdc.services.intern.xsr.Utils.saveFile(content, fileName));
};

/**
 *  ======== utils.toHex ========
 *  Convert a number to hexadecimal string.  This function should be
 *  called in-lieu of toString(16) since ECMA states that different
 *  implementations of toString() may return different strings when the
 *  radix is not 10.
 *
 *  @param num number to convert
 *
 *  @return string string representation of num beginning with the
 *                 characters '0x'.
 *
 *  @see tconf
 */
utils.toHex = function (num)
{
    if (typeof num != "number") {
        throw new Error("utils.toHex passed a non-number ('" + num + "')");
    }

    /* make positive and integral */
    var sign = num < 0 ? -1 : 1;
    num = Math.floor(sign * num);

    if (num == 0) {
        return ("0x0");
    }

    /* generate one digit at a time */
    for (var hex = ""; num > 0; num = Math.floor(num / 16)) {
        var digits = "0123456789abcdef";
        hex = digits[num % 16] + hex;
    }

    return ((sign < 0 ? "-0x" : "0x") + hex);
};

/*
 *  ======== genDep ========
 *  Generate dependency files determined by running a program configuration
 *  script.  In particular, generate the following files:
 *      1. base.dep - goals base.c base.h base.xdl: all files in list
 *      2. base.inc - list of all files in list one per line for tar -I
 *
 *  Note that these files are not modified if their contents do not change.
 *  And files not in the current working directory (or below) are ignored.
 */
utils.genDep = function (base, pkgName, list, content, goals)
{
    goals = goals == null ? "" : (goals + " ");

    var cout = "#\n# The following is generated by utils.genDep for "
        + base + "\n#\n";
    var ilist = [];     /* list of dependencies in this package */
    var elist = [];     /* list of dependencies external to this package */

    /* separate files not in (or below) the current working directory */
    /* BUG: we should really be separating files into those that are in this
     * package and those that are not (including those in nested packages!).
     */
    var cwd = (new java.io.File(".")).getCanonicalPath()
                + java.io.File.separator;
    for (var fname in list) {
        var tmp = "" + (new java.io.File(fname)).getCanonicalPath();
        if (tmp.indexOf(cwd) == 0) {
            ilist[ilist.length] = tmp.substring(cwd.length).replace(/\\/g, "/");
        }
        else {
            elist[elist.length] = tmp.replace(/\\/g, "/").replace(/ /g, "\\ ");
        }
    }

    /* sort loaded files lists to ensure canonical output */
    ilist.sort();
    elist.sort();

    if ((ilist.length + elist.length) > 0) {
        /* generate dependencies on loaded files */
        cout += goals + base + ".c " + base + ".h " + base + ".xdl:";
        for (var i = 0; i < ilist.length; i++) {
            cout += ilist[i] + " ";
        }
        for (var i = 0; i < elist.length; i++) {
            cout += elist[i] + " ";
        }
        cout += "\n\n";
    }

    /* generate "empty" rules for external includes */
    if (elist.length > 0) {
        for (var i = 0; i < elist.length; i++) {
            /*
             *  This rule causes make to re-make any goal that depends on
             *  this file *if* make can not find the file; no rule
             *  causes make to believe that the file is updated, forcing
             *  any file that depends on these to be re-built. Rebuilding
             *  the *.c file re-runs the configuration which, in turn,
             *  re-generates the list of dependencies!
             */
            cout += elist[i] + ":\n";
        }
        cout += "\n\n";
    }

    /* add optional content */
    cout += content == null ? "" : content;

    /* generate the makefile dependency file */
    utils.saveFile(cout, base + ".dep");

    /* generate a tar include file */
    cout = "";
    for (var i = 0; i < ilist.length; i++) {
        cout += ilist[i] + "\n";
    }

    /* if inc file exists and is identical to cout, don't overwrite it */
    utils.saveFile(cout, base + ".xdc.inc");
};

/*  ----------------- trace support -----------------------------------  */

/*
 *  ======== utils.trace ========
 *
 *  This structure contains the list of capsules, packages and groups for
 *  which the trace is enabled. The trace is also filtered by the value of
 *  'level'. All trace statements marked with a number lower or equal to the
 *  current 'level', and belonging to one of the enabled trace categories,
 *  are printed.
 */
utils.trace = {
    capsuleList : [],
    packageList : [],
    groupList   : [],
    level: 0,
    $maxLevel: 2
};

/*
 *  ======== utils.setTraceLevel ========
 *  Define how much trace is printed
 * 
 *  @param level	higher integer number passed as a parameter
 *			enables more trace statements
 */
utils.setTraceLevel = function(n)
{
    var cur = utils.trace.level;
    utils.trace.level = n;
    if (n > utils.trace.$maxLevel) {
        utils.trace.level = utils.trace.$maxLevel;
    }
    else if (n < 0) {
        utils.trace.level = 0;
    }
    return (cur);
};


/*
 *  ======== utils.traceCapsuleEnable ========
 *  Add a list of patterns to the list that will be matched against 
 *  capsules calling $trace
 */
utils.traceCapsuleEnable = function(pat)
{
    if (!("length" in pat)) {
        print("Warning: utils.traceCapsuleEnable called with a non-array "
            + " argument. The function call is ignored.");
        return (undefined);
    } 

    var cur = [];
    for (var i = 0; i < utils.trace.capsuleList.length; i++) {
        cur[i] = utils.trace.capsuleList[i].source;
    }
    
    if (pat.length > 0) {
        utils.trace.capsuleList = [];
        for (var i = 0; i < pat.length; i++) {
            var rs = pat[i];
            if (rs.length > 0) {
                /* allow either Unix or Windows separators in match */
                rs = rs.replace(/(\/|\\)/g, "(\\/|\\\\)");
                rs = rs.replace(/\*/g, "(\\w|\.)*");
                rs = "\\.*" + rs + "(\\.\\w*)?$";
                utils.trace.capsuleList.push(RegExp(rs));
            }
        }
    }
    
    return (cur);
};

/*
 *  ======== utils.tracePackageEnable ========
 *  Add a list of patterns to the list that will be matched against 
 *  packages calling $trace
 */
utils.tracePackageEnable = function(pat)
{
    if (!("length" in pat)) {
        print("Warning: utils.tracePackageEnable called with a non-array "
            + " argument. The function call is ignored.");
        return (undefined);
    }

    var cur = [];
    for (var i = 0; i < utils.trace.packageList.length; i++) {
        cur[i] = utils.trace.packageList[i].source;
    }

    if (pat.length > 0) {
        utils.trace.packageList = [];
        for (var i = 0; i < pat.length; i++) {
            var rs = pat[i];
            if (rs.length > 0) {
                utils.trace.packageList.push(RegExp(rs));
            }
        }
    }
    
    return (cur);
};

/*
 *  ======== utils.traceGroupEnable ========
 *  Add a list of patterns to the list that will be matched against 
 *  groups calling $trace
 */
utils.traceGroupEnable = function(pat)
{
    if (!("length" in pat)) {
        print("Warning: utils.traceGroupEnable called with a non-array "
            + " argument. The function call is ignored.");
        return (undefined);
    } 

    var cur = [];
    for (var i = 0; i < utils.trace.groupList.length; i++) {
        cur[i] = utils.trace.groupList[i].source;
    }

    if (pat.length > 0) {
        utils.trace.groupList = [];
        for (var i = 0; i < pat.length; i++) {
            var rs = pat[i];
            if (rs.length > 0) {
                utils.trace.groupList.push(RegExp(rs));
            }
        }
    }

    return (cur);
};

/*
 *  ======== utils._traceQuery ========
 */
utils._traceQuery = function(term, mode)
{
    var prop = mode + "List";
    for (var i = 0; i < utils.trace[prop].length; i++) {
        if (term.search(utils.trace[prop][i]) != -1) {
            return (true);
        }
    }
    
    return (false);
};

/*
 *  ======== utils._tracePrint ========
 */
utils._tracePrint = function(msg, path, pkg, groups, msgLevel)
{
    if (utils.trace.level < msgLevel) {
        return;
    }
    
    if (utils._traceQuery(path, "capsule")) {
        var fmt = new java.text.SimpleDateFormat("hh:mm:ss.SSS a");
        /* The code that generates 'addMsg' is repeated three times, for each
         * traceQuery, for optimization reasons. When the trace is disabled,
         * that code is never run, which saves time.
         */
        var addMsg = "";
        if (groups != null) {
            addMsg += " (";
            for (var i = 0; i < groups.length; i++) {
                if (i != 0) {
                    addMsg += ", ";
                }
                addMsg += groups[i]; 
            }
            addMsg += ")";
        }
        print("TIME=" + fmt.format(new java.util.Date()) + " -- " + msg +
            addMsg);
        return;
    }
    if (pkg != null) {
        if (utils._traceQuery(pkg, "package")) {
            var fmt = new java.text.SimpleDateFormat("hh:mm:ss.SSS a");
            var addMsg = "";
            if (groups != null) {
                addMsg += " (";
                for (var i = 0; i < groups.length; i++) {
                    if (i != 0) {
                        addMsg += ", ";
                    }
                    addMsg += groups[i]; 
                }
                addMsg += ")";
            }
            print("TIME=" + fmt.format(new java.util.Date()) + " -- " + msg +
                addMsg);
            return;
        }
    }
    
    if (groups != null) {
        for (var i = 0; i < groups.length; i++) {
            if (utils._traceQuery(groups[i], "group")) {
                var fmt = new java.text.SimpleDateFormat("hh:mm:ss.SSS a");
                var addMsg = "";
                if (groups != null) {
                    addMsg += " (";
                    for (var j = 0; j < groups.length; j++) {
                        if (j != 0) {
                            addMsg += ", ";
                        }
                        addMsg += groups[j]; 
                    }
                    addMsg += ")";
                }
                print("TIME=" + fmt.format(new java.util.Date()) + " -- "
                    + msg + addMsg);
                return;
            }
        }
    }
};

/*
 *  ======== initialize utils ========
 */
utils.init();

/*
 *  Bind RTSC runtime to top-level scope (this scope may be a config.Shell
 *  or a org.mozilla.javascript.tools.Global object).
 */
try {
    tmp = utils.findFile("xdc/services/global/java");
    if (tmp != null) {
        addJars(tmp);
        if ((tmp = utils.findFile("xdc/services/intern/xsr/java")) != null) {
            addJars(tmp);
            Packages.xdc.services.intern.xsr.Global.setTopScope(this);
        }
        else {
            print("Warning: can't find xdc/services/intern/xsr/java");
        }
    }
    delete tmp;
}
catch (e) {
    print("utils.js: " + e);   /* we should never get here; should we fail?!?! */
}
/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:08; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

