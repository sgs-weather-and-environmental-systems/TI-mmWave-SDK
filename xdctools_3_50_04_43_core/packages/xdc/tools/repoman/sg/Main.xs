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
 *  ======== Main.xs ========
 */

var Date = xdc.loadCapsule('xdc/tools/gbl/Date.xs');
var CheckPath = xdc.loadCapsule('xdc/tools/repoman/CheckPath.xs');
var repomanMain = xdc.loadCapsule('xdc/tools/repoman/Main.xs');

var os = java.lang.System.getProperty("os.name") + "";
var isWin = (os.match(/^Windows/i) != null);
var pathSeparator = isWin ? "\\" : "/";
var iniFilesDir;
if (isWin) {
    iniFilesDir = environment["user.home"] + "/Application Data/Repoman/";
    if (!java.io.File(iniFilesDir).exists()) {
        java.io.File(iniFilesDir).mkdir();
    }
}
else {
    iniFilesDir = environment["user.home"] + "/";
}

/* ---------------- SWT ALIASES ---------------- */

var custom;
var graphics;
var layout;
var widgets;
var events;
var dnd;
var SWT;
var GD;
var pathArg = null;
/*
 *  ======== _initSWT ========
 */
function _initSWT()
{
    custom = xdc.jre.org.eclipse.swt.custom;
    graphics = xdc.jre.org.eclipse.swt.graphics;
    layout = xdc.jre.org.eclipse.swt.layout;
    widgets = xdc.jre.org.eclipse.swt.widgets;
    events = xdc.jre.org.eclipse.swt.events;
    dnd = xdc.jre.org.eclipse.swt.dnd;

    SWT = xdc.jre.org.eclipse.swt.SWT;
    GD = layout.GridData;
}

/* ---------------- some DUPS: make a resource ------------*/
var PACKAGE_STR =      "Package:  ";
var FILE_STR =         "File:  ";
var RELEASE_NAME_STR = "Release:  ";
var RELEASE_STR =      "Label:  "; 
var VERSION_STR =      "Version:  ";
var DATE_STR =         "Date:  ";
var BUILDABLE_STR =    "Buildable:  ";
var REQUIRES_STR =     "Requires:  ";
var REFS_STR =         "References:  ";
var REPOSITORY_STR =   "Repository:  ";
var ARCHIVE_STR =      "From archive:  ";
var BUNDLE_STR =       "Bundle:  ";
var LOCATION_STR =     "Location:  ";
var PRODUCER_STR =     "Producer Id:  ";
var DIR_DLG_MSG_STR = "Browse for a Directory";
var PKG_DLG_TITLE_STR = "Select a repository that contains packages\nor a directory that contains archived packages";
var REPO_DLG_TITLE_STR = "Select a repository to add, or click \"Make New Folder\"\nto create a new repository";
var AVAILABLE_PACKAGES_STR = "Explore Packages";
var REPO_PACKAGES_STR = "In Repositories";
var ARCHIVED_PACKAGES_STR = "In Archives";
var PKGPATH_TREE_TITLE_STR = "My Package Path Repositories";
var ERROR_STR = "Error";
var WARNING_STR = "Warning";
var UNKNOWN_STR = "Unknown";
var CHECK_OUTPUT_USEOFPACKAGE_STR = "use of package '";
var CHECK_OUPUT_ENDPKGNAME_STR = "': ";
var CHECK_OUTPUT_DEPPKGSDELIMITER_STR = "], ";
var CHECK_OUTPUT_WASBUILTWITH_STR = " was built with";
var CHECKING_COMPATIBILITY_STR = "Checking compatibility...";
var NO_DEPS_ARG = ";";
var IMMED_DEPS_ARG = "-D;";
var ALL_DEPS_ARG = "-R;";
var IMMED_DEPS_HOVER_STR = "Include immediate dependencies";
var ALL_DEPS_HOVER_STR = "Include all dependencies";
var NO_DEPS_HOVER_STR = "Include no dependencies";
var IMMED_DEPS_MENU_STR = "Immediate Dependencies";
var ALL_DEPS_MENU_STR = "All Dependencies";
var NO_DEPS_MENU_STR = "No Dependencies";
var REFRESH_STR = "Refresh";
var REMOVE_FROM_PATH_STR = "Remove From Path";
var MOVE_UP_STR = "Move Up";
var MOVE_DOWN_STR = "Move Down";
var DELETE_STR = "Delete";
var DUMPSTERS_FILE_STR = "dumpsters.sav";
var PACKAGE_REPOSITORIES_STR = "Package repositories";
var DELETE_PACKAGE_STR = "Delete Package";
var REPOMAN_STR = "Repoman";
var PACKAGE_XDC_FILE_STR = "package.xdc";
var REPOXML_FILE = ".repo.xml";
var COPY_PATH_STR = "Copy My Package Path to Clipboard";
var ADD_PATH_REPO_STR = "Add a Repository to My Package Path ...";
var ADD_PATH_REPO_MENU_STR = "Add &Repository to My Package Path ...";
var ARCHIVE_REPO_DATA_ID = "ar_repo;";
var REPO_DATA_ID = "repo;";
var BUNDLE_PKG_DATA_ID = "bundle_pkg;";
var AR_BUNDLE_PKG_DATA_ID = "ar_bundle_pkg;";
var EXTRACTING_REPO_PKGS_STR = "Extracting package(s) from repository...";
var COPYING_REPO_PKGS_STR = "Copying package(s) from repository...";
var CLEANING_UP_STR = "Cleaning up...";
var PACKAGE_BLD_XML_FILE_STR = "package.bld.xml";
var PACKAGE_REL_XML_FILE_STR = "package.rel.xml";
var EXTRACT_COPY_PACKAGES_STR = "Extracting/copying packages...";
var NO_DATA_STR = "no data";
var SAVE_AS_STR = "Save As";
var REPOMAN_EXT_STR = ".rmn";
var REPLACE_EXISTING_STR = "\nThis file already exists.\nReplace existing file?";
var CANT_FIND_FILE_STR = "Can't find file: ";
var REPLACE_REPO_STR = " already exists. This operation will overwrite its contents.\nProceed?";
var REPOSITORY_KEY_STR = "repository=";
var AVAILABLE_PACKAGES_HOVER_STR =
'Shows packages that can be copied or extracted to My Package Path Repositories,\n\
via drag and drop. Packages are stored in repositories or archive files (.tar, .tar.gz, .zip).\n\
Repositories, archive directories and archive files can be added and removed with the\n\
"Add or Remove Repositories and Archives" dialog. Files and directories can also be dragged\n\
and dropped into this view from Windows Explorer.';
var PACKAGE_PATH_HOVER_STR =
"Shows your custom Package Path repositories. Repositories can be created,\n\
added, removed and reordered.  Read-only repositories have grayed text.\n\
Packages can be copied or extracted from the Explore Packages view to\n\
a My Package Path repository via drag and drop. Repositories can also\n\
be dragged and dropped into this view from Windows Explorer.";
var ADD_ARCHIVE_DIR_MENU_STR = "&Add/Remove Archives...";
var ADD_REPO_MENU_STR = "&Add/Remove Repositories...";
var ADD_DIR_STR = "Add and Remove Repositories and Archives";
var SEARCHPATH_ERROR_STR = "Search path not found in ";
var CONFIRM_RESTORE_STR = "\nalready exist. Restoring them may overwrite\n\
existing packages. Do you wish to restore these\n\
repositories?";
var CHECK_PACKAGE_PATH_STR = "Check My Package Path for Errors";
var CHECKING_FOR_SHADOWS_STR = "Checking for shadow files...";
var DEFAULT_PATH_STR = "Reset to current Package Path";
var PKG_NAME_MENU_STR = "Package Name";
var TAR_NAME_MENU_STR = "Archive Name";
var THIS_IS_READONLY_REPO_STR = "This repository is read-only.";
var XDCROOT_PACKAGES_INFOSTR = "This is <XDCROOT>/packages, the repository " +
"of packages included with the XDCtools product.\n" +
"It is automatically added to the Package Path.";
var HAT_INFOSTR = "This is '^', the current package's repository.\n It " +
" is automatically added to the end of the Package Path";
var REMOVE_STR = "Remove";
var INSTRUCTIONS_TEXT =
'The Explore Packages view shows packages that can be copied or extracted ' +
'to My Package Path Repositories via drag and drop. Packages in this view are ' +
'stored in repositories or archive files (.tar, .tar.gz, .zip). Repositories, ' +
'archive directories and archive files can be added and removed with the ' +
'Add or Remove Repositories and Archives dialog, which can be accessed by ' +
'clicking on the icon to the right of the "Explore Packages" text. Files and ' +
'directories can also be dragged and dropped into this view from Windows ' +
'Explorer.' +
'\n\n' +
'The My Package Path Repositories view shows your custom Package Path ' +
'repositories. Repositories can be created, added, removed and ' +
'reordered. Read-only repositories have grayed text. Duplicate ' +
'packages are displayed in italics. Packages can be copied ' +
'or extracted from the Explore Packages view to a My Package Path ' +
'repository via drag and drop. Repositories can also be dragged and ' +
'dropped into this view from Windows Explorer. ' +
'\n\n' +
'Holding the mouse cursor over a package in either view will display ' +
'information about the package. ' +
'\n\n' +
'Right-click on an item to see the options for it. ' +
'\n\n' +
'For more information, see the xdc.tools.repoman.sg topic in RTSC-Pedia ' +
'Command line tools at ' +
'http://rtsc.eclipse.org/docs-tip/Command_-_xdc.tools.repoman.sg';
var REFRESH_PATH_STR = "Refresh All My Package Path Repositories";


var PACKAGE_INDEX       = 0;
var FILE_INDEX          = 1;
var RELEASE_NAME_INDEX  = 2;
var RELEASE_INDEX       = 3;
var VERSION_INDEX       = 4;
var DATE_INDEX          = 5;
var BUILDABLE_INDEX     = 6;
var REQUIRES_INDEX      = 7;
var REFS_INDEX          = 8;
var REPOSITORIES_INDEX  = 9;
var REPO_INDEX          = 1;
var PACKAGES_DRAG_SOURCE = 1;
var REPO_DRAG_SOURCE = 2;
var ARCHIVE_INDEX       = 8;

var PROVIDER_INDEX = 6;
var PRODUCER_INDEX = 7;
var EXTRACT_BUNDLE_MSG = "Select a directory to extract the selected bundle to";

/* ---------------- GLOBAL STATE ---------------- */

var Main;

var args;

var w_display, w_shell;

var app = {};

var rsrc = {};

var cmd = {repoman: xdc.useModule('xdc.tools.repoman.Main'),
           path: xdc.useModule('xdc.tools.path.Main'),
           check: xdc.useModule('xdc.tools.check.Main')};

var status = {};
var ptab = [];

/* arrays for managing packages tree */
var packagesTreeDirArr = [];   /* all items in Packages tree */
var addPackagesDirArr = [];    /* items pending being added to Packages tree */
var removePackagesDirArr = []; /* items pending being removed from Packages tree */
var inArchivesDirArr = [];     /* archives in Packages tree */
var inRepositoriesDirArr = []; /* package respositories in Packages tree */
var onWebArr = [];             /* URLs Packages tree */

var checkArr = []; /* compatibility check results */
var dupsArr = [];  /* shadow check results */
var shadowResults = [];
var hoverTip = null;
var hoverLabel = null;
var dragSourceId = null;

var prefix = [PACKAGE_STR,
              REPOSITORY_STR,
              RELEASE_NAME_STR,
              RELEASE_STR,
              VERSION_STR,
              DATE_STR,
              "",
              "Original Provider Id:    ",
              PRODUCER_STR,
              ARCHIVE_STR
];

var hat = "";
var xdcrootrepo = "";
var dumpstersItem = null;
var packagesItem = null;
var webItem = null;
var repoman = xdc.loadCapsule('xdc/tools/repoman/Main.xs');
var aboutPkgName = "";
var aboutReleaseFile = "";
var repomanFilterExt = ['*.rmn', '*.*'];
var repomanFilterNames = ['Repoman Files (*.rmn)', 'All files (*.*)'];
var curFile = "";
var lastPackagesDir = "";
var lastRepoDir = "";
var fonItemItalic = null;
var fonItemNormal = null;
var sortByPackageName = true;
var archivedPkgsArrays = [];
var archiveFilterExt = ['*.tar', '*.tar.gz', '*.zip', '*.*'];
var archiveFilterNames = ['Tar Files (*.tar)', 'Tar.gz Files (*.tar.gz)',
                          'Zip Files (*.zip)', 'All files (*.*)'];


/*
 *  ======== module$meta$init ========
 */
function module$meta$init() {
    Main = this;
}

/* ---------------- DISPLAY RESOURCES ---------------- */

/*
 *  ======== color ========
 */
function color( id ) { return w_display.getSystemColor(id); }

/*
 *  ======== mkResources ========
 */
function mkResources() {
    rsrc.CUR_HAND = graphics.Cursor(w_display, SWT.CURSOR_HAND);
    rsrc.CUR_WAIT = graphics.Cursor(w_display, SWT.CURSOR_WAIT);
    
    var $d = w_display.getSystemFont().getFontData()[0]; $d.setStyle(SWT.BOLD);
    rsrc.FON_LABEL = graphics.Font(w_display, $d);

    function IMG(file) { return graphics.Image(w_display, xdc.findFile(file)); }
    rsrc.ICO_COLLAPSE = IMG('xdc/tools/repoman/sg/files/collapse.ico');
    rsrc.ICO_LIGHT_GRAY = IMG('xdc/tools/sg/icons/gray-light.ico');
    rsrc.ICO_LIGHT_GREEN = IMG('xdc/tools/sg/icons/green-light.ico');
    rsrc.ICO_LIGHT_RED = IMG('xdc/tools/sg/icons/red-light.ico');
    rsrc.ICO_SOG = IMG('xdc/tools/sg/icons/sog.ico');
    rsrc.ICO_ADD = IMG('xdc/tools/repoman/sg/files/add_obj.gif');
    rsrc.ICO_DELETE = IMG('xdc/tools/repoman/sg/files/delete_obj.gif');
    rsrc.ICO_ERROR = IMG('xdc/tools/repoman/sg/files/error_tsk.gif');
    rsrc.ICO_MOVE_DOWN = IMG('xdc/tools/repoman/sg/files/move_down.gif');
    rsrc.ICO_MOVE_UP = IMG('xdc/tools/repoman/sg/files/move_up.gif');
    rsrc.ICO_WARNING = IMG('xdc/tools/repoman/sg/files/warning.gif');
    rsrc.ICO_IMMEDDEP = IMG('xdc/tools/repoman/sg/files/pkg_imeddep.gif');
    rsrc.ICO_ALLDEP = IMG('xdc/tools/repoman/sg/files/pkg_alldep.gif');
    rsrc.ICO_COPY = IMG('xdc/tools/repoman/sg/files/copy.ico');
    rsrc.ICO_ADD_REM_DIRS = IMG('xdc/tools/repoman/sg/files/editdirs.ico');
    rsrc.ICO_CHECK = IMG('xdc/tools/repoman/sg/files/check3.ico');
    rsrc.ICO_PACKAGE_PATH = IMG('xdc/tools/repoman/sg/files/pkg_path.ico');
    rsrc.ICO_ADD_DIR = IMG('xdc/tools/repoman/sg/files/add_fldr.gif');
    rsrc.ICO_ADD_FILE = IMG('xdc/tools/repoman/sg/files/add_file.gif');
    rsrc.ICO_ADD_URL = IMG('xdc/tools/repoman/sg/files/add_url.gif');
    rsrc.ICO_BUNDLE = IMG('xdc/tools/repoman/sg/files/bundle_obj.gif');
    rsrc.ICO_REFRESH = IMG('xdc/tools/repoman/sg/files/refresh.gif');
}

/* ---------------- WIDGET TREE ---------------- */

var DISABLED = false;
var ENABLED = true;

/*
 *  ======== mkToolBar ========
 */
function mkToolBar( prnt, style )
{
    var bar = widgets.ToolBar(prnt, style);
    //bar.setCursor(rsrc.CUR_HAND);

    return bar;
}

/*
 *  ======== mkToolBut ========
 */
function mkToolBut( tb, style, icon, tip, eflg )
{
    var but = widgets.ToolItem(tb, style);
    
    but.setImage(icon);
    but.setToolTipText(tip);
    but.setEnabled(eflg ? true : false);

    return but;
}

/*
 *  ======== mkMenuBar ========
 */
function mkMenuBar(prnt)
{
    var bar = widgets.Menu(prnt, SWT.BAR|SWT.BORDER);
    prnt.setMenuBar(bar);

    return (bar);
}

/*
 *  ======== mkMenu ========
 */
function mkMenu(menubar, shell, text)
{
    var item = widgets.MenuItem(menubar, SWT.CASCADE);
    item.setText(text);
    var menu = widgets.Menu(shell, SWT.DROP_DOWN);
    item.setMenu(menu);
    return (menu);
}

/*
 *  ======== mkMenuItem ========
 */
function mkMenuItem(menu, text)
{
    var item = widgets.MenuItem(menu, SWT.PUSH);
    item.setText(text);
    return (item);
}

/*
 *  ======== mkControl ========
 */
function mkControl() {
    var $w$stack = [];
    var $w = w_shell;

    function WID( w ) { $w$stack.push($w); $w = w; return $w; }
    function END() { $w = $w$stack.pop(); return $w; }

    WID(mkMenuBar($w));
        WID(mkMenu($w, w_shell, "&File"));
            WID(mkMenuItem($w, "&Open..."));
                $w.addListener(SWT.Selection, function(e){ _fileOpenDlg(w_shell); });
            END();
            widgets.MenuItem($w, SWT.SEPARATOR);
            WID(mkMenuItem($w, "&Save"));
                $w.addListener(SWT.Selection, function(e){ _fileSave(w_shell); });
            END();
            WID(mkMenuItem($w, "Save &As..."));
                $w.addListener(SWT.Selection, function(e){ _saveAsDlg(w_shell); });
            END();
            widgets.MenuItem($w, SWT.SEPARATOR);
            WID(mkMenuItem($w, "E&xit"));
                $w.addListener(SWT.Selection, function(e){ _repomanExit(); });
            END();
        END();

        WID(mkMenu($w, w_shell, "&Edit"));
           WID(mkMenuItem($w, "&" + COPY_PATH_STR));
              $w.addListener(SWT.Selection, function(e){ _copyPath(); });
           END();
        END();

        WID(mkMenu($w, w_shell, "&Help"));
            WID(mkMenuItem($w, "&Instructions"));
                $w.addListener(SWT.Selection, function(e){ _instructions(w_shell); });
            END();
            widgets.MenuItem($w, SWT.SEPARATOR);
            WID(mkMenuItem($w, "&About Repoman"));
                $w.addListener(SWT.Selection, function(e){ _aboutRepoman(w_shell); });
            END();
        END();
    END();

app.w_sash =    /* SashForm */
    WID(custom.SashForm($w, SWT.HORIZONTAL));
        $w.setLayoutData(layout.GridData(GD.FILL_BOTH));
        /* Composite */
        WID(widgets.Composite($w, SWT.BORDER));
            var $gl = layout.GridLayout(3, false);
            $w.setLayout($gl);
app.w_packagesLabel = /* Label */
            WID(custom.CLabel($w, SWT.NULL));
                $w.setText(AVAILABLE_PACKAGES_STR);
                $w.setFont(rsrc.FON_LABEL);
                $w.addListener(SWT.MouseHover, function(e){ _labelHover(e); });
                $w.addListener(SWT.Dispose, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.KeyDown, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.MouseMove, function(e){ _mouseLeave(e); });
            END();
            WID(mkToolBar($w, SWT.HORIZONTAL | SWT.FLAT));
                $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_ADD_REM_DIRS,
                              ADD_DIR_STR + '...', ENABLED));
                    $w.addListener(SWT.Selection,
                    function(e){ _addRemovePackagesDlg(w_shell); });
                END();
            END();
            /* ToolBar */
            WID(mkToolBar($w, SWT.HORIZONTAL | SWT.FLAT));
                $w.setLayoutData(layout.GridData(GD.HORIZONTAL_ALIGN_END));
//                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_COLLAPSE, 'Collapse all', ENABLED));
//                END();
            END();
app.w_packagesTree = /* Tree */
            WID(widgets.Tree($w, SWT.BORDER|SWT.MULTI));
                var $gd = layout.GridData(GD.FILL_BOTH);
                $gd.horizontalSpan = 3;
                $w.setLayoutData($gd);
                $w.addListener(SWT.MouseHover, function(e){ _dumpsterMouseOver(e); });
                $w.addListener(SWT.Dispose, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.KeyDown, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.MouseMove, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.MouseDown, function(e){ _packagesTreeMouseDown(e); });
                $w.addListener(SWT.Expand, function(e){ _onExpandPackagesTreeNode(e); });
            END();
        END();
        /* Composite */
        WID(widgets.Composite($w, SWT.BORDER));
            var $gl = layout.GridLayout(3, false);
            $w.setLayout($gl);
app.w_packagePathLabel = /* Label */
            WID(custom.CLabel($w, SWT.NULL));
                $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
                $w.setText(PKGPATH_TREE_TITLE_STR);
                $w.setFont(rsrc.FON_LABEL);
                $w.addListener(SWT.MouseHover, function(e){ _labelHover(e); });
                $w.addListener(SWT.Dispose, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.KeyDown, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.MouseMove, function(e){ _mouseLeave(e); });
            END();
            WID(mkToolBar($w, SWT.HORIZONTAL | SWT.FLAT));
                $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_ADD, ADD_PATH_REPO_STR, ENABLED));
                    $w.addListener(SWT.Selection, function(e){ _addRepoDlg(w_shell); });
                END();
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_REFRESH, REFRESH_PATH_STR, ENABLED));
                  $w.addListener(SWT.Selection, function(e){ _refreshPackagePathRepos(); });
               END();
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_CHECK, CHECK_PACKAGE_PATH_STR, ENABLED));
                  $w.addListener(SWT.Selection, function(e){ _checkPackagePath(); });
               END();
app.w_btnRemoveDelete = 
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_DELETE, 'Remove Repository From Path/Delete Package', DISABLED));
                    $w.addListener(SWT.Selection, function(e){ _removeRepoOrDeletePackage(w_shell); });
                END();
app.w_btnMoveRepoUp = 
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_MOVE_UP, 'Move Up', DISABLED));
                    $w.addListener(SWT.Selection, function(e){ _moveRepoUp($w); });
                END();
app.w_btnMoveRepoDown = 
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_MOVE_DOWN, 'Move Down', DISABLED));
                    $w.addListener(SWT.Selection, function(e){ _moveRepoDown($w); });
                END();
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_PACKAGE_PATH, DEFAULT_PATH_STR, ENABLED));
                    $w.addListener(SWT.Selection, function(e){ _defaultPackagePath(); });
                END();
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_COPY, COPY_PATH_STR, ENABLED));
                    $w.addListener(SWT.Selection, function(e){ _copyPath(); });
                END();
            END();
            /* ToolBar */
            WID(mkToolBar($w, SWT.HORIZONTAL | SWT.FLAT));
                $w.setLayoutData(layout.GridData(GD.HORIZONTAL_ALIGN_END));
//                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_COLLAPSE, 'Collapse all', ENABLED));
//                END();
            END();
app.w_pkgPathTree = /* Tree */
            WID(widgets.Tree($w, SWT.BORDER));
                var $gd = layout.GridData(GD.FILL_BOTH);
                $gd.horizontalSpan = 3;
                $w.setLayoutData($gd);
                $w.addListener(SWT.MouseHover, function(e){ _repoMouseOver(e); });
                $w.addListener(SWT.Dispose, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.KeyDown, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.MouseMove, function(e){ _mouseLeave(e); });
                $w.addListener(SWT.MouseDown, function(e){ _repoTreeMouseDown(e); });
                $w.addListener(SWT.Selection, function(e){ _repoItemSelected(e); });
                $w.addListener(SWT.Expand, function(e){ _onExpandPkgPathTreeNode(e); });
            END();
        END();
        $w.setWeights([35, 65]);
    END();
    /* Composite */
    WID(widgets.Composite($w, SWT.NONE));
        var $gl = layout.GridLayout(3, false);
        $gl.marginWidth = $gl.marginHeight = 0;
        $w.setLayout($gl);
        $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
status.w_txt = /* Text */
        WID(custom.CLabel($w, SWT.BORDER));
            $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
            $w.setForeground(color(SWT.COLOR_DARK_CYAN));
            $w.setBackground(color(SWT.COLOR_WIDGET_BACKGROUND));
        END();
status.w_labDone = /* Label */
        WID(widgets.Label($w, SWT.NONE));
            $w.setImage(rsrc.ICO_LIGHT_GREEN);
            $w.setToolTipText('Ready');
        END();
status.w_labBusy = /* Label */
        WID(widgets.Label($w, SWT.NONE));
            $w.setLayoutData(layout.GridData(GD.HORIZONTAL_ALIGN_END));
            $w.setImage(rsrc.ICO_LIGHT_GRAY);
            $w.setToolTipText('Busy');
        END();
    END();
}

/*
 *  ======== _checkPkgPathTreeRepositories ========
 *
 */
function _checkPkgPathTreeRepositories()
{
    for (i = 0; i < app.w_pkgPathTree.getItemCount(); i++) {
        var ti = app.w_pkgPathTree.getItem(i);
        var dir = ti.getText();
        var checkResults = CheckPath.checkRepository(dir);

        if (checkResults.warning) {
            if (!(checkResults.exists && java.io.File(dir).isDirectory() &&
                repomanMain.isRepositoryWritable(dir))) {

                ti.setImage(0, rsrc.ICO_WARNING);
                ti.setData(checkResults);
            }
            else if (ti.getData() != null && ti.getImage() != null) {
                ti.setImage(0, null);
                ti.setData(null);
            }
        }
        else if (ti.getData() != null && ti.getImage() != null) {
            ti.setImage(0, null);
            ti.setData(null);
        }
    }
}

/*
 *  ======== _dataDroppedInPackagesView ========
 */
function _dataDroppedInPackagesView(e)
{
    if (e.data == null) {
        e.detail = dnd.DND.DROP_NONE;
    }
    else if (dnd.FileTransfer.getInstance().isSupportedType(e.currentDataType)){

        for each (var f in e.data) {

            var file = java.io.File(f);

            /* check if already in tree */
            var found = false;
            for each (var d in packagesTreeDirArr) {
                if (file.equals(java.io.File(d))) {
                    found = true;
                    break;
                }
            }
            if (found == true) {
                continue;
            }

            if (_isOrContainsAnArchive(file)) {

                if (dumpstersItem.getExpanded() == true) {
                    _showBusy();
                    var arr = _getArchivedPkgsArray(f);
                    if (arr.length > 0) {
                        archivedPkgsArrays.push(arr);
                        for each (var pkgstr in arr) {
                            _addArchivedPackageItem(pkgstr);
                        }
                        inArchivesDirArr.push(f);
                    }
                    _showDone();
                }
                else { /* add to addPackagesDirArr if not already there */
                    var found = false;
                    for each (var d in addPackagesDirArr) {
                        if (file.equals(java.io.File(d))) {
                            found = true;
                            break;
                        }
                    }
                    if (found == false) {
                        addPackagesDirArr.push(f);
                        if (dumpstersItem.getItemCount() == 0) {
                            widgets.TreeItem(dumpstersItem, SWT.NULL);
                        }
                    }
                }
            }
            else if (file.isDirectory()) {

                if (packagesItem.getExpanded() == true) {

                    _showBusy();
                    var stext = _getStatusText();
                    _setStatusText("Checking if " + f + " is a bundle...");
                    var arr = repoman._getBundlePkgNameAndRepositories(f);
                    _setStatusText(stext);
                    if (arr.length > 0) {  /* is a bundle */
            
                        _addBundleToRepositoriesBranch(f, arr);
                        inRepositoriesDirArr.push(f);
                    }
                    else {
                        arr = _getRepoPkgsArray(f); /* is it a repository? */
                        for each (var p in arr) {
                            _addPackageToInRepositoriesBranch(p);
                        }
                        if (arr.length > 0) {
                            inRepositoriesDirArr.push(f);
                        }
                    }
                    _showDone();
                }
                else {
                    addPackagesDirArr.push(f);
                    if (packagesItem.getItemCount() == 0) {
                        widgets.TreeItem(packagesItem, SWT.NULL);
                    }
                }
            }

            /**** Error msg if nothing found? */

            packagesTreeDirArr.push(f);
        }
    }
}

/*
 *  ======== _isOrContainsAnArchive ========
 */
function _isOrContainsAnArchive(file)
{
    var retval = false;

    if (file.isDirectory()) {
        var fnArr = file.list();
        java.util.Arrays.sort(fnArr);
        for each (var fn in fnArr) {
            var f = java.io.File(file, fn);
            if (f.isFile() && _isAnArchive(f.getName())) {

                retval = true;
                break;
            }
        }
    }
    else if (file.isFile() && _isAnArchive(file.getName())) {

        retval = true;    
    }
    return (retval);
}

/*
 *  ======== _packagesViewDragOver ========
 */
function _packagesViewDragOver(e)
{
    if (dnd.FileTransfer.getInstance().isSupportedType(e.currentDataType)) {
        if (e.item == null || e.item.getParentItem() == null) {
            e.detail = dnd.DND.DROP_COPY; 
        }
        else {
            e.detail = 0;
        }
    }
    else {
        e.detail = 0;
    }
}

/*
 *  ======== _initPackageDropTarget ========
 */
function _initPackagesDropTarget()
{
    var transfer = [dnd.FileTransfer.getInstance()];
    var dropTarget = dnd.DropTarget(app.w_packagesTree, dnd.DND.DROP_COPY);
    dropTarget.setTransfer(transfer); 
    dropTarget.addDropListener(new dnd.DropTargetListener({
        dragEnter: function(e) {},
        dragOver: function(e) { _packagesViewDragOver(e); },
        dragOperationChanged: function(e) {},
        dragLeave: function(e) {},
        dropAccept: function(e) {},
        drop: function(e) { _dataDroppedInPackagesView(e); },
    }));
}


/*
 *  ======== _refreshDumpstersItem ========
 */
function _refreshDumpstersItem()
{
    _showBusy();
    app.w_packagesTree.setRedraw(false);
    dumpstersItem.removeAll();
    for each (var arr in archivedPkgsArrays) {
        for each (var pkgstr in arr) {
            _addArchivedPackageItem(pkgstr);
        }
    }
    app.w_packagesTree.setRedraw(true);
    app.w_packagesTree.update();
    _showDone();
}

/*
 *  ======== _onPkgNameSort ========
 */
function _onPkgNameSort(e)
{
    var menuItems = app.w_packagesTree.getMenu().getItems();
    for (var i = 2; i < menuItems.length; i++) { 
        menuItems[i].setSelection(menuItems[i] == menuItems[2]);
    }
    sortByPackageName = true;

    if (dumpstersItem.getExpanded() == true) {
        _refreshDumpstersItem();
    }
}

/*
 *  ======== _onTarNameSort ========
 */
function _onTarNameSort(e)
{
    var menuItems = app.w_packagesTree.getMenu().getItems();
    for (var i = 2; i < menuItems.length; i++) { 
        menuItems[i].setSelection(menuItems[i] == menuItems[3]);
    }
    sortByPackageName = false;
    
    if (dumpstersItem.getExpanded() == true) {
        _refreshDumpstersItem();
    }
}

/*
 *  ======== _addPackageToInRepositoriesBranch ========
 */
function _addPackageToInRepositoriesBranch(pkgstr)
{
    var pkg = pkgstr.split(';');
    var index = _getNodeInsertIndex(packagesItem,
                                    pkg[PACKAGE_INDEX]);
    if (index < packagesItem.getItemCount() &&
        "" + packagesItem.getItem(index).getText() == "" +
        pkg[PACKAGE_INDEX]) {  /* dup name */

        var ti2;
        var ti = packagesItem.getItem(index);
        if (ti.getData() != null) {  /* create sub item */
            ti2 = widgets.TreeItem(ti, SWT.NULL, 0);
            var data = ti.getData();
            var dataArr = data.split(';');
            ti2.setText(dataArr[VERSION_INDEX] + "  " + 
                        Date.mkDate(dataArr[DATE_INDEX]));
            ti2.setData(data);
            ti.setData(null);

            /* move any repos to version branch */
            if (ti.getItemCount() > 1) {
                for (var i = 1; i < ti.getItemCount(); i++) {
                    var tiTmp = ti.getItem(i);
                    var ti3 = widgets.TreeItem(ti2, SWT.NULL);
                    ti3.setText(tiTmp.getText());
                    ti3.setData(tiTmp.getData());

                    /* bundle packages */
                    for (var j = 0; j < tiTmp.getItemCount(); j++) {
                        var ti4 = widgets.TreeItem(ti3, SWT.NULL);
                        ti4.setText(tiTmp.getItem(j).getText());
                    }
                }

                /* dispose old repos */
                while (ti.getItemCount() > 1) {
                    ti.getItem(1).dispose();
                }
            }
        }
        ti2 = widgets.TreeItem(ti, SWT.NULL);
        ti2.setText(pkg[VERSION_INDEX] + "  " +
                    Date.mkDate(pkg[DATE_INDEX]));
        ti2.setData(pkgstr);
        if (repoman._pkgLooksLikeABundle(pkg[FILE_INDEX],
            pkg[PACKAGE_INDEX])) {

            var bundleDir = java.io.File(pkg[FILE_INDEX] + 
                            '/' + pkg[PACKAGE_INDEX]).
                            getCanonicalPath();
            var repos = repoman.
                    _getBundlePkgNameAndRepositories(bundleDir);
            repos.shift();
            for each (var r in repos) {
                var ti3 = widgets.TreeItem(ti2, SWT.NULL);
                ti3.setText(r);
                ti3.setData(REPO_DATA_ID + bundleDir + ";" + r);

                /* add packages names */
                var arr = _getRepoPkgNamesArray(bundleDir + '/' + r);
                for each (var p in arr) {
                    var tiPkg = widgets.TreeItem(ti3, SWT.NULL);
                    tiPkg.setText(p);
                }
            }
        }
    }
    else {
        var ti = widgets.TreeItem(packagesItem, SWT.NULL, index);
        ti.setText(pkg[PACKAGE_INDEX]);
        ti.setData(pkgstr);
        if (repoman._pkgLooksLikeABundle(pkg[FILE_INDEX],
            pkg[PACKAGE_INDEX])) {

            var bundleDir = java.io.File(pkg[FILE_INDEX] + 
                            '/' + pkg[PACKAGE_INDEX]).
                            getCanonicalPath();
            var repos = repoman.
                _getBundlePkgNameAndRepositories(bundleDir);
            repos.shift();
            for each (var r in repos) {
                if (!java.io.File(bundleDir + '/' + r).exists()) {
                    continue;
                }
                var ti2 = widgets.TreeItem(ti, SWT.NULL);
                ti2.setText(r);
                ti2.setData(REPO_DATA_ID + bundleDir + ";" + r);

                /* add packages names */
                var arr = _getRepoPkgNamesArray(bundleDir + '/' + r);
                for each (var p in arr) {
                    var tiPkg = widgets.TreeItem(ti2, SWT.NULL);
                    tiPkg.setText(p);
                }
            }
        }
    }
}

/*
 *  ======== _addBundleToRepositoriesBranch ========
 */
function _addBundleToRepositoriesBranch(dir, bundleInfoArr)
{
    var pkgName = String(bundleInfoArr.shift());
    var index = _getNodeInsertIndex(packagesItem, pkgName);
    dir = String(dir);

    /* dup name ? */
    if (index < packagesItem.getItemCount() &&
        "" + packagesItem.getItem(index).getText() == "" + pkgName) {

        var ti2;
        var dataArr;
        var ti = packagesItem.getItem(index);
        if (ti.getData() != null) {  /* create sub item */
            ti2 = widgets.TreeItem(ti, SWT.NULL, 0);
            var data = ti.getData();
            dataArr = data.split(';');
            ti2.setText(dataArr[VERSION_INDEX] + "  " + 
                        Date.mkDate(dataArr[DATE_INDEX]));
            ti2.setData(data);
            ti.setData(null);

            /* move any repos to version branch */
            if (ti.getItemCount() > 1) {
                for (var i = 1; i < ti.getItemCount(); i++) {
                    var tiTmp = ti.getItem(i);
                    var ti3 = widgets.TreeItem(ti2, SWT.NULL);
                    ti3.setText(tiTmp.getText());
                    ti3.setData(tiTmp.getData());

                     /* bundle packages */
                    for (var j = 0; j < tiTmp.getItemCount(); j++) {
                        var ti4 = widgets.TreeItem(ti3, SWT.NULL);
                        ti4.setText(tiTmp.getItem(j).getText());
                        ti4.setData(tiTmp.getItem(j).getData());
                    }
                }

                /* dispose old repos */
                while (ti.getItemCount() > 1) {
                    ti.getItem(1).dispose();
                }
            }
        }
        ti2 = widgets.TreeItem(ti, SWT.NULL);
        var info = _getPackageInfo(dir);
        var data = pkgName + ';' + _getParentDir(dir, pkgName);
        for each (var i in info) {
            data += ';' + i;
        }
        ti2.setData(data);
        dataArr = data.split(';');
        ti2.setText(dataArr[VERSION_INDEX] + "  " + 
                    Date.mkDate(dataArr[DATE_INDEX]));

        /* add repository names */
        for each (var r in bundleInfoArr) {
            var ti3 = widgets.TreeItem(ti2, SWT.NULL);
            ti3.setText(r);
            ti3.setData(REPO_DATA_ID + dir + ";" + r);

            /* add packages names */
            var pkgarr = _getRepoPkgNamesArray(dir + '/' + r);
            for each (var p in pkgarr) {
                var tiPkg = widgets.TreeItem(ti3, SWT.NULL);
                tiPkg.setText(p);
                tiPkg.setData(BUNDLE_PKG_DATA_ID + p + ';' + dir + '/' + r);
            }

        }
    }
    else {
        var ti = widgets.TreeItem(packagesItem, SWT.NULL, index);
        ti.setText(pkgName);
        ti.setImage(rsrc.ICO_BUNDLE);
        var info = _getPackageInfo(dir);
        var data = pkgName + ';' + _getParentDir(dir, pkgName);
        for each (var i in info) {
            data += ';' + i;
        }
        ti.setData(data);
        for each (var r in bundleInfoArr) {
            if (!java.io.File(dir + '/' + r).exists()) {
                continue;
            }
            var ti2 = widgets.TreeItem(ti, SWT.NULL);
            ti2.setText(r);
            ti2.setData(REPO_DATA_ID + dir + ";" + r);
                
            /* add packages names */
            var pkgarr = _getRepoPkgNamesArray(dir + '/' + r);
            for each (var p in pkgarr) {
                var tiPkg = widgets.TreeItem(ti2, SWT.NULL);
                tiPkg.setText(p);
                tiPkg.setData(BUNDLE_PKG_DATA_ID + p + ';' + dir + '/' + r);
            }
        }
    }
}

/*
 *  ======== _addArchivedPackageItem ========
 */
function _addArchivedPackageItem(pkgstr)
{
    var pkg = pkgstr.split(';');
    var textName = (sortByPackageName == true) ?
                   pkg[PACKAGE_INDEX] :
                   java.io.File(pkg[FILE_INDEX]).getName();
    var index = _getNodeInsertIndex(dumpstersItem, textName);

     /* dup name ? */
    if (index < dumpstersItem.getItemCount() &&
        "" + dumpstersItem.getItem(index).getText() == "" + textName) { 

        var ti2;
        var ti = dumpstersItem.getItem(index);
        if (ti.getData() != null) {  /* create sub item */

            ti2 = widgets.TreeItem(ti, SWT.NULL, 0);
            var data = ti.getData();
            var dataArr = data.split(';');
            var dupText = "";
            if (sortByPackageName == true) {
                dupText = dataArr[VERSION_INDEX] + "  ";
            }
            dupText += dataArr[DATE_INDEX];
            ti2.setText(dupText);
            ti2.setData(data);
            ti.setData(null);

            /* move any repos to version branch */
            if (ti.getItemCount() > 1) {
                for (var i = 1; i < ti.getItemCount(); i++) {
                    var tiTmp = ti.getItem(i);
                    var ti3 = widgets.TreeItem(ti2, SWT.NULL);
                    ti3.setText(tiTmp.getText());
                    ti3.setData(tiTmp.getData());

                    /* bundle packages */
                    for (var j = 0; j < tiTmp.getItemCount(); j++) {
                        var ti4 = widgets.TreeItem(ti3, SWT.NULL);
                        ti4.setText(tiTmp.getItem(j).getText());
                        ti4.setData(tiTmp.getItem(j).getData());
                    }
                }

                /* dispose old repos */
                while (ti.getItemCount() > 1) {
                    ti.getItem(1).dispose();
                }
            }
        }
        ti2 = widgets.TreeItem(ti, SWT.NULL);
        var dupText = "";
        if (sortByPackageName == true) {
            dupText = pkg[VERSION_INDEX] + "  ";
        }
        dupText += pkg[DATE_INDEX];
        ti2.setText(dupText);
        ti2.setData(pkgstr);
        
        /* repositories are represented as:
         * repo1Name[pkg1][pkg2]...|repo2Name[pkg1]...|
         */

        if (pkg[REPOSITORIES_INDEX].length > 0) { /* bundle? */
            var repos = pkg[REPOSITORIES_INDEX].split('|');
            for each (var r in repos) {
                if (r.length == 0) {
                    continue;
                }
                var ti3 = widgets.TreeItem(ti2, SWT.NULL);
                var pkgsIndex = r.indexOf('[');
                var name = r.substr(0,pkgsIndex);
                ti3.setText(name);
                ti3.setData(ARCHIVE_REPO_DATA_ID + pkg[FILE_INDEX] + ";" +
                            name);
                var repoPkgs = r.substr(pkgsIndex);
                repoPkgs = repoPkgs.replace(/\[/g, '');
                repoPkgs = repoPkgs.split(']');
                for (var i = 0; i < repoPkgs.length; i++) {
                    if (repoPkgs[i].length > 0) {
                        var tiPkg = widgets.TreeItem(ti3, SWT.NULL);
                        tiPkg.setText(repoPkgs[i]);
                        tiPkg.setData(AR_BUNDLE_PKG_DATA_ID + repoPkgs[i] + ';' +
                                      pkg[FILE_INDEX] + ";" + name);
                    }
                }
            }
        }
    }
    else {
        var ti = widgets.TreeItem(dumpstersItem, SWT.NULL, index);
        ti.setText(textName);
        ti.setData(pkgstr); 
        if (pkg[REPOSITORIES_INDEX].length > 0) { /* bundle? */
            ti.setImage(rsrc.ICO_BUNDLE);
            var repos = pkg[REPOSITORIES_INDEX].split('|');
            for each (var r in repos) {
                if (r.length == 0) {
                    continue;
                }
                var ti2 = widgets.TreeItem(ti, SWT.NULL);
                var pkgsIndex = r.indexOf('[');
                var name = r.substr(0,pkgsIndex);
                ti2.setText(name);
                ti2.setData(ARCHIVE_REPO_DATA_ID + pkg[FILE_INDEX] + ";" +
                            name);
                var repoPkgs = r.substr(pkgsIndex);
                repoPkgs = repoPkgs.replace(/\[/g, '');
                repoPkgs = repoPkgs.split(']');
                for (var i = 0; i < repoPkgs.length; i++) {
                    if (repoPkgs[i].length > 0) {
                        var tiPkg = widgets.TreeItem(ti2, SWT.NULL);
                        tiPkg.setText(repoPkgs[i]);
                        tiPkg.setData(AR_BUNDLE_PKG_DATA_ID + repoPkgs[i] + ';' +
                                      pkg[FILE_INDEX] + ";" + name);
                    }
                }
            }
        }
    }
}

/*
 *  ======== _defaultPackagePath ========
 */
function _defaultPackagePath()
{
    curFile = "";
    app.w_pkgPathTree.removeAll();
    app.w_pkgPathTree.update();
    _initXDCVars();
    _initPackagePathTree();
}

/*
 *  ======== _shadowCheck ========
 */
function _shadowCheck()
{
    var shadow;
    shadowResults = [];

    /* change font back to normal if any */
    /* previous dups                     */
    if (dupsArr.length > 0) {
        var repoItems = app.w_pkgPathTree.getItems();
        for (var i = 0; i < repoItems.length; i++) {
            var pkgItems = repoItems[i].getItems();
            for (var j = 0; j < pkgItems.length; j++) {
                pkgItems[j].setFont(fonItemNormal);
            }
        }
    }

    dupsArr = _findDuplicatePackages();

    if (dupsArr.length > 0) {
        shadow = xdc.loadCapsule('xdc/tools/path/ShadowCompare.xs');
    }

    for each (var d in dupsArr) {
        var results = shadow.comparePackageDirs(d.pkgName, d.repolist);

        if (results.length > 0) {

            for each (var item in app.w_pkgPathTree.getItems()) {
                for each (var r in results) {
                    if (r.repo == item.getText()) {
                        for each (var pkgItem in item.getItems()) {
                            if (("" + d.pkgName) == pkgItem.getText()) {
                                if (pkgItem.getImage() == null) {
                                    pkgItem.setImage(rsrc.ICO_WARNING);
                                    if (pkgItem.getParentItem().getImage() ==
                                        null) {

                                        pkgItem.getParentItem().
                                                setImage(rsrc.ICO_WARNING);
                                    }
                                }
                            }
                        }
                    }
                }
            }
            for each (var r in results) {
                shadowResults.push(r);
            }
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
 *                                                        
 */
function _findDuplicatePackages()
{
    var dup = [];
    var dupsArr = [];
    var repoItems = app.w_pkgPathTree.getItems();
    for (var i = 0; i < repoItems.length - 1; i++) {

        var pkgItems = repoItems[i].getItems();
        for (var j = 0; j < pkgItems.length; j++) {

            var pkgName = pkgItems[j].getText();
            if (("" + pkgName).length == 0 || dup[pkgName] != undefined) {
                continue;
            }
            var repolist = [];
            for (var k = i + 1; k < repoItems.length; k++) {

                if (_findDuplicateItem(repoItems[k], pkgName)) {
                    repolist.push(repoItems[k].getText());
                }
            }
            if (repolist.length > 0) {
                
                /* set font to italic for dup item */
                pkgItems[j].setFont(fonItemItalic);

                /* insert first repo at beginning of array */
                repolist.splice(0, 0, repoItems[i].getText());

                /* fill the dup obj and push it on dupsArr */
                var dupObj = {};
                dupObj.pkgName = pkgName;
                dupObj.repolist = repolist;
                dupsArr.push(dupObj);
                dup[pkgName] = true;
            }
        }
    }
    return (dupsArr);
}

/*
 *  ======== _findDuplicateItem ========
 */
function _findDuplicateItem(repoItem, pkgName)
{
    var found = false;
    var pkgItems = repoItem.getItems();
    for (var i = 0; i < pkgItems.length; i++) {
        if ("" + pkgName == pkgItems[i].getText()) {

            /* set font to italic for dup item */
            pkgItems[i].setFont(fonItemItalic);

            found = true;
            break;
        }
    }
    return (found);
}

/*
 *  ======== _labelHover ========
 */
function _labelHover(e)
{
    var pt;
    if (hoverTip != null  && !hoverTip.isDisposed()) {
        hoverTip.dispose();
    }
    hoverTip = widgets.Shell(w_shell, SWT.ON_TOP | SWT.NO_FOCUS | SWT.TOOL);
    hoverTip.setBackground (w_display.getSystemColor (SWT.COLOR_INFO_BACKGROUND));
    var lo = layout.FillLayout();
    lo.marginWidth = 2;
    hoverTip.setLayout(lo);
    hoverLabel = widgets.Label(hoverTip, SWT.NONE);
    hoverLabel.setForeground(w_display.getSystemColor(SWT.COLOR_INFO_FOREGROUND));
    hoverLabel.setBackground(w_display.getSystemColor(SWT.COLOR_INFO_BACKGROUND));
    var text = (e.widget ==  app.w_packagesLabel) ?
                AVAILABLE_PACKAGES_HOVER_STR :
                PACKAGE_PATH_HOVER_STR;
    hoverLabel.setText(text);
    hoverLabel.addListener(SWT.MouseExit, function(e) { _mouseLeave(e); });
    hoverLabel.addListener(SWT.MouseDown, function(e) { _mouseLeave(e); });
    var size = hoverTip.computeSize(SWT.DEFAULT, SWT.DEFAULT);
    var rect = e.widget.getBounds();
    var curPt = graphics.Point(e.x, e.y);
    if (curPt == undefined) {
        pt = e.widget.toDisplay(rect.x, rect.y);
    }
    else {
        pt = e.widget.toDisplay(curPt.x, curPt.y);
    }
    hoverTip.setBounds(pt.x, pt.y + rect.height + 4, size.x, size.y);
    hoverTip.setVisible(true);
}

/*
 *  ======== _processRepomanFile ========
 */
function _processRepomanFile(fileName, doc)
{
    var results;
    var str;
    var repos = [];
    var resultsRepos = [];

    var searchPath = doc.searchPath;

    for (var i = 0; i < doc.repositories.repository.length(); i++) {
        var repo = doc.repositories.repository[i];
        var repoStr = repo.@path + ";";
        if (repo.pkg.length() > 0) {
            for (var j = 0; j < repo.pkg.length(); j++) {
                repoStr += repo.pkg[j].@name + "[" + repo.pkg[j].@key + "];";
            }
        }
        repos.push(repoStr);
    }

    if (repos.length) { /* restore repositories */

        var dlg = xdc.loadCapsule('RepoRestore.xs');
        results = dlg.open(w_display, w_shell,
                           fileName, searchPath, repos.join('\n'));

        /* results are returned as:
           searchpath\n
           source repositories path (';' delimited)\n
           dest repositories path (';' delimited)
        */
        if (results.length > 0) {            
            var resultsArr = results.split('\n');
            searchPath = resultsArr[0];
            var srcRepos = resultsArr[1].split(';');
            var destRepos = resultsArr[2].split(';');
            for (var i = 0; i < srcRepos.length; i++) {
                if (srcRepos[i].length > 0) {
                    if (java.io.File(destRepos[i]).exists()) {
                        resultsRepos[srcRepos[i]] = destRepos[i];
                    }
                }
            }
        }
    }
    else {
        var msgBox = widgets.MessageBox(w_shell, SWT.OK | SWT.ICON_WARNING);
        msgBox.setText(REPOMAN_STR);
        msgBox.setMessage("No packages to restore");
        msgBox.open();
    }

     _clear();
    hat = "";
    xdcrootrepo = "";

    for (i = 0; i < doc.repositories.repository.length(); i++) {

        var repoXML = doc.repositories.repository[i];
        var repoPath = (resultsRepos[repoXML.@path] != undefined) ?
                       resultsRepos[repoXML.@path] : repoXML.@path;

        if (repoXML.@xdcRoot == "true") {
            xdcrootrepo = "" + repoPath;
        }
        if (repoXML.@xdcHat == "true") {
            hat = "" + repoPath;
        }

        if (repoXML.@readOnly != "true" && java.io.File(repoPath).exists()) {
            repomanMain.createRepoXmlFile(repoPath,
                                       {providerId : null,
                                        writable   : 'true'});
        }
        var ti = _addPkgPathTreeNode(repoPath);
        if (repoXML.pkg.length() > 0) {
            _populatePkgPathTreeNode(ti);
            var pkgXML = repoXML.pkg;
            var pkgItems = ti.getItems();
            for (var j = 0; j < pkgXML.length(); j++) {
                if (pkgXML[j].@archive.length() > 0) {
                    for (var k = 0; k < pkgItems.length; k++) {
                        if (pkgXML[j].@name == ("" + pkgItems[k].getText())) {
                            pkgItems[k].getData().push(pkgXML[j].@archive);
                            break;
                        }
                    }
                }
            }
        }
    }

    /* add the search path to dumpsters tree */
    if (searchPath != null && searchPath.length > 0) {
        var arr = searchPath.split(';');
        for each (var d in arr) {
            if (d.length > 0) {
                if (repoman.isValidURL(d) || java.io.File(d).exists()) {
                    packagesTreeDirArr.push(d);
                    addPackagesDirArr.push(d);
                }
            }
        }
        if (addPackagesDirArr.length > 0) {
            /* add dummy items to packages tree */
            widgets.TreeItem(dumpstersItem, SWT.NULL);
            widgets.TreeItem(packagesItem, SWT.NULL);
            dumpstersItem.setExpanded(false);
            packagesItem.setExpanded(false);
        }
    }

    _setStatusText("");
    _showDone();
    curFile = fileName; 
}

/*
 *  ======== _readRepomanFile ========
 */
function _readRepomanFile(shell, fileName)
{   
    var doc = null;
    var status = "";
    var f = java.io.File(fileName);
    if (f.exists()) {
        try {
            doc = xdc.loadXML(fileName);
        }
        catch (e) {
            status = e.message;
        }
    }
    else {
        status = CANT_FIND_FILE_STR + fileName;
    }
    if (status != "") {
        var msgBox = widgets.MessageBox(shell, SWT.OK | SWT.ICON_ERROR);
        msgBox.setText(ERROR_STR);
        msgBox.setMessage(status);
        msgBox.open();
        doc = null;
    }
    return (doc);
}

/*


/*
 *  ======== _fileOpenDlg ========
 */
function _fileOpenDlg(shell)
{
    var dlg = widgets.FileDialog(shell, SWT.OPEN);
    dlg.setText("Open");
    dlg.setFilterExtensions(repomanFilterExt);
    dlg.setFilterNames(repomanFilterNames);
    var fileName = dlg.open();

    if (fileName != null) {
        var doc = _readRepomanFile(shell, fileName);
        if (doc != null) {
            _processRepomanFile(fileName, doc);
        }
    }
}

/*
 *  ======== _clear ========
 */
function _clear()
{
    curFile = "";
    xdcrootrepo = "";
    hat = "";
    packagesTreeDirArr = [];
    addPackagesDirArr = [];
    app.w_pkgPathTree.removeAll();
    app.w_pkgPathTree.update();
    dumpstersItem.removeAll();
    packagesItem.removeAll();
    app.w_packagesTree.update();
}


/*
 *  ======== _fileSave ========
 */
function _fileSave(shell)
{
    if (curFile == "") {
        _saveAsDlg(shell);
    }
    else {
        _saveRepoInfoToFile(shell, curFile);
    }
}

/*
 *  ======== _isValidDragSourceData ========
 */
function _isValidDragSourceData()
{
    var retVal = true;
    var selArr = app.w_packagesTree.getSelection();
    for each (var ti in selArr) {
        if (ti.getData() == null || _isPhysicalBundleItem(ti) ||
            _isBundleItem(ti)) {

            retVal = false;
            break;
        }
        if (_isBundlePackage(ti) && _parentItemIsSelected(ti, selArr)) {
            retVal = false;
            break;
        }
    }
    return (retVal);
}

/*
 *  ======== _saveRepoInfoToFile ========
 */
function _saveRepoInfoToFile(shell, destFile)
{
    var status = "";
    var repoArr = [];
    var doc = null;

    var repoItems = app.w_pkgPathTree.getItems();
    for (var i = 0; i < repoItems.length; i++) {
        repoArr.push("" + (repoItems[i].getText()));
    }
    if (repoArr.length > 0) {
        var args = ["--rsave", "-f"].concat(destFile);
        if (packagesTreeDirArr.length > 0) {
            args = args.concat('-p', (packagesTreeDirArr.join(";") + ";"));
        }
        args = args.concat(repoArr);
        try {
            status = cmd.repoman.exec(args);
        }
        catch (e) {
            status = e.message;
        }
    }
    else {
        doc = <repoman/>;
        doc.searchPath = (packagesTreeDirArr.length > 0) ?
                         packagesTreeDirArr.join(";") + ";" :
                         "";
        doc.appendChild(<repositories/>);
    }
    if (status == "") {
   
        try {
            if (doc == null) {  /* add package path tree data */
                doc = xdc.loadXML(destFile);
                for (var i = 0; i < doc.repositories.repository.length(); i++){
                    var repo = doc.repositories.repository[i];
                    var path = "" + repo.@path;
                    if (java.io.File(path).exists()) {
                        if (_isXdcRoot(path)) {
                            repo.@xdcRoot = "true";
                        }
                        if (_isXdcHat(path)) {
                            repo.@xdcHat = "true";
                        }
                        if (!repomanMain.isRepositoryWritable(path)) {
                            repo.@readOnly = "true";
                        }

                        if (repo.@readOnly != "true") {
                            var pkgXML = repo.pkg;
                            var pkgItems =  repoItems[i].getItems();
                            for (var k = 0; k < pkgItems.length; k++) {
                                var pkgArr = pkgItems[k].getData();
                                if (pkgArr != null &&
                                    pkgArr[ARCHIVE_INDEX] != undefined) {

                                    for (var j = 0; j < pkgXML.length(); j++) {
                                        if (pkgXML[j].@name ==
                                            ("" + pkgItems[k].getText())) {

                                            pkgXML[j].@archive =
                                                    pkgArr[ARCHIVE_INDEX];
                                            break;
                                        }
                                    }
                                }
                            }
                        }
                    }
                }
            }
            /* save the doc to file */
            var file = java.io.File(destFile);
            var toFile = java.io.RandomAccessFile(file, "rwd");
            toFile.setLength(0);
            toFile.writeBytes(doc.toXMLString());
            toFile.close();
        }
        catch (e) {
            status = "error: " + e.message;
        }

    }
    if (status != "") {
        _errorMsg(status);
    }
    else {
        /* TODO: set title */
        curFile = destFile;
    }
}

/*
 *  ======== _saveAsDlg ========
 */
function _saveAsDlg(shell)
{
    var dlg = widgets.FileDialog(shell, SWT.SAVE);
    dlg.setText(SAVE_AS_STR);
    dlg.setFilterExtensions(repomanFilterExt);
    dlg.setFilterNames(repomanFilterNames);
    var fileName = dlg.open();
    while (true) {
        if (fileName != null) {
            var destFile = java.io.File(fileName);
            if (destFile.exists()) {
                if (_okToOverwrite(shell, destFile.getAbsolutePath())) {
                    _saveRepoInfoToFile(shell, destFile.getAbsolutePath());
                    break;
                }
            }
            else {
                _saveRepoInfoToFile(shell, destFile.getAbsolutePath());
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
 *  ======== _okToOverwrite ========
 */
function _okToOverwrite(shell, fileName)
{
    var msgBox = widgets.MessageBox(shell, SWT.YES | SWT.NO | SWT.ICON_QUESTION);
    msgBox.setText(REPOMAN_STR);
    msgBox.setMessage(fileName + REPLACE_EXISTING_STR);
    return (msgBox.open() == SWT.YES);
}


/*
 *  ======== _repoNotFoundMsg ========
 */
function _repoNotFoundMsg(src, repo)
{
    var msgBox = widgets.MessageBox(w_shell, SWT.OK|SWT.ICON_ERROR);
    msgBox.setText(REPOMAN_STR);
    msgBox.setMessage(repo + " not found in " + src);
    msgBox.open();
}

/*
 *  ======== _pkgsNotFoundMsg ========
 */
function _pkgsNotFoundMsg(repo)
{
    var msgBox = widgets.MessageBox(w_shell, SWT.OK|SWT.ICON_ERROR);
    msgBox.setText(REPOMAN_STR);
    msgBox.setMessage("No packages found in " + repo);
    msgBox.open();
}

/*
 *  ======== _getPackageInfo ========
 *
 */
function _getPackageInfo(dir)
{
    var list = [];
    var pkgRelXmlFile = java.io.File(dir).getCanonicalPath() + "/package/" +
                        PACKAGE_REL_XML_FILE_STR;
    if (java.io.File(pkgRelXmlFile).exists()) {

        var doc = Packages.xdc.services.global.XML.parse(pkgRelXmlFile);
        var relAttrs = doc.getElementsByTagName("release").item(0).getAttributes();
        list.push(relAttrs.getNamedItem("name").getNodeValue());
        list.push(relAttrs.getNamedItem("label").getNodeValue());
        list.push(doc.getElementsByTagName("package").item(0).getAttributes().
                  getNamedItem("version").getNodeValue());
        list.push(relAttrs.getNamedItem("date").getNodeValue());
    }
    else {
        list = ["", "", "", ""];
    }
    return (list);
}

/*
 *  ======== _copyRepositoryPackages ========
 */
function _copyRepositoryPackages(ti, repoData)
{
    var data = repoData.split(';');
    _showBusy();

    var repoDir = java.io.File(data[1]).getCanonicalPath() + '/' + data[2];
    if (!java.io.File(repoDir).exists()) {
        _repoNotFoundMsg(java.io.File(data[1]).getCanonicalPath(), data[2]);
    }
    else {

        /* get packages info for call to _addWorkingPackages */
        var arr = _getRepoPkgsArray(repoDir);
        if (arr.length > 0) {
            /* hack to format like tree item data */
            for (var i = 0; i < arr.length; i++) {
                arr[i] = ';' + arr[i];
            }
            _addWorkingPackages(ti, arr);
        }
        else {
            _pkgsNotFoundMsg(repoDir);
        }
    }
    _setStatusText("");
    _showDone();
}

/*
 *  ======== _extractRepositoryPackages ========
 */
function _extractRepositoryPackages(ti, repoData)
{
    var data = repoData.split(';');
    _showBusy();

    /* extract repository to a tmp dir */
    var tmpdir = Packages.xdc.services.global.Host.tmpdir();
    tmpdir = java.io.File(tmpdir).getCanonicalPath();
    _setStatusText("Extracting \"" + data[2] + "\" from " + data[1] + " to temp dir...");
    var args = ['-x', '-r'].concat(tmpdir, '-b', "" + data[2], "" + data[1]);
    try {
        var ret = String(cmd.repoman.exec(args));
        /* get packages info for call to _addWorkingPackages */
        var arr = _getRepoPkgsArray(tmpdir);
        if (arr.length) {
            /* hack to format like tree item data */
            for (var i = 0; i < arr.length; i++) {
                arr[i] = ';' + arr[i];
            }
            _addWorkingPackages(ti, arr, data[1]);
            _showBusy();
            _setStatusText(CLEANING_UP_STR);

            /* remove temp dir */
            var tmpdirFile = java.io.File(tmpdir);
            repoman._deleteDirectoryContents(null, tmpdirFile);
            tmpdirFile['delete']();
        }
        else {
            _repoNotFoundMsg(data[1], data[2]);
        }
        _setStatusText(ret.length == 0 ? "" :
             "Warning: some packages could not be extracted");

    }
    catch(e) {
        _errorMsg(e.message);
    }
    _showDone();
}

/*
 *  ======== _checkBundleChildren ========
 *
 *  if an archived bundle is selected, deselect
 *  any selected children, because the bundle
 *  selection includes all children
 *
 */
function _checkBundleChildren(selItem, selArr)
{
    /* deselect any children */
    var deselItems = [];
    var tmpItems = selItem.getItems();
    var items = [];
    for each (var ti in tmpItems) {
        items.push(ti);
    }
    for (var i = 0; i < selArr.length; i++) {
        for (var j = 0; j < items.length; j++) {
            if (selArr[i] == items[j]) {
                deselItems.push(i);
                items.splice(j, 1);
                break;
            }
        }
        if (items.length == 0) {
            break;
        }
    }
    if (deselItems.length > 0) {
        deselItems.reverse();
        for each (var i in deselItems) {
            selArr.splice(i, 1);
        }
    }
    return (selArr);
}

/*
 *  ======== _isBundleRepositoryItem ========
 */
function _isBundleRepositoryItem(item)
{
    var data = item.getData();
    return (data != null &&
            (data.startsWith(REPO_DATA_ID) ||
             data.startsWith(ARCHIVE_REPO_DATA_ID)));
}

/*
 *  ======== _isParentOfRepository ========
 */
function _isParentOfRepository(item)
{
    var items = item.getItems();
    if (items.length > 0) {
        return (_isBundleRepositoryItem(items[0]));
    }
    return (false);
}

/*
 *  ======== _isPhysicalBundleItem ========
 */
function _isPhysicalBundleItem(ti)
{
    var data = ti.getData().split(';');
    return (repoman._pkgLooksLikeABundle(data[FILE_INDEX],
            data[PACKAGE_INDEX]) && _isParentOfRepository(ti));
}

/*
 *  ======== _aboutRepoman ========
 */
function _aboutRepoman(shell)
{
    var msgBox = widgets.MessageBox(shell, SWT.OK | SWT.ICON_INFORMATION);
    msgBox.setText(REPOMAN_STR);

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
    msgBox.setMessage(REPOMAN_STR + "\n\n" + info);
    msgBox.open();
}

/*
 *  ======== _repomanExit ========
 */
function _repomanExit()
{
    w_display.dispose();
}

/*
 *  ======== _destPackageExists ========
 */
function _destPackageExists(pkgName, repoName)
{
    pkgName = "" + pkgName;
    var pkgDir = repoName + '/' + pkgName.replace(/\./g, '/');
    return (java.io.File(pkgDir + '/' + PACKAGE_XDC_FILE_STR).exists());
}

/*
 *  ======== _confirmPackageOverwrite ========
 */
function _confirmPackageOverwrite(pkgName, repoName)
{
    var msgBox = widgets.MessageBox(w_shell, SWT.OK|SWT.CANCEL|SWT.ICON_WARNING);
    msgBox.setText(REPOMAN_STR);
    msgBox.setMessage(pkgName + " already exists in " + repoName + "\n" +
                      "Overwrite existing?");
    return (msgBox.open() == SWT.OK);
}


/*
 *  ======== _confirmPackageDelete ========
 */
function _confirmPackageDelete(pkgName, repoName)
{
    var msgBox = widgets.MessageBox(w_shell, SWT.OK|SWT.CANCEL|SWT.ICON_WARNING);
    msgBox.setText(REPOMAN_STR);
    msgBox.setMessage("This will physically delete all " + pkgName +
                      " files\nfrom " + repoName);
    return (msgBox.open() == SWT.OK);
}

/*
 *  ======== _isAnArchive ========
 */
function _isAnArchive(str)
{
    var fileStr = java.lang.String(str);
    return (fileStr.endsWith(".tar") || fileStr.endsWith(".tar.gz") ||
            fileStr.endsWith(".zip"));
}

/*
 *  ======== _onExpandPackagesTreeNode ========
 */
function _onExpandPackagesTreeNode(e)
{
    if (e.item.getText() == ARCHIVED_PACKAGES_STR) {

        /* if removePackagesDirArr has any items in            */
        /* inArchivesDirArr, remove all items under node and   */
        /* repopulate the remaining archive directories rather */
        /* than parsing the tree and removing single items     */
        /* and parts of duplicates                             */

        var removedDirs = [];
        for each (var rmdir in removePackagesDirArr) {
            if (inArchivesDirArr.length == 0) {
                break;
            }
            if (repoman.isURL(rmdir)) {
                var url = java.net.URL(rmdir);
                for (var i = 0; i < inArchivesDirArr.length; i++) {
                    if (_urlEqualsStr(url, inArchivesDirArr[i])) {
                        inArchivesDirArr.splice(i, 1);
                        removedDirs.push(rmdir);
                        break;
                    }
                }
            }
            else {
                var rmdirFile = java.io.File(rmdir);
                for (var i = 0; i < inArchivesDirArr.length; i++) {
                    if (rmdirFile.equals(java.io.File(inArchivesDirArr[i]))) {
                        inArchivesDirArr.splice(i, 1);
                        removedDirs.push(rmdir);
                        break;
                    }
                }
            }
        }
        if (removedDirs.length > 0) {
            /* update removePackagesDirArr */
            for each (var rmdir in removedDirs) {
                for (var i = 0; i < removePackagesDirArr.length; i++) {
                    if (rmdir == removePackagesDirArr[i]) {
                        removePackagesDirArr.splice(i, 1);
                        break;
                    }
                }
            }

            /* re-add any dirs that weren't removed */
            for each (var ardir in inArchivesDirArr) {
                addPackagesDirArr.push(ardir);
            }
            inArchivesDirArr = [];
            dumpstersItem.removeAll();
            widgets.TreeItem(dumpstersItem, SWT.NULL);
        }

        /* TODO: incremental status ? */
        /* TODO: pre-scan for archives? */

        /* go through addPackagesDirArr tab and see if any  */
        /* archived package hits, if yes, add the packages, */
        /* remove dir from addPackagesDirArr and add it to  */
        /* inArchivesDirArr                                 */

        if (addPackagesDirArr.length > 0) {
            archivedPkgsArrays = [];
        }
        var addedDirs = [];
        _showBusy();
        for each (var dir in addPackagesDirArr) {
            var arr = _getArchivedPkgsArray(dir);
            if (arr.length > 0) {
                archivedPkgsArrays.push(arr);
                for each (var pkgstr in arr) {
                    _addArchivedPackageItem(pkgstr);
                }
                addedDirs.push(dir);
            }
        }
        if (addedDirs.length > 0) {

            /* remove each dir from addPackagesDirArr and */
            /* add it to inArchivesDirArr             */
            for each (var dir in addedDirs) {
                if (repoman.isURL(dir)) {
                    var url = java.net.URL(dir);
                    for (var i = 0; i < addPackagesDirArr.length; i++) {
                        if (_urlEqualsStr(url, addPackagesDirArr[i])) {
                            addPackagesDirArr.splice(i, 1);
                            break;
                        }
                    }
                }
                else {
                    var dirFile = java.io.File(dir);
                    for (var i = 0; i < addPackagesDirArr.length; i++) {
                        if (dirFile.equals(java.io.File(addPackagesDirArr[i]))) {
                            addPackagesDirArr.splice(i, 1);
                            break;
                        }
                    }
                }
                inArchivesDirArr.push(dir);
            }
        }
        if (e.item.getItemCount() > 0 &&
            e.item.getItem(0).getText() == "") {

            e.item.getItem(0).dispose(); /* dispose dummy */
        }
        _showDone();
        _setStatusText("");
    }
    else if (e.item.getText() == REPO_PACKAGES_STR) {

        /* if removePackagesDirArr has any items in              */
        /* inRepositoriesDirArr, remove all items under node and    */
        /* repopulate the remaining archive directories rather   */
        /* than parsing the tree an removing single items        */
        /* and parts of duplicates                               */

        var removedDirs = [];
        for each (var rmdir in removePackagesDirArr) {
            if (repoman.isURL(rmdir)) {
                continue;
            }
            if (inRepositoriesDirArr.length == 0) {
                break;
            }
            var rmdirFile = java.io.File(rmdir);
            for (var i = 0; i < inRepositoriesDirArr.length; i++) {
                if (rmdirFile.equals(java.io.File(inRepositoriesDirArr[i]))) {
                    inRepositoriesDirArr.splice(i, 1);
                    removedDirs.push(rmdir);
                    break;
                }
            }
        }
        if (removedDirs.length > 0) {

            /* update removedDumpstersTab */
            for each (var rmdir in removedDirs) {
                for (var i = 0; i < removePackagesDirArr.length; i++) {
                    if (rmdir == removePackagesDirArr[i]) {
                        removePackagesDirArr.splice(i, 1);
                        break;
                    }
                }
            }

            /* re-add any dirs that weren't removed */
            for each (var pkgdir in inRepositoriesDirArr) {
                addPackagesDirArr.push(pkgdir);
            }
            inRepositoriesDirArr = [];
            packagesItem.removeAll();
            widgets.TreeItem(packagesItem, SWT.NULL);
        }


        /* go through addPackagesDirArr and see if any               */
        /* packages hits, if yes, add the packages, remove dir from */
        /* addPackagesDirArr and add it to inRepositoriesDirArr           */

        var addedDirs = [];
        _showBusy();
        var stext = _getStatusText();
        for each (var dir in addPackagesDirArr) {
            if (repoman.isURL(dir)) {
                continue;
            }
            _setStatusText("Checking if " + dir + " is a bundle...");
            var arr = repoman._getBundlePkgNameAndRepositories(dir);
            _setStatusText(stext);
            if (arr.length > 0) {  /* is a bundle */
                
                _addBundleToRepositoriesBranch(dir, arr);
                addedDirs.push(dir);
            }
            else {
                arr = _getRepoPkgsArray(dir); /* is it a repository? */
                for each (var p in arr) {
                    _addPackageToInRepositoriesBranch(p);
                }
                if (arr.length > 0) {
                    addedDirs.push(dir);
                }
            }
        }
        if (addedDirs.length > 0) {

            /* remove each dir from addPackagesDirArr and */
            /* add it to inRepositoriesDirArr             */
            for each (var dir in addedDirs) {
                var dirFile = java.io.File(dir);
                for (var i = 0; i < addPackagesDirArr.length; i++) {
                    if (dirFile.equals(java.io.File(addPackagesDirArr[i]))) {
                        addPackagesDirArr.splice(i, 1);
                        break;
                    }
                }
                inRepositoriesDirArr.push(dir);
            }
        }
        if (e.item.getItemCount() > 0 &&
            e.item.getItem(0).getText() == "") {

            e.item.getItem(0).dispose(); /* dispose dummy */
        }
        _showDone();
        _setStatusText(stext);
    }
}

/*
 *  ======== _addRemovePackagesDlg ========
 */
function _addRemovePackagesDlg(shell)
{
    var removeDlg = widgets.Shell(shell, SWT.DIALOG_TRIM|SWT.RESIZE|
                                         SWT.APPLICATION_MODAL);
    removeDlg.setImage(rsrc.ICO_SOG);
    removeDlg.setLayout(layout.GridLayout());
    removeDlg.setSize(600, 300);
    removeDlg.setText(ADD_DIR_STR);
    removeDlg.addListener(SWT.Resize, function() { 
    });

    var listsComposite = widgets.Composite(removeDlg, SWT.NONE); 
    var listsLayout = layout.GridLayout();
    listsLayout.numColumns = 2;   
    listsComposite.setLayout(listsLayout);

    var listsData = layout.GridData(GD.FILL_BOTH);
    listsData.grabExcessHorizontalSpace = true;
    listsComposite.setLayoutData(listsData);
    listsComposite.setLayoutData(layout.GridData(GD.FILL, GD.FILL, true, true));

    /* 3 lists in tabbed folder */
    var tabFolder = widgets.TabFolder(listsComposite, SWT.NONE);
    tabFolder.setLayoutData(layout.GridData(GD.FILL, GD.FILL, true, true));

    var dumpsterItem = widgets.TabItem(tabFolder, SWT.NONE);
    dumpsterItem.setText ('Repositories and archive directories');
    var dumpsterList = widgets.List(tabFolder, SWT.MULTI|SWT.V_SCROLL);
    dumpsterItem.setControl(dumpsterList);

    var archiveItem = widgets.TabItem(tabFolder, SWT.NONE);
    archiveItem.setText ('Archive files');
    var archiveList = widgets.List(tabFolder, SWT.MULTI|SWT.V_SCROLL);
    archiveItem.setControl(archiveList);

    var urlItem = widgets.TabItem(tabFolder, SWT.NONE);
    urlItem.setText ('Archive URLs');
    var urlList = widgets.List(tabFolder, SWT.MULTI|SWT.V_SCROLL);
    urlItem.setControl(urlList);

    var btnComposite = widgets.Composite(listsComposite, SWT.NONE); 
    var btnLayout = layout.GridLayout();
    btnLayout.numColumns = 1;   
    btnComposite.setLayout(btnLayout);
    btnComposite.setLayoutData(layout.GridData(GD.END, GD.CENTER, false, false));

    var addBtn = widgets.Button(btnComposite, SWT.PUSH);
    addBtn.setImage(rsrc.ICO_ADD_DIR);
    addBtn.setEnabled(true);
    addBtn.setToolTipText("Add a directory...");
    addBtn.addListener(SWT.Selection, function() {
        var dir = _addDirectoriesDlg(removeDlg);
        if (dir != null) {
            var dirFile = java.io.File(dir);
            var found = false;
            for (var i = 0; i < dumpsterList.getItemCount(); i++) {
                if (dirFile.equals(java.io.File(dumpsterList.getItem(i)))) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                tabFolder.setSelection(dumpsterItem);
                dumpsterList.add(dir);
            }
        }
    });

    var addBtn = widgets.Button(btnComposite, SWT.PUSH);
    addBtn.setImage(rsrc.ICO_ADD_FILE);
    addBtn.setEnabled(true);
    addBtn.setToolTipText("Add an archive file...");
    addBtn.addListener(SWT.Selection, function() {
        var f = _addArchiveFileDlg(removeDlg);
        if (f != null) {
            var file = java.io.File(f);
            var found = false;
            for (var i = 0; i < archiveList.getItemCount(); i++) {
                if (file.equals(java.io.File(archiveList.getItem(i)))) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                tabFolder.setSelection(archiveItem);
                archiveList.add(f);
            }
        }
    });

    var addBtn = widgets.Button(btnComposite, SWT.PUSH);
    addBtn.setImage(rsrc.ICO_ADD_URL);
    addBtn.setEnabled(true);
    addBtn.setToolTipText("Add an archive URL...");
    addBtn.addListener(SWT.Selection, function() {
        var urlstr = _addURLDlg(removeDlg);
        if (urlstr != null) {
            var found = false;
            var url = java.net.URL(urlstr);
            for (var i = 0; i < urlList.getItemCount(); i++) {
                if (_urlEqualsStr(url, urlList.getItem(i))) {
                    found = true;
                    break;
                }
            }
            if (!found) {
                tabFolder.setSelection(urlItem);
                urlList.add(urlstr);
            }
        }
    });

    var delBtn = widgets.Button(btnComposite, SWT.PUSH);
    delBtn.setImage(rsrc.ICO_DELETE);
    delBtn.setEnabled(false);
    delBtn.setToolTipText("Remove selected item");
    delBtn.addListener(SWT.Selection, function() {
        var selections = tabFolder.getSelection();
        if (selections[0] == dumpsterItem) {
            list = dumpsterList;
        }
        else if (selections[0] == archiveItem) {
            list = archiveList;
        }
        else {
            list = urlList;
        }
        var indices = [];
        for each (var index in list.getSelectionIndices()) {
            indices.push(index);
        }
        list.remove(indices);
        delBtn.setEnabled(list.getSelectionCount() > 0);
    });

    tabFolder.addListener(SWT.Selection, function() {
        var selections = tabFolder.getSelection();
        if (selections[0] == dumpsterItem) {
            delBtn.setEnabled(dumpsterList.getSelectionCount() > 0);
        }
        else if (selections[0] == archiveItem) {
            delBtn.setEnabled(archiveList.getSelectionCount() > 0);
        }
        else {
            delBtn.setEnabled(urlList.getSelectionCount() > 0);
        }
    });

    dumpsterList.addListener(SWT.Selection, function() {
        delBtn.setEnabled(dumpsterList.getSelectionCount() > 0);
    });

    urlList.addListener(SWT.Selection, function() {
        delBtn.setEnabled(urlList.getSelectionCount() > 0);
    });

    archiveList.addListener(SWT.Selection, function() {
        delBtn.setEnabled(archiveList.getSelectionCount() > 0);
    });

    var exitComposite = widgets.Composite(removeDlg, SWT.NONE); 
    var exitLayout = layout.GridLayout();
    exitLayout.numColumns = 2;   
    exitComposite.setLayout(exitLayout);
    exitComposite.setLayoutData(layout.GridData(SWT.CENTER, SWT.END, false, false));

    var okBtn = widgets.Button(exitComposite, SWT.PUSH|SWT.DEFAULT);
    okBtn.setText ("OK");
    okBtn.addListener(SWT.Selection, function() {
        var allList = [];
        for (var i = 0; i < dumpsterList.getItemCount(); i++) {
            allList.push(dumpsterList.getItem(i));
        }
        for (i = 0; i < archiveList.getItemCount(); i++) {
            allList.push(archiveList.getItem(i));
        }
        for (i = 0; i < urlList.getItemCount(); i++) {
            allList.push(urlList.getItem(i));
        }
        if (allList.length == 0) {
            packagesTreeDirArr = [];
            addPackagesDirArr = [];
            dumpstersItem.removeAll();
            packagesItem.removeAll();
            removeDlg.dispose();
        }
        else {

            /* dummy to show '+' sign */
            if (dumpstersItem.getItemCount() == 0) {
                widgets.TreeItem(dumpstersItem, SWT.NULL);
            }
            if (packagesItem.getItemCount() == 0) {
                widgets.TreeItem(packagesItem, SWT.NULL);
            }

            var found;
            var file;

            /* go through packagesTreeDirArr, add each dir that is */
            /* not in the list to removePackagesDirArr              */
            removePackagesDirArr = [];
            for each (var d in packagesTreeDirArr) { 
                found = false;
                if (repoman.isURL(d)) {
                    var url = java.net.URL(d);
                    for (var i = 0; i < allList.length; i++) {
                        if (_urlEqualsStr(url, allList[i])) {
                            found = true;
                            break;
                        }
                    }
                }
                else {
                    file = java.io.File(d);
                    for (var i = 0; i < allList.length; i++) {
                        if (file.equals(java.io.File(allList[i]))) {
                            found = true;
                            break;
                        }
                    }
                }
                if (!found) {
                    removePackagesDirArr.push(d);
                }
            }

            /* go through allList, add each dir that is not   */
            /* in packagesTreeDirArr to addPackagesDirArr */
            addPackagesDirArr = [];
            for (var i = 0; i < allList.length; i++) {
                found = false;
                if (repoman.isURL(allList[i])) {
                    var url = java.net.URL(allList[i]);
                    for each (var d in packagesTreeDirArr) {
                        if (_urlEqualsStr(url, d)) {
                            found = true;
                            break;
                        }
                    }
                }
                else {
                    file = java.io.File(allList[i]);
                    for each (var d in packagesTreeDirArr) {
                        if (file.equals(java.io.File(d))) {
                            found = true;
                            break;
                        }
                    }
                }
                if (!found) {
                    addPackagesDirArr.push(allList[i]);
                }
            }

            /* update packagesTreeDirArr */
            packagesTreeDirArr = [];
            for (var i = 0; i < allList.length; i++) {
                packagesTreeDirArr.push(allList[i]);
            }

            /* if directories were added, or a directory */
            /* was removed, collapse both branches       */
            if (addPackagesDirArr.length > 0 ||
                removePackagesDirArr.length > 0) {

                dumpstersItem.setExpanded(false);
                packagesItem.setExpanded(false);
            }
            removeDlg.dispose();
        }
    });

    var cancelBtn = widgets.Button(exitComposite, SWT.PUSH);
    cancelBtn.setText ("Cancel");
    cancelBtn.addListener(SWT.Selection, function() { 
        removeDlg.dispose();
    });

    /* init lists */
    for each (var d in packagesTreeDirArr) {
        if (repoman.isURL(d)) {
            urlList.add(d);
        }
        else {
            var f = java.io.File(d);
            if (f.isDirectory()) {
                dumpsterList.add(d);
            }
            else {
                archiveList.add(d);
            }
        }
    }
    removeDlg.open();
    while (!removeDlg.isDisposed()) {
        if (!w_display.readAndDispatch()) {
            w_display.sleep();
        }
    }
}

/*
 *  ======== _addDirectoriesDlg ========
 */
function _addDirectoriesDlg(shell)
{
    var dlg = widgets.DirectoryDialog(shell);

    if (lastPackagesDir != null && lastPackagesDir.length > 0) {
        dlg.setFilterPath((new java.io.File(lastPackagesDir)).getCanonicalPath());
    }

    /* Change the title bar text */
    dlg.setText(DIR_DLG_MSG_STR);

    /* Customizable message displayed in the dialog */
    dlg.setMessage(PKG_DLG_TITLE_STR);

    /* Calling open() will open and run the dialog. */
    /* It will return the selected directory, or    */
    /* null if user cancels                         */
    var dir = dlg.open();
    if (dir != null) {
        lastPackagesDir = "" + dir;
    }
    return (dir);
}

/*
 *  ======== _onExpandPkgPathTreeNode ========
 */
function _onExpandPkgPathTreeNode(e)
{
    if (e.item.getItemCount() != 1) {
        return;
    }
    if (e.item.getItem(0).getText() != "") {
        return;
    }
    _showBusy();
    _populatePkgPathTreeNode(e.item);
    _setStatusText("");
    _showDone();
}

/*
 *  ======== _populatePkgPathTreeNode ========
 */
function _populatePkgPathTreeNode(ti)
{
    if (ti.getItemCount() > 0 &&
        ti.getItem(0).getText() == "") {
            
        ti.getItem(0).dispose();
    }

    var pkgArr = _getRepoPkgsArray(ti.getText());
    if (pkgArr.length > 0) {
        app.w_pkgPathTree.setRedraw(false);
        var readOnly = !repomanMain.isRepositoryWritable(ti.getText());
        for each (var p in pkgArr) {
            ti2 = widgets.TreeItem(ti, SWT.NULL);
            var info = p.split(';');
            ti2.setText(info[PACKAGE_INDEX]);
            if (readOnly) {
                ti2.setForeground(color(SWT.COLOR_DARK_GRAY));
            }
             ti2.setData(info);
        }
        app.w_pkgPathTree.setRedraw(true);
    }
}

/*
 *  ======== _addPkgPathTreeNode ========
 */
function _addPkgPathTreeNode(dir, index)
{
    var ti;
    if (index) {
        ti = widgets.TreeItem(app.w_pkgPathTree, SWT.NULL, index);
    }
    else if (_isXdcRepo(dir)) {
        if (_isXdcHat(dir)) {
            ti = widgets.TreeItem(app.w_pkgPathTree, SWT.NULL); /* add to end */
        }
        else {  /* is xdcroot */
            var index = _getNodeIndex(app.w_pkgPathTree, hat);
            if (index != -1) {
                ti = widgets.TreeItem(app.w_pkgPathTree, SWT.NULL, index);
            }
            else {
                ti = widgets.TreeItem(app.w_pkgPathTree, SWT.NULL);
            }
        }
    }
    else if (app.w_pkgPathTree.getItemCount() > 0 &&
             (xdcrootrepo != "" || hat != "")) {
        /* insert before xdc repos */
        var index = _getNodeIndex(app.w_pkgPathTree, xdcrootrepo);
        if (index != -1) {
            ti = widgets.TreeItem(app.w_pkgPathTree, SWT.NULL, index);
        }
        else {
            var index = _getNodeIndex(app.w_pkgPathTree, hat);
            if (index != -1) {
                ti = widgets.TreeItem(app.w_pkgPathTree, SWT.NULL, index);
            }
            else {
                ti = widgets.TreeItem(app.w_pkgPathTree, SWT.NULL);
            }
        }
    }
    else {  /* add to end */
        ti = widgets.TreeItem(app.w_pkgPathTree, SWT.NULL);
    }
    ti.setText(dir);
    
    var checkResults = CheckPath.checkRepository(dir);
    if (checkResults.warning) {
        if (checkResults.exists &&
            java.io.File(dir).isDirectory() && 
            repomanMain.isRepositoryWritable(dir)) {

            widgets.TreeItem(ti, SWT.NULL); /* dummy to show '+' sign */
        }
        else {
            ti.setForeground(color(SWT.COLOR_DARK_GRAY));
            ti.setImage(0, rsrc.ICO_WARNING);
            ti.setData(checkResults);
        }
    }
    else {
        if (!repomanMain.isRepositoryWritable(dir)) {
            ti.setForeground(color(SWT.COLOR_DARK_GRAY));
        }
        widgets.TreeItem(ti, SWT.NULL); /* dummy to show '+' sign */
    }
    return (ti);
}

/*
 *  ======== _addRepoDlg ========
 */
function _addRepoDlg(shell)
{

    var dlg = widgets.DirectoryDialog(shell);

    if (lastRepoDir != null && lastRepoDir.length > 0) {
        dlg.setFilterPath((new java.io.File(lastRepoDir)).getCanonicalPath());
    }
    
    /* Change the title bar text */
    dlg.setText(DIR_DLG_MSG_STR);

    /* Customizable message displayed in the dialog */
    dlg.setMessage(REPO_DLG_TITLE_STR);

    /* Calling open() will open and run the dialog. */
    /* It will return the selected directory, or    */
    /* null if user cancels                         */
    var dir = dlg.open();
    if (dir != null) {
        if (java.io.File(dir).listFiles().length == 0) { /* new dir */
            _createRepoXmlFile(dir);
        }
        dir = ("" + dir).replace(/\\/g, '/');
        _addPkgPathTreeNode(dir);
        lastRepoDir = "" + dir;
    }
}

/*
 *  ======== _addWorkingPackages ========
 */
function _addWorkingPackages(ti, pkgsArr, bundleFile)
{
    _showBusy();

    app.w_pkgPathTree.setRedraw(false);

    if (ti.getExpanded() == false && ti.getItemCount() > 0 &&
        ti.getItem(0).getText() == "") {

        _setStatusText("Gathering package info from " + ti.getText() + "...");
        _populatePkgPathTreeNode(ti);    
    }

    if (_extractOrCopyPackages(pkgsArr, ti.getText()) == 0) {
        app.w_pkgPathTree.setRedraw(true);
        _setStatusText("");
        _showDone();
        return; /* nothing extracted */
    }

    var pkgArr = _getRepoPkgsArray(ti.getText());

    for each (var p in pkgArr) {
        var ti2;
        var info = p.split(';');
        var index = _getNodeInsertIndex(ti, info[PACKAGE_INDEX]);
        var archive = null;

        /* if item already exists, get it, otherwise, create it */
        if (index < ti.getItemCount() &&
            "" + ti.getItem(index).getText() == "" + info[PACKAGE_INDEX]) {

            ti2 = ti.getItem(index);
            if (ti2.getData() != null) {  /* retain archive */
                archive = ti2.getData()[ARCHIVE_INDEX];
            }
        }
        else {
            ti2 = widgets.TreeItem(ti, SWT.NULL, index);
            ti2.setText(info[PACKAGE_INDEX]);
        }
        ti2.setData(info);
        if (archive) {
            ti2.getData().push(archive);
        }
    }

    /* update archive data field */
    var items = ti.getItems();
    for each (var p in pkgsArr) {
        var pkg = p.split(';');
        pkg.shift();
        for (var i = 0; i < items.length; i++) {
            if (pkg[PACKAGE_INDEX] == ("" + items[i].getText())) {
                var pkgData = items[i].getData();
                if (_isAnArchive(pkg[FILE_INDEX]) || 
                    bundleFile != undefined) {

                    var tarName = (bundleFile == undefined) ?
                                  java.io.File(pkg[FILE_INDEX]).getName() :
                                  java.io.File(bundleFile).getName();

                    if (pkgData[ARCHIVE_INDEX] == undefined) {
                        pkgData.push(tarName);
                    }
                    else {
                        pkgData[ARCHIVE_INDEX] = tarName;
                    }
                }
                else if (pkgData[ARCHIVE_INDEX] != undefined) {

                    /* remove the archive data field */
                    pkgData.pop();
                }
                break;
            }
        }
    }

    app.w_pkgPathTree.setRedraw(true);
    _setStatusText("");
    _showDone();
}

/*
 *  ======== _archiveInfoStr ========
 *
 */
function _archiveInfoStr(archiveStr, isBundle)
{
    var arr = archiveStr.split(';');
    if (isBundle) {
        var str = BUNDLE_STR + arr[PACKAGE_INDEX] + '\n';
    }
    else {
        var str = PACKAGE_STR + arr[PACKAGE_INDEX] + '\n';
    }
    str += FILE_STR + arr[FILE_INDEX] + '\n';
    str += RELEASE_NAME_STR + arr[RELEASE_NAME_INDEX] + '\n';
    str += RELEASE_STR + arr[RELEASE_INDEX] + '\n';
    str += VERSION_STR + arr[VERSION_INDEX] + '\n';
    str += DATE_STR + arr[DATE_INDEX] + '\n';
    str += BUILDABLE_STR + arr[BUILDABLE_INDEX];
    return (str);
}

/*
 *  ======== _checkPackagePath ========
 */
function _checkPackagePath()
{
    if (app.w_pkgPathTree.getItemCount() == 0) {
       return;
    }

    _showBusy();

    /* if previous errors, remove all images in tree */
    if (checkArr.length || shadowResults.length) {
        _clearTreeImages(app.w_pkgPathTree);
        app.w_pkgPathTree.update();
    }

    /* fill in any nodes that haven't been expanded */
    for (var i = 0; i < app.w_pkgPathTree.getItemCount(); i++) {
        var ti = app.w_pkgPathTree.getItem(i);
        if (ti.getItemCount() == 1 && 
            ti.getItem(0).getText() == "") {

            _populatePkgPathTreeNode(app.w_pkgPathTree.getItem(i));
        }
    }

    _setStatusText(CHECKING_COMPATIBILITY_STR);
    _checkPkgPathCompatibility();
    _checkPkgPathTreeRepositories();

    _setStatusText(CHECKING_FOR_SHADOWS_STR);
    _shadowCheck();

    _setStatusText("");
    _showDone();
}

/*
 *  ======== _checkPkgPathCompatibility ========
 */
function _checkPkgPathCompatibility()
{
 
    checkArr = [];
    /* build a path */
    var checkArgs = ['-a'];
    for (i = 0; i < app.w_pkgPathTree.getItemCount(); i++) {
        var dir = app.w_pkgPathTree.getItem(i).getText();
        var dfile = java.io.File(dir);
        if (dfile.exists() && dfile.isDirectory()) {
            checkArgs.push("" + dir);
        }
    }

    try {
        /* call 'check' tool */
        var checkRet = cmd.check.exec(checkArgs);
    }
    catch (e) {
        _errorMsg(e.message);
        return;
    }
    if (checkRet.length > 0) {

        /* create an object array of incompatible */
        /* packages with error/warning messages   */
        for each (var e in checkRet) {

            var result = {type: "", name: "", vers: "", depPkgs: []};
            /* get error/warning */
            if (e.substr(0, ERROR_STR.length) == ERROR_STR) {
                result.type = ERROR_STR;
            }
            else if (e.substr(0, WARNING_STR.length) == WARNING_STR) {
                result.type = WARNING_STR;
            }
            else {
                result.type = UNKNOWN_STR;            
            }

            /* get package name and vers  */
            var start = e.indexOf(CHECK_OUTPUT_USEOFPACKAGE_STR) +
                        CHECK_OUTPUT_USEOFPACKAGE_STR.length;
            var end = e.indexOf(CHECK_OUPUT_ENDPKGNAME_STR, start);
            result.name = e.substr(start, end - start);
            start = e.indexOf('[', end);
            end = e.indexOf(']', start);
            result.vers = e.substr(start, end - start + 1);

            var arr = e.split(CHECK_OUTPUT_DEPPKGSDELIMITER_STR);
            for (var i = 1; i < arr.length; i++) {
                var depPkgs = {name: "", versReqd: ""};
                depPkgs.name = arr[i].substr(0,
                               arr[i].indexOf(CHECK_OUTPUT_WASBUILTWITH_STR));
                depPkgs.versReqd = arr[i].substr(arr[i].indexOf('['));
                if (depPkgs.versReqd.substr(-1, 1) != ']' &&
                    depPkgs.versReqd.substr(-2, 1) != ']') {
                    depPkgs.versReqd += ']';
                }
                result.depPkgs.push(depPkgs);
            }
            checkArr.push(result);
        }
         /* diagnostic output 
        for each (var r in checkArr) {
            java.lang.System.out.println(r.type + ": " + r.name + r.vers);
            for each (var p in r.depPkgs) {
                java.lang.System.out.println(p.name + " was built with " +
                                             r.name + p.versReqd);
            }
        }
        */
        /* found errors, parse output and add images to tree */
        if (checkArr.length > 0) {
            _flagCompatibilityProblems(checkArr);
        }
    }
}

/*
 *  ======== _clearTreeImages ========
 */
function _clearTreeImages(tree)
{
    for each (var ti in tree.getItems()) {
        if (ti.getItemCount() > 0) {
            for each (var ti2 in ti.getItems()) {
                if (ti2.getImage() != null) {
                    ti2.setImage(0, null);
                }
            }
            if (ti.getImage() != null) {
                ti.setImage(0, null);
            }
        }
    }
}

/*
 *  ======== _copyPath ========
 */
function _copyPath()
{
    var strPath = "";

    var clipboard = java.awt.Toolkit.getDefaultToolkit().getSystemClipboard();
    for (var i = 0; i < app.w_pkgPathTree.getItemCount(); i++) {
        strPath += app.w_pkgPathTree.getItem(i).getText() + ";";
    }
    var strsel = java.awt.datatransfer.StringSelection(strPath);
    clipboard.setContents(strsel, strsel);
}

/*
 *  ======== _dataDroppedOnRepo ========
 */
function _dataDroppedOnRepo(e)
{
    if (dnd.FileTransfer.getInstance().isSupportedType(e.currentDataType)){
        
        /* from Windows Explorer */

        for each (var f in e.data) {
            if (!java.io.File(f).isDirectory()) {
                var msgBox = widgets.MessageBox(w_shell, SWT.OK|SWT.ICON_ERROR);
                msgBox.setText(REPOMAN_STR);
                msgBox.setMessage("Only directories can be dropped here");
                msgBox.open();
                e.detail = dnd.DND.DROP_NONE;
            }
        }
        if (e.detail != dnd.DND.DROP_NONE) {
            var destIndex = undefined;
            if (e.item != null) {
                destIndex = app.w_pkgPathTree.indexOf(e.item);
                var pt = w_display.map(null, app.w_pkgPathTree, e.x, e.y);
                var bounds = e.item.getBounds();
                if (pt.y > bounds.y + 2 * bounds.height / 3) {
                    ++destIndex;
                }
            }
            for each (var f in e.data) {
                var file = java.io.File(f);
                if (file.isDirectory()) {
                    var dir = file.getCanonicalPath();
                    dir = ("" + dir).replace(/\\/g, '/');
                    if (file.listFiles().length == 0) {
                        _createRepoXmlFile(dir);
                    }
                    _addPkgPathTreeNode(dir, destIndex);
                    if (destIndex != undefined) {
                        ++destIndex;
                    }
                }
            }
        }
    }
    else if (e.data == null || e.data == NO_DATA_STR) {
        e.detail = dnd.DND.DROP_NONE;
    }
    else if (dnd.TextTransfer.getInstance().isSupportedType(e.currentDataType)){
        if (dragSourceId == PACKAGES_DRAG_SOURCE) {

            /* separate packages and repositories into different arrays */
            var arReposArr = [];
            var reposArr = [];
            var pkgsArr = [];
            var dataArr = e.data.split('\n');
            for each (var d in dataArr) {
                if (java.lang.String(d).startsWith(ARCHIVE_REPO_DATA_ID)) {
                    arReposArr.push(d);
                }
                else if (java.lang.String(d).startsWith(REPO_DATA_ID)) {
                    reposArr.push(d);
                }
                else {
                    pkgsArr.push(d);
                }
            }
            /* populate dest repository */
            if (arReposArr.length) {
                for each (var r in arReposArr) {
                    _extractRepositoryPackages(e.item, r);
                }
            }
            if (reposArr.length) {
                for each (var r in reposArr) {
                    _copyRepositoryPackages(e.item, r);
                }
            }
            if (pkgsArr.length) {
                _addWorkingPackages(e.item, pkgsArr);
            }
        }
        else if (dragSourceId == REPO_DRAG_SOURCE)  {
            if (e.item != null) {
 
                var selItem = _getSelectedRepoItem();
                var parentOfSelItem = selItem.getParentItem();
                if (parentOfSelItem == null) { /* is a repo being dropped */

                    /* get index of item being dropped */
                    var selIndex = _getSelectedRepoIndex();

                    /* get destination index */
                    var pt = w_display.map(null, app.w_pkgPathTree, e.x, e.y);
                    var bounds = e.item.getBounds();
                    var destIndex = app.w_pkgPathTree.indexOf(e.item);
                    if (pt.y > bounds.y + 2 * bounds.height / 3) {
                        ++destIndex;
                    }
                    _moveRepo(selIndex, destIndex);
                }
                else {  /* is a package being dropped on a repository */
                    var pkgsArr = [];
                    pkgsArr.push(';' + selItem.getData().join(';'));
                    _addWorkingPackages(e.item, pkgsArr);
                }
            }
        }
    }
}

/*
 *  ======== _deleteSelectedPackage ========
 *
 */
function _deleteSelectedPackage(shell)
{
    var item = _getSelectedRepoItem();
    if (item != null) {
        var pkgName = item.getText();
        var repoName = item.getParentItem().getText();
        if (_confirmPackageDelete(pkgName, repoName)) {
            args = ['-d', '-r'].concat("" + repoName, "" + pkgName);
            try {
                cmd.repoman.exec(args);
                item.dispose();
            }
            catch (e) {
                _errorMsg(e.message);
            }
        }
    }
}

/*
 *  ======== _dependencyIconInfoStr ========
 */
function _dependencyIconInfoStr(image)
{
    if (image == rsrc.ICO_IMMEDDEP) {
        return (IMMED_DEPS_HOVER_STR);
    }
    else if (image == rsrc.ICO_ALLDEP) {
        return (ALL_DEPS_HOVER_STR);
    }
    else {
        return (NO_DEPS_HOVER_STR);
    }
}

/*
 *  ======== _dumpsterMouseOver ========
 */
function _dumpsterMouseOver(e)
{
    var ti =  app.w_packagesTree.getItem(graphics.Point(e.x, e.y));
    if (ti != null && ti.getData() != null) {
        if (ti.getImage() != null && ti.getImage() != rsrc.ICO_BUNDLE &&
            ti.getImageBounds(0).contains(e.x, e.y)) {
            _itemHover(app.w_packagesTree, ti,
                       _dependencyIconInfoStr(ti.getImage()),
                       graphics.Point(e.x, e.y));
        }
        else {
            if (_isBundleRepositoryItem(ti) || _isBundlePackage(ti)) {
                return;  /* no hover for bundle repos or pkgs currently */
            }
            var infoStr;
            var pkgArr = ti.getData().split(';');
            if (_isAnArchive(pkgArr[FILE_INDEX])) {
                infoStr = _archiveInfoStr(ti.getData(), _isBundleItem(ti));
            }
            else {
                infoStr = _pkgInfoStr(pkgArr, _isBundleItem(ti));
            }
            _itemHover(app.w_packagesTree, ti, infoStr,
                       graphics.Point(e.x, e.y));
        }
    }
}

/*
 *  ======== _errorMsg ========
 */
function _errorMsg(msg)
{
    var msgBox = widgets.MessageBox(w_shell, SWT.OK|SWT.ICON_ERROR);
    msgBox.setText(REPOMAN_STR);
    msgBox.setMessage(msg);
    msgBox.open();
}

/*
 *  ======== _extractOrCopyPackages ========
 */
function _extractOrCopyPackages(pkgsArr, destDir)
{
    var pkg;
    var args;
    var fcount = 0;
    var dep;
    var numExtracted = 0;
    var stext = _getStatusText();

    for each (var p in pkgsArr) {
        pkg = p.split(';');
        if ((pkg[0] + ';') == AR_BUNDLE_PKG_DATA_ID) {
            pkg.shift();
            args = ['-x', '-r', destDir, '-b', String(pkg[2]),
                    String(pkg[PACKAGE_INDEX]), String(pkg[FILE_INDEX])];
            _setStatusText("Extracting " + pkg[PACKAGE_INDEX] + " from "
                           + pkg[FILE_INDEX] + " to " + destDir + "...");
        }
        else if ((pkg[0] + ';') == BUNDLE_PKG_DATA_ID) {
            pkg.shift();
            args = ['-c', '-r', String(destDir), '-p', String(pkg[REPO_INDEX]),
                    String(pkg[PACKAGE_INDEX])];
            _setStatusText("Copying " + pkg[PACKAGE_INDEX] + " from "
                           + pkg[REPO_INDEX] + " to " + destDir + "...");
        }
        else {
            dep = pkg.shift();
            if (_isAnArchive(pkg[FILE_INDEX])) {
                args = ['-x', '-F'];
                if (dep.length() > 0) {
                    args.push("" + dep);
                }
                args.push("-r");
                args.push("" + destDir);
                args.push("" + pkg[FILE_INDEX]);
                _setStatusText("Extracting " + pkg[PACKAGE_INDEX] + " from "
                               + pkg[FILE_INDEX] + " to " + destDir + "...");
            }
            else {
                args = ['-c', '-r'];
                args.push("" + destDir);
                args.push("-p");
                args.push("" + pkg[REPO_INDEX]);
                args.push("" + pkg[PACKAGE_INDEX]);
                _setStatusText("Copying " + pkg[PACKAGE_INDEX] + " from "
                               + pkg[REPO_INDEX] + " to " + destDir + "...");
            }
        }
        if (_destPackageExists(pkg[PACKAGE_INDEX], destDir)) {
            if (!_confirmPackageOverwrite(pkg[PACKAGE_INDEX], destDir)) {
                continue;
            } 
        }
        try {
            if (cmd.repoman.exec(args) != "") {
                _setStatusText("Copy or Extract of " + pkg[PACKAGE_INDEX] + " from " +
                               pkg[FILE_INDEX] + " to " + destDir + " failed.");

                fcount++;
            }
            else {
                ++numExtracted;
            }
        }
        catch (e) {
            _errorMsg(e.message);
            break;
        }
        
    }
    _setStatusText(fcount ? 
                   ("Warning: " + fcount + " copy or extractions failed.")
                   : stext);
    return (numExtracted);
}

/*
 *  ======== _flagCompatibilityProblems ========
 */
function _flagCompatibilityProblems(checkArr)
{
    for each (var r in checkArr) { 
        var found = false;
        for (var j = 0; j < app.w_pkgPathTree.getItemCount(); j++) {
            var repoItem = app.w_pkgPathTree.getItem(j);
            for (var k = 0; k < repoItem.getItemCount(); k++) {
                var pkgItem = repoItem.getItem(k);
                if ("" + r.name == "" + pkgItem.getText()) {
                    if ("" + r.type == ERROR_STR) {
                        if (repoItem.getImage() != rsrc.ICO_ERROR) {

                            repoItem.setImage(0, rsrc.ICO_ERROR);
                        }
                        pkgItem.setImage(0, rsrc.ICO_ERROR);
                    }
                    else {
                        if (repoItem.getImage() != rsrc.ICO_ERROR &&
                            repoItem.getImage() != rsrc.ICO_WARNING) {

                            repoItem.setImage(rsrc.ICO_WARNING);
                        }
                        pkgItem.setImage(rsrc.ICO_WARNING);
                    }
                    found = true;
                    break;
                }
            }
            if (found) {
                break;
            }
        }
    }
}

/*
 *  ======== _getArchivedPkgsArray ========
 */
function _getArchivedPkgsArray(pathName)
{
    var stext = _getStatusText();
    var arr = [];

    if (repoman.isURL(pathName)) {
        _setStatusText("Reading " + pathName + "...");
        var args = ['-t', '-a'].concat(String(pathName));
        try {
            arr = arr.concat(cmd.repoman.exec(args));
        }
        catch (e) {
            _errorMsg(e.message);
        }
    }
    else {
        var file = java.io.File(pathName);
        if (file.isDirectory()) {
            var fnArr = file.list();
            java.util.Arrays.sort(fnArr);
            for each (var fn in fnArr) {
                var f = java.io.File(file, fn);
                if (f.isFile() && _isAnArchive(f.getName())) {

                    _setStatusText("Reading " + f.getCanonicalPath() + "...");
                    var args = ['-t', '-a'].concat("" + f.getCanonicalPath());
                    try {
                        arr = arr.concat(cmd.repoman.exec(args));
                    }
                    catch (e) {
                        _errorMsg(e.message);
                        break;
                    }
                }
            }
        }
        else if (file.isFile() && _isAnArchive(file.getName())) {

            _setStatusText("Reading " + file.getCanonicalPath() + "...");
            var args = ['-t', '-a'].concat("" + file.getCanonicalPath());
            try {
                arr = arr.concat(cmd.repoman.exec(args));
            }
            catch (e) {
                errorMessage(e.message);
            }
        }
    }
    _setStatusText(stext);
    return (arr);
}

/*
 *  ======== _getNodeIndex ========
 */
function _getNodeIndex(tree, name)
{
    var index = -1;
    var str = java.lang.String(name);
    var items = tree.getItems();
    for (var i = 0; i < items.length; i++) {
        if (str.compareTo(items[i].getText()) == 0) {
            index = i;
            break;
        }
    }
    return (index);
}

/*
 *  ======== _getNodeInsertIndex ========
 *
 *  Assumes tree is sorted alphabetically
 *
 */
function _getNodeInsertIndex(tree, name)
{
    var str = java.lang.String(name);
    var items = tree.getItems();
    for (var i = 0; i < items.length; i++) {
        if (str.compareTo(items[i].getText()) <= 0) {
            break;
        }
    }
    return (i);
}

/*
 *  ======== _getPackagePathArr ========
 *
 *  Invoke the 'Path' tools to get the packages
 *  along the package path
 *
 */
function _getPackagePathArr()
{

    var args = ['-p', '-a'];
    try {
        var tmpArr = cmd.path.exec(args);
    }
    catch (e) {
        _errorMsg(e.message);
        return;
    }

    /* format/expand for comparing */
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
            if (tmpArr[i].length != 0 && tmpArr[i] == dirArr[j]) {
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
 *  ======== _getRepoPkgsArray ========
 */
function _getRepoPkgsArray(repo)
{
    var stext = _getStatusText();
    var args = ['-a', '-d'];
    args.push("" + repo);
    _setStatusText("Gathering package info from " + repo + "...");
    var arr = [];
    try {
        arr = cmd.path.exec(args);
    }
    catch (e) {
        _errorMsg(e.message);
    }
    _setStatusText(stext);
    return (arr);
}

/*
 *  ======== _getRepoPkgNamesArray ========
 */
function _getRepoPkgNamesArray(repo)
{
    var stext = _getStatusText();
    var args = ['-n', '-a', '-d'];
    args.push("" + repo);
    _setStatusText("Gathering package names from " + repo + "...");
    var arr = [];
    try {
        arr = cmd.path.exec(args);
    }
    catch (e) {
        _errorMsg(e.message);
    }
    _setStatusText(stext);
    return (arr);
}

/*
 *  ======== _getSelectedRepoIndex ========
 *
 *  Return the index of the selected repository 
 *  in the package path repositories tree
 *
 */
function _getSelectedRepoIndex()
{
    var index = -1;

    var selArr = app.w_pkgPathTree.getSelection();
    if (selArr.length > 0) {
        index = app.w_pkgPathTree.indexOf(selArr[0]);
    }
    return (index);
}

/*
 *  ======== _getSelectedRepoItem ========
 *
 *  Return the TreeItem of the selected repository 
 *  in the package path repositories tree
 *
 */
function _getSelectedRepoItem()
{
    var item = null;

    var selArr = app.w_pkgPathTree.getSelection();
    if (selArr.length > 0) {
        item = selArr[0];
    }
    return (item);
}

/*
 *  ======== _getStatusText ========
 */
function _getStatusText()
{
    return (status.w_txt.getText());
}

/*
 *  ======== _itemHover ========
 */
function _itemHover(tree, item, text, curPt)
{
    var pt;

    if (hoverTip != null  && !hoverTip.isDisposed()) {
        hoverTip.dispose();
    }
    hoverTip = widgets.Shell(w_shell, SWT.ON_TOP | SWT.NO_FOCUS | SWT.TOOL);
    hoverTip.setBackground (w_display.getSystemColor (SWT.COLOR_INFO_BACKGROUND));
    var lo = layout.FillLayout();
    lo.marginWidth = 2;
    hoverTip.setLayout(lo);
    hoverLabel = widgets.Label(hoverTip, SWT.NONE);
    hoverLabel.setForeground(w_display.getSystemColor(SWT.COLOR_INFO_FOREGROUND));
    hoverLabel.setBackground(w_display.getSystemColor(SWT.COLOR_INFO_BACKGROUND));
    hoverLabel.setText(text);
    hoverLabel.addListener(SWT.MouseExit, function(e) { _mouseLeave(e); });
    hoverLabel.addListener(SWT.MouseDown, function(e) { _mouseLeave(e); });
    var size = hoverTip.computeSize(SWT.DEFAULT, SWT.DEFAULT);
    var rect = item.getBounds(0);
    if (curPt == undefined) {
        pt = tree.toDisplay(rect.x, rect.y);
    }
    else {
        pt = tree.toDisplay(curPt.x, curPt.y);
    }
    var monRect = w_display.getPrimaryMonitor().getClientArea();
    var left = (pt.x + size.x <= monRect.width) ? pt.x : 
               pt.x - size.x;

    var top = (pt.y + rect.height + 4 + size.y <= monRect.height) ?
              pt.y + rect.height + 4 : pt.y - size.y - 4;
    if (top < 0) {
        top = 0;
    }
    hoverTip.setBounds(left, top, size.x, size.y);
    hoverTip.setVisible(true);
}

/*
 *  ======== _init ========
 */
function _init()
{
    aboutPkgName = String(Main.$package);
    aboutReleaseFile = Main.$package.packageBase + "/package/package.rel.xml";

    _initXDCVars();
    _initPackagesDragSource();
    _initPackagesDropTarget();
    _initRepoDragSource();
    _initRepoDropTarget();
    _initPackagePathTree();
    _initPackagesTree();
    _initDupsFont();
}

/*
 *  ======== _initDupsFont ========
 */
function _initDupsFont()
{
    var fData = dumpstersItem.getFont().getFontData();
    fonItemNormal = graphics.Font(w_display, fData[0]);
    fData[0].setStyle(fData[0].getStyle() | SWT.ITALIC);
    fonItemItalic = graphics.Font(w_display, fData[0]);
}

/*
 *  ======== _initPackagePathTree ========
 */
function _initPackagePathTree()
{
    _showBusy();
    app.w_pkgPathTree.setRedraw(false);
    var pathArr = _getPackagePathArr();
    for each (var dir in pathArr) {
        _addPkgPathTreeNode(dir);
    }
    app.w_pkgPathTree.setRedraw(true);
    app.w_pkgPathTree.update();
    _showDone();
}

/*
 *  ======== _initPackagesDragSource ========
 */
function _initPackagesDragSource()
{
    var transfer = [dnd.TextTransfer.getInstance()];
    var dragSource = dnd.DragSource(app.w_packagesTree, dnd.DND.DROP_COPY);
    dragSource.setTransfer(transfer); 

    dragSource.addDragListener(new dnd.DragSourceListener({
        dragStart: function(e) { _packagesDragStart(e); },
        dragSetData: function(e) { _packagesDragSetData(e); },
        dragFinished: function(e) { _packagesDragFinished(e); }
    }));

}

/*
 *  ======== _initPackagesTree ========
 */
function _initPackagesTree()
{
    dumpstersItem = widgets.TreeItem(app.w_packagesTree, SWT.NULL);
    dumpstersItem.setText(ARCHIVED_PACKAGES_STR);
    dumpstersItem.setData(null);
    packagesItem = widgets.TreeItem(app.w_packagesTree, SWT.NULL);
    packagesItem.setText(REPO_PACKAGES_STR);
    packagesItem.setData(null);
}

/*
 *  ======== _initRepoDragSource ========
 */
function _initRepoDragSource()
{
    var transfer = [dnd.TextTransfer.getInstance()];
    var dragSource = dnd.DragSource(app.w_pkgPathTree,
                                    dnd.DND.DROP_COPY|dnd.DND.DROP_MOVE);
    dragSource.setTransfer(transfer); 

    dragSource.addDragListener(new dnd.DragSourceListener({
        dragStart: function(e) { _repoDragStart(e); },
        dragSetData: function(e) { _repoDragSetData(e); },
        dragFinished: function(e) { _repoDragFinished(e); }
    }));
}

/*
 *  ======== _initRepoDropTarget ========
 */
function _initRepoDropTarget()
{
    var transfer = [dnd.TextTransfer.getInstance(),
                    dnd.FileTransfer.getInstance()];
    var dropTarget = dnd.DropTarget(app.w_pkgPathTree,
                                    dnd.DND.DROP_COPY|dnd.DND.DROP_MOVE);
    dropTarget.setTransfer(transfer); 
    dropTarget.addDropListener(new dnd.DropTargetListener({
        dragEnter: function(e) {},
        dragOver: function(e) { _repoDragOver(e); },
        dragOperationChanged: function(e) {},
        dragLeave: function(e) {},
        dropAccept: function(e) {},
        drop: function(e) { _dataDroppedOnRepo(e); },
    }));
}

/*
 *  ======== _initXDCVars ========
 */
function _initXDCVars()
{
    xdcrootrepo = java.io.File(environment['xdc.root']).getCanonicalPath();
    xdcrootrepo = ("" + xdcrootrepo).replace(/\\/g, '/') + "/packages";
    hat = Packages.xdc.services.global.Path.getCurPkgRoot();
    hat = java.io.File(hat).getCanonicalPath();
    hat = ("" + hat).replace(/\\/g, '/');
}

/*
 *  ======== _isValidDropRepository ========
 */
function _isValidDropRepository(item)
{
    if (item.getParentItem() == null &&
        java.io.File(item.getText()).exists() &&
        repomanMain.isRepositoryWritable(item.getText())) {

        return (true);
    }
    return (false);
}

/*
 *  ======== _isXdcHat ========
 */
function _isXdcHat(dir)
{
    return (java.io.File(dir).equals(java.io.File(hat)));
}

/*
 *  ======== _isXdcRepo ========
 */
function _isXdcRepo(dir)
{
    return (_isXdcRoot(dir) || _isXdcHat(dir));
}

/*
 *  ======== _isXdcRoot ========
 */
function _isXdcRoot(dir)
{
    return (java.io.File(dir).equals(java.io.File(xdcrootrepo)));
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
 *  ======== _moveRepo ========
 *
 *  Change a repository's position in 
 *  the package path repositories tree
 *
 */
function _moveRepo(oldIndex, newIndex)
{
    /* get item being moved */
    var selItem = app.w_pkgPathTree.getItem(oldIndex);

    /* create a new item at destination index */
    var ti = widgets.TreeItem(app.w_pkgPathTree, SWT.NULL,
                              newIndex);
    ti.setText(selItem.getText());
    ti.setForeground(selItem.getForeground());
    if (selItem.getImage() != null) {
        ti.setImage(selItem.getImage());
    }

    /* create children and copy source's data */
    for (var i = 0; i < selItem.getItemCount(); i++) {
        var ti2 = widgets.TreeItem(ti, SWT.NULL);
        ti2.setText(selItem.getItem(i).getText());
        ti2.setFont(selItem.getItem(i).getFont());
        ti2.setForeground(selItem.getItem(i).getForeground());
        if (selItem.getItem(i).getImage() != null) {
            ti2.setImage(selItem.getItem(i).getImage());
        }
        ti2.setData(selItem.getItem(i).getData());
    }
    selItem.dispose();
    if (newIndex > oldIndex) {
        --newIndex;
    }
    app.w_pkgPathTree.setSelection(app.w_pkgPathTree.getItem(newIndex));
}

/*
 *  ======== _moveRepoDown ========
 *
 *  Move a repository down in position in 
 *  the package path repositories tree
 *
 */
function _moveRepoDown(shell)
{
    var selIndex = _getSelectedRepoIndex();
    if (selIndex >= 0 && selIndex < app.w_pkgPathTree.getItemCount() - 1) {
        _moveRepo(selIndex, selIndex + 2);
    }
}

/*
 *  ======== _moveRepoUp ========
 *
 *  Move a repository up in position in 
 *  the package path repositories tree
 *
 */
function _moveRepoUp(shell)
{
    var selIndex = _getSelectedRepoIndex();
    if (selIndex > 0) {
        _moveRepo(selIndex, selIndex - 1);
    }
}

/*
 *  ======== _onAllDependencies ========
 *
 *  User right-clicked "All Dependencies"
 *
 */
function _onAllDependencies(item)
{
    var menuItems = app.w_packagesTree.getMenu().getItems();
    for (var i = 0; i < menuItems.length; i++) { 
        menuItems[i].setSelection(menuItems[i] == menuItems[2]);
    }
    item.setImage(0, rsrc.ICO_ALLDEP);
}

/*
 *  ======== _onImmediateDependencies ========
 *
 *  User right-clicked "Immediate Dependencies"
 *
 */
function _onImmediateDependencies(item)
{
    var menuItems = app.w_packagesTree.getMenu().getItems();
    for (var i = 0; i < menuItems.length; i++) { 
        menuItems[i].setSelection(menuItems[i] == menuItems[1]);
    }
    item.setImage(0, rsrc.ICO_IMMEDDEP);
}

/*
 *  ======== _onNoDependencies ========
 *
 *  User right-clicked "No Dependencies"
 *
 */
function _onNoDependencies(item)
{
    var menuItems = app.w_packagesTree.getMenu().getItems();
    for (var i = 0; i < menuItems.length; i++) { 
        menuItems[i].setSelection(menuItems[i] == menuItems[0]);
    }
    item.setImage(0, null);
}

/*
 *  ======== _packagesDragFinished ========
 */
function _packagesDragFinished(e)
{
    dragSourceId = null;
}

/*
 *  ======== _packagesDragSetData ========
 */
function _packagesDragSetData(e)
{
    var depType;
    e.data = "";
    var selArr = app.w_packagesTree.getSelection();
    for each (var ti in selArr) {
        if (ti.getData() != null) {
            if (ti.getImage() == rsrc.ICO_IMMEDDEP) {
                depType = IMMED_DEPS_ARG;
            }
            else if (ti.getImage() == rsrc.ICO_ALLDEP) {
                depType = ALL_DEPS_ARG;
            }
            else if (_isBundlePackage(ti)) {
                depType = "";
            }
            else if (!_isBundleRepositoryItem(ti)) {
                depType = NO_DEPS_ARG;
            }
            else {
                depType = "";
            }
            e.data += depType + ti.getData() + "\n";
        }
    }
    if (e.data == "") {
        e.data = NO_DATA_STR;
    }
}

/*
 *  ======== _packagesDragStart ========
 */
function _packagesDragStart(e)
{
    if (app.w_packagesTree.getSelectionCount() == 0) {
        e.doit = false;
    }
    else {
        e.doit = true;
        dragSourceId = PACKAGES_DRAG_SOURCE;
    }
}

/*
 *  ======== _packagesTreeMouseDown ========
 */
function _packagesTreeMouseDown(e)
{
    _mouseLeave(e);
    if (e.button == 3) { /* right button */
        var menu = app.w_packagesTree.getMenu();
        if (menu != null) { /* delete previous menu items, if any */
            var items = menu.getItems(); 
            for (var i = 0; i < items.length; i++) { 
                items[i].dispose();
            }
        }
        var ti =  app.w_packagesTree.getItem(graphics.Point(e.x, e.y));
        if (ti!= null) {
            if (ti == dumpstersItem || ti == packagesItem) {
                menu = widgets.Menu(app.w_packagesTree);
                app.w_packagesTree.setMenu(menu); 
                var addItem = widgets.MenuItem(menu, SWT.NULL);
                var text = (ti == dumpstersItem) ? ADD_ARCHIVE_DIR_MENU_STR :
                                                   ADD_REPO_MENU_STR;
                addItem.setText(text);
                addItem.addListener(SWT.Selection,
                        function(e){ _addRemovePackagesDlg(w_shell); });
                if (ti == dumpstersItem) {
                    widgets.MenuItem(menu, SWT.SEPARATOR);
                    var pkgNameSortItem = widgets.MenuItem(menu, SWT.CHECK);
                    pkgNameSortItem.setText(PKG_NAME_MENU_STR);
                    pkgNameSortItem.addListener(SWT.Selection,
                            function(e){ _onPkgNameSort(e); });
                    pkgNameSortItem.setSelection(sortByPackageName == true);
                    var tarNameSortItem = widgets.MenuItem(menu, SWT.CHECK);
                    tarNameSortItem.setText(TAR_NAME_MENU_STR);
                    tarNameSortItem.addListener(SWT.Selection,
                            function(e){ _onTarNameSort(e); });
                    tarNameSortItem.setSelection(sortByPackageName == false);
                }
            }
            else if (ti.getParentItem() != null && ti.getData() != null) {
                if (_isBundleRepositoryItem(ti) || _isBundlePackage(ti)) {
                    return;
                }
                var pkgArr = ti.getData().split(';');
                if (_isAnArchive(pkgArr[FILE_INDEX])) {
                    /* create the menu */
                    menu = widgets.Menu(app.w_packagesTree);
                    app.w_packagesTree.setMenu(menu); 

                    if (_isBundleItem(ti)) {
                        var extractItem = widgets.MenuItem(menu, SWT.NONE);
                        extractItem.setText('Extract to...');
                        extractItem.addListener(SWT.Selection,
                            function(e){ _onExtractBundle(ti); });
                        widgets.MenuItem(menu, SWT.SEPARATOR);
                        var removeItem = widgets.MenuItem(menu, SWT.NULL);
                        removeItem.setText(REMOVE_STR);
                        removeItem.addListener(SWT.Selection,
                                function(e){_removePackagesTreeItem(ti, true,
                                            true);});
                    }
                    else {
                        var noDepsItem = widgets.MenuItem(menu, SWT.CHECK);
                        noDepsItem.setText(NO_DEPS_MENU_STR);
                        noDepsItem.addListener(SWT.Selection,
                                function(e){ _onNoDependencies(ti); });
                        var immedDepsItem = widgets.MenuItem(menu, SWT.CHECK);
                        immedDepsItem.setText(IMMED_DEPS_MENU_STR);
                        immedDepsItem.addListener(SWT.Selection,
                                function(e){ _onImmediateDependencies(ti); });
                        var allDepsItem = widgets.MenuItem(menu, SWT.CHECK);
                        allDepsItem.setText(ALL_DEPS_MENU_STR);
                        allDepsItem.addListener(SWT.Selection,
                                function(e){ _onAllDependencies(ti); });
                        if (_archiveWasAddedAsAFile(pkgArr[FILE_INDEX])) {
                            widgets.MenuItem(menu, SWT.SEPARATOR);
                            var removeItem = widgets.MenuItem(menu, SWT.NULL);
                            removeItem.setText(REMOVE_STR);
                            removeItem.addListener(SWT.Selection,
                                    function(e){_removePackagesTreeItem(ti, true,
                                                false);});
                        }

                        /* init the menu */
                        if (ti.getImage() == rsrc.ICO_IMMEDDEP) {
                            immedDepsItem.setSelection(true);
                        }
                        else if (ti.getImage() == rsrc.ICO_ALLDEP) {
                            allDepsItem.setSelection(true);
                        }
                        else {
                            noDepsItem.setSelection(true);
                        }
                    }
                }
                else {
                    if (_isPhysicalBundleItem(ti)) {
                        menu = widgets.Menu(app.w_packagesTree);
                        app.w_packagesTree.setMenu(menu); 
                        var removeItem = widgets.MenuItem(menu, SWT.NULL);
                        removeItem.setText(REMOVE_STR);
                        removeItem.addListener(SWT.Selection,
                                function(e){_removePackagesTreeItem(ti, false,
                                            true);});
                    }
                }
            }
        }
    }
}


/*
 *  ======== _pkgErrorStr ========
 */
function _pkgErrorStr(repo, pkgName, image)
{
    var str = "";
    if (image == rsrc.ICO_ERROR) {
        for each (var r in checkArr) { 
            if ("" + r.name == "" + pkgName) {
                str = r.type + ": " + r.name + r.vers + '\n';
                for each (var p in r.depPkgs) {
                    str += p.name + " was built with " + r.name + p.versReqd +
                           '\n';
                }
                break;
            }
        }
    }

    /* if no error, check for shadow */
    if (str.length == 0) {
        var shadowStr = "";
        var repoFile = java.io.File(repo);
        for each (var r in shadowResults) {
            if (repoFile.equals(java.io.File(r.repo)) &&
                ("" + r.pkg) == ("" + pkgName)) {
            
                shadowStr = r.filelist.join("\n");
                break;
            }
        }
        if (shadowStr.length > 0) {
        str = "Warning: One or more \"" + pkgName + "\"\n" +
              "packages preceding this one in the\n" + 
              "Package Path do not contain:\n" +
              shadowStr;
        }
    }

    /* if no error or shadow, check for warning */
    if (str.length == 0) {
        for each (var r in checkArr) { 
            if ("" + r.name == "" + pkgName) {
                str = r.type + ": " + r.name + r.vers + '\n';
                for each (var p in r.depPkgs) {
                    str += p.name + " was built with " + r.name + p.versReqd +
                           '\n';
                }
                break;
            }
        }
    }

    return (str);
}

/*
 *  ======== _pkgInfoStr ========
 */
function _pkgInfoStr(pkgInfo, isBundle)
{
    var str = "";
     for (var i = 0; i < pkgInfo.length; i++) {
        if (pkgInfo[i].length != 0 && prefix[i].length) {
            if (str.length) {
                str += '\n';
            }
            if (i == PACKAGE_INDEX) {
                if (isBundle) {
                    str += BUNDLE_STR + pkgInfo[i];
                }
                else {
                    str += PACKAGE_STR + pkgInfo[i];
                }
            }
            else if (i == DATE_INDEX) {
                str += prefix[i] + Date.mkDate(pkgInfo[i]);
            }
            else if (i == REPO_INDEX) {
                if (isBundle) {
                    str += LOCATION_STR + pkgInfo[i] + '/' +
                           pkgInfo[PACKAGE_INDEX];
                }
                else {
                    str += prefix[i] + pkgInfo[i];
                }
            }
            else {
                str += prefix[i] + pkgInfo[i];
            }
        }
    }
    return (str);
}

/*
 *  ======== _refreshRepo ========
 *
 *  Refresh repository at index in My Package Path tree
 *
 */
function _refreshRepo(index)
{
    if (index >= 0) {
        var item = app.w_pkgPathTree.getItem(index);
    }
    else {
        var item = _getSelectedRepoItem();
    }
    if (item != null) {
        if(item.getExpanded() == true) {
             _showBusy();
            app.w_pkgPathTree.setRedraw(false);
            item.removeAll();
            _populatePkgPathTreeNode(item);
            _setStatusText("");
            _showDone();
            app.w_pkgPathTree.setRedraw(true);
            app.w_packagesTree.update();
        }
        else {
            item.removeAll();
            widgets.TreeItem(item, SWT.NULL); /* dummy to show '+' sign */
        }
    }
}

/*
 *  ======== _removeRepo ========
 *
 *  Remove a repository from package path
 *  repositories tree
 *
 */
function _removeRepo(shell, index)
{
    if (index >= 0) {
        var item = app.w_pkgPathTree.getItem(index);
    }
    else {
        var item = _getSelectedRepoItem();
    }
    if (item != null) {
        item.dispose();
    }
}

/*
 *  ======== _removeRepoOrDeletePackage ========
 *
 */
function _removeRepoOrDeletePackage(shell)
{
    var item = _getSelectedRepoItem();
    if (item != null) {
        if (item.getParentItem() == null) { /* clicked on a repository */
            _removeRepo(shell);
        }
        else {
            _deleteSelectedPackage(shell);
        }
    }
}

/*
 *  ======== _repoDragFinished ========
 */
function _repoDragFinished(e)
{
    dragSourceId = null;
}

/*
 *  ======== _repoDragOver ========
 */
function _repoDragOver(e)
{
    e.feedback = dnd.DND.FEEDBACK_SCROLL;
    if (dragSourceId == PACKAGES_DRAG_SOURCE) {
        if ((e.operations & dnd.DND.DROP_COPY) != 0) { 
            if (e.item != null && _isValidDropRepository(e.item) &&
                _isValidDragSourceData()) {
                e.detail = dnd.DND.DROP_COPY; 
            }
            else {
                e.detail = 0;
            }
        }
    }
    else if (dragSourceId == REPO_DRAG_SOURCE) {
        if (e.item != null) {

            var selItem = _getSelectedRepoItem();
            if (selItem == null) {
                e.detail = 0;
                return;
            }
            var parentOfSelItem = selItem.getParentItem();
            if (parentOfSelItem == null) {       /* is repostitory */

                /* get index of item being dragged */
                var selIndex = _getSelectedRepoIndex();
                var itemIndex = app.w_pkgPathTree.indexOf(e.item);
                if (itemIndex == -1 || selIndex == itemIndex) {
                    e.detail = 0;
                    return;   /* no op if it's over itself or bad index */
                }
                var pt = w_display.map(null, app.w_pkgPathTree, e.x, e.y);
                var bounds = e.item.getBounds();

                /* check if i is over a valid drop target */
                if (pt.y > bounds.y + 2 * bounds.height / 3) {
                    if (itemIndex == selIndex - 1) {
                        e.detail = 0;
                        return;
                    }
                }
                else if (itemIndex == selIndex + 1) {
                    e.detail = 0;
                    return;
                }
                e.detail = 2;
                if (pt.y < bounds.y + bounds.height / 3) {
                    e.feedback |= dnd.DND.FEEDBACK_INSERT_BEFORE;
                }
                else if (pt.y > bounds.y + 2 * bounds.height / 3) {
                    e.feedback |= dnd.DND.FEEDBACK_INSERT_AFTER;
                }
            }
            else {
                if (e.item != parentOfSelItem &&
                     repomanMain.isRepositoryWritable(e.item.getText())) { /* is a package */

                    e.detail = dnd.DND.DROP_COPY;
                }
                else {
                    e.detail = 0;
                }
            }
        }
    }
    else if (dnd.FileTransfer.getInstance().isSupportedType(e.currentDataType)){

        /* from Windows Explorer */

        if (e.item != null) {

            if (e.item.getParentItem() != null) { /* is over a package */
                e.detail = 0;
                return;
            }
            var itemIndex = app.w_pkgPathTree.indexOf(e.item);
            var pt = w_display.map(null, app.w_pkgPathTree, e.x, e.y);
            var bounds = e.item.getBounds();
            if (pt.y < bounds.y + bounds.height / 3) {
                e.feedback |= dnd.DND.FEEDBACK_INSERT_BEFORE;
            }
            else if (pt.y > bounds.y + 2 * bounds.height / 3) {
                if (e.item.getExpanded() == true) {
                    e.detail = 0;   /* is in between repo */
                    return;         /* and first child    */
                }
                e.feedback |= dnd.DND.FEEDBACK_INSERT_AFTER;
            }
            else {
                e.detail = 0;
                return;
            }
        }
        e.detail = dnd.DND.DROP_COPY; 
    }
}

/*
 *  ======== _repoDragSetData ========
 */
function _repoDragSetData(e)
{
    e.data = "";
    var selItem = _getSelectedRepoItem();
    if (selItem != null) {
        e.data = selItem.getText();
    }
}

/*
 *  ======== _repoDragStart ========
 */
function _repoDragStart(e)
{
    var selItem = _getSelectedRepoItem();
    if (selItem == null) {
        e.doit = false;
    }
    else {
        e.doit = true;
        dragSourceId = REPO_DRAG_SOURCE;
    }
}

/*
 *  ======== _repoItemSelected ========
 *
 *  enable/disable toolbar buttons accordingly
 *
 */
function _repoItemSelected(e)
{
    var item = _getSelectedRepoItem();
    if (!item) {
        item = e.item;
    }
    if (item.getParentItem() == null) { /* a repository was selected */
        app.w_btnRemoveDelete.setEnabled(true);

        var selIndex = app.w_pkgPathTree.indexOf(item);
        var canMoveDown = (selIndex >= 0 &&  
                          selIndex < app.w_pkgPathTree.getItemCount() - 1);
        app.w_btnMoveRepoDown.setEnabled(canMoveDown);

        var canMoveUp = selIndex > 0;
        app.w_btnMoveRepoUp.setEnabled(canMoveUp);

    }
    else {  /* a package was selected */
        app.w_btnRemoveDelete.setEnabled(
            repomanMain.isRepositoryWritable(item.getParentItem().getText()));
        app.w_btnMoveRepoUp.setEnabled(false);
        app.w_btnMoveRepoDown.setEnabled(false);
    }
}

/*
 *  ======== _repoMouseOver ========
 */
function _repoMouseOver(e)
{
    var ti =  app.w_pkgPathTree.getItem(graphics.Point(e.x, e.y));

    if (ti!= null) {

        if (ti.getParentItem() == null) {
            if (ti.getImage() == rsrc.ICO_WARNING && ti.getData() != null &&
                ti.getImageBounds(0).contains(e.x, e.y)) {

                var str = CheckPath.getWarningString(ti.getData(), false, false);
                _itemHover(app.w_pkgPathTree, ti, str, graphics.Point(e.x, e.y));
            }
            else {
                var dir = String(ti.getText());
                var repoInf = repomanMain.getRepoXmlItems(dir);
                var writable = repoInf.writable;
                var str = '';
                if (_isXdcRoot(dir)) {
                    str = XDCROOT_PACKAGES_INFOSTR;
                    if (!writable) {
                        str += '\n' + THIS_IS_READONLY_REPO_STR;
                    }
                }
                else if (_isXdcHat(dir)) {
                    str = HAT_INFOSTR;
                    if (!writable) {
                        str += '\n' + THIS_IS_READONLY_REPO_STR;
                    }
                }
                else if (!writable) {
                    str = THIS_IS_READONLY_REPO_STR;
                }
                if (repoInf.providerId.length) {
                    if (str) {
                        str += '\n';
                    }
                    str += 'Provider Id: ' + repoInf.providerId;
                }
                if (str) {
                    _itemHover(app.w_pkgPathTree, ti, str,
                               graphics.Point(e.x, e.y));
                }
            }
        }
        else if (ti.getData() != null) {
            if (ti.getImage() != null && 
                ti.getImageBounds(0).contains(e.x, e.y)) {

                /* mouse pointer is in the error/warning */
                /* image, show the associated message    */
                _itemHover(app.w_pkgPathTree, ti,
                           _pkgErrorStr(ti.getParentItem().getText(), 
                           ti.getText(), ti.getImage()), graphics.Point(e.x, e.y));
            }
            else {
                _itemHover(app.w_pkgPathTree, ti, _pkgInfoStr(ti.getData()),
                           graphics.Point(e.x, e.y));
            }
        }
    }
}

/*
 *  ======== _repoTreeMouseDown ========
 */
function _repoTreeMouseDown(e)
{
    _mouseLeave(e);
    if (e.button == 3) { /* right button */
        var menu = app.w_pkgPathTree.getMenu();
        if (menu != null) { /* delete previous items, if any */
            var items = menu.getItems(); 
            for (var i = 0; i < items.length; i++) { 
                items[i].dispose();
            }
        }
        var ti =  app.w_pkgPathTree.getItem(graphics.Point(e.x, e.y));
        if (ti!= null) {

            /* build the menu */
            menu = widgets.Menu(app.w_pkgPathTree);
            app.w_pkgPathTree.setMenu(menu); 
            if (ti.getParentItem() == null) { /* clicked on a repository */
                var selIndex = _getSelectedRepoIndex();
                var isXdcRepo =
                     _isXdcRepo(app.w_pkgPathTree.getItem(selIndex).getText());
                var refreshItem = widgets.MenuItem(menu, SWT.NULL);
                refreshItem.setText(REFRESH_STR);
                refreshItem.addListener(SWT.Selection,
                        function(e){ _refreshRepo(); });
                var removeItem = widgets.MenuItem(menu, SWT.NULL);
                removeItem.setText(REMOVE_FROM_PATH_STR);
                removeItem.addListener(SWT.Selection,
                        function(e){ _removeRepo(w_shell); });
                widgets.MenuItem(menu, SWT.SEPARATOR);
                var moveDownItem = widgets.MenuItem(menu, SWT.NULL);
                moveDownItem.setText(MOVE_DOWN_STR);
                var canMoveDown = (selIndex >= 0 &&  
                                   selIndex < app.w_pkgPathTree.getItemCount() - 1);
                if (canMoveDown) {
                    moveDownItem.addListener(SWT.Selection,
                                    function(e){ _moveRepoDown(w_shell); });
                }
                else {
                    moveDownItem.setEnabled(false);
                }

                var moveUpItem = widgets.MenuItem(menu, SWT.NULL);
                moveUpItem.setText(MOVE_UP_STR);
                var canMoveUp = selIndex > 0;
                if (canMoveUp) {
                    moveUpItem.addListener(SWT.Selection,
                                    function(e){ _moveRepoUp(w_shell); });
                }
                else {
                    moveUpItem.setEnabled(false);
                }

                widgets.MenuItem(menu, SWT.SEPARATOR);
                var provIdItem = widgets.MenuItem(menu, SWT.NULL);
                provIdItem.setText('Set ProviderId...');
                provIdItem.addListener(SWT.Selection, function(e){
                    _getAndSetProviderId();
                });
                provIdItem.setEnabled(repomanMain.isRepositoryWritable(
                        app.w_pkgPathTree.getItem(selIndex).getText()));
            }
            else {  /* clicked on a package */
                var menuItem = widgets.MenuItem(menu, SWT.NULL);
                menuItem.setText(DELETE_STR);
                if (repomanMain.isRepositoryWritable(ti.getParentItem().getText())) {
                    menuItem.addListener(SWT.Selection,
                            function(e){ _deleteSelectedPackage(w_shell); });
                }
                else {
                    menuItem.setEnabled(false);
                }
            }
        }
    }
}

/*
 *  ======== _setStatusText ========
 */
function _setStatusText(str)
{
    status.w_txt.setText(str);
    status.w_txt.update();
}

/*
 *  ======== _showBusy ========
 */
function _showBusy()
{
    w_shell.setCursor(rsrc.CUR_WAIT);
    status.w_labDone.setImage(rsrc.ICO_LIGHT_GRAY);
    status.w_labBusy.setImage(rsrc.ICO_LIGHT_RED);
    w_display.update();
}

/*
 *  ======== _showDone ========
 */
function _showDone()
{
    status.w_labDone.setImage(rsrc.ICO_LIGHT_GREEN);
    status.w_labBusy.setImage(rsrc.ICO_LIGHT_GRAY);
    w_shell.setCursor(null);
}

/*
 *  ======== main ========
 */
function _main(args, parent)
{
    try {
        _initSWT();
    
        w_display = parent ? parent.getDisplay() : widgets.Display();
        mkResources();
    
        w_shell = new widgets.Shell(w_display, SWT.SHELL_TRIM);
        w_shell.setLayout(layout.GridLayout());
        w_shell.setText('Repoman -- Experimental'); 
        w_shell.setImage(rsrc.ICO_SOG);
        w_shell.setSize(768, 500);
        mkControl();
        w_shell.addDisposeListener(function(event) {
            //_writeIniFile();
        } );
        w_shell.setFocus();
        w_shell.open();
        _init();
        //_readIniFile();
        while (!w_shell.isDisposed()) {
            if (!w_display.readAndDispatch()) {
                w_display.sleep();
            }
        }
    }
    finally {
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
 *  ======== _promptForProviderId ========
 */
function _promptForProviderId(repo, provId)
{
    var defProvId = provId;
    var promptDlg = widgets.Shell(w_shell,
                    SWT.DIALOG_TRIM | SWT.APPLICATION_MODAL);
    promptDlg.setImage(rsrc.ICO_SOG);
    promptDlg.setLayout(layout.GridLayout());
    promptDlg.setSize(250, 125);
    promptDlg.setText('Set ProviderId for Repository');

    var promptLabel = widgets.Label(promptDlg, SWT.NONE);
    promptLabel.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
    promptLabel.setText('ProviderId:');

    /* create text editor for same */
    var promptText = widgets.Text(promptDlg, SWT.LEFT | SWT.SINGLE | SWT.BORDER);
    promptText.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));

    /* default providerId will be parent of repository */
    var dfile = java.io.File(repo);
    var path = String(dfile.getCanonicalPath());
    var name = String(dfile.getName());
    path = path.substr(0, path.length - name.length);
    if (!provId) {
        defProvId = String(java.io.File(path).getName());
        provId = defProvId;
    }
    promptText.setText(provId);

    /* create OK and Cancel buttons */
    var btnComposite = widgets.Composite(promptDlg, SWT.NONE); 
    var btnLayout = layout.GridLayout();
    btnLayout.numColumns = 2;   
    btnComposite.setLayout(btnLayout);

    var okBtn = widgets.Button(btnComposite, SWT.PUSH|SWT.DEFAULT);
    okBtn.setText ("OK");
    okBtn.addListener(SWT.Selection, function(e) {
        provId = String(promptText.getText());
        promptDlg.dispose();
    });

    var cancelBtn = widgets.Button(btnComposite, SWT.PUSH);
    cancelBtn.setText ("Cancel");
    cancelBtn.addListener(SWT.Selection, function(e) {
        provId = defProvId;
        promptDlg.dispose();
    });

    promptDlg.open();
    promptText.setFocus();
    promptText.selectAll();

    while (!promptDlg.isDisposed()) {
        if (!w_display.readAndDispatch()) {
            w_display.sleep();
        }
    }
    return (provId);
}

/*
 *  ======== _getAndSetProviderId ========
 */
function _getAndSetProviderId()
{
    var repo = app.w_pkgPathTree.getItem(_getSelectedRepoIndex()).getText();
    var provId = repomanMain.getRepoXmlItems(repo).providerId;
    provId = _promptForProviderId(repo, provId);
    repomanMain.setRepoProviderId(repo, provId);
}


/*
 *  ======== _createRepoXmlFile ========
 */
function _createRepoXmlFile(dir)
{
    var file = java.io.File(dir + '/' + REPOXML_FILE);
    if (!file.exists()) {
        repomanMain.createRepoXmlFile(dir, 
                                      {providerId : null,
                                       writable   : 'true'});
    }
}

/*
 *  ======== _addURLDlg ========
 */
function _addURLDlg(shell)
{
    var url = null;

    var promptDlg = widgets.Shell(shell, SWT.DIALOG_TRIM|
                                  SWT.RESIZE|SWT.APPLICATION_MODAL);
    promptDlg.setImage(rsrc.ICO_SOG);
    promptDlg.setLayout(layout.GridLayout());
    promptDlg.setSize(500, 125);
    promptDlg.setText('Enter URL');

    var promptLabel = widgets.Label(promptDlg, SWT.NONE);
    promptLabel.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
    promptLabel.setText('URL:');

    /* create text editor for same */
    var promptText = widgets.Text(promptDlg, SWT.LEFT | SWT.SINGLE | SWT.BORDER);
    promptText.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));

    /* create OK and Cancel buttons */
    var btnComposite = widgets.Composite(promptDlg, SWT.NONE); 
    var btnLayout = layout.GridLayout();
    btnLayout.numColumns = 2;   
    btnComposite.setLayout(btnLayout);
    btnComposite.setLayoutData(layout.GridData(SWT.CENTER, SWT.CENTER, true, true));

    var okBtn = widgets.Button(btnComposite, SWT.PUSH|SWT.DEFAULT);
    okBtn.setText ("OK");
    okBtn.addListener(SWT.Selection, function(e) {
        url = String(promptText.getText());
        if (repoman.isValidURL(url)) {
            promptDlg.dispose();
        }
        else {
            var msgBox = widgets.MessageBox(promptDlg, SWT.OK | SWT.ICON_ERROR);
            msgBox.setText(REPOMAN_STR);
            msgBox.setMessage("Invalid URL");
            msgBox.open();
            promptText.setFocus();
            url = null;
        }
    });

    var cancelBtn = widgets.Button(btnComposite, SWT.PUSH);
    cancelBtn.setText ("Cancel");
    cancelBtn.addListener(SWT.Selection, function(e) {
        url = null;
        promptDlg.dispose();
    });

    promptDlg.open();
    promptText.setFocus();
    promptText.selectAll();

    while (!promptDlg.isDisposed()) {
        if (!w_display.readAndDispatch()) {
            w_display.sleep();
        }
    }
    return (url);
}

/*
 *  ======== _urlEqualsStr ========
 */
function _urlEqualsStr(url, str)
{
    var isEqual = false;
    try {
        if (url.equals(java.net.URL(str))) {
            isEqual = true;
        }
    }
    catch (e) {
    }
    return (isEqual);
}


/*
 *  ======== _addArchiveFileDlg ========
 */
function _addArchiveFileDlg(shell)
{
    var dlg = widgets.FileDialog(shell, SWT.OPEN);
    dlg.setText("Select an archive file");
    dlg.setFilterExtensions(archiveFilterExt);
    dlg.setFilterNames(archiveFilterNames);
    return (dlg.open());
}

/*
 *  ======== _onExtractBundle ========
 */
function _onExtractBundle(item)
{
    var dlg = widgets.DirectoryDialog(w_shell);

    /* Change the title bar text */
    dlg.setText('Extract Bundle');

    /* Customizable message displayed in the dialog */
    dlg.setMessage(EXTRACT_BUNDLE_MSG);

    while (true) {
        var destDir = dlg.open();
        if (destDir != null) {
            destDir = String(destDir).replace(/\\/g, '/');
            var pkg = item.getData().split(';');
            if (_destPackageExists(pkg[PACKAGE_INDEX], destDir)) {
                if (!_confirmPackageOverwrite(pkg[PACKAGE_INDEX], destDir)) {
                    continue;
                } 
            }
            _showBusy();
            _setStatusText("Extracting " + pkg[PACKAGE_INDEX] + " to " +
                           destDir + "...");
            repomanMain.extractArchiveContents(null, String(pkg[FILE_INDEX]),
                                               destDir);

            /* add bundle's repositories to rhs */
            var srcPkgName = (item.getData().split(';'))[PACKAGE_INDEX];
            for each (var ti in item.getItems()) {
                var repo = destDir + '/' + srcPkgName + '/' + ti.getText();
                var found = false;
                var pkgPathItems = app.w_pkgPathTree.getItems();
                for (var i = 0; i < pkgPathItems.length; i++) {
                    if (java.io.File(repo).equals(
                        java.io.File(pkgPathItems[i].getText()))) {

                        found = true;
                        break;
                    }
                }
                if (found) {
                    _removeRepo(w_shell, i);
                    _addPkgPathTreeNode(repo, i);
                }
                else {
                    _addPkgPathTreeNode(repo);
                }
            }
            _setStatusText("");
            _showDone();
        }
        break;
    }
}

/*
 *  ======== _isBundleItem ========
 */
function _isBundleItem(item)
{
    return (item.getImage() == rsrc.ICO_BUNDLE ? true : 
            _isParentOfRepository(item));
}

/*
 *  ======== _writeIniFile ========
 */
function _writeIniFile()
{
    try {
        var doc = <repoman_ini/>;
        var packagesTree = <PackagesTree/>;
        for each (var a in packagesTreeDirArr) {
            var item = <item>{a}</item>;
            packagesTree.appendChild(item);
        }
        doc.appendChild(packagesTree);
/*
        don't save rh pane 
        doc.xdcrootrepo = xdcrootrepo;
        var pkgPathTree = <PackagePathTree/>;

        for (i = 0; i < app.w_pkgPathTree.getItemCount(); i++) {
            var repo = <repository>{app.w_pkgPathTree.getItem(i).getText()}</repository>;
            pkgPathTree.appendChild(repo);
        }
        doc.appendChild(pkgPathTree);
*/
        var version = "<?xml version=\"1.0\"?>";
        version + doc.toXMLString()

        var f = new java.io.FileWriter(new java.io.File(iniFilesDir + ".repoman.ini"));
        f.write( version + doc.toXMLString());
        f.close();
    }
    catch (e) {
        print( "Warning: storing settings to the ini file failed. Reason: " + e);
    }
}


/*
 *  ======== _readIniFile ========
 */
function _readIniFile()
{
    if (!java.io.File(iniFilesDir + ".repoman.ini").exists()) {
        /*_initPackagePathTree();*/ /*  don't remember rh pane */
        return;
    }
    try {
        var doc = xdc.loadXML(iniFilesDir + ".repoman.ini");

        for (i = 0; i < doc.PackagesTree.item.length(); i++) {
            var aitem = String(doc.PackagesTree.item[i]);
            if (repoman.isValidURL(aitem) || java.io.File(aitem).exists()) {
                addPackagesDirArr.push(aitem);
                packagesTreeDirArr.push(aitem);
            }
        }
        if (addPackagesDirArr.length) {
            /* add dummy items to packages tree */
            widgets.TreeItem(dumpstersItem, SWT.NULL);
            widgets.TreeItem(packagesItem, SWT.NULL);
            dumpstersItem.setExpanded(false);
            packagesItem.setExpanded(false);
        }
/*
        don't remember rh pane 
        xdcrootrepo = doc.xdcrootrepo;

        for (i = 0; i < doc.PackagePathTree.repository.length(); i++) {
            var dir = String(doc.PackagePathTree.repository[i]);
            if (java.io.File(dir).exists()) {
                _addPkgPathTreeNode(dir);
            }
        }
*/
    }
    catch (e) {
        print("Warning: Reading repoman.ini file failed. Reason: " + e);
    }
}

/*
 *  ======== _isBundlePackage ========
 */
function _isBundlePackage(item)
{
    var data = item.getData();
    return (data != null && (data.startsWith(AR_BUNDLE_PKG_DATA_ID) ||
            data.startsWith(BUNDLE_PKG_DATA_ID)));
}

/*
 *  ======== _parentItemIsSelected ========
 */
function _parentItemIsSelected(item, selArr)
{
    var found = false;
    var parItem = item.getParentItem();
    for each (var s in selArr) {
        if (parItem == s) {
            found = true;
            break;
        }
    }
    return (found);
}

/*
 *  ======== _instructions ========
 */
function _instructions(shell)
{

    var dlg = new widgets.Shell(shell, SWT.DIALOG_TRIM | 
                                       SWT.RESIZE |
                                       SWT.APPLICATION_MODAL);
    dlg.setSize(470, 400);
    dlg.setText("Repoman Instructions");

    dlg.setLayout(layout.GridLayout(1, false));

    var comp = new widgets.Composite(dlg, SWT.NONE);
    comp.setLayout(layout.GridLayout());
    comp.setLayoutData(layout.GridData(layout.GridData.FILL_BOTH)); 
        
    var text = new widgets.Text(comp, SWT.WRAP | SWT.BORDER |
        SWT.READ_ONLY | SWT.MULTI | SWT.V_SCROLL);
    text.setText(INSTRUCTIONS_TEXT);
    text.setLayoutData(layout.GridData(layout.GridData.FILL_BOTH));

    var okBtn = new widgets.Button(comp, SWT.PUSH|SWT.DEFAULT);
    okBtn.setLayoutData(layout.GridData(layout.GridData.HORIZONTAL_ALIGN_CENTER));
    okBtn.setText("    OK    ");
    okBtn.addListener( SWT.Selection, function (okEvent) {
        dlg.dispose();
    } );
    dlg.open(); 
}

/*
 *  ======== _getParentDir ========
 */
function _getParentDir(path, filename)
{
    var parDir = String(path).substr(0, path.length - filename.length);
    parDir = parDir.replace(/\\/g, '/');
    return (parDir.replace(/\/+$/, ''));
}

/*
 *  ======== _archiveWasAddedAsAFile ========
 */
function _archiveWasAddedAsAFile(arFileName)
{
    var arFile = java.io.File(arFileName);
    var foundIndex = -1;
    for (var i = 0; i < inArchivesDirArr.length; i++) {
        if (java.io.File(inArchivesDirArr[i]).equals(arFile)) {
            foundIndex = i;
            break;
        }
    }
    return (foundIndex != -1);
}

/*
 *  ======== _removePackagesTreeItem ========
 */
function _removePackagesTreeItem(item, isArchive, isBundle)
{
    var pkg = item.getData().split(';');
    if (isBundle && !isArchive) {
        var file = java.io.File(pkg[FILE_INDEX] + '/' + pkg[PACKAGE_INDEX]);
    }
    else {
        var file = java.io.File(pkg[FILE_INDEX]);
    }
    var foundIndex = -1;
    if (isArchive) {
        for (var i = 0; i < inArchivesDirArr.length; i++) {
            if (java.io.File(inArchivesDirArr[i]).equals(file)) {
                foundIndex = i;
                break;
            }
        }
        if (foundIndex >= 0) {
            inArchivesDirArr.splice(foundIndex, 1);
        }
    }
    else {
        for (var i = 0; i < inRepositoriesDirArr.length; i++) {
            if (java.io.File(inRepositoriesDirArr[i]).equals(file)) {
                foundIndex = i;
                break;
            }
        }
        if (foundIndex >= 0) {
            inRepositoriesDirArr.splice(foundIndex, 1);
        }
    }
    foundIndex = -1;
    for (var i = 0; i < packagesTreeDirArr.length; i++) {
        if (java.io.File(packagesTreeDirArr[i]).equals(file)) {
            foundIndex = i;
            break;
        }
    }
    if (foundIndex >= 0) {
        packagesTreeDirArr.splice(foundIndex, 1);
    }
    var parItem = item.getParentItem();
    item.dispose();
    if (parItem != packagesItem && parItem != dumpstersItem &&
        parItem.getItemCount() == 1) {  /* is last item of duplicates */
         
        var lastItem = parItem.getItems()[0];
        parItem.setData(lastItem.getData());
        if (!isBundle) {
            parItem.setImage(0, lastItem.getImage());
        }

        if (isBundle) {
            /* repositories */
            for (var i = 0; i < lastItem.getItemCount(); i++) {
                var newRepoItem = widgets.TreeItem(parItem, SWT.NULL);
                var prevRepoItem = lastItem.getItem(i);
                newRepoItem.setText(prevRepoItem.getText());
                newRepoItem.setData(prevRepoItem.getData());

                /* packages */
                for (var j = 0; j < prevRepoItem.getItemCount(); j++) {
                    var newPkgItem = widgets.TreeItem(newRepoItem, SWT.NULL);
                    var prevPkgItem = prevRepoItem.getItem(j);
                    newPkgItem.setText(prevPkgItem.getText());
                    newPkgItem.setData(prevPkgItem.getData());
                }
            }
        }
        lastItem.dispose();
    }
}

/*
 *  ======== _refreshPackagePathRepos ========
 */
function _refreshPackagePathRepos()
{
    for (var i = 0; i < app.w_pkgPathTree.getItemCount(); i++) {
        _refreshRepo(i);
    }
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
 *  @(#) xdc.tools.repoman.sg; 1, 0, 0,0; 1-9-2017 12:51:54; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

