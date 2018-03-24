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

public class ti_catalog_c7000
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
        pkgP = (Proto.Obj)om.bind("ti.catalog.c7000.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.catalog.c7000", new Value.Obj("ti.catalog.c7000", pkgP));
    }

    void TMS320C7100$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c7000.TMS320C7100.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c7000.TMS320C7100", new Value.Obj("ti.catalog.c7000.TMS320C7100", po));
        pkgV.bind("TMS320C7100", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.catalog.c7000.TMS320C7100.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.catalog.c7000.TMS320C7100$$Object", new Proto.Obj());
        om.bind("ti.catalog.c7000.TMS320C7100.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.catalog.c7000.TMS320C7100$$Params", new Proto.Obj());
        om.bind("ti.catalog.c7000.TMS320C7100.Params", new Proto.Str(po, true));
    }

    void ICacheInfo$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.catalog.c7000.ICacheInfo.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.catalog.c7000.ICacheInfo", new Value.Obj("ti.catalog.c7000.ICacheInfo", po));
        pkgV.bind("ICacheInfo", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.catalog.c7000.ICacheInfo$$CacheDesc", new Proto.Obj());
        om.bind("ti.catalog.c7000.ICacheInfo.CacheDesc", new Proto.Str(spo, true));
    }

    void TMS320C7100$$CONSTS()
    {
        // module TMS320C7100
    }

    void ICacheInfo$$CONSTS()
    {
        // interface ICacheInfo
    }

    void TMS320C7100$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.catalog.c7000.TMS320C7100$$create", new Proto.Fxn(om.findStrict("ti.catalog.c7000.TMS320C7100.Module", "ti.catalog.c7000"), om.findStrict("ti.catalog.c7000.TMS320C7100.Instance", "ti.catalog.c7000"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.catalog.c7000.TMS320C7100.Params", "ti.catalog.c7000"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c7000$TMS320C7100$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c7000.TMS320C7100'];\n");
            sb.append("var __inst = xdc.om['ti.catalog.c7000.TMS320C7100.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.catalog.c7000']);\n");
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
        fxn = (Proto.Fxn)om.bind("ti.catalog.c7000.TMS320C7100$$construct", new Proto.Fxn(om.findStrict("ti.catalog.c7000.TMS320C7100.Module", "ti.catalog.c7000"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.catalog.c7000.TMS320C7100$$Object", "ti.catalog.c7000"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.catalog.c7000.TMS320C7100.Params", "ti.catalog.c7000"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$catalog$c7000$TMS320C7100$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.catalog.c7000.TMS320C7100'];\n");
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

    void ICacheInfo$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TMS320C7100$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ICacheInfo$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TMS320C7100$$SIZES()
    {
    }

    void ICacheInfo$$SIZES()
    {
    }

    void TMS320C7100$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/c7000/TMS320C7100.xs");
        om.bind("ti.catalog.c7000.TMS320C7100$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.catalog.c7000.TMS320C7100.Module", "ti.catalog.c7000");
        po.init("ti.catalog.c7000.TMS320C7100.Module", om.findStrict("ti.catalog.ICpuDataSheet.Module", "ti.catalog.c7000"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cacheSizeL1", new Proto.Map(Proto.Elm.newCNum("(xdc_Long)")), Global.newArray(new Object[]{Global.newArray(new Object[]{"0k", 0x0000L}), Global.newArray(new Object[]{"4k", 0x1000L}), Global.newArray(new Object[]{"8k", 0x2000L}), Global.newArray(new Object[]{"16k", 0x4000L}), Global.newArray(new Object[]{"32k", 0x8000L})}), "wh");
        po.addFld("cacheSizeL2", new Proto.Map(Proto.Elm.newCNum("(xdc_Long)")), Global.newArray(new Object[]{Global.newArray(new Object[]{"0k", 0x000000L}), Global.newArray(new Object[]{"32k", 0x008000L}), Global.newArray(new Object[]{"64k", 0x010000L}), Global.newArray(new Object[]{"128k", 0x020000L}), Global.newArray(new Object[]{"256k", 0x040000L}), Global.newArray(new Object[]{"512k", 0x080000L}), Global.newArray(new Object[]{"1024k", 0x100000L})}), "wh");
        po.addFld("cacheMap", new Proto.Map((Proto)om.findStrict("ti.catalog.c7000.ICacheInfo.CacheDesc", "ti.catalog.c7000")), Global.newArray(new Object[]{Global.newArray(new Object[]{"l1PMode", Global.newObject("desc", "L1P Cache", "base", 0x00E00000L, "map", Global.newArray(new Object[]{Global.newArray(new Object[]{"0k", 0x0000L}), Global.newArray(new Object[]{"4k", 0x1000L}), Global.newArray(new Object[]{"8k", 0x2000L}), Global.newArray(new Object[]{"16k", 0x4000L}), Global.newArray(new Object[]{"32k", 0x8000L})}), "defaultValue", "32k", "memorySection", "L1PSRAM")}), Global.newArray(new Object[]{"l1DMode", Global.newObject("desc", "L1D Cache", "base", 0x00F00000L, "map", Global.newArray(new Object[]{Global.newArray(new Object[]{"0k", 0x0000L}), Global.newArray(new Object[]{"4k", 0x1000L}), Global.newArray(new Object[]{"8k", 0x2000L}), Global.newArray(new Object[]{"16k", 0x4000L}), Global.newArray(new Object[]{"32k", 0x8000L})}), "defaultValue", "32k", "memorySection", "L1DSRAM")}), Global.newArray(new Object[]{"l2Mode", Global.newObject("desc", "L2 Cache", "base", 0x00800000L, "map", Global.newArray(new Object[]{Global.newArray(new Object[]{"0k", 0x0000L}), Global.newArray(new Object[]{"32k", 0x8000L}), Global.newArray(new Object[]{"64k", 0x10000L}), Global.newArray(new Object[]{"128k", 0x020000L}), Global.newArray(new Object[]{"256k", 0x040000L}), Global.newArray(new Object[]{"512k", 0x080000L}), Global.newArray(new Object[]{"1024k", 0x100000L})}), "defaultValue", "0k", "memorySection", "L2SRAM")})}), "rh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.catalog.c7000.TMS320C7100$$create", "ti.catalog.c7000"), Global.get("ti$catalog$c7000$TMS320C7100$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.catalog.c7000.TMS320C7100$$construct", "ti.catalog.c7000"), Global.get("ti$catalog$c7000$TMS320C7100$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.catalog.c7000.TMS320C7100$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.catalog.c7000.TMS320C7100$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.catalog.c7000.TMS320C7100$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.catalog.c7000.TMS320C7100$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.c7000.TMS320C7100.Instance", "ti.catalog.c7000");
        po.init("ti.catalog.c7000.TMS320C7100.Instance", om.findStrict("ti.catalog.ICpuDataSheet.Instance", "ti.catalog.c7000"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "7100", "wh");
        po.addFld("isa", $$T_Str, "71", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c7000")), Global.newArray(new Object[]{Global.newArray(new Object[]{"L2SRAM", Global.newObject("comment", "1MB L2 SRAM/CACHE", "name", "L2SRAM", "base", 0x00800000L, "len", 0x00100000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"L1PSRAM", Global.newObject("comment", "32KB RAM/CACHE L1 program memory", "name", "L1PSRAM", "base", 0x00E00000L, "len", 0x00008000L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"L1DSRAM", Global.newObject("comment", "32KB RAM/CACHE L1 data memory", "name", "L1DSRAM", "base", 0x00F00000L, "len", 0x00008000L, "space", "data", "access", "RW")})}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c7000"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c7000"), fxn);
        po = (Proto.Obj)om.findStrict("ti.catalog.c7000.TMS320C7100$$Params", "ti.catalog.c7000");
        po.init("ti.catalog.c7000.TMS320C7100.Params", om.findStrict("ti.catalog.ICpuDataSheet$$Params", "ti.catalog.c7000"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "7100", "wh");
        po.addFld("isa", $$T_Str, "71", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.catalog.c7000")), Global.newArray(new Object[]{Global.newArray(new Object[]{"L2SRAM", Global.newObject("comment", "1MB L2 SRAM/CACHE", "name", "L2SRAM", "base", 0x00800000L, "len", 0x00100000L, "space", "code/data", "access", "RWX")}), Global.newArray(new Object[]{"L1PSRAM", Global.newObject("comment", "32KB RAM/CACHE L1 program memory", "name", "L1PSRAM", "base", 0x00E00000L, "len", 0x00008000L, "space", "code", "access", "RWX")}), Global.newArray(new Object[]{"L1DSRAM", Global.newObject("comment", "32KB RAM/CACHE L1 data memory", "name", "L1DSRAM", "base", 0x00F00000L, "len", 0x00008000L, "space", "data", "access", "RW")})}), "wh");
        po = (Proto.Obj)om.findStrict("ti.catalog.c7000.TMS320C7100$$Object", "ti.catalog.c7000");
        po.init("ti.catalog.c7000.TMS320C7100.Object", om.findStrict("ti.catalog.c7000.TMS320C7100.Instance", "ti.catalog.c7000"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "ti.catalog.c7000"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "ti.catalog.c7000"), fxn);
    }

    void ICacheInfo$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.catalog.c7000.ICacheInfo.Module", "ti.catalog.c7000");
        po.init("ti.catalog.c7000.ICacheInfo.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        // struct ICacheInfo.CacheDesc
        po = (Proto.Obj)om.findStrict("ti.catalog.c7000.ICacheInfo$$CacheDesc", "ti.catalog.c7000");
        po.init("ti.catalog.c7000.ICacheInfo.CacheDesc", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("desc", $$T_Str, $$UNDEF, "w");
                po.addFld("base", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("map", new Proto.Map(Proto.Elm.newCNum("(xdc_UInt)")), $$DEFAULT, "w");
                po.addFld("defaultValue", $$T_Str, $$UNDEF, "w");
                po.addFld("memorySection", $$T_Str, $$UNDEF, "w");
    }

    void TMS320C7100$$ROV()
    {
    }

    void ICacheInfo$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.catalog.c7000.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.catalog.c7000"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/catalog/c7000/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.catalog.c7000"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.catalog.c7000"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.catalog.c7000"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.catalog.c7000"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.catalog.c7000"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.catalog.c7000"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.catalog.c7000", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.catalog.c7000");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.catalog.c7000.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.platform", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.catalog.c7000'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.catalog.c7000$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.catalog.c7000$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.catalog.c7000$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void TMS320C7100$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c7000.TMS320C7100", "ti.catalog.c7000");
        po = (Proto.Obj)om.findStrict("ti.catalog.c7000.TMS320C7100.Module", "ti.catalog.c7000");
        vo.init2(po, "ti.catalog.c7000.TMS320C7100", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.catalog.c7000.TMS320C7100$$capsule", "ti.catalog.c7000"));
        vo.bind("Instance", om.findStrict("ti.catalog.c7000.TMS320C7100.Instance", "ti.catalog.c7000"));
        vo.bind("Params", om.findStrict("ti.catalog.c7000.TMS320C7100.Params", "ti.catalog.c7000"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.catalog.c7000.TMS320C7100.Params", "ti.catalog.c7000")).newInstance());
        vo.bind("$package", om.findStrict("ti.catalog.c7000", "ti.catalog.c7000"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.catalog.c7000")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.catalog.c7000.TMS320C7100$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.catalog.c7000.TMS320C7100.Object", "ti.catalog.c7000"));
        pkgV.bind("TMS320C7100", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TMS320C7100");
    }

    void ICacheInfo$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.catalog.c7000.ICacheInfo", "ti.catalog.c7000");
        po = (Proto.Obj)om.findStrict("ti.catalog.c7000.ICacheInfo.Module", "ti.catalog.c7000");
        vo.init2(po, "ti.catalog.c7000.ICacheInfo", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.catalog.c7000", "ti.catalog.c7000"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("CacheDesc", om.findStrict("ti.catalog.c7000.ICacheInfo.CacheDesc", "ti.catalog.c7000"));
        tdefs.add(om.findStrict("ti.catalog.c7000.ICacheInfo.CacheDesc", "ti.catalog.c7000"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ICacheInfo", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ICacheInfo");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.catalog.c7000.TMS320C7100", "ti.catalog.c7000"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.catalog.c7000.TMS320C7100")).bless();
        ((Value.Obj)om.getv("ti.catalog.c7000.ICacheInfo")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.catalog.c7000")).add(pkgV);
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
        TMS320C7100$$OBJECTS();
        ICacheInfo$$OBJECTS();
        TMS320C7100$$CONSTS();
        ICacheInfo$$CONSTS();
        TMS320C7100$$CREATES();
        ICacheInfo$$CREATES();
        TMS320C7100$$FUNCTIONS();
        ICacheInfo$$FUNCTIONS();
        TMS320C7100$$SIZES();
        ICacheInfo$$SIZES();
        TMS320C7100$$TYPES();
        ICacheInfo$$TYPES();
        if (isROV) {
            TMS320C7100$$ROV();
            ICacheInfo$$ROV();
        }//isROV
        $$SINGLETONS();
        TMS320C7100$$SINGLETONS();
        ICacheInfo$$SINGLETONS();
        $$INITIALIZATION();
    }
}
