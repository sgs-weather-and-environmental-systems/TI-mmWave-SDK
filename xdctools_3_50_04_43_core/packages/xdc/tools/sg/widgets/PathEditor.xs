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

/********************************************************/
/* public methods */

function setPath(path) {
    /* remove empty repositories and convert to real Javascript array */
    var userPath=[];
    for (var i = 0; i < path.length; i++) {
        if (path[i] != '') {
            userPath.push(path[i]);
        }
    }

    /* remove the XDC repositories */
    userPath = userPath.slice(0, userPath.length - this.$private.numXdcRepos);

    /* and now set it */
    this.setUserPath(userPath);
}

function setUserPath(path) {
    with (this.$private) {
        table.removeAll();
        with (Gui) {
            this.$private.numUserRepos = 0;
            for (var i = 0; i < path.length; i++) {
                /* ignore empty items */
                if (path[i] == '') {
                    continue;
                }

                this.$private.numUserRepos++;
                var item = widgets.TableItem(table, SWT.NONE);
                item.setText(path[i]);
            }
            if (this.addXDCRepositories) {
                for (var i = 0; i < numXdcRepos; i++) {
                    var item = widgets.TableItem(table, SWT.NONE);
                    item.setText(xdcRepos[i]);
                }
            }
        }
    }
    notifyPathChange.call(this);
    updateButtons.call(this);
}

function getUserPath() {
    var path = [];
    var items = this.$private.table.getItems();
    for (var i=0; i<this.$private.numUserRepos; i++) {
        path.push(items[i].getText()+'');
    }
    return path;
}

function getPath() {
    return this.getUserPath().concat(this.$private.xdcRepos);
}

function add(dir) {
    var item = Gui.widgets.TableItem(this.$private.table, Gui.SWT.NONE, 0);
    item.setText(dir);
    this.$private.numUserRepos++;
    notifyPathChange.call(this);
    updateButtons.call(this);
}

function remove(index) {
    if (index < 0 || index >= this.$private.numUserRepos) {
        return false;
    }

    with (this.$private) {
        /* save the selection */
        var sel = table.getSelection()[0];
        sel = sel && (table.indexOf(sel)==index);

        /* delete from the GUI */
        table.remove(index);
        this.$private.numUserRepos--;

        /* select the same index if valid */
        if (sel && table.getItemCount() > index) {
            table.select(index);
        }
    }
    notifyPathChange.call(this);
    updateButtons.call(this);

    return true;
}

function move(index, toBefore) {
    if (index == toBefore) {
        /* don't move dir, we're done */
        return;
    }

    /* save the old item so we can copy its properties */
    var table = this.$private.table;
    var oldItem = table.getItem(index);

    /* create the new item */
    var item = Gui.widgets.TableItem(table, Gui.SWT.NONE, toBefore);

    /* copy its properties */
    item.setText(oldItem.getText());
    if (table.getSelection()[0] == oldItem) {
        table.select(toBefore);
    }

    /* delete the old item */
    table.remove(table.indexOf(oldItem));
    notifyPathChange.call(this);
    updateButtons.call(this);
}

/********************************************************/
/* private methods */

/**
 * Initialize the instance and its GUI resources.
 */
function instance$meta$init(parent) {
    /* load the resources on the first instance create */
    this.$private.rsrc = loadResources.call(this, parent);

    /* store the current XDC-owned repositories */
    setXdcRepos.call(this);

    /* save a reference to this for use in the callbacks */
    var self = this;

    with (Gui) {
        WID(parent);
this.control =
            GRID(2);
this.$private.table =
                WID(widgets.Table($w, SWT.BORDER|SWT.FULL_SELECTION));
                    $w.setLayoutData(GD(GD.FILL_BOTH));
                    widgets.TableColumn($w, SWT.NONE);
                    $w.addListener(SWT.Selection, function () {
                        updateButtons.call(self);
                    });
                    $w.addListener(SWT.Resize, function () {
                        var table = self.$private.table;
                        var col = table.getColumn(0);
                        var area = table.getSize();
                        var preferredSize = table.computeSize(SWT.DEFAULT, SWT.DEFAULT);
                        var width = area.x - 2*table.getBorderWidth();
                        var vBarSize = table.getVerticalBar().getSize();
                        var hBarSize = table.getHorizontalBar().getSize();
                        if (preferredSize.y > area.y + hBarSize.y) {
                            width -= vBarSize.x;
                        }
                        col.setWidth(width);
                    });
                END();
                GRID();
this.$private.addBtn =
                    WID(widgets.Button($w, SWT.PUSH));
                        $w.setImage(this.$private.rsrc.ICO_ADD);
                        $w.setToolTipText("Add a directory to the package path...");
                        $w.addListener(SWT.Selection, function () {
                           var dir = askDir.call(self);
                           if (dir) {
                               self.add(dir);
                           }
                        });
                    END();
this.$private.upBtn =
                    WID(widgets.Button($w, SWT.PUSH));
                        $w.setImage(this.$private.rsrc.ICO_UP);
                        $w.setToolTipText("Move directory earlier in the package path");
                        $w.addListener(SWT.Selection, function () {
                            var sel = self.$private.table.getSelection()[0];
                            if (sel) {
                                var index = self.$private.table.indexOf(sel);
                                self.move(index, index-1);
                            }
                        });
                    END();
this.$private.downBtn =
                    WID(widgets.Button($w, SWT.PUSH));
                        $w.setImage(this.$private.rsrc.ICO_DOWN);
                        $w.setToolTipText("Move directory later in the package path");
                        $w.addListener(SWT.Selection, function () {
                            var sel = self.$private.table.getSelection()[0];
                            if (sel) {
                                var index = self.$private.table.indexOf(sel);
                                self.move(index, index+2);
                            }
                        });
                    END();
this.$private.delBtn =
                    WID(widgets.Button($w, SWT.PUSH));
                        $w.setImage(this.$private.rsrc.ICO_DEL);
                        $w.setToolTipText("Remove directory from the package path");
                        $w.addListener(SWT.Selection, function () {
                            var sel = self.$private.table.getSelection()[0];
                            if (sel) {
                                self.remove(self.$private.table.indexOf(sel));
                            }
                        });
                    END();
                END();
            END();
        END();
    }
}

/**
 * Return an object containing the GUI resources for this module.
 *
 * The resources are loaded once the first time this method is called,
 * from instance create. They are cached in the module's private data and
 * reused for all instances.
 */
function loadResources(parent) {
    /* if resources have already been loaded, don't do it again */
    var rsrc = this.$module.$private.rsrc;
    if (rsrc) {
        return rsrc;
    }

    rsrc = this.$module.$private.rsrc = {};
    var display = parent.getDisplay();
    with (Gui) {
        function IMG(file) {
            return graphics.Image(display, xdc.findFile(file));
        }

        rsrc.ICO_UP = IMG('xdc/tools/sg/widgets/files/prev_nav.gif');
        rsrc.ICO_DOWN = IMG('xdc/tools/sg/widgets/files/next_nav.gif');
        rsrc.ICO_ADD = IMG('xdc/tools/sg/widgets/files/add_obj.gif');
        rsrc.ICO_DEL = IMG('xdc/tools/sg/widgets/files/delete_obj.gif');
    }

    return rsrc;
}

/**
 */
function setXdcRepos() {
    var root = environment['xdc.root'].replace(/\\/g,'/') + '/packages';
    var path = environment['xdc.path'];
    var repos = path.split(';');
    var numXdcRepos = 1;
    var repo;
    
    /* delete any trailing empty repository name */
    if (repos[repos.length - 1] == '') {
        repos = repos.slice(0, repos.length - 1);
    }

    if (repos.length > 1) {
        root = java.io.File(root).getCanonicalPath() + "";
        repo = java.io.File(repos[repos.length - 1]).getCanonicalPath() + "";
        if (root != repo) {
            numXdcRepos = 2;
        }
    }

    this.$private.numXdcRepos = numXdcRepos;
    this.$private.xdcRepos = repos.slice(repos.length - numXdcRepos);
}

/**
 * Ask the user for the name of a directory.
 *
 * The directory dialog is created once for each instance. It is not shared
 * between instances, because some state is retained in the dialog -- most
 * importantly the last directory the user navigated to.
 */
function askDir() {
    var dirDlg = this.$private.dirDlg;
    if (!dirDlg) {
        var display = this.$private.table.getDisplay();
        dirDlg = this.$private.dirDlg =
            Gui.widgets.DirectoryDialog(display.getActiveShell());
        dirDlg.setMessage(
            "Choose a directory to add to the start of the package path:"
        );
    }

    return dirDlg.open();
}

/**
 * Update the enabled/disabled state of the widget's buttons.
 *
 * The buttons are updated based on the tables' current selection.
 * The last two entries in the package path, ("$XDCROOT/packages" and "^")
 * cannot be modified by the user. Other directories can be modified.
 */
function updateButtons() {
    with (this.$private) {
        var sel = table.getSelection()[0];
        var hasSel = sel!=undefined;
        var selIndex = hasSel && table.indexOf(sel);

        /* allow "up" if not already at the top, and not added by XDC. */
        var upEnabled = hasSel &&
            (selIndex > 0) && (selIndex < numUserRepos);
        upBtn.setEnabled(upEnabled);

        /* allow "down" if not already at the bottom, and not added by XDC */
        var downEnabled = hasSel && (selIndex < numUserRepos-1);
        downBtn.setEnabled(downEnabled);

        /* allow "remove" if not added by XDC */
        var delEnabled = hasSel && (selIndex < numUserRepos);
        delBtn.setEnabled(delEnabled);
    }
}

function notifyPathChange() {
    var event = Gui.widgets.Event();
    event.type = this.$module.PATH_CHANGED;
    event.widget = this.control;
    event.data = this.getPath();
    this.control.notifyListeners(this.$module.PATH_CHANGED, event);
}
/*
 *  @(#) xdc.tools.sg.widgets; 1,0,0,0; 1-9-2017 12:51:58; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

