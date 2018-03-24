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

public class ti_sysbios_family_arp32
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.interfaces");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arp32", new Value.Obj("ti.sysbios.family.arp32", pkgP));
    }

    void Hwi$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arp32.Hwi", new Value.Obj("ti.sysbios.family.arp32.Hwi", po));
        pkgV.bind("Hwi", vo);
        // decls 
        om.bind("ti.sysbios.family.arp32.Hwi.HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arp32"));
        om.bind("ti.sysbios.family.arp32.Hwi.MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arp32"));
        om.bind("ti.sysbios.family.arp32.Hwi.StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arp32"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$IntcRegs", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.IntcRegs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$VectorObj", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.VectorObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$NonDispatchedInterrupt", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.NonDispatchedInterrupt", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$InterruptObj", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.InterruptObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arp32.Hwi.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Hwi$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Hwi.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arp32.Hwi.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arp32.Hwi.Object", om.findStrict("ti.sysbios.family.arp32.Hwi.Instance_State", "ti.sysbios.family.arp32"));
        }//isROV
    }

    void TaskSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.TaskSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arp32.TaskSupport", new Value.Obj("ti.sysbios.family.arp32.TaskSupport", po));
        pkgV.bind("TaskSupport", vo);
        // decls 
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arp32.Timer", new Value.Obj("ti.sysbios.family.arp32.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.family.arp32.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arp32"));
        om.bind("ti.sysbios.family.arp32.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arp32"));
        om.bind("ti.sysbios.family.arp32.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arp32"));
        om.bind("ti.sysbios.family.arp32.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arp32"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Timer$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Timer.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Timer$$DeviceView", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Timer.DeviceView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arp32.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arp32.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arp32.Timer.Object", om.findStrict("ti.sysbios.family.arp32.Timer.Instance_State", "ti.sysbios.family.arp32"));
        }//isROV
    }

    void CTM$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.CTM.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arp32.CTM", new Value.Obj("ti.sysbios.family.arp32.CTM", po));
        pkgV.bind("CTM", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arp32.CTM$$CTM", new Proto.Obj());
        om.bind("ti.sysbios.family.arp32.CTM.CTM", new Proto.Str(spo, false));
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arp32.Cache", new Value.Obj("ti.sysbios.family.arp32.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
        om.bind("ti.sysbios.family.arp32.Cache.Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arp32"));
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arp32.TimestampProvider", new Value.Obj("ti.sysbios.family.arp32.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
    }

    void IntrinsicsSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.IntrinsicsSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arp32.IntrinsicsSupport", new Value.Obj("ti.sysbios.family.arp32.IntrinsicsSupport", po));
        pkgV.bind("IntrinsicsSupport", vo);
        // decls 
    }

    void Settings$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arp32.Settings.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arp32.Settings", new Value.Obj("ti.sysbios.family.arp32.Settings", po));
        pkgV.bind("Settings", vo);
        // decls 
    }

    void Hwi$$CONSTS()
    {
        // module Hwi
        om.bind("ti.sysbios.family.arp32.Hwi.getStackInfo", new Extern("ti_sysbios_family_arp32_Hwi_getStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.getCoreStackInfo", new Extern("ti_sysbios_family_arp32_Hwi_getCoreStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.startup", new Extern("ti_sysbios_family_arp32_Hwi_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.switchFromBootStack", new Extern("ti_sysbios_family_arp32_Hwi_switchFromBootStack__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.post", new Extern("ti_sysbios_family_arp32_Hwi_post__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.getTaskSP", new Extern("ti_sysbios_family_arp32_Hwi_getTaskSP__E", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.disableInterrupt", new Extern("ti_sysbios_family_arp32_Hwi_disableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.enableInterrupt", new Extern("ti_sysbios_family_arp32_Hwi_enableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.restoreInterrupt", new Extern("ti_sysbios_family_arp32_Hwi_restoreInterrupt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.clearInterrupt", new Extern("ti_sysbios_family_arp32_Hwi_clearInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.selfLoop", new Extern("ti_sysbios_family_arp32_Hwi_selfLoop__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.getHandle", new Extern("ti_sysbios_family_arp32_Hwi_getHandle__E", "ti_sysbios_family_arp32_Hwi_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.disableIER", new Extern("ti_sysbios_family_arp32_Hwi_disableIER__E", "xdc_Bits16(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.enableIER", new Extern("ti_sysbios_family_arp32_Hwi_enableIER__E", "xdc_Bits16(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.restoreIER", new Extern("ti_sysbios_family_arp32_Hwi_restoreIER__E", "xdc_Bits16(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.plug", new Extern("ti_sysbios_family_arp32_Hwi_plug__E", "xdc_Void(*)(xdc_UInt,xdc_Void(*)(xdc_Void))", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.postIntVector", new Extern("ti_sysbios_family_arp32_Hwi_postIntVector__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.getIsrStackAddress", new Extern("ti_sysbios_family_arp32_Hwi_getIsrStackAddress__I", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispatchC", new Extern("ti_sysbios_family_arp32_Hwi_dispatchC__I", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispatchCore", new Extern("ti_sysbios_family_arp32_Hwi_dispatchCore__I", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.switchAndDispatch", new Extern("ti_sysbios_family_arp32_Hwi_switchAndDispatch__I", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.unPluggedInterrupt", new Extern("ti_sysbios_family_arp32_Hwi_unPluggedInterrupt__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.nmiInterrupt", new Extern("ti_sysbios_family_arp32_Hwi_nmiInterrupt__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.swiInterrupt", new Extern("ti_sysbios_family_arp32_Hwi_swiInterrupt__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.undefInterrupt", new Extern("ti_sysbios_family_arp32_Hwi_undefInterrupt__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr4", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr4__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr5", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr5__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr6", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr6__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr7", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr7__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr8", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr8__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr9", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr9__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr10", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr10__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr11", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr11__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr12", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr12__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr13", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr13__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr14", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr14__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.dispIsr15", new Extern("ti_sysbios_family_arp32_Hwi_dispIsr15__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Hwi.postInit", new Extern("ti_sysbios_family_arp32_Hwi_postInit__I", "xdc_Int(*)(ti_sysbios_family_arp32_Hwi_Object*,xdc_runtime_Error_Block*)", true, false));
    }

    void TaskSupport$$CONSTS()
    {
        // module TaskSupport
        om.bind("ti.sysbios.family.arp32.TaskSupport.start", new Extern("ti_sysbios_family_arp32_TaskSupport_start__E", "xdc_Ptr(*)(xdc_Ptr,xdc_Void(*)(xdc_Void),xdc_Void(*)(xdc_Void),xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arp32.TaskSupport.swap", new Extern("ti_sysbios_family_arp32_TaskSupport_swap__E", "xdc_Void(*)(xdc_Ptr*,xdc_Ptr*)", true, false));
        om.bind("ti.sysbios.family.arp32.TaskSupport.checkStack", new Extern("ti_sysbios_family_arp32_TaskSupport_checkStack__E", "xdc_Bool(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arp32.TaskSupport.stackUsed", new Extern("ti_sysbios_family_arp32_TaskSupport_stackUsed__E", "xdc_SizeT(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arp32.TaskSupport.getStackAlignment", new Extern("ti_sysbios_family_arp32_TaskSupport_getStackAlignment__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.TaskSupport.getDefaultStackSize", new Extern("ti_sysbios_family_arp32_TaskSupport_getDefaultStackSize__E", "xdc_SizeT(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.TaskSupport.getCheckValueAddr", new Extern("ti_sysbios_family_arp32_TaskSupport_getCheckValueAddr__E", "xdc_Ptr(*)(xdc_Ptr)", true, false));
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.family.arp32.Timer.MAX_PERIOD", 0xffffffffL);
        om.bind("ti.sysbios.family.arp32.Timer.NUM_TIMER_DEVICES", 2L);
        om.bind("ti.sysbios.family.arp32.Timer.TIMER_CLOCK_DIVIDER", 1L);
        om.bind("ti.sysbios.family.arp32.Timer.MIN_SWEEP_PERIOD", 1L);
        om.bind("ti.sysbios.family.arp32.Timer.getNumTimers", new Extern("ti_sysbios_family_arp32_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Timer.getStatus", new Extern("ti_sysbios_family_arp32_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Timer.startup", new Extern("ti_sysbios_family_arp32_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Timer.getHandle", new Extern("ti_sysbios_family_arp32_Timer_getHandle__E", "ti_sysbios_family_arp32_Timer_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arp32.Timer.postInit", new Extern("ti_sysbios_family_arp32_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_family_arp32_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arp32.Timer.checkOverflow", new Extern("ti_sysbios_family_arp32_Timer_checkOverflow__I", "xdc_Bool(*)(xdc_UInt32,xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arp32.Timer.initDevice", new Extern("ti_sysbios_family_arp32_Timer_initDevice__I", "xdc_Void(*)(ti_sysbios_family_arp32_Timer_Object*)", true, false));
    }

    void CTM$$CONSTS()
    {
        // module CTM
        om.bind("ti.sysbios.family.arp32.CTM.ctm", new Extern("ti_sysbios_family_arp32_CTM_ctm", "ti_sysbios_family_arp32_CTM_CTM*", false, false));
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("ti.sysbios.family.arp32.Cache.enable", new Extern("ti_sysbios_family_arp32_Cache_enable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.disable", new Extern("ti_sysbios_family_arp32_Cache_disable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.inv", new Extern("ti_sysbios_family_arp32_Cache_inv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.wb", new Extern("ti_sysbios_family_arp32_Cache_wb__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.wbInv", new Extern("ti_sysbios_family_arp32_Cache_wbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.wbAll", new Extern("ti_sysbios_family_arp32_Cache_wbAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.wbInvAll", new Extern("ti_sysbios_family_arp32_Cache_wbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.wait", new Extern("ti_sysbios_family_arp32_Cache_wait__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.invL1pAll", new Extern("ti_sysbios_family_arp32_Cache_invL1pAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.invL1pSingleAddr", new Extern("ti_sysbios_family_arp32_Cache_invL1pSingleAddr__E", "xdc_Void(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.preloadL1p", new Extern("ti_sysbios_family_arp32_Cache_preloadL1p__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arp32.Cache.block", new Extern("ti_sysbios_family_arp32_Cache_block__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool,xdc_UInt32*,xdc_UInt32*)", true, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.family.arp32.TimestampProvider.get32", new Extern("ti_sysbios_family_arp32_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arp32.TimestampProvider.get64", new Extern("ti_sysbios_family_arp32_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.family.arp32.TimestampProvider.getFreq", new Extern("ti_sysbios_family_arp32_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
    }

    void IntrinsicsSupport$$CONSTS()
    {
        // module IntrinsicsSupport
        om.bind("ti.sysbios.family.arp32.IntrinsicsSupport.maxbit", new Extern("ti_sysbios_family_arp32_IntrinsicsSupport_maxbit__E", "xdc_UInt(*)(xdc_UInt)", true, false));
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
            sb.append("ti$sysbios$family$arp32$Hwi$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arp32.Hwi.create() called before xdc.useModule('ti.sysbios.family.arp32.Hwi')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.intNum, inst.$args.hwiFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arp32.Hwi$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arp32.Hwi.Module", "ti.sysbios.family.arp32"), om.findStrict("ti.sysbios.family.arp32.Hwi.Instance", "ti.sysbios.family.arp32"), 3, 2, false));
                        fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arp32.Hwi.Params", "ti.sysbios.family.arp32"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arp32$Hwi$$create = function( intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arp32.Hwi'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arp32.Hwi.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arp32']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arp32.Hwi'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [intNum, hwiFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arp32.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arp32.Hwi$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arp32.Hwi.Module", "ti.sysbios.family.arp32"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arp32.Hwi$$Object", "ti.sysbios.family.arp32"), null);
                        fxn.addArg(1, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arp32.Hwi.Params", "ti.sysbios.family.arp32"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arp32$Hwi$$construct = function( __obj, intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arp32.Hwi'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arp32.Hwi'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arp32.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
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
            sb.append("ti$sysbios$family$arp32$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arp32.Timer.create() called before xdc.useModule('ti.sysbios.family.arp32.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arp32.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arp32.Timer.Module", "ti.sysbios.family.arp32"), om.findStrict("ti.sysbios.family.arp32.Timer.Instance", "ti.sysbios.family.arp32"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arp32.Timer.Params", "ti.sysbios.family.arp32"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arp32$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arp32.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arp32.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arp32']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arp32.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arp32.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arp32.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arp32.Timer.Module", "ti.sysbios.family.arp32"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arp32.Timer$$Object", "ti.sysbios.family.arp32"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arp32.Timer.Params", "ti.sysbios.family.arp32"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arp32$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arp32.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arp32.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arp32.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return null;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
    }

    void CTM$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cache$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TimestampProvider$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void IntrinsicsSupport$$CREATES()
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
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arp32.Hwi$$inUseMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arp32.Hwi.Module", "ti.sysbios.family.arp32"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
        // fxn Hwi.plugMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arp32.Hwi$$plugMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arp32.Hwi.Module", "ti.sysbios.family.arp32"), null, 2, 2, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "fxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF);
    }

    void TaskSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Timer$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void CTM$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TimestampProvider$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IntrinsicsSupport$$FUNCTIONS()
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

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arp32.Hwi.IntcRegs", "ti.sysbios.family.arp32");
        sizes.clear();
        sizes.add(Global.newArray("rawStatus", "UInt32"));
        sizes.add(Global.newArray("status", "UInt32"));
        sizes.add(Global.newArray("set", "UInt32"));
        sizes.add(Global.newArray("clr", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arp32.Hwi.IntcRegs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arp32.Hwi.IntcRegs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arp32.Hwi.IntcRegs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arp32.Hwi.Instance_State", "ti.sysbios.family.arp32");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("disableIerMask", "UInt16"));
        sizes.add(Global.newArray("restoreIerMask", "UInt16"));
        sizes.add(Global.newArray("vectorNum", "TInt16"));
        sizes.add(Global.newArray("index", "TInt16"));
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("hookEnv", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arp32.Hwi.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arp32.Hwi.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arp32.Hwi.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arp32.Hwi.Module_State", "ti.sysbios.family.arp32");
        sizes.clear();
        sizes.add(Global.newArray("interruptMask", "UPtr"));
        sizes.add(Global.newArray("disableIerMask", "UPtr"));
        sizes.add(Global.newArray("restoreIerMask", "UPtr"));
        sizes.add(Global.newArray("vectNum", "TInt"));
        sizes.add(Global.newArray("taskSP", "UPtr"));
        sizes.add(Global.newArray("isrStack", "UPtr"));
        sizes.add(Global.newArray("irp", "UPtr"));
        sizes.add(Global.newArray("dispatchTable", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arp32.Hwi.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arp32.Hwi.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arp32.Hwi.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
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

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arp32.Timer.Instance_State", "ti.sysbios.family.arp32");
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
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arp32.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arp32.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arp32.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arp32.Timer.Module_State", "ti.sysbios.family.arp32");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "UInt"));
        sizes.add(Global.newArray("baseAddr", "UPtr"));
        sizes.add(Global.newArray("handles", "A2;UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arp32.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arp32.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arp32.Timer.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void CTM$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arp32.CTM.CTM", "ti.sysbios.family.arp32");
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
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arp32.CTM.CTM']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arp32.CTM.CTM']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arp32.CTM.CTM'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void TimestampProvider$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void IntrinsicsSupport$$SIZES()
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

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arp32/Hwi.xs");
        om.bind("ti.sysbios.family.arp32.Hwi$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi.Module", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.Module", om.findStrict("ti.sysbios.interfaces.IHwi.Module", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arp32"), $$UNDEF, "wh");
            po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
            po.addFld("NUM_VECTORS", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
            po.addFld("A_badIntNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arp32"), Global.newObject("msg", "A_badIntNum: Invalid interrupt number"), "w");
            po.addFld("A_badVectNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arp32"), Global.newObject("msg", "A_badVectNum: Invalid interrupt vector number"), "w");
            po.addFld("E_alreadyDefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arp32"), Global.newObject("msg", "E_alreadyDefined: Hwi already defined: intr# %d"), "w");
            po.addFld("E_notImplemented", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arp32"), Global.newObject("msg", "E_notImplemented: Function not implemented: %s"), "w");
            po.addFld("LM_begin", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arp32"), Global.newObject("mask", Global.eval("0x0100 | 0x0200"), "msg", "LM_begin: hwi: 0x%x, func: 0x%x, intNum: %d, irp: 0x%x"), "w");
            po.addFld("LD_end", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.arp32"), Global.newObject("mask", 0x0200L, "msg", "LD_end: hwi: 0x%x"), "w");
            po.addFld("initialIerMask", Proto.Elm.newCNum("(xdc_Bits32)"), 0L, "w");
            po.addFld("INTCREGSBASEADDRS", new Proto.Arr(new Proto.Adr("ti_sysbios_family_arp32_Hwi_IntcRegs*", "PS"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
            po.addFld("swiDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("swiRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("taskDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("taskRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("hooks", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arp32.Hwi.HookSet", "ti.sysbios.family.arp32"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("nonDispatchedInterrupts", new Proto.Map((Proto)om.findStrict("ti.sysbios.family.arp32.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.arp32")), $$DEFAULT, "wh");
            po.addFld("vectors", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arp32.Hwi.VectorObj", "ti.sysbios.family.arp32"), false), $$DEFAULT, "wh");
            po.addFld("interrupt", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arp32.Hwi.InterruptObj", "ti.sysbios.family.arp32"), false), $$DEFAULT, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arp32.Hwi$$create", "ti.sysbios.family.arp32"), Global.get("ti$sysbios$family$arp32$Hwi$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arp32.Hwi$$construct", "ti.sysbios.family.arp32"), Global.get("ti$sysbios$family$arp32$Hwi$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Hwi$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Hwi$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Hwi$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Hwi$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Hwi$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Hwi$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "addHookSet");
                if (fxn != null) po.addFxn("addHookSet", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$addHookSet", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "viewGetStackInfo");
                if (fxn != null) po.addFxn("viewGetStackInfo", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$viewGetStackInfo", "ti.sysbios.family.arp32"), fxn);
                po.addFxn("inUseMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arp32.Hwi$$inUseMeta", "ti.sysbios.family.arp32"), Global.get(cap, "inUseMeta"));
                po.addFxn("plugMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arp32.Hwi$$plugMeta", "ti.sysbios.family.arp32"), Global.get(cap, "plugMeta"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi.Instance", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.Instance", om.findStrict("ti.sysbios.interfaces.IHwi.Instance", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("disableIerMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("restoreIerMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("vectorNum", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arp32"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$Params", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.Params", om.findStrict("ti.sysbios.interfaces.IHwi$$Params", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("disableIerMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("restoreIerMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("vectorNum", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("-1"), "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arp32"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$Object", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.Object", om.findStrict("ti.sysbios.family.arp32.Hwi.Instance", "ti.sysbios.family.arp32"));
        // typedef Hwi.PlugFuncPtr
        om.bind("ti.sysbios.family.arp32.Hwi.PlugFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Hwi.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$BasicView", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("vector", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("disableIerMask", $$T_Str, $$UNDEF, "w");
                po.addFld("restoreIerMask", $$T_Str, $$UNDEF, "w");
        // struct Hwi.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$ModuleView", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("options", new Proto.Arr($$T_Str, false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("hwiStackPeak", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Hwi.IntcRegs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$IntcRegs", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.IntcRegs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("rawStatus", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("status", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("set", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("clr", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
        // struct Hwi.VectorObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$VectorObj", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.VectorObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("useDispatcher", $$T_Bool, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("pfxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
        // struct Hwi.NonDispatchedInterrupt
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$NonDispatchedInterrupt", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.NonDispatchedInterrupt", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("vectorNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
                po.addFld("enableInt", $$T_Bool, $$UNDEF, "w");
        // struct Hwi.InterruptObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$InterruptObj", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.InterruptObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("useDispatcher", $$T_Bool, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
        // struct Hwi.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$Instance_State", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("disableIerMask", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("restoreIerMask", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("vectorNum", Proto.Elm.newCNum("(xdc_Int16)"), $$UNDEF, "w");
                po.addFld("index", Proto.Elm.newCNum("(xdc_Int16)"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hookEnv", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
        // struct Hwi.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$Module_State", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Hwi.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("interruptMask", new Proto.Arr(Proto.Elm.newCNum("(xdc_Bits32)"), false), $$DEFAULT, "w");
                po.addFld("disableIerMask", new Proto.Arr(Proto.Elm.newCNum("(xdc_Bits16)"), false), $$DEFAULT, "w");
                po.addFld("restoreIerMask", new Proto.Arr(Proto.Elm.newCNum("(xdc_Bits16)"), false), $$DEFAULT, "w");
                po.addFld("vectNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("taskSP", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("isrStack", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Arr(new Proto.Adr("xdc_UArg", "Pv"), false), $$DEFAULT, "w");
                po.addFld("dispatchTable", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arp32.Hwi.Handle", "ti.sysbios.family.arp32"), false), $$DEFAULT, "w");
    }

    void TaskSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arp32/TaskSupport.xs");
        om.bind("ti.sysbios.family.arp32.TaskSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.TaskSupport.Module", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.TaskSupport.Module", om.findStrict("ti.sysbios.interfaces.ITaskSupport.Module", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("defaultStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 1024L, "r");
            po.addFld("stackAlignment", Proto.Elm.newCNum("(xdc_UInt)"), 8L, "r");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.TaskSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.TaskSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.TaskSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.TaskSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "stackUsed$view");
                if (fxn != null) po.addFxn("stackUsed$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$stackUsed$view", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getCallStack$view");
                if (fxn != null) po.addFxn("getCallStack$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$getCallStack$view", "ti.sysbios.family.arp32"), fxn);
    }

    void Timer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arp32/Timer.xs");
        om.bind("ti.sysbios.family.arp32.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer.Module", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("TIMER_CLOCK_DIVIDER", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("MIN_SWEEP_PERIOD", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arp32"), $$UNDEF, "wh");
            po.addFld("E_invalidTimer", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arp32"), Global.newObject("msg", "E_invalidTimer: Invalid Timer Id %d"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arp32"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arp32"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period %d"), "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x3L, "w");
            po.addFld("startupNeeded", Proto.Elm.newCNum("(xdc_UInt)"), false, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arp32.Timer$$create", "ti.sysbios.family.arp32"), Global.get("ti$sysbios$family$arp32$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arp32.Timer$$construct", "ti.sysbios.family.arp32"), Global.get("ti$sysbios$family$arp32$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.family.arp32"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer.Instance", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("TIMER_CLOCK_DIVIDER", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("MIN_SWEEP_PERIOD", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arp32_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arp32"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$Params", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
                po.addFld("TIMER_CLOCK_DIVIDER", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
                po.addFld("MIN_SWEEP_PERIOD", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arp32_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arp32"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$Object", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Timer.Object", om.findStrict("ti.sysbios.family.arp32.Timer.Instance", "ti.sysbios.family.arp32"));
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$BasicView", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Timer.BasicView", null);
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
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$ModuleView", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Timer.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("availMask", $$T_Str, $$UNDEF, "w");
        // struct Timer.DeviceView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$DeviceView", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Timer.DeviceView", null);
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
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$Instance_State", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("staticInst", $$T_Bool, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("ctmid", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.family.arp32.Timer.RunMode", "ti.sysbios.family.arp32"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.family.arp32.Timer.StartMode", "ti.sysbios.family.arp32"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.family.arp32.Timer.PeriodType", "ti.sysbios.family.arp32"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("extFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.arp32"), $$DEFAULT, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.family.arp32.Hwi.Handle", "ti.sysbios.family.arp32"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$Module_State", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("baseAddr", new Proto.Adr("xdc_UInt*", "Pn"), $$UNDEF, "w");
                po.addFld("handles", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arp32.Timer.Handle", "ti.sysbios.family.arp32"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
    }

    void CTM$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arp32/CTM.xs");
        om.bind("ti.sysbios.family.arp32.CTM$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.CTM.Module", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.CTM.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.CTM$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.CTM$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.CTM$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.CTM$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct CTM.CTM
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.CTM$$CTM", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.CTM.CTM", null);
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

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arp32/Cache.xs");
        om.bind("ti.sysbios.family.arp32.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Cache.Module", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Cache.Module", om.findStrict("ti.sysbios.interfaces.ICache.Module", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("A_byteCountTooLarge", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arp32"), Global.newObject("msg", "A_byteCountTooLarge: byte count is too large"), "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arp32/TimestampProvider.xs");
        om.bind("ti.sysbios.family.arp32.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.TimestampProvider.Module", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.family.arp32"), fxn);
    }

    void IntrinsicsSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.IntrinsicsSupport.Module", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.IntrinsicsSupport.Module", om.findStrict("ti.sysbios.interfaces.IIntrinsicsSupport.Module", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void Settings$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arp32/Settings.xs");
        om.bind("ti.sysbios.family.arp32.Settings$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Settings.Module", "ti.sysbios.family.arp32");
        po.init("ti.sysbios.family.arp32.Settings.Module", om.findStrict("ti.sysbios.interfaces.ISettings.Module", "ti.sysbios.family.arp32"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Settings$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Settings$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arp32.Settings$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getDefaultCoreDelegate");
                if (fxn != null) po.addFxn("getDefaultCoreDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultCoreDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultHwiDelegate");
                if (fxn != null) po.addFxn("getDefaultHwiDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultHwiDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultTimerDelegate");
                if (fxn != null) po.addFxn("getDefaultTimerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimerDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultClockTimerDelegate");
                if (fxn != null) po.addFxn("getDefaultClockTimerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultClockTimerDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultTimerSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultTimerSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimerSupportDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultTimestampDelegate");
                if (fxn != null) po.addFxn("getDefaultTimestampDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimestampDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultTaskSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultTaskSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTaskSupportDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultIntrinsicsSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultIntrinsicsSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultIntrinsicsSupportDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultCacheDelegate");
                if (fxn != null) po.addFxn("getDefaultCacheDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultCacheDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultPowerDelegate");
                if (fxn != null) po.addFxn("getDefaultPowerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultPowerDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultSecondsDelegate");
                if (fxn != null) po.addFxn("getDefaultSecondsDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultSecondsDelegate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultBootModule");
                if (fxn != null) po.addFxn("getDefaultBootModule", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultBootModule", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultMmuModule");
                if (fxn != null) po.addFxn("getDefaultMmuModule", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultMmuModule", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getFamilySettingsXml");
                if (fxn != null) po.addFxn("getFamilySettingsXml", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getFamilySettingsXml", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getDefaultClockTickPeriod");
                if (fxn != null) po.addFxn("getDefaultClockTickPeriod", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultClockTickPeriod", "ti.sysbios.family.arp32"), fxn);
    }

    void Hwi$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$Instance_State", "ti.sysbios.family.arp32");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("IntcRegs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arp32.Hwi.IntcRegs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$IntcRegs", "ti.sysbios.family.arp32");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arp32.Hwi.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$Instance_State", "ti.sysbios.family.arp32");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arp32.Hwi.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi$$Module_State", "ti.sysbios.family.arp32");
        po.bind("interruptMask$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bits32", "isScalar", true));
        po.bind("disableIerMask$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bits16", "isScalar", true));
        po.bind("restoreIerMask$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bits16", "isScalar", true));
        po.bind("dispatchTable$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
    }

    void TaskSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.TaskSupport", "ti.sysbios.family.arp32");
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.Timer", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$Instance_State", "ti.sysbios.family.arp32");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arp32.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$Instance_State", "ti.sysbios.family.arp32");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arp32.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer$$Module_State", "ti.sysbios.family.arp32");
    }

    void CTM$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.CTM", "ti.sysbios.family.arp32");
        vo.bind("CTM$fetchDesc", Global.newObject("type", "ti.sysbios.family.arp32.CTM.CTM", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.CTM$$CTM", "ti.sysbios.family.arp32");
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.Cache", "ti.sysbios.family.arp32");
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.TimestampProvider", "ti.sysbios.family.arp32");
    }

    void IntrinsicsSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.IntrinsicsSupport", "ti.sysbios.family.arp32");
    }

    void Settings$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arp32.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arp32"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arp32/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arp32"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arp32"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arp32", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arp32");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arp32.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arp32'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arp32$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arp32$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arp32$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arp32.aearp32',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arp32.aearp32F',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arp32.aearp32', {target: 'ti.targets.arp32.elf.ARP32', suffix: 'earp32'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arp32.aearp32F', {target: 'ti.targets.arp32.elf.ARP32_far', suffix: 'earp32F'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Hwi$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi.Module", "ti.sysbios.family.arp32");
        vo.init2(po, "ti.sysbios.family.arp32.Hwi", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arp32.Hwi$$capsule", "ti.sysbios.family.arp32"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arp32.Hwi.Instance", "ti.sysbios.family.arp32"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arp32.Hwi.Params", "ti.sysbios.family.arp32"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arp32.Hwi.Params", "ti.sysbios.family.arp32")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arp32.Hwi.Handle", "ti.sysbios.family.arp32"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arp32", "ti.sysbios.family.arp32"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.IHwi.FuncPtr", "ti.sysbios.family.arp32"));
        vo.bind("Irp", om.findStrict("ti.sysbios.interfaces.IHwi.Irp", "ti.sysbios.family.arp32"));
        vo.bind("HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.arp32"));
        vo.bind("MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.arp32"));
        vo.bind("StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.arp32"));
        mcfgs.add("dispatcherAutoNestingSupport");
        mcfgs.add("dispatcherSwiSupport");
        mcfgs.add("dispatcherTaskSupport");
        mcfgs.add("dispatcherIrpTrackingSupport");
        vo.bind("PlugFuncPtr", om.findStrict("ti.sysbios.family.arp32.Hwi.PlugFuncPtr", "ti.sysbios.family.arp32"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arp32.Hwi.BasicView", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Hwi.BasicView", "ti.sysbios.family.arp32"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arp32.Hwi.ModuleView", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Hwi.ModuleView", "ti.sysbios.family.arp32"));
        mcfgs.add("NUM_INTERRUPTS");
        mcfgs.add("NUM_VECTORS");
        mcfgs.add("A_badIntNum");
        mcfgs.add("A_badVectNum");
        mcfgs.add("E_alreadyDefined");
        mcfgs.add("E_notImplemented");
        mcfgs.add("LM_begin");
        mcfgs.add("LD_end");
        mcfgs.add("initialIerMask");
        icfgs.add("initialIerMask");
        vo.bind("IntcRegs", om.findStrict("ti.sysbios.family.arp32.Hwi.IntcRegs", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Hwi.IntcRegs", "ti.sysbios.family.arp32"));
        mcfgs.add("INTCREGSBASEADDRS");
        icfgs.add("INTCREGSBASEADDRS");
        mcfgs.add("swiDisable");
        icfgs.add("swiDisable");
        mcfgs.add("swiRestoreHwi");
        icfgs.add("swiRestoreHwi");
        mcfgs.add("taskDisable");
        icfgs.add("taskDisable");
        mcfgs.add("taskRestoreHwi");
        icfgs.add("taskRestoreHwi");
        mcfgs.add("hooks");
        icfgs.add("hooks");
        vo.bind("VectorObj", om.findStrict("ti.sysbios.family.arp32.Hwi.VectorObj", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Hwi.VectorObj", "ti.sysbios.family.arp32"));
        vo.bind("NonDispatchedInterrupt", om.findStrict("ti.sysbios.family.arp32.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.arp32"));
        icfgs.add("nonDispatchedInterrupts");
        icfgs.add("vectors");
        vo.bind("InterruptObj", om.findStrict("ti.sysbios.family.arp32.Hwi.InterruptObj", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Hwi.InterruptObj", "ti.sysbios.family.arp32"));
        icfgs.add("interrupt");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arp32.Hwi.Instance_State", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Hwi.Instance_State", "ti.sysbios.family.arp32"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arp32.Hwi.Module_State", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Hwi.Module_State", "ti.sysbios.family.arp32"));
        vo.bind("MaskingOption_NONE", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_NONE", "ti.sysbios.family.arp32"));
        vo.bind("MaskingOption_ALL", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_ALL", "ti.sysbios.family.arp32"));
        vo.bind("MaskingOption_SELF", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_SELF", "ti.sysbios.family.arp32"));
        vo.bind("MaskingOption_BITMASK", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_BITMASK", "ti.sysbios.family.arp32"));
        vo.bind("MaskingOption_LOWER", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER", "ti.sysbios.family.arp32"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arp32")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arp32.Hwi$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arp32$Hwi$$__initObject"));
        }//isCFG
        vo.bind("getStackInfo", om.findStrict("ti.sysbios.family.arp32.Hwi.getStackInfo", "ti.sysbios.family.arp32"));
        vo.bind("getCoreStackInfo", om.findStrict("ti.sysbios.family.arp32.Hwi.getCoreStackInfo", "ti.sysbios.family.arp32"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arp32.Hwi.startup", "ti.sysbios.family.arp32"));
        vo.bind("switchFromBootStack", om.findStrict("ti.sysbios.family.arp32.Hwi.switchFromBootStack", "ti.sysbios.family.arp32"));
        vo.bind("post", om.findStrict("ti.sysbios.family.arp32.Hwi.post", "ti.sysbios.family.arp32"));
        vo.bind("getTaskSP", om.findStrict("ti.sysbios.family.arp32.Hwi.getTaskSP", "ti.sysbios.family.arp32"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.arp32.Hwi.disableInterrupt", "ti.sysbios.family.arp32"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.arp32.Hwi.enableInterrupt", "ti.sysbios.family.arp32"));
        vo.bind("restoreInterrupt", om.findStrict("ti.sysbios.family.arp32.Hwi.restoreInterrupt", "ti.sysbios.family.arp32"));
        vo.bind("clearInterrupt", om.findStrict("ti.sysbios.family.arp32.Hwi.clearInterrupt", "ti.sysbios.family.arp32"));
        vo.bind("selfLoop", om.findStrict("ti.sysbios.family.arp32.Hwi.selfLoop", "ti.sysbios.family.arp32"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arp32.Hwi.getHandle", "ti.sysbios.family.arp32"));
        vo.bind("disableIER", om.findStrict("ti.sysbios.family.arp32.Hwi.disableIER", "ti.sysbios.family.arp32"));
        vo.bind("enableIER", om.findStrict("ti.sysbios.family.arp32.Hwi.enableIER", "ti.sysbios.family.arp32"));
        vo.bind("restoreIER", om.findStrict("ti.sysbios.family.arp32.Hwi.restoreIER", "ti.sysbios.family.arp32"));
        vo.bind("plug", om.findStrict("ti.sysbios.family.arp32.Hwi.plug", "ti.sysbios.family.arp32"));
        vo.bind("postIntVector", om.findStrict("ti.sysbios.family.arp32.Hwi.postIntVector", "ti.sysbios.family.arp32"));
        vo.bind("getIsrStackAddress", om.findStrict("ti.sysbios.family.arp32.Hwi.getIsrStackAddress", "ti.sysbios.family.arp32"));
        vo.bind("dispatchC", om.findStrict("ti.sysbios.family.arp32.Hwi.dispatchC", "ti.sysbios.family.arp32"));
        vo.bind("dispatchCore", om.findStrict("ti.sysbios.family.arp32.Hwi.dispatchCore", "ti.sysbios.family.arp32"));
        vo.bind("switchAndDispatch", om.findStrict("ti.sysbios.family.arp32.Hwi.switchAndDispatch", "ti.sysbios.family.arp32"));
        vo.bind("unPluggedInterrupt", om.findStrict("ti.sysbios.family.arp32.Hwi.unPluggedInterrupt", "ti.sysbios.family.arp32"));
        vo.bind("nmiInterrupt", om.findStrict("ti.sysbios.family.arp32.Hwi.nmiInterrupt", "ti.sysbios.family.arp32"));
        vo.bind("swiInterrupt", om.findStrict("ti.sysbios.family.arp32.Hwi.swiInterrupt", "ti.sysbios.family.arp32"));
        vo.bind("undefInterrupt", om.findStrict("ti.sysbios.family.arp32.Hwi.undefInterrupt", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr4", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr4", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr5", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr5", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr6", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr6", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr7", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr7", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr8", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr8", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr9", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr9", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr10", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr10", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr11", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr11", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr12", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr12", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr13", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr13", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr14", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr14", "ti.sysbios.family.arp32"));
        vo.bind("dispIsr15", om.findStrict("ti.sysbios.family.arp32.Hwi.dispIsr15", "ti.sysbios.family.arp32"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arp32.Hwi.postInit", "ti.sysbios.family.arp32"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arp32_Hwi_Handle__label__E", "ti_sysbios_family_arp32_Hwi_Module__startupDone__E", "ti_sysbios_family_arp32_Hwi_Object__create__E", "ti_sysbios_family_arp32_Hwi_Object__delete__E", "ti_sysbios_family_arp32_Hwi_Object__get__E", "ti_sysbios_family_arp32_Hwi_Object__first__E", "ti_sysbios_family_arp32_Hwi_Object__next__E", "ti_sysbios_family_arp32_Hwi_Params__init__E", "ti_sysbios_family_arp32_Hwi_getStackInfo__E", "ti_sysbios_family_arp32_Hwi_getCoreStackInfo__E", "ti_sysbios_family_arp32_Hwi_startup__E", "ti_sysbios_family_arp32_Hwi_switchFromBootStack__E", "ti_sysbios_family_arp32_Hwi_post__E", "ti_sysbios_family_arp32_Hwi_getTaskSP__E", "ti_sysbios_family_arp32_Hwi_disableInterrupt__E", "ti_sysbios_family_arp32_Hwi_enableInterrupt__E", "ti_sysbios_family_arp32_Hwi_restoreInterrupt__E", "ti_sysbios_family_arp32_Hwi_clearInterrupt__E", "ti_sysbios_family_arp32_Hwi_getFunc__E", "ti_sysbios_family_arp32_Hwi_setFunc__E", "ti_sysbios_family_arp32_Hwi_getHookContext__E", "ti_sysbios_family_arp32_Hwi_setHookContext__E", "ti_sysbios_family_arp32_Hwi_getIrp__E", "ti_sysbios_family_arp32_Hwi_disable__E", "ti_sysbios_family_arp32_Hwi_enable__E", "ti_sysbios_family_arp32_Hwi_restore__E", "ti_sysbios_family_arp32_Hwi_selfLoop__E", "ti_sysbios_family_arp32_Hwi_getHandle__E", "ti_sysbios_family_arp32_Hwi_disableIER__E", "ti_sysbios_family_arp32_Hwi_enableIER__E", "ti_sysbios_family_arp32_Hwi_restoreIER__E", "ti_sysbios_family_arp32_Hwi_plug__E", "ti_sysbios_family_arp32_Hwi_postIntVector__E", "ti_sysbios_family_arp32_Hwi_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray("LM_begin", "LD_end"));
        vo.bind("$$errorDescCfgs", Global.newArray("E_alreadyDefined", "E_notImplemented"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_badIntNum", "A_badVectNum"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Hwi.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.arp32.Hwi.Object", "ti.sysbios.family.arp32"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Hwi.xdt");
        pkgV.bind("Hwi", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Hwi");
    }

    void TaskSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.TaskSupport", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.TaskSupport.Module", "ti.sysbios.family.arp32");
        vo.init2(po, "ti.sysbios.family.arp32.TaskSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arp32.TaskSupport$$capsule", "ti.sysbios.family.arp32"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arp32", "ti.sysbios.family.arp32"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITaskSupport.FuncPtr", "ti.sysbios.family.arp32"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arp32")).add(vo);
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
        vo.bind("start", om.findStrict("ti.sysbios.family.arp32.TaskSupport.start", "ti.sysbios.family.arp32"));
        vo.bind("swap", om.findStrict("ti.sysbios.family.arp32.TaskSupport.swap", "ti.sysbios.family.arp32"));
        vo.bind("checkStack", om.findStrict("ti.sysbios.family.arp32.TaskSupport.checkStack", "ti.sysbios.family.arp32"));
        vo.bind("stackUsed", om.findStrict("ti.sysbios.family.arp32.TaskSupport.stackUsed", "ti.sysbios.family.arp32"));
        vo.bind("getStackAlignment", om.findStrict("ti.sysbios.family.arp32.TaskSupport.getStackAlignment", "ti.sysbios.family.arp32"));
        vo.bind("getDefaultStackSize", om.findStrict("ti.sysbios.family.arp32.TaskSupport.getDefaultStackSize", "ti.sysbios.family.arp32"));
        vo.bind("getCheckValueAddr", om.findStrict("ti.sysbios.family.arp32.TaskSupport.getCheckValueAddr", "ti.sysbios.family.arp32"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arp32_TaskSupport_Module__startupDone__E", "ti_sysbios_family_arp32_TaskSupport_start__E", "ti_sysbios_family_arp32_TaskSupport_swap__E", "ti_sysbios_family_arp32_TaskSupport_checkStack__E", "ti_sysbios_family_arp32_TaskSupport_stackUsed__E", "ti_sysbios_family_arp32_TaskSupport_getStackAlignment__E", "ti_sysbios_family_arp32_TaskSupport_getDefaultStackSize__E", "ti_sysbios_family_arp32_TaskSupport_getCheckValueAddr__E"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.Timer", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Timer.Module", "ti.sysbios.family.arp32");
        vo.init2(po, "ti.sysbios.family.arp32.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arp32.Timer$$capsule", "ti.sysbios.family.arp32"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arp32.Timer.Instance", "ti.sysbios.family.arp32"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arp32.Timer.Params", "ti.sysbios.family.arp32"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arp32.Timer.Params", "ti.sysbios.family.arp32")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arp32.Timer.Handle", "ti.sysbios.family.arp32"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arp32", "ti.sysbios.family.arp32"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.family.arp32"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arp32"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arp32"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arp32"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arp32"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arp32.Timer.BasicView", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Timer.BasicView", "ti.sysbios.family.arp32"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arp32.Timer.ModuleView", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Timer.ModuleView", "ti.sysbios.family.arp32"));
        vo.bind("DeviceView", om.findStrict("ti.sysbios.family.arp32.Timer.DeviceView", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Timer.DeviceView", "ti.sysbios.family.arp32"));
        mcfgs.add("E_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("anyMask");
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arp32.Timer.Instance_State", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Timer.Instance_State", "ti.sysbios.family.arp32"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arp32.Timer.Module_State", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.Timer.Module_State", "ti.sysbios.family.arp32"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.family.arp32"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.family.arp32"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.family.arp32"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.family.arp32"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.family.arp32"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.family.arp32"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.family.arp32"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.family.arp32"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.family.arp32"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arp32")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arp32.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arp32$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.family.arp32.Timer.getNumTimers", "ti.sysbios.family.arp32"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.family.arp32.Timer.getStatus", "ti.sysbios.family.arp32"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arp32.Timer.startup", "ti.sysbios.family.arp32"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arp32.Timer.getHandle", "ti.sysbios.family.arp32"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arp32.Timer.postInit", "ti.sysbios.family.arp32"));
        vo.bind("checkOverflow", om.findStrict("ti.sysbios.family.arp32.Timer.checkOverflow", "ti.sysbios.family.arp32"));
        vo.bind("initDevice", om.findStrict("ti.sysbios.family.arp32.Timer.initDevice", "ti.sysbios.family.arp32"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arp32_Timer_Handle__label__E", "ti_sysbios_family_arp32_Timer_Module__startupDone__E", "ti_sysbios_family_arp32_Timer_Object__create__E", "ti_sysbios_family_arp32_Timer_Object__delete__E", "ti_sysbios_family_arp32_Timer_Object__get__E", "ti_sysbios_family_arp32_Timer_Object__first__E", "ti_sysbios_family_arp32_Timer_Object__next__E", "ti_sysbios_family_arp32_Timer_Params__init__E", "ti_sysbios_family_arp32_Timer_getNumTimers__E", "ti_sysbios_family_arp32_Timer_getStatus__E", "ti_sysbios_family_arp32_Timer_startup__E", "ti_sysbios_family_arp32_Timer_getMaxTicks__E", "ti_sysbios_family_arp32_Timer_setNextTick__E", "ti_sysbios_family_arp32_Timer_start__E", "ti_sysbios_family_arp32_Timer_stop__E", "ti_sysbios_family_arp32_Timer_setPeriod__E", "ti_sysbios_family_arp32_Timer_setPeriodMicroSecs__E", "ti_sysbios_family_arp32_Timer_getPeriod__E", "ti_sysbios_family_arp32_Timer_getCount__E", "ti_sysbios_family_arp32_Timer_getFreq__E", "ti_sysbios_family_arp32_Timer_getFunc__E", "ti_sysbios_family_arp32_Timer_setFunc__E", "ti_sysbios_family_arp32_Timer_trigger__E", "ti_sysbios_family_arp32_Timer_getExpiredCounts__E", "ti_sysbios_family_arp32_Timer_getExpiredTicks__E", "ti_sysbios_family_arp32_Timer_getCurrentTick__E", "ti_sysbios_family_arp32_Timer_getHandle__E", "ti_sysbios_family_arp32_Timer_reconfig__E"));
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
        vo.bind("Object", om.findStrict("ti.sysbios.family.arp32.Timer.Object", "ti.sysbios.family.arp32"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Timer", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer");
    }

    void CTM$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.CTM", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.CTM.Module", "ti.sysbios.family.arp32");
        vo.init2(po, "ti.sysbios.family.arp32.CTM", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arp32.CTM$$capsule", "ti.sysbios.family.arp32"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arp32", "ti.sysbios.family.arp32"));
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
        vo.bind("CTM", om.findStrict("ti.sysbios.family.arp32.CTM.CTM", "ti.sysbios.family.arp32"));
        tdefs.add(om.findStrict("ti.sysbios.family.arp32.CTM.CTM", "ti.sysbios.family.arp32"));
        vo.bind("ctm", om.findStrict("ti.sysbios.family.arp32.CTM.ctm", "ti.sysbios.family.arp32"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arp32")).add(vo);
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
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arp32_CTM_Module__startupDone__E"));
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

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.Cache", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Cache.Module", "ti.sysbios.family.arp32");
        vo.init2(po, "ti.sysbios.family.arp32.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arp32.Cache$$capsule", "ti.sysbios.family.arp32"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arp32", "ti.sysbios.family.arp32"));
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
        vo.bind("Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arp32"));
        mcfgs.add("A_byteCountTooLarge");
        vo.bind("Type_L1P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1P", "ti.sysbios.family.arp32"));
        vo.bind("Type_L1D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1D", "ti.sysbios.family.arp32"));
        vo.bind("Type_L1", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1", "ti.sysbios.family.arp32"));
        vo.bind("Type_L2P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2P", "ti.sysbios.family.arp32"));
        vo.bind("Type_L2D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2D", "ti.sysbios.family.arp32"));
        vo.bind("Type_L2", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2", "ti.sysbios.family.arp32"));
        vo.bind("Type_ALLP", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLP", "ti.sysbios.family.arp32"));
        vo.bind("Type_ALLD", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLD", "ti.sysbios.family.arp32"));
        vo.bind("Type_ALL", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALL", "ti.sysbios.family.arp32"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arp32")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arp32.Cache.enable", "ti.sysbios.family.arp32"));
        vo.bind("disable", om.findStrict("ti.sysbios.family.arp32.Cache.disable", "ti.sysbios.family.arp32"));
        vo.bind("inv", om.findStrict("ti.sysbios.family.arp32.Cache.inv", "ti.sysbios.family.arp32"));
        vo.bind("wb", om.findStrict("ti.sysbios.family.arp32.Cache.wb", "ti.sysbios.family.arp32"));
        vo.bind("wbInv", om.findStrict("ti.sysbios.family.arp32.Cache.wbInv", "ti.sysbios.family.arp32"));
        vo.bind("wbAll", om.findStrict("ti.sysbios.family.arp32.Cache.wbAll", "ti.sysbios.family.arp32"));
        vo.bind("wbInvAll", om.findStrict("ti.sysbios.family.arp32.Cache.wbInvAll", "ti.sysbios.family.arp32"));
        vo.bind("wait", om.findStrict("ti.sysbios.family.arp32.Cache.wait", "ti.sysbios.family.arp32"));
        vo.bind("invL1pAll", om.findStrict("ti.sysbios.family.arp32.Cache.invL1pAll", "ti.sysbios.family.arp32"));
        vo.bind("invL1pSingleAddr", om.findStrict("ti.sysbios.family.arp32.Cache.invL1pSingleAddr", "ti.sysbios.family.arp32"));
        vo.bind("preloadL1p", om.findStrict("ti.sysbios.family.arp32.Cache.preloadL1p", "ti.sysbios.family.arp32"));
        vo.bind("block", om.findStrict("ti.sysbios.family.arp32.Cache.block", "ti.sysbios.family.arp32"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arp32_Cache_Module__startupDone__E", "ti_sysbios_family_arp32_Cache_enable__E", "ti_sysbios_family_arp32_Cache_disable__E", "ti_sysbios_family_arp32_Cache_inv__E", "ti_sysbios_family_arp32_Cache_wb__E", "ti_sysbios_family_arp32_Cache_wbInv__E", "ti_sysbios_family_arp32_Cache_wbAll__E", "ti_sysbios_family_arp32_Cache_wbInvAll__E", "ti_sysbios_family_arp32_Cache_wait__E", "ti_sysbios_family_arp32_Cache_invL1pAll__E", "ti_sysbios_family_arp32_Cache_invL1pSingleAddr__E", "ti_sysbios_family_arp32_Cache_preloadL1p__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_byteCountTooLarge"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Cache", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Cache");
    }

    void TimestampProvider$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.TimestampProvider", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.TimestampProvider.Module", "ti.sysbios.family.arp32");
        vo.init2(po, "ti.sysbios.family.arp32.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arp32.TimestampProvider$$capsule", "ti.sysbios.family.arp32"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arp32", "ti.sysbios.family.arp32"));
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
        inherits.add("xdc.runtime");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arp32")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.family.arp32.TimestampProvider.get32", "ti.sysbios.family.arp32"));
        vo.bind("get64", om.findStrict("ti.sysbios.family.arp32.TimestampProvider.get64", "ti.sysbios.family.arp32"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.family.arp32.TimestampProvider.getFreq", "ti.sysbios.family.arp32"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arp32_TimestampProvider_Module__startupDone__E", "ti_sysbios_family_arp32_TimestampProvider_get32__E", "ti_sysbios_family_arp32_TimestampProvider_get64__E", "ti_sysbios_family_arp32_TimestampProvider_getFreq__E"));
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

    void IntrinsicsSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.IntrinsicsSupport", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.IntrinsicsSupport.Module", "ti.sysbios.family.arp32");
        vo.init2(po, "ti.sysbios.family.arp32.IntrinsicsSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.sysbios.family.arp32", "ti.sysbios.family.arp32"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arp32")).add(vo);
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
        vo.bind("maxbit", om.findStrict("ti.sysbios.family.arp32.IntrinsicsSupport.maxbit", "ti.sysbios.family.arp32"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arp32_IntrinsicsSupport_Module__startupDone__E", "ti_sysbios_family_arp32_IntrinsicsSupport_maxbit__E"));
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

    void Settings$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.Settings", "ti.sysbios.family.arp32");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arp32.Settings.Module", "ti.sysbios.family.arp32");
        vo.init2(po, "ti.sysbios.family.arp32.Settings", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arp32.Settings$$capsule", "ti.sysbios.family.arp32"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arp32", "ti.sysbios.family.arp32"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arp32")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arp32.Settings$$instance$static$init", null) ? 1 : 0);
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
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arp32")).findStrict("PARAMS", "ti.sysbios.family.arp32");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arp32.Hwi", "ti.sysbios.family.arp32")).findStrict("PARAMS", "ti.sysbios.family.arp32");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arp32.Timer", "ti.sysbios.family.arp32")).findStrict("PARAMS", "ti.sysbios.family.arp32");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arp32.Hwi", "ti.sysbios.family.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arp32.TaskSupport", "ti.sysbios.family.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arp32.Timer", "ti.sysbios.family.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arp32.CTM", "ti.sysbios.family.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arp32.Cache", "ti.sysbios.family.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arp32.TimestampProvider", "ti.sysbios.family.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arp32.IntrinsicsSupport", "ti.sysbios.family.arp32"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arp32.Settings", "ti.sysbios.family.arp32"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.Hwi", "ti.sysbios.family.arp32");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arp32.Timer", "ti.sysbios.family.arp32");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Device", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitDevice", "structName", "DeviceView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arp32.Hwi")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arp32.TaskSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arp32.Timer")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arp32.CTM")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arp32.Cache")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arp32.TimestampProvider")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arp32.IntrinsicsSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arp32.Settings")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arp32")).add(pkgV);
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
        TaskSupport$$OBJECTS();
        Timer$$OBJECTS();
        CTM$$OBJECTS();
        Cache$$OBJECTS();
        TimestampProvider$$OBJECTS();
        IntrinsicsSupport$$OBJECTS();
        Settings$$OBJECTS();
        Hwi$$CONSTS();
        TaskSupport$$CONSTS();
        Timer$$CONSTS();
        CTM$$CONSTS();
        Cache$$CONSTS();
        TimestampProvider$$CONSTS();
        IntrinsicsSupport$$CONSTS();
        Settings$$CONSTS();
        Hwi$$CREATES();
        TaskSupport$$CREATES();
        Timer$$CREATES();
        CTM$$CREATES();
        Cache$$CREATES();
        TimestampProvider$$CREATES();
        IntrinsicsSupport$$CREATES();
        Settings$$CREATES();
        Hwi$$FUNCTIONS();
        TaskSupport$$FUNCTIONS();
        Timer$$FUNCTIONS();
        CTM$$FUNCTIONS();
        Cache$$FUNCTIONS();
        TimestampProvider$$FUNCTIONS();
        IntrinsicsSupport$$FUNCTIONS();
        Settings$$FUNCTIONS();
        Hwi$$SIZES();
        TaskSupport$$SIZES();
        Timer$$SIZES();
        CTM$$SIZES();
        Cache$$SIZES();
        TimestampProvider$$SIZES();
        IntrinsicsSupport$$SIZES();
        Settings$$SIZES();
        Hwi$$TYPES();
        TaskSupport$$TYPES();
        Timer$$TYPES();
        CTM$$TYPES();
        Cache$$TYPES();
        TimestampProvider$$TYPES();
        IntrinsicsSupport$$TYPES();
        Settings$$TYPES();
        if (isROV) {
            Hwi$$ROV();
            TaskSupport$$ROV();
            Timer$$ROV();
            CTM$$ROV();
            Cache$$ROV();
            TimestampProvider$$ROV();
            IntrinsicsSupport$$ROV();
            Settings$$ROV();
        }//isROV
        $$SINGLETONS();
        Hwi$$SINGLETONS();
        TaskSupport$$SINGLETONS();
        Timer$$SINGLETONS();
        CTM$$SINGLETONS();
        Cache$$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        IntrinsicsSupport$$SINGLETONS();
        Settings$$SINGLETONS();
        $$INITIALIZATION();
    }
}
