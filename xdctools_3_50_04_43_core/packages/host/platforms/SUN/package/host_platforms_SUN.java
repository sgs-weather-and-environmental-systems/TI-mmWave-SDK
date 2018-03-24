/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D21
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class host_platforms_SUN
{
    static final String VERS = "@(#) xdc-D21\n";

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
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("host.platforms.SUN.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("host.platforms.SUN", new Value.Obj("host.platforms.SUN", pkgP));
    }

    void Platform$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("host.platforms.SUN.Platform.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("host.platforms.SUN.Platform", new Value.Obj("host.platforms.SUN.Platform", po));
        pkgV.bind("Platform", vo);
        // decls 
        om.bind("host.platforms.SUN.Platform.Board", om.findStrict("xdc.platform.IPlatform.Board", "host.platforms.SUN"));
        om.bind("host.platforms.SUN.Platform.Memory", om.findStrict("xdc.platform.IPlatform.Memory", "host.platforms.SUN"));
        // insts 
        Object insP = om.bind("host.platforms.SUN.Platform.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("host.platforms.SUN.Platform$$Object", new Proto.Obj());
        om.bind("host.platforms.SUN.Platform.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("host.platforms.SUN.Platform$$Params", new Proto.Obj());
        om.bind("host.platforms.SUN.Platform.Params", new Proto.Str(po, true));
    }

    void SunSparc7$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("host.platforms.SUN.SunSparc7.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("host.platforms.SUN.SunSparc7", new Value.Obj("host.platforms.SUN.SunSparc7", po));
        pkgV.bind("SunSparc7", vo);
        // decls 
        // insts 
        Object insP = om.bind("host.platforms.SUN.SunSparc7.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("host.platforms.SUN.SunSparc7$$Object", new Proto.Obj());
        om.bind("host.platforms.SUN.SunSparc7.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("host.platforms.SUN.SunSparc7$$Params", new Proto.Obj());
        om.bind("host.platforms.SUN.SunSparc7.Params", new Proto.Str(po, true));
    }

    void Platform$$CONSTS()
    {
        // module Platform
    }

    void SunSparc7$$CONSTS()
    {
        // module SunSparc7
    }

    void Platform$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("host.platforms.SUN.Platform$$create", new Proto.Fxn(om.findStrict("host.platforms.SUN.Platform.Module", "host.platforms.SUN"), om.findStrict("host.platforms.SUN.Platform.Instance", "host.platforms.SUN"), 2, 1, false));
                fxn.addArg(0, "name", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("host.platforms.SUN.Platform.Params", "host.platforms.SUN"), Global.newObject());
        sb = new StringBuilder();
        sb.append("host$platforms$SUN$Platform$$create = function( name, __params ) {\n");
            sb.append("var __mod = xdc.om['host.platforms.SUN.Platform'];\n");
            sb.append("var __inst = xdc.om['host.platforms.SUN.Platform.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['host.platforms.SUN']);\n");
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
            sb.append("__inst.remoteHost = __mod.PARAMS.remoteHost;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [name]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("host.platforms.SUN.Platform$$construct", new Proto.Fxn(om.findStrict("host.platforms.SUN.Platform.Module", "host.platforms.SUN"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("host.platforms.SUN.Platform$$Object", "host.platforms.SUN"), null);
                fxn.addArg(1, "name", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("host.platforms.SUN.Platform.Params", "host.platforms.SUN"), Global.newObject());
        sb = new StringBuilder();
        sb.append("host$platforms$SUN$Platform$$construct = function( __obj, name, __params ) {\n");
            sb.append("var __mod = xdc.om['host.platforms.SUN.Platform'];\n");
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
            sb.append("__inst.remoteHost = __mod.PARAMS.remoteHost;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void SunSparc7$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("host.platforms.SUN.SunSparc7$$create", new Proto.Fxn(om.findStrict("host.platforms.SUN.SunSparc7.Module", "host.platforms.SUN"), om.findStrict("host.platforms.SUN.SunSparc7.Instance", "host.platforms.SUN"), 2, 1, false));
                fxn.addArg(0, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(1, "__params", (Proto)om.findStrict("host.platforms.SUN.SunSparc7.Params", "host.platforms.SUN"), Global.newObject());
        sb = new StringBuilder();
        sb.append("host$platforms$SUN$SunSparc7$$create = function( revision, __params ) {\n");
            sb.append("var __mod = xdc.om['host.platforms.SUN.SunSparc7'];\n");
            sb.append("var __inst = xdc.om['host.platforms.SUN.SunSparc7.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['host.platforms.SUN']);\n");
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
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [revision]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("host.platforms.SUN.SunSparc7$$construct", new Proto.Fxn(om.findStrict("host.platforms.SUN.SunSparc7.Module", "host.platforms.SUN"), null, 3, 1, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("host.platforms.SUN.SunSparc7$$Object", "host.platforms.SUN"), null);
                fxn.addArg(1, "revision", $$T_Str, $$UNDEF);
                fxn.addArg(2, "__params", (Proto)om.findStrict("host.platforms.SUN.SunSparc7.Params", "host.platforms.SUN"), Global.newObject());
        sb = new StringBuilder();
        sb.append("host$platforms$SUN$SunSparc7$$construct = function( __obj, revision, __params ) {\n");
            sb.append("var __mod = xdc.om['host.platforms.SUN.SunSparc7'];\n");
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

    void SunSparc7$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Platform$$SIZES()
    {
    }

    void SunSparc7$$SIZES()
    {
    }

    void Platform$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "host/platforms/SUN/Platform.xs");
        om.bind("host.platforms.SUN.Platform$$capsule", cap);
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.Platform.Module", "host.platforms.SUN");
        po.init("host.platforms.SUN.Platform.Module", om.findStrict("xdc.platform.IPlatform.Module", "host.platforms.SUN"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("BOARD", (Proto)om.findStrict("xdc.platform.IPlatform.Board", "host.platforms.SUN"), Global.newObject("id", "0", "boardName", "sun-sparc", "boardFamily", "sun-sparc", "boardRevision", null), "rh");
        po.addFld("CPU", (Proto)om.findStrict("xdc.platform.IExeContext.Cpu", "host.platforms.SUN"), Global.newObject("id", "0", "clockRate", 750.0, "catalogName", "host.platforms.SUN", "deviceName", "SunSparc7", "revision", ""), "rh");
                po.addFxn("create", (Proto.Fxn)om.findStrict("host.platforms.SUN.Platform$$create", "host.platforms.SUN"), Global.get("host$platforms$SUN$Platform$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("host.platforms.SUN.Platform$$construct", "host.platforms.SUN"), Global.get("host$platforms$SUN$Platform$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("host.platforms.SUN.Platform$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("host.platforms.SUN.Platform$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("host.platforms.SUN.Platform$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("host.platforms.SUN.Platform$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.Platform.Instance", "host.platforms.SUN");
        po.init("host.platforms.SUN.Platform.Instance", om.findStrict("xdc.platform.IPlatform.Instance", "host.platforms.SUN"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("remoteHost", $$T_Str, $$UNDEF, "wh");
                fxn = Global.get(cap, "getCpuDataSheet");
                if (fxn != null) po.addFxn("getCpuDataSheet", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCpuDataSheet", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getCreateArgs");
                if (fxn != null) po.addFxn("getCreateArgs", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCreateArgs", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getExeContext");
                if (fxn != null) po.addFxn("getExeContext", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExeContext", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getExecCmd");
                if (fxn != null) po.addFxn("getExecCmd", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExecCmd", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getLinkTemplate");
                if (fxn != null) po.addFxn("getLinkTemplate", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getLinkTemplate", "host.platforms.SUN"), fxn);
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.Platform$$Params", "host.platforms.SUN");
        po.init("host.platforms.SUN.Platform.Params", om.findStrict("xdc.platform.IPlatform$$Params", "host.platforms.SUN"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("remoteHost", $$T_Str, $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.Platform$$Object", "host.platforms.SUN");
        po.init("host.platforms.SUN.Platform.Object", om.findStrict("host.platforms.SUN.Platform.Instance", "host.platforms.SUN"));
                fxn = Global.get(cap, "getCpuDataSheet");
                if (fxn != null) po.addFxn("getCpuDataSheet", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCpuDataSheet", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getCreateArgs");
                if (fxn != null) po.addFxn("getCreateArgs", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCreateArgs", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getExeContext");
                if (fxn != null) po.addFxn("getExeContext", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExeContext", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getExecCmd");
                if (fxn != null) po.addFxn("getExecCmd", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExecCmd", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getLinkTemplate");
                if (fxn != null) po.addFxn("getLinkTemplate", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getLinkTemplate", "host.platforms.SUN"), fxn);
    }

    void SunSparc7$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "host/platforms/SUN/SunSparc7.xs");
        om.bind("host.platforms.SUN.SunSparc7$$capsule", cap);
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.SunSparc7.Module", "host.platforms.SUN");
        po.init("host.platforms.SUN.SunSparc7.Module", om.findStrict("xdc.platform.ICpuDataSheet.Module", "host.platforms.SUN"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("host.platforms.SUN.SunSparc7$$create", "host.platforms.SUN"), Global.get("host$platforms$SUN$SunSparc7$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("host.platforms.SUN.SunSparc7$$construct", "host.platforms.SUN"), Global.get("host$platforms$SUN$SunSparc7$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("host.platforms.SUN.SunSparc7$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("host.platforms.SUN.SunSparc7$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("host.platforms.SUN.SunSparc7$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("host.platforms.SUN.SunSparc7$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.SunSparc7.Instance", "host.platforms.SUN");
        po.init("host.platforms.SUN.SunSparc7.Instance", om.findStrict("xdc.platform.ICpuDataSheet.Instance", "host.platforms.SUN"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "sparc7", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "host.platforms.SUN")), Global.newArray(new Object[]{}), "wh");
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "host.platforms.SUN"), fxn);
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.SunSparc7$$Params", "host.platforms.SUN");
        po.init("host.platforms.SUN.SunSparc7.Params", om.findStrict("xdc.platform.ICpuDataSheet$$Params", "host.platforms.SUN"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, "sparc7", "wh");
        po.addFld("cpuCoreRevision", $$T_Str, "1.0", "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), 1L, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), 4L, "wh");
        po.addFld("memMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "host.platforms.SUN")), Global.newArray(new Object[]{}), "wh");
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.SunSparc7$$Object", "host.platforms.SUN");
        po.init("host.platforms.SUN.SunSparc7.Object", om.findStrict("host.platforms.SUN.SunSparc7.Instance", "host.platforms.SUN"));
                fxn = Global.get(cap, "getMemoryMap");
                if (fxn != null) po.addFxn("getMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getMemoryMap", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getRegisterSet");
                if (fxn != null) po.addFxn("getRegisterSet", (Proto.Fxn)om.findStrict("xdc.platform.ICpuDataSheet$$getRegisterSet", "host.platforms.SUN"), fxn);
    }

    void Platform$$ROV()
    {
    }

    void SunSparc7$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("host.platforms.SUN.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "host.platforms.SUN"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "host/platforms/SUN/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "host.platforms.SUN"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "host.platforms.SUN"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "host.platforms.SUN", Value.DEFAULT, false);
        pkgV.bind("$name", "host.platforms.SUN");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "host.platforms.SUN.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 1));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("xdc.platform", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['host.platforms.SUN'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('host.platforms.SUN$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['host.platforms.SUN$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['host.platforms.SUN$$stat$root'];\n");
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

        vo = (Value.Obj)om.findStrict("host.platforms.SUN.Platform", "host.platforms.SUN");
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.Platform.Module", "host.platforms.SUN");
        vo.init2(po, "host.platforms.SUN.Platform", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("host.platforms.SUN.Platform$$capsule", "host.platforms.SUN"));
        vo.bind("Instance", om.findStrict("host.platforms.SUN.Platform.Instance", "host.platforms.SUN"));
        vo.bind("Params", om.findStrict("host.platforms.SUN.Platform.Params", "host.platforms.SUN"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("host.platforms.SUN.Platform.Params", "host.platforms.SUN")).newInstance());
        vo.bind("$package", om.findStrict("host.platforms.SUN", "host.platforms.SUN"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Board", om.findStrict("xdc.platform.IPlatform.Board", "host.platforms.SUN"));
        tdefs.add(om.findStrict("xdc.platform.IPlatform.Board", "host.platforms.SUN"));
        vo.bind("Memory", om.findStrict("xdc.platform.IPlatform.Memory", "host.platforms.SUN"));
        tdefs.add(om.findStrict("xdc.platform.IPlatform.Memory", "host.platforms.SUN"));
        vo.bind("MemoryMap", om.findStrict("xdc.platform.IPlatform.MemoryMap", "host.platforms.SUN"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "host.platforms.SUN")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("host.platforms.SUN.Platform$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("host.platforms.SUN.Platform.Object", "host.platforms.SUN"));
        pkgV.bind("Platform", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Platform");
    }

    void SunSparc7$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("host.platforms.SUN.SunSparc7", "host.platforms.SUN");
        po = (Proto.Obj)om.findStrict("host.platforms.SUN.SunSparc7.Module", "host.platforms.SUN");
        vo.init2(po, "host.platforms.SUN.SunSparc7", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("host.platforms.SUN.SunSparc7$$capsule", "host.platforms.SUN"));
        vo.bind("Instance", om.findStrict("host.platforms.SUN.SunSparc7.Instance", "host.platforms.SUN"));
        vo.bind("Params", om.findStrict("host.platforms.SUN.SunSparc7.Params", "host.platforms.SUN"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("host.platforms.SUN.SunSparc7.Params", "host.platforms.SUN")).newInstance());
        vo.bind("$package", om.findStrict("host.platforms.SUN", "host.platforms.SUN"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "host.platforms.SUN")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("host.platforms.SUN.SunSparc7$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("host.platforms.SUN.SunSparc7.Object", "host.platforms.SUN"));
        pkgV.bind("SunSparc7", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SunSparc7");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("host.platforms.SUN.Platform", "host.platforms.SUN"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("host.platforms.SUN.SunSparc7", "host.platforms.SUN"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("host.platforms.SUN.Platform")).bless();
        ((Value.Obj)om.getv("host.platforms.SUN.SunSparc7")).bless();
        ((Value.Arr)om.findStrict("$packages", "host.platforms.SUN")).add(pkgV);
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
        SunSparc7$$OBJECTS();
        Platform$$CONSTS();
        SunSparc7$$CONSTS();
        Platform$$CREATES();
        SunSparc7$$CREATES();
        Platform$$FUNCTIONS();
        SunSparc7$$FUNCTIONS();
        Platform$$SIZES();
        SunSparc7$$SIZES();
        Platform$$TYPES();
        SunSparc7$$TYPES();
        if (isROV) {
            Platform$$ROV();
            SunSparc7$$ROV();
        }//isROV
        $$SINGLETONS();
        Platform$$SINGLETONS();
        SunSparc7$$SINGLETONS();
        $$INITIALIZATION();
    }
}
