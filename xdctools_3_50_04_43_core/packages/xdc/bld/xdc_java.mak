# 
#  Copyright (c) 2008-2017 Texas Instruments Incorporated
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
#  ======== xdc_java.mak ========
#  Generic rules for making Java jars from java sources contained in 
#  RTSC packages.
#

# JDK is used to identify the javac compiler (and other tools) to use
ifndef JDK
    $(error JDK must be defined to point to a Java Development Kit)
endif
ifneq (,$(findstring v,$(XDCOPTIONS)))
    $(info building with JDK = $(JDK))
endif

# XDCTOOLS_JVM_TARGET specifies the JVM version "targeted" by javac
XDCTOOLS_JVM_TARGET ?= 1.6

#
#  We must also explicitly compile against the specified JVM's boot classes:
#      The Java 2 SDK's javac would also by default compile against its own
#      bootstrap classes, so we need to tell javac to compile against the 
#      target bootstrap classes instead. We do this with -bootclasspath and
#      -extdirs. Failing to do this might allow compilation against a Java 2
#      Platform API that would not be present on the specified VM and fail
#      at runtime. 
#
ifeq (1.6,$(XDCTOOLS_JVM_TARGET))
  # set default for 1.6 for compatibility with XDCtools 3.25 and newer
  ifneq (,$(wildcard $(TOOLS)/vendors/oracle/jdk/jdk1.6.0_34/Linux/jre/lib/rt.jar))
    XDCTOOLS_JVM1.6_BOOTCLASSES ?= $(TOOLS)/vendors/oracle/jdk/jdk1.6.0_34/Linux/jre/lib/rt.jar
  endif
endif

ifndef XDCTOOLS_JVM$(XDCTOOLS_JVM_TARGET)_BOOTCLASSES
    $(error XDCTOOLS_JVM$(XDCTOOLS_JVM_TARGET)_BOOTCLASSES must be defined to point to a $(XDCTOOLS_JVM_TARGET) Java Runtime Environment's rt.jar)
endif

#
# Compute the list of all jars supplied by prerequisite packages (including .)
#
JARS := $(wildcard $(patsubst %,%/java/*.jar,$(shell $(FINDPKGS) -p "$(XPKGPATH)" -d -a .)))

#
# CLASSTOP - directory containing class files (not including the package name)
# CLASSDIR - the full directory where class files are written
#
# Note: PKGDIR and XPKGPATH are defined by package.mak 
#    PKGDIR	the RTSC package name (with '/'s instead of '.'s)
#    XPKGPATH 	the full package path with all ^'s expanded as appropriate
#
CLASSTOP   = java/classes
CLASSDIR   = $(CLASSTOP)/$(PKGDIR)

ifeq (,$(wildcard java))
    $(shell $(MKDIR) java)
endif
ifeq (,$(wildcard $(CLASSTOP)))
    $(shell $(MKDIR) $(CLASSTOP))
endif

#
#  Define Java classpath to include all jars (JARS) followed by RTSC package
#  path
#
JARP := $(if $(JARS),$(subst $(space),$(PATHCHAR),$(JARS))$(PATHCHAR),)
JCPATH = $(subst ;,$(PATHCHAR),$(JARP)$(subst $(space),\$(space),$(XPKGPATH)))

#
#  Rules for building class files and jars ...
#
#  NOTE: This pattern rule should only match jars created in the 
#       current working directory (or below); otherwise, jar dependencies that
#	reference jars in other packages will trigger this jar rule in an
#	attempt to build the prequisite jar!
#
java/%.jar ./%.jar $(call nospaces,CURDIR)/%.jar:
	@$(MSG) making $@ "(from $(PKGDIR))" ...
	"$(JDK)/bin/jar" cf0 $@ -C $(CLASSTOP) ./$(PKGDIR)

$(CLASSDIR)/%.class:%.java 
	@$(MSG) javac $< ...
	"$(JDK)/bin/javac" -source $(XDCTOOLS_JVM_TARGET) -target $(XDCTOOLS_JVM_TARGET) -bootclasspath "$(XDCTOOLS_JVM$(XDCTOOLS_JVM_TARGET)_BOOTCLASSES)" $(JCOPTS) -classpath "$(JCPATH)" -d $(CLASSTOP) $<

clean::
	$(RMDIR) $(CLASSTOP)
#
#  @(#) xdc.bld; 1, 0, 2,0; 11-8-2017 17:10:17; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
#

