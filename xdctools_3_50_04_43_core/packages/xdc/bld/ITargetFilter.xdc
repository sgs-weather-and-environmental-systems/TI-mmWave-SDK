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
 *  ======== ITargetFilter ========
 *  User-supplied filter of a target's command set
 *
 *  This interface defines a set of user-supplied methods that are invoked
 *  during the Build Model's makefile generation process.  These methods
 *  can augment or modify the commands that are placed in the generated
 *  makefiles.  For example, an `ITargetFilter` module can add pre or post
 *  build steps for virtually any generated file.
 *
 *  Filters can:
 *  @p(nlist)
 *      - modify or augment the commands returned by a target's compile,
 *        link and archive methods via `{@link #compile}`, `{@link #link}`,
 *        and `{@link #archive}`;
 *      - add new definitions to the generated makefiles usable by the
 *        command added above via `{@link #getDefs}`; and
 *      - specify new files to be generated during the configuration process
 *        that may be used during or after the link process via
 *        `{@link #getGenTab}`.
 *  @p
 *  Filters are created implicitly when a target's profile
 *  (`{@link xdc.bld.ITarget#profiles}`) that references the filter is used.
 *  To use a filter, one must configure a profile's option set
 *  (`{@link xdc.bld.ITarget#OptionSet}`) in the build configuration script
 *  `config.bld`.  It is possible to add filters to existing profiles (such
 *  as `"debug"` and `"release"`) or to create entirely new profiles that
 *  utilize the filters.
 *
 *  When modifying existing profiles, no changes to individual packages using
 *  these profiles is required; one simply has to clean and rebuild these
 *  packages for the filters to have an effect.
 *
 *  By adding new profiles, one can ensure that existing build artifacts are
 *  unchanged and only those packages that want to take advantage of a filter
 *  can do so easily by adding a new build artifact that uses the new
 *  profile; for example, see `{@link xdc.bld.Library#Attrs}`.
 */
metaonly interface ITargetFilter
{
    /*!
     *  ======== InstDesc ========
     *  `ITargetFilter` Instance descriptor
     *
     *  This structure provides the information necessary to create an
     *  instance of an `ITargetFilter`.
     *
     *  @see xdc.bld.ITarget#OptionSet
     */
    struct InstDesc {
        String  moduleName; /*! name of a module implementing `ITargetFilter`*/
        Any     params;     /*! params passed to ITargetFilter.create() */
    };
    
    /*!
     *  ======== GenDesc ========
     *  Configuration file generation descriptor
     *
     *  This structure is used to specify a new file to be generated during
     *  the configuration process.
     *
     *  Templates are expanded in the context of the Configuration domain;
     *  as a result, the contents of the generated file can be a function
     *  of an executable's `{@link xdc.cfg.Program}` object.  Template names
     *  are interpreted using the `xdc.findFile()` method to
     *  locate the template file name.  Templates can, therefore, be 
     *  contained in any package located along the package path.
     *
     *  Names of files to be generated are always interpreted relative to
     *  the base directory of the package for which makefiles are being
     *  generated.
     *
     *  @see #getGenTab
     */
    struct GenDesc {
        String template;    /*! name of the template to expand */
        String file;        /*! the name of the file to generate */
    };

    /*!
     *  ======== MacroDesc ========
     *  Macro definition descriptor
     *
     *  This structure is used to specify macro name-value pairs that are
     *  added to the generated makefiles.  These names can be used
     *  by commands added via the filter's `{@link #archive()}`,
     *  `{@link #compile()}`, or `{@link #link()}` methods.
     *
     *  Using symbolic values in lieu of embeddeding explicit paths or values
     *  enables the end-user to re-define these values without requiring
     *  regeneration of makefiles.
     *
     *  @see #getDefs
     */
    struct MacroDesc {
        String name;    /*! name of the macro */
        String value;   /*! the name value of the macro name */
    };
    
instance:

    /*!
     *  ======== archive ========
     *  Archive command filter
     *
     *  This method is called for every archive created by the package's
     *  build script (via `{@link xdc.bld.PackageContents#addLibrary()}`).
     *
     *  @param(container)   String
     *  @param(lib)         `{@link xdc.bld.Library}`
     *  @param(objList)     String
     *  @param(archArgs)    `{@link xdc.bld.ITarget#ArchiveGoal}`
     *  @param(result)      `{@link xdc.bld.ITarget#CommandSet}`
     */
    function archive(container, lib, objList, archArgs, result);

    /*!
     *  ======== compile ========
     *  Compile command filter
     *
     *  This method is called for every object created by the package's
     *  build script (via `{@link xdc.bld.Executable#addObjects()}`,
     *  `{@link xdc.bld.Library#addObjects()}`, ...).
     *
     *  @param(container)   String
     *  @param(target)      `{@link xdc.bld.ITarget}.Module`
     *  @param(goal)        String goal file
     *  @param(compArgs)    `{@link xdc.bld.ITarget#CompileGoal}` the file to
     *                      compile
     *  @param(result)      `{@link xdc.bld.ITarget#CommandSet}`
     */
    function compile(container, target, goal, compArgs, result);

    /*!
     *  ======== getGenTab ========
     *  Get table of files to be generated during configuration
     *
     *  This method is called during makefile generation to obtain
     *  a list of additional files to be generated during configuration.
     *
     *  @param(acfg)        `{@link xdc.bld.Configuration}` or Assembly
     *  @param(cfgDir)      String directory name where generated config files
     *                      are placed
     *  @param(configName)  String base name of the configuration
     *  @a(RETURNS)         array of `{@link #GenDesc}`
     */
    function getGenTab(acfg, cfgDir, configName);

    /*!
     *  ======== getDefs ========
     *  Get table of macro definitions
     *
     *  This method is called during makefile generation to obtain
     *  a list of macro definitions that are to be added to the
     *  generated makefile.  These macros can then be referenced by
     *  commands added via a filter function (`{@link #archive()}`,
     *  `{@link #compile()}` or `{@link #link()}`).
     *
     *  @a(RETURNS)         array of `{@link #MacroDesc}`
     */
    function getDefs();

    /*!
     *  ======== link ========
     *  Link command filter
     *
     *  This method is called for every executable created by the package's
     *  build script (via `{@link xdc.bld.PackageContents#addExecutable()}`,
     *  ...).
     *
     *  @param(container)   String
     *  @param(cfgbase)     String
     *  @param(prog)        Executable or Assembly
     *  @param(objList)     String
     *  @param(linkArgs)    `{@link xdc.bld.ITarget#LinkGoal}`
     *  @param(result)      `{@link xdc.bld.ITarget#CommandSet}`
     */
    function link(container, cfgBase, prog, objList, linkArgs, result);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

