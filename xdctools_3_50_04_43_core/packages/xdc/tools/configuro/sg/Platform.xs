/* 
 *Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 *
 * */
var Gui = xdc.loadCapsule('xdc/tools/sg/widgets/Gui.xs');

var desc = "A platform package wraps an execution environment for use " +
    "in XDC. By choosing a platform you choose a specific device from " +
    "a device family, a board, and fix major settings such as memory map."

function init(parent) {
    this.$public.name = "Platform";
    this.$public.title = "Choose platform to build project for";

    with (Gui) {
        WID(parent);
            GRID();
                $w.setLayoutData(GD(GD.FILL_BOTH));
                LBL(desc, Gui.SWT.WRAP, 20);
                GRID(2);
                    TXT("Enter text[0]:");
                END();
            END();
        END();
    }
}
/*
 *  @(#) xdc.tools.configuro.sg; 1,0,0,0; 1-9-2017 12:51:24; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

