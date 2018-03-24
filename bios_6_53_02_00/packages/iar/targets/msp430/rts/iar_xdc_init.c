/* 
 *  Copyright (c) 2012 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */

#include <xdc/runtime/Startup.h>
extern int xdc_runtime_Startup__RESETFXN__C;
extern int xdc_runtime_Startup__EXECFXN__C;

#pragma location="CSTART"
void iar_xdc_startup_reset(void) {

    /*------------------------------------------------------------------------*/
    /* Call hook configured into Startup_resetFxn                             */
    /*------------------------------------------------------------------------*/
    if (&xdc_runtime_Startup__RESETFXN__C == (int*)1) {
        xdc_runtime_Startup_reset__I();
    }

}

#pragma location="CSTART"
void iar_xdc_startup_exec(void) {

    /*------------------------------------------------------------------------*/
    /* Process XDC Startup                                                    */
    /*------------------------------------------------------------------------*/
    if (&xdc_runtime_Startup__EXECFXN__C == (int*)1) {
        xdc_runtime_Startup_exec__E();
    }

}
/*
 *  @(#) iar.targets.msp430.rts; 1, 0, 0,0; 11-8-2017 18:00:50; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

