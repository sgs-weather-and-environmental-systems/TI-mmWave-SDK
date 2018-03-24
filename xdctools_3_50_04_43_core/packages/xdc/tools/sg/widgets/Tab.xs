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
var Gui = xdc.loadCapsule('Gui.xs');

function instance$meta$init(parent, capsuleName, params) {
    /* set up delegates from the capsule */
    this.setCapsule(capsuleName);

    with (Gui) {
        WID(parent);
this.control =
            GRID();
                $w.setLayoutData(GD(GD.FILL_BOTH));
        
                /* title */
var title =     LBL(this.title);
                HR();

                /* content */
                this.capsule.init.call(this.$private, $w, params);

                /* go back and fix up the title */
                title.setText(this.title);
                HR();
            END();
        END();
    }
}
/*
 *  @(#) xdc.tools.sg.widgets; 1,0,0,0; 1-9-2017 12:51:58; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

