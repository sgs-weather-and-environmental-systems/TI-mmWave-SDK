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

public class ti_catalog_msp430
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
        Global.callFxn("loadPackage", xdcO, "ti.catalog");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.catalog.msp430.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.msp430", new Value.Obj("ti.catalog.msp430", pkgP));
    }

    void IMSP430$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.IMSP430.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.IMSP430", new Value.Obj("ti.catalog.msp430.IMSP430", po));
        pkgV.bind("IMSP430", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.IMSP430.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.IMSP430$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.IMSP430.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.IMSP430$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.IMSP430.Params", new Proto.Str(po, true));
    }

    void MSP430$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.msp430.MSP430.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.msp430.MSP430", new Value.Obj("ti.catalog.msp430.MSP430", po));
        pkgV.bind("MSP430", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.msp430.MSP430.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.msp430.MSP430$$Object", new Proto.Obj());
        om.bind("ti.catalog.msp430.MSP430.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.msp430.MSP430$$Params", new Proto.Obj());
        om.bind("ti.catalog.msp430.MSP430.Params", new Proto.Str(po, true));
    }

    void IMSP430$$CONSTS()
    {
        // interface IMSP430
    }

    void MSP430$$CONSTS()
    {
        // module MSP430
    }

    void IMSP430$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void MSP430$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.MSP430$$create", new Proto.Fxn(om.findStrict("ti.catalog.msp430.MSP430.Module", "ti.catalog.msp430"), om.findStrict("ti.catalog.msp430.MSP430.Instance", "ti.catalog.msp430"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.msp430.MSP430.Params", "ti.catalog.msp430"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$MSP430$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.MSP430'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.msp430.MSP430.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.msp430']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.msp430.MSP430$$construct", new Proto.Fxn(om.findStrict("ti.catalog.msp430.MSP430.Module", "ti.catalog.msp430"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.msp430.MSP430$$Object", "ti.catalog.msp430"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.msp430.MSP430.Params", "ti.catalog.msp430"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$msp430$MSP430$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.msp430.MSP430'];\n");
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

    void IMSP430$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void MSP430$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IMSP430$$SIZES()
    {
    }

    void MSP430$$SIZES()
    {
    }

    void IMSP430$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/IMSP430.xs");
        om.bind("ti.catalog.msp430.IMSP430$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.IMSP430.Module", "ti.catalog.msp430");
        po.init("ti.catalog.msp430.IMSP430.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.IMSP430$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.IMSP430$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.IMSP430$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.IMSP430$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.IMSP430.Instance", "ti.catalog.msp430");
        po.init("ti.catalog.msp430.IMSP430.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "MSP430", "wh");
        po.addFld("isa", $$T_Str, "430", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 2L, "wh");
        po.addFld("vcc", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.IMSP430$$Params", "ti.catalog.msp430");
        po.init("ti.catalog.msp430.IMSP430.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "MSP430", "wh");
        po.addFld("isa", $$T_Str, "430", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 2L, "wh");
        po.addFld("vcc", Proto.Elm.newCNum("(xdc_Float)"), 0L, "wh");
    }

    void MSP430$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/MSP430.xs");
        om.bind("ti.catalog.msp430.MSP430$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.MSP430.Module", "ti.catalog.msp430");
        po.init("ti.catalog.msp430.MSP430.Module", om.findStrict("ti.catalog.msp430.IMSP430.Module", "ti.catalog.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.msp430.MSP430$$create", "ti.catalog.msp430"), Global.get("ti$catalog$msp430$MSP430$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.msp430.MSP430$$construct", "ti.catalog.msp430"), Global.get("ti$catalog$msp430$MSP430$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.msp430.MSP430$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.MSP430$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.msp430.MSP430$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.msp430.MSP430$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.MSP430.Instance", "ti.catalog.msp430");
        po.init("ti.catalog.msp430.MSP430.Instance", om.findStrict("ti.catalog.msp430.IMSP430.Instance", "ti.catalog.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "MSP430.*", "wh");
        po.addFld("isa", $$T_Str, "430.*", "wh");
        po.addFld("vcc", Proto.Elm.newCNum("(xdc_Float)"), 1.8, "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.MSP430$$Params", "ti.catalog.msp430");
        po.init("ti.catalog.msp430.MSP430.Params", om.findStrict("ti.catalog.msp430.IMSP430$$Params", "ti.catalog.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "MSP430.*", "wh");
        po.addFld("isa", $$T_Str, "430.*", "wh");
        po.addFld("vcc", Proto.Elm.newCNum("(xdc_Float)"), 1.8, "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.MSP430$$Object", "ti.catalog.msp430");
        po.init("ti.catalog.msp430.MSP430.Object", om.findStrict("ti.catalog.msp430.MSP430.Instance", "ti.catalog.msp430"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.msp430"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.msp430"), fxn);
    }

    void IMSP430$$ROV()
    {
    }

    void MSP430$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.msp430.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.msp430"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/msp430/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.catalog.msp430"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.catalog.msp430"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.catalog.msp430"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.catalog.msp430"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.catalog.msp430"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.catalog.msp430"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.catalog.msp430", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.msp430");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.msp430.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.platform", Global.newArray()));
        imports.add(Global.newArray("ti.catalog", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.msp430'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.msp430$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.msp430$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.msp430$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IMSP430$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.IMSP430", "ti.catalog.msp430");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.IMSP430.Module", "ti.catalog.msp430");
        vo.init2(po, "ti.catalog.msp430.IMSP430", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.IMSP430$$capsule", "ti.catalog.msp430"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.IMSP430.Instance", "ti.catalog.msp430"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.IMSP430.Params", "ti.catalog.msp430"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.IMSP430.Params", "ti.catalog.msp430")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430", "ti.catalog.msp430"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IMSP430", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IMSP430");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void MSP430$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.msp430.MSP430", "ti.catalog.msp430");
        po = (Proto.Obj)om.findStrict("ti.catalog.msp430.MSP430.Module", "ti.catalog.msp430");
        vo.init2(po, "ti.catalog.msp430.MSP430", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.msp430.MSP430$$capsule", "ti.catalog.msp430"));
        vo.bind("Instance", om.findStrict("ti.catalog.msp430.MSP430.Instance", "ti.catalog.msp430"));
        vo.bind("Params", om.findStrict("ti.catalog.msp430.MSP430.Params", "ti.catalog.msp430"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.msp430.MSP430.Params", "ti.catalog.msp430")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.msp430", "ti.catalog.msp430"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.catalog.msp430");
        inherits.add("ti.catalog");
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.msp430")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.msp430.MSP430$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.msp430.MSP430.Object", "ti.catalog.msp430"));
        pkgV.bind("MSP430", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("MSP430");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.msp430.MSP430", "ti.catalog.msp430"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.msp430.IMSP430")).bless();
        ((Value.Obj)om.getv("ti.catalog.msp430.MSP430")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.msp430")).add(pkgV);
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
        IMSP430$$OBJECTS();
        MSP430$$OBJECTS();
        IMSP430$$CONSTS();
        MSP430$$CONSTS();
        IMSP430$$CREATES();
        MSP430$$CREATES();
        IMSP430$$FUNCTIONS();
        MSP430$$FUNCTIONS();
        IMSP430$$SIZES();
        MSP430$$SIZES();
        IMSP430$$TYPES();
        MSP430$$TYPES();
        if (isROV) {
            IMSP430$$ROV();
            MSP430$$ROV();
        }//isROV
        $$SINGLETONS();
        IMSP430$$SINGLETONS();
        MSP430$$SINGLETONS();
        $$INITIALIZATION();
    }
}
