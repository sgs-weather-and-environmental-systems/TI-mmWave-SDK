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
requires xdc.tools.sg;

/*!
 *  ======== xdc.tools.cdoc.sg ========
 *  Interactive Package Documentation Browser
 *
 *  @b(Usage)
 *  @p(code)
 *      xs xdc.tools.cdoc.sg [unit-name ...] [-Pr rdir ...]
 *  @p
 *
 *  This tool is used to interactively browse package documentation for
 *  all packages found in the specified repositories `rdir ...`.  If no
 *  repositories are specified after the optional `-Pr` flag, the
 *  repositories in the current package path are used.
 *
 *  If one or more "unit-names" are specified, the corresponding package,
 *  module, or interface reference pages are opened during startup.
 *
 *  This utility is invoked via the XDC `xs` command, where the
 *  alias `xs` is defined as follows:
 *  @p(code)
 *      $XDCROOT/xs
 *  @p
 *  and $XDCROOT is the installation directory of the XDC toolset.
 */
package xdc.tools.cdoc.sg {
    module Main;
}
/*
 *  @(#) xdc.tools.cdoc.sg; 1,0,0,0; 11-8-2017 17:13:42; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

