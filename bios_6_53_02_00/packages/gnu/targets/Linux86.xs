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
 *  ======== Linux86.getISAChain ========
 *  Linux86 implementation for ITarget.getISAChain()
 */
function getISAChain (isa)
{
    var myChain = ["x86", this.isa];
    var isaIn = (isa == null ? this.isa : isa);

    for (var i = 0; i < myChain.length; i++) {
        if (myChain[i] == isaIn) {
            break;
        }
    }

    if (i == myChain.length) {
        return (null);
    }
    else {
        return (myChain.slice(0, i + 1));
    }
}

/*
 *  @(#) gnu.targets; 1, 0, 1,0; 11-8-2017 17:20:10; /db/ztree/library/trees/xdctargets/xdctargets-p04/src/ xlibrary

 */

