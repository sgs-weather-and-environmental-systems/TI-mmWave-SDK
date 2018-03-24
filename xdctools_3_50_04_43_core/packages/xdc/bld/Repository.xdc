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
 *  ======== Repository.xdc ========
 */
package xdc.bld;

/*!
 *  ======== Repository ========
 *  Model of a package repository
 */
metaonly module Repository {

    /*!
     *  ======== Attrs ========
     *  Optional attributes for a repository
     *
     *  @field(releases)  This array contains releases that will contain the
     *          repository.  Thus, a single repository can be part of any set 
     *          of releases.  Each repository is always added to the 
     *          package's "default release" in addition to any releases
     *          specified in the releases array.
     *
     *  @field(search) By default, the release archives of all packages added
     *          to a repository are required to exist in the package's release
     *          output directory at the time the repository is created.
     *
     *          However, if this flag is set to `true`, each package's release
     *          will be searched for at the time that the makefile for the
     *          package containing this repository is created.  This allows
     *          package releases that exist before this repository is being
     *          built to more easily be added to this repository.
     *
     *          For example, package release archives can be moved to arbitrary
     *          directories after they are created but before a package containing
     *          a repository that includes these releases is built.
     *
     *          Package releases are searched for by looking in the following
     *          locations (in order): the package's release archive output
     *          directory, along the specified `archivePath`, and finally along
     *          the current package path.
     *
     *          If a package release archive cannot be found in the package's 
     *          release output directory or along the `archivePath`, the package
     *          path will be searched for the package itself (not its release 
     *          archive).  So, if the package appears on the package path _and_ 
     *          it's a released package with the specified release name, the 
     *          package will simply be copied into this repository.
     *
     *          Finally, if the package release can't be found, and error is
     *          thrown.
     *
     *  @field(archivePath) This ';' separated list of directories is used to
     *          find package release archives when the `search` flag is set to
     *          `true`.  If `archivePath` is `null`, no search path will be
     *          used and the package release itself (not the archive) may be found
     *          along the package path.
     *
     *  @see #attrs
     */
    struct Attrs {
        Release.Instance releases[];    /*! releases this repo is a part of */
        Bool             search;        /*! true => search path for packages */
        String           archivePath;   /*! search path for package archives */
    };

instance:
    /*!
     *  ======== create ========
     *  @_nodoc
     *  Instances should only be created via PackageContents.addRepository()
     */
    create();

    /*!
     *  ======== name ========
     *  The repository's directory name
     */
    config String name;

    /*!
     *  ======== attrs ========
     *  The repository's attributes
     */
    config Attrs attrs;

    /*!
     *  ======== addPackages ========
     *  Add specified package releases to this repository
     *
     *  @param(names) An array of strings naming package releases to be added
     *          to the repository.  Package releases are named as follows:
     *          @p(code)
     *              <pkgName>:<releaseName>
     *          @p
     *          where `<pkgName>` is the name of the package to add to the
     *          repository and `<releaseName>` is the name of one of that
     *          package's releases.  A package release name may be either the
     *          archive file name (relative to the package's base directory)
     *          of the release archive or the name used create the release in
     *          package named `<pkgName>`.
     *
     *          For example, if the package `ti.bios` had a release named
     *          `exports/ti_bios,src`, the following statements would add
     *          this release to the repository named `packages`:
     *          @p(code)
     *              var r = Pkg.addRepository("packages");
     *              r.addPackages(["ti.bios:exports/ti_bios,src"]);
     *          @p
     *
     *          Alternatively, one can specify the archive file name:
     *          @p(code)
     *              var r = Pkg.addRepository("packages");
     *              r.addPackages(["ti.bios:exports/ti_bios,src.tar"]);
     *          @p
     *
     *          It is possible to get a list of release archive names from a
     *          package via the
     *          `{@link xdc.bld.BuildEnvironment#getReleaseDescs()}`
     *          method.  For example, to get the physical archive name of the
     *          default release of the `ti.bios` package, the following loop
     *          can be added to a build script:
     *          @p(code)
     *              var archiveName;
     *              var rels = Build.getReleaseDescs('ti.bios');
     *              for (var j = 0; j < rels.length; j++) {
     *                  if (rels[j].label == "default") {
     *                      archiveName = rels[j].aname;
     *                      break;
     *                  }
     *              }
     *              // archiveName is now set to the file name of the ti.bios
     *              // default release archive (or undefined)
     *          @p
     *
     *  @see xdc.bld.BuildEnvironment#getReleaseDescs()
     */
    Void addPackages(String names[]);
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

