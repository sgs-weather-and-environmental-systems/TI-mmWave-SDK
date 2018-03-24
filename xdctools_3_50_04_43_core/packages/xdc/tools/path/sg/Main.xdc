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
 *  ======== Main ========
 *  Graphical interface to path tool
 *
 *  This graphical interactive tool displays the packages located along any
 *  specified package repository path.
 *
 *  At startup, this tool shows the packages located along the current package
 *  path; i.e.,
 *  @p(code)
 *      $XDCPATH;$XDCROOT/packages;^
 *  @p
 *
 *  where `$XDCPATH` is the value of the the user settable prefix of the
 *  package path, `$XDCROOT` is the installation directory of the XDC tools,
 *  and `^` is the repository of the package in the current working directory
 *  (if it exists). To specify a package path other than the current package
 *  path, use the --packagepath option. Only semicolon delimited canonical 
 *  paths should be specifed as arguments with the --packagepath option.
 *  Environment variables such as $XDCROOT and special designators such as
 *  '^' should not be used.
 * 
 *  @b(Usage)
 *  @p(code)
 *    xs xdc.tools.path.sg [--packagepath PATH]
 *  @p
 *
 *  @a(Bugs)
 *  
 *  This tool scans all packages available along the current
 *  package path before displaying the user interface.  So, a repository in
 *  the package path that contains a large number of sub-directories, such
 *  as '/', causes very long delays before the user interface is displayed.
 *
 *  While it is easy to see that you should not put '/' in the package path,
 *  it is less obvious that installing a package at '/' has the same effect.
 */
metaonly module Main inherits xdc.tools.ICmd {

    override config String usage[] = [
       '[--packagepath PATH]'
    ];

    /*!
     *  ======== createPartControl ========
     *  @_nodoc
     */
    function createPartControl(parent);

instance:

    //! package path to scan for packages
    @CommandOption('packagepath')
    config string pathArg = null;

}
/*
 *  @(#) xdc.tools.path.sg; 1, 0, 0,0; 1-9-2017 12:51:42; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

