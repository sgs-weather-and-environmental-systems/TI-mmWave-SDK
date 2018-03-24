/* --COPYRIGHT--,EPL
 *  Copyright (c) 2015-2016 Texas Instruments Incorporated
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * --/COPYRIGHT--*/
requires xdc.rov;
requires xdc.rta;

/*
 *  ======== xdc.rov.monserver ========
 *
 *  Alternative serial port approaches:
 *      o https://github.com/nyholku/purejavacomm
 *      o https://github.com/NeuronRobotics/nrjavaserial
 *      o use RXTX 2.2pre to get it working on 64-bit Linux:
 *        http://rxtx.qbang.org/pub/rxtx/rxtx-2.2pre2-bins.zip
 */
package xdc.rov.monserver {
    module Main;
    module CallStack, DummyCallBack, Support, SymbolTable;
}
