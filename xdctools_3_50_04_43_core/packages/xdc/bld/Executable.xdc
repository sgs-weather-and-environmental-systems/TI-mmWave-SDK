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
 *  ======== Executable.xdc ========
 */
package xdc.bld;

/*!
 *  ======== Executable ========
 *  Model of a file that can be loaded and executed on a platform.
 *
 *  Executable instances represent executable files.  Instances must be
 *  created via the `{@link xdc.bld.PackageContents#addExecutable()}`
 *  function; this ensures that each executable created appears in the
 *  package's manifest and that it properly "inherits" appropriate default
 *  attributes from the containing package.
 */
metaonly module Executable {
    
    /*!
     *  ======== Attrs ========
     *  Optional attributes for an Executable instance.
     *
     *  Unspecified attributes are "inherited" from
     *  `{@link xdc.bld.PackageContents#attrs}`;
     *  i.e., if one of fields in this structure is unspecified *and* this
     *  field's name matches a field name in
     *  `{@link xdc.bld.PackageContents#attrs}`, then this field's value
     *  defaults to the value in specified by
     *  `{@link xdc.bld.PackageContents#attrs}`.  This mechanism makes it
     *  possible to establish package-wide default values for any of the
     *  "inherited" attributes.
     *
     *  Suppose, for example, that you want all executable files in this
     *  package to be built with the 'release' profile, but one particular file
     *  must be built with 'debug' (because it is a source example).  The
     *  following build script fragment shows how this can be accomplished:
     *  @p(code)
     *      Pkg.attrs.profile = 'release';
     *      var exe = Pkg.addExecutable('example', ..., {profile: 'debug'});
     *  @p
     *  @field(cfgArgs) This string may contain any expression that can be
     *          assigned to a JavaScript property.  It is evaluated in
     *          the configuration domain after the platform package is
     *          imported and just prior to running the executable's
     *          configuration script.  Its value (after evaluation) is
     *          assigned to `Program.build.cfgArgs`; so, program
     *          configuration scripts can use this property to adjust their
     *          behavior based on values specified in a build script.
     *
     *          For example, a package's build script might build an
     *          executable for each possible level of a "trace" value:
     *          @p(code)
     *              for (t = 0; t < NUM_TRACE_LEVELS; t++) {
     *                      :
     *                  Pkg.addExecutable("myExe" + t, targ, plat, {
     *                      cfgArgs:   "{traceLevel: " + t + "}",
     *                      cfgScript: "myExe.cfg"
     *                  });
     *              }
     *          @p
     *
     *          In this case, the configuration script `myExe.cfg` can
     *          reference the "trace level" set in the build script by
     *          referencing the `Program.build.cfgArgs` object directly:
     *          @p(code)
     *              if (Program.build.cfgArgs.traceLevel == 1) {
     *                  :
     *              }
     *          @p
     *
     *  @field(cfgArgsEncoded) This boolean flag indicates whether the
     *  string `cfgArgs` should be treated as an encoded string (via ECMA-262
     *  `escape()`) or not.  If this field is `true`, the string is treated
     *  as an encoded string and is decoded via `unescape()` prior to
     *  interpretation.
     *
     *  @field(incs)  This string contains include path options used by
     *          the compiler (or assembler) to locate include files; e.g.,
     *          "-I ../../include -I ../c55xx".  Note that the syntax of 
     *          this string may be target dependent.
     *
     *  @field(defs)  This string contains options used by the
     *          compiler (or assembler) to define macros; e.g.,
     *          "-D_C6xxx -DDEBUG=1".  Note that the syntax of 
     *          this string may be target dependent.
     *
     *  @field(aopts)  This string contains options used by the assembler
     *          to produce object files; e.g., "-mP1".  Note that the syntax
     *          of this string may be target dependent.
     *
     *  @field(copts)  This string contains options used by the C/C++
     *          compiler to produce object files; e.g., "-o3 -mi1".  Note
     *          that the syntax of this string may be target dependent.
     *
     *  @field(cfgcopts)  This string contains options used by the C/C++
     *          compiler to compile the generated C config file. If `cfgcopts`
     *          is not specified, either explicitly or through
     *          `Pkg.attrs.cfgcopts`, the options specified in `copts` are
     *          used instead. 
     *
     *  @field(lopts)  This string contains options used by the linker
     *          produce object files; e.g., "-l mylib.lib".  Note
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
     *  @field(cfgHome)  This string names the package that is bound to
     *          the Configuration Model's `$homepkg`.  This home package
     *          is automatically loaded as part of configuration and, as
     *          a result, may contribute libraries to the configuration.
     *
     *          If this parameter is not specified, the package containing
     *          the configuration script is used as the home package.  This
     *          ensures that the results of a configuration script are
     *          independent of the package building the configuration.  In
     *          most cases, the build package is the package containing the
     *          configuration script and this distinction is not important.
     *          But there are times when it is important to control the home
     *          package; e.g., when an external tool generates a
     *          configuration script from information supplied by another
     *          package or when a configuration script in not in any package.
     *
     *  @field(cfgScript)  This string names the program configuration
     *          script used to create the files necessary to create the
     *          executable.  If `cfgScript` is not specified, the configuration
     *          script is assumed to be `<name>.cfg`, where `<name>` is the
     *          base name of the executable.  If `cfgScript` is set to `null`,
     *          the executable is assumed to be a "legacy" application that
     *          defines `main()` directly and does not require any
     *          `{@link xdc.runtime}` support.
     *
     *          If this string is set to a non-`null` value, and does not have
     *          an extension, then the extension `".cfg"` is automatically
     *          added.
     *
     *          If the specified configuration file does not exist in the
     *          package where the executable is being built and
     *          the name does not begin with `"./"`, it is searched 
     *          for along the package path.  Thus, it is possible to use
     *          configuration scripts in other packages to build executables;
     *          e.g., to use the configuration script "myExe.cfg" from a
     *          `ti.bios.examples.hello` package, `cfgScript` should be set
     *          to `"ti/bios/examples/hello/myExe.cfg"`.
     *
     *          The package containing the specified configuration script is 
     *          imported prior to running the configuration script and this
     *          package is used to set `xdc.$homepkg`; thus, configuration
     *          scripts that use `xdc.$homepkg` will configure the same
     *          executable independent of the package building the executable.
     *
     *  @field(profile)  This string names a profile defined by the
     *          executable's target.  The profile specifies a set of compiler,
     *          linker, and archiver options that are to be used when 
     *          producing the executable.  Note that these tool options are
     *          in addition to any options specified via `aopts`, `copts`,
     *          etc.
     *
     *          If this field is not set or set to `null`, the value of
     *          `{@link xdc.bld.PackageContents#attrs.profile}` is used.  If
     *          `{@link xdc.bld.PackageContents#attrs.profile}` is not
     *          specified or equal to `null`, the `"release"` profile is used.
     *
     *  @field(cpuId)  This string is used to uniquely identify the
     *          particular CPU on a platform that will run the executable; on
     *          platforms that contain a single CPU, this string is ignored.
     *
     *  @field(rtsName)  This string names a package that contributes a
     *          compiled form of the `{@link xdc.runtime}` runtime support
     *          modules.
     *
     *          This package is implicitly loaded prior to running the
     *          executable's configuration script.  If this field is set to
     *          `null`, no package will be pre-loaded.  If this field is not
     *          set (or set to `undefined`), the package specified by this
     *          executable's target will be used (see
     *          {@link xdc.bld.ITarget#rts}) .
     *
     *  @field(cpuArgs)  This field is a hash-table of name-value pairs
     *          interpreted by the CPU as register settings that exist at the
     *          time that the executable is loaded; e.g., it is possible to
     *          specify a non-reset value for the `PMST` register on a C54xx
     *          CPU by setting this parameter to `{PMST: 0xffff}`.
     *
     *  @field(exportCfg)  If this field is set to true, the configuration
     *          script will be part of the releases named in the releases
     *          array.  If it is unspecified (or set to `null`) and the
     *          release specifies that configurations are to be exported,
     *          the configuration script will be part of the release.  In
     *          all other cases, the configuration is not part of the
     *          release.
     *
     *  @field(exportSrc)  If this field is set to true, the sources
     *          specified via `{@link xdc.bld.Executable#addObjects()}`
     *          will be part of the releases named in the releases
     *          array.  If it is unspecified (or set to `null`) and the
     *          release specifies that sources are to be exported,
     *          the sources will be part of the release.  In
     *          all other cases, the sources are not added to the
     *          release.
     *
     *  @field(exportExe)  If this field is set to true, the executable
     *          will be part of the releases named in the releases
     *          array.  If it is unspecified (or set to `null`) and the
     *          release specifies that configurations are to be exported,
     *          the executable will be part of the release.  In
     *          all other cases, the executable is not part of the
     *          release.
     *
     *  @field(releases)  This array contains releases that will contain the
     *          executable.  Thus, a single executable can be part of any set 
     *          of releases.  Each executable is always added to the 
     *          package's "default release" in addition to any releases
     *          specified in the releases array.
     *
     *  @field(test) If this field is set, it defines default attributes for
     *          tests added to this executable, including the implicitly
     *          added test (see {@link xdc.bld.PackageContents#addExecutable}).
     *
     *  @field(linkTemplate) If this field is set, it defines the linker 
     *          command file template to be used to link this executable.  
     *          This specification may, however, be overridden by the
     *          configuration script (see
     *          {@link xdc.cfg.Program#linkTemplate}).
     *
     *          As with configuration scripts, if the specified file does not
     *          exist in the package where the executable is being built and
     *          the name does not begin with `"./"`, it is searched for along
     *          the package path.  Thus, it is possible to use templates in
     *          other packages to build executables; e.g., to use the linker
     *          command file "`myExe.cmd`" from the `ti.bios.examples.hello`
     *          package, `linkTemplate` should be set to
     *          `"ti/bios/examples/hello/myExe.cmd"`.
     *
     *  @see #attrs
     *  @see xdc.bld.PackageContents#Attrs
     */
    struct Attrs {
        String  profile;        /*! target options profile */
        String  aopts;          /*! asm options for objs added to this exe */
        String  copts;          /*! C/C++ options for objs added to this exe */
        String  cfgcopts;       /*! C/C++ options for the C config file */
        String  defs;           /*! definitions for objs added to this exe */
        String  incs;           /*! include opts for objs added to this exe */
        String  lopts;          /*! linker options for this exe */
        String  xsopts;         /*! `xs` options for this exe */
        String  cpuId;          /*! optional id of CPU on platform */
        String  rtsName;        /*! optional run time support package name */
        any     cpuArgs;        /*! optional register settings */
        String  sharedCfg;
        String  cfgScript;      /*! optional name of config script */
        String  cfgHome;        /*! optional home package of config model */
        String  cfgArgs;        /*! optional arguments passed to cfgScript */
        Bool    cfgArgsEncoded; /*! if true, cfgArgs is encoded via escape() */
        Bool    exportExe;      /*! export executable's exe file? */
        Bool    exportCfg;      /*! export executable's config script? */
        Bool    exportSrc;      /*! if true, export exe sources to releases */
        Release.Instance releases[]; /*! releases that this exe is a part of */
        Test.Attrs  test;       /*! test attrs for tests added to this exe */
        String  linkTemplate;   /*! linker command file template for this exe*/
    };

instance:
    /*!
     *  ======== create ========
     *  @_nodoc
     *  Instances should only be created via PackageContents.addExecutable()
     */
    create();

    /*!
     *  ======== name ========
     *  Base name of the executable.
     *
     *  This name is used to construct the final executable file name as
     *  follows:
     *  @p(code)
     *      <name>.x<target_suffix>
     *  @p
     *  where `<name>` is name and `<target_suffix>` is the suffix defined 
     *  by each target that the file is built for. See NOTE in 
     * `{@link xdc.bld}` for filename rules.
     *
     *  Note: if the same executable is to be built for different platforms
     *  (having the same target), then name must "encode" the platform's
     *  name.
     */
    config String name;

    /*!
     *  ======== platform ========
     *  The name of the platform that will run this executable.
     *
     *  Platforms are modeled as packages that have a module called
     *  "Platform"; thus the platform name is really a package name.
     */
    config String platform;

    /*!
     *  ======== target ========
     *  The target (on a platform) that executable should be built for.
     *
     *  This parameter is used to determine the target to use for any
     *  objects added to the executable.
     *
     *  During configuration, the executable's platform package can
     *  validate that the target is compatible with the configuration of
     *  the platform; the target object is accessible via the expression
     *  `Program.build.target`.
     */
    config ITarget.Module target;

    /*!
     *  ======== attrs ========
     *  This executable's optional attributes.
     *
     *  These attributes are "inherited" by all objects added to this
     *  executable; i.e., any object attribute that is undefined but is
     *  defined here will be assigned the value from these attributes.
     *
     *  Similarly, any unspecified attributes that also appear in
     *  `{@link xdc.bld.PackageContents#Attrs}` are inherited from
     *  `{@link xdc.bld.PackageContents#attrs}`.
     *
     *  @see xdc.bld.PackageContents#Attrs
     */
    config Executable.Attrs attrs;

    /*!
     *  ======== addObjects ========
     *  Add specified object to be built and linked into this executable.
     *
     *  All objects added to the executable are built with the symbol
     *  `xdc_cfg__header__` defined to be the name of the executable-specific
     *  C header generated by the program configuration tool.  This symbol
     *  is used by the `xdc/cfg/global.h` header to include the generated
     *  header file; see `{@link xdc.cfg.Program#global}`.  Thus, it is
     *  possible to portably include configuration specific definitions in a
     *  source file that is used in many different configurations.
     *
     *  For example, a portable `main.c` might be structured as follows:
     *  @p(code)
     *      #include <xdc/std.h>
     *      #include <ti/bios/include/log.h>
     *
     *      #include <xdc/cfg/global.h>    // include declaration of trace
     *      
     *      int main(int argc, char *argv[])
     *      {
     *          LOG_printf(trace, "hello world");
     *              :
     *      }
     *  @p
     *
     *  @a(Examples)
     *
     *      1. Locate a source file whose name starts with "hello" with
     *      an extension supported by the executable's target, compile it
     *      and link it into the executable `myExe`:
     *      @p(code)
     *          myExe.addObjects(["hello"]);
     *      @p
     *      If hello.c exists, compile and add to `myExe`, if hello.asm exists
     *      assemble and add to `myExe`, etc.  If no such file is located,
     *      a warning is emitted.
     *
     *      2. Compile hello.c and add to the executable `myExe`:
     *      @p(code)
     *          myExe.addObjects(["hello.c"]);
     *      @p
     *      3. Names may include sub-directory prefixes.  In this case, the
     *      source will be located in a sub-directory of the current
     *      package.  The following statement declares that the file
     *      "`foo/hello.c`" should be compiled and linked into the executable
     *      `myExe`:
     *      @p(code)
     *          myExe.addObjects(["foo/hello.c"]);
     *      @p
     *      As in the previous examples, the extension ".c" is optional. 
     *      In case an extension is not supplied, each extension
     *      understood by the target will be tried until a source file
     *      is located.
     *
     *      4. It is also possible to supply file specific compilation
     *      options.
     *      @p(code)
     *          myExe.addObjects(["fir.c", "iir.c"], {defs: "-D_DEBUG"});
     *      @p
     *      In this case, both files fir.c and iir.c will be compiled
     *      with the "`-D_DEBUG`" flag.  Any setting of `attrs.defs` in the
     *      executable or package is overridden by this definition.
     *
     *  @param(names)       array of base names of the sources of object files
     *                      to be created and linked into the executable.
     * 			    See NOTE in `{@link xdc.bld}` for filename rules.
     *  @param(objAttrs)    optional `{@link xdc.bld.Object#Attrs}` for the
     *                      array of objects added; all objects named by names
     *                      will be given the attributes `objAttrs`.
     *  @a(returns)         `void`
     *
     *  @a(throws)          `Error` exceptions are thrown for fatal errors
     *
     *  @see xdc.cfg.Program#global
     */
    Void addObjects(String names[], Object.Attrs objAttrs = {});

    /*!
     *  ======== addTest ========
     *  Add specified test to executable.
     *
     *  A test encapsulates an executable and a set of arguments passed to
     *  the executable when it is run.
     *
     *  Tests are run by naming the goal "`<test_name>.test`" on the xdc
     *  command line; `<test_name>` is the test's name.
     *
     *  Multiple tests may have the same name; in this case, it is possible
     *  to run all tests using the single goal "`<test_name>.test`" 
     *
     *  @param(testAttrs)   test attrs object (`{@link xdc.bld.Test#Attrs}`)
     *
     *  @a(returns)         the `{@link xdc.bld.Test}` instance object created
     *
     *  @a(throws)          `Error` exceptions are thrown for fatal errors
     */
    Test.Instance addTest(Test.Attrs testAttrs);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

