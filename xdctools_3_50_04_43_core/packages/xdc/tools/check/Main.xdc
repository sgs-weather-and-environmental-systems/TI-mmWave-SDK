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
/*!
 *  ======== Main.xdc ========
 *  Check compatibility of specified packages
 *
 *  This tools scans the specified repositories looking for package
 *  incompatibilities.
 *
 *  By default, if a package appears in more than one repository, only the
 *  package in the first repository is added to the set of packages to check.
 *  This allows one to check the consistency of all packages that can be found
 *  along a specified package path by simply listing the package path
 *  repositories on the command line.
 *
 *  This tool performs the following checks:
 *  @p(blist)
 *      - the latest version of each target used by any package is compatible
 *        with all other versions used; and
 *      - the "built-with" versions of all packages are compatible with the
 *        versions of the packages contained in the specified repositories
 *  @p
 *
 *  If no repositories are specified, the repositories named in the current
 *  package path are checked.
 */
metaonly module Main inherits xdc.tools.ICmd {

    /*!
     *  ======== usage ========
     *  Usage message
     */
    override config String usage[] = [
        '[-[ax]] [-v] [-t target] [-e exclude_pattern] [-H header] [repository ...]',
    ];

    /*!
     *  ======== Results ========
     *  XML output format
     *
     *  This structure defines the "schema" for the XML output.
     */
    @XmlDtd
    struct Results {
        String header;      /*! user specified header */
        String errors[];    /*! array of all errors detected */
        String warnings[];  /*! array of all warnings detected */
        Target targets[];
    }
    struct Target {
        String name;            /*! target name */
        struct {
            String key;         /*! target compatibility key used */
            String packages[];  /*! all packages using target with this key */
        } keys[];
    }

instance:

    /*!
     *  ======== arrFlag ========
     *  Return an array of strings
     */
    @CommandOption('a')
    config Bool arrFlag = false;

    /*!
     *  ======== verboseFlag ========
     *  Print informative messages during execution
     */
    @CommandOption('v')
    config Bool verboseFlag = false;

    /*!
     *  ======== xmlFlag ========
     *  Return a Results struct as XML
     */
    @CommandOption('x')
    config Bool xmlFlag = false;

    /*!
     *  ======== header ========
     *  Prepend Header label to output
     */
    @CommandOption('H')
    config String header = null;

    /*!
     *  ======== exclude ========
     *  Exclude packages or targets from checks
     *
     *  Do not check compatibility of packages or targets whose names match
     *  the regular expression `exclude`.
     */
    @CommandOption('e')
    config String exclude = null;

    /*!
     *  ======== multipleFlag ========
     *  Allow checking multiple versions of the same package
     *
     *  By default, when a package appears in more than repository named on
     *  the command line, this tool only checks the first occurance
     *  of the package.  Setting this option forces all versions of all
     *  packages in the specified repositories to be included in the checks.
     */
    @CommandOption('m')
    config Bool multipleFlag = false;

    /*!
     *  ======== target ========
     *  Target to check
     *
     *  During the compatibility checks this tool ensures that for all
     *  targets used by all packages are compatible with the latest target
     *  referenced by any package.  If this option is set, the check tool
     *  will only validate compatibility for the specified target.  In
     *  addition, if the target string contains a target compatibility key,
     *  all packages that reference the target will be checked for
     *  compatibility with the specified key.
     *
     *  The format of this string is either
     *  @p(code)
     *      <target_name>:<target_key>
     *  @p
     *  or 
     *  @p(code)
     *      <target_name>
     *  @p
     *  where `<target_name>` is the full name of a target and `<target_key>`
     *  is an optional target-specific compatibility key.  The optional
     *  target compatibility key can be used to validate the set of packages
     *  against a specific compiler tool chain.
     */
    @CommandOption('t')
    config String target = null;
}
/*
 *  @(#) xdc.tools.check; 1, 0, 0,0; 1-9-2017 12:51:20; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

