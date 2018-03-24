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
 *  Graphical interface to repoman tool
 *
 *  For more information about how to use this tool, see the
 *  {@link http://rtsc.eclipse.org/docs-tip/Command_-_xdc.tools.repoman.sg xdc.tools.repoman.sg User's Guide}.
 *
 *  @see xdc.tools.repoman
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
    //! repositories to scan for packages
    @CommandOption('packagepath')
    config string pathArg = null;
}
/*
 *  @(#) xdc.tools.repoman.sg; 1, 0, 0,0; 1-9-2017 12:51:54; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

