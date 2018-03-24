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
/*
 *  ======== RepoRestore.xs ========
 *
 */

/* ---------------- SWT ALIASES ---------------- */

/*
 *  ======== _initSWT ========
 */
function _initSWT()
{
    if (!swtInited) {
        custom = xdc.jre.org.eclipse.swt.custom;
        graphics = xdc.jre.org.eclipse.swt.graphics;
        layout = xdc.jre.org.eclipse.swt.layout;
        widgets = xdc.jre.org.eclipse.swt.widgets;
        events = xdc.jre.org.eclipse.swt.events;
        dnd = xdc.jre.org.eclipse.swt.dnd;
        SWT = xdc.jre.org.eclipse.swt.SWT;
        GD = layout.GridData;
        swtInited = true;
    }
}

var w_dlg;
var w_shell;
var w_table;
var w_searchPath;
var w_display;
var w_log;
var w_btnRestore;

var repoEditor = null;
var editText = null;
var editItem = null;
var curFileName;
var allReposArr = [];
var results = "";
var swtInited = false;

/* status */
var NOT_RESTORED_STR = "not restored";
var RESTORED_STR = "restored";
var INTACT_STR = "intact";
var NO_PACKAGES_STR = "no packages";

var SRC_REPOSITORY_COL_INDEX = 0;
var DEST_REPOSITORY_COL_INDEX = 1;
var STATUS_COL_INDEX = 2;
var PACKAGE_INDEX = 0;
var VERSION_INDEX = 4;

var REPO_DLG_MSG_STR = "Browse for a Repository";
var REPO_DLG_TITLE_STR = "Select an empty destination repository to restore to,\n\
or click \"Make New Folder\"to create a new repository";
var PKGS_NOT_FOUND_STR = "packages not found: ";
var HELP_TEXT_STR = "To select a new destination repository, double-click on the\
 cell of repository you wish to change.\n\
Selecting \"Done\" will display repositories in their current state.";
var MUST_BE_EMPTY_STR = " must be empty";


/*
 *  ======== _mkDlg ========
 */
function _mkDlg() {
    var $w$stack = [];
    var $w = w_shell;

    function WID( w ) { $w$stack.push($w); $w = w; return $w; }
    function END() { $w = $w$stack.pop(); return $w; }

    /* Composite */
    WID(widgets.Composite($w, SWT.NULL|SWT.BORDER));
        $w.setLayoutData(layout.GridData(SWT.FILL , SWT.FILL, true, true));
        var $gl = layout.GridLayout();
        $w.setLayout($gl);

        WID(widgets.Composite($w, SWT.NULL|SWT.BORDER));
            $w.setLayoutData(layout.GridData(SWT.FILL , SWT.TOP, true, false));
            var $gl = layout.GridLayout(2, false);
            $w.setLayout($gl);

            WID(widgets.Label($w, SWT.NONE));
                $w.setText('Search path:  ');
            END();
w_searchPath = 
            WID(widgets.Text($w, SWT.BORDER|SWT.SINGLE));
                $w.setLayoutData(layout.GridData(SWT.FILL , SWT.TOP, true,
                                                 false));
            END();
       END();
w_table =
        WID(widgets.Table($w, SWT.BORDER|SWT.CHECK));
            var $gd = layout.GridData(SWT.LEFT , SWT.TOP, true, true);
            $gd.minimumHeight = 160;
            $w.setLayoutData($gd);
            $w.setLinesVisible(true);
            $w.setHeaderVisible(true);
            $w.addMouseListener(new events.MouseListener({
                mouseDoubleClick: function(e) { _cellDoubleClicked(e); },
                mouseDown: function(e) { _cellMouseDown(e); },
                mouseUp: function(e) {}
            }));
            $w.addSelectionListener(new events.SelectionListener({
                widgetSelected: function(e) { _itemSelected(e); },
                widgetDefaultSelected: function(e) {}
            }));
            WID(widgets.TableColumn($w, SWT.NONE));
                $w.setWidth(280);
                $w.setText("Original Repository");
            END();
            WID(widgets.TableColumn($w, SWT.NONE));
                $w.setWidth(280);
                $w.setText("Destination Repository");
            END();
            WID(widgets.TableColumn($w, SWT.NONE));
                $w.setWidth(105);
                $w.setText("Status");
            END();
        END();
        WID(widgets.Label($w, SWT.NONE));
            $w.setText('Log');
            $gd = layout.GridData(SWT.BEGINNING , SWT.BEGINNING,
                                  false, false);
            $w.setLayoutData($gd);
        END();
w_log = 
        WID(widgets.Text($w, SWT.BORDER|SWT.MULTI|SWT.READ_ONLY|SWT.WRAP|SWT.V_SCROLL));
            var $gd = layout.GridData(SWT.FILL, SWT.BEGINNING, true, true);
            $gd.minimumHeight = 160;
            $w.setLayoutData($gd);
            $w.setBackground(graphics.Color(w_display, 255, 255, 255));
        END();
        WID(widgets.Composite($w, SWT.NULL));
            $w.setLayoutData(layout.GridData(SWT.FILL , SWT.FILL, true, true));
            var $gl = layout.GridLayout(2, false);
            $w.setLayout($gl);

            WID(widgets.Label($w, SWT.NONE));
                $w.setLayoutData(layout.GridData(SWT.BEGINNING, SWT.BEGINNING,
                                                 false, false));
                $w.setText(HELP_TEXT_STR);
            END();
            WID(widgets.Composite($w, SWT.NULL));
                var $gl = layout.GridLayout(3, false);
                $w.setLayout($gl);
                $w.setLayoutData(layout.GridData(SWT.END, SWT.END, true, true));
w_btnRestore = 
                WID(widgets.Button($w, SWT.PUSH));
                    $w.setText("Restore");
                    $w.addListener(SWT.Selection, function(e){ _restore(); });
                END();
                WID(widgets.Button($w, SWT.PUSH));
                    $w.setText("Done");
                    $w.addListener(SWT.Selection, function(e){ _close(); });
                END();
           END();
        END();
    END();
}


/*
 *  ======== _browseReposDlg ========
 */
function _browseReposDlg(item)
{
    var dlg = widgets.DirectoryDialog(w_shell);
    dlg.setText(REPO_DLG_MSG_STR);
    dlg.setMessage(REPO_DLG_TITLE_STR);

    /* Calling open() will open and run the dialog. */
    /* It will return the selected directory, or    */
    /* null if user cancels                         */
    var dir = dlg.open();
    while (true) {
        if (dir != null) {
            if (java.io.File(dir).list().length > 0) {
                var msgBox = widgets.MessageBox(w_shell,
                                                SWT.OK | SWT.ICON_ERROR);
                msgBox.setText("Error");
                msgBox.setMessage(dir + MUST_BE_EMPTY_STR);
                msgBox.open();
            }
            else {
                _disposeRepoEditor();
                item.setText(DEST_REPOSITORY_COL_INDEX,
                             ("" + dir).replace(/\\/g, '/'));
                break;
            }
        }
        else {
            _disposeRepoEditor();
            break;
        }
        dir = dlg.open();
    }
}

/*
 *  ======== _cellDoubleClicked ========
 */
function _cellDoubleClicked(e)
{
    var rect;
    var items = w_table.getItems();
    for each (var item in items) {
        rect = item.getBounds(DEST_REPOSITORY_COL_INDEX);
        if (rect.contains(e.x, e.y)) {
            if (item.getText(STATUS_COL_INDEX) == NO_PACKAGES_STR ||
                item.getText(STATUS_COL_INDEX) == INTACT_STR ||
                item.getText(STATUS_COL_INDEX) == RESTORED_STR) {
                break;      /* if intact or restored, ignore */
            }
            var font = item.getFont();
            var fdata = font.getFontData();
            var editorFont = graphics.Font(w_display,
                                           fdata[0].getName(),
                                           fdata[0].getHeight() - 1,
                                           fdata[0].getStyle());
            repoEditor = custom.TableEditor(w_table);
            var composite = widgets.Composite(w_table, SWT.NONE);
            var gridLayout = layout.GridLayout(2, false);

            gridLayout.marginWidth = 0;
            gridLayout.marginHeight = 0;

            composite.setLayout(gridLayout);
            var text = widgets.Text(composite, SWT.SINGLE|SWT.BORDER);
            text.setFont(editorFont);
            text.setText(item.getText(DEST_REPOSITORY_COL_INDEX));
            var gd = layout.GridData(SWT.FILL, SWT.FILL, true, true);
            text.setLayoutData(gd);
            text.addListener(SWT.DefaultSelection, function(e){ _textReturnEvent(e); });

            var btn = widgets.Button(composite, SWT.PUSH);
            btn.setFont(editorFont);
            btn.setText("...");
            var gd = layout.GridData(SWT.FILL, SWT.CENTER, false, false);
            gd.heightHint = rect.height;
            btn.computeSize(SWT.DEFAULT, gd.heightHint, false);
            btn.setLayoutData(gd);
            btn.addListener(SWT.Selection, function(e)
                            { _browseReposDlg(item); });

            composite.pack();
            repoEditor.horizontalAlignment = SWT.LEFT;
            repoEditor.grabHorizontal = true;
            repoEditor.grabVertical = true;
            repoEditor.minimumWidth = 50;
            repoEditor.setEditor(composite, item, DEST_REPOSITORY_COL_INDEX);
            text.setFocus();
            text.setSelection(0, text.getCharCount() + 1);

            editText = text;
            editItem = item;
            break;
        }
    }
}

/*
 *  ======== _cellMouseDown ========
 */
function _cellMouseDown(e)
{
    if (repoEditor != null) {
        if (editItem != null && editText != null) {
            editItem.setText(DEST_REPOSITORY_COL_INDEX, editText.getText());
        }
        _disposeRepoEditor();
    }
}


/*
 *  ======== _close ========
 */
function _close()
{
    results = w_searchPath.getText() + "\n";
    var items = w_table.getItems();
    for each (var item in items) {
        results += item.getText(SRC_REPOSITORY_COL_INDEX) + ";";
    }
    results += '\n';
    for each (var item in items) {
        results += item.getText(DEST_REPOSITORY_COL_INDEX) + ";";
    }
    w_shell.dispose();
}

/*
 *  ======== _disposeRepoEditor ========
 */
function _disposeRepoEditor()
{
    if (repoEditor.getEditor() != null) {
        repoEditor.getEditor().dispose();
    }
    editItem = null;
    editText = null;
 }

/*
 *  ======== _textReturnEvent ========
 */
function _textReturnEvent(e)
{
    _cellMouseDown(e);
}

/*
 *  ======== _getRepoPackagesInfo ========
 */
function _getRepoPackagesInfo(repo)
{
    var pathMain = xdc.useModule('xdc.tools.path.Main');
    try {
        return (pathMain.exec(['-a', '-d'].concat("" + repo)));
    }
    catch (e) {
        var msgBox = widgets.MessageBox(w_shell, SWT.OK|SWT.ICON_ERROR);
        msgBox.setText('Error');
        msgBox.setMessage(e.message);
        msgBox.open();
        return ([]);
    }
}

/*
 *  ======== _init ========
 *
 *  saves info in associative array:
 *
 *  allReposArr[reponame].pkgList
 *  allReposArr[reponame].item
 *
 */
function _init(searchPath, repos)
{
    var enableRestore = false;
    w_searchPath.setText(("" + searchPath).replace(/\\/g, '/'));
    var reposArr = repos.split('\n');
    for each (var r in reposArr) {
        if (!r.length) {
            continue;
        }
        var repo = r.substr(0, r.indexOf(';'));
        repo = ("" + repo).replace(/\\/g, '/');
        var pkgList = r.substr(r.indexOf(';') + 1);
        var item = widgets.TableItem(w_table, SWT.NULL);

        /* save pkgList and item in hash on repo name */

        allReposArr[repo] = {};
        allReposArr[repo].pkgList = pkgList;
        allReposArr[repo].item = item;
        item.setText(SRC_REPOSITORY_COL_INDEX, repo);
        item.setText(DEST_REPOSITORY_COL_INDEX, repo);
        if (pkgList.length == 0) {
            item.setText(STATUS_COL_INDEX, NO_PACKAGES_STR);
            item.setGrayed(true);
            item.setChecked(true);
        }
        else if (_repositoryIntact(repo, pkgList)) {
            item.setText(STATUS_COL_INDEX, INTACT_STR);
            item.setGrayed(true);
            item.setChecked(true);
        }
        else {
            item.setChecked(true);
            item.setText(STATUS_COL_INDEX, NOT_RESTORED_STR);
            if (!enableRestore) {
                enableRestore = true;
            }
        }
    }
    w_btnRestore.setEnabled(enableRestore);
}

/*
 *  ======== _itemSelected ========
 *
 *  disable check for restored or intact items.
 *  these items will be grayed
 *
 */
function _itemSelected(e)
{
    if (e.detail == SWT.CHECK) {
        if (e.item.getGrayed()) {
            e.item.setChecked(true);
        }
        else {
            _setRestoreBtnState();
        }
    }
}

/*
 *  ======== open ========
 */
function open(display, shell, fileName, searchPath, repos)
{
    try {
        _initSWT();
        curFileName = ("" + fileName).replace(/\\/g, '/');
        w_display = display;
        w_shell = widgets.Shell(shell,
                      SWT.DIALOG_TRIM | SWT.APPLICATION_MODAL);
        w_shell.setLayout(layout.GridLayout());
        w_shell.setText("Repository Restore - " + curFileName); 
        w_shell.setSize(700, 500);
        w_shell.addListener(SWT.Close, function(e){ _close(); });
        _mkDlg();
        _init(searchPath, repos);
        w_shell.setFocus();
        w_shell.open();
        while (!w_shell.isDisposed()) {
            if (!display.readAndDispatch()) {
                display.sleep();
            }
        }
    }
    catch (e) {
    }

    /* results are returned as:
       searchpath\n
       source repositories path (';' delimited)\n
       dest repositories path (';' delimited)
    */
    return (results);
}

/*
 *  ======== _repositoryIntact ========
 */
function _repositoryIntact(repo, pkgList)
{
    var pkg;
    var vers;
    var found;
    var rPkg;
    var intact = true;

    if (!java.io.File(repo).exists()) {
        return (false);
    }
    var repoPkgs = _getRepoPackagesInfo(repo);
    if (repoPkgs.length > 0) {
        var pkgArr = pkgList.split(';');
        for each (var p in pkgArr) {
            if (!p.length) {
                continue;
            }
            pkg = ("" + p).split("[");
            vers = pkg[1].substr(0, pkg[1].length - 1);
            found = false;
            for each (var rp in repoPkgs) {
                rPkg = rp.split(';');
                if (rPkg[PACKAGE_INDEX] == pkg[0] &&
                    rPkg[VERSION_INDEX] == vers) {

                    found = true;
                    break;
                }
            }
            if (!found) {
                intact = false;
                break;
            }
        }
        if (intact) {  /* check if there area any packages in */
                       /* the repository that aren't in the list */

            for each (var rp in repoPkgs) {
                rPkg = rp.split(';');
                found = false;
                for each (var p in pkgArr) {
                    if (!p.length) {
                        continue;
                    }
                    pkg = ("" + p).split("[");
                    vers = pkg[1].substr(0, pkg[1].length - 1);
                    if (rPkg[PACKAGE_INDEX] == pkg[0] &&
                        rPkg[VERSION_INDEX] == vers) {

                        found = true;
                        break;
                    }
                }
                if (!found) {
                    intact = false;
                    break;
                }
            }
        }
    }
    else {
        intact = false;
    }
    return (intact);
}

/*
 *  ======== _restore ========
 */
function _restore()
{
    var repoman = xdc.useModule('xdc.tools.repoman.Main');
    var srcReposArr = [];
    var destReposArr = [];
    var idsArr = [];
    var args;
    var checkIntact;

    for each (var repo in allReposArr) {
        if (!repo.item.getChecked() || repo.item.getGrayed()) {
            continue;
        }
        srcReposArr.push(repo.item.getText(SRC_REPOSITORY_COL_INDEX));
        destReposArr.push(repo.item.getText(DEST_REPOSITORY_COL_INDEX));
        idsArr.push(w_table.indexOf(repo.item));
    }
    if (srcReposArr.length == 0) {
        w_log.append("\n" + "Nothing to restore");
        return;
    }
    if (w_searchPath.getText().length() == 0) {
        w_log.append("\n" + "Search path is empty. Cannot restore. Please enter a search path and try again.");
        return;
    }
    w_shell.setCursor(graphics.Cursor(w_display, SWT.CURSOR_WAIT));
    for (var i = 0; i < srcReposArr.length; i++) {
        if (srcReposArr[i] == destReposArr[i]) {
            args = ['--rrestore'].concat('-f', curFileName, '-p',
                                         w_searchPath.getText(),
                                        "" + idsArr[i]);
        }
        else {
            args = ['--rcreate'].concat('-f', curFileName, '-p',
                                        w_searchPath.getText(),
                                        "" + idsArr[i], 
                                        "" + destReposArr[i]);
        }
        w_log.append("\nRestoring saved " + srcReposArr[i] + " to " + 
                     destReposArr[i] + "...");
        try {
            var retStr = repoman.exec(args);
        }
        catch (e) {
            var msgBox = widgets.MessageBox(w_shell, SWT.OK|SWT.ICON_ERROR);
            msgBox.setText('Error');
            msgBox.setMessage(e.message);
            msgBox.open();
            break;
        }

        /* output status to log window */
        if (retStr.length) {
            if (java.lang.String(retStr).startsWith(PKGS_NOT_FOUND_STR)) {

                var pkgList = retStr.substr(retStr.indexOf(';') + 1);
                w_log.append("\n" + PKGS_NOT_FOUND_STR + "\n    " + pkgList);
                checkIntact = false;
            }
            else {
                w_log.append("\n" + retStr);
                checkIntact = true;
            }
        }
        else {
            checkIntact = true;
        }
        if (checkIntact) {
            if (_repositoryIntact(destReposArr[i],
                    allReposArr[srcReposArr[i]].pkgList)) {

                allReposArr[srcReposArr[i]].item.setText(STATUS_COL_INDEX,
                                                         RESTORED_STR);

                allReposArr[srcReposArr[i]].item.setGrayed(true);
                allReposArr[srcReposArr[i]].item.setChecked(true);
                w_table.update();
                w_log.append("\n" + "restored");
            }
        }
    }
    _setRestoreBtnState();
    w_shell.setCursor(null);
}

/*
 *  ======== _setRestoreBtnState ========
 *
 */
 function _setRestoreBtnState()
 {
    var enable = false;
    for each (var repo in allReposArr) {
        if (!repo.item.getGrayed() && repo.item.getChecked()) {
            enable = true;
            break;
        }
    }
    w_btnRestore.setEnabled(enable);
}



/*
 *  @(#) xdc.tools.repoman.sg; 1, 0, 0,0; 1-9-2017 12:51:54; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

