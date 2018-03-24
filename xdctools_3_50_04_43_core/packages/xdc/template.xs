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
 *  ======== xdc.$$Template ========
 *  Template object
 */
xdc.$$Template = function( cname )
{
    this.cname = cname;
    this.fxn = xdc.$$Template._compile(cname);
};

/*
 *  ======== xdc.$$Template.genFile ========
 *  Template expansion function.  This function may also be called from 
 *  within a template to recursively expand another template.
 *
 *  Params
 *	outFileName name of the file to create/overwrite
 *
 *	thisObj	    the 'this' pointer available within the template
 *
 *	args	    array of objects that are available from within the
 *		    template via $args.
 *
 *	clobber	    optional boolean argument.  If true, outFileName is
 *		    always overwritten even if generated contents match
 *		    existing contents; otherwise outFileName is only
 *		    modified if the contents differ.
 *  Returns
 *	bool        true if outFileName was overwritten; otherwise false
 */
xdc.$$Template.prototype.genFile = function(outFileName, thisObj, args, clobber)
{
    var compare = false;
    var result = true;
    
    /* add outFileName to the list of generated files (for "xdc clean") */
    xdc.generatedFiles[outFileName] = outFileName;
    
    /* create a output file and any necessary parent directories */
    var ofile = new java.io.File(outFileName);
    var pdir;
    if ((pdir = ofile.getParentFile()) != null) {
	if (!pdir.exists() && !pdir.mkdirs()) {
	    throw new Error("template generation of '" + outFileName
	        + "' failed: can't create the directory '" + pdir + "'");
        }
    }
    
    /* create temp file for generation (unless we clobber) */
    var file = ofile;
    if (file.exists()) {
	if (clobber != true) {
	    file = new java.io.File(outFileName + ".tmp");
	    compare = true;
	}
	file["delete"]();
    }

    /* expand template into file */
    var fos = new java.io.FileOutputStream(file);
    var bos = new java.io.BufferedOutputStream(fos);
    var out =
        /* Unvalidated versions of Rhino 1.7R4 require that a specific
         * overloaded constructor is selected. We didn't have to do it before,
         * so it could be a bug in Rhino that will be fixed in the official
         * release.
         */
        new Packages.xdc.services.global.Out(bos);
        //new Packages.xdc.services.global.Out["(java.io.OutputStream)"](bos);
    try {
	this.genStream(out, thisObj, args);
    }
    catch (e) {
	out.close();
	file["delete"]();
	throw new Error("template generation of '" + outFileName
	    + "' failed: " + e);
    }

    out.flush();
    out.close();

    /* if necessary, compare file and ofile and move if different */
    if (compare == true) {
	if (utils.compareFiles(ofile, file) != true) {
	    ofile["delete"]();
	    file.renameTo(ofile);
	}
	else {
	    file["delete"]();
            result = false;
	}
    }
    return (result);
};

/*
 *  ======== xdc.$$Template.genStream ========
 */
xdc.$$Template.prototype.genStream = function(outStream, thisObj, args)
{
    xdc.jre.xdc.services.intern.xsr.Template.apply(this.fxn, outStream, thisObj,
        args == undefined ? [] : args);
};

/*
 *  ======== xdc.$$Template._compile ========
 *  Called by xdc.$$Template to create a function from the specified
 *  template path.
 *
 *  The generated function is executed to generate the output file.  It is
 *  executed after xdc.$$Template._exec sets 'this' to an appropriate object.
 */
xdc.$$Template._compile = function (path)
{
//    print("compiling template " + path + " ...");
    var encode = function(s) { return escape(s.replace("``", "`")); };

    var inp = new java.io.BufferedReader(new java.io.FileReader(path));
    var body = "";
    var jflg = 0;
    var line;

    while (line = inp.readLine()) {

	if (/^\s*\%\%\{/.test(line)) {
	    body += '\n';
	    jflg = 1;
	    continue;
	}

	if (/^\s*\%\%\}/.test(line)) {
	    body += '\n';
	    jflg = 0;
	    continue;
	}

	if (jflg) {
	    body += line + '\n';
	    continue;
	}

	if (/^\s*\|\-\s*\|/.test(line)) {
	    line = line.slice(line.indexOf('|') + 1);
	    line = line.slice(line.indexOf('|') + 1);	// 2nd '|'
	}
	else if (/^\s*\%/.test(line)) {
	    body += line.slice(line.indexOf('%') + 1) + '\n';
	    continue;
	}

	var pat = /`([^`]+`)(.*)/;
	var mat;

	while (mat = line.match(pat)) {
	    body += "$out.print(unescape('" + encode(line.slice(0, mat.index))
	        + "')); ";
	    if (mat[1].length > 1) {
		body += "$out.print('' + eval(unescape('"
		    + encode(mat[1].slice(0, -1) + '\n') + "'))); ";
	    }
	    else {
		body += "$out.print('`'); ";
	    }
	    line = mat[2];
	}
	line = "" + line;
	body += "$out.print(unescape('"
	    + (line.length > 0 ? encode(line) : line) + "\\n'));\n";
    }

    inp.close();

    var file = new java.io.File(path);
    var csd = escape(file.getParentFile().getCanonicalPath());
    file = (file + "").replace(/\\/g, "/");

    var fs = '__$$fxn = function($out) {'
	+ 'var fxn = function($out, $args) {' 
	+     body
	+ '};' 
	+ 'var $args = []; for (var i = 1; i < arguments.length; i++) $args[i - 1] = arguments[i];'
	+ 'var save = utils.loadedFiles; utils.loadedFiles = {};'
	+ 'var oldcsd = utils.csd;'
	+ 'var oldpath = utils.global.$tracePath;'
	+ 'utils.global.$tracePath = "' + file + '";'
	+ 'utils.csd = unescape("' + csd + '");'
	+ 'try {fxn.apply(this, [$out, $args]);}'
	+ 'finally {utils.csd = oldcsd;'
	+ 'utils.global.$tracePath = oldpath;'
	+ 'var ret = utils.loadedFiles;'
	+ 'for (var i in ret) save[i] = ret[i];'
	+ 'utils.loadedFiles = save;}'
	+ 'return(ret);'
	+ '}; __$$fxn';

    /* The last line does not invoke __$$fxn, it just displays its content. */

    return xdc.jre.org.mozilla.javascript.Context.getCurrentContext()
        .evaluateString(xdc.global, fs, path, 1, null);
};
/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:08; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

