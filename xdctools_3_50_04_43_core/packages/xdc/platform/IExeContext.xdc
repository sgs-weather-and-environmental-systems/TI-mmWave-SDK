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
 *  ======== IExeContext.xdc ========
 */
package xdc.platform;

/*!
 *  ======== IExeContext ========
 *  Execution environment interface between a platform and an executable
 *
 *  This interface describes the execution environment provided by a
 *  platform as seen by an executable on a particular CPU at the time 
 *  it is loaded.
 *
 *  Execution contexts are created by platforms via
 *  `{@link xdc.platform.IPlatform#getExeContext()}`.  Execution contexts are
 *  created implicitly just prior to executing a program's configuration
 *  script.  This execution context is made available to the configuration
 *  script as the global read-only `Program.cpu` configuration parameter;
 *  see `{@link xdc.cfg.Program}`.
 */
metaonly interface IExeContext
{
    /*!
     *  ======== Cpu ========
     *  CPU attributes necessary to create an execution context.
     *
     *  Attributes that uniquely identify the CPU responsible for executing
     *  an executable image.
     */
    struct Cpu {
	string	    id;		    /*! unique id within the platform */
	string	    catalogName;    /*! name of catalog package */
	string	    deviceName;	    /*! module name within catalog package */
	string	    revision;	    /*! revision of specified device */
	float	    clockRate;	    /*! clock rate in MHz of CPU on board */
    };
    
instance:
    /*!
     *  ======== id ========
     *  The CPU's unique id within the platform
     *
     *  This id is the string used to identify a specific CPU within
     *  the platform that provides this execution context.
     *
     *  @a(readonly) This parameter is set by the platform and is readonly 
     *  for configuration scripts.
     */
    config string id;

    /*!
     *  ======== catalogName ========
     *  The name of the package containing the module named by deviceName
     *
     *  This string names a package containing one or more modules that
     *  implements the `{@link xdc.platform.ICpuDataSheet}` interface.
     *
     *  @a(readonly) This parameter is set by the platform and is readonly for
     *  configuration scripts.
     */
    config string catalogName;

    /*!
     *  ======== deviceName ========
     *  The name of a CPU device within the catalog package catalogName
     *
     *  This string names a module in the catalog package, specified by
     *  catalogName, that represents the CPU that runs the executable; i.e.,
     *  it implements the `{@link xdc.platform.ICpuDataSheet}` interface.
     */
    config string deviceName;

    /*!
     *  ======== revision ========
     *  The revision of the CPU
     *
     *  @a(readonly) This parameter is set by the platform and is readonly for
     *  configuration scripts.
     */
    config string revision = "";

    /*!
     *  ======== clockRate ========
     *  The clock rate in MHz of the CPU
     *
     *  @a(readonly) This parameter is set by the platform and is readonly for
     *  configuration scripts.
     */
    config float clockRate;

    /*!
     *  ======== board ========
     *  The board-level attributes
     *
     *  This parameter defines the static attributes of the board
     *  containing the CPU that runs the executable.
     *
     *  @a(readonly) This parameter is set by the platform and is readonly for
     *  configuration scripts.
     */
    readonly config IPlatform.Board board;
    
    /*!
     *  ======== attrs ========
     *  The CPU "data-sheet" attributes
     *
     *  This "data sheet" allows one to get information about the CPU that
     *  runs the run the executable associated with this execution context.
     *
     *  Multi-CPU platforms provide multiple execution contexts; each
     *  context is associated with a single CPU on the platform.
     *
     *  @a(readonly) This parameter is set by the platform and is readonly for
     *  configuration scripts.
     */
    config ICpuDataSheet.Instance attrs;

    /*!
     *  ======== memoryMap ========
     *  The memory map seen by executables at the time they are loaded
     *
     *  @a(readonly) This parameter is set by the platform and is readonly for
     *  configuration scripts.
     */
    config IPlatform.Memory memoryMap[string];
};
/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

