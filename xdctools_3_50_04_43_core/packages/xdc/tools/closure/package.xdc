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

requires xdc.tools.path;
requires xdc.tools.repoman;

/*!
 *  ======== xdc.tools.closure ========
 *  A command line tool that creates 100% self-contained configurations
 *
 *  This package contains a command line tool that creates a "closure"
 *  containing all packages loaded in the process of configuring an
 *  application and replaces all absolute path references with references
 *  withing the closure.
 */
package xdc.tools.closure [1, 0, 0] {
    module Main;
}

/*
 *  @(#) xdc.tools.closure; 1, 0, 0,0; 1-9-2017 12:51:22; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

