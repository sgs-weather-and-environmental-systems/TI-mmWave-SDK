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
/* ---------------- SWT ALIASES ---------------- */

var browser = xdc.jre.org.eclipse.swt.browser;
var custom = xdc.jre.org.eclipse.swt.custom;
var graphics = xdc.jre.org.eclipse.swt.graphics;
var layout = xdc.jre.org.eclipse.swt.layout;
var widgets = xdc.jre.org.eclipse.swt.widgets;
var events = xdc.jre.org.eclipse.swt.events;

var SWT = xdc.jre.org.eclipse.swt.SWT;
var GD = layout.GridData;


/* ---------------- WIDGET STACK ---------------- */

var DISABLED = false;
var ENABLED = true;

var $w$stack = [];
var $w = undefined;

function WID( w ) { $w$stack.push($w); $w = w; return $w }

function END() { $w = $w$stack.pop(); return $w }

/* ---------------- BASIC WIDGETS --------------- */

function LBL(text, style, width) {
    var w = WID(widgets.Label($w, style? style : SWT.NONE));
        $w.setText(text);
        if (width) {
            var gd = GD(GD.HORIZONTAL_ALIGN_FILL | GD.GRAB_HORIZONTAL);
//            gd.widthHint = width;
            $w.setLayoutData(gd);
        }
    END();
    return w;
}

function HR() {
    var w = WID(widgets.Label($w, SWT.SEPARATOR | SWT.HORIZONTAL));
        $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
    END();
    return w;
}

function GRID(ncols, equal) {
    WID(widgets.Composite($w, SWT.NONE));
        if (!ncols) {
            ncols = 1;
        }
        if (!equal) {
            equal = false;
        }
        $w.setLayout(layout.GridLayout(ncols, equal));
    return $w;
}

/* ------------------ HELPER WIDGETS ------------------ */

function TXT(label, value) {
    LBL(label);
    var w = WID(widgets.Text($w, SWT.BORDER));
        $w.setText(value? value : "");
    END();
    return w;
}

function BAR( prnt, style )
{
    var bar = widgets.ToolBar(prnt, style);
    bar.setCursor(rsrc.CUR_HAND);

    return bar;
}

function BTN( tb, style, icon, tip, eflg )
{
    var but = widgets.ToolItem(tb, style);
    
    but.setImage(icon);
    but.setToolTipText(tip);
    but.setEnabled(eflg ? true : false);

    return but;
}
/*
 *  @(#) xdc.tools.sg.widgets; 1,0,0,0; 1-9-2017 12:51:58; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

