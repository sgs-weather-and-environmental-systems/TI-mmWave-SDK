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
 *  ======== xdc.tools.mkpkg ========
 *  @_nodoc
 *
 *  Generate a package from a template.
 *
 *  This package provides a utility to generate a package from a directory of
 *  templates and is typically used by other tools rather than directly from
 *  the command line.
 *
 *  @see Main#mkpkg()
 */
package xdc.tools.mkpkg [1, 0, 1] {
    interface Template, ICmd;
    module Main, Gen;
}
