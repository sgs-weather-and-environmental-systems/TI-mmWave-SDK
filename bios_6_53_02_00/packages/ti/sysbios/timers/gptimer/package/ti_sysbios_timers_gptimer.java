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

public class ti_sysbios_timers_gptimer
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.interfaces");
        Global.callFxn("loadPackage", xdcO, "xdc");
        Global.callFxn("loadPackage", xdcO, "xdc.corevers");
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.hal");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.timers.gptimer", new Value.Obj("ti.sysbios.timers.gptimer", pkgP));
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.timers.gptimer.Timer", new Value.Obj("ti.sysbios.timers.gptimer.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.timers.gptimer.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.timers.gptimer"));
        om.bind("ti.sysbios.timers.gptimer.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.timers.gptimer"));
        om.bind("ti.sysbios.timers.gptimer.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.timers.gptimer"));
        om.bind("ti.sysbios.timers.gptimer.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.timers.gptimer"));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$TiocpCfg", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.TiocpCfg", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$Tier", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.Tier", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$Twer", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.Twer", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$Tclr", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.Tclr", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$Tsicr", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.Tsicr", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$TimerSetting", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.TimerSetting", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$DeviceView", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.DeviceView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$TimerDevice", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.TimerDevice", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.timers.gptimer.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.timers.gptimer.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.timers.gptimer.Timer.Object", om.findStrict("ti.sysbios.timers.gptimer.Timer.Instance_State", "ti.sysbios.timers.gptimer"));
        }//isROV
    }

    void Timer_TimerSupportProxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy", new Value.Obj("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy", po));
        pkgV.bind("Timer_TimerSupportProxy", vo);
        // decls 
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.timers.gptimer.Timer.MAX_PERIOD", 0xffffffffL);
        om.bind("ti.sysbios.timers.gptimer.Timer.getNumTimers", new Extern("ti_sysbios_timers_gptimer_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.getStatus", new Extern("ti_sysbios_timers_gptimer_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.startup", new Extern("ti_sysbios_timers_gptimer_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.stub", new Extern("ti_sysbios_timers_gptimer_Timer_stub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.deviceConfig", new Extern("ti_sysbios_timers_gptimer_Timer_deviceConfig__I", "xdc_Int(*)(ti_sysbios_timers_gptimer_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.initDevice", new Extern("ti_sysbios_timers_gptimer_Timer_initDevice__I", "xdc_Void(*)(ti_sysbios_timers_gptimer_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.initObj", new Extern("ti_sysbios_timers_gptimer_Timer_initObj__I", "xdc_Void(*)(ti_sysbios_timers_gptimer_Timer_Object*,xdc_Void(*)(xdc_UArg),ti_sysbios_timers_gptimer_Timer_Params*)", true, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.postInit", new Extern("ti_sysbios_timers_gptimer_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_timers_gptimer_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.checkOverflow", new Extern("ti_sysbios_timers_gptimer_Timer_checkOverflow__I", "xdc_Bool(*)(xdc_UInt32,xdc_UInt32)", true, false));
        om.bind("ti.sysbios.timers.gptimer.Timer.spinLoop", new Extern("ti_sysbios_timers_gptimer_Timer_spinLoop__I", "xdc_Void(*)(xdc_UInt)", true, false));
    }

    void Timer_TimerSupportProxy$$CONSTS()
    {
        // module Timer_TimerSupportProxy
        om.bind("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy.enable", new Extern("ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_enable__E", "xdc_Void(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void Timer$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$timers$gptimer$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.timers.gptimer.Timer.create() called before xdc.useModule('ti.sysbios.timers.gptimer.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.timers.gptimer.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.timers.gptimer.Timer.Module", "ti.sysbios.timers.gptimer"), om.findStrict("ti.sysbios.timers.gptimer.Timer.Instance", "ti.sysbios.timers.gptimer"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Params", "ti.sysbios.timers.gptimer"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$timers$gptimer$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.timers.gptimer.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.timers.gptimer.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.timers.gptimer']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.timers.gptimer.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.timers.gptimer.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.timers.gptimer.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.timers.gptimer.Timer.Module", "ti.sysbios.timers.gptimer"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Object", "ti.sysbios.timers.gptimer"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Params", "ti.sysbios.timers.gptimer"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$timers$gptimer$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.timers.gptimer.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.timers.gptimer.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.timers.gptimer.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Timer_TimerSupportProxy$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Timer$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer_TimerSupportProxy$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.timers.gptimer.Timer.TiocpCfg", "ti.sysbios.timers.gptimer");
        sizes.clear();
        sizes.add(Global.newArray("autoidle", "UInt8"));
        sizes.add(Global.newArray("softreset", "UInt8"));
        sizes.add(Global.newArray("enawakeup", "UInt8"));
        sizes.add(Global.newArray("idlemode", "UInt16"));
        sizes.add(Global.newArray("emufree", "UInt8"));
        sizes.add(Global.newArray("clockactivity", "UInt16"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.gptimer.Timer.TiocpCfg']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.gptimer.Timer.TiocpCfg']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.gptimer.Timer.TiocpCfg'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.gptimer.Timer.Tier", "ti.sysbios.timers.gptimer");
        sizes.clear();
        sizes.add(Global.newArray("mat_it_ena", "UInt8"));
        sizes.add(Global.newArray("ovf_it_ena", "UInt8"));
        sizes.add(Global.newArray("tcar_it_ena", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.gptimer.Timer.Tier']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.gptimer.Timer.Tier']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.gptimer.Timer.Tier'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.gptimer.Timer.Twer", "ti.sysbios.timers.gptimer");
        sizes.clear();
        sizes.add(Global.newArray("mat_wup_ena", "UInt8"));
        sizes.add(Global.newArray("ovf_wup_ena", "UInt8"));
        sizes.add(Global.newArray("tcar_wup_ena", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.gptimer.Timer.Twer']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.gptimer.Timer.Twer']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.gptimer.Timer.Twer'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.gptimer.Timer.Tclr", "ti.sysbios.timers.gptimer");
        sizes.clear();
        sizes.add(Global.newArray("ptv", "UInt32"));
        sizes.add(Global.newArray("pre", "UInt8"));
        sizes.add(Global.newArray("ce", "UInt8"));
        sizes.add(Global.newArray("scpwm", "UInt8"));
        sizes.add(Global.newArray("tcm", "UInt16"));
        sizes.add(Global.newArray("trg", "UInt16"));
        sizes.add(Global.newArray("pt", "UInt8"));
        sizes.add(Global.newArray("captmode", "UInt8"));
        sizes.add(Global.newArray("gpocfg", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.gptimer.Timer.Tclr']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.gptimer.Timer.Tclr']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.gptimer.Timer.Tclr'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.gptimer.Timer.Tsicr", "ti.sysbios.timers.gptimer");
        sizes.clear();
        sizes.add(Global.newArray("sft", "UInt8"));
        sizes.add(Global.newArray("posted", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.gptimer.Timer.Tsicr']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.gptimer.Timer.Tsicr']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.gptimer.Timer.Tsicr'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.gptimer.Timer.TimerDevice", "ti.sysbios.timers.gptimer");
        sizes.clear();
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("eventId", "UInt"));
        sizes.add(Global.newArray("baseAddr", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.gptimer.Timer.TimerDevice']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.gptimer.Timer.TimerDevice']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.gptimer.Timer.TimerDevice'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.gptimer.Timer.Instance_State", "ti.sysbios.timers.gptimer");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("staticInst", "UShort"));
        sizes.add(Global.newArray("id", "TInt"));
        sizes.add(Global.newArray("tiocpCfg", "UInt"));
        sizes.add(Global.newArray("tmar", "UInt"));
        sizes.add(Global.newArray("tier", "UInt"));
        sizes.add(Global.newArray("twer", "UInt"));
        sizes.add(Global.newArray("tclr", "UInt"));
        sizes.add(Global.newArray("tsicr", "UInt"));
        sizes.add(Global.newArray("runMode", "Nti.sysbios.interfaces.ITimer.RunMode;;;;"));
        sizes.add(Global.newArray("startMode", "Nti.sysbios.interfaces.ITimer.StartMode;;;"));
        sizes.add(Global.newArray("period", "UInt"));
        sizes.add(Global.newArray("periodType", "Nti.sysbios.interfaces.ITimer.PeriodType;;;"));
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("tickFxn", "UFxn"));
        sizes.add(Global.newArray("extFreq", "Sxdc.runtime.Types;FreqHz"));
        sizes.add(Global.newArray("hwi", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.gptimer.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.gptimer.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.gptimer.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.gptimer.Timer.Module_State", "ti.sysbios.timers.gptimer");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "UInt32"));
        sizes.add(Global.newArray("intFreq", "Sxdc.runtime.Types;FreqHz"));
        sizes.add(Global.newArray("device", "UPtr"));
        sizes.add(Global.newArray("handles", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.gptimer.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.gptimer.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.gptimer.Timer.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Timer_TimerSupportProxy$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Timer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/timers/gptimer/Timer.xs");
        om.bind("ti.sysbios.timers.gptimer.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer.Module", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.timers.gptimer"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.timers.gptimer"), $$UNDEF, "wh");
            po.addFld("E_invalidTimer", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.timers.gptimer"), Global.newObject("msg", "E_invalidTimer: Invalid Timer Id %d"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.timers.gptimer"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.timers.gptimer"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period %d"), "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
            po.addFld("timerSettings", new Proto.Arr((Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.TimerSetting", "ti.sysbios.timers.gptimer"), false), Global.newArray(new Object[]{}), "wh");
            po.addFld("intFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.timers.gptimer"), Global.newObject("lo", 0L, "hi", 0L), "wh");
            po.addFldV("TimerSupportProxy", (Proto)om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.timers.gptimer"), null, "wh", $$delegGet, $$delegSet);
            po.addFld("startupNeeded", $$T_Bool, false, "w");
            po.addFld("numTimerDevices", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.timers.gptimer.Timer$$create", "ti.sysbios.timers.gptimer"), Global.get("ti$sysbios$timers$gptimer$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.timers.gptimer.Timer$$construct", "ti.sysbios.timers.gptimer"), Global.get("ti$sysbios$timers$gptimer$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.timers.gptimer.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.timers.gptimer.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.timers.gptimer.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.timers.gptimer.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.timers.gptimer.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.timers.gptimer.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.timers.gptimer"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.timers.gptimer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer.Instance", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.timers.gptimer"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
        if (isCFG) {
            po.addFld("tiocpCfg", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.TiocpCfg", "ti.sysbios.timers.gptimer"), Global.newObject("autoidle", 0L, "softreset", 1L, "enawakeup", 0L, "idlemode", 0L, "emufree", 0L, "clockactivity", 0L), "w");
            po.addFld("tier", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Tier", "ti.sysbios.timers.gptimer"), Global.newObject("mat_it_ena", 0L, "ovf_it_ena", 1L, "tcar_it_ena", 0L), "w");
            po.addFld("twer", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Twer", "ti.sysbios.timers.gptimer"), Global.newObject("mat_wup_ena", 0L, "ovf_wup_ena", 0L, "tcar_wup_ena", 0L), "w");
            po.addFld("tclr", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Tclr", "ti.sysbios.timers.gptimer"), Global.newObject("ptv", 0L, "pre", 0L, "ce", 0L, "scpwm", 0L, "tcm", 0L, "trg", 0L, "pt", 0L, "captmode", 0L, "gpocfg", 0L), "w");
            po.addFld("tsicr", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Tsicr", "ti.sysbios.timers.gptimer"), Global.newObject("sft", 0L, "posted", 1L), "w");
            po.addFld("tmar", Proto.Elm.newCNum("(xdc_UInt32)"), 0L, "w");
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_hal_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.timers.gptimer"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Params", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.timers.gptimer"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
        if (isCFG) {
            po.addFld("tiocpCfg", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.TiocpCfg", "ti.sysbios.timers.gptimer"), Global.newObject("autoidle", 0L, "softreset", 1L, "enawakeup", 0L, "idlemode", 0L, "emufree", 0L, "clockactivity", 0L), "w");
            po.addFld("tier", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Tier", "ti.sysbios.timers.gptimer"), Global.newObject("mat_it_ena", 0L, "ovf_it_ena", 1L, "tcar_it_ena", 0L), "w");
            po.addFld("twer", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Twer", "ti.sysbios.timers.gptimer"), Global.newObject("mat_wup_ena", 0L, "ovf_wup_ena", 0L, "tcar_wup_ena", 0L), "w");
            po.addFld("tclr", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Tclr", "ti.sysbios.timers.gptimer"), Global.newObject("ptv", 0L, "pre", 0L, "ce", 0L, "scpwm", 0L, "tcm", 0L, "trg", 0L, "pt", 0L, "captmode", 0L, "gpocfg", 0L), "w");
            po.addFld("tsicr", (Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Tsicr", "ti.sysbios.timers.gptimer"), Global.newObject("sft", 0L, "posted", 1L), "w");
            po.addFld("tmar", Proto.Elm.newCNum("(xdc_UInt32)"), 0L, "w");
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_hal_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.timers.gptimer"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Object", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Object", om.findStrict("ti.sysbios.timers.gptimer.Timer.Instance", "ti.sysbios.timers.gptimer"));
        // struct Timer.TiocpCfg
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$TiocpCfg", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.TiocpCfg", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("autoidle", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("softreset", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("enawakeup", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("idlemode", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("emufree", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("clockactivity", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
        // struct Timer.Tier
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Tier", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Tier", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("mat_it_ena", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("ovf_it_ena", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("tcar_it_ena", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
        // struct Timer.Twer
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Twer", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Twer", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("mat_wup_ena", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("ovf_wup_ena", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("tcar_wup_ena", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
        // struct Timer.Tclr
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Tclr", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Tclr", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ptv", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("pre", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("ce", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("scpwm", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("tcm", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("trg", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("pt", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("captmode", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpocfg", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
        // struct Timer.Tsicr
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Tsicr", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Tsicr", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("sft", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("posted", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
        // struct Timer.TimerSetting
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$TimerSetting", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.TimerSetting", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("master", $$T_Bool, $$UNDEF, "w");
                po.addFld("baseAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$BasicView", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halTimerHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("startMode", $$T_Str, $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("extFreqLow", $$T_Str, $$UNDEF, "w");
                po.addFld("extFreqHigh", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiHandle", $$T_Str, $$UNDEF, "w");
        // struct Timer.DeviceView
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$DeviceView", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.DeviceView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("deviceAddr", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("timerState", $$T_Str, $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("currCount", $$T_Str, $$UNDEF, "w");
                po.addFld("remainingCount", $$T_Str, $$UNDEF, "w");
        // struct Timer.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$ModuleView", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("availMask", $$T_Str, $$UNDEF, "w");
                po.addFld("intFrequency", $$T_Str, $$UNDEF, "w");
        // struct Timer.TimerDevice
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$TimerDevice", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.TimerDevice", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("eventId", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("baseAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Timer.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Instance_State", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("staticInst", $$T_Bool, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("tiocpCfg", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tmar", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tier", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("twer", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tclr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tsicr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.timers.gptimer"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.timers.gptimer"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.timers.gptimer"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("extFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.timers.gptimer"), $$DEFAULT, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.hal.Hwi.Handle", "ti.sysbios.timers.gptimer"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Module_State", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("intFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.timers.gptimer"), $$DEFAULT, "w");
                po.addFld("device", new Proto.Arr((Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.TimerDevice", "ti.sysbios.timers.gptimer"), false), $$DEFAULT, "w");
                po.addFld("handles", new Proto.Arr((Proto)om.findStrict("ti.sysbios.timers.gptimer.Timer.Handle", "ti.sysbios.timers.gptimer"), false), $$DEFAULT, "w");
    }

    void Timer_TimerSupportProxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy.Module", "ti.sysbios.timers.gptimer");
        po.init("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy.Module", om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.timers.gptimer"));
                po.addFld("delegate$", (Proto)om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.timers.gptimer"), null, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer", "ti.sysbios.timers.gptimer");
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Instance_State", "ti.sysbios.timers.gptimer");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("TiocpCfg$fetchDesc", Global.newObject("type", "ti.sysbios.timers.gptimer.Timer.TiocpCfg", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$TiocpCfg", "ti.sysbios.timers.gptimer");
        vo.bind("Tier$fetchDesc", Global.newObject("type", "ti.sysbios.timers.gptimer.Timer.Tier", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Tier", "ti.sysbios.timers.gptimer");
        vo.bind("Twer$fetchDesc", Global.newObject("type", "ti.sysbios.timers.gptimer.Timer.Twer", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Twer", "ti.sysbios.timers.gptimer");
        vo.bind("Tclr$fetchDesc", Global.newObject("type", "ti.sysbios.timers.gptimer.Timer.Tclr", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Tclr", "ti.sysbios.timers.gptimer");
        vo.bind("Tsicr$fetchDesc", Global.newObject("type", "ti.sysbios.timers.gptimer.Timer.Tsicr", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Tsicr", "ti.sysbios.timers.gptimer");
        vo.bind("TimerDevice$fetchDesc", Global.newObject("type", "ti.sysbios.timers.gptimer.Timer.TimerDevice", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$TimerDevice", "ti.sysbios.timers.gptimer");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.timers.gptimer.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Instance_State", "ti.sysbios.timers.gptimer");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.timers.gptimer.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer$$Module_State", "ti.sysbios.timers.gptimer");
        po.bind("device$fetchDesc", Global.newObject("type", "ti.sysbios.timers.gptimer.Timer.TimerDevice", "isScalar", false));
        po.bind("handles$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
    }

    void Timer_TimerSupportProxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy", "ti.sysbios.timers.gptimer");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.timers.gptimer.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.timers.gptimer"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/timers/gptimer/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.timers.gptimer"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.timers.gptimer"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.timers.gptimer"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.timers.gptimer"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.timers.gptimer"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.timers.gptimer"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.timers.gptimer", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.timers.gptimer");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.timers.gptimer.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.timers.gptimer'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.timers.gptimer$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.timers.gptimer$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.timers.gptimer$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.gptimer.ae64P',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.gptimer.aea8fnv',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.gptimer.aa8fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.gptimer.aa9fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.gptimer.ae64P', {target: 'ti.targets.elf.C64P', suffix: 'e64P'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.gptimer.aea8fnv', {target: 'ti.targets.arm.elf.A8Fnv', suffix: 'ea8fnv'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.gptimer.aa8fg', {target: 'gnu.targets.arm.A8F', suffix: 'a8fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.gptimer.aa9fg', {target: 'gnu.targets.arm.A9F', suffix: 'a9fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Timer$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer", "ti.sysbios.timers.gptimer");
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer.Module", "ti.sysbios.timers.gptimer");
        vo.init2(po, "ti.sysbios.timers.gptimer.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.timers.gptimer.Timer$$capsule", "ti.sysbios.timers.gptimer"));
        vo.bind("Instance", om.findStrict("ti.sysbios.timers.gptimer.Timer.Instance", "ti.sysbios.timers.gptimer"));
        vo.bind("Params", om.findStrict("ti.sysbios.timers.gptimer.Timer.Params", "ti.sysbios.timers.gptimer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.timers.gptimer.Timer.Params", "ti.sysbios.timers.gptimer")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.timers.gptimer.Timer.Handle", "ti.sysbios.timers.gptimer"));
        vo.bind("$package", om.findStrict("ti.sysbios.timers.gptimer", "ti.sysbios.timers.gptimer"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.timers.gptimer"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.timers.gptimer"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.timers.gptimer"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.timers.gptimer"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.timers.gptimer"));
        vo.bind("TiocpCfg", om.findStrict("ti.sysbios.timers.gptimer.Timer.TiocpCfg", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.TiocpCfg", "ti.sysbios.timers.gptimer"));
        vo.bind("Tier", om.findStrict("ti.sysbios.timers.gptimer.Timer.Tier", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.Tier", "ti.sysbios.timers.gptimer"));
        vo.bind("Twer", om.findStrict("ti.sysbios.timers.gptimer.Timer.Twer", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.Twer", "ti.sysbios.timers.gptimer"));
        vo.bind("Tclr", om.findStrict("ti.sysbios.timers.gptimer.Timer.Tclr", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.Tclr", "ti.sysbios.timers.gptimer"));
        vo.bind("Tsicr", om.findStrict("ti.sysbios.timers.gptimer.Timer.Tsicr", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.Tsicr", "ti.sysbios.timers.gptimer"));
        vo.bind("TimerSetting", om.findStrict("ti.sysbios.timers.gptimer.Timer.TimerSetting", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.TimerSetting", "ti.sysbios.timers.gptimer"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.timers.gptimer.Timer.BasicView", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.BasicView", "ti.sysbios.timers.gptimer"));
        vo.bind("DeviceView", om.findStrict("ti.sysbios.timers.gptimer.Timer.DeviceView", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.DeviceView", "ti.sysbios.timers.gptimer"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.timers.gptimer.Timer.ModuleView", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.ModuleView", "ti.sysbios.timers.gptimer"));
        mcfgs.add("E_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("anyMask");
        vo.bind("TimerDevice", om.findStrict("ti.sysbios.timers.gptimer.Timer.TimerDevice", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.TimerDevice", "ti.sysbios.timers.gptimer"));
        vo.bind("TimerSupportProxy$proxy", om.findStrict("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy", "ti.sysbios.timers.gptimer"));
        proxies.add("TimerSupportProxy");
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        mcfgs.add("numTimerDevices");
        icfgs.add("numTimerDevices");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.timers.gptimer.Timer.Instance_State", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.Instance_State", "ti.sysbios.timers.gptimer"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.timers.gptimer.Timer.Module_State", "ti.sysbios.timers.gptimer"));
        tdefs.add(om.findStrict("ti.sysbios.timers.gptimer.Timer.Module_State", "ti.sysbios.timers.gptimer"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.timers.gptimer"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.timers.gptimer"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.timers.gptimer"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.timers.gptimer"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.timers.gptimer"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.timers.gptimer"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.timers.gptimer"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.timers.gptimer"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.timers.gptimer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.timers.gptimer")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.timers.gptimer.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$timers$gptimer$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.timers.gptimer.Timer.getNumTimers", "ti.sysbios.timers.gptimer"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.timers.gptimer.Timer.getStatus", "ti.sysbios.timers.gptimer"));
        vo.bind("startup", om.findStrict("ti.sysbios.timers.gptimer.Timer.startup", "ti.sysbios.timers.gptimer"));
        vo.bind("stub", om.findStrict("ti.sysbios.timers.gptimer.Timer.stub", "ti.sysbios.timers.gptimer"));
        vo.bind("deviceConfig", om.findStrict("ti.sysbios.timers.gptimer.Timer.deviceConfig", "ti.sysbios.timers.gptimer"));
        vo.bind("initDevice", om.findStrict("ti.sysbios.timers.gptimer.Timer.initDevice", "ti.sysbios.timers.gptimer"));
        vo.bind("initObj", om.findStrict("ti.sysbios.timers.gptimer.Timer.initObj", "ti.sysbios.timers.gptimer"));
        vo.bind("postInit", om.findStrict("ti.sysbios.timers.gptimer.Timer.postInit", "ti.sysbios.timers.gptimer"));
        vo.bind("checkOverflow", om.findStrict("ti.sysbios.timers.gptimer.Timer.checkOverflow", "ti.sysbios.timers.gptimer"));
        vo.bind("spinLoop", om.findStrict("ti.sysbios.timers.gptimer.Timer.spinLoop", "ti.sysbios.timers.gptimer"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_timers_gptimer_Timer_Handle__label__E", "ti_sysbios_timers_gptimer_Timer_Module__startupDone__E", "ti_sysbios_timers_gptimer_Timer_Object__create__E", "ti_sysbios_timers_gptimer_Timer_Object__delete__E", "ti_sysbios_timers_gptimer_Timer_Object__get__E", "ti_sysbios_timers_gptimer_Timer_Object__first__E", "ti_sysbios_timers_gptimer_Timer_Object__next__E", "ti_sysbios_timers_gptimer_Timer_Params__init__E", "ti_sysbios_timers_gptimer_Timer_getNumTimers__E", "ti_sysbios_timers_gptimer_Timer_getStatus__E", "ti_sysbios_timers_gptimer_Timer_startup__E", "ti_sysbios_timers_gptimer_Timer_getMaxTicks__E", "ti_sysbios_timers_gptimer_Timer_setNextTick__E", "ti_sysbios_timers_gptimer_Timer_start__E", "ti_sysbios_timers_gptimer_Timer_stop__E", "ti_sysbios_timers_gptimer_Timer_setPeriod__E", "ti_sysbios_timers_gptimer_Timer_setPeriodMicroSecs__E", "ti_sysbios_timers_gptimer_Timer_getPeriod__E", "ti_sysbios_timers_gptimer_Timer_getCount__E", "ti_sysbios_timers_gptimer_Timer_getFreq__E", "ti_sysbios_timers_gptimer_Timer_getFunc__E", "ti_sysbios_timers_gptimer_Timer_setFunc__E", "ti_sysbios_timers_gptimer_Timer_trigger__E", "ti_sysbios_timers_gptimer_Timer_getExpiredCounts__E", "ti_sysbios_timers_gptimer_Timer_getExpiredTicks__E", "ti_sysbios_timers_gptimer_Timer_getCurrentTick__E", "ti_sysbios_timers_gptimer_Timer_stub__E", "ti_sysbios_timers_gptimer_Timer_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_invalidTimer", "E_notAvailable", "E_cannotSupport"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.timers.gptimer.Timer.Object", "ti.sysbios.timers.gptimer"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Timer", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer");
    }

    void Timer_TimerSupportProxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy", "ti.sysbios.timers.gptimer");
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy.Module", "ti.sysbios.timers.gptimer");
        vo.init2(po, "ti.sysbios.timers.gptimer.Timer_TimerSupportProxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.sysbios.timers.gptimer", "ti.sysbios.timers.gptimer"));
        tdefs.clear();
        proxies.clear();
        proxies.add("delegate$");
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.timers.gptimer")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy.enable", "ti.sysbios.timers.gptimer"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Handle__label", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Module__startupDone", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Object__create", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Object__delete", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Object__get", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Object__first", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Object__next", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Params__init", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Proxy__abstract", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__Proxy__delegate", "ti_sysbios_timers_gptimer_Timer_TimerSupportProxy_DELEGATE__enable"));
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
        pkgV.bind("Timer_TimerSupportProxy", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer_TimerSupportProxy");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.timers.gptimer")).findStrict("PARAMS", "ti.sysbios.timers.gptimer");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.timers.gptimer.Timer", "ti.sysbios.timers.gptimer")).findStrict("PARAMS", "ti.sysbios.timers.gptimer");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.timers.gptimer.Timer", "ti.sysbios.timers.gptimer"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy", "ti.sysbios.timers.gptimer"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.timers.gptimer.Timer", "ti.sysbios.timers.gptimer");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Device", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitDevice", "structName", "DeviceView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.timers.gptimer.Timer")).bless();
        ((Value.Obj)om.getv("ti.sysbios.timers.gptimer.Timer_TimerSupportProxy")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.timers.gptimer")).add(pkgV);
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
        Timer$$OBJECTS();
        Timer_TimerSupportProxy$$OBJECTS();
        Timer$$CONSTS();
        Timer_TimerSupportProxy$$CONSTS();
        Timer$$CREATES();
        Timer_TimerSupportProxy$$CREATES();
        Timer$$FUNCTIONS();
        Timer_TimerSupportProxy$$FUNCTIONS();
        Timer$$SIZES();
        Timer_TimerSupportProxy$$SIZES();
        Timer$$TYPES();
        Timer_TimerSupportProxy$$TYPES();
        if (isROV) {
            Timer$$ROV();
            Timer_TimerSupportProxy$$ROV();
        }//isROV
        $$SINGLETONS();
        Timer$$SINGLETONS();
        Timer_TimerSupportProxy$$SINGLETONS();
        $$INITIALIZATION();
    }
}
