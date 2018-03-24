/* --COPYRIGHT--,EPL
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * --/COPYRIGHT--*/
package xdc.rov.server

/*!
 *  ======== DSCallStack ========
 *  @_nodoc
 *  This module provides call stack services to xdc.rov
 *
 *  Instances of this module are created by the ROV server
 *  (`{@link Main}`) in this package.  This server uses instances of
 *  this module to initialize `{@link xdc.rov.Model}`; the module
 *  responsible for initializing the ROV model.
 *
 *  The implementation of this module requires an implementation
 *  of the Java `ICallStack` interface by an instance object
 *  provided by:
 *  @p(code)
 *      com.ti.dvt.server4.ControllerMap.getController(id).getCallStack()
 *  @p
 *  where id is the the id of the "controller" instance that started the
 *  ROV server `xdc.rov.server.Main`.
 */
metaonly module DSCallStack inherits xdc.rov.ICallStack
{
  instance:
    create(Int controllerID);
}
