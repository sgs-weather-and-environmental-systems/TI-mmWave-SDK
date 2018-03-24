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

public class ti_catalog_msp430_peripherals_rtc
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
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.rtc", new Value.Obj("ti.catalog.msp430.peripherals.rtc", pkgP));
    }

    void IRTC$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.IRTC.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.IRTC", new Value.Obj("ti.catalog.msp430.peripherals.rtc.IRTC", po));
        pkgV.bind("IRTC", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.IRTC$$ForceSetDefaultRegister_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.rtc.IRTC.ForceSetDefaultRegister_t", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.IRTC$$regIntVect_t", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.rtc.IRTC.regIntVect_t", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.rtc.IRTC.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.IRTC$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.rtc.IRTC.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.IRTC$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.rtc.IRTC.Params", new Proto.Str(po, true));
    }

    void RTC_B$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B", new Value.Obj("ti.catalog.msp430.peripherals.rtc.RTC_B", po));
        pkgV.bind("RTC_B", vo);
        // decls 
        om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B.ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.rtc"));
        om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B.regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.regIntVect_t", "ti.catalog.msp430.peripherals.rtc"));
        // insts 
        Object insP = om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B.Params", new Proto.Str(po, true));
    }

    void IRTC$$CONSTS()
    {
        // interface IRTC
    }

    void RTC_B$$CONSTS()
    {
        // module RTC_B
    }

    void IRTC$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void RTC_B$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Module", "ti.catalog.msp430.peripherals.rtc"), om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Instance", "ti.catalog.msp430.peripherals.rtc"), 1, 0, false));
                fxn.addArg(0, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Params", "ti.catalog.msp430.peripherals.rtc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$rtc$RTC_B$$create = function( __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.rtc.RTC_B'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.peripherals.rtc.RTC_B.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430.peripherals.rtc']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Module", "ti.catalog.msp430.peripherals.rtc"), null, 2, 0, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B$$Object", "ti.catalog.msp430.peripherals.rtc"), null);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Params", "ti.catalog.msp430.peripherals.rtc"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$peripherals$rtc$RTC_B$$construct = function( __obj, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.peripherals.rtc.RTC_B'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.name = __mod.PARAMS.name;\n");
            sb.append("__inst.owner = __mod.PARAMS.owner;\n");
            sb.append("__inst.baseAddr = __mod.PARAMS.baseAddr;\n");
            sb.append("__inst.interruptSource = __mod.PARAMS.interruptSource;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void IRTC$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void RTC_B$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IRTC$$SIZES()
    {
    }

    void RTC_B$$SIZES()
    {
    }

    void IRTC$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.Module", "ti.catalog.msp430.peripherals.rtc");
        po.init("ti.catalog.msp430.peripherals.rtc.IRTC.Module", om.findStrict("xdc.platform.IPeripheral.Module", "ti.catalog.msp430.peripherals.rtc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.Instance", "ti.catalog.msp430.peripherals.rtc");
        po.init("ti.catalog.msp430.peripherals.rtc.IRTC.Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "ti.catalog.msp430.peripherals.rtc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC$$Params", "ti.catalog.msp430.peripherals.rtc");
        po.init("ti.catalog.msp430.peripherals.rtc.IRTC.Params", om.findStrict("xdc.platform.IPeripheral$$Params", "ti.catalog.msp430.peripherals.rtc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct IRTC.ForceSetDefaultRegister_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC$$ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.rtc");
        po.init("ti.catalog.msp430.peripherals.rtc.IRTC.ForceSetDefaultRegister_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("register", $$T_Str, $$UNDEF, "w");
                po.addFld("regForceSet", $$T_Bool, $$UNDEF, "w");
        // struct IRTC.regIntVect_t
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC$$regIntVect_t", "ti.catalog.msp430.peripherals.rtc");
        po.init("ti.catalog.msp430.peripherals.rtc.IRTC.regIntVect_t", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("registerName", $$T_Str, $$UNDEF, "w");
                po.addFld("registerDescription", $$T_Str, $$UNDEF, "w");
                po.addFld("isrToggleString", $$T_Str, $$UNDEF, "w");
                po.addFld("priorityName", $$T_Str, $$UNDEF, "w");
                po.addFld("interruptEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("interruptHandler", $$T_Bool, $$UNDEF, "w");
                po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
    }

    void RTC_B$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/peripherals/rtc/RTC_B.xs");
        om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Module", "ti.catalog.msp430.peripherals.rtc");
        po.init("ti.catalog.msp430.peripherals.rtc.RTC_B.Module", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.Module", "ti.catalog.msp430.peripherals.rtc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B$$create", "ti.catalog.msp430.peripherals.rtc"), Global.get("ti$catalog$msp430$peripherals$rtc$RTC_B$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B$$construct", "ti.catalog.msp430.peripherals.rtc"), Global.get("ti$catalog$msp430$peripherals$rtc$RTC_B$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.peripherals.rtc.RTC_B$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "ti.catalog.msp430.peripherals.rtc"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "ti.catalog.msp430.peripherals.rtc"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "ti.catalog.msp430.peripherals.rtc"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Instance", "ti.catalog.msp430.peripherals.rtc");
        po.init("ti.catalog.msp430.peripherals.rtc.RTC_B.Instance", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.Instance", "ti.catalog.msp430.peripherals.rtc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.regIntVect_t", "ti.catalog.msp430.peripherals.rtc"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.rtc"), false), Global.newArray(new Object[]{}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B$$Params", "ti.catalog.msp430.peripherals.rtc");
        po.init("ti.catalog.msp430.peripherals.rtc.RTC_B.Params", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC$$Params", "ti.catalog.msp430.peripherals.rtc"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("baseAddr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "wh");
        po.addFld("interruptSource", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.regIntVect_t", "ti.catalog.msp430.peripherals.rtc"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
        po.addFld("forceSetDefaultRegister", new Proto.Arr((Proto)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.rtc"), false), Global.newArray(new Object[]{}), "rh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B$$Object", "ti.catalog.msp430.peripherals.rtc");
        po.init("ti.catalog.msp430.peripherals.rtc.RTC_B.Object", om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Instance", "ti.catalog.msp430.peripherals.rtc"));
    }

    void IRTC$$ROV()
    {
    }

    void RTC_B$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.peripherals.rtc.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430.peripherals.rtc"));
        pkgP.bind("$capsule", $$UNDEF);
        pkgV.init2(pkgP, "ti.catalog.msp430.peripherals.rtc", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430.peripherals.rtc");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.peripherals.rtc.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430.peripherals.rtc'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430.peripherals.rtc$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430.peripherals.rtc$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430.peripherals.rtc$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IRTC$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC", "ti.catalog.msp430.peripherals.rtc");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.Module", "ti.catalog.msp430.peripherals.rtc");
        vo.init2(po, "ti.catalog.msp430.peripherals.rtc.IRTC", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.Instance", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.Params", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.Params", "ti.catalog.msp430.peripherals.rtc")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.rtc", "ti.catalog.msp430.peripherals.rtc"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.rtc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.regIntVect_t", "ti.catalog.msp430.peripherals.rtc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.regIntVect_t", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IRTC", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IRTC");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void RTC_B$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B", "ti.catalog.msp430.peripherals.rtc");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Module", "ti.catalog.msp430.peripherals.rtc");
        vo.init2(po, "ti.catalog.msp430.peripherals.rtc.RTC_B", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B$$capsule", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Instance", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Params", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Params", "ti.catalog.msp430.peripherals.rtc")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430.peripherals.rtc", "ti.catalog.msp430.peripherals.rtc"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("ForceSetDefaultRegister_t", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.rtc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.ForceSetDefaultRegister_t", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("regIntVect_t", om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.regIntVect_t", "ti.catalog.msp430.peripherals.rtc"));
        tdefs.add(om.findStrict("ti.catalog.msp430.peripherals.rtc.IRTC.regIntVect_t", "ti.catalog.msp430.peripherals.rtc"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430.peripherals.rtc");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430.peripherals.rtc")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.peripherals.rtc.RTC_B$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B.Object", "ti.catalog.msp430.peripherals.rtc"));
        pkgV.bind("RTC_B", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("RTC_B");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.peripherals.rtc.RTC_B", "ti.catalog.msp430.peripherals.rtc"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.rtc.IRTC")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.peripherals.rtc.RTC_B")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430.peripherals.rtc")).add(pkgV);
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
        IRTC$$OBJECTS();
        RTC_B$$OBJECTS();
        IRTC$$CONSTS();
        RTC_B$$CONSTS();
        IRTC$$CREATES();
        RTC_B$$CREATES();
        IRTC$$FUNCTIONS();
        RTC_B$$FUNCTIONS();
        IRTC$$SIZES();
        RTC_B$$SIZES();
        IRTC$$TYPES();
        RTC_B$$TYPES();
        if (isROV) {
            IRTC$$ROV();
            RTC_B$$ROV();
        }//isROV
        $$SINGLETONS();
        IRTC$$SINGLETONS();
        RTC_B$$SINGLETONS();
        $$INITIALIZATION();
    }
}
