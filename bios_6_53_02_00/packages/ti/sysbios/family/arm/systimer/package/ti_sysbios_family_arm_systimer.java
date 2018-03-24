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

public class ti_sysbios_family_arm_systimer
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.family.arm.gic");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.systimer.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.systimer", new Value.Obj("ti.sysbios.family.arm.systimer", pkgP));
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.systimer.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.systimer.Timer", new Value.Obj("ti.sysbios.family.arm.systimer.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.systimer.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.systimer"));
        om.bind("ti.sysbios.family.arm.systimer.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.systimer"));
        om.bind("ti.sysbios.family.arm.systimer.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.systimer"));
        om.bind("ti.sysbios.family.arm.systimer.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.systimer"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.systimer.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.systimer.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.systimer.Timer$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.systimer.Timer.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.systimer.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.systimer.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.systimer.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.systimer.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.systimer.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.systimer.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.systimer.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.systimer.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.systimer.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.systimer.Timer.Object", om.findStrict("ti.sysbios.family.arm.systimer.Timer.Instance_State", "ti.sysbios.family.arm.systimer"));
        }//isROV
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.family.arm.systimer.Timer.MAX_PERIOD", 0x00FFFFFFFFFFFFFFL);
        om.bind("ti.sysbios.family.arm.systimer.Timer.NUM_TIMER_DEVICES", 2L);
        om.bind("ti.sysbios.family.arm.systimer.Timer.getNumTimers", new Extern("ti_sysbios_family_arm_systimer_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.getStatus", new Extern("ti_sysbios_family_arm_systimer_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.startup", new Extern("ti_sysbios_family_arm_systimer_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.oneShotStub", new Extern("ti_sysbios_family_arm_systimer_Timer_oneShotStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.periodicStub", new Extern("ti_sysbios_family_arm_systimer_Timer_periodicStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.getHandle", new Extern("ti_sysbios_family_arm_systimer_Timer_getHandle__E", "ti_sysbios_family_arm_systimer_Timer_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.initDevice", new Extern("ti_sysbios_family_arm_systimer_Timer_initDevice__I", "xdc_Void(*)(ti_sysbios_family_arm_systimer_Timer_Object*)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.postInit", new Extern("ti_sysbios_family_arm_systimer_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_systimer_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.checkOverflow", new Extern("ti_sysbios_family_arm_systimer_Timer_checkOverflow__I", "xdc_Bool(*)(xdc_UInt64,xdc_UInt64)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.readPhyCtrl", new Extern("ti_sysbios_family_arm_systimer_Timer_readPhyCtrl__I", "xdc_UInt32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.readPhyCnt", new Extern("ti_sysbios_family_arm_systimer_Timer_readPhyCnt__I", "xdc_Void(*)(xdc_UInt64*)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.writePhyCtrl", new Extern("ti_sysbios_family_arm_systimer_Timer_writePhyCtrl__I", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.writePhyCmpVal", new Extern("ti_sysbios_family_arm_systimer_Timer_writePhyCmpVal__I", "xdc_Void(*)(xdc_UInt64*)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.readVirtCtrl", new Extern("ti_sysbios_family_arm_systimer_Timer_readVirtCtrl__I", "xdc_UInt32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.readVirtCnt", new Extern("ti_sysbios_family_arm_systimer_Timer_readVirtCnt__I", "xdc_Void(*)(xdc_UInt64*)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.tickReconfigSmp", new Extern("ti_sysbios_family_arm_systimer_Timer_tickReconfigSmp__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.writeVirtCtrl", new Extern("ti_sysbios_family_arm_systimer_Timer_writeVirtCtrl__I", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.systimer.Timer.writeVirtCmpVal", new Extern("ti_sysbios_family_arm_systimer_Timer_writeVirtCmpVal__I", "xdc_Void(*)(xdc_UInt64*)", true, false));
    }

    void Timer$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$systimer$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.systimer.Timer.create() called before xdc.useModule('ti.sysbios.family.arm.systimer.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.systimer.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.systimer.Timer.Module", "ti.sysbios.family.arm.systimer"), om.findStrict("ti.sysbios.family.arm.systimer.Timer.Instance", "ti.sysbios.family.arm.systimer"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.systimer.Timer.Params", "ti.sysbios.family.arm.systimer"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$systimer$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.systimer.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.systimer.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.systimer']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.systimer.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.systimer.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.systimer.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.systimer.Timer.Module", "ti.sysbios.family.arm.systimer"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$Object", "ti.sysbios.family.arm.systimer"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.systimer.Timer.Params", "ti.sysbios.family.arm.systimer"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$systimer$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.systimer.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.systimer.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.systimer.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Timer$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.systimer.Timer.Instance_State", "ti.sysbios.family.arm.systimer");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("staticInst", "UShort"));
        sizes.add(Global.newArray("id", "TInt"));
        sizes.add(Global.newArray("runMode", "Nti.sysbios.interfaces.ITimer.RunMode;;;;"));
        sizes.add(Global.newArray("startMode", "Nti.sysbios.interfaces.ITimer.StartMode;;;"));
        sizes.add(Global.newArray("period", "UInt64"));
        sizes.add(Global.newArray("periodType", "Nti.sysbios.interfaces.ITimer.PeriodType;;;"));
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("tickFxn", "UFxn"));
        sizes.add(Global.newArray("extFreq", "Sxdc.runtime.Types;FreqHz"));
        sizes.add(Global.newArray("hwi", "UPtr"));
        sizes.add(Global.newArray("prevThreshold", "UInt64"));
        sizes.add(Global.newArray("nextThreshold", "UInt64"));
        sizes.add(Global.newArray("savedCurrCount", "UInt64"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.systimer.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.systimer.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.systimer.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.systimer.Timer.Module_State", "ti.sysbios.family.arm.systimer");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "UInt"));
        sizes.add(Global.newArray("handles", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.systimer.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.systimer.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.systimer.Timer.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Timer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/systimer/Timer.xs");
        om.bind("ti.sysbios.family.arm.systimer.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer.Module", "ti.sysbios.family.arm.systimer");
        po.init("ti.sysbios.family.arm.systimer.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.family.arm.systimer"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt64)"), 0x00FFFFFFFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("supportsDynamic", $$T_Bool, true, "wh");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.systimer"), $$UNDEF, "wh");
            po.addFld("E_invalidTimer", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.systimer"), Global.newObject("msg", "E_invalidTimer: Invalid Timer Id %d"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.systimer"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("E_invalidHwiMask", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.systimer"), Global.newObject("msg", "E_InvalidMask: Mask in hwiParams cannot enable self"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.systimer"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period %d"), "w");
            po.addFld("intNumDef", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x3L, "w");
            po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x3L, "w");
            po.addFld("intFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.arm.systimer"), $$DEFAULT, "w");
            po.addFld("startupNeeded", Proto.Elm.newCNum("(xdc_UInt)"), false, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$create", "ti.sysbios.family.arm.systimer"), Global.get("ti$sysbios$family$arm$systimer$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$construct", "ti.sysbios.family.arm.systimer"), Global.get("ti$sysbios$family$arm$systimer$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.systimer.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.systimer.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.systimer.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.systimer.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.systimer.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.systimer.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.family.arm.systimer"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.family.arm.systimer"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer.Instance", "ti.sysbios.family.arm.systimer");
        po.init("ti.sysbios.family.arm.systimer.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.family.arm.systimer"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt64)"), 0x00FFFFFFFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arm_gic_Hwi_Params*", "PS"), null, "w");
            po.addFld("period64", Proto.Elm.newCNum("(xdc_UInt64)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.systimer"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$Params", "ti.sysbios.family.arm.systimer");
        po.init("ti.sysbios.family.arm.systimer.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.family.arm.systimer"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt64)"), 0x00FFFFFFFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arm_gic_Hwi_Params*", "PS"), null, "w");
            po.addFld("period64", Proto.Elm.newCNum("(xdc_UInt64)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.systimer"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$Object", "ti.sysbios.family.arm.systimer");
        po.init("ti.sysbios.family.arm.systimer.Timer.Object", om.findStrict("ti.sysbios.family.arm.systimer.Timer.Instance", "ti.sysbios.family.arm.systimer"));
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$BasicView", "ti.sysbios.family.arm.systimer");
        po.init("ti.sysbios.family.arm.systimer.Timer.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halTimerHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("startMode", $$T_Str, $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", $$T_Str, $$UNDEF, "w");
                po.addFld("periodType", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("extFreq", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiHandle", $$T_Str, $$UNDEF, "w");
                po.addFld("prevThreshold", $$T_Str, $$UNDEF, "w");
                po.addFld("nextThreshold", $$T_Str, $$UNDEF, "w");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct Timer.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$ModuleView", "ti.sysbios.family.arm.systimer");
        po.init("ti.sysbios.family.arm.systimer.Timer.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("availMask", $$T_Str, $$UNDEF, "w");
        // struct Timer.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$Instance_State", "ti.sysbios.family.arm.systimer");
        po.init("ti.sysbios.family.arm.systimer.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("staticInst", $$T_Bool, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.systimer"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.systimer"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.systimer"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("extFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.arm.systimer"), $$DEFAULT, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Handle", "ti.sysbios.family.arm.systimer"), $$UNDEF, "w");
                po.addFld("prevThreshold", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF, "w");
                po.addFld("nextThreshold", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF, "w");
                po.addFld("savedCurrCount", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$Module_State", "ti.sysbios.family.arm.systimer");
        po.init("ti.sysbios.family.arm.systimer.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("handles", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.systimer.Timer.Handle", "ti.sysbios.family.arm.systimer"), false), $$DEFAULT, "w");
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer", "ti.sysbios.family.arm.systimer");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$Instance_State", "ti.sysbios.family.arm.systimer");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.systimer.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$Instance_State", "ti.sysbios.family.arm.systimer");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.systimer.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer$$Module_State", "ti.sysbios.family.arm.systimer");
        po.bind("handles$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.systimer.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.systimer"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/systimer/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.systimer"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.systimer"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.systimer"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.systimer"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.systimer"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.systimer"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.systimer", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.systimer");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.systimer.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.systimer'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.systimer$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.systimer$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.systimer$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.systimer.aa15fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.systimer.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Timer$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer", "ti.sysbios.family.arm.systimer");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer.Module", "ti.sysbios.family.arm.systimer");
        vo.init2(po, "ti.sysbios.family.arm.systimer.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.systimer.Timer$$capsule", "ti.sysbios.family.arm.systimer"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.systimer.Timer.Instance", "ti.sysbios.family.arm.systimer"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.systimer.Timer.Params", "ti.sysbios.family.arm.systimer"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.systimer.Timer.Params", "ti.sysbios.family.arm.systimer")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.systimer.Timer.Handle", "ti.sysbios.family.arm.systimer"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.systimer", "ti.sysbios.family.arm.systimer"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.family.arm.systimer"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.systimer"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.systimer"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.systimer"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.systimer"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.systimer.Timer.BasicView", "ti.sysbios.family.arm.systimer"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.systimer.Timer.BasicView", "ti.sysbios.family.arm.systimer"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.systimer.Timer.ModuleView", "ti.sysbios.family.arm.systimer"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.systimer.Timer.ModuleView", "ti.sysbios.family.arm.systimer"));
        mcfgs.add("E_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("E_invalidHwiMask");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("intNumDef");
        mcfgs.add("anyMask");
        mcfgs.add("availMask");
        mcfgs.add("intFreq");
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.systimer.Timer.Instance_State", "ti.sysbios.family.arm.systimer"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.systimer.Timer.Instance_State", "ti.sysbios.family.arm.systimer"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.systimer.Timer.Module_State", "ti.sysbios.family.arm.systimer"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.systimer.Timer.Module_State", "ti.sysbios.family.arm.systimer"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.family.arm.systimer"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.family.arm.systimer"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.family.arm.systimer"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.family.arm.systimer"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.family.arm.systimer"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.family.arm.systimer"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.family.arm.systimer"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.family.arm.systimer"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.family.arm.systimer"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.systimer")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.systimer.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$systimer$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.family.arm.systimer.Timer.getNumTimers", "ti.sysbios.family.arm.systimer"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.family.arm.systimer.Timer.getStatus", "ti.sysbios.family.arm.systimer"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.systimer.Timer.startup", "ti.sysbios.family.arm.systimer"));
        vo.bind("oneShotStub", om.findStrict("ti.sysbios.family.arm.systimer.Timer.oneShotStub", "ti.sysbios.family.arm.systimer"));
        vo.bind("periodicStub", om.findStrict("ti.sysbios.family.arm.systimer.Timer.periodicStub", "ti.sysbios.family.arm.systimer"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.systimer.Timer.getHandle", "ti.sysbios.family.arm.systimer"));
        vo.bind("initDevice", om.findStrict("ti.sysbios.family.arm.systimer.Timer.initDevice", "ti.sysbios.family.arm.systimer"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.systimer.Timer.postInit", "ti.sysbios.family.arm.systimer"));
        vo.bind("checkOverflow", om.findStrict("ti.sysbios.family.arm.systimer.Timer.checkOverflow", "ti.sysbios.family.arm.systimer"));
        vo.bind("readPhyCtrl", om.findStrict("ti.sysbios.family.arm.systimer.Timer.readPhyCtrl", "ti.sysbios.family.arm.systimer"));
        vo.bind("readPhyCnt", om.findStrict("ti.sysbios.family.arm.systimer.Timer.readPhyCnt", "ti.sysbios.family.arm.systimer"));
        vo.bind("writePhyCtrl", om.findStrict("ti.sysbios.family.arm.systimer.Timer.writePhyCtrl", "ti.sysbios.family.arm.systimer"));
        vo.bind("writePhyCmpVal", om.findStrict("ti.sysbios.family.arm.systimer.Timer.writePhyCmpVal", "ti.sysbios.family.arm.systimer"));
        vo.bind("readVirtCtrl", om.findStrict("ti.sysbios.family.arm.systimer.Timer.readVirtCtrl", "ti.sysbios.family.arm.systimer"));
        vo.bind("readVirtCnt", om.findStrict("ti.sysbios.family.arm.systimer.Timer.readVirtCnt", "ti.sysbios.family.arm.systimer"));
        vo.bind("tickReconfigSmp", om.findStrict("ti.sysbios.family.arm.systimer.Timer.tickReconfigSmp", "ti.sysbios.family.arm.systimer"));
        vo.bind("writeVirtCtrl", om.findStrict("ti.sysbios.family.arm.systimer.Timer.writeVirtCtrl", "ti.sysbios.family.arm.systimer"));
        vo.bind("writeVirtCmpVal", om.findStrict("ti.sysbios.family.arm.systimer.Timer.writeVirtCmpVal", "ti.sysbios.family.arm.systimer"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_systimer_Timer_Handle__label__E", "ti_sysbios_family_arm_systimer_Timer_Module__startupDone__E", "ti_sysbios_family_arm_systimer_Timer_Object__create__E", "ti_sysbios_family_arm_systimer_Timer_Object__delete__E", "ti_sysbios_family_arm_systimer_Timer_Object__get__E", "ti_sysbios_family_arm_systimer_Timer_Object__first__E", "ti_sysbios_family_arm_systimer_Timer_Object__next__E", "ti_sysbios_family_arm_systimer_Timer_Params__init__E", "ti_sysbios_family_arm_systimer_Timer_getNumTimers__E", "ti_sysbios_family_arm_systimer_Timer_getStatus__E", "ti_sysbios_family_arm_systimer_Timer_startup__E", "ti_sysbios_family_arm_systimer_Timer_getMaxTicks__E", "ti_sysbios_family_arm_systimer_Timer_setNextTick__E", "ti_sysbios_family_arm_systimer_Timer_start__E", "ti_sysbios_family_arm_systimer_Timer_stop__E", "ti_sysbios_family_arm_systimer_Timer_setPeriod__E", "ti_sysbios_family_arm_systimer_Timer_setPeriodMicroSecs__E", "ti_sysbios_family_arm_systimer_Timer_getPeriod__E", "ti_sysbios_family_arm_systimer_Timer_getCount__E", "ti_sysbios_family_arm_systimer_Timer_getFreq__E", "ti_sysbios_family_arm_systimer_Timer_getFunc__E", "ti_sysbios_family_arm_systimer_Timer_setFunc__E", "ti_sysbios_family_arm_systimer_Timer_trigger__E", "ti_sysbios_family_arm_systimer_Timer_getExpiredCounts__E", "ti_sysbios_family_arm_systimer_Timer_getExpiredTicks__E", "ti_sysbios_family_arm_systimer_Timer_getCurrentTick__E", "ti_sysbios_family_arm_systimer_Timer_oneShotStub__E", "ti_sysbios_family_arm_systimer_Timer_periodicStub__E", "ti_sysbios_family_arm_systimer_Timer_getHandle__E", "ti_sysbios_family_arm_systimer_Timer_reconfig__E", "ti_sysbios_family_arm_systimer_Timer_setPeriod64__E", "ti_sysbios_family_arm_systimer_Timer_setPeriodMicroSecs64__E", "ti_sysbios_family_arm_systimer_Timer_getPeriod64__E", "ti_sysbios_family_arm_systimer_Timer_getCount64__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_invalidTimer", "E_notAvailable", "E_invalidHwiMask", "E_cannotSupport"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.systimer.Timer.Object", "ti.sysbios.family.arm.systimer"));
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
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.systimer")).findStrict("PARAMS", "ti.sysbios.family.arm.systimer");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.systimer.Timer", "ti.sysbios.family.arm.systimer")).findStrict("PARAMS", "ti.sysbios.family.arm.systimer");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.systimer.Timer", "ti.sysbios.family.arm.systimer"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.systimer.Timer", "ti.sysbios.family.arm.systimer");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.systimer.Timer")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.systimer")).add(pkgV);
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
        Timer$$CONSTS();
        Timer$$CREATES();
        Timer$$FUNCTIONS();
        Timer$$SIZES();
        Timer$$TYPES();
        if (isROV) {
            Timer$$ROV();
        }//isROV
        $$SINGLETONS();
        Timer$$SINGLETONS();
        $$INITIALIZATION();
    }
}
