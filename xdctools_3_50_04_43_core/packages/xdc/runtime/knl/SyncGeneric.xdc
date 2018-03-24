/* 
 *  Copyright (c) 2008 Texas Instruments. All rights reserved.
 *  This program and the accompanying materials are made available under the
 *  terms of the Eclipse Public License v1.0 and Eclipse Distribution License
 *  v. 1.0 which accompanies this distribution. The Eclipse Public License is
 *  available at http://www.eclipse.org/legal/epl-v10.html and the Eclipse
 *  Distribution License is available at
 *  http://www.eclipse.org/org/documents/edl-v10.php.
 *
 *  Contributors:
 *      Texas Instruments - initial implementation
 * */
/*
 *  ======== SyncGeneric.xdc ========
 */

/*!
 *  ======== SyncGeneric ========
 *  Generic ISync implementation
 *
 *  This module allows users to plug in their own
 *  functions for signal, wait and query.
 */

module SyncGeneric inherits xdc.runtime.knl.ISync
{
    /*! typedef for user specified signal function */
    typedef Void (*SignalFunc)(UArg);

    /*! typedef for user specified wait function */
    typedef Bool (*WaitFunc)(UArg, UInt);    

    /*! typedef for user specified wait function */
    typedef Bool (*QueryFunc)(Int);

instance:
    /*! user signal function */
    config SignalFunc userSignal = null;

    /*! user signal function arg */
    config UArg signalArg = null;

    /*! user wait function */
    config WaitFunc  userWait = null; 

    /*! user wait function arg */
    config UArg waitArg = null;

    /*! user query function */
    config QueryFunc userQuery = null;

internal:

    /* -------- Internal Structures -------- */
    struct Instance_State {
        SignalFunc  userSignal;   
        UArg        signalArg;   
        WaitFunc    userWait; 
        UArg        waitArg;
        QueryFunc   userQuery;
    };

}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

