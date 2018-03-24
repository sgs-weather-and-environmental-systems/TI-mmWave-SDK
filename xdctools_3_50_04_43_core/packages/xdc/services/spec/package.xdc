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
requires xdc.shelf;

/*!
 *  ======== xdc.services.spec ========
 *
 *  Java classes to access XDCspec information
 *
 *  This package contains several Java classes that enable clients to
 *  retrieve inforation about modules, interfaces, and packages from their
 *  specification files (i.e., `*.xdc` files).  Being Java classes, the APIs
 *  provided are available to both Java applications and XDCscripts (via the
 *  `$spec` property of the module, interface, or package).
 *
 *  @p(dlist)
 *      - `{@link ./doc-files/javadoc/xdc/services/spec/Pkg.html [Pkg]}`
 *        Package related information available from a package's
 *        `{@link http://rtsc.eclipse.org/docs/XDCscript_-_Package-Object.%24spec $spec}`
 *        property.
 *      - `{@link ./doc-files/javadoc/xdc/services/spec/Unit.html [Unit]}`
 *        Module (or interface) related information available from a
 *        module's (or interface's)
 *        `{@link http://rtsc.eclipse.org/docs/XDCscript_-_Module-Object.%24spec $spec}`
 *        property.
 *  @p
 *
 *  @a(Note)
 *  When accessing the Java methods provided by this package via XDCscript,
 *  you can either either use their liternames (e.g., `getName()`) or use
 *  the JavaBeans pattern of getters and setters in which the method
 *  `getName()` can be accessed via just `name`.  The examples below provide
 *  examples of how this pattern can be used.
 *
 *  @a(XDCscript Examples)
 *  Get the declared name of a module:
 *  @p(code)
 *      var Mod = xdc.module('pkg.Mod');
 *      print("Module declared as " + Mod.$spec.getName());
 *  @p
 *
 *  This same example can be written using the JavaBean pattern as follows:
 *  @p(code)
 *      var Mod = xdc.module('pkg.Mod');
 *      print("Module declared as " + Mod.$spec.name);
 *  @p
 *
 *  @see ./doc-files/javadoc/index.html Javadoc
 */
package xdc.services.spec [1, 0, 0] {
}
/*
 *  @(#) xdc.services.spec; 1, 0, 0,0; 11-8-2017 17:12:45; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

