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
 *  ======== Utils.xdc ========
 */

package xdc.platform;

/*!
 *  ======== Utils ========
 *  Misc platform utilities
 */
metaonly module Utils
{
    /*!
     *  ======== addPeripheralsMap ========
     *  Create a map of all peripherals available on a device.
     *
     *  The config parameter `peripherals` is by default undefined in an
     *  `{@link xdc.platform.ICpuDataSheet}` instance. This function gathers
     *  all instance configuration parameters that are of the type
     *  `{@link xdc.platform.IPeripheral}` into the map `peripherals`.
     *
     *  @param(cds)	an `{@link xdc.platform.ICpuDataSheet}` instance
     *
     */
    Void addPeripheralsMap(ICpuDataSheet.Instance cds);

    /*!
     *  ======== assembleMemoryMap ========
     *  Combine the device and the external memory map into a platform map
     *
     *  This function combines memory maps and also applies memory map name
     *  changes requested through renameMap.
     *
     *  @param(cpu)	an `xdc.platform.IExeContext` object
     *
     *  @param(plat) 	a platform instance
     *
     *  @param(noCheck) if true, and a custom memory map is defined, the
     *			function does not check if the custom memory map fits
     *			into the available physical memory
     *
     *	@a(returns)	platform memory map
     */
    function assembleMemoryMap(cpu, plat, noCheck);

    /*!
     *  ======== assemblePeripheralsMap ========
     *  Create a map of all peripherals available on a platform.
     *
     *  The config parameter `peripherals` is by default undefined in an
     *  `{@link xdc.platform.IPlatform}` instance. This function gathers
     *  all peripherals defined in an `{@link xdc.platform.ICpuDataSheet}`
     *  instance available as `{@link xdc.cfg.Program#cpu.attrs}`, and adds
     *  peripherals defined in this platform instance. By providing a list
     *  of config parameter names, the instance can add only listed 
     *  peripherals instead of adding all available ones.
     *
     *  @param(inst)	an `xdc.platform.IPlatform` instance
     *  @param(cds)	an `xdc.platform.ICpuDataSheet` instance
     *  @param(names)	an optional list of names of `IPeripheral` parameters 
     *
     */
    Void assemblePeripheralsMap(ICpuDataSheet.Instance cds, 
                                  IPlatform.Instance inst, String names[] = []);

    /*!
     *  ======== checkDefaults ========
     *  Check if dataMemory, codeMemory and stackMemory are set correctly
     *
     *  The `xdc.platform.IPlatform` instance parameters 'dataMemory',
     *  'codeMemory', and 'stackMemory' are strings. This function verifies
     *  that those strings correspond to names of the memory objects in the
     *  supplied memory map.
     *
     *  @param(inst)	an `xdc.platform.IPlatform` instance
     *
     *  @param(memMap)	a map of `xdc.platform.IPlatform.Memory` objects
     *
     *	@a(returns)	'true' if checked parameters are valid, 'false'
     *			otherwise
     */
    function checkDefaults(inst, memMap);

    /*!
     *  ======== checkFit ========
     *  Check if a memory map fits into available physical memory
     *
     *  A custom memory map segment can be spread over multiple physical
     *  memories or multiple custom memory map segments can be located in
     *  one physical memory. However, code/data restrictions must be followed.
     *  A custom memory segment with the parameter 'space' set to "code/data",
     *  which is the default value if the parameter was not specified, can fit
     *  only into "code/data" physical memories. Custom memory segments with
     *  'space' set to "code" can fit into "code" and "code/data" memories, and
     *  custom memory segments with 'space' set to "data" can fit into "data"
     *  and "code/data" physical memories. 
     *
     *  @param(realMemMap)	a map of `xdc.platform.IPlatform.Memory`
     *				objects containing physical memory map as
     *				defined in datasheets for the device and the
     *				platform
     *
     *  @param(customMemMap)	a map of `xdc.platform.IPlatform.Memory`
     *				objects containing user defined memory map,
     *				which must fit within boundaries of 'realMemMap'
     *
     *	@a(returns)		'true', if customMemMap fits within realMemMap,
     *				and 'false' otherwise
     */
    function checkFit(realMemMap, customMemMap);

    /*!
     *  ======== checkOverlap ========
     *  Check if there is an overlap among memory objects in a memory map
     *
     *  @param(memMap)	a map of `xdc.platform.IPlatform.Memory` objects
     *
     *	@a(returns)	a string with names of Memory objects that overlap
     */
    function checkOverlap(memMap);

    /*!
     *  ======== getCpuDataSheet ========
     *  Get the specified cpu data sheet object
     *
     *  @param(cpuDesc)	an `xdc.platform.IExeContext.Cpu` object identifying 
     *			the CPU device
     *
     *	@a(returns)	an `xdc.platform.ICpuDataSheet.Instance` object that
     *			corresponds to the specified cpuDesc
     *
     *  @a(throws)	`Error` exceptions are thrown for fatal errors
     */
    function getCpuDataSheet(cpuDesc);
}

/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

