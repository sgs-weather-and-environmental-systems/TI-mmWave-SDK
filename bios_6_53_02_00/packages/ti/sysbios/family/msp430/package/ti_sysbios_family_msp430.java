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

public class ti_sysbios_family_msp430
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
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.msp430", new Value.Obj("ti.sysbios.family.msp430", pkgP));
    }

    void Hwi$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Hwi.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.msp430.Hwi", new Value.Obj("ti.sysbios.family.msp430.Hwi", po));
        pkgV.bind("Hwi", vo);
        // decls 
        om.bind("ti.sysbios.family.msp430.Hwi.HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.msp430"));
        om.bind("ti.sysbios.family.msp430.Hwi.MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.msp430"));
        om.bind("ti.sysbios.family.msp430.Hwi.StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.msp430"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Hwi$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Hwi.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Hwi$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Hwi.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Hwi$$InterruptObj", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Hwi.InterruptObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Hwi$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Hwi.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Hwi$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Hwi.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.msp430.Hwi.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Hwi$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Hwi.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Hwi$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Hwi.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.msp430.Hwi.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.msp430.Hwi.Object", om.findStrict("ti.sysbios.family.msp430.Hwi.Instance_State", "ti.sysbios.family.msp430"));
        }//isROV
    }

    void IntrinsicsSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.IntrinsicsSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.msp430.IntrinsicsSupport", new Value.Obj("ti.sysbios.family.msp430.IntrinsicsSupport", po));
        pkgV.bind("IntrinsicsSupport", vo);
        // decls 
    }

    void TaskSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.TaskSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.msp430.TaskSupport", new Value.Obj("ti.sysbios.family.msp430.TaskSupport", po));
        pkgV.bind("TaskSupport", vo);
        // decls 
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.msp430.Timer", new Value.Obj("ti.sysbios.family.msp430.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.family.msp430.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.msp430"));
        om.bind("ti.sysbios.family.msp430.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.msp430"));
        om.bind("ti.sysbios.family.msp430.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.msp430"));
        om.bind("ti.sysbios.family.msp430.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.msp430"));
        om.bind("ti.sysbios.family.msp430.Timer.Source", new Proto.Enm("ti.sysbios.family.msp430.Timer.Source"));
        om.bind("ti.sysbios.family.msp430.Timer.ID", new Proto.Enm("ti.sysbios.family.msp430.Timer.ID"));
        om.bind("ti.sysbios.family.msp430.Timer.IDEX", new Proto.Enm("ti.sysbios.family.msp430.Timer.IDEX"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer$$Control", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Timer.Control", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer$$DeviceView", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Timer.DeviceView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Timer.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer$$TimerDevice", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Timer.TimerDevice", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.msp430.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.msp430.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.msp430.Timer.Object", om.findStrict("ti.sysbios.family.msp430.Timer.Instance_State", "ti.sysbios.family.msp430"));
        }//isROV
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.msp430.TimestampProvider", new Value.Obj("ti.sysbios.family.msp430.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
        om.bind("ti.sysbios.family.msp430.TimestampProvider.Source", new Proto.Enm("ti.sysbios.family.msp430.TimestampProvider.Source"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.TimestampProvider$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.TimestampProvider.Module_State", new Proto.Str(spo, false));
    }

    void Power$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Power.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.msp430.Power", new Value.Obj("ti.sysbios.family.msp430.Power", po));
        pkgV.bind("Power", vo);
        // decls 
        om.bind("ti.sysbios.family.msp430.Power.IdleMode", new Proto.Enm("ti.sysbios.family.msp430.Power.IdleMode"));
        om.bind("ti.sysbios.family.msp430.Power.SleepMode", new Proto.Enm("ti.sysbios.family.msp430.Power.SleepMode"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Power$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.msp430.Power.Module_State", new Proto.Str(spo, false));
    }

    void ClockFreqs$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.ClockFreqs.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.msp430.ClockFreqs", new Value.Obj("ti.sysbios.family.msp430.ClockFreqs", po));
        pkgV.bind("ClockFreqs", vo);
        // decls 
        om.bind("ti.sysbios.family.msp430.ClockFreqs.Clock", new Proto.Enm("ti.sysbios.family.msp430.ClockFreqs.Clock"));
    }

    void Settings$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.msp430.Settings.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.msp430.Settings", new Value.Obj("ti.sysbios.family.msp430.Settings", po));
        pkgV.bind("Settings", vo);
        // decls 
    }

    void Hwi$$CONSTS()
    {
        // module Hwi
        om.bind("ti.sysbios.family.msp430.Hwi.getStackInfo", new Extern("ti_sysbios_family_msp430_Hwi_getStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.getCoreStackInfo", new Extern("ti_sysbios_family_msp430_Hwi_getCoreStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.startup", new Extern("ti_sysbios_family_msp430_Hwi_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.switchFromBootStack", new Extern("ti_sysbios_family_msp430_Hwi_switchFromBootStack__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.post", new Extern("ti_sysbios_family_msp430_Hwi_post__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.getTaskSP", new Extern("ti_sysbios_family_msp430_Hwi_getTaskSP__E", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.disableInterrupt", new Extern("ti_sysbios_family_msp430_Hwi_disableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.enableInterrupt", new Extern("ti_sysbios_family_msp430_Hwi_enableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.restoreInterrupt", new Extern("ti_sysbios_family_msp430_Hwi_restoreInterrupt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.clearInterrupt", new Extern("ti_sysbios_family_msp430_Hwi_clearInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.logBegin", new Extern("ti_sysbios_family_msp430_Hwi_logBegin__E", "xdc_Void(*)(xdc_runtime_Log_Event,xdc_IArg,xdc_IArg,xdc_IArg,xdc_IArg,xdc_IArg)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.logEnd", new Extern("ti_sysbios_family_msp430_Hwi_logEnd__E", "xdc_Void(*)(xdc_runtime_Log_Event,xdc_IArg)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.postInit", new Extern("ti_sysbios_family_msp430_Hwi_postInit__I", "xdc_Int(*)(ti_sysbios_family_msp430_Hwi_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.msp430.Hwi.init", new Extern("ti_sysbios_family_msp430_Hwi_init__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void IntrinsicsSupport$$CONSTS()
    {
        // module IntrinsicsSupport
        om.bind("ti.sysbios.family.msp430.IntrinsicsSupport.maxbit", new Extern("ti_sysbios_family_msp430_IntrinsicsSupport_maxbit__E", "xdc_UInt(*)(xdc_UInt)", true, false));
    }

    void TaskSupport$$CONSTS()
    {
        // module TaskSupport
        om.bind("ti.sysbios.family.msp430.TaskSupport.start", new Extern("ti_sysbios_family_msp430_TaskSupport_start__E", "xdc_Ptr(*)(xdc_Ptr,xdc_Void(*)(xdc_Void),xdc_Void(*)(xdc_Void),xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.msp430.TaskSupport.swap", new Extern("ti_sysbios_family_msp430_TaskSupport_swap__E", "xdc_Void(*)(xdc_Ptr*,xdc_Ptr*)", true, false));
        om.bind("ti.sysbios.family.msp430.TaskSupport.checkStack", new Extern("ti_sysbios_family_msp430_TaskSupport_checkStack__E", "xdc_Bool(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.msp430.TaskSupport.stackUsed", new Extern("ti_sysbios_family_msp430_TaskSupport_stackUsed__E", "xdc_SizeT(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.msp430.TaskSupport.getStackAlignment", new Extern("ti_sysbios_family_msp430_TaskSupport_getStackAlignment__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.TaskSupport.getDefaultStackSize", new Extern("ti_sysbios_family_msp430_TaskSupport_getDefaultStackSize__E", "xdc_SizeT(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.TaskSupport.getCheckValueAddr", new Extern("ti_sysbios_family_msp430_TaskSupport_getCheckValueAddr__E", "xdc_Ptr(*)(xdc_Ptr)", true, false));
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.family.msp430.Timer.Source_ACLK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.Source", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.Source_ACLK", xdc.services.intern.xsr.Enum.intValue(0x100L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.Source_SMCLK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.Source", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.Source_SMCLK", xdc.services.intern.xsr.Enum.intValue(0x200L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.Source_EXTERNAL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.Source", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.Source_EXTERNAL", xdc.services.intern.xsr.Enum.intValue(0x000L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.Source_EXTERNAL_INVERTED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.Source", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.Source_EXTERNAL_INVERTED", xdc.services.intern.xsr.Enum.intValue(0x300L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.ID_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.ID", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.ID_1", xdc.services.intern.xsr.Enum.intValue(0x0L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.ID_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.ID", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.ID_2", xdc.services.intern.xsr.Enum.intValue(0x40L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.ID_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.ID", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.ID_4", xdc.services.intern.xsr.Enum.intValue(0x80L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.ID_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.ID", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.ID_8", xdc.services.intern.xsr.Enum.intValue(0xC0L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.IDEX_1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.IDEX_1", xdc.services.intern.xsr.Enum.intValue(0x0L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.IDEX_2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.IDEX_2", xdc.services.intern.xsr.Enum.intValue(0x1L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.IDEX_3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.IDEX_3", xdc.services.intern.xsr.Enum.intValue(0x2L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.IDEX_4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.IDEX_4", xdc.services.intern.xsr.Enum.intValue(0x3L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.IDEX_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.IDEX_5", xdc.services.intern.xsr.Enum.intValue(0x4L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.IDEX_6", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.IDEX_6", xdc.services.intern.xsr.Enum.intValue(0x5L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.IDEX_7", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.IDEX_7", xdc.services.intern.xsr.Enum.intValue(0x6L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.IDEX_8", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Timer.IDEX_8", xdc.services.intern.xsr.Enum.intValue(0x7L)+0));
        om.bind("ti.sysbios.family.msp430.Timer.MAX_PERIOD", 0x0000ffffL);
        om.bind("ti.sysbios.family.msp430.Timer.MIN_SWEEP_PERIOD", 1L);
        om.bind("ti.sysbios.family.msp430.Timer.getNumTimers", new Extern("ti_sysbios_family_msp430_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.getStatus", new Extern("ti_sysbios_family_msp430_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.startup", new Extern("ti_sysbios_family_msp430_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.oneShotStub", new Extern("ti_sysbios_family_msp430_Timer_oneShotStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.oneShotNestStub", new Extern("ti_sysbios_family_msp430_Timer_oneShotNestStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.periodicStub", new Extern("ti_sysbios_family_msp430_Timer_periodicStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.periodicNestStub", new Extern("ti_sysbios_family_msp430_Timer_periodicNestStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.getHandle", new Extern("ti_sysbios_family_msp430_Timer_getHandle__E", "ti_sysbios_family_msp430_Timer_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.getAvailMask", new Extern("ti_sysbios_family_msp430_Timer_getAvailMask__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.initDevice", new Extern("ti_sysbios_family_msp430_Timer_initDevice__I", "xdc_Void(*)(ti_sysbios_family_msp430_Timer_Object*)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.postInit", new Extern("ti_sysbios_family_msp430_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_family_msp430_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.msp430.Timer.checkOverflow", new Extern("ti_sysbios_family_msp430_Timer_checkOverflow__I", "xdc_Bool(*)(xdc_UInt32,xdc_UInt32)", true, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.family.msp430.TimestampProvider.Source_ACLK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Source", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.TimestampProvider.Source_ACLK", 0));
        om.bind("ti.sysbios.family.msp430.TimestampProvider.Source_SMCLK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Source", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.TimestampProvider.Source_SMCLK", 1));
        om.bind("ti.sysbios.family.msp430.TimestampProvider.get32", new Extern("ti_sysbios_family_msp430_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.TimestampProvider.get64", new Extern("ti_sysbios_family_msp430_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.family.msp430.TimestampProvider.getFreq", new Extern("ti_sysbios_family_msp430_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
        om.bind("ti.sysbios.family.msp430.TimestampProvider.get16", new Extern("ti_sysbios_family_msp430_TimestampProvider_get16__E", "xdc_Bits16(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.TimestampProvider.startTimer", new Extern("ti_sysbios_family_msp430_TimestampProvider_startTimer__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.TimestampProvider.rolloverFunc", new Extern("ti_sysbios_family_msp430_TimestampProvider_rolloverFunc__E", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void Power$$CONSTS()
    {
        // module Power
        om.bind("ti.sysbios.family.msp430.Power.LPM0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Power.IdleMode", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Power.LPM0", xdc.services.intern.xsr.Enum.intValue(0x10L)+0));
        om.bind("ti.sysbios.family.msp430.Power.LPM1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Power.IdleMode", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Power.LPM1", xdc.services.intern.xsr.Enum.intValue(0x50L)+0));
        om.bind("ti.sysbios.family.msp430.Power.LPM2", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Power.IdleMode", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Power.LPM2", xdc.services.intern.xsr.Enum.intValue(0x90L)+0));
        om.bind("ti.sysbios.family.msp430.Power.LPM3", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Power.IdleMode", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Power.LPM3", xdc.services.intern.xsr.Enum.intValue(0xD0L)+0));
        om.bind("ti.sysbios.family.msp430.Power.LPM4", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Power.IdleMode", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Power.LPM4", xdc.services.intern.xsr.Enum.intValue(0xF0L)+0));
        om.bind("ti.sysbios.family.msp430.Power.Sleep_LPM4_5", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.Power.SleepMode", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.Power.Sleep_LPM4_5", 0));
        om.bind("ti.sysbios.family.msp430.Power.idleCPU", new Extern("ti_sysbios_family_msp430_Power_idleCPU__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Power.changeIdleMode", new Extern("ti_sysbios_family_msp430_Power_changeIdleMode__E", "xdc_Void(*)(ti_sysbios_family_msp430_Power_IdleMode)", true, false));
        om.bind("ti.sysbios.family.msp430.Power.sleepCPU", new Extern("ti_sysbios_family_msp430_Power_sleepCPU__E", "xdc_Void(*)(ti_sysbios_family_msp430_Power_SleepMode)", true, false));
        om.bind("ti.sysbios.family.msp430.Power.wakeCPU", new Extern("ti_sysbios_family_msp430_Power_wakeCPU__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Power.getModeChangeFlag", new Extern("ti_sysbios_family_msp430_Power_getModeChangeFlag__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Power.defaultSleepPrepFunction", new Extern("ti_sysbios_family_msp430_Power_defaultSleepPrepFunction__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.msp430.Power.blockedTaskFunction", new Extern("ti_sysbios_family_msp430_Power_blockedTaskFunction__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void ClockFreqs$$CONSTS()
    {
        // module ClockFreqs
        om.bind("ti.sysbios.family.msp430.ClockFreqs.Clock_ACLK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.ClockFreqs.Clock", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.ClockFreqs.Clock_ACLK", 0));
        om.bind("ti.sysbios.family.msp430.ClockFreqs.Clock_SMCLK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.ClockFreqs.Clock", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.ClockFreqs.Clock_SMCLK", 1));
        om.bind("ti.sysbios.family.msp430.ClockFreqs.Clock_MCLK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.msp430.ClockFreqs.Clock", "ti.sysbios.family.msp430"), "ti.sysbios.family.msp430.ClockFreqs.Clock_MCLK", 2));
        om.bind("ti.sysbios.family.msp430.ClockFreqs.getFrequency", new Extern("ti_sysbios_family_msp430_ClockFreqs_getFrequency__E", "xdc_UInt32(*)(ti_sysbios_family_msp430_ClockFreqs_Clock)", true, false));
    }

    void Settings$$CONSTS()
    {
        // module Settings
    }

    void Hwi$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$msp430$Hwi$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.msp430.Hwi.create() called before xdc.useModule('ti.sysbios.family.msp430.Hwi')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.intNum, inst.$args.hwiFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.msp430.Hwi$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.msp430.Hwi.Module", "ti.sysbios.family.msp430"), om.findStrict("ti.sysbios.family.msp430.Hwi.Instance", "ti.sysbios.family.msp430"), 3, 2, false));
                        fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.msp430.Hwi.Params", "ti.sysbios.family.msp430"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$msp430$Hwi$$create = function( intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.msp430.Hwi'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.msp430.Hwi.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.msp430']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.msp430.Hwi'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [intNum, hwiFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.msp430.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.msp430.Hwi$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.msp430.Hwi.Module", "ti.sysbios.family.msp430"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.msp430.Hwi$$Object", "ti.sysbios.family.msp430"), null);
                        fxn.addArg(1, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.msp430.Hwi.Params", "ti.sysbios.family.msp430"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$msp430$Hwi$$construct = function( __obj, intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.msp430.Hwi'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.msp430.Hwi'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.msp430.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void IntrinsicsSupport$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TaskSupport$$CREATES()
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
            sb.append("ti$sysbios$family$msp430$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.msp430.Timer.create() called before xdc.useModule('ti.sysbios.family.msp430.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.msp430.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.msp430.Timer.Module", "ti.sysbios.family.msp430"), om.findStrict("ti.sysbios.family.msp430.Timer.Instance", "ti.sysbios.family.msp430"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.Params", "ti.sysbios.family.msp430"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$msp430$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.msp430.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.msp430.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.msp430']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.msp430.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.msp430.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.msp430.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.msp430.Timer.Module", "ti.sysbios.family.msp430"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer$$Object", "ti.sysbios.family.msp430"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.Params", "ti.sysbios.family.msp430"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$msp430$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.msp430.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.msp430.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.msp430.Timer'].__initObject(__inst);\n");
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

    void Power$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void ClockFreqs$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Settings$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Hwi$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Hwi.inUseMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.msp430.Hwi$$inUseMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.msp430.Hwi.Module", "ti.sysbios.family.msp430"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
        // fxn Hwi.plugMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.msp430.Hwi$$plugMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.msp430.Hwi.Module", "ti.sysbios.family.msp430"), null, 2, 2, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "fxn", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF);
    }

    void IntrinsicsSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TaskSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TimestampProvider$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Power$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void ClockFreqs$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Settings$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Hwi$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.msp430.Hwi.Instance_State", "ti.sysbios.family.msp430");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("intNum", "TInt"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("hookEnv", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.msp430.Hwi.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.msp430.Hwi.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.msp430.Hwi.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.msp430.Hwi.Module_State", "ti.sysbios.family.msp430");
        sizes.clear();
        sizes.add(Global.newArray("taskSP", "UPtr"));
        sizes.add(Global.newArray("isrStack", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.msp430.Hwi.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.msp430.Hwi.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.msp430.Hwi.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void IntrinsicsSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void TaskSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Timer$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.msp430.Timer.Control", "ti.sysbios.family.msp430");
        sizes.clear();
        sizes.add(Global.newArray("source", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.msp430.Timer.Control']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.msp430.Timer.Control']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.msp430.Timer.Control'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.msp430.Timer.TimerDevice", "ti.sysbios.family.msp430");
        sizes.clear();
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("baseAddr", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.msp430.Timer.TimerDevice']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.msp430.Timer.TimerDevice']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.msp430.Timer.TimerDevice'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.msp430.Timer.Instance_State", "ti.sysbios.family.msp430");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("staticInst", "UShort"));
        sizes.add(Global.newArray("id", "TInt"));
        sizes.add(Global.newArray("controlRegInit", "UInt"));
        sizes.add(Global.newArray("runMode", "Nti.sysbios.interfaces.ITimer.RunMode;;;;"));
        sizes.add(Global.newArray("startMode", "Nti.sysbios.interfaces.ITimer.StartMode;;;"));
        sizes.add(Global.newArray("period", "UInt"));
        sizes.add(Global.newArray("periodType", "Nti.sysbios.interfaces.ITimer.PeriodType;;;"));
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("tickFxn", "UFxn"));
        sizes.add(Global.newArray("frequency", "Sxdc.runtime.Types;FreqHz"));
        sizes.add(Global.newArray("hwi", "UPtr"));
        sizes.add(Global.newArray("prevThreshold", "UInt"));
        sizes.add(Global.newArray("savedCurrCount", "UInt"));
        sizes.add(Global.newArray("rollovers", "UInt32"));
        sizes.add(Global.newArray("synchronous", "UShort"));
        sizes.add(Global.newArray("inputDivider", "UInt"));
        sizes.add(Global.newArray("inputDividerExp", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.msp430.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.msp430.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.msp430.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.msp430.Timer.Module_State", "ti.sysbios.family.msp430");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "UInt"));
        sizes.add(Global.newArray("device", "UPtr"));
        sizes.add(Global.newArray("handles", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.msp430.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.msp430.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.msp430.Timer.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimestampProvider$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Module_State", "ti.sysbios.family.msp430");
        sizes.clear();
        sizes.add(Global.newArray("timer", "UPtr"));
        sizes.add(Global.newArray("rollovers", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.msp430.TimestampProvider.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.msp430.TimestampProvider.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.msp430.TimestampProvider.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Power$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.msp430.Power.Module_State", "ti.sysbios.family.msp430");
        sizes.clear();
        sizes.add(Global.newArray("idleMode", "UInt"));
        sizes.add(Global.newArray("newMode", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.msp430.Power.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.msp430.Power.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.msp430.Power.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void ClockFreqs$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Settings$$SIZES()
    {
    }

    void Hwi$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/msp430/Hwi.xs");
        om.bind("ti.sysbios.family.msp430.Hwi$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi.Module", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Hwi.Module", om.findStrict("ti.sysbios.interfaces.IHwi.Module", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "r");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.msp430"), $$UNDEF, "wh");
            po.addFld("LM_begin", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.msp430"), Global.newObject("mask", Global.eval("0x0100 | 0x0200"), "msg", "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"), "w");
            po.addFld("LD_end", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.msp430"), Global.newObject("mask", 0x0200L, "msg", "LD_end: hwi: 0x%x"), "w");
            po.addFld("A_unsupportedMaskingOption", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.msp430"), Global.newObject("msg", "A_unsupportedMaskingOption: unsupported maskSetting."), "w");
            po.addFld("E_alreadyDefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.msp430"), Global.newObject("msg", "E_alreadyDefined: Hwi already defined: intr# %d"), "w");
            po.addFld("E_notImplemented", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.msp430"), Global.newObject("msg", "E_notImplemented: Function not implemented: %s"), "w");
            po.addFld("fillVectors", $$T_Bool, true, "wh");
            po.addFld("resetFunc", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "wh");
            po.addFld("alwaysWake", $$T_Bool, false, "wh");
            po.addFld("alwaysLog", $$T_Bool, false, "wh");
            po.addFld("hooks", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.msp430.Hwi.HookSet", "ti.sysbios.family.msp430"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("interrupt", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.msp430.Hwi.InterruptObj", "ti.sysbios.family.msp430"), false), $$DEFAULT, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.msp430.Hwi$$create", "ti.sysbios.family.msp430"), Global.get("ti$sysbios$family$msp430$Hwi$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.msp430.Hwi$$construct", "ti.sysbios.family.msp430"), Global.get("ti$sysbios$family$msp430$Hwi$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Hwi$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Hwi$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Hwi$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Hwi$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Hwi$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Hwi$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "addHookSet");
                if (fxn != null) po.addFxn("addHookSet", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$addHookSet", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "viewGetStackInfo");
                if (fxn != null) po.addFxn("viewGetStackInfo", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$viewGetStackInfo", "ti.sysbios.family.msp430"), fxn);
                po.addFxn("inUseMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.msp430.Hwi$$inUseMeta", "ti.sysbios.family.msp430"), Global.get(cap, "inUseMeta"));
                po.addFxn("plugMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.msp430.Hwi$$plugMeta", "ti.sysbios.family.msp430"), Global.get(cap, "plugMeta"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi.Instance", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Hwi.Instance", om.findStrict("ti.sysbios.interfaces.IHwi.Instance", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.msp430"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_ALL"), "w");
            po.addFld("swiEnabled", $$T_Bool, true, "wh");
            po.addFld("taskEnabled", $$T_Bool, true, "wh");
            po.addFld("isrStackEnabled", $$T_Bool, true, "wh");
            po.addFld("nestingEnabled", $$T_Bool, false, "wh");
            po.addFld("loggingEnabled", $$T_Bool, false, "wh");
            po.addFld("threadTypeEnabled", $$T_Bool, true, "wh");
            po.addFld("keepAwakeEnabled", $$T_Bool, false, "wh");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.msp430"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$Params", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Hwi.Params", om.findStrict("ti.sysbios.interfaces.IHwi$$Params", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("maskSetting", (Proto)om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.msp430"), om.find("ti.sysbios.interfaces.IHwi.MaskingOption_ALL"), "w");
            po.addFld("swiEnabled", $$T_Bool, true, "wh");
            po.addFld("taskEnabled", $$T_Bool, true, "wh");
            po.addFld("isrStackEnabled", $$T_Bool, true, "wh");
            po.addFld("nestingEnabled", $$T_Bool, false, "wh");
            po.addFld("loggingEnabled", $$T_Bool, false, "wh");
            po.addFld("threadTypeEnabled", $$T_Bool, true, "wh");
            po.addFld("keepAwakeEnabled", $$T_Bool, false, "wh");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.msp430"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$Object", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Hwi.Object", om.findStrict("ti.sysbios.family.msp430.Hwi.Instance", "ti.sysbios.family.msp430"));
        // typedef Hwi.VectorFuncPtr
        om.bind("ti.sysbios.family.msp430.Hwi.VectorFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Hwi.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$BasicView", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Hwi.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Hwi.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$ModuleView", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Hwi.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("options", new Proto.Arr($$T_Str, false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("hwiStackPeak", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Hwi.InterruptObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$InterruptObj", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Hwi.InterruptObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("generateStub", $$T_Bool, $$UNDEF, "w");
                po.addFld("swiEnabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("taskEnabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("nestingEnabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("isrStackEnabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("lmBeginEnabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("ldEndEnabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("threadTypeEnabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("keepAwakeEnabled", $$T_Bool, $$UNDEF, "w");
                po.addFld("handle", $$T_Str, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("pfxn", new Proto.Adr("xdc_Fxn", "Pf"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
        // struct Hwi.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$Instance_State", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Hwi.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hookEnv", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
        // struct Hwi.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$Module_State", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Hwi.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("taskSP", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("isrStack", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
    }

    void IntrinsicsSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.IntrinsicsSupport.Module", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.IntrinsicsSupport.Module", om.findStrict("ti.sysbios.interfaces.IIntrinsicsSupport.Module", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void TaskSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/msp430/TaskSupport.xs");
        om.bind("ti.sysbios.family.msp430.TaskSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.TaskSupport.Module", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.TaskSupport.Module", om.findStrict("ti.sysbios.interfaces.ITaskSupport.Module", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("defaultStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 512L, "r");
            po.addFld("stackAlignment", Proto.Elm.newCNum("(xdc_UInt)"), 2L, "r");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.TaskSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.TaskSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.TaskSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.TaskSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "stackUsed$view");
                if (fxn != null) po.addFxn("stackUsed$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$stackUsed$view", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getCallStack$view");
                if (fxn != null) po.addFxn("getCallStack$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$getCallStack$view", "ti.sysbios.family.msp430"), fxn);
    }

    void Timer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/msp430/Timer.xs");
        om.bind("ti.sysbios.family.msp430.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer.Module", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0x0000ffffL, "rh");
                po.addFld("MIN_SWEEP_PERIOD", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("supportsDynamic", $$T_Bool, true, "wh");
            po.addFld("defaultDynamic", $$T_Bool, false, "wh");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.msp430"), $$UNDEF, "wh");
            po.addFld("E_invalidTimer", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.msp430"), Global.newObject("msg", "E_invalidTimer: Invalid Timer Id %d"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.msp430"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.msp430"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period %d"), "w");
            po.addFld("E_runtimeCreate", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.msp430"), Global.newObject("msg", "E_runtimeCreate: Runtime Timer create is not supported %d"), "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x7L, "w");
            po.addFld("keepAwake", $$T_Bool, false, "w");
            po.addFld("startupNeeded", Proto.Elm.newCNum("(xdc_UInt)"), false, "w");
            po.addFld("numTimerDevices", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.msp430.Timer$$create", "ti.sysbios.family.msp430"), Global.get("ti$sysbios$family$msp430$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.msp430.Timer$$construct", "ti.sysbios.family.msp430"), Global.get("ti$sysbios$family$msp430$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.family.msp430"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer.Instance", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0x0000ffffL, "rh");
                po.addFld("MIN_SWEEP_PERIOD", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_msp430_Hwi_Params*", "PS"), null, "w");
            po.addFld("clockSource", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.Source", "ti.sysbios.family.msp430"), om.find("ti.sysbios.family.msp430.Timer.Source_ACLK"), "w");
            po.addFld("synchronous", $$T_Bool, false, "w");
            po.addFld("inputDivider", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.ID", "ti.sysbios.family.msp430"), om.find("ti.sysbios.family.msp430.Timer.ID_1"), "w");
            po.addFld("inputDividerExp", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), om.find("ti.sysbios.family.msp430.Timer.IDEX_1"), "w");
            po.addFld("nesting", $$T_Bool, false, "w");
            po.addFld("prevThreshold", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
            po.addFld("controlRegInit", Proto.Elm.newCNum("(xdc_UInt)"), om.find("ti.sysbios.family.msp430.Timer.Source_ACLK"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.msp430"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$Params", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0x0000ffffL, "rh");
                po.addFld("MIN_SWEEP_PERIOD", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_msp430_Hwi_Params*", "PS"), null, "w");
            po.addFld("clockSource", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.Source", "ti.sysbios.family.msp430"), om.find("ti.sysbios.family.msp430.Timer.Source_ACLK"), "w");
            po.addFld("synchronous", $$T_Bool, false, "w");
            po.addFld("inputDivider", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.ID", "ti.sysbios.family.msp430"), om.find("ti.sysbios.family.msp430.Timer.ID_1"), "w");
            po.addFld("inputDividerExp", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"), om.find("ti.sysbios.family.msp430.Timer.IDEX_1"), "w");
            po.addFld("nesting", $$T_Bool, false, "w");
            po.addFld("prevThreshold", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
            po.addFld("controlRegInit", Proto.Elm.newCNum("(xdc_UInt)"), om.find("ti.sysbios.family.msp430.Timer.Source_ACLK"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.msp430"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$Object", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.Object", om.findStrict("ti.sysbios.family.msp430.Timer.Instance", "ti.sysbios.family.msp430"));
        // struct Timer.Control
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$Control", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.Control", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("source", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$BasicView", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halTimerHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("configuration", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.Control", "ti.sysbios.family.msp430"), $$DEFAULT, "w");
                po.addFld("startMode", $$T_Str, $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", $$T_Str, $$UNDEF, "w");
                po.addFld("synchronous", $$T_Bool, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("frequency", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("hwiHandle", $$T_Str, $$UNDEF, "w");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct Timer.DeviceView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$DeviceView", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.DeviceView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("device", $$T_Str, $$UNDEF, "w");
                po.addFld("devAddr", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("currCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("remainingCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("prevThreshold", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("state", $$T_Str, $$UNDEF, "w");
        // struct Timer.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$ModuleView", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("availMask", $$T_Str, $$UNDEF, "w");
        // struct Timer.TimerDevice
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$TimerDevice", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.TimerDevice", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("baseAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Timer.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$Instance_State", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("staticInst", $$T_Bool, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("controlRegInit", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.msp430"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.msp430"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.msp430"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("frequency", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.msp430"), $$DEFAULT, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.family.msp430.Hwi.Handle", "ti.sysbios.family.msp430"), $$UNDEF, "w");
                po.addFld("prevThreshold", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("savedCurrCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("rollovers", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("synchronous", $$T_Bool, $$UNDEF, "w");
                po.addFld("inputDivider", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("inputDividerExp", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$Module_State", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("device", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.msp430.Timer.TimerDevice", "ti.sysbios.family.msp430"), false), $$DEFAULT, "w");
                po.addFld("handles", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.msp430.Timer.Handle", "ti.sysbios.family.msp430"), false), $$DEFAULT, "w");
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/msp430/TimestampProvider.xs");
        om.bind("ti.sysbios.family.msp430.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Module", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("timerId", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "w");
            po.addFld("useClockTimer", $$T_Bool, $$UNDEF, "w");
            po.addFld("clockSource", (Proto)om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Source", "ti.sysbios.family.msp430"), om.find("ti.sysbios.family.msp430.TimestampProvider.Source_ACLK"), "w");
            po.addFld("synchronize", $$T_Bool, false, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.family.msp430"), fxn);
        // struct TimestampProvider.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.TimestampProvider$$Module_State", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.TimestampProvider.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("timer", (Proto)om.findStrict("ti.sysbios.family.msp430.Timer.Handle", "ti.sysbios.family.msp430"), $$UNDEF, "w");
                po.addFld("rollovers", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
    }

    void Power$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/msp430/Power.xs");
        om.bind("ti.sysbios.family.msp430.Power$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Power.Module", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Power.Module", om.findStrict("ti.sysbios.interfaces.IPower.Module", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("E_dynamicModeNotAllowed", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.msp430"), Global.newObject("msg", "E_dynamicModeNotAllowed: Dynamic mode is not enabled (allowDynamicMode=false)"), "w");
            po.addFld("idle", $$T_Bool, true, "w");
            po.addFld("idleMode", (Proto)om.findStrict("ti.sysbios.family.msp430.Power.IdleMode", "ti.sysbios.family.msp430"), om.find("ti.sysbios.family.msp430.Power.LPM0"), "w");
            po.addFld("allowDynamicMode", $$T_Bool, false, "w");
            po.addFld("sleepPrepFunction", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Power$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Power$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Power$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Power$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // typedef Power.SleepPrepFuncPtr
        om.bind("ti.sysbios.family.msp430.Power.SleepPrepFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Power.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Power$$Module_State", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Power.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("idleMode", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("newMode", $$T_Bool, $$UNDEF, "w");
    }

    void ClockFreqs$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/msp430/ClockFreqs.xs");
        om.bind("ti.sysbios.family.msp430.ClockFreqs$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.ClockFreqs.Module", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.ClockFreqs.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("ACLK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("SMCLK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.ClockFreqs$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.ClockFreqs$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.ClockFreqs$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.ClockFreqs$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Settings$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/msp430/Settings.xs");
        om.bind("ti.sysbios.family.msp430.Settings$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Settings.Module", "ti.sysbios.family.msp430");
        po.init("ti.sysbios.family.msp430.Settings.Module", om.findStrict("ti.sysbios.interfaces.ISettings.Module", "ti.sysbios.family.msp430"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Settings$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Settings$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.msp430.Settings$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getDefaultCoreDelegate");
                if (fxn != null) po.addFxn("getDefaultCoreDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultCoreDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultHwiDelegate");
                if (fxn != null) po.addFxn("getDefaultHwiDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultHwiDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultTimerDelegate");
                if (fxn != null) po.addFxn("getDefaultTimerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimerDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultClockTimerDelegate");
                if (fxn != null) po.addFxn("getDefaultClockTimerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultClockTimerDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultTimerSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultTimerSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimerSupportDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultTimestampDelegate");
                if (fxn != null) po.addFxn("getDefaultTimestampDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimestampDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultTaskSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultTaskSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTaskSupportDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultIntrinsicsSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultIntrinsicsSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultIntrinsicsSupportDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultCacheDelegate");
                if (fxn != null) po.addFxn("getDefaultCacheDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultCacheDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultPowerDelegate");
                if (fxn != null) po.addFxn("getDefaultPowerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultPowerDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultSecondsDelegate");
                if (fxn != null) po.addFxn("getDefaultSecondsDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultSecondsDelegate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultBootModule");
                if (fxn != null) po.addFxn("getDefaultBootModule", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultBootModule", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultMmuModule");
                if (fxn != null) po.addFxn("getDefaultMmuModule", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultMmuModule", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getFamilySettingsXml");
                if (fxn != null) po.addFxn("getFamilySettingsXml", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getFamilySettingsXml", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getDefaultClockTickPeriod");
                if (fxn != null) po.addFxn("getDefaultClockTickPeriod", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultClockTickPeriod", "ti.sysbios.family.msp430"), fxn);
    }

    void Hwi$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$Instance_State", "ti.sysbios.family.msp430");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.msp430.Hwi.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$Instance_State", "ti.sysbios.family.msp430");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.msp430.Hwi.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi$$Module_State", "ti.sysbios.family.msp430");
    }

    void IntrinsicsSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.IntrinsicsSupport", "ti.sysbios.family.msp430");
    }

    void TaskSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.TaskSupport", "ti.sysbios.family.msp430");
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.Timer", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$Instance_State", "ti.sysbios.family.msp430");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Control$fetchDesc", Global.newObject("type", "ti.sysbios.family.msp430.Timer.Control", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$Control", "ti.sysbios.family.msp430");
        vo.bind("TimerDevice$fetchDesc", Global.newObject("type", "ti.sysbios.family.msp430.Timer.TimerDevice", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$TimerDevice", "ti.sysbios.family.msp430");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.msp430.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$Instance_State", "ti.sysbios.family.msp430");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.msp430.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer$$Module_State", "ti.sysbios.family.msp430");
        po.bind("device$fetchDesc", Global.newObject("type", "ti.sysbios.family.msp430.Timer.TimerDevice", "isScalar", false));
        po.bind("handles$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.TimestampProvider", "ti.sysbios.family.msp430");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.msp430.TimestampProvider.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.TimestampProvider$$Module_State", "ti.sysbios.family.msp430");
    }

    void Power$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.Power", "ti.sysbios.family.msp430");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.msp430.Power.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Power$$Module_State", "ti.sysbios.family.msp430");
    }

    void ClockFreqs$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.ClockFreqs", "ti.sysbios.family.msp430");
    }

    void Settings$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.msp430.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.msp430"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/msp430/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.msp430"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.msp430"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.msp430", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.msp430");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.msp430.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.msp430'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.msp430$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.msp430$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.msp430$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.msp430.ae430X',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.msp430.ar430XS',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.msp430.ae430X', {target: 'ti.targets.msp430.elf.MSP430X', suffix: 'e430X'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.msp430.ar430XS', {target: 'iar.targets.msp430.MSP430X_small', suffix: 'r430XS'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Hwi$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi.Module", "ti.sysbios.family.msp430");
        vo.init2(po, "ti.sysbios.family.msp430.Hwi", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.msp430.Hwi$$capsule", "ti.sysbios.family.msp430"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.msp430.Hwi.Instance", "ti.sysbios.family.msp430"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.msp430.Hwi.Params", "ti.sysbios.family.msp430"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.msp430.Hwi.Params", "ti.sysbios.family.msp430")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.msp430.Hwi.Handle", "ti.sysbios.family.msp430"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.msp430", "ti.sysbios.family.msp430"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.IHwi.FuncPtr", "ti.sysbios.family.msp430"));
        vo.bind("Irp", om.findStrict("ti.sysbios.interfaces.IHwi.Irp", "ti.sysbios.family.msp430"));
        vo.bind("HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.msp430"));
        vo.bind("MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.msp430"));
        vo.bind("StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.msp430"));
        mcfgs.add("dispatcherAutoNestingSupport");
        mcfgs.add("dispatcherSwiSupport");
        mcfgs.add("dispatcherTaskSupport");
        mcfgs.add("dispatcherIrpTrackingSupport");
        mcfgs.add("NUM_INTERRUPTS");
        vo.bind("VectorFuncPtr", om.findStrict("ti.sysbios.family.msp430.Hwi.VectorFuncPtr", "ti.sysbios.family.msp430"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.msp430.Hwi.BasicView", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Hwi.BasicView", "ti.sysbios.family.msp430"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.msp430.Hwi.ModuleView", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Hwi.ModuleView", "ti.sysbios.family.msp430"));
        mcfgs.add("LM_begin");
        mcfgs.add("LD_end");
        mcfgs.add("A_unsupportedMaskingOption");
        mcfgs.add("E_alreadyDefined");
        mcfgs.add("E_notImplemented");
        mcfgs.add("hooks");
        icfgs.add("hooks");
        vo.bind("InterruptObj", om.findStrict("ti.sysbios.family.msp430.Hwi.InterruptObj", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Hwi.InterruptObj", "ti.sysbios.family.msp430"));
        icfgs.add("interrupt");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.msp430.Hwi.Instance_State", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Hwi.Instance_State", "ti.sysbios.family.msp430"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.msp430.Hwi.Module_State", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Hwi.Module_State", "ti.sysbios.family.msp430"));
        vo.bind("MaskingOption_NONE", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_NONE", "ti.sysbios.family.msp430"));
        vo.bind("MaskingOption_ALL", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_ALL", "ti.sysbios.family.msp430"));
        vo.bind("MaskingOption_SELF", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_SELF", "ti.sysbios.family.msp430"));
        vo.bind("MaskingOption_BITMASK", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_BITMASK", "ti.sysbios.family.msp430"));
        vo.bind("MaskingOption_LOWER", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER", "ti.sysbios.family.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.msp430")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.msp430.Hwi$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$msp430$Hwi$$__initObject"));
        }//isCFG
        vo.bind("getStackInfo", om.findStrict("ti.sysbios.family.msp430.Hwi.getStackInfo", "ti.sysbios.family.msp430"));
        vo.bind("getCoreStackInfo", om.findStrict("ti.sysbios.family.msp430.Hwi.getCoreStackInfo", "ti.sysbios.family.msp430"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.msp430.Hwi.startup", "ti.sysbios.family.msp430"));
        vo.bind("switchFromBootStack", om.findStrict("ti.sysbios.family.msp430.Hwi.switchFromBootStack", "ti.sysbios.family.msp430"));
        vo.bind("post", om.findStrict("ti.sysbios.family.msp430.Hwi.post", "ti.sysbios.family.msp430"));
        vo.bind("getTaskSP", om.findStrict("ti.sysbios.family.msp430.Hwi.getTaskSP", "ti.sysbios.family.msp430"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.msp430.Hwi.disableInterrupt", "ti.sysbios.family.msp430"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.msp430.Hwi.enableInterrupt", "ti.sysbios.family.msp430"));
        vo.bind("restoreInterrupt", om.findStrict("ti.sysbios.family.msp430.Hwi.restoreInterrupt", "ti.sysbios.family.msp430"));
        vo.bind("clearInterrupt", om.findStrict("ti.sysbios.family.msp430.Hwi.clearInterrupt", "ti.sysbios.family.msp430"));
        vo.bind("logBegin", om.findStrict("ti.sysbios.family.msp430.Hwi.logBegin", "ti.sysbios.family.msp430"));
        vo.bind("logEnd", om.findStrict("ti.sysbios.family.msp430.Hwi.logEnd", "ti.sysbios.family.msp430"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.msp430.Hwi.postInit", "ti.sysbios.family.msp430"));
        vo.bind("init", om.findStrict("ti.sysbios.family.msp430.Hwi.init", "ti.sysbios.family.msp430"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_msp430_Hwi_Handle__label__E", "ti_sysbios_family_msp430_Hwi_Module__startupDone__E", "ti_sysbios_family_msp430_Hwi_Object__create__E", "ti_sysbios_family_msp430_Hwi_Object__delete__E", "ti_sysbios_family_msp430_Hwi_Object__get__E", "ti_sysbios_family_msp430_Hwi_Object__first__E", "ti_sysbios_family_msp430_Hwi_Object__next__E", "ti_sysbios_family_msp430_Hwi_Params__init__E", "ti_sysbios_family_msp430_Hwi_getStackInfo__E", "ti_sysbios_family_msp430_Hwi_getCoreStackInfo__E", "ti_sysbios_family_msp430_Hwi_startup__E", "ti_sysbios_family_msp430_Hwi_switchFromBootStack__E", "ti_sysbios_family_msp430_Hwi_post__E", "ti_sysbios_family_msp430_Hwi_getTaskSP__E", "ti_sysbios_family_msp430_Hwi_disableInterrupt__E", "ti_sysbios_family_msp430_Hwi_enableInterrupt__E", "ti_sysbios_family_msp430_Hwi_restoreInterrupt__E", "ti_sysbios_family_msp430_Hwi_clearInterrupt__E", "ti_sysbios_family_msp430_Hwi_getFunc__E", "ti_sysbios_family_msp430_Hwi_setFunc__E", "ti_sysbios_family_msp430_Hwi_getHookContext__E", "ti_sysbios_family_msp430_Hwi_setHookContext__E", "ti_sysbios_family_msp430_Hwi_getIrp__E", "ti_sysbios_family_msp430_Hwi_disable__E", "ti_sysbios_family_msp430_Hwi_enable__E", "ti_sysbios_family_msp430_Hwi_restore__E", "ti_sysbios_family_msp430_Hwi_logBegin__E", "ti_sysbios_family_msp430_Hwi_logEnd__E"));
        vo.bind("$$logEvtCfgs", Global.newArray("LM_begin", "LD_end"));
        vo.bind("$$errorDescCfgs", Global.newArray("E_alreadyDefined", "E_notImplemented"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_unsupportedMaskingOption"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Hwi.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.msp430.Hwi.Object", "ti.sysbios.family.msp430"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Hwi.xdt");
        pkgV.bind("Hwi", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Hwi");
    }

    void IntrinsicsSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.IntrinsicsSupport", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.IntrinsicsSupport.Module", "ti.sysbios.family.msp430");
        vo.init2(po, "ti.sysbios.family.msp430.IntrinsicsSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.sysbios.family.msp430", "ti.sysbios.family.msp430"));
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
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.msp430")).add(vo);
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
        vo.bind("maxbit", om.findStrict("ti.sysbios.family.msp430.IntrinsicsSupport.maxbit", "ti.sysbios.family.msp430"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_msp430_IntrinsicsSupport_Module__startupDone__E", "ti_sysbios_family_msp430_IntrinsicsSupport_maxbit__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("IntrinsicsSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IntrinsicsSupport");
    }

    void TaskSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.TaskSupport", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.TaskSupport.Module", "ti.sysbios.family.msp430");
        vo.init2(po, "ti.sysbios.family.msp430.TaskSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.msp430.TaskSupport$$capsule", "ti.sysbios.family.msp430"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.msp430", "ti.sysbios.family.msp430"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITaskSupport.FuncPtr", "ti.sysbios.family.msp430"));
        mcfgs.add("defaultStackSize");
        mcfgs.add("stackAlignment");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.msp430")).add(vo);
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
        vo.bind("start", om.findStrict("ti.sysbios.family.msp430.TaskSupport.start", "ti.sysbios.family.msp430"));
        vo.bind("swap", om.findStrict("ti.sysbios.family.msp430.TaskSupport.swap", "ti.sysbios.family.msp430"));
        vo.bind("checkStack", om.findStrict("ti.sysbios.family.msp430.TaskSupport.checkStack", "ti.sysbios.family.msp430"));
        vo.bind("stackUsed", om.findStrict("ti.sysbios.family.msp430.TaskSupport.stackUsed", "ti.sysbios.family.msp430"));
        vo.bind("getStackAlignment", om.findStrict("ti.sysbios.family.msp430.TaskSupport.getStackAlignment", "ti.sysbios.family.msp430"));
        vo.bind("getDefaultStackSize", om.findStrict("ti.sysbios.family.msp430.TaskSupport.getDefaultStackSize", "ti.sysbios.family.msp430"));
        vo.bind("getCheckValueAddr", om.findStrict("ti.sysbios.family.msp430.TaskSupport.getCheckValueAddr", "ti.sysbios.family.msp430"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_msp430_TaskSupport_Module__startupDone__E", "ti_sysbios_family_msp430_TaskSupport_start__E", "ti_sysbios_family_msp430_TaskSupport_swap__E", "ti_sysbios_family_msp430_TaskSupport_checkStack__E", "ti_sysbios_family_msp430_TaskSupport_stackUsed__E", "ti_sysbios_family_msp430_TaskSupport_getStackAlignment__E", "ti_sysbios_family_msp430_TaskSupport_getDefaultStackSize__E", "ti_sysbios_family_msp430_TaskSupport_getCheckValueAddr__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("TaskSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TaskSupport");
    }

    void Timer$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.Timer", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Timer.Module", "ti.sysbios.family.msp430");
        vo.init2(po, "ti.sysbios.family.msp430.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.msp430.Timer$$capsule", "ti.sysbios.family.msp430"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.msp430.Timer.Instance", "ti.sysbios.family.msp430"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.msp430.Timer.Params", "ti.sysbios.family.msp430"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.msp430.Timer.Params", "ti.sysbios.family.msp430")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.msp430.Timer.Handle", "ti.sysbios.family.msp430"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.msp430", "ti.sysbios.family.msp430"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.family.msp430"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.msp430"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.msp430"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.msp430"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.msp430"));
        vo.bind("Source", om.findStrict("ti.sysbios.family.msp430.Timer.Source", "ti.sysbios.family.msp430"));
        vo.bind("ID", om.findStrict("ti.sysbios.family.msp430.Timer.ID", "ti.sysbios.family.msp430"));
        vo.bind("IDEX", om.findStrict("ti.sysbios.family.msp430.Timer.IDEX", "ti.sysbios.family.msp430"));
        vo.bind("Control", om.findStrict("ti.sysbios.family.msp430.Timer.Control", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Timer.Control", "ti.sysbios.family.msp430"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.msp430.Timer.BasicView", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Timer.BasicView", "ti.sysbios.family.msp430"));
        vo.bind("DeviceView", om.findStrict("ti.sysbios.family.msp430.Timer.DeviceView", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Timer.DeviceView", "ti.sysbios.family.msp430"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.msp430.Timer.ModuleView", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Timer.ModuleView", "ti.sysbios.family.msp430"));
        mcfgs.add("E_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("E_runtimeCreate");
        mcfgs.add("anyMask");
        mcfgs.add("keepAwake");
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        vo.bind("TimerDevice", om.findStrict("ti.sysbios.family.msp430.Timer.TimerDevice", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Timer.TimerDevice", "ti.sysbios.family.msp430"));
        mcfgs.add("numTimerDevices");
        icfgs.add("numTimerDevices");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.msp430.Timer.Instance_State", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Timer.Instance_State", "ti.sysbios.family.msp430"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.msp430.Timer.Module_State", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Timer.Module_State", "ti.sysbios.family.msp430"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.family.msp430"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.family.msp430"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.family.msp430"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.family.msp430"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.family.msp430"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.family.msp430"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.family.msp430"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.family.msp430"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.family.msp430"));
        vo.bind("Source_ACLK", om.findStrict("ti.sysbios.family.msp430.Timer.Source_ACLK", "ti.sysbios.family.msp430"));
        vo.bind("Source_SMCLK", om.findStrict("ti.sysbios.family.msp430.Timer.Source_SMCLK", "ti.sysbios.family.msp430"));
        vo.bind("Source_EXTERNAL", om.findStrict("ti.sysbios.family.msp430.Timer.Source_EXTERNAL", "ti.sysbios.family.msp430"));
        vo.bind("Source_EXTERNAL_INVERTED", om.findStrict("ti.sysbios.family.msp430.Timer.Source_EXTERNAL_INVERTED", "ti.sysbios.family.msp430"));
        vo.bind("ID_1", om.findStrict("ti.sysbios.family.msp430.Timer.ID_1", "ti.sysbios.family.msp430"));
        vo.bind("ID_2", om.findStrict("ti.sysbios.family.msp430.Timer.ID_2", "ti.sysbios.family.msp430"));
        vo.bind("ID_4", om.findStrict("ti.sysbios.family.msp430.Timer.ID_4", "ti.sysbios.family.msp430"));
        vo.bind("ID_8", om.findStrict("ti.sysbios.family.msp430.Timer.ID_8", "ti.sysbios.family.msp430"));
        vo.bind("IDEX_1", om.findStrict("ti.sysbios.family.msp430.Timer.IDEX_1", "ti.sysbios.family.msp430"));
        vo.bind("IDEX_2", om.findStrict("ti.sysbios.family.msp430.Timer.IDEX_2", "ti.sysbios.family.msp430"));
        vo.bind("IDEX_3", om.findStrict("ti.sysbios.family.msp430.Timer.IDEX_3", "ti.sysbios.family.msp430"));
        vo.bind("IDEX_4", om.findStrict("ti.sysbios.family.msp430.Timer.IDEX_4", "ti.sysbios.family.msp430"));
        vo.bind("IDEX_5", om.findStrict("ti.sysbios.family.msp430.Timer.IDEX_5", "ti.sysbios.family.msp430"));
        vo.bind("IDEX_6", om.findStrict("ti.sysbios.family.msp430.Timer.IDEX_6", "ti.sysbios.family.msp430"));
        vo.bind("IDEX_7", om.findStrict("ti.sysbios.family.msp430.Timer.IDEX_7", "ti.sysbios.family.msp430"));
        vo.bind("IDEX_8", om.findStrict("ti.sysbios.family.msp430.Timer.IDEX_8", "ti.sysbios.family.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.msp430")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.msp430.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$msp430$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.family.msp430.Timer.getNumTimers", "ti.sysbios.family.msp430"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.family.msp430.Timer.getStatus", "ti.sysbios.family.msp430"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.msp430.Timer.startup", "ti.sysbios.family.msp430"));
        vo.bind("oneShotStub", om.findStrict("ti.sysbios.family.msp430.Timer.oneShotStub", "ti.sysbios.family.msp430"));
        vo.bind("oneShotNestStub", om.findStrict("ti.sysbios.family.msp430.Timer.oneShotNestStub", "ti.sysbios.family.msp430"));
        vo.bind("periodicStub", om.findStrict("ti.sysbios.family.msp430.Timer.periodicStub", "ti.sysbios.family.msp430"));
        vo.bind("periodicNestStub", om.findStrict("ti.sysbios.family.msp430.Timer.periodicNestStub", "ti.sysbios.family.msp430"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.msp430.Timer.getHandle", "ti.sysbios.family.msp430"));
        vo.bind("getAvailMask", om.findStrict("ti.sysbios.family.msp430.Timer.getAvailMask", "ti.sysbios.family.msp430"));
        vo.bind("initDevice", om.findStrict("ti.sysbios.family.msp430.Timer.initDevice", "ti.sysbios.family.msp430"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.msp430.Timer.postInit", "ti.sysbios.family.msp430"));
        vo.bind("checkOverflow", om.findStrict("ti.sysbios.family.msp430.Timer.checkOverflow", "ti.sysbios.family.msp430"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_msp430_Timer_Handle__label__E", "ti_sysbios_family_msp430_Timer_Module__startupDone__E", "ti_sysbios_family_msp430_Timer_Object__create__E", "ti_sysbios_family_msp430_Timer_Object__delete__E", "ti_sysbios_family_msp430_Timer_Object__get__E", "ti_sysbios_family_msp430_Timer_Object__first__E", "ti_sysbios_family_msp430_Timer_Object__next__E", "ti_sysbios_family_msp430_Timer_Params__init__E", "ti_sysbios_family_msp430_Timer_getNumTimers__E", "ti_sysbios_family_msp430_Timer_getStatus__E", "ti_sysbios_family_msp430_Timer_startup__E", "ti_sysbios_family_msp430_Timer_getMaxTicks__E", "ti_sysbios_family_msp430_Timer_setNextTick__E", "ti_sysbios_family_msp430_Timer_start__E", "ti_sysbios_family_msp430_Timer_stop__E", "ti_sysbios_family_msp430_Timer_setPeriod__E", "ti_sysbios_family_msp430_Timer_setPeriodMicroSecs__E", "ti_sysbios_family_msp430_Timer_getPeriod__E", "ti_sysbios_family_msp430_Timer_getCount__E", "ti_sysbios_family_msp430_Timer_getFreq__E", "ti_sysbios_family_msp430_Timer_getFunc__E", "ti_sysbios_family_msp430_Timer_setFunc__E", "ti_sysbios_family_msp430_Timer_trigger__E", "ti_sysbios_family_msp430_Timer_getExpiredCounts__E", "ti_sysbios_family_msp430_Timer_getExpiredTicks__E", "ti_sysbios_family_msp430_Timer_getCurrentTick__E", "ti_sysbios_family_msp430_Timer_oneShotStub__E", "ti_sysbios_family_msp430_Timer_oneShotNestStub__E", "ti_sysbios_family_msp430_Timer_periodicStub__E", "ti_sysbios_family_msp430_Timer_periodicNestStub__E", "ti_sysbios_family_msp430_Timer_getHandle__E", "ti_sysbios_family_msp430_Timer_getAvailMask__E", "ti_sysbios_family_msp430_Timer_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_invalidTimer", "E_notAvailable", "E_cannotSupport", "E_runtimeCreate"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.msp430.Timer.Object", "ti.sysbios.family.msp430"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.TimestampProvider", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Module", "ti.sysbios.family.msp430");
        vo.init2(po, "ti.sysbios.family.msp430.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.msp430.TimestampProvider$$capsule", "ti.sysbios.family.msp430"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.msp430", "ti.sysbios.family.msp430"));
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
        vo.bind("Source", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Source", "ti.sysbios.family.msp430"));
        mcfgs.add("timerId");
        mcfgs.add("useClockTimer");
        mcfgs.add("clockSource");
        mcfgs.add("synchronize");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Module_State", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Module_State", "ti.sysbios.family.msp430"));
        vo.bind("Source_ACLK", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Source_ACLK", "ti.sysbios.family.msp430"));
        vo.bind("Source_SMCLK", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.Source_SMCLK", "ti.sysbios.family.msp430"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.msp430")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.get32", "ti.sysbios.family.msp430"));
        vo.bind("get64", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.get64", "ti.sysbios.family.msp430"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.getFreq", "ti.sysbios.family.msp430"));
        vo.bind("get16", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.get16", "ti.sysbios.family.msp430"));
        vo.bind("startTimer", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.startTimer", "ti.sysbios.family.msp430"));
        vo.bind("rolloverFunc", om.findStrict("ti.sysbios.family.msp430.TimestampProvider.rolloverFunc", "ti.sysbios.family.msp430"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_msp430_TimestampProvider_Module__startupDone__E", "ti_sysbios_family_msp430_TimestampProvider_get32__E", "ti_sysbios_family_msp430_TimestampProvider_get64__E", "ti_sysbios_family_msp430_TimestampProvider_getFreq__E", "ti_sysbios_family_msp430_TimestampProvider_get16__E", "ti_sysbios_family_msp430_TimestampProvider_startTimer__E", "ti_sysbios_family_msp430_TimestampProvider_rolloverFunc__E"));
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

    void Power$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.Power", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Power.Module", "ti.sysbios.family.msp430");
        vo.init2(po, "ti.sysbios.family.msp430.Power", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.msp430.Power$$capsule", "ti.sysbios.family.msp430"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.msp430", "ti.sysbios.family.msp430"));
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
        mcfgs.add("idle");
        vo.bind("SleepPrepFuncPtr", om.findStrict("ti.sysbios.family.msp430.Power.SleepPrepFuncPtr", "ti.sysbios.family.msp430"));
        vo.bind("IdleMode", om.findStrict("ti.sysbios.family.msp430.Power.IdleMode", "ti.sysbios.family.msp430"));
        vo.bind("SleepMode", om.findStrict("ti.sysbios.family.msp430.Power.SleepMode", "ti.sysbios.family.msp430"));
        mcfgs.add("E_dynamicModeNotAllowed");
        mcfgs.add("idleMode");
        mcfgs.add("allowDynamicMode");
        mcfgs.add("sleepPrepFunction");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.msp430.Power.Module_State", "ti.sysbios.family.msp430"));
        tdefs.add(om.findStrict("ti.sysbios.family.msp430.Power.Module_State", "ti.sysbios.family.msp430"));
        vo.bind("LPM0", om.findStrict("ti.sysbios.family.msp430.Power.LPM0", "ti.sysbios.family.msp430"));
        vo.bind("LPM1", om.findStrict("ti.sysbios.family.msp430.Power.LPM1", "ti.sysbios.family.msp430"));
        vo.bind("LPM2", om.findStrict("ti.sysbios.family.msp430.Power.LPM2", "ti.sysbios.family.msp430"));
        vo.bind("LPM3", om.findStrict("ti.sysbios.family.msp430.Power.LPM3", "ti.sysbios.family.msp430"));
        vo.bind("LPM4", om.findStrict("ti.sysbios.family.msp430.Power.LPM4", "ti.sysbios.family.msp430"));
        vo.bind("Sleep_LPM4_5", om.findStrict("ti.sysbios.family.msp430.Power.Sleep_LPM4_5", "ti.sysbios.family.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.msp430")).add(vo);
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
        vo.bind("idleCPU", om.findStrict("ti.sysbios.family.msp430.Power.idleCPU", "ti.sysbios.family.msp430"));
        vo.bind("changeIdleMode", om.findStrict("ti.sysbios.family.msp430.Power.changeIdleMode", "ti.sysbios.family.msp430"));
        vo.bind("sleepCPU", om.findStrict("ti.sysbios.family.msp430.Power.sleepCPU", "ti.sysbios.family.msp430"));
        vo.bind("wakeCPU", om.findStrict("ti.sysbios.family.msp430.Power.wakeCPU", "ti.sysbios.family.msp430"));
        vo.bind("getModeChangeFlag", om.findStrict("ti.sysbios.family.msp430.Power.getModeChangeFlag", "ti.sysbios.family.msp430"));
        vo.bind("defaultSleepPrepFunction", om.findStrict("ti.sysbios.family.msp430.Power.defaultSleepPrepFunction", "ti.sysbios.family.msp430"));
        vo.bind("blockedTaskFunction", om.findStrict("ti.sysbios.family.msp430.Power.blockedTaskFunction", "ti.sysbios.family.msp430"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_msp430_Power_Module__startupDone__E", "ti_sysbios_family_msp430_Power_idleCPU__E", "ti_sysbios_family_msp430_Power_changeIdleMode__E", "ti_sysbios_family_msp430_Power_sleepCPU__E", "ti_sysbios_family_msp430_Power_wakeCPU__E", "ti_sysbios_family_msp430_Power_getModeChangeFlag__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_dynamicModeNotAllowed"));
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Power.xdt");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Power.xdt");
        pkgV.bind("Power", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Power");
    }

    void ClockFreqs$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.ClockFreqs", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.ClockFreqs.Module", "ti.sysbios.family.msp430");
        vo.init2(po, "ti.sysbios.family.msp430.ClockFreqs", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.msp430.ClockFreqs$$capsule", "ti.sysbios.family.msp430"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.msp430", "ti.sysbios.family.msp430"));
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
        vo.bind("Clock", om.findStrict("ti.sysbios.family.msp430.ClockFreqs.Clock", "ti.sysbios.family.msp430"));
        mcfgs.add("ACLK");
        mcfgs.add("SMCLK");
        vo.bind("Clock_ACLK", om.findStrict("ti.sysbios.family.msp430.ClockFreqs.Clock_ACLK", "ti.sysbios.family.msp430"));
        vo.bind("Clock_SMCLK", om.findStrict("ti.sysbios.family.msp430.ClockFreqs.Clock_SMCLK", "ti.sysbios.family.msp430"));
        vo.bind("Clock_MCLK", om.findStrict("ti.sysbios.family.msp430.ClockFreqs.Clock_MCLK", "ti.sysbios.family.msp430"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.msp430")).add(vo);
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
        vo.bind("getFrequency", om.findStrict("ti.sysbios.family.msp430.ClockFreqs.getFrequency", "ti.sysbios.family.msp430"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_msp430_ClockFreqs_Module__startupDone__E", "ti_sysbios_family_msp430_ClockFreqs_getFrequency__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("ClockFreqs", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("ClockFreqs");
    }

    void Settings$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.Settings", "ti.sysbios.family.msp430");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.msp430.Settings.Module", "ti.sysbios.family.msp430");
        vo.init2(po, "ti.sysbios.family.msp430.Settings", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.msp430.Settings$$capsule", "ti.sysbios.family.msp430"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.msp430", "ti.sysbios.family.msp430"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.msp430")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.sysbios.family.msp430.Settings$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Settings", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Settings");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.msp430")).findStrict("PARAMS", "ti.sysbios.family.msp430");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.msp430.Hwi", "ti.sysbios.family.msp430")).findStrict("PARAMS", "ti.sysbios.family.msp430");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.msp430.Timer", "ti.sysbios.family.msp430")).findStrict("PARAMS", "ti.sysbios.family.msp430");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.msp430.Hwi", "ti.sysbios.family.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.msp430.IntrinsicsSupport", "ti.sysbios.family.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.msp430.TaskSupport", "ti.sysbios.family.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.msp430.Timer", "ti.sysbios.family.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.msp430.TimestampProvider", "ti.sysbios.family.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.msp430.Power", "ti.sysbios.family.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.msp430.ClockFreqs", "ti.sysbios.family.msp430"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.msp430.Settings", "ti.sysbios.family.msp430"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.Hwi", "ti.sysbios.family.msp430");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.msp430.Timer", "ti.sysbios.family.msp430");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Device", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitDevice", "structName", "DeviceView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.msp430.Hwi")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.msp430.IntrinsicsSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.msp430.TaskSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.msp430.Timer")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.msp430.TimestampProvider")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.msp430.Power")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.msp430.ClockFreqs")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.msp430.Settings")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.msp430")).add(pkgV);
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
        Hwi$$OBJECTS();
        IntrinsicsSupport$$OBJECTS();
        TaskSupport$$OBJECTS();
        Timer$$OBJECTS();
        TimestampProvider$$OBJECTS();
        Power$$OBJECTS();
        ClockFreqs$$OBJECTS();
        Settings$$OBJECTS();
        Hwi$$CONSTS();
        IntrinsicsSupport$$CONSTS();
        TaskSupport$$CONSTS();
        Timer$$CONSTS();
        TimestampProvider$$CONSTS();
        Power$$CONSTS();
        ClockFreqs$$CONSTS();
        Settings$$CONSTS();
        Hwi$$CREATES();
        IntrinsicsSupport$$CREATES();
        TaskSupport$$CREATES();
        Timer$$CREATES();
        TimestampProvider$$CREATES();
        Power$$CREATES();
        ClockFreqs$$CREATES();
        Settings$$CREATES();
        Hwi$$FUNCTIONS();
        IntrinsicsSupport$$FUNCTIONS();
        TaskSupport$$FUNCTIONS();
        Timer$$FUNCTIONS();
        TimestampProvider$$FUNCTIONS();
        Power$$FUNCTIONS();
        ClockFreqs$$FUNCTIONS();
        Settings$$FUNCTIONS();
        Hwi$$SIZES();
        IntrinsicsSupport$$SIZES();
        TaskSupport$$SIZES();
        Timer$$SIZES();
        TimestampProvider$$SIZES();
        Power$$SIZES();
        ClockFreqs$$SIZES();
        Settings$$SIZES();
        Hwi$$TYPES();
        IntrinsicsSupport$$TYPES();
        TaskSupport$$TYPES();
        Timer$$TYPES();
        TimestampProvider$$TYPES();
        Power$$TYPES();
        ClockFreqs$$TYPES();
        Settings$$TYPES();
        if (isROV) {
            Hwi$$ROV();
            IntrinsicsSupport$$ROV();
            TaskSupport$$ROV();
            Timer$$ROV();
            TimestampProvider$$ROV();
            Power$$ROV();
            ClockFreqs$$ROV();
            Settings$$ROV();
        }//isROV
        $$SINGLETONS();
        Hwi$$SINGLETONS();
        IntrinsicsSupport$$SINGLETONS();
        TaskSupport$$SINGLETONS();
        Timer$$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        Power$$SINGLETONS();
        ClockFreqs$$SINGLETONS();
        Settings$$SINGLETONS();
        $$INITIALIZATION();
    }
}
