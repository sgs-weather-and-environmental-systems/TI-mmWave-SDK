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
 *  ======== PackageContents.xdc ========
 */
package xdc.bld;

/*!
 *  ======== PackageContents ========
 *  Package container populated by a build script.
 *
 *  This module defines the `PackageContents` object (aliased as `Pkg` in 
 *  build scripts) which represents the contents of a package.  Build scripts
 *  add to this package using the add* methods defined below.
 *
 *  In addition to the items added by the build script, every package has at
 *  least one release, the default release.  If the {@link #defaultRelease}
 *  configuration parameter is not set, a default release will be
 *  implicitly created.
 *
 *  Every library, executable, and repository added to the package is
 *  automatically added to the default release.
 *
 */
metaonly module PackageContents {
    /*!
     *  ======== Attrs ========
     *  Package-level attributes.
     *
     *  These attributes provide package-level defaults for attributes that
     *  provide control over the code generation tools, the configuration
     *  tool, and release options.
     *
     *  @field(profile)  This string names a profile defined by the
     *          executable's target.  A profile specifies a set of compiler,
     *          linker, and archiver options that are to be used when 
     *          compiling and linking code.  Note that these tool options are
     *          in addition to any options specified via `aopts`, `copts`,
     *		etc.
     *
     *          If this field is not specified or set to `null`, the
     *          `"release"` profile will be used.
     *
     *  @field(incs)  This string contains include path options used by
     *          the compiler (or assembler) to locate include files; e.g.,
     *          "`-I ../../include -I ../c55xx`".  Note that the syntax of 
     *          this string may be target dependent.
     *
     *  @field(defs)  This string contains options used by the
     *          compiler (or assembler) to define macros; e.g.,
     *          "`-D_C6xxx -DDEBUG=1`".  Note that the syntax of 
     *          this string may be target dependent.
     *
     *  @field(aopts)  This string contains options used by the assembler
     *          to produce object files; e.g., "`-mP1`".  Note that the syntax
     *          of this string may be target dependent.
     *
     *  @field(copts)  This string contains options used by the C/C++
     *          compiler to produce object files; e.g., "`-o3 -mi1`".  Note
     *          that the syntax of this string may be target dependent.
     *
     *  @field(cfgcopts)  This string contains options used by the C/C++
     *          compiler to compile the generated C config file. If `cfgopts`
     *          is not specified, the options specified in `copts` are
     *          used instead. 
     *
     *  @field(lopts)  This string contains options used by the linker
     *          produce object files; e.g., "`-l mylib.lib`".  Note
     *          that the syntax of this string may be target dependent.
     *
     *  @field(xsopts)  This string contains options passed to the
     *          `{@link http://rtsc.eclipse.org/docs-tip/Command_-_xs xs}`
     *          command that's used to run configuration scripts.  This option
     *          can be used, for example, to define name-value pairs accessible
     *          to configuration scripts via the XDCscript global
     *          `environment` hash-table.  For example, setting `xsopts` to
     *          `"-DFOO=bar"` enables the configuration script to get the
     *          value of `FOO` via the expression `environment["FOO"]`.  For
     *          more information about XDCscript and `environment` see
     *          {@link http://rtsc.eclipse.org/docs-tip/The_XDCscript_Language The XDCscript Language}.
     *
     *  @field(exportCfg)  If this field is set to `true`,  configuration
     *          scripts will, by default, be part of the releases created
     *          by this package.  
     *
     *  @field(exportDoc)  If this field is set to `true`,  generated
     *          documentation will, by default, be part of the releases 
     *          created by this package.  
     *
     *  @field(exportSrc)  If this field is set to `true`, the sources
     *          used to build this package will, by default, be part of the
     *          releases created by this package.
     *
     *  @field(exportExe)  If this field is set to `true`, the executables
     *          created in this package will, by default, be part of the
     *          releases created by this package.
     *
     *  @field(exportAll)  If this field is set to true, all files
     *          in this package that are not known to be generated are in
     *		the release.  If it is unspecified (or set to `null`) these
     *		files will not be added to this release. See
     *          `{@link xdc.bld.Release#Attrs}` for more information about
     *          this option.
     *
     *  @field(relScript)  If this field is non-`null`, the string names a
     *          "release script" that is run to post-process the
     *          files that are part of a release.  Like configuration scripts,
     *          the string names a script file that is searched for first in
     *          the in package's base directory, and then along the package
     *          path.
     *
     *  @field(relScriptArgs)  If this field is non-`null`, the string is
     *          used to initialize the `arguments[]` array which is
     *          accessible to the release script named by `relScript`.  The
     *          elements of the `arguments[]` array are formed from the white
     *          space separated elements of `relScriptArgs`.  If this string
     *          is `null` or empty, the `arguments[]` array has length `0`.
     *
     *  @field(compress) If this field is set to `true`, the package release
     *          archive files will be, by default, compressed; otherwise, the
     *          archives will not be compressed
     *
     *  @field(archiver) This field names the archiver to use when creating a
     *          release.  Two archivers are currently supported:
     *          "tar" and "zip".  If the archiver is set to "zip"
     *          the `{@link #Attrs.compress}` field is implicitly set to
     *          `true`.
     *
     *  @see #attrs
     */
    struct Attrs {
        String  profile;    /*! select appropriate `ITarget.OptionSet` */
        String  aopts;      /*! assembly language options */
        String  copts;      /*! C/C++ compiler options */
        String  cfgcopts;   /*! C/C++ compiler options for the C config file */
        String  defs;       /*! -D options common to C/C++/asm */
        String  incs;       /*! -I options common to C/C++/asm */
        String  xsopts;     /*! xs options */
        String  lopts;      /*! linker options */
        Bool    exportDoc;  /*! if `true`, export generated docs */
        Bool    exportExe;  /*! if `true`, export executables */
        Bool    exportCfg;  /*! if `true`, export program cfg scripts */
        Bool    exportSrc;  /*! if `true`, export all package sources */
        Bool    exportAll;  /*! if `true`, export all non-gen'd files */
        String  relScript;  /*! release files post-processing script */
        String  relScriptArgs;  /*! optional arguments to relScript */
        Bool    compress;   /*! if `true`, compress package release archives */
        String  archiver;   /*! "tar" or "zip"; defaults to "tar" */
    };
    
    /*!
     *  ======== attrs ========
     *  Package attributes.
     *
     *  These attributes are "inherited" by all executables and libraries
     *  added to this package set.
     *
     *  @see xdc.bld.Executable#attrs
     *  @see xdc.bld.Library#attrs
     */
    config PackageContents.Attrs attrs; 

    /*!
     *  ======== cfgDir ========
     *  The directory where all intermediate program files are placed.
     *
     *  During configuration, several files are generated (a C++ source file,
     *  a linker command file, etc.)  these generated files are placed in
     *  the directory specified by this parameter.
     */
    config String cfgDir = "package/cfg/";

    /*!
     *  ======== docDir ========
     *  The directory where generated docs are placed.
     *
     *  If set to a non-`null` value, package documentation will be
     *  automatically generated and placed in this directory.  If
     *  it is not set or set to `null`, no docs will be generated for
     *  this package.
     *
     *  If you set `{@link #Attrs exportDoc}` or `{@link #Attrs exportAll}`
     *  to `true` the generated docs will be included in the appropriate
     *  releases of the package.
     */
    config String docDir;
    
    /*!
     *  ======== imports ========
     *  An array of required packages (and their version) for this package
     *
     *  @a(readonly) This parameter is an array of all prerequisite packages
     *  required by this package.  Each string is of the form:
     *	    @p(code)
     *		<packageName>{<packageCompatibilityKey>
     *	    @p
     *  where `<packageName>` is the name of the required package and
     *  `<packageCompatibilityKey>` is the compatibility key specified in the
     *  `requires` statement of this package.  If no compatibility key is
     *  specified in `package.xdc`, `<packageCompatibilityKey>` is "".
     *
     *  If the package specifies that a requirement is "internal", the
     *  package name is prefixed with a '*' character.  In other words, the
     *  string is of the form:
     *	    @p(code)
     *		*<packageName>{<packageCompatibilityKey>
     *	    @p
     */
    config String imports[];

    /*!
     *  ======== libDir ========
     *  The directory where all intermediate library directories are placed.
     *
     *  Each object file for a library is placed in a sub-directory of this
     *  directory that has a name that matches the name specified in the
     *  `{@link #addLibrary()}` function.
     */
    config String libDir = "package/lib/";

    /*!
     *  ======== libTemplate ========
     *  Template of a common C-file archived into every library
     *
     *  This template can be used to embed package-specific meta-information
     *  into each library produced by the package.  For example, it can be
     *  used to add package version information to each library.
     *
     *  This template is expanded just once in the Build model during
     *  makefile generation.  Thus, the contents of the resulting C-file can
     *  not be library specific.
     *
     *  The template is found using `xdc.findFile()` and, as a result,
     *  `libTemplate` may refer to a template in either the current package
     *  or even in another package.
     *
     *  During expansion of the template, the `this` pointer is the
     *  `PackageContents` module object; i.e., the object that the global
     *  variable `Pkg` references.
     *
     *  The expanded template may refer to the following pre-defined macros:
     *  @p(dlist)
     *      - `__xdc_PKGVERS`
     *          the package compatibility key declared in package.xdc; e.g.
     *          "`1, 2, 3`"
     *      - `__xdc_PKGNAME`
     *          the package's name; e.g., `xdc.bld`
     *      - `__xdc_PKGPREFIX`
     *          the package's prefix; e.g., for the package `xdc.bld` the
     *          prefix would be `xdc_bld_`
     *  @p
     */
    config String libTemplate = null;

    /*!
     *  ======== relDir ========
     *  The directory where all intermediate release files are placed.
     *
     *  Release specific files for a release are placed in a sub-directory of
     *  this directory that has a name that matches the name specified in the
     *  `{@link #addRelease()}` function.
     */
    config String relDir = "package/rel/";

    /*!
     *  ======== producerId ========
     *  Producer ID string
     *
     *  The value of this string is embedded in every release of this
     *  package and can serve as a way to "map" this package to a unique ID
     *  that the producer uses to locate, within their SCM system, the
     *  original sources required to create and maintain this package.
     *
     *  This string is retained and may by displayed by various tools, but 
     *  it is uninterpreted by the XDCtools.
     */
    config String producerId;

    /*!
     *  ======== version ========
     *  The package version string.
     *
     *  @a(readonly) This parameter is a version string that comes from the
     *  `package.xdc` specification.
     */
    config String version;

    /*!
     *  ======== interfaces ========
     *  An array of interface names provided by this package.
     *
     *  @a(readonly) This parameter is an array of all interface names
     *  defined by this package.
     */
    config String interfaces[];

    /*!
     *  ======== makePrologue ========
     *  String to add to the beginning of the generated makefile.
     *
     *  This string is placed at the very beginning of the package's
     *  generated makefile.  This allows one to extend the build
     *  environment using any facility available to GNU make.
     */
    config String makePrologue = "";

    /*!
     *  ======== makeEpilogue ========
     *  String to add to the end of the generated makefile.
     *
     *  Similar to makePrologue except that this string is placed at
     *  the very end of the generated makefile.
     */
    config String makeEpilogue = "";

    /*!
     *  ======== defaultRelease ========
     *  The default release for this package.
     *
     *  If this configuration parameter is defined, it is taken to be the
     *  default release instance; otherwise a default instance is created
     *  with the appropriate defaults.
     *
     *  If this release's `label` attribute is `undefined` or `null`, it is
     *  set to `"default"` before the release is generated; otherwise the
     *  label attribute is unchanged from what the user specified for this
     *  instance.
     *
     *  The implicitly created default release is created as follows:
     *  @p(code)
     *	    PackageContents.addRelease(name, {label: "default"})
     *  @p
     *  where `name` is the package's name with all '.'s replaced with '_'.
     */
    config Release.Instance defaultRelease;

    /*!
     *  ======== releasePrefix ========
     *  A prefix appended to the name of each release archive.
     *
     *  This configuration parameter allows one to generate release archives
     *  somewhere other than inside the package being built.  `releasePrefix`
     *  is prepended to the name of the release name to form the name of the
     *  release archive.
     *
     *  For example, setting `releasePrefix` to `"../"` implies that a 
     *  release named `"exports/foo"` generates an archive file named
     *  `foo.tar` in the directory `"../exports"`.
     *
     * `releasePrefix` must either begin with the '^' character or be a
     *  relative path that is relative to the package's "base" directory;
     *  i.e., the directory containing the package's specification file
     *  `package.xdc`.
     *
     *  If `releasePrefix` begins with the '^' character, the remainder of
     *  the string is treated as though it is relative to the package's
     *  repository.  In effect, the '^' character is replaced with an
     *  appropriate number of '../' sequences to sufficient to navigate to
     *  the package's repository.
     *
     *  For example, suppose your packages are in a repository named `"src"`.
     *  Setting `releasePrefix` to `"^/../exports"` implies that a release
     *  named `"foo"` generates an archive file named `foo.tar` in the
     *  directory named `"exports"` which is a sibling of `"src"` - the
     *  package's repository.
     *
     *  This prefix can be overridden on a per release basis; see
     *  `{@link xdc.bld.Release#Attrs}`.
     *
     *  @a(note) If this parameter starts with `".."` or `"^"`, the resulting
     *  archive file will not be removed as part of a package clean.
     */
    config String releasePrefix = "";
    
    /*!
     *  ======== modules ========
     *  An array of module names provided by this package.
     *
     *  @a(readonly) This parameter is an array of all module names
     *  implemented in this package.
     */
    config String modules[];

    /*!
     *  ======== name ========
     *  Name of this package
     *
     *  @a(readonly) This parameter is the name of this package as
     *  specified by the `package.xdc` package specification file
     */
    config String name;

    /*!
     *  ======== otherFiles ========
     *  Array of files to include this package.
     *
     *  This is an array of arbitrary file names that are to be included
     *  in the package.
     *
     *  Only those files that are not already directly (or indirectly)
     *  named by adding executables or libraries to this package set need
     *  to appear in this array.
     *
     *  @see #excludeDirs
     */
    config String otherFiles[];

    /*!
     *  ======== excludeDirs ========
     *  List of directory base names to exclude
     *
     *  This is an array of arbitrary directory "base names" that should
     *  be excluded in this release of the package.  This list only
     *  excludes directories that would otherwise be added due to the
     *  recursive include of a parent directory.
     *
     *  For example, if a directory is specified in `{@link #otherFiles}`
     *  all of its sub-directories will be added unless those sub-directories
     *  are named in the `excludeDirs` list.
     *
     *  This list is often used to exclude "hidden" directories added by
     *  change control systems and IDEs (`.svn`, `.git`, `.settings`, ...).
     *
     *  @see #otherFiles
     *  @see Release#excludeDirs
     */
    config String excludeDirs[];

    /*!
     *  ======== generatedFiles ========
     *  Array of generated files
     *
     *  This is an array of arbitrary file names that are to be removed
     *  during a clean of this package.  File names that end with the `'/'`
     *  character are assumed to be directories; in this case, the directory
     *  and all of its contents are removed during the clean.
     *
     *  Only those files that are not already directly (or indirectly)
     *  named by adding executables or libraries to this package set need
     *  to appear in this array.
     */
    config String generatedFiles[];

    /*!
     *  ======== otherSrcs ========
     *  Array of source files to include this package.
     *
     *  Like otherFiles except that the file names listed here are to be
     *  post-processed by the xdc document preparation tools.  This array
     *  only needs to specify files that are not implicitly specified via
     *  any of the addObjects function; e.g., script files, hand-crafted
     *  headers, etc.  
     */
    config String otherSrcs[];
    
    /*!
     *  ======== packagePath ========
     *  This configuration parameter allows one to set the package
     *  path from within the build script.  This setting overrides
     *  the setting of `XDCPATH` either in the environment or on the
     *  command line.
     *
     *  @b(deprecated)  `XDCPATH` should be set on the command line or in
     *  the environment.  This avoids the confusion that will result from
     *  different package paths being used to generate the makefiles from
     *  the package path used to build other package contents.
     *
     *  @_nodoc this parameter should not be used!!!!!!
     */
    config String packagePath = null;

    /*!
     *  ======== uses ========
     *  Array of directory suffixes used to locate files.
     *
     *  This array of directory suffixes is used to locate package files 
     *  that are referenced (e.g., via #include) without the package name.
     *
     *  This array names package directory suffixes (found along the
     *  package path) that:
     *  @p(nlist)
     *      -  contain headers included by this package's sources which
     *         are included *without* using the package name, or
     *      -  contain JavaScript "import" files which are included (via
     *         `utils.importFile()`) *without* using the package name.
     *  @p
     *  This mechanism is used to support legacy code that does not
     *  explicitly name the package in the #include statements, and *only*
     *  affects the compiler's -I options (not the package path) and the
     *  configuration tool's import path (`config.importPath`).
     *
     *  Strings in the Pkg.uses array must not be absolute paths.  Each string
     *  in the Pkg.uses array must point to an existing directory that can be
     *  located along the package path.  The generated makefiles create an
     *  absolute path by simply appending the string from `uses[]` to each
     *  directory name in the package path until an existing directory is
     *  found.  The resulting absolute path is then passed to the compiler in
     *  a -I option, for example.
     *
     *  The directories named in this array may include sub-directories of
     *  any package in the package path.
     *
     *  The strings in this array should use '/' to separate directories;
     *  even on Windows systems.  Since Windows supports '/' as a directory
     *  separator, the use of '/' ensures host platform independence.
     *
     *  @a(Example)
     *      The following example allows sources in the current package to
     *      "`#include <tsk.h>`" and have the compiler find `tsk.h` in the
     *      sub-directory ti/bios/include which is contained in some repository
     *      named in the package path (`XDCPATH`):
     *	    @p(code)
     *          var Pkg = xdc.useModule('xdc.bld.PackageContents');
     *          Pkg.uses = ["ti/bios/include", "ti/xdais/legacy"];
     *	    @p
     */
    config String uses[];

    /*!
     *  ======== addLibrary ========
     *  Add specified library to this package
     *
     *  The name of the library archive file is `<name>.a<target_suffix>`,
     *  where `<name>` is the name parameter (which may contain a directory
     *  prefix) and `<target_suffix>` is the suffix specified by the target
     *  parameter (`{@link xdc.bld.ITarget#suffix}`).
     *
     *  The individual objects of each library are located in the directory
     *  `<libDir>/<name>`, where `<name>` is the name parameter and `<libDir>`
     *  is the configurable parameter `{@link xdc.bld.PackageContents#libDir}`.
     *  Thus, the name parameter names *both* an archive file and a
     *  sub-directory (in `PackageContents.libDir`) that contains the objects
     *  in the archive.
     *
     *  @param(name)     library base name; this name is used to create
     *                   *both* an archive and a sub-directory in the
     *                   package's "libDir" directory which
     *                   will contain the target-specific object files.
     *			 See NOTE in `{@link xdc.bld}` for filename rules.
     *
     *  @param(target)   target (a module implementing the
     *                   `{@link xdc.bld.ITarget}` interface) for each built 
     *                   object in the library
     *
     *  @param(libAttrs) optional `library` attributes object
     *			 (`{@link xdc.bld.Library#Attrs}`)
     *
     *  @a(returns)      Returns the `{@link xdc.bld.Library}` instance
     *                   object created.
     *  @a(throws)       `XDCException` exceptions are thrown for fatal
     *                    errors. The following error codes are
     *                    reported in the exception message:
     *                    @p(dlist)
     *                    -  `xdc.bld.INVALID_TARGET`
     *                       This error is reported when a package is being
     *                       built for an unknown target. Ensure that the
     *                       correct targets are mentioned in the package's
     *                       build script.
     *                    -  `xdc.bld.LIBRARY_EXISTS`               
     *                        This error is reported when a package's build
     *                        script specifies multiple libraries with the
     *                        same name. Ensure that the names of the
     *                        libraries to be built are unique.
     *                    -  `xdc.bld.PARAMETER_MISMATCH`
     *                        This error is reported whenever parameters with
     *                        the wrong type  are passed to the method. Ensure
     *                        that the parameters passed have the right type.
     *
     *  @see xdc.bld.PackageContents#libDir
     *  @see xdc.bld.ITarget#suffix
     */
    Library.Instance addLibrary(String name, ITarget.Module target,
                                Library.Attrs libAttrs = {});

    /*!
     *  ======== addExecutable ========
     *  Add specified executable to this package.
     *
     *  The name of the executable file is `<name>.x<target_suffix>`,
     *  where `<name>` is the name parameter (which may contain a directory
     *  prefix) and `<target_suffix>` is the suffix specified by the target
     *  parameter (`{@link xdc.bld.ITarget#suffix}`).
     *
     *  This name is also used to create a sub-directory in the package's
     *  "cfgDir" directory (`{@link xdc.bld.PackageContents#cfgDir}`) to
     *  contain files generated for the benefit of creating the executable.
     *  Thus, the name parameter names *both* an executable file and a
     *  sub-directory (in `PackageContents.cfgDir`) that contains the objects
     *  linked into the executable.
     *
     *  When the executable is added to the package, a `{@link xdc.bld.Test}`
     *  is implicitly added to the executable; thus, every executable has at
     *  least one `Test`.  Attributes for this test can be specified via
     *  `exeAttrs`.
     *
     *  @param(name)     executable base name; this name is used to create
     *                   the file name of the output executable and has the
     *                   form:
     *			 @p(code)
     *                       <name>.x<suffix>
     *			 @p
     *                   where `<suffix>` is the suffix specified by
     *                   the target argument below.  
     *			 See NOTE in `{@link xdc.bld}` for filename rules.
     *
     *  @param(target)   target (`{@link xdc.bld.ITarget}`) for each built
     *                   object linked into the executable.
     *
     *  @param(platform) string name of the platform; this is the name of a
     *                   platform package
     *
     *  @param(exeAttrs) optional executable attrs object
     *                   (`{@link xdc.bld.Executable#Attrs}`)
     *
     *  @a(returns)      Returns the `{@link xdc.bld.Executable}` instance 
     *                   object created.
     *
     *  @a(throws)       `XDCException` exceptions are thrown for fatal
     *                    errors. The following error codes are
     *                    reported in the exception message:
     *                    @p(dlist)
     *                    -  `xdc.bld.INVALID_TARGET`
     *                       This error is reported when a package is being
     *                       built for an unknown target. Ensure that the
     *                       correct targets are mentioned in the package's
     *                       build script.
     *                    -  `xdc.bld.EXECUTABLE_EXISTS`               
     *                       This error is reported when a package's build
     *                       script specifies multiple executables with the
     *                       same name. Ensure that the names of the
     *                       executables to be built are unique. 
     *                    -  `xdc.bld.PARAMETER_MISMATCH`
     *                       This error is reported whenever parameters with
     *                       the wrong type  are passed to the method. Ensure
     *                       that the parameters passed have the right type.
     *           
     */
    Executable.Instance addExecutable(String name, ITarget.Module target,
                        String platform, Executable.Attrs exeAttrs = {});

    /*!
     *  ======== addRepository ========
     *  Add a repository to this package
     *
     *  A repository is a directory that contains packages.  Repositories are
     *  typically named in the user's XDCPATH environment variable and contain
     *  a set of packages that are managed as a group.
     *
     *  This method allows one to bundle several packages together into a
     *  single release (of the package that contains this repository).
     *
     *  @param(repositoryName)	name of a directory (relative to this
     *				package's base) that will contain the packages
     *				added via
     *                          `{@link xdc.bld.Repository#addPackages()}`
     *			 	See NOTE in `{@link xdc.bld}` for filename
     *				rules.
     *
     *  @param(repAttrs)	optional `Repository` attributes associated 
     *				with this repository (see
     *				`{@link xdc.bld.Repository#Attrs}`)
     *
     *  @a(returns)             Returns the `{@link xdc.bld.Repository}` 
     *                          instance object created.
     *
     *  @a(throws)       `XDCException` exceptions are thrown for fatal
     *                    errors. The following error codes are
     *                    reported in the exception message:
     *                    @p(dlist)
     *                    - `xdc.bld.REPOSITORY_EXISTS`
     *                      This error is reported whenever a package's build
     *                      script specifies multiple repositories with the
     *                      same name.  Ensure that the names of the
     *                      repositories specified in the build script are
     *                      unique.
     */
    Repository.Instance addRepository(String repositoryName,
                                      Repository.Attrs repAttrs = {});
     
    /*!
     *  ======== addRelease ========
     *  Add specified release to this package
     *
     *  @param(name)    release base name; this name is used to create
     *                  the file name of the output file and has the
     *                  form:
     *                      <name>.tar
     *			See NOTE in `{@link xdc.bld}` for filename rules.
     *
     *  @param(relAttrs) optional release attributes object
     *			 (`{@link xdc.bld.Release#Attrs}`)
     *
     *  @a(returns)     Returns the `{@link xdc.bld.Release}` instance object
     *                  created.
     *
     *  @a(throws)       `XDCException` exceptions are thrown for fatal
     *                    errors. The following error codes are
     *                    reported in the exception message:
     *                    @p(dlist)
     *                    - `xdc.bld.RELEASE_EXISTS`
     *                      This error is reported whenever a package's build
     *                      script specifies multiple releases with the same
     *                      name.  Ensure that the names of the releases
     *                      specified in the build script are unique.
     *                    - `xdc.bld.INVALID_RELEASE_PREFIX`
     *                      This error is reported whenever a release prefix
     *                      is specified by its absolute path in the package's
     *                      build script.  The release prefix has to be
     *                      relative to the package's base directory.
     *                    - `xdc.bld.INVALID_RELEASE_NAME`
     *                      This error is reported whenever a release name is
     *                      specified by its absolute path in the package's
     *                      build script. The release name has to be relative
     *                      to the package's base directory.
     */
    Release.Instance addRelease(String name, Release.Attrs relAttrs = {});

    /*!
     *  ======== addScript ========
     *  Add a script to this package
     *
     *  Both XDCscript and Korn shell scripts can be added to package.  This
     *  not only allows one to add script utilities to a package, it
     *  also makes it easy to create scripted regression tests.  As with
     *  `Executable`s, it is possible to add `{@link xdc.bld.Test}`s to a
     *  `{@link xdc.bld.Script Script}`; see `{@link xdc.bld.Script#addTest}`.
     *
     *  @param(name)    name of the script to add to this package.  Script
     *                  names are simply the script's filename relative to
     *                  the package's base directory.  Scripts can have any
     *                  extension, but if the extension is "`.sh`" or "`.ksh`"
     *                  a Korn shell compatible shell is used to run the
     *                  script's tests; otherwise it is assumed to be an
     *                  XDCscript file and any tests will be run by the
     *                  XDCscript interpreter `xs`.
     *
     *  @param(scriptAttrs) optional script attributes object
     *			 (`{@link xdc.bld.Script#Attrs}`)
     *
     *  @a(returns)      Returns the `{@link xdc.bld.Script}` instance
     *                   object created.
     *
     *  @a(throws)       `XDCException` exceptions are thrown for fatal
     *                    errors. The following error codes are
     *                    reported in the exception message:
     *                      @p(dlist)
     *                      - `xdc.bld.SCRIPT_EXISTS`
     *                        This error is reported whenever a package's build
     *                        script specifies multiple user scripts with the
     *                        same name. Ensure that the names of the user
     *                        scripts are unique.
     */
    Script.Instance addScript(String name, Script.Attrs scriptAttrs = {});
    
    /*!
     *  ======== addAssembly ========
     *  @_nodoc assemblies are experimental not fully qualified/tested
     *          entities
     *  @a(returns)      Returns the `{@link xdc.bld.Assembly}` instance
     *                   object created.
     *
     *  @a(throws)       `XDCException` exceptions are thrown for fatal
     *                    errors. The following error codes are
     *                    reported in the exception message:
     *                    @p(dlist)
     *                    - `xdc.bld.INVALID_TARGET`
     *                      This error is reported when a package is being
     *                      built for an unknown target. Ensure that the
     *                      correct targets are mentioned in the package's
     *                      build script.
     */
    Assembly.Instance addAssembly(String name, ITarget.Module target,
    	String platform, Executable.Attrs exeAttrs = {});

    /*!
     *  ======== addConfiguration ========
     *  @_nodoc
     */
    Configuration.Instance addConfiguration(String name, ITarget.Module target,
    	String platform, Configuration.Attrs cfgAttrs = {});

    /*!
     *  ======== onInit ========
     *  @_nodoc this function is called from the bld package's 
     *          initialization function to initialize this module.
     *
     *  @a(throws)       `XDCException` exceptions are thrown for fatal
     *                    errors. The following error codes are
     *                    reported in the exception message:
     *                    @p(dlist)
     *                    - `xdc.bld.INCORRECT_PACKAGE_NAME`
     *                      This error is reported whenever package name does
     *                      not match the directory name. Package names should
     *                      match the directory layout. For example the
     *                      package `ti.sdo.ce.osal` should be created in the
     *                      directory `ti\sdo\ce\osal`. 
     *                    - `xdc.bld.CREATE_DIR_ERROR`
     *                      This error is reported whenever there is an error
     *                      in creating package directories. This maybe
     *                      related with issues with the host filesystem.
     *                      Check whether directories
     *                      can be created manually in the `package`
     *                      sub-directory.
     */
    function onInit();
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

