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

public class ti_catalog_arp32
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
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "ti.catalog");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.arp32.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.arp32", new Value.Obj("ti.catalog.arp32", pkgP));
    }

    void TMS320C6A8149$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arp32.TMS320C6A8149.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arp32.TMS320C6A8149", new Value.Obj("ti.catalog.arp32.TMS320C6A8149", po));
        pkgV.bind("TMS320C6A8149", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arp32.TMS320C6A8149.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arp32.TMS320C6A8149$$Object", new Proto.Obj());
        om.bind("ti.catalog.arp32.TMS320C6A8149.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arp32.TMS320C6A8149$$Params", new Proto.Obj());
        om.bind("ti.catalog.arp32.TMS320C6A8149.Params", new Proto.Str(po, true));
    }

    void Arctic$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arp32.Arctic.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arp32.Arctic", new Value.Obj("ti.catalog.arp32.Arctic", po));
        pkgV.bind("Arctic", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arp32.Arctic.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arp32.Arctic$$Object", new Proto.Obj());
        om.bind("ti.catalog.arp32.Arctic.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arp32.Arctic$$Params", new Proto.Obj());
        om.bind("ti.catalog.arp32.Arctic.Params", new Proto.Str(po, true));
    }

    void Vayu$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arp32.Vayu.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arp32.Vayu", new Value.Obj("ti.catalog.arp32.Vayu", po));
        pkgV.bind("Vayu", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arp32.Vayu.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arp32.Vayu$$Object", new Proto.Obj());
        om.bind("ti.catalog.arp32.Vayu.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arp32.Vayu$$Params", new Proto.Obj());
        om.bind("ti.catalog.arp32.Vayu.Params", new Proto.Str(po, true));
    }

    void DRA7XX$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arp32.DRA7XX.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arp32.DRA7XX", new Value.Obj("ti.catalog.arp32.DRA7XX", po));
        pkgV.bind("DRA7XX", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arp32.DRA7XX.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arp32.DRA7XX$$Object", new Proto.Obj());
        om.bind("ti.catalog.arp32.DRA7XX.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arp32.DRA7XX$$Params", new Proto.Obj());
        om.bind("ti.catalog.arp32.DRA7XX.Params", new Proto.Str(po, true));
    }

    void TDA3XX$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.arp32.TDA3XX.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.arp32.TDA3XX", new Value.Obj("ti.catalog.arp32.TDA3XX", po));
        pkgV.bind("TDA3XX", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.arp32.TDA3XX.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.arp32.TDA3XX$$Object", new Proto.Obj());
        om.bind("ti.catalog.arp32.TDA3XX.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.arp32.TDA3XX$$Params", new Proto.Obj());
        om.bind("ti.catalog.arp32.TDA3XX.Params", new Proto.Str(po, true));
    }

    void TMS320C6A8149$$CONSTS()
    {
        // module TMS320C6A8149
    }

    void Arctic$$CONSTS()
    {
        // module Arctic
    }

    void Vayu$$CONSTS()
    {
        // module Vayu
    }

    void DRA7XX$$CONSTS()
    {
        // module DRA7XX
    }

    void TDA3XX$$CONSTS()
    {
        // module TDA3XX
    }

    void TMS320C6A8149$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.TMS320C6A8149$$create", new Proto.Fxn(om.findStrict("ti.catalog.arp32.TMS320C6A8149.Module", "ti.catalog.arp32"), om.findStrict("ti.catalog.arp32.TMS320C6A8149.Instance", "ti.catalog.arp32"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arp32.TMS320C6A8149.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$TMS320C6A8149$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.TMS320C6A8149'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arp32.TMS320C6A8149.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arp32']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.TMS320C6A8149$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arp32.TMS320C6A8149.Module", "ti.catalog.arp32"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arp32.TMS320C6A8149$$Object", "ti.catalog.arp32"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arp32.TMS320C6A8149.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$TMS320C6A8149$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.TMS320C6A8149'];\n");
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

    void Arctic$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.Arctic$$create", new Proto.Fxn(om.findStrict("ti.catalog.arp32.Arctic.Module", "ti.catalog.arp32"), om.findStrict("ti.catalog.arp32.Arctic.Instance", "ti.catalog.arp32"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arp32.Arctic.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$Arctic$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.Arctic'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arp32.Arctic.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arp32']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.Arctic$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arp32.Arctic.Module", "ti.catalog.arp32"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arp32.Arctic$$Object", "ti.catalog.arp32"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arp32.Arctic.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$Arctic$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.Arctic'];\n");
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

    void Vayu$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.Vayu$$create", new Proto.Fxn(om.findStrict("ti.catalog.arp32.Vayu.Module", "ti.catalog.arp32"), om.findStrict("ti.catalog.arp32.Vayu.Instance", "ti.catalog.arp32"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arp32.Vayu.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$Vayu$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.Vayu'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arp32.Vayu.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arp32']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.Vayu$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arp32.Vayu.Module", "ti.catalog.arp32"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arp32.Vayu$$Object", "ti.catalog.arp32"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arp32.Vayu.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$Vayu$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.Vayu'];\n");
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

    void DRA7XX$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.DRA7XX$$create", new Proto.Fxn(om.findStrict("ti.catalog.arp32.DRA7XX.Module", "ti.catalog.arp32"), om.findStrict("ti.catalog.arp32.DRA7XX.Instance", "ti.catalog.arp32"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arp32.DRA7XX.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$DRA7XX$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.DRA7XX'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arp32.DRA7XX.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arp32']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.DRA7XX$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arp32.DRA7XX.Module", "ti.catalog.arp32"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arp32.DRA7XX$$Object", "ti.catalog.arp32"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arp32.DRA7XX.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$DRA7XX$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.DRA7XX'];\n");
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

    void TDA3XX$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.TDA3XX$$create", new Proto.Fxn(om.findStrict("ti.catalog.arp32.TDA3XX.Module", "ti.catalog.arp32"), om.findStrict("ti.catalog.arp32.TDA3XX.Instance", "ti.catalog.arp32"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.arp32.TDA3XX.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$TDA3XX$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.TDA3XX'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.arp32.TDA3XX.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.arp32']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.arp32.TDA3XX$$construct", new Proto.Fxn(om.findStrict("ti.catalog.arp32.TDA3XX.Module", "ti.catalog.arp32"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.arp32.TDA3XX$$Object", "ti.catalog.arp32"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.arp32.TDA3XX.Params", "ti.catalog.arp32"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$arp32$TDA3XX$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.arp32.TDA3XX'];\n");
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

    void TMS320C6A8149$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Arctic$$FUNCTIONS()
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

    void TDA3XX$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C6A8149$$SIZES()
    {
    }

    void Arctic$$SIZES()
    {
    }

    void Vayu$$SIZES()
    {
    }

    void DRA7XX$$SIZES()
    {
    }

    void TDA3XX$$SIZES()
    {
    }

    void TMS320C6A8149$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arp32/TMS320C6A8149.xs");
        om.bind("ti.catalog.arp32.TMS320C6A8149$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TMS320C6A8149.Module", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.TMS320C6A8149.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arp32.TMS320C6A8149$$create", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$TMS320C6A8149$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arp32.TMS320C6A8149$$construct", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$TMS320C6A8149$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arp32.TMS320C6A8149$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.TMS320C6A8149$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.TMS320C6A8149$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arp32.TMS320C6A8149$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TMS320C6A8149.Instance", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.TMS320C6A8149.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"OCMC", Global.newObject("comment", "128KB L3 OCMC Memory", "name", "OCMC", "base", 0x40300000L, "len", 0x00020000L, "space", "code/data", "page", 1L, "access", "RWX")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TMS320C6A8149$$Params", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.TMS320C6A8149.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"OCMC", Global.newObject("comment", "128KB L3 OCMC Memory", "name", "OCMC", "base", 0x40300000L, "len", 0x00020000L, "space", "code/data", "page", 1L, "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TMS320C6A8149$$Object", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.TMS320C6A8149.Object", om.findStrict("ti.catalog.arp32.TMS320C6A8149.Instance", "ti.catalog.arp32"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
    }

    void Arctic$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arp32/Arctic.xs");
        om.bind("ti.catalog.arp32.Arctic$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Arctic.Module", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.Arctic.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arp32.Arctic$$create", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$Arctic$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arp32.Arctic$$construct", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$Arctic$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arp32.Arctic$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.Arctic$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.Arctic$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arp32.Arctic$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Arctic.Instance", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.Arctic.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"L3MEM", Global.newObject("comment", "1MB L3 Memory", "name", "L3MEM", "base", 0x40300000L, "len", 0x00100000L, "space", "code/data", "page", 1L, "access", "RWX")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Arctic$$Params", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.Arctic.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"L3MEM", Global.newObject("comment", "1MB L3 Memory", "name", "L3MEM", "base", 0x40300000L, "len", 0x00100000L, "space", "code/data", "page", 1L, "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Arctic$$Object", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.Arctic.Object", om.findStrict("ti.catalog.arp32.Arctic.Instance", "ti.catalog.arp32"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
    }

    void Vayu$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arp32/Vayu.xs");
        om.bind("ti.catalog.arp32.Vayu$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Vayu.Module", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.Vayu.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arp32.Vayu$$create", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$Vayu$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arp32.Vayu$$construct", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$Vayu$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arp32.Vayu$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.Vayu$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.Vayu$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arp32.Vayu$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Vayu.Instance", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.Vayu.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Vayu$$Params", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.Vayu.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Vayu$$Object", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.Vayu.Object", om.findStrict("ti.catalog.arp32.Vayu.Instance", "ti.catalog.arp32"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
    }

    void DRA7XX$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arp32/DRA7XX.xs");
        om.bind("ti.catalog.arp32.DRA7XX$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.DRA7XX.Module", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.DRA7XX.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arp32.DRA7XX$$create", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$DRA7XX$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arp32.DRA7XX$$construct", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$DRA7XX$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arp32.DRA7XX$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.DRA7XX$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.DRA7XX$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arp32.DRA7XX$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.DRA7XX.Instance", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.DRA7XX.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"OCMC_RAM1", Global.newObject("comment", "OCMC (On-chip RAM) Bank 1 (512KB)", "name", "OCMC_RAM1", "base", 0x40300000L, "len", 0x00080000L, "space", "code/data", "page", 1L, "access", "RWX")}), Global.newArray(new Object[]{"OCMC_RAM2", Global.newObject("comment", "OCMC (On-chip RAM) Bank 2 (1MB)", "name", "OCMC_RAM2", "base", 0x40400000L, "len", 0x00100000L, "space", "code/data", "page", 1L, "access", "RWX")}), Global.newArray(new Object[]{"OCMC_RAM3", Global.newObject("comment", "OCMC (On-chip RAM) Bank 3 (1MB)", "name", "OCMC_RAM3", "base", 0x40500000L, "len", 0x00100000L, "space", "code/data", "page", 1L, "access", "RWX")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.DRA7XX$$Params", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.DRA7XX.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"OCMC_RAM1", Global.newObject("comment", "OCMC (On-chip RAM) Bank 1 (512KB)", "name", "OCMC_RAM1", "base", 0x40300000L, "len", 0x00080000L, "space", "code/data", "page", 1L, "access", "RWX")}), Global.newArray(new Object[]{"OCMC_RAM2", Global.newObject("comment", "OCMC (On-chip RAM) Bank 2 (1MB)", "name", "OCMC_RAM2", "base", 0x40400000L, "len", 0x00100000L, "space", "code/data", "page", 1L, "access", "RWX")}), Global.newArray(new Object[]{"OCMC_RAM3", Global.newObject("comment", "OCMC (On-chip RAM) Bank 3 (1MB)", "name", "OCMC_RAM3", "base", 0x40500000L, "len", 0x00100000L, "space", "code/data", "page", 1L, "access", "RWX")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.DRA7XX$$Object", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.DRA7XX.Object", om.findStrict("ti.catalog.arp32.DRA7XX.Instance", "ti.catalog.arp32"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
    }

    void TDA3XX$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/arp32/TDA3XX.xs");
        om.bind("ti.catalog.arp32.TDA3XX$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TDA3XX.Module", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.TDA3XX.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.arp32.TDA3XX$$create", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$TDA3XX$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.arp32.TDA3XX$$construct", "ti.catalog.arp32"), Global.get("ti$catalog$arp32$TDA3XX$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.arp32.TDA3XX$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.TDA3XX$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.arp32.TDA3XX$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.arp32.TDA3XX$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TDA3XX.Instance", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.TDA3XX.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TDA3XX$$Params", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.TDA3XX.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "ARP32", "wh");
        po.addFld("isa", $$T_Str, "arp32", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.arp32")), Global.newArray(new Object[]{Global.newArray(new Object[]{"DMEM", Global.newObject("comment", "32KB data memory", "name", "DMEM", "base", 0x40020000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"WBUF", Global.newObject("comment", "VCOP work buffer", "name", "WBUF", "base", 0x40040000L, "len", 0x8000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLA", Global.newObject("comment", "Image buffer low copy A", "name", "IBUFLA", "base", 0x40050000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHA", Global.newObject("comment", "Image buffer high copy A", "name", "IBUFHA", "base", 0x40054000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFLB", Global.newObject("comment", "Image buffer low copy B", "name", "IBUFLB", "base", 0x40070000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")}), Global.newArray(new Object[]{"IBUFHB", Global.newObject("comment", "Image buffer high copy B", "name", "IBUFHB", "base", 0x40074000L, "len", 0x4000L, "space", "data", "page", 1L, "access", "RW")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TDA3XX$$Object", "ti.catalog.arp32");
        po.init("ti.catalog.arp32.TDA3XX.Object", om.findStrict("ti.catalog.arp32.TDA3XX.Instance", "ti.catalog.arp32"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.arp32"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.arp32"), fxn);
    }

    void TMS320C6A8149$$ROV()
    {
    }

    void Arctic$$ROV()
    {
    }

    void Vayu$$ROV()
    {
    }

    void DRA7XX$$ROV()
    {
    }

    void TDA3XX$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.arp32.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.arp32"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.arp32", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.arp32");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.arp32.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.platform", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.arp32'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.arp32$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.arp32$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.arp32$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void TMS320C6A8149$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arp32.TMS320C6A8149", "ti.catalog.arp32");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TMS320C6A8149.Module", "ti.catalog.arp32");
        vo.init2(po, "ti.catalog.arp32.TMS320C6A8149", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arp32.TMS320C6A8149$$capsule", "ti.catalog.arp32"));
        vo.bind("Instance", om.findStrict("ti.catalog.arp32.TMS320C6A8149.Instance", "ti.catalog.arp32"));
        vo.bind("Params", om.findStrict("ti.catalog.arp32.TMS320C6A8149.Params", "ti.catalog.arp32"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arp32.TMS320C6A8149.Params", "ti.catalog.arp32")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arp32", "ti.catalog.arp32"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arp32")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arp32.TMS320C6A8149$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arp32.TMS320C6A8149.Object", "ti.catalog.arp32"));
        pkgV.bind("TMS320C6A8149", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C6A8149");
    }

    void Arctic$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arp32.Arctic", "ti.catalog.arp32");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Arctic.Module", "ti.catalog.arp32");
        vo.init2(po, "ti.catalog.arp32.Arctic", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arp32.Arctic$$capsule", "ti.catalog.arp32"));
        vo.bind("Instance", om.findStrict("ti.catalog.arp32.Arctic.Instance", "ti.catalog.arp32"));
        vo.bind("Params", om.findStrict("ti.catalog.arp32.Arctic.Params", "ti.catalog.arp32"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arp32.Arctic.Params", "ti.catalog.arp32")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arp32", "ti.catalog.arp32"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arp32")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arp32.Arctic$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arp32.Arctic.Object", "ti.catalog.arp32"));
        pkgV.bind("Arctic", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Arctic");
    }

    void Vayu$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arp32.Vayu", "ti.catalog.arp32");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.Vayu.Module", "ti.catalog.arp32");
        vo.init2(po, "ti.catalog.arp32.Vayu", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arp32.Vayu$$capsule", "ti.catalog.arp32"));
        vo.bind("Instance", om.findStrict("ti.catalog.arp32.Vayu.Instance", "ti.catalog.arp32"));
        vo.bind("Params", om.findStrict("ti.catalog.arp32.Vayu.Params", "ti.catalog.arp32"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arp32.Vayu.Params", "ti.catalog.arp32")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arp32", "ti.catalog.arp32"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arp32")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arp32.Vayu$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arp32.Vayu.Object", "ti.catalog.arp32"));
        pkgV.bind("Vayu", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Vayu");
    }

    void DRA7XX$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arp32.DRA7XX", "ti.catalog.arp32");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.DRA7XX.Module", "ti.catalog.arp32");
        vo.init2(po, "ti.catalog.arp32.DRA7XX", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arp32.DRA7XX$$capsule", "ti.catalog.arp32"));
        vo.bind("Instance", om.findStrict("ti.catalog.arp32.DRA7XX.Instance", "ti.catalog.arp32"));
        vo.bind("Params", om.findStrict("ti.catalog.arp32.DRA7XX.Params", "ti.catalog.arp32"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arp32.DRA7XX.Params", "ti.catalog.arp32")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arp32", "ti.catalog.arp32"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arp32")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arp32.DRA7XX$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arp32.DRA7XX.Object", "ti.catalog.arp32"));
        pkgV.bind("DRA7XX", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("DRA7XX");
    }

    void TDA3XX$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.arp32.TDA3XX", "ti.catalog.arp32");
        po = (Proto.Obj)om.findStrict("ti.catalog.arp32.TDA3XX.Module", "ti.catalog.arp32");
        vo.init2(po, "ti.catalog.arp32.TDA3XX", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.arp32.TDA3XX$$capsule", "ti.catalog.arp32"));
        vo.bind("Instance", om.findStrict("ti.catalog.arp32.TDA3XX.Instance", "ti.catalog.arp32"));
        vo.bind("Params", om.findStrict("ti.catalog.arp32.TDA3XX.Params", "ti.catalog.arp32"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.arp32.TDA3XX.Params", "ti.catalog.arp32")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.arp32", "ti.catalog.arp32"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.arp32")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.arp32.TDA3XX$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.arp32.TDA3XX.Object", "ti.catalog.arp32"));
        pkgV.bind("TDA3XX", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TDA3XX");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arp32.TMS320C6A8149", "ti.catalog.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arp32.Arctic", "ti.catalog.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arp32.Vayu", "ti.catalog.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arp32.DRA7XX", "ti.catalog.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.arp32.TDA3XX", "ti.catalog.arp32"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.arp32.TMS320C6A8149")).bless();
        ((Value.Obj)om.getv("ti.catalog.arp32.Arctic")).bless();
        ((Value.Obj)om.getv("ti.catalog.arp32.Vayu")).bless();
        ((Value.Obj)om.getv("ti.catalog.arp32.DRA7XX")).bless();
        ((Value.Obj)om.getv("ti.catalog.arp32.TDA3XX")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.arp32")).add(pkgV);
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
        TMS320C6A8149$$OBJECTS();
        Arctic$$OBJECTS();
        Vayu$$OBJECTS();
        DRA7XX$$OBJECTS();
        TDA3XX$$OBJECTS();
        TMS320C6A8149$$CONSTS();
        Arctic$$CONSTS();
        Vayu$$CONSTS();
        DRA7XX$$CONSTS();
        TDA3XX$$CONSTS();
        TMS320C6A8149$$CREATES();
        Arctic$$CREATES();
        Vayu$$CREATES();
        DRA7XX$$CREATES();
        TDA3XX$$CREATES();
        TMS320C6A8149$$FUNCTIONS();
        Arctic$$FUNCTIONS();
        Vayu$$FUNCTIONS();
        DRA7XX$$FUNCTIONS();
        TDA3XX$$FUNCTIONS();
        TMS320C6A8149$$SIZES();
        Arctic$$SIZES();
        Vayu$$SIZES();
        DRA7XX$$SIZES();
        TDA3XX$$SIZES();
        TMS320C6A8149$$TYPES();
        Arctic$$TYPES();
        Vayu$$TYPES();
        DRA7XX$$TYPES();
        TDA3XX$$TYPES();
        if (isROV) {
            TMS320C6A8149$$ROV();
            Arctic$$ROV();
            Vayu$$ROV();
            DRA7XX$$ROV();
            TDA3XX$$ROV();
        }//isROV
        $$SINGLETONS();
        TMS320C6A8149$$SINGLETONS();
        Arctic$$SINGLETONS();
        Vayu$$SINGLETONS();
        DRA7XX$$SINGLETONS();
        TDA3XX$$SINGLETONS();
        $$INITIALIZATION();
    }
}
