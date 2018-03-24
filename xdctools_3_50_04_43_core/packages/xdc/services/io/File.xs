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
 *  ======== close ========
 */
function close()
{
    var priv = this.$private;

    if (priv.mode == "r") {
        priv.instr.close();
    }
    else {
        priv.outstr.flush();
        priv.outstr.close();
    }
}

/*
 *  ======== exists ========
 */
function exists(name)
{
    if (name == null) {
        print("Illegal filename: " + name);
        return (null);
    }

    var fd = new java.io.File(name);

    try {
        if (fd.exists()) {
            return (true);
        }
        else {
            return (false);
        }
    }
    catch(e) {
        throw new Error("File " + name + " cannot be accessed. "
                            + "Check file access permissions.");
    }
}

/*
 *  ======== getCanonicalPath ========
 */
function getCanonicalPath(name)
{
    /* make a Java abstract file */
    var file = java.io.File(name);

    /* make the filename absolute, convert string from Java to JavaScript */
    var absPath = file.getCanonicalPath() + "";

    /* convert any DOS backslashes to Unix forward slashes */
    var fwdPath = absPath.replace(/\\/g, '/');
    return (fwdPath);
}

/*
 *  ======== getDOSPath ========
 */
function getDOSPath(longPath)
{
    if (environment['xdc.hostOS'] != "Windows") {
        return (longPath);
    }
    var lib = this.$package.packageBase + "/release/Dos.dll";

    var shortPath = Packages.xdc.services.io.Dos.getPath(longPath, lib);
    if (shortPath == "") {
        return (longPath);
    }

    return (shortPath);
}
/*
 *  ======== getStream ========
 */
function getStream()
{
    if (this.$private.mode == "r") {
        return (this.$private.instr);
    }
    else {
        return (this.$private.outstr);
    }
}

/*
 *  ======== isDirectory ========
 */
function isDirectory(name)
{
    if (name == null) {
        print("Illegal filename: " + name);
        return (null);
    }

    var fd = new java.io.File(name);

    try {
        if (fd.isDirectory()) {
            return (true);
        }
        else {
            return (false);
        }
    }
    catch(e) {
        throw new Error("File " + name + " cannot be accessed. "
                            + "Check file access permissions.");
    }
}

/*
 *  ======== isFile ========
 */
function isFile(name)
{
    if (name == null) {
        print("Illegal filename: " + name);
        return (null);
    }

    var fd = new java.io.File(name);

    try {
        if (fd.isFile()) {
            return (true);
        }
        else {
            return (false);
        }
    }
    catch(e) {
        throw new Error("File " + name + " cannot be accessed. "
                            + "Check file access permissions.");
    }
}

/*
 *  ======== ls ========
 *  Return a list of all files in a specified root directory whose names
 *  match an optionally specified regular expression.
 
 *  Returns 'null' if the specified root directory doesn't exist.
 */
function ls(root, regExp)
{
    if (regExp == null) {
        regExp = /.*/;
    }

    /*
     *  ======== myFilter ========
     *  Return true if a file matches regExp; otherwise, return false.
     */
    function myFilter(dir, file)
    {
        return (file.match(regExp) != null ? true : false);
    }

    /* create the filter */
    var filter = java.io.FilenameFilter({accept : myFilter});

    /* get list of matching files */
    var file = new java.io.File(root);
    var jlist = file.list(filter);

    if (jlist == null) {
        return (null);
    }

    /* convert to array of JavaScript Strings */
    var list = [];
    for (var i = 0; i < jlist.length; i++) {
        list.push(String(jlist[i]));
    }

    return (list.sort());
}

/*
 *  ======== open ========
 */
function open(name, mode)
{

    var inst = this.create();

    var priv = inst.$private;

    if (name == null) {
        print("Illegal filename: " + name);
        return (null);
    }

    priv.fd = new java.io.File(name);
    priv.mode = mode;

    if (priv.mode == "r") {
        try {
            if (priv.fd.exists()) {
                var fr = new java.io.FileReader(priv.fd);
                priv.instr = new java.io.BufferedReader(fr);
                return (inst);
            }
            else {
                return (null);
            }
        }
        catch(e) {
            throw new Error("File " + name + " cannot be opened for reading. "
                            + "Check file access permissions.");
        }
    }

    else if (priv.mode == "w") {
        try {
            var fw = new java.io.FileOutputStream(priv.fd, false);
        }
        catch(e) {
            throw new Error("File " + name + " cannot be open for writing.");
        }
        priv.outstr = new java.io.PrintStream(fw);
        return (inst);
    }

    else if (priv.mode == "a") {
        try {
            var fw = new java.io.FileOutputStream(priv.fd, true);
        }
        catch(e) {
            throw new Error("File " + name + " cannot be open for writing.");
        }
        priv.outstr = new java.io.PrintStream(fw);
        return (inst);
    }

    else {
        throw new Error("Incorrect mode: " + priv.mode);
    }
}

/*
 *  ======== printf ========
 */
function printf(fmt, vargs)
{
    for (var i = 0; i < vargs.length; i++) {
        var a = vargs[i];
        if (typeof a == 'number' && Math.round(a) == a) {
            vargs[i] = new java.lang.Long(a);
        }
    }

    this.$private.outstr.printf(fmt, vargs);
}

/*
 *  ======== readLine ========
 */
function readLine()
{
    if (this.$private.mode != "r") {
        throw Error("File " + this.$private.fd.getName()
                    + " was not open for reading");
    }
    var output = null;
    var tmp = this.$private.instr.readLine();
    if (tmp != null) {
        output = "" + tmp;
    }

    return (output);
}

/*
 *  ======== writeLine ========
 */
function writeLine(out)
{
    this.$private.outstr.println(out);

    if (this.$private.outstr.checkError()) {
        return (false);
    }

    return (true);
}
/*
 *  @(#) xdc.services.io; 1, 0, 0,0; 11-8-2017 17:12:30; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

