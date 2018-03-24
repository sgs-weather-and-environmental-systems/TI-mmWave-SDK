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

public class ti_sysbios_family_arm_a8
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.a8", new Value.Obj("ti.sysbios.family.arm.a8", pkgP));
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a8.Cache", new Value.Obj("ti.sysbios.family.arm.a8.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.a8.Cache.Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.a8"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.Cache$$CacheInfoView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.Cache.CacheInfoView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.Cache$$WayInfoView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.Cache.WayInfoView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.Cache$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.Cache.Module_State", new Proto.Str(spo, false));
    }

    void Mmu$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.Mmu.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a8.Mmu", new Value.Obj("ti.sysbios.family.arm.a8.Mmu", po));
        pkgV.bind("Mmu", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.Mmu$$PageView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.Mmu.PageView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc", new Proto.Enm("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.Mmu$$FirstLevelDescAttrs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.Mmu$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.Mmu.Module_State", new Proto.Str(spo, false));
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a8.TimestampProvider", new Value.Obj("ti.sysbios.family.arm.a8.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.TimestampProvider$$Module_View", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.TimestampProvider.Module_View", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a8.TimestampProvider$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a8.TimestampProvider.Module_State", new Proto.Str(spo, false));
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("ti.sysbios.family.arm.a8.Cache.sizeL1dCacheLine", 64L);
        om.bind("ti.sysbios.family.arm.a8.Cache.sizeL1pCacheLine", 64L);
        om.bind("ti.sysbios.family.arm.a8.Cache.sizeL2CacheLine", 64L);
        om.bind("ti.sysbios.family.arm.a8.Cache.enable", new Extern("ti_sysbios_family_arm_a8_Cache_enable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.disable", new Extern("ti_sysbios_family_arm_a8_Cache_disable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.inv", new Extern("ti_sysbios_family_arm_a8_Cache_inv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.wb", new Extern("ti_sysbios_family_arm_a8_Cache_wb__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.wbInv", new Extern("ti_sysbios_family_arm_a8_Cache_wbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.wbAll", new Extern("ti_sysbios_family_arm_a8_Cache_wbAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.wbInvAll", new Extern("ti_sysbios_family_arm_a8_Cache_wbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.wait", new Extern("ti_sysbios_family_arm_a8_Cache_wait__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.getEnabled", new Extern("ti_sysbios_family_arm_a8_Cache_getEnabled__E", "xdc_Bits16(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.invL1dAll", new Extern("ti_sysbios_family_arm_a8_Cache_invL1dAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.invL1pAll", new Extern("ti_sysbios_family_arm_a8_Cache_invL1pAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.lock", new Extern("ti_sysbios_family_arm_a8_Cache_lock__E", "xdc_UInt(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.unlock", new Extern("ti_sysbios_family_arm_a8_Cache_unlock__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.enableBP", new Extern("ti_sysbios_family_arm_a8_Cache_enableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.disableBP", new Extern("ti_sysbios_family_arm_a8_Cache_disableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.startup", new Extern("ti_sysbios_family_arm_a8_Cache_startup__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.disableL1d", new Extern("ti_sysbios_family_arm_a8_Cache_disableL1d__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.disableL1p", new Extern("ti_sysbios_family_arm_a8_Cache_disableL1p__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.disableL2", new Extern("ti_sysbios_family_arm_a8_Cache_disableL2__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.enableL1d", new Extern("ti_sysbios_family_arm_a8_Cache_enableL1d__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.enableL1p", new Extern("ti_sysbios_family_arm_a8_Cache_enableL1p__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.enableL2", new Extern("ti_sysbios_family_arm_a8_Cache_enableL2__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.invL1d", new Extern("ti_sysbios_family_arm_a8_Cache_invL1d__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.invL1p", new Extern("ti_sysbios_family_arm_a8_Cache_invL1p__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.getL2AuxControlReg", new Extern("ti_sysbios_family_arm_a8_Cache_getL2AuxControlReg__I", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.setL2AuxControlReg", new Extern("ti_sysbios_family_arm_a8_Cache_setL2AuxControlReg__I", "xdc_Void(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.getLockdownReg", new Extern("ti_sysbios_family_arm_a8_Cache_getLockdownReg__I", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.setLockdownReg", new Extern("ti_sysbios_family_arm_a8_Cache_setLockdownReg__I", "xdc_Void(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.wayLoadLock", new Extern("ti_sysbios_family_arm_a8_Cache_wayLoadLock__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Cache.getCacheLevelInfo", new Extern("ti_sysbios_family_arm_a8_Cache_getCacheLevelInfo__I", "xdc_Bits32(*)(xdc_UInt)", true, false));
    }

    void Mmu$$CONSTS()
    {
        // module Mmu
        om.bind("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_FAULT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc", "ti.sysbios.family.arm.a8"), "ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_FAULT", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_PAGE_TABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc", "ti.sysbios.family.arm.a8"), "ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_PAGE_TABLE", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_SECTION", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc", "ti.sysbios.family.arm.a8"), "ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_SECTION", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_RESERVED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc", "ti.sysbios.family.arm.a8"), "ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_RESERVED", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.arm.a8.Mmu.disable", new Extern("ti_sysbios_family_arm_a8_Mmu_disable__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.enable", new Extern("ti_sysbios_family_arm_a8_Mmu_enable__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.initDescAttrs", new Extern("ti_sysbios_family_arm_a8_Mmu_initDescAttrs__E", "xdc_Void(*)(ti_sysbios_family_arm_a8_Mmu_FirstLevelDescAttrs*)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.isEnabled", new Extern("ti_sysbios_family_arm_a8_Mmu_isEnabled__E", "xdc_Bool(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.setFirstLevelDesc", new Extern("ti_sysbios_family_arm_a8_Mmu_setFirstLevelDesc__E", "xdc_Void(*)(xdc_Ptr,xdc_Ptr,ti_sysbios_family_arm_a8_Mmu_FirstLevelDescAttrs*)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.getPhysicalAddr", new Extern("ti_sysbios_family_arm_a8_Mmu_getPhysicalAddr__E", "xdc_Ptr(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.getMmuTableAddr", new Extern("ti_sysbios_family_arm_a8_Mmu_getMmuTableAddr__E", "xdc_Ptr(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.getDomainAccessCtrlReg", new Extern("ti_sysbios_family_arm_a8_Mmu_getDomainAccessCtrlReg__E", "xdc_UInt32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.setDomainAccessCtrlReg", new Extern("ti_sysbios_family_arm_a8_Mmu_setDomainAccessCtrlReg__E", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.switchContext", new Extern("ti_sysbios_family_arm_a8_Mmu_switchContext__E", "xdc_Void(*)(xdc_UInt8,xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.getAsid", new Extern("ti_sysbios_family_arm_a8_Mmu_getAsid__E", "xdc_UInt8(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.tlbInvAll", new Extern("ti_sysbios_family_arm_a8_Mmu_tlbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.init", new Extern("ti_sysbios_family_arm_a8_Mmu_init__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.enableAsm", new Extern("ti_sysbios_family_arm_a8_Mmu_enableAsm__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.disableAsm", new Extern("ti_sysbios_family_arm_a8_Mmu_disableAsm__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.initTableBuf", new Extern("ti_sysbios_family_arm_a8_Mmu_initTableBuf__I", "xdc_Void(*)(xdc_UInt32*)", true, false));
        om.bind("ti.sysbios.family.arm.a8.Mmu.getPhysicalAddrI", new Extern("ti_sysbios_family_arm_a8_Mmu_getPhysicalAddrI__I", "xdc_Ptr(*)(xdc_Ptr)", true, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
        om.bind("ti.sysbios.family.arm.a8.TimestampProvider.get32", new Extern("ti_sysbios_family_arm_a8_TimestampProvider_get32__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.TimestampProvider.get64", new Extern("ti_sysbios_family_arm_a8_TimestampProvider_get64__E", "xdc_Void(*)(xdc_runtime_Types_Timestamp64*)", true, false));
        om.bind("ti.sysbios.family.arm.a8.TimestampProvider.getFreq", new Extern("ti_sysbios_family_arm_a8_TimestampProvider_getFreq__E", "xdc_Void(*)(xdc_runtime_Types_FreqHz*)", true, false));
        om.bind("ti.sysbios.family.arm.a8.TimestampProvider.initCCNT", new Extern("ti_sysbios_family_arm_a8_TimestampProvider_initCCNT__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a8.TimestampProvider.autoRefreshFxn", new Extern("ti_sysbios_family_arm_a8_TimestampProvider_autoRefreshFxn__I", "xdc_Void(*)(xdc_UArg)", true, false));
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

    void TimestampProvider$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

    }

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Mmu$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Mmu.setFirstLevelDescMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a8.Mmu$$setFirstLevelDescMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a8.Mmu.Module", "ti.sysbios.family.arm.a8"), null, 3, 3, false));
                fxn.addArg(0, "virtualAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(1, "phyAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(2, "attrs", (Proto)om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.arm.a8"), $$DEFAULT);
    }

    void TimestampProvider$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a8.Cache.Module_State", "ti.sysbios.family.arm.a8");
        sizes.clear();
        sizes.add(Global.newArray("l1dInfo", "UInt32"));
        sizes.add(Global.newArray("l1pInfo", "UInt32"));
        sizes.add(Global.newArray("l2Info", "UInt32"));
        sizes.add(Global.newArray("l2WaySize", "USize"));
        sizes.add(Global.newArray("lockRegister", "UInt32"));
        sizes.add(Global.newArray("baseAddresses", "A8;UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a8.Cache.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a8.Cache.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a8.Cache.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Mmu$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.arm.a8");
        sizes.clear();
        sizes.add(Global.newArray("type", "Nti.sysbios.family.arm.a8.Mmu.FirstLevelDesc;;0;1;2;3"));
        sizes.add(Global.newArray("bufferable", "UShort"));
        sizes.add(Global.newArray("cacheable", "UShort"));
        sizes.add(Global.newArray("shareable", "UShort"));
        sizes.add(Global.newArray("noexecute", "UShort"));
        sizes.add(Global.newArray("imp", "UInt8"));
        sizes.add(Global.newArray("domain", "UInt8"));
        sizes.add(Global.newArray("accPerm", "UInt8"));
        sizes.add(Global.newArray("tex", "UInt8"));
        sizes.add(Global.newArray("notGlobal", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a8.Mmu.Module_State", "ti.sysbios.family.arm.a8");
        sizes.clear();
        sizes.add(Global.newArray("tableBuf", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a8.Mmu.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a8.Mmu.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a8.Mmu.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimestampProvider$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.Module_State", "ti.sysbios.family.arm.a8");
        sizes.clear();
        sizes.add(Global.newArray("upper32Bits", "UInt32"));
        sizes.add(Global.newArray("prevLoBits", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a8.TimestampProvider.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a8.TimestampProvider.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a8.TimestampProvider.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a8/Cache.xs");
        om.bind("ti.sysbios.family.arm.a8.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Cache.Module", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.Cache.Module", om.findStrict("ti.sysbios.interfaces.ICache.Module", "ti.sysbios.family.arm.a8"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("sizeL1dCacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 64L, "rh");
                po.addFld("sizeL1pCacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 64L, "rh");
                po.addFld("sizeL2CacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 64L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.a8"), $$UNDEF, "wh");
            po.addFld("A_badBlockLength", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a8"), Global.newObject("msg", "A_badBlockLength: Block length too large. Must be <= L2 way size."), "w");
            po.addFld("A_blockCrossesPage", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a8"), Global.newObject("msg", "A_blockCrossesPage: Memory block crosses L2 way page boundary."), "w");
            po.addFld("enableCache", $$T_Bool, true, "w");
            po.addFld("unlockL2Cache", $$T_Bool, true, "w");
            po.addFld("branchPredictionEnabled", $$T_Bool, true, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // struct Cache.CacheInfoView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Cache$$CacheInfoView", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.Cache.CacheInfoView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("cache", $$T_Str, $$UNDEF, "w");
                po.addFld("cacheSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("lineSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("ways", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("waySize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
        // struct Cache.WayInfoView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Cache$$WayInfoView", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.Cache.WayInfoView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("number", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("locked", $$T_Bool, $$UNDEF, "w");
                po.addFld("baseAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Cache.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Cache$$Module_State", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.Cache.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("l1dInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l1pInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l2Info", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l2WaySize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("lockRegister", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("baseAddresses", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
    }

    void Mmu$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a8/Mmu.xs");
        om.bind("ti.sysbios.family.arm.a8.Mmu$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu.Module", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.Mmu.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.arm.a8"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.a8"), $$UNDEF, "wh");
            po.addFld("A_nullPointer", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a8"), Global.newObject("msg", "A_nullPointer: Pointer is null"), "w");
            po.addFld("A_unknownDescType", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a8"), Global.newObject("msg", "A_unknownDescType: Descriptor type is not recognized"), "w");
            po.addFld("defaultAttrs", (Proto)om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.arm.a8"), Global.newObject("type", om.find("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_SECTION"), "bufferable", false, "cacheable", false, "shareable", false, "noexecute", false, "imp", 1L, "domain", 0L, "accPerm", 3L, "tex", 1L, "notGlobal", false), "w");
            po.addFld("enableMMU", $$T_Bool, true, "w");
            po.addFld("cachePlatformMemory", $$T_Bool, true, "wh");
            po.addFld("tableBuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.Mmu$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.Mmu$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.Mmu$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.Mmu$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("setFirstLevelDescMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a8.Mmu$$setFirstLevelDescMeta", "ti.sysbios.family.arm.a8"), Global.get(cap, "setFirstLevelDescMeta"));
        // struct Mmu.PageView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu$$PageView", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.Mmu.PageView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("Type", $$T_Str, $$UNDEF, "w");
                po.addFld("Tex", $$T_Str, $$UNDEF, "w");
                po.addFld("AddrVirtual", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("AddrPhysical", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("Level2TablePtr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("Bufferable", $$T_Bool, $$UNDEF, "w");
                po.addFld("Cacheable", $$T_Bool, $$UNDEF, "w");
                po.addFld("Shareable", $$T_Bool, $$UNDEF, "w");
                po.addFld("Noexecute", $$T_Bool, $$UNDEF, "w");
                po.addFld("NotGlobal", $$T_Bool, $$UNDEF, "w");
                po.addFld("L1DWritePolicy", $$T_Str, $$UNDEF, "w");
                po.addFld("IMP", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("Domain", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("Access", $$T_Str, $$UNDEF, "w");
        // struct Mmu.FirstLevelDescAttrs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu$$FirstLevelDescAttrs", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc", "ti.sysbios.family.arm.a8"), $$UNDEF, "w");
                po.addFld("bufferable", $$T_Bool, $$UNDEF, "w");
                po.addFld("cacheable", $$T_Bool, $$UNDEF, "w");
                po.addFld("shareable", $$T_Bool, $$UNDEF, "w");
                po.addFld("noexecute", $$T_Bool, $$UNDEF, "w");
                po.addFld("imp", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("domain", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("accPerm", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("tex", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("notGlobal", $$T_Bool, $$UNDEF, "w");
        // struct Mmu.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu$$Module_State", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.Mmu.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("tableBuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "w");
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a8/TimestampProvider.xs");
        om.bind("ti.sysbios.family.arm.a8.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.Module", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.TimestampProvider.Module", om.findStrict("ti.sysbios.interfaces.ITimestamp.Module", "ti.sysbios.family.arm.a8"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("autoRefreshEnable", $$T_Bool, true, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.TimestampProvider$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a8.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimestamp$$getFreqMeta", "ti.sysbios.family.arm.a8"), fxn);
        // struct TimestampProvider.Module_View
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider$$Module_View", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.TimestampProvider.Module_View", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct TimestampProvider.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider$$Module_State", "ti.sysbios.family.arm.a8");
        po.init("ti.sysbios.family.arm.a8.TimestampProvider.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("upper32Bits", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("prevLoBits", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.Cache", "ti.sysbios.family.arm.a8");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a8.Cache.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Cache$$Module_State", "ti.sysbios.family.arm.a8");
    }

    void Mmu$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu", "ti.sysbios.family.arm.a8");
        vo.bind("FirstLevelDescAttrs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu$$FirstLevelDescAttrs", "ti.sysbios.family.arm.a8");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a8.Mmu.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu$$Module_State", "ti.sysbios.family.arm.a8");
        po.bind("tableBuf$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt32", "isScalar", true));
    }

    void TimestampProvider$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider", "ti.sysbios.family.arm.a8");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a8.TimestampProvider.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider$$Module_State", "ti.sysbios.family.arm.a8");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.a8.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.a8"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a8/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.a8"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.a8"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.a8"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.a8"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.a8"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.a8"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.a8", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.a8");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.a8.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.a8'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.a8$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.a8$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.a8$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a8.aea8fnv',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a8.aa8fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a8.aa9fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a8.aea8fnv', {target: 'ti.targets.arm.elf.A8Fnv', suffix: 'ea8fnv'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a8.aa8fg', {target: 'gnu.targets.arm.A8F', suffix: 'a8fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a8.aa9fg', {target: 'gnu.targets.arm.A9F', suffix: 'a9fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.Cache", "ti.sysbios.family.arm.a8");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Cache.Module", "ti.sysbios.family.arm.a8");
        vo.init2(po, "ti.sysbios.family.arm.a8.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a8.Cache$$capsule", "ti.sysbios.family.arm.a8"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a8", "ti.sysbios.family.arm.a8"));
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
        vo.bind("Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.a8"));
        vo.bind("CacheInfoView", om.findStrict("ti.sysbios.family.arm.a8.Cache.CacheInfoView", "ti.sysbios.family.arm.a8"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.Cache.CacheInfoView", "ti.sysbios.family.arm.a8"));
        vo.bind("WayInfoView", om.findStrict("ti.sysbios.family.arm.a8.Cache.WayInfoView", "ti.sysbios.family.arm.a8"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.Cache.WayInfoView", "ti.sysbios.family.arm.a8"));
        mcfgs.add("A_badBlockLength");
        mcfgs.add("A_blockCrossesPage");
        mcfgs.add("enableCache");
        mcfgs.add("unlockL2Cache");
        mcfgs.add("branchPredictionEnabled");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a8.Cache.Module_State", "ti.sysbios.family.arm.a8"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.Cache.Module_State", "ti.sysbios.family.arm.a8"));
        vo.bind("Type_L1P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1P", "ti.sysbios.family.arm.a8"));
        vo.bind("Type_L1D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1D", "ti.sysbios.family.arm.a8"));
        vo.bind("Type_L1", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1", "ti.sysbios.family.arm.a8"));
        vo.bind("Type_L2P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2P", "ti.sysbios.family.arm.a8"));
        vo.bind("Type_L2D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2D", "ti.sysbios.family.arm.a8"));
        vo.bind("Type_L2", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2", "ti.sysbios.family.arm.a8"));
        vo.bind("Type_ALLP", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLP", "ti.sysbios.family.arm.a8"));
        vo.bind("Type_ALLD", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLD", "ti.sysbios.family.arm.a8"));
        vo.bind("Type_ALL", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALL", "ti.sysbios.family.arm.a8"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a8")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.a8.Cache.enable", "ti.sysbios.family.arm.a8"));
        vo.bind("disable", om.findStrict("ti.sysbios.family.arm.a8.Cache.disable", "ti.sysbios.family.arm.a8"));
        vo.bind("inv", om.findStrict("ti.sysbios.family.arm.a8.Cache.inv", "ti.sysbios.family.arm.a8"));
        vo.bind("wb", om.findStrict("ti.sysbios.family.arm.a8.Cache.wb", "ti.sysbios.family.arm.a8"));
        vo.bind("wbInv", om.findStrict("ti.sysbios.family.arm.a8.Cache.wbInv", "ti.sysbios.family.arm.a8"));
        vo.bind("wbAll", om.findStrict("ti.sysbios.family.arm.a8.Cache.wbAll", "ti.sysbios.family.arm.a8"));
        vo.bind("wbInvAll", om.findStrict("ti.sysbios.family.arm.a8.Cache.wbInvAll", "ti.sysbios.family.arm.a8"));
        vo.bind("wait", om.findStrict("ti.sysbios.family.arm.a8.Cache.wait", "ti.sysbios.family.arm.a8"));
        vo.bind("getEnabled", om.findStrict("ti.sysbios.family.arm.a8.Cache.getEnabled", "ti.sysbios.family.arm.a8"));
        vo.bind("invL1dAll", om.findStrict("ti.sysbios.family.arm.a8.Cache.invL1dAll", "ti.sysbios.family.arm.a8"));
        vo.bind("invL1pAll", om.findStrict("ti.sysbios.family.arm.a8.Cache.invL1pAll", "ti.sysbios.family.arm.a8"));
        vo.bind("lock", om.findStrict("ti.sysbios.family.arm.a8.Cache.lock", "ti.sysbios.family.arm.a8"));
        vo.bind("unlock", om.findStrict("ti.sysbios.family.arm.a8.Cache.unlock", "ti.sysbios.family.arm.a8"));
        vo.bind("enableBP", om.findStrict("ti.sysbios.family.arm.a8.Cache.enableBP", "ti.sysbios.family.arm.a8"));
        vo.bind("disableBP", om.findStrict("ti.sysbios.family.arm.a8.Cache.disableBP", "ti.sysbios.family.arm.a8"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.a8.Cache.startup", "ti.sysbios.family.arm.a8"));
        vo.bind("disableL1d", om.findStrict("ti.sysbios.family.arm.a8.Cache.disableL1d", "ti.sysbios.family.arm.a8"));
        vo.bind("disableL1p", om.findStrict("ti.sysbios.family.arm.a8.Cache.disableL1p", "ti.sysbios.family.arm.a8"));
        vo.bind("disableL2", om.findStrict("ti.sysbios.family.arm.a8.Cache.disableL2", "ti.sysbios.family.arm.a8"));
        vo.bind("enableL1d", om.findStrict("ti.sysbios.family.arm.a8.Cache.enableL1d", "ti.sysbios.family.arm.a8"));
        vo.bind("enableL1p", om.findStrict("ti.sysbios.family.arm.a8.Cache.enableL1p", "ti.sysbios.family.arm.a8"));
        vo.bind("enableL2", om.findStrict("ti.sysbios.family.arm.a8.Cache.enableL2", "ti.sysbios.family.arm.a8"));
        vo.bind("invL1d", om.findStrict("ti.sysbios.family.arm.a8.Cache.invL1d", "ti.sysbios.family.arm.a8"));
        vo.bind("invL1p", om.findStrict("ti.sysbios.family.arm.a8.Cache.invL1p", "ti.sysbios.family.arm.a8"));
        vo.bind("getL2AuxControlReg", om.findStrict("ti.sysbios.family.arm.a8.Cache.getL2AuxControlReg", "ti.sysbios.family.arm.a8"));
        vo.bind("setL2AuxControlReg", om.findStrict("ti.sysbios.family.arm.a8.Cache.setL2AuxControlReg", "ti.sysbios.family.arm.a8"));
        vo.bind("getLockdownReg", om.findStrict("ti.sysbios.family.arm.a8.Cache.getLockdownReg", "ti.sysbios.family.arm.a8"));
        vo.bind("setLockdownReg", om.findStrict("ti.sysbios.family.arm.a8.Cache.setLockdownReg", "ti.sysbios.family.arm.a8"));
        vo.bind("wayLoadLock", om.findStrict("ti.sysbios.family.arm.a8.Cache.wayLoadLock", "ti.sysbios.family.arm.a8"));
        vo.bind("getCacheLevelInfo", om.findStrict("ti.sysbios.family.arm.a8.Cache.getCacheLevelInfo", "ti.sysbios.family.arm.a8"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a8_Cache_Module__startupDone__E", "ti_sysbios_family_arm_a8_Cache_enable__E", "ti_sysbios_family_arm_a8_Cache_disable__E", "ti_sysbios_family_arm_a8_Cache_inv__E", "ti_sysbios_family_arm_a8_Cache_wb__E", "ti_sysbios_family_arm_a8_Cache_wbInv__E", "ti_sysbios_family_arm_a8_Cache_wbAll__E", "ti_sysbios_family_arm_a8_Cache_wbInvAll__E", "ti_sysbios_family_arm_a8_Cache_wait__E", "ti_sysbios_family_arm_a8_Cache_getEnabled__E", "ti_sysbios_family_arm_a8_Cache_invL1dAll__E", "ti_sysbios_family_arm_a8_Cache_invL1pAll__E", "ti_sysbios_family_arm_a8_Cache_lock__E", "ti_sysbios_family_arm_a8_Cache_unlock__E", "ti_sysbios_family_arm_a8_Cache_enableBP__E", "ti_sysbios_family_arm_a8_Cache_disableBP__E"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu", "ti.sysbios.family.arm.a8");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu.Module", "ti.sysbios.family.arm.a8");
        vo.init2(po, "ti.sysbios.family.arm.a8.Mmu", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a8.Mmu$$capsule", "ti.sysbios.family.arm.a8"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a8", "ti.sysbios.family.arm.a8"));
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
        vo.bind("PageView", om.findStrict("ti.sysbios.family.arm.a8.Mmu.PageView", "ti.sysbios.family.arm.a8"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.Mmu.PageView", "ti.sysbios.family.arm.a8"));
        vo.bind("FirstLevelDesc", om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc", "ti.sysbios.family.arm.a8"));
        vo.bind("FirstLevelDescAttrs", om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.arm.a8"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.arm.a8"));
        mcfgs.add("A_nullPointer");
        mcfgs.add("A_unknownDescType");
        mcfgs.add("defaultAttrs");
        mcfgs.add("enableMMU");
        icfgs.add("tableBuf");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a8.Mmu.Module_State", "ti.sysbios.family.arm.a8"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.Mmu.Module_State", "ti.sysbios.family.arm.a8"));
        vo.bind("FirstLevelDesc_FAULT", om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_FAULT", "ti.sysbios.family.arm.a8"));
        vo.bind("FirstLevelDesc_PAGE_TABLE", om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_PAGE_TABLE", "ti.sysbios.family.arm.a8"));
        vo.bind("FirstLevelDesc_SECTION", om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_SECTION", "ti.sysbios.family.arm.a8"));
        vo.bind("FirstLevelDesc_RESERVED", om.findStrict("ti.sysbios.family.arm.a8.Mmu.FirstLevelDesc_RESERVED", "ti.sysbios.family.arm.a8"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a8")).add(vo);
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
        vo.bind("disable", om.findStrict("ti.sysbios.family.arm.a8.Mmu.disable", "ti.sysbios.family.arm.a8"));
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.a8.Mmu.enable", "ti.sysbios.family.arm.a8"));
        vo.bind("initDescAttrs", om.findStrict("ti.sysbios.family.arm.a8.Mmu.initDescAttrs", "ti.sysbios.family.arm.a8"));
        vo.bind("isEnabled", om.findStrict("ti.sysbios.family.arm.a8.Mmu.isEnabled", "ti.sysbios.family.arm.a8"));
        vo.bind("setFirstLevelDesc", om.findStrict("ti.sysbios.family.arm.a8.Mmu.setFirstLevelDesc", "ti.sysbios.family.arm.a8"));
        vo.bind("getPhysicalAddr", om.findStrict("ti.sysbios.family.arm.a8.Mmu.getPhysicalAddr", "ti.sysbios.family.arm.a8"));
        vo.bind("getMmuTableAddr", om.findStrict("ti.sysbios.family.arm.a8.Mmu.getMmuTableAddr", "ti.sysbios.family.arm.a8"));
        vo.bind("getDomainAccessCtrlReg", om.findStrict("ti.sysbios.family.arm.a8.Mmu.getDomainAccessCtrlReg", "ti.sysbios.family.arm.a8"));
        vo.bind("setDomainAccessCtrlReg", om.findStrict("ti.sysbios.family.arm.a8.Mmu.setDomainAccessCtrlReg", "ti.sysbios.family.arm.a8"));
        vo.bind("switchContext", om.findStrict("ti.sysbios.family.arm.a8.Mmu.switchContext", "ti.sysbios.family.arm.a8"));
        vo.bind("getAsid", om.findStrict("ti.sysbios.family.arm.a8.Mmu.getAsid", "ti.sysbios.family.arm.a8"));
        vo.bind("tlbInvAll", om.findStrict("ti.sysbios.family.arm.a8.Mmu.tlbInvAll", "ti.sysbios.family.arm.a8"));
        vo.bind("init", om.findStrict("ti.sysbios.family.arm.a8.Mmu.init", "ti.sysbios.family.arm.a8"));
        vo.bind("enableAsm", om.findStrict("ti.sysbios.family.arm.a8.Mmu.enableAsm", "ti.sysbios.family.arm.a8"));
        vo.bind("disableAsm", om.findStrict("ti.sysbios.family.arm.a8.Mmu.disableAsm", "ti.sysbios.family.arm.a8"));
        vo.bind("initTableBuf", om.findStrict("ti.sysbios.family.arm.a8.Mmu.initTableBuf", "ti.sysbios.family.arm.a8"));
        vo.bind("getPhysicalAddrI", om.findStrict("ti.sysbios.family.arm.a8.Mmu.getPhysicalAddrI", "ti.sysbios.family.arm.a8"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a8_Mmu_Module__startupDone__E", "ti_sysbios_family_arm_a8_Mmu_disable__E", "ti_sysbios_family_arm_a8_Mmu_enable__E", "ti_sysbios_family_arm_a8_Mmu_initDescAttrs__E", "ti_sysbios_family_arm_a8_Mmu_isEnabled__E", "ti_sysbios_family_arm_a8_Mmu_setFirstLevelDesc__E", "ti_sysbios_family_arm_a8_Mmu_getPhysicalAddr__E", "ti_sysbios_family_arm_a8_Mmu_getMmuTableAddr__E", "ti_sysbios_family_arm_a8_Mmu_getDomainAccessCtrlReg__E", "ti_sysbios_family_arm_a8_Mmu_setDomainAccessCtrlReg__E", "ti_sysbios_family_arm_a8_Mmu_switchContext__E", "ti_sysbios_family_arm_a8_Mmu_getAsid__E", "ti_sysbios_family_arm_a8_Mmu_tlbInvAll__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_nullPointer", "A_unknownDescType"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.setElem("", "./Mmu.xdt");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 1);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        vo.bind("TEMPLATE$", "./Mmu.xdt");
        pkgV.bind("Mmu", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Mmu");
    }

    void TimestampProvider$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider", "ti.sysbios.family.arm.a8");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.Module", "ti.sysbios.family.arm.a8");
        vo.init2(po, "ti.sysbios.family.arm.a8.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider$$capsule", "ti.sysbios.family.arm.a8"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a8", "ti.sysbios.family.arm.a8"));
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
        vo.bind("Module_View", om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.Module_View", "ti.sysbios.family.arm.a8"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.Module_View", "ti.sysbios.family.arm.a8"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.Module_State", "ti.sysbios.family.arm.a8"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.Module_State", "ti.sysbios.family.arm.a8"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a8")).add(vo);
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
        vo.bind("get32", om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.get32", "ti.sysbios.family.arm.a8"));
        vo.bind("get64", om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.get64", "ti.sysbios.family.arm.a8"));
        vo.bind("getFreq", om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.getFreq", "ti.sysbios.family.arm.a8"));
        vo.bind("initCCNT", om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.initCCNT", "ti.sysbios.family.arm.a8"));
        vo.bind("autoRefreshFxn", om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider.autoRefreshFxn", "ti.sysbios.family.arm.a8"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a8_TimestampProvider_Module__startupDone__E", "ti_sysbios_family_arm_a8_TimestampProvider_get32__E", "ti_sysbios_family_arm_a8_TimestampProvider_get64__E", "ti_sysbios_family_arm_a8_TimestampProvider_getFreq__E"));
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
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a8.Cache", "ti.sysbios.family.arm.a8"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a8.Mmu", "ti.sysbios.family.arm.a8"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a8.TimestampProvider", "ti.sysbios.family.arm.a8"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.Cache", "ti.sysbios.family.arm.a8");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Cache Info", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitCacheInfo", "structName", "CacheInfoView")}), Global.newArray(new Object[]{"L2 Way Info", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitWays", "structName", "WayInfoView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a8.Mmu", "ti.sysbios.family.arm.a8");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"0x0-0x7FFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages1", "structName", "PageView")}), Global.newArray(new Object[]{"0x80000000-0x9FFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages2", "structName", "PageView")}), Global.newArray(new Object[]{"0xA0000000-0xBFFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages3", "structName", "PageView")}), Global.newArray(new Object[]{"0xC0000000-0xDFFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages4", "structName", "PageView")}), Global.newArray(new Object[]{"0xE0000000-0xFFFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages5", "structName", "PageView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a8.Cache")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a8.Mmu")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a8.TimestampProvider")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.a8")).add(pkgV);
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
        Mmu$$OBJECTS();
        TimestampProvider$$OBJECTS();
        Cache$$CONSTS();
        Mmu$$CONSTS();
        TimestampProvider$$CONSTS();
        Cache$$CREATES();
        Mmu$$CREATES();
        TimestampProvider$$CREATES();
        Cache$$FUNCTIONS();
        Mmu$$FUNCTIONS();
        TimestampProvider$$FUNCTIONS();
        Cache$$SIZES();
        Mmu$$SIZES();
        TimestampProvider$$SIZES();
        Cache$$TYPES();
        Mmu$$TYPES();
        TimestampProvider$$TYPES();
        if (isROV) {
            Cache$$ROV();
            Mmu$$ROV();
            TimestampProvider$$ROV();
        }//isROV
        $$SINGLETONS();
        Cache$$SINGLETONS();
        Mmu$$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        $$INITIALIZATION();
    }
}
