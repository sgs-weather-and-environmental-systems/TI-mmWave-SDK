# 
#  Copyright (c) 2008 Texas Instruments and others.
#  All rights reserved. This program and the accompanying materials
#  are made available under the terms of the Eclipse Public License v1.0
#  which accompanies this distribution, and is available at
#  http://www.eclipse.org/legal/epl-v10.html
# 
#  Contributors:
#      Texas Instruments - initial implementation
# 
# */

#
#  ======== xdc_rules.mak  ========
#  Iliad rules makefile.  This makefile is included in all Iliad builds.
#  It defines rules for generating, compiling, and packaging Iliad
#  packages.
#
#  This makefile requires the following macros to be defined:
#	XDCROOT		- iliad installation directory
#	findfile	- find file along specified path (see xdc.mak)
#
#  The following macros are optionally defined:
#	CLASSPATH	- defaults to "antlr.jar;js.jar"
#	XDCTOOLS_JAVA_HOME - $(XDCROOT)/jre
#
#	MK_RCMOPTS	- optional xs arguments passed to the release 
#			  post-processing tool.
#
#	MK_RELOPTS	- optional xs arguments passed to the release 
#			  generation tool.
#			    -f force creation of release even if there
#                              are compatibility problems; compatibility
#			       messages are always displayed but the release
#                              is normally not built with failures.
#
#			    -v verbose output during processing; e.g., 
#			       display the set of "built with" packages and
#                              their versions
#
#	MK_BLDOPTS	- optional xs arguments passed to the makefile
#			  generation tool; e.g., 
#			    -Dtconf.shell.options.profile=<num>
#			  	where <num> is a "profile threshold", i.e., 
#				when <num> instructions are executed record
#				file and line number data.
#
#			    -Dtconf.shell.options.opt=<num>
#				where <num> is 
#				    -2		use interpreter but don't
#						monitor call stack
#				    -1		use interpreter with full
#						stack trace back capability
#				    0 ... 9	compile to Java byte code
#
#	MK_IDLOPTS	- optional arguments passed to IDL parser
#				-w emit warnings
#				-s strict enforcement of language rules
#
#  It also assumes that all host OS commands are defined as macros
#  so that this makefile is portable to any host OS (Windows, UNIX).
#  For example, MV is defined to be the host OS command to move a 
#  file.
#
MK_RELOPTS ?=
MK_RCMOPTS ?=
MK_BLDOPTS ?= 
MK_IDLOPTS ?=

MK_FIXLISTOPTS ?=

#
#  Define defaults for user modifiable package path, set of targets,
#  and build script args. 
#
#	XDCPATH	    the user supplied package path; either on the
#		    command line or via an environment variable
#
#	XDCTARGETS  the complete set of targets to use when populating
#		    the build domain's "Build.targets" array
#
#	XDCARGS	    arguments passed to the package's build script;
#		    accessed via the global "arguments" array
#
#	XDCOPTIONS  options that affect output messages but never the
#		    package bits actually generated.
#			-d  debug makefile generation
#			-g  graphical debug of makefile generation
#			-v  show all commands as they are executed
#			-t  don't display date timestamps in banners
#			-q  don't display any banners in multi-package builds
#			-qq same as -q but also don't display $(MSG) progress
#			    messages from individual package builds
#
export XDCTARGETS ?= 
export XDCARGS ?=
override XDCPATH := $(subst \,/,$(XDCPATH))
export XDCPATH

#
#  Define defaults for user modifiable test options
#
#      XDCTEST_OPTIONS options that affect test output messages but never the
#		       package bits actually generated.  These options only
#		       affect output if a reference output file is supplied
#		       as part of the test.
#			   -b  don't display "running ..." banners
#			   -q  don't display test output
#
XDCTEST_OPTIONS ?= -q -b
XDCTEST.REDIRECT = $(if $(findstring q,$(XDCTEST_OPTIONS)),>,| $(TEE))
XDCTEST.MSG      = $(if $(findstring b,$(XDCTEST_OPTIONS)),:,$(MSG))

#
#  Look for Iliad jar, include, and etc directories 
#
JARPATH := $(XDCROOT)/../../lib $(XDCROOT) $(XDCROOT)/etc $(XDCROOT)/../lib 
INCPATH := $(XDCROOT) $(XDCROOT)/include $(XDCROOT)/../include
ETCPATH := $(XDCROOT) $(XDCROOT)/etc $(XDCROOT)/../etc/iliad

SHELF   := $(XDCROOT)/packages/xdc/shelf/java

#
#  Define default values for CLASSPATH and XDCTOOLS_JAVA_HOME for Iliad Java
#  tools
#
CLASSPATH ?= $(SHELF)/antlr.jar;$(SHELF)/js.jar
ifneq (Windows,$(HOSTOS))
    CLASSPATH := $(subst ;,:,$(CLASSPATH))
endif
export CLASSPATH

XDCTOOLS_JAVA_HOME ?= $(XDCROOT)/jre

#
#  Computed package directories; the following variables are computed during
#  makefile generation:
#
#	PKGROOT	    root directory of the "current package" expressed as
#		    (../)^n, where n is the number of components in the
#		    package's name.
#
#	PKGDIR	    name of the current package's directory starting
#		    from $(PKGROOT).
#
PKGROOT := $(shell $(PKGTOP) .)
PKGDIR ?= $*

#
# If XDCPATH contains a space character, convert the path to Windows 8.3
#
ifneq ($(findstring $(space),$(XDCPATH)),)
    ifeq (Windows,$(HOSTOS))
        override XDCPATH := $(shell "$(XDCROOT)/packages/xdc/services/io/release/path2dos.exe" "$(XDCPATH)")
    else
        $(error The macro XDCPATH must not contain any spaces in pathnames)
    endif
endif
export XDCPATH

#
#  XDC Package Path variables
#
#	PKGPATHSUFFIX	the "system" package directories appended to
#		        the PKGPATH; i.e., $(XDCROOT)/package;$(PKGROOT)
#
#	PKGPATH		the complete XDC package path.  Defined as:
#				$(XDCPATH);$(PKGPATHSUFFIX)
#			or, if packagePath is specified in the build script
#				packagePath;$(PKGPATHSUFFIX)
#
#	XPKGPATH	the complete XDC package path with any embedded '^'
#			tokens expanded as $(PKGROOT)
#
#	XPKGVPATH	the expanded XDC package path (XPKGPATH) with all
#			embedded ';' tokens expanded as $(space).  This
#			macro is used in generated makfiles to set vpath on
#			specific files.
#
#  Note PKGPATH *must* include $(XDCROOT)/packages here to allow 
#  building the makefiles (where PKGPATH will be redefined).
#
override PKGPATHSUFFIX = $(XDCROOT)/packages;$(PKGROOT)
export PKGPATH  = $(if $(XDCPATH),$(XDCPATH);$(PKGPATHSUFFIX),$(PKGPATHSUFFIX))

# PKGPATH must not have separators (semicolons) at the beginning, at the end
# or next to each other. The code that creates '-I' switches, and possibly
# some other functions, rely on this variable to have a correct content
export PKGPATH := $(subst ;;,;,$(PKGPATH))
export PKGPATH := $(patsubst ;%,%,$(PKGPATH))
export PKGPATH := $(patsubst %;,%,$(PKGPATH))

XPKGPATH = $(subst ^,$(PKGROOT),$(PKGPATH))

XPKGVPATH = $(subst ;,$(space),$(XPKGPATH))

#
#  Define DSP independent commands
#

#JOPTS ?= -cp "$(CLASSPATH)" -Dxdc.path="$(PKGPATH)"
JAVA = $(XDCTOOLS_JAVA_HOME)/bin/java

#
#  DSP Independent Target rules
#

#
#  Define target 'all' here so that the default make target is 'all'; if
#  make is invoked with no arguments, it builds for the first explicit 
#  target that does not begin with a "."
#
.PHONY: all
all: .executables
	@$(MSG) all files complete.

.docs .libraries: .interfaces
.dlls: .libraries
.executables: .libraries .dlls

.executables .dlls .libraries .interfaces .docs:
	@$(RM) $@
	@$(TOUCH) $@

.PHONY: release
release: all

.PHONY: .make
.interfaces: package.mak
.make: package.mak
	@$(MSG) makefiles are up to date.

.PHONY: .debug .help
.debug::
	-@$(MSG) SHELL = $(SHELL)
	-@$(MSG) SHELL origin = $(origin SHELL)
	-@$(MSG) PATH = '$(PATH)'
	-@$(MSG) PWD = $(shell $(PWD))
	-@$(MSG) CMD = $(CMD)
	-@$(MSG) HOSTOS = $(HOSTOS)
	-@$(MSG) MAKEFLAGS = '$(MAKEFLAGS)'
	-@$(MSG) MAKELEVEL = '$(MAKELEVEL)'
	-@$(MSG) CLASSPATH = '$(CLASSPATH)'
	-@$(MSG) PKGPATH = '$(PKGPATH)'
	-@$(MSG) XDCPATH = '$(XDCPATH)'
	-@$(MSG) XPKGPATH = '$(XPKGPATH)'
	-@$(MSG) XDCBUILDCFG = '$(XDCBUILDCFG)'
	-@$(MSG) XDCOPTIONS = '$(XDCOPTIONS)'
	-@$(MSG) XDCTARGETS = '$(XDCTARGETS)'
	-@$(MSG) XDCARGS = '$(XDCARGS)'
	-@$(MSG) PKGROOT = '$(PKGROOT)'
	-@$(MSG) PKGDIR = '$(PKGDIR)'
	-@$(MSG) TOOLS = '$(TOOLS)'

.help::
	@$(ECHO) "xdc              -- builds all package files"
	@$(ECHO) "xdc all          -- builds all package files"
	@$(ECHO) "xdc clean        -- removes all generated files"
	@$(ECHO) "xdc release      -- builds all release archives"
	@$(ECHO) "xdc test         -- builds and runs all tests"
	@$(ECHO) "xdc .make        -- builds just the makefiles"
	@$(ECHO) "xdc .interfaces  -- builds all headers and schema files"
	@$(ECHO) "xdc .docs        -- builds documentation files"
	@$(ECHO) "xdc .executables -- builds all executables "
	@$(ECHO) "xdc .dlls        -- builds all DLLs"
	@$(ECHO) "xdc --help       -- output make command options"
	@$(ECHO) "xdc -help        -- output xdc command options"

#
# Define the configuation and build commands
#
IMPORTPATH = .;$(XPKGPATH);$(XDCROOT);$(XDCROOT)/etc
JSENV = -Dxdc.path="$(PKGPATH)" -Dxdc.root=$(XDCROOT) -Dxdc.hostOS=$(HOSTOS) -Dconfig.importPath="$(IMPORTPATH)" -Dxdc.bld.targets="$(XDCTARGETS)" -DTOOLS=$(TOOLS) 

#
# repeat definition of XS here to allow "xdc -ra" to use previous xdc.mak (that
# does not define this macro) and new xdc_rules.mak
#
XS     ?= $(XDCROOT)/xs

CONFIG  = $(XS) $(JSENV)
BUILD   = $(XS) $(if $(findstring g,$(XDCOPTIONS)),-g) $(JSENV) $(MK_BLDOPTS) -f $(XDCROOT)/packages/xdc/bld/bld.js
RCMTOOL = $(XS) $(JSENV) $(MK_RCMOPTS) -f $(XDCROOT)/packages/xdc/bld/rcl.js 
XSRUN	= $(XS) $(JSENV)

#
#  Locate the user's build configuration file along the IMPORTPATH.
#
BUILDCFGS = config.bld
ifdef XDCBUILDCFG
    ifeq (environment,$(findstring environment,$(origin XDCBUILDCFG):$(if $(XDCBUILDCFG),,environment)))
        ifneq (,$(wildcard ./config.bld))
            override XDCBUILDCFG := ./config.bld
        endif
    endif
    override XDCBUILDCFG := $(subst \,/,$(XDCBUILDCFG))
    export XDCBUILDCFG
else
    export XDCBUILDCFG := $(firstword $(call findfiles,$(BUILDCFGS),$(subst ;,$(space),$(IMPORTPATH))))
endif

ifeq (Windows,$(HOSTOS))
    override XDCBUILDCFG := $(shell "$(XDCROOT)/packages/xdc/services/io/release/path2dos.exe" "$(XDCBUILDCFG)")
endif

ifeq (,$(wildcard $(XDCBUILDCFG)))
    $(error Error: Specified build configuration file '$(XDCBUILDCFG)' is not found)
endif

#
#  define PKGBLD so package.bld can be overridden on the command line
#
PKGBLD = package.bld

XDCENV = .xdcenv.mak

#
#  Define how to make the package makefile.  
#
#  Note: during clean, we take special actions so that we can cleanup
#  anything defined in the old package.mak before creating a new
#  package.mak; otherwise changes in package.mak followed by a clean 
#  would potentially not clean out previously created goals, for example.
#
#  In addition, we create an empty package.mak *and* .xdcenv.mak.  This 
#  is necessary because we include these files in xdc.mak (thus, make will 
#  try to create them and reload them) and the clean above deletes these 
#  files.  If we don't create .xdcenv.mak here, make will create it *after* 
#  we create package.mak and this will get make into an infinite loop of 
#  trying to create an up-to-date package.mak.  Alternatively, we can just
#  not delete .xdcenv.mak during a clean, but this approach seems "safer"; 
#  someone might add the remove of .xdcenv.mak later and inadvertently
#  re-create this problem.
#
#  The wacky logic regarding $(wildcard package) exists to support the use
#  case of providing an "in-place rebuildable released binary package".  In
#  this case, the package has no package.mak but does have a package.bld and
#  a ./package.  Typing "xdc clean" should trigger a rebuild
#  of package.mak which will (hopefully) remove ./package and any other
#  pre-built artifacts.  It would be better to use package/package.rel.xml, 
#  since package.rel.xml will never be rebuilt in this location so subsequent
#  cleans can't trigger a re-build, but we can't use $(wildcard) on files
#  in directories that we may want to remove on Windows because GNU make's
#  directory cache keeps the directory open and Windows prevents removal
#  of open files/directories.
#

package.mak: $(PKGBLD) package.xdc $(XDCROOT)/packages/xdc/bld/bld.js $(XDCBUILDCFG) $(XDCENV)
    ifneq (clean,$(MAKECMDGOALS))
	@$(MSG) making $@ "(because of $(firstword $?))" ...
	@$(RM) $@
	$(BUILD) $(XDCBUILDCFG) $< $@ $(XDCARGS)
    else
      ifneq (,$(wildcard package.mak))
       ifeq (0,$(MAKELEVEL))
	@$(MSG) using out-of-date package.mak to clean ...
	@"$(MAKE)" -r -R --no-print-directory -f "$(XDCROOT)/packages/xdc/bld/xdc.mak" XDCROOT="$(XDCROOT)" clean
	$(TOUCH) .xdcenv.mak
	@$(RM) $@
	$(TOUCH) $@
       endif
      else
       ifneq (,$(wildcard package))
	@$(MSG) making $@ "(because of $(firstword $?))" in order to clean ...
	$(BUILD) $(XDCBUILDCFG) $< $@ $(XDCARGS)
       endif
      endif
    endif

$(PKGBLD):
	@$(error The directory $(dir $(abspath $@)) does not contain a \
	buildable package. The package build script $@ is missing)

package.xdc:
	@$(error The directory $(dir $(abspath $@)) does not contain a \
	buildable package. The package specification file $@ is missing)

#
#  Define how to make the build environment variables file; these 
#  variables affect the generation of package.mak.  By making package.mak
#  depend on this file, we can ensure that changes to environment
#  variables that affect the generation of package.mak cause the 
#  re-generation of package.mak.  By updating this file only when its
#  contents change, package.mak is not unnecessarily re-made.  
#
.xdcenv.mak: .force
	@$(SAVENV) $(if $(findstring d,$(XDCOPTIONS)),-d) $@

#
#  The build count is incremented every time the make target 'release' is
#  made. 
release:
	$(SAVENV) $(if $(findstring d,$(XDCOPTIONS)),-d) -i .xdcenv.mak

#
#  Define rule to create package archives
#
#  Usage: $(call MKREL mname,dname,rclname)
#	Params:
#	    mname	top-level manifest name (may include references 
#			to other .inc files that need to be expanded)
#	    dname	name of dependency file to generate; dependencies 
#			are of the form:
#			    $@: file ...
#	    rclname	name of the rcl script to post-process the files in 
#			this release; if this is empty, the files listed in 
#			the manifest are added to the release tar file without 
#			modification.
#           rclargs	optional arguments to rcl script
#	    $@		compressed archive name; so $(patsubst %.gz,%,$@) is
#			the uncompressed archive name
#
#  Note: we touch package.rel.xml to "timestamp" the archive; rather than
#  looking at the date of the archive itself (which may inadvertently be
#  changed during a copy) one can rely on the date of package.rel.xml to
#  determine the creation date of the release.
#
define MKRELTAR 

$(RM) $1.manifest
$(RM) $(patsubst %.gz,%,$@)
$(FIXLIST) $(MK_FIXLISTOPTS) -Xi $1 $(PKGDIR) $1.manifest $(patsubst %.gz,%,$@) $2
$(if $3,$(RCMTOOL) $(strip $1).manifest $(patsubst %.gz,%,$@) $(patsubst %.dep,%.rcl.dep,$2) $3 $4, cd $(PKGROOT);$(TAR) cf $(PKGDIR)/$(patsubst %.gz,%,$@) --no-recursion -T $(PKGDIR)/$(strip $1).manifest)
$(TOUCH) $(patsubst %.xdc.inc,%,$1)/$(PKGDIR)/package/package.rel.xml
$(TAR) uf $(patsubst %.gz,%,$@) -C $(patsubst %.xdc.inc,%,$1) $(PKGDIR)/package/package.rel.xml
$(if $(patsubst %.gz,,$@),:,$(GZIP) $(patsubst %.gz,%,$@);$(TOUCH) $@)

endef

cdback = $(subst $(space),,$(foreach dir,$(subst /, ,$1),../))

ZIPOPTS = -q -r
ifneq (Windows,$(HOSTOS))
    ZIPOPTS = -q -y -r
endif

define MKRELZIP

$(RM) $1.manifest
$(RM) $@
$(FIXLIST) -z $(MK_FIXLISTOPTS) -Xi $1 $(PKGDIR) $1.manifest $@ $2
$(if $3,$(RCMTOOL) $(strip $1).manifest $@ $(patsubst %.dep,%.rcl.dep,$2) $3 $4,
cd $(PKGROOT);$(ZIP) $(PKGDIR)/$@ $(ZIPOPTS) . -i@$(PKGDIR)/$(strip $1).manifest)
$(TOUCH) $(patsubst %.xdc.inc,%,$1)/$(PKGDIR)/package/package.rel.xml
cd $(patsubst %.xdc.inc,%,$1); $(ZIP) $(call cdback,$(patsubst %.xdc.inc,%,$1))$@ -q -u $(PKGDIR)/package/package.rel.xml

endef

#
#  Define generic clean rules (so they don't have to be generated)
#	
PHONY: clean .clean
.clean:
	-@$(RM) .executables .dlls .libraries .interfaces .docs
	-@$(RM) __all__.asm
	-@$(RM) package.mak

clean:: .clean

#
#  Define generic vpath rules for file "known" to be in packages
#
#vpath %.xdc $(XPKGVPATH)

#
#  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:17; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
#

