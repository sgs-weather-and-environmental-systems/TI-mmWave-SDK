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
 *  ======== getAll ========
 */
function getAll() {
    var insts = [];
    var i = 0;
    var peripherals = xdc.module('xdc.cfg.Program').cpu.attrs.peripherals;
    for (var key in peripherals) {
        if (peripherals[key].$module instanceof this.$orig.Module) {
            insts[i++] = peripherals[key];
        }
    }
    
    return (insts);
}

/*
 *  ======== getRegisters ========
 */
function getRegisters() {
    var regs = [];
    
    for (var prop in this.$orig.params) {
        if (prop[0] == prop[0].toUpperCase()) {
            regs.push(prop);
        }    
    }
    return (regs);
}

/*
 *  ======== addPeripheralsMap ========
 */
function addPeripheralsMap(cpu) {
//stub for compatibility purposes
}
/*
 *  @(#) xdc.platform; 1, 0, 1,0; 11-8-2017 17:10:44; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

