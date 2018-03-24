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
/*!
 *  ======== Configuration ========
 *  Partially linked assembly of modules
 *  @_nodoc
 */
metaonly module Configuration {

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
     *          compiler to compile the generated C config file. If `cfgopts`
     *          is not specified, either explicitly or through
     *          `Pkg.attrs.cfgcopts`, the options specified in `copts` are
     *          used instead. 
     *
     *  @field(lopts)  This string contains options used by the linker
     *          produce object files; e.g., "-l mylib.lib".  Note
     *          that the syntax of this string may be target dependent.
     *
     *  @field(xsopts)  This string contains options passed to `xs`
     *          when running configuration scripts; e.g., to turn on the
     *          reporting of warnings this string can be set to "-js -w",
     *          or to define the name-value pair "FOO=bar" available via
     *          the environment hash-table `xsopts` should be set to
     *          "-DFOO=bar".
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
     *          configuration's configuration script.  If this field is set to
     *          `null`, no package will be pre-loaded.  If this field is not
     *          set (or set to `undefined`), the package specified by this
     *          configuration's target will be used (see
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
        String  aopts;          /*! asm options for objs added to this cfg */
        String  copts;          /*! C/C++ options for objs added to this cfg */
        String  cfgcopts;       /*! C/C++ options for the C config file */
        String  defs;           /*! definitions for objs added to this cfg */
        String  incs;           /*! include opts for objs added to this cfg */
        String  lopts;          /*! linker options for this cfg */
        String  xsopts;         /*! `xs` options for this cfg */
        String  cpuId;          /*! optional id of CPU on platform */
        String  rtsName;        /*! optional run time support package name */
        any     cpuArgs;        /*! optional register settings */
        String  cfgScript;      /*! optional name of config script */
        String  cfgHome;        /*! optional home package of config model */
        String  cfgArgs;        /*! optional arguments passed to cfgScript */
        Bool    cfgArgsEncoded; /*! if true, cfgArgs is encoded via escape() */
        Bool    exportCfg;      /*! export executable's config script? */
        Bool    exportSrc;      /*! if true, export cfg sources to releases */
        Release.Instance releases[]; /*! releases that this cfg is a part of */
        String  linkTemplate;   /*! linker command file template for this cfg*/
        Bool    prelink;        /*! if true, partially link cfg */
    };

instance:

    /*!
     *  ======== create ========
     *  @_nodoc
     *  Assemblies should only be created via PackageContents.addConfiguration()
     */
    create();

    String getBaseName();
    
    config String name;
    config String platform;
    config ITarget.Module target;
    config Attrs attrs;
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

