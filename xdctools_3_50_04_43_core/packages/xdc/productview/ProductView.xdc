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
/*
 *  ======== ProductView.xdc ========
 */
package xdc.productview;

/*!
 *  ======== ProductView ========
 *  @_nodoc
 */
metaonly module ProductView inherits xdc.tools.IProductView {

/* System modules */	

    config ProductElemDesc xdc_cfg_Program;
    config ProductElemDesc xdc_runtime_Defaults;
    config ProductElemDesc xdc_runtime_System;
    config ProductElemDesc xdc_runtime_Startup;
    config ProductElemDesc xdc_runtime_Main;
    config ProductElemDesc xdc_runtime_Registry;

/* System Providers modules */	

    config ProductElemDesc xdc_runtime_SysCallback;
    config ProductElemDesc xdc_runtime_SysMin;
    config ProductElemDesc xdc_runtime_SysStd;

/* Timestamp Providers modules */	

    config ProductElemDesc xdc_runtime_TimestampStd;
    config ProductElemDesc xdc_runtime_TimestampNull;

/* Diagnostics modules */

    config ProductElemDesc xdc_runtime_Log;
    config ProductElemDesc xdc_runtime_LoggerBuf;
    config ProductElemDesc xdc_runtime_LoggerCallback;
    config ProductElemDesc xdc_runtime_LoggerSys;
    config ProductElemDesc xdc_runtime_Assert;
    config ProductElemDesc xdc_runtime_Diags;
    config ProductElemDesc xdc_runtime_Error;
    config ProductElemDesc xdc_runtime_Timestamp;
    config ProductElemDesc xdc_runtime_Text;

/* Memory Management modules */

    config ProductElemDesc xdc_runtime_Memory;
    config ProductElemDesc xdc_runtime_HeapMin;
    config ProductElemDesc xdc_runtime_HeapStd;

/* Gate modules */

    config ProductElemDesc xdc_runtime_GateNull;

/* Syncs modules */

    config ProductElemDesc xdc_runtime_knl_SyncGeneric;

/* groups */

    /*!
     *  ======== systemGroup ========
     *  Simple I/O and startup services
     */
    config ProductElemDesc systemGroup;

    /*!
     *  ======== diagnosticsGroup ========
     *  Real-time event logging and error management services
     */
    config ProductElemDesc diagnosticsGroup;

    /*!
     *  ======== memoryGroup ========
     *  Runtime memory management services
     */
    config ProductElemDesc memoryGroup;

    /*!
     *  ======== synchronizationGroup ========
     *  Thread synchronization services
     */
    config ProductElemDesc synchronizationGroup;

/* sub groups */

    config ProductElemDesc syncsGroup;
    config ProductElemDesc gatesGroup;
    config ProductElemDesc heapsGroup;
    config ProductElemDesc loggersGroup;
    config ProductElemDesc systemProvidersGroup;
    config ProductElemDesc timestampProvidersGroup;

/* product */

    config ProductElemDesc xdctoolsProduct;
}
/*
 *  @(#) xdc.productview; 1,0,0,0; 11-8-2017 17:10:53; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

