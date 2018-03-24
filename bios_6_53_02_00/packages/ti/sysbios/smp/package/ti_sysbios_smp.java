/*
 *  Do not modify this file; it is automatically 
 *  generated and any modifications will be overwritten.
 *
 * @(#) xdc-D20
 */
import java.util.*;
import org.mozilla.javascript.*;
import xdc.services.intern.xsr.*;
import xdc.services.spec.Session;

public class ti_sysbios_smp
{
    static final String VERS = "@(#) xdc-D20\n";

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
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.smp.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.smp", new Value.Obj("ti.sysbios.smp", pkgP));
    }

    void LoggerBuf$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.smp.LoggerBuf", new Value.Obj("ti.sysbios.smp.LoggerBuf", po));
        pkgV.bind("LoggerBuf", vo);
        // decls 
        om.bind("ti.sysbios.smp.LoggerBuf.BufType", new Proto.Enm("ti.sysbios.smp.LoggerBuf.BufType"));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf$$RecordView", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf.RecordView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf$$StopModeData", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf.StopModeData", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf$$Entry", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf.Entry", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf.Module_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.smp.LoggerBuf.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf$$Object", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf$$Params", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.smp.LoggerBuf.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.smp.LoggerBuf.Object", om.findStrict("ti.sysbios.smp.LoggerBuf.Instance_State", "ti.sysbios.smp"));
        }//isROV
    }

    void SysMin$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.smp.SysMin.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.smp.SysMin", new Value.Obj("ti.sysbios.smp.SysMin", po));
        pkgV.bind("SysMin", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.SysMin$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.smp.SysMin.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.SysMin$$BufferEntryView", new Proto.Obj());
        om.bind("ti.sysbios.smp.SysMin.BufferEntryView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.SysMin$$LineBuffer", new Proto.Obj());
        om.bind("ti.sysbios.smp.SysMin.LineBuffer", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.SysMin$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.smp.SysMin.Module_State", new Proto.Str(spo, false));
    }

    void SysStd$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.smp.SysStd.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.smp.SysStd", new Value.Obj("ti.sysbios.smp.SysStd", po));
        pkgV.bind("SysStd", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.SysStd$$LineBuffer", new Proto.Obj());
        om.bind("ti.sysbios.smp.SysStd.LineBuffer", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.smp.SysStd$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.smp.SysStd.Module_State", new Proto.Str(spo, false));
    }

    void LoggerBuf_TimestampProxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf_TimestampProxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.smp.LoggerBuf_TimestampProxy", new Value.Obj("ti.sysbios.smp.LoggerBuf_TimestampProxy", po));
        pkgV.bind("LoggerBuf_TimestampProxy", vo);
        // decls 
    }

    void LoggerBuf_Module_GateProxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy", new Value.Obj("ti.sysbios.smp.LoggerBuf_Module_GateProxy", po));
        pkgV.bind("LoggerBuf_Module_GateProxy", vo);
        // decls 
        // insts 
        Object insP = om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy$$Object", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy$$Params", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Params", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance_State", new Proto.Str(po, false));
        om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Object", om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance_State", "ti.sysbios.smp"));
        }//isROV
    }

    void LoggerBuf$$CONSTS()
    {
        // module LoggerBuf
        om.bind("ti.sysbios.smp.LoggerBuf.BufType_CIRCULAR", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.smp.LoggerBuf.BufType", "ti.sysbios.smp"), "ti.sysbios.smp.LoggerBuf.BufType_CIRCULAR", 0));
        om.bind("ti.sysbios.smp.LoggerBuf.BufType_FIXED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.smp.LoggerBuf.BufType", "ti.sysbios.smp"), "ti.sysbios.smp.LoggerBuf.BufType_FIXED", 1));
        om.bind("ti.sysbios.smp.LoggerBuf.FULL", Global.eval("-1"));
        om.bind("ti.sysbios.smp.LoggerBuf.WRAP", 0L);
        om.bind("ti.sysbios.smp.LoggerBuf.NEXT", 1L);
        om.bind("ti.sysbios.smp.LoggerBuf.flushAll", new Extern("ti_sysbios_smp_LoggerBuf_flushAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.smp.LoggerBuf.flushAllInternal", new Extern("ti_sysbios_smp_LoggerBuf_flushAllInternal__E", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.smp.LoggerBuf.filterOutEvent", new Extern("ti_sysbios_smp_LoggerBuf_filterOutEvent__I", "xdc_Bool(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.smp.LoggerBuf.instanceStartup", new Extern("ti_sysbios_smp_LoggerBuf_instanceStartup__I", "xdc_Void(*)(ti_sysbios_smp_LoggerBuf_Object*)", true, false));
    }

    void SysMin$$CONSTS()
    {
        // module SysMin
        om.bind("ti.sysbios.smp.SysMin.abort", new Extern("ti_sysbios_smp_SysMin_abort__E", "xdc_Void(*)(xdc_CString)", true, false));
        om.bind("ti.sysbios.smp.SysMin.exit", new Extern("ti_sysbios_smp_SysMin_exit__E", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.smp.SysMin.flush", new Extern("ti_sysbios_smp_SysMin_flush__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.smp.SysMin.putch", new Extern("ti_sysbios_smp_SysMin_putch__E", "xdc_Void(*)(xdc_Char)", true, false));
        om.bind("ti.sysbios.smp.SysMin.ready", new Extern("ti_sysbios_smp_SysMin_ready__E", "xdc_Bool(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.smp.SysMin.output", new Extern("ti_sysbios_smp_SysMin_output__I", "xdc_Void(*)(xdc_Char*,xdc_UInt)", true, false));
    }

    void SysStd$$CONSTS()
    {
        // module SysStd
        om.bind("ti.sysbios.smp.SysStd.abort", new Extern("ti_sysbios_smp_SysStd_abort__E", "xdc_Void(*)(xdc_CString)", true, false));
        om.bind("ti.sysbios.smp.SysStd.exit", new Extern("ti_sysbios_smp_SysStd_exit__E", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.smp.SysStd.flush", new Extern("ti_sysbios_smp_SysStd_flush__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.smp.SysStd.putch", new Extern("ti_sysbios_smp_SysStd_putch__E", "xdc_Void(*)(xdc_Char)", true, false));
        om.bind("ti.sysbios.smp.SysStd.ready", new Extern("ti_sysbios_smp_SysStd_ready__E", "xdc_Bool(*)(xdc_Void)", true, false));
    }

    void LoggerBuf_TimestampProxy$$CONSTS()
    {
        // module LoggerBuf_TimestampProxy
        om.bind("ti.sysbios.smp.LoggerBuf_TimestampProxy.get32", new Extern("ti_sysbios_smp_LoggerBuf_TimestampProxy_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.smp.LoggerBuf_TimestampProxy.get64", new Extern("ti_sysbios_smp_LoggerBuf_TimestampProxy_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.smp.LoggerBuf_TimestampProxy.getFreq", new Extern("ti_sysbios_smp_LoggerBuf_TimestampProxy_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
    }

    void LoggerBuf_Module_GateProxy$$CONSTS()
    {
        // module LoggerBuf_Module_GateProxy
        om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy.query", new Extern("ti_sysbios_smp_LoggerBuf_Module_GateProxy_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void LoggerBuf$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$smp$LoggerBuf$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.smp.LoggerBuf.create() called before xdc.useModule('ti.sysbios.smp.LoggerBuf')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.smp.LoggerBuf$$create", new Proto.Fxn(om.findStrict("ti.sysbios.smp.LoggerBuf.Module", "ti.sysbios.smp"), om.findStrict("ti.sysbios.smp.LoggerBuf.Instance", "ti.sysbios.smp"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("ti.sysbios.smp.LoggerBuf.Params", "ti.sysbios.smp"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$smp$LoggerBuf$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.smp.LoggerBuf'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.smp.LoggerBuf.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.smp']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.smp.LoggerBuf'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.smp.LoggerBuf'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.smp.LoggerBuf$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.smp.LoggerBuf.Module", "ti.sysbios.smp"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.smp.LoggerBuf$$Object", "ti.sysbios.smp"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("ti.sysbios.smp.LoggerBuf.Params", "ti.sysbios.smp"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$smp$LoggerBuf$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.smp.LoggerBuf'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.smp.LoggerBuf'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.smp.LoggerBuf'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void SysMin$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void SysStd$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void LoggerBuf_TimestampProxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void LoggerBuf_Module_GateProxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$smp$LoggerBuf_Module_GateProxy$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.smp.LoggerBuf_Module_GateProxy.create() called before xdc.useModule('ti.sysbios.smp.LoggerBuf_Module_GateProxy')\");\n");
                sb.append("}\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.smp.LoggerBuf_Module_GateProxy$$create", new Proto.Fxn(om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Module", "ti.sysbios.smp"), om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance", "ti.sysbios.smp"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Params", "ti.sysbios.smp"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$smp$LoggerBuf_Module_GateProxy$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.smp.LoggerBuf_Module_GateProxy'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.smp']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.smp.LoggerBuf_Module_GateProxy'].Instance_State);\n");
                sb.append("if (!__mod.delegate$) {\n");
                    sb.append("throw new Error(\"Unbound proxy module: ti.sysbios.smp.LoggerBuf_Module_GateProxy\");\n");
                sb.append("}\n");
                sb.append("var __dmod = __mod.delegate$.$orig;\n");
                sb.append("var __dinst = __dmod.create(__params);\n");
                sb.append("__inst.$$bind('delegate$', __dinst);\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.smp.LoggerBuf_Module_GateProxy'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void LoggerBuf$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn LoggerBuf.initDecoder
        fxn = (Proto.Fxn)om.bind("ti.sysbios.smp.LoggerBuf$$initDecoder", new Proto.Fxn(om.findStrict("ti.sysbios.smp.LoggerBuf.Module", "ti.sysbios.smp"), null, 0, -1, false));
    }

    void SysMin$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SysStd$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void LoggerBuf_TimestampProxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void LoggerBuf_Module_GateProxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void LoggerBuf$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.smp.LoggerBuf.Entry", "ti.sysbios.smp");
        sizes.clear();
        sizes.add(Global.newArray("tstamp", "Sxdc.runtime.Types;Timestamp64"));
        sizes.add(Global.newArray("serial", "UInt32"));
        sizes.add(Global.newArray("evt", "UInt32"));
        sizes.add(Global.newArray("arg1", "TIArg"));
        sizes.add(Global.newArray("arg2", "TIArg"));
        sizes.add(Global.newArray("arg3", "TIArg"));
        sizes.add(Global.newArray("arg4", "TIArg"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.smp.LoggerBuf.Entry']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.smp.LoggerBuf.Entry']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.smp.LoggerBuf.Entry'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.smp.LoggerBuf.Module_State", "ti.sysbios.smp");
        sizes.clear();
        sizes.add(Global.newArray("level1", "UInt16"));
        sizes.add(Global.newArray("level2", "UInt16"));
        sizes.add(Global.newArray("level3", "UInt16"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.smp.LoggerBuf.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.smp.LoggerBuf.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.smp.LoggerBuf.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.smp.LoggerBuf.Instance_State", "ti.sysbios.smp");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("bufHeap", "UPtr"));
        sizes.add(Global.newArray("entryArr", "UPtr"));
        sizes.add(Global.newArray("curEntry", "UPtr"));
        sizes.add(Global.newArray("endEntry", "UPtr"));
        sizes.add(Global.newArray("readEntry", "UPtr"));
        sizes.add(Global.newArray("serial", "UInt32"));
        sizes.add(Global.newArray("numEntries", "TInt16"));
        sizes.add(Global.newArray("advance", "TInt8"));
        sizes.add(Global.newArray("enabled", "UShort"));
        sizes.add(Global.newArray("flush", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.smp.LoggerBuf.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.smp.LoggerBuf.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.smp.LoggerBuf.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void SysMin$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.smp.SysMin.LineBuffer", "ti.sysbios.smp");
        sizes.clear();
        sizes.add(Global.newArray("outidx", "UInt"));
        sizes.add(Global.newArray("outbuf", "A256;TChar"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.smp.SysMin.LineBuffer']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.smp.SysMin.LineBuffer']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.smp.SysMin.LineBuffer'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.smp.SysMin.Module_State", "ti.sysbios.smp");
        sizes.clear();
        sizes.add(Global.newArray("lineBuffers", "UPtr"));
        sizes.add(Global.newArray("outbuf", "UPtr"));
        sizes.add(Global.newArray("outidx", "UInt"));
        sizes.add(Global.newArray("wrapped", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.smp.SysMin.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.smp.SysMin.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.smp.SysMin.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void SysStd$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.smp.SysStd.LineBuffer", "ti.sysbios.smp");
        sizes.clear();
        sizes.add(Global.newArray("outidx", "UInt"));
        sizes.add(Global.newArray("outbuf", "A256;TChar"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.smp.SysStd.LineBuffer']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.smp.SysStd.LineBuffer']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.smp.SysStd.LineBuffer'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.smp.SysStd.Module_State", "ti.sysbios.smp");
        sizes.clear();
        sizes.add(Global.newArray("lineBuffers", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.smp.SysStd.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.smp.SysStd.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.smp.SysStd.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void LoggerBuf_TimestampProxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void LoggerBuf_Module_GateProxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void LoggerBuf$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/smp/LoggerBuf.xs");
        om.bind("ti.sysbios.smp.LoggerBuf$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf.Module", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.Module", om.findStrict("xdc.runtime.IFilterLogger.Module", "ti.sysbios.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FULL", Proto.Elm.newCNum("(xdc_Int8)"), Global.eval("-1"), "rh");
                po.addFld("WRAP", Proto.Elm.newCNum("(xdc_Int8)"), 0L, "rh");
                po.addFld("NEXT", Proto.Elm.newCNum("(xdc_Int8)"), 1L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.smp"), $$UNDEF, "wh");
            po.addFld("E_badLevel", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.smp"), Global.newObject("msg", "E_badLevel: Bad filter level value: %d"), "w");
            po.addFldV("TimestampProxy", (Proto)om.findStrict("xdc.runtime.ITimestampClient.Module", "ti.sysbios.smp"), null, "wh", $$delegGet, $$delegSet);
            po.addFld("enableFlush", $$T_Bool, false, "w");
            po.addFld("statusLogger", (Proto)om.findStrict("xdc.runtime.ILogger.Handle", "ti.sysbios.smp"), null, "w");
            po.addFld("level1Mask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("level2Mask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("level3Mask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("level4Mask", Proto.Elm.newCNum("(xdc_Bits16)"), Global.eval("0xFF9F & (~0x0010) & (~0x0008)"), "w");
            po.addFldV("Module_GateProxy", (Proto)om.findStrict("xdc.runtime.IGateProvider.Module", "ti.sysbios.smp"), null, "wh", $$delegGet, $$delegSet);
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.smp.LoggerBuf$$create", "ti.sysbios.smp"), Global.get("ti$sysbios$smp$LoggerBuf$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.smp.LoggerBuf$$construct", "ti.sysbios.smp"), Global.get("ti$sysbios$smp$LoggerBuf$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.smp.LoggerBuf$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.smp.LoggerBuf$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.smp.LoggerBuf$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.smp.LoggerBuf$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.smp.LoggerBuf$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.smp.LoggerBuf$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "getMetaArgs");
                if (fxn != null) po.addFxn("getMetaArgs", (Proto.Fxn)om.findStrict("xdc.runtime.ILogger$$getMetaArgs", "ti.sysbios.smp"), fxn);
                po.addFxn("initDecoder", (Proto.Fxn)om.findStrict("ti.sysbios.smp.LoggerBuf$$initDecoder", "ti.sysbios.smp"), Global.get(cap, "initDecoder"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf.Instance", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.Instance", om.findStrict("xdc.runtime.IFilterLogger.Instance", "ti.sysbios.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FULL", Proto.Elm.newCNum("(xdc_Int8)"), Global.eval("-1"), "rh");
                po.addFld("WRAP", Proto.Elm.newCNum("(xdc_Int8)"), 0L, "rh");
                po.addFld("NEXT", Proto.Elm.newCNum("(xdc_Int8)"), 1L, "rh");
        if (isCFG) {
            po.addFld("numEntries", Proto.Elm.newCNum("(xdc_Int)"), 64L, "w");
            po.addFld("bufType", (Proto)om.findStrict("ti.sysbios.smp.LoggerBuf.BufType", "ti.sysbios.smp"), om.find("ti.sysbios.smp.LoggerBuf.BufType_CIRCULAR"), "w");
            po.addFld("exitFlush", $$T_Bool, false, "w");
            po.addFld("bufSection", $$T_Str, null, "wh");
            po.addFld("bufHeap", (Proto)om.findStrict("xdc.runtime.IHeap.Handle", "ti.sysbios.smp"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.smp"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$Params", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.Params", om.findStrict("xdc.runtime.IFilterLogger$$Params", "ti.sysbios.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("FULL", Proto.Elm.newCNum("(xdc_Int8)"), Global.eval("-1"), "rh");
                po.addFld("WRAP", Proto.Elm.newCNum("(xdc_Int8)"), 0L, "rh");
                po.addFld("NEXT", Proto.Elm.newCNum("(xdc_Int8)"), 1L, "rh");
        if (isCFG) {
            po.addFld("numEntries", Proto.Elm.newCNum("(xdc_Int)"), 64L, "w");
            po.addFld("bufType", (Proto)om.findStrict("ti.sysbios.smp.LoggerBuf.BufType", "ti.sysbios.smp"), om.find("ti.sysbios.smp.LoggerBuf.BufType_CIRCULAR"), "w");
            po.addFld("exitFlush", $$T_Bool, false, "w");
            po.addFld("bufSection", $$T_Str, null, "wh");
            po.addFld("bufHeap", (Proto)om.findStrict("xdc.runtime.IHeap.Handle", "ti.sysbios.smp"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.smp"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$Object", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.Object", om.findStrict("ti.sysbios.smp.LoggerBuf.Instance", "ti.sysbios.smp"));
        // struct LoggerBuf.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$BasicView", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("lastSerial", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("numEntries", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("type", $$T_Str, $$UNDEF, "w");
                po.addFld("enabledFlag", $$T_Bool, $$UNDEF, "w");
        // struct LoggerBuf.RecordView
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$RecordView", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.RecordView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("serial", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("timestampRaw", Proto.Elm.newCNum("(xdc_Long)"), $$UNDEF, "w");
                po.addFld("core", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("modName", $$T_Str, $$UNDEF, "w");
                po.addFld("text", $$T_Str, $$UNDEF, "w");
                po.addFld("eventId", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("eventName", $$T_Str, $$UNDEF, "w");
                po.addFld("arg0", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg1", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg2", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg3", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg4", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg5", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg6", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg7", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
        // struct LoggerBuf.StopModeData
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$StopModeData", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.StopModeData", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("bufferSymbol", $$T_Str, $$UNDEF, "w");
                po.addFld("bufferSize", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct LoggerBuf.Entry
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$Entry", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.Entry", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("tstamp", (Proto)om.findStrict("xdc.runtime.Types.Timestamp64", "ti.sysbios.smp"), $$DEFAULT, "w");
                po.addFld("serial", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("evt", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("arg1", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg2", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg3", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
                po.addFld("arg4", new Proto.Adr("xdc_IArg", "Pv"), $$UNDEF, "w");
        // struct LoggerBuf.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$Module_State", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("level1", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("level2", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("level3", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
        // struct LoggerBuf.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$Instance_State", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("bufHeap", (Proto)om.findStrict("xdc.runtime.IHeap.Handle", "ti.sysbios.smp"), $$UNDEF, "w");
                po.addFld("entryArr", new Proto.Arr((Proto)om.findStrict("ti.sysbios.smp.LoggerBuf.Entry", "ti.sysbios.smp"), false), $$DEFAULT, "w");
                po.addFld("curEntry", new Proto.Adr("ti_sysbios_smp_LoggerBuf_Entry*", "PS"), $$UNDEF, "w");
                po.addFld("endEntry", new Proto.Adr("ti_sysbios_smp_LoggerBuf_Entry*", "PS"), $$UNDEF, "w");
                po.addFld("readEntry", new Proto.Adr("ti_sysbios_smp_LoggerBuf_Entry*", "PS"), $$UNDEF, "w");
                po.addFld("serial", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("numEntries", Proto.Elm.newCNum("(xdc_Int16)"), $$UNDEF, "w");
                po.addFld("advance", Proto.Elm.newCNum("(xdc_Int8)"), $$UNDEF, "w");
                po.addFld("enabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("flush", $$T_Bool, $$UNDEF, "w");
    }

    void SysMin$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/smp/SysMin.xs");
        om.bind("ti.sysbios.smp.SysMin$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysMin.Module", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.SysMin.Module", om.findStrict("xdc.runtime.ISystemSupport.Module", "ti.sysbios.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.smp"), $$UNDEF, "wh");
            po.addFld("bufSize", Proto.Elm.newCNum("(xdc_SizeT)"), 1024L, "w");
            po.addFld("flushAtExit", $$T_Bool, true, "w");
            po.addFld("sectionName", $$T_Str, null, "wh");
            po.addFld("outputFxn", new Proto.Adr("xdc_Void(*)(xdc_Char*,xdc_UInt)", "PFv"), null, "w");
            po.addFld("outputFunc", new Proto.Adr("xdc_Void(*)(xdc_Char*,xdc_UInt)", "PFv"), "&ti_sysbios_smp_SysMin_output__I", "r");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.smp.SysMin$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.smp.SysMin$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.smp.SysMin$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.smp.SysMin$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct SysMin.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysMin$$ModuleView", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.SysMin.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("outBuf", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("outBufIndex", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("wrapped", $$T_Bool, $$UNDEF, "w");
        // struct SysMin.BufferEntryView
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysMin$$BufferEntryView", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.SysMin.BufferEntryView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("entry", $$T_Str, $$UNDEF, "w");
        // typedef SysMin.OutputFxn
        om.bind("ti.sysbios.smp.SysMin.OutputFxn", new Proto.Adr("xdc_Void(*)(xdc_Char*,xdc_UInt)", "PFv"));
        // struct SysMin.LineBuffer
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysMin$$LineBuffer", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.SysMin.LineBuffer", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("outidx", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("outbuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
        // struct SysMin.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysMin$$Module_State", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.SysMin.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("lineBuffers", new Proto.Arr((Proto)om.findStrict("ti.sysbios.smp.SysMin.LineBuffer", "ti.sysbios.smp"), false), $$DEFAULT, "w");
                po.addFld("outbuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), $$DEFAULT, "w");
                po.addFld("outidx", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("wrapped", $$T_Bool, $$UNDEF, "w");
    }

    void SysStd$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/smp/SysStd.xs");
        om.bind("ti.sysbios.smp.SysStd$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysStd.Module", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.SysStd.Module", om.findStrict("xdc.runtime.ISystemSupport.Module", "ti.sysbios.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.smp.SysStd$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.smp.SysStd$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.smp.SysStd$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.smp.SysStd$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct SysStd.LineBuffer
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysStd$$LineBuffer", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.SysStd.LineBuffer", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("outidx", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("outbuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false, xdc.services.intern.xsr.Enum.intValue(256L)), $$DEFAULT, "w");
        // struct SysStd.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysStd$$Module_State", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.SysStd.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("lineBuffers", new Proto.Arr((Proto)om.findStrict("ti.sysbios.smp.SysStd.LineBuffer", "ti.sysbios.smp"), false), $$DEFAULT, "w");
    }

    void LoggerBuf_TimestampProxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_TimestampProxy.Module", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf_TimestampProxy.Module", om.findStrict("xdc.runtime.ITimestampClient.Module", "ti.sysbios.smp"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.ITimestampClient.Module", "ti.sysbios.smp"), null, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void LoggerBuf_Module_GateProxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Module", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Module", om.findStrict("xdc.runtime.IGateProvider.Module", "ti.sysbios.smp"));
                po.addFld("delegate$", (Proto)om.findStrict("xdc.runtime.IGateProvider.Module", "ti.sysbios.smp"), null, "wh");
                po.addFld("abstractInstances$", $$T_Bool, false, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy$$create", "ti.sysbios.smp"), Global.get("ti$sysbios$smp$LoggerBuf_Module_GateProxy$$create"));
        }//isCFG
                po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "ti.sysbios.smp"), $$UNDEF);
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance", om.findStrict("xdc.runtime.IGateProvider.Instance", "ti.sysbios.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.smp"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy$$Params", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Params", om.findStrict("xdc.runtime.IGateProvider$$Params", "ti.sysbios.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.smp"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy$$Object", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Object", om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance", "ti.sysbios.smp"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy$$Instance_State", "ti.sysbios.smp");
        po.init("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance_State", null);
        po.addFld("$hostonly", $$T_Num, 0, "r");
    }

    void LoggerBuf$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf", "ti.sysbios.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$Instance_State", "ti.sysbios.smp");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Entry$fetchDesc", Global.newObject("type", "ti.sysbios.smp.LoggerBuf.Entry", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$Entry", "ti.sysbios.smp");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.smp.LoggerBuf.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$Module_State", "ti.sysbios.smp");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.smp.LoggerBuf.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf$$Instance_State", "ti.sysbios.smp");
        po.bind("entryArr$fetchDesc", Global.newObject("type", "ti.sysbios.smp.LoggerBuf.Entry", "isScalar", false));
        po.bind("curEntry$fetchDesc", Global.newObject("type", "ti.sysbios.smp.LoggerBuf.Entry", "isScalar", false));
        po.bind("endEntry$fetchDesc", Global.newObject("type", "ti.sysbios.smp.LoggerBuf.Entry", "isScalar", false));
        po.bind("readEntry$fetchDesc", Global.newObject("type", "ti.sysbios.smp.LoggerBuf.Entry", "isScalar", false));
    }

    void SysMin$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.SysMin", "ti.sysbios.smp");
        vo.bind("LineBuffer$fetchDesc", Global.newObject("type", "ti.sysbios.smp.SysMin.LineBuffer", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysMin$$LineBuffer", "ti.sysbios.smp");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.smp.SysMin.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysMin$$Module_State", "ti.sysbios.smp");
        po.bind("lineBuffers$fetchDesc", Global.newObject("type", "ti.sysbios.smp.SysMin.LineBuffer", "isScalar", false));
        po.bind("outbuf$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Char", "isScalar", true));
    }

    void SysStd$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.SysStd", "ti.sysbios.smp");
        vo.bind("LineBuffer$fetchDesc", Global.newObject("type", "ti.sysbios.smp.SysStd.LineBuffer", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysStd$$LineBuffer", "ti.sysbios.smp");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.smp.SysStd.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysStd$$Module_State", "ti.sysbios.smp");
        po.bind("lineBuffers$fetchDesc", Global.newObject("type", "ti.sysbios.smp.SysStd.LineBuffer", "isScalar", false));
    }

    void LoggerBuf_TimestampProxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_TimestampProxy", "ti.sysbios.smp");
    }

    void LoggerBuf_Module_GateProxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy", "ti.sysbios.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy$$Instance_State", "ti.sysbios.smp");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.smp.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.smp"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/smp/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.smp"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.smp"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.smp"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.smp"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.smp"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.smp"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.smp", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.smp");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.smp.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.smp'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.smp$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.smp$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.smp$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.smp.aem3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.smp.aem4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.smp.aem4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.smp.am3g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.smp.am4g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.smp.am4fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.smp.aa15fg',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.smp.aem3',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.smp.aem4',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.smp.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.smp.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.smp.aem4f', {target: 'ti.targets.arm.elf.M4F', suffix: 'em4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.smp.am3g', {target: 'gnu.targets.arm.M3', suffix: 'm3g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.smp.am4g', {target: 'gnu.targets.arm.M4', suffix: 'm4g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.smp.am4fg', {target: 'gnu.targets.arm.M4F', suffix: 'm4fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.smp.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.smp.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.smp.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void LoggerBuf$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf", "ti.sysbios.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf.Module", "ti.sysbios.smp");
        vo.init2(po, "ti.sysbios.smp.LoggerBuf", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.smp.LoggerBuf$$capsule", "ti.sysbios.smp"));
        vo.bind("Instance", om.findStrict("ti.sysbios.smp.LoggerBuf.Instance", "ti.sysbios.smp"));
        vo.bind("Params", om.findStrict("ti.sysbios.smp.LoggerBuf.Params", "ti.sysbios.smp"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.smp.LoggerBuf.Params", "ti.sysbios.smp")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.smp.LoggerBuf.Handle", "ti.sysbios.smp"));
        vo.bind("$package", om.findStrict("ti.sysbios.smp", "ti.sysbios.smp"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        mcfgs.add("Module__diagsEnabled");
        icfgs.add("Module__diagsEnabled");
        mcfgs.add("Module__diagsIncluded");
        icfgs.add("Module__diagsIncluded");
        mcfgs.add("Module__diagsMask");
        icfgs.add("Module__diagsMask");
        mcfgs.add("Module__gateObj");
        icfgs.add("Module__gateObj");
        mcfgs.add("Module__gatePrms");
        icfgs.add("Module__gatePrms");
        mcfgs.add("Module__id");
        icfgs.add("Module__id");
        mcfgs.add("Module__loggerDefined");
        icfgs.add("Module__loggerDefined");
        mcfgs.add("Module__loggerObj");
        icfgs.add("Module__loggerObj");
        mcfgs.add("Module__loggerFxn0");
        icfgs.add("Module__loggerFxn0");
        mcfgs.add("Module__loggerFxn1");
        icfgs.add("Module__loggerFxn1");
        mcfgs.add("Module__loggerFxn2");
        icfgs.add("Module__loggerFxn2");
        mcfgs.add("Module__loggerFxn4");
        icfgs.add("Module__loggerFxn4");
        mcfgs.add("Module__loggerFxn8");
        icfgs.add("Module__loggerFxn8");
        mcfgs.add("Object__count");
        icfgs.add("Object__count");
        mcfgs.add("Object__heap");
        icfgs.add("Object__heap");
        mcfgs.add("Object__sizeof");
        icfgs.add("Object__sizeof");
        mcfgs.add("Object__table");
        icfgs.add("Object__table");
        mcfgs.add("filterByLevel");
        vo.bind("BufType", om.findStrict("ti.sysbios.smp.LoggerBuf.BufType", "ti.sysbios.smp"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.smp.LoggerBuf.BasicView", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.LoggerBuf.BasicView", "ti.sysbios.smp"));
        vo.bind("RecordView", om.findStrict("ti.sysbios.smp.LoggerBuf.RecordView", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.LoggerBuf.RecordView", "ti.sysbios.smp"));
        vo.bind("StopModeData", om.findStrict("ti.sysbios.smp.LoggerBuf.StopModeData", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.LoggerBuf.StopModeData", "ti.sysbios.smp"));
        mcfgs.add("E_badLevel");
        vo.bind("TimestampProxy$proxy", om.findStrict("ti.sysbios.smp.LoggerBuf_TimestampProxy", "ti.sysbios.smp"));
        proxies.add("TimestampProxy");
        mcfgs.add("enableFlush");
        mcfgs.add("statusLogger");
        mcfgs.add("level1Mask");
        mcfgs.add("level2Mask");
        mcfgs.add("level3Mask");
        mcfgs.add("level4Mask");
        vo.bind("Entry", om.findStrict("ti.sysbios.smp.LoggerBuf.Entry", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.LoggerBuf.Entry", "ti.sysbios.smp"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.smp.LoggerBuf.Module_State", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.LoggerBuf.Module_State", "ti.sysbios.smp"));
        vo.bind("Instance_State", om.findStrict("ti.sysbios.smp.LoggerBuf.Instance_State", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.LoggerBuf.Instance_State", "ti.sysbios.smp"));
        vo.bind("Module_GateProxy$proxy", om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy", "ti.sysbios.smp"));
        proxies.add("Module_GateProxy");
        vo.bind("BufType_CIRCULAR", om.findStrict("ti.sysbios.smp.LoggerBuf.BufType_CIRCULAR", "ti.sysbios.smp"));
        vo.bind("BufType_FIXED", om.findStrict("ti.sysbios.smp.LoggerBuf.BufType_FIXED", "ti.sysbios.smp"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.smp")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", om.has("ti.sysbios.smp.LoggerBuf$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$smp$LoggerBuf$$__initObject"));
        }//isCFG
        vo.bind("flushAll", om.findStrict("ti.sysbios.smp.LoggerBuf.flushAll", "ti.sysbios.smp"));
        vo.bind("flushAllInternal", om.findStrict("ti.sysbios.smp.LoggerBuf.flushAllInternal", "ti.sysbios.smp"));
        vo.bind("filterOutEvent", om.findStrict("ti.sysbios.smp.LoggerBuf.filterOutEvent", "ti.sysbios.smp"));
        vo.bind("instanceStartup", om.findStrict("ti.sysbios.smp.LoggerBuf.instanceStartup", "ti.sysbios.smp"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_smp_LoggerBuf_Handle__label__E", "ti_sysbios_smp_LoggerBuf_Module__startupDone__E", "ti_sysbios_smp_LoggerBuf_Object__create__E", "ti_sysbios_smp_LoggerBuf_Object__delete__E", "ti_sysbios_smp_LoggerBuf_Object__get__E", "ti_sysbios_smp_LoggerBuf_Object__first__E", "ti_sysbios_smp_LoggerBuf_Object__next__E", "ti_sysbios_smp_LoggerBuf_Params__init__E", "ti_sysbios_smp_LoggerBuf_enable__E", "ti_sysbios_smp_LoggerBuf_disable__E", "ti_sysbios_smp_LoggerBuf_write0__E", "ti_sysbios_smp_LoggerBuf_write1__E", "ti_sysbios_smp_LoggerBuf_write2__E", "ti_sysbios_smp_LoggerBuf_write4__E", "ti_sysbios_smp_LoggerBuf_write8__E", "ti_sysbios_smp_LoggerBuf_setFilterLevel__E", "ti_sysbios_smp_LoggerBuf_getFilterLevel__E", "ti_sysbios_smp_LoggerBuf_flushAll__E", "ti_sysbios_smp_LoggerBuf_flushAllInternal__E", "ti_sysbios_smp_LoggerBuf_reset__E", "ti_sysbios_smp_LoggerBuf_flush__E", "ti_sysbios_smp_LoggerBuf_getNextEntry__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_badLevel"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.smp.LoggerBuf.Object", "ti.sysbios.smp"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("LoggerBuf", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("LoggerBuf");
    }

    void SysMin$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.SysMin", "ti.sysbios.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysMin.Module", "ti.sysbios.smp");
        vo.init2(po, "ti.sysbios.smp.SysMin", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.smp.SysMin$$capsule", "ti.sysbios.smp"));
        vo.bind("$package", om.findStrict("ti.sysbios.smp", "ti.sysbios.smp"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        mcfgs.add("Module__diagsEnabled");
        icfgs.add("Module__diagsEnabled");
        mcfgs.add("Module__diagsIncluded");
        icfgs.add("Module__diagsIncluded");
        mcfgs.add("Module__diagsMask");
        icfgs.add("Module__diagsMask");
        mcfgs.add("Module__gateObj");
        icfgs.add("Module__gateObj");
        mcfgs.add("Module__gatePrms");
        icfgs.add("Module__gatePrms");
        mcfgs.add("Module__id");
        icfgs.add("Module__id");
        mcfgs.add("Module__loggerDefined");
        icfgs.add("Module__loggerDefined");
        mcfgs.add("Module__loggerObj");
        icfgs.add("Module__loggerObj");
        mcfgs.add("Module__loggerFxn0");
        icfgs.add("Module__loggerFxn0");
        mcfgs.add("Module__loggerFxn1");
        icfgs.add("Module__loggerFxn1");
        mcfgs.add("Module__loggerFxn2");
        icfgs.add("Module__loggerFxn2");
        mcfgs.add("Module__loggerFxn4");
        icfgs.add("Module__loggerFxn4");
        mcfgs.add("Module__loggerFxn8");
        icfgs.add("Module__loggerFxn8");
        mcfgs.add("Object__count");
        icfgs.add("Object__count");
        mcfgs.add("Object__heap");
        icfgs.add("Object__heap");
        mcfgs.add("Object__sizeof");
        icfgs.add("Object__sizeof");
        mcfgs.add("Object__table");
        icfgs.add("Object__table");
        vo.bind("ModuleView", om.findStrict("ti.sysbios.smp.SysMin.ModuleView", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.SysMin.ModuleView", "ti.sysbios.smp"));
        vo.bind("BufferEntryView", om.findStrict("ti.sysbios.smp.SysMin.BufferEntryView", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.SysMin.BufferEntryView", "ti.sysbios.smp"));
        mcfgs.add("bufSize");
        mcfgs.add("flushAtExit");
        vo.bind("OutputFxn", om.findStrict("ti.sysbios.smp.SysMin.OutputFxn", "ti.sysbios.smp"));
        mcfgs.add("outputFxn");
        mcfgs.add("outputFunc");
        icfgs.add("outputFunc");
        vo.bind("LineBuffer", om.findStrict("ti.sysbios.smp.SysMin.LineBuffer", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.SysMin.LineBuffer", "ti.sysbios.smp"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.smp.SysMin.Module_State", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.SysMin.Module_State", "ti.sysbios.smp"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.smp")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("abort", om.findStrict("ti.sysbios.smp.SysMin.abort", "ti.sysbios.smp"));
        vo.bind("exit", om.findStrict("ti.sysbios.smp.SysMin.exit", "ti.sysbios.smp"));
        vo.bind("flush", om.findStrict("ti.sysbios.smp.SysMin.flush", "ti.sysbios.smp"));
        vo.bind("putch", om.findStrict("ti.sysbios.smp.SysMin.putch", "ti.sysbios.smp"));
        vo.bind("ready", om.findStrict("ti.sysbios.smp.SysMin.ready", "ti.sysbios.smp"));
        vo.bind("output", om.findStrict("ti.sysbios.smp.SysMin.output", "ti.sysbios.smp"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_smp_SysMin_Module__startupDone__E", "ti_sysbios_smp_SysMin_abort__E", "ti_sysbios_smp_SysMin_exit__E", "ti_sysbios_smp_SysMin_flush__E", "ti_sysbios_smp_SysMin_putch__E", "ti_sysbios_smp_SysMin_ready__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./SysMin.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./SysMin.xdt");
        pkgV.bind("SysMin", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SysMin");
    }

    void SysStd$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.SysStd", "ti.sysbios.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.SysStd.Module", "ti.sysbios.smp");
        vo.init2(po, "ti.sysbios.smp.SysStd", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.smp.SysStd$$capsule", "ti.sysbios.smp"));
        vo.bind("$package", om.findStrict("ti.sysbios.smp", "ti.sysbios.smp"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        mcfgs.add("Module__diagsEnabled");
        icfgs.add("Module__diagsEnabled");
        mcfgs.add("Module__diagsIncluded");
        icfgs.add("Module__diagsIncluded");
        mcfgs.add("Module__diagsMask");
        icfgs.add("Module__diagsMask");
        mcfgs.add("Module__gateObj");
        icfgs.add("Module__gateObj");
        mcfgs.add("Module__gatePrms");
        icfgs.add("Module__gatePrms");
        mcfgs.add("Module__id");
        icfgs.add("Module__id");
        mcfgs.add("Module__loggerDefined");
        icfgs.add("Module__loggerDefined");
        mcfgs.add("Module__loggerObj");
        icfgs.add("Module__loggerObj");
        mcfgs.add("Module__loggerFxn0");
        icfgs.add("Module__loggerFxn0");
        mcfgs.add("Module__loggerFxn1");
        icfgs.add("Module__loggerFxn1");
        mcfgs.add("Module__loggerFxn2");
        icfgs.add("Module__loggerFxn2");
        mcfgs.add("Module__loggerFxn4");
        icfgs.add("Module__loggerFxn4");
        mcfgs.add("Module__loggerFxn8");
        icfgs.add("Module__loggerFxn8");
        mcfgs.add("Object__count");
        icfgs.add("Object__count");
        mcfgs.add("Object__heap");
        icfgs.add("Object__heap");
        mcfgs.add("Object__sizeof");
        icfgs.add("Object__sizeof");
        mcfgs.add("Object__table");
        icfgs.add("Object__table");
        vo.bind("LineBuffer", om.findStrict("ti.sysbios.smp.SysStd.LineBuffer", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.SysStd.LineBuffer", "ti.sysbios.smp"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.smp.SysStd.Module_State", "ti.sysbios.smp"));
        tdefs.add(om.findStrict("ti.sysbios.smp.SysStd.Module_State", "ti.sysbios.smp"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.smp")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("abort", om.findStrict("ti.sysbios.smp.SysStd.abort", "ti.sysbios.smp"));
        vo.bind("exit", om.findStrict("ti.sysbios.smp.SysStd.exit", "ti.sysbios.smp"));
        vo.bind("flush", om.findStrict("ti.sysbios.smp.SysStd.flush", "ti.sysbios.smp"));
        vo.bind("putch", om.findStrict("ti.sysbios.smp.SysStd.putch", "ti.sysbios.smp"));
        vo.bind("ready", om.findStrict("ti.sysbios.smp.SysStd.ready", "ti.sysbios.smp"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_smp_SysStd_Module__startupDone__E", "ti_sysbios_smp_SysStd_abort__E", "ti_sysbios_smp_SysStd_exit__E", "ti_sysbios_smp_SysStd_flush__E", "ti_sysbios_smp_SysStd_putch__E", "ti_sysbios_smp_SysStd_ready__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("SysStd", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SysStd");
    }

    void LoggerBuf_TimestampProxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_TimestampProxy", "ti.sysbios.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_TimestampProxy.Module", "ti.sysbios.smp");
        vo.init2(po, "ti.sysbios.smp.LoggerBuf_TimestampProxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.sysbios.smp", "ti.sysbios.smp"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.smp")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("get32", om.findStrict("ti.sysbios.smp.LoggerBuf_TimestampProxy.get32", "ti.sysbios.smp"));
        vo.bind("get64", om.findStrict("ti.sysbios.smp.LoggerBuf_TimestampProxy.get64", "ti.sysbios.smp"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.smp.LoggerBuf_TimestampProxy.getFreq", "ti.sysbios.smp"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Handle__label", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Module__startupDone", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Object__create", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Object__delete", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Object__get", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Object__first", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Object__next", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Params__init", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Proxy__abstract", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__Proxy__delegate", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__get32", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__get64", "ti_sysbios_smp_LoggerBuf_TimestampProxy_DELEGATE__getFreq"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("LoggerBuf_TimestampProxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("LoggerBuf_TimestampProxy");
    }

    void LoggerBuf_Module_GateProxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy", "ti.sysbios.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Module", "ti.sysbios.smp");
        vo.init2(po, "ti.sysbios.smp.LoggerBuf_Module_GateProxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("Instance", om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance", "ti.sysbios.smp"));
        vo.bind("Params", om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Params", "ti.sysbios.smp"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Params", "ti.sysbios.smp")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Handle", "ti.sysbios.smp"));
        vo.bind("$package", om.findStrict("ti.sysbios.smp", "ti.sysbios.smp"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.smp")).add(vo);
        vo.bind("$$instflag", 1);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 0);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
            vo.bind("__initObject", Global.get("ti$sysbios$smp$LoggerBuf_Module_GateProxy$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.query", "ti.sysbios.smp"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Handle__label", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Module__startupDone", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Object__create", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Object__delete", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Object__get", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Object__first", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Object__next", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Params__init", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Proxy__abstract", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__Proxy__delegate", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__queryMeta", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__query", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__enter", "ti_sysbios_smp_LoggerBuf_Module_GateProxy_DELEGATE__leave"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Object", "ti.sysbios.smp"));
        vo.bind("Instance_State", om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy.Instance_State", "ti.sysbios.smp"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 1);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("LoggerBuf_Module_GateProxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("LoggerBuf_Module_GateProxy");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.smp")).findStrict("PARAMS", "ti.sysbios.smp");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.smp.LoggerBuf", "ti.sysbios.smp")).findStrict("PARAMS", "ti.sysbios.smp");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy", "ti.sysbios.smp")).findStrict("PARAMS", "ti.sysbios.smp");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.smp.LoggerBuf", "ti.sysbios.smp"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.smp.SysMin", "ti.sysbios.smp"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.smp.SysStd", "ti.sysbios.smp"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.smp.LoggerBuf_TimestampProxy", "ti.sysbios.smp"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.smp.LoggerBuf_Module_GateProxy", "ti.sysbios.smp"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.smp.LoggerBuf", "ti.sysbios.smp");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Records", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE_DATA"), "viewInitFxn", "viewInitRecords", "structName", "RecordView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.smp.SysMin", "ti.sysbios.smp");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")}), Global.newArray(new Object[]{"OutputBuffer", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitOutputBuffer", "structName", "BufferEntryView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.smp.LoggerBuf")).bless();
        ((Value.Obj)om.getv("ti.sysbios.smp.SysMin")).bless();
        ((Value.Obj)om.getv("ti.sysbios.smp.SysStd")).bless();
        ((Value.Obj)om.getv("ti.sysbios.smp.LoggerBuf_TimestampProxy")).bless();
        ((Value.Obj)om.getv("ti.sysbios.smp.LoggerBuf_Module_GateProxy")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.smp")).add(pkgV);
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
        LoggerBuf$$OBJECTS();
        SysMin$$OBJECTS();
        SysStd$$OBJECTS();
        LoggerBuf_TimestampProxy$$OBJECTS();
        LoggerBuf_Module_GateProxy$$OBJECTS();
        LoggerBuf$$CONSTS();
        SysMin$$CONSTS();
        SysStd$$CONSTS();
        LoggerBuf_TimestampProxy$$CONSTS();
        LoggerBuf_Module_GateProxy$$CONSTS();
        LoggerBuf$$CREATES();
        SysMin$$CREATES();
        SysStd$$CREATES();
        LoggerBuf_TimestampProxy$$CREATES();
        LoggerBuf_Module_GateProxy$$CREATES();
        LoggerBuf$$FUNCTIONS();
        SysMin$$FUNCTIONS();
        SysStd$$FUNCTIONS();
        LoggerBuf_TimestampProxy$$FUNCTIONS();
        LoggerBuf_Module_GateProxy$$FUNCTIONS();
        LoggerBuf$$SIZES();
        SysMin$$SIZES();
        SysStd$$SIZES();
        LoggerBuf_TimestampProxy$$SIZES();
        LoggerBuf_Module_GateProxy$$SIZES();
        LoggerBuf$$TYPES();
        SysMin$$TYPES();
        SysStd$$TYPES();
        LoggerBuf_TimestampProxy$$TYPES();
        LoggerBuf_Module_GateProxy$$TYPES();
        if (isROV) {
            LoggerBuf$$ROV();
            SysMin$$ROV();
            SysStd$$ROV();
            LoggerBuf_TimestampProxy$$ROV();
            LoggerBuf_Module_GateProxy$$ROV();
        }//isROV
        $$SINGLETONS();
        LoggerBuf$$SINGLETONS();
        SysMin$$SINGLETONS();
        SysStd$$SINGLETONS();
        LoggerBuf_TimestampProxy$$SINGLETONS();
        LoggerBuf_Module_GateProxy$$SINGLETONS();
        $$INITIALIZATION();
    }
}
