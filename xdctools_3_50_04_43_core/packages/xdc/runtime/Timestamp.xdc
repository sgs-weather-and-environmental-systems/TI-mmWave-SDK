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
 *  ======== Timestamp.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== Timestamp ========
 *  Timestamp services
 *
 *  This module provides `{@link xdc.runtime.ITimestampClient}` APIs for
 *  the xdc Runtime Support Library. Calls to these APIs are forwarded
 *  to a platform specific `{@link xdc.runtime.ITimestampProvider}`
 *  implementation.
 *
 *  A user can attach their own ITimestampProvider module
 *  using the following config file command:
 *  @p(code)
 *
 *  xdc.runtime.Timestamp.SupportProxy = xdc.useModule("usersTimestampProvider");
 *  @p
 *  If no such `{@link #SupportProxy SupportProxy}` initialization is done,
 *  the `{@link xdc.runtime.TimestampNull}` ITimestampProvider implementation,
 *  which provides null stubs for the APIs, will be attached by default.
 *
 *  If the user is developing code using CCS, the
 *  `{@link xdc.runtime.TimestampStd}`
 *  ITimestampProvider implementation, which uses the ANSI C clock()
 *  function, may provide a satisfactory timestamp source (remember to
 *  enable the profile clock in CCS).
 *
 *  To use the TimestampStd implementation, add the following to
 *  your config script:
 *  @p(code)
 *
 *  xdc.runtime.Timestamp.SupportProxy = xdc.useModule("xdc.runtime.TimestampStd");
 *  @p
 */
module Timestamp inherits ITimestampClient {

    /*!
     *  ======== SupportProxy ========
     *  User supplied time stamp provider module.
     *
     *  The SupportProxy module provides application/platform
     *  specific implementations of the 
     *  `{@link xdc.runtime.ITimestampProvider}` APIs.
     *
     *  If not explicitly supplied by the user, this proxy defaults to
     *  `{@link xdc.runtime.TimestampNull}`, 
     *  which provides null stubs for all of the ITimestampProvider APIs.
     */
    proxy SupportProxy inherits ITimestampProvider;
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:27; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

