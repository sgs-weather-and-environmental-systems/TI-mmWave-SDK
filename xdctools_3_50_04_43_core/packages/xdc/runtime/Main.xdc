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
 *  ======== Main.xdc ========
 */

package xdc.runtime;

/*!
 *  ======== Main ========
 *  Configuration "stand-in" for application code.
 *
 *  This module is used to enable "module" configuration of application code
 *  that is not part of a module.  Configuration of this `Main` module is
 *  used for all code not in a module.
 *
 *  For example, an `ILogger` "service provider" for all code that is not in
 *  a RTSC module can be configured by setting this module's `logger`;  when
 *  code that is not in a module calls `Log_print()`, for example, this
 *  module's `ILogger` handles the event.
 *
 *  Since this module is "gated", the user can also assign a gate to this
 *  module for use by any code that is not in a module.  This gate can be used
 *  to serialize access to global data by multiple threads in the system.
 *  @p(code)
 *      #include <xdc/runtime/Main.h>
 *      #include <xdc/runtime/Gate.h>
 *          :
 *      int global = 0;
 *      int main() {
 *          :       // create a bunch of threads
 *      }
 *
 *      void thread() {
 *          IArg key = Gate_enterModule();  // enter critical section
 *          global++;                       // safely update global data
 *          Gate_leaveModule(key);          // leave critical section
 *      }
 *  @p
 */
@Gated
module Main {
};

/*
 *  @(#) xdc.runtime; 2, 1, 0,0; 11-8-2017 17:11:26; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

