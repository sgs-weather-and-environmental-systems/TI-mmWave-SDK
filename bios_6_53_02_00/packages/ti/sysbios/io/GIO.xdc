/*
 * Copyright (c) 2014-2015, Texas Instruments Incorporated
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
 */
/*
 *  ======== GIO.xdc ========
 *
 */

import xdc.rov.ViewInfo;

import xdc.runtime.Error;
import xdc.runtime.Assert;
import xdc.runtime.IHeap;
import xdc.runtime.knl.Sync;
import xdc.runtime.knl.ISync;

import ti.sysbios.io.DEV;
import ti.sysbios.knl.Queue;

/*!
 *  ======== GIO ========
 *  General Purpose IO Manager.
 *
 *  The GIO Manager offers both the issue/reclaim model and the read/write
 *  model to send and receive data from drivers that implement the IOM
 *  interface as provided in ti/sysbios/io/iom.h. 
 *
 *  In the issue/reclaim model, the client calls {@link #issue} when he has
 *  a buffer of data.  issue() is non-blocking and returns -- it simply
 *  submits the buffer to the driver for I/O.  The client calls
 *  {@link #reclaim} to get the buffer back.  A call to reclaim() may block.
 *  Upon return from reclaim(), the client can re-use the buffer. 
 *
 *  The client can issue many buffers before reclaiming them.
 *  Buffers are always reclaimed in the order that they were issued.
 *  The client can optionally pass a user argument to issue().  This argument
 *  can be retrieved with reclaim().
 *
 *  In the read/write model, clients will call {@link #read} or {@link #write}
 *  to send/receive data. Here the client may block until buffer is ready or 
 *  a timeout occurs.
 *
 *  The GIO module also provides {@link #control} to send down driver specific
 *  control  commands.  The {@link #abort} function can be used to abort any
 *  pending I/O.
 *
 *  The {@link ti.sysbios.io.DEV} module maintains a name table of IOM drivers.
 *  This table is used by GIO to create an IO stack. The name passed to
 *  {@link #create} is usually of the form "/uart". This name may
 *  correspond to the following IO stack.
 *
 *         GIO Instance
 *
 *              |
 *              v
 *
 *         IOM Instance (/uart)
 *
 *  The GIO module uses the {@link xdc.runtime.knl.Sync} module for
 *  synchronization.  GIO will call {@link xdc.runtime.knl.Sync#signal} when 
 *  I/O completes and {@link xdc.runtime.knl.Sync#wait} to wait for I/O.
 *
 *  By default the I/O manager will create a semaphore for synchronization
 *  if no sync handle is passed to {@link #create}. 
 */

@DirectCall
@InstanceFinalize
@InstanceInitError

module GIO 
{
    /*! Init function type definition. */
    typedef Void (*InitFxn)();

    /* these must stay in synch with modes in iom.h */
    const UInt INPUT  = 0x1;      /*! mode for input */
    const UInt OUTPUT = 0x2;      /*! mode for output */
    const UInt INOUT  = 0x3;      /*! mode for input & output */
    
    /*! 
     *  Error raised when name not found in DeviceTable.
     */
    config Error.Id E_notFound  = {
        msg: "E_notFound: %s name not found"
    };

    /*! 
     *  Error raised when driver's mdCreateChan() call fails
     */
    config Error.Id E_createFailed  = {
        msg: "E_createFailed: mdCreateChan returned error %d"
    };

    /*! 
     *  Asserted in GIO_read(), GIO_write() if I/O model is not
     *  STANDARD or in GIO_issue(), GIO_reclaim(), or GIO_prime() if the
     *  I/O model is not ISSUERECLAIM.
     */
    config Assert.Id A_badModel = {
        msg: "A_badModel: invalid use of API for current I/O model" 
    };
    
    /*!
     *  ======== deviceTableSize ========
     *  This configuration parameter has been deprecated.  Use DEV.tableSize.
     */
    config Int deviceTableSize = 8;

    metaonly struct BasicView {
        String              label;
        UInt                freeCount;
        UInt                doneCount;
        UInt                submitCount;
        String              model;
        String              mode;
        Bool                userSuppliedSync;
    }
    
    @Facet
    metaonly config ViewInfo.Instance rovViewInfo = 
        ViewInfo.create({
            viewMap: [
                ['Basic', {type: ViewInfo.INSTANCE, viewInitFxn: 'viewInitBasic', structName: 'BasicView'}],
            ]
        });

    /*! model for IO channel */
    enum Model {
        Model_STANDARD,        /*! used for read, write, submit */ 
        Model_ISSUERECLAIM     /*! used for issue, reclaim, prime */
    };

    /*! application callback function used with GIO_submit() */
    typedef Void (*TappCallBack)(Ptr, Int, Ptr, SizeT);

    /*!
     *  Application Callback Structure.
     *
     *  Used with GIO_submit() for asynchronous callback.
     */
    struct AppCallback {
        TappCallBack    fxn;
        Ptr             arg;
    };

    /*!
     *  ======== addDevice ========
     *  This API has been deprecated.  Use DEV_create().
     */
    Int addDevice(String name, Ptr fxns, InitFxn initFxn, Int devid, Ptr params);

    /*!
     *  ======== addDeviceMeta ========
     *  This API has been deprecated.  Use DEV.create().
     */
    metaonly Void addDeviceMeta(String name, String fxns, String initFxn, Int devid, String params);

    /*!
     *  ======== removeDevice ========
     *  This API has been deprecated.  Use DEV_match() and DEV_delete().
     */
    Int removeDevice(String name);

instance:

    /*!
     *  ======== model ========
     *  I/O model
     *
     *  Set the model to STANDARD to use read(), write() and submit() APIs.   
     *  Set the model to ISSUERECLAIM to use issue(), reclaim(), and
     *  prime() APIs.   
     *
     *  The default for this parameter is STANDARD.
     */
    config Model model = Model_STANDARD;

    /*! Number of packets to use for asynchronous I/O */
    config Int numPackets = 2;

    /*! For blocking calls.  Default is BIOS_WAIT_FOREVER */
    config UInt timeout = ~(0);

    /*! ISync handle used to signal IO completion */
    config ISync.Handle sync = null;

    /*!
     *  ======== chanParams ========
     *  channel parameters
     *
     *  The chanParams parameter is a pointer that may be used to pass device
     *  or domain-specific arguments to the mini-driver. The contents at the
     *  specified address are interpreted by the mini-driver in a
     *  device-specific manner.  
     */
    config Ptr chanParams = null;

    /*!
     *  ======== packets ========
     *  The address of the buffer used for IOM packets.
     *
     *  If set to 'null', the packets will be allocated from the heap
     *  during runtime, otherwise the user may set this to a buffer of their
     *  creation to be used for the IOM packets.
     *
     *  The packets will be split into
     *  {@link ti.sysbios.io.GIO#numPackets} each the size of IOM_Packet.
     *
     *  Please note that if the packets is user supplied, then it is the user's
     *  responsibility to ensure that it is aligned properly and is also large
     *  enough to contain {@link ti.sysbios.io.GIO#numPackets} number of
     *  IOM_Packet packets.  The size of packets buffer, if provided,
     *  should be
     *
     *  @p(code)
     *      sizeof(IOM_Packet) * numPackets
     *  @p
     *
     *  Example:
     *  @p(code)
     *  #define NUMPACKETS  2
     *  IOM_Packet inPackets[NUMPACKETS];
     *
     *  GIO_Params params;
     *
     *  GIO_Params_init(&params);
     *  params.numPackets = NUMPACKETS;
     *  params.packets = inPackets;
     *  @p
     */
    config Ptr packets = null;

    /*!
     *  ======== abort ========
     *  Abort all pending IO.
     *
     *  An application calls GIO_abort to abort all input and output from
     *  the device. When this call is made, all pending calls are completed
     *  with a status of GIO_ABORTED. An application uses this call to
     *  return the device to its initial state. Usually this is done in
     *  response to an unrecoverable error at the device level.
     *
     *  GIO_abort returns IOM_COMPLETED upon successfully aborting all
     *  input and output requests. If an error occurs, the device returns a
     *  negative value.  The list of error values are defined in the 
     *  ti/sysbios/io/iom.h file.
     *
     *  A call to GIO_abort results in a call to the mdSubmit function of the
     *  associated mini-driver. The IOM_ABORT command is passed to the
     *  mdSubmit function. The mdSubmit call is typically a blocking call, so
     *  calling GIO_abort can result in the thread blocking.
     *
     *  If using ISSUERECLAIM IO model, the the underlying device
     *  connected to stream is idled as a result of calling abort and
     *  all buffers are ready for reclaim().  The client needs to call
     *  {@link #reclaim} to get back the buffers.  However the client will
     *  NOT block when calling reclaim() after an abort().
     *
     *  @b(returns)         IOM_COMPLETED on success, < 0 on failure  
     */
    Int abort();

    /*!
     *  ======== control ========
     *  Send a control command to the driver.
     *
     *  An application calls GIO_control to configure or perform control
     *  functionality on the communication channel.
     *
     *  The cmd parameter may be one of the command code constants listed in
     *  ti/sysbios/io/iom.h. A mini-driver may add command codes for
     *  additional functionality.
     *
     *  The args parameter points to a data structure defined by the device to
     *  allow control information to be passed between the device and the
     *  application. This structure can be generic across a domain or
     *  specific to a mini-driver. In some cases, this argument may point
     *  directly to a buffer holding control data. In other cases, there
     *  may be a level of indirection if the mini-driver expects a data
     *  structure to package many components of data required for the control
     *  operation. In the simple case where no data is required, this 
     *  parameter may just be a predefined command value.
     *
     *  GIO_control returns IOM_COMPLETED upon success. If an error occurs,
     *  the device returns a negative value. For a list of error values, see 
     *  ti/sysbios/io/iom.h.  A call to GIO_control results in a call to
     *  the mdControl function of the associated mini-driver. The mdControl
     *  call is typically a blocking call, so calling GIO_control can result
     *  in blocking.
     *
     *  @param(cmd)         device specific command
     *  @param(args)        pointer to device-specific arguments
     *  @b(returns)         IOM_COMPLETED on success, < 0 on failure  
     */
    Int control(UInt cmd, Ptr args);

    /*!
     *  ======== create ========
     *  Create a GIO Instance.
     *
     *  An application calls GIO_create to create a GIO_Obj object and open
     *  a communication channel. This function initializes the I/O channel
     *  and opens the lower-level device driver channel. The GIO_create call
     *  also creates the synchronization objects it uses and stores them in
     *  the GIO_Obj object.
     *
     *  The name argument is the name specified for the device when it was
     *  created in the configuration or at runtime.
     *
     *  The mode argument specifies the mode in which the device is to be
     *  opened. This may be IOM_INPUT, IOM_OUTPUT, or IOM_INOUT.  
     *
     *  If the status returned by the device is non-NULL, a status value is
     *  placed at the address specified by the status parameter.  
     *
     *  The GIO_create call allocates a list of IOM_Packet items as specified
     *  by the numPackets member of the params structure and stores them in
     *  the GIO_Obj object it creates.
     *
     *  @param(name)        name that identifies the IO stack
     *  @param(mode)        mode of channel
     */
    create(String name, UInt mode);

    /*!
     *  ======== flush ========
     *  Drain output buffers and discard any pending input
     * 
     *  An application calls GIO_flush to flush the input and output
     *  channels of the device.  All input data is discarded; all pending
     *  output requests are completed.  When this call is made, all pending
     *  input calls are completed with a status of IOM_FLUSHED, and all
     *  output calls are completed routinely.
     *
     *  This call returns IOM_COMPLETED upon successfully flushing all
     *  input and output.  If an error occurs, the device returns a negative
     *  value. For a list of error values, see ti/sysbios/io/iom.h.
     *
     *  A call to GIO_flush results in a call to the mdSubmit function of
     *  the associated mini-driver. The IOM_FLUSH command is passed to the
     *  mdSubmit function. The mdSubmit call is typically a blocking call,
     *  so calling GIO_flush can result in the thread blocking while waiting
     *  for output calls to be completed.
     *
     *  @b(returns)         IOM_COMPLETED on success, < 0 on failure  
     */
    Int flush();

    /*!
     *  ======== issue ========
     *  Issue a buffer to the stream.
     *
     *  This function issues a buffer to the stream for IO. This API is
     *  non-blocking.
     *
     *  Failure of issue() indicates that the stream was not able to accept the
     *  buffer being issued or that there was a error from the underlying
     *  driver. Note that the error could be driver specific.
     *  If issue() fails because of an underlying driver problem
     *  {@link #abort} should be called before attempting more I/O through the 
     *  stream.
     *
     *  The interpretation of the logical size of a buffer, is direction
     *  dependent.  For a stream opened in OUTPUT mode, the logical size
     *  of the buffer indicates the number of minimum addressable units of of 
     *  data it contains. 
     *
     *  For a stream opened in INPUT mode, the logical size 
     *  of a buffer indicates the number of minimum addressable units being 
     *  requested by the client. In either case, the logical size of the buffer 
     *  must be less than or equal to the physical size of the buffer.
     *
     *  issue() is used in conjunction with {@link #reclaim}. The issue() call 
     *  sends a buffer to a stream, and reclaim() retrieves a buffer 
     *  from a stream. In normal operation each issue() call is followed by an 
     *  reclaim() call.
     *
     *  Short bursts of multiple issue() calls can be made without an
     *  intervening reclaim() call followed by short bursts of reclaim() calls, 
     *  but over the life of the stream issue() and reclaim() must be called 
     *  the same number of times. The number of issue() calls can exceed the 
     *  number of reclaim() calls by {@link #maxIssues}.
     *
     *  The client argument is not interpreted by IO or the underlying 
     *  modules, but is offered as a service to the stream client. All compliant
     *  device drivers preserve the value of arg and maintain its association 
     *  with the data that it was issued with. arg provides a method for a 
     *  client to associate additional information with a particular buffer of 
     *  data. The arg is returned during reclaim().
     *
     *  @param(buf)         buffer pointer
     *  @param(size)        size of buffer
     *  @param(arg)         application arg
     *  @b(returns)         IOM_COMPLETED on success, < 0 on failure  
     *  
     */
    Int issue(Ptr buf, SizeT size, UArg arg);

    /*!
     *  ======== reclaim ========
     *  Reclaim a buffer that was previously issued by calling {@link #issue}.
     *
     *  reclaim() is used to request a buffer back from a stream. 
     *
     *  If a stream was created in OUTPUT mode, then reclaim() returns a
     *  processed buffer, and size is zero.  If a stream was opened in
     *  INPUT mode, reclaim() returns a full buffer, and size is the number
     *  of minimum addressable units of data in the buffer.
     *
     *  reclaim() calls Sync_wait() with the timeout specified when the 
     *  channel was created.  For the default SyncSem, reclaim() blocks
     *  until a buffer can be returned to the caller, or until a timeout occurs.
     *
     *  Failure of reclaim() indicates that no buffer was returned to 
     *  the  client. Therefore, if reclaim() fails, the client should 
     *  not attempt to de-reference pBuf, since it is not guaranteed to contain
     *  a valid buffer pointer.
     *
     *  reclaim() is used in conjunction with {@link #issue} to operate 
     *  a stream. The issue() call sends a buffer to a stream, and 
     *  reclaim() retrieves a  buffer from a stream. In normal operation
     *  each issue call is followed by an reclaim call.
     *
     *  Short bursts of multiple issue() calls can be made without an
     *  intervening reclaim() call followed by short bursts of reclaim() calls, 
     *  but over the life of the stream issue() and reclaim() must be called 
     *  the same number of times. The number of issue() calls can exceed the 
     *  number of reclaim() calls by {@link #maxIssues}.
     *
     *  A reclaim() call should not be made without at least one 
     *  outstanding issue() call. Calling reclaim() with no 
     *  outstanding issue() calls results in an error {@link #E_noBuffersIssued}
     *
     *  reclaim() only returns buffers that were passed in using issue(). It 
     *  also returns the buffers in the same order that they were issued.
     *
     *  reclaim() returns the size transferred in case of success.
     *  It returns zero when an error is caught. In case of timeout, the error 
     *  is {@link #E_timeout}.
     *
     *  @param(pBuf)        returned buffer pointer
     *  @param(pSize)       pointer to size of buffer (OUTPUT parameter)
     *  @param(pArg)        pointer to client arg. Can be null.
     *  @b(returns)         IOM_COMPLETED on success, < 0 on failure  
     *  
     */
    Int reclaim(Ptr *pBuf, SizeT *pSize, UArg *pArg);

    /*!
     *  ======== read ========
     *  Synchronous read command
     *
     *  An application calls GIO_read to read a specified number of MADUs
     *  (minimum addressable data units) from the communication channel.  
     *
     *  The buf parameter points to a device-defined data structure for
     *  passing buffer data between the device and the application. This
     *  structure may be generic across a domain or specific to a single
     *  mini-driver. In some cases, this parameter may point directly to a
     *  buffer that holds the read data. In other cases, this parameter may
     *  point to a structure that packages buffer information, size, offset
     *  to be read from, and other device-dependent data. For example, for
     *  video capture devices this structure may contain pointers to RGB
     *  buffers, their sizes, video format, and a host of data required for
     *  reading a frame from a video capture device.  Upon a successful read,
     *  this argument points to the returned data. 
     *
     *  The pSize parameter points to the size of the buffer or data
     *  structure pointed to by the buf parameter. When the function
     *  returns, this parameter points to the number of MADUs read from the
     *  device. This parameter is relevant only if the buf parameter points
     *  to a raw data buffer. In cases where it points to a device-defined
     *  structure it is redundant -- the size of the structure is known to
     *  the mini-driver and the application. At most, it can be used for
     *  error checking.
     *
     *  GIO_read returns IOM_COMPLETED upon successfully reading the
     *  requested number of MADUs from the device. If an error occurs,
     *  the device returns a negative value. For a list of error values,
     *  see ti/sybios/io/iom.h. 
     *
     *  A call to GIO_read results in a call to the mdSubmit function of
     *  the associated mini-driver. The IOM_READ command is passed to the
     *  mdSubmit function. The mdSubmit call is typically a blocking call,
     *  so calling GIO_read can result in the thread blocking.
     *
     *  @param(buf)         buffer pointer
     *  @param(pSize)       pointer to size of buffer (INPUT/OUTPUT parameter)
     *  @b(returns)         IOM_COMPLETED on success, < 0 on failure  
     */
    Int read(Ptr buf, SizeT *pSize);  

    /*!
     *  ======== write ========
     *  Synchronous write command
     *
     *  An application calls GIO_write to write a specified number of MADUs
     *  (minimum addressable data units) from the communication channel.  
     *
     *  The buf parameter points to a device-defined data structure for
     *  passing buffer data between the device and the application. This
     *  structure may be generic across a domain or specific to a single
     *  mini-driver. In some cases, this parameter may point directly to a
     *  buffer that holds the write data. In other cases, this parameter may
     *  point to a structure that packages buffer information, size, offset
     *  to be write from, and other device-dependent data. For example, for
     *  video capture devices this structure may contain pointers to RGB
     *  buffers, their sizes, video format, and a host of data required for
     *  reading a frame from a video capture device.
     *
     *  The pSize parameter points to the size of the buffer or data
     *  structure pointed to by the buf parameter. When the function
     *  returns, this parameter points to the number of MADUs written to the
     *  device. This parameter is relevant only if the buf parameter points
     *  to a raw data buffer. In cases where it points to a device-defined
     *  structure it is redundant -- the size of the structure is known to
     *  the mini-driver and the application. At most, it can be used for
     *  error checking.
     *
     *  GIO_write returns IOM_COMPLETED upon successfully writing the
     *  requested number of MADUs from the device. If an error occurs,
     *  the device returns a negative value. For a list of error values,
     *  see ti/sybios/io/iom.h. 
     *
     *  A call to GIO_write results in a call to the mdSubmit function of
     *  the associated mini-driver. The IOM_WRITE command is passed to the
     *  mdSubmit function. The mdSubmit call is typically a blocking call,
     *  so calling GIO_write can result in the thread blocking.
     *
     *  @param(buf)         buffer pointer
     *  @param(pSize)       pointer to size of buffer (INPUT/OUTPUT parameter)
     *  @b(returns)         IOM_COMPLETED on success, < 0 on failure  
     */
    Int write(Ptr buf, SizeT *pSize);  

    /*!
     *  ======== submit ========
     *  Submit an IO job to the mini-driver
     *
     *  GIO_submit is not typically called by applications. Instead, it is
     *  used internally and for user-defined extensions to the GIO module.
     *
     *  The cmd parameter is IOM_READ, IOM_WRITE, IOM_ABORT or IOM_FLUSH
     *  when used internally.  A mini driver may add command codes for 
     *  additional functionality.
     *
     *  The bufp parameter points to a device-defined data structure for
     *  passing buffer data between the device and the application. This
     *  structure may be generic across a domain or specific to a single
     *  mini-driver. In some cases, this parameter may point directly to
     *  a buffer that holds the data. In other cases, this parameter may
     *  point to a structure that packages buffer information, size, offset
     *  to be read from, and other device-dependent data.
     *
     *  The pSize parameter points to the size of the buffer or data structure
     *  pointed to by the bufp parameter. When the function returns, this
     *  parameter points to the number of MADUs transferred to or from the
     *  device. This parameter is relevant only if the bufp parameter points
     *  to a raw data buffer. In cases where it points to a device-defined
     *  structure it is redundant -- the size of the structure is known to
     *  the mini-driver and the application. At most, it can be used for
     *  error checking.
     *
     *  The appCallback parameter points to either a callback structure that
     *  contains the callback function to be called when the request completes.
     *  queued request is completed, the callback routine (if specified) is
     *  invoked (i.e. blocking).  If the appCallback parameter is NULL, then
     *  the call to GIO_submit() will be synchronous and will not return
     *  until IO is complete (or an error occurs).  
     *
     *  GIO_submit returns IOM_COMPLETED upon successfully carrying out
     *  the requested functionality. If the request is queued, then a status of
     *  IOM_PENDING is returned. If an error occurs, the device returns a
     *  negative value. For a list of error values, see ti/sysbios/io/iom.h.
     * 
     *  A call to GIO_submit results in a call to the mdSubmit function of
     *  the associated mini-driver. The specified command is passed to the
     *  mdSubmit function.
     *
     *  @param(cmd)         driver specific packet command
     *  @param(buf)         buffer pointer
     *  @param(pSize)       pointer to size of buffer (INPUT/OUTPUT parameter)
     *  @param(appCallBack) pointer to application callback structure
     *  @b(returns)         IOM_COMPLETED on success, < 0 on failure  
     */
    Int submit(UInt cmd, Ptr buf, SizeT *pSize, AppCallback *appCallback); 
    
    /*!
     *  ======== prime ========
     *  Prime an OUTPUT stream instance.
     *
     *  This API facilitates buffering of an output channel. Consider a
     *  task that constantly gets data from input channel and sends to an
     *  output channel. To start with it may want to issue buffers to the
     *  input channel and output channel to enable double buffering.
     *  For an input channel there is no problem. For an output channel however
     *  the buffer data is sent out through the peripheral and in the case of a
     *  heterogenous system, the data will be sent to the other processor.
     *
     *  In such cases where the driver cannot handle dummy buffers,
     *  IO_prime can be used to make buffers available instantly for
     *  reclaim without actually sending the buffers to the driver.
     *  This API is non-blocking.
     *
     *  The primary use of prime() is used when applications want to prime
     *  an output channel at startup, without sending data to the driver.
     *  This allows them to reclaim and issue in their task.
     *
     *  Failure of prime() indicates that the stream was not able to accept the
     *  buffer being issued  due to un-avaibailibity of IO packets.
     *
     *  The client argument is not interpreted by IO.
     *
     *  @param(buf)         buffer pointer
     *  @param(size)        size of buffer
     *  @param(arg)         app arg
     *  @b(returns)         IOM_COMPLETED on success, < 0 on failure  
     */
    Int prime(Ptr buf, SizeT size, UArg arg);

internal:

    /* -------- Internal Structures -------- */
    struct Instance_State {
        String              name;           /* name used to create inst */
        UInt                mode;           /* input or output */
        UInt                model;          /* STANARD or ISSUERECLAIM */
        UInt                timeout;        /* STANARD or ISSUERECLAIM */
        IHeap.Handle        packetHeap;     /* heap used to alloc packets */
        ISync.Handle        sync;           /* completion sync */
        Bool                userSync;       /* user supplied sync handle */
        Bool                userPackets;    /* user supplied packets buffer */
        Queue.Object        doneList;       /* done packets */
        Queue.Object        freeList;       /* free packets */
        Ptr                 packets;        /* allocated packet block */
        Int                 numPackets;     /* total # of packets */
        Int                 freeCount;      /* # of free packets */
        Int                 doneCount;      /* # of completed packets */
        Int                 submitCount;    /* # packets submitted to driver */

        Ptr                 fxns;           /* device function table */
        Ptr                 mdChan;         /* pointer to driver chan object */
    };
}
