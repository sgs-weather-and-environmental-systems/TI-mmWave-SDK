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

public class ti_sysbios_timers_timer64
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.timers.timer64", new Value.Obj("ti.sysbios.timers.timer64", pkgP));
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.timers.timer64.Timer", new Value.Obj("ti.sysbios.timers.timer64.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.timers.timer64.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.timers.timer64"));
        om.bind("ti.sysbios.timers.timer64.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.timers.timer64"));
        om.bind("ti.sysbios.timers.timer64.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.timers.timer64"));
        om.bind("ti.sysbios.timers.timer64.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.timers.timer64"));
        om.bind("ti.sysbios.timers.timer64.Timer.Half", new Proto.Enm("ti.sysbios.timers.timer64.Timer.Half"));
        om.bind("ti.sysbios.timers.timer64.Timer.Mode", new Proto.Enm("ti.sysbios.timers.timer64.Timer.Mode"));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$Control", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.Control", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$EmuMgt", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.EmuMgt", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$GpioIntEn", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.GpioIntEn", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$GpioDatDir", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.GpioDatDir", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$IntCtl", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.IntCtl", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$TimerSetting", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.TimerSetting", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$Device_View", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.Device_View", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$TimerDevice", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.TimerDevice", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.timers.timer64.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.timers.timer64.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.timers.timer64.Timer.Object", om.findStrict("ti.sysbios.timers.timer64.Timer.Instance_State", "ti.sysbios.timers.timer64"));
        }//isROV
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.timers.timer64.TimestampProvider", new Value.Obj("ti.sysbios.timers.timer64.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.TimestampProvider$$Module_View", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.TimestampProvider.Module_View", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.TimestampProvider$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.timers.timer64.TimestampProvider.Module_State", new Proto.Str(spo, false));
    }

    void Timer_TimerSupportProxy$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.timers.timer64.Timer_TimerSupportProxy.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.timers.timer64.Timer_TimerSupportProxy", new Value.Obj("ti.sysbios.timers.timer64.Timer_TimerSupportProxy", po));
        pkgV.bind("Timer_TimerSupportProxy", vo);
        // decls 
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.timers.timer64.Timer.Half_LOWER", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.timers.timer64.Timer.Half", "ti.sysbios.timers.timer64"), "ti.sysbios.timers.timer64.Timer.Half_LOWER", 0));
        om.bind("ti.sysbios.timers.timer64.Timer.Half_UPPER", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.timers.timer64.Timer.Half", "ti.sysbios.timers.timer64"), "ti.sysbios.timers.timer64.Timer.Half_UPPER", 1));
        om.bind("ti.sysbios.timers.timer64.Timer.Half_DEFAULT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.timers.timer64.Timer.Half", "ti.sysbios.timers.timer64"), "ti.sysbios.timers.timer64.Timer.Half_DEFAULT", 2));
        om.bind("ti.sysbios.timers.timer64.Timer.Mode_64BITGPTIMER", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.timers.timer64.Timer.Mode", "ti.sysbios.timers.timer64"), "ti.sysbios.timers.timer64.Timer.Mode_64BITGPTIMER", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.timers.timer64.Timer.Mode_UNCHAINED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.timers.timer64.Timer.Mode", "ti.sysbios.timers.timer64"), "ti.sysbios.timers.timer64.Timer.Mode_UNCHAINED", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.timers.timer64.Timer.Mode_WATCHDOG", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.timers.timer64.Timer.Mode", "ti.sysbios.timers.timer64"), "ti.sysbios.timers.timer64.Timer.Mode_WATCHDOG", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.timers.timer64.Timer.Mode_CHAINED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.timers.timer64.Timer.Mode", "ti.sysbios.timers.timer64"), "ti.sysbios.timers.timer64.Timer.Mode_CHAINED", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.timers.timer64.Timer.MAX_PERIOD", 0xffffffffL);
        om.bind("ti.sysbios.timers.timer64.Timer.getNumTimers", new Extern("ti_sysbios_timers_timer64_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.timers.timer64.Timer.getStatus", new Extern("ti_sysbios_timers_timer64_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.timers.timer64.Timer.startup", new Extern("ti_sysbios_timers_timer64_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.timers.timer64.Timer.deviceConfig", new Extern("ti_sysbios_timers_timer64_Timer_deviceConfig__I", "xdc_Int(*)(ti_sysbios_timers_timer64_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.timers.timer64.Timer.initDevice", new Extern("ti_sysbios_timers_timer64_Timer_initDevice__I", "xdc_Void(*)(ti_sysbios_timers_timer64_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.timers.timer64.Timer.initObj", new Extern("ti_sysbios_timers_timer64_Timer_initObj__I", "xdc_Void(*)(ti_sysbios_timers_timer64_Timer_Object*,xdc_Void(*)(xdc_UArg),ti_sysbios_timers_timer64_Timer_Params*)", true, false));
        om.bind("ti.sysbios.timers.timer64.Timer.postInit", new Extern("ti_sysbios_timers_timer64_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_timers_timer64_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.timers.timer64.Timer.checkOverflow", new Extern("ti_sysbios_timers_timer64_Timer_checkOverflow__I", "xdc_Bool(*)(xdc_UInt32,xdc_UInt32)", true, false));
        om.bind("ti.sysbios.timers.timer64.Timer.spinLoop", new Extern("ti_sysbios_timers_timer64_Timer_spinLoop__I", "xdc_Void(*)(xdc_UInt)", true, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.timers.timer64.TimestampProvider.get32", new Extern("ti_sysbios_timers_timer64_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.timers.timer64.TimestampProvider.get64", new Extern("ti_sysbios_timers_timer64_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.timers.timer64.TimestampProvider.getFreq", new Extern("ti_sysbios_timers_timer64_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
        om.bind("ti.sysbios.timers.timer64.TimestampProvider.startTimer", new Extern("ti_sysbios_timers_timer64_TimestampProvider_startTimer__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.timers.timer64.TimestampProvider.rolloverFunc", new Extern("ti_sysbios_timers_timer64_TimestampProvider_rolloverFunc__E", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void Timer_TimerSupportProxy$$CONSTS()
    {
        // module Timer_TimerSupportProxy
        om.bind("ti.sysbios.timers.timer64.Timer_TimerSupportProxy.enable", new Extern("ti_sysbios_timers_timer64_Timer_TimerSupportProxy_enable__E", "xdc_Void(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void Timer$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$timers$timer64$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.timers.timer64.Timer.create() called before xdc.useModule('ti.sysbios.timers.timer64.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.timers.timer64.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.timers.timer64.Timer.Module", "ti.sysbios.timers.timer64"), om.findStrict("ti.sysbios.timers.timer64.Timer.Instance", "ti.sysbios.timers.timer64"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Params", "ti.sysbios.timers.timer64"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$timers$timer64$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.timers.timer64.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.timers.timer64.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.timers.timer64']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.timers.timer64.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.timers.timer64.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.timers.timer64.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.timers.timer64.Timer.Module", "ti.sysbios.timers.timer64"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer$$Object", "ti.sysbios.timers.timer64"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Params", "ti.sysbios.timers.timer64"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$timers$timer64$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.timers.timer64.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.timers.timer64.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.timers.timer64.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void TimestampProvider$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

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

    void TimestampProvider$$FUNCTIONS()
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

        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.Control", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("tien", "UInt8"));
        sizes.add(Global.newArray("invout", "UInt8"));
        sizes.add(Global.newArray("invin", "UInt8"));
        sizes.add(Global.newArray("pwid", "UInt8"));
        sizes.add(Global.newArray("cp", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.Timer.Control']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.Timer.Control']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.Timer.Control'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.EmuMgt", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("free", "UShort"));
        sizes.add(Global.newArray("soft", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.Timer.EmuMgt']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.Timer.EmuMgt']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.Timer.EmuMgt'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.GpioIntEn", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("gpint12_eni", "UInt8"));
        sizes.add(Global.newArray("gpint12_eno", "UInt8"));
        sizes.add(Global.newArray("gpint12_invi", "UInt8"));
        sizes.add(Global.newArray("gpint12_invo", "UInt8"));
        sizes.add(Global.newArray("gpint34_eni", "UInt8"));
        sizes.add(Global.newArray("gpint34_eno", "UInt8"));
        sizes.add(Global.newArray("gpint34_invi", "UInt8"));
        sizes.add(Global.newArray("gpint34_invo", "UInt8"));
        sizes.add(Global.newArray("gpio_eni12", "UInt8"));
        sizes.add(Global.newArray("gpio_eno12", "UInt8"));
        sizes.add(Global.newArray("gpio_eni34", "UInt8"));
        sizes.add(Global.newArray("gpio_eno34", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.Timer.GpioIntEn']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.Timer.GpioIntEn']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.Timer.GpioIntEn'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.GpioDatDir", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("gpio_dati12", "UInt8"));
        sizes.add(Global.newArray("gpio_dato12", "UInt8"));
        sizes.add(Global.newArray("gpio_dati34", "UInt8"));
        sizes.add(Global.newArray("gpio_dato34", "UInt8"));
        sizes.add(Global.newArray("gpio_diri12", "UInt8"));
        sizes.add(Global.newArray("gpio_diro12", "UInt8"));
        sizes.add(Global.newArray("gpio_diri34", "UInt8"));
        sizes.add(Global.newArray("gpio_diro34", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.Timer.GpioDatDir']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.Timer.GpioDatDir']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.Timer.GpioDatDir'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.IntCtl", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("prdinten_hi", "UShort"));
        sizes.add(Global.newArray("prdinten_lo", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.Timer.IntCtl']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.Timer.IntCtl']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.Timer.IntCtl'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.TimerSetting", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("mode", "Nti.sysbios.timers.timer64.Timer.Mode;;0;1;2;3"));
        sizes.add(Global.newArray("master", "UShort"));
        sizes.add(Global.newArray("ownerCoreId", "UInt16"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.Timer.TimerSetting']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.Timer.TimerSetting']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.Timer.TimerSetting'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.TimerDevice", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("eventId", "UInt"));
        sizes.add(Global.newArray("baseAddr", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.Timer.TimerDevice']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.Timer.TimerDevice']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.Timer.TimerDevice'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.Instance_State", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("staticInst", "UShort"));
        sizes.add(Global.newArray("id", "TInt"));
        sizes.add(Global.newArray("half", "Nti.sysbios.timers.timer64.Timer.Half;;;;"));
        sizes.add(Global.newArray("tcrInit", "UInt"));
        sizes.add(Global.newArray("emumgtInit", "UInt"));
        sizes.add(Global.newArray("gpioIntEn", "UInt"));
        sizes.add(Global.newArray("gpioDatDir", "UInt"));
        sizes.add(Global.newArray("runMode", "Nti.sysbios.interfaces.ITimer.RunMode;;;;"));
        sizes.add(Global.newArray("startMode", "Nti.sysbios.interfaces.ITimer.StartMode;;;"));
        sizes.add(Global.newArray("period", "UInt"));
        sizes.add(Global.newArray("periodType", "Nti.sysbios.interfaces.ITimer.PeriodType;;;"));
        sizes.add(Global.newArray("prescalar", "UInt"));
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("tickFxn", "UFxn"));
        sizes.add(Global.newArray("extFreq", "Sxdc.runtime.Types;FreqHz"));
        sizes.add(Global.newArray("hwi", "UPtr"));
        sizes.add(Global.newArray("intCtl", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.Module_State", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "UInt32"));
        sizes.add(Global.newArray("intFreqs", "UPtr"));
        sizes.add(Global.newArray("gctrl", "UPtr"));
        sizes.add(Global.newArray("device", "UPtr"));
        sizes.add(Global.newArray("handles", "UPtr"));
        sizes.add(Global.newArray("availMaskHigh", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.Timer.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimestampProvider$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.Module_State", "ti.sysbios.timers.timer64");
        sizes.clear();
        sizes.add(Global.newArray("timer", "UPtr"));
        sizes.add(Global.newArray("hi", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.timers.timer64.TimestampProvider.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.timers.timer64.TimestampProvider.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.timers.timer64.TimestampProvider.Module_State'], fld); }");
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

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/timers/timer64/Timer.xs");
        om.bind("ti.sysbios.timers.timer64.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer.Module", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.timers.timer64"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.timers.timer64"), $$UNDEF, "wh");
            po.addFld("A_notAvailable", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.timers.timer64"), Global.newObject("msg", "A_notAvailable: static created timer not available"), "w");
            po.addFld("E_invalidTimer", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.timers.timer64"), Global.newObject("msg", "E_invalidTimer: Invalid Timer Id %d"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.timers.timer64"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.timers.timer64"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period %d"), "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
            po.addFld("anyMaskHigh", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
            po.addFld("defaultHalf", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Half", "ti.sysbios.timers.timer64"), om.find("ti.sysbios.timers.timer64.Timer.Half_LOWER"), "w");
            po.addFld("timerSettings", new Proto.Arr((Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.TimerSetting", "ti.sysbios.timers.timer64"), false), Global.newArray(new Object[]{}), "w");
            po.addFld("intFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.timers.timer64"), $$DEFAULT, "wh");
            po.addFld("intFreqs", new Proto.Arr((Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.timers.timer64"), false), $$DEFAULT, "wh");
            po.addFld("useTimer64pRegMap", $$T_Bool, false, "w");
            po.addFldV("TimerSupportProxy", (Proto)om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.timers.timer64"), null, "wh", $$delegGet, $$delegSet);
            po.addFld("staticAvailMask", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "wh");
            po.addFld("staticAvailMaskHigh", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "wh");
            po.addFld("startupNeeded", $$T_Bool, false, "w");
            po.addFld("freqDivisor", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
            po.addFld("numTimerDevices", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
            po.addFld("numLocalTimers", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("localTimerBaseId", Proto.Elm.newCNum("(xdc_UInt8)"), 0L, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.timers.timer64.Timer$$create", "ti.sysbios.timers.timer64"), Global.get("ti$sysbios$timers$timer64$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.timers.timer64.Timer$$construct", "ti.sysbios.timers.timer64"), Global.get("ti$sysbios$timers$timer64$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.timers.timer64"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.timers.timer64"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer.Instance", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.timers.timer64"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
        if (isCFG) {
            po.addFld("controlInit", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Control", "ti.sysbios.timers.timer64"), Global.newObject("tien", 0L, "invout", 0L, "invin", 0L, "pwid", 1L, "cp", 0L), "w");
            po.addFld("emuMgtInit", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.EmuMgt", "ti.sysbios.timers.timer64"), Global.newObject("free", 0L, "soft", 0L), "w");
            po.addFld("gpioIntEn", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.GpioIntEn", "ti.sysbios.timers.timer64"), Global.newObject("gpint12_eni", 0L, "gpint12_eno", 0L, "gpint12_invi", 0L, "gpint12_invo", 0L, "gpint34_eni", 0L, "gpint34_eno", 0L, "gpint34_invi", 0L, "gpint34_invo", 0L, "gpio_eni12", 0L, "gpio_eno12", 0L, "gpio_eni34", 0L, "gpio_eno34", 0L), "w");
            po.addFld("gpioDatDir", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.GpioDatDir", "ti.sysbios.timers.timer64"), Global.newObject("gpio_dati12", 0L, "gpio_dato12", 0L, "gpio_dati34", 0L, "gpio_dato34", 0L, "gpio_diri12", 0L, "gpio_diro12", 0L, "gpio_diri34", 0L, "gpio_diro34", 0L), "w");
            po.addFld("intCtl", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.IntCtl", "ti.sysbios.timers.timer64"), Global.newObject("prdinten_hi", 1L, "prdinten_lo", 1L), "w");
            po.addFld("half", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Half", "ti.sysbios.timers.timer64"), om.find("ti.sysbios.timers.timer64.Timer.Half_DEFAULT"), "w");
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_hal_Hwi_Params*", "PS"), null, "w");
            po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("prescalar", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.timers.timer64"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Params", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.timers.timer64"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
        if (isCFG) {
            po.addFld("controlInit", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Control", "ti.sysbios.timers.timer64"), Global.newObject("tien", 0L, "invout", 0L, "invin", 0L, "pwid", 1L, "cp", 0L), "w");
            po.addFld("emuMgtInit", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.EmuMgt", "ti.sysbios.timers.timer64"), Global.newObject("free", 0L, "soft", 0L), "w");
            po.addFld("gpioIntEn", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.GpioIntEn", "ti.sysbios.timers.timer64"), Global.newObject("gpint12_eni", 0L, "gpint12_eno", 0L, "gpint12_invi", 0L, "gpint12_invo", 0L, "gpint34_eni", 0L, "gpint34_eno", 0L, "gpint34_invi", 0L, "gpint34_invo", 0L, "gpio_eni12", 0L, "gpio_eno12", 0L, "gpio_eni34", 0L, "gpio_eno34", 0L), "w");
            po.addFld("gpioDatDir", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.GpioDatDir", "ti.sysbios.timers.timer64"), Global.newObject("gpio_dati12", 0L, "gpio_dato12", 0L, "gpio_dati34", 0L, "gpio_dato34", 0L, "gpio_diri12", 0L, "gpio_diro12", 0L, "gpio_diri34", 0L, "gpio_diro34", 0L), "w");
            po.addFld("intCtl", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.IntCtl", "ti.sysbios.timers.timer64"), Global.newObject("prdinten_hi", 1L, "prdinten_lo", 1L), "w");
            po.addFld("half", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Half", "ti.sysbios.timers.timer64"), om.find("ti.sysbios.timers.timer64.Timer.Half_DEFAULT"), "w");
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_hal_Hwi_Params*", "PS"), null, "w");
            po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
            po.addFld("prescalar", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.timers.timer64"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Object", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.Object", om.findStrict("ti.sysbios.timers.timer64.Timer.Instance", "ti.sysbios.timers.timer64"));
        // struct Timer.Control
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Control", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.Control", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("tien", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("invout", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("invin", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("pwid", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("cp", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
        // struct Timer.EmuMgt
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$EmuMgt", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.EmuMgt", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("free", $$T_Bool, $$UNDEF, "w");
                po.addFld("soft", $$T_Bool, $$UNDEF, "w");
        // struct Timer.GpioIntEn
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$GpioIntEn", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.GpioIntEn", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("gpint12_eni", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpint12_eno", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpint12_invi", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpint12_invo", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpint34_eni", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpint34_eno", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpint34_invi", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpint34_invo", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_eni12", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_eno12", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_eni34", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_eno34", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
        // struct Timer.GpioDatDir
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$GpioDatDir", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.GpioDatDir", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("gpio_dati12", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_dato12", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_dati34", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_dato34", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_diri12", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_diro12", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_diri34", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
                po.addFld("gpio_diro34", Proto.Elm.newCNum("(xdc_Bits8)"), $$UNDEF, "w");
        // struct Timer.IntCtl
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$IntCtl", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.IntCtl", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("prdinten_hi", $$T_Bool, $$UNDEF, "w");
                po.addFld("prdinten_lo", $$T_Bool, $$UNDEF, "w");
        // struct Timer.TimerSetting
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$TimerSetting", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.TimerSetting", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("mode", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Mode", "ti.sysbios.timers.timer64"), $$UNDEF, "w");
                po.addFld("master", $$T_Bool, $$UNDEF, "w");
                po.addFld("ownerCoreId", Proto.Elm.newCNum("(xdc_UInt16)"), $$UNDEF, "w");
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$BasicView", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halTimerHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("startMode", $$T_Str, $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", $$T_Str, $$UNDEF, "w");
                po.addFld("half", $$T_Str, $$UNDEF, "w");
                po.addFld("prescalar", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("extFreqLow", $$T_Str, $$UNDEF, "w");
                po.addFld("extFreqHigh", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiHandle", $$T_Str, $$UNDEF, "w");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct Timer.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$ModuleView", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("availMaskHigh", $$T_Str, $$UNDEF, "w");
                po.addFld("availMask", $$T_Str, $$UNDEF, "w");
                po.addFld("intFrequency", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
        // struct Timer.Device_View
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Device_View", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.Device_View", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("inUse", $$T_Bool, $$UNDEF, "w");
                po.addFld("intFreq", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("eventId", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("baseAddress", $$T_Str, $$UNDEF, "w");
        // struct Timer.TimerDevice
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$TimerDevice", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.TimerDevice", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("eventId", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("baseAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Timer.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Instance_State", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("staticInst", $$T_Bool, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("half", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Half", "ti.sysbios.timers.timer64"), $$UNDEF, "w");
                po.addFld("tcrInit", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("emumgtInit", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("gpioIntEn", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("gpioDatDir", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.timers.timer64"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.timers.timer64"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.timers.timer64"), $$UNDEF, "w");
                po.addFld("prescalar", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("extFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.timers.timer64"), $$DEFAULT, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.hal.Hwi.Handle", "ti.sysbios.timers.timer64"), $$UNDEF, "w");
                po.addFld("intCtl", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Module_State", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("intFreqs", new Proto.Arr((Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.timers.timer64"), false), $$DEFAULT, "w");
                po.addFld("gctrl", new Proto.Arr((Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.TimerSetting", "ti.sysbios.timers.timer64"), false), $$DEFAULT, "w");
                po.addFld("device", new Proto.Arr((Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.TimerDevice", "ti.sysbios.timers.timer64"), false), $$DEFAULT, "w");
                po.addFld("handles", new Proto.Arr((Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Handle", "ti.sysbios.timers.timer64"), false), $$DEFAULT, "w");
                po.addFld("availMaskHigh", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/timers/timer64/TimestampProvider.xs");
        om.bind("ti.sysbios.timers.timer64.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.Module", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.timers.timer64"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("timerId", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "w");
            po.addFld("useClockTimer", $$T_Bool, false, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.timers.timer64.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.timers.timer64"), fxn);
        // struct TimestampProvider.Module_View
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.TimestampProvider$$Module_View", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.TimestampProvider.Module_View", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("usesClockTimer", $$T_Bool, $$UNDEF, "w");
        // struct TimestampProvider.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.TimestampProvider$$Module_State", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.TimestampProvider.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("timer", (Proto)om.findStrict("ti.sysbios.timers.timer64.Timer.Handle", "ti.sysbios.timers.timer64"), $$UNDEF, "w");
                po.addFld("hi", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
    }

    void Timer_TimerSupportProxy$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer_TimerSupportProxy.Module", "ti.sysbios.timers.timer64");
        po.init("ti.sysbios.timers.timer64.Timer_TimerSupportProxy.Module", om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.timers.timer64"));
                po.addFld("delegate$", (Proto)om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.timers.timer64"), null, "wh");
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer", "ti.sysbios.timers.timer64");
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Instance_State", "ti.sysbios.timers.timer64");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Control$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.Control", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Control", "ti.sysbios.timers.timer64");
        vo.bind("EmuMgt$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.EmuMgt", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$EmuMgt", "ti.sysbios.timers.timer64");
        vo.bind("GpioIntEn$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.GpioIntEn", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$GpioIntEn", "ti.sysbios.timers.timer64");
        vo.bind("GpioDatDir$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.GpioDatDir", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$GpioDatDir", "ti.sysbios.timers.timer64");
        vo.bind("IntCtl$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.IntCtl", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$IntCtl", "ti.sysbios.timers.timer64");
        vo.bind("TimerSetting$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.TimerSetting", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$TimerSetting", "ti.sysbios.timers.timer64");
        vo.bind("TimerDevice$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.TimerDevice", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$TimerDevice", "ti.sysbios.timers.timer64");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Instance_State", "ti.sysbios.timers.timer64");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer$$Module_State", "ti.sysbios.timers.timer64");
        po.bind("intFreqs$fetchDesc", Global.newObject("type", "xdc.runtime.Types.FreqHz", "isScalar", false));
        po.bind("gctrl$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.TimerSetting", "isScalar", false));
        po.bind("device$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.Timer.TimerDevice", "isScalar", false));
        po.bind("handles$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.timer64.TimestampProvider", "ti.sysbios.timers.timer64");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.timers.timer64.TimestampProvider.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.TimestampProvider$$Module_State", "ti.sysbios.timers.timer64");
    }

    void Timer_TimerSupportProxy$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer_TimerSupportProxy", "ti.sysbios.timers.timer64");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.timers.timer64.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.timers.timer64"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/timers/timer64/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.timers.timer64"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.timers.timer64"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.timers.timer64"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.timers.timer64"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.timers.timer64"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.timers.timer64"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.timers.timer64", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.timers.timer64");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.timers.timer64.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.timers.timer64'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.timers.timer64$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.timers.timer64$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.timers.timer64$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.timer64.ae64P',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.timer64.ae674',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.timer64.ae66',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.timer64.ae66e',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.timer64.ae9',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.timers.timer64.aa15fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.timer64.ae64P', {target: 'ti.targets.elf.C64P', suffix: 'e64P'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.timer64.ae674', {target: 'ti.targets.elf.C674', suffix: 'e674'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.timer64.ae66', {target: 'ti.targets.elf.C66', suffix: 'e66'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.timer64.ae66e', {target: 'ti.targets.elf.C66_big_endian', suffix: 'e66e'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.timer64.ae9', {target: 'ti.targets.arm.elf.Arm9', suffix: 'e9'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.timers.timer64.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Timer$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer", "ti.sysbios.timers.timer64");
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer.Module", "ti.sysbios.timers.timer64");
        vo.init2(po, "ti.sysbios.timers.timer64.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.timers.timer64.Timer$$capsule", "ti.sysbios.timers.timer64"));
        vo.bind("Instance", om.findStrict("ti.sysbios.timers.timer64.Timer.Instance", "ti.sysbios.timers.timer64"));
        vo.bind("Params", om.findStrict("ti.sysbios.timers.timer64.Timer.Params", "ti.sysbios.timers.timer64"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.timers.timer64.Timer.Params", "ti.sysbios.timers.timer64")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.timers.timer64.Timer.Handle", "ti.sysbios.timers.timer64"));
        vo.bind("$package", om.findStrict("ti.sysbios.timers.timer64", "ti.sysbios.timers.timer64"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.timers.timer64"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.timers.timer64"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.timers.timer64"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.timers.timer64"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.timers.timer64"));
        vo.bind("Half", om.findStrict("ti.sysbios.timers.timer64.Timer.Half", "ti.sysbios.timers.timer64"));
        vo.bind("Mode", om.findStrict("ti.sysbios.timers.timer64.Timer.Mode", "ti.sysbios.timers.timer64"));
        vo.bind("Control", om.findStrict("ti.sysbios.timers.timer64.Timer.Control", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.Control", "ti.sysbios.timers.timer64"));
        vo.bind("EmuMgt", om.findStrict("ti.sysbios.timers.timer64.Timer.EmuMgt", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.EmuMgt", "ti.sysbios.timers.timer64"));
        vo.bind("GpioIntEn", om.findStrict("ti.sysbios.timers.timer64.Timer.GpioIntEn", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.GpioIntEn", "ti.sysbios.timers.timer64"));
        vo.bind("GpioDatDir", om.findStrict("ti.sysbios.timers.timer64.Timer.GpioDatDir", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.GpioDatDir", "ti.sysbios.timers.timer64"));
        vo.bind("IntCtl", om.findStrict("ti.sysbios.timers.timer64.Timer.IntCtl", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.IntCtl", "ti.sysbios.timers.timer64"));
        vo.bind("TimerSetting", om.findStrict("ti.sysbios.timers.timer64.Timer.TimerSetting", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.TimerSetting", "ti.sysbios.timers.timer64"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.timers.timer64.Timer.BasicView", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.BasicView", "ti.sysbios.timers.timer64"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.timers.timer64.Timer.ModuleView", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.ModuleView", "ti.sysbios.timers.timer64"));
        vo.bind("Device_View", om.findStrict("ti.sysbios.timers.timer64.Timer.Device_View", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.Device_View", "ti.sysbios.timers.timer64"));
        mcfgs.add("A_notAvailable");
        mcfgs.add("E_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("anyMask");
        mcfgs.add("anyMaskHigh");
        mcfgs.add("defaultHalf");
        mcfgs.add("timerSettings");
        mcfgs.add("useTimer64pRegMap");
        vo.bind("TimerDevice", om.findStrict("ti.sysbios.timers.timer64.Timer.TimerDevice", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.TimerDevice", "ti.sysbios.timers.timer64"));
        vo.bind("TimerSupportProxy$proxy", om.findStrict("ti.sysbios.timers.timer64.Timer_TimerSupportProxy", "ti.sysbios.timers.timer64"));
        proxies.add("TimerSupportProxy");
        icfgs.add("staticAvailMask");
        icfgs.add("staticAvailMaskHigh");
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        mcfgs.add("freqDivisor");
        icfgs.add("freqDivisor");
        mcfgs.add("numTimerDevices");
        icfgs.add("numTimerDevices");
        mcfgs.add("numLocalTimers");
        icfgs.add("numLocalTimers");
        mcfgs.add("localTimerBaseId");
        icfgs.add("localTimerBaseId");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.timers.timer64.Timer.Instance_State", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.Instance_State", "ti.sysbios.timers.timer64"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.timers.timer64.Timer.Module_State", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.Timer.Module_State", "ti.sysbios.timers.timer64"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.timers.timer64"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.timers.timer64"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.timers.timer64"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.timers.timer64"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.timers.timer64"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.timers.timer64"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.timers.timer64"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.timers.timer64"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.timers.timer64"));
        vo.bind("Half_LOWER", om.findStrict("ti.sysbios.timers.timer64.Timer.Half_LOWER", "ti.sysbios.timers.timer64"));
        vo.bind("Half_UPPER", om.findStrict("ti.sysbios.timers.timer64.Timer.Half_UPPER", "ti.sysbios.timers.timer64"));
        vo.bind("Half_DEFAULT", om.findStrict("ti.sysbios.timers.timer64.Timer.Half_DEFAULT", "ti.sysbios.timers.timer64"));
        vo.bind("Mode_64BITGPTIMER", om.findStrict("ti.sysbios.timers.timer64.Timer.Mode_64BITGPTIMER", "ti.sysbios.timers.timer64"));
        vo.bind("Mode_UNCHAINED", om.findStrict("ti.sysbios.timers.timer64.Timer.Mode_UNCHAINED", "ti.sysbios.timers.timer64"));
        vo.bind("Mode_WATCHDOG", om.findStrict("ti.sysbios.timers.timer64.Timer.Mode_WATCHDOG", "ti.sysbios.timers.timer64"));
        vo.bind("Mode_CHAINED", om.findStrict("ti.sysbios.timers.timer64.Timer.Mode_CHAINED", "ti.sysbios.timers.timer64"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.timers.timer64")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.timers.timer64.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$timers$timer64$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.timers.timer64.Timer.getNumTimers", "ti.sysbios.timers.timer64"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.timers.timer64.Timer.getStatus", "ti.sysbios.timers.timer64"));
        vo.bind("startup", om.findStrict("ti.sysbios.timers.timer64.Timer.startup", "ti.sysbios.timers.timer64"));
        vo.bind("deviceConfig", om.findStrict("ti.sysbios.timers.timer64.Timer.deviceConfig", "ti.sysbios.timers.timer64"));
        vo.bind("initDevice", om.findStrict("ti.sysbios.timers.timer64.Timer.initDevice", "ti.sysbios.timers.timer64"));
        vo.bind("initObj", om.findStrict("ti.sysbios.timers.timer64.Timer.initObj", "ti.sysbios.timers.timer64"));
        vo.bind("postInit", om.findStrict("ti.sysbios.timers.timer64.Timer.postInit", "ti.sysbios.timers.timer64"));
        vo.bind("checkOverflow", om.findStrict("ti.sysbios.timers.timer64.Timer.checkOverflow", "ti.sysbios.timers.timer64"));
        vo.bind("spinLoop", om.findStrict("ti.sysbios.timers.timer64.Timer.spinLoop", "ti.sysbios.timers.timer64"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_timers_timer64_Timer_Handle__label__E", "ti_sysbios_timers_timer64_Timer_Module__startupDone__E", "ti_sysbios_timers_timer64_Timer_Object__create__E", "ti_sysbios_timers_timer64_Timer_Object__delete__E", "ti_sysbios_timers_timer64_Timer_Object__get__E", "ti_sysbios_timers_timer64_Timer_Object__first__E", "ti_sysbios_timers_timer64_Timer_Object__next__E", "ti_sysbios_timers_timer64_Timer_Params__init__E", "ti_sysbios_timers_timer64_Timer_getNumTimers__E", "ti_sysbios_timers_timer64_Timer_getStatus__E", "ti_sysbios_timers_timer64_Timer_startup__E", "ti_sysbios_timers_timer64_Timer_getMaxTicks__E", "ti_sysbios_timers_timer64_Timer_setNextTick__E", "ti_sysbios_timers_timer64_Timer_start__E", "ti_sysbios_timers_timer64_Timer_stop__E", "ti_sysbios_timers_timer64_Timer_setPeriod__E", "ti_sysbios_timers_timer64_Timer_setPeriodMicroSecs__E", "ti_sysbios_timers_timer64_Timer_getPeriod__E", "ti_sysbios_timers_timer64_Timer_getCount__E", "ti_sysbios_timers_timer64_Timer_getFreq__E", "ti_sysbios_timers_timer64_Timer_getFunc__E", "ti_sysbios_timers_timer64_Timer_setFunc__E", "ti_sysbios_timers_timer64_Timer_trigger__E", "ti_sysbios_timers_timer64_Timer_getExpiredCounts__E", "ti_sysbios_timers_timer64_Timer_getExpiredTicks__E", "ti_sysbios_timers_timer64_Timer_getCurrentTick__E", "ti_sysbios_timers_timer64_Timer_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_invalidTimer", "E_notAvailable", "E_cannotSupport"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_notAvailable"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.timers.timer64.Timer.Object", "ti.sysbios.timers.timer64"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Timer", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer");
    }

    void TimestampProvider$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.timer64.TimestampProvider", "ti.sysbios.timers.timer64");
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.Module", "ti.sysbios.timers.timer64");
        vo.init2(po, "ti.sysbios.timers.timer64.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.timers.timer64.TimestampProvider$$capsule", "ti.sysbios.timers.timer64"));
        vo.bind("$package", om.findStrict("ti.sysbios.timers.timer64", "ti.sysbios.timers.timer64"));
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
        vo.bind("Module_View", om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.Module_View", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.Module_View", "ti.sysbios.timers.timer64"));
        mcfgs.add("timerId");
        mcfgs.add("useClockTimer");
        vo.bind("Module_State", om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.Module_State", "ti.sysbios.timers.timer64"));
        tdefs.add(om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.Module_State", "ti.sysbios.timers.timer64"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.timers.timer64")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.get32", "ti.sysbios.timers.timer64"));
        vo.bind("get64", om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.get64", "ti.sysbios.timers.timer64"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.getFreq", "ti.sysbios.timers.timer64"));
        vo.bind("startTimer", om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.startTimer", "ti.sysbios.timers.timer64"));
        vo.bind("rolloverFunc", om.findStrict("ti.sysbios.timers.timer64.TimestampProvider.rolloverFunc", "ti.sysbios.timers.timer64"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_timers_timer64_TimestampProvider_Module__startupDone__E", "ti_sysbios_timers_timer64_TimestampProvider_get32__E", "ti_sysbios_timers_timer64_TimestampProvider_get64__E", "ti_sysbios_timers_timer64_TimestampProvider_getFreq__E", "ti_sysbios_timers_timer64_TimestampProvider_startTimer__E", "ti_sysbios_timers_timer64_TimestampProvider_rolloverFunc__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("TimestampProvider", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TimestampProvider");
    }

    void Timer_TimerSupportProxy$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer_TimerSupportProxy", "ti.sysbios.timers.timer64");
        po = (Proto.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer_TimerSupportProxy.Module", "ti.sysbios.timers.timer64");
        vo.init2(po, "ti.sysbios.timers.timer64.Timer_TimerSupportProxy", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.sysbios.timers.timer64", "ti.sysbios.timers.timer64"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.timers.timer64")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.timers.timer64.Timer_TimerSupportProxy.enable", "ti.sysbios.timers.timer64"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Handle__label", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Module__startupDone", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Object__create", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Object__delete", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Object__get", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Object__first", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Object__next", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Params__init", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Proxy__abstract", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__Proxy__delegate", "ti_sysbios_timers_timer64_Timer_TimerSupportProxy_DELEGATE__enable"));
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
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.timers.timer64")).findStrict("PARAMS", "ti.sysbios.timers.timer64");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.timers.timer64.Timer", "ti.sysbios.timers.timer64")).findStrict("PARAMS", "ti.sysbios.timers.timer64");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.timers.timer64.Timer", "ti.sysbios.timers.timer64"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.timers.timer64.TimestampProvider", "ti.sysbios.timers.timer64"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.timers.timer64.Timer_TimerSupportProxy", "ti.sysbios.timers.timer64"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.timers.timer64.Timer", "ti.sysbios.timers.timer64");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.timers.timer64.Timer")).bless();
        ((Value.Obj)om.getv("ti.sysbios.timers.timer64.TimestampProvider")).bless();
        ((Value.Obj)om.getv("ti.sysbios.timers.timer64.Timer_TimerSupportProxy")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.timers.timer64")).add(pkgV);
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
        TimestampProvider$$OBJECTS();
        Timer_TimerSupportProxy$$OBJECTS();
        Timer$$CONSTS();
        TimestampProvider$$CONSTS();
        Timer_TimerSupportProxy$$CONSTS();
        Timer$$CREATES();
        TimestampProvider$$CREATES();
        Timer_TimerSupportProxy$$CREATES();
        Timer$$FUNCTIONS();
        TimestampProvider$$FUNCTIONS();
        Timer_TimerSupportProxy$$FUNCTIONS();
        Timer$$SIZES();
        TimestampProvider$$SIZES();
        Timer_TimerSupportProxy$$SIZES();
        Timer$$TYPES();
        TimestampProvider$$TYPES();
        Timer_TimerSupportProxy$$TYPES();
        if (isROV) {
            Timer$$ROV();
            TimestampProvider$$ROV();
            Timer_TimerSupportProxy$$ROV();
        }//isROV
        $$SINGLETONS();
        Timer$$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        Timer_TimerSupportProxy$$SINGLETONS();
        $$INITIALIZATION();
    }
}
