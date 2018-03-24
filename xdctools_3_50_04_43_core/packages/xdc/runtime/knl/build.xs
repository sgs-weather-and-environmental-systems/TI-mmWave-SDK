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
 *  ======== build.xs ========
 *  Common capsule whose variables are used in all rts package.bld files
 */

/*
 *  ======== common_objs ========
 *  All the xdc.runtime.knl module sources
 */
var c_objs = [
    "xdc/runtime/knl/Cache.c",
    "xdc/runtime/knl/GateThread.c", 
    "xdc/runtime/knl/Semaphore.c",    
    "xdc/runtime/knl/SyncNull.c",
    "xdc/runtime/knl/GateH.c",        
    "xdc/runtime/knl/SemProcess.c",  
    "xdc/runtime/knl/Sync.c",         
    "xdc/runtime/knl/SyncSemThread.c",
    "xdc/runtime/knl/GateProcess.c",  
    "xdc/runtime/knl/SemThread.c",   
    "xdc/runtime/knl/SyncGeneric.c",  
    "xdc/runtime/knl/Thread.c",
    "xdc/runtime/knl/CacheSupportNull.c",
    "xdc/runtime/knl/GateThreadSupportNull.c",
    "xdc/runtime/knl/GateProcessSupportNull.c",
];
/*
 *  @(#) xdc.runtime.knl; 1, 0, 0,0; 11-8-2017 17:11:35; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

