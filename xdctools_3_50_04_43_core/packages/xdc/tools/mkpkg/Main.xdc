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

/*!
 *  ======== Main ========
 *  Main entry point for the this utility
 */
metaonly module Main inherits ICmd {
    /*!
     *  ======== main ========
     *  main() function, invoked from the command line.
     *
     *  Parses command line arguments then calls {@link #mkpkg()}.
     */
    override Int main(String arguments[]);

    /*!
     *  ======== mkpkg ========
     *  Generate a package from a template.
     *
     * @param(template) names a `.xdt` template file or directory of template
     *                  files to process, found either explicitly or along
     *                  the package path (via `xdc.findFile()`).
     * @param(output)   names the file or directory to be generated.
     *
     * @a(DESCRIPTION)
     *  mkpkg is a 'wizard' for creating files and directories that have
     *  some required structure, using RTSC's template mechanism. It
     *  can create a single file, or a directory tree. In practice it's used
     *  to create RTSC packages but this tool can be used to create any set
     *  of files and directories.
     *
     *  The named template can be either a single `.xdt` file, in which case
     *  a single file is generated, or else a directory of template files.
     *  In the latter case the output is a directory of files that mirrors
     *  the contents of the template directory, each file generated from
     *  its own template.
     *
     *  Additional arguments are passed into the template, as described below.
     *
     * @a(DIRECTORY_TEMPLATES)
     *  If the specified template is a directory, the mkpkg will produce
     *  a directory as output. By default, each file in the directory is
     *  treated as a template, and processed into a file of the same name
     *  in the output directory. If a directory template contains nested
     *  directories, then they are processed recursively using the same
     *  rules as a top-level directory template.
     *
     * @a(DIRECTORY_TEMPLATE_INDEX_FILE)
     *  A directory template may additionally include an index file, named
     * '`mkpkg.xdt`'. The index file lists the files to be created, one
     *  file per line. Each line has one of the following formats:
     *  @p(blist)
     *    - `fileOrDir`
     *    - `inFileOrDir -> outFileOrDir`
     *  @p
     *  The latter case renames the file in the output directory. In
     *  both cases, the file is a path relative to the directory. Files
     *  are processed in the order that they appear in the index file.
     *
     * @a(COMPLEX_INDEX_FILE)
     *  Since the `mkpkg.xdt` index file is itself a template, embedded
     *  JavaScript can alter the contents of the generated output directory.
     *  Some common usages are to:
     *  @p(blist)
     *    - rename the files in the output directory based on the
     *      command line arguments.
     *    - iterate over a set of files using an embedded JavaScript '`for`'
     *      loop, allowing the output directory to contain multiple copies
     *      of the input files or directories, with different names and
     *      expansions.
     *
     * @a(SUPRESSING_TEMPLATE_EXPANSION)
     *  To copy a file or directory without interpreting its contents as
     *  a template, add the attribute "`@verbatim`" to the line, for
     *  example:
     *  @p(code)
     *    myfile -> myfile2 @verbatim
     *    mydir @verbatim
     *  @p
     *  This can be useful for copying binary or template files to
     *  the output, for which expansion might be destructive.
     *
     *  If this attribute is applied to a directory then the directory and
     *  all its contents are copied recursively without expansion, including
     *  any `mkpkg.xdt` scripts.
     *
     * @a(THIS_OBJECT)
     *  The JavaScript '`this`' object is shared by all the templates
     *  processed by the command. Initially it contains some useful
     *  predefined values discussed below. Since the `mkpkg.xdt` template
     *  is processed first, this template can modify or add properties
     *  to '`this`' to be made available to the individual file templates.
     *
     *  The initial contents are:
     *  @p(blist)
     *    - `this.input`
     *      the template name as specified on the command line
     *
     *    - `this.output`
     *      the output name as specified on the command line
     *
     *    - `this.arguments`
     *      an array containing the additional arguments given on
     *      the command line, excluding `template` and `output`; i.e.,
     *      the arguments passed in the varargs parameter of `mkpkg()`.
     *
     *    - `this.inputPath`
     *      the explicit pathname to the template, which may have
     *      been expanded along the `XDCPATH`.
     *
     *    - `this.outputPath`
     *      the explicit pathname to the output directory. Initially
     *      this is identical to this.output, but may be modified by
     *      the `mkpkg.xdt` template, e.g. to create a package directory
     *      tree from a package name.
     *  @p
     */
    Void mkpkg(String template, String output, ...);

    /*!
     *  ======== update ========
     *  Only modify the timestamps of output files whose contents changed.
     *
     *  This flag changes the behavior of mkpkg in the case when some
     *  of the output files already exist - such as from a previous
     *  invocation of `mkpkg`. If `true`, output files that already
     *  exist will only be touched if their contents change.  If the new
     *  content is identical, the modification date of the file is
     *  unchanged.
     *
     *  This option can improve the behavior of `mkpkg` when used with
     *  programs like "make" that are sensitive to file modification
     *  times.
     */
    config Bool update = false;

    /*!
     *  ======== create ========
     *  @_nodoc
     */
    create(String input);
}
