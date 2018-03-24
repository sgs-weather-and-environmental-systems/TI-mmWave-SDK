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
var SWT = Gui.SWT;
var Main;
var Wizard;
var DB;
var Tab;

function module$meta$init() {
    Main = this;
    var sgw = xdc.loadPackage('xdc.tools.sg.widgets');
    Wizard = sgw.Wizard;
    DB = sgw.DB;
    Tab = sgw.Tab;
}

/* ---------------- GLOBAL STATE ---------------- */

var args;

var w_display, w_shell;

var app = {};

var rsrc = {};

var cmd = {};

/* ---------------- MAIN ---------------- */

function main( args )
{
    try {
        w_display = Gui.widgets.Display();
    
        w_shell = new Gui.widgets.Shell(w_display, SWT.SHELL_TRIM);
        var gl = Gui.layout.GridLayout();
        var gd = Gui.layout.GridData();
        w_shell.setLayout(gl);
        w_shell.setLayoutData(gd);
        w_shell.setText('New Project Wizard'); 
 
        var db = DB.create();
        var wiz = Wizard.create(w_shell);
        var path = Tab.create(wiz.content, 'Path.xs', {db:db});
        var targ = Tab.create(wiz.content, 'Target.xs', {db:db});
        var plat = Tab.create(wiz.content, 'Platform.xs', {db:db});
        wiz.activate(0);

        w_shell.setFocus();
        w_shell.setSize(400, 350);
        w_shell.open();
        while (!w_shell.isDisposed() && !wiz.isDone()) {
            if (!w_display.readAndDispatch()) {
                w_display.sleep();
            }
        }
    }
    catch (e) {
        print(e);
    }
    finally {
        w_display.dispose();
    }
}
/*
 *  @(#) xdc.tools.configuro.sg; 1,0,0,0; 1-9-2017 12:51:24; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

