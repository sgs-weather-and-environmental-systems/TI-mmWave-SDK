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

public class ti_platforms_sim28xx
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
        Global.callFxn("loadPackage", xdcO, "ti.catalog.c2800");
        Global.callFxn("loadPackage", xdcO, "xdc.platform");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.platforms.sim28xx.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.platforms.sim28xx", new Value.Obj("ti.platforms.sim28xx", pkgP));
    }

    void Platform$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.platforms.sim28xx.Platform.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.platforms.sim28xx.Platform", new Value.Obj("ti.platforms.sim28xx.Platform", po));
        pkgV.bind("Platform", vo);
        // decls 
        om.bind("ti.platforms.sim28xx.Platform.Board", om.findStrict("xdc.platform.IPlatform.Board", "ti.platforms.sim28xx"));
        om.bind("ti.platforms.sim28xx.Platform.Memory", om.findStrict("xdc.platform.IPlatform.Memory", "ti.platforms.sim28xx"));
        // insts 
        Object insP = om.bind("ti.platforms.sim28xx.Platform.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.platforms.sim28xx.Platform$$Object", new Proto.Obj());
        om.bind("ti.platforms.sim28xx.Platform.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("ti.platforms.sim28xx.Platform$$Params", new Proto.Obj());
        om.bind("ti.platforms.sim28xx.Platform.Params", new Proto.Str(po, true));
    }

    void Platform$$CONSTS()
    {
        // module Platform
    }

    void Platform$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("ti.platforms.sim28xx.Platform$$create", new Proto.Fxn(om.findStrict("ti.platforms.sim28xx.Platform.Module", "ti.platforms.sim28xx"), om.findStrict("ti.platforms.sim28xx.Platform.Instance", "ti.platforms.sim28xx"), 2, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("ti.platforms.sim28xx.Platform.Params", "ti.platforms.sim28xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$platforms$sim28xx$Platform$$create = function( name, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.platforms.sim28xx.Platform'];\n");
            sb.append("var __inst = xdc.om['ti.platforms.sim28xx.Platform.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['ti.platforms.sim28xx']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {name:name});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.externalMemoryMap = __mod.PARAMS.externalMemoryMap;\n");
            sb.append("__inst.customMemoryMap = __mod.PARAMS.customMemoryMap;\n");
            sb.append("__inst.renameMap = __mod.PARAMS.renameMap;\n");
            sb.append("__inst.dataMemory = __mod.PARAMS.dataMemory;\n");
            sb.append("__inst.codeMemory = __mod.PARAMS.codeMemory;\n");
            sb.append("__inst.stackMemory = __mod.PARAMS.stackMemory;\n");
            sb.append("__inst.sectMap = __mod.PARAMS.sectMap;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceName = __mod.PARAMS.deviceName;\n");
            sb.append("__inst.ftpath = __mod.PARAMS.ftpath;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [name]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("ti.platforms.sim28xx.Platform$$construct", new Proto.Fxn(om.findStrict("ti.platforms.sim28xx.Platform.Module", "ti.platforms.sim28xx"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.platforms.sim28xx.Platform$$Object", "ti.platforms.sim28xx"), null);
                fxn.addArg(1, "name", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("ti.platforms.sim28xx.Platform.Params", "ti.platforms.sim28xx"), Global.newObject());
        sb = new StringBuilder();
        sb.append("ti$platforms$sim28xx$Platform$$construct = function( __obj, name, __params ) {\n");
            sb.append("var __mod = xdc.om['ti.platforms.sim28xx.Platform'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {name:name});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.externalMemoryMap = __mod.PARAMS.externalMemoryMap;\n");
            sb.append("__inst.customMemoryMap = __mod.PARAMS.customMemoryMap;\n");
            sb.append("__inst.renameMap = __mod.PARAMS.renameMap;\n");
            sb.append("__inst.dataMemory = __mod.PARAMS.dataMemory;\n");
            sb.append("__inst.codeMemory = __mod.PARAMS.codeMemory;\n");
            sb.append("__inst.stackMemory = __mod.PARAMS.stackMemory;\n");
            sb.append("__inst.sectMap = __mod.PARAMS.sectMap;\n");
            sb.append("__inst.peripherals = __mod.PARAMS.peripherals;\n");
            sb.append("__inst.deviceName = __mod.PARAMS.deviceName;\n");
            sb.append("__inst.ftpath = __mod.PARAMS.ftpath;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Platform$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Platform$$SIZES()
    {
    }

    void Platform$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/platforms/sim28xx/Platform.xs");
        om.bind("ti.platforms.sim28xx.Platform$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.platforms.sim28xx.Platform.Module", "ti.platforms.sim28xx");
        po.init("ti.platforms.sim28xx.Platform.Module", om.findStrict("xdc.platform.IPlatform.Module", "ti.platforms.sim28xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("BOARD", (Proto)om.findStrict("xdc.platform.IPlatform.Board", "ti.platforms.sim28xx"), Global.newObject("id", "0", "boardName", "sim28xx", "boardFamily", "sim28xx", "boardRevision", null), "rh");
        po.addFld("CPU", (Proto)om.findStrict("xdc.platform.IExeContext.Cpu", "ti.platforms.sim28xx"), Global.newObject("id", "0", "clockRate", 150.0, "catalogName", "ti.catalog.c2800", "deviceName", "TMS320C2812", "revision", null), "rh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("ti.platforms.sim28xx.Platform$$create", "ti.platforms.sim28xx"), Global.get("ti$platforms$sim28xx$Platform$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.platforms.sim28xx.Platform$$construct", "ti.platforms.sim28xx"), Global.get("ti$platforms$sim28xx$Platform$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.platforms.sim28xx.Platform$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.platforms.sim28xx.Platform$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.platforms.sim28xx.Platform$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.platforms.sim28xx.Platform$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("ti.platforms.sim28xx.Platform.Instance", "ti.platforms.sim28xx");
        po.init("ti.platforms.sim28xx.Platform.Instance", om.findStrict("xdc.platform.IPlatform.Instance", "ti.platforms.sim28xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("deviceName", $$T_Str, $$UNDEF, "wh");
        po.addFld("externalMemoryMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.platforms.sim28xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"SRAM", Global.newObject("name", "SRAM", "base", 0x100000L, "len", 0x10000L, "page", 0L, "space", "code/data")})}), "rh");
        po.addFld("ftpath", $$T_Str, $$UNDEF, "rh");
        po.addFld("codeMemory", $$T_Str, "SRAM", "wh");
        po.addFld("dataMemory", $$T_Str, "SRAM", "wh");
        po.addFld("stackMemory", $$T_Str, "LSARAM", "wh");
                fxn = Global.get(cap, "getCpuDataSheet");
                if (fxn != null) po.addFxn("getCpuDataSheet", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCpuDataSheet", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getCreateArgs");
                if (fxn != null) po.addFxn("getCreateArgs", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCreateArgs", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getExeContext");
                if (fxn != null) po.addFxn("getExeContext", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExeContext", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getExecCmd");
                if (fxn != null) po.addFxn("getExecCmd", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExecCmd", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getLinkTemplate");
                if (fxn != null) po.addFxn("getLinkTemplate", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getLinkTemplate", "ti.platforms.sim28xx"), fxn);
        po = (Proto.Obj)om.findStrict("ti.platforms.sim28xx.Platform$$Params", "ti.platforms.sim28xx");
        po.init("ti.platforms.sim28xx.Platform.Params", om.findStrict("xdc.platform.IPlatform$$Params", "ti.platforms.sim28xx"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("deviceName", $$T_Str, $$UNDEF, "wh");
        po.addFld("externalMemoryMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "ti.platforms.sim28xx")), Global.newArray(new Object[]{Global.newArray(new Object[]{"SRAM", Global.newObject("name", "SRAM", "base", 0x100000L, "len", 0x10000L, "page", 0L, "space", "code/data")})}), "rh");
        po.addFld("ftpath", $$T_Str, $$UNDEF, "rh");
        po.addFld("codeMemory", $$T_Str, "SRAM", "wh");
        po.addFld("dataMemory", $$T_Str, "SRAM", "wh");
        po.addFld("stackMemory", $$T_Str, "LSARAM", "wh");
        po = (Proto.Obj)om.findStrict("ti.platforms.sim28xx.Platform$$Object", "ti.platforms.sim28xx");
        po.init("ti.platforms.sim28xx.Platform.Object", om.findStrict("ti.platforms.sim28xx.Platform.Instance", "ti.platforms.sim28xx"));
                fxn = Global.get(cap, "getCpuDataSheet");
                if (fxn != null) po.addFxn("getCpuDataSheet", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCpuDataSheet", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getCreateArgs");
                if (fxn != null) po.addFxn("getCreateArgs", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCreateArgs", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getExeContext");
                if (fxn != null) po.addFxn("getExeContext", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExeContext", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getExecCmd");
                if (fxn != null) po.addFxn("getExecCmd", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExecCmd", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getLinkTemplate");
                if (fxn != null) po.addFxn("getLinkTemplate", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getLinkTemplate", "ti.platforms.sim28xx"), fxn);
    }

    void Platform$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.platforms.sim28xx.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.platforms.sim28xx"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/platforms/sim28xx/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.platforms.sim28xx"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.platforms.sim28xx"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.platforms.sim28xx", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.platforms.sim28xx");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.platforms.sim28xx.");
        pkgV.bind("$vers", Global.newArray(1, 0, 1, 1));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.catalog.c2800", Global.newArray()));
        imports.add(Global.newArray("xdc.platform", Global.newArray(1, 0, 1)));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.platforms.sim28xx'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.platforms.sim28xx$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.platforms.sim28xx$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.platforms.sim28xx$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Platform$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.platforms.sim28xx.Platform", "ti.platforms.sim28xx");
        po = (Proto.Obj)om.findStrict("ti.platforms.sim28xx.Platform.Module", "ti.platforms.sim28xx");
        vo.init2(po, "ti.platforms.sim28xx.Platform", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.platforms.sim28xx.Platform$$capsule", "ti.platforms.sim28xx"));
        vo.bind("Instance", om.findStrict("ti.platforms.sim28xx.Platform.Instance", "ti.platforms.sim28xx"));
        vo.bind("Params", om.findStrict("ti.platforms.sim28xx.Platform.Params", "ti.platforms.sim28xx"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.platforms.sim28xx.Platform.Params", "ti.platforms.sim28xx")).newInstance());
        vo.bind("$package", om.findStrict("ti.platforms.sim28xx", "ti.platforms.sim28xx"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Board", om.findStrict("xdc.platform.IPlatform.Board", "ti.platforms.sim28xx"));
        tdefs.add(om.findStrict("xdc.platform.IPlatform.Board", "ti.platforms.sim28xx"));
        vo.bind("Memory", om.findStrict("xdc.platform.IPlatform.Memory", "ti.platforms.sim28xx"));
        tdefs.add(om.findStrict("xdc.platform.IPlatform.Memory", "ti.platforms.sim28xx"));
        vo.bind("MemoryMap", om.findStrict("xdc.platform.IPlatform.MemoryMap", "ti.platforms.sim28xx"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.platforms.sim28xx")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.platforms.sim28xx.Platform$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.platforms.sim28xx.Platform.Object", "ti.platforms.sim28xx"));
        pkgV.bind("Platform", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Platform");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.platforms.sim28xx.Platform", "ti.platforms.sim28xx"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.platforms.sim28xx.Platform")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.platforms.sim28xx")).add(pkgV);
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
        Platform$$OBJECTS();
        Platform$$CONSTS();
        Platform$$CREATES();
        Platform$$FUNCTIONS();
        Platform$$SIZES();
        Platform$$TYPES();
        if (isROV) {
            Platform$$ROV();
        }//isROV
        $$SINGLETONS();
        Platform$$SINGLETONS();
        $$INITIALIZATION();
    }
}
