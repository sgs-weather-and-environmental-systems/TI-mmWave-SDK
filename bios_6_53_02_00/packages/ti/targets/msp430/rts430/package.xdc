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
requires xdc.runtime;

/*!
 *  ======== ti.targets.msp430.rts430 ========
 *  Runtime support package for the MSP430 targets.
 *
 *  This package builds a library of all modules in the xdc.runtime package.
 *  By building the xdc.runtime package here we avoid having multiple copies
 *  of the same source in different runtime support packages for different
 *  ISAs.  This also allows xdc.runtime to be a pure source package
 *  independent of any particular tool chain.
 */
package ti.targets.msp430.rts430 [1,0,0] {
    module Settings;
}
/*
 *  @(#) ti.targets.msp430.rts430; 1, 0, 0,0; 11-8-2017 18:01:41; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

