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

public class ti_sysbios_family_arm_v8a
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.family.arm.gicv3");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.v8a", new Value.Obj("ti.sysbios.family.arm.v8a", pkgP));
    }

    void Core$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Core.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v8a.Core", new Value.Obj("ti.sysbios.family.arm.v8a.Core", po));
        pkgV.bind("Core", vo);
        // decls 
    }

    void Mmu$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Mmu.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v8a.Mmu", new Value.Obj("ti.sysbios.family.arm.v8a.Mmu", po));
        pkgV.bind("Mmu", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.v8a.Mmu.DescriptorType", new Proto.Enm("ti.sysbios.family.arm.v8a.Mmu.DescriptorType"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Mmu$$DescriptorAttrs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Mmu$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v8a.Mmu.Module_State", new Proto.Str(spo, false));
    }

    void TaskSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.TaskSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v8a.TaskSupport", new Value.Obj("ti.sysbios.family.arm.v8a.TaskSupport", po));
        pkgV.bind("TaskSupport", vo);
        // decls 
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v8a.Timer", new Value.Obj("ti.sysbios.family.arm.v8a.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.v8a.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.v8a"));
        om.bind("ti.sysbios.family.arm.v8a.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.v8a"));
        om.bind("ti.sysbios.family.arm.v8a.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.v8a"));
        om.bind("ti.sysbios.family.arm.v8a.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.v8a"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v8a.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Timer$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v8a.Timer.ModuleView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v8a.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v8a.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.v8a.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v8a.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v8a.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.v8a.Timer.Object", om.findStrict("ti.sysbios.family.arm.v8a.Timer.Instance_State", "ti.sysbios.family.arm.v8a"));
        }//isROV
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.v8a.TimestampProvider", new Value.Obj("ti.sysbios.family.arm.v8a.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.v8a.TimestampProvider$$Module_View", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.v8a.TimestampProvider.Module_View", new Proto.Str(spo, false));
    }

    void Core$$CONSTS()
    {
        // module Core
        om.bind("ti.sysbios.family.arm.v8a.Core.getId", new Extern("ti_sysbios_family_arm_v8a_Core_getId__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.interruptCore", new Extern("ti_sysbios_family_arm_v8a_Core_interruptCore__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.lock", new Extern("ti_sysbios_family_arm_v8a_Core_lock__E", "xdc_IArg(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.unlock", new Extern("ti_sysbios_family_arm_v8a_Core_unlock__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.hwiDisable", new Extern("ti_sysbios_family_arm_v8a_Core_hwiDisable__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.hwiEnable", new Extern("ti_sysbios_family_arm_v8a_Core_hwiEnable__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.hwiRestore", new Extern("ti_sysbios_family_arm_v8a_Core_hwiRestore__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.getClusterId", new Extern("ti_sysbios_family_arm_v8a_Core_getClusterId__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.getRevisionNumber", new Extern("ti_sysbios_family_arm_v8a_Core_getRevisionNumber__E", "xdc_UInt8(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.reset", new Extern("ti_sysbios_family_arm_v8a_Core_reset__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Core.getGicrBaseAddr", new Extern("ti_sysbios_family_arm_v8a_Core_getGicrBaseAddr__I", "xdc_Ptr(*)(xdc_Ptr)", true, false));
    }

    void Mmu$$CONSTS()
    {
        // module Mmu
        om.bind("ti.sysbios.family.arm.v8a.Mmu.NUM_LEVEL1_ENTRIES", 512L);
        om.bind("ti.sysbios.family.arm.v8a.Mmu.DescriptorType_INVALID0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType", "ti.sysbios.family.arm.v8a"), "ti.sysbios.family.arm.v8a.Mmu.DescriptorType_INVALID0", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.DescriptorType_BLOCK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType", "ti.sysbios.family.arm.v8a"), "ti.sysbios.family.arm.v8a.Mmu.DescriptorType_BLOCK", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.DescriptorType_INVALID1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType", "ti.sysbios.family.arm.v8a"), "ti.sysbios.family.arm.v8a.Mmu.DescriptorType_INVALID1", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.DescriptorType_TABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType", "ti.sysbios.family.arm.v8a"), "ti.sysbios.family.arm.v8a.Mmu.DescriptorType_TABLE", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.enable", new Extern("ti_sysbios_family_arm_v8a_Mmu_enable__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.initDescAttrs", new Extern("ti_sysbios_family_arm_v8a_Mmu_initDescAttrs__E", "xdc_Void(*)(ti_sysbios_family_arm_v8a_Mmu_DescriptorAttrs*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.setMAIR", new Extern("ti_sysbios_family_arm_v8a_Mmu_setMAIR__E", "xdc_Void(*)(xdc_UInt8,xdc_UInt16)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.startup", new Extern("ti_sysbios_family_arm_v8a_Mmu_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.init", new Extern("ti_sysbios_family_arm_v8a_Mmu_init__I", "xdc_Void(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.initLevel1Desc", new Extern("ti_sysbios_family_arm_v8a_Mmu_initLevel1Desc__I", "xdc_UInt64(*)(xdc_UInt64,ti_sysbios_family_arm_v8a_Mmu_DescriptorAttrs*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.initLevel2Desc", new Extern("ti_sysbios_family_arm_v8a_Mmu_initLevel2Desc__I", "xdc_UInt64(*)(xdc_UInt64,ti_sysbios_family_arm_v8a_Mmu_DescriptorAttrs*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Mmu.setTCR", new Extern("ti_sysbios_family_arm_v8a_Mmu_setTCR__I", "xdc_Void(*)(xdc_UInt64)", true, false));
    }

    void TaskSupport$$CONSTS()
    {
        // module TaskSupport
        om.bind("ti.sysbios.family.arm.v8a.TaskSupport.start", new Extern("ti_sysbios_family_arm_v8a_TaskSupport_start__E", "xdc_Ptr(*)(xdc_Ptr,xdc_Void(*)(xdc_Void),xdc_Void(*)(xdc_Void),xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TaskSupport.swap", new Extern("ti_sysbios_family_arm_v8a_TaskSupport_swap__E", "xdc_Void(*)(xdc_Ptr*,xdc_Ptr*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TaskSupport.checkStack", new Extern("ti_sysbios_family_arm_v8a_TaskSupport_checkStack__E", "xdc_Bool(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TaskSupport.stackUsed", new Extern("ti_sysbios_family_arm_v8a_TaskSupport_stackUsed__E", "xdc_SizeT(*)(xdc_Char*,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TaskSupport.getStackAlignment", new Extern("ti_sysbios_family_arm_v8a_TaskSupport_getStackAlignment__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TaskSupport.getDefaultStackSize", new Extern("ti_sysbios_family_arm_v8a_TaskSupport_getDefaultStackSize__E", "xdc_SizeT(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TaskSupport.getCheckValueAddr", new Extern("ti_sysbios_family_arm_v8a_TaskSupport_getCheckValueAddr__E", "xdc_Ptr(*)(xdc_Ptr)", true, false));
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.family.arm.v8a.Timer.MAX_PERIOD", 0x00FFFFFFFFFFFFFFL);
        om.bind("ti.sysbios.family.arm.v8a.Timer.NUM_TIMER_DEVICES", 2L);
        om.bind("ti.sysbios.family.arm.v8a.Timer.getNumTimers", new Extern("ti_sysbios_family_arm_v8a_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.getStatus", new Extern("ti_sysbios_family_arm_v8a_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.startup", new Extern("ti_sysbios_family_arm_v8a_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.oneShotStub", new Extern("ti_sysbios_family_arm_v8a_Timer_oneShotStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.periodicStub", new Extern("ti_sysbios_family_arm_v8a_Timer_periodicStub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.getHandle", new Extern("ti_sysbios_family_arm_v8a_Timer_getHandle__E", "ti_sysbios_family_arm_v8a_Timer_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.initDevice", new Extern("ti_sysbios_family_arm_v8a_Timer_initDevice__I", "xdc_Void(*)(ti_sysbios_family_arm_v8a_Timer_Object*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.postInit", new Extern("ti_sysbios_family_arm_v8a_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_v8a_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.checkOverflow", new Extern("ti_sysbios_family_arm_v8a_Timer_checkOverflow__I", "xdc_Bool(*)(xdc_UInt64,xdc_UInt64)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.readPhyCtrl", new Extern("ti_sysbios_family_arm_v8a_Timer_readPhyCtrl__I", "xdc_UInt32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.readPhyCnt", new Extern("ti_sysbios_family_arm_v8a_Timer_readPhyCnt__I", "xdc_Void(*)(xdc_UInt64*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.writePhyCtrl", new Extern("ti_sysbios_family_arm_v8a_Timer_writePhyCtrl__I", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.writePhyCmpVal", new Extern("ti_sysbios_family_arm_v8a_Timer_writePhyCmpVal__I", "xdc_Void(*)(xdc_UInt64*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.readVirtCtrl", new Extern("ti_sysbios_family_arm_v8a_Timer_readVirtCtrl__I", "xdc_UInt32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.readVirtCnt", new Extern("ti_sysbios_family_arm_v8a_Timer_readVirtCnt__I", "xdc_Void(*)(xdc_UInt64*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.tickReconfigSmp", new Extern("ti_sysbios_family_arm_v8a_Timer_tickReconfigSmp__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.writeVirtCtrl", new Extern("ti_sysbios_family_arm_v8a_Timer_writeVirtCtrl__I", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.Timer.writeVirtCmpVal", new Extern("ti_sysbios_family_arm_v8a_Timer_writeVirtCmpVal__I", "xdc_Void(*)(xdc_UInt64*)", true, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.family.arm.v8a.TimestampProvider.get32", new Extern("ti_sysbios_family_arm_v8a_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TimestampProvider.get64", new Extern("ti_sysbios_family_arm_v8a_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TimestampProvider.getFreq", new Extern("ti_sysbios_family_arm_v8a_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TimestampProvider.initCCNT", new Extern("ti_sysbios_family_arm_v8a_TimestampProvider_initCCNT__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.v8a.TimestampProvider.get64I", new Extern("ti_sysbios_family_arm_v8a_TimestampProvider_get64I__I", "xdc_UInt64(*)(xdc_Void)", true, false));
    }

    void Core$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Mmu$$CREATES()
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
            sb.append("ti$sysbios$family$arm$v8a$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.v8a.Timer.create() called before xdc.useModule('ti.sysbios.family.arm.v8a.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v8a.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v8a.Timer.Module", "ti.sysbios.family.arm.v8a"), om.findStrict("ti.sysbios.family.arm.v8a.Timer.Instance", "ti.sysbios.family.arm.v8a"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.v8a.Timer.Params", "ti.sysbios.family.arm.v8a"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v8a$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.v8a.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.v8a.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.v8a']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.v8a.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.v8a.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.v8a.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.v8a.Timer.Module", "ti.sysbios.family.arm.v8a"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$Object", "ti.sysbios.family.arm.v8a"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.v8a.Timer.Params", "ti.sysbios.family.arm.v8a"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$v8a$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.v8a.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.v8a.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.v8a.Timer'].__initObject(__inst);\n");
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

    void Core$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Mmu$$FUNCTIONS()
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

    void Core$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Mmu$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.v8a");
        sizes.clear();
        sizes.add(Global.newArray("type", "Nti.sysbios.family.arm.v8a.Mmu.DescriptorType;;0;1;2;3"));
        sizes.add(Global.newArray("nsTable", "UShort"));
        sizes.add(Global.newArray("apTable", "UInt8"));
        sizes.add(Global.newArray("xnTable", "UShort"));
        sizes.add(Global.newArray("pxnTable", "UShort"));
        sizes.add(Global.newArray("noExecute", "UShort"));
        sizes.add(Global.newArray("privNoExecute", "UShort"));
        sizes.add(Global.newArray("contiguous", "UShort"));
        sizes.add(Global.newArray("notGlobal", "UShort"));
        sizes.add(Global.newArray("accessFlag", "UShort"));
        sizes.add(Global.newArray("shareable", "UInt8"));
        sizes.add(Global.newArray("accPerm", "UInt8"));
        sizes.add(Global.newArray("nonSecure", "UShort"));
        sizes.add(Global.newArray("attrIndx", "UInt8"));
        sizes.add(Global.newArray("reserved", "UInt8"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.Module_State", "ti.sysbios.family.arm.v8a");
        sizes.clear();
        sizes.add(Global.newArray("level1Table", "UPtr"));
        sizes.add(Global.newArray("level2Table", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v8a.Mmu.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v8a.Mmu.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v8a.Mmu.Module_State'], fld); }");
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

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v8a.Timer.Instance_State", "ti.sysbios.family.arm.v8a");
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
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v8a.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v8a.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v8a.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.v8a.Timer.Module_State", "ti.sysbios.family.arm.v8a");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "UInt"));
        sizes.add(Global.newArray("handles", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.v8a.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.v8a.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.v8a.Timer.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimestampProvider$$SIZES()
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

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v8a/Core.xs");
        om.bind("ti.sysbios.family.arm.v8a.Core$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Core.Module", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Core.Module", om.findStrict("ti.sysbios.interfaces.ICore.Module", "ti.sysbios.family.arm.v8a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("id", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
            po.addFld("baseClusterId", Proto.Elm.newCNum("(xdc_UInt)"), 0L, "w");
            po.addFld("numCores", Proto.Elm.newCNum("(xdc_UInt)"), 1L, "w");
            po.addFld("bootMaster", $$T_Bool, true, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Core$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Core$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Core$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Core$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Mmu$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v8a/Mmu.xs");
        om.bind("ti.sysbios.family.arm.v8a.Mmu$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.Module", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Mmu.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.v8a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_LEVEL1_ENTRIES", Proto.Elm.newCNum("(xdc_UInt8)"), 512L, "rh");
        if (isCFG) {
            po.addFld("defaultAttrs", (Proto)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.v8a"), Global.newObject("type", om.find("ti.sysbios.family.arm.v8a.Mmu.DescriptorType_TABLE"), "nsTable", false, "apTable", 0L, "xnTable", false, "pxnTable", false, "noExecute", false, "privNoExecute", false, "contiguous", false, "notGlobal", false, "accessFlag", true, "shareable", 0L, "accPerm", 0L, "nonSecure", false, "attrIndx", 0L, "reserved", 0L), "w");
            po.addFld("enableMMU", $$T_Bool, true, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Mmu$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Mmu$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Mmu$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Mmu$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Mmu.DescriptorAttrs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Mmu$$DescriptorAttrs", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType", "ti.sysbios.family.arm.v8a"), $$UNDEF, "w");
                po.addFld("nsTable", $$T_Bool, $$UNDEF, "w");
                po.addFld("apTable", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("xnTable", $$T_Bool, $$UNDEF, "w");
                po.addFld("pxnTable", $$T_Bool, $$UNDEF, "w");
                po.addFld("noExecute", $$T_Bool, $$UNDEF, "w");
                po.addFld("privNoExecute", $$T_Bool, $$UNDEF, "w");
                po.addFld("contiguous", $$T_Bool, $$UNDEF, "w");
                po.addFld("notGlobal", $$T_Bool, $$UNDEF, "w");
                po.addFld("accessFlag", $$T_Bool, $$UNDEF, "w");
                po.addFld("shareable", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("accPerm", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("nonSecure", $$T_Bool, $$UNDEF, "w");
                po.addFld("attrIndx", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("reserved", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
        // struct Mmu.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Mmu$$Module_State", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Mmu.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("level1Table", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt64)"), false), $$DEFAULT, "w");
                po.addFld("level2Table", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt64)"), false), $$DEFAULT, "w");
    }

    void TaskSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v8a/TaskSupport.xs");
        om.bind("ti.sysbios.family.arm.v8a.TaskSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport.Module", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.TaskSupport.Module", om.findStrict("ti.sysbios.interfaces.ITaskSupport.Module", "ti.sysbios.family.arm.v8a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("defaultStackSize", Proto.Elm.newCNum("(xdc_SizeT)"), 2048L, "r");
            po.addFld("stackAlignment", Proto.Elm.newCNum("(xdc_UInt)"), 16L, "r");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.TaskSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.TaskSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.TaskSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.TaskSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "stackUsed$view");
                if (fxn != null) po.addFxn("stackUsed$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$stackUsed$view", "ti.sysbios.family.arm.v8a"), fxn);
                fxn = Global.get(cap, "getCallStack$view");
                if (fxn != null) po.addFxn("getCallStack$view", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITaskSupport$$getCallStack$view", "ti.sysbios.family.arm.v8a"), fxn);
    }

    void Timer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v8a/Timer.xs");
        om.bind("ti.sysbios.family.arm.v8a.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer.Module", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.family.arm.v8a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt64)"), 0x00FFFFFFFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("supportsDynamic", $$T_Bool, true, "wh");
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.v8a"), $$UNDEF, "wh");
            po.addFld("E_invalidTimer", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v8a"), Global.newObject("msg", "E_invalidTimer: Invalid Timer Id %d"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v8a"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("E_invalidHwiMask", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v8a"), Global.newObject("msg", "E_InvalidMask: Mask in hwiParams cannot enable self"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.v8a"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period %d"), "w");
            po.addFld("intNumDef", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x3L, "w");
            po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x3L, "w");
            po.addFld("intFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.arm.v8a"), $$DEFAULT, "w");
            po.addFld("setEnableBit", $$T_Bool, false, "w");
            po.addFld("startupNeeded", Proto.Elm.newCNum("(xdc_UInt)"), false, "w");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$create", "ti.sysbios.family.arm.v8a"), Global.get("ti$sysbios$family$arm$v8a$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$construct", "ti.sysbios.family.arm.v8a"), Global.get("ti$sysbios$family$arm$v8a$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.family.arm.v8a"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.family.arm.v8a"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer.Instance", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.family.arm.v8a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt64)"), 0x00FFFFFFFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arm_gicv3_Hwi_Params*", "PS"), null, "w");
            po.addFld("period64", Proto.Elm.newCNum("(xdc_UInt64)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.v8a"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$Params", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.family.arm.v8a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt64)"), 0x00FFFFFFFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 2L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arm_gicv3_Hwi_Params*", "PS"), null, "w");
            po.addFld("period64", Proto.Elm.newCNum("(xdc_UInt64)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.v8a"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$Object", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Timer.Object", om.findStrict("ti.sysbios.family.arm.v8a.Timer.Instance", "ti.sysbios.family.arm.v8a"));
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$BasicView", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Timer.BasicView", null);
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
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$ModuleView", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Timer.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("availMask", $$T_Str, $$UNDEF, "w");
        // struct Timer.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$Instance_State", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("staticInst", $$T_Bool, $$UNDEF, "w");
                po.addFld("id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.v8a"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.v8a"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.v8a"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("extFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.arm.v8a"), $$DEFAULT, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.family.arm.gicv3.Hwi.Handle", "ti.sysbios.family.arm.v8a"), $$UNDEF, "w");
                po.addFld("prevThreshold", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF, "w");
                po.addFld("nextThreshold", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF, "w");
                po.addFld("savedCurrCount", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$Module_State", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("handles", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.v8a.Timer.Handle", "ti.sysbios.family.arm.v8a"), false), $$DEFAULT, "w");
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v8a/TimestampProvider.xs");
        om.bind("ti.sysbios.family.arm.v8a.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider.Module", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.family.arm.v8a"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.v8a.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.family.arm.v8a"), fxn);
        // struct TimestampProvider.Module_View
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider$$Module_View", "ti.sysbios.family.arm.v8a");
        po.init("ti.sysbios.family.arm.v8a.TimestampProvider.Module_View", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
    }

    void Core$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Core", "ti.sysbios.family.arm.v8a");
    }

    void Mmu$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Mmu", "ti.sysbios.family.arm.v8a");
        vo.bind("DescriptorAttrs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Mmu$$DescriptorAttrs", "ti.sysbios.family.arm.v8a");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v8a.Mmu.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Mmu$$Module_State", "ti.sysbios.family.arm.v8a");
        po.bind("level1Table$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt64", "isScalar", true));
        po.bind("level2Table$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt64", "isScalar", true));
    }

    void TaskSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport", "ti.sysbios.family.arm.v8a");
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer", "ti.sysbios.family.arm.v8a");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$Instance_State", "ti.sysbios.family.arm.v8a");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v8a.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$Instance_State", "ti.sysbios.family.arm.v8a");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.v8a.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer$$Module_State", "ti.sysbios.family.arm.v8a");
        po.bind("handles$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Ptr", "isScalar", true));
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider", "ti.sysbios.family.arm.v8a");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.v8a.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.v8a"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/v8a/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.v8a"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.v8a"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.v8a"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.v8a"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.v8a"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.v8a"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.v8a", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.v8a");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.v8a.");
        pkgV.bind("$vers", Global.newArray(1, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.v8a'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.v8a$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.v8a$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.v8a$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.v8a.aa53fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.v8a.aa53fg', {target: 'gnu.targets.arm.A53F', suffix: 'a53fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Core$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Core", "ti.sysbios.family.arm.v8a");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Core.Module", "ti.sysbios.family.arm.v8a");
        vo.init2(po, "ti.sysbios.family.arm.v8a.Core", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v8a.Core$$capsule", "ti.sysbios.family.arm.v8a"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v8a", "ti.sysbios.family.arm.v8a"));
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
        mcfgs.add("id");
        mcfgs.add("baseClusterId");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v8a")).add(vo);
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
        vo.bind("getId", om.findStrict("ti.sysbios.family.arm.v8a.Core.getId", "ti.sysbios.family.arm.v8a"));
        vo.bind("interruptCore", om.findStrict("ti.sysbios.family.arm.v8a.Core.interruptCore", "ti.sysbios.family.arm.v8a"));
        vo.bind("lock", om.findStrict("ti.sysbios.family.arm.v8a.Core.lock", "ti.sysbios.family.arm.v8a"));
        vo.bind("unlock", om.findStrict("ti.sysbios.family.arm.v8a.Core.unlock", "ti.sysbios.family.arm.v8a"));
        vo.bind("hwiDisable", om.findStrict("ti.sysbios.family.arm.v8a.Core.hwiDisable", "ti.sysbios.family.arm.v8a"));
        vo.bind("hwiEnable", om.findStrict("ti.sysbios.family.arm.v8a.Core.hwiEnable", "ti.sysbios.family.arm.v8a"));
        vo.bind("hwiRestore", om.findStrict("ti.sysbios.family.arm.v8a.Core.hwiRestore", "ti.sysbios.family.arm.v8a"));
        vo.bind("getClusterId", om.findStrict("ti.sysbios.family.arm.v8a.Core.getClusterId", "ti.sysbios.family.arm.v8a"));
        vo.bind("getRevisionNumber", om.findStrict("ti.sysbios.family.arm.v8a.Core.getRevisionNumber", "ti.sysbios.family.arm.v8a"));
        vo.bind("reset", om.findStrict("ti.sysbios.family.arm.v8a.Core.reset", "ti.sysbios.family.arm.v8a"));
        vo.bind("getGicrBaseAddr", om.findStrict("ti.sysbios.family.arm.v8a.Core.getGicrBaseAddr", "ti.sysbios.family.arm.v8a"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v8a_Core_Module__startupDone__E", "ti_sysbios_family_arm_v8a_Core_getId__E", "ti_sysbios_family_arm_v8a_Core_interruptCore__E", "ti_sysbios_family_arm_v8a_Core_lock__E", "ti_sysbios_family_arm_v8a_Core_unlock__E", "ti_sysbios_family_arm_v8a_Core_hwiDisable__E", "ti_sysbios_family_arm_v8a_Core_hwiEnable__E", "ti_sysbios_family_arm_v8a_Core_hwiRestore__E", "ti_sysbios_family_arm_v8a_Core_getClusterId__E", "ti_sysbios_family_arm_v8a_Core_getRevisionNumber__E"));
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
        pkgV.bind("Core", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Core");
    }

    void Mmu$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Mmu", "ti.sysbios.family.arm.v8a");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Mmu.Module", "ti.sysbios.family.arm.v8a");
        vo.init2(po, "ti.sysbios.family.arm.v8a.Mmu", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v8a.Mmu$$capsule", "ti.sysbios.family.arm.v8a"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v8a", "ti.sysbios.family.arm.v8a"));
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
        vo.bind("DescriptorType", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType", "ti.sysbios.family.arm.v8a"));
        vo.bind("DescriptorAttrs", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.v8a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.v8a"));
        mcfgs.add("defaultAttrs");
        mcfgs.add("enableMMU");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.Module_State", "ti.sysbios.family.arm.v8a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v8a.Mmu.Module_State", "ti.sysbios.family.arm.v8a"));
        vo.bind("DescriptorType_INVALID0", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType_INVALID0", "ti.sysbios.family.arm.v8a"));
        vo.bind("DescriptorType_BLOCK", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType_BLOCK", "ti.sysbios.family.arm.v8a"));
        vo.bind("DescriptorType_INVALID1", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType_INVALID1", "ti.sysbios.family.arm.v8a"));
        vo.bind("DescriptorType_TABLE", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.DescriptorType_TABLE", "ti.sysbios.family.arm.v8a"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v8a")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.enable", "ti.sysbios.family.arm.v8a"));
        vo.bind("initDescAttrs", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.initDescAttrs", "ti.sysbios.family.arm.v8a"));
        vo.bind("setMAIR", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.setMAIR", "ti.sysbios.family.arm.v8a"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.startup", "ti.sysbios.family.arm.v8a"));
        vo.bind("init", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.init", "ti.sysbios.family.arm.v8a"));
        vo.bind("initLevel1Desc", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.initLevel1Desc", "ti.sysbios.family.arm.v8a"));
        vo.bind("initLevel2Desc", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.initLevel2Desc", "ti.sysbios.family.arm.v8a"));
        vo.bind("setTCR", om.findStrict("ti.sysbios.family.arm.v8a.Mmu.setTCR", "ti.sysbios.family.arm.v8a"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v8a_Mmu_Module__startupDone__E", "ti_sysbios_family_arm_v8a_Mmu_enable__E", "ti_sysbios_family_arm_v8a_Mmu_initDescAttrs__E", "ti_sysbios_family_arm_v8a_Mmu_setMAIR__E", "ti_sysbios_family_arm_v8a_Mmu_startup__E"));
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
        pkgV.bind("Mmu", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Mmu");
    }

    void TaskSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport", "ti.sysbios.family.arm.v8a");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport.Module", "ti.sysbios.family.arm.v8a");
        vo.init2(po, "ti.sysbios.family.arm.v8a.TaskSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport$$capsule", "ti.sysbios.family.arm.v8a"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v8a", "ti.sysbios.family.arm.v8a"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITaskSupport.FuncPtr", "ti.sysbios.family.arm.v8a"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v8a")).add(vo);
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
        vo.bind("start", om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport.start", "ti.sysbios.family.arm.v8a"));
        vo.bind("swap", om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport.swap", "ti.sysbios.family.arm.v8a"));
        vo.bind("checkStack", om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport.checkStack", "ti.sysbios.family.arm.v8a"));
        vo.bind("stackUsed", om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport.stackUsed", "ti.sysbios.family.arm.v8a"));
        vo.bind("getStackAlignment", om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport.getStackAlignment", "ti.sysbios.family.arm.v8a"));
        vo.bind("getDefaultStackSize", om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport.getDefaultStackSize", "ti.sysbios.family.arm.v8a"));
        vo.bind("getCheckValueAddr", om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport.getCheckValueAddr", "ti.sysbios.family.arm.v8a"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v8a_TaskSupport_Module__startupDone__E", "ti_sysbios_family_arm_v8a_TaskSupport_start__E", "ti_sysbios_family_arm_v8a_TaskSupport_swap__E", "ti_sysbios_family_arm_v8a_TaskSupport_checkStack__E", "ti_sysbios_family_arm_v8a_TaskSupport_stackUsed__E", "ti_sysbios_family_arm_v8a_TaskSupport_getStackAlignment__E", "ti_sysbios_family_arm_v8a_TaskSupport_getDefaultStackSize__E", "ti_sysbios_family_arm_v8a_TaskSupport_getCheckValueAddr__E"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer", "ti.sysbios.family.arm.v8a");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer.Module", "ti.sysbios.family.arm.v8a");
        vo.init2(po, "ti.sysbios.family.arm.v8a.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v8a.Timer$$capsule", "ti.sysbios.family.arm.v8a"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.v8a.Timer.Instance", "ti.sysbios.family.arm.v8a"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.v8a.Timer.Params", "ti.sysbios.family.arm.v8a"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.v8a.Timer.Params", "ti.sysbios.family.arm.v8a")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.v8a.Timer.Handle", "ti.sysbios.family.arm.v8a"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v8a", "ti.sysbios.family.arm.v8a"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.family.arm.v8a"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.v8a"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.v8a"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.v8a"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.v8a"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.v8a.Timer.BasicView", "ti.sysbios.family.arm.v8a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v8a.Timer.BasicView", "ti.sysbios.family.arm.v8a"));
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.arm.v8a.Timer.ModuleView", "ti.sysbios.family.arm.v8a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v8a.Timer.ModuleView", "ti.sysbios.family.arm.v8a"));
        mcfgs.add("E_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("E_invalidHwiMask");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("intNumDef");
        mcfgs.add("anyMask");
        mcfgs.add("availMask");
        mcfgs.add("intFreq");
        mcfgs.add("setEnableBit");
        icfgs.add("setEnableBit");
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.v8a.Timer.Instance_State", "ti.sysbios.family.arm.v8a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v8a.Timer.Instance_State", "ti.sysbios.family.arm.v8a"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.v8a.Timer.Module_State", "ti.sysbios.family.arm.v8a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v8a.Timer.Module_State", "ti.sysbios.family.arm.v8a"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.family.arm.v8a"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.family.arm.v8a"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.family.arm.v8a"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.family.arm.v8a"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.family.arm.v8a"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.family.arm.v8a"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.family.arm.v8a"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.family.arm.v8a"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.family.arm.v8a"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v8a")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.v8a.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$v8a$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.family.arm.v8a.Timer.getNumTimers", "ti.sysbios.family.arm.v8a"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.family.arm.v8a.Timer.getStatus", "ti.sysbios.family.arm.v8a"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.v8a.Timer.startup", "ti.sysbios.family.arm.v8a"));
        vo.bind("oneShotStub", om.findStrict("ti.sysbios.family.arm.v8a.Timer.oneShotStub", "ti.sysbios.family.arm.v8a"));
        vo.bind("periodicStub", om.findStrict("ti.sysbios.family.arm.v8a.Timer.periodicStub", "ti.sysbios.family.arm.v8a"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.v8a.Timer.getHandle", "ti.sysbios.family.arm.v8a"));
        vo.bind("initDevice", om.findStrict("ti.sysbios.family.arm.v8a.Timer.initDevice", "ti.sysbios.family.arm.v8a"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.v8a.Timer.postInit", "ti.sysbios.family.arm.v8a"));
        vo.bind("checkOverflow", om.findStrict("ti.sysbios.family.arm.v8a.Timer.checkOverflow", "ti.sysbios.family.arm.v8a"));
        vo.bind("readPhyCtrl", om.findStrict("ti.sysbios.family.arm.v8a.Timer.readPhyCtrl", "ti.sysbios.family.arm.v8a"));
        vo.bind("readPhyCnt", om.findStrict("ti.sysbios.family.arm.v8a.Timer.readPhyCnt", "ti.sysbios.family.arm.v8a"));
        vo.bind("writePhyCtrl", om.findStrict("ti.sysbios.family.arm.v8a.Timer.writePhyCtrl", "ti.sysbios.family.arm.v8a"));
        vo.bind("writePhyCmpVal", om.findStrict("ti.sysbios.family.arm.v8a.Timer.writePhyCmpVal", "ti.sysbios.family.arm.v8a"));
        vo.bind("readVirtCtrl", om.findStrict("ti.sysbios.family.arm.v8a.Timer.readVirtCtrl", "ti.sysbios.family.arm.v8a"));
        vo.bind("readVirtCnt", om.findStrict("ti.sysbios.family.arm.v8a.Timer.readVirtCnt", "ti.sysbios.family.arm.v8a"));
        vo.bind("tickReconfigSmp", om.findStrict("ti.sysbios.family.arm.v8a.Timer.tickReconfigSmp", "ti.sysbios.family.arm.v8a"));
        vo.bind("writeVirtCtrl", om.findStrict("ti.sysbios.family.arm.v8a.Timer.writeVirtCtrl", "ti.sysbios.family.arm.v8a"));
        vo.bind("writeVirtCmpVal", om.findStrict("ti.sysbios.family.arm.v8a.Timer.writeVirtCmpVal", "ti.sysbios.family.arm.v8a"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v8a_Timer_Handle__label__E", "ti_sysbios_family_arm_v8a_Timer_Module__startupDone__E", "ti_sysbios_family_arm_v8a_Timer_Object__create__E", "ti_sysbios_family_arm_v8a_Timer_Object__delete__E", "ti_sysbios_family_arm_v8a_Timer_Object__get__E", "ti_sysbios_family_arm_v8a_Timer_Object__first__E", "ti_sysbios_family_arm_v8a_Timer_Object__next__E", "ti_sysbios_family_arm_v8a_Timer_Params__init__E", "ti_sysbios_family_arm_v8a_Timer_getNumTimers__E", "ti_sysbios_family_arm_v8a_Timer_getStatus__E", "ti_sysbios_family_arm_v8a_Timer_startup__E", "ti_sysbios_family_arm_v8a_Timer_getMaxTicks__E", "ti_sysbios_family_arm_v8a_Timer_setNextTick__E", "ti_sysbios_family_arm_v8a_Timer_start__E", "ti_sysbios_family_arm_v8a_Timer_stop__E", "ti_sysbios_family_arm_v8a_Timer_setPeriod__E", "ti_sysbios_family_arm_v8a_Timer_setPeriodMicroSecs__E", "ti_sysbios_family_arm_v8a_Timer_getPeriod__E", "ti_sysbios_family_arm_v8a_Timer_getCount__E", "ti_sysbios_family_arm_v8a_Timer_getFreq__E", "ti_sysbios_family_arm_v8a_Timer_getFunc__E", "ti_sysbios_family_arm_v8a_Timer_setFunc__E", "ti_sysbios_family_arm_v8a_Timer_trigger__E", "ti_sysbios_family_arm_v8a_Timer_getExpiredCounts__E", "ti_sysbios_family_arm_v8a_Timer_getExpiredTicks__E", "ti_sysbios_family_arm_v8a_Timer_getCurrentTick__E", "ti_sysbios_family_arm_v8a_Timer_oneShotStub__E", "ti_sysbios_family_arm_v8a_Timer_periodicStub__E", "ti_sysbios_family_arm_v8a_Timer_getHandle__E", "ti_sysbios_family_arm_v8a_Timer_reconfig__E", "ti_sysbios_family_arm_v8a_Timer_setPeriod64__E", "ti_sysbios_family_arm_v8a_Timer_setPeriodMicroSecs64__E", "ti_sysbios_family_arm_v8a_Timer_getPeriod64__E", "ti_sysbios_family_arm_v8a_Timer_getCount64__E"));
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
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.v8a.Timer.Object", "ti.sysbios.family.arm.v8a"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider", "ti.sysbios.family.arm.v8a");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider.Module", "ti.sysbios.family.arm.v8a");
        vo.init2(po, "ti.sysbios.family.arm.v8a.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider$$capsule", "ti.sysbios.family.arm.v8a"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.v8a", "ti.sysbios.family.arm.v8a"));
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
        vo.bind("Module_View", om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider.Module_View", "ti.sysbios.family.arm.v8a"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider.Module_View", "ti.sysbios.family.arm.v8a"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.v8a")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider.get32", "ti.sysbios.family.arm.v8a"));
        vo.bind("get64", om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider.get64", "ti.sysbios.family.arm.v8a"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider.getFreq", "ti.sysbios.family.arm.v8a"));
        vo.bind("initCCNT", om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider.initCCNT", "ti.sysbios.family.arm.v8a"));
        vo.bind("get64I", om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider.get64I", "ti.sysbios.family.arm.v8a"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_v8a_TimestampProvider_Module__startupDone__E", "ti_sysbios_family_arm_v8a_TimestampProvider_get32__E", "ti_sysbios_family_arm_v8a_TimestampProvider_get64__E", "ti_sysbios_family_arm_v8a_TimestampProvider_getFreq__E"));
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

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.v8a")).findStrict("PARAMS", "ti.sysbios.family.arm.v8a");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.v8a.Timer", "ti.sysbios.family.arm.v8a")).findStrict("PARAMS", "ti.sysbios.family.arm.v8a");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v8a.Core", "ti.sysbios.family.arm.v8a"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v8a.Mmu", "ti.sysbios.family.arm.v8a"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v8a.TaskSupport", "ti.sysbios.family.arm.v8a"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v8a.Timer", "ti.sysbios.family.arm.v8a"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.v8a.TimestampProvider", "ti.sysbios.family.arm.v8a"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.v8a.Timer", "ti.sysbios.family.arm.v8a");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v8a.Core")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v8a.Mmu")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v8a.TaskSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v8a.Timer")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.v8a.TimestampProvider")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.v8a")).add(pkgV);
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
        Mmu$$OBJECTS();
        TaskSupport$$OBJECTS();
        Timer$$OBJECTS();
        TimestampProvider$$OBJECTS();
        Core$$CONSTS();
        Mmu$$CONSTS();
        TaskSupport$$CONSTS();
        Timer$$CONSTS();
        TimestampProvider$$CONSTS();
        Core$$CREATES();
        Mmu$$CREATES();
        TaskSupport$$CREATES();
        Timer$$CREATES();
        TimestampProvider$$CREATES();
        Core$$FUNCTIONS();
        Mmu$$FUNCTIONS();
        TaskSupport$$FUNCTIONS();
        Timer$$FUNCTIONS();
        TimestampProvider$$FUNCTIONS();
        Core$$SIZES();
        Mmu$$SIZES();
        TaskSupport$$SIZES();
        Timer$$SIZES();
        TimestampProvider$$SIZES();
        Core$$TYPES();
        Mmu$$TYPES();
        TaskSupport$$TYPES();
        Timer$$TYPES();
        TimestampProvider$$TYPES();
        if (isROV) {
            Core$$ROV();
            Mmu$$ROV();
            TaskSupport$$ROV();
            Timer$$ROV();
            TimestampProvider$$ROV();
        }//isROV
        $$SINGLETONS();
        Core$$SINGLETONS();
        Mmu$$SINGLETONS();
        TaskSupport$$SINGLETONS();
        Timer$$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        $$INITIALIZATION();
    }
}
