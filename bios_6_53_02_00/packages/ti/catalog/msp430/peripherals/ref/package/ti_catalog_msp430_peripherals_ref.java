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

public class ti_catalog_msp430_peripherals_ref
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
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.clock");
        Global.callFxn("loadPackage", xdcO, "ti.catalog.msp430.peripherals.special_function");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.ref", new Value.Obj("ti.catalog.msp430.peripherals.ref", pkgP));
    }

    void IREF$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.IREF.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.ref.IREF", new Value.Obj("ti.catalog.msp430.peripherals.ref.IREF", po));
        pkgV.bind("IREF", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.IREF$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.ref.IREF.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.IREF$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.ref.IREF.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.IREF$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.ref.IREF.Params", new Proto.Str(po, true));
    }

    void REF$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.REF.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.ref.REF", new Value.Obj("ti.catalog.msp430.peripherals.ref.REF", po));
        pkgV.bind("REF", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.ref.REF.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.ref"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.ref.REF.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.REF$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.ref.REF.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.REF$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.ref.REF.Params", new Proto.Str(po, true));
    }

    void REF_A$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.REF_A.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.ref.REF_A", new Value.Obj("ti.catalog.msp430.peripherals.ref.REF_A", po));
        pkgV.bind("REF_A", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.ref.REF_A.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.ref"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.ref.REF_A.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.REF_A$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.ref.REF_A.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.ref.REF_A$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.ref.REF_A.Params", new Proto.Str(po, true));
    }

    void IREF$$CONSTS()
    {
        // interface IREF
    }

    void REF$$CONSTS()
    {
        // module REF
    }

    void REF_A$$CONSTS()
    {
        // module REF_A
    }

    void IREF$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void REF$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.ref.REF$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Module", "ti.catalog.msp430.peripherals.ref"), om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Instance", "ti.catalog.msp430.peripherals.ref"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Params", "ti.catalog.msp430.peripherals.ref"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$ref$REF$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.ref.REF'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.ref.REF.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.ref']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.ref.REF$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Module", "ti.catalog.msp430.peripherals.ref"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.ref.REF$$Object", "ti.catalog.msp430.peripherals.ref"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Params", "ti.catalog.msp430.peripherals.ref"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$ref$REF$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.ref.REF'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void REF_A$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.ref.REF_A$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Module", "ti.catalog.msp430.peripherals.ref"), om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Instance", "ti.catalog.msp430.peripherals.ref"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Params", "ti.catalog.msp430.peripherals.ref"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$ref$REF_A$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.ref.REF_A'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.ref.REF_A.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.ref']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.ref.REF_A$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Module", "ti.catalog.msp430.peripherals.ref"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A$$Object", "ti.catalog.msp430.peripherals.ref"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Params", "ti.catalog.msp430.peripherals.ref"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$ref$REF_A$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.ref.REF_A'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IREF$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void REF$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void REF_A$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IREF$$SIZES()
    {
    }

    void REF$$SIZES()
    {
    }

    void REF_A$$SIZES()
    {
    }

    void IREF$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Module", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.IREF.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.ref"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Instance", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.IREF.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.ref"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.IREF$$Params", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.IREF.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.ref"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct IREF.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.IREF$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void REF$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/ref/REF.xs");
        om.bind("ti.catalog.msp430.peripherals.ref.REF$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Module", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.REF.Module", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Module", "ti.catalog.msp430.peripherals.ref"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.ref.REF$$create", "ti.catalog.msp430.peripherals.ref"), Global.get("ti$catalog$msp430$peripherals$ref$REF$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.ref.REF$$construct", "ti.catalog.msp430.peripherals.ref"), Global.get("ti$catalog$msp430$peripherals$ref$REF$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.ref.REF$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.ref.REF$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.ref.REF$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.ref.REF$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.ref"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.ref"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.ref"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Instance", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.REF.Instance", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Instance", "ti.catalog.msp430.peripherals.ref"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF$$Params", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.REF.Params", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF$$Params", "ti.catalog.msp430.peripherals.ref"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF$$Object", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.REF.Object", om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Instance", "ti.catalog.msp430.peripherals.ref"));
    }

    void REF_A$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/ref/REF_A.xs");
        om.bind("ti.catalog.msp430.peripherals.ref.REF_A$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Module", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.REF_A.Module", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Module", "ti.catalog.msp430.peripherals.ref"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A$$create", "ti.catalog.msp430.peripherals.ref"), Global.get("ti$catalog$msp430$peripherals$ref$REF_A$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A$$construct", "ti.catalog.msp430.peripherals.ref"), Global.get("ti$catalog$msp430$peripherals$ref$REF_A$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.ref.REF_A$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.ref.REF_A$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.ref.REF_A$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.ref.REF_A$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.ref"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.ref"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.ref"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Instance", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.REF_A.Instance", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Instance", "ti.catalog.msp430.peripherals.ref"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A$$Params", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.REF_A.Params", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF$$Params", "ti.catalog.msp430.peripherals.ref"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A$$Object", "ti.catalog.msp430.peripherals.ref");
        po.init("ti.catalog.msp430.peripherals.ref.REF_A.Object", om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Instance", "ti.catalog.msp430.peripherals.ref"));
    }

    void IREF$$ROV()
    {
    }

    void REF$$ROV()
    {
    }

    void REF_A$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.ref.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.ref"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.ref", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.ref");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.ref.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.clock", Global.newArray()));
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.special_function", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.ref'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.ref$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.ref$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.ref$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IREF$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.IREF", "ti.catalog.msp430.peripherals.ref");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Module", "ti.catalog.msp430.peripherals.ref");
        vo.init2(po, "ti.catalog.msp430.peripherals.ref.IREF", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Instance", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Params", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.Params", "ti.catalog.msp430.peripherals.ref")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.ref", "ti.catalog.msp430.peripherals.ref"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.ref"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IREF", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IREF");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void REF$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF", "ti.catalog.msp430.peripherals.ref");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Module", "ti.catalog.msp430.peripherals.ref");
        vo.init2(po, "ti.catalog.msp430.peripherals.ref.REF", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.ref.REF$$capsule", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Instance", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Params", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Params", "ti.catalog.msp430.peripherals.ref")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.ref", "ti.catalog.msp430.peripherals.ref"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.ref"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.ref");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.ref")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.ref.REF$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.ref.REF.Object", "ti.catalog.msp430.peripherals.ref"));
        pkgV.bind("REF", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("REF");
    }

    void REF_A$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A", "ti.catalog.msp430.peripherals.ref");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Module", "ti.catalog.msp430.peripherals.ref");
        vo.init2(po, "ti.catalog.msp430.peripherals.ref.REF_A", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A$$capsule", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Instance", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Params", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Params", "ti.catalog.msp430.peripherals.ref")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.ref", "ti.catalog.msp430.peripherals.ref"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.ref"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.ref.IREF.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.ref"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.ref");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.ref")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.ref.REF_A$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A.Object", "ti.catalog.msp430.peripherals.ref"));
        pkgV.bind("REF_A", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("REF_A");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.ref.REF", "ti.catalog.msp430.peripherals.ref"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.ref.REF_A", "ti.catalog.msp430.peripherals.ref"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.ref.IREF")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.ref.REF")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.ref.REF_A")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.ref")).add(pkgV);
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
        IREF$$OBJECTS();
        REF$$OBJECTS();
        REF_A$$OBJECTS();
        IREF$$CONSTS();
        REF$$CONSTS();
        REF_A$$CONSTS();
        IREF$$CREATES();
        REF$$CREATES();
        REF_A$$CREATES();
        IREF$$FUNCTIONS();
        REF$$FUNCTIONS();
        REF_A$$FUNCTIONS();
        IREF$$SIZES();
        REF$$SIZES();
        REF_A$$SIZES();
        IREF$$TYPES();
        REF$$TYPES();
        REF_A$$TYPES();
        if (isROV) {
            IREF$$ROV();
            REF$$ROV();
            REF_A$$ROV();
        }//isROV
        $$SINGLETONS();
        IREF$$SINGLETONS();
        REF$$SINGLETONS();
        REF_A$$SINGLETONS();
        $$INITIALIZATION();
    }
}
