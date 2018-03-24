/* 
 *Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */

package xdc.tools.repoman;

/*!
 *  ======== xdc.tools.repoman.Main ========
 *  Repository Manager tool
 *
 *  This tool creates and manages package repositories.  It displays
 *  information about archived packages, extracts archived packages,
 *  extracts repositories from bundles and deletes packages from
 *  repositories.
 *
 *  Information about archived packages can be displayed with
 *  the '-t' and '-n' options. The '-p' argument is used to 
 *  specify a directory in which to search. If the '-p' arg is omitted,
 *  the current directory is searched. Specific packages can searched
 *  for by specifying one or more package names, or one or more package
 *  archives at the end of the command line.  If no packages are specified,
 *  information on all packages found in the search directory will be
 *  displayed.
 *  
 *  Archived packages can be extracted to a repository with the '-x' 
 *  option. '-x -D' will extract dependent packages, too. '-x -R' will
 *  recursively extract dependent packages. If any of the packages in 
 *  the specified package list are not compatible, the operation will
 *  be aborted. '-F' can be used to force all packages to be extracted,
 *  regardles of compatibility. The '-p' arg is used to specify a
 *  directory to search in. If not specified, the current directory will
 *  be searched. The '-x' option also extracts a repository or packages
 *  from a bundle. In this case, the last argument specifies the bundle
 *  from which to extract the repository. The repository to be extracted
 *  is specified with the '-b' arg. If just packages are to be extracted,
 *  one or more package names should follow the name of the repository
 *  that they should be extracted from.
 *
 *  Packages can be deleted from a repository with '-d'. If the package
 *  has any subdirectores that contain packages, they will be left intact.
 *  After the package is deleted, if the package has no subdirectories
 *  with packages, empty directories that are part of the fully qualified
 *  package will be deleted, too.
 *
 *  Packages can be copied between repositories with '-c'. If the package
 *  being copied already exists in the destination repository, it will be
 *  deleted prior to being replaced.
 *
 *  The '-r' argument specifies a destination repository. If '-r' is
 *  omitted, the repository of the current package is used. If there is
 *  no current package, the current directory is used. 
 *
 *  When a package name is given, it can be specified in full, such as
 *  'ti.platforms.sim6xxx', or the wildcard characters '*' and '?' may be
 *  used, as in 'ti.platforms.*' or 'ti.catalog.c??00'. A version/key can
 *  also be attached to a package name in the following manner:
 *  'ti.platforms.c6000[1,0,0,0,313835]'.  A prefix of the full version/key
 *  may also be used: 'ti.platforms.c6000[1,0]'.
 *
 *  If a package name has multiple matches either with or without a
 *  version/key specified, the most recent will be selected. Wildcards may
 *  also be used when naming a package archive file.
 *  
 *  @a(Examples)
 *  xs xdc.tools.repoman -t
 *  @p(dlist)
 *  Displays all info on all archived packages in the current directory
 *  @p
 *    
 *  xs xdc.tools.repoman -t -p C:\xdc-o19\exports
 *  @p(dlist)
 *  Displays all info on all archived packages in C:\xdc-o19\exports
 *  @p
 *
 *  xs xdc.tools.repoman -t -p C:\xdc-o19\exports ti.platforms.*
 *  @p(dlist)
 *  Displays all info on archived packages whose names begin with
 *  ti.platforms. in C:\xdc-o19\exports
 *  @p
 *
 *  xs xdc.tools.repoman -t -p C:\xdc-o19\exports ti_platforms*.tar
 *  @p(dlist)
 *  Displays all info on packages in files that match ti_platforms*.tar
 *  in C:\xdc-o19\exports
 *  @p
 * 
 *  xs xdc.tools.repoman -t -p C:\xdc-o19\exports ti.catalog.c6000 ti.catalog.sim6xxx
 *  @p(dlist)
 *  Displays all info on archived packages ti.catalog.c6000 and
 *  ti.catalog.sim6xxx in C:\xdc-o19\exports
 *  @p
 * 
 *  xs xdc.tools.repoman -t http://www.sanb.design.ti.com/ti_sdo_ce_wizards_genserver.tar
 *  @p(dlist)
 *  Displays all info on archived package ti_sdo_ce_wizards_genserver.tar
 *  at URL http://www.sanb.design.ti.com
 *  @p
 *
 *  xs xdc.tools.repoman -x 
 *  @p(dlist)
 *  Extracts all archived packages in the current directory to the current
 *  repository
 *  @p
 * 
 *  xs xdc.tools.repoman -x -r C:\myrepo\packages -p C:\exports
 *  @p(dlist)
 *  Extracts all archived packages in C:\exports to C:\myrepo\packages
 *  repository
 *  @p
 * 
 *  xs xdc.tools.repoman -x -r C:\myrepo\packages -p C:\exports ti.catalog.*
 *  @p(dlist)
 *  Extracts packages matching ti.catalog.* from c:\exports to
 *  c:\myrepo\packages
 *  @p
 * 
 *  xs xdc.tools.repoman -x -r C:\myrepo\packages C:\exports\ti_catalog*.tar
 *  @p(dlist)
 *  Extracts packages from files matching C:\exports\ti_catalog*.tar 
 *  to c:\myrepo\packages
 *  @p
 * 
 *  xs xdc.tools.repoman -x -r C:\myrepo\packages C:\exports\ti_catalog*.tar
 *  @p(dlist)
 *  Extracts packages from files matching C:\exports\ti_catalog*.tar 
 *  to c:\myrepo\packages
 *  @p
 *
 *  xs xdc.tools.repoman -x -R -r C:\myrepo -p C:\xdc-o19\exports ti.platforms.sim6xxx
 *  @p(dlist)
 *  Extracts the package ti.platforms.sim6xxx and all recursively
 *  dependent packages from C:\xdc-o19\exports to C:\myrepo
 *  @p
 * 
 *  xs xdc.tools.repoman -x -r C:\ -b packages C:\exports\xdc_core.tar.gz 
 *  @p(dlist)
 *  Extracts the repository 'packages' from bundle
 *  C:\exports\xdc_core.tar.gz to C:\
 *  @p
 * 
 *  xs xdc.tools.repoman -x -r C:\myrepo -b examples ti.xdais.dm.examples.videnc1_copy 
 *  C:\xdais_6_24.tar.gz
 *  @p(dlist)
 *  Extracts the package ti.xdais.dm.examples.videnc1_copy from repository
 *  'examples' in bundle
 *  C:\xdais_6_24.tar.gz to C:\myrepo
 *  @p
 * 
 *  xs xdc.tools.repoman -x -r C:\myrepo http://www.sanb.design.ti.com/ti_sdo_ce_wizards_genserver.tar
 *  @p(dlist)
 *  Extracts package ti_sdo_ce_wizards_genserver.tar at URL http://www.sanb.design.ti.com
 *  to c:\myrepo
 *  @p
 *
 *  xs xdc.tools.repoman -r C:\myrepo -b examples
 *  http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/7_10/exports/xdais_7_10.tar.gz
 *  @p(dlist)
 *  Extracts all of the packages in repository 'examples' from bundle xdais_7_10.tar.gz at URL
 *  http://... to C:\myrepo
 *  @p
 *
 *  xs xdc.tools.repoman -x -r C:\myrepo -b examples ti.xdais.dm.examples.videnc1_copy
 *  http://software-dl.ti.com/dsps/dsps_public_sw/sdo_sb/targetcontent/xdais/6_24/exports/xdais_6_24.tar.gz
 *  @p(dlist)
 *  Extracts the package ti.xdais.dm.examples.videnc1_copy in repository
 *  'examples' from bundle xdais_7_10.tar.gz at URL http://... to C:\myrepo
 *  @p
 *
 *  xs xdc.tools.repoman -c -r C:\destdir\packages -p C:\srcdir\packages ti.catalog.c6000
 *  @p(dlist)
 *  Copies the package ti.catalog.c6000 from C:\srcdir\packages to
 *  C:\destdir\packages
 *  @p
 *
 *  xs xdc.tools.repoman --rsave -f c:/repoinfo.rmn -p c:/pkgarchives;c:/testpkgs c:/myrepo 
 *  @p(dlist)
 *  Saves package information for repository c:/myrepo to file c:/repoinfo.rmn.
 *  Also saves the search path c:/pkgarchives;c:/testpkgs
 *  @p
 *
 *  xs xdc.tools.repoman --rrestore -f c:/repoinfo.rmn -p c:/pkgarchives;c:/testpkgs
 *  @p(dlist)
 *  Restores all of the packages in the repository referenced in
 *  c:/repoinfo.rmn. Uses the search path c:/pkgarchives;c:/testpkgs to find
 *  and copy packages. Will create the repository if it doesn't exist.
 *  @p
 *
 *  xs xdc.tools.repoman --rcreate -f c:/repoinfo.rmn -p
 *                       c:/pkgarchives;c:/testpkgs c:/mynewrepo
 *  @p(dlist)
 *  Creates the new repository c:/mynewrepo from the repository referenced in
 *  the file c:/repoinfo.rmn.  Uses the search path c:/pkgarchives;c:/testpkgs
 *  to find and copy packages. If successful, the newly created repository
 *  will be identical to its predecessor referenced in c:/repoinfo.rmn.
 *  @p
 *
 *  xs xdc.tools.repoman --providerId my_codec_engine c:/codec_engine_2_23/mypackages
 *  @p(dlist)
 *  Assigns the providerId attribute in  c:/codec_engine_2_23/mypackages/.repo.xml
 *  the value my_codec_engine. If c:/codec_engine_2_23/mypackages/.repo.xml does not
 *  exist, it will be created.
 *  @p
 *
 */
metaonly module Main inherits xdc.tools.ICmd {

    override config String usage[] = [
        '-t [-v] [-p pathname] [packagename...|packagefile...]',
        '-n [-v] [-p pathname] [packagename...|packagefile...]',
        '-x [-v] [-D] [-R] [-F] [-r destrepo] [-p path] packagename...|packagefile...',
        '-x [-v] [-D] [-R] [-F] [-r destrepo] [-p path] -b bundlerepository [packagename...] bundleFile',
        '-d [-v] [-F] [-r destrepo] packagename...',
        '-c [-v] [-F] [--providerId] [-r destrepo] [-p pathname] packagename...',
        '--rsave -f file [-p searchpath] repository...',
        '--rrestore -f file [-p searchpath] [index-spec]',
        '--rcreate -f file [-p searchpath] [index-spec] destrepository...',
        '[-F] --providerId providerId [repository...]'
    ];

   /*! represents a repository in a bundle */
    @XmlDtd 
    metaonly struct Repo {
        String name;
        String pkg[];
    }

    @XmlDtd
    metaonly struct Pkg {
        String name;
        String file;
        String release;
        String label;
        String version;
        String date;
        String buildable;
        String originalProviderId;
        String producerId;
        String reqs[];
        String refs[];
        Repo repository[];
    }
   
    @XmlDtd
    metaonly struct Results {
        String repository;
        String providerId;
        String producerId;
        Bool writable;
        Pkg pkg[];         /*! array of package info structures */
    }

    @XmlDtd
    metaonly struct PkgName {
        String name;
        Repo repository[];
    }

    @XmlDtd
    metaonly struct NameResults {
        PkgName pkgName[];     /*! array of PkgName structures */
    }

instance:

    //!Display package info
    @CommandOption('t')
    config Bool infoFlag = false;

    //!Display package names only
    @CommandOption('n')
    config Bool namesFlag = false;

    //!Extract package(s)
    @CommandOption('x')
    config Bool extractFlag = false;

    //!Delete package(s)
    @CommandOption('d')
    config Bool deleteFlag = false;

    //!Path arg
    @CommandOption('p')
    config String pathArg = null;

    //!Repository arg
    @CommandOption('r')
    config String repositoryArg = null;

    //!Include package dependencies
    @CommandOption('D')
    config Bool dependentFlag = false;

    //!Recursive include package dependencies
    @CommandOption('R')
    config Bool recursiveDepFlag = false;

    //!Return an array of strings
    @CommandOption('a')
    config Bool arrFlag = false;

    //!Return a Results struct as XML
    @CommandOption('X')
    config Bool xmlFlag = false;

    //!Print informative messages during execution
    @CommandOption('v')
    config Bool verboseFlag = false;

    //!Bundle repository arg
    @CommandOption('b')
    config String bundleRepositoryArg = null;

    //!Force incompatible packages
    @CommandOption('F')
    config Bool forceFlag = false;

    //!Copy package(s)
    @CommandOption('c')
    config Bool copyFlag = false;

    //!file arg to save/restore repository
    @CommandOption('f')
    config String fileArg = null;

    //!Save a repository's information to file
    @CommandOption('rsave')
    config Bool rsaveFlag = false;

    //!Restore one or more repositories from information in file
    @CommandOption('rrestore')
    config Bool rrestoreFlag = false;

    //!Create one or more repositories from information in file
    @CommandOption('rcreate')
    config Bool rcreateFlag = false;

    //! providerId for a repository
    @CommandOption('providerId')
    config string provIdArg = null;

}



/*
 *  @(#) xdc.tools.repoman; 1, 0, 0,0; 1-9-2017 12:51:52; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

