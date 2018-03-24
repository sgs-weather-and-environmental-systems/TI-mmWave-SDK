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
requires xdc.services.global;

/*!
 *  ======== xdc.cfg ========
 *  Configuration Object Model elements
 *
 *  This package contains the modules necessary to populate the XDC
 *  Configuration Object Model.  In addition, this package supplies a
 *  C/C++ header, `global.h`, that facilitates the creation of portable
 *  sources that need to reference global values defined as part of
 *  a configuration (`{@link xdc.cfg.Program#global}`).
 *
 *  @a(Compatibility Checks)
 *  During configuration certain compatibility checks are made.  These checks
 *  include:
 *  @p(nlist)
 *    -   target compatibility among all packages that are included in the
 *        configuration
 *    -   package compatibility among all packages included in the
 *        configuration
 *    -   package compatibility with respect to the set of packages used to
 *        build the packages that are part of the configuration set.
 *  @p
 *  By default, if any of the checks above fail, the configuration step fails.
 *  It is possible, however, to selectively exclude particular
 *  packages from these checks and/or treat check failures as non-fatal
 *  warnings.
 *
 *  There are two "environment" variables that control these checks:
 *  @p(dlist)
 *    - `xdc.cfg.check.exclude`
 *        a regular expression that is used to select packages that should
 *        be excluded from the set of packages checked during configuration.
 *
 *    - `xdc.cfg.check.fatal`
 *        if set to "`false`", force any incompatibilities detected to be
 *        treated as warnings only; otherwise incompatibilities are fatal
 *  @p
 *  Of course, it is also possible to use both options together to achieve
 *  a desired effect.
 *
 *  To define these environment variables one must pass the appropriate `-D`
 *  options to the XDCscript shell (`xs`) which is used to run the
 *  `{@link xdc.tools.configuro configuro}` command line configuration tool.
 *  If, on the other hand, you are using `xdc` to run the configuration step
 *  you can set these variables by setting the
 *  `{@link xdc.bld.Executable#Attrs xsopts}` attribute of an
 *  `{@link xdc.bld.Executable}` within a build script.
 *
 *  @a(Controlling Compatibility Checks)
 *  To treat compatibility check failures as warnings for the executable
 *  `app`:
 *  @p(code)
 *    Pkg.addExecutable("app", targ, targ.platform, {
 *         xsopts: "-Dxdc.cfg.check.fatal=false"
 *    });
 *  @p
 *
 *  To ignore any incompatibilities triggered by targets used by the
 *  `ti.targets.rts*` packages:
 *  @p(code)
 *    Pkg.addExecutable("app", targ, targ.platform, {
 *        xsopts: "-Dxdc.cfg.check.exclude='ti.targets.rts.*'"
 *    });
 *  @p
 *  In this case, the `xdc.cfg.check.exclude` option is regular expression used
 *  to exclude any package whose names matches the regular expression from the
 *  checks.
 *
 *  Finally, if you don't want to set `xsopts` on each executable, it is
 *  possible to set it for all executables within a package by setting the
 *  `xsopts` attribute of the `{@link xdc.bld.PackageContents}` (a.k.a. `Pkg`)
 *  object.  For example, to turn all compatibility checks into warnings for
 *  all executables in a package, add the following line to the package's
 *  build script:
 *  @p(code)
 *    Pkg.attrs.xsopts = "-Dxdc.cfg.check.fatal=false";
 *  @p
 *
 *  @a(Throws)
 *  `XDCException` exceptions are thrown for fatal errors. The following error
 *  codes are reported in the exception message:
 *  @p(dlist) 
 *      -  `xdc.cfg.USE_MODULE_PARAMETER_ERROR`
 *           The first parameter of an `xdc.useModule()` call must be a string.
 *           This error is raised if the first parameter is of any other type.
 *      -  `xdc.cfg.CONFIG_ERROR`
 *           This is a general error reported when the program configuration
 *           fails. This error is caused by one or more configuration errors.
 *           The list of those specific errors precedes this error.
 *      -  `xdc.cfg.INCOMPATIBLE_TARGET_VERSION`
 *           This is an error or a warning usually reported when the version of 
 *           the compiler used in the current build is not compatible with the
 *           version of the compiler used to build some of the loaded packages.
 *           The compiler version might be encoded in the compatibility keys
 *           displayed in the error message, but it is not required. Please
 *           check the documentation of the current target's package for the
 *           content of the compatibility keys.
 *  @p
 *
 *  @see xdc.cfg.Program#global
 *  @see xdc.tools.configuro.Main
 */
package xdc.cfg [1, 0, 2] {
    module Program, Main;
    module SourceDir;
}
/*
 *  @(#) xdc.cfg; 1, 0, 2,0; 11-8-2017 17:10:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

