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
xdc.loadPackage("xdc.tools.sg");
var swt = Packages.org.eclipse.swt;
var SWT = swt.SWT;

/**
 * check whether the name is a Java class in the given package
 */
function isJavaClass(pkg, name) {
    var str = pkg[name]+'';
    return str.match(/\[JavaClass /);
}

/**
 * find a Java class or declaration in a small set of packages
 */
function findJavaClass(name) {
    if (isJavaClass(swt.widgets, name)) {
        return swt.widgets[name];
    }
    else if (isJavaClass(swt.custom, name)) {
        return swt.custom[name];
    }
    else if (isJavaClass(swt.layout, name)) {
        return swt.layout[name];
    }
    return undefined;
}

function findJavaConst(name) {
    if (name in swt.layout.GridData) {
        return swt.layout.GridData[name];
    }
    else if (name in swt.SWT) {
        return swt.SWT[name];
    }
    return undefined;
}

function mkWidget(x, parent, ids) {
    /* create id hash if it doesn't already exist */
    if (!ids) {
        ids = {};
    }

    var name = x.localName();
    var clazz = undefined;
    if (name == null) {
        /* text field, by default */
        var t = x.toString();
        /* only set if there's some non-whitespace character */
        if (t.match(/\S/)) {
            /* remove leading and trailing white space */
            parent.text = t.replace(/^\s+|\s+$/g,'');
        }
    }
    else if (name == "gridData") {
        var gd = SWT.NONE;
        for each (var p in x.toString().split(/\W+/)) {
            gd |= findJavaConst(p);
        }
        w = swt.layout.GridData(gd);
        parent.setLayoutData(w);
    }
    else if (name == "id") {
        ids[x.toString()] = parent;
    }
    else if (name == "defaultItem" && parent instanceof swt.widgets.Menu) {
        parent.defaultItem = parent.getItem(x);
    }
    else if (name == "selection" && parent instanceof swt.widgets.TreeItem) {
        parent.parent.selection = parent.getItem(x);
    }
    else if (name == "selection" && parent instanceof swt.widgets.Tree) {
        parent.selection = parent.getItem(x);
    }
    else if (name in parent) {
        /* a field */
        if (name == "layout") {
            /* layout field */
            parent.setLayout(swt.layout[x.toString()]());
        }
        else if (name == "image") {
            var image = swt.graphics.Image(parent.display, xdc.findFile(x.toString()));
            parent.image = image;
        }
        else if (name == "weights") {
            parent.setWeights(eval('['+x.toString()+']'));
        }
        else if (name == "font") {
            var fd = parent.font.getFontData()[0];
            fd.setStyle(SWT[x.toString()]);
            parent.font = swt.graphics.Font(parent.display, fd);
        }
        else if (typeof(parent[name]) == "boolean") {
            parent[name] = eval(x.toString());
        }
        else {
            parent[name] = x.toString();
        }
    }
    else if (clazz = findJavaClass(name)) {
        /* a widget */
        var w;
        var style = SWT.NONE;
        if (x.@style) {
            for each (var p in x.@style.toString().split(/\W+/)) {
                style |= findJavaConst(p);
            }
        }
        if (name == "Menu") {
            if (style) {
                /* find the shell */
                var shell = parent;
                while (!shell.shell) {
                    shell = shell.parent;
                }
                shell = shell.shell;

                /* create the menu as a pop-up in the shell */
                w = clazz(shell, style);
                if (style & SWT.BAR) {
                    shell.setMenuBar(w);
                }
                else {
                    parent.data = w;
                }
            }
            else {
                /* create the menu as a pop-up for the widget */
                w = clazz(parent);
                if ("setMenu" in parent) {
                    parent.setMenu(w);
                }
            }
        }
        else if ("setControl" in parent) {
            w = clazz(parent.parent, style);
            parent.setControl(w);
        }
        else if (name.match(/Layout$/)) {
            w = clazz();
            parent.setLayout(w);
        }
        else if (name == "GridData") {
            w = clazz(style);
            parent.setLayoutData(w);
        }
        else if (name == "RowData") {
            w = clazz();
            parent.setLayoutData(w);
        }
        else {
            w = clazz(parent, style);
        }
        for each (var p in x.attributes()) {
            if (p.localName() == "style") {
                continue;
            }
            mkWidget(p, w, ids);
        }
        for each (var p in x.children()) {
            mkWidget(p, w, ids);
        }
    }
    else {
        throw new Error("can't find property \"" + name + "\" of " + parent);
    }

    return ids;
}
/*
 *  @(#) xdc.tools.sg.widgets; 1,0,0,0; 1-9-2017 12:51:58; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

