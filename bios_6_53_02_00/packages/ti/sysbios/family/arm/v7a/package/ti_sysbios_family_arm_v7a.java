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

public class ti_sysbios_family_arm_v7a
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.v7a", new Value.Obj("ti.sysbios.family.arm.v7a", pkgP));
    }

    void Pmu$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Pmu.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v7a.Pmu", new Value.Obj("ti.sysbios.family.arm.v7a.Pmu", po));
        pkgV.bind("Pmu", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Pmu$$PmuInfoView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.Pmu.PmuInfoView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Pmu$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.Pmu.Module_State", new Proto.Str(spo, false));
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v7a.Timer", new Value.Obj("ti.sysbios.family.arm.v7a.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.v7a.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.v7a"));
        om.bind("ti.sysbios.family.arm.v7a.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.v7a"));
        om.bind("ti.sysbios.family.arm.v7a.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.v7a"));
        om.bind("ti.sysbios.family.arm.v7a.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.v7a"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.v7a.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v7a.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v7a.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.v7a.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.v7a.Timer.Object", om.findStrict("ti.sysbios.family.arm.v7a.Timer.Instance_State", "ti.sysbios.family.arm.v7a"));
        }//isROV
    }

    void Pmu$$CONSTS()
    {
        // module Pmu
        om.bind("ti.sysbios.family.arm.v7a.Pmu.setInterruptFunc", new Extern("ti_sysbios_family_arm_v7a_Pmu_setInterruptFunc__E", "xdc_Void(*)(xdc_Void(*)(xdc_UArg))", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.startCounter", new Extern("ti_sysbios_family_arm_v7a_Pmu_startCounter__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.stopCounter", new Extern("ti_sysbios_family_arm_v7a_Pmu_stopCounter__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.resetCount", new Extern("ti_sysbios_family_arm_v7a_Pmu_resetCount__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.setCount", new Extern("ti_sysbios_family_arm_v7a_Pmu_setCount__E", "xdc_Void(*)(xdc_UInt,xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.configureCounter", new Extern("ti_sysbios_family_arm_v7a_Pmu_configureCounter__E", "xdc_Void(*)(xdc_UInt,xdc_UInt,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.enableInterrupt", new Extern("ti_sysbios_family_arm_v7a_Pmu_enableInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.disableInterrupt", new Extern("ti_sysbios_family_arm_v7a_Pmu_disableInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.clearOverflowStatus", new Extern("ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatus__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.getCount", new Extern("ti_sysbios_family_arm_v7a_Pmu_getCount__E", "xdc_UInt32(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.getNumCounters", new Extern("ti_sysbios_family_arm_v7a_Pmu_getNumCounters__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.getOverflowStatus", new Extern("ti_sysbios_family_arm_v7a_Pmu_getOverflowStatus__E", "xdc_Bool(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.getEnabled", new Extern("ti_sysbios_family_arm_v7a_Pmu_getEnabled__E", "xdc_UInt32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.startCounterI", new Extern("ti_sysbios_family_arm_v7a_Pmu_startCounterI__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.stopCounterI", new Extern("ti_sysbios_family_arm_v7a_Pmu_stopCounterI__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.resetCountI", new Extern("ti_sysbios_family_arm_v7a_Pmu_resetCountI__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.setCountI", new Extern("ti_sysbios_family_arm_v7a_Pmu_setCountI__E", "xdc_Void(*)(xdc_UInt,xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.enableInterruptI", new Extern("ti_sysbios_family_arm_v7a_Pmu_enableInterruptI__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.disableInterruptI", new Extern("ti_sysbios_family_arm_v7a_Pmu_disableInterruptI__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.clearOverflowStatusI", new Extern("ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusI__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.getCountI", new Extern("ti_sysbios_family_arm_v7a_Pmu_getCountI__E", "xdc_UInt32(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.getOverflowStatusI", new Extern("ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusI__E", "xdc_UInt32(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.configureCounterI", new Extern("ti_sysbios_family_arm_v7a_Pmu_configureCounterI__I", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.clearOverflowStatusReg", new Extern("ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusReg__I", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.getOverflowStatusReg", new Extern("ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusReg__I", "xdc_UInt32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.initCounters", new Extern("ti_sysbios_family_arm_v7a_Pmu_initCounters__I", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Pmu.interruptHandler", new Extern("ti_sysbios_family_arm_v7a_Pmu_interruptHandler__I", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.family.arm.v7a.Timer.MAX_PERIOD", 0xFFFFFFFFL);
        om.bind("ti.sysbios.family.arm.v7a.Timer.NUM_TIMER_DEVICES", 1L);
        om.bind("ti.sysbios.family.arm.v7a.Timer.getNumTimers", new Extern("ti_sysbios_family_arm_v7a_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Timer.getStatus", new Extern("ti_sysbios_family_arm_v7a_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Timer.startup", new Extern("ti_sysbios_family_arm_v7a_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Timer.oneShotStub", new Extern("ti_sysbios_family_arm_v7a_Timer_oneShotStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Timer.periodicStub", new Extern("ti_sysbios_family_arm_v7a_Timer_periodicStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Timer.getHandle", new Extern("ti_sysbios_family_arm_v7a_Timer_getHandle__E", "ti_sysbios_family_arm_v7a_Timer_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Timer.initDevice", new Extern("ti_sysbios_family_arm_v7a_Timer_initDevice__I", "xdc_Void(*)(ti_sysbios_family_arm_v7a_Timer_Object*)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Timer.postInit", new Extern("ti_sysbios_family_arm_v7a_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_v7a_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arm.v7a.Timer.checkOverflow", new Extern("ti_sysbios_family_arm_v7a_Timer_checkOverflow__I", "xdc_Bool(*)(xdc_UInt32,xdc_UInt32)", true, false));
    }

    void Pmu$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Timer$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v7a$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.v7a.Timer.create() called before xdc.useModule('ti.sysbios.family.arm.v7a.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v7a.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v7a.Timer.Module", "ti.sysbios.family.arm.v7a"), om.findStrict("ti.sysbios.family.arm.v7a.Timer.Instance", "ti.sysbios.family.arm.v7a"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.v7a.Timer.Params", "ti.sysbios.family.arm.v7a"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v7a$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.v7a.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.v7a.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.v7a']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.v7a.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.v7a.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v7a.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v7a.Timer.Module", "ti.sysbios.family.arm.v7a"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$Object", "ti.sysbios.family.arm.v7a"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.v7a.Timer.Params", "ti.sysbios.family.arm.v7a"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v7a$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.v7a.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.v7a.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.v7a.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Pmu$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Pmu$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v7a.Pmu.Module_State", "ti.sysbios.family.arm.v7a");
        sizes.clear();
        sizes.add(Global.newArray("numCounters", "UInt"));
        sizes.add(Global.newArray("hwiHandle", "UPtr"));
        sizes.add(Global.newArray("interruptFunc", "UFxn"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v7a.Pmu.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v7a.Pmu.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v7a.Pmu.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Timer$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v7a.Timer.Instance_State", "ti.sysbios.family.arm.v7a");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("staticInst", "UShort"));
        sizes.add(Global.newArray("runMode", "Nti.sysbios.interfaces.ITimer.RunMode;;;;"));
        sizes.add(Global.newArray("startMode", "Nti.sysbios.interfaces.ITimer.StartMode;;;"));
        sizes.add(Global.newArray("period", "UInt32"));
        sizes.add(Global.newArray("extFreq", "Sxdc.runtime.Types;FreqHz"));
        sizes.add(Global.newArray("periodType", "Nti.sysbios.interfaces.ITimer.PeriodType;;;"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("tickFxn", "UFxn"));
        sizes.add(Global.newArray("hwi", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v7a.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v7a.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v7a.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v7a.Timer.Module_State", "ti.sysbios.family.arm.v7a");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "UInt"));
        sizes.add(Global.newArray("handle", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v7a.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v7a.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v7a.Timer.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Pmu$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7a/Pmu.xs");
        om.bind("ti.sysbios.family.arm.v7a.Pmu$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Pmu.Module", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Pmu.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.v7a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), (Global.eval("~0")), "w");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.v7a"), $$UNDEF, "wh");
            po.addFld("A_badIntNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.v7a"), Global.newObject("msg", "A_badIntNum: Set PMU interrupt number using Pmu.intNum config param."), "w");
            po.addFld("A_invalidCounterId", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.v7a"), Global.newObject("msg", "A_invalidCounterId: Invalid PMU counter Id passed."), "w");
            po.addFld("interruptFunc", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), null, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Pmu$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Pmu$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Pmu$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Pmu$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // typedef Pmu.IntHandlerFuncPtr
        om.bind("ti.sysbios.family.arm.v7a.Pmu.IntHandlerFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"));
        // struct Pmu.PmuInfoView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Pmu$$PmuInfoView", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Pmu.PmuInfoView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("numEventCounters", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Pmu.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Pmu$$Module_State", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Pmu.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("numCounters", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("hwiHandle", (Proto)om.findStrict("ti.sysbios.hal.Hwi.Handle", "ti.sysbios.family.arm.v7a"), $$UNDEF, "w");
                po.addFld("interruptFunc", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
    }

    void Timer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7a/Timer.xs");
        om.bind("ti.sysbios.family.arm.v7a.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer.Module", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.family.arm.v7a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt32)"), 0xFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.v7a"), $$UNDEF, "wh");
            po.addFld("E_invalidTimer", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v7a"), Global.newObject("msg", "E_invalidTimer: Invalid Timer Id %d"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v7a"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v7a"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period %d"), "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x1L, "w");
            po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x1L, "w");
            po.addFld("startupNeeded", $$T_Bool, false, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$create", "ti.sysbios.family.arm.v7a"), Global.get("ti$sysbios$family$arm$v7a$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$construct", "ti.sysbios.family.arm.v7a"), Global.get("ti$sysbios$family$arm$v7a$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v7a.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.family.arm.v7a"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.family.arm.v7a"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer.Instance", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.family.arm.v7a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt32)"), 0xFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_hal_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.v7a"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$Params", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.family.arm.v7a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt32)"), 0xFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_hal_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.v7a"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$Object", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Timer.Object", om.findStrict("ti.sysbios.family.arm.v7a.Timer.Instance", "ti.sysbios.family.arm.v7a"));
        // typedef Timer.TimerFuncPtr
        om.bind("ti.sysbios.family.arm.v7a.Timer.TimerFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"));
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$BasicView", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Timer.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halTimerHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("startMode", $$T_Str, $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", $$T_Str, $$UNDEF, "w");
                po.addFld("periodType", $$T_Str, $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("timerFreq", $$T_Str, $$UNDEF, "w");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct Timer.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$Instance_State", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("staticInst", $$T_Bool, $$UNDEF, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.v7a"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.v7a"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("extFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.arm.v7a"), $$DEFAULT, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.v7a"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.hal.Hwi.Handle", "ti.sysbios.family.arm.v7a"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$Module_State", "ti.sysbios.family.arm.v7a");
        po.init("ti.sysbios.family.arm.v7a.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("handle", (Proto)om.findStrict("ti.sysbios.family.arm.v7a.Timer.Handle", "ti.sysbios.family.arm.v7a"), $$UNDEF, "w");
    }

    void Pmu$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Pmu", "ti.sysbios.family.arm.v7a");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v7a.Pmu.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Pmu$$Module_State", "ti.sysbios.family.arm.v7a");
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer", "ti.sysbios.family.arm.v7a");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$Instance_State", "ti.sysbios.family.arm.v7a");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v7a.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$Instance_State", "ti.sysbios.family.arm.v7a");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v7a.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer$$Module_State", "ti.sysbios.family.arm.v7a");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.v7a.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.v7a"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v7a/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.v7a"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.v7a"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.v7a"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.v7a"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.v7a"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.v7a"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.v7a", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.v7a");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.v7a.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.v7a'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.v7a$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.v7a$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.v7a$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7a.aea8fnv',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7a.aer5f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7a.aer4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7a.aa8fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7a.aa9fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v7a.aa15fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7a.aea8fnv', {target: 'ti.targets.arm.elf.A8Fnv', suffix: 'ea8fnv'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7a.aer5f', {target: 'ti.targets.arm.elf.R5F', suffix: 'er5f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7a.aer4f', {target: 'ti.targets.arm.elf.R4F', suffix: 'er4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7a.aa8fg', {target: 'gnu.targets.arm.A8F', suffix: 'a8fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7a.aa9fg', {target: 'gnu.targets.arm.A9F', suffix: 'a9fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v7a.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Pmu$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Pmu", "ti.sysbios.family.arm.v7a");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Pmu.Module", "ti.sysbios.family.arm.v7a");
        vo.init2(po, "ti.sysbios.family.arm.v7a.Pmu", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v7a.Pmu$$capsule", "ti.sysbios.family.arm.v7a"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v7a", "ti.sysbios.family.arm.v7a"));
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
        mcfgs.add("intNum");
        vo.bind("IntHandlerFuncPtr", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.IntHandlerFuncPtr", "ti.sysbios.family.arm.v7a"));
        vo.bind("PmuInfoView", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.PmuInfoView", "ti.sysbios.family.arm.v7a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7a.Pmu.PmuInfoView", "ti.sysbios.family.arm.v7a"));
        mcfgs.add("A_badIntNum");
        mcfgs.add("A_invalidCounterId");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.Module_State", "ti.sysbios.family.arm.v7a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7a.Pmu.Module_State", "ti.sysbios.family.arm.v7a"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v7a")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 0);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        if (isCFG) {
            Proto.Str ps = (Proto.Str)vo.find("Module_State");
            if (ps != null) vo.bind("$object", ps.newInstance());
            vo.bind("$$meta_iobj", 1);
        }//isCFG
        vo.bind("setInterruptFunc", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.setInterruptFunc", "ti.sysbios.family.arm.v7a"));
        vo.bind("startCounter", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.startCounter", "ti.sysbios.family.arm.v7a"));
        vo.bind("stopCounter", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.stopCounter", "ti.sysbios.family.arm.v7a"));
        vo.bind("resetCount", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.resetCount", "ti.sysbios.family.arm.v7a"));
        vo.bind("setCount", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.setCount", "ti.sysbios.family.arm.v7a"));
        vo.bind("configureCounter", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.configureCounter", "ti.sysbios.family.arm.v7a"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.enableInterrupt", "ti.sysbios.family.arm.v7a"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.disableInterrupt", "ti.sysbios.family.arm.v7a"));
        vo.bind("clearOverflowStatus", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.clearOverflowStatus", "ti.sysbios.family.arm.v7a"));
        vo.bind("getCount", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.getCount", "ti.sysbios.family.arm.v7a"));
        vo.bind("getNumCounters", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.getNumCounters", "ti.sysbios.family.arm.v7a"));
        vo.bind("getOverflowStatus", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.getOverflowStatus", "ti.sysbios.family.arm.v7a"));
        vo.bind("getEnabled", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.getEnabled", "ti.sysbios.family.arm.v7a"));
        vo.bind("startCounterI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.startCounterI", "ti.sysbios.family.arm.v7a"));
        vo.bind("stopCounterI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.stopCounterI", "ti.sysbios.family.arm.v7a"));
        vo.bind("resetCountI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.resetCountI", "ti.sysbios.family.arm.v7a"));
        vo.bind("setCountI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.setCountI", "ti.sysbios.family.arm.v7a"));
        vo.bind("enableInterruptI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.enableInterruptI", "ti.sysbios.family.arm.v7a"));
        vo.bind("disableInterruptI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.disableInterruptI", "ti.sysbios.family.arm.v7a"));
        vo.bind("clearOverflowStatusI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.clearOverflowStatusI", "ti.sysbios.family.arm.v7a"));
        vo.bind("getCountI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.getCountI", "ti.sysbios.family.arm.v7a"));
        vo.bind("getOverflowStatusI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.getOverflowStatusI", "ti.sysbios.family.arm.v7a"));
        vo.bind("configureCounterI", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.configureCounterI", "ti.sysbios.family.arm.v7a"));
        vo.bind("clearOverflowStatusReg", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.clearOverflowStatusReg", "ti.sysbios.family.arm.v7a"));
        vo.bind("getOverflowStatusReg", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.getOverflowStatusReg", "ti.sysbios.family.arm.v7a"));
        vo.bind("initCounters", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.initCounters", "ti.sysbios.family.arm.v7a"));
        vo.bind("interruptHandler", om.findStrict("ti.sysbios.family.arm.v7a.Pmu.interruptHandler", "ti.sysbios.family.arm.v7a"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v7a_Pmu_Module__startupDone__E", "ti_sysbios_family_arm_v7a_Pmu_setInterruptFunc__E", "ti_sysbios_family_arm_v7a_Pmu_startCounter__E", "ti_sysbios_family_arm_v7a_Pmu_stopCounter__E", "ti_sysbios_family_arm_v7a_Pmu_resetCount__E", "ti_sysbios_family_arm_v7a_Pmu_setCount__E", "ti_sysbios_family_arm_v7a_Pmu_configureCounter__E", "ti_sysbios_family_arm_v7a_Pmu_enableInterrupt__E", "ti_sysbios_family_arm_v7a_Pmu_disableInterrupt__E", "ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatus__E", "ti_sysbios_family_arm_v7a_Pmu_getCount__E", "ti_sysbios_family_arm_v7a_Pmu_getNumCounters__E", "ti_sysbios_family_arm_v7a_Pmu_getOverflowStatus__E", "ti_sysbios_family_arm_v7a_Pmu_getEnabled__E", "ti_sysbios_family_arm_v7a_Pmu_startCounterI__E", "ti_sysbios_family_arm_v7a_Pmu_stopCounterI__E", "ti_sysbios_family_arm_v7a_Pmu_resetCountI__E", "ti_sysbios_family_arm_v7a_Pmu_setCountI__E", "ti_sysbios_family_arm_v7a_Pmu_enableInterruptI__E", "ti_sysbios_family_arm_v7a_Pmu_disableInterruptI__E", "ti_sysbios_family_arm_v7a_Pmu_clearOverflowStatusI__E", "ti_sysbios_family_arm_v7a_Pmu_getCountI__E", "ti_sysbios_family_arm_v7a_Pmu_getOverflowStatusI__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_badIntNum", "A_invalidCounterId"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Pmu", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Pmu");
    }

    void Timer$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer", "ti.sysbios.family.arm.v7a");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer.Module", "ti.sysbios.family.arm.v7a");
        vo.init2(po, "ti.sysbios.family.arm.v7a.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v7a.Timer$$capsule", "ti.sysbios.family.arm.v7a"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.v7a.Timer.Instance", "ti.sysbios.family.arm.v7a"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.v7a.Timer.Params", "ti.sysbios.family.arm.v7a"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.v7a.Timer.Params", "ti.sysbios.family.arm.v7a")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.v7a.Timer.Handle", "ti.sysbios.family.arm.v7a"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v7a", "ti.sysbios.family.arm.v7a"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.family.arm.v7a"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.v7a"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.v7a"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.v7a"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.v7a"));
        vo.bind("TimerFuncPtr", om.findStrict("ti.sysbios.family.arm.v7a.Timer.TimerFuncPtr", "ti.sysbios.family.arm.v7a"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.v7a.Timer.BasicView", "ti.sysbios.family.arm.v7a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7a.Timer.BasicView", "ti.sysbios.family.arm.v7a"));
        mcfgs.add("E_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("anyMask");
        mcfgs.add("availMask");
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.v7a.Timer.Instance_State", "ti.sysbios.family.arm.v7a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7a.Timer.Instance_State", "ti.sysbios.family.arm.v7a"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.v7a.Timer.Module_State", "ti.sysbios.family.arm.v7a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v7a.Timer.Module_State", "ti.sysbios.family.arm.v7a"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.family.arm.v7a"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.family.arm.v7a"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.family.arm.v7a"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.family.arm.v7a"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.family.arm.v7a"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.family.arm.v7a"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.family.arm.v7a"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.family.arm.v7a"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.family.arm.v7a"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v7a")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.v7a.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$v7a$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.family.arm.v7a.Timer.getNumTimers", "ti.sysbios.family.arm.v7a"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.family.arm.v7a.Timer.getStatus", "ti.sysbios.family.arm.v7a"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.v7a.Timer.startup", "ti.sysbios.family.arm.v7a"));
        vo.bind("oneShotStub", om.findStrict("ti.sysbios.family.arm.v7a.Timer.oneShotStub", "ti.sysbios.family.arm.v7a"));
        vo.bind("periodicStub", om.findStrict("ti.sysbios.family.arm.v7a.Timer.periodicStub", "ti.sysbios.family.arm.v7a"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.v7a.Timer.getHandle", "ti.sysbios.family.arm.v7a"));
        vo.bind("initDevice", om.findStrict("ti.sysbios.family.arm.v7a.Timer.initDevice", "ti.sysbios.family.arm.v7a"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.v7a.Timer.postInit", "ti.sysbios.family.arm.v7a"));
        vo.bind("checkOverflow", om.findStrict("ti.sysbios.family.arm.v7a.Timer.checkOverflow", "ti.sysbios.family.arm.v7a"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v7a_Timer_Handle__label__E", "ti_sysbios_family_arm_v7a_Timer_Module__startupDone__E", "ti_sysbios_family_arm_v7a_Timer_Object__create__E", "ti_sysbios_family_arm_v7a_Timer_Object__delete__E", "ti_sysbios_family_arm_v7a_Timer_Object__get__E", "ti_sysbios_family_arm_v7a_Timer_Object__first__E", "ti_sysbios_family_arm_v7a_Timer_Object__next__E", "ti_sysbios_family_arm_v7a_Timer_Params__init__E", "ti_sysbios_family_arm_v7a_Timer_getNumTimers__E", "ti_sysbios_family_arm_v7a_Timer_getStatus__E", "ti_sysbios_family_arm_v7a_Timer_startup__E", "ti_sysbios_family_arm_v7a_Timer_getMaxTicks__E", "ti_sysbios_family_arm_v7a_Timer_setNextTick__E", "ti_sysbios_family_arm_v7a_Timer_start__E", "ti_sysbios_family_arm_v7a_Timer_stop__E", "ti_sysbios_family_arm_v7a_Timer_setPeriod__E", "ti_sysbios_family_arm_v7a_Timer_setPeriodMicroSecs__E", "ti_sysbios_family_arm_v7a_Timer_getPeriod__E", "ti_sysbios_family_arm_v7a_Timer_getCount__E", "ti_sysbios_family_arm_v7a_Timer_getFreq__E", "ti_sysbios_family_arm_v7a_Timer_getFunc__E", "ti_sysbios_family_arm_v7a_Timer_setFunc__E", "ti_sysbios_family_arm_v7a_Timer_trigger__E", "ti_sysbios_family_arm_v7a_Timer_getExpiredCounts__E", "ti_sysbios_family_arm_v7a_Timer_getExpiredTicks__E", "ti_sysbios_family_arm_v7a_Timer_getCurrentTick__E", "ti_sysbios_family_arm_v7a_Timer_oneShotStub__E", "ti_sysbios_family_arm_v7a_Timer_periodicStub__E", "ti_sysbios_family_arm_v7a_Timer_getHandle__E"));
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
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.v7a.Timer.Object", "ti.sysbios.family.arm.v7a"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Timer", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.v7a")).findStrict("PARAMS", "ti.sysbios.family.arm.v7a");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.v7a.Timer", "ti.sysbios.family.arm.v7a")).findStrict("PARAMS", "ti.sysbios.family.arm.v7a");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v7a.Pmu", "ti.sysbios.family.arm.v7a"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v7a.Timer", "ti.sysbios.family.arm.v7a"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Pmu", "ti.sysbios.family.arm.v7a");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Pmu Info", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitPmuInfo", "structName", "PmuInfoView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v7a.Timer", "ti.sysbios.family.arm.v7a");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v7a.Pmu")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v7a.Timer")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.v7a")).add(pkgV);
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
        Pmu$$OBJECTS();
        Timer$$OBJECTS();
        Pmu$$CONSTS();
        Timer$$CONSTS();
        Pmu$$CREATES();
        Timer$$CREATES();
        Pmu$$FUNCTIONS();
        Timer$$FUNCTIONS();
        Pmu$$SIZES();
        Timer$$SIZES();
        Pmu$$TYPES();
        Timer$$TYPES();
        if (isROV) {
            Pmu$$ROV();
            Timer$$ROV();
        }//isROV
        $$SINGLETONS();
        Pmu$$SINGLETONS();
        Timer$$SINGLETONS();
        $$INITIALIZATION();
    }
}
