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
var SWT = Gui.SWT;
var Wizard;
var Tab;
var DB;

function module$meta$init() {
    Wizard = this;
    Tab = this.$package.Tab;
    DB = this.$package.DB;
}

function instance$meta$init(parent, params) {
    this.$private.status = undefined;

    mkControl.call(this, parent);

    /* activate the first tab */
    activate.call(this, 0);
}

/* ---------------- GLOBAL STATE ---------------- */

function mkControl(parent) {
    var self = this;
    with (Gui) {
        WID(parent);
            /* window */
            $w.setLayoutData(GD(GD.FILL_BOTH));
        
            /* content */
this.content =
            WID(widgets.Composite($w, SWT.NONE));
                $w.setLayout(custom.StackLayout());
                $w.setLayoutData(GD(GD.FILL_BOTH));
            END();

            /* buttons */
            GRID(4, true);
                $w.setLayoutData(GD(GD.HORIZONTAL_ALIGN_END));
this.$private.backButton =
                WID(widgets.Button($w, SWT.PUSH));
                    $w.setLayoutData(GD(GD.FILL_BOTH));
                    $w.setText(" < Back ");
                    $w.addListener(SWT.Selection, function () {
                        activate.call(self, self.$private.active-1);
                    });
                END();
this.$private.fwdButton =
                WID(widgets.Button($w, SWT.PUSH));
                    $w.setLayoutData(GD(GD.FILL_BOTH));
                    $w.setText(" Next > ");
                    $w.addListener(SWT.Selection, function () {
                        activate.call(self, self.$private.active+1);
                    });
                END();
                WID(widgets.Button($w, SWT.PUSH));
                    $w.setLayoutData(GD(GD.FILL_BOTH));
                    $w.setText("Finish");
                    $w.addListener(SWT.Selection, function () {
                        self.$private.status = self.$module.FINISHED;
                    });
                END();
                WID(widgets.Button($w, SWT.PUSH));
                    $w.setLayoutData(GD(GD.FILL_BOTH));
                    $w.setText("Cancel");
                    $w.addListener(SWT.Selection, function () {
                        self.$private.status = self.$module.CANCELED;
                    });
                END();
            END();
        END();
    }
}

function activate(i) {
    var children = this.content.getChildren();

    if (i < children.length) {
        this.content.getLayout().topControl = children[i];
        this.content.layout();
    }

    this.$private.active = i;

    var fwdEnabled = i < children.length - 1;
    this.$private.fwdButton.setEnabled(fwdEnabled);
    var backEnabled = i > 0;
    this.$private.backButton.setEnabled(backEnabled);
}

function isDone() {
    return typeof(this.$private.status) !='undefined';
}

function getStatus() {
    return this.$private.status;
}
/*
 *  @(#) xdc.tools.sg.widgets; 1,0,0,0; 1-9-2017 12:51:58; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

