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

/*
 *  ======== instance$meta$init ========
 */
function instance$meta$init(controllerID)
{    
    this.$private.controller = 
	xdc.jre.com.ti.dvt.server4.ControllerMap.getController(controllerID);
}

/*
 *  ======== updateStartupProgress ========
 */
function updateStartupProgress(percent, message)
{
    this.$private.controller.updateStartupProgress(percent, message);
}

/*
 *  ======== getAbortFlag ========
 */
function getAbortFlag()
{
    return (this.$private.controller.getAbortFlag());
}
