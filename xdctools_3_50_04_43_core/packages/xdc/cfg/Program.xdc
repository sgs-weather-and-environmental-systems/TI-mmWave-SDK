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
 *  ======== Program.xdc ========
 */
package xdc.cfg;

/*!
 *  ======== Program ========
 *  The Program object for the configuration object model.
 *
 *  This module defines the "root" of the configuration object model; all
 *  "top-level" configuration settings for the executable are provided by
 *  this object. Program configuration scripts reference this module via the
 *  global variable `Program`; i.e., `Program` is implicitly initialized as
 *  follows:
 *  @p(code)
 *      var Program = xdc.useModule('xdc.cfg.Program');
 *  @p
 *
 *  After a configuration script completes successfully, the following files
 *  are generated:
 *  @p(nlist)
 *	- package/cfg/<exe_name>.c
 *	- package/cfg/<exe_name>.xdl
 *  @p
 *  where `<exe_name>` is the name of the executable with the final '.'
 *  character replaced with an '_'.
 *
 *  The generated C file contains code and data from each module used by the
 *  program and must be compiled and linked with the other sources to
 *  produce the final executable.  The generated linker command file must also
 *  be added during this final link step.
 *
 *  The linker command file is produced by expanding a template
 *  provided by the platform specifed during configuration and contains
 *  hardware and compiler specific directives required by the target modules
 *  that are part of the program's configuration.  This template expands
 *  other templates specified by each imported package's
 *  `{@link xdc.IPackage#getSects getSects}` method, for example. This allows
 *  each package participating in the configuration executable to
 *  automatically contribute a portion of the executable's linker command
 *  file.
 *
 *  You can modify or augment the contents of this file via
 *  `{@link xdc.cfg.Program#sectionsExclude sectionsExclude}` and
 *  `{@link xdc.cfg.Program#sectionsTemplate sectionsTemplate}`. It is even
 *  possible to completely replace the template used to generate this file via
 *  `{@link xdc.cfg.Program#linkTemplate linkTemplate}`. If a custom template
 *  is used, it should still invoke `{@link xdc.IPackage#getSects getSects}`
 *  methods for all loaded packages.
 *  These configuration options provide the user complete control of the linker
 *  command file.
 */

@Template("./Program.xdt")

metaonly module Program {

    /*!
     *  ======== GenerationOptions ========
     *  Options that control the files generated as part of program
     *  configuration.
     *
     *  @field(debuggerFiles) If set to `true` in a configuration script,
     *		debugger project files will be generated as part of the
     *		configuration step.  If set to `false`, these files will not
     *		be generated.
     *
     *		If it is not set (or set to undefined) and the environment
     *		variable `environment["xdc.cfg.gen.debuggerFiles"]` is
     *		non-`null`, then the default value of this parameter is taken
     *		to be the value	of the following expression:
     *		@p(code)
     *		    environment["xdc.cfg.gen.debuggerFiles"] == "true"
     *		@p
     *		This makes it is possible to enable the generation of
     *		debugger project files from build scripts by passing
     *		the option `-Dxdc.cfg.gen.debuggerFiles=true` to the
     *		configuration tool (see
     *		`{@link xdc.bld.Executable#Attrs.xsopts}` or
     *          `{@link xdc.bld.PackageContents#Attrs.xsopts}`).
     *
     *		Finally, if `debuggerFiles` is not set (or set to `undefined`)
     *		and the environment variable above is not defined,
     *		the generation of debugger project files occurs only if
     *          `{@link xdc.cfg.Program#build.profile}` contains
     *          the string `"debug"`.  So, unless otherwise specified, debug
     *          profiles result in debugger project files being generated.
     */
    struct GenerationOptions {
        Bool debuggerFiles; /*! if `true`, generate debugger "project" files */
    };

    /*!
     *  ======== SectionSpec ========
     *  Map that instructs the linker where to place output sections.
     *
     *  This structure contains some fields that are specific to TI targets.
     *  On non-TI targets, such fields are ignored.
     *
     *  @field(runSegment) Defines the memory segment where the section is
     *          to be run.
     *
     *  @field(loadSegment) Defines the memory segment where the section is
     *          to be loaded. If 'runSegment' or 'loadSegment' is defined,
     *          but not both, the linker is instructed to use the defined
     *          field as the load and run allocation for the section.
     *
     *  @field(runAddress) Defines the memory address where the section is
     *		to be run. It is an error if both 'runSegment' and 'runAddress'
     *		are specified.
     *
     *  @field(loadAddress) Defines the memory address where the section is
     *		to be loaded. It is an error if both 'loadSegment' and
     *		'loadAddress' are specified. If 'runAddress' or 'loadAddress'
     *          is defined, but not both, the linker is instructed to use the
     *          defined field as the load and run address for the section.
     *
     *  @field(runAlign) If runSegment is specified, runAlign determines the
     *		alignment. It is an error if both 'runAlign' and 'runAddress'
     *		are specified.
     *
     *  @field(loadAlign) If runSegment is specified, runAlign determins the
     *          alignment. It is an error if both 'loadAlign' and 'loadAddress'
     *          are specified.
     *
     *  @field(type) Defines flags for special section types (COPY, DSECT,
     *          NOLOAD).
     *
     *  @field(fill) Defines the value to initialize an uninitialized
     *  section.
     */
    struct SectionSpec {
        String runSegment;  /*! segment where section contents are run */
        String loadSegment; /*! segment where section contents are loaded */
        UInt runAddress;    /*! start address of section when run */
        UInt loadAddress;   /*! start address of section when loaded */
        UInt runAlign;      /*! alignment of section within runSegment */
        UInt loadAlign;     /*! alignment of section within loadSegment */
        String type;        /*! target-specific flags */
        UInt fill;          /*! fill value */
    };

    /*!
     *  ======== gen ========
     *  Generation options for this executable
     *
     *  This configuration parameter allows the program configuration script
     *  to control (to some extent) what files are generated as part of the
     *  configuration process.
     */
    config GenerationOptions gen;

    /*!
     *  ======== globalSection ========
     *  UNDER CONSTRUCTION
     *  @_nodoc
     *
     *  Section where `{@link #globals}` are placed.
     *
     *  All globals specified in the application configuration file
     *  are placed into this section.
     *
     *  The default is `null`, which means the `{@link #dataSection}` is used.
     */
    config String globalSection = null;

    /*!
     *  ======== sysStack ========
     *  The size of the executable's initial system stack
     *
     *  On architectures that maintain a separate "system stack" in addition
     *  to the normal `{@link #stack}`, this parameter sets its initial size
     *  (in units of chars).  This parameter is ignored for those
     *  architectures for which there is just a single stack; in other
     *  words, almost all known architectures.
     *
     *  This parameter is used on later generation TI/C55 16-bit DSPs where,
     *  in order to compatibly support 24-bit addresses, a separate
     *  system call/return stack that stores the upper address bits is
     *  employed.
     */
    config UInt sysStack = 0x1000;

    /*!
     *  ======== stack ========
     *  The size of the executable's initial stack
     *
     *  On platforms that enable control of the initial stack size (the
     *  stack that exists immediately after reset), this parameter specifies
     *  its initial size (in units of chars).
     */
    config UInt stack = 0x1000;

    /*!
     *  ======== heap ========
     *  The size of the executable's initial heap
     *
     *  On platforms that enable control of the size of the heap managed by
     *  the run-time support function malloc(), this parameter specifies
     *  its initial size (in units of chars).
     */
    config UInt heap = 0x1000;

    /*!
     *  ======== argSize ========
     *  The size allocated for command line args to the executable
     *
     *  On platforms that require static allocation of space to hold
     *  command line arguments, this parameter specifies its maximum size
     *  (in units of chars).
     *
     *  Command line arguments are passed to C's `main` function when it's
     *  declared via the prototype: `int main(int argc, char *argv[])`.  the
     *  `argv` array points to an array of strings allocated from the
     *  memory block whose size is controlled by `argSize`.
     *
     *  Setting `argSize` to 0 means that no `argv` array will be allocated
     *  and the application `main()` function should be declared as
     *  `int main(void)`.
     */
    config UInt argSize = 0x200;

    /*!
     *  ======== execCmd ========
     *  The command used to run this executable
     *
     *  This string is used to create a command that runs the executable
     *  from the command line.  If it is not set by the configuration script,
     *  it is set by the program's platform package (during program
     *  configuration).
     *
     *  This command is run as follows:
     *  @p(code)
     *      execCmd <prog> <args>
     *  @p
     *  where, `<prog>` is the name of the executable and `<args>` are
     *  the arguments specified in the test (if any).
     *
     *  @a(Note)
     *  This parameter is ignored if the exec command is specified as part
     *  of the test; see `{@link xdc.bld.Test#Attrs}`.
     */
    config String execCmd;

    /*!
     *  ======== linkTemplate ========
     *  The template for the Program's linker command file
     *
     *  A template is used to create the linker command file for each
     *  program.  It can be optionally specified by setting this
     *  configuration parameter in the program's configuration script.  If
     *  `linkTemplate` it is not set or set to `null`, the template is
     *  obtained from the platform associated with this program (i.e., the
     *  platform named by the `{@link #platform}` config in this module).
     *  See `{@link xdc.platform.IPlatform#getLinkTemplate IPlatform.getLinkTemplate}`.
     *
     *  The `linkTemplate` string names a package path relative path; e.g.,
     *  if the linker template you want to specify is
     *  `"templates/big_n_hairy.xdt"` in the package `myCompany.myPackage`,
     *  `linkTemplate` should be set to:
     *  @p(code)
     *      "myCompany/myPackage/templates/big_n_hairy.xdt"
     *  @p
     *  If `linkTemplate` begins with the string `"./"`, the file is NOT
     *  searched for along the package path; instead the file name is taken
     *  to specify a file relative to the current working directory.
     *
     *  In any case, if `linkTemplate` is non-`null`, the file must exist;
     *  otherwise, the configuration step will fail.
     *
     *  @see #sectionsTemplate, #sectionsExclude, #memoryExclude
     */
    config String linkTemplate = null;

    /*!
     *  ======== main ========
     *  The main entry point for the program
     *
     *  This parameter is optionally set by the user's program
     *  configuration script.  If it is not set, then a "legacy" `main()`
     *  function is assumed to be linked into the program; otherwise,
     *  the value of `main` is used as the "main" entry point to the
     *  program.
     */
    config Int (*main)(Int, Char*[]);

    /*!
     *  ======== sectMap ========
     *  A section name to SectionSpec mapping
     *
     *  This is a program specific mapping of output section names to
     *  {@link #SectionSpec} objects. The map supports mapping of section
     *  names to memory names; see {@link xdc.platform.IPlatform#sectMap}.
     *
     *  This parameter enables program configurations to place named
     *  sections in platform specific memory regions.  During generation of
     *  the linker command file, sections are mapped to named memories by
     *  first consulting this table; if the table does not contain a mapping,
     *  the target classifies each section as either "code", "data" or
     *  "stack" {@link xdc.bld.ITarget#sectMap} and the platform defines a
     *  memory region for each of these section types
     *  ({@link xdc.platform.IPlatform#codeMemory}/
     *  {@link xdc.platform.IPlatform#dataMemory}).  If
     *  this does not produce a result, an error is generated.
     *  It is important to note that `sectMap` does not contain the complete
     *  section allocation for the program. It only contains the entries
     *  explicitly added to `sectMap`. To get the complete section
     *  allocation, a user should call {@link #getSectMap}.
     *
     *  Suppose for example that the platform defines a memory segment
     *  named "DDR2".  The following configuration statement places
     *  everything from the ".text" section into the "DDR2" segment.
     *
     *  @p(code)
     *      Program.sectMap[".text"] = new Program.SectionSpec();
     *      Program.sectMap[".text"].loadSegment = "DDR2";
     *  @p
     *
     *  @see #SectionSpec
     *  @see xdc.platform.IPlatform#sectMap
     *  @see xdc.bld.ITarget#sectMap
     */
    config Any sectMap[string];	/* section name => SectionSpec */

    /*!
     *  ======== sectionsExclude ========
     *  Sections to exclude from linker command file generation
     *
     *  The `sectionsExclude` string is a JavaScript regular expression
     *  that is used to identify names of sections that should NOT be
     *  be handled by the normal linker command file generation process.
     *
     *  Sections whose name matches `sectionsExclude` must be handled
     *  using a custom linker command file or by specifying a custom template
     *  (see `{@link #sectionsTemplate}` or `{@link #linkTemplate}`).
     *  @a(Examples)
     *  To completely override the placement of all output sections you can
     *  define `sectionsExclude` to match any string.
     *  @p(code)
     *      // Note: the '.' below represents _any_ character, not just "."
     *      Program.sectionsExclude = ".*";
     *  @p
     *  To override output sections that begin with '.' you must specify
     *  the literal character '.' and use the '^' character to match the
     *  beginning of the string.
     *  @p(code)
     *      // the sequence '^\.' matches just "." at the start of the name
     *      Program.sectionsExclude = "^\.";
     *  @p
     *  To override a specific sections you should be careful to supply a
     *  regular expression that matches the entire section name.  You can
     *  use '$' to match the end of the name.
     *  @p(code)
     *      // match only ".const" or ".text"
     *      Program.sectionsExclude = "^\.const$|^\.text$";
     *  @p
     *
     *  @see #sectionsTemplate, #linkTemplate
     */
    config String sectionsExclude = null;

    /*!
     *  ======== memoryExclude ========
     *  @_nodoc
     *  Exclude memory definitions from linker command file generation
     *
     *  This parameter accepts boolean values. If true, it disables default
     *  memory definitions from being added to the generated linker command
     *  file.
     *
     *  This allows the user to define a custom memory map in a separate file
     *  and add it to the linker's command line.
     *
     *  The parameter was meant to be used only in certain generic platforms,
     *  but for now these platforms are not used.
     *
     *  @see #sectionsTemplate, #sectionsExclude, #linkTemplate
     */
    config Bool memoryExclude = false;

    /*!
     *  ======== sectionsTemplate ========
     *  Replace the sections portion of the generated linker command file
     *
     *  The `sectionsTemplate` string names a template that is used to replace
     *  the "`SECTIONS`" content to the generated linker command file.  This
     *  is useful especially when excluding specific sections via
     *  `{@link #sectionsExclude}` or when taking full control of the linker
     *  command file via `{@link #linkTemplate}` is unnecessary.  The original
     *  "`SECTIONS`" content is computed and passed as an argument to this
     *  template, which makes it relatively simple to perform small changes to
     *  the "`SECTIONS`" content without having to explicitly handle every
     *  section required by the compiler toolchain.
     *
     *  The `sectionsTemplate` string names a package path relative path; e.g.,
     *  if the linker template you want to specify is
     *  `"templates/mySections.xdt"` in the package `myCompany.myPackage`,
     *  `sectionsTemplate` should be set to:
     *  @p(code)
     *      "myCompany/myPackage/templates/mySections.xdt"
     *  @p
     *  If `sectionsTemplate` begins with the string `"./"`, the file is NOT
     *  searched for along the package path; instead the file name is taken
     *  to specify a file relative to the current working directory.
     *
     *  In any case, if `sectionsTemplate` is non-`null`, the file must exist;
     *  otherwise, the configuration step will fail.
     *
     *  During expansion of this template, there are three "parameters"
     *  that can be referenced to generate new content.
     *  @p(dlist)
     *      - `this`
     *          reference to the `{@link Program}` object
     *      - `$args[0]`
     *         is the complete section map derived from
     *         `{@link Program#sectMap}`; some special sections relevant to
     *         XDCtools are added to the map defined by `Program.sectMap`.
     *      - `$args[1]`
     *         is a string that contains the content that would have been
     *         placed in the `SECTIONS` portion of the generated linker
     *         command file.  This allows templates to easily modify this
     *         content or simply add statements before or after it.
     *  @p
     *  @a(Example)
     *  The following template, specific to TI compiler tools, adds start
     *  and size symbols for the `.stack` section and ensures that the stack
     *  is the first section to be allocated in its designated memory segment.
     *  @p(code)
     *    %// first output allocation for the .stack section
     *    %var sectMap = $args[0];
     *    %var stack = sectMap[".stack"];
     *       .stack: >`stack.loadSegment` START(_stack_start) SIZE(_stack_size)
     *    %
     *    %// now append the normally generated content
     *    `$args[1]`
     *  @p
     *  Note: this example requires that the `.stack` section be excluded
     *  from the normal generation via `{@link sectionsExclude}`; otherwise
     *  this section will be specified twice by the template shown above.
     *  @p(code)
     *      Program.sectionsExclude = "^\.stack$";
     *  @p
     *
     *  @see #sectionsExclude, #linkTemplate
     */
    config String sectionsTemplate = null;

    /*!
     *  ======== system ========
     *  @_nodoc
     *  A facade for the {@link xdc.runtime.System#SupportProxy} parameter
     *
     *  The program configuration script may select an implementation of
     *  the `xdc.runtime.ISystemSupport` interface and "bind" it by setting
     *  this parameter. If the module assigned to this parameter does not
     *  inherit from `xdc.runtime.ISystemSupport`, the configuration will fail.
     *
     *  If this parameter is not set (or set to `undefined`), then a default
     *  implementation is used: `xdc.runtime.SysStd` or, if
     *  `Program.build.target.os` is `null`, `xdc.runtime.SysMin`.  Recall that
     *  `Program.build.target.os` is specified in the Build Object Model;
     *  `Program.build.target` is the target specified when the executable was
     *  added to the package.
     *
     *  If this parameter is set to `null`, then the `System` module is not
     *  linked into the application (unless 'Memory' is used); any references
     *  to `System`'s methods will result in a linker error.  By setting this
     *  parameter to `null`, one is asserting that `System`'s methods will not
     *  be used.
     */
    config Any system;

    /*!
     *  ======== name ========
     *  The name of the executable file
     *
     *  This is the full file name (relative to the package's base) of the
     *  executable that results from this configuration.
     *
     *  @a(readonly)
     *  This parameter is set by the generated program configuration script
     *  and must not be modified.
     */
    config String name;

    /*!
     *  ======== cfgBase ========
     *  UNDER CONSTRUCTION
     *  @_nodoc
     */
    config String cfgBase;

    /*!
     *  ======== buildPackage ========
     *  The name of the executable's package
     *
     *  This is the full package name (relative to the package's repository)
     *  of the package that contains the executable being configured.
     *
     *  @a(readonly)
     *  This parameter is set by the generated program configuration script
     *  and must not be modified.
     */
    config String buildPackage;

    /*!
     *  ======== endian ========
     *  The endianess of the executable
     *
     *  This parameter is an alias for `build.target.model.dataModel` and is
     *  set to one of the following values: `"big"`, `"little"`, or `null`.
     *
     *  @a(readonly)
     *  This parameter is set by the generated program configuration script
     *  and must not be modified.
     */
    config String endian = null;

    /*!
     *  ======== codeModel ========
     *  The memory model for code
     *
     *  This parameter is an alias for `build.target.model.codeModel` and is
     *  set to one of the following target-specific values: `"near"`, `"far"`,
     *  `"large"`, or `null`.
     *
     *  @a(readonly)
     *  This parameter is set by the generated program configuration script
     *  and must not be modified.
     */
    config String codeModel = null;

    /*!
     *  ======== dataModel ========
     *  The memory model for data
     *
     *  This parameter is an alias for `build.target.model.dataModel` and is
     *  set to one of the following target-specific values: `"near"`, `"far"`,
     *  `"large"`, or `null`.
     *
     *  @a(readonly)
     *  This parameter is set by the generated program configuration script
     *  and must not be modified.
     */
    config String dataModel = null;

    /*!
     *  ======== build ========
     *  This program's build attributes
     *
     *  This parameter allows arbitrary build attributes to be carried
     *  forward from the Build Object Model (BOM) into the configuration
     *  model for program configuration scripts to read.
     *
     *  Conceptually, this config parameter should be declared as follows:
     *  @p(code)
     *      struct BuildAttrs inherits xdc.bld.Executable.Attrs {
     *          config xdc.bld.ITarget.Module target;
     *      };
     *  @p
     *  All parameters of the target associated with the executable being
     *  configured are available through '`Program.build.target`'. Any config
     *  parameter set in the BOM's `{@link xdc.bld.Executable#attrs}` is also
     *  available through `{@link #build}`.  For example, the name of the
     *  target is `Program.build.target.name` and the name of the
     *  executable's configuration script is `Program.build.cfgScript`.
     *
     *  @a(readonly)
     *  This parameter is set by the generated program configuration script
     *  and must not be modified.
     */
    config Any build;	/*  BuildAttrs */

    /*!
     *  ======== cpu ========
     *  The execution context "seen" by the executable.
     *
     *  Since the execution context is largely determined by the CPU that
     *  runs the executable, this configuration parameter allows scripts with
     *  access to the program object to conditionally configure based on CPU
     *  characteristics (e.g., ISA or revision of a chip).
     *
     *  @a(readonly)
     *  This parameter is set by the platform's implementation of
     *  `xdc.IPackage` (i.e., `package.xs`).
     */
    config xdc.platform.IExeContext.Instance cpu;

    /*!
     *  ======== platformName ========
     *  The name of the executable's platform
     *
     *  This field is the name of the platform instance used to create the
     *  executable; e.g., `"ti.platforms.sim55xx"`, or
     *  `"ti.platforms.sim6xxx:TMS320C6416"`.
     *
     *  Platform instance names have the form:
     *  @p(code)
     *      <platform_pkg>:<instance_id>
     *  @p
     *  where `<platform_pkg>` is the name of the platform package
     *  responsible for creating the platform instance and the optional
     *  "`:<instance_id>`" is a suffix that uniquely identifies the creation
     *  parameters for this instance.
     *
     *  The creation parameters are the values specified by the map
     *  `{@link xdc.bld.BuildEnvironment#platformTable}`;
     *  if this map does not contain the platform instance name, the
     *  instance is created with default values that are specific to the
     *  platform.
     *
     *  @a(readonly)
     *  This parameter is set by the generated program configuration script
     *  and must not be modified.
     */
    config String platformName;

    /*!
     *  ======== platform ========
     *  The executable's platform instance object
     *
     *  The platform instance that provided an execution context for the
     *  executable being configured.
     *
     *  @a(readonly)
     *  This parameter is set by the generated program configuration script
     *  and must not be modified.
     */
    config xdc.platform.IPlatform.Instance platform;

    /*!
     *  ======== global ========
     *  Global variable declarations
     *
     *  Assignments to this hash table become global symbols that can be
     *  used to directly reference objects.  These objects are declared
     *  in a generated header that is indirectly included by the header
     *  `xdc/cfg/global.h`.
     *
     *  Configuration scripts define symbols by adding new properties to
     *  `global`.
     *  @p(code)
     *      Program.global.myInstance = Mod.create();
     *      Program.global.myString = "hello world";
     *  @p
     *
     *  Programs can reference the symbols defined in `global` by including
     *  the C/C++ header `xdc/cfg/global.h` as follows:
     *  @p(code)
     *      #include <pkg/Mod.h>
     *      #include <xdc/cfg/global.h>
     *         :
     *      Mod_fxn(myInstance, ...);
     *      printf("greetings: %s\n", myString);
     *  @p
     *
     *  To compile sources that include `xdc/cfg/global.h`, one symbol must be
     *  defined before including this header:
     *  @p(dlist)
     *      - `xdc_cfg__header__`
     *          the package qualified name of the executable-specific C/C++
     *          header generated by the program configuration tool; e.g.,
     *          `local/examples/package/cfg/mycfg_x62.h`.
     *  @p
     *  For example, to compile sources that reference the values declared in
     *  `{@link #global}` for a TI C6x target with a generated
     *  configuration header named `package/cfg/mycfg_x62.h` in a package
     *  named `local.examples` the following command line is sufficient:
     *  @p(code)
     *      cl6x -Dxdc_cfg__header__=local/examples/package/cfg/mycfg_x62.h ...
     *  @p
     *
     *  The `xdc_cfg__header__` symbol is automatically defined when you use
     *  the the XDC Build Engine (`{@link xdc.bld}`) to create executables; see
     *  `{@link xdc.bld.Executable#addObjects}`
     *
     *  @see xdc.bld.Executable#addObjects
     */
    config Any global[string];

    /*!
     *  ======== symbol ========
     *  Global symbol specifications
     *
     *  UNDER CONSTRUCTION
     *  @_nodoc
     *
     *  This map contains symbol definitions that are used to define aliases
     *  or constants.  Symbol names are the C symbol names; i.e., compiler name
     *  mangling, such as the addition of a leading "_", is performed
     *  automatically.
     *
     *  @a(Examples)
     *  To define a symbolic constant:
     *  @p(code)
     *      Program.symbol["ONE"] = 1;
     *  @p
     *  The line above causes the symbol "ONE" to be defined in the linker
     *  command file to be equal to 1.  Note this in contrast to defining a
     *  variable whose value is 1; symbols do not occupy space, they are just
     *  symbolic constants defined in the symbol table of the executable.
     *
     *  This is currently used by xdc.runtime.Startup to define symbols
     *  optionally referenced by boot files that support early startup
     *  "reset" functions.
     */
    config Any symbol[string];

    /*!
     *  ======== exportModule ========
     *  Force all the symbols of a module to be part of a configuration
     *
     *  Although a call xdc.useModule() will force some of a module's methods
     *  to be part of a configuration, the linker is still free to omit any
     *  symbols that are not referenced.  Use of exportModule will force all
     *  methods of the specified module to be available.
     */
    Void exportModule(String modName);

    /*!
     *  ======== getSectMap ========
     *  Return the complete mapping of section names to `{@link #SectionSpec}`
     *  entries
     *
     *	The returned map is assembled from `{@link xdc.bld.ITarget#sectMap}`,
     *  `{@link xdc.platform.IPlatform#sectMap}`,
     *  `{@link xdc.platform.IPlatform#codeMemory}`,
     *  `{@link xdc.platform.IPlatform#dataMemory}`,
     *  `{@link xdc.platform.IPlatform#stackMemory}` and `{@link #sectMap}`.
     *  The function can be called at any time during configuration, but if
     *  it is called before all packages had a chance to change `sectMap`,
     *  the returned map may not correspond to the actual section
     *  allocation as configured in the linker command file.
     *
     *  @a(returns)
     *  `getSectMap` returns a map with section names as keys and
     *	`{@link #SectionSpec}` entries as values.
     */
    function getSectMap();

    /*!
     *  ======== importAssembly ========
     *  UNDER CONSTRUCTION
     *  @_nodoc
     */
    Void importAssembly(String asmName);

    /*!
     *  ======== targetModules ========
     *  UNDER CONSTRUCTION
     *  @_nodoc
     *
     *  This function returns a list of target modules. The list is completed
     *  only after all packages are closed, and runtime.finalized() is closed,
     *  so the only time when this function can be safely called is from
     *  within module$static$init and instance$static$init functions, package
     *  validate() functions, and templates.
     *
     *  This function is currently used by xdc.runtime modules to retrieve a
     *  list of modules that use xdc.runtime services. The list therefore does
     *  not include modules that have the attribute `@NoRuntime`.
     */
    function targetModules();
}
/*
 *  @(#) xdc.cfg; 1, 0, 2,0; 11-8-2017 17:10:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

