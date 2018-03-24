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
 * ======== Main.xs ========
 */

/* ---------------- GLOBAL STATE ---------------- */

var Date = xdc.loadCapsule('xdc/tools/gbl/Date.xs');
var TableColumns = xdc.loadCapsule('TableColumns.xs');
var shadow = xdc.loadCapsule('xdc/tools/path/ShadowCompare.xs');
var CheckPath = xdc.loadCapsule('xdc/tools/repoman/CheckPath.xs');

/* note: loading repoman/Main.xs is required to fix the repoman SWT
 * dependency issues; see bug XDCTOOLS-56.
 */
var repomanMain = xdc.loadCapsule('xdc/tools/repoman/Main.xs');

var Main;
var PathEditor;
var addXDCRepositories = true;

var w_display, w_shell, w_composite, w_menubar, w_Table, w_statusComposite,
     w_statusLabel, w_labDone, w_labBusy, w_toolbar, w_pathTable, w_sash,
     w_pathComposite, w_packagesComposite, w_parent;

var lastDir = ".";
var cmd = {path: xdc.useModule('xdc.tools.path.Main')};

var xdcroot = "";     /* environment["xdc.root"] at startup */
var hat = "";         /* cur package; determined at startup */
var pathsuffix = "";  /* <xdcroot>/packages;<hat> */
var pathArg = null;

var curxdcpath;
var curPkgPathArr = [];
var curPkgArr = [];

var aboutPkgName = "";
var aboutReleaseFile = "";

var NAME_INDEX = 0;
var REPO_INDEX = 1;
var RELEASE_INDEX = 2;
var LABEL_INDEX = 3;
var COMP_KEY_INDEX = 4;
var DATE_INDEX = 5;
var PROVIDER_INDEX = 6;
var ORIG_PROVIDER_INDEX = 7;
var PRODUCER_INDEX = 8;

var colMap = [
    NAME_INDEX,
    REPO_INDEX,
    PROVIDER_INDEX,
    RELEASE_INDEX,
    LABEL_INDEX,
    COMP_KEY_INDEX,
    DATE_INDEX
];

var colTitles = ['Name',
                 'Repository',
                 'Release Name',
                 'Label',
                 'Compatibility Key',
                 'Release Date',
                 'Provider Id',
                 'Original Provider',
                 'Producer Id'];

var colWidths = [146,
                 125,
                 135,
                 55,
                 100,
                 105,
                 75,
                 75,
                 80];

var pathFilterExt = ['*.xpt', '*.*'];
var pathFilterNames = ['Package Path Files (*.xpt)', 'All files (*.*)'];

var shadowResults = [];
var hoverTip = null;
var hoverLabel = null;
var inRedraw = false;
var inInit = false;
/* ---------------- STRING CONSTANTS ---------------- */
var EMPTY_STR = "Empty";
var TITLE_STR = "Package Repository Path Browser";
var PACKAGE_PATH_STR = "Package Repository Path";
var RESCAN_PATH_STR = "Rescan Package Repository Path";
var EDIT_PATH_STR = "Edit Package Repository Path";
var BROWSE_PATH_STR = "Browse New Path";
var ADD_TO_PATH_STR = "Add a Directory to Path";
var CLEAR_PATH_STR = "Clear Path";
var BROWSE_DLG_TITLE_STR = "Select a directory to list packages";
var ADD_DLG_TITLE_STR = "Select a directory to add to path";
var DIR_DLG_MSG_STR = "Browse for a Directory";
var ERROR_STR = "Error";
var INVALID_DIR_STR = "Invalid directory: ";
var ABOUT_BOX_TITLE_STR = "About Package Path Browser";
var ABOUT_PATH_STR = "Package Path Browser";
var COPY_PATH_STR = "Copy Path to Clipboard";
var MENU_COPY_PATH_STR = "C&opy Path to Clipboard";
var OPEN_STR = "Open";
var SAVE_AS_MENU_STR = "Save &As...";
var SAVE_AS_STR = "Save As";
var CANT_FIND_FILE_STR = "Can't find file: ";
var CANT_READ_PATH_STR = "Can't read path from file: ";
var CANT_SAVE_FILE_STR = "Can't save file: ";
var REPLACE_EXISTING_STR = "\nThis file already exists.\nReplace existing file?";
var BUSY_SCANNING = "Retrieving package information";
var BUSY_CHECKING = "Checking for duplicate packages";

var DIRS_DONOTEXIST_STR =
        "One or more directories on the package path do not exist:\n";
var DUPLICATE_PACKAGE_STR = "Duplicate package";
var PACKAGES_COLUMNS_STR = "Show Columns...";

/* ---------------- SWT ALIASES ---------------- */

var custom;
var graphics;
var layout;
var widgets;
var SWT;
var GD;

/* ---------------- DISPLAY RESOURCES ---------------- */
var rsrc = {};

/*
 *  ======== _initSWT ========
 */
function _initSWT()
{
    custom = xdc.jre.org.eclipse.swt.custom;
    graphics = xdc.jre.org.eclipse.swt.graphics;
    layout = xdc.jre.org.eclipse.swt.layout;
    widgets = xdc.jre.org.eclipse.swt.widgets;
    SWT = xdc.jre.org.eclipse.swt.SWT;
    GD = layout.GridData;
}

/*
 *  ======== _mkResources ========
 */
function _mkResources()
{
    rsrc.CUR_WAIT = graphics.Cursor(w_display, SWT.CURSOR_WAIT);

    function IMG(file) {return graphics.Image(w_display, xdc.findFile(file));}
    rsrc.ICO_SOG = IMG('xdc/tools/path/sg/icons/sog.ico');
    rsrc.ICO_ADD = IMG('xdc/tools/path/sg/icons/add.ico');
    rsrc.ICO_BROWSE = IMG('xdc/tools/path/sg/icons/browse.ico');
    rsrc.ICO_BLANK = IMG('xdc/tools/path/sg/icons/blank.ico');
    rsrc.ICO_PACKAGEPATH = IMG('xdc/tools/path/sg/icons/packagepath.ico');
    rsrc.ICO_ENTERPATH = IMG('xdc/tools/path/sg/icons/enterpath.ico');
    rsrc.ICO_COPY = IMG('xdc/tools/path/sg/icons/copy.ico');
    rsrc.ICO_LIGHT_GRAY = IMG('xdc/tools/path/sg/icons/gray-light.ico');
    rsrc.ICO_LIGHT_GREEN = IMG('xdc/tools/path/sg/icons/green-light.ico');
    rsrc.ICO_LIGHT_RED = IMG('xdc/tools/path/sg/icons/red-light.ico');
    rsrc.ICO_OPEN = IMG('xdc/tools/path/sg/icons/open.ico');
    rsrc.ICO_SAVE = IMG('xdc/tools/path/sg/icons/save.ico');
    rsrc.ICO_DUP = IMG('xdc/tools/path/sg/icons/dup.ico');
    rsrc.ICO_SHADOW_DUP = IMG('xdc/tools/path/sg/icons/warning_dup.ico');
    rsrc.ICO_WARNING = IMG('xdc/tools/path/sg/icons/warning.gif');
}

/* ---------------- FUNCTIONS ---------------- */

/*
 *  ======== module$meta$init ========
 */
function module$meta$init() 
{
    Main = this;
    PathEditor = xdc.module('xdc.tools.sg.widgets.PathEditor');
}

/*
 *  ======== init ========
 */
function init()
{
    /* Need to maintain initialization state 
     * to handle column move events during
     * table creation.
     */
    inInit = true;
    
    /* set up the shell */
    var shlayout = layout.GridLayout();
    shlayout.horizontalSpacing = 0;
    shlayout.verticalSpacing = 0;
    shlayout.marginWidth = 0;
    shlayout.marginHeight = 0;
    w_shell.setLayout(shlayout);

    aboutPkgName = String(Main.$package);
    aboutReleaseFile = Main.$package.packageBase + "/package/package.rel.xml";

    /* create toolbar and top level menu */
    _fillMenu(w_menubar);
    w_toolbar = _createToolBar(w_shell);

    /* create a composite below toolbar */
    w_composite = widgets.Composite(w_shell, SWT.BORDER);
    w_composite.setLayout(layout.GridLayout());
    w_composite.setLayoutData(layout.GridData(GD.FILL_BOTH));

    w_sash = custom.SashForm(w_composite, SWT.VERTICAL);
    w_sash.setLayoutData(layout.GridData(GD.FILL_BOTH));

    w_pathComposite = widgets.Composite(w_sash, SWT.BORDER);
    w_pathComposite.setLayout(layout.GridLayout());
    w_pathComposite.setLayoutData(layout.GridData(GD.FILL_BOTH));

    var pathTitle = widgets.Label(w_pathComposite, SWT.NULL);
    pathTitle.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
    pathTitle.setText(PACKAGE_PATH_STR);

    /* package list */
    w_pathTable = widgets.Table(w_pathComposite, SWT.BORDER | SWT.HIDE_SELECTION);
    var gd1 = layout.GridData(GD.FILL_BOTH);
    gd1.horizontalSpan = 2;
    w_pathTable.setLayoutData(gd1);
    w_pathTable.setHeaderVisible(false);
    var tc1 = widgets.TableColumn(w_pathTable, SWT.NULL);
    tc1.setWidth(741);
    w_pathTable.addListener(SWT.MouseHover, function(e){ _packagePathTableMouseOver(e); });
    w_pathTable.addListener(SWT.Dispose, function(e){ _mouseLeave(e); });
    w_pathTable.addListener(SWT.KeyDown, function(e){ _mouseLeave(e); });
    w_pathTable.addListener(SWT.MouseMove, function(e){ _mouseLeave(e); });

    w_packagesComposite = widgets.Composite(w_sash, SWT.BORDER);
    w_packagesComposite.setLayout(layout.GridLayout());
    w_packagesComposite.setLayoutData(layout.GridData(GD.FILL_BOTH));


    /* Title for list */
    var pkgsLabel = widgets.Label(w_packagesComposite, SWT.NULL);
    pkgsLabel.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
    pkgsLabel.setText("Packages");

    /* package list */
    w_Table = widgets.Table(w_packagesComposite, SWT.BORDER | SWT.HIDE_SELECTION);
    var gd = layout.GridData(GD.FILL_BOTH);
    gd.horizontalSpan = 2;
    w_Table.setLayoutData(gd);
    w_Table.setHeaderVisible(true);
    for (var i = 0; i < colMap.length; i++) {
        var tc = widgets.TableColumn(w_Table, SWT.NULL);
        tc.setText(colTitles[colMap[i]]);
        tc.setWidth(colWidths[colMap[i]]);
        tc.setMoveable(true);
        tc.addListener(SWT.Selection, function(e){ _sortListener(e); });
        tc.addListener(SWT.Move, function(e){ _colummMovedListener(e); });
    }
    w_Table.addListener(SWT.MouseHover, function(e){ _packagesTableMouseOver(e); });
    w_Table.addListener(SWT.Dispose, function(e){ _mouseLeave(e); });
    w_Table.addListener(SWT.KeyDown, function(e){ _mouseLeave(e); });
    w_Table.addListener(SWT.MouseMove, function(e){ _mouseLeave(e); });
    w_sash.setWeights([25, 75]);
    w_statusComposite = widgets.Composite(w_composite, SWT.NONE);
    var statusLayout = layout.GridLayout(3, false);
    statusLayout.marginWidth = statusLayout.marginHeight = 0;
    w_statusComposite.setLayout(statusLayout);
    w_statusComposite.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
    w_statusLabel = custom.CLabel(w_statusComposite,
        SWT.BORDER | SWT.SHADOW_IN);
    w_statusLabel.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
    w_labDone = widgets.Label(w_statusComposite, SWT.NONE);
    w_labDone.setImage(rsrc.ICO_LIGHT_GREEN);
    w_labDone.setToolTipText('Ready');
    w_labBusy = widgets.Label(w_statusComposite, SWT.NONE);
    w_labBusy.setLayoutData(layout.GridData(GD.HORIZONTAL_ALIGN_END));
    w_labBusy.setImage(rsrc.ICO_LIGHT_GRAY);
    w_labBusy.setToolTipText('Busy');
    inInit = false;
}

/*
 *  ======== _aboutPath ========
 */
function _aboutPath(shell)
{
    var msgBox = widgets.MessageBox(shell, SWT.OK | SWT.ICON_INFORMATION);
    msgBox.setText(ABOUT_BOX_TITLE_STR);

    var info = aboutPkgName;
    try {
        var rel = xdc.loadXML(aboutReleaseFile);
        var date = new Date(rel.@date - 0);

        info += " [" + rel["package"].@version + ", " + rel.@buildCount + "]\n"
                + date.toUTCString();
    }
    catch (e) {
        ;
    }

    msgBox.setMessage(ABOUT_PATH_STR + "\n\n" + info);
    msgBox.open();
}

/*
 *  ======== _addPath ========
 */
function _addPath(shell)
{
    var dir = _pathDlg(shell, ADD_DLG_TITLE_STR);

    if (dir != null) {
        var dirarg = new String(dir);
        dirarg = dirarg.replace(/\\/g, '/');

        var path = curxdcpath;

        if (path != "") {
            /* separate with ';', if not already there */
            if (path.charAt(path.length - 1) != ';') {
                path = path.concat(';');
            }
        }

        /* append dirarg to curxdcpath (place dirarg before xdcroot) */
        path += dirarg;
        curxdcpath = ("" + path).replace(/\"/g, '');

        if (xdcroot.length) {
            path = _resolveHat(path);
            path  += ';' + xdcroot + '/packages';
            if (hat.length) {
                path += ';' + hat;
            }
        }
        path = _cleanPath(path);
        curPkgArr = _getPkgArray(path);
        w_Table.setRedraw(false);

        var pathArr = path.split(';');
        _refreshPackagePathTable(pathArr);

        _refreshPackagesTable(curPkgArr); /* display new path */
        _markDups();
        w_Table.setRedraw(true);   
        _setBusy(null);
        lastDir = dir;
    }
}

/*
 *  ======== _cleanPackagePathArr ========
 */
function _cleanPackagePathArr(arr)
{
    /* resolve paths */

    if (arr.length == 0) {
        return ([]);
    }
    var tmpArr = arr;
    for (var i = 0; i < tmpArr.length; i++) {
        if (tmpArr[i].length != 0) {
            tmpArr[i] = String(tmpArr[i]).replace(/\"/g, '');
            if (java.io.File(tmpArr[i]).isAbsolute()) {
                tmpArr[i] = java.io.File(tmpArr[i]).getCanonicalPath();
            }
            tmpArr[i] = String(tmpArr[i]).replace(/\\/g, '/');
        }
    }

    /* remove duplicate paths */
    var dirArr = [];
    dirArr.push(tmpArr[0]);
    for (i = 1; i < tmpArr.length; i++) {
        var found = false;
        for (var j = 0; j < dirArr.length; j++) {
            if (tmpArr[i].length != 0 && java.io.File(tmpArr[i]).equals(java.io.File(dirArr[j]))) {
                found = true;
                break;
            }
        }
        if (!found && tmpArr[i].length != 0) {
            dirArr.push(tmpArr[i]);
        }
    }
    return dirArr;
}

/*
 *  ======== _cleanPath ========
 *  remove empty components and replace '\'s with '/'s
 */
function _cleanPath(path)
{
    var result = "";
    var ta = path.split(';');
    var prefix = "";
    
    for (var i = 0; i < ta.length; i++) {
        if (ta[i].length > 0) {
            result += prefix + ta[i].replace(/\\/g, '/');
            prefix = ';';
        }
    }
    return (result);
}

/*
 *  ======== _clearPath ========
 */
function _clearPath()
{
    _refreshPackagePathTable([]);

    curxdcpath = "";

    w_Table.removeAll();
    _packagePath();
}

/*
 *  ======== _colummMovedListener ========
 */
function _colummMovedListener(e)
{
    if ((inRedraw) || (inInit)) {
        return;
    }
    var colNames = [];
    var cols = w_Table.getColumns();
    for each (var col in cols) {
        colNames.push(String(col.getText()));
    }

    colMap = [];
    for (var i = 0; i < colNames.length; i++) {
        for (var j = 0; j < colTitles.length; j++) {
            if (colNames[i] == colTitles[j]) {
                colMap.push(j);
            }
        }
    }
}

/*
 *  ======== _compKeyCompare ========
 *
 */
function _compKeyCompare(key1, key2)
{
    var val1, val2;
    var key1Arr = key1.split(',');
    var key2Arr = key2.split(',');
    var ret = 0;

    for (var i = 0; i < key1Arr.length && i < key2Arr.length; i++) {
        val1 = key1Arr[i] - 0;
        val2 = key2Arr[i] - 0;
        if (val1 < val2) {
            ret = -1;
            break;
        }
        else if (val1 > val2) {
            ret = 1;
            break;
        }
    }
    if (ret == 0) {
        if (key1Arr.length < key2Arr.length) {
            ret = -1;
        }
        else if (key1Arr.length > key2Arr.length) {
            ret = 1;
        }
    }
    return (ret);
}

/*
 *  ======== _copyPath ========
 */
function _copyPath()
{
    var clipboard = java.awt.Toolkit.getDefaultToolkit().getSystemClipboard();
    var strsel = java.awt.datatransfer.StringSelection(curxdcpath);
    clipboard.setContents(strsel, strsel);
}

/*
 *  ======== _fillMenu ========
 */
function _fillMenu(menubar)
{
    var shell = menubar.getShell();

    /* File menu */
    var item = widgets.MenuItem(menubar, SWT.CASCADE);
    item.setText("&File");
    var menu = widgets.Menu(item);
    item.setMenu(menu);

    /* File->Open */
    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText('&' + OPEN_STR + '...');
    item.addListener(SWT.Selection, function(e){ _open(shell); });

    /* Separator */
    widgets.MenuItem(menu, SWT.SEPARATOR);

    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText(SAVE_AS_MENU_STR);
    item.addListener(SWT.Selection, function(e){ _saveAsDlg(shell); });

    /* Separator */
    widgets.MenuItem(menu, SWT.SEPARATOR);

    /* File->Exit */
    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText("E&xit");
    item.addListener(SWT.Selection, function(e){ _pathExit(); });

    /* Edit menu */
    item = widgets.MenuItem(menubar, SWT.CASCADE);
    item.setText("&Edit");
    menu = widgets.Menu(item);
    item.setMenu(menu);

    /* Edit->Rescan Path Repository Path */
    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText('&' + RESCAN_PATH_STR);
    item.addListener(SWT.Selection, function(e){ _packagePath(); });

    /* Separator */
    widgets.MenuItem(menu, SWT.SEPARATOR);

    /* Enter Path */
    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText("&" + EDIT_PATH_STR + '...');
    item.addListener(SWT.Selection, function(e){ _editPathGui(shell); });

    /* Edit->Add a Directory to Path */
    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText("&" + ADD_TO_PATH_STR + '...');
    item.addListener(SWT.Selection, function(e){ _addPath(shell); });

    /* Edit->Clear Path */
    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText("&" + CLEAR_PATH_STR);
    item.addListener(SWT.Selection, function(e){ _clearPath(); });

    /* Separator */
    widgets.MenuItem(menu, SWT.SEPARATOR);

    /* Edit->Copy Path to Clipboard */
    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText(MENU_COPY_PATH_STR);
    item.addListener(SWT.Selection, function(e){ _copyPath(); });

    /* View menu */
    item = widgets.MenuItem(menubar, SWT.CASCADE);
    item.setText("&View");
    menu = widgets.Menu(item);
    item.setMenu(menu);

    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText(PACKAGES_COLUMNS_STR);
    item.addListener(SWT.Selection, function(e){ _selectPackagesTableColumns(); });

    /* Help menu */
    item = widgets.MenuItem(menubar, SWT.CASCADE);
    item.setText("&Help");
    menu = widgets.Menu(item);
    item.setMenu(menu);

    /* Help->About */
    item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText("&" + ABOUT_BOX_TITLE_STR);
    item.addListener(SWT.Selection, function(e){ _aboutPath(shell); });
}

/*
 *  ======== _createToolBar ========
 */
function _createToolBar(parent)
{
    var shell = parent.getShell();

    /* Toolbar */

    if (w_toolbar == undefined) {        
        w_toolbar = widgets.ToolBar(parent, SWT.HORIZONTAL | SWT.SHADOW_OUT);
        w_toolbar.setLayoutData(layout.GridData(GD.HORIZONTAL_ALIGN_BEGINNING |
                          GD.FILL_HORIZONTAL));
    }

    var toolbar = w_toolbar;
    /* TODO: make a create button function */
 
    /* buttons */
    var btn = widgets.ToolItem(toolbar, SWT.PUSH);
    btn.setImage(rsrc.ICO_OPEN);
    btn.setToolTipText(OPEN_STR);
    btn.addListener(SWT.Selection, function(e){ _open(shell); });

    btn = widgets.ToolItem(toolbar, SWT.PUSH);
    btn.setImage(rsrc.ICO_SAVE);
    btn.setToolTipText(SAVE_AS_STR + "...");
    btn.addListener(SWT.Selection, function(e){ _saveAsDlg(shell); });

    widgets.ToolItem(toolbar, SWT.SEPARATOR);    

    /* Button: Rescan Path Repository Path */
    btn = widgets.ToolItem(toolbar, SWT.PUSH);
    btn.setImage(rsrc.ICO_PACKAGEPATH);
    btn.setToolTipText(RESCAN_PATH_STR);
    btn.addListener(SWT.Selection, function(e){ _packagePath(); });

    btn = widgets.ToolItem(toolbar, SWT.PUSH);
    btn.setImage(rsrc.ICO_ENTERPATH);
    btn.setToolTipText(EDIT_PATH_STR);
    btn.addListener(SWT.Selection, function(e){ _editPathGui(shell); });

    btn = widgets.ToolItem(toolbar, SWT.PUSH);
    btn.setImage(rsrc.ICO_ADD);
    btn.setToolTipText(ADD_TO_PATH_STR);
    btn.addListener(SWT.Selection, function(e){ _addPath(shell); });

    widgets.ToolItem(toolbar, SWT.SEPARATOR);    

    btn = widgets.ToolItem(toolbar, SWT.PUSH);
    btn.setImage(rsrc.ICO_COPY);
    btn.setToolTipText(COPY_PATH_STR);
    btn.addListener(SWT.Selection, function(e){ _copyPath(); });

    btn = widgets.ToolItem(toolbar, SWT.PUSH);
    btn.setImage(rsrc.ICO_BLANK);
    btn.setToolTipText(CLEAR_PATH_STR);
    btn.addListener(SWT.Selection, function(e){ _clearPath(); });

    toolbar.pack();

    return toolbar;
}

/*
 *  ======== _dateCompare ========
 */
function _dateCompare(date1, date2)
{
    date1 = date1 - 0;
    date2 = date2 - 0;
    if (date1 < date2) {
        return (-1);
    }
    else if (date1 > date2) {
        return (1);
    }
    else {
        return (0);
    }
}

/*
 *  ======== _editPathGui ========
 */
function _editPathGui(shell) {
    var enterDlg = widgets.Shell(shell,
        SWT.DIALOG_TRIM | SWT.RESIZE | SWT.APPLICATION_MODAL);
    enterDlg.setLayout(layout.GridLayout());
    enterDlg.setSize(400, 300);
    enterDlg.setText(EDIT_PATH_STR + "...");

    var enterLabel = widgets.Label(enterDlg, SWT.NONE);
    enterLabel.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
    enterLabel.setText(PACKAGE_PATH_STR + ':');

    /* create GUI editor for user editable portion of the package path */
    var enterGui = PathEditor.create(enterDlg);
    enterGui.addXDCRepositories = addXDCRepositories;

    var enterGuiControl = enterGui.control;
    enterGuiControl.setLayoutData(GD(GD.FILL_BOTH));

    /* create text editor for same */
    var enterText = widgets.Text(enterDlg, SWT.LEFT | SWT.SINGLE | SWT.BORDER);
    enterText.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));

    /* functions to update text in Gui and Text widgets */
    function setGuiPath(userPath) {
        enterGui.setUserPath(userPath.split(';'));
    }
    function setTextPath(userPath) {
        enterText.setText(userPath);
        enterText.selectAll();
    }

    /* functions to retrieve text from Gui and Text widgets */
    function getGuiPath() {
        return (enterGui.getUserPath().join(';'));
    }
    function getTextPath() {
        return (enterText.getText() + '');
    }

    /* initialize the Gui and Text widgets */
    setGuiPath(curxdcpath);
    setTextPath(curxdcpath);

    /* synchronize the Gui and Text widgets */
    var inProgress = false;
    enterText.addModifyListener(function () {
        if (!inProgress) {
            inProgress = true;
            setGuiPath(getTextPath());
            inProgress = false;
        }
    });
    enterGuiControl.addListener(PathEditor.PATH_CHANGED, function () {
        if (!inProgress) {
            inProgress = true;
            setTextPath(getGuiPath());
            inProgress = false;
        }
    });

    /* create OK and Cancel buttons */
    var btnComposite = widgets.Composite(enterDlg, SWT.NONE); 
    var btnLayout = layout.GridLayout();
    btnLayout.numColumns = 2;   
    btnComposite.setLayout(btnLayout);

    var okBtn = widgets.Button(btnComposite, SWT.PUSH | SWT.DEFAULT);
    okBtn.setText ("OK");
    okBtn.addListener(SWT.Selection, function(e) {
        var error = _verifyPath(shell, getGuiPath());
        if (!error) {
            var newpath = getGuiPath();
            enterDlg.dispose();
            _newPath(newpath);
        }
        else {
            enterText.setFocus();
            enterText.selectAll();
        }
    });

    var cancelBtn = widgets.Button(btnComposite, SWT.PUSH);
    cancelBtn.setText("Cancel");
    cancelBtn.addListener(SWT.Selection,
        function(e) { enterDlg.dispose(); });

    enterDlg.open();

    while (!enterDlg.isDisposed()) {
        if (!w_display.readAndDispatch()) {
            w_display.sleep();
        }
    }
}

/*
 *  ======== _findDuplicatePackages ========
 *
 * returns an array of dup objects. A dup object is:      
 *                                                        
 *      dupObj {                                          
 *          pkgName;  name of package                     
 *          repolist; list of repos containing the package
 *      }                                                 
 */
function _findDuplicatePackages()
{
    var dupsArr = [];
    if (w_Table.getItemCount() == 0) {
        return (dupsArr);
    }
    var items = w_Table.getItems();
    var i = 0;
    var name1 = items[i].getText(colMap[NAME_INDEX]);
    while (i < items.length - 1) {
        
        var repolist = [];
        for (var j = i + 1; j < items.length; j++) {
            var name2 = items[j].getText(colMap[NAME_INDEX]);
            if ("" + name1 == "" + name2) {
                if (repolist.length == 0) {
                    repolist.push(items[i].getText(colMap[REPO_INDEX]));
                }
                repolist.push(items[j].getText(colMap[REPO_INDEX]));
            }
            else {
                break;
            }
        }
        if (repolist.length > 0) {
            /* fill the dup obj and push it on dupsArr */
            var dupObj = {};
            dupObj.pkgName = name1;
            dupObj.repolist = repolist;
            dupsArr.push(dupObj);
        }
        i = j;
        name1 = name2;
    }
    return (dupsArr);
}

/*
 *  ======== _getHat ========
 */
function _getHat()
{
    var retHat = "" + Packages.xdc.services.global.Path.getCurPkgRoot();
    if (retHat != "") {
        if (java.io.File(retHat).isAbsolute()) {
            retHat = String(java.io.File(retHat).getCanonicalPath());
        }
        else {
            retHat = "";
        }
    }
    return (retHat.replace(/\\/g, '/'));
}

/*
 *  ======== _getPkgArray ========
 */
function _getPkgArray(dir)
{
    var res = [];
    var ex = null;

    if (dir == null) {
        _setBusy(BUSY_SCANNING);
        try {
            res = cmd.path.exec(['-a']);
        }
        catch (e) {
            ex = e;
        }
    }
    else {
        /* eliminate duplicates from dir */
        var da = dir.split(';');
        var dh = {};
        for (var i = 0; i < da.length; i++) {
            var d = String(java.io.File(da[i]).getCanonicalPath());
            if (dh[d] == null) {
                dh[d] = 1;
                _setBusy(BUSY_SCANNING + " (" + da[i] + ")");
                try {
                    res = res.concat(cmd.path.exec(['-a', '-Pr', da[i]]));
                }
                catch (e) {
                    ex = e;
                    break;
                }
            }
        }
    }
    if (ex) {
        var msgBox = widgets.MessageBox(w_shell, SWT.OK|SWT.ICON_ERROR);
        msgBox.setText(ERROR_STR);
        msgBox.setMessage(ex.message);
        msgBox.open();
    }
    return (res);
}

/*
 *  ======== _itemHover ========
 */
function _itemHover(table, item, text, curPt)
{
    var pt;

    if (hoverTip != null  && !hoverTip.isDisposed()) {
        hoverTip.dispose();
    }
    hoverTip = widgets.Shell(w_shell, SWT.ON_TOP | SWT.NO_FOCUS | SWT.TOOL);
    hoverTip.setBackground(
        w_display.getSystemColor(SWT.COLOR_INFO_BACKGROUND));
    var lo = layout.FillLayout();
    lo.marginWidth = 2;
    hoverTip.setLayout(lo);
    hoverLabel = widgets.Label(hoverTip, SWT.NONE);
    hoverLabel.setForeground(
        w_display.getSystemColor(SWT.COLOR_INFO_FOREGROUND));
    hoverLabel.setBackground(
        w_display.getSystemColor(SWT.COLOR_INFO_BACKGROUND));
    hoverLabel.setText(text);
    hoverLabel.addListener(SWT.MouseExit, function(e) { _mouseLeave(e); });
    hoverLabel.addListener(SWT.MouseDown, function(e) { _mouseLeave(e); });
    var size = hoverTip.computeSize(SWT.DEFAULT, SWT.DEFAULT);
    var rect = item.getBounds(0);
    if (curPt == undefined) {
        pt = table.toDisplay(rect.x, rect.y);
    }
    else {
        pt = table.toDisplay(curPt.x, curPt.y);
    }
    var monRect = w_display.getPrimaryMonitor().getClientArea();
    var left = (pt.x + size.x <= monRect.width) ? pt.x : 
               pt.x - size.x;
    if (left < 0) {
        left = 0;
    }
    var top = (pt.y + rect.height + 4 + size.y <= monRect.height) ?
              pt.y + rect.height + 4 : pt.y - size.y - 4;
    if (top < 0) {
        top = 0;
    }
    hoverTip.setBounds(left, top, size.x, size.y);
    hoverTip.setVisible(true);
}

/*
 *  ======== _markDups ========
 */
function _markDups()
{
    var itemImage;
    var itemData;
    var collator;
    var compVal;
    var items = w_Table.getItems();
    var dirArr = curPkgPathArr;

    _setBusy(BUSY_CHECKING);        

    collator = java.text.Collator.getInstance(java.util.Locale.getDefault());
    for (var i = 1; i < items.length; i++) {
        var value1 = items[i].getText(colMap[NAME_INDEX]);
        for (var j = 0; j < i; j++) {
            var value2 = items[j].getText(colMap[NAME_INDEX]);
            compVal = collator.compare(value1, value2);
            var swap = false;
            if (compVal < 0) {
                swap = true;
            }
            else if (!compVal) {
                /* values are equal, sort in package path order */
                var index1 = -1;
                var index2 = -1;
                for (var k = 0; k < dirArr.length; k++) {
                    if (index1 == -1
                        && dirArr[k].indexOf(items[i].getText(colMap[REPO_INDEX])) 
                            != -1) {

                        index1 = k;
                        if (index2 != -1) {
                            break;
                        }
                    }
                    else if (index2 == -1 && 
                             dirArr[k].indexOf(items[j].
                             getText(colMap[REPO_INDEX])) != -1) {

                        index2 = k;
                        if (index1 != -1) {
                            break;
                        }
                    }
                }
                if (index1 < index2) {
                    items[j].setImage(rsrc.ICO_DUP);
                    swap = true;
                }
                else {
                    items[i].setImage(rsrc.ICO_DUP);
                }
            }
            if (swap) {
                var values = [];
                for (k = 0; k < w_Table.getColumnCount(); k++) {
                    values.push(items[i].getText(k));
                }
                itemData = items[i].getData();  /* date in millis */
                itemImage = items[i].getImage();
                items[i].dispose();
                var item = new widgets.TableItem(w_Table, SWT.NONE, j);
                item.setText(values);
                item.setData(itemData);  /* date in millis */
                if (itemImage != null) {
                    item.setImage(itemImage);
                }
                items = w_Table.getItems();
                break;
            }
        }
    }
    w_Table.setSortColumn(w_Table.getColumn(colMap[NAME_INDEX]));
    w_Table.setSortDirection(SWT.UP);
    _shadowCheck();
}

/*
 *  ======== _metrics ========
 */
function _metrics()
{
    java.lang.System.out.println(w_shell.getSize());
    var cols = w_Table.getColumns();
    for each (var n in cols) {
        java.lang.System.out.println(n.getWidth());
    }
}

/*
 *  ======== _mouseLeave ========
 */
function _mouseLeave(e)
{
    if (hoverTip != null) {
        hoverTip.dispose();
        hoverTip = null;
        hoverLabel = null;
    }
}

/*
 *  ======== _newPath ========
 */
function _newPath(newpath)
{
    var path = String(newpath).replace(/;{1,}/g, ';');  /* remove dup ';'s */

    curxdcpath = path;

    if (xdcroot.length) {
        path = _resolveHat(path);
        path += ';' + xdcroot + '/packages';
        if (hat.length) {
            path += ';' + hat;
        }
    }

    path = _cleanPath(path);

    var pathArr = path.split(';');
    _refreshPackagePathTable(pathArr);

    curPkgArr = _getPkgArray(path);
    w_Table.setRedraw(false);
    _refreshPackagesTable(curPkgArr);
    _markDups();
    w_Table.setRedraw(true);
    _setBusy(null);

    /* save last directory in path for path dialog */
    lastDir = hat == "" ? "." : hat;
    for (var i = pathArr.length - 1; i >= 0; i--) {
        if (pathArr[i].length != 0) {
            lastDir = pathArr[i];
            break;
        }
    }
}

/*
 *  ======== _okToOverwrite ========
 */
function _okToOverwrite(shell, fileName)
{
    var msgBox = widgets.MessageBox(shell, 
                                    SWT.YES | SWT.NO | SWT.ICON_QUESTION);
    msgBox.setText(TITLE_STR);
    msgBox.setMessage(fileName + REPLACE_EXISTING_STR);
    return (msgBox.open() == SWT.YES);
}

/*
 *  ======== _open ========
 */
function _open(shell)
{
    var dlg = widgets.FileDialog(shell, SWT.OPEN);
    dlg.setText(OPEN_STR);
    dlg.setFilterExtensions(pathFilterExt);
    dlg.setFilterNames(pathFilterNames);

    var fileName = dlg.open();
    if (fileName != null) {
        _openPathFile(shell, fileName);
    }
}

/*
 *  ======== _openPathFile ========
 */
function _openPathFile(shell, fileName)
{   
    var f = java.io.File(fileName);
    if (f.exists()) {
        var path = null;
        var line;
        var bufReader = java.io.BufferedReader(java.io.FileReader(f));
        while (true) {
            try {
                line = bufReader.readLine();
                if (line != null) {
                    if (line == "--xdcpath") {
                        path = bufReader.readLine();
                        break;
                    }
                }
                else {
                    break;
                }
            }
            catch (e) {
                path = null;
                break;
            }
        }
        bufReader.close();
        if (path != null) { 
            _newPath(path);
        }
        else {
            var msgBox = widgets.MessageBox(shell, SWT.OK | SWT.ICON_ERROR);
            msgBox.setText(ERROR_STR);
            msgBox.setMessage(CANT_READ_PATH_STR + fileName);
            msgBox.open();
        }
    }
    else {
        var msgBox = widgets.MessageBox(shell, SWT.OK | SWT.ICON_ERROR);
        msgBox.setText(ERROR_STR);
        msgBox.setMessage(CANT_FIND_FILE_STR + fileName);
        msgBox.open();
    }
}

/*
 *  ======== _packagePath ========
 *  Re-scan package path using curxdcpath
 *
 *  Triggered by menu or button to rescan
 */
function _packagePath()
{
    if (pathsuffix.length) {
        var path = (curxdcpath == "") ? pathsuffix 
                                      : (curxdcpath + ';' + pathsuffix);
    }
    else {
        var path = curxdcpath;
    }
    
    var pathArr = path.split(';');

    _refreshPackagePathTable(pathArr);

    /* get all packages along the startup package path */
    curPkgArr = _getPkgArray(path);

    w_Table.setRedraw(false);
    _refreshPackagesTable(curPkgArr);
    _markDups();
    w_Table.setRedraw(true);
    _setBusy(null);

    /* save last directory in path for path dialog */
    for (var i = pathArr.length - 1; i >= 0; i--) {
        if (pathArr[i].length != 0) {
            lastDir = pathArr[i];
            break;
        }
    }
}

/*
 *  ======== _packagePathTableMouseOver ========
 */
function _packagePathTableMouseOver(e)
{
    var item =  w_pathTable.getItem(graphics.Point(e.x, e.y));
    if (item != null && item.getImage() != null && 
        (item.getImageBounds(0).contains(e.x, e.y) ||
        item.getBounds().contains(e.x, e.y))) {

        var str = CheckPath.getWarningString(item.getData(), false, false);        
        _itemHover(w_pathTable, item, str, graphics.Point(e.x, e.y));
    }
}

/*
 *  ======== _parseEnvPath ========
 */
function _parseEnvPath()
{
    /* get full package path in pathArr */
    var pathArr = _cleanPath(String(environment['xdc.path'])).split(';');
    pathArr.pop();      /* pop hat or xdcroot/packages */

    xdcroot = String(environment['xdc.root']).replace(/\\/g, '/');
    pathsuffix = xdcroot + "/packages";

    /* get the current package's repository; i.e., hat */
    hat = _getHat();
    if (hat != "") {
        pathsuffix += ";" + hat;
        pathArr.pop();  /* pop xdcroot/packages */
    }
    curxdcpath = pathArr.join(';');
}

/*
 *  ======== _pathDlg ========
 */
function _pathDlg(shell, message)
{
    var dlg = widgets.DirectoryDialog(shell);
    
    dlg.setFilterPath((new java.io.File(lastDir)).getCanonicalPath());

    /* Change the title bar text */
    dlg.setText(DIR_DLG_MSG_STR);

    /* Customizable message displayed in the dialog */
    dlg.setMessage(message);

    /* Calling open() will open and run the dialog. It will return the
     * selected directory, or null if the user cancels                         
     */
    var dir = dlg.open();
    return dir;
}

/*
 *  ======== _pathExit ========
 */
function _pathExit()
{
    if (w_parent) {
        if (!w_shell.isDisposed()) {
            w_shell.dispose();
        }
    }
    else {
        w_display.dispose();
    }
}

/*
 *  ======== _pathPos ========
 */
function _pathPos(repo, pathArr)
{
    for (var i = 0; i < pathArr.length; i++) {
        if ("" + repo == "" + pathArr[i]) {
            break;
        }
    }
    return (i);
}

/*
 *  ======== _pkgWarningStr ========
 */
function _pkgWarningStr(repo, pkgName)
{
    var str = "";

    var shadowStr = "";
    for each (var r in shadowResults) {
        if (repo == r.repo &&
            ("" + r.pkg) == ("" + pkgName)) {
        
            shadowStr = r.filelist.join("\n");
            break;
        }
    }
    if (shadowStr.length > 0) {
        str = "Warning: One or more \"" + pkgName + "\"\n" +
              "packages preceding this one in the\n" + 
              "current package path do not contain:\n" +
              shadowStr;
    }

    return (str);
}

/*
 *  ======== _redrawPackagesTable ========
 */
function _redrawPackagesTable(pkgsArr)
{   
    inRedraw = true;
    w_Table.setRedraw(false);
    var cols = w_Table.getColumns();
    for each (var col in cols) {
        col.dispose();
    }
    for (var i = 0; i < colMap.length; i++) {
        var tc = widgets.TableColumn(w_Table, SWT.NULL);
        tc.setText(colTitles[colMap[i]]);
        tc.setWidth(colWidths[colMap[i]]);
        tc.setMoveable(true);
        tc.addListener(SWT.Selection, function(e){ _sortListener(e); });
        tc.addListener(SWT.Move, function(e){ _colummMovedListener(e); });
    }
    _refreshPackagesTable(pkgsArr);
    w_Table.setRedraw(true);
    _markDups();
    _setBusy(null);
    inRedraw = false;
}

/*
 *  ======== _refreshPackagePathTable ========
 */
function _refreshPackagePathTable(pathArr)
{
    curPkgPathArr = _cleanPackagePathArr(pathArr);
    w_pathTable.removeAll();
    for each (var line in curPkgPathArr) {
        var ti = widgets.TableItem(w_pathTable, SWT.NONE);
        ti.setText(0, line);
    }

    var checkResults = CheckPath.checkPackagePathRepositories(curPkgPathArr);
    for (var i = 0; i < checkResults.length; i++) {
        var item = w_pathTable.getItem(i);
        if (checkResults[i].warning) {
            item.setImage(0, rsrc.ICO_WARNING);
            item.setData(checkResults[i]);
        }
        else {
            item.setImage(0, null);
            item.setData(null);
        }
    }
/*
    for (var i = 0; i < checkResults.length; i++) {
        print('repo ' + checkResults[i].path);
        print('  exists ' + checkResults[i].exists);
        print('  isEmpty ' + checkResults[i].isEmpty);
        print('  hasPackages ' + checkResults[i].hasPackages);
        print('  mismatches ' + checkResults[i].mismatches);
    }
*/
}

/*
 *  ======== _refreshPackagesTable ========
 */
function _refreshPackagesTable(pkgArr)
{
    w_Table.removeAll();
    for each (var line in pkgArr) {
        var ti = widgets.TableItem(w_Table, SWT.NONE);
        var pkgInfo = line.split(';');
        for (var i = 0; i < colMap.length; i++) {
            if (pkgInfo[colMap[i]] && pkgInfo[colMap[i]].length) {
                if (colMap[i] == DATE_INDEX) {
                    /* save millis for sort comparison */
                    ti.setData(pkgInfo[colMap[i]]);

                    ti.setText(i, Date.mkDate(pkgInfo[colMap[i]]));
                }
                else if (colMap[i] == REPO_INDEX) {
                    ti.setText(i,
                        String(pkgInfo[colMap[i]]).replace(/\\/g, '/'));
                }
                else {
                    ti.setText(i, pkgInfo[colMap[i]]);
                }
            }
        }
    }
}

/*
 *  ======== _repoCompare ========
 */
function _repoCompare(item1, item2, pathArr)
{
    var repo1 = item1.getText(colMap[REPO_INDEX]);
    var repo2 = item2.getText(colMap[REPO_INDEX]);
    if ("" + repo1 == "" + repo2) {
        return (0);
    }
    else if (_pathPos(repo1, pathArr) < _pathPos(repo2, pathArr)) {
        return (-1);
    }
    else {
        return (1);
    }
}

/*
 *  ======== _resolveHat ========
 */
function _resolveHat(path)
{
    var result = path;

    if (hat == "") {
        if (path.indexOf('^') != -1) {

            /* if path contains '^' and hat is empty, remove */
            /* directory that references it                  */

            var pa = path.split(';');
            var prefix = "";
            result = "";
            for (var i = 0; i < pa.length; i++) {
                if (pa[i].length > 0 && pa[i].indexOf('^') == -1) {
                    result += prefix + pa[i];
                    prefix = ';';
                }
            }
        }
    }
    else {
        result = path.replace(/\^/g, hat);
    }

    return (result);
}

/*
 *  ======== _saveAsDlg ========
 */
function _saveAsDlg(shell)
{
    var dlg = widgets.FileDialog(shell, SWT.SAVE);
    dlg.setText(SAVE_AS_STR);
    dlg.setFilterExtensions(pathFilterExt);
    dlg.setFilterNames(pathFilterNames);
    var fileName = dlg.open();
    while (true) {
        if (fileName != null) {
            var destFile = java.io.File(fileName);
            if (destFile.exists()) {
                if (_okToOverwrite(shell, destFile.getAbsolutePath()) &&
                    _savePathToFile(shell, destFile.getAbsolutePath())) {

                    break;
                }
            }
            else if (_savePathToFile(shell, destFile.getAbsolutePath())) {
                break;
            }
        }
        else {
            break;
        }
        dlg.setFileName(fileName);
        fileName = dlg.open();
    }
}

/*
 *  ======== _savePathToFile ========
 */
function _savePathToFile(shell, destFileName)
{

    try {
        var file = java.io.File(destFileName);
        var toFile = java.io.RandomAccessFile(file, "rwd");
        toFile.setLength(0);
        toFile.writeBytes("--xdcpath\n" + curxdcpath + "\n");
        toFile.close();
        return (1);
    }
    catch (e) {
        var msgBox = widgets.MessageBox(shell, SWT.OK | SWT.ICON_ERROR);
        msgBox.setText(ERROR_STR);
        msgBox.setMessage(CANT_SAVE_FILE_STR + destFileName);
        msgBox.open();
        return (0);
    }
}

/*
 *  ======== _setBusy ========
 */
function _setBusy(busyStr)
{
    if (busyStr != null) {
        w_shell.setCursor(rsrc.CUR_WAIT);
        w_statusLabel.setText(busyStr + " ...");
        w_labDone.setImage(rsrc.ICO_LIGHT_GRAY);
        w_labBusy.setImage(rsrc.ICO_LIGHT_RED);
        w_statusComposite.update();
    }
    else {
        w_statusLabel.setText("");
        w_labDone.setImage(rsrc.ICO_LIGHT_GREEN);
        w_labBusy.setImage(rsrc.ICO_LIGHT_GRAY);
        w_shell.setCursor(null);
        w_statusComposite.update();
    }
}

/*
 *  ======== _selectPackagesTableColumns ========
 */
function _selectPackagesTableColumns()
{
    var map = TableColumns.selectColumnsDlg(w_display, w_shell, colTitles,
                                            colMap);
    if (map.length) {
        colMap = map;
        _redrawPackagesTable(curPkgArr);
    }
}

/*
 *  ======== _shadowCheck ========
 */
function _shadowCheck()
{
    var foundName;
    shadowResults = [];

    var dupsArr = _findDuplicatePackages();

    for each (var d in dupsArr) {
        var results = shadow.comparePackageDirs(d.pkgName, d.repolist);

        if (results.length > 0) {

            foundName = false;
            for each (var item in w_Table.getItems()) {
                if (item.getText(colMap[NAME_INDEX]) == ("" + d.pkgName)) {
                    
                    if (!foundName) {
                        foundName = true;
                    }
                    if (item.getImage() == null) {
                        continue;
                    }

                    for each (var r in results) {
                        if (r.repo == item.getText(colMap[REPO_INDEX])) {
                            item.setImage(rsrc.ICO_SHADOW_DUP);
                            break;
                        }
                    }
                }
                else if (foundName) {
                    break; /* pkg names are grouped together, done  */
                }
            }
            for each (var r in results) {
                shadowResults.push(r);
            }
        }
    }
}

/*
 *  ======== _sortListener ========
 */
function _sortListener(e)
{
    _sortTable(e.widget);
}

/*
 *  ======== _sortTable ========
 */
function _sortTable(col)
{
    var itemImage;
    var itemData;
    var collator;
    var lt, gt;
    var compVal;
    var pathArr;
    var items = w_Table.getItems();
    var colIndex = w_Table.indexOf(col);

    var dir = w_Table.getSortDirection();
    if (dir == SWT.UP) {
        dir = SWT.DOWN;
    }
    else {
        dir = SWT.UP;
    }

    if (colMap[colIndex] != REPO_INDEX && colMap[colIndex] != DATE_INDEX &&
        colMap[colIndex] != COMP_KEY_INDEX) {

        collator = java.text.Collator.getInstance(
            java.util.Locale.getDefault());
    }
    if (colMap[colIndex] == REPO_INDEX) {
        pathArr = curPkgPathArr;
    }
    w_Table.setRedraw(false);
    for (var i = 1; i < items.length; i++) {
        for (var j = 0; j < i; j++) {
            if (colMap[colIndex] == REPO_INDEX) {
                compVal = _repoCompare(items[i], items[j], pathArr);
            }
            else if (colMap[colIndex] == DATE_INDEX) {
                compVal = _dateCompare(items[i].getData(),
                    items[j].getData());
            }
            else if (colMap[colIndex] == COMP_KEY_INDEX) {
                compVal = _compKeyCompare(items[i].getText(colIndex),
                                          items[j].getText(colIndex));
            }
            else {
                compVal = collator.compare(items[i].getText(colIndex),
                                           items[j].getText(colIndex));
            }
            if ((dir == SWT.UP)) {
                if (compVal < 0) {
                    lt = true;
                }
                else if (!compVal && colMap[colIndex] == NAME_INDEX &&
                         items[i].getImage() == null &&
                         items[j].getImage() != null) {

                    /* if an item has an image, it is a dup */
                    /* put dups below the orig */
                    lt = true;
                }
                else {
                    lt = false;
                }
                if (lt) {
                    var values = [];
                    for (var k = 0; k < w_Table.getColumnCount(); k++) {
                        values.push(items[i].getText(k));
                    }
                    itemData = items[i].getData();  /* date in millis */
                    itemImage = items[i].getImage();
                    items[i].dispose();
                    var item = new widgets.TableItem(w_Table, SWT.NONE, j);
                    item.setText(values);
                    item.setData(itemData);  /* date in millis */
                    if (itemImage != null) {
                        item.setImage(itemImage);
                    }
                    items = w_Table.getItems();
                    break;
                }
            }
            if ((dir == SWT.DOWN)) {
                if (compVal > 0) {
                    gt = true;
                }
                else if (!compVal && colMap[colIndex] == NAME_INDEX &&
                         items[i].getImage() != null &&
                         items[j].getImage() == null) {

                    /* if an item has an image, it is a dup */
                    /* put dups above the orig */
                    gt = true;
                }
                else {
                    gt = false;
                }
                if (gt) {
                    var values = [];
                    for (var k = 0; k < w_Table.getColumnCount(); k++) {
                        values.push(items[i].getText(k));
                    }
                    itemData = items[i].getData();  /* date in millis */
                    itemImage = items[i].getImage();
                    items[i].dispose();
                    var item = new widgets.TableItem(w_Table, SWT.NONE, j);
                    item.setText(values);
                    item.setData(itemData); /* date in millis */
                    if (itemImage != null) {
                        item.setImage(itemImage);
                    }
                    items = w_Table.getItems();
                    break;
                }
            }
        }
    }
    w_Table.setSortColumn(col);
    w_Table.setSortDirection(dir);
    w_Table.setRedraw(true);
}

/*
 *  ======== _packagesTableMouseOver ========
 */
function _packagesTableMouseOver(e)
{
    var item =  w_Table.getItem(graphics.Point(e.x, e.y));
    if (item != null && item.getImage() != null && 
        item.getImageBounds(0).contains(e.x, e.y)) {
        
        var str = "";
        if (item.getImage() ==  rsrc.ICO_SHADOW_DUP) {
            str = _pkgWarningStr(item.getText(colMap[REPO_INDEX]),
                                 item.getText(colMap[NAME_INDEX]));
        }
        else {
            str = DUPLICATE_PACKAGE_STR;
        }
        _itemHover(w_Table, item, str, graphics.Point(e.x, e.y));
    }
}

/*
 *  ======== _verifyPath ========
 */
function _verifyPath(shell, newpath)
{
    var error = false;
    var path = String(newpath).replace(/;{1,}/g, ';');  /* remove dup ';'s */

    /* Verify existence of directories */
    var chkDir;
    var pathArr = path.split(';');
    for each (var dir in pathArr) {
        if (dir.length != 0) {
            if (dir.indexOf('^') != -1) {
                if (hat != "") {
                    chkDir = java.io.File(_resolveHat(dir));
                }
                else {
                    continue;
                }
            }
            else {
                chkDir = java.io.File(dir);
            }
            if (!chkDir.exists()) {
                var msgBox = widgets.MessageBox(shell,
                    SWT.OK | SWT.ICON_WARNING);
                msgBox.setText(ERROR_STR);
                msgBox.setMessage(INVALID_DIR_STR + dir);
                msgBox.open();
                error = true;
                break;
            }
        }
    }
    return (error);
}

/*
 *  ======== _main ========
 */
function _main(pathArg, parent)
{
    _initSWT();

    if (parent) {
        w_display = parent.getDisplay();
        w_parent = parent;
    }
    else {
        w_display = widgets.Display();
    }

    _mkResources();

    /* set up the shell */
    w_shell = widgets.Shell(w_display, SWT.SHELL_TRIM);
    w_shell.setSize(800, 650);
    w_shell.setText(TITLE_STR); 
    w_shell.setImage(rsrc.ICO_SOG);
    w_menubar = widgets.Menu(w_shell, SWT.BAR);
    w_shell.setMenuBar(w_menubar);
    init();

    w_shell.setFocus();
    w_shell.open();

    if (!pathArg) {
        _parseEnvPath();
    }
    else {
        curxdcpath = _cleanPath(pathArg);
    }
    _packagePath();

    while (!w_shell.isDisposed()) {
        if (!w_display.readAndDispatch()) {
            w_display.sleep();
        }
    }
    if (!parent) {
        w_display.dispose();
    }
}

/*
 *  ======== createPartControl ========
 */
function createPartControl(parent)
{
    _main(pathArg, parent);
}

/*
 *  ======== run ========
 */
function run(cmdr, args)
{
    var inst = this.$private;
    inst.self = this;

    for (var p in inst.self) {
        inst[p] = inst.self[p];
    }
    inst.cmdr = cmdr;
    inst.args = args;

    addXDCRepositories = (inst.pathArg == null);
    if (cmdr.tid) {
        pathArg = inst.pathArg;

        var gui;
        /* for each module in this package ... */
        for each (var mod in this.$package.$modules) {
            var cap = mod.$capsule;
            if (cap && "createPartControl" in cap) {
                gui = cap;
                break;
            }
        }
        /* create an instance of IWorkbenchPart and send it */
        /* back to the server to call gui.createPartControl */
        var wbp = new Packages.org.eclipse.ui.IWorkbenchPart(gui);
        cmdr.socket.giveToClient(wbp); 

        /* wait for gui to close */
        var val = cmdr.socket.takeFromClient();
    }
    else {
        _main(inst.pathArg);
    }
}

/*
 *  @(#) xdc.tools.path.sg; 1, 0, 0,0; 1-9-2017 12:51:42; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

