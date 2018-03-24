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
package xdc.tools.cdoc;

/*!
 *  ======== xdc.tools.cdoc.Main ========
 *  RTSC documentation generator
 *
 *  cdoc is a package documentation generation utility. It builds a
 *  directory of browsable HTML documentation using the meta-
 *  information stored in RTSC packages. 
 *
 *  This utility is invoked via the XDCtools `xs` command.  In the
 *  examples below we assume that the alias `cdoc` is defined as
 *  follows:
 *  @p(code)
 *      $(XDCROOT)/xs xdc.tools.cdoc
 *  @p
 *  where $(XDCROOT) is the installation directory of the XDCtools toolset.
 *
 *  @a(Examples)
 *  In the examples below we assume that the alias `cdoc` is defined as
 *  `$(XDCROOT)/xs xdc.tools.cdoc`, where `$(XDCROOT)` is the installation
 *  directory of the XDCtools toolset.
 *
 *  1. To generate documentation for the package in the current working
 *  directory:
 *  @p(code)
 *      cdoc
 *  @p
 *  Since no package is specified and no output directory is specified,
 *  documentation is generated for the package in the current working
 *  directory and the output is placed in the package's `./package/cdoc`
 *  sub-directory.
 *
 *  2. To generate documentation with the title "My Packages" for all
 *  packages installed in the `myPackages` repository:
 *  @p(code)
 *      cdoc -title "My Packages" -Pr myPackages
 *  @p
 *  Since no output directory was specified and documentation will be for
 *  more than one package, the generated files are placed in the directory
 *  `./cdoc`.
 *
 *  3. To generate documentation for the package located in `./ti/bios` and 
 *  put results in the directory `./html`.
 *  @p(code)
 *      cdoc -od:html -P ti/bios
 *  @p
 *
 *  @a(Note)
 *  `cdoc` processes the XML files that are generated *after* a package
 *  is built (actually after the `.interfaces` goal is built).  One must first
 *  build a package before generating its documentation.  If you change a
 *  `.xdc` file and re-run `cdoc` without rebuilding the package, the change 
 *  in the `.xdc` file will not show up in the generated docs.
 *
 *  When interatively updating a package's .xdc files and examining the
 *  generated documentation, it is useful to define a command alias that
 *  first "compiles" the package's .xdc files and then runs the cdoc tool.
 *  For example, if your shell is Korn shell compatible, the following
 *  command alias ensures that any changes in .xdc files will show up in the
 *  generated documents:
 *  @p(code)
 *      function cdoc {
 *          $XDCROOT/xdc .interfaces
 *          $XDCROOT/xs xdc.tools.cdoc $*
 *      }
 *  @p
 */

metaonly module Main inherits xdc.tools.ICmd {
    override config String usage[] = [
        '[-od:dir] [-title text] [--start package] [--indexonly] [--doxytags file] [--doxybase dir] [-h] [-n] [-b] [-s] [-P pkg-dir...|-Pr repo-dir...|-A]'
    ];

instance:

    /*!
     * Place the generated files in the named directory.
     */
    @CommandOption("-od")
    config String outdir = null;

    /*!
     *  Generated HTML pages will show the string in the page title
     */
    @CommandOption("-title")
    config String title = null;

    /*!
     *  Set start page to specified package
     *
     *  The opening page is, by default, the documentation for the
     *  alphabetically first package processed.  This option allows
     *  you to explicitly specify the package used.
     *
     *  If "" is specified, the start page will be blank.
     *
     *  If the package specified is not processed, no warning or error
     *  results; it is assumed that when the documentation is used the
     *  specified package documentation will exist.
     */
    @CommandOption("--start")
    config String start = null;

    /*!
     *  Include .xdc file sources
     *
     *  In the generated documentation for each .xdc file, link
     *  to a pretty-printed view of the .xdc file source text.
     */
    @CommandOption("s")
    config Bool sopt = false;

    /*!
     * The subsequent directories are package directories.
     *
     * Generates documentation for each of the specified packages.
     */
    @CommandOption("P")
    config Bool popt = false;

    /*!
     * The subsequent directories are repositories of packages.
     *
     * Generates documentation for all packages rooted in each of
     * the specified repositories.
     */
    @CommandOption("-Pr")
    config Bool ropt = false;

    /*!
     * Generate documentation for all packages on the package path.
     */
    @CommandOption("A")
    config Bool aopt = false;

    /*!
     *  Generate a single "big" output
     */
    @CommandOption("b")
    config Bool bopt = false;

    /*!
     *  Generate html pages only, not table of contents or index
     */
    @CommandOption("h")
    config Bool hopt = false;

    /*!
     *  Generate nodoc'd docs
     */
    @CommandOption("n")
    config Bool nopt = false;

    /*!
     *  Quiet mode
     */
    @CommandOption("--quiet")
    config Bool qopt = false;

    /*!
     *  Generate index and table of contents only 
     */
    @CommandOption("--indexonly")
    config Bool iopt = false;

    /*!
     *  Process doxygen links, using this argument
     *  as the tag file
     */
    @CommandOption("--doxytags")
    config String doxytags = null;

    /*!
     *  The directory containing doxygen html files
     */
    @CommandOption("--doxybase")
    config String doxybase = null;

    /*!
     *  Use specified style sheet
     */
    @CommandOption("--style")
    config String style = null;
}


/*
 *  @(#) xdc.tools.cdoc; 1, 0, 0,0; 11-8-2017 17:13:37; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

