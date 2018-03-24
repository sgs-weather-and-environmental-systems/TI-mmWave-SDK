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

var desc = "A target module wraps a code generation tool chain for use " +
    "in XDC. By choosing a target you choose the family of " +
    "devices to build your project for, and fix major tool chain " +
    "settings such as device endianness and memory model.";

function init(parent, params) {
    var self = this;
    this.db = params.db;
    this.$public.name = "Target";
    this.$public.title = "Choose target to build project for";

    with (Gui) {
        WID(parent);
            GRID();
                $w.setLayoutData(GD(GD.FILL_BOTH));
                LBL(desc, Gui.SWT.WRAP, 20);
this.comp =     GRID(2);
                    $w.setLayoutData(GD(GD.FILL_BOTH));
                    LBL("Instruction set architecture:");
this.isa =          widgets.Combo($w, SWT.DROP_DOWN|SWT.READ_ONLY);
                    this.isa.addListener(SWT.Selection, function () {
                        updateTargetMenu.call(self);
                    });
                    this.isa.setLayoutData(GD(GD.FILL_HORIZONTAL));
                    LBL("Target:");
this.target =       widgets.Combo($w, SWT.DROP_DOWN|SWT.READ_ONLY);
                    this.target.setLayoutData(GD(GD.FILL_HORIZONTAL));
                END();
                $w.addListener(SWT.Paint, function() {
                    updateIsaMenu.call(self);
                });
            END();
        END();
    }
}

function pathHasChanged() {
    return this.path != this.db.getPath();
}

function getTargetModules() {
    if (this.targets && !pathHasChanged.call(this)) {
        return this.targetMods;
    }

    this.path = this.db.getPath();

    var units = this.db.getUnits("xdc.bld.ITarget");
    var targetMods = [];
    for (var i=0; i<units.size(); i++) {
        var unit = units.get(i);
        if (unit.isMod()) {
            targetMods.push(unit);
        }
    }

    return this.targetMods = targetMods;
}

function sortTargets() {
    if (this.isas && !pathHasChanged.call(this)) {
        return;
    }

    var mods = getTargetModules.call(this);

    var isaNames = [];
    var targetNames = [];
    var targetNamesByIsa = {};

    for (var i = 0; i < mods.length; i++) {
        /* get the module and its name */
        var mod = mods[i];
        var modName = mod.getQualName()+'';
        targetNames.push(modName);

        /* find all the "isa" decls -- may include overrides */
        var decls = mod.getDecls();
        var isaDecls = [];
        var isOver = {};
        for (var j = 0; j < decls.size(); j++) {
            var decl = decls.get(j);
            if (decl.getName() == 'isa') {
                isaDecls.push(decl);
                if (decl.overrides()) {
                    isOver[decl.overrides()] = true;
                }
            }
        }

        /* find the one that wasn't overridden */
        for (var j = 0; j<isaDecls.length; j++) {
            var isaDecl = isaDecls[j];
            if (!isOver[isaDecl]) {
                break;
            }
        }

        var isaInit = isaDecl.getInit();
        if (isaInit) {
            var quotes = Packages.xdc.services.spec.Expr.toText(isaInit)+'';
            var isaName = quotes.replace(/"/g,'');
            if (!isaNames[quotes]) {
                isaNames[quotes]=true;
                isaNames.push(isaName);
                targetNamesByIsa[isaName] = [modName];
            }
            else {
                targetNamesByIsa[isaName].push(modName);
            }
        }

    }

    this.isaNames = isaNames.sort();
    this.targetNames = targetNames.sort();
    for (var i = 0; i < isaNames.length; i++) {
        targetNamesByIsa[isaNames[i]].sort();
    }
    this.targetNamesByIsa = targetNamesByIsa;
}

function updateIsaMenu() {
    var isaNames = this.isaNames;
    var needsUpdate = !isaNames || pathHasChanged.call(this);
    if (!needsUpdate) {
        return;
    }

    sortTargets.call(this);
    isaNames = this.isaNames;

    this.isa.removeAll();
    this.isa.add("Any");
    for (var i = 0; i < isaNames.length; i++) {
        this.isa.add(isaNames[i]);
    }
    this.isa.select(0);

    updateTargetMenu.call(this);
}

function updateTargetMenu() {
    targetNames = this.targetNames;

    var isaIndex = this.isa.getSelectionIndex();
    if (isaIndex < 0) {
        isaIndex = 0;
    }

    if (isaIndex != 0) {
        var isaName = this.isa.getItem(isaIndex);
        targetNames = this.targetNamesByIsa[isaName];
    }

    this.target.removeAll();
    for (var i = 0; i < targetNames.length; i++) {
        this.target.add(targetNames[i]);
    }
    this.target.select(0);
}
/*
 *  @(#) xdc.tools.configuro.sg; 1,0,0,0; 1-9-2017 12:51:24; /db/ztree/library/trees/xdctools/xdctools-h00/src/
 */

