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

public class ti_sysbios_family_arm_a15_smp
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
        Global.callFxn("loadPackage", xdcO, "ti.sysbios.family.arm.v7a.smp");
    }

    void $$OBJECTS()
    {
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.smp.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.a15.smp", new Value.Obj("ti.sysbios.family.arm.a15.smp", pkgP));
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.smp.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a15.smp.Cache", new Value.Obj("ti.sysbios.family.arm.a15.smp.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.a15.smp"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.smp.Cache$$CacheInfoView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.CacheInfoView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.smp.Cache$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.Module_State", new Proto.Str(spo, false));
    }

    void Core$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.smp.Core.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a15.smp.Core", new Value.Obj("ti.sysbios.family.arm.a15.smp.Core", po));
        pkgV.bind("Core", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.smp.Core$$IpcMsg", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.smp.Core.IpcMsg", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a15.smp.Core$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a15.smp.Core.Module_State", new Proto.Str(spo, false));
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.sizeL1dCacheLine", 64L);
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.sizeL1pCacheLine", 64L);
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.sizeL2CacheLine", 64L);
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.inv", new Extern("ti_sysbios_family_arm_a15_smp_Cache_inv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.wb", new Extern("ti_sysbios_family_arm_a15_smp_Cache_wb__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.wbInv", new Extern("ti_sysbios_family_arm_a15_smp_Cache_wbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.wait", new Extern("ti_sysbios_family_arm_a15_smp_Cache_wait__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.enable", new Extern("ti_sysbios_family_arm_a15_smp_Cache_enable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.disable", new Extern("ti_sysbios_family_arm_a15_smp_Cache_disable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.getEnabled", new Extern("ti_sysbios_family_arm_a15_smp_Cache_getEnabled__E", "xdc_Bits16(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.invL1pAll", new Extern("ti_sysbios_family_arm_a15_smp_Cache_invL1pAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.invBPAll", new Extern("ti_sysbios_family_arm_a15_smp_Cache_invBPAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.preLoad", new Extern("ti_sysbios_family_arm_a15_smp_Cache_preLoad__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.enableBP", new Extern("ti_sysbios_family_arm_a15_smp_Cache_enableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.disableBP", new Extern("ti_sysbios_family_arm_a15_smp_Cache_disableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.wbAll", new Extern("ti_sysbios_family_arm_a15_smp_Cache_wbAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.wbInvAll", new Extern("ti_sysbios_family_arm_a15_smp_Cache_wbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.wbAllLoUIS", new Extern("ti_sysbios_family_arm_a15_smp_Cache_wbAllLoUIS__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.wbInvAllLoUIS", new Extern("ti_sysbios_family_arm_a15_smp_Cache_wbInvAllLoUIS__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.startup", new Extern("ti_sysbios_family_arm_a15_smp_Cache_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.initModuleState", new Extern("ti_sysbios_family_arm_a15_smp_Cache_initModuleState__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.disableL1D", new Extern("ti_sysbios_family_arm_a15_smp_Cache_disableL1D__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.disableL1P", new Extern("ti_sysbios_family_arm_a15_smp_Cache_disableL1P__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.enableL1D", new Extern("ti_sysbios_family_arm_a15_smp_Cache_enableL1D__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.enableL1P", new Extern("ti_sysbios_family_arm_a15_smp_Cache_enableL1P__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.invL1d", new Extern("ti_sysbios_family_arm_a15_smp_Cache_invL1d__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.invL1p", new Extern("ti_sysbios_family_arm_a15_smp_Cache_invL1p__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.preFetch", new Extern("ti_sysbios_family_arm_a15_smp_Cache_preFetch__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.getCacheLevelInfo", new Extern("ti_sysbios_family_arm_a15_smp_Cache_getCacheLevelInfo__I", "xdc_Bits32(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.getL2AuxControlReg", new Extern("ti_sysbios_family_arm_a15_smp_Cache_getL2AuxControlReg__I", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Cache.setL2AuxControlReg", new Extern("ti_sysbios_family_arm_a15_smp_Cache_setL2AuxControlReg__I", "xdc_Void(*)(xdc_Bits32)", true, false));
    }

    void Core$$CONSTS()
    {
        // module Core
        om.bind("ti.sysbios.family.arm.a15.smp.Core.getId", new Extern("ti_sysbios_family_arm_a15_smp_Core_getId__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.interruptCore", new Extern("ti_sysbios_family_arm_a15_smp_Core_interruptCore__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.lock", new Extern("ti_sysbios_family_arm_a15_smp_Core_lock__E", "xdc_IArg(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.unlock", new Extern("ti_sysbios_family_arm_a15_smp_Core_unlock__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.getRevisionNumber", new Extern("ti_sysbios_family_arm_a15_smp_Core_getRevisionNumber__E", "xdc_UInt8(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.notifySpinLock", new Extern("ti_sysbios_family_arm_a15_smp_Core_notifySpinLock__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.notifySpinUnlock", new Extern("ti_sysbios_family_arm_a15_smp_Core_notifySpinUnlock__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.notify", new Extern("ti_sysbios_family_arm_a15_smp_Core_notify__E", "xdc_Void(*)(xdc_Void(*)(xdc_UArg),xdc_UArg,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.enableActlrSmp", new Extern("ti_sysbios_family_arm_a15_smp_Core_enableActlrSmp__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.resetOMAP5xxx", new Extern("ti_sysbios_family_arm_a15_smp_Core_resetOMAP5xxx__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.resetKeystone2", new Extern("ti_sysbios_family_arm_a15_smp_Core_resetKeystone2__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.startCoreXOMAP5xxx", new Extern("ti_sysbios_family_arm_a15_smp_Core_startCoreXOMAP5xxx__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.startCoreXKeystone2", new Extern("ti_sysbios_family_arm_a15_smp_Core_startCoreXKeystone2__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.exit", new Extern("ti_sysbios_family_arm_a15_smp_Core_exit__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.hwiFunc", new Extern("ti_sysbios_family_arm_a15_smp_Core_hwiFunc__I", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.skernelCmd", new Extern("ti_sysbios_family_arm_a15_smp_Core_skernelCmd__I", "xdc_Void(*)(xdc_UInt32,xdc_UInt32,xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.smpBoot", new Extern("ti_sysbios_family_arm_a15_smp_Core_smpBoot__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.startup", new Extern("ti_sysbios_family_arm_a15_smp_Core_startup__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a15.smp.Core.atexit", new Extern("ti_sysbios_family_arm_a15_smp_Core_atexit__I", "xdc_Void(*)(xdc_Int)", true, false));
    }

    void Cache$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Core$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Core$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.Module_State", "ti.sysbios.family.arm.a15.smp");
        sizes.clear();
        sizes.add(Global.newArray("l1dInfo", "UInt32"));
        sizes.add(Global.newArray("l1pInfo", "UInt32"));
        sizes.add(Global.newArray("l2Info", "UInt32"));
        sizes.add(Global.newArray("l2WaySize", "USize"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a15.smp.Cache.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a15.smp.Cache.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a15.smp.Cache.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Core$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a15.smp.Core.IpcMsg", "ti.sysbios.family.arm.a15.smp");
        sizes.clear();
        sizes.add(Global.newArray("func", "UFxn"));
        sizes.add(Global.newArray("arg", "UIArg"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a15.smp.Core.IpcMsg']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a15.smp.Core.IpcMsg']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a15.smp.Core.IpcMsg'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a15.smp.Core.Module_State", "ti.sysbios.family.arm.a15.smp");
        sizes.clear();
        sizes.add(Global.newArray("gateEntered", "UPtr"));
        sizes.add(Global.newArray("schedulerInts", "UPtr"));
        sizes.add(Global.newArray("syncCores", "UPtr"));
        sizes.add(Global.newArray("ipcMsg", "UPtr"));
        sizes.add(Global.newArray("notifyLock", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a15.smp.Core.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a15.smp.Core.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a15.smp.Core.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a15/smp/Cache.xs");
        om.bind("ti.sysbios.family.arm.a15.smp.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.Module", "ti.sysbios.family.arm.a15.smp");
        po.init("ti.sysbios.family.arm.a15.smp.Cache.Module", om.findStrict("ti.sysbios.interfaces.ICache.Module", "ti.sysbios.family.arm.a15.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("sizeL1dCacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 64L, "rh");
                po.addFld("sizeL1pCacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 64L, "rh");
                po.addFld("sizeL2CacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 64L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.a15.smp"), $$UNDEF, "wh");
            po.addFld("A_badBlockLength", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a15.smp"), Global.newObject("msg", "A_badBlockLength: Block length too large. Must be <= L2 way size."), "w");
            po.addFld("A_blockCrossesPage", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a15.smp"), Global.newObject("msg", "A_blockCrossesPage: Memory block crosses L2 way page boundary."), "w");
            po.addFld("A_cacheDisableUnsupported", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a15.smp"), Global.newObject("msg", "A_cacheDisableUnsupported: Disabling the L1 data or L2 unified cache from user code is not supported. Cache disable/enable is internally managed by the kernel."), "w");
            po.addFld("A_cacheEnableUnsupported", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a15.smp"), Global.newObject("msg", "A_cacheEnableUnsupported: Enabling the L1 data or L2 unified cache from user code is not supported. Cache disable/enable is internally managed by the kernel."), "w");
            po.addFld("enableCache", $$T_Bool, true, "w");
            po.addFld("branchPredictionEnabled", $$T_Bool, true, "w");
            po.addFld("errata798870", $$T_Bool, false, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.smp.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.smp.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.smp.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.smp.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Cache.CacheInfoView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache$$CacheInfoView", "ti.sysbios.family.arm.a15.smp");
        po.init("ti.sysbios.family.arm.a15.smp.Cache.CacheInfoView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("cache", $$T_Str, $$UNDEF, "w");
                po.addFld("cacheSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("lineSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("ways", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("waySize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
        // struct Cache.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache$$Module_State", "ti.sysbios.family.arm.a15.smp");
        po.init("ti.sysbios.family.arm.a15.smp.Cache.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("l1dInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l1pInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l2Info", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l2WaySize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
    }

    void Core$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a15/smp/Core.xs");
        om.bind("ti.sysbios.family.arm.a15.smp.Core$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Core.Module", "ti.sysbios.family.arm.a15.smp");
        po.init("ti.sysbios.family.arm.a15.smp.Core.Module", om.findStrict("ti.sysbios.interfaces.ICore.Module", "ti.sysbios.family.arm.a15.smp"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("CPUMASK", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("initBootRegs", $$T_Bool, false, "w");
            po.addFld("useSkernelCmd", $$T_Bool, true, "w");
            po.addFld("resetSection", $$T_Str, null, "w");
            po.addFld("gate", (Proto)om.findStrict("ti.sysbios.family.arm.v7a.smp.GateSmp.Handle", "ti.sysbios.family.arm.a15.smp"), $$UNDEF, "w");
            po.addFld("bootMagicBase", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
            po.addFld("initStackFlag", $$T_Bool, true, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.smp.Core$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.smp.Core$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.smp.Core$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a15.smp.Core$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // typedef Core.IpcFuncPtr
        om.bind("ti.sysbios.family.arm.a15.smp.Core.IpcFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"));
        // struct Core.IpcMsg
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Core$$IpcMsg", "ti.sysbios.family.arm.a15.smp");
        po.init("ti.sysbios.family.arm.a15.smp.Core.IpcMsg", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("func", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
        // struct Core.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Core$$Module_State", "ti.sysbios.family.arm.a15.smp");
        po.init("ti.sysbios.family.arm.a15.smp.Core.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("gateEntered", new Proto.Arr($$T_Bool, false), $$DEFAULT, "w");
                po.addFld("schedulerInts", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt)"), false), $$DEFAULT, "w");
                po.addFld("syncCores", new Proto.Arr(new Proto.Arr($$T_Bool, false), false), $$DEFAULT, "w");
                po.addFld("ipcMsg", new Proto.Arr((Proto)om.findStrict("ti.sysbios.family.arm.a15.smp.Core.IpcMsg", "ti.sysbios.family.arm.a15.smp"), false), $$DEFAULT, "w");
                po.addFld("notifyLock", $$T_Bool, $$UNDEF, "w");
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache", "ti.sysbios.family.arm.a15.smp");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a15.smp.Cache.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache$$Module_State", "ti.sysbios.family.arm.a15.smp");
    }

    void Core$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Core", "ti.sysbios.family.arm.a15.smp");
        vo.bind("IpcMsg$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a15.smp.Core.IpcMsg", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Core$$IpcMsg", "ti.sysbios.family.arm.a15.smp");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a15.smp.Core.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Core$$Module_State", "ti.sysbios.family.arm.a15.smp");
        po.bind("gateEntered$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_Bool", "isScalar", true));
        po.bind("schedulerInts$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt", "isScalar", true));
        po.bind("ipcMsg$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a15.smp.Core.IpcMsg", "isScalar", false));
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.a15.smp.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.a15.smp"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a15/smp/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.a15.smp"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.a15.smp"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.a15.smp"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.a15.smp"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.a15.smp"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.a15.smp"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.a15.smp", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.a15.smp");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.a15.smp.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.a15.smp'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.a15.smp$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.a15.smp$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.a15.smp$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a15.smp.aa15fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a15.smp.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache", "ti.sysbios.family.arm.a15.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.Module", "ti.sysbios.family.arm.a15.smp");
        vo.init2(po, "ti.sysbios.family.arm.a15.smp.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache$$capsule", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a15.smp", "ti.sysbios.family.arm.a15.smp"));
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
        vo.bind("Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("CacheInfoView", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.CacheInfoView", "ti.sysbios.family.arm.a15.smp"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.CacheInfoView", "ti.sysbios.family.arm.a15.smp"));
        mcfgs.add("A_badBlockLength");
        mcfgs.add("A_blockCrossesPage");
        mcfgs.add("A_cacheDisableUnsupported");
        mcfgs.add("A_cacheEnableUnsupported");
        mcfgs.add("enableCache");
        mcfgs.add("branchPredictionEnabled");
        mcfgs.add("errata798870");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.Module_State", "ti.sysbios.family.arm.a15.smp"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.Module_State", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("Type_L1P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1P", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("Type_L1D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1D", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("Type_L1", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("Type_L2P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2P", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("Type_L2D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2D", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("Type_L2", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("Type_ALLP", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLP", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("Type_ALLD", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLD", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("Type_ALL", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALL", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a15.smp")).add(vo);
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
        vo.bind("inv", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.inv", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("wb", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.wb", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("wbInv", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.wbInv", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("wait", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.wait", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.enable", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("disable", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.disable", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("getEnabled", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.getEnabled", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("invL1pAll", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.invL1pAll", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("invBPAll", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.invBPAll", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("preLoad", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.preLoad", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("enableBP", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.enableBP", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("disableBP", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.disableBP", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("wbAll", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.wbAll", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("wbInvAll", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.wbInvAll", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("wbAllLoUIS", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.wbAllLoUIS", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("wbInvAllLoUIS", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.wbInvAllLoUIS", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.startup", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("initModuleState", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.initModuleState", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("disableL1D", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.disableL1D", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("disableL1P", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.disableL1P", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("enableL1D", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.enableL1D", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("enableL1P", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.enableL1P", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("invL1d", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.invL1d", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("invL1p", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.invL1p", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("preFetch", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.preFetch", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("getCacheLevelInfo", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.getCacheLevelInfo", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("getL2AuxControlReg", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.getL2AuxControlReg", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("setL2AuxControlReg", om.findStrict("ti.sysbios.family.arm.a15.smp.Cache.setL2AuxControlReg", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a15_smp_Cache_Module__startupDone__E", "ti_sysbios_family_arm_a15_smp_Cache_inv__E", "ti_sysbios_family_arm_a15_smp_Cache_wb__E", "ti_sysbios_family_arm_a15_smp_Cache_wbInv__E", "ti_sysbios_family_arm_a15_smp_Cache_wait__E", "ti_sysbios_family_arm_a15_smp_Cache_enable__E", "ti_sysbios_family_arm_a15_smp_Cache_disable__E", "ti_sysbios_family_arm_a15_smp_Cache_getEnabled__E", "ti_sysbios_family_arm_a15_smp_Cache_invL1pAll__E", "ti_sysbios_family_arm_a15_smp_Cache_invBPAll__E", "ti_sysbios_family_arm_a15_smp_Cache_preLoad__E", "ti_sysbios_family_arm_a15_smp_Cache_enableBP__E", "ti_sysbios_family_arm_a15_smp_Cache_disableBP__E", "ti_sysbios_family_arm_a15_smp_Cache_wbAll__E", "ti_sysbios_family_arm_a15_smp_Cache_wbInvAll__E", "ti_sysbios_family_arm_a15_smp_Cache_wbAllLoUIS__E", "ti_sysbios_family_arm_a15_smp_Cache_wbInvAllLoUIS__E", "ti_sysbios_family_arm_a15_smp_Cache_startup__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_badBlockLength", "A_blockCrossesPage", "A_cacheDisableUnsupported", "A_cacheEnableUnsupported"));
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

    void Core$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Core", "ti.sysbios.family.arm.a15.smp");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Core.Module", "ti.sysbios.family.arm.a15.smp");
        vo.init2(po, "ti.sysbios.family.arm.a15.smp.Core", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a15.smp.Core$$capsule", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a15.smp", "ti.sysbios.family.arm.a15.smp"));
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
        mcfgs.add("CPUMASK");
        mcfgs.add("initBootRegs");
        mcfgs.add("useSkernelCmd");
        mcfgs.add("resetSection");
        vo.bind("IpcFuncPtr", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.IpcFuncPtr", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("IpcMsg", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.IpcMsg", "ti.sysbios.family.arm.a15.smp"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.smp.Core.IpcMsg", "ti.sysbios.family.arm.a15.smp"));
        mcfgs.add("gate");
        icfgs.add("gate");
        mcfgs.add("bootMagicBase");
        icfgs.add("bootMagicBase");
        mcfgs.add("initStackFlag");
        icfgs.add("initStackFlag");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.Module_State", "ti.sysbios.family.arm.a15.smp"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a15.smp.Core.Module_State", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a15.smp")).add(vo);
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
        vo.bind("getId", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.getId", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("interruptCore", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.interruptCore", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("lock", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.lock", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("unlock", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.unlock", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("getRevisionNumber", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.getRevisionNumber", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("notifySpinLock", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.notifySpinLock", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("notifySpinUnlock", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.notifySpinUnlock", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("notify", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.notify", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("enableActlrSmp", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.enableActlrSmp", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("resetOMAP5xxx", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.resetOMAP5xxx", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("resetKeystone2", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.resetKeystone2", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("startCoreXOMAP5xxx", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.startCoreXOMAP5xxx", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("startCoreXKeystone2", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.startCoreXKeystone2", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("exit", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.exit", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("hwiFunc", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.hwiFunc", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("skernelCmd", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.skernelCmd", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("smpBoot", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.smpBoot", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.startup", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("atexit", om.findStrict("ti.sysbios.family.arm.a15.smp.Core.atexit", "ti.sysbios.family.arm.a15.smp"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a15_smp_Core_Module__startupDone__E", "ti_sysbios_family_arm_a15_smp_Core_getId__E", "ti_sysbios_family_arm_a15_smp_Core_interruptCore__E", "ti_sysbios_family_arm_a15_smp_Core_lock__E", "ti_sysbios_family_arm_a15_smp_Core_unlock__E", "ti_sysbios_family_arm_a15_smp_Core_hwiDisable__E", "ti_sysbios_family_arm_a15_smp_Core_hwiEnable__E", "ti_sysbios_family_arm_a15_smp_Core_hwiRestore__E", "ti_sysbios_family_arm_a15_smp_Core_getRevisionNumber__E", "ti_sysbios_family_arm_a15_smp_Core_notifySpinLock__E", "ti_sysbios_family_arm_a15_smp_Core_notifySpinUnlock__E", "ti_sysbios_family_arm_a15_smp_Core_notify__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", "./Core.xdt");
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Core.xdt");
        pkgV.bind("Core", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Core");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache", "ti.sysbios.family.arm.a15.smp"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a15.smp.Core", "ti.sysbios.family.arm.a15.smp"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a15.smp.Cache", "ti.sysbios.family.arm.a15.smp");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Cache Info", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitCacheInfo", "structName", "CacheInfoView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a15.smp.Cache")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a15.smp.Core")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.a15.smp")).add(pkgV);
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
        Cache$$OBJECTS();
        Core$$OBJECTS();
        Cache$$CONSTS();
        Core$$CONSTS();
        Cache$$CREATES();
        Core$$CREATES();
        Cache$$FUNCTIONS();
        Core$$FUNCTIONS();
        Cache$$SIZES();
        Core$$SIZES();
        Cache$$TYPES();
        Core$$TYPES();
        if (isROV) {
            Cache$$ROV();
            Core$$ROV();
        }//isROV
        $$SINGLETONS();
        Cache$$SINGLETONS();
        Core$$SINGLETONS();
        $$INITIALIZATION();
    }
}
