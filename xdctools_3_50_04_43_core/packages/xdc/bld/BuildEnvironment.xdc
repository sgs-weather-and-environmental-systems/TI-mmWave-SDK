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
/*
 *  ======== BuildEnvironment.xdc ========
 */
package xdc.bld;

/*!
 *  ======== BuildEnvironment ========
 *  Global build environment
 *
 *  This module defines a global object (aliased as '`Build`' in build scripts)
 *  which is configured by a build "startup" script and read by package build
 *  scripts.
 *
 *  This module's configuration parameters are initialized by
 *  a "startup" script that is run prior to running a package's build
 *  script (`package.bld`).  This script (often named "`config.bld`") is
 *  responsible for specifying the the `{@link xdc.bld.ITarget#rootDir}`
 *  configuration parameter of all targets that appear in the
 *  `{@link #targets}` array; the `rootDir` configuration parameter specifies
 *  the absolute path to the installation directory of the compiler used to
 *  build for the specified target.  Typically one startup script is used to
 *  establish an environment for multiple packages.
 *
 *  Note: it does not matter if you do not have tools for all the targets
 *  mentioned in the startup script; if you do not build for a target,
 *  its setting in the startup script is irrelevant.
 *
 *  The startup script may configure this module as a function of the
 *  following global variables that exist before this script runs:
 *  @p(dlist)
 *    - `environment`
 *          a hash table of environment strings
 *    - `arguments`
 *          an array of string arguments to the `config.bld` script
 *          initialized as follows:
 *              `arguments[0]` - the file name of the `config.bld` script;
 *              `arguments[1]` - the first argument specified in `XDCARGS`;
 *                  ...;
 *              `arguments[n]` - the nth argument in `XDCARGS`.
 *    - `Build`
 *          an alias for this module (`xdc.bld.BuildEnvironment`)
 *          The following parameters of this object are initialized
 *          before the startup script runs:
 *              `hostOS`     - `{@link #HostOS}` enumeration identifier;
 *              `hostOSName` - "Windows", "Linux", "MacOS" or "Solaris"
 *    - `Pkg`
 *          an alias for this module (`xdc.bld.PackageContents`)
 *          The following parameters of this object are initialized
 *          before the startup script runs:
 *              `{@link PackageContents#name}` - the name of the current
 *              package;
 *              `{@link PackageContents#modules}` - array of module names
 *              supplied by this package; and
 *              `{@link PackageContents#interfaces}` - array of interface
 *              names supplied by this package
 *  @p
 *  When you build a package, the `xdc` command looks for the startup file
 *  using the following algorithm: 
 *  @p(nlist)
 *      -   if `XDCBUILDCFG` is defined on the `xdc` command line, its value is
 *          used;
 *      -   if `config.bld` exists in the current directory, this file is used;
 *      -   if `XDCBUILDCFG` is defined as an environment variable, its value
 *          is used;
 *      -   if `config.bld` exists along the package path (i.e. in `$XDCPATH`
 *          followed by the current package's repository), the first such
 *          file is used;
 *      -   if `$XDCROOT/config.bld` exists this file is used;
 *      -   if `$XDCROOT/etc/config.bld` exists, this file is used; and
 *          finally
 *      -   if no "startup file" can be found above, a fatal error is
 *          reported and the `xdc` command terminates with a non-zero exit
 *          status.
 */
metaonly module BuildEnvironment {

    /*!
     *  ======== HostOS ========
     *  An enumeration of all supported development hosts
     *
     *  @see #hostOS
     */
    enum HostOS {
        WINDOWS,    /*! Win32 Intel development host */
        SOLARIS,    /*! SUN OS 5.x development host */
        LINUX,      /*! Linux development host */
        MACOS       /*! MacOS development host */
    };

    /*!
     *  ======== hostOS ========
     *  Enumerated constant that identifies the host OS that is executing
     *  the build script
     *
     *  Note that host OS at the time the makefiles are created may be
     *  different from the host OS at the time sources are compiled!
     */
    readonly config HostOS hostOS;

    /*!
     *  ======== hostOSName ========
     *  The name of the development host
     *
     *  One of the strings: "Windows", "Solaris", "Linux", "MacOS". This name is
     *  name of the host OS that is executing the package's build script.
     */
    readonly config String hostOSName;

    /*!
     *  ======== useTargets ========
     *  The set of targets to use if the `{@link #targets}` array
     *  is empty
     *
     *  `useTargets` is a string of white space separated target names 
     *  (i.e., names of modules that implement `{@link xdc.bld.ITarget}`) or
     *  regular expression patterns matching target names.
     *
     *  If the `Build.{@link #targets}` array is empty at the end of the
     *  build model's configuration script, targets specified by this string
     *  are added to the build model's `{@link #targets}` array.
     *
     *  In addition to module names, the distinguished string
     *  `"native"` is interpreted as an alias for the target
     *  specified by the `{@link #nativeTarget}` configuration
     *  parameter.
     *
     *  Special values:
     *  @p(dlist)
     *     -`undefined`
     *          use the environment variable `XDCTARGETS`;
     *     -`null`
     *          initialize the `{@link #targets}` array to be empty; and
     *     -`""`
     *          use all TI targets (i.e., "`ti.targets\..*`").
     *
     *  @see #excludeTargets
     *  @see #nativeTarget
     */
    config String useTargets;

    /*!
     *  ======== excludeTargets ========
     *  A set of targets to exclude from the set specified by
     *  `{@link #useTargets}`
     *
     *  This string parameter is a single regular expression used to exclude
     *  targets from the set specified by `useTargets` (or `XDCTARGETS`).
     *
     *  If `{@link #targets}` is initialized by the build model's
     *  configuration script (i.e., has length > 0) this parameter is
     *  ignored.
     *
     *  If this string is `null` or `undefined`, nothing is excluded from 
     *  list specified by `{@link #useTargets}` or the environment variable
     *  `XDCTARGETS`.
     *
     *  @see #useTargets
     *  @see #nativeTarget
     */
    config String excludeTargets;

    /*!
     *  ======== targets ========
     *  Array of all targets that are supported for the current build
     *
     *  This array may be explicitly initialized by the build model's
     *  initial configuration script (by default, "`config.bld`").  For
     *  example, the following fragment specifies that just the
     *  `ti.targets.C64` target should be used:
     *  @p(code)
     *      // get the ti.targets.C64 module
     *      var C64 = xdc.module('ti.targets.C64');
     *
     *      // add the ti.target.C64 module to BuildEnvironment.targets array
     *      Build.targets[Build.targets.length++] = C64;
     *  @p
     *  Alternatively, this array can be implicitly initialized via the
     *  `XDCTARGETS` environment variable or the `{@link #useTargets}`
     *  and `{@link #excludeTargets}` strings.  The `{@link #targets}` array
     *  is implicitly initialized if and only if the length of this array is
     *  0 after the build model's configuration script completes.
     *
     *  All targets that are in this array *must* have their
     *  `{@link xdc.bld.ITarget#rootDir}` property set.
     *
     *  @see #excludeTargets
     *  @see #useTargets
     */
    config ITarget.Module targets[];

    /*!
     *  ======== nativeTarget ========
     *  A target that defines the "native" target
     *
     *  This parameter allows build scripts to refer to the "native"
     *  target without explicitly naming the target.
     *
     *  For example, a `package.bld` script may add a library via:
     *  @p(code)
     *      Pkg.addLibrary("lib", Build.nativeTarget);
     *  @p
     *  In addition, it is possible to use `"native"` in `XDCTARGETS` or
     *  `{@link #useTargets}` to specify that
     *  `{@link #nativeTarget}` be added to the `{@link #targets}` array.
     *  Thus, it is possible to use the following command on *any* host to
     *  build for that host:
     *  @p(code)
     *      xdc XDCTARGETS=native
     *  @p
     *
     *  If this parameter is not set by the build model's configuration
     *  script, it is initialized to an appropriate default native target:
     *  @p(blist)
     *      - `{@link microsoft.targets.Win32}` for Windows hosts;
     *      - `{@link gnu.targets.Sparc}` for Solaris hosts; and
     *      - `{@link gnu.targets.Linux86}` for Linux hosts.
     *  @p
     */
    config ITarget.Module nativeTarget = null;

    /*!
     *  ======== platformTable ========
     *  A map of platform instance names to the parameters used to
     *  create them
     *
     *  This map allows one to define platform instances that require
     *  non-default parameter settings.  It also provides a way to
     *  publish a set of platforms to be shared among multiple build
     *  scripts.
     *
     *  @a(EXAMPLES)
     *  The following fragment defines a platform instance named
     *  `"ti.platforms.sim6xxx:big"` that corresponds to a platform instance
     *  created by the `ti.platforms.sim6xxx.Platform` module with the
     *  parameters `{endian: "big"}`:
     *  @p(code)
     *    Build.platformTable["ti.platforms.sim6xxx:big"] = {endian: "big"};
     *  @p
     *
     *  The following fragment redefines the default platform instance for
     *  the platform package `ti.platforms.sim6xxx` by specifying alternative
     *  instance creation parameters.
     *  @p(code)
     *    Build.platformTable["ti.platforms.sim6xxx"] = {
     *        endian: "little", verbose: false, ftpath: "c:/ftsuite_1_5",
     *    };
     *  @p
     *  Some platforms are "software abastractions" that can emulate a large
     *  number different physical platforms.  In the example below, the
     *  `ti.platforms.sim6xxx` platform package is capable of simulating
     *  any TMS320C6xxx device.  This particular platform package uses the
     *  name of the instance to determine the specific device that it should
     *  emulate.  So, the fragment below specifies a platform instance named
     *  `"ti.platforms.sim6xxx:TMS320C6416"` that emulates the `TMS320C6416`
     *  device, in little endian mode.
     *  @p(code)
     *    Build.platformTable["ti.platforms.sim6xxx:TMS320C6416"] = {
     *        endian: "little"
     *    };
     *  @p
     *  Software platform packages, such as the `ti.platforms.generic`, can
     *  even go as far as emulating any device from any "catalog" of
     *  devices.  In this example, we use the `ti.platforms.generic`
     *  platform package to define an instance named
     *  `ti.platforms.generic:c6416` that corresponds to a platform
     *  containing the TMS320C6416 device specified in the `ti.catalog.c6000`
     *  package of devices.
     *  @p(code)
     *    Build.platformTable["ti.platforms.generic:c6416"] = {
     *        deviceName: "TMS320C6416",
     *        catalogName: "ti.catalog.c6000",
     *    };
     *  @p
     *  @see ti.catalog.c6000
     *  @see ti.platforms.generic
     *  @see ti.platforms.sim6xxx
     */
    config any platformTable[string] = [];
    
    /*!
     *  ======== platforms ========
     *  Cache of all platform objects added via `{@link #usePlatform}`
     *  @_nodoc
     */
    config any platforms[string];

    /*!
     *  ======== usePlatform ========
     *  @_nodoc
     *
     *  Instantiate the specified platform
     *
     *  The parameter `name` must contain the qualified name of a platform
     *  package, and may also contain a platform instance name separated from
     *  the package name by a ':'. Therefore, accepted names include both
     *  "joes.platform.foo" and "joes.platform.foo:bar", where the first name 
     *  creates an unnamed instance of the platform `joes.platform.foo`, while 
     *  the second name creates an instance named `bar` of the same platform.
     *
     *  @param(name)  name of platform to create
     *
     *  @a(returns)
     *  `usePlatform()` returns the platform instance object
     *  (`xdc.platform.IPlatform.Instance`) specified by `name`.
     *
     *  @a(throws)
     *  `XDCException` exceptions are thrown for fatal errors. The following
     *  error codes are reported in the exception message:
     *  @p(dlist)
     *      -  `xdc.bld.PARAMETER_MISMATCH`
     *      This error is reported whenever parameters with the wrong type
     *      are passed to the method. Ensure that the parameters passed have
     *      the right type.
     */
    function usePlatform(name);
    
    /*!
     *  ======== isInTargetsArray ========
     *  Test whether a target is in of the `targets` array
     *
     *  @_nodoc
     *
     *  @param(target)  `xdc.bld.ITarget` target object to test
     */
    Bool isInTargetsArray(ITarget.Module target);
    
    /*!
     *  ======== printBuildTargets ========
     *  @_nodoc
     */
    String printBuildTargets();

    /*!
     *  ======== onInit ========
     *  @_nodoc this function is called from the `xdc.bld` package's 
     *          initialization function to initialize this module.
     */
    function onInit();

    /*!
     *  ======== getReleaseDescs ========
     *  Return a description of all releases for the specified package
     *
     *  This function allows a "package of packages" to select appropriate
     *  releases from another package based on information provided by that
     *  package.
     *
     *  @param(pname)   name of the package to get the release 
     *                  information from
     *
     *  @a(returns)     array of `{@link xdc.bld.Release#Desc}`
     *                  structures that describe the releases specified
     *                  by `pname`'s build script
     *
     *  @a(throws)      `XDCException` exceptions are thrown for fatal
     *                   errors. The following error codes are
     *                   reported in the exception message:
     *                   @p(dlist)
     *                   - `xdc.bld.PACKAGE_NOT_BUILT`
     *                      This error is reported when a consumer tries to
     *                      use a package that has not been built. Ensure that
     *                      the required package has been built by `XDCtools`.
     *                   -  `xdc.bld.INVALID_PACKAGE`
     *                      This error is reported when a consumer tries to
     *                      use a corrupted package. Try rebuilding the
     *                      package causing the problem.
     *
     *  @see xdc.bld.Release#Desc
     */
    Release.DescArray getReleaseDescs(String pname);

    /*!
     *  ======== initializeModel ========
     *  @_nodoc
     *  Initialize the build model
     *
     *  @param(args)    - an array of arguments whose first element is
     *                    the path to a config.bld script and subsequent
     *                    arguments are the argument (usually) specified
     *                    by `XDCARGS`.
     */
    function initializeModel(args);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:15; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

