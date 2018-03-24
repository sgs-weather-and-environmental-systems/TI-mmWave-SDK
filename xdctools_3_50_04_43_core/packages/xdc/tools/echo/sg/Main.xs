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
/* 'xs' command invocation only */
if (xdc.om.$name == null) {

/* ---------------- GLOBAL STATE ---------------- */

var w_display, w_shell, w_label;

/* ---------------- SWT ALIASES ---------------- */

var graphics = xdc.jre.org.eclipse.swt.graphics;
var layout = xdc.jre.org.eclipse.swt.layout;
var widgets = xdc.jre.org.eclipse.swt.widgets;

var SWT = xdc.jre.org.eclipse.swt.SWT;

/* ---------------- DISPLAY RESOURCES ---------------- */

w_display = widgets.Display();

var ICO_SOG = graphics.Image(w_display, xdc.findFile('xdc/tools/sg/icons/sog.ico'));

/* ---------------- WIDGET TREE ---------------- */

w_shell = widgets.Shell(w_display, SWT.SHELL_TRIM);
    w_shell.setLayout(layout.RowLayout());
    w_shell.setText('echo');
    w_shell.setImage(ICO_SOG);
    w_shell.setSize(200, 200);

w_label = widgets.Label(w_shell, SWT.NONE);

/* ---------------- FUNCTIONS ---------------- */

/*
 *  ======== main ========
 */
function main( args )
{
    w_label.setText(args.length > 0 ? args.join(' ') : '<silence>');
    w_shell.open();
    
    while (!w_shell.isDisposed()) {
        if (!w_display.readAndDispatch()) {
            w_display.sleep();
        }
    }
    w_display.dispose();
}

}
/*
 *  @(#) xdc.tools.echo.sg; 1, 0, 0,0; 1-9-2017 12:51:29; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

