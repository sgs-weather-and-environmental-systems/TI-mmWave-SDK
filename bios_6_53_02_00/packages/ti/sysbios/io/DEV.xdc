/* 
 * Copyright (c) 2014, Texas Instruments Incorporated
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions
 * are met:
 *
 * *  Redistributions of source code must retain the above copyright
 *    notice, this list of conditions and the following disclaimer.
 *
 * *  Redistributions in binary form must reproduce the above copyright
 *    notice, this list of conditions and the following disclaimer in the
 *    documentation and/or other materials provided with the distribution.
 *
 * *  Neither the name of Texas Instruments Incorporated nor the names of
 *    its contributors may be used to endorse or promote products derived
 *    from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
 * AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
 * THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
 * PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT OWNER OR
 * CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
 * EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
 * PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
 * OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
 * WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
 * OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
 * EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 * */
/*
 *  ======== DEV.xdc ========
 *
 */

import xdc.rov.ViewInfo;

import xdc.runtime.Error;

/*!
 *  ======== DEV ========
 *  Device Manager.
 *
 *  The DEV Device Manager manages the table of IOM drivers. Drivers can
 *  be added or removed from the system using DEV_create() and DEV_delete().
 *
 *  DEV_create() calls mdBindDev() for the underlying IOM driver.  If 
 *  successful, the driver gets added to the driver table.  GIO_create()
 *  looks in this table for matching device name when opening an I/O
 *  channel.
 *
 *  DEV_delete() calls mdUnBindDev() for the underlying IOM driver and 
 *  removes the entry from the driver table.
 */

@DirectCall
@InstanceFinalize
@InstanceInitError
@ModuleStartup

module DEV 
{
    /*! Init function type definition. */
    typedef Void (*InitFxn)();
    
    /*!
     *  ======== Fxns ========
     *  @_nodoc
     *  This function table mirrors the IOM_Fxns table.  Fxns * is used in the
     *  instance object instead of Ptr to support static configuration.
     */
    struct Fxns {
        Fxn mdBindDev;
        Fxn mdUnBindDev;
        Fxn mdControlChan;
        Fxn mdCreateChan;
        Fxn mdDeleteChan;
        Fxn mdSubmitChan;
    };
    
    /*!
     *  ======== DeviceParams ========
     *  @_nodoc
     *  Dummy DeviceParams structure.  This is used in the instance object
     *  instead of Ptr to support static configuration.
     */
    struct DeviceParams {
        Int dummy;
    };
   
    /*! 
     *  Size of the device table.
     *
     *  This size needs to be large enough to hold the sum of the drivers
     *  created at configuration time and runtime.
     */
    config UInt tableSize = 8;

    metaonly struct BasicView {
        String          name;
        Ptr             fxns;
        String          initFxn[];
        Int             devid;
        Ptr             deviceParams;
        Ptr             devp; 
    };

    @Facet
    metaonly config ViewInfo.Instance rovViewInfo = 
        ViewInfo.create({
            viewMap: [
                ['Basic', {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitBasic', structName: 'BasicView'}],
            ]
        });

    /*!
     *  ======== match ========
     *  DEV_match searches the device table for the first device name that
     *  matches a prefix of 'name'.  The output parameter, device, points to
     *  the appropriate entry in the device table if successful and is set to
     *  NULL on error.
     *
     *  The suffix string return value contains a pointer to the characters
     *  remaining after the match.  This string can be used to specify device
     *  parameters or the name of another device driver.
     *
     *  For example, if you have "/uart" in the device table, then the
     *  suffix return value for the following would return a pointer to "0".
     *
     *  @p(code)
     *  suffix = DEV_match("/uart0", &device);
     *  @p
     *
     *  @param(name)    name of device
     *  @param(device)  pointer to DEV Handle (output param)
     *  @b(returns)     pointer to remaining characters after match
     */
    String match(String name, Handle *device);

instance:

    /*!
     *  ======== create ========
     *  Add an IOM driver to the device table at runtime.
     * 
     *  The 'name' parameter must be a static string since this name
     *  is referenced via a pointer and is not copied.  For example:
     *
     *  @p(code)
     *  Error_init(&eb);
     *  DEV_create("/a2d", &A2DFXNS, &myparams, &eb);
     *  @p
     *
     *  The following code will not work since 'localstring' is a local
     *  variable:
     *
     *  @p(code)
     *  { 
     *      Char localstring[10];
     *      strcpy(localstring, "/a2d");
     *      Error_init(&eb);
     *      DEV_create(localstring, &A2DFXNS, &myparams, &eb);
     *  }
     *  @p
     *
     *  @param(name)    name of device (must be a static string)
     *  @param(fxns)    pointer to IOM_Fxns table
     */
    create(String name, Ptr fxns);

    /*!
     *  ======== getName ========
     *  Get name of device
     *
     *  DEV_getName returns the name of the referenced device.
     *
     *  @b(returns)     device name
     */
    String getName();

    /*!
     *  ======== getFxns ========
     *  Get IOM function table of device
     *
     *  DEV_getFxns returns the IOM function table of the referenced device.
     *
     *  @b(returns)     pointer to device function table
     */
    Ptr getFxns();

    /*!
     *  ======== getInitFxn ========
     *  Get initialized function of device
     *
     *  DEV_getInitFxn returns the init function of the referenced device.
     *
     *  @b(returns)     init function pointer 
     */
    InitFxn getInitFxn();

    /*!
     *  ======== getDevid ========
     *  Get devid of device
     *
     *  DEV_getDevid returns the devid of the referenced device.
     *
     *  @b(returns)     devid
     */
    Int getDevid();

    /*!
     *  ======== getDeviceParams ========
     *  Get deviceParams of device
     *
     *  DEV_getDeviceParams returns the deviceParams of the referenced device.
     *
     *  @b(returns)     deviceParams
     */
    Ptr getDeviceParams();

    /*!
     *  ======== getDevp ========
     *  Get devp of device
     *
     *  DEV_getDevp returns the devp of the referenced device.
     *
     *  @b(returns)     devp
     */
    Ptr getDevp();

    /*!
     *  ======== deviceParams ========
     *  Device-specific parameters
     * 
     *  This parameter is passed as the last parameter to the underlying
     *  IOM driver's mdBindDevice function.
     */
    config Ptr deviceParams = null;

    /*!
     *  ======== initFxn ========
     *  Driver Initialization function
     *     
     *  This function is called once for every entry in the device table.
     *  If this parameter is set to NULL (the default), then no function
     *  will be called.
     */
    config InitFxn initFxn = null;

    /*!
     *  ======== devid ========
     *  Device id
     */
    config Int devid = 0;

internal:

    Int postInit(Object *obj, Error.Block *eb);

    struct Instance_State {
        String          name;           /* device name */
        Fxns            *fxns;          /* pointer to IOM function table */ 
        InitFxn         initFxn;        /* driver init function */
        Int             devid;          /* device id */
        DeviceParams    *deviceParams;  /* device parameters */
        Ptr             devp;           /* pointer to device global data */
    };

    struct Module_State {
        Handle          table[];        /* device table */
    };
}
