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

var desc = "A repository is a directory of packages. By choosing " +
    "repositories to include on the package path, you choose the set " +
    "of packages and their versions available to your project."

function init(parent, params) {
    var self = this;
    this.db = params.db;
    this.$public.name = "Repositories";
    this.$public.title = "Choose repositories to use in project";

    with (Gui) {
        WID(parent);
            GRID();
                $w.setLayoutData(GD(GD.FILL_BOTH));
                LBL(desc, Gui.SWT.WRAP, 20);
this.pathEditor =
                this.$public.$package.PathEditor.create($w);
                WID(this.pathEditor.control);
                    $w.setLayoutData(GD(GD.FILL_BOTH));
                    $w.addListener(
                        this.pathEditor.$module.PATH_CHANGED,
                        function (e) { self.db.setPath(e.data); }
                    );
                END();
            END();
        END();
    }

    this.pathEditor.setPath(this.db.getPath());
}
/*
 *  @(#) xdc.tools.configuro.sg; 1,0,0,0; 1-9-2017 12:51:24; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

