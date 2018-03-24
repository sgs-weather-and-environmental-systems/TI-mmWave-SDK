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
 *  ======== Main ========
 *  Command-line configuration tool
 *
 *  This command allows RTSC content, in the form of reusable modules built
 *  using the XDCtools tooling, to be imported into a system integrator's
 *  embedded application. It is the recommended method for integrating RTSC
 *  content into non-RTSC application build environments.
 *
 *  Configuro lets the system integrator identify and customize the RTSC
 *  content they wish to use, and computes a set of libraries, command-line
 *  flags and other artifacts to include in their application build. By
 *  changing the values of configuration settings, the integrator can
 *  trade off the functionality, memory footprint, and even performance of
 *  the RTSC content to best meet the needs of their application.
 *
 *  @a(INPUTS)
 *  @p(dlist)
 *    - `infile.cfg`
 *      A user-supplied configuration script that names a set of RTSC
 *      modules, and optionally changes their configuration settings.
 *  @p
 *
 *  @a(OUTPUTS)
 *  @p(dlist)
 *    - `outdir/`
 *      A directory containing all generated build artifacts.
 *    - `outdir/compiler.opt`
 *      A file containing C compiler command-line flags. These flags must
 *      included on the compiler command line for any C source file that
 *      directly accesses the RTSC content. The flags define the header file
 *      include paths, and machine-mode compiler flags to ensure object code
 *      compatibility between all included content.
 *    - `outdir/linker.cmd`
 *      A file containing linker command-line flags. These flags must be
 *      included on the linker command line for the final link of the
 *      application. The flags list needed libraries and object files,
 *      and on some platforms define the embedded system memory map.
 *  @p
 *  
 *  For example:
 *  @p(code)
 *      xs xdc.tools.configuro myconfig.cfg
 *  @p
 */
metaonly module Main inherits xdc.tools.ICmd {

    /*!
     * usage help message
     */
    override config String usage[] = [
        '[-v | -q]',
        '[-@ optionsfile]',
        '[-o outdir]',
        '[-b config_bld | -c codegen_dir | --cb]',
        '[-t target] [-p platform[:instance]] [-r profile]',
        '[-Dname=value]',
        '[-w | -x regexp]',
        '[--rtsName pkg_name]',
        '[--cfgArgs args_string]',
        '[--linkTemplate linker_template]',
        '[--pkg] [--generationOnly]',
        '[--compileOptions compile_options_string]',
        '[--linkOptions linker_options_string]',
        '[--oc compiler.opt] [--ol linker.cmd]',
        'infile.cfg'
    ];

instance:
    /*!
     *  Pathname of the output directory
     *
     *  A directory containing the generated build artifacts, in particular
     *  the `compiler.opt` and `linker.cmd` files.
     *
     *  The last component of the output directory path must be a valid
     *  ANSI C identifier; i.e., it must consist entirely of alphanumeric or
     *  '_' characters and must not start with a number.  So, the names
     *  '0app' and 'app-test' are not valid but '0app/config' and
     *  'app-test/config' are valid.
     *
     *  By default, the output directory has the same name as the
     *  configuration script, minus the `.cfg` extension, within the same
     *  parent directory as this script.  As a result, the directory name
     *  constraint above applies to the name of the configuration script.
     */
    @CommandOption("o")
    config String output = null;

    /*!
     *  Name of the RTSC target module
     *
     *  The name of a RTSC target module to use, for example
     *  `ti.targets.C64P`.
     *
     *  If no `config.bld` file is given, then this is a required
     *  parameter.
     *
     *  If a `config.bld` file is given then this parameter is optional,
     *  and by default the target will be
     *  {@link xdc.bld.BuildEnvironment#targets `Build.targets[0]`} from the
     *  user's `config.bld`. If `Build.targets` contains more than one entry,
     *  then this option can be used to override that default.
     */
    @CommandOption("t")
    config String target = null;

    /*!
     *  Root directory of the code generation tools
     *
     *  The path to the installation directory of the compiler and linker
     *  for the selected target. The definition of "installation directory"
     *  can vary from compiler to compiler, but is most commonly the
     *  directory that contains a "bin" subdirectory.
     *
     *  If no `config.bld` file is given, then this is a required
     *  parameter.
     *
     *  If a `config.bld` file is given then this parameter is optional,
     *  and by default the compiler will be the one configured there.
     *  This option can still be used, to override the default established
     *  in `config.bld`.
     */
    @CommandOption("c")
    config String rootdir = null;

    /*!
     *  Name of the RTSC platform package (and optionally instance)
     *
     *  The name of a RTSC platform package to use, using the syntax
     *  `my.pkg.name` or `my.pkg.name:instanceName`. For example,
     *  `ti.platforms.sim64Pxx` or `ti.platforms.generic:custom`.
     *
     *  This is an optional parameter, and by default the platform is
     *  the one that the selected target names as its default. The user
     *  may override this default in their `config.bld` or by using this
     *  parameter.
     *
     *  The optional `:instanceName` suffix names a pre-configured variant
     *  of the platform, which can be set up either in the user's
     *  `config.bld` or in the platform package itself. For more details, see
     *  {@link xdc.bld.BuildEnvironment#platformTable `Build.platformTable`}
     *  and the {@link xdc.platform.IPlatform `IPlatform`} interface.
     */
    @CommandOption("p")
    config String platform = null;

    /*!
     *  Build profile to use
     *
     *  The name of the build profile to use for the RTSC content, for
     *  example 'release' or 'debug'. The list of allowed profiles is
     *  determined by the RTSC target module named.
     */
    @CommandOption("r")
    config String profile = 'release';

    /*!
     *  Read build environment from the named `config.bld` file
     *
     *  A `config.bld` file can optionally be used to hold the values
     *  of the target, compiler root directory, platform, and other
     *  more advanced options. This is a convenient way to share a common
     *  build environment between multiple projects.
     *
     *  The format of the file is JavaScript statements with the XDCscript
     *  extensions. The script should set the properties of the
     *  {@link xdc.bld.BuildEnvironment `Build`} global object.
     *
     *  If no `config.bld` file is given then the target and compiler
     *  root directory are required command-line parameters.
     */
    @CommandOption("b")
    config String configbld = null;

    /*!
     *  Use a `config.bld` found along the package path
     *
     *  Find a `config.bld` by searching the package path, instead of
     *  via an explicit pathname. Looks for a file named `config.bld` in
     *  any of the directories named along the package path, in order. The
     *  directories are not searched recursively.
     */
    @CommandOption("cb")
    config Bool searchForConfigBld = false;

    /*!
     *  Set a Java property in the configuration script
     *
     *  Allows values to be injected from the command line into the
     *  `config.bld` file. For example, the option `-Dmyprop=myval`
     *  creates a property named `myprop` with string value `"myval"`.
     *  This can be read in `config.bld` using the XDCscript syntax
     *  `environment["myprop"]`.
     */
    @CommandOption("D")
    config String defines[] = [];

    /*!
     *  Set the name of the RTSC runtime package
     *
     *  The name of a package containing pre-built libraries containing
     *  the {@link xdc.runtime} modules.  If this parameter is `null` (or
     *  `undefined`) the name of the rts package is taken from the target
     *  (`{@link xdc.bld.ITarget#rtsName}`).  If this parameter is set to
     *  the empty string (""), then no rts package is included in the
     *  configuration.  Finally, if this parameter is non-`null` and
     *  non-empty, it should be the name of a package along the package
     *  path that can supply pre-built versions of the modules in the
     *  `{@link xdc.runtime}` package.
     *
     *  @see xdc.bld.ITarget#rtsName
     *  @see xdc.bld.Executable#Attrs
     */
    @CommandOption("rtsName")
    config String rtsName = null;

    /*!
     *  ======== cfgArgs ========
     *  Optional arguments passed to configuration script
     *
     *  This option lets the user pass values into the configuration script
     *  from the command line. The argument is an expression in JavaScript
     *  syntax.  Its value is available in the configuration script under the
     *  name `Program.build.cfgArgs`.
     *
     *  The JavaScript expression is evaluated in the configuration domain
     *  after the platform package is imported, immediately before calling
     *  the user's configuration script.
     *
     *  This string has the same effect as the `cfgArgs` string in
     *  `{@link xdc.bld.Executable#Attrs}`.
     *
     *  You can pass multiple values to configuration scripts using the
     *  syntax of a JavaScript `Object` constant:
     *  @p(code)
     *      xs xdc.tools.configuro --cfgArgs '{foo:"hello", bar:2}' ... app.cfg
     *  @p
     *
     *  The configuration script can read the various fields as, e.g.:
     *  @p(code)
     *      if (Program.build.cfgArgs.foo == "hello") {
     *          :
     *      }
     *  @p
     *    
     *  @a(Note)
     *  Different command line shells, such as UNIX `bash` verses Windows
     *  `cmd.exe`, interpret quotes on the command line very differently.
     *  As a result, the syntax necessary to pass a string such as "hello"
     *  to `configuro` can vary depending on the shell you use.
     *
     *  For most UNIX shells, it is possible to use single quotes around the
     *  use of double quotes as in the example above.  However, since Windows
     *  `cmd.exe` does not treat the single quote as a special character, it
     *  is necessary to use a backslash, '\', to ensure that the double quote
     *  characters are passed to the configuro tool.
     *
     *  Windows `cmd.exe`:
     *  @p(code)
     *      xs xdc.tools.configuro --cfgArgs "{foo:\"hello\", bar:2}" ...
     *  @p
     *
     *  UNIX `bash`, `ksh`, `csh`, ...:
     *  @p(code)
     *      xs xdc.tools.configuro --cfgArgs '{foo:"hello", bar:2}' ...
     *  @p
     *
     *  @see xdc.bld.Executable#Attrs
     */
    @CommandOption("cfgArgs")
    config String cfgArgs = null;

    /*!
     *  Linker command file template
     *
     *  If this option is provided it overrides the template supplied by
     *  the platform, giving the caller complete control over the generated
     *  linker command file.
     *
     *  @see xdc.cfg.Program#linkTemplate
     */
    @CommandOption("linkTemplate")
    config String linkTemplate = null;
    
    /*!
     *  Show verbose details during build
     *
     *  This option produces the same verbose output as the `xdc` command
     *  with the `XDCOPTIONS=v` parameter.
     */
    @CommandOption("v")
    config Bool verbose = false;

    /*!
     *  Minimize details during build
     *
     *  This option produces the same output as the `xdc` command
     *  with the `XDCOPTIONS=qq` parameter.
     */
    @CommandOption("q")
    config Bool quiet = false;

    /*!
     *  Exclude packages matching regexp from compatibility checking
     *
     *  A JavaScript regular expression that is used to select packages that
     *  should be excluded from the set of packages checked during
     *  configuration.
     *
     *  @see xdc.cfg
     */
    @CommandOption("x")
    config String exclude = null;

    /*!
     *  Treat package version incompatibilites as warnings
     *
     *  If set to "`true`", force any incompatibilities detected to be
     *  treated as warnings only; otherwise incompatibilities are fatal.
     *
     *  @see xdc.cfg
     */
    @CommandOption("w")
    config Bool warn = false;

    /*!
     *  Create the build model generated output files but do not build
     *
     *  This option creates the output directory and key generated files
     *  but does not process the user's configuration script. It is used
     *  by internal tooling to snapshot the RTSC build settings implied by
     *  the configuro command line parameters.
     */
    @CommandOption("pkg")
    config Bool mkPkgOnly = false;

    /*!
     *  Create the configuration generated source files but do not build
     *
     *  This option runs the configuration step but does not compile the
     *  generated source files.  This option is used 
     *  by internal tooling to eliminate unnecessary build steps.
     */
    @CommandOption("generationOnly")
    config Bool generationOnly = false;

    /*!
     *  Add compile options for C files in the configuration package
     *
     *  This option accepts one or more compiler options that are added to
     *  the compiler command line when compiling C files in the generated
     *  configuration package.
     *  If multiple compiler options are given, the whole string containing
     *  options must be surrounded by quotes.
     */
    @CommandOption("compileOptions")
    config String compileOptions = "";

    /*!
     *  Add linker options for libraries in the configuration package
     *
     *  This option accepts one or more linker options which are used to
     *  pull in the correct libraries during link.
     *  If multiple linker options are given, the whole string containing
     *  options must be surrounded by quotes.
     */
    @CommandOption("linkOptions")
    config String linkOptions = "";

    /*!
     *  Set the name of the compiler options file (default is "compiler.opt")
     */
    @CommandOption("oc")
    config String compilerOptionsFile = "compiler.opt";

    /*!
     *  Set the name of the linker command file (default is "linker.cmd")
     */
    @CommandOption("ol")
    config String linkerCommandFile = "linker.cmd";

    /*!
     *  Generate and build the configuration package
     */
    int gen(String infile);
}
