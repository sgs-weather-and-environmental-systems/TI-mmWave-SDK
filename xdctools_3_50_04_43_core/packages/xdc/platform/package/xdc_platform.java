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

public class xdc_platform
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
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("xdc.platform.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("xdc.platform", new Value.Obj("xdc.platform", pkgP));
    }

    void IExeContext$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.platform.IExeContext.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.platform.IExeContext", new Value.Obj("xdc.platform.IExeContext", po));
        pkgV.bind("IExeContext", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.platform.IExeContext$$Cpu", new Proto.Obj());
        om.bind("xdc.platform.IExeContext.Cpu", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.platform.IExeContext.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.platform.IExeContext$$Object", new Proto.Obj());
        om.bind("xdc.platform.IExeContext.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.platform.IExeContext$$Params", new Proto.Obj());
        om.bind("xdc.platform.IExeContext.Params", new Proto.Str(po, true));
    }

    void ExeContext$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.platform.ExeContext.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.platform.ExeContext", new Value.Obj("xdc.platform.ExeContext", po));
        pkgV.bind("ExeContext", vo);
        // decls 
        om.bind("xdc.platform.ExeContext.Cpu", om.findStrict("xdc.platform.IExeContext.Cpu", "xdc.platform"));
        // insts 
        Object insP = om.bind("xdc.platform.ExeContext.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.platform.ExeContext$$Object", new Proto.Obj());
        om.bind("xdc.platform.ExeContext.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.platform.ExeContext$$Params", new Proto.Obj());
        om.bind("xdc.platform.ExeContext.Params", new Proto.Str(po, true));
    }

    void Utils$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.platform.Utils.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.platform.Utils", new Value.Obj("xdc.platform.Utils", po));
        pkgV.bind("Utils", vo);
        // decls 
    }

    void IPlatform$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.platform.IPlatform.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.platform.IPlatform", new Value.Obj("xdc.platform.IPlatform", po));
        pkgV.bind("IPlatform", vo);
        // decls 
        spo = (Proto.Obj)om.bind("xdc.platform.IPlatform$$Board", new Proto.Obj());
        om.bind("xdc.platform.IPlatform.Board", new Proto.Str(spo, true));
        spo = (Proto.Obj)om.bind("xdc.platform.IPlatform$$Memory", new Proto.Obj());
        om.bind("xdc.platform.IPlatform.Memory", new Proto.Str(spo, true));
        // insts 
        Object insP = om.bind("xdc.platform.IPlatform.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.platform.IPlatform$$Object", new Proto.Obj());
        om.bind("xdc.platform.IPlatform.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.platform.IPlatform$$Params", new Proto.Obj());
        om.bind("xdc.platform.IPlatform.Params", new Proto.Str(po, true));
    }

    void ICpuDataSheet$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.platform.ICpuDataSheet.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.platform.ICpuDataSheet", new Value.Obj("xdc.platform.ICpuDataSheet", po));
        pkgV.bind("ICpuDataSheet", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.platform.ICpuDataSheet.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.platform.ICpuDataSheet$$Object", new Proto.Obj());
        om.bind("xdc.platform.ICpuDataSheet.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.platform.ICpuDataSheet$$Params", new Proto.Obj());
        om.bind("xdc.platform.ICpuDataSheet.Params", new Proto.Str(po, true));
    }

    void IPeripheral$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("xdc.platform.IPeripheral.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("xdc.platform.IPeripheral", new Value.Obj("xdc.platform.IPeripheral", po));
        pkgV.bind("IPeripheral", vo);
        // decls 
        // insts 
        Object insP = om.bind("xdc.platform.IPeripheral.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("xdc.platform.IPeripheral$$Object", new Proto.Obj());
        om.bind("xdc.platform.IPeripheral.Object", new Proto.Str(po, true));
        po = (Proto.Obj)om.bind("xdc.platform.IPeripheral$$Params", new Proto.Obj());
        om.bind("xdc.platform.IPeripheral.Params", new Proto.Str(po, true));
    }

    void IExeContext$$CONSTS()
    {
        // interface IExeContext
    }

    void ExeContext$$CONSTS()
    {
        // module ExeContext
    }

    void Utils$$CONSTS()
    {
        // module Utils
    }

    void IPlatform$$CONSTS()
    {
        // interface IPlatform
    }

    void ICpuDataSheet$$CONSTS()
    {
        // interface ICpuDataSheet
    }

    void IPeripheral$$CONSTS()
    {
        // interface IPeripheral
    }

    void IExeContext$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ExeContext$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        fxn = (Proto.Fxn)om.bind("xdc.platform.ExeContext$$create", new Proto.Fxn(om.findStrict("xdc.platform.ExeContext.Module", "xdc.platform"), om.findStrict("xdc.platform.ExeContext.Instance", "xdc.platform"), 3, 2, false));
                fxn.addArg(0, "cpu", (Proto)om.findStrict("xdc.platform.IExeContext.Cpu", "xdc.platform"), $$DEFAULT);
                fxn.addArg(1, "board", (Proto)om.findStrict("xdc.platform.IPlatform.Board", "xdc.platform"), $$DEFAULT);
                fxn.addArg(2, "__params", (Proto)om.findStrict("xdc.platform.ExeContext.Params", "xdc.platform"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$platform$ExeContext$$create = function( cpu, board, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.platform.ExeContext'];\n");
            sb.append("var __inst = xdc.om['xdc.platform.ExeContext.Instance'].$$make();\n");
            sb.append("__inst.$$bind('$package', xdc.om['xdc.platform']);\n");
            sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
            sb.append("__inst.$$bind('$category', 'Instance');\n");
            sb.append("__inst.$$bind('$args', {cpu:cpu, board:board});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$instances.$add(__inst);\n");
            sb.append("__inst.id = __mod.PARAMS.id;\n");
            sb.append("__inst.catalogName = __mod.PARAMS.catalogName;\n");
            sb.append("__inst.deviceName = __mod.PARAMS.deviceName;\n");
            sb.append("__inst.clockRate = __mod.PARAMS.clockRate;\n");
            sb.append("__inst.board = __mod.PARAMS.board;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("__inst.memoryMap = __mod.PARAMS.memoryMap;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("var save = xdc.om.$curpkg;\n");
            sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
            sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [cpu, board]);\n");
            sb.append("xdc.om.$$bind('$curpkg', save);\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return __inst;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
        fxn = (Proto.Fxn)om.bind("xdc.platform.ExeContext$$construct", new Proto.Fxn(om.findStrict("xdc.platform.ExeContext.Module", "xdc.platform"), null, 4, 2, false));
                fxn.addArg(0, "__obj", (Proto)om.findStrict("xdc.platform.ExeContext$$Object", "xdc.platform"), null);
                fxn.addArg(1, "cpu", (Proto)om.findStrict("xdc.platform.IExeContext.Cpu", "xdc.platform"), $$DEFAULT);
                fxn.addArg(2, "board", (Proto)om.findStrict("xdc.platform.IPlatform.Board", "xdc.platform"), $$DEFAULT);
                fxn.addArg(3, "__params", (Proto)om.findStrict("xdc.platform.ExeContext.Params", "xdc.platform"), Global.newObject());
        sb = new StringBuilder();
        sb.append("xdc$platform$ExeContext$$construct = function( __obj, cpu, board, __params ) {\n");
            sb.append("var __mod = xdc.om['xdc.platform.ExeContext'];\n");
            sb.append("var __inst = __obj;\n");
            sb.append("__inst.$$bind('$args', {cpu:cpu, board:board});\n");
            sb.append("__inst.$$bind('$module', __mod);\n");
            sb.append("__mod.$objects.$add(__inst);\n");
            sb.append("__inst.id = __mod.PARAMS.id;\n");
            sb.append("__inst.catalogName = __mod.PARAMS.catalogName;\n");
            sb.append("__inst.deviceName = __mod.PARAMS.deviceName;\n");
            sb.append("__inst.clockRate = __mod.PARAMS.clockRate;\n");
            sb.append("__inst.board = __mod.PARAMS.board;\n");
            sb.append("__inst.attrs = __mod.PARAMS.attrs;\n");
            sb.append("__inst.memoryMap = __mod.PARAMS.memoryMap;\n");
            sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
            sb.append("__inst.$$bless();\n");
            sb.append("return null;\n");
        sb.append("}\n");
        Global.eval(sb.toString());
    }

    void Utils$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IPlatform$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ICpuDataSheet$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IPeripheral$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IExeContext$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ExeContext$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Utils$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Utils.addPeripheralsMap
        fxn = (Proto.Fxn)om.bind("xdc.platform.Utils$$addPeripheralsMap", new Proto.Fxn(om.findStrict("xdc.platform.Utils.Module", "xdc.platform"), null, 1, 1, false));
                fxn.addArg(0, "cds", (Proto)om.findStrict("xdc.platform.ICpuDataSheet.Instance", "xdc.platform"), $$UNDEF);
        // fxn Utils.assembleMemoryMap
        fxn = (Proto.Fxn)om.bind("xdc.platform.Utils$$assembleMemoryMap", new Proto.Fxn(om.findStrict("xdc.platform.Utils.Module", "xdc.platform"), null, 0, -1, false));
        // fxn Utils.assemblePeripheralsMap
        fxn = (Proto.Fxn)om.bind("xdc.platform.Utils$$assemblePeripheralsMap", new Proto.Fxn(om.findStrict("xdc.platform.Utils.Module", "xdc.platform"), null, 3, 2, false));
                fxn.addArg(0, "cds", (Proto)om.findStrict("xdc.platform.ICpuDataSheet.Instance", "xdc.platform"), $$UNDEF);
                fxn.addArg(1, "inst", (Proto)om.findStrict("xdc.platform.IPlatform.Instance", "xdc.platform"), $$UNDEF);
                fxn.addArg(2, "names", new Proto.Arr($$T_Str, false), Global.newArray(new Object[]{}));
        // fxn Utils.checkDefaults
        fxn = (Proto.Fxn)om.bind("xdc.platform.Utils$$checkDefaults", new Proto.Fxn(om.findStrict("xdc.platform.Utils.Module", "xdc.platform"), null, 0, -1, false));
        // fxn Utils.checkFit
        fxn = (Proto.Fxn)om.bind("xdc.platform.Utils$$checkFit", new Proto.Fxn(om.findStrict("xdc.platform.Utils.Module", "xdc.platform"), null, 0, -1, false));
        // fxn Utils.checkOverlap
        fxn = (Proto.Fxn)om.bind("xdc.platform.Utils$$checkOverlap", new Proto.Fxn(om.findStrict("xdc.platform.Utils.Module", "xdc.platform"), null, 0, -1, false));
        // fxn Utils.getCpuDataSheet
        fxn = (Proto.Fxn)om.bind("xdc.platform.Utils$$getCpuDataSheet", new Proto.Fxn(om.findStrict("xdc.platform.Utils.Module", "xdc.platform"), null, 0, -1, false));
    }

    void IPlatform$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IPlatform.getCpuDataSheet
        fxn = (Proto.Fxn)om.bind("xdc.platform.IPlatform$$getCpuDataSheet", new Proto.Fxn(om.findStrict("xdc.platform.IPlatform.Instance", "xdc.platform"), null, 0, -1, false));
        // fxn IPlatform.getCreateArgs
        fxn = (Proto.Fxn)om.bind("xdc.platform.IPlatform$$getCreateArgs", new Proto.Fxn(om.findStrict("xdc.platform.IPlatform.Instance", "xdc.platform"), null, 0, -1, false));
        // fxn IPlatform.getExeContext
        fxn = (Proto.Fxn)om.bind("xdc.platform.IPlatform$$getExeContext", new Proto.Fxn(om.findStrict("xdc.platform.IPlatform.Instance", "xdc.platform"), null, 0, -1, false));
        // fxn IPlatform.getExecCmd
        fxn = (Proto.Fxn)om.bind("xdc.platform.IPlatform$$getExecCmd", new Proto.Fxn(om.findStrict("xdc.platform.IPlatform.Instance", "xdc.platform"), null, 0, -1, false));
        // fxn IPlatform.getLinkTemplate
        fxn = (Proto.Fxn)om.bind("xdc.platform.IPlatform$$getLinkTemplate", new Proto.Fxn(om.findStrict("xdc.platform.IPlatform.Instance", "xdc.platform"), null, 0, -1, false));
    }

    void ICpuDataSheet$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn ICpuDataSheet.getMemoryMap
        fxn = (Proto.Fxn)om.bind("xdc.platform.ICpuDataSheet$$getMemoryMap", new Proto.Fxn(om.findStrict("xdc.platform.ICpuDataSheet.Instance", "xdc.platform"), null, 0, -1, false));
        // fxn ICpuDataSheet.getRegisterSet
        fxn = (Proto.Fxn)om.bind("xdc.platform.ICpuDataSheet$$getRegisterSet", new Proto.Fxn(om.findStrict("xdc.platform.ICpuDataSheet.Instance", "xdc.platform"), null, 0, -1, false));
    }

    void IPeripheral$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IPeripheral.addPeripheralsMap
        fxn = (Proto.Fxn)om.bind("xdc.platform.IPeripheral$$addPeripheralsMap", new Proto.Fxn(om.findStrict("xdc.platform.IPeripheral.Module", "xdc.platform"), null, 1, 1, false));
                fxn.addArg(0, "cds", (Proto)om.findStrict("xdc.platform.ICpuDataSheet.Instance", "xdc.platform"), $$UNDEF);
        // fxn IPeripheral.getAll
        fxn = (Proto.Fxn)om.bind("xdc.platform.IPeripheral$$getAll", new Proto.Fxn(om.findStrict("xdc.platform.IPeripheral.Module", "xdc.platform"), new Proto.Arr((Proto)om.findStrict("xdc.platform.IPeripheral.Instance", "xdc.platform"), false), 0, 0, false));
        // fxn IPeripheral.getRegisters
        fxn = (Proto.Fxn)om.bind("xdc.platform.IPeripheral$$getRegisters", new Proto.Fxn(om.findStrict("xdc.platform.IPeripheral.Module", "xdc.platform"), new Proto.Arr($$T_Str, false), 0, 0, false));
    }

    void IExeContext$$SIZES()
    {
    }

    void ExeContext$$SIZES()
    {
    }

    void Utils$$SIZES()
    {
    }

    void IPlatform$$SIZES()
    {
    }

    void ICpuDataSheet$$SIZES()
    {
    }

    void IPeripheral$$SIZES()
    {
    }

    void IExeContext$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.platform.IExeContext.Module", "xdc.platform");
        po.init("xdc.platform.IExeContext.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.platform.IExeContext.Instance", "xdc.platform");
        po.init("xdc.platform.IExeContext.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("id", $$T_Str, $$UNDEF, "wh");
        po.addFld("catalogName", $$T_Str, $$UNDEF, "wh");
        po.addFld("deviceName", $$T_Str, $$UNDEF, "wh");
        po.addFld("revision", $$T_Str, "", "wh");
        po.addFld("clockRate", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "wh");
        po.addFld("board", (Proto)om.findStrict("xdc.platform.IPlatform.Board", "xdc.platform"), $$DEFAULT, "rh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.platform.ICpuDataSheet.Instance", "xdc.platform"), $$UNDEF, "wh");
        po.addFld("memoryMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "xdc.platform")), $$DEFAULT, "wh");
        po = (Proto.Obj)om.findStrict("xdc.platform.IExeContext$$Params", "xdc.platform");
        po.init("xdc.platform.IExeContext.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("id", $$T_Str, $$UNDEF, "wh");
        po.addFld("catalogName", $$T_Str, $$UNDEF, "wh");
        po.addFld("deviceName", $$T_Str, $$UNDEF, "wh");
        po.addFld("revision", $$T_Str, "", "wh");
        po.addFld("clockRate", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "wh");
        po.addFld("board", (Proto)om.findStrict("xdc.platform.IPlatform.Board", "xdc.platform"), $$DEFAULT, "rh");
        po.addFld("attrs", (Proto)om.findStrict("xdc.platform.ICpuDataSheet.Instance", "xdc.platform"), $$UNDEF, "wh");
        po.addFld("memoryMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "xdc.platform")), $$DEFAULT, "wh");
        // struct IExeContext.Cpu
        po = (Proto.Obj)om.findStrict("xdc.platform.IExeContext$$Cpu", "xdc.platform");
        po.init("xdc.platform.IExeContext.Cpu", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("id", $$T_Str, $$UNDEF, "w");
                po.addFld("catalogName", $$T_Str, $$UNDEF, "w");
                po.addFld("deviceName", $$T_Str, $$UNDEF, "w");
                po.addFld("revision", $$T_Str, $$UNDEF, "w");
                po.addFld("clockRate", Proto.Elm.newCNum("(xdc_Float)"), $$UNDEF, "w");
    }

    void ExeContext$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/platform/ExeContext.xs");
        om.bind("xdc.platform.ExeContext$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.platform.ExeContext.Module", "xdc.platform");
        po.init("xdc.platform.ExeContext.Module", om.findStrict("xdc.platform.IExeContext.Module", "xdc.platform"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("create", (Proto.Fxn)om.findStrict("xdc.platform.ExeContext$$create", "xdc.platform"), Global.get("xdc$platform$ExeContext$$create"));
                po.addFxn("construct", (Proto.Fxn)om.findStrict("xdc.platform.ExeContext$$construct", "xdc.platform"), Global.get("xdc$platform$ExeContext$$construct"));
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.platform.ExeContext$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.platform.ExeContext$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.platform.ExeContext$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.platform.ExeContext$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.platform.ExeContext.Instance", "xdc.platform");
        po.init("xdc.platform.ExeContext.Instance", om.findStrict("xdc.platform.IExeContext.Instance", "xdc.platform"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.platform.ExeContext$$Params", "xdc.platform");
        po.init("xdc.platform.ExeContext.Params", om.findStrict("xdc.platform.IExeContext$$Params", "xdc.platform"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.platform.ExeContext$$Object", "xdc.platform");
        po.init("xdc.platform.ExeContext.Object", om.findStrict("xdc.platform.ExeContext.Instance", "xdc.platform"));
    }

    void Utils$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/platform/Utils.xs");
        om.bind("xdc.platform.Utils$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.platform.Utils.Module", "xdc.platform");
        po.init("xdc.platform.Utils.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.platform.Utils$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.platform.Utils$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.platform.Utils$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.Utils$$addPeripheralsMap", "xdc.platform"), Global.get(cap, "addPeripheralsMap"));
                po.addFxn("assembleMemoryMap", (Proto.Fxn)om.findStrict("xdc.platform.Utils$$assembleMemoryMap", "xdc.platform"), Global.get(cap, "assembleMemoryMap"));
                po.addFxn("assemblePeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.Utils$$assemblePeripheralsMap", "xdc.platform"), Global.get(cap, "assemblePeripheralsMap"));
                po.addFxn("checkDefaults", (Proto.Fxn)om.findStrict("xdc.platform.Utils$$checkDefaults", "xdc.platform"), Global.get(cap, "checkDefaults"));
                po.addFxn("checkFit", (Proto.Fxn)om.findStrict("xdc.platform.Utils$$checkFit", "xdc.platform"), Global.get(cap, "checkFit"));
                po.addFxn("checkOverlap", (Proto.Fxn)om.findStrict("xdc.platform.Utils$$checkOverlap", "xdc.platform"), Global.get(cap, "checkOverlap"));
                po.addFxn("getCpuDataSheet", (Proto.Fxn)om.findStrict("xdc.platform.Utils$$getCpuDataSheet", "xdc.platform"), Global.get(cap, "getCpuDataSheet"));
    }

    void IPlatform$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/platform/IPlatform.xs");
        om.bind("xdc.platform.IPlatform$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.platform.IPlatform.Module", "xdc.platform");
        po.init("xdc.platform.IPlatform.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.platform.IPlatform$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.platform.IPlatform$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.platform.IPlatform$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.platform.IPlatform$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        po = (Proto.Obj)om.findStrict("xdc.platform.IPlatform.Instance", "xdc.platform");
        po.init("xdc.platform.IPlatform.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("externalMemoryMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "xdc.platform")), $$DEFAULT, "rh");
        po.addFld("customMemoryMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "xdc.platform")), $$DEFAULT, "wh");
        po.addFld("renameMap", new Proto.Map($$T_Str), $$DEFAULT, "wh");
        po.addFld("dataMemory", $$T_Str, $$UNDEF, "wh");
        po.addFld("codeMemory", $$T_Str, $$UNDEF, "wh");
        po.addFld("stackMemory", $$T_Str, $$UNDEF, "wh");
        po.addFld("sectMap", new Proto.Map($$T_Str), $$DEFAULT, "wh");
        po.addFld("peripherals", new Proto.Map((Proto)om.findStrict("xdc.platform.IPeripheral.Instance", "xdc.platform")), $$DEFAULT, "wh");
                fxn = Global.get(cap, "getCpuDataSheet");
                if (fxn != null) po.addFxn("getCpuDataSheet", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCpuDataSheet", "xdc.platform"), fxn);
                fxn = Global.get(cap, "getCreateArgs");
                if (fxn != null) po.addFxn("getCreateArgs", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getCreateArgs", "xdc.platform"), fxn);
                fxn = Global.get(cap, "getExeContext");
                if (fxn != null) po.addFxn("getExeContext", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExeContext", "xdc.platform"), fxn);
                fxn = Global.get(cap, "getExecCmd");
                if (fxn != null) po.addFxn("getExecCmd", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getExecCmd", "xdc.platform"), fxn);
                fxn = Global.get(cap, "getLinkTemplate");
                if (fxn != null) po.addFxn("getLinkTemplate", (Proto.Fxn)om.findStrict("xdc.platform.IPlatform$$getLinkTemplate", "xdc.platform"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.platform.IPlatform$$Params", "xdc.platform");
        po.init("xdc.platform.IPlatform.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("externalMemoryMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "xdc.platform")), $$DEFAULT, "rh");
        po.addFld("customMemoryMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "xdc.platform")), $$DEFAULT, "wh");
        po.addFld("renameMap", new Proto.Map($$T_Str), $$DEFAULT, "wh");
        po.addFld("dataMemory", $$T_Str, $$UNDEF, "wh");
        po.addFld("codeMemory", $$T_Str, $$UNDEF, "wh");
        po.addFld("stackMemory", $$T_Str, $$UNDEF, "wh");
        po.addFld("sectMap", new Proto.Map($$T_Str), $$DEFAULT, "wh");
        po.addFld("peripherals", new Proto.Map((Proto)om.findStrict("xdc.platform.IPeripheral.Instance", "xdc.platform")), $$DEFAULT, "wh");
        // struct IPlatform.Board
        po = (Proto.Obj)om.findStrict("xdc.platform.IPlatform$$Board", "xdc.platform");
        po.init("xdc.platform.IPlatform.Board", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("id", $$T_Str, $$UNDEF, "w");
                po.addFld("boardName", $$T_Str, $$UNDEF, "w");
                po.addFld("boardFamily", $$T_Str, $$UNDEF, "w");
                po.addFld("boardRevision", $$T_Str, $$UNDEF, "w");
        // struct IPlatform.Memory
        po = (Proto.Obj)om.findStrict("xdc.platform.IPlatform$$Memory", "xdc.platform");
        po.init("xdc.platform.IPlatform.Memory", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("comment", $$T_Str, $$UNDEF, "w");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("space", $$T_Str, $$UNDEF, "w");
                po.addFld("page", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("base", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("len", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("access", $$T_Str, $$UNDEF, "w");
                po.addFld("cacheable", $$T_Bool, $$UNDEF, "w");
                po.addFld("cacheAttrs", $$T_Obj, $$UNDEF, "w");
        // typedef IPlatform.MemoryMap
        om.bind("xdc.platform.IPlatform.MemoryMap", new Proto.Map((Proto)om.findStrict("xdc.platform.IPlatform.Memory", "xdc.platform")));
    }

    void ICpuDataSheet$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("xdc.platform.ICpuDataSheet.Module", "xdc.platform");
        po.init("xdc.platform.ICpuDataSheet.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po = (Proto.Obj)om.findStrict("xdc.platform.ICpuDataSheet.Instance", "xdc.platform");
        po.init("xdc.platform.ICpuDataSheet.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, $$UNDEF, "wh");
        po.addFld("cpuCoreRevision", $$T_Str, $$UNDEF, "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "wh");
        po.addFld("peripherals", new Proto.Map((Proto)om.findStrict("xdc.platform.IPeripheral.Instance", "xdc.platform")), $$DEFAULT, "wh");
        po.addFld("deviceHeader", $$T_Str, $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("xdc.platform.ICpuDataSheet$$Params", "xdc.platform");
        po.init("xdc.platform.ICpuDataSheet.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("cpuCore", $$T_Str, $$UNDEF, "wh");
        po.addFld("cpuCoreRevision", $$T_Str, $$UNDEF, "wh");
        po.addFld("minProgUnitSize", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "wh");
        po.addFld("minDataUnitSize", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "wh");
        po.addFld("dataWordSize", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "wh");
        po.addFld("peripherals", new Proto.Map((Proto)om.findStrict("xdc.platform.IPeripheral.Instance", "xdc.platform")), $$DEFAULT, "wh");
        po.addFld("deviceHeader", $$T_Str, $$UNDEF, "wh");
    }

    void IPeripheral$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/platform/IPeripheral.xs");
        om.bind("xdc.platform.IPeripheral$$capsule", cap);
        po = (Proto.Obj)om.findStrict("xdc.platform.IPeripheral.Module", "xdc.platform");
        po.init("xdc.platform.IPeripheral.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("xdc.platform.IPeripheral$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("xdc.platform.IPeripheral$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("xdc.platform.IPeripheral$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("xdc.platform.IPeripheral$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "addPeripheralsMap");
                if (fxn != null) po.addFxn("addPeripheralsMap", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$addPeripheralsMap", "xdc.platform"), fxn);
                fxn = Global.get(cap, "getAll");
                if (fxn != null) po.addFxn("getAll", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getAll", "xdc.platform"), fxn);
                fxn = Global.get(cap, "getRegisters");
                if (fxn != null) po.addFxn("getRegisters", (Proto.Fxn)om.findStrict("xdc.platform.IPeripheral$$getRegisters", "xdc.platform"), fxn);
        po = (Proto.Obj)om.findStrict("xdc.platform.IPeripheral.Instance", "xdc.platform");
        po.init("xdc.platform.IPeripheral.Instance", $$Instance);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("owner", $$T_Str, $$UNDEF, "wh");
        po = (Proto.Obj)om.findStrict("xdc.platform.IPeripheral$$Params", "xdc.platform");
        po.init("xdc.platform.IPeripheral.Params", $$Params);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        po.addFld("name", $$T_Str, $$UNDEF, "wh");
        po.addFld("owner", $$T_Str, $$UNDEF, "wh");
        // typedef IPeripheral.IPeripheralArray
        om.bind("xdc.platform.IPeripheral.IPeripheralArray", new Proto.Arr((Proto)om.findStrict("xdc.platform.IPeripheral.Instance", "xdc.platform"), false));
        // typedef IPeripheral.StringArray
        om.bind("xdc.platform.IPeripheral.StringArray", new Proto.Arr($$T_Str, false));
    }

    void IExeContext$$ROV()
    {
    }

    void ExeContext$$ROV()
    {
    }

    void Utils$$ROV()
    {
    }

    void IPlatform$$ROV()
    {
    }

    void ICpuDataSheet$$ROV()
    {
    }

    void IPeripheral$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("xdc.platform.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "xdc.platform"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "xdc/platform/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "xdc.platform"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "xdc.platform"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "xdc.platform"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "xdc.platform"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "xdc.platform"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "xdc.platform"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "xdc.platform", Value.DEFAULT, false);
        pkgV.bind("$name", "xdc.platform");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "xdc.platform.");
        pkgV.bind("$vers", Global.newArray(1, 0, 1));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['xdc.platform'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('xdc.platform$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['xdc.platform$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['xdc.platform$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IExeContext$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.platform.IExeContext", "xdc.platform");
        po = (Proto.Obj)om.findStrict("xdc.platform.IExeContext.Module", "xdc.platform");
        vo.init2(po, "xdc.platform.IExeContext", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.platform.IExeContext.Instance", "xdc.platform"));
        vo.bind("Params", om.findStrict("xdc.platform.IExeContext.Params", "xdc.platform"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.platform.IExeContext.Params", "xdc.platform")).newInstance());
        vo.bind("$package", om.findStrict("xdc.platform", "xdc.platform"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("Cpu", om.findStrict("xdc.platform.IExeContext.Cpu", "xdc.platform"));
        tdefs.add(om.findStrict("xdc.platform.IExeContext.Cpu", "xdc.platform"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IExeContext", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IExeContext");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ExeContext$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.platform.ExeContext", "xdc.platform");
        po = (Proto.Obj)om.findStrict("xdc.platform.ExeContext.Module", "xdc.platform");
        vo.init2(po, "xdc.platform.ExeContext", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.platform.ExeContext$$capsule", "xdc.platform"));
        vo.bind("Instance", om.findStrict("xdc.platform.ExeContext.Instance", "xdc.platform"));
        vo.bind("Params", om.findStrict("xdc.platform.ExeContext.Params", "xdc.platform"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.platform.ExeContext.Params", "xdc.platform")).newInstance());
        vo.bind("$package", om.findStrict("xdc.platform", "xdc.platform"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("Cpu", om.findStrict("xdc.platform.IExeContext.Cpu", "xdc.platform"));
        tdefs.add(om.findStrict("xdc.platform.IExeContext.Cpu", "xdc.platform"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.platform");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.platform")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.platform.ExeContext$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("Object", om.findStrict("xdc.platform.ExeContext.Object", "xdc.platform"));
        pkgV.bind("ExeContext", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ExeContext");
    }

    void Utils$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.platform.Utils", "xdc.platform");
        po = (Proto.Obj)om.findStrict("xdc.platform.Utils.Module", "xdc.platform");
        vo.init2(po, "xdc.platform.Utils", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("xdc.platform.Utils$$capsule", "xdc.platform"));
        vo.bind("$package", om.findStrict("xdc.platform", "xdc.platform"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "xdc.platform")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("xdc.platform.Utils$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Utils", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Utils");
    }

    void IPlatform$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.platform.IPlatform", "xdc.platform");
        po = (Proto.Obj)om.findStrict("xdc.platform.IPlatform.Module", "xdc.platform");
        vo.init2(po, "xdc.platform.IPlatform", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.platform.IPlatform$$capsule", "xdc.platform"));
        vo.bind("Instance", om.findStrict("xdc.platform.IPlatform.Instance", "xdc.platform"));
        vo.bind("Params", om.findStrict("xdc.platform.IPlatform.Params", "xdc.platform"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.platform.IPlatform.Params", "xdc.platform")).newInstance());
        vo.bind("$package", om.findStrict("xdc.platform", "xdc.platform"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("Board", om.findStrict("xdc.platform.IPlatform.Board", "xdc.platform"));
        tdefs.add(om.findStrict("xdc.platform.IPlatform.Board", "xdc.platform"));
        vo.bind("Memory", om.findStrict("xdc.platform.IPlatform.Memory", "xdc.platform"));
        tdefs.add(om.findStrict("xdc.platform.IPlatform.Memory", "xdc.platform"));
        vo.bind("MemoryMap", om.findStrict("xdc.platform.IPlatform.MemoryMap", "xdc.platform"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IPlatform", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IPlatform");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void ICpuDataSheet$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.platform.ICpuDataSheet", "xdc.platform");
        po = (Proto.Obj)om.findStrict("xdc.platform.ICpuDataSheet.Module", "xdc.platform");
        vo.init2(po, "xdc.platform.ICpuDataSheet", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("xdc.platform.ICpuDataSheet.Instance", "xdc.platform"));
        vo.bind("Params", om.findStrict("xdc.platform.ICpuDataSheet.Params", "xdc.platform"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.platform.ICpuDataSheet.Params", "xdc.platform")).newInstance());
        vo.bind("$package", om.findStrict("xdc.platform", "xdc.platform"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("ICpuDataSheet", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ICpuDataSheet");
        vo.seal(null);
        if (vo.getProto().lookupFld("$used") != null) {
            vo.unseal("$used");
        }
    }

    void IPeripheral$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("xdc.platform.IPeripheral", "xdc.platform");
        po = (Proto.Obj)om.findStrict("xdc.platform.IPeripheral.Module", "xdc.platform");
        vo.init2(po, "xdc.platform.IPeripheral", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Interface");
        vo.bind("$capsule", om.findStrict("xdc.platform.IPeripheral$$capsule", "xdc.platform"));
        vo.bind("Instance", om.findStrict("xdc.platform.IPeripheral.Instance", "xdc.platform"));
        vo.bind("Params", om.findStrict("xdc.platform.IPeripheral.Params", "xdc.platform"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("xdc.platform.IPeripheral.Params", "xdc.platform")).newInstance());
        vo.bind("$package", om.findStrict("xdc.platform", "xdc.platform"));
        tdefs.clear();
        proxies.clear();
        inherits.clear();
        vo.bind("IPeripheralArray", om.findStrict("xdc.platform.IPeripheral.IPeripheralArray", "xdc.platform"));
        vo.bind("StringArray", om.findStrict("xdc.platform.IPeripheral.StringArray", "xdc.platform"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$interfaces")).add(vo);
        pkgV.bind("IPeripheral", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IPeripheral");
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
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.platform.ExeContext", "xdc.platform"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("xdc.platform.Utils", "xdc.platform"));
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("xdc.platform.IExeContext")).bless();
        ((Value.Obj)om.getv("xdc.platform.ExeContext")).bless();
        ((Value.Obj)om.getv("xdc.platform.Utils")).bless();
        ((Value.Obj)om.getv("xdc.platform.IPlatform")).bless();
        ((Value.Obj)om.getv("xdc.platform.ICpuDataSheet")).bless();
        ((Value.Obj)om.getv("xdc.platform.IPeripheral")).bless();
        ((Value.Arr)om.findStrict("$packages", "xdc.platform")).add(pkgV);
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
        IExeContext$$OBJECTS();
        ExeContext$$OBJECTS();
        Utils$$OBJECTS();
        IPlatform$$OBJECTS();
        ICpuDataSheet$$OBJECTS();
        IPeripheral$$OBJECTS();
        IExeContext$$CONSTS();
        ExeContext$$CONSTS();
        Utils$$CONSTS();
        IPlatform$$CONSTS();
        ICpuDataSheet$$CONSTS();
        IPeripheral$$CONSTS();
        IExeContext$$CREATES();
        ExeContext$$CREATES();
        Utils$$CREATES();
        IPlatform$$CREATES();
        ICpuDataSheet$$CREATES();
        IPeripheral$$CREATES();
        IExeContext$$FUNCTIONS();
        ExeContext$$FUNCTIONS();
        Utils$$FUNCTIONS();
        IPlatform$$FUNCTIONS();
        ICpuDataSheet$$FUNCTIONS();
        IPeripheral$$FUNCTIONS();
        IExeContext$$SIZES();
        ExeContext$$SIZES();
        Utils$$SIZES();
        IPlatform$$SIZES();
        ICpuDataSheet$$SIZES();
        IPeripheral$$SIZES();
        IExeContext$$TYPES();
        ExeContext$$TYPES();
        Utils$$TYPES();
        IPlatform$$TYPES();
        ICpuDataSheet$$TYPES();
        IPeripheral$$TYPES();
        if (isROV) {
            IExeContext$$ROV();
            ExeContext$$ROV();
            Utils$$ROV();
            IPlatform$$ROV();
            ICpuDataSheet$$ROV();
            IPeripheral$$ROV();
        }//isROV
        $$SINGLETONS();
        IExeContext$$SINGLETONS();
        ExeContext$$SINGLETONS();
        Utils$$SINGLETONS();
        IPlatform$$SINGLETONS();
        ICpuDataSheet$$SINGLETONS();
        IPeripheral$$SINGLETONS();
        $$INITIALIZATION();
    }
}
