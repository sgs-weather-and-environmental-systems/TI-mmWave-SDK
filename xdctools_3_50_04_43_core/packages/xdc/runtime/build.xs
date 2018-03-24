/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved. 
 *  This program and the accompanying materials are made available under the 
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at 
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== build.xs ========
 *  Common capsule whose variables are used in all rts package.bld files
 */

/*
 *  ======== makePrologue ========
 *  prologue used by clients to portably locate xdc.runtime sources
 */
var makePrologue = "vpath %.c $(subst ;,  ,$(XPKGPATH))\nvpath %.cpp $(subst ;,  ,$(XPKGPATH))";

/*
 *  ======== common_objs ========
 *  All the xdc.runtime module sources
 */
var common_objs = [
    "xdc/runtime/Assert.c",
    "xdc/runtime/Core-mem.c",
    "xdc/runtime/Core-smem.c",
    "xdc/runtime/Core-label.c",
    "xdc/runtime/Core-params.c",
    "xdc/runtime/Diags.c",
    "xdc/runtime/Error.c",
    "xdc/runtime/Gate.c",
    "xdc/runtime/GateNull.c",
    "xdc/runtime/HeapMin.c",
    "xdc/runtime/HeapStd.c",
    "xdc/runtime/Log.c",
    "xdc/runtime/LoggerBuf.c",
    "xdc/runtime/LoggerCallback.c",
    "xdc/runtime/LoggerSys.c",
    "xdc/runtime/Memory.c",
    "xdc/runtime/Registry.c",
    "xdc/runtime/Rta.c",
    "xdc/runtime/Startup.c",
    "xdc/runtime/System.c",
    "xdc/runtime/SysCallback.c",
    "xdc/runtime/SysMin.c",
    "xdc/runtime/SysStd.c",
    "xdc/runtime/Text.c",
    "xdc/runtime/Timestamp.c",
    "xdc/runtime/TimestampNull.c",
    "xdc/runtime/TimestampStd.c",
];

/*
 *  ======== cpp_init_objs ========
 *  The C++ files necesssary to "automatically" initialize all modules
 *
 *  This file is used to piggy-back on the C++ initialization sequence to
 *  automatically run Startup_exec() before main().  If xdc.runtime is
 *  being used in a non-C++ environment, you can omit this file and
 *  explicitly call Startup_exec() prior to using any xdc.runtime services.
 */
var cpp_init_objs = [
    "xdc/runtime/xdc_init.cpp"
];

/*
 *  ======== c_init_objs ========
 *  Default implementation of __xdc__init for C-only environments
 *
 *  Since config always references __xdc__init (to trigger automatic
 *  initialization via the C++ initialization sequence), we must define
 *  __xdc__init for C-only environments.  This can be done by the user
 *  (who has to explicitly call Startup_exec()), but having it here makes
 *  this unnecessary.
 */
var c_init_objs = [
    "xdc/runtime/xdc_noinit.c"
];

/*
 *  ======== objs ========
 *  All sources that should be normally be built and included
 */
var objs = common_objs.concat(cpp_init_objs);

/*
 *  ======== c_objs ========
 *  All sources that should be built for C-only environments
 */
var c_objs = common_objs.concat(c_init_objs);
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

