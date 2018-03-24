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
/*!
 *  ======== Clock ========
 *  Elapsed time measurement functions
 */
metaonly module Clock {

    /*!
     *  ======== getElapsedTime ========
     *  Get elapsed time from last reset
     */
    function getElapsedTime();

    /*!
     *  ======== enable ========
     *  Enable output from this module
     *
     *  If false, all output is suppressed.
     *
     *  The initial value of this configuration parameter can be set
     *  on the `xs` command line.  For example,
     *  @p(code)
     *      xs -Dxdc.services.global.Clock.enable=true ...
     *  @p
     *  sets the initial value of `enable` to `true`.
     *  
     *  If the value is not set on the command line, its initial value
     *   defaults to `false`.
     */
    config Bool enable = false;

    /*!
     *  ======== showMemory ========
     *  Enable memory usage output
     *
     *  If false, memory usage output is suppressed
     */
    config Bool showMemory = false;

    /*!
     *  ======== print ========
     *  Report elapsed time from last reset
     */
    void print(String msg);

    /*!
     *  ======== reset ========
     *  Set elapsed time to 0
     */
    void reset();
}
/*
 *  @(#) xdc.services.global; 1, 0, 0,0; 11-8-2017 17:11:49; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

