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
 *  ======== Release.xdc ========
 */
package xdc.bld;

/*!
 *  ======== Release ========
 *  Model of an archive of all files that are part of a release.
 *
 *  Release instances define a container object that represents all files that
 *  are part of a release of a package.  A release may, for example, include
 *  just the files necessary to support a particular ISA even though the
 *  package as a whole can support multiple ISAs.
 *
 *  Each Release instance is realized as a tar file containing the files
 *  that are part of a release of a package.
 */
metaonly module Release {

    /*!
     *  ======== Attrs ========
     *  Optional Release attributes
     *
     *  Unspecified attributes are "inherited" from
     *  `{@link xdc.bld.PackageContents#Attrs}`; i.e., if one of fields in
     *  this structure is unspecified *and* this field's name matches a field
     *  name in `{@link xdc.bld.PackageContents#Attrs}`, then
     *  this field's value defaults to the value in specified by
     *  `{@link xdc.bld.PackageContents#attrs}`.  This mechanism makes it
     *  possible to establish package-wide default values for any of the
     *  "inherited" attributes.
     *
     *  However, elements added to a release can "override" these attributes.
     *  For example, when an executable is added to a release and the
     *  executable's attributes specify `'exportSrc = false'`, the release
     *  will not contain the executable's sources (even if the release's
     *  `{@link #attrs}.exportSrc` attribute is set to `true`).
     *
     *  @field(exportCfg)  If this field is set to `true`, configuration
     *          scripts will be part of the release.  If it is unspecified
     *          (or set to `null`), program configuration scripts will not
     *          be added to this release.
     *
     *  @field(exportDoc)  If this field is set to `true`,  generated
     *          documentation will be part of the release.
     *
     *  @field(exportSrc)  If this field is set to `true`, sources
     *          used to produce object files will be part of the release.
     *          If it is unspecified (or set to `null`), no sources will
     *          be part of this release.
     *
     *  @field(exportExe)  If this field is set to `true`, executables
     *          will be part of the release.  If it is unspecified (or set
     *          to `null`), executables will not be part of this release.
     *
     *  @field(exportAll)  If this field is set to `true`, all files
     *          in this package that are not known to be generated are in
     *          the release.  If it is unspecified (or set to `null`), these
     *          files will not be added to this release.
     *
     *          Note that the set of files specified by `exportAll` is
     *          determined at the time the package's makefile is generated.
     *          If one of these files is subsequently removed before the
     *          release is built, the build of the release will fail; a file
     *          required by the release no longer exists.  If the file is
     *          not really required for the release, you must trigger a
     *          rebuild for the generated makefiles; either touch
     *          `package.bld` or remove the generated makefile and re-build
     *          the release.
     *
     *  @field(relScript)  If this field is non-`null`, the string names a
     *          "release script" that is run to post-process the
     *          files that are part of a release.  Like
     *          configuration scripts, the string names a script
     *          file that is searched for first in the in package's
     *          base directory, and then along the package path.  See
     *          `{@link Manifest}` for more information about release scripts
     *          and what they can do.
     *
     *  @field(relScriptArgs)  If this field is non-`null`, the string is
     *          used to initialize the `arguments[]` array which is
     *          accessible to the release script named by `relScript`.  The
     *          elements of the `arguments[]` array are formed from the white
     *          space separated elements of `relScriptArgs`.  If this string
     *          is `null` or empty, the `arguments[]` array has length `0`.
     *
     *  @field(label)  This string allows one to "tag" each release with a
     *          label that can be used by other tools to select appropriate
     *          releases.  For example, the label might contain customer names.
     *
     *          This label is not interpreted by the XDC tools.  It is simply 
     *          recorded in the package's build model XML file
     *          (`package/package.bld.xml`) and retrieved via
     *          `{@link xdc.bld.BuildEnvironment#getReleaseDescs()}`
     *
     *  @field(prefix)  This string allows one to "export" each release to a
     *          location outside of the package.  `prefix` is prepended
     *          to the name of the release name to form the name of the
     *          release archive.
     *
     *          For example, setting `prefix` to `"../"` implies that a 
     *          release named `"exports/foo"` generates an archive file named
     *          `foo.tar` in the directory `"../exports"`.
     *
     *          `prefix` must either begin with the '^' character or
     *          be a path that is relative to the package's "base"
     *          directory; i.e., the directory containing the package's
     *          specification file `package.xdc`.
     *
     *          If `prefix` begins with the '^' character, the
     *          remainder of the string is treated as though it is relative
     *          to the package's repository.  In effect, the '^' character is
     *          replaced with an appropriate number of '../' sequences to
     *          sufficient to navigate to the package's repository.
     *
     *          If it is not specified (or set to `null`) the current setting
     *          of `{@link xdc.bld.PackageContents#releasePrefix}` is used.
     *
     *  @field(compress) If this field is set to `true`, the release
     *          archive file will be compressed; otherwise, the
     *          archive will not be compressed.  Archives are compressed
     *          via `gzip`; compressed archives are `.tar.gz` files.
     *
     *  @field(archiver) This field names the archiver to use when creating a
     *          release.  Two archivers are currently supported:
     *          "tar" and "zip".  If the archiver is set to "zip"
     *          the `{@link #Attrs.compress}` field is implicitly set to
     *          `true`.
     *
     *  @see #attrs
     */
    struct Attrs {
        String  archiver;       /*! "tar" or "zip"; defaults to "tar" */
        Bool    compress;       /*! if `true`, compress package archive */
        Bool    exportDoc;      /*! if `true`, export generated docs */
        Bool    exportExe;      /*! if `true`, export program executables */
        Bool    exportCfg;      /*! if `true`, export program cfg scripts */
        Bool    exportSrc;      /*! if `true`, export all package sources */
        Bool    exportAll;      /*! if `true`, export all files in package */
        String  relScript;      /*! release files post-processing script */
        String  relScriptArgs;  /*! optional arguments to relScript */
        String  prefix;         /*! prefix for name of install of archive */
        String  label;          /*! uninterpreted label for this release */
    };

    /*!
     *  ======== Desc ========
     *  A description of a release
     *
     *  This structure provides information about a release that can be
     *  used to select from multiple releases provided by a package.
     *
     *  @see xdc.bld.BuildEnvironment#getReleaseDescs()
     */
    struct Desc {
        String name;    /*! the name used to create the release */
        String aname;   /*! the file name of the archive */
        String label;   /*! the label given to the release */
    };
    
    /*!
     *  ======== DescArray ========
     *  An array of release descriptors
     */
    typedef Desc DescArray[];

instance:
    /*!
     *  ======== create ========
     *  @_nodoc
     *  Instances should only be created via PackageContents.addRelease()
     */
    create();

    /*!
     *  ======== name ========
     *  The name of the release.
     *
     *  This name is the base name of the generated tar file containing all
     *  files that make up the release.  For example, if the name of the
     *  release is "foo" then the file "foo.tar" (located in the same
     *  directory as package.bld) is a tar file containing the release files.
     *
     *  Note that each package has at least one release defined, the default
     *  release.  The default release's name is the name of the package with
     *  '.'s replaced with '_'s.  For example, the default release name for
     *  the package "foo.bar" is "foo_bar" and the generated tar file is
     *  named "foo_bar.tar".
     */
    config String name;
    
    /*!
     *  ======== attrs ========
     *  This instance's attributes.
     *
     *  Unless explicitly specified, these attributes are "inherited" from
     *  the package's attributes (`{@link xdc.bld.PackageContents#attrs}`)
     *
     *  @see xdc.bld.PackageContents#attrs
     */
    config Release.Attrs attrs;

    /*!
     *  ======== otherFiles ========
     *  Additional files to add to this release.
     *
     *  This is an array of arbitrary files that are to be included
     *  in this release of the package.
     *
     *  Only those files that are not already directly (or indirectly) named
     *  by adding programs or libraries to this release need to appear in
     *  this array.
     */
    config String otherFiles[];

    /*!
     *  ======== excludeDirs ========
     *  List of directory base names to exclude
     *
     *  This is an array of arbitrary directory "base names" that should
     *  be excluded in this release of the package.  This list only
     *  excludes directories that would otherwise be added due to the
     *  recursive include of a parent directory.
     *
     *  For example, if a directory is specified in `{@link #otherFiles}`
     *  all of its sub-directories will be added unless those sub-directories
     *  are named in the `excludeDirs` list.
     *
     *  This list is often used to exclude "hidden" directories added by
     *  change control systems and IDEs (`.svn`, `.git`, `.settings`, ...).
     *
     *  @see #otherFiles
     *  @see PackageContents#excludeDirs
     */
    config String excludeDirs[];
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

