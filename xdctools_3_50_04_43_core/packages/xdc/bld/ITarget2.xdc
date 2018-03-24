/* 
 *  Copyright (c) 2009 Texas Instruments and others.
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
 *  ======== ITarget2.xdc ========
 */
package xdc.bld;

/*!
 *  ======== ITarget2 ========
 *  Extension of the interface {@link xdc.bld.ITarget}.
 *
 *  This interface contains some common structures and config parameters
 *  shared by several packages that contain targets.
 */
metaonly interface ITarget2 inherits ITarget {

    /*!
     *  ======== Command ========
     *  Required command and options.
     *
     *  The compile, link, and archive functions in this interface are
     *  implemented by expanding the strings specified in this structure
     *  and inserting strings from the Options structure to form a single
     *  command.  The strings in this structure can not be changed by
     *  the user (they are fixed by the target), but the string in the
     *  Options structure may be changed by the user.
     *
     *  The final command is:
     *	    Command.cmd Options.prefix Command.opts Options.suffix
     *
     *  @field(cmd)	name of a tool-chain executable without any path
     *			information.  The location of this executable is
     *			specified by the binDir (or pathPrefix) 
     *			configuration parameter.
     *
     *	@field(opts)	required options passed to the command; these options
     *			can not be changed or eliminated by user's
     *			configuration script.
     */
    struct Command {
	string cmd;	/*! the command to run */
	string opts;	/*! required options for the command */
    }

    /*!
     *  ======== Options ========
     *  User configurable command options.
     *
     *  The option strings allow the user to pass additional parameters to the
     *  executable that is responsible for compiling, linker, or archiving.
     *  See `{@link #Command xdc.bld.ITarget2.Command}`.
     */
    struct Options {
	string prefix;	/*! options that appear before Command.opts */
	string suffix;	/*! options that appear after Command.opts */
    }

    /*!
     *  ======== ar ========
     *  The command used to create an archive
     */
    readonly config Command ar;

    /*!
     *  ======== arOpts ========
     *  User configurable archiver options.
     */
    config Options arOpts = {
	prefix: "",
	suffix: ""
    };

    /*!
     *  ======== lnk ========
     *  The command used to link executables.
     */
    readonly config Command lnk;

    /*!
     *  ======== lnkOpts ========
     *  User configurable linker options.
     */
    config Options lnkOpts = {
	prefix: "",
	suffix: ""
    };

    /*!
     *  ======== cc ========
     *  The command used to compile C/C++ source files into object files
     */
    readonly config Command cc;

    /*!
     *  ======== ccOpts ========
     *  User configurable compiler options.
     */
    config Options ccOpts = {
	prefix: "",
	suffix: ""
    };

    /*!
     *  ======== ccConfigOpts ========
     *  User configurable compiler options for the generated config C file.
     *
     *  By default, this parameter inherits values specified in
     *  `{@link #ccOpts ccOpts}`.  The strings `"$(ccOpts.prefix)"` and
     *  `"$(ccOpts.suffix)"` are expanded into the values specified by
     *  `{@link #ccOpts ccOpts}` for this target.
     */
    config Options ccConfigOpts = {
	prefix: "$(ccOpts.prefix)",
	suffix: "$(ccOpts.suffix)"
    };

    /*!
     *  ======== asm ========
     *  The command used to assembles assembly source files into object files
     */
    readonly config Command asm;

    /*!
     *  ======== asmOpts ========
     *  User configurable assembler options.
     */
    config Options asmOpts = {
	prefix: "",
	suffix: ""
    };

    /*!
     *  ======== includeOpts ========
     *  Additional user configurable target-specific include path options
     */
    config string includeOpts;

    /*!
     *  ======== genConstCustom ========
     *  Return any custom generated code related to generated constants
     *
     *  This function is invoked for each constant in the generated config C
     *  file. This includes module-level config parameter, as well as the
     *  internal data structures that define modules, interfaces and instances.
     *  A target is given a chance to add any target-specific pragmas or
     *  attributes for the generated constants. The set of the data supplied to
     *  this function overlaps with the data supplied to
     *  `{@link genVisibleData genVisibleData}`, so their output must be
     *  coordinated to avoid duplicate or inconsistent definitions or
     *  directives.
     *
     *  @params(names)	array of constant names generated in the
     *			config C file
     *
     *  @params(types)	array of types; each type corresponds to the element
     *			of `names` with the same index
     *
     *  @a(returns)
     *  This function returns custom C code that will be embedded into the
     *  generated config C file. If there is nothing to be added, this function
     *  returns `null`. If a target never generates any such code, it can rely
     *  on the default implementation that always returns `null`.
     */
    String genConstCustom(StringArray names, StringArray types);

    /*!
     *  ======== genVisibleData ========
     *  Return any custom generated code related to data generated in the
     *  config C file
     *
     *  This function is invoked for each module-level configuration parameter
     *  in the configuration. Such parameters are represented by constants in the
     *  generated config C file.
     
     *  A target is given a chance to add any target-specific pragmas or
     *  attributes for the generated constants. The set of the data supplied to
     *  this function overlaps with the data supplied to
     *  `{@link genConstCustom genConstCustom}`, so their output must be
     *  coordinated to avoid duplicate or inconsistent definitions or
     *  directives.
     *
     *  @params(quals)		array of declaration qualifiers for the
     *				generated data
     *
     *  @params(types)		array of types for the generated data
     *
     *  @params(names)		array of variable names; each name corresponds
     *				to the elements of `quals` and `types` with the
     *				same index
     *
     *  @a(returns)
     *  This function returns custom C code that will be embedded into the
     *  generated config C file. The purpose of the function is to allow
     *  targets to add pragmas or attributes to prevent elimination of data
     *  in case of partially linker objects.
     *  If there is nothing to be added, this function returns `null`. If a
     *  target never generates any such code, it can rely on the default
     *  implementation that always returns `null`.
     */
    String genVisibleData(StringArray quals, StringArray types,
                          StringArray names);
    /*!
     *  ======== genVisibleFxns ========
     *  Return any custom generated code related to functions generated in
     *  the config C file
     *
     *  @params(types)		array of types of functions' return values
     *
     *  @params(names)		array of functions' names; each name corresponds
     *				to the elements of `types` and `args` with the
     *				same index
     *
     *  @params(args)		array of functions' argument lists, including
     *				qualifiers
     
     *  @a(returns)
     *  This function returns custom C code that will be embedded into the
     *  generated config C file. The purpose of the function is to allow
     *  targets to add pragmas or attributes to prevent elimination of functions
     *  in case of partially linker objects.
     */
    String genVisibleFxns(StringArray types, StringArray names,
                          StringArray args);

    /*!
     *  ======== genVisibleLibFxns ========
     *  Return any custom generated code related to functions that are included
     *  in the configuration, but are not generated in the config C file
     *
     *  @params(types)		array of types of functions' return values
     *
     *  @params(names)		array of functions' names; each name corresponds
     *				to the elements of `types` and `args` with the
     *				same index
     *
     *  @params(args)		array of functions' argument lists, including
     *				qualifiers
     
     *  @a(returns)
     *  This function returns custom C code that will be embedded into the
     *  generated config C file. The purpose of the function is to allow
     *  targets to add pragmas or attributes to prevent elimination of functions
     *  in case of partially linker objects. These functions are managed
     *  separately from the functions that are generated in the config C file
     *  because some pragmas and attributes can be used only for functions
     *  defined in the same compilation unit where the paragmas and attributes
     *  are generated. For functions that are not generated in the config C
     *  file, and the mentioned restrictions exist, targets may have to create
     *  references that will prevent elimination of functions defined outside
     *  of the config C file.
     */
    String genVisibleLibFxns(StringArray types, StringArray names,
                             StringArray args);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

