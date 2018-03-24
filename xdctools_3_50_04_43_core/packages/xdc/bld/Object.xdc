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
 *  ======== Object.xdc ========
 */
package xdc.bld;

/*!
 *  ======== Object ========
 *  Model of a compiled (or assembled) form of a source file.
 *
 *  Instances of this module represent object files.  Instances must be
 *  created via either the `{@link xdc.bld.Library#addObjects()}` or
 *  `{@link xdc.bld.Executable#addObjects()}` functions; this ensures that each
 *  object file created appears in the package's manifest and that it
 *  properly "inherits" appropriate default attributes from the containing
 *  library or executable.
 */
metaonly module Object {
    /*!
     *  ======== Attrs ========
     *  Optional attributes for an Object instance
     *
     *  Unspecified attributes are "inherited" from
     *  `{@link xdc.bld.Executable#Attrs}`
     *  (`{@link xdc.bld.Library#Attrs}`) if this Object is added to an
     *  `{@link xdc.bld.Executable}` (`{@link xdc.bld.Library}`); i.e., if one
     *  of fields in this structure is unspecified *and* this field's name
     *  matches a field name in `{@link xdc.bld.Executable#attrs}`,
     *  then this field's value defaults to the value in specified by
     *  `{@link xdc.bld.Executable#attrs}`.  This mechanism makes it possible
     *  to establish executable-wide default value for any of the "inherited"
     *  attributes.
     *
     *  Suppose, for example, that you want all object files in this package
     *  to be build with the '`-o4`' optimization flag, but one particular file
     *  must be built with '`-o2`' (because the optimizer has a bug that it
     *  causes it to fail on this file).  The following build script fragment
     *  shows how this can be accomplished:
     *  @p(code)
     *      var exe = Pkg.addExecutable(..., {copts: '-o4'});
     *      exe.addObjects(['complex'], {copts: '-o2'});
     *      exe.addObjects(['foo', 'bar', ...]);
     *  @p
     *  Since many `Executable.attrs` are "inherited" from
     *  `{@link xdc.bld.PackageContents#attrs}`, it is also possible to
     *  establish package-wide default for these attributes.
     *
     *  @field(profile)  This string names a profile defined by the
     *          target used to produce the object file.  The profile
     *          specifies a set of compiler and assembler options that are
     *          to be used when producing the object.  Note that these tool
     *          options are in addition to any options specified via aopts,
     *          copts, etc.
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
     *  @field(preBuilt) If equal to `true`, this Boolean flag indicates
     *          that this object does not need to be built from sources; e.g.,
     *          it has been pre-built and delivered as a binary file without
     *          sources or some custom rule already built this object file.
     *          For pre-built objects, no rule will be created to remove the
     *          file as part of a package clean operation, the relative path
     *          to the file must be fully specified, and all other Object
     *          attributes are ignored.
     *
     *  @see #attrs
     *  @see xdc.bld.PackageContents#Attrs
     *  @see xdc.bld.Library#Attrs
     *  @see xdc.bld.Executable#Attrs
     */
    struct Attrs {
        String profile; /*! target options profile */
        String aopts;   /*! asm options for this object */
        String copts;   /*! C/C++ options for this object */
        String defs;    /*! definitions for this object */
        String incs;    /*! include options for this object */
        Bool   preBuilt;/*! don't create a rule to generate this file */
    };
    
instance:
    /*!
     *  ======== create ========
     *  @_nodoc
     *  Instances should only be created via Executable.addObjects()
     */
    create();

    /*!
     *  ======== name ========
     *  The base name of the object file.
     *
     *  This name is passed as the name field of the
     *  `{@link xdc.bld.ITarget#CompileGoal}`.  The object file's name is
     *  composed as follows:
     *  @p(code)
     *      <name>.o<target_suffix>
     *  @p
     *  where `<name>` is name and `<target_suffix>` is the suffix defined 
     *  by each target that the file is built for.
     */
    config String name;

    /*!
     *  ======== attrs ========
     *  This instance's attributes.
     *
     *  These attributes (unless otherwise specified) are "inherited" from
     *  the container object that contains this instance.
     *
     *  @see xdc.bld.PackageContents#Attrs
     *  @see xdc.bld.Executable#Attrs
     *  @see xdc.bld.Library#Attrs
     */
    config Object.Attrs attrs;  
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

