# 
#  Copyright (c) 2008-2015 Texas Instruments Incorporated
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
#  ======== xdc.mak ========
#  Top-level makefile for making individual XDC packages.  See xdc_top.mak
#  for top-level make file for multi-package builds.
#
#  This file includes three other make files: 
#	TOOLS 		- this file defines the location of the Java Runtime
#			  Environment (JRE), the Java CLASSPATH, and numerous 
#			  file utilities required by the XDC makefiles.  This
#			  file may be modified to adapt the build system to
#			  your environment.
#
#	xdc_rules.mak	- this file defines the rules for making XDC 
#			  packages and programs and should not be modified.
#
#	package.mak	- this file is generated from package.bld, the 
#			  package's "build script".
#
#  This file contains heuristics for finding the first two files (package.bld
#  must be in the current working directory) and defines several macros that
#  make the included makefiles simpler and host OS independent.  In
#  particular, this file defines the following:
#
#	HOSTOS		- equals "Windows", "Linux" or "MacOS"
#	PATHCHAR	- equals ';' for Windows systems and ':' otherwise
#			  systems.
#	_PATH		- the initial value of the PATH environment variable
#			  this allows one to redefine PATH (for specific
#			  goals) in terms of the path defined by the user
#	CP		- copy file (preserve time and permissions)
#	ECHO		- output a message to stdout
#	GZIP		- GNU zip command
#	MSG		- output a message to stdout prefixed with '#' if
#			  commands are also being output; otherwise act as
#			  echo
#	MKDIR		- create directory
#	MV		- move (rename) file command
#	PWD		- echo current working directory
#	RM		- forcefully remove file command
#	RMDIR		- remove directory and its contents
#	TOUCH		- update file timestamp
#	TAR		- UNIX tar command
#	TEE		- UNIX tee command
#
#  In addition, there are a few custom commands created to facilitate
#  the creation of portable makefiles.
#
#	CMP		- similar to cmp but doesn't suport -l option and,
#			  in the future, may support XDC specific options
#
#	CMV		- similar to mv but doesn't update timestamp of
#			  destination if file contents are identical.
#
#	SAVENV		- dumps xdc environment variables that can affect
#			  the generated makefile; this tool is purely an
#			  optimization to reduce the overhead of checking
#			  to see if package.mak needs to be remade from
#			  within make.
#
#	SETDATE		- "touch-like" utility used to update file timestamps
#			  to suit the needs of make
#
#	PKGTOP		- return the package's top; ../^n where n is the
#			  number of components in it's name
#
#	FIXDEP		- post-process generated dependency files to add
#			  empty rules for dependencies that are outside
#			  the current package.
#
#	FIXLIST		- post-process generated zip/tar include files
#
#	XDCCPP		- copy a package
#
#	XDCRMP		- remove a package (but not any nested packages)
#
#	MKDEP		- generate dependencies from input source file.
#			  this should only be used in the event that the
#			  compiler does not support this capability
#			  directly; MKDEP may generate dependencies that
#			  are unnecessary (due to #ifdefs in the code)
#
#	XDC		- the xdc command itself; so custom makefiles
#			  can recursively call xdc portably.

#
#  Disable parallel builds in case the generated rules are broken
#
#.NOTPARALLEL:

#
#  Automatically remove targets whose commands fail
#
.DELETE_ON_ERROR:

#
#  remove the environment variable ENV from all commands to prevent shell from
#  sourcing the named file.  This file can only contain user specific settings
#  that should *not* affect the build.
#
unexport ENV

#
#  Include .xdcenv.mak, if it exists; otherwise xdc_rules.mak defines
#  rules for making this file.  This file is used to trigger re-builds if
#  certain environment variables change (e.g., XDCPATH).  It can also be used
#  to override/ignore these environment variables. If the environment variables
#  are overriden, we want to restrict it only to the current XDC instance.
#  Therefore, the variable _USEXDCENV_, which controls overwriting of variables,
#  is not exported to any other XDC instance that could be invoked from within
#  this XDC instance
#
-include .xdcenv.mak
unexport _USEXDCENV_

#
#  Determine host OS (Windows, MacOS, or UNIX)
#
ifeq (,$(HOSTOS))
    ifneq (,$(findstring darwin,$(OSTYPE)))
        HOSTOS := MacOS
    else
        ifeq (,$(findstring :,$(WINDIR)$(windir)$(COMSPEC)$(comspec)))
            HOSTOS := Linux
        else
            HOSTOS := Windows
        endif
    endif
endif

ifeq (Windows,$(HOSTOS))
    PATHCHAR := ;
else
    PATHCHAR := :
endif

#
# Capture the current value of the PATH environment variable so we can use
# it to redefine PATH without creating a recursive definition.
#
_PATH := $(PATH)
unexport _PATH

#
#  ditto for Windows.  In this case, we use cygwin's ash.exe.
#
ifeq (Windows,$(HOSTOS))
    SHELL := $(XDCROOT)/bin/sh.exe
endif

#
#  Convert TOOLS environment variable to OS-independent format
#
TOOLS := $(subst \,/,$(TOOLS))

#
#  Define useful functions:
#	findfile   file,path-	returns full path to file found along a ' ' 
#				separated path.
#	pathsearch exe_list - 	returns full path to each file found along the 
#				path $(PATH).  Multiple files may be specified.
#	drive		    - 	return drive letter from path
#	tocyg		    - 	convert c:/foo/bar names to cygwin names; in
#				this case, to /cygdrive/c/foo/bar
#
#drive = $(firstword $(subst :, ,$1))
#tocyg = $(patsubst $(call drive,$1):/%,/cygdrive/$(call drive,$1)/%,$1)

#
#  Define utility functions to handle spaces in Windows pathnames
#     nospaces path - returns a pathname with all spaces converted to the
#         "?" wildcard character.
#     wildcardspaces paths - wildcard function for use with patterns that
#         may contain or result in spaces. Spaces in the input are represented
#         as "?" wildcard characters. Spaces in each result are converted to
#         "?" characters.
#
nospaces = $(subst $(space),?,$(subst \,/,$(1)))
wildcardspaces = $(foreach pat,$(1),$(call nospaces,$(wildcard $(pat))))

findfile = $(firstword $(wildcard $(addsuffix /$(1),$(2))))
findfiles = $(foreach exe,$(1),$(call findfile,$(exe),$(2)))
pathsearch1 = $(firstword $(call wildcardspaces,$(addsuffix /$(1),$(subst $(PATHCHAR), ,$(call nospaces,$(PATH))))))
pathsearch = $(foreach exe,$(1),$(call pathsearch1,$(exe)))
pkgsearch1 = $(firstword $(wildcard $(addsuffix /$(1),$(subst ;, ,$(XPKGPATH)))))
pkgsearch = $(strip $(foreach pkg,$(1),$(call pkgsearch1,$(pkg))))

comma := ,
empty :=
space := $(empty) $(empty)

#
#  Determine XDCROOT directory (if possible)
#
#  If XDCROOT is not defined but we can find xdc along the PATH, set
#  XDCROOT to `the directory containing xdc`.
#
ifeq ($(origin XDCROOT), undefined)
    tmp := $(call pathsearch,xdc xdc.exe)
    ifeq (,$(tmp))
       $(error The macro XDCROOT must be set to the XDCtools install directory)
    else
       XDCROOT := $(firstword $(dir $(tmp)))
    endif
endif

#
# If XDCROOT contains a space character, convert the path to Windows 8.3
#
ifneq ($(findstring $(space),$(XDCROOT)),)
    ifeq (Windows,$(HOSTOS))
        override XDCROOT := $(shell "$(XDCROOT)/packages/xdc/services/io/release/path2dos.exe" "$(XDCROOT)")
    else
        $(error The XDCtools install directory must not contain any spaces in pathname)
    endif
endif
export XDCROOT

#
#  find TOOLS file and include it
#
_tmp := $(call findfile,TOOLS,$(XDCROOT) $(XDCROOT)/etc)
ifneq (,$(_tmp))
    include $(_tmp)
else
    ifeq (,$(wildcard $(XDCROOT)))
        $(error can't find specified XDCROOT: $(XDCROOT))
    else
        $(error can't find TOOLS file in either $(XDCROOT)/etc or $(XDCROOT))
    endif
endif

#
#  Error check the definition of CLASSPATH.
#
ifeq (0,$(MAKELEVEL))
    ifneq (,$(findstring environment,$(origin CLASSPATH)))
       $(warning CLASSPATH is defined by the environment)
    endif
endif

#
#  If the command shell is not a UNIX shell, we prefix all commands 
#  with the stderr.exe utility.  This is done to allow commands to be
#  specified with forward slashes in the name; DOS shells parse the
#  forward slash as an option to the command even if there is no
#  intervening whitespace!  For example, DOS parses the command 
#  "$(XDCROOT)/bin/rm.exe" as "$(XDCROOT) /bin /rm.exe".  However,
#  stderr properly locates the specified command.  In addition, this
#  utility combines the stderr and stdout output streams pror to 
#  executing  the command.  Thus, it is possible to redirect stderr 
#  from the commands.
#
ifeq (Windows,$(HOSTOS))
    CMD := $(XDCROOT)/bin/stderr.exe
    ifeq (sh.exe,$(SHELL))
       CMD := $(subst /,\,$(CMD))
#       $(warning assuming DOS shell, prefixing all commands with $(CMD))
    endif
else
    CMD :=
endif

#
#  Define host OS dependent but DSP independent commands
#  Note: we use full path to commands we provide; since we don't provide
#  (or need) replacements for UNIX systems, we don't use full paths for the
#  following commands.
#
export CAT   := cat
export CP    := cp -p
export ECHO  := echo
GZIP	     := gzip
export MKDIR := mkdir
export MV    := mv -f
export PWD   := pwd
export SED   := sed
export RM    := rm -f
export RMDIR := rm -rf
export TOUCH := touch

# gzip reads the GZIP environment variable for additional options!!!
unexport GZIP

#
#  We make the following overridable because the names of these 
#  utilities may vary (xs.x86U versus xs, for example).  To change 
#  these utilities set them in the TOOLS file.
#
XDC    ?= $(XDCROOT)/xdc
XS     ?= $(XDCROOT)/xs
XDCCPP ?= $(XDCROOT)/bin/xdccpp
XDCRMP ?= $(XDCROOT)/bin/xdcrmp
CMP    ?= $(XDCROOT)/bin/cmp
TEE    ?= $(XDCROOT)/bin/tee
CMV    ?= $(XDCROOT)/bin/cmv
SAVENV ?= $(XDCROOT)/bin/xdcenv
PKGTOP.opts ?= -t
PKGTOP ?= $(XDCROOT)/bin/xdcdir $(PKGTOP.opts)
FIXDEP ?= $(XDCROOT)/bin/fixdep
SETDATE ?= $(XDCROOT)/bin/setdate
FIXLIST ?= $(XDCROOT)/bin/fixlist
FINDPKGS ?= $(XDCROOT)/bin/xdcpkg
MKDEP  ?= $(XDCROOT)/bin/mkdep
TAR    ?= $(XDCROOT)/bin/tar
ZIP    ?= $(XDCROOT)/bin/zip
UNZIP  ?= $(XDCROOT)/bin/unzip

# This must appear *after* the settings above; unexport seems to "define" 
# the variable (which defeats the conditional set above)
unexport XS CMV CMP TEE SAVEENV PKGTOP FIXDEP FIXLIST FINDPKGS MKDEP TAR XDC ZIP UNZIP XDCCPP XDCRMP

ifeq (Windows,$(HOSTOS))
    ifneq (true,$(XDCUSEPATHFORUTILS))
        ECHO  := $(XDCROOT)/bin/$(ECHO)
        GZIP  := $(XDCROOT)/bin/$(GZIP)
        TOUCH := $(XDCROOT)/bin/$(TOUCH)
        MKDIR := $(XDCROOT)/bin/$(MKDIR)
        RMDIR := $(XDCROOT)/bin/$(RMDIR)
        RM    := $(XDCROOT)/bin/$(RM)
        MV    := $(XDCROOT)/bin/$(MV)
        CP    := $(XDCROOT)/bin/$(CP)
        CAT   := $(XDCROOT)/bin/$(CAT)
        SED   := $(XDCROOT)/bin/$(SED)
        PWD   := $(XDCROOT)/bin/$(PWD)
    endif
    ifeq (sh.exe,$(SHELL))
       ECHO  := $(subst /,\,$(ECHO))
       GZIP  := $(subst /,\,$(GZIP))
       TOUCH := $(subst /,\,$(TOUCH))
       MKDIR := $(subst /,\,$(MKDIR))
       RMDIR := $(subst /,\,$(RMDIR))
       RM    := $(subst /,\,$(RM))
       MV    := $(subst /,\,$(MV))
       CP    := $(subst /,\,$(CP))
       CAT   := $(subst /,\,$(CAT))
       SED   := $(subst /,\,$(SED))
       PWD   := $(subst /,\,$(PWD))

       XS    := $(subst /,\,$(XS))
       CMV   := $(subst /,\,$(CMV))
       CMP   := $(subst /,\,$(CMP))
       TEE   := $(subst /,\,$(TEE))
       SAVENV:= $(subst /,\,$(SAVENV))
       PKGTOP:= $(subst /,\,$(PKGTOP))
       FIXDEP:= $(subst /,\,$(FIXDEP))
       FIXLIST:= $(subst /,\,$(FIXLIST))
       FINDPKGS := $(subst /,\,$(FINDPKGS))
       MKDEP := $(subst /,\,$(MKDEP))
       TAR   := $(subst /,\,$(TAR))
       ZIP   := $(subst /,\,$(ZIP))
       UNZIP := $(subst /,\,$(UNZIP))
       XDC   := $(subst /,\,$(XDC))
       XDCCPP:= $(subst /,\,$(XDCCPP))
       XDCRMP:= $(subst /,\,$(XDCRMP))
    endif
endif
MSG := $(ECHO)

#
#  Define the goal .force to allow one to easily create targets that are 
#  always re-built; any goal that depends on .force will be re-built every
#  time make is run.
#
.PHONY: .force
.force:

#
#  Find xdc_rules.mak and include it
#
master := $(call findfile,xdc_rules.mak,$(XDCROOT)/packages/xdc/bld $(XDCROOT)/etc)
ifneq (,$(master))
    include $(master)
else
    $(error can't find XDC rules makefile xdc_rules.mak)
endif

#
#  Include package.mak, if it exists; otherwise xdc_rules.mak defines 
#  rules for making this file.
#
-include package.mak

#
#  Parse XDCOPTIONS for options that control the build
#
ifeq (,$(findstring v,$(XDCOPTIONS)))
    .SILENT:
else
    MSG := $(ECHO) '\#';$(ECHO) '\#'
endif

ifneq (,$(findstring qq,$(XDCOPTIONS)))
    MSG := :
endif

#
#  Export this by default so xdcenv can get at it
#
export _XDCBUILDCOUNT
#
#  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:17; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
#

