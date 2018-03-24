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
function toggle(e)
{
    if (e.className == 'open') {
        e.className = 'closed';
    }
    else if (e.className == 'closed') {
        e.className = 'open';
    }
}

function cancel(e)
{
    if (window.event) {
        window.event.cancelBubble = true;   // ie
    }
    else if (e.stopPropagation)  {
        e.stopPropagation();                // firefox
    }
}
