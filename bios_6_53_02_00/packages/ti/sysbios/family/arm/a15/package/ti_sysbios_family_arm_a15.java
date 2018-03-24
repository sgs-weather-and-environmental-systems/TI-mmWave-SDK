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

public class ti_sysbios_family_arm_a15
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.a15", new Value.Obj("ti.sysbios.family.arm.a15", pkgP));
    }

    void Core$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.Core.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a15.Core", new Value.Obj("ti.sysbios.family.arm.a15.Core", po));
        pkgV.bind("Core", vo);
        // decls 
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a15.Cache", new Value.Obj("ti.sysbios.family.arm.a15.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.a15.Cache.Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.a15"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.Cache$$CacheInfoView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.Cache.CacheInfoView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.Cache$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.Cache.Module_State", new Proto.Str(spo, false));
    }

    void Mmu$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.Mmu.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a15.Mmu", new Value.Obj("ti.sysbios.family.arm.a15.Mmu", po));
        pkgV.bind("Mmu", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.Mmu$$PageView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.Mmu.PageView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.DescriptorType", new Proto.Enm("ti.sysbios.family.arm.a15.Mmu.DescriptorType"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.Mmu$$DescriptorAttrs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.Mmu$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.Mmu.Module_State", new Proto.Str(spo, false));
    }

    void TimerSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.TimerSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a15.TimerSupport", new Value.Obj("ti.sysbios.family.arm.a15.TimerSupport", po));
        pkgV.bind("TimerSupport", vo);
        // decls 
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a15.TimestampProvider", new Value.Obj("ti.sysbios.family.arm.a15.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.TimestampProvider$$Module_View", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.TimestampProvider.Module_View", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.TimestampProvider$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.TimestampProvider.Module_State", new Proto.Str(spo, false));
    }

    void SysUart$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.SysUart.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a15.SysUart", new Value.Obj("ti.sysbios.family.arm.a15.SysUart", po));
        pkgV.bind("SysUart", vo);
        // decls 
    }

    void Core$$CONSTS()
    {
        // module Core
        om.bind("ti.sysbios.family.arm.a15.Core.getId", new Extern("ti_sysbios_family_arm_a15_Core_getId__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Core.interruptCore", new Extern("ti_sysbios_family_arm_a15_Core_interruptCore__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Core.lock", new Extern("ti_sysbios_family_arm_a15_Core_lock__E", "xdc_IArg(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Core.unlock", new Extern("ti_sysbios_family_arm_a15_Core_unlock__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Core.hwiDisable", new Extern("ti_sysbios_family_arm_a15_Core_hwiDisable__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Core.hwiEnable", new Extern("ti_sysbios_family_arm_a15_Core_hwiEnable__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Core.hwiRestore", new Extern("ti_sysbios_family_arm_a15_Core_hwiRestore__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Core.getRevisionNumber", new Extern("ti_sysbios_family_arm_a15_Core_getRevisionNumber__E", "xdc_UInt8(*)(xdc_Void)", true, false));
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("ti.sysbios.family.arm.a15.Cache.sizeL1dCacheLine", 64L);
        om.bind("ti.sysbios.family.arm.a15.Cache.sizeL1pCacheLine", 64L);
        om.bind("ti.sysbios.family.arm.a15.Cache.sizeL2CacheLine", 64L);
        om.bind("ti.sysbios.family.arm.a15.Cache.enable", new Extern("ti_sysbios_family_arm_a15_Cache_enable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.disable", new Extern("ti_sysbios_family_arm_a15_Cache_disable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.inv", new Extern("ti_sysbios_family_arm_a15_Cache_inv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.wb", new Extern("ti_sysbios_family_arm_a15_Cache_wb__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.wbInv", new Extern("ti_sysbios_family_arm_a15_Cache_wbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.wbAll", new Extern("ti_sysbios_family_arm_a15_Cache_wbAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.wbInvAll", new Extern("ti_sysbios_family_arm_a15_Cache_wbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.wait", new Extern("ti_sysbios_family_arm_a15_Cache_wait__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.getEnabled", new Extern("ti_sysbios_family_arm_a15_Cache_getEnabled__E", "xdc_Bits16(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.invL1dAll", new Extern("ti_sysbios_family_arm_a15_Cache_invL1dAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.invL1pAll", new Extern("ti_sysbios_family_arm_a15_Cache_invL1pAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.preLoad", new Extern("ti_sysbios_family_arm_a15_Cache_preLoad__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.enableBP", new Extern("ti_sysbios_family_arm_a15_Cache_enableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.disableBP", new Extern("ti_sysbios_family_arm_a15_Cache_disableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.wbAllLoUIS", new Extern("ti_sysbios_family_arm_a15_Cache_wbAllLoUIS__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.wbInvAllLoUIS", new Extern("ti_sysbios_family_arm_a15_Cache_wbInvAllLoUIS__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.invBPAll", new Extern("ti_sysbios_family_arm_a15_Cache_invBPAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.initModuleState", new Extern("ti_sysbios_family_arm_a15_Cache_initModuleState__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.startup", new Extern("ti_sysbios_family_arm_a15_Cache_startup__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.disableL1D", new Extern("ti_sysbios_family_arm_a15_Cache_disableL1D__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.disableL1P", new Extern("ti_sysbios_family_arm_a15_Cache_disableL1P__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.enableL1D", new Extern("ti_sysbios_family_arm_a15_Cache_enableL1D__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.enableL1P", new Extern("ti_sysbios_family_arm_a15_Cache_enableL1P__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.invL1d", new Extern("ti_sysbios_family_arm_a15_Cache_invL1d__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.invL1p", new Extern("ti_sysbios_family_arm_a15_Cache_invL1p__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.preFetch", new Extern("ti_sysbios_family_arm_a15_Cache_preFetch__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.getL2AuxControlReg", new Extern("ti_sysbios_family_arm_a15_Cache_getL2AuxControlReg__I", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.setL2AuxControlReg", new Extern("ti_sysbios_family_arm_a15_Cache_setL2AuxControlReg__I", "xdc_Void(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Cache.getCacheLevelInfo", new Extern("ti_sysbios_family_arm_a15_Cache_getCacheLevelInfo__I", "xdc_Bits32(*)(xdc_UInt)", true, false));
    }

    void Mmu$$CONSTS()
    {
        // module Mmu
        om.bind("ti.sysbios.family.arm.a15.Mmu.NUM_LEVEL1_ENTRIES", 4L);
        om.bind("ti.sysbios.family.arm.a15.Mmu.NUM_LEVEL2_ENTRIES", 512L);
        om.bind("ti.sysbios.family.arm.a15.Mmu.DescriptorType_INVALID0", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType", "ti.sysbios.family.arm.a15"), "ti.sysbios.family.arm.a15.Mmu.DescriptorType_INVALID0", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.arm.a15.Mmu.DescriptorType_BLOCK", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType", "ti.sysbios.family.arm.a15"), "ti.sysbios.family.arm.a15.Mmu.DescriptorType_BLOCK", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.arm.a15.Mmu.DescriptorType_INVALID1", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType", "ti.sysbios.family.arm.a15"), "ti.sysbios.family.arm.a15.Mmu.DescriptorType_INVALID1", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.arm.a15.Mmu.DescriptorType_TABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType", "ti.sysbios.family.arm.a15"), "ti.sysbios.family.arm.a15.Mmu.DescriptorType_TABLE", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.arm.a15.Mmu.disable", new Extern("ti_sysbios_family_arm_a15_Mmu_disable__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.enable", new Extern("ti_sysbios_family_arm_a15_Mmu_enable__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.getAsid", new Extern("ti_sysbios_family_arm_a15_Mmu_getAsid__E", "xdc_UInt8(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.getFirstLevelTableAddr", new Extern("ti_sysbios_family_arm_a15_Mmu_getFirstLevelTableAddr__E", "xdc_Ptr(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.getSecondLevelTableAddr", new Extern("ti_sysbios_family_arm_a15_Mmu_getSecondLevelTableAddr__E", "xdc_Ptr(*)(xdc_UInt8)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.initDescAttrs", new Extern("ti_sysbios_family_arm_a15_Mmu_initDescAttrs__E", "xdc_Void(*)(ti_sysbios_family_arm_a15_Mmu_DescriptorAttrs*)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.isEnabled", new Extern("ti_sysbios_family_arm_a15_Mmu_isEnabled__E", "xdc_Bool(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.setMAIR", new Extern("ti_sysbios_family_arm_a15_Mmu_setMAIR__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.setFirstLevelDesc", new Extern("ti_sysbios_family_arm_a15_Mmu_setFirstLevelDesc__E", "xdc_Void(*)(xdc_Ptr,xdc_UInt64,ti_sysbios_family_arm_a15_Mmu_DescriptorAttrs*)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.setSecondLevelDesc", new Extern("ti_sysbios_family_arm_a15_Mmu_setSecondLevelDesc__E", "xdc_Void(*)(xdc_Ptr,xdc_UInt64,ti_sysbios_family_arm_a15_Mmu_DescriptorAttrs*)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.startup", new Extern("ti_sysbios_family_arm_a15_Mmu_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.switchContext", new Extern("ti_sysbios_family_arm_a15_Mmu_switchContext__E", "xdc_Void(*)(xdc_UInt8,xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.tlbInv", new Extern("ti_sysbios_family_arm_a15_Mmu_tlbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.tlbInvAll", new Extern("ti_sysbios_family_arm_a15_Mmu_tlbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.init", new Extern("ti_sysbios_family_arm_a15_Mmu_init__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.enableAsm", new Extern("ti_sysbios_family_arm_a15_Mmu_enableAsm__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.disableAsm", new Extern("ti_sysbios_family_arm_a15_Mmu_disableAsm__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.flushLevel1PageTable", new Extern("ti_sysbios_family_arm_a15_Mmu_flushLevel1PageTable__I", "xdc_Void(*)(xdc_Ptr,xdc_UInt64)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.flushLevel2PageTable", new Extern("ti_sysbios_family_arm_a15_Mmu_flushLevel2PageTable__I", "xdc_Void(*)(xdc_Ptr,xdc_UInt64)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.writeMAIRAsm", new Extern("ti_sysbios_family_arm_a15_Mmu_writeMAIRAsm__I", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.setMAIRCoreX", new Extern("ti_sysbios_family_arm_a15_Mmu_setMAIRCoreX__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.clearTableBuf", new Extern("ti_sysbios_family_arm_a15_Mmu_clearTableBuf__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.initFirstLevelTableBuf", new Extern("ti_sysbios_family_arm_a15_Mmu_initFirstLevelTableBuf__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.initSecondLevelTableBuf", new Extern("ti_sysbios_family_arm_a15_Mmu_initSecondLevelTableBuf__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.Mmu.instructionSync", new Extern("ti_sysbios_family_arm_a15_Mmu_instructionSync__I", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void TimerSupport$$CONSTS()
    {
        // module TimerSupport
        om.bind("ti.sysbios.family.arm.a15.TimerSupport.enable", new Extern("ti_sysbios_family_arm_a15_TimerSupport_enable__E", "xdc_Void(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.family.arm.a15.TimestampProvider.get32", new Extern("ti_sysbios_family_arm_a15_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.TimestampProvider.get64", new Extern("ti_sysbios_family_arm_a15_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.family.arm.a15.TimestampProvider.getFreq", new Extern("ti_sysbios_family_arm_a15_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
        om.bind("ti.sysbios.family.arm.a15.TimestampProvider.initCCNT", new Extern("ti_sysbios_family_arm_a15_TimestampProvider_initCCNT__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.TimestampProvider.getOverflowCCNT", new Extern("ti_sysbios_family_arm_a15_TimestampProvider_getOverflowCCNT__I", "xdc_UInt32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.TimestampProvider.autoRefreshFxn", new Extern("ti_sysbios_family_arm_a15_TimestampProvider_autoRefreshFxn__I", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void SysUart$$CONSTS()
    {
        // module SysUart
        om.bind("ti.sysbios.family.arm.a15.SysUart.abort", new Extern("ti_sysbios_family_arm_a15_SysUart_abort__E", "xdc_Void(*)(xdc_CString)", true, false));
        om.bind("ti.sysbios.family.arm.a15.SysUart.exit", new Extern("ti_sysbios_family_arm_a15_SysUart_exit__E", "xdc_Void(*)(xdc_Int)", true, false));
        om.bind("ti.sysbios.family.arm.a15.SysUart.flush", new Extern("ti_sysbios_family_arm_a15_SysUart_flush__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.SysUart.putch", new Extern("ti_sysbios_family_arm_a15_SysUart_putch__E", "xdc_Void(*)(xdc_Char)", true, false));
        om.bind("ti.sysbios.family.arm.a15.SysUart.ready", new Extern("ti_sysbios_family_arm_a15_SysUart_ready__E", "xdc_Bool(*)(xdc_Void)", true, false));
    }

    void Core$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cache$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Mmu$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

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

    void SysUart$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Core$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Mmu$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Mmu.setMAIRMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a15.Mmu$$setMAIRMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a15.Mmu.Module", "ti.sysbios.family.arm.a15"), null, 2, 2, false));
                fxn.addArg(0, "attrIndx", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "attr", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
        // fxn Mmu.initDescAttrsMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a15.Mmu$$initDescAttrsMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a15.Mmu.Module", "ti.sysbios.family.arm.a15"), null, 1, 1, false));
                fxn.addArg(0, "descAttrs", new Proto.Adr("ti_sysbios_family_arm_a15_Mmu_DescriptorAttrs*", "PS"), $$UNDEF);
        // fxn Mmu.setFirstLevelDescMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a15.Mmu$$setFirstLevelDescMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a15.Mmu.Module", "ti.sysbios.family.arm.a15"), null, 3, 3, false));
                fxn.addArg(0, "virtualAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(1, "phyAddr", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF);
                fxn.addArg(2, "attrs", (Proto)om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.a15"), $$DEFAULT);
        // fxn Mmu.setSecondLevelDescMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a15.Mmu$$setSecondLevelDescMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a15.Mmu.Module", "ti.sysbios.family.arm.a15"), null, 3, 3, false));
                fxn.addArg(0, "virtualAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(1, "phyAddr", Proto.Elm.newCNum("(xdc_UInt64)"), $$UNDEF);
                fxn.addArg(2, "attrs", (Proto)om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.a15"), $$DEFAULT);
    }

    void TimerSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void TimestampProvider$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void SysUart$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Core$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a15.Cache.Module_State", "ti.sysbios.family.arm.a15");
        sizes.clear();
        sizes.add(Global.newArray("l1dInfo", "UInt32"));
        sizes.add(Global.newArray("l1pInfo", "UInt32"));
        sizes.add(Global.newArray("l2Info", "UInt32"));
        sizes.add(Global.newArray("l2WaySize", "USize"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a15.Cache.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a15.Cache.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a15.Cache.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Mmu$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.a15");
        sizes.clear();
        sizes.add(Global.newArray("type", "Nti.sysbios.family.arm.a15.Mmu.DescriptorType;;0;1;2;3"));
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
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a15.Mmu.Module_State", "ti.sysbios.family.arm.a15");
        sizes.clear();
        sizes.add(Global.newArray("firstLevelTableBuf", "UPtr"));
        sizes.add(Global.newArray("secondLevelTableBuf", "A4;UPtr"));
        sizes.add(Global.newArray("mairRegAttr", "A8;UInt"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a15.Mmu.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a15.Mmu.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a15.Mmu.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimerSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void TimestampProvider$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.Module_State", "ti.sysbios.family.arm.a15");
        sizes.clear();
        sizes.add(Global.newArray("upper32Bits", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a15.TimestampProvider.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a15.TimestampProvider.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a15.TimestampProvider.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void SysUart$$SIZES()
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

        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Core.Module", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.Core.Module", om.findStrict("ti.sysbios.interfaces.ICore.Module", "ti.sysbios.family.arm.a15"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("numCores", Proto.Elm.newCNum("(xdc_UInt)"), 1L, "w");
        }//isCFG
    }

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a15/Cache.xs");
        om.bind("ti.sysbios.family.arm.a15.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Cache.Module", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.Cache.Module", om.findStrict("ti.sysbios.interfaces.ICache.Module", "ti.sysbios.family.arm.a15"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("sizeL1dCacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 64L, "rh");
                po.addFld("sizeL1pCacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 64L, "rh");
                po.addFld("sizeL2CacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 64L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.a15"), $$UNDEF, "wh");
            po.addFld("A_badBlockLength", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a15"), Global.newObject("msg", "A_badBlockLength: Block length too large. Must be <= L2 way size."), "w");
            po.addFld("A_blockCrossesPage", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a15"), Global.newObject("msg", "A_blockCrossesPage: Memory block crosses L2 way page boundary."), "w");
            po.addFld("enableCache", $$T_Bool, true, "w");
            po.addFld("errata798870", $$T_Bool, false, "w");
            po.addFld("branchPredictionEnabled", $$T_Bool, true, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Cache.CacheInfoView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Cache$$CacheInfoView", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.Cache.CacheInfoView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("cache", $$T_Str, $$UNDEF, "w");
                po.addFld("cacheSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("lineSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("ways", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("waySize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
        // struct Cache.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Cache$$Module_State", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.Cache.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("l1dInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l1pInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l2Info", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l2WaySize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
    }

    void Mmu$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a15/Mmu.xs");
        om.bind("ti.sysbios.family.arm.a15.Mmu$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu.Module", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.Mmu.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.a15"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("NUM_LEVEL1_ENTRIES", Proto.Elm.newCNum("(xdc_UInt)"), 4L, "rh");
                po.addFld("NUM_LEVEL2_ENTRIES", Proto.Elm.newCNum("(xdc_UInt)"), 512L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.a15"), $$UNDEF, "wh");
            po.addFld("A_nullPointer", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a15"), Global.newObject("msg", "A_nullPointer: Pointer is null"), "w");
            po.addFld("A_unknownDescType", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a15"), Global.newObject("msg", "A_unknownDescType: Descriptor type is not recognized"), "w");
            po.addFld("A_disableUnsupported", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a15"), Global.newObject("msg", "A_disableUnsupported: MMU disable is not supported in SMP mode."), "w");
            po.addFld("defaultAttrs", (Proto)om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.a15"), Global.newObject("type", om.find("ti.sysbios.family.arm.a15.Mmu.DescriptorType_TABLE"), "nsTable", false, "apTable", 0L, "xnTable", false, "pxnTable", false, "noExecute", false, "privNoExecute", false, "contiguous", false, "notGlobal", false, "accessFlag", true, "shareable", 0L, "accPerm", 0L, "nonSecure", false, "attrIndx", 0L, "reserved", 0L), "w");
            po.addFld("enableMMU", $$T_Bool, true, "w");
            po.addFld("errata798181", $$T_Bool, true, "w");
            po.addFld("cachePlatformMemory", $$T_Bool, true, "wh");
            po.addFld("firstLevelTableBuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "wh");
            po.addFld("secondLevelTableBuf", new Proto.Arr(new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "wh");
            po.addFld("mairRegAttr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.Mmu$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.Mmu$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.Mmu$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.Mmu$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("setMAIRMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a15.Mmu$$setMAIRMeta", "ti.sysbios.family.arm.a15"), Global.get(cap, "setMAIRMeta"));
                po.addFxn("initDescAttrsMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a15.Mmu$$initDescAttrsMeta", "ti.sysbios.family.arm.a15"), Global.get(cap, "initDescAttrsMeta"));
                po.addFxn("setFirstLevelDescMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a15.Mmu$$setFirstLevelDescMeta", "ti.sysbios.family.arm.a15"), Global.get(cap, "setFirstLevelDescMeta"));
                po.addFxn("setSecondLevelDescMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a15.Mmu$$setSecondLevelDescMeta", "ti.sysbios.family.arm.a15"), Global.get(cap, "setSecondLevelDescMeta"));
        // struct Mmu.PageView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu$$PageView", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.Mmu.PageView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("Type", $$T_Str, $$UNDEF, "w");
                po.addFld("AddrVirtual", $$T_Str, $$UNDEF, "w");
                po.addFld("AddrPhysical", $$T_Str, $$UNDEF, "w");
                po.addFld("NextLevelTablePtr", $$T_Str, $$UNDEF, "w");
                po.addFld("NSTable", $$T_Bool, $$UNDEF, "w");
                po.addFld("APTable", $$T_Str, $$UNDEF, "w");
                po.addFld("XNTable", $$T_Bool, $$UNDEF, "w");
                po.addFld("PXNTable", $$T_Bool, $$UNDEF, "w");
                po.addFld("NoExecute", $$T_Bool, $$UNDEF, "w");
                po.addFld("PrivNoExecute", $$T_Bool, $$UNDEF, "w");
                po.addFld("Contiguous", $$T_Bool, $$UNDEF, "w");
                po.addFld("NotGlobal", $$T_Bool, $$UNDEF, "w");
                po.addFld("AccessFlag", $$T_Bool, $$UNDEF, "w");
                po.addFld("Shareable", $$T_Str, $$UNDEF, "w");
                po.addFld("AccessPerm", $$T_Str, $$UNDEF, "w");
                po.addFld("NonSecure", $$T_Bool, $$UNDEF, "w");
                po.addFld("MemAttr", $$T_Str, $$UNDEF, "w");
                po.addFld("AttrIndx", $$T_Str, $$UNDEF, "w");
        // struct Mmu.DescriptorAttrs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu$$DescriptorAttrs", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType", "ti.sysbios.family.arm.a15"), $$UNDEF, "w");
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
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu$$Module_State", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.Mmu.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("firstLevelTableBuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt64)"), false), $$DEFAULT, "w");
                po.addFld("secondLevelTableBuf", new Proto.Arr(new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt64)"), false), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("mairRegAttr", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
    }

    void TimerSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a15/TimerSupport.xs");
        om.bind("ti.sysbios.family.arm.a15.TimerSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimerSupport.Module", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.TimerSupport.Module", om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.family.arm.a15"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.TimerSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.TimerSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.TimerSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.TimerSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a15/TimestampProvider.xs");
        om.bind("ti.sysbios.family.arm.a15.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.Module", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.family.arm.a15"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("autoRefreshEnable", $$T_Bool, true, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.family.arm.a15"), fxn);
        // struct TimestampProvider.Module_View
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider$$Module_View", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.TimestampProvider.Module_View", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct TimestampProvider.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider$$Module_State", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.TimestampProvider.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("upper32Bits", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
    }

    void SysUart$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.SysUart.Module", "ti.sysbios.family.arm.a15");
        po.init("ti.sysbios.family.arm.a15.SysUart.Module", om.findStrict("xdc.runtime.ISystemSupport.Module", "ti.sysbios.family.arm.a15"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void Core$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.Core", "ti.sysbios.family.arm.a15");
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.Cache", "ti.sysbios.family.arm.a15");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a15.Cache.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Cache$$Module_State", "ti.sysbios.family.arm.a15");
    }

    void Mmu$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu", "ti.sysbios.family.arm.a15");
        vo.bind("DescriptorAttrs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu$$DescriptorAttrs", "ti.sysbios.family.arm.a15");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a15.Mmu.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu$$Module_State", "ti.sysbios.family.arm.a15");
        po.bind("firstLevelTableBuf$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt64", "isScalar", true));
    }

    void TimerSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimerSupport", "ti.sysbios.family.arm.a15");
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider", "ti.sysbios.family.arm.a15");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a15.TimestampProvider.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider$$Module_State", "ti.sysbios.family.arm.a15");
    }

    void SysUart$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.SysUart", "ti.sysbios.family.arm.a15");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.a15.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.a15"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a15/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.a15"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.a15"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.a15"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.a15"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.a15"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.a15"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.a15", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.a15");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.a15.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.a15'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.a15$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.a15$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.a15$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a15.aa15fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a15.aa9fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a15.aer5f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a15.aer4f',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a15.aer4ft',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a15.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a15.aa9fg', {target: 'gnu.targets.arm.A9F', suffix: 'a9fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a15.aer5f', {target: 'ti.targets.arm.elf.R5F', suffix: 'er5f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a15.aer4f', {target: 'ti.targets.arm.elf.R4F', suffix: 'er4f'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a15.aer4ft', {target: 'ti.targets.arm.elf.R4Ft', suffix: 'er4ft'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Core$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.Core", "ti.sysbios.family.arm.a15");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Core.Module", "ti.sysbios.family.arm.a15");
        vo.init2(po, "ti.sysbios.family.arm.a15.Core", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a15", "ti.sysbios.family.arm.a15"));
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
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a15")).add(vo);
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
        vo.bind("getId", om.findStrict("ti.sysbios.family.arm.a15.Core.getId", "ti.sysbios.family.arm.a15"));
        vo.bind("interruptCore", om.findStrict("ti.sysbios.family.arm.a15.Core.interruptCore", "ti.sysbios.family.arm.a15"));
        vo.bind("lock", om.findStrict("ti.sysbios.family.arm.a15.Core.lock", "ti.sysbios.family.arm.a15"));
        vo.bind("unlock", om.findStrict("ti.sysbios.family.arm.a15.Core.unlock", "ti.sysbios.family.arm.a15"));
        vo.bind("hwiDisable", om.findStrict("ti.sysbios.family.arm.a15.Core.hwiDisable", "ti.sysbios.family.arm.a15"));
        vo.bind("hwiEnable", om.findStrict("ti.sysbios.family.arm.a15.Core.hwiEnable", "ti.sysbios.family.arm.a15"));
        vo.bind("hwiRestore", om.findStrict("ti.sysbios.family.arm.a15.Core.hwiRestore", "ti.sysbios.family.arm.a15"));
        vo.bind("getRevisionNumber", om.findStrict("ti.sysbios.family.arm.a15.Core.getRevisionNumber", "ti.sysbios.family.arm.a15"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a15_Core_Module__startupDone__E", "ti_sysbios_family_arm_a15_Core_getId__E", "ti_sysbios_family_arm_a15_Core_interruptCore__E", "ti_sysbios_family_arm_a15_Core_lock__E", "ti_sysbios_family_arm_a15_Core_unlock__E", "ti_sysbios_family_arm_a15_Core_hwiDisable__E", "ti_sysbios_family_arm_a15_Core_hwiEnable__E", "ti_sysbios_family_arm_a15_Core_hwiRestore__E", "ti_sysbios_family_arm_a15_Core_getRevisionNumber__E"));
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

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.Cache", "ti.sysbios.family.arm.a15");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Cache.Module", "ti.sysbios.family.arm.a15");
        vo.init2(po, "ti.sysbios.family.arm.a15.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a15.Cache$$capsule", "ti.sysbios.family.arm.a15"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a15", "ti.sysbios.family.arm.a15"));
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
        vo.bind("Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.a15"));
        vo.bind("CacheInfoView", om.findStrict("ti.sysbios.family.arm.a15.Cache.CacheInfoView", "ti.sysbios.family.arm.a15"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.Cache.CacheInfoView", "ti.sysbios.family.arm.a15"));
        mcfgs.add("A_badBlockLength");
        mcfgs.add("A_blockCrossesPage");
        mcfgs.add("enableCache");
        mcfgs.add("errata798870");
        mcfgs.add("branchPredictionEnabled");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a15.Cache.Module_State", "ti.sysbios.family.arm.a15"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.Cache.Module_State", "ti.sysbios.family.arm.a15"));
        vo.bind("Type_L1P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1P", "ti.sysbios.family.arm.a15"));
        vo.bind("Type_L1D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1D", "ti.sysbios.family.arm.a15"));
        vo.bind("Type_L1", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1", "ti.sysbios.family.arm.a15"));
        vo.bind("Type_L2P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2P", "ti.sysbios.family.arm.a15"));
        vo.bind("Type_L2D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2D", "ti.sysbios.family.arm.a15"));
        vo.bind("Type_L2", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2", "ti.sysbios.family.arm.a15"));
        vo.bind("Type_ALLP", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLP", "ti.sysbios.family.arm.a15"));
        vo.bind("Type_ALLD", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLD", "ti.sysbios.family.arm.a15"));
        vo.bind("Type_ALL", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALL", "ti.sysbios.family.arm.a15"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a15")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.a15.Cache.enable", "ti.sysbios.family.arm.a15"));
        vo.bind("disable", om.findStrict("ti.sysbios.family.arm.a15.Cache.disable", "ti.sysbios.family.arm.a15"));
        vo.bind("inv", om.findStrict("ti.sysbios.family.arm.a15.Cache.inv", "ti.sysbios.family.arm.a15"));
        vo.bind("wb", om.findStrict("ti.sysbios.family.arm.a15.Cache.wb", "ti.sysbios.family.arm.a15"));
        vo.bind("wbInv", om.findStrict("ti.sysbios.family.arm.a15.Cache.wbInv", "ti.sysbios.family.arm.a15"));
        vo.bind("wbAll", om.findStrict("ti.sysbios.family.arm.a15.Cache.wbAll", "ti.sysbios.family.arm.a15"));
        vo.bind("wbInvAll", om.findStrict("ti.sysbios.family.arm.a15.Cache.wbInvAll", "ti.sysbios.family.arm.a15"));
        vo.bind("wait", om.findStrict("ti.sysbios.family.arm.a15.Cache.wait", "ti.sysbios.family.arm.a15"));
        vo.bind("getEnabled", om.findStrict("ti.sysbios.family.arm.a15.Cache.getEnabled", "ti.sysbios.family.arm.a15"));
        vo.bind("invL1dAll", om.findStrict("ti.sysbios.family.arm.a15.Cache.invL1dAll", "ti.sysbios.family.arm.a15"));
        vo.bind("invL1pAll", om.findStrict("ti.sysbios.family.arm.a15.Cache.invL1pAll", "ti.sysbios.family.arm.a15"));
        vo.bind("preLoad", om.findStrict("ti.sysbios.family.arm.a15.Cache.preLoad", "ti.sysbios.family.arm.a15"));
        vo.bind("enableBP", om.findStrict("ti.sysbios.family.arm.a15.Cache.enableBP", "ti.sysbios.family.arm.a15"));
        vo.bind("disableBP", om.findStrict("ti.sysbios.family.arm.a15.Cache.disableBP", "ti.sysbios.family.arm.a15"));
        vo.bind("wbAllLoUIS", om.findStrict("ti.sysbios.family.arm.a15.Cache.wbAllLoUIS", "ti.sysbios.family.arm.a15"));
        vo.bind("wbInvAllLoUIS", om.findStrict("ti.sysbios.family.arm.a15.Cache.wbInvAllLoUIS", "ti.sysbios.family.arm.a15"));
        vo.bind("invBPAll", om.findStrict("ti.sysbios.family.arm.a15.Cache.invBPAll", "ti.sysbios.family.arm.a15"));
        vo.bind("initModuleState", om.findStrict("ti.sysbios.family.arm.a15.Cache.initModuleState", "ti.sysbios.family.arm.a15"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.a15.Cache.startup", "ti.sysbios.family.arm.a15"));
        vo.bind("disableL1D", om.findStrict("ti.sysbios.family.arm.a15.Cache.disableL1D", "ti.sysbios.family.arm.a15"));
        vo.bind("disableL1P", om.findStrict("ti.sysbios.family.arm.a15.Cache.disableL1P", "ti.sysbios.family.arm.a15"));
        vo.bind("enableL1D", om.findStrict("ti.sysbios.family.arm.a15.Cache.enableL1D", "ti.sysbios.family.arm.a15"));
        vo.bind("enableL1P", om.findStrict("ti.sysbios.family.arm.a15.Cache.enableL1P", "ti.sysbios.family.arm.a15"));
        vo.bind("invL1d", om.findStrict("ti.sysbios.family.arm.a15.Cache.invL1d", "ti.sysbios.family.arm.a15"));
        vo.bind("invL1p", om.findStrict("ti.sysbios.family.arm.a15.Cache.invL1p", "ti.sysbios.family.arm.a15"));
        vo.bind("preFetch", om.findStrict("ti.sysbios.family.arm.a15.Cache.preFetch", "ti.sysbios.family.arm.a15"));
        vo.bind("getL2AuxControlReg", om.findStrict("ti.sysbios.family.arm.a15.Cache.getL2AuxControlReg", "ti.sysbios.family.arm.a15"));
        vo.bind("setL2AuxControlReg", om.findStrict("ti.sysbios.family.arm.a15.Cache.setL2AuxControlReg", "ti.sysbios.family.arm.a15"));
        vo.bind("getCacheLevelInfo", om.findStrict("ti.sysbios.family.arm.a15.Cache.getCacheLevelInfo", "ti.sysbios.family.arm.a15"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a15_Cache_Module__startupDone__E", "ti_sysbios_family_arm_a15_Cache_enable__E", "ti_sysbios_family_arm_a15_Cache_disable__E", "ti_sysbios_family_arm_a15_Cache_inv__E", "ti_sysbios_family_arm_a15_Cache_wb__E", "ti_sysbios_family_arm_a15_Cache_wbInv__E", "ti_sysbios_family_arm_a15_Cache_wbAll__E", "ti_sysbios_family_arm_a15_Cache_wbInvAll__E", "ti_sysbios_family_arm_a15_Cache_wait__E", "ti_sysbios_family_arm_a15_Cache_getEnabled__E", "ti_sysbios_family_arm_a15_Cache_invL1dAll__E", "ti_sysbios_family_arm_a15_Cache_invL1pAll__E", "ti_sysbios_family_arm_a15_Cache_preLoad__E", "ti_sysbios_family_arm_a15_Cache_enableBP__E", "ti_sysbios_family_arm_a15_Cache_disableBP__E", "ti_sysbios_family_arm_a15_Cache_wbAllLoUIS__E", "ti_sysbios_family_arm_a15_Cache_wbInvAllLoUIS__E", "ti_sysbios_family_arm_a15_Cache_invBPAll__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_badBlockLength", "A_blockCrossesPage"));
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

    void Mmu$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu", "ti.sysbios.family.arm.a15");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu.Module", "ti.sysbios.family.arm.a15");
        vo.init2(po, "ti.sysbios.family.arm.a15.Mmu", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a15.Mmu$$capsule", "ti.sysbios.family.arm.a15"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a15", "ti.sysbios.family.arm.a15"));
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
        vo.bind("PageView", om.findStrict("ti.sysbios.family.arm.a15.Mmu.PageView", "ti.sysbios.family.arm.a15"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.Mmu.PageView", "ti.sysbios.family.arm.a15"));
        vo.bind("DescriptorType", om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType", "ti.sysbios.family.arm.a15"));
        vo.bind("DescriptorAttrs", om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.a15"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorAttrs", "ti.sysbios.family.arm.a15"));
        mcfgs.add("A_nullPointer");
        mcfgs.add("A_unknownDescType");
        mcfgs.add("A_disableUnsupported");
        mcfgs.add("defaultAttrs");
        mcfgs.add("enableMMU");
        mcfgs.add("errata798181");
        icfgs.add("firstLevelTableBuf");
        icfgs.add("secondLevelTableBuf");
        mcfgs.add("mairRegAttr");
        icfgs.add("mairRegAttr");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a15.Mmu.Module_State", "ti.sysbios.family.arm.a15"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.Mmu.Module_State", "ti.sysbios.family.arm.a15"));
        vo.bind("DescriptorType_INVALID0", om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType_INVALID0", "ti.sysbios.family.arm.a15"));
        vo.bind("DescriptorType_BLOCK", om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType_BLOCK", "ti.sysbios.family.arm.a15"));
        vo.bind("DescriptorType_INVALID1", om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType_INVALID1", "ti.sysbios.family.arm.a15"));
        vo.bind("DescriptorType_TABLE", om.findStrict("ti.sysbios.family.arm.a15.Mmu.DescriptorType_TABLE", "ti.sysbios.family.arm.a15"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a15")).add(vo);
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
        vo.bind("disable", om.findStrict("ti.sysbios.family.arm.a15.Mmu.disable", "ti.sysbios.family.arm.a15"));
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.a15.Mmu.enable", "ti.sysbios.family.arm.a15"));
        vo.bind("getAsid", om.findStrict("ti.sysbios.family.arm.a15.Mmu.getAsid", "ti.sysbios.family.arm.a15"));
        vo.bind("getFirstLevelTableAddr", om.findStrict("ti.sysbios.family.arm.a15.Mmu.getFirstLevelTableAddr", "ti.sysbios.family.arm.a15"));
        vo.bind("getSecondLevelTableAddr", om.findStrict("ti.sysbios.family.arm.a15.Mmu.getSecondLevelTableAddr", "ti.sysbios.family.arm.a15"));
        vo.bind("initDescAttrs", om.findStrict("ti.sysbios.family.arm.a15.Mmu.initDescAttrs", "ti.sysbios.family.arm.a15"));
        vo.bind("isEnabled", om.findStrict("ti.sysbios.family.arm.a15.Mmu.isEnabled", "ti.sysbios.family.arm.a15"));
        vo.bind("setMAIR", om.findStrict("ti.sysbios.family.arm.a15.Mmu.setMAIR", "ti.sysbios.family.arm.a15"));
        vo.bind("setFirstLevelDesc", om.findStrict("ti.sysbios.family.arm.a15.Mmu.setFirstLevelDesc", "ti.sysbios.family.arm.a15"));
        vo.bind("setSecondLevelDesc", om.findStrict("ti.sysbios.family.arm.a15.Mmu.setSecondLevelDesc", "ti.sysbios.family.arm.a15"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.a15.Mmu.startup", "ti.sysbios.family.arm.a15"));
        vo.bind("switchContext", om.findStrict("ti.sysbios.family.arm.a15.Mmu.switchContext", "ti.sysbios.family.arm.a15"));
        vo.bind("tlbInv", om.findStrict("ti.sysbios.family.arm.a15.Mmu.tlbInv", "ti.sysbios.family.arm.a15"));
        vo.bind("tlbInvAll", om.findStrict("ti.sysbios.family.arm.a15.Mmu.tlbInvAll", "ti.sysbios.family.arm.a15"));
        vo.bind("init", om.findStrict("ti.sysbios.family.arm.a15.Mmu.init", "ti.sysbios.family.arm.a15"));
        vo.bind("enableAsm", om.findStrict("ti.sysbios.family.arm.a15.Mmu.enableAsm", "ti.sysbios.family.arm.a15"));
        vo.bind("disableAsm", om.findStrict("ti.sysbios.family.arm.a15.Mmu.disableAsm", "ti.sysbios.family.arm.a15"));
        vo.bind("flushLevel1PageTable", om.findStrict("ti.sysbios.family.arm.a15.Mmu.flushLevel1PageTable", "ti.sysbios.family.arm.a15"));
        vo.bind("flushLevel2PageTable", om.findStrict("ti.sysbios.family.arm.a15.Mmu.flushLevel2PageTable", "ti.sysbios.family.arm.a15"));
        vo.bind("writeMAIRAsm", om.findStrict("ti.sysbios.family.arm.a15.Mmu.writeMAIRAsm", "ti.sysbios.family.arm.a15"));
        vo.bind("setMAIRCoreX", om.findStrict("ti.sysbios.family.arm.a15.Mmu.setMAIRCoreX", "ti.sysbios.family.arm.a15"));
        vo.bind("clearTableBuf", om.findStrict("ti.sysbios.family.arm.a15.Mmu.clearTableBuf", "ti.sysbios.family.arm.a15"));
        vo.bind("initFirstLevelTableBuf", om.findStrict("ti.sysbios.family.arm.a15.Mmu.initFirstLevelTableBuf", "ti.sysbios.family.arm.a15"));
        vo.bind("initSecondLevelTableBuf", om.findStrict("ti.sysbios.family.arm.a15.Mmu.initSecondLevelTableBuf", "ti.sysbios.family.arm.a15"));
        vo.bind("instructionSync", om.findStrict("ti.sysbios.family.arm.a15.Mmu.instructionSync", "ti.sysbios.family.arm.a15"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a15_Mmu_Module__startupDone__E", "ti_sysbios_family_arm_a15_Mmu_disable__E", "ti_sysbios_family_arm_a15_Mmu_enable__E", "ti_sysbios_family_arm_a15_Mmu_getAsid__E", "ti_sysbios_family_arm_a15_Mmu_getFirstLevelTableAddr__E", "ti_sysbios_family_arm_a15_Mmu_getSecondLevelTableAddr__E", "ti_sysbios_family_arm_a15_Mmu_initDescAttrs__E", "ti_sysbios_family_arm_a15_Mmu_isEnabled__E", "ti_sysbios_family_arm_a15_Mmu_setMAIR__E", "ti_sysbios_family_arm_a15_Mmu_setFirstLevelDesc__E", "ti_sysbios_family_arm_a15_Mmu_setSecondLevelDesc__E", "ti_sysbios_family_arm_a15_Mmu_startup__E", "ti_sysbios_family_arm_a15_Mmu_switchContext__E", "ti_sysbios_family_arm_a15_Mmu_tlbInv__E", "ti_sysbios_family_arm_a15_Mmu_tlbInvAll__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_nullPointer", "A_unknownDescType", "A_disableUnsupported"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", "./Mmu.xdt");
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Mmu.xdt");
        pkgV.bind("Mmu", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Mmu");
    }

    void TimerSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimerSupport", "ti.sysbios.family.arm.a15");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimerSupport.Module", "ti.sysbios.family.arm.a15");
        vo.init2(po, "ti.sysbios.family.arm.a15.TimerSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a15.TimerSupport$$capsule", "ti.sysbios.family.arm.a15"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a15", "ti.sysbios.family.arm.a15"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a15")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.a15.TimerSupport.enable", "ti.sysbios.family.arm.a15"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a15_TimerSupport_Module__startupDone__E", "ti_sysbios_family_arm_a15_TimerSupport_enable__E"));
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
        pkgV.bind("TimerSupport", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TimerSupport");
    }

    void TimestampProvider$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider", "ti.sysbios.family.arm.a15");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.Module", "ti.sysbios.family.arm.a15");
        vo.init2(po, "ti.sysbios.family.arm.a15.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider$$capsule", "ti.sysbios.family.arm.a15"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a15", "ti.sysbios.family.arm.a15"));
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
        vo.bind("Module_View", om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.Module_View", "ti.sysbios.family.arm.a15"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.Module_View", "ti.sysbios.family.arm.a15"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.Module_State", "ti.sysbios.family.arm.a15"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.Module_State", "ti.sysbios.family.arm.a15"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a15")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.get32", "ti.sysbios.family.arm.a15"));
        vo.bind("get64", om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.get64", "ti.sysbios.family.arm.a15"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.getFreq", "ti.sysbios.family.arm.a15"));
        vo.bind("initCCNT", om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.initCCNT", "ti.sysbios.family.arm.a15"));
        vo.bind("getOverflowCCNT", om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.getOverflowCCNT", "ti.sysbios.family.arm.a15"));
        vo.bind("autoRefreshFxn", om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider.autoRefreshFxn", "ti.sysbios.family.arm.a15"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a15_TimestampProvider_Module__startupDone__E", "ti_sysbios_family_arm_a15_TimestampProvider_get32__E", "ti_sysbios_family_arm_a15_TimestampProvider_get64__E", "ti_sysbios_family_arm_a15_TimestampProvider_getFreq__E"));
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

    void SysUart$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.SysUart", "ti.sysbios.family.arm.a15");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.SysUart.Module", "ti.sysbios.family.arm.a15");
        vo.init2(po, "ti.sysbios.family.arm.a15.SysUart", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a15", "ti.sysbios.family.arm.a15"));
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
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a15")).add(vo);
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
        vo.bind("abort", om.findStrict("ti.sysbios.family.arm.a15.SysUart.abort", "ti.sysbios.family.arm.a15"));
        vo.bind("exit", om.findStrict("ti.sysbios.family.arm.a15.SysUart.exit", "ti.sysbios.family.arm.a15"));
        vo.bind("flush", om.findStrict("ti.sysbios.family.arm.a15.SysUart.flush", "ti.sysbios.family.arm.a15"));
        vo.bind("putch", om.findStrict("ti.sysbios.family.arm.a15.SysUart.putch", "ti.sysbios.family.arm.a15"));
        vo.bind("ready", om.findStrict("ti.sysbios.family.arm.a15.SysUart.ready", "ti.sysbios.family.arm.a15"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a15_SysUart_Module__startupDone__E", "ti_sysbios_family_arm_a15_SysUart_abort__E", "ti_sysbios_family_arm_a15_SysUart_exit__E", "ti_sysbios_family_arm_a15_SysUart_flush__E", "ti_sysbios_family_arm_a15_SysUart_putch__E", "ti_sysbios_family_arm_a15_SysUart_ready__E"));
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
        pkgV.bind("SysUart", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("SysUart");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a15.Core", "ti.sysbios.family.arm.a15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a15.Cache", "ti.sysbios.family.arm.a15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a15.Mmu", "ti.sysbios.family.arm.a15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a15.TimerSupport", "ti.sysbios.family.arm.a15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a15.TimestampProvider", "ti.sysbios.family.arm.a15"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a15.SysUart", "ti.sysbios.family.arm.a15"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.Cache", "ti.sysbios.family.arm.a15");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Cache Info", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitCacheInfo", "structName", "CacheInfoView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.Mmu", "ti.sysbios.family.arm.a15");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Level1View", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewLevel1Page", "structName", "PageView")}), Global.newArray(new Object[]{"Level2View", Global.newObject("type", om.find("xdc.rov.ViewInfo.TREE_TABLE"), "viewInitFxn", "viewLevel2Page", "structName", "PageView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a15.Core")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a15.Cache")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a15.Mmu")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a15.TimerSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a15.TimestampProvider")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a15.SysUart")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.a15")).add(pkgV);
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
        Cache$$OBJECTS();
        Mmu$$OBJECTS();
        TimerSupport$$OBJECTS();
        TimestampProvider$$OBJECTS();
        SysUart$$OBJECTS();
        Core$$CONSTS();
        Cache$$CONSTS();
        Mmu$$CONSTS();
        TimerSupport$$CONSTS();
        TimestampProvider$$CONSTS();
        SysUart$$CONSTS();
        Core$$CREATES();
        Cache$$CREATES();
        Mmu$$CREATES();
        TimerSupport$$CREATES();
        TimestampProvider$$CREATES();
        SysUart$$CREATES();
        Core$$FUNCTIONS();
        Cache$$FUNCTIONS();
        Mmu$$FUNCTIONS();
        TimerSupport$$FUNCTIONS();
        TimestampProvider$$FUNCTIONS();
        SysUart$$FUNCTIONS();
        Core$$SIZES();
        Cache$$SIZES();
        Mmu$$SIZES();
        TimerSupport$$SIZES();
        TimestampProvider$$SIZES();
        SysUart$$SIZES();
        Core$$TYPES();
        Cache$$TYPES();
        Mmu$$TYPES();
        TimerSupport$$TYPES();
        TimestampProvider$$TYPES();
        SysUart$$TYPES();
        if (isROV) {
            Core$$ROV();
            Cache$$ROV();
            Mmu$$ROV();
            TimerSupport$$ROV();
            TimestampProvider$$ROV();
            SysUart$$ROV();
        }//isROV
        $$SINGLETONS();
        Core$$SINGLETONS();
        Cache$$SINGLETONS();
        Mmu$$SINGLETONS();
        TimerSupport$$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        SysUart$$SINGLETONS();
        $$INITIALIZATION();
    }
}
