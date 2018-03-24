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
 *  ======== _gen.xs ========
 *  Makefile generation code
 *
 *  Exported methods
 *      getDir      - add a file's directory to the specified hash
 *      mkMake      - generate the makefile
 *      mkPkgBuild  - generate build data incorporated into package schema
 *      mkProj      - generate debug project files
 *      mkXML       - dump build model for examination by other tools
 *
 *  Private methods
 *      _genCfg
 *      _getArchiveOpts
 *      _getCompileOpts
 *      _getLinkOpts
 *      _inPkg
 *      _inThisPackage
 *      _mkBanner
 *      _mkDefs
 *      _mkDirs
 *      _mkDll
 *      _mkLib
 *      _mkManifest
 *      _mkObjs
 *      _mkProg
 *      _mkRelease
 *      _mkRepository
 *      _mkRule
 *      _mkScript
 *      _mkScriptTests
 *      _mkSchema
 *      _mkTests
 */
var debug = function () {};

var _Clock = xdc.module("xdc.services.global.Clock");
//_Clock.enable = true;

/*
 *  ======== getDir ========
 *  For the file specified, add its directory prefix to the dirs hash
 */
function getDir(file, dirs)
{
    if (file.lastIndexOf('/') != -1 || file.lastIndexOf('\\') != -1) {
        var dir = file.replace(/[\/\\][^\/\\]*$/, "");
        if (dir != "") {
            dirs[dir] = dir;
        }
    }
}

/*
 *  ======== mkMake ========
 *  For the PackageContents object pkg, gen makefile to the output stream out
 *
 *  Portable makefiles (the ability to generate the makefile once and use it
 *  even though the location of compilers changes and external prerequisites
 *  changes) requires that:
 *      we avoid the generation of absolute paths in rules,
 *      all absolute paths in dependencies have an "empty rule"
 *
 *  Since dependencies are recomputed as part of the compilation step, these
 *  absolute paths are "self correcting".  The only exception is for
 *  dependencies that would trigger a regeneration of the makefile, but for
 *  portable makefiles we are assuming that no change requires rebuild of the
 *  the makefile.  So, we simply need a way to forcibly not rebuild the
 *  makefile.
 *
 *  Eliminating absolute paths in rules requires changes to the targets to
 *  use user-defined symbols in-lieu of paths; e.g., target.rootDir.
 *
 *  To support portability between W32 and *nix, we need to generate symbols
 *  for Windows drive letters (to allow them to be mapped to *nix directories.
 */
function mkMake(pkg, out)
{
    var i;
    
    /* generate "this is a generated file" banner */
    _mkBanner(out);

    debug("generating package's makefile ...");
    if (pkg.makePrologue != null) {
        out.write(pkg.makePrologue + "\n");
    }
    
    /* Disable the export of the MAKE built-in variable MAKEFILE_LIST.  This
     * variable contains the list of all makefiles read by MAKE.  Since we
     * generate dependencies in separate files (to support parallel builds)
     * this list can get quite long.  So what?  It often causes make to be
     * unable to exec a process because the environment exceeds OS limits;
     * Windows has a limit of 32K, Solaris 1Mb, and Linux 130K.
     */
    out.write("unexport MAKEFILE_LIST\n");
    
    /*
     * MK_NOGENDEPS can be used to disable the inclusion of generated 
     * dependency files.  This can speed builds that are run immediately
     * after a clean _IF_ two separate builds occur _concurrently_ in the
     * same directory; this questionable use case is described in
     * 'Bug 310255 - unable to disable dependency generation'.
     */
    out.write("MK_NOGENDEPS := $(filter clean,$(MAKECMDGOALS))\n");
    
    out.write("override PKGDIR = " + pkg.name.replace(/\./g, '/') + "\n");

    /*  we remove this definition to allow xdcdir to define the package's
     *  repository; xdc_rules.mak already defines PKGROOT using this
     *  external command and this command can find a package's repository
     *  in the face of symbolic links which may fail with simple '../'
     *  paths.
     */
    if (false) {
        out.write("override PKGROOT = ..");
        for (var i = pkg.name.split('.').length; i > 1; i--) {
            out.write("/..");
        }
        out.write("\n");
    }
    
    /* if package path is specified in build script, override XDCPATH */
    if (pkg.packagePath != null) {
        /* $(PKGPATHSUFFIX) names XDC system package repositories */
        out.write("PKGPATH := " + pkg.packagePath + ";$(PKGPATHSUFFIX)\n");
    }

    /*
     *  Define XDCINCS: directories that contain packages whose headers
     *  are included as "unqualified" headers; i.e., no package directory
     *  name is supplied (e.g., bios, dais, and csl headers)
     *
     *  TODO: we should probably check for the existence of the directories
     *  in the uses set; if they are not found we should issue a warning.
     */
    out.write("XDCINCS = -I. -I$(strip $(subst ;, -I,$(subst $(space),\\$(space),$(XPKGPATH))))\n");
    var plist = "";
    for (var i = 0; i < pkg.uses.length; i++) {
        plist = plist.concat(pkg.uses[i] + " ");
    }
    if (plist != "") {
        out.write("XDCPKGS = $(call pkgsearch," + plist + ")\n");
        out.write("XDCINCS += $(if $(XDCPKGS),");
        out.write("-I$(subst $(space), -I,$(XDCPKGS)))\n");
    }

    /* Define XDCCFGDIR: the directory that contains generated prog objects */
    out.write("XDCCFGDIR = " + pkg.cfgDir + "\n\n");

    /* Create dependencies on all included BOM scripts */
    out.write("#\n# The following dependencies ensure package.mak is rebuilt\n");
    out.write("# in the event that some included BOM script changes.\n#\n");
    out.write("ifneq (clean,$(MAKECMDGOALS))\n");
    
    var cwd = (new java.io.File(".")).getCanonicalPath() 
                + java.io.File.separator;
    for (var i in utils.loadedFiles) {
        var cname = "" + (new java.io.File(i)).getCanonicalPath();
        var fname;
        if (_inPkg(cwd, cname)) {
            /* Use relative path to prevent make from complaining about not
             * knowing how to build this file in the case that we move this
             * package to a different repository.
             */
            fname = _escapeFilename(cname.substring(cwd.length));
        }
        else {
            /* generate empty rule for files outside this package so that
             * make won't complain about not knowing how to build the file
             * in the case that we move the file's package to a different
             * repository
             */
            /* convert DOS '\' characters to UNIX-style '/' in file name */
            fname = _escapeFilename(i);

            /* TODO: replace absolute path with symbol in fname */
            out.write(fname + ":\n");   
        }

        out.write("package.mak: " + fname + "\n");
    }

    out.write("endif\n\n");
    
    _Clock.print("    bld: package.mak gen: dependencies done.");

    /* Define Target specific rules and dependencies for *only*
     * those targets actually used in the package.bld script
     */
    var targs = pkg.$private.targets;
    var pb = {};
    for (var i in targs) {
        var targ = targs[i];
        out.write(targ.$name + ".rootDir ?= " + targ.rootDir + "\n");

        var pn = targ.$package.$name;
        if (pb[pn] == null) {
            out.write(pn + ".packageBase ?= "
                + targ.$package.packageBase + "\n");
            pb[pn] = 1;
        }
    }
    for (var i in targs) {
        out.write(".PRECIOUS: $(XDCCFGDIR)/%.o" + i + "\n");
        out.write(".PHONY: all," + i + " .dlls," + i
            + " .executables," + i + " test," + i + "\n");
        out.write("all," + i + ": .executables," + i + "\n");
        out.write(".executables," + i + ": .libraries," + i + "\n");
        out.write(".executables," + i + ": .dlls," + i + "\n");
        out.write(".dlls," + i + ": .libraries," + i + "\n");
        out.write(".libraries," + i + ": .interfaces\n");
        out.write("\t@$(RM) $@\n");
        out.write("\t@$(TOUCH) \"$@\"\n\n");

        out.write(".help::\n");
        out.write("\t@$(ECHO) xdc test," + i + "\n");
        out.write("\t@$(ECHO) xdc .executables," + i + "\n");
        out.write("\t@$(ECHO) xdc .libraries," + i + "\n");
        out.write("\t@$(ECHO) xdc .dlls," + i + "\n\n");
    }

    /*  Define target specific rules this package doesn't support/require.
     *  We do this to allow recursive makes to visit directories that have
     *  nothing to contibute; this simplifies "big" or top-level makes.
     */
    var targets = pkg.$package.BuildEnvironment.targets;
    for (var i = 0; i < targets.length; i++) {
        var found = false;
        for (var j in targs) {
            if (targets[i].suffix == j) {
                found = true;
                for (var k = 0; k < targets.length; k++) {
                    if (k != i && targets[k].suffix == j) {
                        throw new Error("Target '"
                            + targets[k].name + "'s suffix is not unique");
                    }
                }
                /* get version for each target and save it in target */
                var res = targets[i].getVersion();
                targets[i].$unseal("version");
                if (res != null) {
                    targets[i].version = res;
                }
                else {
                    targets[i].version = targets[i].$name + '{';
                }
                targets[i].$seal("version");

                /* get rawVersion for each target and save it in target */
                var it3 = xdc.module("xdc.bld.ITarget3");
                var t3 = it3.Module(targets[i]);
                if (t3 != null) {
                    var rawVer = t3.getRawVersion();
                    t3.$unseal("rawVersion");
                    if (rawVer != null) {
                        t3.rawVersion = rawVer;
                    }
                    else {
                        t3.rawVersion = t3.$name;
                    }
                    t3.$seal("rawVersion"); 
                }
                
                _Clock.print("    bld: package.mak gen: version for "
                    + targets[i].name + "("
                    + targets[i].version + ") done.");
                break;
            }
        }
        if (found == false) {
            out.write("all," + targets[i].suffix
                    + " clean," + targets[i].suffix
                    + " .libraries," + targets[i].suffix
                    + " .dlls," + targets[i].suffix
                    + " .executables," + targets[i].suffix
                    + " test," + targets[i].suffix
                    + ":;\n");
        }
    }
    out.write("\n");
    
    /* define the universal (Target independent) goals and dependencies */
    out.write("all: .executables \n");
    out.write(".executables: .libraries .dlls\n");
    out.write(".libraries: .interfaces\n\n");
    
    _Clock.print("    bld: package.mak gen: generic target rules done.");

    /* generate package interface rules and dependencies */
    _mkSchema(pkg, out);
    
    /* generate all libraries */
    for (var i in pkg.$private.libraries) {
        _mkLib(pkg, pkg.$private.libraries[i], out);
    }
        
    _Clock.print("    bld: package.mak gen: library rules done.");

    /* generate all dlls */
    for (var i in pkg.$private.dlls) {
        _mkDll(pkg, pkg.$private.dlls[i], out);
    }

    _Clock.print("    bld: package.mak gen: dll rules done.");
    
    /* generate all assemblies */
    for (var i in pkg.$private.assemblies) {
//      _mkAsm(pkg, pkg.$private.assemblies[i], out);
    }
    /* generate all configurations */
    for (var i in pkg.$private.configurations) {
        _mkConfig(pkg, pkg.$private.configurations[i], out);
    }

    /* generate all executables (and tests) */
    for (var i = 0; i < pkg.$private.executables.length; i++) {
        var exe = pkg.$private.executables[i];
        _mkProg2(pkg, exe, out);
    }

    _Clock.print("    bld: package.mak gen: executable rules done.");

    /* generate all target filter macro definitions */
    for (var i in targs) {
        var targ = targs[i];
        for (var pname in targ.profiles) {
            var po = targ.profiles[pname];
            for (var j = 0; j < po.filters.length; j++) {
                var filter = po.filters[j].$private.filter;
                /* only gen definitions for profiles actually used */
                if (filter != null) {
                    var defs = filter.getDefs();
                    if (defs && defs.length > 0) {
                        out.write("\n# macro definitions from target filter"
                            + targ.$name + ":"
                            + po.filters[j].moduleName + "\n");
                        for (var k = 0; k < defs.length; k++) {
                            out.write(defs[k].name + " ?= " + defs[k].value +'\n');
                        }
                        out.write('\n');
                    }
                }
            }
        }
    }
    
    /* generate at least one test goal; so that "make test" does not fail */
    if (pkg.$private.executables.length <= 0) {
        out.write("test:;\n");
    }

    /* generate all scripts */
    for (var i in pkg.$private.scripts) {
        _mkScript(pkg, pkg.$private.scripts[i], out);
    }

    _Clock.print("    bld: package.mak gen: test rules done.");
    
    /* generate copy goals */
    _mkCopyGoals(pkg, out);

    /*  Define pattern rule to run config tool (we need a pattern rule
     *  instead of explicit rules for each goal so that parallel make will
     *  not try to build each of these files in parallel.
     *
     *  RTSC config generates three files from the config script foo.cfg:
     *      foo.c   - module and instance data
     *      foo.xdl - linker command file for the executable
     *      foo.h   - declarations of config data (e.g., global vars)
     */
    out.write("\n");
    out.write("$(XDCCFGDIR)%.c $(XDCCFGDIR)%.h $(XDCCFGDIR)%.xdl: $(XDCCFGDIR)%.cfg $(XDCROOT)/packages/xdc/cfg/Main.xs | .interfaces\n");
    out.write('\t@$(MSG) "configuring $(_PROG_NAME) from $< ..."\n');
    out.write('\t$(CONFIG) $(_PROG_XSOPTS) xdc.cfg $(_PROG_NAME) $(XDCCFGDIR)$*.cfg $(XDCCFGDIR)$*\n');
    
    /* generate repositories; i.e., repository of other packages */
    var relList = {};
    for (var rname in pkg.$private.repositories) {
        var repository = pkg.$private.repositories[rname];
        _mkRepository(pkg, repository, out, relList);
    }
    _Clock.print("    bld: package.mak gen: repository rules done.");

    /* generate documentation */
    _mkDocs(pkg, out);
    
    /* generate releases; i.e., archives of all exported files */
    for (var rname in pkg.$private.releases) {
        var release = pkg.$private.releases[rname];
        _mkRelease(pkg, release, out);
    }
    _Clock.print("    bld: package.mak gen: release rules done.");
    
    /* generate clean rule to remove .libraries and run default .clean rules */
    out.write("clean:: .clean\n\t-$(RM) .libraries $(wildcard .libraries,*)\n");
    out.write("clean:: \n\t-$(RM) .dlls $(wildcard .dlls,*)\n");

    /* add clean rules for user specified generated files */
    if ("generatedFiles" in pkg) {
        out.write("#\n# The following clean rule removes user specified\n");
        out.write("# generated files or directories.\n#\n");
        for (var i = 0; i < pkg.generatedFiles.length; i++) {
            var file = pkg.generatedFiles[i];
            if (file.charAt(file.length - 1) == "/") {
                out.write("\t-$(RMDIR) ");
            }
            else {
                out.write("\t-$(RM) ");
            }
            out.write(file + "\n");
        }
    }
    out.write("\n");

    /* generate all sub-directories required by previous goals */
    _mkDirs(pkg, out);
    
    _Clock.print("    bld: package.mak gen: clean rules done.");

    /* generate final custom steps specified and flush output to disk */
    if (pkg.makeEpilogue != null) {
        out.write(pkg.makeEpilogue + "\n");
    }
    out.flush();
}

/*
 *  ======== mkPkgBuild ========
 *  The file generated here is copied into the package's schema (unlike
 *  package.xs which is loaded at run time).  This file contains
 *  "package-level" information we want/need to pass from the BOM to the
 *  TCOM.
 */
function mkPkgBuild(pkg, filename)
{
    /* only add date in the Patch field of MSRP or later */
    var cfg = "if (pkg.$vers.length >= 3) {\n    pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n}\n\n";
    var tab = "    ";
    
    /* pass the list of all libraries to the config domain.  We use this
     * list to determine the default getLibs() function; if there are
     * no libraries, return null, otherwise return an appropriately mangled
     * library name (from isa and package name).
     */
    cfg = cfg.concat("pkg.build.libraries = [\n");
    for (var i in pkg.$private.libraries) {
        cfg = cfg.concat(tab + "'" + i + "',\n");
    }
    cfg = cfg.concat("];\n\n");
    
    cfg = cfg.concat("pkg.build.libDesc = [\n");
    for (var i in pkg.$private.libraries) {
        cfg = cfg.concat(tab + "[\n");
        cfg = cfg.concat(tab + tab + "'" + i + "',\n");
        cfg = cfg.concat(tab + tab + "{\n");
        cfg = cfg.concat(tab + tab + tab + "target: '" +
              pkg.$private.libraries[i].target.$name + "',\n");
        cfg = cfg.concat(tab + tab + tab + "suffix: '" +
              pkg.$private.libraries[i].target.suffix + "'\n");
        cfg = cfg.concat(tab + tab + "}\n");
        cfg = cfg.concat(tab + "],\n");
    }
    cfg = cfg.concat("];\n");

//    print("build.cfg = " + cfg);
    
    /* if cfg file exists and is identical to cfg, don't overwrite it */
    utils.saveFile(cfg, filename);
}

/*
 *  ======== mkProj ========
 *  For each target used in the package, generate the debugger files for
 *  the package.
 *
 *  Params:
 *      pkg     - the package object after the package build script
 *                completes
 */
function mkProj(pkg, out)
{
    /* for every target used in this package */
    var targs = pkg.$private.targets;
    var flist = {};
    for (var i in targs) {
        var template;
        var fPattern;
        var targ = targs[i];

        if (targ.debugGen != null) {
            template = targ.debugGen.packageTemplate;
            fPattern = targ.debugGen.packagePattern;
        }
        /* if there is a package-level file template, generate the file */
        if (template != null && fPattern != null) {
            /* generate the output file name */
            var _bldUtils = xdc.useModule('xdc.bld.Utils');
            var fname = _bldUtils.expandString(fPattern, {
                trgSuffix: targ.suffix,
                trgName: targ.name,
                pkgName: pkg.name
            });

            /* if we haven't already generated this file */
            if (flist[fname] == null) {
                out.write("clean:: \n\t-$(RM) " + fname + "\n");
                pkg.$private.generatedFiles[fname] = 1;
                
                /* generate its contents */
                var t = xdc.loadTemplate(template);
                t.genFile(fname, pkg, [targ, pkg.$private.srcs]);
                flist[fname] = fname;
            }
        }
    }
}

/*
 *  ======== mkXML ========
 */
function mkXML(pkg, fileName)
{
    var file = new java.io.File(fileName);
    file["delete"]();
    var encoding = java.nio.charset.Charset.defaultCharset().name();
    var out = new java.io.BufferedWriter(new java.io.FileWriter(file));

    out.write('<?xml version="1.0" encoding="' + encoding+ '"?>\n');
//    out.write('<?xml-stylesheet type="text/xsl" href="build.xsl"?>\n');
    out.write('<!--  This file conforms to the DTD xdc/bld/build.dtd -->\n');
    out.write('<package name="' + pkg.name 
        + '" version="' + pkg.version 
        + '" producerId="' + escape(pkg.producerId) + '">\n');

    var indent = "    ";

    /* output interfaces and modules */
    out.write(indent + '<units>\n');
    for (var i = 0; i < pkg.interfaces.length; i++) {
        out.write(indent + '    <interface name="'
            + pkg.interfaces[i] + '"/>\n');
    }
    for (var i = 0; i < pkg.modules.length; i++) {
        out.write(indent + '    <module name="'
            + pkg.modules[i] + '"/>\n');
    }
    out.write(indent + '</units>\n');
    
    /* output all source files */
    out.write(indent + '<sources>\n');
    var srcs = pkg.$private.srcs;
    for (var i in srcs) {
        if (typeof srcs[i] != 'string') {
            continue;
        }
        out.write(indent + '    <srcFile name="' + srcs[i] + '"/>\n');
    }
    out.write(indent + '</sources>\n');

    /* output all configuration scripts */
    out.write(indent + '<configscripts>\n');
    srcs = pkg.$private.cfgs;
    for (var i in srcs) {
        out.write(indent + '    <srcFile name="' + srcs[i] + '"/>\n');
    }
    out.write(indent + '</configscripts>\n');
    
    /* output all makefile files */
    out.write(indent + '<makefiles>\n');
    srcs = pkg.$private.makefiles;
    for (var i = 0; i < srcs.length; i++) {
        out.write(indent + '    <srcFile name="' + srcs[i].name
            + '" src="' + srcs[i].src + '"/>\n');
    }
    out.write(indent + '</makefiles>\n');

    /* output all targets */
    out.write(indent + '<targets>\n');
    srcs = pkg.$private.targets;
    var it3 = xdc.module("xdc.bld.ITarget3");
    var sav = indent;
    indent = indent.concat('    ');
    for (var i in srcs) {
        var targ = srcs[i];
        var t3 = it3.Module(targ);
        var rawVer = (t3 != null) ? t3.rawVersion : "";
        out.write(indent + '<target name="' + targ.$name + '"\n    '
            + indent + 'version="' + targ.version + '"\n    '
            + indent + 'rawVersion="' + ("" + rawVer) + '"\n    '
            + indent + 'platform="' + targ.platform + '"\n    '
            + indent + 'isa="' + targ.isa + '"\n    '
            + indent + 'suffix="' + targ.suffix + '"\n    '
            + indent + 'rootDir="' + targ.rootDir + '"\n    '
            + indent + 'os="' + targ.os + '"\n    '
            + indent + 'rts="' + targ.rts + '">\n');

        out.write(indent + '    <model endian="' + targ.model.endian + '"\n    '
            + indent + '    codeModel="' + targ.model.codeModel + '"\n    '
            + indent + '    dataModel="' + targ.model.dataModel + '"/>\n');
            
        out.write(indent + '</target>\n');
    }
    indent = sav;
    out.write(indent + '</targets>\n');

    /* output all libraries */
    out.write(indent + '<libraries>\n');
    var libs = pkg.$private.libraries;
    for (var i in libs) {
        out.write(indent + '<library name="' + libs[i].name + '"\n    '
            + indent + 'pname="' + libs[i].$private.name + '"\n    '
            + indent + 'profile="' + libs[i].attrs.profile + '"\n    '
            + indent + 'target="' + libs[i].target.$name + '"/>\n');
    }
    out.write(indent + '</libraries>\n');

    /* output all configurations */
    out.write(indent + '<configurations>\n');
    var cfgs = pkg.$private.configurations;
    for (var i in cfgs) {
        out.write(indent + '<configuration name="' + cfgs[i].name + '"\n    '
            + indent + 'pname="' + cfgs[i].$private.name + '"\n    '
            + indent + 'target="' + cfgs[i].target.$name + '"\n    '
            + indent + 'platform="' + cfgs[i].platform + '"\n    '
            + indent + 'profile="' + cfgs[i].attrs.profile + '"\n    '
            + indent + 'isPartial="' + cfgs[i].attrs.prelink + '"\n    '
            + indent + 'xCfgScript="' + cfgs[i].$private.xCfgScript + '"\n    '
            + indent + 'xCfgPrefix="' + cfgs[i].$private.xCfgPrefix + '"\n    '
            + indent + 'cfgScript="' + cfgs[i].attrs.cfgScript + '"\n    ');
        if (cfgs[i].attrs.cfgArgs != null) {
            out.write(indent + 'cfgArgs="' + escape(cfgs[i].attrs.cfgArgs) + '"\n    ');
        }
        out.write(indent + '/>\n');
    }
    out.write(indent + '</configurations>\n');

    /* output all executables */
    out.write(indent + '<executables>\n');
    var exes = pkg.$private.executables;
    for (var i = 0; i < exes.length; i++) {
        out.write(indent + '<executable name="' + exes[i].name + '"\n    '
            + indent + 'pname="' + exes[i].$private.name + '"\n    '
            + indent + 'target="' + exes[i].target.$name + '"\n    '
            + indent + 'platform="' + exes[i].platform + '"\n    '
            + indent + 'profile="' + exes[i].attrs.profile + '"\n    '
            + indent + 'xCfgScript="' + exes[i].$private.xCfgScript + '"\n    '
            + indent + 'xCfgPrefix="' + exes[i].$private.xCfgPrefix + '"\n    '
            + indent + 'cfgScript="' + exes[i].attrs.cfgScript + '"\n    ');
        if (exes[i].attrs.cfgArgs != null) {
            out.write(indent + 'cfgArgs="' + escape(exes[i].attrs.cfgArgs) + '"\n    ');
        }
        out.write(indent + '/>\n');
    }
    out.write(indent + '</executables>\n');

    /* output all exe tests */
    out.write(indent + '<tests>\n');
    for (var i = 0; i < exes.length; i++) {
        var tests = exes[i].$private.tests;
        for (var j = 0; j < tests.length; j++) {
            var tattrs = tests[j].attrs;
            
            out.write(indent + '<test exeName="' + exes[i].$private.name + '"\n    '
                + indent + 'args="' + escape(tattrs.args) + '"\n    '
                + indent + 'groupName="' + tattrs.groupName + '"\n    '
                + indent + 'refOutput="' + escape(tattrs.refOutput) + '"\n    '
                + indent + 'refExitCode="' + tattrs.refExitCode + '"\n    '
                + indent + 'execArgs="' + escape(tattrs.execArgs) + '"\n    ');
            if (tattrs.execCmd != null) {
                out.write(indent + 'execCmd="' + escape(tattrs.execCmd) + '"\n    ');
            }
            out.write(indent + '/>\n');
        }
    }

    /* output all script tests */
    for each (var script in pkg.$private.scripts) {
        var tests = script.$private.tests;
        for (var j = 0; j < tests.length; j++) {
            var tattrs = tests[j].attrs;
            
            var execCmd;
            var execArgs = tattrs.execArgs;
            if (tattrs.execCmd != null) {
                execCmd = tattrs.execCmd;
            }
            else if (script.name.match(/\.ksh$|\.sh$/) != null) {
                execCmd = "$(SHELL) ";
            }
            else {
                execCmd = "$(XSRUN) ";
                execArgs += (script.attrs.hasMain ? " -c" : " -f");
            }

            out.write(indent + '<test exeName="' + script.name +'"\n    ');
            out.write(indent + 'args="' + escape(tattrs.args) + '"\n    ');
            out.write(indent + 'groupName="' + tattrs.groupName + '"\n    ');
            out.write(indent + 'refOutput="' + escape(tattrs.refOutput) + '"\n    ');
            out.write(indent + 'refExitCode="' + tattrs.refExitCode + '"\n    ');
            out.write(indent + 'execArgs="' + escape(execArgs) + '"\n    ');
            out.write(indent + 'execCmd="' + escape(execCmd) + '"\n    ');
            
            out.write(indent + '/>\n');
        }
    }
    out.write(indent + '</tests>\n');

    /* output all releases */
    out.write(indent + '<releases relDir="' + pkg.relDir + '">\n');
    for (var rname in pkg.$private.releases) {
        var release = pkg.$private.releases[rname];
        out.write(indent + '<release name="' + rname + '"\n    '
            + indent + 'pname="'
            + release.attrs.prefix + release.$private.name + '"\n    '
            + indent + 'label="' + release.attrs.label + '"\n    ');
        if (release.attrs.relScript != null) {
            out.write(indent + 'relScript="' + release.attrs.relScript
                + '">\n');
        }
        else {
            out.write('>\n');
        }

        for (var i in release.$private.files) {
            out.write(indent + '    <file name="' + i + '"/>\n');
        }
        out.write(indent + '</release>\n');
    }
    out.write(indent + '</releases>\n');

    /* output all repositories */
    out.write(indent + '<repositories>\n');
    for (var rname in pkg.$private.repositories) {
        var repository = pkg.$private.repositories[rname];

        out.write(indent + '<repository name="' + rname + '"\n    '
            + indent + 'pname="'
            + repository.$private.name + '">\n');

        for (var pname in repository.$private.packages) {
            var tmp = repository.$private.packages[pname];
            var relFile = xdc.getPackageBase(pname) + tmp.rname;
            out.write(indent + '    <importedRelease\n');
            out.write(indent + '        package="' + pname + '"\n');
            out.write(indent + '        pname="' + tmp.rname + '"\n');
            out.write(indent + '        label="' + tmp.rdesc.label + '">\n');
            out.write(indent + '    </importedRelease>\n');
        }
        out.write(indent + '</repository>\n');
    }
    out.write(indent + '</repositories>\n');

    out.write('</package>\n');
    out.close();
}

/*
 *  ======== _genCfg ========
 *  Generate an argument free configuration script for a program; the script
 *  contains arguments specified by the build script (including the specified
 *  platform).
 *
 *  By encapsulating all arguments into a single script that is run without
 *  any arguments, and by only modifying the file when its contents change,
 *  we can know when re-configuration must occur: re-run configuration
 *  iff the date of the script (or anything it includes) is later than the
 *  corresponding *.c.
 */
function _genCfg(acfg, cfgDir, config, pkg, noasm)
{
    /* get profile-specific generation files */
    var gentab = [];
    var profileOpts = _getProfile(acfg.target, acfg.attrs);
    if (profileOpts != null) {
        for (var i = 0; i < profileOpts.filters.length; i++) {
            var filter = profileOpts.filters[i].$private.filter;
            if (filter != null) {
                var tmp = filter.getGenTab(acfg, cfgDir, config);
                gentab = gentab.concat(tmp);
            }
        }
    }

    /* generate the "base name" of the generated configuration files */
    var base = (cfgDir + config).replace(/\/\/+/g, '/');

    /* if cfg file exists and is identical to cfg, don't overwrite it */
    var cfgFile = base + ".cfg";
    var tplt = xdc.loadTemplate("xdc/bld/cfg.xdt");
    tplt.genFile(cfgFile, acfg, [base, noasm, pkg, gentab]);

//    print("gencfg: cfgFile = " + cfgFile
//      + ", config name = " + acfg.$private.name);

    return (cfgFile);
}

/*
 *  ======== _getProfile ========
 */
function _getProfile(targ, attrs)
{
    var profile = attrs.profile == null ? "release" : attrs.profile;
    var profileOpts = targ.profiles[profile];
    if (profileOpts != null) {
        for (var j = 0; j < profileOpts.filters.length; j++) {
            var desc = profileOpts.filters[j];
            if (desc.$private.filter == null) {
                var Mod = xdc.useModule(desc.moduleName);
                if (!(Mod instanceof xdc.om['xdc.bld.ITargetFilter'].Module)) {
                    throw new Error("Target '"
                        + targ.$name + "'s '" + profile
                        + "' profile filter[" + j
                        + "] module (" + desc.moduleName
                        + ") is not an xdc.bld.ITargetFilter");
                }
                desc.$private.filter = Mod.create(desc.params);
            }
        }
    }

    return (profileOpts);
}

/*
 *  ======== _getArchiveOpts ========
 *  Parameters:
 *      targ  ITarget.Module
 *      attrs Library.Attrs
 *
 *  Return:
 *      string archiver options
 */
function _getArchiveOpts(targ, attrs)
{
    var result;
    var profileOpts = _getProfile(targ, attrs);

    if (profileOpts != null && profileOpts.archiveOpts != null) {
        result = profileOpts.archiveOpts + " "
            + (attrs.aropts == null ? "" : attrs.aropts);
    }
    else {
        result = attrs.aropts;
    }
    
    return (result);
}

/*
 *  ======== _getCompileOpts ========
 *  Parameters:
 *      targ  ITarget.Module
 *      attrs Object.Attrs
 *
 *  Return:
 *      xdc.bld.ITarget.CompileOptions
 */
function _getCompileOpts(targ, attrs)
{
    var result;
    var profileOpts = _getProfile(targ, attrs);
    
    if (profileOpts != null && profileOpts.compileOpts != null) {
        result = new xdc.om['xdc.bld.ITarget'].
            CompileOptions(profileOpts.compileOpts);
        /* cfgcopts also need to have 'profileOpts.compileOpts.copts', in
         * case we are compiling the generated C config file, and the user
         * requested to use 'cfgcopts'.
         */
        var copts = "";
        if (profileOpts.compileOpts.copts != undefined) {
            copts = profileOpts.compileOpts.copts;
        }
        
        if (result.cfgcopts != undefined) {
            result.cfgcopts += copts;
        }
        else {
            result.cfgcopts = copts;
        }
    }
    else {
        result = new xdc.om['xdc.bld.ITarget'].CompileOptions;
    }

    /* add in goal-specific options (if they exist) */
    for (var i in result) {
        if (i in attrs) {
            if (attrs[i] != null || result[i] != null) {
                if (result[i] == null) {
                    result[i] = attrs[i];
                }
                else if (attrs[i] != null) {
                    result[i] = result[i].concat(" " + attrs[i]);
                }
            }
        }
    }

    return (result);
}

/*
 *  ======== _getLinkOpts ========
 *  Parameters:
 *      targ  ITarget.Module
 *      attrs Executable.Attrs
 *
 *  Return:
 *      string linker options
 */
function _getLinkOpts(targ, attrs)
{
    var result;
    var profileOpts = _getProfile(targ, attrs);

    if (profileOpts != null && profileOpts.linkOpts != null) {
        result = profileOpts.linkOpts + " "
            + (attrs.lopts == null ? "" : attrs.lopts);
    }
    else {
        result = attrs.lopts;
    }

    return (result);
}

/*
 *  ======== _inPkg ========
 *  Determine if the file, cfname, is in the package specified by
 *  pdir.
 *
 *  Returns true iff cfname is a file name that appears in the package
 *  base directory pdir (i.e., pdir contains "package.xdc") and *not* in
 *  any nested package of pdir.
 *
 *  Note: The file cfname does not need to exist; i.e., this function may
 *  return true even if the file does not exist.
 *
 *  Parameters:
 *      pdir    is the canonical path name of the package's base directory
 *              followed by java.io.File.separator
 *      cfname  is the canonical path name of a file to check
 */
function _inPkg(pdir, cfname)
{
    /* if the canonical path of the package base isn't a prefix of
     *  the canonical file name, the file can't be in the package
     */
    if (cfname.indexOf(pdir) != 0) {
        return (false);
    }

    /* if there is no directory separator in the file name beyond pdir/,
     *  then the file is in the package (and not in a nested package).
     *  This is a "quick" check to avoid the more expensive check below.
     */
    if ((cfname.substr(pdir.length)).indexOf(java.io.File.separator) == -1) {
        return (true);
    }

    /* use Scan.findPackageSpec() to check if file is in a nested package */
    var pf = Packages.xdc.services.intern.cmd.Scan.findPackageSpec(cfname);
    if (pf != null) {
        pf = (new java.io.File(pf)).getCanonicalPath();
        if (pf == (pdir + "package.xdc")) {
            return (true);
        }
    }

    return (false);
}

/*
 *  ======== _lsPkg ========
 */
function _lsPkg(root, exclude)
{
    var dirArray = [];
    
    var prefix = root == "." ? "" : (root + java.io.File.separator);
    
    /*
     *  ======== myFilter ========
     *  Return true if a file is potentially a source file in the package
     *  containing dir
     */
    function myFilter(dir, file)
    {
        file = String(file);
        
        if (file == "package" || file[0] == '.') {
            return (false);
        }

        var name = prefix + file;

        if (exclude[name] != null
            || exclude[name.replace(/\\/g, "/")] != null) {
            return (false);
        }
        
        file = new java.io.File(name);
        if (file.isDirectory()) {
            var tmp = new java.io.File(name
                + java.io.File.separator + "package.xdc");
            if (!tmp.exists()) {    /* if name is not a nested package */
                dirArray[dirArray.length] = name;
            }
            return (false);
        }
        return (true);
    }

    /* create an object that implements java.io.FilenameFilter */
    var filter = java.io.FilenameFilter({accept : myFilter});

    /* create a java.io.File object */
    var file = new java.io.File(root);

    /* get matching files in root and construct path names for this list */
    var result = [];
    var list = file.list(filter);
    if (list != null) {
        result = new Array(list.length);
        for (var i = 0; i < list.length; i++) {
            result[i] = prefix + list[i];
        }
    }

    /* recurse into any non-nested-package sub-directories found in root */
    for (var i = 0; i < dirArray.length; i++) {
        result = result.concat(_lsPkg(dirArray[i], exclude));
    }
    
    return (result);
}

/*
 *  ======== _mkBanner ========
 */
function _mkBanner(out)
{
    out.write("#\n#  Do not edit this file.  This file is generated from \n");
    out.write("#  package.bld.  Any modifications to this file will be \n");
    out.write("#  overwritten whenever makefiles are re-generated.\n#\n");
}

/*
 *  ======== _mkCopyGoals ========
 */
function _mkCopyGoals(pkg, out)
{
    /* generate a pattern rule for all "copy" goals */
    out.write("%,copy:\n\t@$(if $<,,$(MSG) don\\'t know how to build $*; exit 1)");
    out.write("\n\t@$(MSG) cp $< $@\n\t$(RM) $@\n\t$(CP) $< $@\n");
    
    /* create a new set of "top-level" goals for the goals in ogoals */
    var ogoals = pkg.$private.copyGoals;
    var ngoals = {};
    for (var g in ogoals) {
        var basename = g.substring(g.lastIndexOf('/') + 1);
        var list = ngoals[basename];
        if (list == null) {
            ngoals[basename] = [g];
        }
        else {
            /* more than one ogoal has the same basename */
            ngoals[basename].push(g);   
        }
    }

    for (var g in ngoals) {
        var oga = ngoals[g];
        if (oga.length == 1) {
            out.write(g + ",copy : " + oga[0] + "\n");
        }
        else {
            out.write(".PHONY: " + g + ",copy\n");
            out.write(g + ",copy : ");
            for (var i = 0; i < oga.length; i++) {
                out.write(g + "," + i + ",copy ");
            }
            out.write("\n\t@\n\n");

            oga.sort();
            for (var i = 0; i < oga.length; i++) {
                out.write(g + "," + i + ",copy : " + oga[i] + "\n");
            }
        }
    }
}

/*
 *  ======== _mkDirs ========
 *  Generate rules to automatically create all directories necessary
 *  for the build *and* the rules to remove the directories during a
 *  clean.
 */
function _mkDirs(pkg, out)
{
    /*  Create an array of all directories (including sub-directories) that
     *  need to be created.
     */
    var dirSet = {};
    var dirArr = [];
    for (var dir in pkg.$private.dirs) {
        var da = dir.split(/[\\\/]+/);
        var tmp = "";
        for (var i = 0; i < da.length; i++) {
            if (da[i].length > 0 && da[i] != ".") {
                tmp = tmp.concat(da[i] + "/");
                if (dirSet[tmp] != 1) {
                    dirSet[tmp] = 1;
                    dirArr[dirArr.length] = tmp.substring(0, tmp.length - 1);
                }
            }
        }
    }

    /*  Generate rules to create the directories determined above.
     *
     *  Note that the directories are not created when the make command is
     *  "clean".  This is not just an optimization:  GNU make seems to keep
     *  directories open when they appear in a "wildcard" expression.
     *  Since Win32 does not allow deletion of a file/directory while it
     *  is open, it is impossible to remove the directories with a clean
     *  command unless we don't reference the directories during a clean.
     */
    out.write("ifneq (clean,$(MAKECMDGOALS))\n");

    for (var i = 0; i < dirArr.length; i++) {
        var dir = dirArr[i];
        /* skip over directories like "../" */
        if (dir.match(/^[\.\\\/]*$/) == null) {
            out.write("ifeq (,$(wildcard " + dir + "))\n");
            out.write("    $(shell $(MKDIR) " + dir + ")\n");
            out.write("endif\n");
        }
    }
    out.write("endif\n");

    /* Generate rules to remove the "generated" directories */
    out.write("clean::\n");
    if (0) {    /* don't remove all dirs; some may contain "precious" files */
        for (var i = 0; i < dirArr.length; i++) {
            /* skip over directories like "../" */
            if (dir.match(/^[\.\\\/]*$/) == null) {
                out.write("\t-$(RMDIR) " + dirArr[i] + "\n");
            }
        }
    }
    else {
        /* remove package because this only contains generated files */
        out.write("\t-$(RMDIR) package\n");
        pkg.$private.generatedFiles["package"] = 1;
    }
    out.write("\n");
}


/*
 *  ======== _mkDefs ========
 */
function _mkDefs(target, file)
{
    var PRE = "xdc_bld__";

    /* required definitions */
    var defs = "-Dxdc_target_name__=" + target.name;
    defs += " -Dxdc_target_types__=" + target.stdInclude;
    
    /* definitions from the build engine */
    defs += " -D" + PRE + "profile_" + file.profile;
    var vers = target.getVersion();
    defs += " -D" + PRE + "vers_"
        + vers.slice(vers.search("{") + 1).replace(/[.,]/g, "_");

    if (file.opts.defs == null) {
        file.opts.defs = defs;
    }
    else {
        file.opts.defs += (' ' + defs);
    }
}

/*
 *  ======== _mkDll ========
 *  Like libraries, dll objects are placed in a sub-directory whose name
 *  matches the name of the dll.  DLLs often have a "stub" library associated
 *  with them that allows client executables to link as though it were a static
 *  library.  Since this stub library must have a different name from a static
 *  library containing the same objects, DLL directories must have names
 *  different from the corresponding static library directory.
 */
function _mkDll(pkg, dll, out)
{
}

/*
 *  ======== _mkDocs ========
 */
function _mkDocs(pkg, out)
{
    var docDir = pkg.docDir;
    if (docDir != null) {
        out.write("all: .docs\n");
        out.write(".docs: " + docDir + "/index.html\n");

        out.write(docDir + "/index.html: .interfaces\n");
        out.write("\t@$(MSG) generating docs in " + docDir + " ...\n");
        out.write("\t$(XSRUN) xdc.tools.cdoc -s -od:" + docDir + "\n\n");

        out.write("clean::\n");
        out.write("\t$(RMDIR) " + docDir + "\n\n");
        pkg.$private.generatedFiles[docDir] = 1;
        
        /* We need to create 'docDir' early, with other directories,
         * because the rule looking for 'docDir' may get processed before
         * cdoc had a chance to create 'docDir'.
         */
        getDir(docDir + "/index.html", pkg.$private.dirs);
    }
}

/*
 *  ======== _mkExcludeList ========
 */
function _mkExcludeList(pkg, release, mname)
{
    var ename = mname.replace(/\.inc$/, ".ninc");
    var cout = "";

    for (var i in release.$private.excludeDirs) {
        cout = cout.concat(i + "\n");
    }

    utils.saveFile(cout, ename);
}

/*
 *  ======== _mkLib ========
 *  All library objects are placed in a sub-directory whose name matches
 *  the name of the library.
 *
 *  Libraries are simply an "archive" of a collection of object files.
 *  Thus, libraries must be re-built iff
 *      1. one of its objects needs to be re-built, or
 *      2. the list of objects in the archive changes.
 *
 *  We achive 1. by assuming that the object file dependencies are
 *  properly generated and adding a single dependency line containing all
 *  objects in the archive list.
 *
 *  We achive 2 by placing a dependency on a <goal>.mak; the makefile
 *  generated that has all the rules for making the objects that go into the
 *  library.  While this can cause unnecessary rebuilding of libraries, it
 *  ensures that if the list of objects to be placed in a library changes, it
 *  will be re-built.
 */
function _mkLib(pkg, lib, out)
{
    debug("_mkLib " + lib.$private.name + " ...");
    
    var i;
    var prefix = pkg.libDir + lib.name + '/';
    var goal = lib.$private.name;
    var cmdSet = lib.target.suffix;
    
    /* create a list of all objects that need to be built for this library */
    var objs = {};

    /* generate package.bld.c, if necessary */
    var libAttrs = lib.attrs;
    if (pkg.libTemplate != null) {
        /* only generate package.bld.c once for all libraries */
        if (pkg.$private.libTemplate == null) {
            var tpath = xdc.findFile(pkg.libTemplate);
            if (tpath != null) {
                /* template changes should trigger re-gen of package.bld.c */
                out.write("ifneq (clean,$(MAKECMDGOALS))\n");
                out.write("package.mak:" + tpath + "\n");
                /* gen empty rule to prevent make from failing when this file
                 * does not exist; make should simply regen package.mak with
                 * a possibly different tpath (that hopefully exists).
                 */
                out.write(tpath + ":\n\n"); 
                out.write("endif\n");
            }
            pkg.$private.libTemplate = xdc.loadTemplate(pkg.libTemplate);
            pkg.$private.libTemplate.genFile("package/package.bld.c",
                pkg, [tpath]);
        }

        /* tell package/package.c to include package.bld.c */
        libAttrs = new xdc.om['xdc.bld.Library'].Attrs(lib.attrs);
        var defs = libAttrs.defs == null ? "" : libAttrs.defs;
        /* package.c includes __xdc_bld_pkg_c__ (if it's defined) */
        libAttrs.defs = defs
            + " -D__xdc_bld_pkg_c__=package.bld.c";
    }
    /*  add generated package.c (which #includes the generated package.bld.c)
     *  to every library.  This allows user's to embed version/meta data into
     *  the every library.
     */
    objs["package/package_" + pkg.name] = {
        noExtension: true,
        srcPrefix: "",
        srcSuffix: ".c",
        dstPrefix: prefix,
        attrs: libAttrs
    };

    /* add objects to the library */
    for (var i in lib.$private.objects) {
        objs[i] = {
            dstPrefix: prefix,  /* BUG?? */
            attrs: lib.$private.objects[i].attrs
        };
    }

    /* add library to ".library" goals so we can make just the libraries */
    out.write(".libraries," + cmdSet + " .libraries: " + goal + "\n\n");
    
    /* add library to the specified releases and compute srcRels */
    var ra = lib.attrs.releases;
    var srcRels = [];
    for (var i = 0; i < ra.length; i++) {
        var rel = ra[i];
        rel.$private.files[goal] = goal;
        if ((lib.attrs.exportSrc == null && rel.attrs.exportSrc == true)
            || lib.attrs.exportSrc == true) {
            srcRels.push(rel);
        }
    }

    /* object file rules are in a separate file to track compiler changes */
    var makeFileName = goal + ".mak";
    out.write("-include " + makeFileName + "\n");
    
    /* generate rules for making the objects collected above */
    var objList = _mkObjs(objs, lib.target, makeFileName, goal, pkg, srcRels);

    /* output a list of object file names to be archived in the library */
    var da = lib.name.split(/[\/\\]/);
    var base = da.pop();
        
    var archArgs = new xdc.om['xdc.bld.ITarget'].ArchiveGoal({
        base:       base,
        dstPrefix:  da.join('/') + '/',
        dstSuffix:  lib.attrs.suffix,
        files:      objList,
        opts:       _getArchiveOpts(lib.target, lib.attrs),
        profile:    lib.attrs.profile ? lib.attrs.profile : "release",
    });
    var res = lib.target.archive(archArgs);
    if (res != null) {
        var profObj = lib.target.profiles[
            lib.attrs.profile ? lib.attrs.profile : "release"];
        if (profObj != null) {
            for (var i = 0; i < profObj.filters.length; i++) {
                var filter = profObj.filters[i].$private.filter;
                if (filter != null) {
                    filter.archive(goal, lib, objList, archArgs, res);
                }
            }
        }
        out.write(goal + ": \n");
        out.write(_mkRule(res, goal, lib.target));
    }

    /* generate rules to clean generated goal */
    out.write("clean," + cmdSet + " clean::\n\t-$(RM) " + goal + "\n");
}

/*
 *  ======== _mkManifest ========
 *  Create a file named mname that contains every file that is part of
 *  the release; one file per line.  Only update the file if the contents
 *  differ from what already exists; this way, we won't unnecessarily
 *  re-run the archive command to create identical releases.
 *
 *  Note: this manifest may contain other "*.inc" files that list
 *  additional files to include.  We don't expand these files here because
 *  they don't exist until after a program is configured; the *.inc files
 *  are recursively expanded in the MKREL command.
 */
function _mkManifest(pkg, release, mname)
{
    var nexp = 0;
    var cout = "";
    
    /* generate the exclude list */
    _mkExcludeList(pkg, release, mname);
    
    if (release.attrs.exportAll) {
        var manifest;
        if (pkg.$private.manifest == null) {
            var exclude = pkg.$private.generatedFiles;
            /* The files that should also be excluded are ones from
             * Pkg.generatedFiles that are NOT in Pkg.otherFiles.
             */
            for (var i = 0; i < Pkg.generatedFiles.length; i++) {
                var foundInOther = false;
                for (var j = 0; j < Pkg.otherFiles; j++) {
                    if (Pkg.generatedFiles[i] == Pkg.otherFiles[j]) {
                        foundInOther = true;
                        break;
                    }
                }
                if (!foundInOther) {
                    exclude[Pkg.generatedFiles[i]] = 1;
                }
            }
            
            manifest = _lsPkg(".", exclude);
            pkg.$private.manifest = manifest;
        }
        else {
            manifest = pkg.$private.manifest;
        }

        nexp = manifest.length;
        if (nexp > 0) {
            cout = manifest.join("\n") + "\n";
        }
    }

    if ((release.attrs.exportDoc || release.attrs.exportAll)
        && pkg.docDir != null
        && !(new java.io.File(pkg.docDir)).isAbsolute()) {
        release.$private.files[pkg.docDir] = pkg.docDir;
    }

    for (var i in release.$private.files) {
        nexp++;
        cout = cout.concat(i + "\n");
    }


    /* verbatim files are only used by release scripts to determine
     * directories to "skip" over in filtering; i.e., they should be taken
     * "verbatim".
     */
    if (release.attrs.relScript) {
        _mkVerbatim(pkg, release, mname + ".verbatim");
    }

    if (nexp > 0) {
        utils.saveFile(cout, mname);
    }

    return (nexp);
}

/*
 *  ======== _mkVerbatim ========
 *  Rather than look at release.$private.files we explicitly add
 *  known directories since the list of files will contain lots of
 *  non-existant files and directories.
 */
function _mkVerbatim(pkg, release, fileName)
{
    var list = [];
    for each (var r in pkg.$private.repositories) {
        list.push(r.name);
    }
    if (pkg.docDir != null) {
        list.push(pkg.docDir);
    }

    var olist = [];
    for (var i = 0; i < pkg.otherFiles.length; i++) {
        olist.push(pkg.otherFiles[i]);
    }
    for (var i = 0; i < release.otherFiles.length; i++) {
        olist.push(release.otherFiles[i]);
    }
    for each (var i in olist) {
        var lastChar = i[i.length - 1];
        if (lastChar == '/' || lastChar == '\\'
            || java.io.File(i).isDirectory()) {
            list.push(i);
        }
    }

    if (list.length > 0) {
//        print("verbatim files: " + list);
        
        var file = new java.io.File(fileName);
        file["delete"]();
        var out = new java.io.BufferedWriter(new java.io.FileWriter(file));
        for each (var i in list) {
            out.write(i + '\n');
        }
        out.close();
    }
}

/*
 *  ======== _mkObjs ========
 *  For each object in objs we generate the rule to make the object.
 *
 *  The objs object is a hashtable indexed by the "basename" name of the
 *  object to create (no extension).  Each entry has the following
 *  properties:
 *      dstPrefix   - required directory for the output object file
 *      attrs       - required non-null object with optional properties:
 *                      defs
 *                      copts
 *      srcSuffix   - (optional string) if defined and matches known
 *                    source file, the source file does not need to exist
 *                    (it is assumed to be generated from another source).
 *                    If this property is not defined, the source file must
 *                    exist and must have a known suffix (see rules below).
 *      srcPrefix   - (optional string) if defined and source file does
 *                    not exist, this string is the directory containing
 *                    the source file.
 *
 *  Objects must be re-built if build options change.  We ensure this by
 *  placing a dependency on makeFileName.  This will result in some
 *  unnecessary rebuilding but will never omit a necessary rebuild.
 *
 *  The generated .xdc.h file(s) used by a source file must exist before
 *  compiling objects in the package.  This is ensured by making ".interfaces"
 *  a "order-only" prerequisite of all objects.
 */
function _mkObjs(objs, target, makeFileName, objListGoal, pkg, srcRels)
{
    debug("_mkObjs(..., " + makeFileName + ", " + objListGoal + ", ...)");
    
    var srcs = pkg.$private.srcs;
    var deps = pkg.$private.makefiles;
    var copies = pkg.$private.copyGoals;
    var asmList = [];
    var objList = [];
    var srcList = [];
    var objString = "";
    
    function findFile(extensions, goal) {
        /* if we're given the name of the source, assume it exists (or will) */
        if (goal.srcSuffix != null && goal.srcPrefix != null) {
            return (goal);
        }

        if (goal.srcSuffix == null) {
            goal.srcSuffix = "";
        }
        if (goal.srcPrefix == null) {
            goal.srcPrefix = "";
        }

        /* if a file extension is supplied, parse the name cannonically */
        var srcFile = goal.srcPrefix + goal.base + goal.srcSuffix;
        var dotIndex = srcFile.lastIndexOf(".");
        if (dotIndex > 0 && srcFile.substring(dotIndex).indexOf("/") == -1) {
            /* source file with a specific extension has been specified */

            goal.srcSuffix = srcFile.substring(dotIndex);

            /* BUG??? Check for file existance ??? */

            var dstFile = goal.dstPrefix + goal.base;
            var slashIndex = dstFile.lastIndexOf("/") + 1;
            goal.dstPrefix = dstFile.substring(0, slashIndex);
            
            slashIndex = srcFile.lastIndexOf("/") + 1;
            goal.srcPrefix = srcFile.substring(0, slashIndex);
            goal.base = goal.base.substring(slashIndex, dotIndex);

            return (goal);
        }

        /* otherwise look for file using the target's extensions table */
        for (var i = 0; i < extensions.length; i++) {
            srcFile = goal.srcPrefix + goal.base + extensions[i].suf;
            var file = new java.io.File(srcFile);
            if (file.exists()) {
                goal.srcSuffix = extensions[i].suf;
                return (goal);
            }
        }

        /* otherwise, fail */
        return (null);
    }
    
    deps[deps.length++] = {name: makeFileName, src: "package.bld"};
    
    /* create a byte stream to contain this collection's objs rules */
    var byteStream = new java.io.ByteArrayOutputStream(1024);
    var out = new java.io.OutputStreamWriter(byteStream);

    /* generate a banner that changes whenever a different compiler is used;
     * this ensures that a change to the compiler forces a rebuild (even if
     * the path to the compiler is the same.)
     */
    _mkBanner(out);
    out.write("#  target compatibility key = " + target.version + "\n#\n");
    
    /* generate rules for each object */
    for (var name in objs) {
        var obj = objs[name];
        debug("    make obj " + name + " ...");

        /* skip over pre-built files */
        if ("preBuilt" in obj.attrs && obj.attrs.preBuilt == true) {
            objString = objString.concat(name + " ");
            continue;
        }
        
        var dstSuffix = ".o" + target.suffix;
        var goalFile = obj.dstPrefix + name + dstSuffix;
        if (obj.noExtension == null || obj.noExtension != true) {
            var dotIndex = name.lastIndexOf(".");
            if (dotIndex > 0 && name.substring(dotIndex).indexOf("/") == -1) {
                goalFile = obj.dstPrefix + name.substr(0, dotIndex) + dstSuffix;
            }
        }
        goalFile = goalFile.replace(/\/\/+/g, '/');

        var file = findFile(target.extensions, {
            base     : name,
            dstPrefix: obj.dstPrefix,
            dstSuffix: dstSuffix,
            srcPrefix: obj.srcPrefix,
            srcSuffix: obj.srcSuffix,
        });

        var res = null;
        var compGoal = null;
        var srcFile;
        if (file != null) {
            srcFile = file.srcPrefix + file.base + file.srcSuffix;
            srcFile = srcFile.replace(/\/\/+/g, '/');
            file.opts = _getCompileOpts(target, obj.attrs);
            file.profile = obj.attrs.profile ? obj.attrs.profile : "release";
            compGoal = new xdc.om['xdc.bld.ITarget'].CompileGoal(file);
            _mkDefs(target, compGoal);
            compGoal.configOpts = false;
            if (obj.configOpts != undefined) {
                compGoal.configOpts = obj.configOpts;
            }
            res = target.compile(compGoal);
        }

        if (res != null) {
            srcList[srcList.length] = srcFile;
            objList[objList.length] = goalFile;
            var dep = goalFile + ".dep";
            deps[deps.length++] = {name: dep, src: srcFile};

            //out.write("ifneq (clean,$(MAKECMDGOALS))\n");
            out.write("ifeq (,$(MK_NOGENDEPS))\n");
            out.write("-include " + dep + "\n");
            out.write(dep + ": ;\n");
            out.write("endif\n\n");
            out.write(goalFile + ": | .interfaces\n");
            out.write(goalFile + ": " + srcFile + " " + makeFileName + "\n");
            out.write("\t@$(RM) $@.dep\n");

            /*
             *  Fixup generated dependencies by replacing all '\'s with 
             *  '/' this is necessary because make does not recognize 
             *  "foo/bar.c" and "foo\bar.c" as identical goals.
             *
             *  To simply convert slashes, the following sed command can 
             *  be used:
             *      '@$(SED) -e "s:\\\\\\\\:/:g" $@.dep > $@.tmp\n';
             *
             *  We use custom FIXDEP so that we can also generate empty
             *  rules for files not in the current package (and avoid
             *  starting up a shell just to do the redirection).
             */
            res.cmds += '\n-@$(FIXDEP) $@.dep $@.dep\n';
            var profile = target.profiles[file.profile];
            if (profile != null) {
                for (var i = 0; i < profile.filters.length; i++) {
                    var filter = profile.filters[i].$private.filter;
                    if (filter != null) {
                        filter.compile(objListGoal, target, goalFile, file, res);
                    }
                }
            }

            out.write(_mkRule(res, goalFile, target));
            srcs[srcFile] = srcFile;
            copies[goalFile] = goalFile;
            
            /* create rule to make asm source rather than object file */
            file.dstSuffix = ".s" + target.suffix;
            compGoal = new xdc.om['xdc.bld.ITarget'].CompileGoal(file);
            _mkDefs(target, compGoal);
            if ((res = target.scompile(compGoal)) != null) {
                goalFile = goalFile.replace(
                                new RegExp(dstSuffix + '$'), file.dstSuffix);
                copies[goalFile] = goalFile;
                out.write(goalFile + ": | .interfaces\n");
                out.write(goalFile + ": " + srcFile + " "
                    + makeFileName + "\n");
                out.write("\t@$(RM) $@.dep\n");
                res.cmds += '\n-@$(FIXDEP) $@.dep $@.dep\n';
                out.write(_mkRule(res, goalFile, target));
                asmList[asmList.length] = goalFile;
            }
        }
        else {
            java.lang.System.err.print("Warning: target "
                + target.$name
                + " doesn't know how to create '" + goalFile
                + (file != null ?
                    "' from '" + srcFile + "'\n" :
                    ("'; can't find source file for '" + name + "'\n")));
        }
    }

    if (objList.length > 0) {
        /* add source files to specified releases */
        for (var i = 0; i < srcRels.length; i++) {
            var rel = srcRels[i];
            for (var j = 0; j < srcList.length; j++) {
                rel.$private.files[srcList[j]] = srcList[j];
            }
        }

        /* add rules to remove generatable object and asm source files */
        out.write("clean," + target.suffix + " ::\n");
        for (var i = 0; i < objList.length; i++) {
            var objfile = objList[i];
            pkg.$private.generatedFiles[objfile] = 1;
            out.write("\t-$(RM) " + objfile + "\n");
            getDir(objList[i], pkg.$private.dirs);
            objString = objString.concat(objfile + " ");
        }
        for (var i = 0; i < asmList.length; i++) {
            out.write("\t-$(RM) " + asmList[i] + "\n");
        }
        out.write("\n");

    }

    /* if the object list changes or makefile changes, remake goal */
    out.write(objListGoal + ": " + objString + makeFileName + "\n");

    /* clean removes this makefile, but don't remove it on target-specific
     * clean; otherwise we need to re-make the makefile!
     */
    out.write("\nclean::\n\t-$(RM) " + makeFileName + "\n");
    pkg.$private.generatedFiles[makeFileName] = 1;
    out.flush();

    /* write byte stream to the specified makefile if the contents differ */
    utils.saveFile(byteStream.toString(), makeFileName);

    out.close();
    byteStream.close();
    return (objString);
}

/*
 *  ======== _mkProg ========
 *  Executables are configurations of a module and the specification of a
 *  "main" entry point.  Thus,
 *      1. a program's configuration must be re-run if its configuration
 *         script, its arguments, any included script, or any included
 *         interface change.
 *
 *      2. a program must be relinked if any library it requires changes,
 *         or the set of libraries changes
 *
 *  We achieve 1. by generating a configuration script, <cfg>.cfg, that
 *  encapsulates the program's configuration script and arguments.  We then
 *  make the program's <cfg>.c file depend on this generated script.  In
 *  addition, when <cfg>.cfg runs it creates a dependency file, <cfg>.dep,
 *  that adds prerquisites to <cfg>.c of <pkg>/.interfaces and any scripts
 *  loaded by <cfg>.cfg.  The dependency file <cfg>.dep is included if it
 *  exists.
 *
 *  We achive 2. by generating explicit library dependencies when the
 *  program's configuration script is run (see <cfg>.dep).  In addition, we
 *  add the prerequisite <cfg>.xdl to the executable.  The set of libraries 
 *  to link with can only change if a configuration script changes.  But if
 *  one of these scripts changes we will re-configure and if the library set
 *  changes, <cfg>.xdl will change.
 *
 *  TODO: In order to detect configuration interface changes we rely on
 *  the date of the .interfaces file of each imported package.  This is
 *  overly conservative since the interfaces may not change but the
 *  .interfaces file may; e.g., clean and rebuild a package and any
 *  program that imports the package will re-configure when you build
 *  the program's package.
 */
function _mkProg(pkg, prog, out)
{
    debug("_mkProg " + prog.$private.name + " ...");
    
    var goal = prog.$private.name;
    var cmdSet = prog.target.suffix;
    var config = prog.$private.name.replace(/\.([^\.]*$)/, "_$1");
    var cfgDir = pkg.cfgDir;
    var cfgBase = cfgDir + config;
    cfgBase = cfgBase.replace(/\/\/+/g, '/'); /* remove double '/'s; see Bug 456564 */

    /* make sure it is built when .executables is the goal */
    var g = prog.$private.noasm ? ".executables" : ".dlls";
    out.write(g + "," + cmdSet + " " + g + ": " + goal + "\n\n");

    /* add program to the specified releases */
    var ra = prog.attrs.releases;
    var srcRels = [];
    for (var i = 0; i < ra.length; i++) {
        var rel = ra[i];
        if ((prog.attrs.exportExe == null && rel.attrs.exportExe == true)
            || prog.attrs.exportExe == true) {
            rel.$private.files[goal] = goal;
        }
        if ((prog.attrs.exportCfg == null && rel.attrs.exportCfg == true)
            || prog.attrs.exportCfg == true) {
            rel.$private.files[cfgBase + ".xdc.inc"] = cfgBase + ".xdc.inc";
            rel.$private.files[cfgBase + ".cfg"] = cfgBase + ".cfg";
        }
        if ((prog.attrs.exportSrc == null && rel.attrs.exportSrc == true)
            || prog.attrs.exportSrc == true) {
            srcRels.push(rel);
        }
    }

    /* create a list of all objects that need to be built for this program */
    var objs = {};

    /* add XDC objects */
    objs[config] = {
        noExtension: true,
        configOpts: true,
        srcSuffix: ".c",
        srcPrefix: cfgDir,
        dstPrefix: cfgDir,
        attrs: prog.attrs.$copy()
    };
    for (var i in prog.$private.objects) {
        var dst = cfgDir + prog.name + "/";
        objs[i] = {
            dstPrefix: dst,
            attrs: prog.$private.objects[i].attrs.$copy(),
        };
    }

    /* add -Dxdc_cfg__xheader__=... to all objects added to executable */
    for (var i in objs) {
        var attrs = objs[i].attrs;
        if (attrs.defs == null) {
            attrs.defs = "";
        }
        attrs.defs += " -Dxdc_cfg__xheader__='\""
            + pkg.name.replace(/\./g, '/')
            + "/" + cfgBase + ".h\"' ";
    }   

    /* generate rules to compile all added objects */
    var makeFileName = cfgBase + ".mak";
    out.write("-include " + makeFileName + "\n");
    var objList = _mkObjs(objs, prog.target, makeFileName, goal, pkg, srcRels);
    
    /* generate an executable-specific configuration script */
    var cfgFile = _genCfg(prog, cfgDir, config, pkg, prog.$private.noasm);
    prog.$private.xCfgScript = cfgFile;
    prog.$private.xCfgPrefix = cfgDir + config;
    
    /* include generated dependencies from running .cfg script */
    var dep = cfgBase + ".dep";
    pkg.$private.makefiles[pkg.$private.makefiles.length++] = {
        name: dep,
        src : cfgFile
    };
//    out.write("ifneq (clean,$(MAKECMDGOALS))\n");
    out.write("ifeq (,$(MK_NOGENDEPS))\n");
    out.write("-include " + dep + "\n");
    out.write(dep + ": ;\n");
    out.write("endif\n");

    /* create rule to link the program executable */

    /* make sure that all objects are built *after* the config step; this
     * allows these source file to include application-specific generated
     * header (e.g., declarations of created objects)
     */
    out.write(objList + ": | " + cfgBase + ".xdl\n");
    
    var linkArgs = new xdc.om['xdc.bld.ITarget'].LinkGoal({
        base:       prog.name,
        dstPrefix:  "./",
        dstSuffix:  prog.$private.ext,
        files:      objList + " " + cfgBase + ".xdl",
        opts:       _getLinkOpts(prog.target, prog.attrs),
        profile:    prog.attrs.profile ? prog.attrs.profile : "release",
        dllMode:    !prog.$private.noasm,
    });
    var res = prog.target.link(linkArgs);
    if (res != null) {
        var profile = prog.target.profiles[
            prog.attrs.profile ? prog.attrs.profile : "release"
        ];
        if (profile != null) {
            for (var i = 0; i < profile.filters.length; i++) {
                var filter = profile.filters[i].$private.filter;
                if (filter != null) {
                    filter.link(goal, cfgBase, prog, objList, linkArgs, res);
                }
            }
        }
        out.write(goal + ":\n");
        out.write(_mkRule(res, goal, prog.target));
    }

    /*
     *  Changes to libraries SHOULD NOT trigger re-configuration BUT
     *  libraries must exist prior to running configuration; otherwise
     *  the configuration will fail (it insists that the libraries exist).
     *  Perhaps it is better to remove this check from configuration?
     *
     *  Changes to libraries DO require re-link but this is covered by
     *  explicit dependencies generated by running the configuration
     *  script.  The dependency for goal is here to allow one to specify
     *  goal as the build goal in a clean directory; without this
     *  dependency make does not know that it must first make libraries
     *  before making goal.
     */
    out.write("\nifeq (,$(wildcard .libraries," + cmdSet + "))\n");
    out.write(goal + " " + cfgBase + ".c: .libraries," + cmdSet + "\n");
    out.write("endif\n\n");
    
    /* create rules to generate configuration files */
    out.write(cfgBase + ".c " + cfgBase + ".h "
        + cfgBase + ".xdl: override _PROG_NAME := "
        + prog.$private.name + "\n");

    if (prog.attrs.xsopts != null) {
        out.write(cfgBase + ".c "
            + cfgBase + ".xdl: override _PROG_XSOPTS = "
            + prog.attrs.xsopts + "\n");
    }
    out.write(cfgBase + ".c: " + cfgBase + ".cfg\n");

    /* ensure config is re-run if a config interface changes */
    out.write(cfgBase + ".xdl " + cfgBase + ".c: .interfaces\n");

    /* create rules to run all tests */
    if (prog.$private.noasm) {
        _mkTests(prog, out);
    }
    
    /* 
     * create rules to clean generated goals
     *
     * target-specific clean does not remove the generated cfg or dep file;
     * otherwise, we would have to remake the makefile which can be very
     * expensive for packages with lots of files or executables.
     */
    out.write("\nclean:: clean," + cmdSet + "\n");
    out.write("\t-$(RM) " + cfgBase + ".cfg\n");
    out.write("\t-$(RM) " + cfgBase + ".dep\n");
    out.write("\t-$(RM) " + cfgBase + ".c\n");
    out.write("\t-$(RM) " + cfgBase + ".xdc.inc\n");

    out.write("\nclean," + cmdSet + "::\n");
    out.write("\t-$(RM) " + goal + "\n");

    pkg.$private.generatedFiles[cfgBase + ".cfg"] = 1;
    pkg.$private.generatedFiles[cfgBase + ".dep"] = 1;
    pkg.$private.generatedFiles[cfgBase + ".c"] = 1;
    pkg.$private.generatedFiles[cfgBase + ".xdc.inc"] = 1;

    if (prog.target.debugGen.execTemplate != null) {
        var _bldUtils = xdc.useModule('xdc.bld.Utils');
        var fname = _bldUtils.expandDbgName(cfgBase , goal,
            prog.target.debugGen.execPattern);
        out.write("clean:: \n\t-$(RM) " + fname + "\n");
        pkg.$private.generatedFiles[fname] = 1;
    }
}

/*
 *  ======== _mkProg2 ========
 */
function _mkProg2(pkg, aexe, out)
{
    var acfg = aexe.$private.acfg;

    /* legacy assembly/config support */
    if (aexe.$private.noasm == false) {
        _mkProg(pkg, aexe, out);
        return;
    }
    
    if (acfg == null) {
        print("assertion violation: cfg for '" + aexe.name
            + "' must exist prior to generating executables");
    }

    var extra = {
        xCfgScript: acfg.$private.xCfgScript,
        xCfgPrefix: acfg.$private.xCfgPrefix,
        pkgName: pkg.name,
        isPartial: acfg.attrs.prelink,
        objList: acfg.$private.objList,
        pname: acfg.$private.name,
    };
    _mkExe(pkg, aexe, extra, out);
}

/*
 *  ======== _mkExe ========
 *  We generate the following files, where tmpName = "package/cfg/<progName>"
 *    bld:
 *      tmpName.<ext>.mak           rules to compile exe source
 *
 *    cc:
 *      tmpName/<src>.o<suffix>     source output object file
 *      tmpName/<src>.o<suffix>.dep header dependencies for object file
 *
 *   lnk:
 *      <progName>.<ext>            linked executable
 *      tmpName.<ext>.map           linker output map file
 */
function _mkExe(pkg, aexe, sharedCfg, out)
{
    debug("_mkExe " + aexe.$private.name + " ...");
    
    var exeDir  = pkg.cfgDir + aexe.name + "/";

    /* record the executable's generated configuration script */
    aexe.$private.xCfgScript = sharedCfg.xCfgScript;
    aexe.$private.xCfgPrefix = sharedCfg.xCfgPrefix;
    aexe.$private.xCfgPackage = sharedCfg.pkgName;
    
    var cfgBase = sharedCfg.xCfgPrefix;

    var goal = aexe.$private.name;
    var cmdSet = aexe.target.suffix;
    
    /* make sure it is built when .executables is the goal */
    out.write(".executables," + cmdSet + " .executables: " + goal + "\n\n");

    /* make exe depend on configuration's "physical" name */
    if (aexe.attrs.sharedCfg != null || sharedCfg.isPartial) {
        /* TODO: we should fix configs so the dependency below is always
         * required.  For the moment we don't create a pname file when
         * the config is implicitly created, so we need to avoid creating
         * the dependency below since this would cause exes with 
         * implicitly created configs to be re-linked on every build.
         */
        out.write(goal + ": " + sharedCfg.pname + "\n\n");
    }
    else {
        /* creating an order-only dependency works around the "relink" issue */
        out.write(goal + ": |" + sharedCfg.pname + "\n\n");
    }
    
    /* add executable to the specified releases */
    var ra = aexe.attrs.releases;
    var srcRels = [];
    for (var i = 0; i < ra.length; i++) {
        var rel = ra[i];
        if ((aexe.attrs.exportExe == null && rel.attrs.exportExe == true)
            || aexe.attrs.exportExe == true) {
            rel.$private.files[goal] = goal;
        }
        if ((aexe.attrs.exportSrc == null && rel.attrs.exportSrc == true)
            || aexe.attrs.exportSrc == true) {
            srcRels.push(rel);
        }
    }

    /* create a list of all objects that must be built for this executable */
    var objs = {};
    for (var i in aexe.$private.objects) {
        var attrs = aexe.$private.objects[i].attrs.$copy();
        if (attrs.defs == null) {
            attrs.defs = "";
        }
        /* add -Dxdc_cfg__header__=... to all objects added to executable */
        attrs.defs += " -Dxdc_cfg__xheader__='\""
            + sharedCfg.pkgName.replace(/\./g,'/') + "/" + cfgBase + ".h\"' ";

        objs[i] = {
            dstPrefix: exeDir,
            attrs: attrs
        };
    }

    /* generate rules to compile the added objects */
    var makeFileName = (pkg.cfgDir + aexe.$private.name + ".mak").replace(/\/\/+/g, '/');
    out.write("-include " + makeFileName + "\n");
    var objList = _mkObjs(objs, aexe.target, makeFileName, goal, pkg, srcRels);
    
    /* create rule to link the program executable */
    if (sharedCfg.pkgName != pkg.name) {
        /* if cfg is in a different pkg we must use an absolute path */
        cfgBase = xdc.getPackagebase(sharedCfg.pkgName) + cfgBase;
    }
    /* TODO: partial attribute of cfgs shouldn't change the linker cmd name */
    var cmdFile = cfgBase + (sharedCfg.isPartial ? "_x.xdl" : ".xdl");
    var linkArgs = new xdc.om['xdc.bld.ITarget'].LinkGoal({
        base:       aexe.name,
        dstPrefix:  "./",
        dstSuffix:  aexe.$private.ext,
        files:      sharedCfg.objList + " " + objList + " " + cmdFile,
        opts:       _getLinkOpts(aexe.target, aexe.attrs),
        profile:    aexe.attrs.profile ? aexe.attrs.profile : "release",
    });
    var res = aexe.target.link(linkArgs);
    if (res != null) {
        var profile = aexe.target.profiles[
            aexe.attrs.profile ? aexe.attrs.profile : "release"
        ];
        if (profile != null) {
            for (var i = 0; i < profile.filters.length; i++) {
                var filter = profile.filters[i].$private.filter;
                if (filter != null) {
                    filter.link(goal, cfgBase, aexe, objList, linkArgs, res);
                }
            }
        }
        out.write(goal + ": " + sharedCfg.objList + "\n");
        out.write(_mkRule(res, goal, aexe.target));
    }

    /* create rules to run all tests */
    _mkTests(aexe, out);
    
    /* 
     * create rules to clean generated goals
     *
     * target-specific clean does not remove the generated cfg or dep file;
     * otherwise, we would have to remake the makefile which can be very
     * expensive for packages with lots of files or executables.
     */
    out.write("\nclean:: clean," + cmdSet + "\n");
    out.write("\nclean," + cmdSet + "::\n");
    out.write("\t-$(RM) " + goal + "\n");

    if (aexe.target.debugGen.execTemplate != null) {
        var _bldUtils = xdc.useModule('xdc.bld.Utils');
        /* TODO: handle cfgBase in other package */
        var fname = _bldUtils.expandDbgName(cfgBase, goal,
            aexe.target.debugGen.execPattern);
        out.write("clean:: \n\t-$(RM) " + fname + "\n");
        pkg.$private.generatedFiles[fname] = 1;
    }
}

/*
 *  ======== _mkConfig ========
 *  We generate the following files, where asmName = "package/cfg/<cfgName>"
 *    bld:
 *      asmName_p<suffix>.cfg       target-platform binding script
 *      asmName_p<suffix>.mak       rules to compile cfg generated sources
 *
 *    cfg:
 *      asmName_p<suffix>.xdc.inc   include files to add to a release;
 *                                  generated as side effect of xdc.cfg, see
 *                                  cfg.xdt + utils.genDep
 *      asmName_p<suffix>.xdl       config linker command file; see Prog.java
 *      asmName_p<suffix>_x.xdl     app linker command file; see xdc.cfg.Main
 *      asmName_p<suffix>.dep       dependencies discovered during config
 *                                      goal: libs ...
 *      asmName_p<suffix>.c         generated C data/code
 *      asmName_p<suffix>.h         global declarartions of generated data
 *      asmName_p<suffix>.rta.xml   RTA meta-data
 *      asmName_p<suffix>.rov.xs    ROV config model recap
 *      asmName_p<suffix>.cfg.xml   config model state (unused?)
 *      asmName_p<suffix>.cfg.dot   config DOT graph (unused?)
 *
 *    cc:
 *      asmName_p<suffix>.o<suffix>     output object file
 *      asmName_p<suffix>.o<suffix>.dep header dependencies for object file
 *
 *   lnk: (only if partial link is specified)
 *      asmName.p<suffix>.obj       prelinked object
 *      asmName.p<suffix>.map       prelinked map file
 *      goal                        physical name of the configuration
 *
 *   make: (only if partial link is not specified)
 *      goal                        physical name of the configuration
 *
 *  The build works roughly as follows, where goal is the "physical name" of
 *  the configuration and cfgBase is the prefix for the config generated files
 *  (asmName_p<suffix>):
 *
 *     all: .dlls
 *     .dlls: goal
 *
 *     goal: cfgBase.o<suffix>
 *         $(TOUCH) $@
 *
 *     cfgBase.o<suffix>: cfgBase.c
 *     cfgBase.c: _PROG_NAME = goal
 *         $(CONFIG) cfgBase.cfg 
 *     -include cfgBase.dep
 *
 *  cfgBase.dep contains
 *     _PROG_NAME: pkg/foo.lib ...
 *
 *  TODO: all configurations need to define _PROG_NAME; this name is in
 *  the generated .c file and is used as the goal in the asmName_p<suffix>.dep
 *  dependencies.  But for non-partial linked configurations, the dependencies
 *  should trigger a re-link of _all_ applications that share the config.  
 *  Perhaps we should _always_ generate the .p<suffix>.obj file, make this a
 *  pre-requisite of all executables using this config, and always use it as
 *  the goal.
 *  
 */
function _mkConfig(pkg, acfg, out)
{
    debug("_mkConfig " + acfg.$private.name + " ...");
    
    if (acfg.$private.noasm == false) {
        return; /* nothing to do: generation will be handled by old mkProg() */
    }

    var isPartial = acfg.attrs.prelink ? true : false;
    var config = acfg.$private.name.replace(/\.([^\.]*$)/, "_$1");
    var cfgDir = pkg.cfgDir;
    var cfgBase = cfgDir + config;
    cfgBase = cfgBase.replace(/\/\/+/g, '/'); /* remove double '/'s; see Bug 456564 */

    var goal = acfg.$private.name;
    var cmdSet = acfg.target.suffix;
    
    /* make sure it is built when .dlls is the goal */
    out.write(".dlls," + cmdSet + " .dlls: " + goal + "\n\n");

    /* add configuration to the specified releases */
    var ra = acfg.attrs.releases;
    var srcRels = [];
    for (var i = 0; i < ra.length; i++) {
        var rel = ra[i];
        if ((acfg.attrs.exportCfg == null && rel.attrs.exportCfg == true)
            || acfg.attrs.exportCfg == true) {
            rel.$private.files[cfgBase + ".xdc.inc"] = cfgBase + ".xdc.inc";
            rel.$private.files[cfgBase + ".cfg"] = cfgBase + ".cfg";

            if (isPartial == true) {
                rel.$private.files[goal] = goal;
            }
        }
        if ((acfg.attrs.exportSrc == null && rel.attrs.exportSrc == true)
            || acfg.attrs.exportSrc == true) {
            srcRels.push(rel);
        }
    }

    /* create a list of all objects that need to be built for this program */
    var objs = {};

    /* add -Dxdc_cfg__xheader__=... to compiled cfg object */
    var attrs = acfg.attrs.$copy();
    if (attrs.defs == null) {
        attrs.defs = "";
    }
    attrs.defs += " -Dxdc_cfg__xheader__='\""
        + pkg.name.replace(/\./g, '/')
        + "/" + cfgBase + ".h\"' ";

    objs[config] = {
        noExtension: true,
        configOpts: true,
        srcSuffix: ".c",
        srcPrefix: cfgDir,
        dstPrefix: cfgDir,
        attrs: attrs
    };

    /* generate rules to compile generated files */
    var makeFileName = cfgBase + ".mak";
    out.write("-include " + makeFileName + "\n");
    var objList = _mkObjs(objs, acfg.target, makeFileName, goal, pkg, srcRels);
    acfg.$private.objList = objList;

    /* include xdc.cfg.SourceDir generated makefile (if it exists) */
    out.write("-include " + cfgBase + ".cfg.mak\n");
    
    /* generate the executable-specific configuration script */
    var cfgFile = _genCfg(acfg, cfgDir, config, pkg, !isPartial);
    acfg.$private.xCfgScript = cfgFile;
    acfg.$private.xCfgPrefix = cfgBase;
    
    /* include generated dependencies from running .cfg script */
    var dep = cfgBase + ".dep";
    pkg.$private.makefiles[pkg.$private.makefiles.length++] = {
        name: dep,
        src : cfgFile
    };
//    out.write("ifneq (clean,$(MAKECMDGOALS))\n");
    out.write("ifeq (,$(MK_NOGENDEPS))\n");
    out.write("-include " + dep + "\n");
    out.write("endif\n");
    
    /* if necessary, do the partial link */
    if (isPartial) {
        /* TODO: target should not control the output name!! */
        acfg.$private.objList = cfgDir + acfg.$private.name + ".obj";

        var linkArgs = new xdc.om['xdc.bld.ITarget'].LinkGoal({
            base:       acfg.name,
            dstPrefix:  "./",   /* TODO: ignored by TI targets!!! */
            dstSuffix:  acfg.$private.ext,
            files:      objList + " " + cfgBase + ".xdl",
            opts:       _getLinkOpts(acfg.target, acfg.attrs),
            profile:    acfg.attrs.profile ? acfg.attrs.profile : "release",
            dllMode:    true,
        });
        var res = acfg.target.link(linkArgs);
        if (res != null) {
            var profile = acfg.target.profiles[
                acfg.attrs.profile ? acfg.attrs.profile : "release"
            ];
            if (profile != null) {
                for (var i = 0; i < profile.filters.length; i++) {
                    var filter = profile.filters[i].$private.filter;
                    if (filter != null) {
                        /* TODO: how to pass exeBase to filters? */
                        filter.link(goal, cfgBase, acfg, objList, linkArgs, res);
                    }
                }
            }
            out.write(goal + ":\n");
            out.write(_mkRule(res, goal, acfg.target));
        }
    }
    else {
        if (acfg.$private.progName != null) {
            /* we know the name of the executable, so this is an implicitly
             * created config which is not shared.  To prevent unnecessary
             * clutter, we don't create the empty config file.
             */
            /* TODO: should this be a .PHONY goal? */
            out.write(goal + ": " + cfgBase + ".xdl\n\t@\n\n");
        }
        else {
            out.write(goal + ": " + cfgBase
                + ".xdl\n\t@$(RM) $@\n\t@$(TOUCH) $@\n\n");
        }
    }

    /*
     *  Changes to libraries SHOULD NOT trigger re-configuration BUT
     *  libraries must exist prior to running configuration; otherwise
     *  the configuration will fail (it insists that the libraries exist).
     *  Perhaps it is better to remove this check from configuration?
     *
     *  Changes to libraries DO require re-link but this is covered by
     *  explicit dependencies generated by running the configuration
     *  script.  The dependency for goal is here to allow one to specify
     *  goal as the build goal in a clean directory; without this
     *  dependency make does not know that it must first make libraries
     *  before making goal.
     */
    out.write("\nifeq (,$(wildcard .libraries," + cmdSet + "))\n");
    /* TODO handle absolute cfgBase (cfgBase in different package) */
    out.write(goal + " " + cfgBase + ".c: .libraries," + cmdSet + "\n");
    out.write("endif\n\n");
    
    /* create rules to trigger generatation of configuration files */
    var progName = acfg.$private.progName != null 
        ? acfg.$private.progName : acfg.$private.name;
    out.write(cfgBase + ".c " + cfgBase + ".h "
              + cfgBase + ".xdl: override _PROG_NAME := "
              + progName + "\n");

    if (acfg.attrs.xsopts != null) {
        out.write(cfgBase + ".c "
                  + cfgBase + ".xdl: override _PROG_XSOPTS = "
                  + acfg.attrs.xsopts + "\n");
    }
    out.write(cfgBase + ".c: " + cfgBase + ".cfg\n");

    /* add prerequisite for .xdc.inc so releases that reference this file
     * must wait for the confg step to complete
     */
    out.write(cfgBase + ".xdc.inc: " + cfgBase + ".xdl\n");

    /* ensure config is re-run if a config interface changes */
    out.write(cfgBase + ".xdl " + cfgBase + ".c: .interfaces\n");

    /* 
     * create rules to clean generated goals
     *
     * target-specific clean does not remove the generated cfg or dep file;
     * otherwise, we would have to remake the makefile which can be very
     * expensive for packages with lots of files or executables.
     */
    out.write("\nclean:: clean," + cmdSet + "\n");
    out.write("\t-$(RM) " + cfgBase + ".cfg\n");
    out.write("\t-$(RM) " + cfgBase + ".dep\n");
    out.write("\t-$(RM) " + cfgBase + ".c\n");
    out.write("\t-$(RM) " + cfgBase + ".xdc.inc\n");
    out.write("\nclean," + cmdSet + "::\n");
    out.write("\t-$(RM) " + goal + "\n");

    pkg.$private.generatedFiles[cfgBase + ".cfg"] = 1;
    pkg.$private.generatedFiles[cfgBase + ".dep"] = 1;
    pkg.$private.generatedFiles[cfgBase + ".c"] = 1;
    pkg.$private.generatedFiles[cfgBase + ".xdc.inc"] = 1;
}

/*
 *  ======== _mkRelease ========
 *  A release is a zip (or tar) file containing all the files specified by 
 *  the releases.$private.files list.  If the list contains files with the
 *  extension ".xdc.inc", these files are recursively expanded to obtain
 *  additional files to be added to the tar; the .xdc.inc files are not part
 *  of the tar.
 *
 *  Release archives are created as follows:
 *      1. an initial manifest is specified in a build script by populating
 *         release.$private.files[string] with files that are to be
 *         archived *or* "*.xdc.inc" files that list additional files to be
 *         archived; "*.xdc.inc" files are created at later stages of the
 *         build.
 *      2. _mkManifest() creates a top-level "*.xdc.inc" file named
 *         <rdir>/<rname>.xdc.inc, where <rdir> is the directory containing
 *         intermediate files related to a release, and <rname> is the name
 *         specified by the user.  This file lists all files in the
 *         release.$private.files[] hash.
 *      3. For every release, rel.js creates a release specific package.rel.xml
 *         in the directory <rdir>/<pkgdir>/package, where <rdir> is
 *         package/rel/<release_name> and <pkgdir> is the directory form of
 *         the package name.
 *      4. The rule to make the archive, MKREL, is defined in xdc_rules.mak
 *         and performs the following steps:
 *              a. expand top-level "*.xdc.inc" file into *.manifest
 *              b. if there is a release script, run rcl.js on *.manifest;
 *                 otherwise run tar on *.manifest
 *              c. add release-specific <pkdir>/package/package.rel.xml to the
 *                 archive
 */
function _mkRelease(pkg, release, out)
{
    var rdir = pkg.relDir;
    out.write("\n.PHONY: release," + release.name + "\n");
    var mname = rdir + release.name + ".xdc.inc";
    var aname = release.$private.name;    /* name of the archive file */
    var aprefix = release.attrs.prefix;
    var dname = rdir + aname + ".dep";

    /* save name of top-level manifest file name to be recorded in .bld.xml */
    release.$private.mname = mname;

    /* indicate that manifest and dependencies files are generated */
    pkg.$private.generatedFiles[mname] = 1;
    pkg.$private.generatedFiles[dname] = 1;
    
    if (_mkManifest(pkg, release, mname) > 0) {

        pkg.$private.makefiles[pkg.$private.makefiles.length++] = {
            name: dname,
            src : mname
        };
        //out.write("ifneq (clean,$(MAKECMDGOALS))\n");
        out.write("ifeq (,$(MK_NOGENDEPS))\n");
        out.write("-include " + dname + "\n");
        if (release.attrs.relScript != null) {
            out.write("-include " + rdir + aname + ".rcl.dep\n");
        }
        out.write("endif\n");

        /* generate rule to make unique release id file, .../package/package.rel.xml  */
        var idname = rdir + release.name + "/" + pkg.name.replace(/\./g, '/')
            + "/package/package.rel.xml";
        /* since each release depends on it's id file, we add prerequisites 
         * here to ensure the release isn't built until all inputs are built
         */
        for (var i in release.$private.files) {
            /* ensure the id file isn't built before the release contents and
             * the archive is rebuilt if one of its elems changes
             */
            out.write(idname + ": " + i + "\n");
        }
        out.write(idname + ": .force\n");
        out.write("\t@$(MSG) generating external release references $@ ...\n");
        out.write("\t$(XS) $(JSENV) -f $(XDCROOT)/packages/xdc/bld/rel.js $(MK_RELOPTS) . $@\n\n");

        /* generate rule to build archive (and gen deps) */
        out.write(aprefix + aname + ": " + mname + " " + idname + "\n");
        out.write('\t@$(MSG) making release file $@ "(because of $(firstword $?))" ...\n');
        out.write("\t-$(RM) $@\n");
        if (aname.match(/\.zip$/)) {
            out.write("\t$(call MKRELZIP,");
        }
        else {
            out.write("\t$(call MKRELTAR,");
        }
        out.write(mname.replace(/,/g, "$(comma)")
            + "," + dname.replace(/,/g, "$(comma)"));
        if (release.attrs.relScript != null) {
            /* $(comma) is defined in the makefiles to be ',' */
            out.write(", "
                + release.attrs.relScript.replace(/,/g, "$(comma)"));
            if (release.attrs.relScriptArgs != null) {
                out.write(", "
                    + release.attrs.relScriptArgs.replace(/,/g, "$(comma)"));
            }
        }
        out.write(")\n\n");
        out.write("\nrelease release," + release.name + ": all "
            + aprefix + aname +"\n");

        /* generate rules to cleanup generated files */
        out.write("clean:: .clean\n");
        if (aprefix[0] != '.' || aprefix[1] != '.') {
            /* don't remove files above the package's root directory */
            out.write("\t-$(RM) " + aprefix + aname + "\n");
        }
        out.write("\t-$(RM) " + mname + "\n");
        out.write("\t-$(RM) " + dname + "\n\n");
    }
}

/*
 *  ======== _mkRepoMeta ========
 */
function _mkRepoMeta(pkg, repo)
{
    var fileName = repo.name + "/.repo.xml";

    try {
        java.io.File(repo.name).mkdirs();

        var file = new java.io.File(fileName);
        file["delete"]();
        file = new java.io.FileWriter(fileName);
        file.write('<repository name="' + repo.name
            + '" providerId="' + pkg.name
            + '" producerId="' + escape(pkg.producerId)
            + '" />\n');
        file.flush();
    }
    catch (e) {
        throw new Error("Unable to create repository .repo.xml file for '" 
                        + repo.name + "'; " + e);
    }
}

/*
 *  ======== _mkRepository ========
 *  Generates:
 *     release: <releaseTime>
 *     release,<releaseName>: <releaseTime>
 *
 *     <releaseTime>: <releaseArchive>
 *         unzip $<
 *         touch $@
 *
 *     <releaseArchive>:
 *         $(error ...)
 * 
 *  We create <releaseTime> empty files to enable us to track changes
 *  made to individual package archive files (located _outside_ this 
 *  package).
 */
function _mkRepository(thisPkg, repository, out, relList)
{
    _mkRepoMeta(thisPkg, repository);

    for (var pname in repository.$private.packages) {
        var pkg = repository.$private.packages[pname];
        var relFile = _findReleaseArchive(pkg, repository);
        var cpPkgDir = null;

        if (relFile == null) {
            cpPkgDir = _findReleaseBase(pkg);
            if (cpPkgDir == null) {
                throw new Error("Can't find the '" + pkg.rdesc.label
                                + "' release of the package '" + pkg.name
                                + "' to install/copy into the repository '"
                                + repository.$private.name + "'.");
            }
        }

        /* relTime represents the timestamp of relFile in repository */
        var relTime = "package/."
            + repository.name.replace(/[\/\\]/g, ".")
            + "." + pname;

        /* add package to the specified releases */
        out.write("release: " + relTime + "\n");
        var ra = repository.attrs.releases;
        for (var i = 0; i < ra.length; i++) {
            out.write("release," + ra[i].name + ": " + relTime + "\n");
            out.write(ra[i].attrs.prefix + ra[i].$private.name + ": " 
                      + relTime + "\n");
        }
    
        if (cpPkgDir != null) {
            /* create rule for copying package release into repository */
            out.write(relTime + ": " + _escapeFilename(cpPkgDir) + "\n");
            out.write("\t$(RM) $@\n");
            out.write("\t@$(MSG) copying " + pname + " [ "
                      + cpPkgDir + "] ...\n");
            out.write("\t$(XDCCPP) \"$<\" " + repository.name + "\n");
            out.write("\t$(TOUCH) $@\n\n");
            continue;   /* skip to next package to install */
        }

        /* create rule for installing package release into repository */
        out.write(relTime + ": " + _escapeFilename(relFile) + "\n");
        out.write("\t$(RM) $@\n");
        out.write("\t@$(MSG) installing " + pname + " [release "
            + relFile + "] ...\n");

        /* BUG: we should remove the package before installing it; 
         * otherwise it's possible that a file removed from more recent
         * archives will not be deleted from the repository!
         */
        if (pkg.rname.match(/\.zip$/)) {
            out.write("\t$(UNZIP) -uo -qq \"$<\""
                + " -d " + repository.name + "\n");
        }
        else {
            /* use --unlink-first to remove read-only files before extract */
            /* use --recursive-unlink to remove directories before extract */
            out.write("\t$(TAR) --unlink-first --recursive-unlink"
                + " --directory=" + repository.name
                + " --force-local -x"
                + (pkg.rname.match(/.*\.gz$/) ? "zf" : "f") + " \"$<\"\n");
        }

        out.write("\t$(TOUCH) $@\n\n");

        /* create an empty rule for the release archive; this ensures
         * that when we compute "built-with" dependencies we know that
         * the package containing this archive is required and we don't get
         * warnings about the package not needing to be declared as
         * "required" in the package.xdc file.
         *
         * Note that if the archive is moved, all dependents will be
         * re-created instead of make complaining that it doesn't know how
         * to make the archive.  Thus, we emit a better error message in each
         * dependent; e.g., "rebuild and release package xyz"
         */
        if (relList[relFile] == null) {
            relList[relFile] = true;    /* generate this rule just once */
            out.write(_escapeFilename(relFile) + ":\n");
            out.write("\t$(error $@ doesn't exist;"
                + " rebuild the " + pkg.rname + " release of package " + pname
                + "))\n\n");
        }
    }
    out.write("clean::\n\t$(RMDIR) " + repository.name + "\n");
}

/*
 *  ======== _mkRule ========
 *  Convert simple command sequences into a make compatible sequence
 *  of rules; e.g., prepending a tab in front of each command.
 */
function _mkRule(cmds, goal, target)
{
    /* insert remove of goal before commands to make it (so target doesn't
     * need to)
     */
    var rule = "\t$(RM) $@\n\t";

    /* insert concise message (if it's supplied) */
    if (cmds.msg != null) {
        rule = rule.concat("@$(MSG) " 
                           + cmds.msg.replace(/\n/g, "\n\t@$(MSG) ") + "\n");
    }

    /* convert commands into separate make commands (add leading tab) */
    if (cmds.cmds != null) {
        rule = rule.concat("\t" + cmds.cmds.replace(/\n/g, "\n\t") + "\n");
    }
    else {
        /* Bug 369984 - Crash if (buggy) target fails to set cmds */
        java.lang.System.err.print("Warning: target '"
            + target.$name + "' didn't supply any commands for '"
            + goal + "'\n");
    }

    /* create environment for the commands */
    if (cmds.envs != null) {
        for (var i = 0; i < cmds.envs.length; i++) {
            rule = rule.concat(goal + ": export " + cmds.envs[i] + "\n");
        }
    }
    if (cmds.path != null && cmds.path.length > 0) {
        var BuildEnvironment = xdc.om['xdc.bld.BuildEnvironment'];

        var sep = BuildEnvironment.hostOS == BuildEnvironment.WINDOWS
            ? ";" : ":";

        var path = "";
        var prefix = "";
        for (var i = 0; i < cmds.path.length; i++) {
            var dir = cmds.path[i];
            if (dir != null && dir.length > 0) {
                path = path.concat(prefix + dir);
                prefix = sep;
            }
        }
        rule = rule.concat(goal + ": PATH:=" + path + "\n");
        if (BuildEnvironment.hostOS == BuildEnvironment.WINDOWS) {
            rule = rule.concat(goal + ": Path:=" + path + "\n");
        }
    }

    /* TODO: should we do this here or require it of the target????? */
    rule = rule.replace(/\$\(rootDir\)/g, "$(" + target.$name + ".rootDir)");
    rule = rule.replace(/\$\(packageBase\)/g, 
                        "$(" + target.$package.$name + ".packageBase)");
    
    return (rule + "\n");
}

/*
 *  ======== _mkSchema ========
 */
function _mkSchema(pkg, out)
{
    debug("_mkSchema ...");

    /* add all generated and spec'd source files to all releases */
    for (var rname in pkg.$private.releases) {
        var rel = pkg.$private.releases[rname];
        rel.$private.files["package/package.xdc.inc"] =
            "package/package.xdc.inc";
    }
    
    pkg.$private.makefiles[pkg.$private.makefiles.length++] = {
        name: "package/package.xdc.dep",
        src : "package.xdc"
    };

    /* output a .interfaces goal to capture any change to any interface */
    out.write("PKGCFGS := $(wildcard package.xs) package/build.cfg\n");
    out.write(".interfaces: package/package.xdc.inc package/package.defs.h package.xdc $(PKGCFGS)\n\n");

    /* generate pattern rule rather than explicit goals to support parallel
     * builds.  Without the pattern rule, during a parallel build, make will
     * run the interface generation command for each goal (rather than once
     * for all goals).
     *
     * Note: you can't add goals without a % in the goal; if the non-% goal
     * is what needs to be made, make can't determine the pre-requisite's
     * file name (which is a function of %).
     *
     *  It is also important that the -included makefile *not* be included
     *  in the pattern rule; otherwise, make will know how to build this file
     *  and insist on trying to make it even during a clean!
     */
    out.write("-include package/package.xdc.dep\n");

    out.write("package/%.xdc.inc package/%_" + pkg.name
                + ".c package/%.defs.h: %.xdc $(PKGCFGS)\n");
    out.write("\t@$(MSG) generating interfaces for package "
                + pkg.name
                + '" (because $@ is older than $(firstword $?))" ...\n');
                
    out.write("\t$(XSRUN) -f xdc/services/intern/cmd/build.xs $(MK_IDLOPTS) -m package/package.xdc.dep -i package/package.xdc.inc package.xdc\n");
    out.write("\n");
    
    /* if there are no configurations in this package, run a command to
     * load this package's schema and generate the list of files it includes;
     * any files included from this package must be part of this package's
     * releases.
     *
     *  BUG: if this package contains only configurations from other
     *  packages we may miss some files by not generating package.cfg.xdc.inc.
     *  Perhaps we should always run this???
     */
    if (pkg.$private.executables.length == 0) {
        //out.write("ifneq (clean,$(MAKECMDGOALS))\n");
        out.write("ifeq (,$(MK_NOGENDEPS))\n");
        out.write("-include package/package.cfg.dep\n");
        out.write("endif\n\n");

        out.write("package/package.cfg.xdc.inc: .interfaces $(XDCROOT)/packages/xdc/cfg/cfginc.js package.xdc\n");
        out.write("\t@$(MSG) generating schema include file list ...\n");
        out.write("\t$(CONFIG) -f $(XDCROOT)/packages/xdc/cfg/cfginc.js "
            + pkg.name + " $@\n\n");
        
        pkg.otherFiles[pkg.otherFiles.length++] = "package/package.cfg.xdc.inc";
        pkg.$private.makefiles[pkg.$private.makefiles.length++] = {
            name: "package/package.cfg.dep",
            src : "package.xdc"
        };
    }

    /* add all "other files" and "exclude dirs" to all releases */
    for (var rname in pkg.$private.releases) {
        var rel = pkg.$private.releases[rname];
        var list = pkg.otherFiles;
        for (var i = 0; i < list.length; i++) {
            /* There is a problem with ending '/' on Windows, so we need to
             * remove all ending '/'. See CQ23249 for more information.
             */
            list[i] = list[i].match(/^(.*?)(\/*)$/)[1];

            /* check for empty files because of user supplied list may
             * have mistakes and adding an empty file here causes .xml file
             * corruption, manifest corruption, ...
             */
            if (list[i] != null && list[i] != "") {
                rel.$private.files[list[i]] = list[i];
            }
        }

        /* add all "other sources" to all "source" releases */
        if (rel.attrs.exportSrc == true) {
            var list = pkg.otherSrcs;
            for (var i = 0; i < list.length; i++) {
                list[i] = list[i].match(/^(.*?)(\/*)$/)[1];
                /* check for empty files (see above) */
                if (list[i] != null && list[i] != "") {
                    rel.$private.files[list[i]] = list[i];
                }
            }
        }

        /* add "exclude dirs" to all releases */
        var list = pkg.excludeDirs;
        for (var i = 0; i < list.length; i++) {
            list[i] = list[i].match(/^(.*?)(\/*)$/)[1];
            /* check for empty files (see above) */
            if (list[i] != null && list[i] != "") {
                rel.$private.excludeDirs[list[i]] = list[i];
            }
        }

    }
}

/*
 *  ======== _mkScript ========
 */
function _mkScript(pkg, script, out)
{
    /* generate a rule that runs the script */
    out.write("\n.PHONY: " + script.name + ".run\n");
    var cmd;
    if (script.name.match(/\.ksh$|\.sh$/) != null) {
        cmd = "$(SHELL) ";
    }
    else {
        cmd = "$(XSRUN) " + (script.attrs.hasMain ? "-c " : "-f ");
    }
    out.write(script.name + ".run:\n\t" + cmd + script.name + "\n");

    /* add script to the specified releases */
    var ra = script.attrs.releases;
    for (var i = 0; i < ra.length; i++) {
        ra[i].$private.files[script.name] = script.name;
    }

    /* add any tests that were added to the script */
    _mkScriptTests(pkg, script, out);
}

/*
 *  ======== _mkScriptTests ========
 */
function _mkScriptTests(pkg, script, out)
{
    var testCmds = {};

    /* combine commands to run each test by test name */
    for (var i = 0; i < script.$private.tests.length; i++) {
        var test = script.$private.tests[i];

        /* compute cmd to run */
        var msg = (test.attrs.refOutput != null)
            ? "\t@$(XDCTEST.MSG)" : "\t@$(MSG)";
        var cmd = msg + " running $< " + test.attrs.args + " ...\n";

        /* If the script is in a subdirectory, we need to have the 
         * temporary output there instead of creating a subdirectory
         * with the name starting with .tmp.
         */
        var lastSlashPos = script.$private.name.lastIndexOf("/");
        var tmpOutput = script.$private.name.substring(0, lastSlashPos + 1) 
            + ".tmp," + script.$private.name.substring(lastSlashPos + 1) 
            + "," + i;
        if (test.attrs.refOutput != null) {
            cmd += "\t-$(RM) " + tmpOutput + "\n";
        }

        if (test.attrs.execCmd != null) {
            cmd += "\t" + test.attrs.execCmd + " " + test.attrs.execArgs + " $< ";
        }
        else if (script.name.match(/\.ksh$|\.sh$/) != null) {
                cmd += "\t$(SHELL) " + test.attrs.execArgs + " $< ";
        }
        else {
            if (script.attrs.hasMain) {
                cmd += "\t$(XSRUN) " + test.attrs.execArgs + " -c $< ";
            }
            else {
                cmd += "\t$(XSRUN) " + test.attrs.execArgs + " -f $< ";
            }
        }
        cmd += test.attrs.args;
        if (test.attrs.refOutput != null) {
            var cmpCmd = test.attrs.cmpCmd ? test.attrs.cmpCmd : "$(CMP)";
            cmd += "$(XDCTEST.REDIRECT) " + tmpOutput
                + "\n\t" + cmpCmd + " " + tmpOutput + " " + test.attrs.refOutput
                + "\n\t@$(MSG) test passed [$< " + test.attrs.args + "].\n"
                + "\n\t$(RM) " + tmpOutput;
        }
        cmd += "\n";

        var tmp = testCmds[test.attrs.groupName];
        testCmds[test.attrs.groupName] = 
                (tmp == null || tmp == "") ? cmd : (tmp + cmd);
    }
    
    /* output make test rules */
    for (var testName in testCmds) {
        out.write("test: " + testName + ".test\n");
        out.write(testName + ".test:: " + script.$private.name + "\n");
        out.write(testCmds[testName]);
        out.write("\n");
    }
}

/*
 *  ======== _mkTests ========
 *  The command to run an executable is computed by the platform's
 *  getExecCmd() method.  The results are placed in the executable's *.dep
 *  file when we configure the program and (as a side effect) generate
 *  the program's dependencies.
 *
 *  The exec command may not be defined because make has not read the
 *  most recent *.dep file.  To ensure that we have the most recent
 *  definition we recursively invoke make.  Since the executable must
 *  have been built, the *.dep file must be up to date.  Thus, simply
 *  re-running make will get the proper definition of the exec command.
 *
 *  BUG:  we should combine *all* test commands across *all* executables
 *  rather than one program at a time.  Since we recursively call make
 *  (to ensure that the EXEC.* macro is defined), we redundantly execute
 *  tests that have the same name but are associated with different
 *  executables.  We can eliminate the problem by looping over all 
 *  executables or eliminating the recursive invocation of make.
 */
function _mkTests(prog, out)
{
    var testCmds = {};
    var goal = prog.$private.name;
    var lastSlashPos = goal.lastIndexOf("/");
    var tmpOutputPrefix = goal.substring(0, lastSlashPos + 1) + 
            ".tmp," + goal.substring(lastSlashPos + 1);

    /* combine commands to run each test by test name */
    for (var i = 0; i < prog.$private.tests.length; i++) {
        var test = prog.$private.tests[i];

        /* compute cmd to run */
        var msg = (test.attrs.refOutput != null)
            ? "\t@$(XDCTEST.MSG)" : "\t@$(MSG)";
        var cmd = msg + " running $< " + test.attrs.args + " ...\n";

        /* If the executable is in a subdirectory, we need to have the 
         * temporary output there instead of creating a subdirectory
         * with the name starting with .tmp.
         */
        var tmpOutput = tmpOutputPrefix + "," + i;
        if (test.attrs.refOutput != null) {
            cmd += "\t-$(RM) " + tmpOutput + "\n";
        }

        if (test.attrs.execCmd != null) {
            cmd += "\t" + test.attrs.execCmd + " " + test.attrs.execArgs + " $< ";
        }
        else {
            cmd += "\t$(call EXEC."
                + prog.$private.name.replace(/,/g, "$(comma)") + ", "
                + test.attrs.execArgs + ") ";
        }
        cmd += test.attrs.args;
        if (test.attrs.refOutput != null) {
            var cmpCmd = test.attrs.cmpCmd ? test.attrs.cmpCmd : "$(CMP)";
            cmd += "$(XDCTEST.REDIRECT) " + tmpOutput
                + "\n\t" + cmpCmd + " " + tmpOutput + " " + test.attrs.refOutput
                + "\n\t@$(MSG) test passed [$< " + test.attrs.args + "].\n"
                + "\n\t$(RM) " + tmpOutput;
        }
        cmd += "\n";

        var tmp = testCmds[test.attrs.groupName];
        testCmds[test.attrs.groupName] = 
                (tmp == null || tmp == "") ? cmd : (tmp + cmd);
    }
    
    /* output make test rules */
    for (var testName in testCmds) {
        /* Tests that belong to a group are treated differently. */
        if (testName != prog.$private.name) {
            out.write("test," + prog.target.suffix + " test " + testName
                + ".test: " + testName + ".test," + prog.target.suffix
                + "\n\n");
            out.write(prog.name + ".test: " + prog.$private.name + "."
                + testName + ".test\n");
            out.write(testName + ".test," + prog.target.suffix + ": "
                + prog.$private.name + "." + testName + ".test\n");
            out.write(prog.$private.name + "." + testName + ".test:: "
                + prog.$private.name + "\n");
//            out.write(prog.$private.name + "." + testName + ".test:: "
//                + " override _PROGNAME=" + prog.$private.name + "\n");
        }
        else {
            out.write(prog.name + ".test test," + prog.target.suffix 
                + " test: " + testName + ".test\n\n");

            /* do a recursive make to ensure we have up to date exec command */
            out.write(testName + ".test:: " + prog.$private.name + "\n");
//            out.write(testName + ".test::  override _PROGNAME="
//                + prog.$private.name + "\n");
        }
        out.write("ifeq (,$(_TESTLEVEL))\n");
        /*  we use xdc.mak in lieu of package.mak, because we need the
         *  definition of pkgsearch() in xdc.mak; perhaps a better solution
         *  would be to factor out the definitions into a xdc_defs.mak file
         *  that can be named here in lieu of xdc.mak?
         */
        out.write("\t@$(MAKE) -R -r --no-print-directory -f $(XDCROOT)/packages/xdc/bld/xdc.mak _TESTLEVEL=1 ");
        if (testName != prog.$private.name) {
            out.write(prog.$private.name + "." + testName + ".test\n");
        }
        else {
            out.write(testName + ".test\n");
        }
        out.write("else\n");
        out.write(testCmds[testName]);
        out.write("endif\n\n");
    }

    /* If there is a temporary output file that wasn't removed because
     * it was different from the standard output, the temporary file must
     * be removed when the package is cleaned. 
     */
    out.write("clean," + prog.target.suffix + "::\n\t-$(RM) $(wildcard "
        + tmpOutputPrefix + ",*)\n\n");
}

/*
 *  ======== _escapeFilename ========
 *  Apply all the standard tricks to make sure a filename retains its meaning
 *  in the makefile. In particular treat spaces and backslashes.
 */
function _escapeFilename(filename)
{
    return filename.replace(/\\/g, "/").replace(/ /g, "\\ ");
}

/*
 *  ======== _findReleaseArchive ========
 *  Find specified release archive file
 *
 *  Release archives are not always located relative to the
 *  package installation directory.  So we look for the archive
 *  in alternate locations.
 */
function _findReleaseArchive(pkg, repository)
{
    /* first look for archive relative to its installed base */
    var relFile = xdc.getPackageBase(pkg.name) + pkg.rname;

    /* if we shouldn't search, we're done: we assume the archive will exist */
    if (repository.attrs.search != true) {
        return (relFile);
    }

    if (!java.io.File(relFile).exists()) {
        relFile = null;

        /* second look for archive along archPath (if defined) */
        var archPath = repository.$private.archivePath;
        if (archPath != null) {
            var suffix = pkg.fname.substring(
                pkg.fname.lastIndexOf(pkg.rdesc.name));

            //print("    searching for " + suffix + " in '" + archPath + "'");
            relFile = utils.findFile(suffix, archPath, ';');
        }
    }

    //if (relFile != null) {
    //    print("found " + pkg.name + " archive: " + relFile);
    //}
    //print("    rname     : " + pkg.rname);
    //print("    fname     : " + pkg.fname);
    //print("    desc.name : " + pkg.rdesc.name);
    //
    //print("    desc.aname: " + pkg.rdesc.aname);
    //print("    desc.label: " + pkg.rdesc.label);

    return (relFile);
}

/*
 *  ======== _findReleaseBase ========
 *  Find the package base of an installed released package
 */
function _findReleaseBase(pkg)
{
    var result = null;

    var relXmlFile = pkg.name.replace(/\./g, '/') + "/package/package.rel.xml";
    relXmlFile = xdc.findFile(relXmlFile);
    if (relXmlFile != null) {
        /* verify that the pkg on the package path is the desired release */
        var line;
        var file = new java.io.BufferedReader(
            new java.io.FileReader(relXmlFile));
        while ((line = file.readLine()) != null) {
            var tokens = String(line).match(
                /<release name="([^"]+).*label="([^"]+)/);
            if (tokens != null) {
                if (tokens[1] == pkg.rdesc.name
                    && tokens[2] == pkg.rdesc.label) {
                    result = xdc.getPackageBase(pkg.name);
                    //print("found " + pkg.name + " '" + pkg.rdesc.label
                    //      + "' release: " + result);
                }

                break;
            }
        }
        file.close();
    }

    /* remove trailing '/' because GNU make on Windows does not 
     * recognize "c:/foo/" as being the same as "c:/foo" 
     */
    return (result.replace(/\/$/, "")); 
}
/*
 *  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:16; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

