/*
 * Copyright (c) 2013, Texas Instruments Incorporated
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

import xdc.rov.ViewInfo;
import xdc.runtime.IHeap;
import xdc.runtime.ILogger;
import xdc.runtime.ITimestampClient;
import xdc.runtime.Diags;
import xdc.runtime.Log;
import xdc.runtime.Assert;
import xdc.runtime.Error;
import xdc.runtime.Types;

/*
 *  ======== LoggerBuf.xdc ========
 */

/*!
 *  ======== LoggerBuf ========
 *  A logger which stores `Log` events in a buffer.
 *
 *  This module provides a logger which captures `{@link xdc.runtime.Log}` events to a
 *  buffer in realtime. The `Log` events stored in the buffer are
 *  unformatted; `Log` event formatting is deferred until some client reads
 *  the raw event data from the buffer. You can use
 *  `{@link #flush LoggerBuf_flush()}` to process the `Log` events stored
 *  in the buffer and stream the formatted output to stdout
 *  (via `{@link xdc.runtime.System#printf}`).  Alternatively, you can read a raw event
 *  (via `{@link #getNextEntry}`) and send it to another client that
 *  has the resources to format the event for display.
 *
 *  The implementation of this logger is fast with minimal stack usage
 *  making it appropriate for a realtime application.
 *  This logger writes all `Log` events to a circular buffer.  As a
 *  result, the execution time of all `Log` methods bound to this type
 *  of logger are deterministic (and quite short) because there are no
 *  additional memory allocation calls after the circular buffer was
 *  allocated.
 *
 *  If this logger is used in a preemptive environment, then an appropriate
 *  gate must be assigned to the module. For example, if events are generated
 *  from an interrupt context, then a gate that disables interrupts
 *  must be used.
 *
 *  @p(code)
 *  var LoggerBuf = xdc.useModule('xdc.runtime.LoggerBuf');
 *  LoggerBuf.common$.gate = ...some gate instance...
 *  @p
 *
 *  If the buffer type is circular, the log buffer of size
 *  `{@link #numEntries}` contains the last `numEntries` of `Log` events. If
 *  the buffer type is fixed, the log buffer contains the first
 *  `numEntries` events.
 *
 *  LoggerBuf supports routing of 'STATUS' events (errors and warnings) to a
 *  separate ILogger instance. This is helpful in preserving these critical
 *  events, which may otherwise be overwritten by lower priority events. This
 *  feature is disabled by default. See {@link #statusLogger}.
 *
 *  LoggerBuf implements the {@link xdc.runtime.IFilterLogger} interface and
 *  optionally supports filtering of events based on their detail level. This
 *  feature is disabled by default. See {@link xdc.runtime.IFilterLogger}.
 *
 *  @a(Examples)
 *  Configuration example: The following XDC configuration statements
 *  create a logger instance, assign it as the default logger for all
 *  modules, and enable `USER1` logging in all modules of the package
 *  `my.pkg`. See the `{@link xdc.runtime.Diags#setMaskMeta Diags.setMaskMeta()}` function
 *  for details on specifying the module names.
 *
 *  @p(code)
 *  var Defaults = xdc.useModule('xdc.runtime.Defaults');
 *  var Diags = xdc.useModule('xdc.runtime.Diags');
 *  var LoggerBuf = xdc.useModule('xdc.runtime.LoggerBuf');
 *
 *  LoggerBuf.enableFlush = true;
 *  var LoggerBufParams = new LoggerBuf.Params();
 *  LoggerBufParams.exitFlush = true;
 *  Defaults.common$.logger = LoggerBuf.create(LoggerBufParams);
 *  Diags.setMaskMeta("my.pkg.%", Diags.USER1, Diags.RUNTIME_ON);
 *  @p
 */

@ModuleStartup      /* Initialize static instances */
@InstanceFinalize   /* this mod has cleanup fxn when instances are deleted */
@InstanceInitError  /* instance create can fail */
@Gated

module LoggerBuf inherits xdc.runtime.IFilterLogger {

    /*!
     *  ======== BufType ========
     *  Type of log buffer
     */
    enum BufType {
        BufType_CIRCULAR,  /*! The log buffer wraps, overwriting old entries */
        BufType_FIXED      /*! The log buffer halts collection when full */
    };

    metaonly struct BasicView {
        String label;
        Int lastSerial;
        Int numEntries;
        String type;
        Bool enabledFlag;
    };

    metaonly struct RecordView {
        Int     serial;
        Long    timestampRaw;
        UInt    core;
        String  modName;
        String  text;
        Int     eventId;
        String  eventName;
        IArg    arg0;
        IArg    arg1;
        IArg    arg2;
        IArg    arg3;
        IArg    arg4;
        IArg    arg5;
        IArg    arg6;
        IArg    arg7;
    }

    /*!
     *  ======== rovViewInfo ========
     *  @_nodoc
     */
    @Facet
    metaonly config xdc.rov.ViewInfo.Instance rovViewInfo =
        xdc.rov.ViewInfo.create({
            viewMap: [
                ['Basic',
                    {
                        type: xdc.rov.ViewInfo.INSTANCE,
                        viewInitFxn: 'viewInitBasic',
                        structName: 'BasicView'
                    }
                ],
                ['Records',
                    {
                        type: xdc.rov.ViewInfo.INSTANCE_DATA,
                        viewInitFxn: 'viewInitRecords',
                        structName: 'RecordView'
                    }
                ]
            ]
        });

    /*!
     *  ======== StopModeData ========
     *  Data added to the RTA MetaData file to support stop mode RTA
     */
    @XmlDtd metaonly struct StopModeData {
        String bufferSymbol;
        Int bufferSize;
    }

    /*!
     *  ======== E_badLevel ========
     *  Error raised if get or setFilterLevel receives a bad level value
     */
    config Error.Id E_badLevel =
        {msg: "E_badLevel: Bad filter level value: %d"};

    /*!
     *  ======== TimestampProxy ========
     *  User supplied time-stamp proxy
     *
     *  This proxy allows `LoggerBuf` to use a timestamp server different
     *  from the server used by `{@link xdc.runtime.Timestamp}`. However, if
     *  not supplied by a user, this proxy defaults to whichever timestamp
     *  server is used by `Timestamp`.
     */
    proxy TimestampProxy inherits ITimestampClient;

    /*!
     *  ======== enableFlush ========
     *  Flush all logs at system exit
     */
    config Bool enableFlush = false;

    /*!
     *  ======== statusLogger ========
     *  Route all 'STATUS' (error and warning) events to this logger.
     *
     *  If a statusLogger is specified, all LoggerBuf instances will check to
     *  determine if any of the events they receive are errors or warnings (if
     *  their diags mask includes the STATUS category), and will log these
     *  events to the statusLogger.
     *
     *  Error events are infrequent, but it's generally critical that they be
     *  seen. In a typical system, non-error events easily outnumber any error
     *  events, and the logger is likely to wrap, overwriting any error events.
     *  To protect these events from being overwritten and lost, they can be
     *  sent to their own separate logger to preserve them.
     *
     *  The default value is null, indicating that the STATUS events will just
     *  be logged by the logger they were sent to.
     */
    config ILogger.Handle statusLogger = null;

    /*!
     *  ======== level1Mask ========
     *  Mask of diags categories whose initial filtering level is Diags.LEVEL1
     *
     *  See '{@link #level4Mask}' for details.
     */
    config Diags.Mask level1Mask = 0;

    /*!
     *  ======== level2Mask ========
     *  Mask of diags categories whose initial filtering level is Diags.LEVEL2
     *
     *  See '{@link #level4Mask}' for details.
     */
    config Diags.Mask level2Mask = 0;

    /*!
     *  ======== level3Mask ========
     *  Mask of diags categories whose initial filtering level is Diags.LEVEL3
     *
     *  See '{@link #level4Mask}' for details.
     */
    config Diags.Mask level3Mask = 0;

    /*!
     *  ======== level4Mask ========
     *  Mask of diags categories whose initial filtering level is Diags.LEVEL4
     *
     *  If `{@link xdc.runtime.IFilterLogger.filterByLevel}` is `true`, then all
     *  `LoggerBuf` instances will filter incoming events based on their
     *  event level.
     *
     *  The `LoggerBuf` module allows for specifying a different filter level
     *  for every `Diags` bit. These filtering levels are module wide;
     *  `LoggerBuf` does not support specifying the levels on a per-instance
     *  basis.
     *
     *  The `{@link xdc.runtime.IFilterLogger.setFilterLevel}` function can be used to
     *  change the filtering levels at runtime.
     *
     *  The default filtering levels are assigned using the `level1Mask` -
     *  `level4Mask` config parameters. These are used to specify, for each of
     *  the four event levels, the set of bits which should filter at that
     *  level by default.
     *
     *  The default filtering configuration sets the filter level to
     *  `Diags.LEVEL4` for all logging-related diags bits so that all events
     *  are logged by default.
     */
    config Diags.Mask level4Mask = Diags.ALL_LOGGING;

    /*!
     *  ======== flushAll ========
     *  Flush logs of all instances that set `exitFlush` to true
     *
     *  The user is responsible for making sure that no `LoggerBuf` instances
     *  are created or deleted during the execution of this function.
     */
    Void flushAll();

    /*!
     *  ======== flushAllInternal ========
     *  @_nodoc
     */
    Void flushAllInternal(Int stat);

    /*!
     *  ======== initDecoder ========
     * @_nodoc
     *  Initialize the LoggerBufDecoder for use in the LoggerBuf 'Records' ROV
     *  view.
     */
    function initDecoder();

instance:
    /*!
     *  ======== create ========
     *  Create a `LoggerBuf` logger
     *
     *  @see LoggerBuf#Params
     */
    create();

    /*!
     *  ======== numEntries ========
     *  Number of entries in buffer
     *
     *  Each entry is large enough to store one `Log` event containing up to
     *  4 optional arguments.  Events containing more than 4 arguments (such
     *  as those from `{@link xdc.runtime.Log#write5}`) use 2 entries.
     *
     *  `numEntries` must be a power of 2.
     */
    config Int numEntries = 64;

    /*!
     *  ======== bufType ========
     *  Log buffer type
     */
    config BufType bufType = BufType_CIRCULAR;

    /*!
     *  ======== exitFlush ========
     *  Flush log at system exit
     *
     *  Only used when module parameter `{@link #enableFlush}` is `true`.
     */
    config Bool exitFlush = false;

    /*!
     *  ======== bufSection ========
     *  Section name for the buffer managed by the static instance.
     *
     *  The default section is the 'dataSection' in the platform.
     */
    metaonly config String bufSection = null;

    /*!
     *  ======== bufHeap ========
     *  The heap that contains the `Log` buffer for dynamic instances.
     *
     *  The default value `null` means the buffer will be allocated from
     *  the `{@link xdc.runtime.Memory#defaultHeapInstance}` heap.
     */
    config IHeap.Handle bufHeap = null;

    /*!
     *  ======== reset ========
     *  Reset a log to empty state and enable it
     *
     *  @a(WARNING)  This method is not synchronized with other instance
     *  methods and, as a result, it must never be called when there is a
     *  chance that another instance method is currently in operation or
     *  when another method on this instance may preempt this call.
     */
    Void reset();

    /*!
     *  ======== flush ========
     *  Read, clear, and output the contents of the log
     *
     *  This method reads, clears, and "prints" each `Log` event (via
     *  `{@link xdc.runtime.System#printf}`) in the log.
     */
    Void flush();

    /*!
     *  ======== getNextEntry ========
     *  Fills the passed `{@link xdc.runtime.Log#EventRec}` with the next entry in the log.
     *
     *  This function is used to read and clear `Log` events from the
     *  buffer maintained by the `LoggerBuf` instance. The `Log` event can
     *  then be transmitted and displayed on a host.
     *
     *  A read pointer is maintained in the `LoggerBuf` instance and
     *  points to the next record to read.  Entries are not necessarily
     *  returned in chronological order, since buffers of type
     *  `{@link #BufType_CIRCULAR}` can wrap.
     *
     *  @param(evtRec) pointer to a supplied `EventRec` object where the next
     *                 entry in the log is copied to
     *
     *  @a(returns)
     *  This function reports the number of entries actually read. The only
     *  values that can be returned are:
     *  @p(blist)
     *      - 0   no more entries to read
     *      - 1 or 2 read a complete entry written by `write4` or `write8`
     *      - -1  cleared an incomplete/overwritten entry, more entries to read
     */
    Int getNextEntry(Log.EventRec *evtRec);

internal:

    Bool filterOutEvent(Diags.Mask mask);

    /*
     *  ======== instanceStartup ========
     */
    Void instanceStartup(Object *obj);

    const Int8 FULL = -1;
    const Int8 WRAP = 0;

    const Int8 NEXT = 1;

    struct Entry {
        Types.Timestamp64 tstamp;
        Bits32 serial;
        Types.Event evt;
        IArg arg1;
        IArg arg2;
        IArg arg3;
        IArg arg4;
    };

    struct Module_State {
        Diags.Mask level1;
        Diags.Mask level2;
        Diags.Mask level3;
    };

    struct Instance_State {
        IHeap.Handle bufHeap;
        Entry entryArr[];
        Entry *curEntry;
        Entry *endEntry;
        Entry *readEntry;
        Bits32 serial;
        Int16 numEntries;
        Int8 advance;
        Bool enabled;
        Bool flush;
    };

}
