/* 
 *  Copyright (c) 2010 Texas Instruments and others.
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
 *  ======== IPeripheral.xdc ========
 */

package xdc.platform;

/*!
 *  ======== IPeripheral ========
 *  Configuration-time representation of a peripheral.
 *
 */
metaonly interface IPeripheral
{
    typedef IPeripheral.Instance IPeripheralArray[];
   
    typedef String StringArray[];

    /*!
     *  ======== addPeripheralsMap ========
     *  @_nodoc deprecated
     *  Create a map of all peripherals available on a device.
     *
     *  The config parameter `peripherals` is by default undefined in an
     *  `{@link xdc.platform.ICpuDataSheet}` instance. This function gathers
     *  all instance configuration parameters that are of the type
     *  `{@link xdc.platform.IPeripheral}` into the map `peripherals`.
     *
     *  @param(cds)     an `{@link xdc.platform.ICpuDataSheet}` instance
     *
     */
    final Void addPeripheralsMap(ICpuDataSheet.Instance cds);

    /*!
     *  ======== getAll ========
     *  Find all peripherals of a certain type.
     *
     *  The type of the peripherals returned is defined by the type of the
     *  caller.
     *
     *  @a(returns)	Returns an array of IPeripheral instances
     *
     */
    IPeripheralArray getAll();

    /*!
     *  ======== getRegisters ========
     *  Find all registers defined by the peripheral.
     *
     *  @a(returns)	Returns an array of register names
     *
     */
    StringArray getRegisters();

instance:

    /*!
     *  ======== name ========
     *  Specific peripheral name given by the device.
     *
     *  Devices can have more than one peripheral of the same type. In such
     *  cases, device data sheets give different names to the instances of a
     *  same peripheral. For example, the name for a timer module could be
     *  `TimerA3`, and a device that has two such timers can name them `TA0`
     *  and `TA1`.
     */
    config string name;

    /*!
     *  ======== owner ========
     *  String specifying the entity that manages the peripheral
     *
     */
    config string owner;
}
/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

