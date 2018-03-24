/* 
 *  Copyright (c) 2008-2017 Texas Instruments Incorporated
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
 *  ======== package.xdc ========
 */

requires xdc.bld;
requires ti.targets;

/*!
 *  ======== ti.targets.arm.elf ========
 *  Package of Arm targets for TI code generation tools for ELF
 *
 */
package ti.targets.arm.elf [1,0,0] {
    interface IArm;
    interface IR4, IR5;
    interface IA8, IM3, IM4, IM0;
    module Arm9;
    module M0;
    module M3;
    module M4, M4F;
    module A8F, A8Ft;
    module A8Fv, A8Fnv;
    module R4F, R4Ft, R5F;
}
/*
 *  @(#) ti.targets.arm.elf; 1, 0, 0,0; 11-8-2017 17:20:58; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

