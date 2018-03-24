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


var graphics;
var layout;
var widgets;
var SWT;
var swtInited = false;
var os = String(java.lang.System.getProperty('os.name'));
var isWin = (os.match(/^Windows/i) != null);
var dlgWidth = isWin ? 280 : 345;
var dlgHeight = isWin ? 279 : 369;

/*
 *  ======== _initSWT ========
 */
function _initSWT()
{
    graphics = xdc.jre.org.eclipse.swt.graphics;
    layout = xdc.jre.org.eclipse.swt.layout;
    widgets = xdc.jre.org.eclipse.swt.widgets;
    SWT = xdc.jre.org.eclipse.swt.SWT;
}

/*
 *  ======== selectColumnsDlg ========
 */
function selectColumnsDlg(display, shell, columns, selections)
{
    if (!swtInited) {
        _initSWT();
        swtInited = true;
    }

    var retMap = [];

    var dlg = widgets.Shell(shell, SWT.DIALOG_TRIM|SWT.APPLICATION_MODAL);
    dlg.setLayout(layout.GridLayout());
    dlg.setSize(dlgWidth, dlgHeight);
    dlg.setText('Show Columns');

    var comp = widgets.Composite(dlg, SWT.NONE); 
    var compLayout = layout.GridLayout();
    compLayout.numColumns = 1;   
    comp.setLayout(compLayout);
    comp.setLayoutData(layout.GridData(layout.GridData.FILL_BOTH));

    var label = widgets.Label(comp, SWT.NONE);
    label.setText("Select columns to display in the Packages table:");

    table = widgets.Table(comp,
            SWT.SINGLE|SWT.CHECK|SWT.BORDER|SWT.V_SCROLL);
    var gridDataStretch = layout.GridData(layout.GridData.FILL_HORIZONTAL);
    table.setLayoutData(gridDataStretch);

    for (var i = 0; i < columns.length; i++) {
        var item = widgets.TableItem(table, 0);
        item.setText (columns[i]);
        if (i == 0) {
            item.setGrayed(true);
        }
        for (var j = 0; j < selections.length; j++) {
            if (i == selections[j]) {
                item.setChecked(true);
            }
        }
    }

    var btnComposite = widgets.Composite(comp, SWT.NONE); 
    var btnLayout = layout.GridLayout();
    btnLayout.numColumns = 2;   
    btnComposite.setLayout(btnLayout);
    btnComposite.setLayoutData(layout.GridData(SWT.CENTER, SWT.CENTER, true, true));

    var okBtn = widgets.Button(btnComposite, SWT.PUSH|SWT.DEFAULT);
    okBtn.setText ("OK");
    okBtn.addListener(SWT.Selection, function() {
        retMap = _getSelections(table);
        dlg.dispose();
    });

    var cancelBtn = widgets.Button(btnComposite, SWT.PUSH);
    cancelBtn.setText ("Cancel");
    cancelBtn.addListener(SWT.Selection, function() { 
        retMap = [];
        dlg.dispose();
    });

    dlg.open();
    while (!dlg.isDisposed()) {
        if (!display.readAndDispatch()) {
            display.sleep();
        }
    }
    return (retMap);
}

/*
 *  ======== _getSelections ========
 */
function _getSelections(table)
{
    var selArr = [];
    for (var i = 0; i < table.getItemCount(); i++) {
        var item = table.getItem(i);
        if (item.getGrayed() || item.getChecked()) {
            selArr.push(i);
        }
    }
    return (selArr);
}
/*
 *  @(#) xdc.tools.path.sg; 1, 0, 0,0; 1-9-2017 12:51:42; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

