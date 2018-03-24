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

public class ti_sysbios_family_arm_a9
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.arm.a9", new Value.Obj("ti.sysbios.family.arm.a9", pkgP));
    }

    void Cache$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Cache.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a9.Cache", new Value.Obj("ti.sysbios.family.arm.a9.Cache", po));
        pkgV.bind("Cache", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.a9.Cache.Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.a9"));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2CounterIntType", new Proto.Enm("ti.sysbios.family.arm.a9.Cache.L2CounterIntType"));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource", new Proto.Enm("ti.sysbios.family.arm.a9.Cache.L2EventSource"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Cache$$CacheInfoView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Cache.CacheInfoView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Cache$$WayInfoView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Cache.WayInfoView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Cache$$ErrorStatusView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Cache.ErrorStatusView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Cache$$L2ControllerRegs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Cache.L2ControllerRegs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Cache$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Cache.Module_State", new Proto.Str(spo, false));
    }

    void Mmu$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Mmu.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a9.Mmu", new Value.Obj("ti.sysbios.family.arm.a9.Mmu", po));
        pkgV.bind("Mmu", vo);
        // decls 
    }

    void Timer$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Timer.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a9.Timer", new Value.Obj("ti.sysbios.family.arm.a9.Timer", po));
        pkgV.bind("Timer", vo);
        // decls 
        om.bind("ti.sysbios.family.arm.a9.Timer.StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.a9"));
        om.bind("ti.sysbios.family.arm.a9.Timer.RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.a9"));
        om.bind("ti.sysbios.family.arm.a9.Timer.Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.a9"));
        om.bind("ti.sysbios.family.arm.a9.Timer.PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.a9"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Timer$$BasicView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Timer.BasicView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Timer$$DeviceView", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Timer.DeviceView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Timer$$DeviceRegs", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Timer.DeviceRegs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Timer$$Instance_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Timer.Instance_State", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Timer$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Timer.Module_State", new Proto.Str(spo, false));
        // insts 
        Object insP = om.bind("ti.sysbios.family.arm.a9.Timer.Instance", new Proto.Obj());
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Timer$$Object", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Timer.Object", new Proto.Str(po, false));
        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.Timer$$Params", new Proto.Obj());
        om.bind("ti.sysbios.family.arm.a9.Timer.Params", new Proto.Str(po, false));
        om.bind("ti.sysbios.family.arm.a9.Timer.Handle", insP);
        if (isROV) {
            om.bind("ti.sysbios.family.arm.a9.Timer.Object", om.findStrict("ti.sysbios.family.arm.a9.Timer.Instance_State", "ti.sysbios.family.arm.a9"));
        }//isROV
    }

    void TimerSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.TimerSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a9.TimerSupport", new Value.Obj("ti.sysbios.family.arm.a9.TimerSupport", po));
        pkgV.bind("TimerSupport", vo);
        // decls 
    }

    void TimestampProvider$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.arm.a9.TimestampProvider.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.arm.a9.TimestampProvider", new Value.Obj("ti.sysbios.family.arm.a9.TimestampProvider", po));
        pkgV.bind("TimestampProvider", vo);
        // decls 
    }

    void Cache$$CONSTS()
    {
        // module Cache
        om.bind("ti.sysbios.family.arm.a9.Cache.L2CounterIntType_DISABLED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2CounterIntType", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2CounterIntType_DISABLED", 0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2CounterIntType_INCREMENT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2CounterIntType", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2CounterIntType_INCREMENT", 1));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2CounterIntType_OVERFLOW", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2CounterIntType", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2CounterIntType_OVERFLOW", 2));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_DISABLED", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_DISABLED", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_CO", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_CO", xdc.services.intern.xsr.Enum.intValue(4L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_DRHIT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_DRHIT", xdc.services.intern.xsr.Enum.intValue(8L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_DRREQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_DRREQ", xdc.services.intern.xsr.Enum.intValue(12L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_DWHIT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_DWHIT", xdc.services.intern.xsr.Enum.intValue(16L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_DWREQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_DWREQ", xdc.services.intern.xsr.Enum.intValue(20L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_DWTREQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_DWTREQ", xdc.services.intern.xsr.Enum.intValue(24L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_IRHIT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_IRHIT", xdc.services.intern.xsr.Enum.intValue(28L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_IRREQ", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_IRREQ", xdc.services.intern.xsr.Enum.intValue(32L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_WA", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_WA", xdc.services.intern.xsr.Enum.intValue(36L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_IPFALLOC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_IPFALLOC", xdc.services.intern.xsr.Enum.intValue(40L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_EPFHIT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_EPFHIT", xdc.services.intern.xsr.Enum.intValue(44L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_EPFALLOC", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_EPFALLOC", xdc.services.intern.xsr.Enum.intValue(48L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_SRRCVD", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_SRRCVD", xdc.services.intern.xsr.Enum.intValue(52L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_SRCONF", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_SRCONF", xdc.services.intern.xsr.Enum.intValue(56L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.L2EventSource_EPFRCVD", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"), "ti.sysbios.family.arm.a9.Cache.L2EventSource_EPFRCVD", xdc.services.intern.xsr.Enum.intValue(60L)+0));
        om.bind("ti.sysbios.family.arm.a9.Cache.sizeL1dCacheLine", 32L);
        om.bind("ti.sysbios.family.arm.a9.Cache.sizeL1pCacheLine", 32L);
        om.bind("ti.sysbios.family.arm.a9.Cache.sizeL2CacheLine", 32L);
        om.bind("ti.sysbios.family.arm.a9.Cache.l2ControllerRegs", new Extern("ti_sysbios_family_arm_a9_Cache_l2ControllerRegs", "ti_sysbios_family_arm_a9_Cache_L2ControllerRegs*", false, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.enable", new Extern("ti_sysbios_family_arm_a9_Cache_enable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.inv", new Extern("ti_sysbios_family_arm_a9_Cache_inv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbAll", new Extern("ti_sysbios_family_arm_a9_Cache_wbAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbInvAll", new Extern("ti_sysbios_family_arm_a9_Cache_wbInvAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.getEnabled", new Extern("ti_sysbios_family_arm_a9_Cache_getEnabled__E", "xdc_Bits16(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wait", new Extern("ti_sysbios_family_arm_a9_Cache_wait__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.disable", new Extern("ti_sysbios_family_arm_a9_Cache_disable__E", "xdc_Void(*)(xdc_Bits16)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wb", new Extern("ti_sysbios_family_arm_a9_Cache_wb__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbInv", new Extern("ti_sysbios_family_arm_a9_Cache_wbInv__E", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bits16,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.invL1dAll", new Extern("ti_sysbios_family_arm_a9_Cache_invL1dAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.invL1pAll", new Extern("ti_sysbios_family_arm_a9_Cache_invL1pAll__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.invL2All", new Extern("ti_sysbios_family_arm_a9_Cache_invL2All__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.lock", new Extern("ti_sysbios_family_arm_a9_Cache_lock__E", "xdc_UInt(*)(xdc_Ptr,xdc_SizeT)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.unlock", new Extern("ti_sysbios_family_arm_a9_Cache_unlock__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.enableBP", new Extern("ti_sysbios_family_arm_a9_Cache_enableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.disableBP", new Extern("ti_sysbios_family_arm_a9_Cache_disableBP__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.enableL2EventCounters", new Extern("ti_sysbios_family_arm_a9_Cache_enableL2EventCounters__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.disableL2EventCounters", new Extern("ti_sysbios_family_arm_a9_Cache_disableL2EventCounters__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.resetL2EventCounter", new Extern("ti_sysbios_family_arm_a9_Cache_resetL2EventCounter__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.configureL2EventCounter", new Extern("ti_sysbios_family_arm_a9_Cache_configureL2EventCounter__E", "xdc_Void(*)(xdc_UInt,ti_sysbios_family_arm_a9_Cache_L2EventSource,ti_sysbios_family_arm_a9_Cache_L2CounterIntType)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.getL2EventCount", new Extern("ti_sysbios_family_arm_a9_Cache_getL2EventCount__E", "xdc_UInt32(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.enableL1Prefetch", new Extern("ti_sysbios_family_arm_a9_Cache_enableL1Prefetch__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.disableL1Prefetch", new Extern("ti_sysbios_family_arm_a9_Cache_disableL1Prefetch__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.getL2AuxControlReg", new Extern("ti_sysbios_family_arm_a9_Cache_getL2AuxControlReg__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.setL2AuxControlReg", new Extern("ti_sysbios_family_arm_a9_Cache_setL2AuxControlReg__E", "xdc_Void(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.getL2PrefetchControl", new Extern("ti_sysbios_family_arm_a9_Cache_getL2PrefetchControl__E", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.setL2PrefetchControl", new Extern("ti_sysbios_family_arm_a9_Cache_setL2PrefetchControl__E", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.startup", new Extern("ti_sysbios_family_arm_a9_Cache_startup__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.disableL1d", new Extern("ti_sysbios_family_arm_a9_Cache_disableL1d__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.disableL1p", new Extern("ti_sysbios_family_arm_a9_Cache_disableL1p__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.disableL2", new Extern("ti_sysbios_family_arm_a9_Cache_disableL2__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.disableWbInvL2", new Extern("ti_sysbios_family_arm_a9_Cache_disableWbInvL2__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.enableL1d", new Extern("ti_sysbios_family_arm_a9_Cache_enableL1d__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.enableL1p", new Extern("ti_sysbios_family_arm_a9_Cache_enableL1p__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.enableL2", new Extern("ti_sysbios_family_arm_a9_Cache_enableL2__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.initL2Sram", new Extern("ti_sysbios_family_arm_a9_Cache_initL2Sram__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.sync", new Extern("ti_sysbios_family_arm_a9_Cache_sync__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.debugWriteL2", new Extern("ti_sysbios_family_arm_a9_Cache_debugWriteL2__I", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.invL1d", new Extern("ti_sysbios_family_arm_a9_Cache_invL1d__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.invL1p", new Extern("ti_sysbios_family_arm_a9_Cache_invL1p__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.invL2", new Extern("ti_sysbios_family_arm_a9_Cache_invL2__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbL1d", new Extern("ti_sysbios_family_arm_a9_Cache_wbL1d__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbL2", new Extern("ti_sysbios_family_arm_a9_Cache_wbL2__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbInvL1d", new Extern("ti_sysbios_family_arm_a9_Cache_wbInvL1d__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbInvL2", new Extern("ti_sysbios_family_arm_a9_Cache_wbInvL2__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_Bool)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.invL1dAllInternal", new Extern("ti_sysbios_family_arm_a9_Cache_invL1dAllInternal__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbL1dAll", new Extern("ti_sysbios_family_arm_a9_Cache_wbL1dAll__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbL2All", new Extern("ti_sysbios_family_arm_a9_Cache_wbL2All__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbInvL1dAll", new Extern("ti_sysbios_family_arm_a9_Cache_wbInvL1dAll__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wbInvL2All", new Extern("ti_sysbios_family_arm_a9_Cache_wbInvL2All__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.getLockdownReg", new Extern("ti_sysbios_family_arm_a9_Cache_getLockdownReg__I", "xdc_Bits32(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.setLockdownReg", new Extern("ti_sysbios_family_arm_a9_Cache_setLockdownReg__I", "xdc_Void(*)(xdc_Bits32)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.wayLoadLock", new Extern("ti_sysbios_family_arm_a9_Cache_wayLoadLock__I", "xdc_Void(*)(xdc_Ptr,xdc_SizeT,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.setL1Prefetch", new Extern("ti_sysbios_family_arm_a9_Cache_setL1Prefetch__I", "xdc_Void(*)(xdc_UInt32)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.getCacheLevelInfo", new Extern("ti_sysbios_family_arm_a9_Cache_getCacheLevelInfo__I", "xdc_Bits32(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Cache.l2InterruptHandler", new Extern("ti_sysbios_family_arm_a9_Cache_l2InterruptHandler__I", "xdc_Void(*)(xdc_UArg)", true, false));
    }

    void Mmu$$CONSTS()
    {
        // module Mmu
    }

    void Timer$$CONSTS()
    {
        // module Timer
        om.bind("ti.sysbios.family.arm.a9.Timer.MAX_PERIOD", 0xFFFFFFFFL);
        om.bind("ti.sysbios.family.arm.a9.Timer.NUM_TIMER_DEVICES", 1L);
        om.bind("ti.sysbios.family.arm.a9.Timer.deviceRegs", new Extern("ti_sysbios_family_arm_a9_Timer_deviceRegs", "ti_sysbios_family_arm_a9_Timer_DeviceRegs*", false, false));
        om.bind("ti.sysbios.family.arm.a9.Timer.getNumTimers", new Extern("ti_sysbios_family_arm_a9_Timer_getNumTimers__E", "xdc_UInt(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Timer.getStatus", new Extern("ti_sysbios_family_arm_a9_Timer_getStatus__E", "ti_sysbios_interfaces_ITimer_Status(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Timer.startup", new Extern("ti_sysbios_family_arm_a9_Timer_startup__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Timer.stub", new Extern("ti_sysbios_family_arm_a9_Timer_stub__E", "xdc_Void(*)(xdc_UArg)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Timer.getHandle", new Extern("ti_sysbios_family_arm_a9_Timer_getHandle__E", "ti_sysbios_family_arm_a9_Timer_Handle(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Timer.initDevice", new Extern("ti_sysbios_family_arm_a9_Timer_initDevice__I", "xdc_Void(*)(ti_sysbios_family_arm_a9_Timer_Object*)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Timer.postInit", new Extern("ti_sysbios_family_arm_a9_Timer_postInit__I", "xdc_Int(*)(ti_sysbios_family_arm_a9_Timer_Object*,xdc_runtime_Error_Block*)", true, false));
        om.bind("ti.sysbios.family.arm.a9.Timer.checkOverflow", new Extern("ti_sysbios_family_arm_a9_Timer_checkOverflow__I", "xdc_Bool(*)(xdc_UInt32,xdc_UInt32)", true, false));
    }

    void TimerSupport$$CONSTS()
    {
        // module TimerSupport
        om.bind("ti.sysbios.family.arm.a9.TimerSupport.enable", new Extern("ti_sysbios_family_arm_a9_TimerSupport_enable__E", "xdc_Void(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void TimestampProvider$$CONSTS()
    {
        // module TimestampProvider
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

    void Timer$$CREATES()
    {
        Proto.Fxn fxn;
        StringBuilder sb;

        if (isCFG) {
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$a9$Timer$$__initObject = function( inst ) {\n");
                sb.append("if (!this.$used) {\n");
                    sb.append("throw new Error(\"Function ti.sysbios.family.arm.a9.Timer.create() called before xdc.useModule('ti.sysbios.family.arm.a9.Timer')\");\n");
                sb.append("}\n");
                sb.append("var name = xdc.module('xdc.runtime.Text').defineRopeCord(inst.instance.name);\n");
                sb.append("inst.$object.$$bind('__name', name);\n");
                sb.append("this.instance$static$init.$fxn.apply(inst, [inst.$object, inst.$args.id, inst.$args.tickFxn, inst, inst.$module]);\n");
                sb.append("inst.$seal();\n");
            sb.append("};\n");
            Global.eval(sb.toString());
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a9.Timer$$create", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a9.Timer.Module", "ti.sysbios.family.arm.a9"), om.findStrict("ti.sysbios.family.arm.a9.Timer.Instance", "ti.sysbios.family.arm.a9"), 3, 2, false));
                        fxn.addArg(0, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(1, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(2, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.a9.Timer.Params", "ti.sysbios.family.arm.a9"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$a9$Timer$$create = function( id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.a9.Timer'];\n");
                sb.append("var __inst = xdc.om['ti.sysbios.family.arm.a9.Timer.Instance'].$$make();\n");
                sb.append("__inst.$$bind('$package', xdc.om['ti.sysbios.family.arm.a9']);\n");
                sb.append("__inst.$$bind('$index', __mod.$instances.length);\n");
                sb.append("__inst.$$bind('$category', 'Instance');\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$instances.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', new xdc.om['ti.sysbios.family.arm.a9.Timer'].Instance_State);\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("var save = xdc.om.$curpkg;\n");
                sb.append("xdc.om.$$bind('$curpkg', __mod.$package.$name);\n");
                sb.append("__mod.instance$meta$init.$fxn.apply(__inst, [id, tickFxn]);\n");
                sb.append("xdc.om.$$bind('$curpkg', save);\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.a9.Timer'].__initObject(__inst);\n");
                sb.append("__inst.$$bind('$$phase', xdc.om.$$phase);\n");
                sb.append("return __inst;\n");
            sb.append("}\n");
            Global.eval(sb.toString());
        }//isCFG
        if (isCFG) {
            fxn = (Proto.Fxn)om.bind("ti.sysbios.family.arm.a9.Timer$$construct", new Proto.Fxn(om.findStrict("ti.sysbios.family.arm.a9.Timer.Module", "ti.sysbios.family.arm.a9"), null, 4, 2, false));
                        fxn.addArg(0, "__obj", (Proto)om.findStrict("ti.sysbios.family.arm.a9.Timer$$Object", "ti.sysbios.family.arm.a9"), null);
                        fxn.addArg(1, "id", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF);
                        fxn.addArg(2, "tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF);
                        fxn.addArg(3, "__params", (Proto)om.findStrict("ti.sysbios.family.arm.a9.Timer.Params", "ti.sysbios.family.arm.a9"), Global.newObject());
            sb = new StringBuilder();
            sb.append("ti$sysbios$family$arm$a9$Timer$$construct = function( __obj, id, tickFxn, __params ) {\n");
                sb.append("var __mod = xdc.om['ti.sysbios.family.arm.a9.Timer'];\n");
                sb.append("var __inst = __obj;\n");
                sb.append("__inst.$$bind('$args', {id:id, tickFxn:tickFxn});\n");
                sb.append("__inst.$$bind('$module', __mod);\n");
                sb.append("__mod.$objects.$add(__inst);\n");
                sb.append("__inst.$$bind('$object', xdc.om['ti.sysbios.family.arm.a9.Timer'].Instance_State.$$make(__inst.$$parent, __inst.$name));\n");
                sb.append("for (var __p in __params) __inst[__p] = __params[__p];\n");
                sb.append("__inst.$$bless();\n");
                sb.append("if (xdc.om.$$phase >= 5) xdc.om['ti.sysbios.family.arm.a9.Timer'].__initObject(__inst);\n");
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

    void Cache$$FUNCTIONS()
    {
        Proto.Fxn fxn;

    }

    void Mmu$$FUNCTIONS()
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

    void Cache$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a9.Cache.L2ControllerRegs", "ti.sysbios.family.arm.a9");
        sizes.clear();
        sizes.add(Global.newArray("CACHEID", "UInt32"));
        sizes.add(Global.newArray("CACHETYPE", "UInt32"));
        sizes.add(Global.newArray("hole0", "A62;UInt32"));
        sizes.add(Global.newArray("CONTROL", "UInt32"));
        sizes.add(Global.newArray("AUXCONTROL", "UInt32"));
        sizes.add(Global.newArray("TAGRAMCONTROL", "UInt32"));
        sizes.add(Global.newArray("DATARAMCONTROL", "UInt32"));
        sizes.add(Global.newArray("hole1", "A60;UInt32"));
        sizes.add(Global.newArray("EVCOUNTERCTRL", "UInt32"));
        sizes.add(Global.newArray("EVCOUNTER1CFG", "UInt32"));
        sizes.add(Global.newArray("EVCOUNTER0CFG", "UInt32"));
        sizes.add(Global.newArray("EVCOUNTER1", "UInt32"));
        sizes.add(Global.newArray("EVCOUNTER0", "UInt32"));
        sizes.add(Global.newArray("INTMASK", "UInt32"));
        sizes.add(Global.newArray("INTMASKSTATUS", "UInt32"));
        sizes.add(Global.newArray("INTRAWSTATUS", "UInt32"));
        sizes.add(Global.newArray("INTCLEAR", "UInt32"));
        sizes.add(Global.newArray("hole2", "A323;UInt32"));
        sizes.add(Global.newArray("CACHESYNC", "UInt32"));
        sizes.add(Global.newArray("hole3", "A15;UInt32"));
        sizes.add(Global.newArray("INVPA", "UInt32"));
        sizes.add(Global.newArray("hole4", "A2;UInt32"));
        sizes.add(Global.newArray("INVWAY", "UInt32"));
        sizes.add(Global.newArray("hole5", "A12;UInt32"));
        sizes.add(Global.newArray("CLEANPA", "UInt32"));
        sizes.add(Global.newArray("hole6", "A1;UInt32"));
        sizes.add(Global.newArray("CLEANINDEX", "UInt32"));
        sizes.add(Global.newArray("CLEANWAY", "UInt32"));
        sizes.add(Global.newArray("hole7", "A12;UInt32"));
        sizes.add(Global.newArray("CLEANINVPA", "UInt32"));
        sizes.add(Global.newArray("hole8", "A1;UInt32"));
        sizes.add(Global.newArray("CLEANINVINDEX", "UInt32"));
        sizes.add(Global.newArray("CLEANINVWAY", "UInt32"));
        sizes.add(Global.newArray("hole9", "A64;UInt32"));
        sizes.add(Global.newArray("LOCKDOWN", "A16;UInt32"));
        sizes.add(Global.newArray("hole10", "A4;UInt32"));
        sizes.add(Global.newArray("LOCKLINEEN", "UInt32"));
        sizes.add(Global.newArray("UNLOCKWAY", "UInt32"));
        sizes.add(Global.newArray("hole11", "A170;UInt32"));
        sizes.add(Global.newArray("ADDRFILTERSTART", "UInt32"));
        sizes.add(Global.newArray("ADDRFILTEREND", "UInt32"));
        sizes.add(Global.newArray("hole12", "A206;UInt32"));
        sizes.add(Global.newArray("DEBUGCTRL", "UInt32"));
        sizes.add(Global.newArray("hole13", "A7;UInt32"));
        sizes.add(Global.newArray("PREFETCHCTRL", "UInt32"));
        sizes.add(Global.newArray("hole14", "A7;UInt32"));
        sizes.add(Global.newArray("POWERCTRL", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a9.Cache.L2ControllerRegs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a9.Cache.L2ControllerRegs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a9.Cache.L2ControllerRegs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a9.Cache.Module_State", "ti.sysbios.family.arm.a9");
        sizes.clear();
        sizes.add(Global.newArray("l1dInfo", "UInt32"));
        sizes.add(Global.newArray("l1pInfo", "UInt32"));
        sizes.add(Global.newArray("l2Info", "UInt32"));
        sizes.add(Global.newArray("l2WaySize", "USize"));
        sizes.add(Global.newArray("l2NumWays", "UInt"));
        sizes.add(Global.newArray("l2NumSets", "UInt"));
        sizes.add(Global.newArray("lockRegister", "UInt32"));
        sizes.add(Global.newArray("l2CacheHwi", "UPtr"));
        sizes.add(Global.newArray("pl310RTLRelease", "UInt"));
        sizes.add(Global.newArray("l2ErrorStatus", "UInt32"));
        sizes.add(Global.newArray("baseAddresses", "A16;UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a9.Cache.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a9.Cache.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a9.Cache.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Mmu$$SIZES()
    {
    }

    void Timer$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a9.Timer.DeviceRegs", "ti.sysbios.family.arm.a9");
        sizes.clear();
        sizes.add(Global.newArray("LOAD", "UInt32"));
        sizes.add(Global.newArray("COUNTER", "UInt32"));
        sizes.add(Global.newArray("CONTROL", "UInt32"));
        sizes.add(Global.newArray("INTSTATUS", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a9.Timer.DeviceRegs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a9.Timer.DeviceRegs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a9.Timer.DeviceRegs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a9.Timer.Instance_State", "ti.sysbios.family.arm.a9");
        sizes.clear();
        sizes.add(Global.newArray("__fxns", "UPtr"));
        sizes.add(Global.newArray("staticInst", "UShort"));
        sizes.add(Global.newArray("runMode", "Nti.sysbios.interfaces.ITimer.RunMode;;;;"));
        sizes.add(Global.newArray("startMode", "Nti.sysbios.interfaces.ITimer.StartMode;;;"));
        sizes.add(Global.newArray("period", "UInt32"));
        sizes.add(Global.newArray("periodType", "Nti.sysbios.interfaces.ITimer.PeriodType;;;"));
        sizes.add(Global.newArray("intNum", "UInt"));
        sizes.add(Global.newArray("prescale", "UInt8"));
        sizes.add(Global.newArray("arg", "UIArg"));
        sizes.add(Global.newArray("tickFxn", "UFxn"));
        sizes.add(Global.newArray("extFreq", "Sxdc.runtime.Types;FreqHz"));
        sizes.add(Global.newArray("hwi", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a9.Timer.Instance_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a9.Timer.Instance_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a9.Timer.Instance_State'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.arm.a9.Timer.Module_State", "ti.sysbios.family.arm.a9");
        sizes.clear();
        sizes.add(Global.newArray("availMask", "UInt"));
        sizes.add(Global.newArray("handle", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.arm.a9.Timer.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.arm.a9.Timer.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.arm.a9.Timer.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimerSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void TimestampProvider$$SIZES()
    {
    }

    void Cache$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a9/Cache.xs");
        om.bind("ti.sysbios.family.arm.a9.Cache$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache.Module", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Cache.Module", om.findStrict("ti.sysbios.interfaces.ICache.Module", "ti.sysbios.family.arm.a9"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("sizeL1dCacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 32L, "rh");
                po.addFld("sizeL1pCacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 32L, "rh");
                po.addFld("sizeL2CacheLine", Proto.Elm.newCNum("(xdc_UInt)"), 32L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.a9"), $$UNDEF, "wh");
            po.addFld("A_badBlockLength", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "A_badBlockLength: Block length too large. Must be <= L2 way size."), "w");
            po.addFld("A_blockCrossesPage", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "A_blockCrossesPage: Memory block crosses L2 way page boundary."), "w");
            po.addFld("A_badInvCallWithL2En", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "A_badInvCallWithL2En: Cannot call cache Invalidate with L2 cache enabled."), "w");
            po.addFld("A_noNonSecureInterruptAccess", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "A_noNonSecureInterruptAccess: Non-secure interrupt access control disabled."), "w");
            po.addFld("A_noNonSecureLockdown", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "A_noNonSecureLockdown: Non-secure lockdown is not enabled."), "w");
            po.addFld("A_invalidL2CounterId", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "A_invalidL2CounterId: Invalid L2 cache event counter Id passed."), "w");
            po.addFld("A_badL2CacheOperation", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "A_badL2CacheOperation: Cannot perform L2 Cache maintenance when L2 configured as SRAM."), "w");
            po.addFld("A_l1PrefetchApiNotSupported", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "A_l1PrefetchApiNotSupported: Cache_enableL1Prefetch()/Cache_disableL1Prefetch() APIs not supported on this device."), "w");
            po.addFld("enableCache", $$T_Bool, true, "w");
            po.addFld("unlockL2Cache", $$T_Bool, true, "w");
            po.addFld("branchPredictionEnabled", $$T_Bool, true, "w");
            po.addFld("configureL2Sram", $$T_Bool, false, "w");
            po.addFld("controlModuleReg", new Proto.Adr("xdc_Ptr", "Pv"), null, "w");
            po.addFld("enableL2Interrupt", $$T_Bool, true, "w");
            po.addFld("l2DataPrefetchEnable", $$T_Bool, true, "w");
            po.addFld("l2InstructionPrefetchEnable", $$T_Bool, true, "w");
            po.addFld("l2PrefetchDropEnable", $$T_Bool, false, "w");
            po.addFld("l2DoubleLinefillEnable", $$T_Bool, true, "w");
            po.addFld("l2WrapDoubleLinefillEnable", $$T_Bool, false, "w");
            po.addFld("l2IncrDoubleLinefillEnable", $$T_Bool, false, "w");
            po.addFld("l2PrefetchOffset", Proto.Elm.newCNum("(xdc_UInt8)"), 0L, "w");
            po.addFld("l2InterruptFunc", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), null, "w");
            po.addFld("l2InterruptMask", Proto.Elm.newCNum("(xdc_UInt32)"), 0x1FFL, "w");
            po.addFld("isOMAP4", $$T_Bool, false, "w");
            po.addFld("l2CacheControllerAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Cache$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Cache$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Cache$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Cache$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        // typedef Cache.CacheIntHandlerFuncPtr
        om.bind("ti.sysbios.family.arm.a9.Cache.CacheIntHandlerFuncPtr", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"));
        // struct Cache.CacheInfoView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache$$CacheInfoView", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Cache.CacheInfoView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("cache", $$T_Str, $$UNDEF, "w");
                po.addFld("cacheSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("lineSize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("ways", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("waySize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
        // struct Cache.WayInfoView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache$$WayInfoView", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Cache.WayInfoView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("number", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("locked", $$T_Bool, $$UNDEF, "w");
                po.addFld("baseAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        // struct Cache.ErrorStatusView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache$$ErrorStatusView", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Cache.ErrorStatusView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("DecodeError", $$T_Str, $$UNDEF, "w");
                po.addFld("DataRAMReadError", $$T_Str, $$UNDEF, "w");
                po.addFld("TagRAMReadError", $$T_Str, $$UNDEF, "w");
                po.addFld("DataRAMWriteError", $$T_Str, $$UNDEF, "w");
                po.addFld("TagRAMWriteError", $$T_Str, $$UNDEF, "w");
                po.addFld("DataRAMParityError", $$T_Str, $$UNDEF, "w");
                po.addFld("TagRAMParityError", $$T_Str, $$UNDEF, "w");
                po.addFld("SlaveError", $$T_Str, $$UNDEF, "w");
        // struct Cache.L2ControllerRegs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache$$L2ControllerRegs", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Cache.L2ControllerRegs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("CACHEID", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CACHETYPE", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole0", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(62L)), $$DEFAULT, "w");
                po.addFld("CONTROL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("AUXCONTROL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TAGRAMCONTROL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("DATARAMCONTROL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole1", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(60L)), $$DEFAULT, "w");
                po.addFld("EVCOUNTERCTRL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EVCOUNTER1CFG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EVCOUNTER0CFG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EVCOUNTER1", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EVCOUNTER0", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTMASK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTMASKSTATUS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTRAWSTATUS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTCLEAR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole2", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(323L)), $$DEFAULT, "w");
                po.addFld("CACHESYNC", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole3", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(15L)), $$DEFAULT, "w");
                po.addFld("INVPA", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole4", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(2L)), $$DEFAULT, "w");
                po.addFld("INVWAY", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole5", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(12L)), $$DEFAULT, "w");
                po.addFld("CLEANPA", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole6", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(1L)), $$DEFAULT, "w");
                po.addFld("CLEANINDEX", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CLEANWAY", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole7", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(12L)), $$DEFAULT, "w");
                po.addFld("CLEANINVPA", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole8", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(1L)), $$DEFAULT, "w");
                po.addFld("CLEANINVINDEX", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CLEANINVWAY", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole9", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(64L)), $$DEFAULT, "w");
                po.addFld("LOCKDOWN", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
                po.addFld("hole10", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(4L)), $$DEFAULT, "w");
                po.addFld("LOCKLINEEN", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("UNLOCKWAY", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole11", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(170L)), $$DEFAULT, "w");
                po.addFld("ADDRFILTERSTART", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("ADDRFILTEREND", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole12", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(206L)), $$DEFAULT, "w");
                po.addFld("DEBUGCTRL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole13", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(7L)), $$DEFAULT, "w");
                po.addFld("PREFETCHCTRL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole14", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(7L)), $$DEFAULT, "w");
                po.addFld("POWERCTRL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Cache.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache$$Module_State", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Cache.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("l1dInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l1pInfo", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l2Info", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l2WaySize", Proto.Elm.newCNum("(xdc_SizeT)"), $$UNDEF, "w");
                po.addFld("l2NumWays", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("l2NumSets", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("lockRegister", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("l2CacheHwi", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Handle", "ti.sysbios.family.arm.a9"), $$UNDEF, "w");
                po.addFld("pl310RTLRelease", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("l2ErrorStatus", Proto.Elm.newCNum("(xdc_Bits32)"), $$UNDEF, "w");
                po.addFld("baseAddresses", new Proto.Arr(new Proto.Adr("xdc_Ptr", "Pv"), false, xdc.services.intern.xsr.Enum.intValue(16L)), $$DEFAULT, "w");
    }

    void Mmu$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a9/Mmu.xs");
        om.bind("ti.sysbios.family.arm.a9.Mmu$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Mmu.Module", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Mmu.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Mmu$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Mmu$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Mmu$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Timer$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a9/Timer.xs");
        om.bind("ti.sysbios.family.arm.a9.Timer$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer.Module", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Timer.Module", om.findStrict("ti.sysbios.interfaces.ITimer.Module", "ti.sysbios.family.arm.a9"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt32)"), 0xFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.arm.a9"), $$UNDEF, "wh");
            po.addFld("E_invalidTimer", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "E_invalidTimer: Invalid Timer Id %d"), "w");
            po.addFld("E_notAvailable", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "E_notAvailable: Timer not available %d"), "w");
            po.addFld("E_cannotSupport", (Proto)om.findStrict("xdc.runtime.Error$$Id", "ti.sysbios.family.arm.a9"), Global.newObject("msg", "E_cannotSupport: Timer cannot support requested period %d"), "w");
            po.addFld("intNumDef", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
            po.addFld("anyMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x1L, "w");
            po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), 0x1L, "w");
            po.addFld("startupNeeded", $$T_Bool, false, "w");
            po.addFld("privTimerRegBaseAddress", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "wh");
        }//isCFG
        if (isCFG) {
                        po.addFxn("create", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a9.Timer$$create", "ti.sysbios.family.arm.a9"), Global.get("ti$sysbios$family$arm$a9$Timer$$create"));
                        po.addFxn("construct", (Proto.Fxn)om.findStrict("ti.sysbios.family.arm.a9.Timer$$construct", "ti.sysbios.family.arm.a9"), Global.get("ti$sysbios$family$arm$a9$Timer$$construct"));
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Timer$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Timer$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Timer$$instance$meta$init", true);
        if (fxn != null) po.addFxn("instance$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Timer$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Timer$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
        fxn = Global.get(cap, "instance$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.Timer$$instance$static$init", true);
        if (fxn != null) po.addFxn("instance$static$init", $$T_Met, fxn);
                fxn = Global.get(cap, "viewGetCurrentClockTick");
                if (fxn != null) po.addFxn("viewGetCurrentClockTick", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$viewGetCurrentClockTick", "ti.sysbios.family.arm.a9"), fxn);
                fxn = Global.get(cap, "getFreqMeta");
                if (fxn != null) po.addFxn("getFreqMeta", (Proto.Fxn)om.findStrict("ti.sysbios.interfaces.ITimer$$getFreqMeta", "ti.sysbios.family.arm.a9"), fxn);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer.Instance", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Timer.Instance", om.findStrict("ti.sysbios.interfaces.ITimer.Instance", "ti.sysbios.family.arm.a9"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt32)"), 0xFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arm_gic_Hwi_Params*", "PS"), null, "w");
            po.addFld("prescale", Proto.Elm.newCNum("(xdc_UInt8)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.a9"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$Params", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Timer.Params", om.findStrict("ti.sysbios.interfaces.ITimer$$Params", "ti.sysbios.family.arm.a9"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("ANY", Proto.Elm.newCNum("(xdc_UInt)"), Global.eval("~0"), "rh");
                po.addFld("MAX_PERIOD", Proto.Elm.newCNum("(xdc_UInt32)"), 0xFFFFFFFFL, "rh");
                po.addFld("NUM_TIMER_DEVICES", Proto.Elm.newCNum("(xdc_Int)"), 1L, "rh");
        if (isCFG) {
            po.addFld("hwiParams", new Proto.Adr("ti_sysbios_family_arm_gic_Hwi_Params*", "PS"), null, "w");
            po.addFld("prescale", Proto.Elm.newCNum("(xdc_UInt8)"), 0L, "w");
                        po.addFld("instance", (Proto)om.findStrict("xdc.runtime.IInstance.Params", "ti.sysbios.family.arm.a9"), $$UNDEF, "w");
        }//isCFG
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$Object", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Timer.Object", om.findStrict("ti.sysbios.family.arm.a9.Timer.Instance", "ti.sysbios.family.arm.a9"));
        // struct Timer.BasicView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$BasicView", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Timer.BasicView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("halTimerHandle", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("label", $$T_Str, $$UNDEF, "w");
                po.addFld("startMode", $$T_Str, $$UNDEF, "w");
                po.addFld("runMode", $$T_Str, $$UNDEF, "w");
                po.addFld("period", $$T_Str, $$UNDEF, "w");
                po.addFld("periodType", $$T_Str, $$UNDEF, "w");
                po.addFld("prescale", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Arr($$T_Str, false), $$DEFAULT, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("extFreq", $$T_Str, $$UNDEF, "w");
                po.addFld("hwiHandle", $$T_Str, $$UNDEF, "w");
                po.addFxn("$xml", $$T_Met, Global.get("$$xml"));
        // struct Timer.DeviceView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$DeviceView", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Timer.DeviceView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("deviceAddr", $$T_Str, $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("period", $$T_Str, $$UNDEF, "w");
                po.addFld("currCount", $$T_Str, $$UNDEF, "w");
                po.addFld("remainingCount", $$T_Str, $$UNDEF, "w");
                po.addFld("prescale", $$T_Str, $$UNDEF, "w");
        // struct Timer.DeviceRegs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$DeviceRegs", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Timer.DeviceRegs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("LOAD", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("COUNTER", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CONTROL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("INTSTATUS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Timer.Instance_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$Instance_State", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Timer.Instance_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("staticInst", $$T_Bool, $$UNDEF, "w");
                po.addFld("runMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.a9"), $$UNDEF, "w");
                po.addFld("startMode", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.a9"), $$UNDEF, "w");
                po.addFld("period", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("periodType", (Proto)om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.a9"), $$UNDEF, "w");
                po.addFld("intNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("prescale", Proto.Elm.newCNum("(xdc_UInt8)"), $$UNDEF, "w");
                po.addFld("arg", new Proto.Adr("xdc_UArg", "Pv"), $$UNDEF, "w");
                po.addFld("tickFxn", new Proto.Adr("xdc_Void(*)(xdc_UArg)", "PFv"), $$UNDEF, "w");
                po.addFld("extFreq", (Proto)om.findStrict("xdc.runtime.Types.FreqHz", "ti.sysbios.family.arm.a9"), $$DEFAULT, "w");
                po.addFld("hwi", (Proto)om.findStrict("ti.sysbios.family.arm.gic.Hwi.Handle", "ti.sysbios.family.arm.a9"), $$UNDEF, "w");
        // struct Timer.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$Module_State", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.Timer.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("availMask", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF, "w");
                po.addFld("handle", (Proto)om.findStrict("ti.sysbios.family.arm.a9.Timer.Handle", "ti.sysbios.family.arm.a9"), $$UNDEF, "w");
    }

    void TimerSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.TimerSupport.Module", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.TimerSupport.Module", om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.family.arm.a9"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
        }//isCFG
    }

    void TimestampProvider$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a9/TimestampProvider.xs");
        om.bind("ti.sysbios.family.arm.a9.TimestampProvider$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.TimestampProvider.Module", "ti.sysbios.family.arm.a9");
        po.init("ti.sysbios.family.arm.a9.TimestampProvider.Module", $$Module);
                po.addFld("$hostonly", $$T_Num, 1, "r");
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.TimestampProvider$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.TimestampProvider$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.arm.a9.TimestampProvider$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
    }

    void Cache$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache", "ti.sysbios.family.arm.a9");
        vo.bind("L2ControllerRegs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a9.Cache.L2ControllerRegs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache$$L2ControllerRegs", "ti.sysbios.family.arm.a9");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a9.Cache.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache$$Module_State", "ti.sysbios.family.arm.a9");
    }

    void Mmu$$ROV()
    {
    }

    void Timer$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer", "ti.sysbios.family.arm.a9");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$Instance_State", "ti.sysbios.family.arm.a9");
        po.addFld("__fxns", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
        vo.bind("DeviceRegs$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a9.Timer.DeviceRegs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$DeviceRegs", "ti.sysbios.family.arm.a9");
        vo.bind("Instance_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a9.Timer.Instance_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$Instance_State", "ti.sysbios.family.arm.a9");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.arm.a9.Timer.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer$$Module_State", "ti.sysbios.family.arm.a9");
    }

    void TimerSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.TimerSupport", "ti.sysbios.family.arm.a9");
    }

    void TimestampProvider$$ROV()
    {
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.arm.a9.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.arm.a9"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/arm/a9/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.arm.a9"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.arm.a9"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.arm.a9"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.arm.a9"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.arm.a9"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.arm.a9"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.arm.a9", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.arm.a9");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.arm.a9.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        imports.add(Global.newArray("ti.sysbios.interfaces", Global.newArray()));
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.arm.a9'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.arm.a9$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.arm.a9$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.arm.a9$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.arm.a9.aa9fg',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.arm.a9.aa9fg', {target: 'gnu.targets.arm.A9F', suffix: 'a9fg'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void Cache$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache", "ti.sysbios.family.arm.a9");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache.Module", "ti.sysbios.family.arm.a9");
        vo.init2(po, "ti.sysbios.family.arm.a9.Cache", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a9.Cache$$capsule", "ti.sysbios.family.arm.a9"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a9", "ti.sysbios.family.arm.a9"));
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
        vo.bind("Type", om.findStrict("ti.sysbios.interfaces.ICache.Type", "ti.sysbios.family.arm.a9"));
        vo.bind("L2CounterIntType", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2CounterIntType", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource", "ti.sysbios.family.arm.a9"));
        vo.bind("CacheIntHandlerFuncPtr", om.findStrict("ti.sysbios.family.arm.a9.Cache.CacheIntHandlerFuncPtr", "ti.sysbios.family.arm.a9"));
        vo.bind("CacheInfoView", om.findStrict("ti.sysbios.family.arm.a9.Cache.CacheInfoView", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Cache.CacheInfoView", "ti.sysbios.family.arm.a9"));
        vo.bind("WayInfoView", om.findStrict("ti.sysbios.family.arm.a9.Cache.WayInfoView", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Cache.WayInfoView", "ti.sysbios.family.arm.a9"));
        vo.bind("ErrorStatusView", om.findStrict("ti.sysbios.family.arm.a9.Cache.ErrorStatusView", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Cache.ErrorStatusView", "ti.sysbios.family.arm.a9"));
        mcfgs.add("A_badBlockLength");
        mcfgs.add("A_blockCrossesPage");
        mcfgs.add("A_badInvCallWithL2En");
        mcfgs.add("A_noNonSecureInterruptAccess");
        mcfgs.add("A_noNonSecureLockdown");
        mcfgs.add("A_invalidL2CounterId");
        mcfgs.add("A_badL2CacheOperation");
        mcfgs.add("A_l1PrefetchApiNotSupported");
        mcfgs.add("enableCache");
        mcfgs.add("unlockL2Cache");
        mcfgs.add("branchPredictionEnabled");
        mcfgs.add("configureL2Sram");
        mcfgs.add("controlModuleReg");
        mcfgs.add("enableL2Interrupt");
        mcfgs.add("l2DataPrefetchEnable");
        mcfgs.add("l2InstructionPrefetchEnable");
        mcfgs.add("l2PrefetchDropEnable");
        mcfgs.add("l2DoubleLinefillEnable");
        mcfgs.add("l2WrapDoubleLinefillEnable");
        mcfgs.add("l2IncrDoubleLinefillEnable");
        mcfgs.add("l2PrefetchOffset");
        mcfgs.add("l2InterruptFunc");
        mcfgs.add("l2InterruptMask");
        vo.bind("L2ControllerRegs", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2ControllerRegs", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Cache.L2ControllerRegs", "ti.sysbios.family.arm.a9"));
        vo.bind("l2ControllerRegs", om.findStrict("ti.sysbios.family.arm.a9.Cache.l2ControllerRegs", "ti.sysbios.family.arm.a9"));
        mcfgs.add("isOMAP4");
        icfgs.add("isOMAP4");
        icfgs.add("l2CacheControllerAddress");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a9.Cache.Module_State", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Cache.Module_State", "ti.sysbios.family.arm.a9"));
        vo.bind("Type_L1P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1P", "ti.sysbios.family.arm.a9"));
        vo.bind("Type_L1D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1D", "ti.sysbios.family.arm.a9"));
        vo.bind("Type_L1", om.findStrict("ti.sysbios.interfaces.ICache.Type_L1", "ti.sysbios.family.arm.a9"));
        vo.bind("Type_L2P", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2P", "ti.sysbios.family.arm.a9"));
        vo.bind("Type_L2D", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2D", "ti.sysbios.family.arm.a9"));
        vo.bind("Type_L2", om.findStrict("ti.sysbios.interfaces.ICache.Type_L2", "ti.sysbios.family.arm.a9"));
        vo.bind("Type_ALLP", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLP", "ti.sysbios.family.arm.a9"));
        vo.bind("Type_ALLD", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALLD", "ti.sysbios.family.arm.a9"));
        vo.bind("Type_ALL", om.findStrict("ti.sysbios.interfaces.ICache.Type_ALL", "ti.sysbios.family.arm.a9"));
        vo.bind("L2CounterIntType_DISABLED", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2CounterIntType_DISABLED", "ti.sysbios.family.arm.a9"));
        vo.bind("L2CounterIntType_INCREMENT", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2CounterIntType_INCREMENT", "ti.sysbios.family.arm.a9"));
        vo.bind("L2CounterIntType_OVERFLOW", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2CounterIntType_OVERFLOW", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_DISABLED", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_DISABLED", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_CO", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_CO", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_DRHIT", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_DRHIT", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_DRREQ", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_DRREQ", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_DWHIT", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_DWHIT", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_DWREQ", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_DWREQ", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_DWTREQ", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_DWTREQ", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_IRHIT", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_IRHIT", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_IRREQ", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_IRREQ", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_WA", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_WA", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_IPFALLOC", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_IPFALLOC", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_EPFHIT", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_EPFHIT", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_EPFALLOC", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_EPFALLOC", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_SRRCVD", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_SRRCVD", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_SRCONF", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_SRCONF", "ti.sysbios.family.arm.a9"));
        vo.bind("L2EventSource_EPFRCVD", om.findStrict("ti.sysbios.family.arm.a9.Cache.L2EventSource_EPFRCVD", "ti.sysbios.family.arm.a9"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a9")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.a9.Cache.enable", "ti.sysbios.family.arm.a9"));
        vo.bind("inv", om.findStrict("ti.sysbios.family.arm.a9.Cache.inv", "ti.sysbios.family.arm.a9"));
        vo.bind("wbAll", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbAll", "ti.sysbios.family.arm.a9"));
        vo.bind("wbInvAll", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbInvAll", "ti.sysbios.family.arm.a9"));
        vo.bind("getEnabled", om.findStrict("ti.sysbios.family.arm.a9.Cache.getEnabled", "ti.sysbios.family.arm.a9"));
        vo.bind("wait", om.findStrict("ti.sysbios.family.arm.a9.Cache.wait", "ti.sysbios.family.arm.a9"));
        vo.bind("disable", om.findStrict("ti.sysbios.family.arm.a9.Cache.disable", "ti.sysbios.family.arm.a9"));
        vo.bind("wb", om.findStrict("ti.sysbios.family.arm.a9.Cache.wb", "ti.sysbios.family.arm.a9"));
        vo.bind("wbInv", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbInv", "ti.sysbios.family.arm.a9"));
        vo.bind("invL1dAll", om.findStrict("ti.sysbios.family.arm.a9.Cache.invL1dAll", "ti.sysbios.family.arm.a9"));
        vo.bind("invL1pAll", om.findStrict("ti.sysbios.family.arm.a9.Cache.invL1pAll", "ti.sysbios.family.arm.a9"));
        vo.bind("invL2All", om.findStrict("ti.sysbios.family.arm.a9.Cache.invL2All", "ti.sysbios.family.arm.a9"));
        vo.bind("lock", om.findStrict("ti.sysbios.family.arm.a9.Cache.lock", "ti.sysbios.family.arm.a9"));
        vo.bind("unlock", om.findStrict("ti.sysbios.family.arm.a9.Cache.unlock", "ti.sysbios.family.arm.a9"));
        vo.bind("enableBP", om.findStrict("ti.sysbios.family.arm.a9.Cache.enableBP", "ti.sysbios.family.arm.a9"));
        vo.bind("disableBP", om.findStrict("ti.sysbios.family.arm.a9.Cache.disableBP", "ti.sysbios.family.arm.a9"));
        vo.bind("enableL2EventCounters", om.findStrict("ti.sysbios.family.arm.a9.Cache.enableL2EventCounters", "ti.sysbios.family.arm.a9"));
        vo.bind("disableL2EventCounters", om.findStrict("ti.sysbios.family.arm.a9.Cache.disableL2EventCounters", "ti.sysbios.family.arm.a9"));
        vo.bind("resetL2EventCounter", om.findStrict("ti.sysbios.family.arm.a9.Cache.resetL2EventCounter", "ti.sysbios.family.arm.a9"));
        vo.bind("configureL2EventCounter", om.findStrict("ti.sysbios.family.arm.a9.Cache.configureL2EventCounter", "ti.sysbios.family.arm.a9"));
        vo.bind("getL2EventCount", om.findStrict("ti.sysbios.family.arm.a9.Cache.getL2EventCount", "ti.sysbios.family.arm.a9"));
        vo.bind("enableL1Prefetch", om.findStrict("ti.sysbios.family.arm.a9.Cache.enableL1Prefetch", "ti.sysbios.family.arm.a9"));
        vo.bind("disableL1Prefetch", om.findStrict("ti.sysbios.family.arm.a9.Cache.disableL1Prefetch", "ti.sysbios.family.arm.a9"));
        vo.bind("getL2AuxControlReg", om.findStrict("ti.sysbios.family.arm.a9.Cache.getL2AuxControlReg", "ti.sysbios.family.arm.a9"));
        vo.bind("setL2AuxControlReg", om.findStrict("ti.sysbios.family.arm.a9.Cache.setL2AuxControlReg", "ti.sysbios.family.arm.a9"));
        vo.bind("getL2PrefetchControl", om.findStrict("ti.sysbios.family.arm.a9.Cache.getL2PrefetchControl", "ti.sysbios.family.arm.a9"));
        vo.bind("setL2PrefetchControl", om.findStrict("ti.sysbios.family.arm.a9.Cache.setL2PrefetchControl", "ti.sysbios.family.arm.a9"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.a9.Cache.startup", "ti.sysbios.family.arm.a9"));
        vo.bind("disableL1d", om.findStrict("ti.sysbios.family.arm.a9.Cache.disableL1d", "ti.sysbios.family.arm.a9"));
        vo.bind("disableL1p", om.findStrict("ti.sysbios.family.arm.a9.Cache.disableL1p", "ti.sysbios.family.arm.a9"));
        vo.bind("disableL2", om.findStrict("ti.sysbios.family.arm.a9.Cache.disableL2", "ti.sysbios.family.arm.a9"));
        vo.bind("disableWbInvL2", om.findStrict("ti.sysbios.family.arm.a9.Cache.disableWbInvL2", "ti.sysbios.family.arm.a9"));
        vo.bind("enableL1d", om.findStrict("ti.sysbios.family.arm.a9.Cache.enableL1d", "ti.sysbios.family.arm.a9"));
        vo.bind("enableL1p", om.findStrict("ti.sysbios.family.arm.a9.Cache.enableL1p", "ti.sysbios.family.arm.a9"));
        vo.bind("enableL2", om.findStrict("ti.sysbios.family.arm.a9.Cache.enableL2", "ti.sysbios.family.arm.a9"));
        vo.bind("initL2Sram", om.findStrict("ti.sysbios.family.arm.a9.Cache.initL2Sram", "ti.sysbios.family.arm.a9"));
        vo.bind("sync", om.findStrict("ti.sysbios.family.arm.a9.Cache.sync", "ti.sysbios.family.arm.a9"));
        vo.bind("debugWriteL2", om.findStrict("ti.sysbios.family.arm.a9.Cache.debugWriteL2", "ti.sysbios.family.arm.a9"));
        vo.bind("invL1d", om.findStrict("ti.sysbios.family.arm.a9.Cache.invL1d", "ti.sysbios.family.arm.a9"));
        vo.bind("invL1p", om.findStrict("ti.sysbios.family.arm.a9.Cache.invL1p", "ti.sysbios.family.arm.a9"));
        vo.bind("invL2", om.findStrict("ti.sysbios.family.arm.a9.Cache.invL2", "ti.sysbios.family.arm.a9"));
        vo.bind("wbL1d", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbL1d", "ti.sysbios.family.arm.a9"));
        vo.bind("wbL2", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbL2", "ti.sysbios.family.arm.a9"));
        vo.bind("wbInvL1d", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbInvL1d", "ti.sysbios.family.arm.a9"));
        vo.bind("wbInvL2", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbInvL2", "ti.sysbios.family.arm.a9"));
        vo.bind("invL1dAllInternal", om.findStrict("ti.sysbios.family.arm.a9.Cache.invL1dAllInternal", "ti.sysbios.family.arm.a9"));
        vo.bind("wbL1dAll", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbL1dAll", "ti.sysbios.family.arm.a9"));
        vo.bind("wbL2All", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbL2All", "ti.sysbios.family.arm.a9"));
        vo.bind("wbInvL1dAll", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbInvL1dAll", "ti.sysbios.family.arm.a9"));
        vo.bind("wbInvL2All", om.findStrict("ti.sysbios.family.arm.a9.Cache.wbInvL2All", "ti.sysbios.family.arm.a9"));
        vo.bind("getLockdownReg", om.findStrict("ti.sysbios.family.arm.a9.Cache.getLockdownReg", "ti.sysbios.family.arm.a9"));
        vo.bind("setLockdownReg", om.findStrict("ti.sysbios.family.arm.a9.Cache.setLockdownReg", "ti.sysbios.family.arm.a9"));
        vo.bind("wayLoadLock", om.findStrict("ti.sysbios.family.arm.a9.Cache.wayLoadLock", "ti.sysbios.family.arm.a9"));
        vo.bind("setL1Prefetch", om.findStrict("ti.sysbios.family.arm.a9.Cache.setL1Prefetch", "ti.sysbios.family.arm.a9"));
        vo.bind("getCacheLevelInfo", om.findStrict("ti.sysbios.family.arm.a9.Cache.getCacheLevelInfo", "ti.sysbios.family.arm.a9"));
        vo.bind("l2InterruptHandler", om.findStrict("ti.sysbios.family.arm.a9.Cache.l2InterruptHandler", "ti.sysbios.family.arm.a9"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a9_Cache_Module__startupDone__E", "ti_sysbios_family_arm_a9_Cache_enable__E", "ti_sysbios_family_arm_a9_Cache_inv__E", "ti_sysbios_family_arm_a9_Cache_wbAll__E", "ti_sysbios_family_arm_a9_Cache_wbInvAll__E", "ti_sysbios_family_arm_a9_Cache_getEnabled__E", "ti_sysbios_family_arm_a9_Cache_wait__E", "ti_sysbios_family_arm_a9_Cache_disable__E", "ti_sysbios_family_arm_a9_Cache_wb__E", "ti_sysbios_family_arm_a9_Cache_wbInv__E", "ti_sysbios_family_arm_a9_Cache_invL1dAll__E", "ti_sysbios_family_arm_a9_Cache_invL1pAll__E", "ti_sysbios_family_arm_a9_Cache_invL2All__E", "ti_sysbios_family_arm_a9_Cache_lock__E", "ti_sysbios_family_arm_a9_Cache_unlock__E", "ti_sysbios_family_arm_a9_Cache_enableBP__E", "ti_sysbios_family_arm_a9_Cache_disableBP__E", "ti_sysbios_family_arm_a9_Cache_enableL2EventCounters__E", "ti_sysbios_family_arm_a9_Cache_disableL2EventCounters__E", "ti_sysbios_family_arm_a9_Cache_resetL2EventCounter__E", "ti_sysbios_family_arm_a9_Cache_configureL2EventCounter__E", "ti_sysbios_family_arm_a9_Cache_getL2EventCount__E", "ti_sysbios_family_arm_a9_Cache_enableL1Prefetch__E", "ti_sysbios_family_arm_a9_Cache_disableL1Prefetch__E", "ti_sysbios_family_arm_a9_Cache_getL2AuxControlReg__E", "ti_sysbios_family_arm_a9_Cache_setL2AuxControlReg__E", "ti_sysbios_family_arm_a9_Cache_getL2PrefetchControl__E", "ti_sysbios_family_arm_a9_Cache_setL2PrefetchControl__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_badBlockLength", "A_blockCrossesPage", "A_badInvCallWithL2En", "A_noNonSecureInterruptAccess", "A_noNonSecureLockdown", "A_invalidL2CounterId", "A_badL2CacheOperation", "A_l1PrefetchApiNotSupported"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.Mmu", "ti.sysbios.family.arm.a9");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Mmu.Module", "ti.sysbios.family.arm.a9");
        vo.init2(po, "ti.sysbios.family.arm.a9.Mmu", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a9.Mmu$$capsule", "ti.sysbios.family.arm.a9"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a9", "ti.sysbios.family.arm.a9"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a9")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.a9.Mmu$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("Mmu", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("Mmu");
    }

    void Timer$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer", "ti.sysbios.family.arm.a9");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer.Module", "ti.sysbios.family.arm.a9");
        vo.init2(po, "ti.sysbios.family.arm.a9.Timer", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a9.Timer$$capsule", "ti.sysbios.family.arm.a9"));
        vo.bind("Instance", om.findStrict("ti.sysbios.family.arm.a9.Timer.Instance", "ti.sysbios.family.arm.a9"));
        vo.bind("Params", om.findStrict("ti.sysbios.family.arm.a9.Timer.Params", "ti.sysbios.family.arm.a9"));
        vo.bind("PARAMS", ((Proto.Str)om.findStrict("ti.sysbios.family.arm.a9.Timer.Params", "ti.sysbios.family.arm.a9")).newInstance());
        vo.bind("Handle", om.findStrict("ti.sysbios.family.arm.a9.Timer.Handle", "ti.sysbios.family.arm.a9"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a9", "ti.sysbios.family.arm.a9"));
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
        vo.bind("FuncPtr", om.findStrict("ti.sysbios.interfaces.ITimer.FuncPtr", "ti.sysbios.family.arm.a9"));
        vo.bind("StartMode", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode", "ti.sysbios.family.arm.a9"));
        vo.bind("RunMode", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode", "ti.sysbios.family.arm.a9"));
        vo.bind("Status", om.findStrict("ti.sysbios.interfaces.ITimer.Status", "ti.sysbios.family.arm.a9"));
        vo.bind("PeriodType", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType", "ti.sysbios.family.arm.a9"));
        vo.bind("BasicView", om.findStrict("ti.sysbios.family.arm.a9.Timer.BasicView", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Timer.BasicView", "ti.sysbios.family.arm.a9"));
        vo.bind("DeviceView", om.findStrict("ti.sysbios.family.arm.a9.Timer.DeviceView", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Timer.DeviceView", "ti.sysbios.family.arm.a9"));
        mcfgs.add("E_invalidTimer");
        mcfgs.add("E_notAvailable");
        mcfgs.add("E_cannotSupport");
        mcfgs.add("intNumDef");
        mcfgs.add("anyMask");
        mcfgs.add("availMask");
        vo.bind("DeviceRegs", om.findStrict("ti.sysbios.family.arm.a9.Timer.DeviceRegs", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Timer.DeviceRegs", "ti.sysbios.family.arm.a9"));
        vo.bind("deviceRegs", om.findStrict("ti.sysbios.family.arm.a9.Timer.deviceRegs", "ti.sysbios.family.arm.a9"));
        mcfgs.add("startupNeeded");
        icfgs.add("startupNeeded");
        icfgs.add("privTimerRegBaseAddress");
        vo.bind("Instance_State", om.findStrict("ti.sysbios.family.arm.a9.Timer.Instance_State", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Timer.Instance_State", "ti.sysbios.family.arm.a9"));
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.arm.a9.Timer.Module_State", "ti.sysbios.family.arm.a9"));
        tdefs.add(om.findStrict("ti.sysbios.family.arm.a9.Timer.Module_State", "ti.sysbios.family.arm.a9"));
        vo.bind("StartMode_AUTO", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_AUTO", "ti.sysbios.family.arm.a9"));
        vo.bind("StartMode_USER", om.findStrict("ti.sysbios.interfaces.ITimer.StartMode_USER", "ti.sysbios.family.arm.a9"));
        vo.bind("RunMode_CONTINUOUS", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_CONTINUOUS", "ti.sysbios.family.arm.a9"));
        vo.bind("RunMode_ONESHOT", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_ONESHOT", "ti.sysbios.family.arm.a9"));
        vo.bind("RunMode_DYNAMIC", om.findStrict("ti.sysbios.interfaces.ITimer.RunMode_DYNAMIC", "ti.sysbios.family.arm.a9"));
        vo.bind("Status_INUSE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_INUSE", "ti.sysbios.family.arm.a9"));
        vo.bind("Status_FREE", om.findStrict("ti.sysbios.interfaces.ITimer.Status_FREE", "ti.sysbios.family.arm.a9"));
        vo.bind("PeriodType_MICROSECS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_MICROSECS", "ti.sysbios.family.arm.a9"));
        vo.bind("PeriodType_COUNTS", om.findStrict("ti.sysbios.interfaces.ITimer.PeriodType_COUNTS", "ti.sysbios.family.arm.a9"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a9")).add(vo);
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
            vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.a9.Timer$$instance$static$init", null) ? 1 : 0);
            vo.bind("__initObject", Global.get("ti$sysbios$family$arm$a9$Timer$$__initObject"));
        }//isCFG
        vo.bind("getNumTimers", om.findStrict("ti.sysbios.family.arm.a9.Timer.getNumTimers", "ti.sysbios.family.arm.a9"));
        vo.bind("getStatus", om.findStrict("ti.sysbios.family.arm.a9.Timer.getStatus", "ti.sysbios.family.arm.a9"));
        vo.bind("startup", om.findStrict("ti.sysbios.family.arm.a9.Timer.startup", "ti.sysbios.family.arm.a9"));
        vo.bind("stub", om.findStrict("ti.sysbios.family.arm.a9.Timer.stub", "ti.sysbios.family.arm.a9"));
        vo.bind("getHandle", om.findStrict("ti.sysbios.family.arm.a9.Timer.getHandle", "ti.sysbios.family.arm.a9"));
        vo.bind("initDevice", om.findStrict("ti.sysbios.family.arm.a9.Timer.initDevice", "ti.sysbios.family.arm.a9"));
        vo.bind("postInit", om.findStrict("ti.sysbios.family.arm.a9.Timer.postInit", "ti.sysbios.family.arm.a9"));
        vo.bind("checkOverflow", om.findStrict("ti.sysbios.family.arm.a9.Timer.checkOverflow", "ti.sysbios.family.arm.a9"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a9_Timer_Handle__label__E", "ti_sysbios_family_arm_a9_Timer_Module__startupDone__E", "ti_sysbios_family_arm_a9_Timer_Object__create__E", "ti_sysbios_family_arm_a9_Timer_Object__delete__E", "ti_sysbios_family_arm_a9_Timer_Object__get__E", "ti_sysbios_family_arm_a9_Timer_Object__first__E", "ti_sysbios_family_arm_a9_Timer_Object__next__E", "ti_sysbios_family_arm_a9_Timer_Params__init__E", "ti_sysbios_family_arm_a9_Timer_getNumTimers__E", "ti_sysbios_family_arm_a9_Timer_getStatus__E", "ti_sysbios_family_arm_a9_Timer_startup__E", "ti_sysbios_family_arm_a9_Timer_getMaxTicks__E", "ti_sysbios_family_arm_a9_Timer_setNextTick__E", "ti_sysbios_family_arm_a9_Timer_start__E", "ti_sysbios_family_arm_a9_Timer_stop__E", "ti_sysbios_family_arm_a9_Timer_setPeriod__E", "ti_sysbios_family_arm_a9_Timer_setPeriodMicroSecs__E", "ti_sysbios_family_arm_a9_Timer_getPeriod__E", "ti_sysbios_family_arm_a9_Timer_getCount__E", "ti_sysbios_family_arm_a9_Timer_getFreq__E", "ti_sysbios_family_arm_a9_Timer_getFunc__E", "ti_sysbios_family_arm_a9_Timer_setFunc__E", "ti_sysbios_family_arm_a9_Timer_trigger__E", "ti_sysbios_family_arm_a9_Timer_getExpiredCounts__E", "ti_sysbios_family_arm_a9_Timer_getExpiredTicks__E", "ti_sysbios_family_arm_a9_Timer_getCurrentTick__E", "ti_sysbios_family_arm_a9_Timer_stub__E", "ti_sysbios_family_arm_a9_Timer_getHandle__E", "ti_sysbios_family_arm_a9_Timer_reconfig__E", "ti_sysbios_family_arm_a9_Timer_setPrescale__E", "ti_sysbios_family_arm_a9_Timer_getPrescale__E"));
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
        vo.bind("Object", om.findStrict("ti.sysbios.family.arm.a9.Timer.Object", "ti.sysbios.family.arm.a9"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.TimerSupport", "ti.sysbios.family.arm.a9");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.TimerSupport.Module", "ti.sysbios.family.arm.a9");
        vo.init2(po, "ti.sysbios.family.arm.a9.TimerSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", $$UNDEF);
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a9", "ti.sysbios.family.arm.a9"));
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
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a9")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.arm.a9.TimerSupport.enable", "ti.sysbios.family.arm.a9"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_arm_a9_TimerSupport_Module__startupDone__E", "ti_sysbios_family_arm_a9_TimerSupport_enable__E"));
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

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.TimestampProvider", "ti.sysbios.family.arm.a9");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.arm.a9.TimestampProvider.Module", "ti.sysbios.family.arm.a9");
        vo.init2(po, "ti.sysbios.family.arm.a9.TimestampProvider", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.arm.a9.TimestampProvider$$capsule", "ti.sysbios.family.arm.a9"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.arm.a9", "ti.sysbios.family.arm.a9"));
        tdefs.clear();
        proxies.clear();
        mcfgs.clear();
        icfgs.clear();
        inherits.clear();
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.arm.a9")).add(vo);
        vo.bind("$$instflag", 0);
        vo.bind("$$iobjflag", 1);
        vo.bind("$$sizeflag", 1);
        vo.bind("$$dlgflag", 0);
        vo.bind("$$iflag", 0);
        vo.bind("$$romcfgs", "|");
        vo.bind("$$nortsflag", 0);
        Proto.Str ps = (Proto.Str)vo.find("Module_State");
        if (ps != null) vo.bind("$object", ps.newInstance());
        vo.bind("$$meta_iobj", om.has("ti.sysbios.family.arm.a9.TimestampProvider$$instance$static$init", null) ? 1 : 0);
        vo.bind("$$fxntab", Global.newArray());
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray());
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.seal("length");
        pkgV.bind("TimestampProvider", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("TimestampProvider");
    }

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
            Object srcP = ((XScriptO)om.findStrict("xdc.runtime.IInstance", "ti.sysbios.family.arm.a9")).findStrict("PARAMS", "ti.sysbios.family.arm.a9");
            Scriptable dstP;

            dstP = (Scriptable)((XScriptO)om.findStrict("ti.sysbios.family.arm.a9.Timer", "ti.sysbios.family.arm.a9")).findStrict("PARAMS", "ti.sysbios.family.arm.a9");
            Global.put(dstP, "instance", srcP);
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a9.Cache", "ti.sysbios.family.arm.a9"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a9.Mmu", "ti.sysbios.family.arm.a9"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a9.Timer", "ti.sysbios.family.arm.a9"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a9.TimerSupport", "ti.sysbios.family.arm.a9"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.arm.a9.TimestampProvider", "ti.sysbios.family.arm.a9"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.Cache", "ti.sysbios.family.arm.a9");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Cache Info", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitCacheInfo", "structName", "CacheInfoView")}), Global.newArray(new Object[]{"L2 Way Info", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitWays", "structName", "WayInfoView")}), Global.newArray(new Object[]{"L2 Error Status", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitErrorStatus", "structName", "ErrorStatusView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.arm.a9.Timer", "ti.sysbios.family.arm.a9");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Basic", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitBasic", "structName", "BasicView")}), Global.newArray(new Object[]{"Device", Global.newObject("type", om.find("xdc.rov.ViewInfo.INSTANCE"), "viewInitFxn", "viewInitDevice", "structName", "DeviceView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a9.Cache")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a9.Mmu")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a9.Timer")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a9.TimerSupport")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.arm.a9.TimestampProvider")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.arm.a9")).add(pkgV);
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
        Timer$$OBJECTS();
        TimerSupport$$OBJECTS();
        TimestampProvider$$OBJECTS();
        Cache$$CONSTS();
        Mmu$$CONSTS();
        Timer$$CONSTS();
        TimerSupport$$CONSTS();
        TimestampProvider$$CONSTS();
        Cache$$CREATES();
        Mmu$$CREATES();
        Timer$$CREATES();
        TimerSupport$$CREATES();
        TimestampProvider$$CREATES();
        Cache$$FUNCTIONS();
        Mmu$$FUNCTIONS();
        Timer$$FUNCTIONS();
        TimerSupport$$FUNCTIONS();
        TimestampProvider$$FUNCTIONS();
        Cache$$SIZES();
        Mmu$$SIZES();
        Timer$$SIZES();
        TimerSupport$$SIZES();
        TimestampProvider$$SIZES();
        Cache$$TYPES();
        Mmu$$TYPES();
        Timer$$TYPES();
        TimerSupport$$TYPES();
        TimestampProvider$$TYPES();
        if (isROV) {
            Cache$$ROV();
            Mmu$$ROV();
            Timer$$ROV();
            TimerSupport$$ROV();
            TimestampProvider$$ROV();
        }//isROV
        $$SINGLETONS();
        Cache$$SINGLETONS();
        Mmu$$SINGLETONS();
        Timer$$SINGLETONS();
        TimerSupport$$SINGLETONS();
        TimestampProvider$$SINGLETONS();
        $$INITIALIZATION();
    }
}
