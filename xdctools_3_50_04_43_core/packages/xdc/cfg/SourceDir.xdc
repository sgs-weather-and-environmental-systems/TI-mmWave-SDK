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
 *  ======== SourceDir ========
 *  Manage config generated source directories
 *
 *  Every "product" can generate a collection of source files that
 *  must be compiled into a single library and linked with the
 *  application.  Each collection of source files is placed in a
 *  subdirectory of a top-level directory and contains a GNU make file,
 *  named makefile, which builds the library.
 *
 *  This module generates a top-level makefile that builds all "product"
 *  libraries, the top-level directory that houses the "product"
 *  sub-directories, and any files necessary for integration with eclipse/CDT
 *  managed make.  The generated "product" files need only ensure their
 *  sources can be built via their generated makefile (from their
 *  sub-directory).
 */
@Template("./SourceDir.xdt")
metaonly module SourceDir
{
    /*!
     *  ======== outputDir ========
     *  Top-level directory for config generated sources and makefiles
     *
     *  This directory path can be either an absolute path or a path
     *  relative to the build working directory at the time source files
     *  are generated (this is NOT necessarily the same as the build
     *  directory at the time the generated sources are built!)
     *
     *  This parameter must never be set to an existing directory with source
     *  files in it. The directory referenced by this parameter can be
     *  deleted when a package containing the configuration script is cleaned.
     *
     *  If `outputDir` is not set, files will be output to the `./src`
     *  sub-directory of the directory containing the configuration script.
     */
    config String outputDir;

    /*!
     *  ======== toBuildDir ========
     *  Top-level build working directory
     *
     *  @_nodoc
     *  This config parameter is the build working directory for the
     *  sources generated into `{@link #outputDir}` and is used to determine
     *  a relative path from the build directory to the output directory.
     *
     *  The directory path can be either an absolute path, a path
     *  relative from the build working directory at the time source files
     *  are generated, or `undefined`.
     *
     *  If `toBuildDir` and `outputDir` are `undefined`
     *  `toBuildDir` is set to be the parent of the build working directory
     *  at the time source files are generated; i.e., `"../"`
     *
     *  If `toBuildDir` is `undefined` and `outputDir` is defined,
     *  `toBuildDir` is set to be the build working directory at the time
     *  source files are generated; i.e., `"./"`.
     */
    config String toBuildDir;

    /*!
     *  ======== makefileName ========
     *  Top-level makfile name
     *
     *  This name is the base name of the makefile which is created in 
     *  `outputDir`.
     */
    config String makefileName = "makefile.libs";

    /*!
     *  ======== verbose ========
     *  Output progress messages during a build
     *
     *  Positive values cause additional progress messages to be displayed.
     *  The greater the value, the more information is displayed.
     *  @p(dlist)
     *      - 0
     *          no build progress output
     *      - 1
     *          output a message when the build is started and when it
     *          completes
     *      - 2
     *          output build progress output (both stdout and stderr) as well
     *          all level 1 output
     *      - 3
     *          output the build commands used as well as all level 2 output
     *  @p
     */
    config Int verbose = 0;
    
    /*!
     *  ======== getRelativePath ========
     */
    metaonly String getRelativePath(String fm, String to);

    /*!
     *  ======== build ========
     *  Run make using the generated makefiles
     */
    metaonly Int build();
    
instance:
    /*
     *  ======== create ========
     */
    create(String name);
    
    /*!
     *  ======== getName ========
     */
    metaonly String getName();
    
    /*!
     *  ======== getGenSourceDir ========
     *  Get name of the output directory for this set of source files
     *
     *  The name is either an absolute path or a path relative to the 
     *  build directory at the time configuration is run.
     */
    metaonly String getGenSourceDir();

    /*!
     *  ======== getGenLibraryName ========
     *  Get name of the output library for this set of source files
     *
     *  The name is either an absolute path or a path relative to the 
     *  build directory at the time configuration is run.
     */
    metaonly String getGenLibraryName();
    
    /*!
     *  ======== sourceDir ========
     *  Source directory for a specific "product's" generated sources
     *
     *  This path must be relative to `outputDir`.
     */
    config String sourceDir;

    /*!
     *  ======== libraryName ========
     *  Name of library of compiled sources in `sourceDir`
     *
     *  This path must be relative to `outputDir`.
     */
    config String libraryName;

    /*!
     *  ======== buildLibs ========
     *  Build generated library sources
     *
     *  If set to `false`, the configuration step will not attempt to
     *  build the generated library sources.
     */
    config Bool buildLibs = true;
}
/*
 *  @(#) xdc.cfg; 1, 0, 2,0; 11-8-2017 17:10:34; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

