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
package xdc.tools.path;

/*!
 *  ======== xdc.tools.path.Main ========
 *  Package Repository Path Display Tool
 *
 *  This tool displays the packages located along the specified package
 *  repository path.  Repositories can be specified by explicitly naming
 *  them via the `-Pr` option or implicitly by not passing `-Pr`; in
 *  this case, the set of repositories searched corresponds to the set of
 *  repositories defined by the current package path:
 *  @p(code)
 *      $XDCPATH;$XDCROOT/packages;^
 *  @p
 *
 *  where `$XDCPATH` is the value of the the user settable prefix of
 *  the package path, `$XDCROOT` is the installation directory of the 
 *  XDC tools, and `^` is the repository of the package in the current
 *  working directory (if it exists).
 * 
 *  @a(Examples)
 *  
 *    1. To display information about the packages on the package path
 *    (in this example, the package path is just `C:/xdc-o00/packages`):
 *  @p(code)
 *    xs xdc.tools.path
 *  @p
 *
 *    Output:
 *  @p(code)
 *    Package Name:      gnu.gdb.jserver
 *    Repository:        C:/xdc-o00/packages
 *    Release Name:      gnu_gdb_jserver
 *    Label:             default
 *    Compatibility Key: 1, 0, 0, 0, 87
 *    Date:              11/20/2006  20:38
 * 
 *    Package Name:      gnu.targets
 *    Repository:        C:/xdc-o00/packages
 *    Release Name:      gnu_targets
 *    Label:             default
 *    Compatibility Key: 1, 0, 0, 0, 194
 *    Date:              11/20/2006  20:38
 *     
 *  @p
 *
 *    2. To display the names of the packages on the package path
 *    (in this example, the package path is just `C:/xdc-o00/packages`):
 *  @p(code)
 *    xs xdc.tools.path -n
 *  @p
 * 
 *    Output:
 *  @p(code)
 *    gnu.gdb.jserver
 *    gnu.targets
 *    gnu.targets.rts470MV
 *    gnu.targets.rts470uC
 *    gnu.targets.rts5
 *     
 *  @p
 *
 *    3. To simply, echo the current package path:
 *  @p(code)
 *    xs xdc.tools.path -p
 *  @p
 *  
 *    Output:
 *  @p(code)
 *    C:/xdc-o00/packages
 *  @p
 * 
 *    4. To display information about the packages "rooted" in the repository
 *    `C:/CCStudio_v3.3/bios_5_31/packages`:
 *  @p(code)
 *    xs xdc.tools.path -Pr C:/CCStudio_v3.3/bios_5_31/packages
 *  @p
 *  
 *    Output:
 *  @p(code)
 *    Package Name:      ti.platforms.dsk5402
 *    Repository:        C:/CCStudio_v3.3/bios_5_31/packages
 *    Release Name:      ti_platforms_dsk5402
 *    Label:             default
 *    Compatibility Key: 1, 0, 0, 24
 *    Date:              05/11/2006  19:10
 * 
 *    Package Name:      ti.platforms.dsk5416
 *    Repository:        C:/CCStudio_v3.3/bios_5_31/packages
 *    Release Name:      ti_platforms_dsk5416
 *    Label:             default
 *    Compatibility Key: 1, 0, 0, 24
 *    Date:              05/11/2006  19:10
 * 
 *    Package Name:      ti.platforms.dsk5510
 *    Repository:        C:/CCStudio_v3.3/bios_5_31/packages
 *    Release Name:      ti_platforms_dsk5510
 *    Label:             default
 *    Compatibility Key: 1, 0, 0, 24
 *    Date:              05/11/2006  19:10
 *     
 *  @p
 *
 *    5. To display the names of all packages in or below the directory
 *    `C:/CCStudio_v3.3/bios_5_31/packages`:
 *  @p(code)
 *    xs xdc.tools.path -n -PR C:/CCStudio_v3.3/bios_5_31/packages
 *  @p
 * 
 *    Output:
 *  @p(code)
 *    ti.platforms.dsk5402
 *    ti.platforms.dsk5416
 *    ti.platforms.dsk5510
 *    ti.platforms.dsk6211
 *     
 *  @p
 *
 *  @see xdc.tools.path
 */
metaonly module Main inherits xdc.tools.ICmd {

    override config String usage[] = [
       '[-n] [-x] [-v] [-H header] [-p] [-c] [-P package_base_dir ...|-Pr repository ...|-PR directory ...]'
    ];

    /*!
     *  ======== Pkg ========
     *  struct used for xml package info
     */
    @XmlDtd
    metaonly struct Pkg {
        String name; 
        String repository;
        String release;
        String label;
        String key;
        String date;
        String providerId;
        String originalProviderId;
        String producerId;
    }

    @XmlDtd
    metaonly struct CheckResults {
        String repository;
        String warnings[];
    }

    /*!
     *  ======== Results ========
     *  return value for xml package info
     */
    @XmlDtd
    metaonly struct Results {
        String header;     /*! user-specified header */
        String path;       /*! package path */
        Pkg pkg[];         /*! array of packages */
        CheckResults checkResults[];
    }

    /*!
     *  ======== NameResults ========
     *  return value for xml package names
     */
    @XmlDtd
    metaonly struct NameResults {
        String header;     /*! user-specified header */
        String path;       /*! package path */
        String name[];     /*! array of names */
        CheckResults checkResults[];
    }

    /*!
     *  ======== PathResults ========
     *  return value for xml package path
     */
    @XmlDtd
    metaonly struct PathResults {
        String header;     /*! user-specified header */
        String path;       /*! package path */
        CheckResults checkResults[];
    }

    /*!
     *  ======== DirResults ========
     *  return value for xml directory echo
     */
    @XmlDtd
    metaonly struct DirResults {
        String header;     /*! user-specified header */
        String dir[];      /*! array of package base directories */
        CheckResults checkResults[];
    }

instance:

    /*!
     * Echo path
     */
    @CommandOption('p')
    config Bool pathFlag = false;

    /*!
     * Display package names only
     */
    @CommandOption('n')
    config Bool shortFlag = false;

    /*!
     * Return an array of strings
     */
    @CommandOption('a')
    config Bool arrFlag = false;

    /*!
     * Return a Results struct as XML
     */
    @CommandOption('x')
    config Bool xmlFlag = false;

    /*!
     * Print informative messages during execution
     */
    @CommandOption('v')
    config Bool verboseFlag = false;

    /*!
     * Header label
     */
    @CommandOption('H')
    config String header = null;

    /*!
     * Use specified directory args instead of xdc.path
     */
    @CommandOption('-Pr,d')
    config Bool repositoriesFlag = false;

    /*!
     * Recursively find all packages
     *
     * Recursively descend into specified directories and find every
     * package, including packages whose repository is not one of
     * the specified directories.
     */
    @CommandOption('-PR')
    config Bool recurseFlag = false;

    /*!
     * Only display information for the package directories
     */
    @CommandOption('-P')
    config Bool directoriesFlag = false;

    /*!
     * Check repositories for possible errors
     */
    @CommandOption('c,--checkpath')
    config Bool checkFlag = false;

}

/*
 *  @(#) xdc.tools.path; 1, 0, 0,0; 1-9-2017 12:51:40; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

