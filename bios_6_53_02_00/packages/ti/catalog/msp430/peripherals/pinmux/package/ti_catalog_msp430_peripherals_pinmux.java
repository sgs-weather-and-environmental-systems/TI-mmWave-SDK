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

public class ti_catalog_msp430_peripherals_pinmux
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
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux", new Value.Obj("ti.catalog.msp430.peripherals.pinmux", pkgP));
    }

    void IPinMux$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.IPinMux.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.IPinMux", new Value.Obj("ti.catalog.msp430.peripherals.pinmux.IPinMux", po));
        pkgV.bind("IPinMux", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.IPinMux$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.pinmux.IPinMux.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.pinmux.IPinMux.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.IPinMux$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.pinmux.IPinMux.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.IPinMux$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.pinmux.IPinMux.Params", new Proto.Str(po, true));
    }

    void PinMux$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux", new Value.Obj("ti.catalog.msp430.peripherals.pinmux.PinMux", po));
        pkgV.bind("PinMux", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.pinmux"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux.Params", new Proto.Str(po, true));
    }

    void IPinMux$$CONSTS()
    {
        // interface IPinMux
    }

    void PinMux$$CONSTS()
    {
        // module PinMux
    }

    void IPinMux$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void PinMux$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Module", "ti.catalog.msp430.peripherals.pinmux"), om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Instance", "ti.catalog.msp430.peripherals.pinmux"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Params", "ti.catalog.msp430.peripherals.pinmux"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$pinmux$PinMux$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.pinmux.PinMux'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.pinmux.PinMux.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.pinmux']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.forceSetDefaultRegister = __mod.PARAMS.forceSetDefaultRegister;\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Module", "ti.catalog.msp430.peripherals.pinmux"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux$$Object", "ti.catalog.msp430.peripherals.pinmux"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Params", "ti.catalog.msp430.peripherals.pinmux"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$pinmux$PinMux$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.pinmux.PinMux'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.forceSetDefaultRegister = __mod.PARAMS.forceSetDefaultRegister;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IPinMux$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void PinMux$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IPinMux$$SIZES()
    {
    }

    void PinMux$$SIZES()
    {
    }

    void IPinMux$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.Module", "ti.catalog.msp430.peripherals.pinmux");
        po.init("ti.catalog.msp430.peripherals.pinmux.IPinMux.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.pinmux"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.Instance", "ti.catalog.msp430.peripherals.pinmux");
        po.init("ti.catalog.msp430.peripherals.pinmux.IPinMux.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.pinmux"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("p1out", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1sel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1sel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1dir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1ren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2out", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2sel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2sel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2dir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2ren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3out", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3sel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3sel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3dir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3ren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4out", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4sel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4sel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4dir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4ren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjout", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjsel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjsel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjdir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1ie", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1ies", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2ie", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2ies", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3ie", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3ies", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4ie", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4ies", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1ifg", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2ifg", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3ifg", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4ifg", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.pinmux"), true), $$DEFAULT, "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux$$Params", "ti.catalog.msp430.peripherals.pinmux");
        po.init("ti.catalog.msp430.peripherals.pinmux.IPinMux.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.pinmux"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("p1out", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1sel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1sel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1dir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1ren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2out", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2sel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2sel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2dir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2ren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3out", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3sel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3sel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3dir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3ren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4out", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4sel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4sel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4dir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4ren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjout", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjsel0", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjsel1", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjdir", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("pjren", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1ie", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1ies", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2ie", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2ies", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3ie", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3ies", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4ie", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4ies", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p1ifg", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p2ifg", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p3ifg", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("p4ifg", Proto.Elm.newCNum("(xdc_Bits8)"), 0L, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.pinmux"), true), $$DEFAULT, "rh");
        // struct IPinMux.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.pinmux");
        po.init("ti.catalog.msp430.peripherals.pinmux.IPinMux.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
    }

    void PinMux$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/pinmux/PinMux.xs");
        om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Module", "ti.catalog.msp430.peripherals.pinmux");
        po.init("ti.catalog.msp430.peripherals.pinmux.PinMux.Module", om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.Module", "ti.catalog.msp430.peripherals.pinmux"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux$$create", "ti.catalog.msp430.peripherals.pinmux"), Global.get("ti$catalog$msp430$peripherals$pinmux$PinMux$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux$$construct", "ti.catalog.msp430.peripherals.pinmux"), Global.get("ti$catalog$msp430$peripherals$pinmux$PinMux$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.pinmux.PinMux$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.pinmux"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.pinmux"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.pinmux"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Instance", "ti.catalog.msp430.peripherals.pinmux");
        po.init("ti.catalog.msp430.peripherals.pinmux.PinMux.Instance", om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.Instance", "ti.catalog.msp430.peripherals.pinmux"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux$$Params", "ti.catalog.msp430.peripherals.pinmux");
        po.init("ti.catalog.msp430.peripherals.pinmux.PinMux.Params", om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux$$Params", "ti.catalog.msp430.peripherals.pinmux"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux$$Object", "ti.catalog.msp430.peripherals.pinmux");
        po.init("ti.catalog.msp430.peripherals.pinmux.PinMux.Object", om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Instance", "ti.catalog.msp430.peripherals.pinmux"));
    }

    void IPinMux$$ROV()
    {
    }

    void PinMux$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.pinmux.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.pinmux"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.pinmux", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.pinmux");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.pinmux.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.clock", Global.newArray()));
        imports.add(Global.newArray("ti.catalog.msp430.peripherals.special_function", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.pinmux'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.pinmux$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.pinmux$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.pinmux$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IPinMux$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux", "ti.catalog.msp430.peripherals.pinmux");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.Module", "ti.catalog.msp430.peripherals.pinmux");
        vo.init2(po, "ti.catalog.msp430.peripherals.pinmux.IPinMux", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.Instance", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.Params", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.Params", "ti.catalog.msp430.peripherals.pinmux")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.pinmux", "ti.catalog.msp430.peripherals.pinmux"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.pinmux"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IPinMux", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IPinMux");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void PinMux$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux", "ti.catalog.msp430.peripherals.pinmux");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Module", "ti.catalog.msp430.peripherals.pinmux");
        vo.init2(po, "ti.catalog.msp430.peripherals.pinmux.PinMux", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux$$capsule", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Instance", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Params", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Params", "ti.catalog.msp430.peripherals.pinmux")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.pinmux", "ti.catalog.msp430.peripherals.pinmux"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.pinmux"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.pinmux.IPinMux.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.pinmux"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.pinmux");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.pinmux")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.pinmux.PinMux$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux.Object", "ti.catalog.msp430.peripherals.pinmux"));
        pkgV.bind("PinMux", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("PinMux");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.pinmux.PinMux", "ti.catalog.msp430.peripherals.pinmux"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.pinmux.IPinMux")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.pinmux.PinMux")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.pinmux")).add(pkgV);
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
        IPinMux$$OBJECTS();
        PinMux$$OBJECTS();
        IPinMux$$CONSTS();
        PinMux$$CONSTS();
        IPinMux$$CREATES();
        PinMux$$CREATES();
        IPinMux$$FUNCTIONS();
        PinMux$$FUNCTIONS();
        IPinMux$$SIZES();
        PinMux$$SIZES();
        IPinMux$$TYPES();
        PinMux$$TYPES();
        if (isROV) {
            IPinMux$$ROV();
            PinMux$$ROV();
        }//isROV
        $$SINGLETONS();
        IPinMux$$SINGLETONS();
        PinMux$$SINGLETONS();
        $$INITIALIZATION();
    }
}
