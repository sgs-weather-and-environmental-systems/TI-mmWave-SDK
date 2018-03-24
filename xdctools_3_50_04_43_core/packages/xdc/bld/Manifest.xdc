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
package xdc.bld;

/*!
 *  ======== Manifest ========
 *  The manifest object for the release file post-processing model
 *
 *  Each package release corresponds to an archive of a subset of the
 *  development package's contents.  The contents of each release are
 *  specified by an instance of the `{@link Release}` module.  Each instance
 *  of the `Release` module can optionally specify a "release script" that
 *  can modify each file prior to it being added to the archive.  This script
 *  runs in the context of the "release file post-processing" model.
 *
 *  This module is the root of the "release file post-processing" model.
 *  Each file in a release may be optionally post-processed by a filter
 *  specified in `{@link #filterMap}.`  Other fields of this module provide
 *  a release-specific "context" for the operation of the filters.  For
 *  example, a filter may use `{@link #packageName}`, `{@link #releaseName}`,
 *  and `{@link #buildCount}` to prefix all C sources with comments that
 *  identify where they originated.
 *
 *  All the fields of this module (except `{@link #filterMap}`) are initialized
 *  before a "release script" is run.  After the release script completes,
 *  the release archive is created according to the filters specifed in
 *  `{@link #filterMap}`.  Files that have no filter are copied without
 *  modification into the release.
 */
metaonly module Manifest {

    /*!
     *  ======== Filter ========
     *  A file filter descriptor
     *
     *  @field(operation)  a JavaScript function that filters the specified
     *	    input file and puts the results in specified output file; it is
     *	    the output file that is archived as part of the release (not the
     *	    input file).
     *
     *	    The operation is called as follows:
     *      @p(code)
     *		operation(filter, src, dst, base)
     *      @p
     *	    where:
     *	    @p(dlist)
     *	      -`filter`
     *		    the filter object associated with the file being
     *		    processed (which specified `operation` as the function
     *		    to call)
     *	      -`src`
     *		    input file name (relative to the current working
     *		    directory)
     *	      -`dst`
     *		    output file name (relative to the current working
     *		    directory)
     *	      -`base`
     *		    string name of the file as it appears in the array
     *		    `Manifest.files`; unlike `dst`, it does not contain a
     *		    temporary directory name prefix.
     *
     *  @field(args)  array of arbitrary arguments passed to `operation`
     *	    (as a field of the filter object passed as the first argument to
     *	    `operation`)
     *
     *  @field(newFileName) the new name of the output file relative to the
     *	    top of the archive.  Normally this name should include the
     *	    package's name but, in situations where a release must support a
     *	    non-RTSC conformant physical design, `newFileName` can be anything.
     *
     *  @field(newFileMode) the access permissions of the output file.
     *	    Normally the file will have the access permissions that exist at
     *	    the time archive is created.  However, there may be times when
     *	    the developer wants/needs to make a file readonly that is (for
     *	    development purposes) writable.  Only two modes are supported "r"
     *	    (readonly) and "rw" (readable and writable).
     *
     *  @see #filterMap
     */
    struct Filter {
	any	    operation;	    /*! the JavaScript function to run */
	any	    args[];	    /*! additional arguments for operation */
	String	    newFileName;    /*! the new file name */
	String	    newFileMode;    /*! either "r" or "rw" */
    }

    /*!
     *  ======== compatibilityKey ========
     *  The released package's compatibility key
     *
     *  This string contains the value declared in the package's `package.xdc`
     *  specification file.
     *
     *  @a(readonly)  This value is initialized before the release script or
     *		      any of its filters are run and should not be modified.
     */
    config String compatibilityKey;

    /*!
     *  ======== buildCount ========
     *  A unique build count for the released package.
     *
     *  This string contains is a decimal number that increments at least
     *  once every time the package is released.  This string together with
     *  the compatibility key forms a unique version number for the package.
     *
     *  @a(readonly)  This value is initialized before the release script or
     *		      any of its filters are run and should not be modified.
     */
    config String buildCount;

    /*!
     *  ======== packageName ========
     *  The released package's name
     *
     *  This string contains the value declared in the package's `package.xdc`
     *  specification file.
     *
     *  @a(readonly)  This value is initialized before the release script or
     *		      any of its filters are run and should not be modified.
     */
    config String packageName;
    
    /*!
     *  ======== releaseName ========
     *  The release's name
     *
     *  This string contains the value declared in the package's `package.bld`
     *  build script; it is the name of the output archive without the
     *  "`.tar`" extension.
     *
     *  @a(readonly)  This value is initialized before the release script or
     *		      any of its filters are run and should not be modified.
     */
    config String releaseName;
    
    /*!
     *  ======== files ========
     *  An array of files in the release
     *
     *  The file names in this array include the package's name; i.e.,
     *  these names are relative to the package's repository rather than 
     *  the package's build directory.
     *
     *  This value is initialized before the release script or any of its
     *  filters are run, and it contains the the names of the files specified
     *  directly or indirectly by the package's build script.
     *
     *  By default, this list does not contain all files in this package
     *  release, it excludes files that are commonly copied verbatim into
     *  the release (see below).  To get the complete list you must call
     *  `{@link #getAllFiles Manifest.getAllFiles}`.
     *
     *  The excluded files are those that are indirectly included either via
     *  @p(blist)
     *      - a directory named in `{@link PackageContents#otherFiles}` or
     *        `{@link Release#otherFiles}`,
     *      - a repository added via `{@link PackageContents#addRepository}`,
     *        or
     *      - the documentation directory named by
     *        `{@link PackageContents#docDir}`
     *  @p
     *
     *  It is possible to remove files from a release by removing it from
     *  this array; only files in this array or that are in the specified
     *  verbatim directories, the directories named above, will appear in
     *  the release.  To remove files that are in any of these directories
     *  use `{@link #getAllFiles Manifest.getAllFiles}` to re-initialize
     *  `files` so that it contains all of the release's files, then
     *  selectivly remove the files from this array.
     *
     *  It is also possible to add files to a release by adding files to
     *  this array.  In fact, files added to the release can be generated
     *  by the filter operation specified for the file in
     *  `{@link #filterMap}`.  However, since these files are only present
     *  in releases of a  package (they are not built as part of the normal
     *  build of `all` files and only appear in installed releases of a
     *  package), packages that must be built as part of building this
     *  release should not refer to these files.
     */
    config String files[];

    /*!
     *  ======== filterMap ========
     *  A map of filters for each file in the release
     *
     *  This map is indexed by the name of the file (as it appears in the
     *  `{@link #files}` array) in the release and defines for each file a
     *  filter that is applied to the file before it is archived in a
     *  release.
     *
     *  @a(example)  The following script fragment illustrates how one can
     *	filter all *.c files in a release through a custom JavaScript
     *  function named `copyright`.
     *      @p(code)
     *      function copyright(args, ...) { ...}
     *
     *      for (var i = 0; i < Manifest.files.length; i++) {
     *          var fileName = Manifest.files[i];
     *          if (fileName.match(/\.c$/) != null) {
     *              Manifest.filterMap[fileName] = {operation: copyright};
     *          }
     *      }
     *      @p
     *
     *  @see #files
     */
    config Filter filterMap[string];

    /*!
     *  ======== getAllFiles ========
     *  Read the entire release manifest into the Manifest.files array
     *
     *  This function re-reads the release's manifest into the
     *  `Manifest.files` array but only excludes the directories whose
     *  names appear in the `String` array `verbatimDirs`.  
     *
     *  @param(verbatimDirs)	array of strings naming directories relative
     *                          to the package's base directory.  Each
     *                          directory named in this array (and all the
     *                          files and sub-directories it contains) is 
     *                          excluded from the `Manifest.files` array and 
     *                          is automatically added to the release without
     *                          change.
     *
     *                          If this array is `null` or empty, all files
     *                          in the release are read into the
     *                          `Manifest.files` array.
     */
    Void getAllFiles(String verbatimDirs[]);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

