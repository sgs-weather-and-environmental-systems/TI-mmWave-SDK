/* 
 *  Copyright (c) 2011 Texas Instruments and others.
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
 *  ======== startup.c ========
 *  C runtime initialization.
 *
 */
#include <sys/types.h>
#include <xdc/runtime/Startup.h>

extern int * xdc_runtime_Startup__EXECFXN__C;

extern unsigned int __bss_start__, __bss_end__;
extern unsigned int __data_load__, __data_start__, __data_end__;
extern void (*__init_array_start []) (void);
extern void (*__init_array_end []) (void);

extern int main();
extern void _exit(int code);
extern void xdc_runtime_System_exit__E(int code);
volatile unsigned gnu_targets_arm_rtsv7M_exit = 0;
void * __dso_handle = (void *) &__dso_handle;

/*
 *  ======== startupC ========
 */
void startupC(void)
{
    int retVal;
    unsigned int * bs;
    unsigned int * be;
    unsigned int * dl;
    unsigned int * ds;
    unsigned int * de;
    size_t count;
    size_t i;

    /* initiailize .bss to zero */
    bs = & __bss_start__;
    be = & __bss_end__;
    while (bs < be) {
        *bs = 0;
        bs++;
    }

    /* relocate the .data section */
    dl = & __data_load__;
    ds = & __data_start__;
    de = & __data_end__;
    if (dl != ds) {
        while (ds < de) {
            *ds = *dl;
            dl++;
            ds++;
        }
    }

    /* run Startup_exec */
    xdc_runtime_Startup_exec__E();

    /* run any constructors */
    count = __init_array_end - __init_array_start;
    for (i = 0; i < count; i++) {
        __init_array_start[i]();
    }

    /* call main() */
    retVal = main();

    /* if get here call exit() */
    if (gnu_targets_arm_rtsv7M_exit != 0) {
        _exit(retVal);
    }
    else {
        xdc_runtime_System_exit__E(retVal);
    }

}

/*
 *  ======== _fini ========
 */
void _fini(void) {
}


/*
 *  @(#) gnu.targets.arm.rtsv7M; 1, 0, 0,0; 11-8-2017 17:59:56; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

