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
 *  ======== Library.xdc ========
 */
package xdc.bld;

/*!
 *  ======== Library ========
 *  Model of a searchable collection of object files
 *
 *  A library is a collection of one or more object files that is searched
 *  to resolve undefined references at link time.
 *
 *  Instances of this module represent a target independent collection of
 *  object files that implement a single set of APIs.  Thus, a library is
 *  really a container of target-specific archives which contain the object
 *  files necessary to implement a common API.  Although, a library may
 *  contain target dependent APIs, each library is expected to
 *  encapsulate the same basic functionality independent of the target.
 *
 *  Instances must be created via the
 *  `{@link xdc.bld.PackageContents#addLibrary()}` function; this
 *  ensures that each library created appears in the package's manifest and
 *  that it properly "inherits" appropriate default attributes from the
 *  containing package.
 *
 *  Library instances are initially create without *any* objects; this ensures
 *  that the developer complete control over what objects should be in each
 *  library. Thus, even modules declared in a package's specification,
 *  `package.xdc`, must be explicitly added to each library in the package
 *  (via `{@link #addObjects()}`).
 */
metaonly module Library {
    /*!
     *  ======== Attrs ========
     *  Optional attributes for a Library instance.
     *
     *  Unspecified attributes are "inherited" from
     *  `{@link xdc.bld.PackageContents#Attrs}`; i.e., if one of fields in this
     *  structure is unspecified *and* this field's name matches a field name
     *  in `{@link xdc.bld.PackageContents#attrs}`, then this field's value
     *  defaults to the value in specified by
     *  `{@link xdc.bld.PackageContents#attrs}`.  This mechanism makes it
     *  possible to establish package-wide default values for any of the
     *  "inherited" attributes.
     *
     *  Suppose, for example, that you want all archives in this
     *  package to be build with the '`release`' profile, but one particular 
     *  archive must be built with '`debug`' (because it is a source example).
     *  The following build script fragment shows how this can be
     *  accomplished:
     *  @p(code)
     *      Pkg.attrs.profile = 'release';
     *      var lib = Pkg.addLibrary('example', ..., {profile: 'debug'});
     *  @p
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
     *  @field(aropts)  This string contains options used by the archiver
     *          produce archive files; e.g., "`-q`".  Note
     *          that the syntax of this string may be target dependent.
     *
     *  @field(exportSrc)  If this field is set to true, the sources
     *          specified via `{@link #addObjects}()`
     *          will be part of the releases named in the releases
     *          array.  If it is unspecified (or set to `null`) and the
     *          release specifies that sources are to be exported,
     *          the sources will be part of the release.  In
     *          all other cases, the sources are not part of the
     *          release.
     *
     *  @field(suffix)  If this string is set to a non-`null` value, it 
     *          specifies the suffix (or extension) of the archive produced.
     *          This suffix is used in lieu of the default suffix
     *          ("`.a<targ_suffix>`", where `<targ_suffix>` is the suffix
     *          property of the target used to create the archive).  So,
     *          care must be taken when creating multiple libraries for
     *          different targets to ensure that the resulting archive names
     *          are unique.
     *
     *  @field(profile)  This string names a profile defined by the
     *          library's target.  The profile specifies a set of compiler,
     *          assembler, and archiver options that are to be used when 
     *          producing the archive.  Note that these tool options are
     *          in addition to any options specified via `aopts`, `copts`,
     *          etc.
     *
     *  @field(releases)  This array contains releases that will contain the
     *          library.  Thus, a single library can be part of any set of
     *          releases.  Each library is always added to the package's
     *          "default release" in addition to any releases specified in
     *          the releases array.
     *
     *  @see #attrs
     *  @see xdc.bld.PackageContents#Attrs
     */
    struct Attrs {
        String  profile;    /*! target options profile */
        String  aopts;      /*! asm options for objects */
        String  copts;      /*! C/C++ options for objects */
        String  defs;       /*! definitions for added objects */
        String  incs;       /*! include options for objects */
        String  aropts;     /*! library-specific archiver options */
        String  suffix;     /*! optional suffix of library name; e.g.,".lib" */
        Bool    exportSrc;  /*! if true, export library sources to releases */
        Release.Instance releases[];  /*! releases this library is a part of */
    };

instance:
    /*!
     *  ======== create ========
     *  @_nodoc
     *  Instances should only be created via PackageContents.addLibrary()
     */
    create();

    /*!
     *  ======== name ========
     *  The base name of the library.
     *
     *  This name names a sub-directory in the package directory that
     *  contains all the object files and archives created for each of the
     *  targets specified.
     *
     *  The name of each library is `<name>/<name>.a<target_suffix>`, where
     *  `<name>` is the base name and `<target_suffix>` is the suffix property
     *  of the target for which the library is built.  For example, one is
     *  building a `"hello"` library for big endian C62 the library's file
     *  name is "`hello/hello.a62e`"
     */
    config String name;

    /*!
     *  ======== target ========
     *  The target used to build objects added to this library.
     */
    config ITarget.Module target;

    /*!
     *  ======== attrs ========
     *  This library's optional attributes.
     *
     *  These attributes are "inherited" by all objects added to this
     *  library; i.e., any object attribute that is undefined but is
     *  defined here will be assigned the value from these attributes.
     *
     *  Similarly, any unspecified attributes that also appear in
     *  `{@link xdc.bld.PackageContents#Attrs}` are inherited from
     *  `{@link xdc.bld.PackageContents#attrs}`.
     *
     *  @see xdc.bld.PackageContents#Attrs
     */
    config Library.Attrs attrs;
    
    /*!
     *  ======== addObjects ========
     *  Add specified object to be built and archived into this library.
     *
     *  Examples
     *
     *      1. Locate a source file whose name starts with "fir" with
     *      an extension supported by the library's target, compile it
     *      and add to the library lib:
     *      @p(code)
     *          lib.addObjects(["fir"]);
     *      @p
     *      If fir.c exists compile and add to lib, if fir.asm exists
     *      assemble and add to lib, etc.  If no such file is located,
     *      an warning is emitted.
     *
     *      2. Compile `fir.c` and `iir.c` and add to the library `lib`:
     *      @p(code)
     *          lib.addObjects(["fir.c", "iir.c"]);
     *      @p
     *      3. Names may include sub-directory prefixes.  In this case, the
     *      source will be located in a sub-directory of the current
     *      package.  The following statement declares that the file
     *      "`foo/fir.c`" should be compiled and added to the library
     *      `lib`:
     *      @p(code)
     *          lib.addObjects(["foo/fir.c"]);
     *      @p
     *      As in the previous examples, the extension ".c" is optional. 
     *      In case an extension is not supplied, each extension
     *      understood by the target will be tried until a source file
     *      is located.
     *
     *      4. It is also possible to supply file specific compilation
     *      options.
     *      @p(code)
     *          lib.addObjects(["fir.c", "iir.c"], {defs: "-D_DEBUG"});
     *      @p
     *      In this case, both files `fir.c` and `iir.c` will be compiled
     *      with the "`-D_DEBUG`" flag.  Any setting of `attrs.defs` in the
     *      library or package is overridden by this definition.
     *
     *  @param(names)       array of base names of the sources of object files
     *                      to be created and archived into the library.
     *			    See NOTE in `{@link xdc.bld}` for filename rules.
     *
     *  @param(objAttrs)    optional `{@link Object#Attrs}` for the array of
     *                      objects added; all objects named by `names` will be
     *                      given the attributes `objAttrs`.
     *
     *  @a(returns)         `void`
     *
     *  @a(throws)          `Error` exceptions are thrown for fatal errors
     *
     */
    Void addObjects(String names[], Object.Attrs objAttrs = {});
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

