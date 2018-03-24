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
 *  ======== ICpuDataSheet.xdc ========
 */
package xdc.platform;

/*!
 *  ======== ICpuDataSheet ========
 *  CPU information provided by the HW model.
 *
 *  The information in this interface is read-only, defined by the chip's
 *  data sheet, and is obtained by naming a module in a package that
 *  implements this interface.
 *
 *  Data sheets are created by platforms as part of creating an "execution
 *  context" (see `{@link xdc.platform.IPlatform#getExeContext}`).  This
 *  execution context includes the CPU's memory map as well as any external
 *  memory provided by the platform itself, for example.
 */
metaonly interface ICpuDataSheet
{

instance:
    /*!
     *  ======== create ========
     *  Create a "data-sheet" for the specified revision of a CPU.
     *
     *  A "data sheet" for a CPU allows one to get specific attributes
     *  for a CPU programatically; e.g., the memory map of the CPU.
     *
     *  Notice that we don't specify CPU registers when we create a
     *  a data-sheet; registers are provided as necessary to the other
     *  functions defined in this interface.  This allows one to more easily
     *  get memory maps for several different setting of the registers,
     *  for example.
     *
     * @param(revision)	a string that identifies revision of the CPU to be
     *			created.
     */
    create(string revision);
    
    /*!
     *  ======== cpuCore ========
     *  A string identifying the CPU Core.
     *
     *  This uniquely identifies the instruction set that the CPU can
     *  decode and execute.
     */
    config string cpuCore;	    /* 5400, 5500, etc... */

    /*!
     *  ======== cpuCoreRevision ========
     *  A string that uniquely identifies a revision of the core.
     */
    config string cpuCoreRevision;    /* 1.2, 2.0, etc... */

    /*!
     *  ======== minProgUnitSize ========
     *  The minimum addressable program unit size in 8-bit bytes
     */
    config int minProgUnitSize;

    /*!
     *  ======== minDataUnitSize ========
     *  The minimum addressable data unit size in 8-bit bytes
     */
    config int minDataUnitSize;

    /*!
     *  ======== dataWordSize ========
     *  The size of an int on the target in 8-bit bytes
     */
    config int dataWordSize;
    
    /*!
     *  ======== peripherals ========
     *  A map of peripherals available on the device
     */
    config xdc.platform.IPeripheral.Instance peripherals[string];

    /*!
     *  ======== deviceHeader ========
     *  The optional header file that define device specific constants and
     *  structures.
     */
    config string deviceHeader;

    /*!
     *  ======== getMemoryMap ========
     *  Get the memory map that corresponds to the values of the specified
     *  registers.
     *
     *  If a register is not specified and this register can affect the
     *  memory map, the register is assumed to be set to its reset
     *  value (the value of the register immediately after a CPU reset).
     *
     *	@param(registers)   a hash of named registers to values at the time
     *			    an executable is to be loaded (for example)
     *
     *  @a(returns)	    Returns an array of
     *                      `{@link xdc.platform.IPlatform#Memory}`
     *                      objects that represent the memory visible to an
     *			    executable running on the CPU.
     */
//    xdc.platform.IPlatform.Memory [] getMemoryMap(int registers [string]);
    function getMemoryMap(registers);

    /*!
     *  ======== getRegisterSet ========
     *  The set of valid register names for this CPU
     *
     *  This function returns the complete set of register names that may be
     *  passed to the `{@link #getMemoryMap()}` function.  This function is
     *  only used to enable one to write a "requires contract" for the
     *  `{@link #getMemoryMap()}` function.
     *
     *	@a(returns) Returns an array of valid register names (strings) for 
     *		    this device; only names from this array are valid keys 
     *		    for the registers argument to `{@link #getMemoryMap()}`.
     */
//    string [] getRegisterSet();
    function getRegisterSet();
};
/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

