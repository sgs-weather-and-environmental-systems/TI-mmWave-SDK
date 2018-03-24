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
 *  ======== ITimestampProvider.xdc ========
 */
package xdc.runtime;

/*!
 *  ======== ITimestampProvider ========
 *  Timestamp provider interface
 *
 *  This interface is implemented by platform-specific modules that
 *  "provide" underlying timestamp services for the
 *  `{@link xdc.runtime.Timestamp}` module.
 *
 *  Only the `{@link xdc.runtime.Timestamp}` module and the
 *  `{@link xdc.runtime.ITimestampClient}` interface should be directly
 *  referenced by platform-independent applications.
 *
 *  This interface is part of a design pattern that includes the
 *  `ITimestampClient` interface and the `Timestamp` module.  This pattern
 *  allows client code to:
 *  @p(blist)
 *      - use the platform-independent interfaces provided by either
 *        `ITimestampClient` and `Timestamp` and remain 100% portable
 *      - optionally leverage platform-specific capabilities
 *        of any module that implements `ITimestampProvider` and still always
 *        have access to the platform-independent methods specified by
 *        `ITimestampClient` (because `ITimestampProvider` inherits from
 *        `ITimestampClient`)
 *  @p
 *  This pattern is in contrast to other "provider" interfaces that exist only
 *  to specify the methods necessary to enable "higher-level" modules; client
 *  code *never* accesses these provider interfaces directly, clients always
 *  only use the higher-level modules.
 */
interface ITimestampProvider inherits ITimestampClient {
}
/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

