/* 
 *  Copyright (c) 2008 Texas Instruments and others.
 *  All rights reserved. This program and the accompanying materials
 *  are made available under the terms of the Eclipse Public License v1.0
 *  which accompanies this distribution, and is available at
 *  http://www.eclipse.org/legal/epl-v10.html
 * 
 *  Contributors:
 *      Texas Instruments - initial implementation
 * 
 * */

/* ---------------- AUXILIARY CAPSULES ---------------- */

var Pkg = xdc.loadCapsule('Pkg.xs');
var w_viewPart = null;

/* ---------------- SWT ALIASES ---------------- */

var browser = xdc.jre.org.eclipse.swt.browser;
var custom = xdc.jre.org.eclipse.swt.custom;
var graphics = xdc.jre.org.eclipse.swt.graphics;
var layout = xdc.jre.org.eclipse.swt.layout;
var widgets = xdc.jre.org.eclipse.swt.widgets;
var events = xdc.jre.org.eclipse.swt.events;

var SWT = xdc.jre.org.eclipse.swt.SWT;
var GD = layout.GridData;
    
/* ---------------- GLOBAL STATE ---------------- */

var w_display, w_shell;

var app = {};

var rsrc = {};

var cmd = {};

var pkgCache = {};
var pkgTab = [];
var pkgInfo = [];
var dirs = [];
var grpTree = [];
var noDoc = [];
var toolTip;

var cacheDir = '';

var cdocCmd = xdc.useModule('xdc.tools.cdoc.Main');

var tiAllPkgs = null;

/* ---------------- DISPLAY RESOURCES ---------------- */

function color(id) { return w_display.getSystemColor(id); }
function img(file) { return graphics.Image(w_display, xdc.findFile(file)); }

function mkResources()
{
    rsrc.CUR_HAND = graphics.Cursor(w_display, SWT.CURSOR_HAND);
    rsrc.CUR_WAIT = graphics.Cursor(w_display, SWT.CURSOR_WAIT);

    $d = w_display.getSystemFont().getFontData()[0]; $d.setStyle(SWT.BOLD);
    rsrc.FON_LABEL = graphics.Font(w_display, $d);

    rsrc.ICO_BACK = img('xdc/tools/cdoc/sg/files/e_back.gif');
    rsrc.ICO_CLOSE = img('xdc/tools/cdoc/sg/files/close.ico');
    rsrc.ICO_SHOW_NODOC = img('xdc/tools/cdoc/sg/files/show_nodoc.png');
    rsrc.ICO_COLLAPSE = img('xdc/tools/cdoc/sg/files/collapse.ico');
    rsrc.ICO_FORWARD = img('xdc/tools/cdoc/sg/files/e_forward.gif');
    rsrc.ICO_PACKAGES = img('xdc/tools/cdoc/files/packages.gif');
    rsrc.ICO_PACKAGE = img('xdc/tools/cdoc/files/package.gif');
    rsrc.ICO_MODULE = img('xdc/tools/cdoc/files/mod-blue.gif');
    rsrc.ICO_INTERFACE = img('xdc/tools/cdoc/files/int-blue.gif');
    rsrc.ICO_LIGHT_GRAY = img('xdc/tools/sg/icons/gray-light.ico');
    rsrc.ICO_LIGHT_GREEN = img('xdc/tools/sg/icons/green-light.ico');
    rsrc.ICO_LIGHT_RED = img('xdc/tools/sg/icons/red-light.ico');
    rsrc.ICO_SOG = img('xdc/tools/sg/icons/sog.ico');
    rsrc.ICO_METAMODULE = img('xdc/tools/cdoc/files/mod-red.gif');
    rsrc.ICO_METAINTERFACE = img('xdc/tools/cdoc/files/int-red.gif');
}

/* ---------------- WIDGET TREE ---------------- */

var DISABLED = false;
var ENABLED = true;

/*
 *  ======== mkToolBar ========
 */
function mkToolBar(prnt, style)
{
    var bar = widgets.ToolBar(prnt, style);
    bar.setCursor(rsrc.CUR_HAND);

    return (bar);
}

/*
 *  ======== mkToolBut ========
 */
function mkToolBut(tb, style, icon, tip, eflg)
{
    var but = widgets.ToolItem(tb, style);
    
    but.setImage(icon);
    but.setToolTipText(tip);
    but.setEnabled(eflg ? true : false);

    return (but);
}

/*
 *  ======== mkControl ========
 */
function mkControl()
{
    var $w$stack = [];
    var $w = w_shell;

    function WID(w) { $w$stack.push($w); $w = w; return $w; }
    function END() { $w = $w$stack.pop(); return $w; }

app.w_sash =     /* SashForm */
    WID(custom.SashForm($w, SWT.HORIZONTAL));
        $w.setLayoutData(layout.GridData(GD.FILL_BOTH));
        /* Composite */
        WID(widgets.Composite($w, SWT.BORDER));
            var $gl = layout.GridLayout(2, false);
            $w.setLayout($gl);
            /* Label */
            WID(custom.CLabel($w, SWT.NULL));
                $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
                $w.setText('Index');
                $w.setFont(rsrc.FON_LABEL);
            END();
            /* ToolBar */
            WID(mkToolBar($w, SWT.HORIZONTAL | SWT.FLAT));
                $w.setLayoutData(layout.GridData(GD.HORIZONTAL_ALIGN_END));
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_COLLAPSE, 'Collapse all', ENABLED));
                    $w.addListener(SWT.Selection, function(e){ treeCollapse(); });
                END();
            END();
app.w_tree = /* Tree */
            WID(widgets.Tree($w, SWT.BORDER));
                var $gd = layout.GridData(GD.FILL_BOTH);
                $gd.horizontalSpan = 2;
                $w.setLayoutData($gd);
                $w.addListener(SWT.MouseDoubleClick, function(e) { treeDoubleClick(e); });
                $w.addListener(SWT.KeyDown, function(e) { treeKeyDown(e); });
                $w.addListener(SWT.DefaultSelection, function(e) { e.doit = false; });
                $w.addTreeListener(events.TreeListener({
                    treeExpanded: function(e) { treeExpanded(e); },
                    treeCollapsed: function(e) {
                    },
                }));
                $w.addListener(SWT.MouseHover, function(e) { showToolTip(e); });
                $w.addListener(SWT.MouseExit, function(e) { hideToolTip(e); });
            END();
        END();
        /* Composite */
        WID(widgets.Composite($w, SWT.BORDER));
            var $gl = layout.GridLayout(3, false);
            $w.setLayout($gl);
            /* Label */
            WID(custom.CLabel($w, SWT.NULL));
                $w.setText('Pages');
                $w.setFont(rsrc.FON_LABEL);
            END();
            /* ToolBar */
            WID(mkToolBar($w, SWT.HORIZONTAL | SWT.FLAT));
                $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
app.w_btnBack = WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_BACK, 'Go back one page in browser', DISABLED));
                    $w.addListener(SWT.Selection, function(e){ uiGoBack(); });
                END();
app.w_btnForward =
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_FORWARD, 'Go forward one page in browser', DISABLED));
                        $w.addListener(SWT.Selection, function(e){ uiGoForward(); });
                END();
            END();
            /* ToolBar */
            WID(mkToolBar($w, SWT.HORIZONTAL | SWT.FLAT));
                $w.setLayoutData(layout.GridData(GD.HORIZONTAL_ALIGN_END));
app.w_btnNodoc = WID(mkToolBut($w, SWT.CHECK, rsrc.ICO_SHOW_NODOC, 'Show @_nodoc', ENABLED));
                    $w.addListener(SWT.Selection, function(e){ uiToggleNodoc();});
                END();
                WID(mkToolBut($w, SWT.PUSH, rsrc.ICO_CLOSE, 'Close all', ENABLED));
                    $w.addListener(SWT.Selection, function(e){ tabiCloseAll(); });
                END();
            END();
app.w_ctab =    /* CTab */
            WID(custom.CTabFolder($w, SWT.BORDER | SWT.CLOSE));
                var $gd = layout.GridData(GD.FILL_BOTH);
                $gd.horizontalSpan = 3;
                $w.setLayoutData($gd);
                $w.addSelectionListener(new events.SelectionListener({
                    widgetSelected: function(event) { tabiSelected(event); },
                    widgetDefaultSelected: function(event) {}
                }));
            END();
        END();
        $w.setWeights([25, 75]);
    END();
cmd.w_status =  /* Composite */
    WID(widgets.Composite($w, SWT.NONE));
        var $gl = layout.GridLayout(3, false);
        $gl.marginWidth = $gl.marginHeight = 0;
        $w.setLayout($gl);
        $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
cmd.w_txt =  /* Text */
        WID(widgets.Text($w, SWT.BORDER | SWT.READ_ONLY));
            $w.setLayoutData(layout.GridData(GD.FILL_HORIZONTAL));
            $w.setForeground(color(SWT.COLOR_DARK_CYAN));
            $w.setBackground(color(SWT.COLOR_WIDGET_BACKGROUND));
        END();
cmd.w_labDone = /* Label */
        WID(widgets.Label($w, SWT.NONE));
            $w.setImage(rsrc.ICO_LIGHT_GREEN);
            $w.setToolTipText('Ready');
        END();
cmd.w_labBusy = /* Label */
        WID(widgets.Label($w, SWT.NONE));
            $w.setLayoutData(layout.GridData(GD.HORIZONTAL_ALIGN_END));
            $w.setImage(rsrc.ICO_LIGHT_GRAY);
            $w.setToolTipText('Busy');
        END();
    END();

    app.w_ctab.setSimple(false);
}

/* ---------------- FUNCTIONS ---------------- */

/*
 *  ======== _deleteDirectory ========
 */
function _deleteDirectory(dir)
{
    var dirFile = java.io.File(dir);
    if (dirFile.exists() && dirFile.isDirectory()) {
        for each (var f in dirFile.listFiles()) {
            if (f.isDirectory() && f.listFiles().length) {
                _deleteDirectory(f);
            }
            try {
                f['delete']();
            }
            catch (e) {
                java.lang.System.err.println("Cannot delete file: " +
                                             f.getCanonicalPath());
            }
        }
        dirFile['delete']();
    }
}

/*
 *  ======== _getPkgInfo ========
 */
function _getPkgInfo(pname) 
{
    if (pkgInfo[pname]) {
        return;
    }
    pkgInfo[pname] = Pkg.getPkg(pkgTab[pname], dirs);
}

/*
 *  ======== _getTabiFileName ========
 */
function _getTabiFileName(tabi)
{
    if (String(tabi.getData('kind')) == 'p') {
        var name = String(tabi.getText());
        return (cacheDir + '/' + name.replace(/\./g, '/') + '/package.html');
    }
    else {
        return (cacheDir + '/' + tabi.getData('href'));
    }
}

/*
 *  ======== _getTabiPackageName ========
 */
function _getTabiPackageName(tabi)
{
    var kind = String(tabi.getData('kind'));
    if (kind == 'p') {
        return (String(tabi.getData('name')));
    }
    else if (kind != 'f') {
        return (String(tabi.getData('pname')));
    }
    else {
        return (null);
    }
}

/*
 *  ======== hideToolTip ========
 */
function hideToolTip(event)
{
    toolTip.setVisible(false);
}

/*
 *  ======== init ========
 */
function init(tabs)
{
    mkControl();
    toolTip = new widgets.ToolTip(app.w_tree .getShell(), SWT.NONE);
    if (!w_shell.isDisposed()) {
        w_shell.open();
    }

    treeBuild();

    /* open initial package tabs (specified on command line) */
    var tabi;
    for (var i = 0; i < tabs.length; i++) {
        var newTab = tabiNewUnit(tabs[i]);
        if (newTab) {
    	    tabi = newTab;
        }
    }
    if (tabi) {
	app.w_ctab.setSelection(tabi);
        var name = String(tabi.getData('name'));
        if (String(tabi.getData('kind')) != 'p') {
            name = tabi.getData('pname') + '.' + name;
        }
        _syncToc(name);
    }
}

/*
 *  ======== _isNodocPkg ========
 */
function _isNodocPkg(pname) 
{
    _getPkgInfo(pname);
    return (pkgInfo[pname] ? pkgInfo[pname].nodoc : true);
}

/*
 *  ======== parseArgs ========
 */
function parseArgs(args, tabs) 
{
    var usage = "usage: xs xdc.tools.cdoc.sg [--help] [unit-name ...] [-Pr repository-path ...]";

    var dirsFlag = false;
    for (var i = 0; dirsFlag == false && i < args.length; i++) {
        if (args[i][0] == '-') {
            switch (args[i]) {
                case "--help": {
                    print(usage);
                    return (false);
                }
                case "-Pr": {
                    dirsFlag = true;
                    break;
                }
                default: {
                    print("unknown option: '" + args[i] + "'");
                    print(usage);
                    return (false);
                }
            }
        }
        else {
            tabs.push(args[i]);
        }
    }

    /* get the list of repositories to search */
    dirs = [];
    for (; i < args.length; i++) {
        try {
            var isDir = java.io.File(args[i]).isDirectory();
        }
        catch (e) {
            var isDir = false;
        }

        if (isDir) {
            dirs.push(args[i]);
        }
        else {
            print("directory not found: " + args[i]);
        }
    }

    /* with no arguments, use the package path */
    if (dirs.length == 0) {
        /* get the list of repositories on the package path */
        var xdcpath = java.lang.System.getProperty("xdc.path") + "";
        xdcpath = xdcpath.split(';');
        for (var i = 0; i < xdcpath.length; i++) {
            if (xdcpath[i]) {
                dirs.push(xdcpath[i]);
            }
        }
    }

    return (true);
}

/*
 *  ======== showBusy ========
 */
function showBusy(msg)
{
    w_shell.setCursor(rsrc.CUR_WAIT);
    cmd.w_labDone.setImage(rsrc.ICO_LIGHT_GRAY);
    cmd.w_labBusy.setImage(rsrc.ICO_LIGHT_RED);
    cmd.w_txt.setText(msg? msg + '...' : '');
    cmd.w_status.update();
}

/*
 *  ======== showDone ========
 */
function showDone()
{
    cmd.w_labDone.setImage(rsrc.ICO_LIGHT_GREEN);
    cmd.w_labBusy.setImage(rsrc.ICO_LIGHT_GRAY);
    cmd.w_txt.setText('');
    w_shell.setCursor(null);
    cmd.w_status.update();
}

/*
 *  ======== showToolTip ========
 */
function showToolTip(event)
{

    var x = event.x;
    var y = event.y;
    var w = event.widget;

    toolTip.setVisible(false);

    var item = w.getItem(Packages.org.eclipse.swt.graphics.Point(x, y));
    if (!item) {
        return;
    }

    if (item.getData('name')) {
        if (String(item.getData('kind')) == 'p') {
            toolTip.setText(item.getData('name'));
            toolTip.setMessage(item.getData('summary'));
        }
        else {
            toolTip.setText(item.getData('pname') + '.' +
                            item.getData('name'));
            toolTip.setMessage(item.getData('summary'));
        }

        var loc = app.w_tree.getDisplay().map(app.w_tree, null, x, y);
        toolTip.setLocation(loc.x, loc.y + 16);
        toolTip.setVisible(true);
    }
}

/*
 *  ======== _syncToc ========
 */
function _syncToc(name)
{
    var nameArr = name.split('.');

    var syncItem = null;
    var ti = app.w_tree;
    for each (var nm in nameArr) {
        for each (var item in ti.getItems()) {
            if (nm == String(item.getText())) {
                _groupTreeExpand(item);
                item.setExpanded(true);
                ti = item;
                syncItem = item;
                break;
            }
        }
    }
    if(syncItem) {
        app.w_tree.setSelection(syncItem);
    }
}

/* ---------------- CONTENT FUNCTIONS ---------------- */

/*
 *  ======== _bldGroups ========
 */
function _bldGroups(pkgTab)
{
    var grpTree = [];

    for (var i = 0; i < pkgTab.length; i++) {
	var pnarr = pkgTab[i].split('.');
	var gtree = grpTree;
	for (var j = 0; j < pnarr.length; j++) {
	    var elem = pnarr[j];
	    if (elem in gtree) {
		gtree = gtree[elem];
	    }
	    else {
		gtree.push(elem);
		gtree = gtree[elem] = [];
	    }
	}
    }
    return (grpTree);
}

/*
 *  ======== _hasDocdPkg ========
 */
function _hasDocdPkg(gtree, pre)
{
    if (gtree.length) {
        for (var i = 0; i < gtree.length; i++) {
	    var elem = gtree[i];
	    if (elem in gtree) {
                var qelem = pre ? (pre + '.' + elem) : elem;
                if (pkgTab[qelem]) {
                    if (!_isNodocPkg(qelem)) {
                        return (true);
                    }
                }
	        if (_hasDocdPkg(gtree[elem], qelem)) {
                    return (true);
                }
	    }
        }
    }
    return (false);
}

/*
 *  ======== _genGroups ========
 */
function _genGroups(gtree, pre, ti)
{
    if (gtree.length) {
        showBusy('getting package info');
        gtree.sort();
        for (var i = 0; i < gtree.length; i++) {
	    var elem = gtree[i];
	    if (elem in gtree) {
                var qelem = pre ? (pre + '.' + elem) : elem;
                var folder = false;
                var pkg = false;
                if (pkgTab[qelem]) {
                    if (_isNodocPkg(qelem)) {
                        if (_hasDocdPkg(gtree[elem], qelem)) {
                            folder = true;
                        }
                    }
                    else {
                        pkg = true;
                    }
                }
                else if (_hasDocdPkg(gtree[elem], qelem)) {
                    folder = true;
                }
                if (pkg) {
                    var ti2 = widgets.TreeItem(ti, SWT.NULL);
                    ti2.setText(elem);
                    ti2.setData('name', qelem);
                    _getPkgInfo(qelem);
                    ti2.setData('summary', pkgInfo[qelem].summary);
                    ti2.setData('kind', 'p');
                    ti2.setImage(rsrc.ICO_PACKAGE);
                    var tidummy = widgets.TreeItem(ti2, SWT.NULL);
                    tidummy.setText('');

                }
                else if (folder) {
                    var ti2 = widgets.TreeItem(ti, SWT.NULL);
                    ti2.setText(elem);
                    ti2.setData('qname', qelem);
                    ti2.setImage(rsrc.ICO_PACKAGES);
                    var tidummy = widgets.TreeItem(ti2, SWT.NULL);
                    tidummy.setText('');
                }
	    }
        }
        showDone();
    }
}

/*
 *  ======== _genPkg ========
 */
function _genPkg( pkgName, genNodocs, getInfo, outdir )
{
    if (pkgName in pkgCache) {
        return;
    }

    showBusy('Processing package ' + pkgName);

    var args = ['-od:' + outdir, '-s'];
    if (genNodocs) {
        args.push('-n');
    }
    args = args.concat('-h', '--quiet', '-P', pkgTab[pkgName]);
    cdocCmd.exec(args);

    if (getInfo) {
        _getPkgInfo(pkgName);
    }
    
    showDone();

    pkgCache[pkgName] = true;

}

/* ---------------- UI FUNCTIONS ---------------- */

/*
 *  ======== uiGoBack ========
 */
function uiGoBack()
{
    var tabi = app.w_ctab.getSelection();
    if (!tabi) {
        return;
    }
    var b = tabi.getControl();
    b.back();
}

/*
 *  ======== uiGoForward ========
 */
function uiGoForward()
{
    var tabi = app.w_ctab.getSelection();
    if (!tabi) {
        return;
    }
    var b = tabi.getControl();
    b.forward();
}

/*
 *  ======== uiToggleNodoc ========
 */
function uiToggleNodoc()
{

    var tabi = app.w_ctab.getSelection();
    if (!tabi || String(tabi.getData('kind')) == 'f') {
        return;
    }
    showBusy();

    var pname = _getTabiPackageName(tabi);
    var fname = _getTabiFileName(tabi);

    var key = pname;
    if (String(tabi.getData('kind')) != 'p') {
        key += '.' + String(tabi.getData('name'));
    }
    var nodoc = !(noDoc[key] == true);

    var tmpdir = String(Packages.xdc.services.global.Host.tmpdir());
     delete pkgCache[pname];
    _genPkg(pname, nodoc, false, tmpdir);

    /* delete old file, rename new to old name */
    java.io.File(fname)['delete']();
    var newfname = tmpdir + fname.substr(cacheDir.length);
    java.io.File(newfname).renameTo(java.io.File(fname));

    tabiUpdate(tabi);
    _deleteDirectory(tmpdir);
    noDoc[key] = nodoc;
    tabi.setData('nodoc', nodoc);
    app.w_btnNodoc.setSelection(nodoc);
    showDone();
}

/*
 *  ======== uiUpdateNav ========
 */
function uiUpdateNav()
{
    var tabi = app.w_ctab.getSelection();
    if (!tabi) {
        app.w_btnBack.setEnabled(false);
        app.w_btnForward.setEnabled(false);
    }
    else {
        var b = tabi.getControl();
        app.w_btnBack.setEnabled(b.isBackEnabled());
        app.w_btnForward.setEnabled(b.isForwardEnabled());
    }
}

/*
 *  ======== uiUpdateNodoc ========
 */
function uiUpdateNodoc()
{
    var tabi = app.w_ctab.getSelection();
    if (!tabi) {
        app.w_btnNodoc.setSelection(false);
    }
    else {
        app.w_btnNodoc.setSelection(tabi.getData('nodoc') == true);
    }
}

/* ---------------- TAB FUNCTIONS ---------------- */

/*
 *  ======== tabiCloseAll ========
 */
function tabiCloseAll()
{
    for each (var ti in app.w_ctab.getItems()) {
        ti.dispose();
    }
}

/*
 *  ======== tabiNew ========
 */
function tabiNew(name, kind, href, pname)
{
    var tabi = custom.CTabItem(app.w_ctab, SWT.NONE);
    tabi.setText(name);
    tabi.setData('name', name);
    tabi.setData('kind', kind);
    tabi.setData('nodoc', false);
    if (kind != 'p') {
        tabi.setData('href', href);
        tabi.setData('pname', pname);
    }
    var b = browser.Browser(app.w_ctab, SWT.NONE);
    b.addLocationListener(new browser.LocationListener({
        changed: function(event) { locationChanged(event); },
        changing: function(event) { locationChanging(event); }
    }));
    tabi.setControl(b);
    tabiUpdate(tabi);
    return (tabi);
}


/*
 *  ======== tabiNewUnit ========
 */
function tabiNewUnit(uname)
{
    if (!pkgTab[uname]) {
        /* try a module */
        var index = uname.lastIndexOf('.');
        if (index > 0) {
            var pname = uname.substring(0, index);
            var mname = uname.substring(index + 1);
            if (pkgTab[pname]) {
                _genPkg(pname, false, true, cacheDir);
                var href = uname.replace(/\./g, '/') + '.html';
                return (tabiNew(mname, 'm', href, pname));
            }
        }
        print("can't find package " + uname);
        return (null);
    }
    return (tabiNew(uname, 'p', null, null));
}

/*
 *  ======== tabiSelected ========
 */
function tabiSelected(event)
{
    uiUpdateNav();
    uiUpdateNodoc();
}

/*
 *  ======== tabiShowItem ========
 */
function tabiShowItem( item )
{
    if (!item.getData('name')) {
        return;
    }

    var name = String(item.getData('name'));

    var tabi = null;

    for (var i = 0; i < app.w_ctab.getItemCount(); i++) {
        var ti = app.w_ctab.getItem(i);
        if (String(ti.getText()) == name) {
            if (String(ti.getData('kind')) == 'p' || 
                (String(ti.getData('pname')) ==
                 String(item.getData('pname')))) {

                tabi = ti;
                break;
            }
        }
    }

    if (!tabi) {
        if (String(item.getData('kind')) == 'p') {
             if (!(name in pkgCache)) {
                _genPkg(name, false, true, cacheDir);
            }
        }
        var kind = String(item.getData('kind'));
        var href = String(item.getData('href'));
        var pname = (item.getData('kind') != 'p') ?
                    String(item.getData('pname')) : null;
        tabi = tabiNew(name, kind, href, pname);
    }
    app.w_ctab.setSelection(tabi);
    uiUpdateNodoc();
}

/*
 *  ======== tabiUpdate ========
 */
function tabiUpdate(tabi)
{
    var url = java.io.File(_getTabiFileName(tabi)).toURL();
    tabi.getControl().setUrl(url);
}

/* ---------------- TREE FUNCTIONS ---------------- */

/*
 *  ======== _allPkgsTreeExpand ========
 */
function _allPkgsTreeExpand(ti)
{
    if (ti.getItemCount() == 1 && String(ti.getItem(0).getText()) == '') {
        ti.removeAll();
        if (ti == tiAllPkgs) {
            showBusy('getting packages info');
            for (var i = 0; i < pkgTab.length; i++) {
                var pname = pkgTab[i];
                if (!_isNodocPkg(pname)) {
                    var ti2 = widgets.TreeItem(tiAllPkgs, SWT.NULL);
                    ti2.setText(pname);
                    ti2.setData('name', pname);
                    ti2.setData('summary', pkgInfo[pname].summary);
                    ti2.setData('kind', 'p');
                    ti2.setImage(rsrc.ICO_PACKAGE);
                    var pkg = pkgInfo[pname];
                    if (pkg && pkg.units && pkg.units.length) {
                        var tidummy = widgets.TreeItem(ti2, SWT.NULL);
                        tidummy.setText('');
                    }
                }
            }
            showDone();
        }
        else {  /* is a package */
            _pkgItemExpand(ti, String(ti.getData('name')));
        }
    }
}

/*
 *  ======== _pkgItemExpand ========
 */
function _pkgItemExpand(ti, pname)
{
    var pkg = pkgInfo[pname];
    if (pkg && pkg.units && pkg.units.length && !_hasUnits(ti)) {

         for (var i = 0; i < pkg.units.length; i++) {
            var ti2 = widgets.TreeItem(ti, SWT.NULL);
            ti2.setText(pkg.units[i].name);
            ti2.setData('name', pkg.units[i].name);
            ti2.setData('href', pkg.units[i].href);
            ti2.setData('summary', pkg.units[i].summary);
            ti2.setData('pname', pkg.name);
            if (pkg.units[i].kind == 'module') {
                ti2.setData('kind', 'm');
                if (pkg.units[i].meta) {
                    ti2.setImage(rsrc.ICO_METAMODULE);
                }
                else {
                    ti2.setImage(rsrc.ICO_MODULE);
                }
            }
            else {
                ti2.setData('kind', 'i');
                if (pkg.units[i].meta) {
                    ti2.setImage(rsrc.ICO_METAINTERFACE);
                }
                else {
                    ti2.setImage(rsrc.ICO_INTERFACE);
                }
            }
        }
    }
}

/*
 *  ======== treeBuild ========
 */
function treeBuild()
{
    showBusy('finding packages');

    pkgTab = Pkg.search(dirs, showBusy);

    tiAllPkgs = widgets.TreeItem(app.w_tree, SWT.NULL);
    tiAllPkgs.setText('all packages');
    tiAllPkgs.setImage(rsrc.ICO_PACKAGES);
    var tidummy = widgets.TreeItem(tiAllPkgs, SWT.NULL);
    tidummy.setText('');

    grpTree = _bldGroups(pkgTab);
    _genGroups(grpTree, '', app.w_tree);
    app.w_tree.update();

    showDone();
}

/*
 *  ======== treeCollapse ========
 */
function treeCollapse()
{
    for (var i = 0; i < app.w_tree.getItemCount(); i++) {
        app.w_tree.getItem(i).setExpanded(false);
    }
}

/*
 *  ======== treeDoubleClick ========
 */
function treeDoubleClick(event)
{
    var item = event.widget.getItem(new graphics.Point(event.x, event.y));
    if (!item) {
        return;
    }
    tabiShowItem(item);
}

/*
 *  ======== _hasUnits ========
 */
function _hasUnits(item)
{
    for each (var i in item.getItems()) {
        var kind = String(i.getData('kind'));
        if (kind == 'm' || kind == 'i') {
            return (true);
        }
    }
    return (false);
}


/*
 *  ======== treeExpanded ========
 */
function treeExpanded(e)
{
    if (e.item == tiAllPkgs || e.item.getParentItem() == tiAllPkgs) {
        _allPkgsTreeExpand(e.item);
    }
    else {
        _groupTreeExpand(e.item);
    }
}

/*
 *  ======== _groupTreeExpand ========
 */
function _groupTreeExpand(ti)
{
    if (ti.getItemCount() == 1 && String(ti.getItem(0).getText()) == '') {

        ti.removeAll();
        var kind = String(ti.getData('kind'));
        var name = (kind == 'p') ? String(ti.getData('name')) :
                                   String(ti.getData('qname'));
        var gtree = grpTree;
        if (name.indexOf('.') != -1) {
            var nameArr = name.split('.');
            for (var i = 0; i < nameArr.length; i++ ) {
                gtree = gtree[nameArr[i]];
            }
        }
        else {
            gtree = gtree[name];
        }
        _genGroups(gtree, name, ti);
        if (kind == 'p') {
            showBusy('getting package info');           
            _getPkgInfo(name);
            _pkgItemExpand(ti, name);
            showDone();           
        }
    }
}

/*
 *  ======== treeKeyDown ========
 */
function treeKeyDown(event)
{
    if (event.character != SWT.CR) {
        return;
    }

    var selection = event.widget.getSelection();
    if (selection.length == 0) {
        return;
    }
    tabiShowItem(selection[0]);
}

/* ---------------- BROWSER FUNCTIONS ---------------- */

/*
 *  ======== locationChanged ========
 */
function locationChanged(event)
{
    var tabi = app.w_ctab.getSelection(); 
    var loc = String(event.location).replace(/\\/g, '/');
    var url = loc.replace(cacheDir, '@');
    url = url.substring(url.indexOf('@') + 2);
    var file = url.substring(url.lastIndexOf('/') + 1);
    if (file.indexOf('#') != -1) {
        file = file.substr(0, file.indexOf('#'));
    }
    url = url.substring(0, url.lastIndexOf('/'));
    var pn = url.replace(/\//g, '.');
    if (!(pn in pkgTab)) {
        tabi.setText(loc.substring(loc.lastIndexOf('/') + 1));
        tabi.setData('kind', 'f');
        tabi.setData('href', loc);
        uiUpdateNav();
        return;
    }

    var curfile = '';
    var curpn = '';
    if(String(tabi.getData('kind')) == 'p') {
        curfile = 'package.html';
        curpn = String(tabi.getData('name'));
    }
    else {
        curpn = String(tabi.getData('pname'));
        curfile = String(tabi.getData('href'));
        curfile = curfile.substring(curfile.lastIndexOf('/') + 1);
    }

    var setData = false;
    if (pn == curpn) {
        if (file != curfile) {
            setData = true;
        }
    }
    else {
        setData = true;
    }
    if (setData) {
        if (file == 'package.html') {
            tabi.setText(pn);
            tabi.setData('name', pn);
            tabi.setData('kind', 'p');
            var nodoc = (noDoc[pn] == true);
            tabi.setData('nodoc', nodoc);
            app.w_btnNodoc.setSelection(nodoc);
        }
        else {
            var pkg = pkgInfo[pn];
            if (pkg && pkg.units) {
                    var unit = file.substr(0, file.lastIndexOf('.'));
                    for (var i = 0; i < pkg.units.length; i++) {
                        if (unit == pkg.units[i].name) {
                            tabi.setText(unit);
                            tabi.setData('name', unit);
                            if (pkg.units[i].kind == 'module') {
                                tabi.setData('kind', 'm');
                            }
                            else {
                                tabi.setData('kind', 'i');
                            }
                            tabi.setData('href', pkg.units[i].href);
                            tabi.setData('pname', pn);
                            var nodoc = (noDoc[pn + '.' + unit] == true);
                            tabi.setData('nodoc', nodoc);
                            app.w_btnNodoc.setSelection(nodoc);
                        }
                    }
            }
        }
        uiUpdateNav();
    }
}

/*
 *  ======== locationChanging ========
 */
function locationChanging( event )
{
    var url = String(event.location).replace(/\\/g, '/');
    if (java.io.File(url).exists() ||
        java.io.File(url.replace(/^file:/, '')).exists()) {

        return;
    }
    url = url.replace(cacheDir, '@');
    url = url.substring(url.indexOf('@') + 2);
    url = url.substring(0, url.lastIndexOf('/'));
    var pn = url.replace(/\//g, '.');
    if (!(pn in pkgTab)) {
        event.doit = false;
        return;
    }
    _genPkg(pn, false, true, cacheDir);
}

/* ---------------- EXTERNAL FUNCTIONS ---------------- */

/*
 *  ======== main ========
 */
function main(args)
{
    try {
        var tabs = [];
        if (parseArgs(args, tabs) == false) {
            return;
        }

        w_display = widgets.Display();
        mkResources();

        w_shell = new widgets.Shell(w_display, SWT.SHELL_TRIM);
        w_shell.setLayout(layout.GridLayout());
        w_shell.setText('cdoc'); 
        w_shell.setImage(rsrc.ICO_SOG);
        w_shell.setSize(800, 600);

        cacheDir = String(Packages.xdc.services.global.Host.tmpdir());

        init(tabs);

        w_shell.setFocus();
        while (!w_shell.isDisposed()) {
            if (!w_display.readAndDispatch()) {
                w_display.sleep();
            }
        }
    }
    finally {
        if (cacheDir != '') {
            _deleteDirectory(cacheDir);
        }
        if (w_display) {
            w_display.dispose();
        }
    }
}

/*
 *  @(#) xdc.tools.cdoc.sg; 1,0,0,0; 11-8-2017 17:13:42; /db/ztree/library/trees/xdc/xdc-D20.1/src/packages/
 */

