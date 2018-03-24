/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D05
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class ti_catalog_arm_cortexa15
{
    static final String VERS = "@(#) xdc-D05\n";

    static final Proto.Elm $$T_Bool = Proto.Elm.newBool();
    static final Proto.Elm $$T_Num = Proto.Elm.newNum();
    static final Proto.Elm $$T_Str = Proto.Elm.newStr();
    static final Proto.Elm $$T_Obj = Proto.Elm.newObj();

    static final Proto.Fxn $$T_Met = new Proto.Fxn(null, null, 0, -1, false);
    static final Proto.Map $$T_Map = new Proto.Map($$T_Obj);
    static final Proto.Arr $$T_Vec = new Proto.Arr($$T_Obj);

    static final XScriptO $$DEFAULT = Value.DEFAULT;
    static final Object $$UNDEF = Undefined.instance;

    static final Proto.Obj $$Package = (Proto.Obj)Global.get("$$Package");
    static final Proto.Obj $$Module = (Proto.Obj)Global.get("$$Module");
    static final Proto.Obj $$Instance = (Proto.Obj)Global.get("$$Instance");
    static final Proto.Obj $$Params = (Proto.Obj)Global.get("$$Params");

    static final Object $$objFldGet = Global.get("$$objFldGet");
    static final Object $$objFldSet = Global.get("$$objFldSet");
    static final Object $$proxyGet = Global.get("$$proxyGet");
    static final Object $$proxySet = Global.get("$$proxySet");
    static final Object $$delegGet = Global.get("$$delegGet");
    static final Object $$delegSet = Global.get("$$delegSet");

    Scriptable xdcO;
    Session ses;
    Value.Obj om;

    boolean isROV;
    boolean isCFG;

    Proto.Obj pkgP;
    Value.Obj pkgV;

    ArrayList<Object> imports = new ArrayList<Object>();
    ArrayList<Object> loggables = new ArrayList<Object>();
    ArrayList<Object> mcfgs = new ArrayList<Object>();
    ArrayList<Object> icfgs = new ArrayList<Object>();
    ArrayList<String> inherits = new ArrayList<String>();
    ArrayList<Object> proxies = new ArrayList<Object>();
    ArrayList<Object> sizes = new ArrayList<Object>();
    ArrayList<Object> tdefs = new ArrayList<Object>();

    void $$IMPORTS()
    {
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.peripherals.hdvicp2");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "ti.catalog");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.arm.cortexa15", new Value.Obj("ti.catalog.arm.cortexa15", pkgP));
    }

    void OMAP5430$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.OMAP5430.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arm.cortexa15.OMAP5430", new Value.Obj("ti.catalog.arm.cortexa15.OMAP5430", po));
        pkgV.bind("OMAP5430", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arm.cortexa15.OMAP5430.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.OMAP5430$$Object", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.OMAP5430.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.OMAP5430$$Params", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.OMAP5430.Params", new Proto.Str(po, true));
    }

    void Vayu$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.Vayu.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arm.cortexa15.Vayu", new Value.Obj("ti.catalog.arm.cortexa15.Vayu", po));
        pkgV.bind("Vayu", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arm.cortexa15.Vayu.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.Vayu$$Object", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.Vayu.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.Vayu$$Params", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.Vayu.Params", new Proto.Str(po, true));
    }

    void DRA7XX$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.DRA7XX.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arm.cortexa15.DRA7XX", new Value.Obj("ti.catalog.arm.cortexa15.DRA7XX", po));
        pkgV.bind("DRA7XX", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arm.cortexa15.DRA7XX.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.DRA7XX$$Object", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.DRA7XX.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.DRA7XX$$Params", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.DRA7XX.Params", new Proto.Str(po, true));
    }

    void ITCI663X$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.ITCI663X.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arm.cortexa15.ITCI663X", new Value.Obj("ti.catalog.arm.cortexa15.ITCI663X", po));
        pkgV.bind("ITCI663X", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arm.cortexa15.ITCI663X.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.ITCI663X$$Object", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.ITCI663X.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.ITCI663X$$Params", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.ITCI663X.Params", new Proto.Str(po, true));
    }

    void C66AK2E05$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.C66AK2E05.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arm.cortexa15.C66AK2E05", new Value.Obj("ti.catalog.arm.cortexa15.C66AK2E05", po));
        pkgV.bind("C66AK2E05", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arm.cortexa15.C66AK2E05.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.C66AK2E05$$Object", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.C66AK2E05.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.C66AK2E05$$Params", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.C66AK2E05.Params", new Proto.Str(po, true));
    }

    void TCI6630K2L$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6630K2L.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6630K2L", new Value.Obj("ti.catalog.arm.cortexa15.TCI6630K2L", po));
        pkgV.bind("TCI6630K2L", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arm.cortexa15.TCI6630K2L.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6630K2L$$Object", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.TCI6630K2L.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6630K2L$$Params", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.TCI6630K2L.Params", new Proto.Str(po, true));
    }

    void TCI6636K2H$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6636K2H.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6636K2H", new Value.Obj("ti.catalog.arm.cortexa15.TCI6636K2H", po));
        pkgV.bind("TCI6636K2H", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arm.cortexa15.TCI6636K2H.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6636K2H$$Object", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.TCI6636K2H.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6636K2H$$Params", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.TCI6636K2H.Params", new Proto.Str(po, true));
    }

    void TCI6638K2K$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6638K2K.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6638K2K", new Value.Obj("ti.catalog.arm.cortexa15.TCI6638K2K", po));
        pkgV.bind("TCI6638K2K", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arm.cortexa15.TCI6638K2K.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6638K2K$$Object", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.TCI6638K2K.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI6638K2K$$Params", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.TCI6638K2K.Params", new Proto.Str(po, true));
    }

    void TCI66AK2G02$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02", new Value.Obj("ti.catalog.arm.cortexa15.TCI66AK2G02", po));
        pkgV.bind("TCI66AK2G02", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02$$Object", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02$$Params", new Proto.Obj());
        om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02.Params", new Proto.Str(po, true));
    }

    void OMAP5430$$CONSTS()
    {
        // module OMAP5430
    }

    void Vayu$$CONSTS()
    {
        // module Vayu
    }

    void DRA7XX$$CONSTS()
    {
        // module DRA7XX
    }

    void ITCI663X$$CONSTS()
    {
        // interface ITCI663X
    }

    void C66AK2E05$$CONSTS()
    {
        // module C66AK2E05
    }

    void TCI6630K2L$$CONSTS()
    {
        // module TCI6630K2L
    }

    void TCI6636K2H$$CONSTS()
    {
        // module TCI6636K2H
    }

    void TCI6638K2K$$CONSTS()
    {
        // module TCI6638K2K
    }

    void TCI66AK2G02$$CONSTS()
    {
        // module TCI66AK2G02
    }

    void OMAP5430$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.OMAP5430$$create", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Module", "ti.catalog.arm.cortexa15"), om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Instance", "ti.catalog.arm.cortexa15"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$OMAP5430$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.OMAP5430'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arm.cortexa15.OMAP5430.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arm.cortexa15']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.hdvicp0 = __mod.PARAMS.hdvicp0;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.OMAP5430$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Module", "ti.catalog.arm.cortexa15"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430$$Object", "ti.catalog.arm.cortexa15"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$OMAP5430$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.OMAP5430'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.hdvicp0 = __mod.PARAMS.hdvicp0;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Vayu$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.Vayu$$create", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.Vayu.Module", "ti.catalog.arm.cortexa15"), om.findStrict("ti.catalog.arm.cortexa15.Vayu.Instance", "ti.catalog.arm.cortexa15"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.Vayu.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$Vayu$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.Vayu'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arm.cortexa15.Vayu.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arm.cortexa15']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.hdvicp0 = __mod.PARAMS.hdvicp0;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.Vayu$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.Vayu.Module", "ti.catalog.arm.cortexa15"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arm.cortexa15.Vayu$$Object", "ti.catalog.arm.cortexa15"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.Vayu.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$Vayu$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.Vayu'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.hdvicp0 = __mod.PARAMS.hdvicp0;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void DRA7XX$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.DRA7XX$$create", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Module", "ti.catalog.arm.cortexa15"), om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Instance", "ti.catalog.arm.cortexa15"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$DRA7XX$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.DRA7XX'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arm.cortexa15.DRA7XX.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arm.cortexa15']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.hdvicp0 = __mod.PARAMS.hdvicp0;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.DRA7XX$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Module", "ti.catalog.arm.cortexa15"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX$$Object", "ti.catalog.arm.cortexa15"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$DRA7XX$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.DRA7XX'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("__inst.hdvicp0 = __mod.PARAMS.hdvicp0;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void ITCI663X$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void C66AK2E05$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.C66AK2E05$$create", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Module", "ti.catalog.arm.cortexa15"), om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Instance", "ti.catalog.arm.cortexa15"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$C66AK2E05$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.C66AK2E05'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arm.cortexa15.C66AK2E05.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arm.cortexa15']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.C66AK2E05$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Module", "ti.catalog.arm.cortexa15"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05$$Object", "ti.catalog.arm.cortexa15"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$C66AK2E05$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.C66AK2E05'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TCI6630K2L$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.TCI6630K2L$$create", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Module", "ti.catalog.arm.cortexa15"), om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Instance", "ti.catalog.arm.cortexa15"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$TCI6630K2L$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.TCI6630K2L'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arm.cortexa15.TCI6630K2L.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arm.cortexa15']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.TCI6630K2L$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Module", "ti.catalog.arm.cortexa15"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L$$Object", "ti.catalog.arm.cortexa15"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$TCI6630K2L$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.TCI6630K2L'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TCI6636K2H$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.TCI6636K2H$$create", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Module", "ti.catalog.arm.cortexa15"), om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Instance", "ti.catalog.arm.cortexa15"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$TCI6636K2H$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.TCI6636K2H'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arm.cortexa15.TCI6636K2H.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arm.cortexa15']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.TCI6636K2H$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Module", "ti.catalog.arm.cortexa15"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H$$Object", "ti.catalog.arm.cortexa15"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$TCI6636K2H$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.TCI6636K2H'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TCI6638K2K$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.TCI6638K2K$$create", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Module", "ti.catalog.arm.cortexa15"), om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Instance", "ti.catalog.arm.cortexa15"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$TCI6638K2K$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.TCI6638K2K'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arm.cortexa15.TCI6638K2K.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arm.cortexa15']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.TCI6638K2K$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Module", "ti.catalog.arm.cortexa15"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K$$Object", "ti.catalog.arm.cortexa15"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$TCI6638K2K$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.TCI6638K2K'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void TCI66AK2G02$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02$$create", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Module", "ti.catalog.arm.cortexa15"), om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Instance", "ti.catalog.arm.cortexa15"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$TCI66AK2G02$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.TCI66AK2G02'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arm.cortexa15.TCI66AK2G02.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arm.cortexa15']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Module", "ti.catalog.arm.cortexa15"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02$$Object", "ti.catalog.arm.cortexa15"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Params", "ti.catalog.arm.cortexa15"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arm$cortexa15$TCI66AK2G02$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arm.cortexa15.TCI66AK2G02'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {revision:revision});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.cpuCore = __mod.PARAMS.cpuCore;\n");
            sb.append("__inst.cpuCoreRevision = __mod.PARAMS.cpuCoreRevision;\n");
            sb.append("__inst.minProgUnitSize = __mod.PARAMS.minProgUnitSize;\n");
            sb.append("__inst.minDataUnitSize = __mod.PARAMS.minDataUnitSize;\n");
            sb.append("__inst.dataWordSize = __mod.PARAMS.dataWordSize;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceHeader = __mod.PARAMS.deviceHeader;\n");
            sb.append("__inst.isa = __mod.PARAMS.isa;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void OMAP5430$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Vayu$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void DRA7XX$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ITCI663X$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void C66AK2E05$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TCI6630K2L$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TCI6636K2H$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TCI6638K2K$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TCI66AK2G02$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void OMAP5430$$SIZES()
    {
    }

    void Vayu$$SIZES()
    {
    }

    void DRA7XX$$SIZES()
    {
    }

    void ITCI663X$$SIZES()
    {
    }

    void C66AK2E05$$SIZES()
    {
    }

    void TCI6630K2L$$SIZES()
    {
    }

    void TCI6636K2H$$SIZES()
    {
    }

    void TCI6638K2K$$SIZES()
    {
    }

    void TCI66AK2G02$$SIZES()
    {
    }

    void OMAP5430$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arm/cortexa15/OMAP5430.xs");
        om.bind("ti.catalog.arm.cortexa15.OMAP5430$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Module", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.OMAP5430.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430$$create", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$OMAP5430$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430$$construct", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$OMAP5430$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.OMAP5430$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.OMAP5430$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.OMAP5430$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.OMAP5430$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Instance", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.OMAP5430.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("hdvicp0", (Proto)om.findStrict("ti.catalog.peripherals.hdvicp2.HDVICP2.Instance", "ti.catalog.arm.cortexa15"), $$UNDEF, "wh");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{Global.newArray(new Object[]{"SRAM", Global.newObject("comment", "On-Chip SRAM", "name", "SRAM", "base", 0x402F0000L, "len", 0x00008000L, "space", "code/data", "access", "RWX")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430$$Params", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.OMAP5430.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("hdvicp0", (Proto)om.findStrict("ti.catalog.peripherals.hdvicp2.HDVICP2.Instance", "ti.catalog.arm.cortexa15"), $$UNDEF, "wh");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{Global.newArray(new Object[]{"SRAM", Global.newObject("comment", "On-Chip SRAM", "name", "SRAM", "base", 0x402F0000L, "len", 0x00008000L, "space", "code/data", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430$$Object", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.OMAP5430.Object", om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Instance", "ti.catalog.arm.cortexa15"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
    }

    void Vayu$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arm/cortexa15/Vayu.xs");
        om.bind("ti.catalog.arm.cortexa15.Vayu$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.Vayu.Module", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.Vayu.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.Vayu$$create", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$Vayu$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.Vayu$$construct", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$Vayu$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.Vayu$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.Vayu$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.Vayu$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.Vayu$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.Vayu.Instance", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.Vayu.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("hdvicp0", (Proto)om.findStrict("ti.catalog.peripherals.hdvicp2.HDVICP2.Instance", "ti.catalog.arm.cortexa15"), $$UNDEF, "wh");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{Global.newArray(new Object[]{"SRAM", Global.newObject("comment", "On-Chip SRAM", "name", "SRAM", "base", 0x402F0000L, "len", 0x00008000L, "space", "code/data", "access", "RWX")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.Vayu$$Params", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.Vayu.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("hdvicp0", (Proto)om.findStrict("ti.catalog.peripherals.hdvicp2.HDVICP2.Instance", "ti.catalog.arm.cortexa15"), $$UNDEF, "wh");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{Global.newArray(new Object[]{"SRAM", Global.newObject("comment", "On-Chip SRAM", "name", "SRAM", "base", 0x402F0000L, "len", 0x00008000L, "space", "code/data", "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.Vayu$$Object", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.Vayu.Object", om.findStrict("ti.catalog.arm.cortexa15.Vayu.Instance", "ti.catalog.arm.cortexa15"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
    }

    void DRA7XX$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arm/cortexa15/DRA7XX.xs");
        om.bind("ti.catalog.arm.cortexa15.DRA7XX$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Module", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.DRA7XX.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX$$create", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$DRA7XX$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX$$construct", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$DRA7XX$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.DRA7XX$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.DRA7XX$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.DRA7XX$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.DRA7XX$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Instance", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.DRA7XX.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("hdvicp0", (Proto)om.findStrict("ti.catalog.peripherals.hdvicp2.HDVICP2.Instance", "ti.catalog.arm.cortexa15"), $$UNDEF, "wh");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{Global.newArray(new Object[]{"SRAM", Global.newObject("comment", "On-Chip SRAM", "name", "SRAM", "base", 0x402F0000L, "len", 0x00010000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"OCMC_RAM1", Global.newObject("comment", "OCMC (On-chip RAM) Bank 1 (512KB)", "name", "OCMC_RAM1", "base", 0x40300000L, "len", 0x00080000L)}), Global.newArray(new Object[]{"OCMC_RAM2", Global.newObject("comment", "OCMC (On-chip RAM) Bank 2 (1MB)", "name", "OCMC_RAM2", "base", 0x40400000L, "len", 0x00100000L)}), Global.newArray(new Object[]{"OCMC_RAM3", Global.newObject("comment", "OCMC (On-chip RAM) Bank 3 (1MB)", "name", "OCMC_RAM3", "base", 0x40500000L, "len", 0x00100000L)})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX$$Params", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.DRA7XX.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("hdvicp0", (Proto)om.findStrict("ti.catalog.peripherals.hdvicp2.HDVICP2.Instance", "ti.catalog.arm.cortexa15"), $$UNDEF, "wh");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{Global.newArray(new Object[]{"SRAM", Global.newObject("comment", "On-Chip SRAM", "name", "SRAM", "base", 0x402F0000L, "len", 0x00010000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"OCMC_RAM1", Global.newObject("comment", "OCMC (On-chip RAM) Bank 1 (512KB)", "name", "OCMC_RAM1", "base", 0x40300000L, "len", 0x00080000L)}), Global.newArray(new Object[]{"OCMC_RAM2", Global.newObject("comment", "OCMC (On-chip RAM) Bank 2 (1MB)", "name", "OCMC_RAM2", "base", 0x40400000L, "len", 0x00100000L)}), Global.newArray(new Object[]{"OCMC_RAM3", Global.newObject("comment", "OCMC (On-chip RAM) Bank 3 (1MB)", "name", "OCMC_RAM3", "base", 0x40500000L, "len", 0x00100000L)})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX$$Object", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.DRA7XX.Object", om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Instance", "ti.catalog.arm.cortexa15"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
    }

    void ITCI663X$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arm/cortexa15/ITCI663X.xs");
        om.bind("ti.catalog.arm.cortexa15.ITCI663X$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Module", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.ITCI663X.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.ITCI663X$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.ITCI663X$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.ITCI663X$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.ITCI663X$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Instance", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.ITCI663X.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.ITCI663X$$Params", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.ITCI663X.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{}), "wh");
    }

    void C66AK2E05$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Module", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.C66AK2E05.Module", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Module", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05$$create", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$C66AK2E05$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05$$construct", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$C66AK2E05$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Instance", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.C66AK2E05.Instance", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Instance", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05$$Params", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.C66AK2E05.Params", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X$$Params", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05$$Object", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.C66AK2E05.Object", om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Instance", "ti.catalog.arm.cortexa15"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), $$UNDEF);
    }

    void TCI6630K2L$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Module", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6630K2L.Module", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Module", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L$$create", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$TCI6630K2L$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L$$construct", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$TCI6630K2L$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Instance", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6630K2L.Instance", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Instance", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L$$Params", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6630K2L.Params", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X$$Params", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L$$Object", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6630K2L.Object", om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Instance", "ti.catalog.arm.cortexa15"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), $$UNDEF);
    }

    void TCI6636K2H$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arm/cortexa15/TCI6636K2H.xs");
        om.bind("ti.catalog.arm.cortexa15.TCI6636K2H$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Module", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6636K2H.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H$$create", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$TCI6636K2H$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H$$construct", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$TCI6636K2H$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.TCI6636K2H$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.TCI6636K2H$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.TCI6636K2H$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.TCI6636K2H$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Instance", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6636K2H.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H$$Params", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6636K2H.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H$$Object", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6636K2H.Object", om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Instance", "ti.catalog.arm.cortexa15"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
    }

    void TCI6638K2K$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Module", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6638K2K.Module", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Module", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K$$create", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$TCI6638K2K$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K$$construct", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$TCI6638K2K$$construct"));
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Instance", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6638K2K.Instance", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Instance", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K$$Params", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6638K2K.Params", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X$$Params", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K$$Object", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI6638K2K.Object", om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Instance", "ti.catalog.arm.cortexa15"));
                po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), $$UNDEF);
                po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), $$UNDEF);
    }

    void TCI66AK2G02$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arm/cortexa15/TCI66AK2G02.xs");
        om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Module", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI66AK2G02.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02$$create", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$TCI66AK2G02$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02$$construct", "ti.catalog.arm.cortexa15"), Global.get("ti$catalog$arm$cortexa15$TCI66AK2G02$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arm.cortexa15.TCI66AK2G02$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Instance", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI66AK2G02.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02$$Params", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI66AK2G02.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arm.cortexa15"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "v7A15", "wh");
        po.addFld("isa", $$T_Str, "v7A15", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arm.cortexa15")), Global.newArray(new Object[]{}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02$$Object", "ti.catalog.arm.cortexa15");
        po.init("ti.catalog.arm.cortexa15.TCI66AK2G02.Object", om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Instance", "ti.catalog.arm.cortexa15"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arm.cortexa15"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arm.cortexa15"), fxn);
    }

    void OMAP5430$$ROV()
    {
    }

    void Vayu$$ROV()
    {
    }

    void DRA7XX$$ROV()
    {
    }

    void ITCI663X$$ROV()
    {
    }

    void C66AK2E05$$ROV()
    {
    }

    void TCI6630K2L$$ROV()
    {
    }

    void TCI6636K2H$$ROV()
    {
    }

    void TCI6638K2K$$ROV()
    {
    }

    void TCI66AK2G02$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.arm.cortexa15.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.arm.cortexa15"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.arm.cortexa15", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.arm.cortexa15");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.arm.cortexa15.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.platform", Global.newArray()));
        imports.add(Global.newArray("ti.catalog.peripherals.hdvicp2", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.arm.cortexa15'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.arm.cortexa15$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.arm.cortexa15$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.arm.cortexa15$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void OMAP5430$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430", "ti.catalog.arm.cortexa15");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Module", "ti.catalog.arm.cortexa15");
        vo.init2(po, "ti.catalog.arm.cortexa15.OMAP5430", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arm.cortexa15.OMAP5430$$capsule", "ti.catalog.arm.cortexa15"));
        vo.bind("Instance", om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Instance", "ti.catalog.arm.cortexa15"));
        vo.bind("Params", om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Params", "ti.catalog.arm.cortexa15"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Params", "ti.catalog.arm.cortexa15")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arm.cortexa15", "ti.catalog.arm.cortexa15"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arm.cortexa15")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arm.cortexa15.OMAP5430$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arm.cortexa15.OMAP5430.Object", "ti.catalog.arm.cortexa15"));
        pkgV.bind("OMAP5430", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("OMAP5430");
    }

    void Vayu$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arm.cortexa15.Vayu", "ti.catalog.arm.cortexa15");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.Vayu.Module", "ti.catalog.arm.cortexa15");
        vo.init2(po, "ti.catalog.arm.cortexa15.Vayu", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arm.cortexa15.Vayu$$capsule", "ti.catalog.arm.cortexa15"));
        vo.bind("Instance", om.findStrict("ti.catalog.arm.cortexa15.Vayu.Instance", "ti.catalog.arm.cortexa15"));
        vo.bind("Params", om.findStrict("ti.catalog.arm.cortexa15.Vayu.Params", "ti.catalog.arm.cortexa15"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arm.cortexa15.Vayu.Params", "ti.catalog.arm.cortexa15")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arm.cortexa15", "ti.catalog.arm.cortexa15"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arm.cortexa15")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arm.cortexa15.Vayu$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arm.cortexa15.Vayu.Object", "ti.catalog.arm.cortexa15"));
        pkgV.bind("Vayu", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Vayu");
    }

    void DRA7XX$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX", "ti.catalog.arm.cortexa15");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Module", "ti.catalog.arm.cortexa15");
        vo.init2(po, "ti.catalog.arm.cortexa15.DRA7XX", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arm.cortexa15.DRA7XX$$capsule", "ti.catalog.arm.cortexa15"));
        vo.bind("Instance", om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Instance", "ti.catalog.arm.cortexa15"));
        vo.bind("Params", om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Params", "ti.catalog.arm.cortexa15"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Params", "ti.catalog.arm.cortexa15")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arm.cortexa15", "ti.catalog.arm.cortexa15"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arm.cortexa15")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arm.cortexa15.DRA7XX$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arm.cortexa15.DRA7XX.Object", "ti.catalog.arm.cortexa15"));
        pkgV.bind("DRA7XX", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("DRA7XX");
    }

    void ITCI663X$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arm.cortexa15.ITCI663X", "ti.catalog.arm.cortexa15");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Module", "ti.catalog.arm.cortexa15");
        vo.init2(po, "ti.catalog.arm.cortexa15.ITCI663X", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X$$capsule", "ti.catalog.arm.cortexa15"));
        vo.bind("Instance", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Instance", "ti.catalog.arm.cortexa15"));
        vo.bind("Params", om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Params", "ti.catalog.arm.cortexa15"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arm.cortexa15.ITCI663X.Params", "ti.catalog.arm.cortexa15")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arm.cortexa15", "ti.catalog.arm.cortexa15"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ITCI663X", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ITCI663X");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void C66AK2E05$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05", "ti.catalog.arm.cortexa15");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Module", "ti.catalog.arm.cortexa15");
        vo.init2(po, "ti.catalog.arm.cortexa15.C66AK2E05", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Instance", "ti.catalog.arm.cortexa15"));
        vo.bind("Params", om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Params", "ti.catalog.arm.cortexa15"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Params", "ti.catalog.arm.cortexa15")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arm.cortexa15", "ti.catalog.arm.cortexa15"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.arm.cortexa15");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arm.cortexa15")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arm.cortexa15.C66AK2E05$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05.Object", "ti.catalog.arm.cortexa15"));
        pkgV.bind("C66AK2E05", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("C66AK2E05");
    }

    void TCI6630K2L$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L", "ti.catalog.arm.cortexa15");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Module", "ti.catalog.arm.cortexa15");
        vo.init2(po, "ti.catalog.arm.cortexa15.TCI6630K2L", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Instance", "ti.catalog.arm.cortexa15"));
        vo.bind("Params", om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Params", "ti.catalog.arm.cortexa15"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Params", "ti.catalog.arm.cortexa15")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arm.cortexa15", "ti.catalog.arm.cortexa15"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.arm.cortexa15");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arm.cortexa15")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arm.cortexa15.TCI6630K2L$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L.Object", "ti.catalog.arm.cortexa15"));
        pkgV.bind("TCI6630K2L", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TCI6630K2L");
    }

    void TCI6636K2H$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H", "ti.catalog.arm.cortexa15");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Module", "ti.catalog.arm.cortexa15");
        vo.init2(po, "ti.catalog.arm.cortexa15.TCI6636K2H", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H$$capsule", "ti.catalog.arm.cortexa15"));
        vo.bind("Instance", om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Instance", "ti.catalog.arm.cortexa15"));
        vo.bind("Params", om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Params", "ti.catalog.arm.cortexa15"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Params", "ti.catalog.arm.cortexa15")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arm.cortexa15", "ti.catalog.arm.cortexa15"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arm.cortexa15")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arm.cortexa15.TCI6636K2H$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H.Object", "ti.catalog.arm.cortexa15"));
        pkgV.bind("TCI6636K2H", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TCI6636K2H");
    }

    void TCI6638K2K$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K", "ti.catalog.arm.cortexa15");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Module", "ti.catalog.arm.cortexa15");
        vo.init2(po, "ti.catalog.arm.cortexa15.TCI6638K2K", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Instance", "ti.catalog.arm.cortexa15"));
        vo.bind("Params", om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Params", "ti.catalog.arm.cortexa15"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Params", "ti.catalog.arm.cortexa15")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arm.cortexa15", "ti.catalog.arm.cortexa15"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.arm.cortexa15");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arm.cortexa15")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arm.cortexa15.TCI6638K2K$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K.Object", "ti.catalog.arm.cortexa15"));
        pkgV.bind("TCI6638K2K", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TCI6638K2K");
    }

    void TCI66AK2G02$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02", "ti.catalog.arm.cortexa15");
        po = (Proto.Obj)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Module", "ti.catalog.arm.cortexa15");
        vo.init2(po, "ti.catalog.arm.cortexa15.TCI66AK2G02", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02$$capsule", "ti.catalog.arm.cortexa15"));
        vo.bind("Instance", om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Instance", "ti.catalog.arm.cortexa15"));
        vo.bind("Params", om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Params", "ti.catalog.arm.cortexa15"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Params", "ti.catalog.arm.cortexa15")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arm.cortexa15", "ti.catalog.arm.cortexa15"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arm.cortexa15")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arm.cortexa15.TCI66AK2G02$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02.Object", "ti.catalog.arm.cortexa15"));
        pkgV.bind("TCI66AK2G02", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TCI66AK2G02");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arm.cortexa15.OMAP5430", "ti.catalog.arm.cortexa15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arm.cortexa15.Vayu", "ti.catalog.arm.cortexa15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arm.cortexa15.DRA7XX", "ti.catalog.arm.cortexa15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arm.cortexa15.C66AK2E05", "ti.catalog.arm.cortexa15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arm.cortexa15.TCI6630K2L", "ti.catalog.arm.cortexa15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arm.cortexa15.TCI6636K2H", "ti.catalog.arm.cortexa15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arm.cortexa15.TCI6638K2K", "ti.catalog.arm.cortexa15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arm.cortexa15.TCI66AK2G02", "ti.catalog.arm.cortexa15"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.arm.cortexa15.OMAP5430")).bless();
        ((Value.Obj)om.getv("ti.catalog.arm.cortexa15.Vayu")).bless();
        ((Value.Obj)om.getv("ti.catalog.arm.cortexa15.DRA7XX")).bless();
        ((Value.Obj)om.getv("ti.catalog.arm.cortexa15.ITCI663X")).bless();
        ((Value.Obj)om.getv("ti.catalog.arm.cortexa15.C66AK2E05")).bless();
        ((Value.Obj)om.getv("ti.catalog.arm.cortexa15.TCI6630K2L")).bless();
        ((Value.Obj)om.getv("ti.catalog.arm.cortexa15.TCI6636K2H")).bless();
        ((Value.Obj)om.getv("ti.catalog.arm.cortexa15.TCI6638K2K")).bless();
        ((Value.Obj)om.getv("ti.catalog.arm.cortexa15.TCI66AK2G02")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.arm.cortexa15")).add(pkgV);
    }

    public void exec( Scriptable xdcO, Session ses )
    {
        this.xdcO = xdcO;
        this.ses = ses;
        om = (Value.Obj)xdcO.get("om", null);

        Object o = om.geto("$name");
        String s = o instanceof String ? (String)o : null;
        isCFG = s != null && s.equals("cfg");
        isROV = s != null && s.equals("rov");

        $$IMPORTS();
        $$OBJECTS();
        OMAP5430$$OBJECTS();
        Vayu$$OBJECTS();
        DRA7XX$$OBJECTS();
        ITCI663X$$OBJECTS();
        C66AK2E05$$OBJECTS();
        TCI6630K2L$$OBJECTS();
        TCI6636K2H$$OBJECTS();
        TCI6638K2K$$OBJECTS();
        TCI66AK2G02$$OBJECTS();
        OMAP5430$$CONSTS();
        Vayu$$CONSTS();
        DRA7XX$$CONSTS();
        ITCI663X$$CONSTS();
        C66AK2E05$$CONSTS();
        TCI6630K2L$$CONSTS();
        TCI6636K2H$$CONSTS();
        TCI6638K2K$$CONSTS();
        TCI66AK2G02$$CONSTS();
        OMAP5430$$CREATES();
        Vayu$$CREATES();
        DRA7XX$$CREATES();
        ITCI663X$$CREATES();
        C66AK2E05$$CREATES();
        TCI6630K2L$$CREATES();
        TCI6636K2H$$CREATES();
        TCI6638K2K$$CREATES();
        TCI66AK2G02$$CREATES();
        OMAP5430$$FUNCTIONS();
        Vayu$$FUNCTIONS();
        DRA7XX$$FUNCTIONS();
        ITCI663X$$FUNCTIONS();
        C66AK2E05$$FUNCTIONS();
        TCI6630K2L$$FUNCTIONS();
        TCI6636K2H$$FUNCTIONS();
        TCI6638K2K$$FUNCTIONS();
        TCI66AK2G02$$FUNCTIONS();
        OMAP5430$$SIZES();
        Vayu$$SIZES();
        DRA7XX$$SIZES();
        ITCI663X$$SIZES();
        C66AK2E05$$SIZES();
        TCI6630K2L$$SIZES();
        TCI6636K2H$$SIZES();
        TCI6638K2K$$SIZES();
        TCI66AK2G02$$SIZES();
        OMAP5430$$TYPES();
        Vayu$$TYPES();
        DRA7XX$$TYPES();
        ITCI663X$$TYPES();
        C66AK2E05$$TYPES();
        TCI6630K2L$$TYPES();
        TCI6636K2H$$TYPES();
        TCI6638K2K$$TYPES();
        TCI66AK2G02$$TYPES();
        if (isROV) {
            OMAP5430$$ROV();
            Vayu$$ROV();
            DRA7XX$$ROV();
            ITCI663X$$ROV();
            C66AK2E05$$ROV();
            TCI6630K2L$$ROV();
            TCI6636K2H$$ROV();
            TCI6638K2K$$ROV();
            TCI66AK2G02$$ROV();
        }//isROV
        $$SINGLETONS();
        OMAP5430$$SINGLETONS();
        Vayu$$SINGLETONS();
        DRA7XX$$SINGLETONS();
        ITCI663X$$SINGLETONS();
        C66AK2E05$$SINGLETONS();
        TCI6630K2L$$SINGLETONS();
        TCI6636K2H$$SINGLETONS();
        TCI6638K2K$$SINGLETONS();
        TCI66AK2G02$$SINGLETONS();
        $$INITIALIZATION();
    }
}
