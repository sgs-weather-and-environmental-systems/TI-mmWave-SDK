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
 *  ======== package.xdc ========
 */

/*!
 *  ======== xdc.runtime.knl ========
 *  XDC Runtime support for OS-related primitives
 */
package xdc.runtime.knl [1, 0, 0]
{
    module GateH;
    module Semaphore;
    module Thread;
    module Sync;
    
    module GateThread;
    module GateProcess;
    module SemThread;
    module SemProcess;
    module SyncGeneric;
    module SyncNull;
    module SyncSemThread;
    module Cache;
    module CacheSupportNull;
    module GateThreadSupportNull;
    module GateProcessSupportNull;

    interface ISemaphore;
    interface ISync;

    interface IGateThreadSupport;
    interface IGateProcessSupport;
    interface ISemThreadSupport;
    interface ISemProcessSupport;
    interface IThreadSupport;
    interface ICacheSupport;
}
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

