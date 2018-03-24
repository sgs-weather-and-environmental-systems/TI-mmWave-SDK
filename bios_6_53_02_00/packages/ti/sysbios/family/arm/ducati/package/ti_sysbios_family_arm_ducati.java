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

public class ti_sysbios_family_arm_ducati
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
        Global.callFxn("loadPackage", xdcO, "xdc.runtime");
        Global.callFxn("loadPackage", xdcO, "xdc.rov");
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.family.arm.m3");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati", new Value.Obj("ti.sysbios.family.arm.ducati", pkgP));
    }

    void Core$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Core.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.Core", new Value.Obj("ti.sysbios.family.arm.ducati.Core", po));
        pkgV.bind("Core", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Core$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.Core.Module_State", new Proto.Str(spo, false));
    }

    void CTM$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.CTM.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.CTM", new Value.Obj("ti.sysbios.family.arm.ducati.CTM", po));
        pkgV.bind("CTM", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.CTM$$CTM", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.CTM.CTM", new Proto.Str(spo, false));
    }

    void GateDualCore$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateDualCore.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.GateDualCore", new Value.Obj("ti.sysbios.family.arm.ducati.GateDualCore", po));
        pkgV.bind("GateDualCore", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.ducati.GateDualCore.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.ducati.GateDualCore.Object", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Instance_State", "ti.sysbios.family.arm.ducati"));
        }//isROV
    }

    void GateSmp$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateSmp.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.GateSmp", new Value.Obj("ti.sysbios.family.arm.ducati.GateSmp", po));
        pkgV.bind("GateSmp", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateSmp$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.GateSmp.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateSmp$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.GateSmp.Instance_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.ducati.GateSmp.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateSmp$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.GateSmp.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.GateSmp$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.GateSmp.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.ducati.GateSmp.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.ducati.GateSmp.Object", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Instance_State", "ti.sysbios.family.arm.ducati"));
        }//isROV
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.Timer", new Value.Obj("ti.sysbios.family.arm.ducati.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.ducati.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.ducati"));
        om.bind("ti.sysbios.family.arm.ducati.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.ducati"));
        om.bind("ti.sysbios.family.arm.ducati.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.ducati"));
        om.bind("ti.sysbios.family.arm.ducati.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.ducati"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Timer$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.Timer.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Timer$$DeviceView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.Timer.DeviceView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.ducati.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.ducati.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.ducati.Timer.Object", om.findStrict("ti.sysbios.family.arm.ducati.Timer.Instance_State", "ti.sysbios.family.arm.ducati"));
        }//isROV
    }

    void TimerSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.TimerSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.TimerSupport", new Value.Obj("ti.sysbios.family.arm.ducati.TimerSupport", po));
        pkgV.bind("TimerSupport", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.TimerSupport$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.TimerSupport.Module_State", new Proto.Str(spo, false));
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.TimestampProvider", new Value.Obj("ti.sysbios.family.arm.ducati.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.TimestampProvider$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.ducati.TimestampProvider.ModuleView", new Proto.Str(spo, false));
    }

    void Wugen$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.ducati.Wugen.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.ducati.Wugen", new Value.Obj("ti.sysbios.family.arm.ducati.Wugen", po));
        pkgV.bind("Wugen", vo);
        // decls 
    }

    void Core$$CONSTS()
    {
        // module Core
        om.bind("ti.sysbios.family.arm.ducati.Core.HWI_SCHEDULER_LOCK", 0x0001L);
        om.bind("ti.sysbios.family.arm.ducati.Core.SWI_SCHEDULER_LOCK", 0x0002L);
        om.bind("ti.sysbios.family.arm.ducati.Core.TASK_SCHEDULER_LOCK", 0x0004L);
        om.bind("ti.sysbios.family.arm.ducati.Core.getId", new Extern("ti_sysbios_family_arm_ducati_Core_getId__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Core.interruptCore", new Extern("ti_sysbios_family_arm_ducati_Core_interruptCore__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Core.lock", new Extern("ti_sysbios_family_arm_ducati_Core_lock__E", "xdc_IArg(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Core.unlock", new Extern("ti_sysbios_family_arm_ducati_Core_unlock__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Core.getIpuId", new Extern("ti_sysbios_family_arm_ducati_Core_getIpuId__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Core.getCore1HwiStackBase", new Extern("ti_sysbios_family_arm_ducati_Core_getCore1HwiStackBase__E", "xdc_Ptr(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Core.hwiFunc", new Extern("ti_sysbios_family_arm_ducati_Core_hwiFunc__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Core.startCore1", new Extern("ti_sysbios_family_arm_ducati_Core_startCore1__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Core.core1Startup", new Extern("ti_sysbios_family_arm_ducati_Core_core1Startup__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Core.atexit", new Extern("ti_sysbios_family_arm_ducati_Core_atexit__I", "xdc_Void(*)(xdc_Int)", true, false));
    }

    void CTM$$CONSTS()
    {
        // module CTM
        om.bind("ti.sysbios.family.arm.ducati.CTM.ctm", new Extern("ti_sysbios_family_arm_ducati_CTM_ctm", "ti_sysbios_family_arm_ducati_CTM_CTM*", false, false));
    }

    void GateDualCore$$CONSTS()
    {
        // module GateDualCore
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore.gateArray", new Extern("ti_sysbios_family_arm_ducati_GateDualCore_gateArray", "xdc_UInt32[<expr>]*", false, false));
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore.query", new Extern("ti_sysbios_family_arm_ducati_GateDualCore_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore.postInit", new Extern("ti_sysbios_family_arm_ducati_GateDualCore_postInit__I", "xdc_Void(*)(ti_sysbios_family_arm_ducati_GateDualCore_Object*)", true, false));
    }

    void GateSmp$$CONSTS()
    {
        // module GateSmp
        om.bind("ti.sysbios.family.arm.ducati.GateSmp.query", new Extern("ti_sysbios_family_arm_ducati_GateSmp_query__E", "xdc_Bool(*)(xdc_Int)", true, false));
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.family.arm.ducati.Timer.MAX_PERIOD", 0xffffffffL);
        om.bind("ti.sysbios.family.arm.ducati.Timer.NUM_TIMER_DEVICES", 2L);
        om.bind("ti.sysbios.family.arm.ducati.Timer.TIMER_CLOCK_DIVIDER", 1L);
        om.bind("ti.sysbios.family.arm.ducati.Timer.MIN_SWEEP_PERIOD", 1L);
        om.bind("ti.sysbios.family.arm.ducati.Timer.getNumTimers", new Extern("ti_sysbios_family_arm_ducati_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Timer.getStatus", new Extern("ti_sysbios_family_arm_ducati_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Timer.startup", new Extern("ti_sysbios_family_arm_ducati_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Timer.getHandle", new Extern("ti_sysbios_family_arm_ducati_Timer_getHandle__E", "ti_sysbios_family_arm_ducati_Timer_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Timer.oneShotStub", new Extern("ti_sysbios_family_arm_ducati_Timer_oneShotStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Timer.periodicStub", new Extern("ti_sysbios_family_arm_ducati_Timer_periodicStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Timer.initDevice", new Extern("ti_sysbios_family_arm_ducati_Timer_initDevice__I", "xdc_Void(*)(ti_sysbios_family_arm_ducati_Timer_Object*)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Timer.postInit", new Extern("ti_sysbios_family_arm_ducati_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_ducati_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
    }

    void TimerSupport$$CONSTS()
    {
        // module TimerSupport
        om.bind("ti.sysbios.family.arm.ducati.TimerSupport.enable", new Extern("ti_sysbios_family_arm_ducati_TimerSupport_enable__E", "xdc_Void(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.family.arm.ducati.TimestampProvider.get32", new Extern("ti_sysbios_family_arm_ducati_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.TimestampProvider.get64", new Extern("ti_sysbios_family_arm_ducati_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.TimestampProvider.getFreq", new Extern("ti_sysbios_family_arm_ducati_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
    }

    void Wugen$$CONSTS()
    {
        // module Wugen
        om.bind("ti.sysbios.family.arm.ducati.Wugen.disableInterrupt", new Extern("ti_sysbios_family_arm_ducati_Wugen_disableInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.ducati.Wugen.enableInterrupt", new Extern("ti_sysbios_family_arm_ducati_Wugen_enableInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
    }

    void Core$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void CTM$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void GateDualCore$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$ducati$GateDualCore$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.ducati.GateDualCore.create() called before xdc.useModule('ti.sysbios.family.arm.ducati.GateDualCore')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Module", "ti.sysbios.family.arm.ducati"), om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Instance", "ti.sysbios.family.arm.ducati"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Params", "ti.sysbios.family.arm.ducati"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$ducati$GateDualCore$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.ducati.GateDualCore'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.ducati.GateDualCore.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.ducati']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.ducati.GateDualCore'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.ducati.GateDualCore'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Module", "ti.sysbios.family.arm.ducati"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$Object", "ti.sysbios.family.arm.ducati"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Params", "ti.sysbios.family.arm.ducati"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$ducati$GateDualCore$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.ducati.GateDualCore'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.ducati.GateDualCore'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.ducati.GateDualCore'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void GateSmp$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$ducati$GateSmp$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.ducati.GateSmp.create() called before xdc.useModule('ti.sysbios.family.arm.ducati.GateSmp')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.ducati.GateSmp$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Module", "ti.sysbios.family.arm.ducati"), om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Instance", "ti.sysbios.family.arm.ducati"), 1, 0, false));
                        fxn.addArg(0, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Params", "ti.sysbios.family.arm.ducati"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$ducati$GateSmp$$create = function( __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.ducati.GateSmp'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.ducati.GateSmp.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.ducati']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.ducati.GateSmp'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, []);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.ducati.GateSmp'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.ducati.GateSmp$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Module", "ti.sysbios.family.arm.ducati"), null, 2, 0, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$Object", "ti.sysbios.family.arm.ducati"), null);
                        fxn.addArg(1, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Params", "ti.sysbios.family.arm.ducati"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$ducati$GateSmp$$construct = function( __obj, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.ducati.GateSmp'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.ducati.GateSmp'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.ducati.GateSmp'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void Timer$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$ducati$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.ducati.Timer.create() called before xdc.useModule('ti.sysbios.family.arm.ducati.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.ducati.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.ducati.Timer.Module", "ti.sysbios.family.arm.ducati"), om.findStrict("ti.sysbios.family.arm.ducati.Timer.Instance", "ti.sysbios.family.arm.ducati"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.Timer.Params", "ti.sysbios.family.arm.ducati"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$ducati$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.ducati.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.ducati.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.ducati']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.ducati.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.ducati.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.ducati.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.ducati.Timer.Module", "ti.sysbios.family.arm.ducati"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$Object", "ti.sysbios.family.arm.ducati"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.Timer.Params", "ti.sysbios.family.arm.ducati"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$ducati$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.ducati.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.ducati.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.ducati.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void TimerSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TimestampProvider$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Wugen$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Core$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void CTM$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateDualCore$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void GateSmp$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TimerSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TimestampProvider$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Wugen$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Core$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.Core.Module_State", "ti.sysbios.family.arm.ducati");
        sizes.clear();
        sizes.add(Global.newArray("exitFlag", "UShort"));
        sizes.add(Global.newArray("gateEntered", "A2;UShort"));
        sizes.add(Global.newArray("schedulerInts", "A2;UInt"));
        sizes.add(Global.newArray("core1HwiStack", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.Core.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.Core.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.Core.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void CTM$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.CTM.CTM", "ti.sysbios.family.arm.ducati");
        sizes.clear();
        sizes.add(Global.newArray("CTCNTL", "UInt32"));
        sizes.add(Global.newArray("RES_04", "A7;UInt32"));
        sizes.add(Global.newArray("CTSTMCNTL", "UInt32"));
        sizes.add(Global.newArray("CTSTMMSTID", "UInt32"));
        sizes.add(Global.newArray("CTSTMINTVL", "UInt32"));
        sizes.add(Global.newArray("CTSTMSEL0", "UInt32"));
        sizes.add(Global.newArray("CTSTMSEL1", "UInt32"));
        sizes.add(Global.newArray("RES_34", "A3;UInt32"));
        sizes.add(Global.newArray("TINTVLR", "A8;UInt32"));
        sizes.add(Global.newArray("RES_60", "A7;UInt32"));
        sizes.add(Global.newArray("CTNUMDBG", "UInt32"));
        sizes.add(Global.newArray("CTDBGSGL", "A8;UInt32"));
        sizes.add(Global.newArray("RES_A0", "A20;UInt32"));
        sizes.add(Global.newArray("CTGNBL", "A2;UInt32"));
        sizes.add(Global.newArray("CTGRST", "A2;UInt32"));
        sizes.add(Global.newArray("CTCR", "A32;UInt32"));
        sizes.add(Global.newArray("CTCNTR", "A32;UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.CTM.CTM']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.CTM.CTM']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.CTM.CTM'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void GateDualCore$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Instance_State", "ti.sysbios.family.arm.ducati");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("index", "UInt"));
        sizes.add(Global.newArray("gatePtr", "UPtr"));
        sizes.add(Global.newArray("gateBytePtr", "UPtr"));
        sizes.add(Global.newArray("stalls", "UInt"));
        sizes.add(Global.newArray("noStalls", "UInt"));
        sizes.add(Global.newArray("totalStalls", "UInt"));
        sizes.add(Global.newArray("maxStall", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.GateDualCore.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.GateDualCore.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.GateDualCore.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Module_State", "ti.sysbios.family.arm.ducati");
        sizes.clear();
        sizes.add(Global.newArray("usedGates", "A4;UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.GateDualCore.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.GateDualCore.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.GateDualCore.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void GateSmp$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Instance_State", "ti.sysbios.family.arm.ducati");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("gateWord", "UInt32"));
        sizes.add(Global.newArray("owner", "UInt"));
        sizes.add(Global.newArray("stalls", "UInt"));
        sizes.add(Global.newArray("noStalls", "UInt"));
        sizes.add(Global.newArray("totalStalls", "UInt"));
        sizes.add(Global.newArray("maxStall", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.GateSmp.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.GateSmp.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.GateSmp.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Timer$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.Timer.Instance_State", "ti.sysbios.family.arm.ducati");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("staticInst", "UShort"));
        sizes.add(Global.newArray("id", "TInt"));
        sizes.add(Global.newArray("ctmid", "TInt"));
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
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.Timer.Module_State", "ti.sysbios.family.arm.ducati");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "UInt"));
        sizes.add(Global.newArray("handles", "A2;UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.Timer.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimerSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport.Module_State", "ti.sysbios.family.arm.ducati");
        sizes.clear();
        sizes.add(Global.newArray("intNums", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.ducati.TimerSupport.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.ducati.TimerSupport.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.ducati.TimerSupport.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimestampProvider$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Wugen$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Core$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/Core.xs");
        om.bind("ti.sysbios.family.arm.ducati.Core$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Core.Module", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Core.Module", om.findStrict("ti.sysbios.interfaces.ICore.Module", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("HWI_SCHEDULER_LOCK", Proto.Elm.newCNum("(xdc_UInt)"), 0x0001L, "rh");
                po.addFld("SWI_SCHEDULER_LOCK", Proto.Elm.newCNum("(xdc_UInt)"), 0x0002L, "rh");
                po.addFld("TASK_SCHEDULER_LOCK", Proto.Elm.newCNum("(xdc_UInt)"), 0x0004L, "rh");
        if (isCFG) {
            po.addFld("E_mismatchedIds", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.ducati"), Global.newObject("msg", "E_mismatchedIds: Core_Id: %d does not match hardware core Id: %d"), "w");
            po.addFld("numCores", Proto.Elm.newCNum("(xdc_UInt)"), 2L, "w");
            po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
            po.addFld("ipuId", Proto.Elm.newCNum("(xdc_UInt)"), 1L, "w");
            po.addFld("core1HwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
            po.addFld("syncExits", $$T_Bool, true, "w");
            po.addFld("gate", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Handle", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
            po.addFld("initStackFlag", $$T_Bool, true, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Core$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Core$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Core$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Core$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Core.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Core$$Module_State", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Core.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("exitFlag", $$T_Bool, $$UNDEF, "w");
                po.addFld("gateEntered", new Proto.Arr($$T_Bool, false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("schedulerInts", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("core1HwiStack", new Proto.Arr(Proto.Elm.newCNum("(xdc_Char)"), false), $$DEFAULT, "w");
    }

    void CTM$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/CTM.xs");
        om.bind("ti.sysbios.family.arm.ducati.CTM$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.CTM.Module", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.CTM.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.CTM$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.CTM$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.CTM$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.CTM$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct CTM.CTM
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.CTM$$CTM", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.CTM.CTM", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("CTCNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_04", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(7L)), $$DEFAULT, "w");
                po.addFld("CTSTMCNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CTSTMMSTID", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CTSTMINTVL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CTSTMSEL0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CTSTMSEL1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RES_34", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
                po.addFld("TINTVLR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("RES_60", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(7L)), $$DEFAULT, "w");
                po.addFld("CTNUMDBG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CTDBGSGL", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("RES_A0", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(20L)), $$DEFAULT, "w");
                po.addFld("CTGNBL", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("CTGRST", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("CTCR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
                po.addFld("CTCNTR", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(32L)), $$DEFAULT, "w");
    }

    void GateDualCore$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/GateDualCore.xs");
        om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Module", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateDualCore.Module", om.findStrict("xdc.runtime.IGateProvider.Module", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.ducati"), $$UNDEF, "wh");
            po.addFld("A_nestedEnter", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.ducati"), Global.newObject("msg", "A_nestedEnter: Can't nest 'enter' calls."), "w");
            po.addFld("E_invalidIndex", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.ducati"), Global.newObject("msg", "E_invalidIndex %d"), "w");
            po.addFld("E_gateInUse", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.ducati"), Global.newObject("msg", "E_gateInUse %d"), "w");
            po.addFld("gateArrayAddress", new Proto.Adr("xdc_Ptr", "Pv"), 0x000007f0L, "w");
            po.addFld("numGates", Proto.Elm.newCNum("(xdc_UInt)"), 4L, "w");
            po.addFld("initGates", $$T_Bool, $$UNDEF, "w");
            po.addFld("enableStats", $$T_Bool, false, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$create", "ti.sysbios.family.arm.ducati"), Global.get("ti$sysbios$family$arm$ducati$GateDualCore$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$construct", "ti.sysbios.family.arm.ducati"), Global.get("ti$sysbios$family$arm$ducati$GateDualCore$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateDualCore$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "queryMeta");
                if (fxn != null) po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "ti.sysbios.family.arm.ducati"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Instance", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateDualCore.Instance", om.findStrict("xdc.runtime.IGateProvider.Instance", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("index", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$Params", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateDualCore.Params", om.findStrict("xdc.runtime.IGateProvider$$Params", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("index", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$Object", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateDualCore.Object", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Instance", "ti.sysbios.family.arm.ducati"));
        // struct GateDualCore.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$BasicView", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateDualCore.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("index", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("owner", $$T_Str, $$UNDEF, "w");
                po.addFld("gateValue", $$T_Str, $$UNDEF, "w");
                po.addFld("stalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("noStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("totalStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("maxStall", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct GateDualCore.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$Instance_State", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateDualCore.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("index", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("gatePtr", new Proto.Adr("xdc_UInt32*", "Pn"), $$UNDEF, "w");
                po.addFld("gateBytePtr", new Proto.Adr("xdc_UInt8*", "Pn"), $$UNDEF, "w");
                po.addFld("stalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("noStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("totalStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("maxStall", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct GateDualCore.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$Module_State", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateDualCore.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("usedGates", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
    }

    void GateSmp$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/GateSmp.xs");
        om.bind("ti.sysbios.family.arm.ducati.GateSmp$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Module", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateSmp.Module", om.findStrict("xdc.runtime.IGateProvider.Module", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.ducati"), $$UNDEF, "wh");
            po.addFld("A_nestedEnter", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.ducati"), Global.newObject("msg", "A_nestedEnter: Can't nest 'enter' calls."), "w");
            po.addFld("enableStats", $$T_Bool, false, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$create", "ti.sysbios.family.arm.ducati"), Global.get("ti$sysbios$family$arm$ducati$GateSmp$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$construct", "ti.sysbios.family.arm.ducati"), Global.get("ti$sysbios$family$arm$ducati$GateSmp$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateSmp$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateSmp$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateSmp$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateSmp$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateSmp$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.GateSmp$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "queryMeta");
                if (fxn != null) po.addFxn("queryMeta", (Proto.Fxn)om.findStrict("xdc.runtime.IGateProvider$$queryMeta", "ti.sysbios.family.arm.ducati"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Instance", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateSmp.Instance", om.findStrict("xdc.runtime.IGateProvider.Instance", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$Params", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateSmp.Params", om.findStrict("xdc.runtime.IGateProvider$$Params", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("Q_BLOCKING", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("Q_PREEMPTING", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$Object", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateSmp.Object", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Instance", "ti.sysbios.family.arm.ducati"));
        // struct GateSmp.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$BasicView", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateSmp.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("owner", $$T_Str, $$UNDEF, "w");
                po.addFld("gateValue", $$T_Str, $$UNDEF, "w");
                po.addFld("stalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("noStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("totalStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("maxStall", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct GateSmp.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$Instance_State", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.GateSmp.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("gateWord", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("owner", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("stalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("noStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("totalStalls", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("maxStall", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
    }

    void Timer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/Timer.xs");
        om.bind("ti.sysbios.family.arm.ducati.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer.Module", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("TIMER_CLOCK_DIVIDER", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("MIN_SWEEP_PERIOD", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.ducati"), $$UNDEF, "wh");
            po.addFld("E_invalidTimer", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.ducati"), Global.newObject("msg", "E_invalidTimer: Invalid Timer Id %d"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.ducati"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.ducati"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period %d"), "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x3L, "w");
            po.addFld("startupNeeded", Proto.Elm.newCNum("(xdc_UInt)"), false, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$create", "ti.sysbios.family.arm.ducati"), Global.get("ti$sysbios$family$arm$ducati$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$construct", "ti.sysbios.family.arm.ducati"), Global.get("ti$sysbios$family$arm$ducati$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.family.arm.ducati"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.family.arm.ducati"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer.Instance", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("TIMER_CLOCK_DIVIDER", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("MIN_SWEEP_PERIOD", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arm_m3_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$Params", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("TIMER_CLOCK_DIVIDER", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("MIN_SWEEP_PERIOD", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arm_m3_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$Object", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Timer.Object", om.findStrict("ti.sysbios.family.arm.ducati.Timer.Instance", "ti.sysbios.family.arm.ducati"));
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$BasicView", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Timer.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halTimerHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("device", $$T_Str, $$UNDEF, "w");
                po.addFld("startMode", $$T_Str, $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("extFreq", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiHandle", $$T_Str, $$UNDEF, "w");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct Timer.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$ModuleView", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Timer.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("availMask", $$T_Str, $$UNDEF, "w");
        // struct Timer.DeviceView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$DeviceView", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Timer.DeviceView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("device", $$T_Str, $$UNDEF, "w");
                po.addFld("devAddr", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("currCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("remainingCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Timer.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$Instance_State", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("staticInst", $$T_Bool, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("ctmid", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.Timer.RunMode", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.Timer.StartMode", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.family.arm.ducati.Timer.PeriodType", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("extFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.arm.ducati"), $$DEFAULT, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.family.arm.m3.Hwi.Handle", "ti.sysbios.family.arm.ducati"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$Module_State", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("handles", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.ducati.Timer.Handle", "ti.sysbios.family.arm.ducati"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
    }

    void TimerSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/TimerSupport.xs");
        om.bind("ti.sysbios.family.arm.ducati.TimerSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport.Module", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.TimerSupport.Module", om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.TimerSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.TimerSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.TimerSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.TimerSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct TimerSupport.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport$$Module_State", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.TimerSupport.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("intNums", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false), $$DEFAULT, "w");
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/TimestampProvider.xs");
        om.bind("ti.sysbios.family.arm.ducati.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider.Module", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.ducati"), $$UNDEF, "wh");
            po.addFld("inpsel", Proto.Elm.newCNum("(xdc_UInt8)"), 0L, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.family.arm.ducati"), fxn);
        // struct TimestampProvider.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider$$ModuleView", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.TimestampProvider.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("timestamp", $$T_Str, $$UNDEF, "w");
    }

    void Wugen$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/Wugen.xs");
        om.bind("ti.sysbios.family.arm.ducati.Wugen$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Wugen.Module", "ti.sysbios.family.arm.ducati");
        po.init("ti.sysbios.family.arm.ducati.Wugen.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.ducati"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Wugen$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Wugen$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Wugen$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.ducati.Wugen$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Core$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Core", "ti.sysbios.family.arm.ducati");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.Core.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Core$$Module_State", "ti.sysbios.family.arm.ducati");
        po.bind("core1HwiStack$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Char", "isScalar", true));
    }

    void CTM$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.CTM", "ti.sysbios.family.arm.ducati");
        vo.bind("CTM$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.CTM.CTM", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.CTM$$CTM", "ti.sysbios.family.arm.ducati");
    }

    void GateDualCore$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$Instance_State", "ti.sysbios.family.arm.ducati");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.GateDualCore.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$Instance_State", "ti.sysbios.family.arm.ducati");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.GateDualCore.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$Module_State", "ti.sysbios.family.arm.ducati");
    }

    void GateSmp$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$Instance_State", "ti.sysbios.family.arm.ducati");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.GateSmp.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$Instance_State", "ti.sysbios.family.arm.ducati");
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$Instance_State", "ti.sysbios.family.arm.ducati");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$Instance_State", "ti.sysbios.family.arm.ducati");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer$$Module_State", "ti.sysbios.family.arm.ducati");
    }

    void TimerSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport", "ti.sysbios.family.arm.ducati");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.ducati.TimerSupport.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport$$Module_State", "ti.sysbios.family.arm.ducati");
        po.bind("intNums$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt8", "isScalar", true));
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider", "ti.sysbios.family.arm.ducati");
    }

    void Wugen$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Wugen", "ti.sysbios.family.arm.ducati");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.ducati.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.ducati"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/ducati/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.ducati"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.ducati"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.ducati"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.ducati"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.ducati"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.ducati"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.ducati", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.ducati");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.ducati.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.ducati'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.ducati$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.ducati$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.ducati$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.aem3',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.aem4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.aem4f',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.family.arm.ducati.aem3',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.family.arm.ducati.aem4',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.am3g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.am4g',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.ducati.am4fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.aem4f', {target: 'ti.targets.arm.elf.M4F', suffix: 'em4f'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.family.arm.ducati.aem3', {target: 'ti.targets.arm.elf.M3', suffix: 'em3'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.family.arm.ducati.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.am3g', {target: 'gnu.targets.arm.M3', suffix: 'm3g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.am4g', {target: 'gnu.targets.arm.M4', suffix: 'm4g'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.ducati.am4fg', {target: 'gnu.targets.arm.M4F', suffix: 'm4fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Core$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Core", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Core.Module", "ti.sysbios.family.arm.ducati");
        vo.init2(po, "ti.sysbios.family.arm.ducati.Core", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.Core$$capsule", "ti.sysbios.family.arm.ducati"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati", "ti.sysbios.family.arm.ducati"));
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
        mcfgs.add("numCores");
        mcfgs.add("E_mismatchedIds");
        mcfgs.add("id");
        mcfgs.add("ipuId");
        mcfgs.add("core1HwiStackSize");
        mcfgs.add("syncExits");
        mcfgs.add("gate");
        icfgs.add("gate");
        mcfgs.add("initStackFlag");
        icfgs.add("initStackFlag");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.ducati.Core.Module_State", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.Core.Module_State", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati")).add(vo);
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
        vo.bind("getId", om.findStrict("ti.sysbios.family.arm.ducati.Core.getId", "ti.sysbios.family.arm.ducati"));
        vo.bind("interruptCore", om.findStrict("ti.sysbios.family.arm.ducati.Core.interruptCore", "ti.sysbios.family.arm.ducati"));
        vo.bind("lock", om.findStrict("ti.sysbios.family.arm.ducati.Core.lock", "ti.sysbios.family.arm.ducati"));
        vo.bind("unlock", om.findStrict("ti.sysbios.family.arm.ducati.Core.unlock", "ti.sysbios.family.arm.ducati"));
        vo.bind("getIpuId", om.findStrict("ti.sysbios.family.arm.ducati.Core.getIpuId", "ti.sysbios.family.arm.ducati"));
        vo.bind("getCore1HwiStackBase", om.findStrict("ti.sysbios.family.arm.ducati.Core.getCore1HwiStackBase", "ti.sysbios.family.arm.ducati"));
        vo.bind("hwiFunc", om.findStrict("ti.sysbios.family.arm.ducati.Core.hwiFunc", "ti.sysbios.family.arm.ducati"));
        vo.bind("startCore1", om.findStrict("ti.sysbios.family.arm.ducati.Core.startCore1", "ti.sysbios.family.arm.ducati"));
        vo.bind("core1Startup", om.findStrict("ti.sysbios.family.arm.ducati.Core.core1Startup", "ti.sysbios.family.arm.ducati"));
        vo.bind("atexit", om.findStrict("ti.sysbios.family.arm.ducati.Core.atexit", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_Core_Module__startupDone__E", "ti_sysbios_family_arm_ducati_Core_getId__E", "ti_sysbios_family_arm_ducati_Core_interruptCore__E", "ti_sysbios_family_arm_ducati_Core_lock__E", "ti_sysbios_family_arm_ducati_Core_unlock__E", "ti_sysbios_family_arm_ducati_Core_hwiDisable__E", "ti_sysbios_family_arm_ducati_Core_hwiEnable__E", "ti_sysbios_family_arm_ducati_Core_hwiRestore__E", "ti_sysbios_family_arm_ducati_Core_getIpuId__E", "ti_sysbios_family_arm_ducati_Core_getCore1HwiStackBase__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_mismatchedIds"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Core", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Core");
    }

    void CTM$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.CTM", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.CTM.Module", "ti.sysbios.family.arm.ducati");
        vo.init2(po, "ti.sysbios.family.arm.ducati.CTM", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.CTM$$capsule", "ti.sysbios.family.arm.ducati"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati", "ti.sysbios.family.arm.ducati"));
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
        vo.bind("CTM", om.findStrict("ti.sysbios.family.arm.ducati.CTM.CTM", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.CTM.CTM", "ti.sysbios.family.arm.ducati"));
        vo.bind("ctm", om.findStrict("ti.sysbios.family.arm.ducati.CTM.ctm", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati")).add(vo);
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
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_CTM_Module__startupDone__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("CTM", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("CTM");
    }

    void GateDualCore$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Module", "ti.sysbios.family.arm.ducati");
        vo.init2(po, "ti.sysbios.family.arm.ducati.GateDualCore", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore$$capsule", "ti.sysbios.family.arm.ducati"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Instance", "ti.sysbios.family.arm.ducati"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Params", "ti.sysbios.family.arm.ducati"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Params", "ti.sysbios.family.arm.ducati")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Handle", "ti.sysbios.family.arm.ducati"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati", "ti.sysbios.family.arm.ducati"));
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
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.BasicView", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.BasicView", "ti.sysbios.family.arm.ducati"));
        mcfgs.add("A_nestedEnter");
        mcfgs.add("E_invalidIndex");
        mcfgs.add("E_gateInUse");
        mcfgs.add("gateArrayAddress");
        mcfgs.add("numGates");
        mcfgs.add("initGates");
        mcfgs.add("enableStats");
        vo.bind("gateArray", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.gateArray", "ti.sysbios.family.arm.ducati"));
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Instance_State", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Instance_State", "ti.sysbios.family.arm.ducati"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Module_State", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Module_State", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.ducati.GateDualCore$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$ducati$GateDualCore$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.query", "ti.sysbios.family.arm.ducati"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.postInit", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_GateDualCore_Handle__label__E", "ti_sysbios_family_arm_ducati_GateDualCore_Module__startupDone__E", "ti_sysbios_family_arm_ducati_GateDualCore_Object__create__E", "ti_sysbios_family_arm_ducati_GateDualCore_Object__delete__E", "ti_sysbios_family_arm_ducati_GateDualCore_Object__get__E", "ti_sysbios_family_arm_ducati_GateDualCore_Object__first__E", "ti_sysbios_family_arm_ducati_GateDualCore_Object__next__E", "ti_sysbios_family_arm_ducati_GateDualCore_Params__init__E", "ti_sysbios_family_arm_ducati_GateDualCore_query__E", "ti_sysbios_family_arm_ducati_GateDualCore_enter__E", "ti_sysbios_family_arm_ducati_GateDualCore_leave__E", "ti_sysbios_family_arm_ducati_GateDualCore_sync__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_invalidIndex", "E_gateInUse"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_nestedEnter"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./GateDualCore.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore.Object", "ti.sysbios.family.arm.ducati"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./GateDualCore.xdt");
        pkgV.bind("GateDualCore", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateDualCore");
    }

    void GateSmp$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Module", "ti.sysbios.family.arm.ducati");
        vo.init2(po, "ti.sysbios.family.arm.ducati.GateSmp", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp$$capsule", "ti.sysbios.family.arm.ducati"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Instance", "ti.sysbios.family.arm.ducati"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Params", "ti.sysbios.family.arm.ducati"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Params", "ti.sysbios.family.arm.ducati")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Handle", "ti.sysbios.family.arm.ducati"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati", "ti.sysbios.family.arm.ducati"));
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
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.BasicView", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.BasicView", "ti.sysbios.family.arm.ducati"));
        mcfgs.add("A_nestedEnter");
        mcfgs.add("enableStats");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Instance_State", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Instance_State", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.ducati.GateSmp$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$ducati$GateSmp$$__initObject"));
        }//isCFG
        vo.bind("query", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.query", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_GateSmp_Handle__label__E", "ti_sysbios_family_arm_ducati_GateSmp_Module__startupDone__E", "ti_sysbios_family_arm_ducati_GateSmp_Object__create__E", "ti_sysbios_family_arm_ducati_GateSmp_Object__delete__E", "ti_sysbios_family_arm_ducati_GateSmp_Object__get__E", "ti_sysbios_family_arm_ducati_GateSmp_Object__first__E", "ti_sysbios_family_arm_ducati_GateSmp_Object__next__E", "ti_sysbios_family_arm_ducati_GateSmp_Params__init__E", "ti_sysbios_family_arm_ducati_GateSmp_query__E", "ti_sysbios_family_arm_ducati_GateSmp_enter__E", "ti_sysbios_family_arm_ducati_GateSmp_leave__E", "ti_sysbios_family_arm_ducati_GateSmp_sync__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_nestedEnter"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.ducati.GateSmp.Object", "ti.sysbios.family.arm.ducati"));
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("GateSmp", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("GateSmp");
    }

    void Timer$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer.Module", "ti.sysbios.family.arm.ducati");
        vo.init2(po, "ti.sysbios.family.arm.ducati.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.Timer$$capsule", "ti.sysbios.family.arm.ducati"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.ducati.Timer.Instance", "ti.sysbios.family.arm.ducati"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.ducati.Timer.Params", "ti.sysbios.family.arm.ducati"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.ducati.Timer.Params", "ti.sysbios.family.arm.ducati")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.ducati.Timer.Handle", "ti.sysbios.family.arm.ducati"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati", "ti.sysbios.family.arm.ducati"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.family.arm.ducati"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.ducati"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.ducati"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.ducati"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.ducati"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.ducati.Timer.BasicView", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.Timer.BasicView", "ti.sysbios.family.arm.ducati"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.ducati.Timer.ModuleView", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.Timer.ModuleView", "ti.sysbios.family.arm.ducati"));
        vo.bind("DeviceView", om.findStrict("ti.sysbios.family.arm.ducati.Timer.DeviceView", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.Timer.DeviceView", "ti.sysbios.family.arm.ducati"));
        mcfgs.add("E_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("anyMask");
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.ducati.Timer.Instance_State", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.Timer.Instance_State", "ti.sysbios.family.arm.ducati"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.ducati.Timer.Module_State", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.Timer.Module_State", "ti.sysbios.family.arm.ducati"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.family.arm.ducati"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.family.arm.ducati"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.family.arm.ducati"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.family.arm.ducati"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.family.arm.ducati"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.family.arm.ducati"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.family.arm.ducati"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.family.arm.ducati"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.ducati.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$ducati$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.family.arm.ducati.Timer.getNumTimers", "ti.sysbios.family.arm.ducati"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.family.arm.ducati.Timer.getStatus", "ti.sysbios.family.arm.ducati"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.ducati.Timer.startup", "ti.sysbios.family.arm.ducati"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.ducati.Timer.getHandle", "ti.sysbios.family.arm.ducati"));
        vo.bind("oneShotStub", om.findStrict("ti.sysbios.family.arm.ducati.Timer.oneShotStub", "ti.sysbios.family.arm.ducati"));
        vo.bind("periodicStub", om.findStrict("ti.sysbios.family.arm.ducati.Timer.periodicStub", "ti.sysbios.family.arm.ducati"));
        vo.bind("initDevice", om.findStrict("ti.sysbios.family.arm.ducati.Timer.initDevice", "ti.sysbios.family.arm.ducati"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.ducati.Timer.postInit", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_Timer_Handle__label__E", "ti_sysbios_family_arm_ducati_Timer_Module__startupDone__E", "ti_sysbios_family_arm_ducati_Timer_Object__create__E", "ti_sysbios_family_arm_ducati_Timer_Object__delete__E", "ti_sysbios_family_arm_ducati_Timer_Object__get__E", "ti_sysbios_family_arm_ducati_Timer_Object__first__E", "ti_sysbios_family_arm_ducati_Timer_Object__next__E", "ti_sysbios_family_arm_ducati_Timer_Params__init__E", "ti_sysbios_family_arm_ducati_Timer_getNumTimers__E", "ti_sysbios_family_arm_ducati_Timer_getStatus__E", "ti_sysbios_family_arm_ducati_Timer_startup__E", "ti_sysbios_family_arm_ducati_Timer_getMaxTicks__E", "ti_sysbios_family_arm_ducati_Timer_setNextTick__E", "ti_sysbios_family_arm_ducati_Timer_start__E", "ti_sysbios_family_arm_ducati_Timer_stop__E", "ti_sysbios_family_arm_ducati_Timer_setPeriod__E", "ti_sysbios_family_arm_ducati_Timer_setPeriodMicroSecs__E", "ti_sysbios_family_arm_ducati_Timer_getPeriod__E", "ti_sysbios_family_arm_ducati_Timer_getCount__E", "ti_sysbios_family_arm_ducati_Timer_getFreq__E", "ti_sysbios_family_arm_ducati_Timer_getFunc__E", "ti_sysbios_family_arm_ducati_Timer_setFunc__E", "ti_sysbios_family_arm_ducati_Timer_trigger__E", "ti_sysbios_family_arm_ducati_Timer_getExpiredCounts__E", "ti_sysbios_family_arm_ducati_Timer_getExpiredTicks__E", "ti_sysbios_family_arm_ducati_Timer_getCurrentTick__E", "ti_sysbios_family_arm_ducati_Timer_getHandle__E", "ti_sysbios_family_arm_ducati_Timer_oneShotStub__E", "ti_sysbios_family_arm_ducati_Timer_periodicStub__E", "ti_sysbios_family_arm_ducati_Timer_reconfig__E"));
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
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.ducati.Timer.Object", "ti.sysbios.family.arm.ducati"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Timer", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer");
    }

    void TimerSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport.Module", "ti.sysbios.family.arm.ducati");
        vo.init2(po, "ti.sysbios.family.arm.ducati.TimerSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport$$capsule", "ti.sysbios.family.arm.ducati"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati", "ti.sysbios.family.arm.ducati"));
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
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport.Module_State", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport.Module_State", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport.enable", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_TimerSupport_Module__startupDone__E", "ti_sysbios_family_arm_ducati_TimerSupport_enable__E"));
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
        pkgV.bind("TimerSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TimerSupport");
    }

    void TimestampProvider$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider.Module", "ti.sysbios.family.arm.ducati");
        vo.init2(po, "ti.sysbios.family.arm.ducati.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider$$capsule", "ti.sysbios.family.arm.ducati"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati", "ti.sysbios.family.arm.ducati"));
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
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider.ModuleView", "ti.sysbios.family.arm.ducati"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider.ModuleView", "ti.sysbios.family.arm.ducati"));
        mcfgs.add("inpsel");
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider.get32", "ti.sysbios.family.arm.ducati"));
        vo.bind("get64", om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider.get64", "ti.sysbios.family.arm.ducati"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider.getFreq", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_TimestampProvider_Module__startupDone__E", "ti_sysbios_family_arm_ducati_TimestampProvider_get32__E", "ti_sysbios_family_arm_ducati_TimestampProvider_get64__E", "ti_sysbios_family_arm_ducati_TimestampProvider_getFreq__E"));
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

    void Wugen$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Wugen", "ti.sysbios.family.arm.ducati");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Wugen.Module", "ti.sysbios.family.arm.ducati");
        vo.init2(po, "ti.sysbios.family.arm.ducati.Wugen", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.ducati.Wugen$$capsule", "ti.sysbios.family.arm.ducati"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.ducati", "ti.sysbios.family.arm.ducati"));
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
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.ducati")).add(vo);
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
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.arm.ducati.Wugen.disableInterrupt", "ti.sysbios.family.arm.ducati"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.arm.ducati.Wugen.enableInterrupt", "ti.sysbios.family.arm.ducati"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_ducati_Wugen_Module__startupDone__E", "ti_sysbios_family_arm_ducati_Wugen_disableInterrupt__E", "ti_sysbios_family_arm_ducati_Wugen_enableInterrupt__E"));
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
        pkgV.bind("Wugen", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Wugen");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.ducati")).findStrict("PARAMS", "ti.sysbios.family.arm.ducati");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore", "ti.sysbios.family.arm.ducati")).findStrict("PARAMS", "ti.sysbios.family.arm.ducati");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp", "ti.sysbios.family.arm.ducati")).findStrict("PARAMS", "ti.sysbios.family.arm.ducati");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.ducati.Timer", "ti.sysbios.family.arm.ducati")).findStrict("PARAMS", "ti.sysbios.family.arm.ducati");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.Core", "ti.sysbios.family.arm.ducati"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.CTM", "ti.sysbios.family.arm.ducati"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore", "ti.sysbios.family.arm.ducati"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp", "ti.sysbios.family.arm.ducati"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.Timer", "ti.sysbios.family.arm.ducati"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.TimerSupport", "ti.sysbios.family.arm.ducati"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider", "ti.sysbios.family.arm.ducati"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.ducati.Wugen", "ti.sysbios.family.arm.ducati"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateDualCore", "ti.sysbios.family.arm.ducati");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.GateSmp", "ti.sysbios.family.arm.ducati");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.Timer", "ti.sysbios.family.arm.ducati");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Device", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitDevice", "structName", "DeviceView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.ducati.TimestampProvider", "ti.sysbios.family.arm.ducati");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.Core")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.CTM")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.GateDualCore")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.GateSmp")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.Timer")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.TimerSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.TimestampProvider")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.ducati.Wugen")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.ducati")).add(pkgV);
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
        Core$$OBJECTS();
        CTM$$OBJECTS();
        GateDualCore$$OBJECTS();
        GateSmp$$OBJECTS();
        Timer$$OBJECTS();
        TimerSupport$$OBJECTS();
        TimestampProvider$$OBJECTS();
        Wugen$$OBJECTS();
        Core$$CONSTS();
        CTM$$CONSTS();
        GateDualCore$$CONSTS();
        GateSmp$$CONSTS();
        Timer$$CONSTS();
        TimerSupport$$CONSTS();
        TimestampProvider$$CONSTS();
        Wugen$$CONSTS();
        Core$$CREATES();
        CTM$$CREATES();
        GateDualCore$$CREATES();
        GateSmp$$CREATES();
        Timer$$CREATES();
        TimerSupport$$CREATES();
        TimestampProvider$$CREATES();
        Wugen$$CREATES();
        Core$$FUNCTIONS();
        CTM$$FUNCTIONS();
        GateDualCore$$FUNCTIONS();
        GateSmp$$FUNCTIONS();
        Timer$$FUNCTIONS();
        TimerSupport$$FUNCTIONS();
        TimestampProvider$$FUNCTIONS();
        Wugen$$FUNCTIONS();
        Core$$SIZES();
        CTM$$SIZES();
        GateDualCore$$SIZES();
        GateSmp$$SIZES();
        Timer$$SIZES();
        TimerSupport$$SIZES();
        TimestampProvider$$SIZES();
        Wugen$$SIZES();
        Core$$TYPES();
        CTM$$TYPES();
        GateDualCore$$TYPES();
        GateSmp$$TYPES();
        Timer$$TYPES();
        TimerSupport$$TYPES();
        TimestampProvider$$TYPES();
        Wugen$$TYPES();
        if (isROV) {
            Core$$ROV();
            CTM$$ROV();
            GateDualCore$$ROV();
            GateSmp$$ROV();
            Timer$$ROV();
            TimerSupport$$ROV();
            TimestampProvider$$ROV();
            Wugen$$ROV();
        }//isROV
        $$SINGLETONS();
        Core$$SINGLETONS();
        CTM$$SINGLETONS();
        GateDualCore$$SINGLETONS();
        GateSmp$$SINGLETONS();
        Timer$$SINGLETONS();
        TimerSupport$$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        Wugen$$SINGLETONS();
        $$INITIALIZATION();
    }
}
