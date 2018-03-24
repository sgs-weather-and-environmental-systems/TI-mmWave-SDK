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

public class ti_sysbios_family_c28
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
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.c28.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.c28", new Value.Obj("ti.sysbios.family.c28", pkgP));
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c28.TimestampProvider", new Value.Obj("ti.sysbios.family.c28.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.TimestampProvider$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.TimestampProvider.Module_State", new Proto.Str(spo, false));
    }

    void Clobber$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.Clobber.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c28.Clobber", new Value.Obj("ti.sysbios.family.c28.Clobber", po));
        pkgV.bind("Clobber", vo);
        // decls 
    }

    void Hwi$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.Hwi.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c28.Hwi", new Value.Obj("ti.sysbios.family.c28.Hwi", po));
        pkgV.bind("Hwi", vo);
        // decls 
        om.bind("ti.sysbios.family.c28.Hwi.HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.c28"));
        om.bind("ti.sysbios.family.c28.Hwi.MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.c28"));
        om.bind("ti.sysbios.family.c28.Hwi.StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.c28"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Hwi$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Hwi.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Hwi$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Hwi.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Hwi$$NonDispatchedInterrupt", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Hwi.NonDispatchedInterrupt", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Hwi$$InterruptObj", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Hwi.InterruptObj", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Hwi$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Hwi.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Hwi$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Hwi.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.c28.Hwi.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.Hwi$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Hwi.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.Hwi$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Hwi.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.c28.Hwi.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.c28.Hwi.Object", om.findStrict("ti.sysbios.family.c28.Hwi.Instance_State", "ti.sysbios.family.c28"));
        }//isROV
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c28.Timer", new Value.Obj("ti.sysbios.family.c28.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.family.c28.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.c28"));
        om.bind("ti.sysbios.family.c28.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.c28"));
        om.bind("ti.sysbios.family.c28.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.c28"));
        om.bind("ti.sysbios.family.c28.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.c28"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Timer$$EmulationMode", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Timer.EmulationMode", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Timer$$DeviceView", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Timer.DeviceView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.c28.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.c28.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.c28.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.c28.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.c28.Timer.Object", om.findStrict("ti.sysbios.family.c28.Timer.Instance_State", "ti.sysbios.family.c28"));
        }//isROV
    }

    void IntrinsicsSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.IntrinsicsSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c28.IntrinsicsSupport", new Value.Obj("ti.sysbios.family.c28.IntrinsicsSupport", po));
        pkgV.bind("IntrinsicsSupport", vo);
        // decls 
    }

    void TaskSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.TaskSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c28.TaskSupport", new Value.Obj("ti.sysbios.family.c28.TaskSupport", po));
        pkgV.bind("TaskSupport", vo);
        // decls 
    }

    void Settings$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.c28.Settings.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.c28.Settings", new Value.Obj("ti.sysbios.family.c28.Settings", po));
        pkgV.bind("Settings", vo);
        // decls 
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.family.c28.TimestampProvider.get32", new Extern("ti_sysbios_family_c28_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.TimestampProvider.get64", new Extern("ti_sysbios_family_c28_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.family.c28.TimestampProvider.getFreq", new Extern("ti_sysbios_family_c28_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
        om.bind("ti.sysbios.family.c28.TimestampProvider.startTimer", new Extern("ti_sysbios_family_c28_TimestampProvider_startTimer__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.TimestampProvider.rolloverFunc", new Extern("ti_sysbios_family_c28_TimestampProvider_rolloverFunc__E", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void Clobber$$CONSTS()
    {
        // module Clobber
        om.bind("ti.sysbios.family.c28.Clobber.trashScratchRegs", new Extern("ti_sysbios_family_c28_Clobber_trashScratchRegs__E", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.c28.Clobber.trashPreservedRegs", new Extern("ti_sysbios_family_c28_Clobber_trashPreservedRegs__E", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.c28.Clobber.checkScratchRegs", new Extern("ti_sysbios_family_c28_Clobber_checkScratchRegs__E", "xdc_UInt(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.c28.Clobber.checkPreservedRegs", new Extern("ti_sysbios_family_c28_Clobber_checkPreservedRegs__E", "xdc_UInt(*)(xdc_UInt32)", true, false));
    }

    void Hwi$$CONSTS()
    {
        // module Hwi
        om.bind("ti.sysbios.family.c28.Hwi.NUM_INTERRUPTS", 32L);
        om.bind("ti.sysbios.family.c28.Hwi.PIEIER1_ADDR", 0x000CE2L);
        om.bind("ti.sysbios.family.c28.Hwi.getStackInfo", new Extern("ti_sysbios_family_c28_Hwi_getStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.getCoreStackInfo", new Extern("ti_sysbios_family_c28_Hwi_getCoreStackInfo__E", "xdc_Bool(*)(ti_sysbios_interfaces_IHwi_StackInfo*,xdc_Bool,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.startup", new Extern("ti_sysbios_family_c28_Hwi_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.switchFromBootStack", new Extern("ti_sysbios_family_c28_Hwi_switchFromBootStack__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.post", new Extern("ti_sysbios_family_c28_Hwi_post__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.getTaskSP", new Extern("ti_sysbios_family_c28_Hwi_getTaskSP__E", "xdc_Char*(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.plug", new Extern("ti_sysbios_family_c28_Hwi_plug__E", "xdc_Void(*)(xdc_UInt,xdc_Void(*)(xdc_Void))", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.getHandle", new Extern("ti_sysbios_family_c28_Hwi_getHandle__E", "ti_sysbios_family_c28_Hwi_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.disableInterrupt", new Extern("ti_sysbios_family_c28_Hwi_disableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.enableInterrupt", new Extern("ti_sysbios_family_c28_Hwi_enableInterrupt__E", "xdc_UInt(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.restoreInterrupt", new Extern("ti_sysbios_family_c28_Hwi_restoreInterrupt__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.clearInterrupt", new Extern("ti_sysbios_family_c28_Hwi_clearInterrupt__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.disableIER", new Extern("ti_sysbios_family_c28_Hwi_disableIER__E", "xdc_Bits16(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.enableIER", new Extern("ti_sysbios_family_c28_Hwi_enableIER__E", "xdc_Bits16(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.restoreIER", new Extern("ti_sysbios_family_c28_Hwi_restoreIER__E", "xdc_Bits16(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.enablePIEIER", new Extern("ti_sysbios_family_c28_Hwi_enablePIEIER__E", "xdc_Bits16(*)(xdc_UInt,xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.disablePIEIER", new Extern("ti_sysbios_family_c28_Hwi_disablePIEIER__E", "xdc_Bits16(*)(xdc_UInt,xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.restorePIEIER", new Extern("ti_sysbios_family_c28_Hwi_restorePIEIER__E", "xdc_Bits16(*)(xdc_UInt,xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.getInterruptFlag", new Extern("ti_sysbios_family_c28_Hwi_getInterruptFlag__E", "xdc_Bits16(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.postInit", new Extern("ti_sysbios_family_c28_Hwi_postInit__I", "xdc_Int(*)(ti_sysbios_family_c28_Hwi_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.getIFR", new Extern("ti_sysbios_family_c28_Hwi_getIFR__I", "xdc_Bits16(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.ack", new Extern("ti_sysbios_family_c28_Hwi_ack__I", "xdc_Void(*)(ti_sysbios_family_c28_Hwi_Handle)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.interruptReturn", new Extern("ti_sysbios_family_c28_Hwi_interruptReturn__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.getIERBit", new Extern("ti_sysbios_family_c28_Hwi_getIERBit__I", "xdc_Bits16(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.dispatchC", new Extern("ti_sysbios_family_c28_Hwi_dispatchC__I", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.dispatchCore", new Extern("ti_sysbios_family_c28_Hwi_dispatchCore__I", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.switchAndDispatch", new Extern("ti_sysbios_family_c28_Hwi_switchAndDispatch__I", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.c28.Hwi.unPluggedInterrupt", new Extern("ti_sysbios_family_c28_Hwi_unPluggedInterrupt__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.family.c28.Timer.MAX_PERIOD", 0xffffffffL);
        om.bind("ti.sysbios.family.c28.Timer.NUM_TIMER_DEVICES", 3L);
        om.bind("ti.sysbios.family.c28.Timer.getNumTimers", new Extern("ti_sysbios_family_c28_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.Timer.getStatus", new Extern("ti_sysbios_family_c28_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.c28.Timer.startup", new Extern("ti_sysbios_family_c28_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.Timer.postInit", new Extern("ti_sysbios_family_c28_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_family_c28_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.c28.Timer.stopAndClear", new Extern("ti_sysbios_family_c28_Timer_stopAndClear__I", "xdc_Void(*)(ti_sysbios_family_c28_Timer_Object*)", true, false));
        om.bind("ti.sysbios.family.c28.Timer.checkOverflow", new Extern("ti_sysbios_family_c28_Timer_checkOverflow__I", "xdc_Bool(*)(xdc_UInt32,xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.c28.Timer.oneShotStub", new Extern("ti_sysbios_family_c28_Timer_oneShotStub__I", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void IntrinsicsSupport$$CONSTS()
    {
        // module IntrinsicsSupport
        om.bind("ti.sysbios.family.c28.IntrinsicsSupport.maxbit", new Extern("ti_sysbios_family_c28_IntrinsicsSupport_maxbit__E", "xdc_UInt(*)(xdc_UInt)", true, false));
    }

    void TaskSupport$$CONSTS()
    {
        // module TaskSupport
        om.bind("ti.sysbios.family.c28.TaskSupport.start", new Extern("ti_sysbios_family_c28_TaskSupport_start__E", "xdc_Ptr(*)(xdc_Ptr,xdc_Void(*)(xdc_Void),xdc_Void(*)(xdc_Void),xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.c28.TaskSupport.swap", new Extern("ti_sysbios_family_c28_TaskSupport_swap__E", "xdc_Void(*)(xdc_Ptr*,xdc_Ptr*)", true, false));
        om.bind("ti.sysbios.family.c28.TaskSupport.checkStack", new Extern("ti_sysbios_family_c28_TaskSupport_checkStack__E", "xdc_Bool(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.c28.TaskSupport.stackUsed", new Extern("ti_sysbios_family_c28_TaskSupport_stackUsed__E", "xdc_SizeT(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.c28.TaskSupport.getStackAlignment", new Extern("ti_sysbios_family_c28_TaskSupport_getStackAlignment__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.TaskSupport.getDefaultStackSize", new Extern("ti_sysbios_family_c28_TaskSupport_getDefaultStackSize__E", "xdc_SizeT(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.c28.TaskSupport.getCheckValueAddr", new Extern("ti_sysbios_family_c28_TaskSupport_getCheckValueAddr__E", "xdc_Ptr(*)(xdc_Ptr)", true, false));
    }

    void Settings$$CONSTS()
    {
        // module Settings
    }

    void TimestampProvider$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Clobber$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Hwi$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$c28$Hwi$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.c28.Hwi.create() called before xdc.useModule('ti.sysbios.family.c28.Hwi')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.intNum, inst.$args.hwiFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c28.Hwi$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.c28.Hwi.Module", "ti.sysbios.family.c28"), om.findStrict("ti.sysbios.family.c28.Hwi.Instance", "ti.sysbios.family.c28"), 3, 2, false));
                        fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.c28.Hwi.Params", "ti.sysbios.family.c28"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$c28$Hwi$$create = function( intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.c28.Hwi'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.c28.Hwi.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.c28']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.c28.Hwi'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [intNum, hwiFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.c28.Hwi'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c28.Hwi$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.c28.Hwi.Module", "ti.sysbios.family.c28"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.c28.Hwi$$Object", "ti.sysbios.family.c28"), null);
                        fxn.addArg(1, "intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "hwiFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.c28.Hwi.Params", "ti.sysbios.family.c28"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$c28$Hwi$$construct = function( __obj, intNum, hwiFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.c28.Hwi'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {intNum:intNum, hwiFxn:hwiFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.c28.Hwi'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.c28.Hwi'].__initObject(__inst);\n");
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
            sb.append("ti$sysbios$family$c28$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.c28.Timer.create() called before xdc.useModule('ti.sysbios.family.c28.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c28.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.c28.Timer.Module", "ti.sysbios.family.c28"), om.findStrict("ti.sysbios.family.c28.Timer.Instance", "ti.sysbios.family.c28"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.c28.Timer.Params", "ti.sysbios.family.c28"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$c28$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.c28.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.c28.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.c28']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.c28.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.c28.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c28.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.c28.Timer.Module", "ti.sysbios.family.c28"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.c28.Timer$$Object", "ti.sysbios.family.c28"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.c28.Timer.Params", "ti.sysbios.family.c28"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$c28$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.c28.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.c28.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.c28.Timer'].__initObject(__inst);\n");
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

    void Settings$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void TimestampProvider$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Clobber$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Hwi$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Hwi.inUseMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c28.Hwi$$inUseMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c28.Hwi.Module", "ti.sysbios.family.c28"), $$T_Bool, 1, 1, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
        // fxn Hwi.plugMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c28.Hwi$$plugMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.c28.Hwi.Module", "ti.sysbios.family.c28"), null, 2, 2, false));
                fxn.addArg(0, "intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "fxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF);
        // fxn Hwi.getIERMask
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.c28.Hwi$$getIERMask", new Proto.Fxn(om.findStrict("ti.sysbios.family.c28.Hwi.Module", "ti.sysbios.family.c28"), Proto.Elm.newCNum("(xdc_UInt)"), 1, 1, false));
                fxn.addArg(0, "vecIds", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false), $$DEFAULT);
    }

    void Timer$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void IntrinsicsSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TaskSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Settings$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TimestampProvider$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c28.TimestampProvider.Module_State", "ti.sysbios.family.c28");
        sizes.clear();
        sizes.add(Global.newArray("timer", "UPtr"));
        sizes.add(Global.newArray("hi", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c28.TimestampProvider.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c28.TimestampProvider.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c28.TimestampProvider.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Clobber$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Hwi$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c28.Hwi.Instance_State", "ti.sysbios.family.c28");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("enableInt", "UShort"));
        sizes.add(Global.newArray("enableAck", "UShort"));
        sizes.add(Global.newArray("disableMask", "UInt16"));
        sizes.add(Global.newArray("restoreMask", "UInt16"));
        sizes.add(Global.newArray("ierBitMask", "UInt16"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("fxn", "UFxn"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("hookEnv", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c28.Hwi.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c28.Hwi.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c28.Hwi.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c28.Hwi.Module_State", "ti.sysbios.family.c28");
        sizes.clear();
        sizes.add(Global.newArray("ierMask", "UInt16"));
        sizes.add(Global.newArray("isrStack", "UPtr"));
        sizes.add(Global.newArray("taskSP", "UPtr"));
        sizes.add(Global.newArray("dispatchTable", "UPtr"));
        sizes.add(Global.newArray("irp", "UIArg"));
        sizes.add(Global.newArray("globalEnable", "UShort"));
        sizes.add(Global.newArray("shadowIER", "UInt16"));
        sizes.add(Global.newArray("isrStackBase", "UPtr"));
        sizes.add(Global.newArray("isrStackSize", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c28.Hwi.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c28.Hwi.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c28.Hwi.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Timer$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.c28.Timer.EmulationMode", "ti.sysbios.family.c28");
        sizes.clear();
        sizes.add(Global.newArray("free", "UInt"));
        sizes.add(Global.newArray("soft", "UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c28.Timer.EmulationMode']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c28.Timer.EmulationMode']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c28.Timer.EmulationMode'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c28.Timer.Instance_State", "ti.sysbios.family.c28");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("id", "TInt"));
        sizes.add(Global.newArray("emulationModeInit", "Sti.sysbios.family.c28.Timer;EmulationMode"));
        sizes.add(Global.newArray("runMode", "Nti.sysbios.interfaces.ITimer.RunMode;;;;"));
        sizes.add(Global.newArray("startMode", "Nti.sysbios.interfaces.ITimer.StartMode;;;"));
        sizes.add(Global.newArray("period", "UInt32"));
        sizes.add(Global.newArray("periodType", "Nti.sysbios.interfaces.ITimer.PeriodType;;;"));
        sizes.add(Global.newArray("prescale", "UInt16"));
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("tickFxn", "UFxn"));
        sizes.add(Global.newArray("extFreq", "Sxdc.runtime.Types;FreqHz"));
        sizes.add(Global.newArray("hwi", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c28.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c28.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c28.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.c28.Timer.Module_State", "ti.sysbios.family.c28");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "TChar"));
        sizes.add(Global.newArray("staticTimers", "A3;UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.c28.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.c28.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.c28.Timer.Module_State'], fld); }");
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

    void Settings$$SIZES()
    {
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c28/TimestampProvider.xs");
        om.bind("ti.sysbios.family.c28.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.TimestampProvider.Module", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("timerId", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "w");
            po.addFld("useClockTimer", $$T_Bool, false, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c28.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c28.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.family.c28"), fxn);
        // struct TimestampProvider.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.TimestampProvider$$Module_State", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.TimestampProvider.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("timer", (Proto)om.findStrict("ti.sysbios.family.c28.Timer.Handle", "ti.sysbios.family.c28"), $$UNDEF, "w");
                po.addFld("hi", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
    }

    void Clobber$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c28/Clobber.xs");
        om.bind("ti.sysbios.family.c28.Clobber$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Clobber.Module", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Clobber.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Clobber$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Clobber$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Clobber$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Clobber$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Hwi$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c28/Hwi.xs");
        om.bind("ti.sysbios.family.c28.Hwi$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi.Module", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.Module", om.findStrict("ti.sysbios.interfaces.IHwi.Module", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 32L, "rh");
                po.addFld("PIEIER1_ADDR", new Proto.Adr("xdc_Ptr", "Pv"), 0x000CE2L, "rh");
        if (isCFG) {
            po.addFld("NUM_INTERRUPTS_PIE", Proto.Elm.newCNum("(xdc_Int)"), 96L, "w");
            po.addFld("NUM_INTERRUPTS_ALL", Proto.Elm.newCNum("(xdc_Int)"), Global.eval("32 + 96"), "w");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.c28"), $$UNDEF, "wh");
            po.addFld("A_badIntNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "A_badIntNum: Invalid interrupt number"), "w");
            po.addFld("A_invalidArg", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "A_invalidArg: Invalid argument"), "w");
            po.addFld("A_zeroLatencyConflict", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "A_zeroLatencyConflict: Conflict with zero latency IER mask"), "w");
            po.addFld("E_unpluggedInterrupt", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "E_unpluggedInterrupt: Unplugged interrupt flagged: intr# %d"), "w");
            po.addFld("E_alreadyDefined", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "E_alreadyDefined: Hwi already defined: intr# %d"), "w");
            po.addFld("nonDispatchedInterrupts", new Proto.Map((Proto)om.findStrict("ti.sysbios.family.c28.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.c28")), $$DEFAULT, "wh");
            po.addFld("zeroLatencyIERMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0x0L, "w");
            po.addFld("LM_begin", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.c28"), Global.newObject("mask", Global.eval("0x0100 | 0x0200"), "msg", "LM_begin: hwi: 0x%x, func: 0x%x, preThread: %d, intNum: %d, irp: 0x%x"), "w");
            po.addFld("LD_end", (Proto)om.findStrict("xdc.runtime.Log$$Event", "ti.sysbios.family.c28"), Global.newObject("mask", 0x0200L, "msg", "LD_end: hwi: 0x%x"), "w");
            po.addFld("swiDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("swiRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("taskDisable", new Proto.Adr("xdc_UInt(*)(xdc_Void)", "PFn"), $$UNDEF, "w");
            po.addFld("taskRestoreHwi", new Proto.Adr("xdc_Void(*)(xdc_UInt)", "PFv"), $$UNDEF, "w");
            po.addFld("hooks", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c28.Hwi.HookSet", "ti.sysbios.family.c28"), true), Global.newArray(new Object[]{}), "w");
            po.addFld("zeroLatencyIERMaskStr", $$T_Str, $$UNDEF, "wh");
            po.addFld("nonZeroLatencyIERMaskStr", $$T_Str, $$UNDEF, "wh");
            po.addFld("interrupt", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c28.Hwi.InterruptObj", "ti.sysbios.family.c28"), false), $$DEFAULT, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.c28.Hwi$$create", "ti.sysbios.family.c28"), Global.get("ti$sysbios$family$c28$Hwi$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.c28.Hwi$$construct", "ti.sysbios.family.c28"), Global.get("ti$sysbios$family$c28$Hwi$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Hwi$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Hwi$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Hwi$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Hwi$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Hwi$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Hwi$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "addHookSet");
                if (fxn != null) po.addFxn("addHookSet", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$addHookSet", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "viewGetStackInfo");
                if (fxn != null) po.addFxn("viewGetStackInfo", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.IHwi$$viewGetStackInfo", "ti.sysbios.family.c28"), fxn);
                po.addFxn("inUseMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c28.Hwi$$inUseMeta", "ti.sysbios.family.c28"), Global.get(cap, "inUseMeta"));
                po.addFxn("plugMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.c28.Hwi$$plugMeta", "ti.sysbios.family.c28"), Global.get(cap, "plugMeta"));
                po.addFxn("getIERMask", (Proto.Fxn)om.findStrict("ti.sysbios.family.c28.Hwi$$getIERMask", "ti.sysbios.family.c28"), Global.get(cap, "getIERMask"));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi.Instance", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.Instance", om.findStrict("ti.sysbios.interfaces.IHwi.Instance", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 32L, "rh");
                po.addFld("PIEIER1_ADDR", new Proto.Adr("xdc_Ptr", "Pv"), 0x000CE2L, "rh");
        if (isCFG) {
            po.addFld("disableMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("restoreMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("enableAck", $$T_Bool, true, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.c28"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$Params", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.Params", om.findStrict("ti.sysbios.interfaces.IHwi$$Params", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_INTERRUPTS", Proto.Elm.newCNum("(xdc_Int)"), 32L, "rh");
                po.addFld("PIEIER1_ADDR", new Proto.Adr("xdc_Ptr", "Pv"), 0x000CE2L, "rh");
        if (isCFG) {
            po.addFld("disableMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("restoreMask", Proto.Elm.newCNum("(xdc_Bits16)"), 0L, "w");
            po.addFld("priority", Proto.Elm.newCNum("(xdc_Int)"), 0L, "w");
            po.addFld("enableAck", $$T_Bool, true, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.c28"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$Object", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.Object", om.findStrict("ti.sysbios.family.c28.Hwi.Instance", "ti.sysbios.family.c28"));
        // typedef Hwi.PlugFuncPtr
        om.bind("ti.sysbios.family.c28.Hwi.PlugFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"));
        // struct Hwi.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$BasicView", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halHwiHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("fxn", $$T_Str, $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("disableMask", $$T_Str, $$UNDEF, "w");
                po.addFld("restoreMask", $$T_Str, $$UNDEF, "w");
        // struct Hwi.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$ModuleView", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("options", new Proto.Arr($$T_Str, false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("hwiStackPeak", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("hwiStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("globalEnable", $$T_Str, $$UNDEF, "w");
                po.addFld("shadowIER", $$T_Str, $$UNDEF, "w");
        // struct Hwi.NonDispatchedInterrupt
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$NonDispatchedInterrupt", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.NonDispatchedInterrupt", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
                po.addFld("enableInt", $$T_Bool, $$UNDEF, "w");
        // struct Hwi.InterruptObj
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$InterruptObj", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.InterruptObj", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("name", $$T_Str, $$UNDEF, "w");
                po.addFld("used", $$T_Bool, $$UNDEF, "w");
                po.addFld("useDispatcher", $$T_Bool, $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("pfxn", new Proto.Adr("xdc_Void(*)(xdc_Void)", "PFv"), $$UNDEF, "w");
        // struct Hwi.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$Instance_State", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("enableInt", $$T_Bool, $$UNDEF, "w");
                po.addFld("enableAck", $$T_Bool, $$UNDEF, "w");
                po.addFld("disableMask", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("restoreMask", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("ierBitMask", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("fxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("hookEnv", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false), $$DEFAULT, "w");
        // struct Hwi.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$Module_State", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Hwi.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ierMask", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("isrStack", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("taskSP", new Proto.Adr("xdc_Char*", "Pn"), $$UNDEF, "w");
                po.addFld("dispatchTable", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c28.Hwi.Handle", "ti.sysbios.family.c28"), false), $$DEFAULT, "w");
                po.addFld("irp", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("globalEnable", $$T_Bool, $$UNDEF, "w");
                po.addFld("shadowIER", Proto.Elm.newCNum("(xdc_Bits16)"), $$UNDEF, "w");
                po.addFld("isrStackBase", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("isrStackSize", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
    }

    void Timer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c28/Timer.xs");
        om.bind("ti.sysbios.family.c28.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer.Module", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 3L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.c28"), $$UNDEF, "wh");
            po.addFld("A_invalidTimer", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "A_invalidTimer: Timer id must be 0-2"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("A_invalidRunMode", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "A_invalidRunMode: Invalid RunMode"), "w");
            po.addFld("A_invalidHwiMask", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "A_InvalidMask: Mask in hwiParams cannot enable self"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period"), "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x7L, "w");
            po.addFld("startupNeeded", Proto.Elm.newCNum("(xdc_UInt)"), false, "w");
            po.addFld("intNumDef", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt8)"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.c28.Timer$$create", "ti.sysbios.family.c28"), Global.get("ti$sysbios$family$c28$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.c28.Timer$$construct", "ti.sysbios.family.c28"), Global.get("ti$sysbios$family$c28$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.family.c28"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer.Instance", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 3L, "rh");
        if (isCFG) {
            po.addFld("emulationModeInit", (Proto)om.findStrict("ti.sysbios.family.c28.Timer.EmulationMode", "ti.sysbios.family.c28"), Global.newObject("free", 0L, "soft", 0L), "w");
            po.addFld("prescale", Proto.Elm.newCNum("(xdc_UInt16)"), 0L, "w");
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_c28_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.c28"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$Params", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt)"), 0xffffffffL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 3L, "rh");
        if (isCFG) {
            po.addFld("emulationModeInit", (Proto)om.findStrict("ti.sysbios.family.c28.Timer.EmulationMode", "ti.sysbios.family.c28"), Global.newObject("free", 0L, "soft", 0L), "w");
            po.addFld("prescale", Proto.Elm.newCNum("(xdc_UInt16)"), 0L, "w");
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_c28_Hwi_Params*", "PS"), null, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.c28"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$Object", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Timer.Object", om.findStrict("ti.sysbios.family.c28.Timer.Instance", "ti.sysbios.family.c28"));
        // struct Timer.EmulationMode
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$EmulationMode", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Timer.EmulationMode", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("free", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("soft", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$BasicView", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Timer.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halTimerHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("startMode", $$T_Str, $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("periodType", $$T_Str, $$UNDEF, "w");
                po.addFld("prescalar", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("hwiHandle", $$T_Str, $$UNDEF, "w");
        // struct Timer.DeviceView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$DeviceView", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Timer.DeviceView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("deviceAddr", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("currCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("remainingCount", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
        // struct Timer.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$Instance_State", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("emulationModeInit", (Proto)om.findStrict("ti.sysbios.family.c28.Timer.EmulationMode", "ti.sysbios.family.c28"), $$DEFAULT, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.c28"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.c28"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.c28"), $$UNDEF, "w");
                po.addFld("prescale", Proto.Elm.newCNum("(xdc_UInt16)"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("extFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.c28"), $$DEFAULT, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.family.c28.Hwi.Handle", "ti.sysbios.family.c28"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$Module_State", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_Char)"), $$UNDEF, "w");
                po.addFld("staticTimers", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.c28.Timer.Handle", "ti.sysbios.family.c28"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
    }

    void IntrinsicsSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c28/IntrinsicsSupport.xs");
        om.bind("ti.sysbios.family.c28.IntrinsicsSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.IntrinsicsSupport.Module", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.IntrinsicsSupport.Module", om.findStrict("ti.sysbios.interfaces.IIntrinsicsSupport.Module", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c28.IntrinsicsSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.IntrinsicsSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.IntrinsicsSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c28.IntrinsicsSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void TaskSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c28/TaskSupport.xs");
        om.bind("ti.sysbios.family.c28.TaskSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.TaskSupport.Module", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.TaskSupport.Module", om.findStrict("ti.sysbios.interfaces.ITaskSupport.Module", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("E_invalidStack", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.c28"), Global.newObject("msg", "Stack (0x%x) not located on PAGE 0 (stack must be located entirely below 0x10000)"), "w");
            po.addFld("defaultStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 256L, "r");
            po.addFld("stackAlignment", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "r");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c28.TaskSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.TaskSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.TaskSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c28.TaskSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "stackUsed$view");
                if (fxn != null) po.addFxn("stackUsed$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$stackUsed$view", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getCallStack$view");
                if (fxn != null) po.addFxn("getCallStack$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$getCallStack$view", "ti.sysbios.family.c28"), fxn);
    }

    void Settings$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c28/Settings.xs");
        om.bind("ti.sysbios.family.c28.Settings$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Settings.Module", "ti.sysbios.family.c28");
        po.init("ti.sysbios.family.c28.Settings.Module", om.findStrict("ti.sysbios.interfaces.ISettings.Module", "ti.sysbios.family.c28"));
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Settings$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Settings$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.c28.Settings$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getDefaultCoreDelegate");
                if (fxn != null) po.addFxn("getDefaultCoreDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultCoreDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultHwiDelegate");
                if (fxn != null) po.addFxn("getDefaultHwiDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultHwiDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultTimerDelegate");
                if (fxn != null) po.addFxn("getDefaultTimerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimerDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultClockTimerDelegate");
                if (fxn != null) po.addFxn("getDefaultClockTimerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultClockTimerDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultTimerSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultTimerSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimerSupportDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultTimestampDelegate");
                if (fxn != null) po.addFxn("getDefaultTimestampDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTimestampDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultTaskSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultTaskSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultTaskSupportDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultIntrinsicsSupportDelegate");
                if (fxn != null) po.addFxn("getDefaultIntrinsicsSupportDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultIntrinsicsSupportDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultCacheDelegate");
                if (fxn != null) po.addFxn("getDefaultCacheDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultCacheDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultPowerDelegate");
                if (fxn != null) po.addFxn("getDefaultPowerDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultPowerDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultSecondsDelegate");
                if (fxn != null) po.addFxn("getDefaultSecondsDelegate", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultSecondsDelegate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultBootModule");
                if (fxn != null) po.addFxn("getDefaultBootModule", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultBootModule", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultMmuModule");
                if (fxn != null) po.addFxn("getDefaultMmuModule", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultMmuModule", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getFamilySettingsXml");
                if (fxn != null) po.addFxn("getFamilySettingsXml", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getFamilySettingsXml", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getDefaultClockTickPeriod");
                if (fxn != null) po.addFxn("getDefaultClockTickPeriod", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ISettings$$getDefaultClockTickPeriod", "ti.sysbios.family.c28"), fxn);
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.TimestampProvider", "ti.sysbios.family.c28");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c28.TimestampProvider.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.TimestampProvider$$Module_State", "ti.sysbios.family.c28");
    }

    void Clobber$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.Clobber", "ti.sysbios.family.c28");
    }

    void Hwi$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.Hwi", "ti.sysbios.family.c28");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$Instance_State", "ti.sysbios.family.c28");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c28.Hwi.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$Instance_State", "ti.sysbios.family.c28");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c28.Hwi.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi$$Module_State", "ti.sysbios.family.c28");
        po.bind("dispatchTable$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.Timer", "ti.sysbios.family.c28");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$Instance_State", "ti.sysbios.family.c28");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("EmulationMode$fetchDesc", Global.newObject("type", "ti.sysbios.family.c28.Timer.EmulationMode", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$EmulationMode", "ti.sysbios.family.c28");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c28.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$Instance_State", "ti.sysbios.family.c28");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.c28.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer$$Module_State", "ti.sysbios.family.c28");
    }

    void IntrinsicsSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.IntrinsicsSupport", "ti.sysbios.family.c28");
    }

    void TaskSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.TaskSupport", "ti.sysbios.family.c28");
    }

    void Settings$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.c28.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.c28"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/c28/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.c28"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.c28"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.c28", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.c28");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.c28.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.c28'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.c28$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.c28$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.c28$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c28.ae28FP',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c28.a28L',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.c28.a28FP',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c28.ae28FP', {target: 'ti.targets.elf.C28_float', suffix: 'e28FP'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c28.a28L', {target: 'ti.targets.C28_large', suffix: '28L'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.c28.a28FP', {target: 'ti.targets.C28_float', suffix: '28FP'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void TimestampProvider$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.TimestampProvider", "ti.sysbios.family.c28");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.TimestampProvider.Module", "ti.sysbios.family.c28");
        vo.init2(po, "ti.sysbios.family.c28.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c28.TimestampProvider$$capsule", "ti.sysbios.family.c28"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c28", "ti.sysbios.family.c28"));
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
        mcfgs.add("timerId");
        mcfgs.add("useClockTimer");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c28.TimestampProvider.Module_State", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.TimestampProvider.Module_State", "ti.sysbios.family.c28"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c28")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.family.c28.TimestampProvider.get32", "ti.sysbios.family.c28"));
        vo.bind("get64", om.findStrict("ti.sysbios.family.c28.TimestampProvider.get64", "ti.sysbios.family.c28"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.family.c28.TimestampProvider.getFreq", "ti.sysbios.family.c28"));
        vo.bind("startTimer", om.findStrict("ti.sysbios.family.c28.TimestampProvider.startTimer", "ti.sysbios.family.c28"));
        vo.bind("rolloverFunc", om.findStrict("ti.sysbios.family.c28.TimestampProvider.rolloverFunc", "ti.sysbios.family.c28"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c28_TimestampProvider_Module__startupDone__E", "ti_sysbios_family_c28_TimestampProvider_get32__E", "ti_sysbios_family_c28_TimestampProvider_get64__E", "ti_sysbios_family_c28_TimestampProvider_getFreq__E", "ti_sysbios_family_c28_TimestampProvider_startTimer__E", "ti_sysbios_family_c28_TimestampProvider_rolloverFunc__E"));
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

    void Clobber$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.Clobber", "ti.sysbios.family.c28");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Clobber.Module", "ti.sysbios.family.c28");
        vo.init2(po, "ti.sysbios.family.c28.Clobber", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c28.Clobber$$capsule", "ti.sysbios.family.c28"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c28", "ti.sysbios.family.c28"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c28")).add(vo);
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
        vo.bind("trashScratchRegs", om.findStrict("ti.sysbios.family.c28.Clobber.trashScratchRegs", "ti.sysbios.family.c28"));
        vo.bind("trashPreservedRegs", om.findStrict("ti.sysbios.family.c28.Clobber.trashPreservedRegs", "ti.sysbios.family.c28"));
        vo.bind("checkScratchRegs", om.findStrict("ti.sysbios.family.c28.Clobber.checkScratchRegs", "ti.sysbios.family.c28"));
        vo.bind("checkPreservedRegs", om.findStrict("ti.sysbios.family.c28.Clobber.checkPreservedRegs", "ti.sysbios.family.c28"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c28_Clobber_Module__startupDone__E", "ti_sysbios_family_c28_Clobber_trashScratchRegs__E", "ti_sysbios_family_c28_Clobber_trashPreservedRegs__E", "ti_sysbios_family_c28_Clobber_checkScratchRegs__E", "ti_sysbios_family_c28_Clobber_checkPreservedRegs__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        loggables.add(Global.newObject("name", "trashScratchRegs", "entry", "0x%x", "exit", ""));
        loggables.add(Global.newObject("name", "trashPreservedRegs", "entry", "0x%x", "exit", ""));
        loggables.add(Global.newObject("name", "checkScratchRegs", "entry", "0x%x", "exit", "0x%x"));
        loggables.add(Global.newObject("name", "checkPreservedRegs", "entry", "0x%x", "exit", "0x%x"));
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Clobber", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Clobber");
    }

    void Hwi$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.Hwi", "ti.sysbios.family.c28");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Hwi.Module", "ti.sysbios.family.c28");
        vo.init2(po, "ti.sysbios.family.c28.Hwi", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c28.Hwi$$capsule", "ti.sysbios.family.c28"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.c28.Hwi.Instance", "ti.sysbios.family.c28"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.c28.Hwi.Params", "ti.sysbios.family.c28"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.c28.Hwi.Params", "ti.sysbios.family.c28")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.c28.Hwi.Handle", "ti.sysbios.family.c28"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c28", "ti.sysbios.family.c28"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.IHwi.FuncPtr", "ti.sysbios.family.c28"));
        vo.bind("Irp", om.findStrict("ti.sysbios.interfaces.IHwi.Irp", "ti.sysbios.family.c28"));
        vo.bind("HookSet", om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.HookSet", "ti.sysbios.family.c28"));
        vo.bind("MaskingOption", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption", "ti.sysbios.family.c28"));
        vo.bind("StackInfo", om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.interfaces.IHwi.StackInfo", "ti.sysbios.family.c28"));
        mcfgs.add("dispatcherAutoNestingSupport");
        mcfgs.add("dispatcherSwiSupport");
        mcfgs.add("dispatcherTaskSupport");
        mcfgs.add("dispatcherIrpTrackingSupport");
        mcfgs.add("NUM_INTERRUPTS_PIE");
        mcfgs.add("NUM_INTERRUPTS_ALL");
        vo.bind("PlugFuncPtr", om.findStrict("ti.sysbios.family.c28.Hwi.PlugFuncPtr", "ti.sysbios.family.c28"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.c28.Hwi.BasicView", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Hwi.BasicView", "ti.sysbios.family.c28"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.c28.Hwi.ModuleView", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Hwi.ModuleView", "ti.sysbios.family.c28"));
        mcfgs.add("A_badIntNum");
        mcfgs.add("A_invalidArg");
        mcfgs.add("A_zeroLatencyConflict");
        mcfgs.add("E_unpluggedInterrupt");
        mcfgs.add("E_alreadyDefined");
        vo.bind("NonDispatchedInterrupt", om.findStrict("ti.sysbios.family.c28.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Hwi.NonDispatchedInterrupt", "ti.sysbios.family.c28"));
        mcfgs.add("zeroLatencyIERMask");
        mcfgs.add("LM_begin");
        mcfgs.add("LD_end");
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
        vo.bind("InterruptObj", om.findStrict("ti.sysbios.family.c28.Hwi.InterruptObj", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Hwi.InterruptObj", "ti.sysbios.family.c28"));
        icfgs.add("zeroLatencyIERMaskStr");
        icfgs.add("nonZeroLatencyIERMaskStr");
        icfgs.add("interrupt");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.c28.Hwi.Instance_State", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Hwi.Instance_State", "ti.sysbios.family.c28"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c28.Hwi.Module_State", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Hwi.Module_State", "ti.sysbios.family.c28"));
        vo.bind("MaskingOption_NONE", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_NONE", "ti.sysbios.family.c28"));
        vo.bind("MaskingOption_ALL", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_ALL", "ti.sysbios.family.c28"));
        vo.bind("MaskingOption_SELF", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_SELF", "ti.sysbios.family.c28"));
        vo.bind("MaskingOption_BITMASK", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_BITMASK", "ti.sysbios.family.c28"));
        vo.bind("MaskingOption_LOWER", om.findStrict("ti.sysbios.interfaces.IHwi.MaskingOption_LOWER", "ti.sysbios.family.c28"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c28")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.c28.Hwi$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$c28$Hwi$$__initObject"));
        }//isCFG
        vo.bind("getStackInfo", om.findStrict("ti.sysbios.family.c28.Hwi.getStackInfo", "ti.sysbios.family.c28"));
        vo.bind("getCoreStackInfo", om.findStrict("ti.sysbios.family.c28.Hwi.getCoreStackInfo", "ti.sysbios.family.c28"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.c28.Hwi.startup", "ti.sysbios.family.c28"));
        vo.bind("switchFromBootStack", om.findStrict("ti.sysbios.family.c28.Hwi.switchFromBootStack", "ti.sysbios.family.c28"));
        vo.bind("post", om.findStrict("ti.sysbios.family.c28.Hwi.post", "ti.sysbios.family.c28"));
        vo.bind("getTaskSP", om.findStrict("ti.sysbios.family.c28.Hwi.getTaskSP", "ti.sysbios.family.c28"));
        vo.bind("plug", om.findStrict("ti.sysbios.family.c28.Hwi.plug", "ti.sysbios.family.c28"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.c28.Hwi.getHandle", "ti.sysbios.family.c28"));
        vo.bind("disableInterrupt", om.findStrict("ti.sysbios.family.c28.Hwi.disableInterrupt", "ti.sysbios.family.c28"));
        vo.bind("enableInterrupt", om.findStrict("ti.sysbios.family.c28.Hwi.enableInterrupt", "ti.sysbios.family.c28"));
        vo.bind("restoreInterrupt", om.findStrict("ti.sysbios.family.c28.Hwi.restoreInterrupt", "ti.sysbios.family.c28"));
        vo.bind("clearInterrupt", om.findStrict("ti.sysbios.family.c28.Hwi.clearInterrupt", "ti.sysbios.family.c28"));
        vo.bind("disableIER", om.findStrict("ti.sysbios.family.c28.Hwi.disableIER", "ti.sysbios.family.c28"));
        vo.bind("enableIER", om.findStrict("ti.sysbios.family.c28.Hwi.enableIER", "ti.sysbios.family.c28"));
        vo.bind("restoreIER", om.findStrict("ti.sysbios.family.c28.Hwi.restoreIER", "ti.sysbios.family.c28"));
        vo.bind("enablePIEIER", om.findStrict("ti.sysbios.family.c28.Hwi.enablePIEIER", "ti.sysbios.family.c28"));
        vo.bind("disablePIEIER", om.findStrict("ti.sysbios.family.c28.Hwi.disablePIEIER", "ti.sysbios.family.c28"));
        vo.bind("restorePIEIER", om.findStrict("ti.sysbios.family.c28.Hwi.restorePIEIER", "ti.sysbios.family.c28"));
        vo.bind("getInterruptFlag", om.findStrict("ti.sysbios.family.c28.Hwi.getInterruptFlag", "ti.sysbios.family.c28"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.c28.Hwi.postInit", "ti.sysbios.family.c28"));
        vo.bind("getIFR", om.findStrict("ti.sysbios.family.c28.Hwi.getIFR", "ti.sysbios.family.c28"));
        vo.bind("ack", om.findStrict("ti.sysbios.family.c28.Hwi.ack", "ti.sysbios.family.c28"));
        vo.bind("interruptReturn", om.findStrict("ti.sysbios.family.c28.Hwi.interruptReturn", "ti.sysbios.family.c28"));
        vo.bind("getIERBit", om.findStrict("ti.sysbios.family.c28.Hwi.getIERBit", "ti.sysbios.family.c28"));
        vo.bind("dispatchC", om.findStrict("ti.sysbios.family.c28.Hwi.dispatchC", "ti.sysbios.family.c28"));
        vo.bind("dispatchCore", om.findStrict("ti.sysbios.family.c28.Hwi.dispatchCore", "ti.sysbios.family.c28"));
        vo.bind("switchAndDispatch", om.findStrict("ti.sysbios.family.c28.Hwi.switchAndDispatch", "ti.sysbios.family.c28"));
        vo.bind("unPluggedInterrupt", om.findStrict("ti.sysbios.family.c28.Hwi.unPluggedInterrupt", "ti.sysbios.family.c28"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c28_Hwi_Handle__label__E", "ti_sysbios_family_c28_Hwi_Module__startupDone__E", "ti_sysbios_family_c28_Hwi_Object__create__E", "ti_sysbios_family_c28_Hwi_Object__delete__E", "ti_sysbios_family_c28_Hwi_Object__get__E", "ti_sysbios_family_c28_Hwi_Object__first__E", "ti_sysbios_family_c28_Hwi_Object__next__E", "ti_sysbios_family_c28_Hwi_Params__init__E", "ti_sysbios_family_c28_Hwi_getStackInfo__E", "ti_sysbios_family_c28_Hwi_getCoreStackInfo__E", "ti_sysbios_family_c28_Hwi_startup__E", "ti_sysbios_family_c28_Hwi_switchFromBootStack__E", "ti_sysbios_family_c28_Hwi_post__E", "ti_sysbios_family_c28_Hwi_getTaskSP__E", "ti_sysbios_family_c28_Hwi_getFunc__E", "ti_sysbios_family_c28_Hwi_setFunc__E", "ti_sysbios_family_c28_Hwi_getHookContext__E", "ti_sysbios_family_c28_Hwi_setHookContext__E", "ti_sysbios_family_c28_Hwi_getIrp__E", "ti_sysbios_family_c28_Hwi_disable__E", "ti_sysbios_family_c28_Hwi_enable__E", "ti_sysbios_family_c28_Hwi_restore__E", "ti_sysbios_family_c28_Hwi_plug__E", "ti_sysbios_family_c28_Hwi_getHandle__E", "ti_sysbios_family_c28_Hwi_disableInterrupt__E", "ti_sysbios_family_c28_Hwi_enableInterrupt__E", "ti_sysbios_family_c28_Hwi_restoreInterrupt__E", "ti_sysbios_family_c28_Hwi_clearInterrupt__E", "ti_sysbios_family_c28_Hwi_disableIER__E", "ti_sysbios_family_c28_Hwi_enableIER__E", "ti_sysbios_family_c28_Hwi_restoreIER__E", "ti_sysbios_family_c28_Hwi_enablePIEIER__E", "ti_sysbios_family_c28_Hwi_disablePIEIER__E", "ti_sysbios_family_c28_Hwi_restorePIEIER__E", "ti_sysbios_family_c28_Hwi_getInterruptFlag__E", "ti_sysbios_family_c28_Hwi_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray("LM_begin", "LD_end"));
        vo.bind("$$errorDescCfgs", Global.newArray("E_unpluggedInterrupt", "E_alreadyDefined"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_badIntNum", "A_invalidArg", "A_zeroLatencyConflict"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Hwi.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.c28.Hwi.Object", "ti.sysbios.family.c28"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Hwi.xdt");
        pkgV.bind("Hwi", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Hwi");
    }

    void Timer$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.Timer", "ti.sysbios.family.c28");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Timer.Module", "ti.sysbios.family.c28");
        vo.init2(po, "ti.sysbios.family.c28.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c28.Timer$$capsule", "ti.sysbios.family.c28"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.c28.Timer.Instance", "ti.sysbios.family.c28"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.c28.Timer.Params", "ti.sysbios.family.c28"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.c28.Timer.Params", "ti.sysbios.family.c28")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.c28.Timer.Handle", "ti.sysbios.family.c28"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c28", "ti.sysbios.family.c28"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.family.c28"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.c28"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.c28"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.c28"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.c28"));
        vo.bind("EmulationMode", om.findStrict("ti.sysbios.family.c28.Timer.EmulationMode", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Timer.EmulationMode", "ti.sysbios.family.c28"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.c28.Timer.BasicView", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Timer.BasicView", "ti.sysbios.family.c28"));
        vo.bind("DeviceView", om.findStrict("ti.sysbios.family.c28.Timer.DeviceView", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Timer.DeviceView", "ti.sysbios.family.c28"));
        mcfgs.add("A_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("A_invalidRunMode");
        mcfgs.add("A_invalidHwiMask");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("anyMask");
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        mcfgs.add("intNumDef");
        icfgs.add("intNumDef");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.c28.Timer.Instance_State", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Timer.Instance_State", "ti.sysbios.family.c28"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.c28.Timer.Module_State", "ti.sysbios.family.c28"));
        tdefs.add(om.findStrict("ti.sysbios.family.c28.Timer.Module_State", "ti.sysbios.family.c28"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.family.c28"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.family.c28"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.family.c28"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.family.c28"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.family.c28"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.family.c28"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.family.c28"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.family.c28"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.family.c28"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c28")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.c28.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$c28$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.family.c28.Timer.getNumTimers", "ti.sysbios.family.c28"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.family.c28.Timer.getStatus", "ti.sysbios.family.c28"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.c28.Timer.startup", "ti.sysbios.family.c28"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.c28.Timer.postInit", "ti.sysbios.family.c28"));
        vo.bind("stopAndClear", om.findStrict("ti.sysbios.family.c28.Timer.stopAndClear", "ti.sysbios.family.c28"));
        vo.bind("checkOverflow", om.findStrict("ti.sysbios.family.c28.Timer.checkOverflow", "ti.sysbios.family.c28"));
        vo.bind("oneShotStub", om.findStrict("ti.sysbios.family.c28.Timer.oneShotStub", "ti.sysbios.family.c28"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c28_Timer_Handle__label__E", "ti_sysbios_family_c28_Timer_Module__startupDone__E", "ti_sysbios_family_c28_Timer_Object__create__E", "ti_sysbios_family_c28_Timer_Object__delete__E", "ti_sysbios_family_c28_Timer_Object__get__E", "ti_sysbios_family_c28_Timer_Object__first__E", "ti_sysbios_family_c28_Timer_Object__next__E", "ti_sysbios_family_c28_Timer_Params__init__E", "ti_sysbios_family_c28_Timer_getNumTimers__E", "ti_sysbios_family_c28_Timer_getStatus__E", "ti_sysbios_family_c28_Timer_startup__E", "ti_sysbios_family_c28_Timer_getMaxTicks__E", "ti_sysbios_family_c28_Timer_setNextTick__E", "ti_sysbios_family_c28_Timer_start__E", "ti_sysbios_family_c28_Timer_stop__E", "ti_sysbios_family_c28_Timer_setPeriod__E", "ti_sysbios_family_c28_Timer_setPeriodMicroSecs__E", "ti_sysbios_family_c28_Timer_getPeriod__E", "ti_sysbios_family_c28_Timer_getFreq__E", "ti_sysbios_family_c28_Timer_getFunc__E", "ti_sysbios_family_c28_Timer_setFunc__E", "ti_sysbios_family_c28_Timer_trigger__E", "ti_sysbios_family_c28_Timer_getExpiredCounts__E", "ti_sysbios_family_c28_Timer_getExpiredTicks__E", "ti_sysbios_family_c28_Timer_getCurrentTick__E", "ti_sysbios_family_c28_Timer_getCount__E", "ti_sysbios_family_c28_Timer_setPrescale__E", "ti_sysbios_family_c28_Timer_getPrescale__E", "ti_sysbios_family_c28_Timer_getPrescaleCount__E", "ti_sysbios_family_c28_Timer_getExpiredCounts64__E", "ti_sysbios_family_c28_Timer_reconfig__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_notAvailable"));
        vo.bind("$$assertDescCfgs", Global.newArray("A_invalidTimer", "A_invalidRunMode", "A_invalidHwiMask", "E_cannotSupport"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("Object", om.findStrict("ti.sysbios.family.c28.Timer.Object", "ti.sysbios.family.c28"));
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("Timer", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Timer");
    }

    void IntrinsicsSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.IntrinsicsSupport", "ti.sysbios.family.c28");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.IntrinsicsSupport.Module", "ti.sysbios.family.c28");
        vo.init2(po, "ti.sysbios.family.c28.IntrinsicsSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c28.IntrinsicsSupport$$capsule", "ti.sysbios.family.c28"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c28", "ti.sysbios.family.c28"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c28")).add(vo);
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
        vo.bind("maxbit", om.findStrict("ti.sysbios.family.c28.IntrinsicsSupport.maxbit", "ti.sysbios.family.c28"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c28_IntrinsicsSupport_Module__startupDone__E", "ti_sysbios_family_c28_IntrinsicsSupport_maxbit__E"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.TaskSupport", "ti.sysbios.family.c28");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.TaskSupport.Module", "ti.sysbios.family.c28");
        vo.init2(po, "ti.sysbios.family.c28.TaskSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c28.TaskSupport$$capsule", "ti.sysbios.family.c28"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c28", "ti.sysbios.family.c28"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITaskSupport.FuncPtr", "ti.sysbios.family.c28"));
        mcfgs.add("defaultStackSize");
        mcfgs.add("stackAlignment");
        mcfgs.add("E_invalidStack");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c28")).add(vo);
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
        vo.bind("start", om.findStrict("ti.sysbios.family.c28.TaskSupport.start", "ti.sysbios.family.c28"));
        vo.bind("swap", om.findStrict("ti.sysbios.family.c28.TaskSupport.swap", "ti.sysbios.family.c28"));
        vo.bind("checkStack", om.findStrict("ti.sysbios.family.c28.TaskSupport.checkStack", "ti.sysbios.family.c28"));
        vo.bind("stackUsed", om.findStrict("ti.sysbios.family.c28.TaskSupport.stackUsed", "ti.sysbios.family.c28"));
        vo.bind("getStackAlignment", om.findStrict("ti.sysbios.family.c28.TaskSupport.getStackAlignment", "ti.sysbios.family.c28"));
        vo.bind("getDefaultStackSize", om.findStrict("ti.sysbios.family.c28.TaskSupport.getDefaultStackSize", "ti.sysbios.family.c28"));
        vo.bind("getCheckValueAddr", om.findStrict("ti.sysbios.family.c28.TaskSupport.getCheckValueAddr", "ti.sysbios.family.c28"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_c28_TaskSupport_Module__startupDone__E", "ti_sysbios_family_c28_TaskSupport_start__E", "ti_sysbios_family_c28_TaskSupport_swap__E", "ti_sysbios_family_c28_TaskSupport_checkStack__E", "ti_sysbios_family_c28_TaskSupport_stackUsed__E", "ti_sysbios_family_c28_TaskSupport_getStackAlignment__E", "ti_sysbios_family_c28_TaskSupport_getDefaultStackSize__E", "ti_sysbios_family_c28_TaskSupport_getCheckValueAddr__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray("E_invalidStack"));
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

    void Settings$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.Settings", "ti.sysbios.family.c28");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.c28.Settings.Module", "ti.sysbios.family.c28");
        vo.init2(po, "ti.sysbios.family.c28.Settings", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.c28.Settings$$capsule", "ti.sysbios.family.c28"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.c28", "ti.sysbios.family.c28"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.c28")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 1);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.sysbios.family.c28.Settings$$instance$static$init", null) ? 1 : 0);
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
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.c28")).findStrict("PARAMS", "ti.sysbios.family.c28");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.c28.Hwi", "ti.sysbios.family.c28")).findStrict("PARAMS", "ti.sysbios.family.c28");
            Global.put(dstP, "instance", srcP);
            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.c28.Timer", "ti.sysbios.family.c28")).findStrict("PARAMS", "ti.sysbios.family.c28");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c28.TimestampProvider", "ti.sysbios.family.c28"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c28.Clobber", "ti.sysbios.family.c28"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c28.Hwi", "ti.sysbios.family.c28"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c28.Timer", "ti.sysbios.family.c28"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c28.IntrinsicsSupport", "ti.sysbios.family.c28"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c28.TaskSupport", "ti.sysbios.family.c28"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.c28.Settings", "ti.sysbios.family.c28"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.Hwi", "ti.sysbios.family.c28");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.c28.Timer", "ti.sysbios.family.c28");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Device", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitDevice", "structName", "DeviceView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.c28.TimestampProvider")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c28.Clobber")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c28.Hwi")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c28.Timer")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c28.IntrinsicsSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c28.TaskSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.c28.Settings")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.c28")).add(pkgV);
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
        TimestampProvider$$OBJECTS();
        Clobber$$OBJECTS();
        Hwi$$OBJECTS();
        Timer$$OBJECTS();
        IntrinsicsSupport$$OBJECTS();
        TaskSupport$$OBJECTS();
        Settings$$OBJECTS();
        TimestampProvider$$CONSTS();
        Clobber$$CONSTS();
        Hwi$$CONSTS();
        Timer$$CONSTS();
        IntrinsicsSupport$$CONSTS();
        TaskSupport$$CONSTS();
        Settings$$CONSTS();
        TimestampProvider$$CREATES();
        Clobber$$CREATES();
        Hwi$$CREATES();
        Timer$$CREATES();
        IntrinsicsSupport$$CREATES();
        TaskSupport$$CREATES();
        Settings$$CREATES();
        TimestampProvider$$FUNCTIONS();
        Clobber$$FUNCTIONS();
        Hwi$$FUNCTIONS();
        Timer$$FUNCTIONS();
        IntrinsicsSupport$$FUNCTIONS();
        TaskSupport$$FUNCTIONS();
        Settings$$FUNCTIONS();
        TimestampProvider$$SIZES();
        Clobber$$SIZES();
        Hwi$$SIZES();
        Timer$$SIZES();
        IntrinsicsSupport$$SIZES();
        TaskSupport$$SIZES();
        Settings$$SIZES();
        TimestampProvider$$TYPES();
        Clobber$$TYPES();
        Hwi$$TYPES();
        Timer$$TYPES();
        IntrinsicsSupport$$TYPES();
        TaskSupport$$TYPES();
        Settings$$TYPES();
        if (isROV) {
            TimestampProvider$$ROV();
            Clobber$$ROV();
            Hwi$$ROV();
            Timer$$ROV();
            IntrinsicsSupport$$ROV();
            TaskSupport$$ROV();
            Settings$$ROV();
        }//isROV
        $$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        Clobber$$SINGLETONS();
        Hwi$$SINGLETONS();
        Timer$$SINGLETONS();
        IntrinsicsSupport$$SINGLETONS();
        TaskSupport$$SINGLETONS();
        Settings$$SINGLETONS();
        $$INITIALIZATION();
    }
}
