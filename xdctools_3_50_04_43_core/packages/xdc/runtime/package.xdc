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
/*!
 *  ======== xdc.runtime ========
 *  Basic runtime support for RTSC programs
 *
 *  The modules and interfaces in the `xdc.runtime` package form the "core"
 *  RTSC target runtime support library which provides basic system services
 *  required by virtually all applications.
 *
 *  Since this package's services are intended to be available to any
 *  C/C++ client, this package does not contain any pre-compiled libraries.
 *  Instead, this package provides complete sources which are built and
 *  supplied by a target-specific package named by the
 *  `{@link xdc.bld.ITarget#rts rts}` parameter of the target used to build
 *  the client sources.  This "indirection" make it possible for new targets
 *  to be added by interested parties whithout ever having to update this
 *  package.
 *
 *  The functionality provided by this package can be roughly partitioned
 *  into four categories:
 *  @p(nlist)
 *      - Diagnostics and Logs
 *      - Memory Management
 *      - Concurrency Support
 *      - Startup and Shutdown
 *  @p
 *  @a(Diagnostics and Logs)
 *  This package provides for diagnostics with a set of modules that operate
 *  together to configure and implement diagnostics.
 *
 *  The modules can be partitioned into three groups: modules that
 *  generate events, a module that allows precise control over when
 *  (or if) various events are generated, and modules that manage the
 *  output or display of the events.
 *
 *  `{@link Assert}`, `{@link Error}`, and `{@link Log}` provide methods that
 *  are added to source code and generate events. The `{@link Diags}` module
 *  provides both configuration and runtime methods to selectively enable or
 *  disable different types of events on a per module basis. Finally,
 *  `{@link LoggerBuf}`, `{@link LoggerSys}` and `{@link LoggerCallback}` are 
 *  simple alternative implementations of the `{@link ILogger}` event "handler"
 *  interface. You can provide more sophisticated or platform-specific
 *  implementations of `ILogger` without making any changes to code that
 *  uses `Assert`, `Log`, `Error`, or `Diags`.
 *
 *  The diagnostics and logger modules include the following:
 *  @p(blist)
 *  - `{@link Assert}`         - Add integrity checks to the code.
 *  - `{@link Diags}`          - Manage a module's diagnostics mask.
 *  - `{@link Error}`          - Raise error events.
 *  - `{@link Log}`            - Generate log events in realtime.
 *  - `{@link LoggerBuf}`      - A logger using a buffer for log events.
 *  - `{@link LoggerCallback}` - A logger using user defined callback function
 *                               for log events.
 *  - `{@link LoggerSys}`      - A logger using printf for log events.
 *  - `{@link Types}`          - Define diagnostics configuration parameters.
 *  - `{@link Timestamp}`      - Simple timestamp service
 *  @p
 *
 *  @a(Memory Management)
 *  The memory management modules include the following:
 *  @p(blist)
 *  - `{@link Memory}`  - module used by clients to allocate and free memory
 *  - `{@link HeapMin}` - Deterministic implementation that minimizes code
 *                        size footprint by not supporting reuse of allocated
 *                        memory.
 *  - `{@link HeapStd}` - Implementation that builds atop ANSI C `malloc()`
 *                        and `free()`
 *  @p
 *
 *  @a(Concurrency Support)
 *  The concurency support modules include the following:
 *  @p(blist)
 *  - `{@link Gate}`     -  module used by clients to serialize access to
 *                          shared data structures
 *  - `{@link GateNull}` - "null" implementation for applications that
 *                         don't need serialization; e.g., single threaded
 *                         applications
 *  @p
 *
 *  @a(Startup and Shutdown)
 *  The system startup and shutdown support modules include:
 *  @p(blist)
 *  - `{@link Reset}`       - Manages platform-specific startup initialization
 *                            before `main()` is called
 *  - `{@link Startup}`     - Manages "portable" startup initialization before
 *                            `main()` is called
 *  - `{@link System}`      - In addition to other basic services (such as
 *                            `printf`), this module provides an `atexit`
 *                            capability that allows modules to cleanly exit
 *                            during normal application terminiation.
 *  - `{@link SysCallback}` - Implementation of `{@link ISystemSupport}`
 *                            that calls back user defined functions.
 *  - `{@link SysMin}`      - Minimal implementation of `{@link ISystemSupport}`
 *                            required by the `System` module, suitable for
 *                            deeply embedded applications.
 *  - `{@link SysStd}`      - Implementation of `{@link ISystemSupport}`
 *                            that relies on ANSI C Standard I/O Library
 *                            functions.
 *  @p
 */
package xdc.runtime [2, 1, 0] {
    interface IModule, IInstance;
    interface IHeap, ILogger, IFilterLogger;
    interface ISystemSupport;
    interface IGateProvider;
    interface ITimestampClient, ITimestampProvider;
    module Assert;
    module Core;
    module Defaults;
    module Diags;
    module Error;
    module Gate, GateNull;
    module Log, LoggerBuf, LoggerCallback, LoggerSys;
    module Main;
    module Memory, HeapMin, HeapStd;
    module Registry;
    module Rta;
    module Startup, Reset;
    module System, SysCallback, SysMin, SysStd;
    module Text;
    module Timestamp, TimestampNull, TimestampStd;
    module Types;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

