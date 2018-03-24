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
 * 
 */
requires xdc.bld;

/*!
 *  ======== gnu.targets ========
 *  Package of targets for the GNU gcc code generation tools
 *
 *  The targets in this package are designed to enable host application
 *  development; e.g., the build of the XDCtools product's C-based command
 *  line tools.
 */
package gnu.targets [1, 0, 1] {
    module Linux86, Linux86_64;
    module Mingw;
    module MacOS86_64;
    interface ITarget;
}
/*
 *  @(#) gnu.targets; 1, 0, 1,0; 11-8-2017 17:20:11; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

