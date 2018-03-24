/* 
 *  Copyright (c) 2008-2016 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * 
 */
requires xdc.bld;
requires gnu.targets;

/*!
 *  ======== gnu.targets.arm ========
 *  GCC-based code generation targets for Arm
 *
 *  This package offers a generic support for different GNU Arm compilers.
 */
package gnu.targets.arm [1,0,0] {
    interface ITarget, IM;
    module GCArmv5T, GCArmv6, GCArmv7A, GCArmv7AF;
    module M3, M4, M4F;
    module M33F;
    module A8F, A9F, A15F;
    module A53F;
}

/*
 *  @(#) gnu.targets.arm; 1, 0, 0,0; 11-8-2017 17:20:19; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

