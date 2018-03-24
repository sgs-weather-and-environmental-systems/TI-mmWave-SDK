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
 *  ======== Trace ========
 *  Trace support
 *
 *  This module allows system integrators to selectively enable trace
 *  statements, from within XDCscripts. Trace statements can be selected
 *  based on the file (capsule) and the package in which they are located.
 *  For example, trace statements from file `Mod.xs` in package `myPkgs.pkgA'
 *  can be enabled either with `Trace.capsuleEnable(["myPkgs/pkgA/Mod"])` or
 *  with `Trace.packageEnable(["myPkgs.pkgA"])`.
 *
 *  Trace statements can also belong to groups, strings defined by package
 *  producers when they need to group related trace statements, distributed
 *  across different modules and packages, into trace units that can be
 *  disabled or enabled as a whole. If some of the trace statements from file
 *  `Mod.xs` are tagged to belong to a group "init", the following will
 *  activate them:
 *  @p(code)
 *  Trace.groupEnable(["init"]);
 *  @p
 *
 *  Each trace statement by default belongs to the group "all". To activate
 *  all trace statements:
 *  @p(code)
 *  Trace.setLevel(2);
 *  Trace.groupEnable(["all"]);
 *  @p
 * 
 */
metaonly module Trace {

    typedef String StringArray[];
    
    /*!
     *  ======== level ========
     *  @_nodoc
     *  Select the amount of printed messages
     */
    config Int level = 0;

    /*!
     *  ======== capsules ========
     *  @_nodoc
     *  Array of regular expressions enabling trace in capsules 
     */
    config StringArray capsules = [];

    /*!
     *  ======== packages ========
     *  @_nodoc
     *  Array of regular expressions enabling trace in packages 
     */
    config StringArray packages = [];

    /*!
     *  ======== groups ========
     *  @_nodoc
     *  Array of regular expressions enabling trace in groups 
     */
    config StringArray groups = [];

    /*!
     *  ======== packageLoad ========
     *  Enable trace of loaded packages
     *
     *  This setting enables the messages related to loading packages.
     *  If `true`, whenever a package is loaded, the following info is
     *  displayed:
     *  @p(blist)
     *  - name of a package loading another package
     *  - name of the loaded package
     *  - repository from which the package is being loaded 
     *  @p 
     */
    config Bool packageLoad = false;

    /*!
     *  ======== useModule ========
     *  Enable trace of used modules
     *
     *  This setting enables the messages that inform when the function
     *  `xdc.useModule()` is invoked on a module, and when a module's
     *  `module$use` function is invoked.
     */
    config Bool useModule = false;

    /*!
     *  ======== addSupergroup ========
     *  Add a group that contains other groups
     *
     *  This function allows giving a name to an array of existing 
     *  trace groups.
     *
     *  @param(supergroup)	name of the new group
     *  @param(subgroups)	array of the existing trace groups
     */
    Void addSupergroup(String supergroup, StringArray subgroups);

    /*!
     *  ======== capsuleEnable ========
     *  Enable trace output from selected capsules
     *
     *  Capsules are either XDCscript files or Java source files. The
     *  function parameter is treated as an array of JavaScript
     *  regular expressions, therefore it can contain partial capsule
     *  names.
     *
     *  If this function is invoked repeatedly, each new call replaces
     *  the array of currently enabled capsules with the array supplied
     *  as the parameter. The array of the currently enabled capsules is
     *  returned. If the function is invoked with a zero-length array, it
     *  returns the currently enabled capsules, but it also leaves them
     *  active. Therefore, the sequence of calls that would add new 
     *  capsules instead of replacing the current ones is:
     *  @p(code)
     *  var current = Trace.capsuleEnable([]);
     *  current[current.length++] = "pkg/ModA.xs";
     *  current[current.length++] = "pkg/ModB.xs";
     *  Trace.capsuleEnable(current);
     *  @p
     *
     *  To disable trace for all capsules, the function must be invoked
     *  with an empty string as the only element of the array.
     *  @p(code)
     *  Trace.capsuleEnable([""]);
     *  @p
     *
     *  @param(capsules)	array of capsule names
     *
     *  @a(return)		array of currently enabled capsule names
     */
    StringArray capsuleEnable(StringArray capsules);

    /*!
     *  ======== groupEnable ========
     *  Enable trace output from selected groups
     *
     *  A group is a string defined by package producers when they need to
     *  group related trace statements, distributed across different
     *  modules and packages, into trace units that can be disabled or
     *  enabled as a whole. The function parameter is treated as an array
     *  of JavaScript regular expressions, therefore it can contain partial
     *  group names.
     *
     *  If this function is invoked repeatedly, each new call replaces
     *  the array of currently enabled groups with the array supplied
     *  as the parameter. The array of the currently enabled groups is
     *  returned. If the function is invoked with a zero-length array, it
     *  returns the currently enabled groups, but it also leaves them
     *  active. Therefore, the sequence of calls that would add new groups 
     *  instead of replacing the current ones is:
     *  @p(code)
     *  var current = Trace.groupEnable([]);
     *  current[current.length++] = "libPkgs";
     *  Trace.groupEnable(current);
     *  @p
     *
     *  To disable trace for all groups, the function must be invoked
     *  with an empty string as the only element of the array.
     *  @p(code)
     *  Trace.groupEnable([""]);
     *  @p
     *
     *  @param(groups)	array of groups
     *
     *  @a(return)	array of currently enabled groups
     */
    StringArray groupEnable(StringArray groups);

    /*!
     *  ======== packageEnable ========
     *  Enable trace output from selected packages
     *
     *  Packages that can be enabled through this function are RTSC
     *  packages and Java packages. The function parameter is treated as
     *  an array of JavaScript regular expressions, therefore it can
     *  contain partial package names.
     *
     *  If this function is invoked repeatedly, each new call replaces
     *  the array of currently enabled packages with the array supplied
     *  as the parameter. The array of the currently enabled packages is
     *  returned. If the function is invoked with a zero-length array, it
     *  returns the currently enabled packages, but it also leaves them
     *  active. Therefore, the sequence of calls that would add new 
     *  packages instead of replacing the current ones is:
     *  @p(code)
     *  var current = Trace.packageEnable([]);
     *  current[current.length++] = "ti.targets";
     *  Trace.packageEnable(current);
     *  @p
     *
     *  To disable trace for all packages, the function must be invoked
     *  with an empty string as the only element of the array.
     *  @p(code)
     *  Trace.packageEnable([""]);
     *  @p
     *
     *  @param(packages)	array of package names
     *
     *  @a(return)		array of currently enabled package names
     */
    StringArray packageEnable(StringArray packages);

    /*!
     *  ======== setLevel ========
     *  Set the verbosity level
     *
     *  This function limits trace output to trace statement tagged with
     *  level equal or lower than this function's parameter. By default,
     *  the verbosity level is set to 0, which is the least verbose level.
     *  The most verbose level is 2.
     */
    Int setLevel(Int level);

    /*!
     *  ======== start ========
     *  @_nodoc
     *  Activate trace
     */
    Void start();
}
/*
 *  @(#) xdc.services.global; 1, 0, 0,0; 11-8-2017 17:11:49; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

