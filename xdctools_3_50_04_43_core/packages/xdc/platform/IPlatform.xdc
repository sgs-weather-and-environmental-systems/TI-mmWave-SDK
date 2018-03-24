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
 *  ======== IPlatform.xdc ========
 */

package xdc.platform;

/*!
 *  ======== IPlatform ========
 *  Configuration-time interface to all platforms.
 *
 *  This interface defines the elements that must be implemented by all
 *  "platform packages".  All programs are built to execute on a platform
 *  and each program includes exactly one platform package (which defines
 *  the platform).
 *
 *  Platform packages contain exactly one module named "Platform" which
 *  implements the `xdc.platform.IPlatform` interface defined here.
 *
 *  Program configuration scripts may read (but not modify) the attributes
 *  provided by this interface from the global `Program` object; see
 *  `{@link xdc.cfg.Program#platform}`.
 */
metaonly interface IPlatform
{
    /*!
     *  ======== Board ========
     *  Board-level description.
     */
    struct Board {
        string	 id;		/*! unique id within the platform */
        string	 boardName;	/*! name of the board */
        string	 boardFamily;	/*! optional family name */
        string	 boardRevision;	/*! optional revision string */
    };

    /*!
     *  ======== Memory ========
     *  A named contiguous range of addresses.
     *
     *  Memory structures are used in the description of the memory available
     *  from CPUs and platforms.
     */
    struct Memory {
        string	    comment;	/*! description of this block */
        string	    name;	/*! name of memory segment */
        string	    space;	/*! "code", "data", "code/data", etc.... */
        unsigned    page;	/*! page of memory segment */
        unsigned    base;	/*! base address of memory segment */
        unsigned    len; 	/*! length of memory segment */
        string	    access;	/*! attributes of memory: "RWX" */
        Bool        cacheable;  /*! Is this block cacheable? */
        Any         cacheAttrs; /*! Device specific MMU attributes */
    };

    /*! Type to be used for maps of Memory objects */
    typedef Memory MemoryMap[string];

instance:
    /*!
     *  ======== create ========
     *  Constructor for IPlatform instances.
     *
     *  @param(name)	the name of the platform instance being created
     *
     *			This name is the suffix of the platform
     *			specification supplied in the build script after
     *			the platform name (and optional ':') prefix has
     *		        been removed.  So the platform instance name
     *			"joes.platform.foo:bar" results in the name "bar"
     *			and the name "joes.platform.foo" result in the name
     *			"".
     */
    create(string name);
    
    /*
     *  ======== memTab ========
     *  A mapping of memory names to external memory objects.
     *
     *  This hash table is used to map linker memory region names ("EPROG",
     *  "EDATA", etc.) to `{@link xdc.platform.IPlatform#Memory}` objects.
     *  During generation of linker command files, for example, this table
     *  may be used to genenerate physical memory map declarations.
     *
     *  Platforms with a fixed memory map can initialize this table
     *  "statically" in Platform.xdc using the following syntax:
     *  @p(code)
     *	    override config xdc.platform.IPlatform.Memory memTab[string] = [
     *		["PMEM", {name: "PMEM", base: 0x00000200, len: 0x0000FE00}],
     *		    :
     *	    ];
     *  @p
     *  Alternatively, platforms can initialize this table dynamically in
     *  the platform package's `init()` function (see `{@link xdc.IPackage}`)
     *  using the following syntax:
     *  @p(code)
     *	  function init()
     *	  {
     *		    :
     *	      this.memTab["PMEM"] = {name: "PMEM", base: 0x200, len: 0xFE00};
     *		    :
     *    }
     *  @p
     *  @a(readonly)   this parameter is set by the platform and read by
     *		    program configuration scripts.
     */
//    config Memory memTab[string];	/* memory name => memory object */

    /*!
     *  ======== externalMemoryMap ========
     *  A mapping of memory names to memory objects for external memory.
     *
     *  This parameter defines the external portion of the platform's memory
     *  map.
     */
    readonly config xdc.platform.IPlatform.Memory externalMemoryMap[string];

    /*!
     *  ======== customMemoryMap ========
     *  A custom mapping of memory names to memory objects.
     *
     *  This parameter allows platform instances to completely overwrite a 
     *  default memory map based on the internal memory map coming from CPU's
     *  memory map and externalMemoryMap.
     *
     *  Custom memory map must fit within the default memory map, unless the
     *  verification of the fit is disabled (see `{@link xdc.platform}`). 
     */
    config xdc.platform.IPlatform.Memory customMemoryMap[string];

    /*!
     *  ======== renameMap ========
     *  A map for renaming memory objects.
     *
     *  This map renames memory objects. If you do not want to change
     *  addresses in the default memory map, but you only want to rename the
     *  existing memory objects, you should use this parameter.
     *
     *  This map and `customMemoryMap` should not be used together because this
     *  map renames the default memory, but then `customMemoryMap` replaces the
     *  default memory objects. The parameters `codeMemory`, `dataMemory` and
     *  `stackMemory` are not automatically reassigned to new names. It is the
     *  user's responsibility to set those parameters accordingly to 
     *  `renameMap`.
     */
    config string renameMap[string];

    /*!
     *  ======== dataMemory ========
     *  The default segment for data sections.
     *
     *  Each target has a section map with keys equal to the names of all
     *  sections that compiler and assembler for that target generate. The
     *  value for each key is either "code" or "data" or "stack". A linker
     *  template reads that map and puts all "data" sections in the segment
     *  defined by this configuration parameter.
     *
     *  @see #codeMemory
     *  @see #stackMemory
     */
    config string dataMemory;

    /*!
     *  ======== codeMemory ========
     *  The default segment for code sections.
     *
     *  Each target has a section map with keys equal to the names of all
     *  sections that compiler and assembler for that target generate. The
     *  value for each key is either "code" or "data" or "stack". A linker
     *  template reads that map and puts all "code" sections in the segment
     *  defined by this configuration parameter.
     *
     *  @see #dataMemory
     *  @see #stackMemory
     */
    config string codeMemory;

    /*!
     *  ======== stackMemory ========
     *  The default segment for stack.
     *
     *  Each target has a section map with keys equal to the names of all
     *  sections that compiler and assembler for that target generate. The
     *  value for each key is either "code" or "data" or "stack". A linker
     *  template reads that map and puts all "stack" sections in the segment
     *  defined by this configuration parameter.
     *
     *  @see #dataMemory
     *  @see #codeMemory
     */
    config string stackMemory;

    /*!
     *  ======== sectMap ========
     *  A mapping of linker output section names to memory segments.
     *
     *  During the generation of linker command files, the templates used to
     *  create these files examine several sources of information to determine 
     *  the placement of named output sections into memory segments defined
     *  by the platform.  The default placement, described below,
     *  uses information from the target and this platform's
     *  `{@link #codeMemory}`, `{@link #dataMemory}`, and
     *  `{@link #stackMemory}` configuration parameters.
     *
     *  `sectMap` is used to override this default placement of
     *  output sections (".text", ".cinit", etc.) to a memory 
     *  segment defined by the platform's memory map.  For example, even if
     *  a platform's `codeMemory` parameter is defined to be "SRAM" and
     *  ".cinit" output sections are "code" sections, if the platform also
     *  defines the following `sectMap`, the section ".cinit" will be placed
     *  into a memory segment named "DDR2".
     *  @p(code)
     *      sectMap[] = [
     *          [".cinit", "DDR2"],
     *      ];
     *  @p
     *
     *  @a(Note) If an output section has an entry in
     *  `{@link xdc.cfg.Program#sectMap Program.sectMap}`, that entry
     *  overrides the placement specified by this `sectMap`.  A program's
     *  `sectMap` configuration always overrides the platform's `sectMap`
     *  settings.
     *
     *  @a(Default Mapping)
     *  The default placement of a target's output sections into memory
     *  segments defined by the platform is determined by the following
     *  configuration parameters:
     *  @p(blist)
     *      - `{@link xdc.bld.ITarget#sectMap ITarget.sectMap}`
     *          used to map a named output section to either "code", "data",
     *          or "stack"
     *      - `{@link #codeMemory}`
     *          names a memory segment that will contain all "code"
     *          output sections
     *      - `{@link #dataMemory}`
     *          names a memory segment that will contain all "data"
     *          output sections
     *      - `{@link #stackMemory}`
     *          names a memory segment that will contain all "stack"
     *          output sections
     *  @p
     *
     *  @see xdc.cfg.Program#sectMap
     *  @see xdc.bld.ITarget#sectMap
     */
    config string sectMap[string]; /* section name => memory segment */
    
    /*!
     *  ======== peripherals ========
     *  @_nodoc
     *
     *  A map of peripherals available on a platform instance
     *
     *  The map contains peripherals from an 
     *  `{@link xdc.platform.ICpuDataSheet}` instance available as
     *  `{@link xdc.cfg.Program#cpu.attrs}`, and peripherals defined in this
     *  platform instance. The map is initialized by the platform instance,
     *  and in multicore platforms the instance must add only peripherals
     *  available to the CPU for which an executable is being built.
     */
    config IPeripheral.Instance peripherals[string];
    
    /*!
     *  ======== getCpuDataSheet ========
     *  Get the Cpu data sheet object corresponding to specified cpu id.
     *
     *  This function executes in either the Configuration object model
     *  or the Build object model.
     *
     *	@param(cpuId)	a string that corresponds to the platform-specific id
     *                  of a CPU on this platform that runs executables.
     *
     *	@a(returns)	Returns an `{@link xdc.platform.ICpuDataSheet}`
     *                  instance object that corresponds to the specified
     *                  cpuId.
     *
     *  @a(throws)	`Error` exceptions are thrown for fatal errors.
     */
    function getCpuDataSheet(cpuId);
//    xdc.platform.ICpuDataSheet.Instance getCpuDataSheet(string cpuId);

    /*!
     *  ======== getCreateArgs ========
     *  DEPRECATED
     *  @_nodoc
     *
     *  Get the value of the args parameter used to create this instance
     *
     *  This function executes in either the Configuration object model
     *  or the Build object model.
     *
     *	@a(returns)	Returns the "args" object that passed to this
     *                  module's create method when the instance was created.
     *
     *  @a(throws)	`Error` exceptions are thrown for fatal errors.
     */
    function getCreateArgs();
// any getCreateArgs();
    
    /*!
     *  ======== getExeContext ========
     *  Get execution context object corresponding to the specified program.
     *
     *  This is called before the program's configuration script runs to 
     *  get the Cpu object that is assigned to the program's cpu field.
     *
     *  Note: that the build script for the program is responsible for
     *  specifying the CPU; this is done by either implicitly naming the
     *  platform or explicitly naming a particular CPU on the platform
     *  (see `{@link xdc.bld.Executable#Attrs.cpuId}`).
     *
     *  This function executes in the Configuration object model.
     *
     *	@param(prog)	the `{@link xdc.cfg.Program}` object representing the
     *                  program being configured.
     *
     *			This object contains the following properties that
     *			allows the platform to determine the appropriate Cpu
     *			object to return (if there is more than one):
     *			    `prog.build.cpuId`,
     *			    `prog.build.cpuArgs`, 
     *			    `prog.build.target`,
     *
     *	@a(returns)	Returns an `{@link xdc.platform.IExeContext}` instance
     *                  object that corresponds to the CPU that will run the
     *                  specified program.
     *
     *  @a(throws)	`Error` exceptions are thrown for fatal errors.
     */
    function getExeContext(prog);
//    xdc.platform.IExeContext.Instance getExeContext(xdc.cfg.Program.Module prog);

    /*!
     *  ======== getExecCmd ========
     *  Get the exec command used to run the program on this platform.  
     *
     *  This function is called after the program's configuration script runs
     *  and returns commands that are used to load and run the specified
     *  program.  These commands are placed in a makefile that is included
     *  by the client package's generated makefile.  Thus, the commands may
     *  refer to macros defined in this environment; e.g., `$(SHELL)` and
     *  `$(XDCROOT)`, etc.
     *
     *  The special macro `$(1)` expands to test-specific arguments
     *  (`{@link xdc.bld.Test#attrs.execArgs}`) that are passed from the test
     *  to the platform's exec command.  Thus, all platforms that support
     *  arguments to their exec command, should embed "`$(1)`" within the
     *  command string at the appropriate place to have these arguments
     *  interpreted by the exec command.
     *
     *  For example, a platform that uses a shell script to run executables
     *  and allows options to be passed to the shell script might return
     *  the following string:
     *  @p(code)
     *	    "$(SHELL) <exec_path> $(1) <exe_name>"
     *  @p
     *  where, `<exec_path>` is the absolute path to the platform's exec
     *  shell script, and `<prog_name>` is the name of the executable relative
     *  to the package's base directory (i.e., `{@link xdc.cfg.Program#name}`).
     *
     *  This function executes in the Configuration object model.
     *
     *	@param(prog)	the `{@link xdc.cfg.Program}` object representing the
     *                  program being configured.
     *
     *			This object contains the following properties that
     *			allows the platform to determine the appropriate Cpu
     *			object to return (if there is more than one):
     *			    `prog.build.cpuId`,
     *			    `prog.build.cpuArgs`,
     *			    `prog.build.target`
     *
     *	@param(platPath) full path to the platform package for the program
     *
     *  @a(returns)	Returns a string of commands used to execute this
     *                  program in the context of the XDC generated makefiles.
     *			
     *  @a(throws)	`Error` exceptions are thrown for fatal errors.
     */
    function getExecCmd(prog, platPath);
//    string  getExecCmd(xdc.cfg.Program.Module prog, string platPath);

    /*!
     *  ======== getLinkTemplate ========
     *  Get Linker Command file template used to link an executable.
     *
     *  In the event that no template is provided by the program
     *  configuration script (see `{@link xdc.cfg.Program#linkTemplate}`), 
     *  the template file identified by this method is used to generate the
     *  linker command file used to create the executable.
     *
     *  This function executes in the Configuration object model and
     *  is called after the program configuration script runs.  The template
     *  is expanded in the context of the Configuration Object Model.  
     *
     *	@param(prog)	the `{@link xdc.cfg.Program}` object representing the
     *                  program	being configured.
     *
     *			This object contains the following properties that
     *			allows the platform to determine the appropriate link
     *			template to return:
     *                  @p(blist)
     *			    - `prog.build.cpuId`,
     *			    - `prog.build.cpuArgs`,
     *			    - `prog.build.target`
     *                  @p
     *  @a(returns)	Returns a path string to a template file or `null`.  If
     *			`null`, no linker command file is generated; otherwise
     *			this path is relative to the package path.
     *			
     *  @a(throws)	`Error` exceptions are thrown for fatal errors.
     */
    function getLinkTemplate(prog);
//    string getLinkTemplate(prog);
}
/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

