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
 *  ======== IPackage.xdc ========
 */
package xdc;

/*!
 *  ======== IPackage ========
 *  Base interface implemented by all packages.
 *
 *  If a package does not specify a function declared in
 *  `IPackage`, the default defined in this package is used.
 *
 *  Packages must implement `IPackage` functions in the package's `package.xs`
 *  file.  This file simply defines a function with the same name as that
 *  declared in the the this specification.  For example, to implement the
 *  `{@link #getLibs()}` function the following must appear in the package's
 *  `package.xs` file:
 *  @p(code)
 *      function getLibs(prog)
 *      {
 *           ...
 *      }
 *  @p
 *
 *  @a(Note)
 *  Since most `IPackage` functions can be called in any model, any access to
 *  global variables specific to a particular object model should happen only
 *  if the function is called in the context of that model. For example, the
 *  variable `Program` is a global variable in the Configuration Model
 *  (`{@link xdc.cfg.Program}`). Any access to it should happen after a check
 *  that the current model is the Configuration Model:
 *  @p(code)
 *      if (xdc.om.$name == "cfg") {
 *          print(Program.build.target.name);
 *      }
 *  @p
 *  For additional information about `xdc.om`, see
 *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_-_xdc.om xdc.om} in the
 *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_Language_Reference XDCscript Language Reference}.
 */
metaonly interface IPackage {
    /*!
     *  ======== LibDesc ========
     *  Library properties from the Build Object Model (BOM)
     *
     *  This structure defines library properties that are
     *  carried forward from the Build Model into the Configuration Model.
     *
     *  @field(target)    target for which the library was built.
     *  @field(suffix)    the suffix associated with the named target.
     *
     */
    struct LibDesc {
        String target;  /*! target name */
        String suffix;  /*! suffix property of the named target */
    }

    /*!
     *  ======== BuildAttrs ========
     *  Package-level attributes from the Build Object Model (BOM)
     *
     *  This structure defines a set of package-level attributes that are
     *  carried forward from the Build Model into the Configuration Model.
     *
     *  @field(getLibs)   the JavaScript function that should be used when
     *                    the package participates in a program configuration
     *                    script.  This field contains the function specified
     *                    by a package's build script
     *  @field(libraries) an array of archive names created by this package.
     *                    Each name is a package-relative file name of an
     *                    archive within the package.
     *  @field(libDesc)   a map of library descriptors.  This map is indexed
     *                    by names that appear in the `libraries` array.
     */
    struct BuildAttrs {
        String  libraries[]; /*! array of archive names produced by this pkg */
        LibDesc libDesc[string]; /*! desriptors for elements in `libraries` */
        any     getLibs;     /*! `getLibs` function defined by build script */
    };

    /*!
     *  ======== packageBase ========
     *  The absolute path to the package's "base" directory
     *
     *  This parameter contains an absolute path to the directory
     *  containing the package's build script (`package.bld`). For example,
     *  if the package `ti.bios` is located in `c:/packages/ti/bios`, then
     *  `packageBase` equals `c:/packages/ti/bios/`.
     *
     *  To be robust, clients should not assume that this string ends with a
     *  directory separator.
     *
     *  @a(readonly)  This parameter is set when the package is first loaded
     *  and should not be modified by any other script.
     */
    config string packageBase;

    /*!
     *  ======== packageRepository ========
     *  The absolute path to the repository containing the package
     *
     *  This parameter contains an absolute path to the directory
     *  containing the full directory namespace of the package.  For
     *  example, if the package `ti.bios` is located in `c:/packages/ti/bios`,
     *  then `packageRepository` equals `c:/packages/`.
     *
     *  To be robust, clients should not assume that this string ends with a
     *  directory separator.
     *
     *  @a(readonly)  This parameter is set when the package is first loaded
     *  and should not be modified by any other script.
     */
    config string packageRepository;

    /*!
     *  ======== build ========
     *  The package information from the Build Object Model (BOM)
     *
     *  @a(readonly)  This parameter is set when the package is first loaded
     *  and should not be modified by any other script.
     */
    config BuildAttrs build;

    /*!
     *  ======== profile ========
     *  The profile requested by a configuration script.
     *
     *  This parameter is set by configuration scripts to convey additional
     *  information to the package about the libraries being requested from
     *  this package; in particular, it names a specific profile supported by
     *  this package (see {@link xdc.bld.ITarget#profiles}).
     *
     *  Package `{@link #getLibs()}` functions should refer to this parameter
     *  in lieu of the program's `build.profile`.  This allows configuration
     *  scripts to selectively request debug or release libraries on a per
     *  package basis, for example.
     *
     *  @p(code)
     *  function getLibs(prog)
     *  {
     *      if (this.profile == "debug") {
     *          ...
     *      }
     *  }
     *  @p
     *
     *  If this parameter is not set by the configuration script, it is
     *  initialized to `{@link xdc.cfg.Program#build.profile}` prior to
     *  generating and configuration files; i.e., the package's
     *  `{@link #getLibs()}` function can assume that this field is always
     *  set and defaults to the profile used to build the executable.
     */
    config string profile;

    /*!
     *  ======== init ========
     *  Initialize this package when first imported
     *
     *  This function is called to initialize the package within any
     *  model.  It is called just once (when the package is first imported)
     *  so there is no need to explicitly check for prior invocation.
     *
     *  The default implementation of this function is a nop.
     *
     *  @a(context)
     *  @p(dlist)
     *    - `this`
     *          The current package's `xdc.IPackage.Module` object
     *          before any model-specific user script runs (e.g. a program's
     *          configuration script),
     *          after the package's `package.xs` script is run and all
     *          the package's modules are created, and before the
     *          package is added to `xdc.om.$packages` (the Object Model's
     *          package array)
     *
     *  @a(returns) Returns nothing.
     *
     *  @a(throws)  `Error` exceptions are thrown for fatal errors.
     *
     *  @a(Note)
     *  This function can be called in any model, so any access to
     *  global variables specific to a particular object model should happen
     *  only if the function is called in the context of that model. For
     *  example, the variable `Program` is a global variable in the
     *  Configuration Model (`{@link xdc.cfg.Program}`). Any access to it
     *  should happen after a check that the current model is the
     *  Configuration Model:
     *  @p(code)
     *      if (xdc.om.$name == "cfg") {
     *          print(Program.build.target.name);
     *      }
     *  @p
     *  For additional information about `xdc.om`, see
     *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_-_xdc.om xdc.om}
     *  in the
     *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_Language_Reference XDCscript Language Reference}.
     */
    function init();

    /*!
     *  ======== close ========
     *  Close this package after user scripts complete.
     *
     *  This function is called to allow the package to modify its state
     *  based on the results of the user's script.  It can optionally
     *  redefine configuration parameters or even throw exceptions to
     *  prevent the configuration step from completing, for example.
     *
     *  Other packages and modules, including the modules in the package, can
     *  change the configuration parameters of any module in the package, after
     *  this function was called. Therefore, this function cannot be used to
     *  validate state of the package and of the whole configuration.
     *  Validation should be done in `{@link #validate()}`.
     *
     *  For all packages A and B, if A requires B, then package A is
     *  closed before package B. 
     *
     *  The default implementation of this function is a nop.
     *
     *  @a(context)
     *  @p(dlist)
     *    - `this`
     *          The current package's `xdc.IPackage.Module` object
     *          immediately after the program's configuration script
     *          has completed and before validation is started.
     *
     *  @a(returns) Returns nothing.
     *
     *  @a(throws)  `Error` exceptions are thrown for fatal errors.
     *
     *  @a(Note)
     *  This function can be called in any model, so any access to
     *  global variables specific to a particular object model should happen
     *  only if the function is called in the context of that model. For
     *  example, the variable `Program` is a global variable in the
     *  Configuration Model (`{@link xdc.cfg.Program}`). Any access to it
     *  should happen after a check that the current model is the
     *  Configuration Model:
     *  @p(code)
     *      if (xdc.om.$name == "cfg") {
     *          print(Program.build.target.name);
     *      }
     *  @p
     *  For additional information about `xdc.om`, see
     *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_-_xdc.om xdc.om}
     *  in the
     *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_Language_Reference XDCscript Language Reference}.
     */
    function close();

    /*!
     *  ======== validate ========
     *  Validate this package after the model's state is "sealed".
     *
     *  This function is called to validate the package's state in the 
     *  curent model.  It can verify semantic constraints and optionally
     *  throw exceptions to prevent the configuration step from completing.
     *
     *  For example, a package that needs to assert incompatibility with
     *  certain versions of prerequisite packages can check the versions in
     *  this function and throw an exception if they are known to be
     *  incompatible with the current package.
     *
     *  This method must not modify the model.
     *
     *  The default implementation of this function is a nop.
     *
     *  @a(context)
     *  @p(dlist)
     *    - `this`
     *          The current package's `xdc.IPackage.Module` object
     *          immediately after the program's configuration script
     *          has completed and before generation started.
     *
     *  @a(returns) Returns nothing.
     *
     *  @a(throws)  `Error` exceptions are thrown for fatal errors.
     *
     *  @a(Note)
     *  This function can be called in any model, so any access to
     *  global variables specific to a particular object model should happen
     *  only if the function is called in the context of that model. For
     *  example, the variable `Program` is a global variable in the
     *  Configuration Model (`{@link xdc.cfg.Program}`). Any access to it
     *  should happen after a check that the current model is the
     *  Configuration Model:
     *  @p(code)
     *      if (xdc.om.$name == "cfg") {
     *          print(Program.build.target.name);
     *      }
     *  @p
     *  For additional information about `xdc.om`, see
     *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_-_xdc.om xdc.om}
     *  in the
     *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_Language_Reference XDCscript Language Reference}.
     */
    function validate();

    /*!
     *  ======== exit ========
     *  Exit this package after the model has been successfully validated.
     *
     *  The default implementation of this function is a nop.
     *
     *  @a(context)
     *  @p(dlist)
     *    - `this`
     *          The current package's `xdc.IPackage.Module` object
     *          immediately after the program's configuration script
     *          has completed and after generation has completed.
     *
     *  @a(returns) Returns nothing.
     *
     *  @a(throws)  `Error` exceptions are thrown for fatal errors.
     *
     *  @a(Note)
     *  This function can be called in any model, so any access to
     *  global variables specific to a particular object model should happen
     *  only if the function is called in the context of that model. For
     *  example, the variable `Program` is a global variable in the
     *  Configuration Model (`{@link xdc.cfg.Program}`). Any access to it
     *  should happen after a check that the current model is the
     *  Configuration Model:
     *  @p(code)
     *      if (xdc.om.$name == "cfg") {
     *          print(Program.build.target.name);
     *      }
     *  @p
     *  For additional information about `xdc.om`, see
     *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_-_xdc.om xdc.om}
     *  in the
     *  {@link http://rtsc.eclipse.org/docs-tip/XDCscript_Language_Reference XDCscript Language Reference}.
     */
    function exit();

    /*!
     *  ======== getLibs ========
     *  Get the libraries necessary to use this package
     *
     *  This function is called during the configuration model's generation
     *  phase (after a program's configuration script completes and all
     *  imported packages are closed) and is responsible for returning a list
     *  of libraries (or object files) that are needed to link the program
     *  being configured.
     *
     *  If the package produces one (or no) library for the target for which
     *  the executable is being built, the default implementation of this
     *  function simply returns the name of this library (or `null`).
     *
     *  If the package produces more than one library for the given target, the
     *  default implementation of this function returns the following library
     *  name:
     *  @p(code)
     *          lib/<package_name>.a<target_suffix>
     *  @p
     *  where `<package_name>` is the name of the package (e.g., "ti.bios")
     *  and `<target_suffix>` is the  {@link xdc.bld.ITarget#suffix} property
     *  of the target used to build the executable.
     *
     *  @param(prog) the configuration model program object
     *              (`{@link xdc.cfg.Program}`) after the program's
     *              configuration script has completed.
     *
     *  @a(context)
     *  @p(dlist)
     *    - `this`
     *          The current package's `xdc.IPackage.Module` object
     *          after the program's configuration script has completed.
     *    - `Program`
     *          The Configuration model program object
     *          (`{@link xdc.cfg.Program}`) after the program's configuration
     *          script has completed.
     *
     *  @a(returns) Returns a string of ';' delimited object (or library) file
     *              names that are added to the list of things to link to
     *              create the program.  The file names are absolute or
     *              relative to the package's base.  All white space is
     *              treated as part of the file name.
     *
     *              If the files named do not exist, a fatal error occurs and
     *              configuration terminates.  However, if the file name
     *              begins with a '!' character, this character is removed,
     *              the remaining name will be assumed to be correct, and the
     *              configuration will not fail just because the file does not
     *              (yet) exist.  This allows `getLibs()` to return the name
     *              of a file that will be created anytime after the
     *              configuration step completes.
     *
     *              If `null` or empty ("") is returned, no libraries or
     *              objects are required for this package.
     *
     *  @a(throws)  `Error` exceptions are thrown for fatal errors.
     */
    function getLibs(prog);

    /*!
     *  ======== getSects ========
     *  Get package-specific linker section data.
     *
     *  This function is called during the configuration model's  generation
     *  phase (after a program's configuration script completes) and is
     *  responsible for returning a template file name that is used to
     *  generate package-specific linker command file statements.
     *
     *  This function is called by the linker command file template. By default,
     *  the template file is specified by a RTSC target's package and all such
     *  template files invoke `getSects()`. However, the configuration parameter
     *  `{@link xdc.cfg.Program#linkTemplate}` allows users to replace the
     *  default template with a custom template file, which may or may not
     *  invoke `getSects`. It is not recommended to create template files that
     *  don't invoke `getSects()`, but no checking is done. Therefore, it is
     *  possible that `getSects()` may not be called in such cases.
     *
     *  @a(context)
     *  @p(dlist)
     *    - `this`
     *          The current package's `xdc.IPackage.Module` object
     *          after the program's configuration script has completed.
     *
     *    - `Program`
     *          The Configuration model program object
     *          (`{@link xdc.cfg.Program}`) after program's configuration
     *          script has completed and all packages have validated the
     *          correctness of the configuration.
     *
     *  @a(returns) Returns the path name of template file.  The path name
     *              must be relative to the package path or be an absolute path.
     *
     *              If `null` is returned, no data is generated.
     *
     *              The template is evaluated in a context where the `this`
     *              pointer is the package object.
     *
     *  @a(throws)  `Error` exceptions are thrown for fatal errors.
     */
    function getSects();
}
/*
 *  @(#) xdc; 1, 1, 1,0; 11-8-2017 17:10:07; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

