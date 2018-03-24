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
var File;
var Template;

/*
 *  ======== module$meta$init ========
 */
function module$meta$init()
{
    File     = xdc.module('xdc.services.io.File');
    Template = xdc.module(this.$package + '.Template');
}

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(template, output)
{
    this.$private.template = template;
    this.$private.output = output;
}

/*
 *  ======== gen ========
 */
function gen()
{
    var template = this.$private.template.$orig;
    var output   = this.$private.output;

    /* check usage */
    if (!template) {
        throw new Error('argument "template" is required');
    }
    if (!output) {
        throw new Error('argument "output" is required');
    }
    
    /*
     * This structure will be passed as the 'this' parameters to all
     * templates. It allows them to share values.
     */
    var env = {     /* pass some useful stuff for starters */
        output:     output,
        outputPath: output
    };

    /*
     * copy the instance configs into the env as named parameters.
     */
    for (var p in template) {
        env[p] = template[p];
    }

    /*
     * if there's an arguments param, convert it to a real array
     */
    if ('arguments' in env) {
        var args = [];
        for (var i = 0; i < env.arguments.length; i++) {
            args[i] = env.arguments[i];
        }
        env.arguments = args;
    }

    process.call(this, env, env.inputPath, "", {});
}

/*
 *  ======== process ========
 *  Process a file or directory template. If a directory, the contents
 *  are processed recursively.
 */
function process(env, inFile, outFile, attribs)
{
    /* decide whether it's a file or a dir */;
    if (File.isDirectory(inFile)) {
        
        /* add filePath to env */
        env.filePath = (env.outputPath + outFile).replace(/\\/g, '/');
        
        /* a directory, so read the list of files to process */
        var files = readDir(env, inFile, attribs);
		
        /* first create the directory */
        var dir = new java.io.File(env.outputPath + outFile);
        if (!dir.exists() && !dir.mkdirs()) {
	    throw new Error("can't create '" + dir + "'");
	}

        /* recursively process the contents of the directory */
        for each (var f in files) {
            process.call(this, env, inFile + '/' + f.src, 
			 outFile + '/' + f.dst, f.attribs);
        }
    }
    else if ('@verbatim' in attribs) {
        /* copy a single file without template expansion */
        _copyFile.call(this, inFile, env.outputPath + outFile);
    }
    else {
        /* load and process just a single file */

        /* load the input filename as a template */
        var tmpl = xdc.loadTemplate(inFile);

        /* add filePath to env */
        var fpath = (env.outputPath + outFile).replace(/\\/g, '/');
	var index = fpath.lastIndexOf('/');
        env.filePath = fpath.substring(0, index);
        env.fileName = fpath.substring(index + 1);
        
        /* process the output filename using the template */
        tmpl.genFile(env.outputPath + outFile, env, 
		     env.arguments, !this.preserveModTime);
    }
}

/*
 *  ======== readDir ========
 *  Read the contents of a directory, processing the "mkpkg.xdt"
 *  control file if one is available.
 */
function readDir(env, inFile, attribs)
{
    if (!('@verbatim' in attribs) && File.exists(inFile + "/mkpkg.xdt")) {
        return (readDirTemplate.call(this, env, inFile, attribs));
    }

    return (readDirNoTemplate.call(this, inFile, attribs));
}

/*
 *  ======== readDirNoTemplate ========
 *  Read the list of files in a directory, when the directory does not
 *  contain a "mkpkg.xdt" control file. The files are processed in
 *  alphabetical order.
 */
function readDirNoTemplate(inFile, attribs)
{
    var result = [];
    var dir = new java.io.File(inFile);

    for each (var f in dir.list().sort()) {
        result.push({
            src: f,
            dst: f,
            attribs: attribs
        });
    }

    return (result);
}

/*
 *  ======== readDirTemplate ========
 *  Read the list of files in a directory, when the directory contains
 *  a "mkpkg.xdt" control file. The files are processed in the order
 *  specified in the control file.
 */
function readDirTemplate(env, inFile, initialAttribs)
{
    var result = [];

    /* load the catalog file template */
    var catTmpl = xdc.loadTemplate(inFile + "/mkpkg.xdt");

    /* process the template file into a byte array / string */
    var outBA = new java.io.ByteArrayOutputStream();
    var out = new Packages.xdc.services.global.Out(outBA);
    catTmpl.genStream(out, env, env.arguments);
    
    /* split the string at new line characters */
    var files = (outBA.toString() + "").split('\n');

    /* scan the file names */
    for (var i = 0; i < files.length; i++) {
        var line = files[i];

        /* copy the attributes from the initial ones */
        var attribs = {};
        for (var attr in initialAttribs) {
            attribs[attr] = initialAttribs[attr];
        }

        /* collect other attributes from the line */
        var m;
        var attribPattern = /(\s*)(@\S+)(\s*)/;
        while ((m = attribPattern.exec(line)) != null) {
            attribs[m[2]] = true;
            line = line.replace(attribPattern, "$3");
        }

        /* skip if it's a blank line */
        if (/^\s*$/.test(line)) {
            continue;
        }
    
        /* if two filenames are present, renames the file */
        var io;
        if ((io = /^\s*(.*\S)\s*->\s*(.*\S)\s*$/.exec(line)) != null) {
            /* fetch the input and output file names */
            result.push({
                src: io[1],
                dst: io[2],
                attribs: attribs
            });
        }
        /* else if a single filename is present, keeps same name */
        else if ((io = /^\s*(.*\S)\s*$/.exec(line)) != null) {
            /* fetch the input file name, which is also the output name */
            result.push({
                src: io[1],
                dst: io[1],
                attribs: attribs
            });
        }
        else {
            print("Warning: syntax error in '" + line + "': line skipped");
            continue;
        }
    }

    return (result);
}

/*
 *  ======== _copyFile ========
 */
function _copyFile(src, dst)
{
    var srcFile = new java.io.File(src);
    var dstFile = new java.io.File(dst);

    /* copy a single file */
    var instr = new java.io.FileInputStream(srcFile);
    var pdir = dstFile.getParentFile();
    if (!pdir.exists() && !pdir.mkdirs()) {
	throw new Error("copy of '" + src + "' to '"
            + dst + "' failed: can't create '" + pdir + "'");
    }

    var outstr = new java.io.FileOutputStream(dstFile);
    var inc = instr.getChannel();
    var outc = outstr.getChannel();
    inc.transferTo(0, inc.size(), outc);

    /* BUG: implement this.preserveModTime for @verbatim */
    instr.close();
    outstr.close();
}
