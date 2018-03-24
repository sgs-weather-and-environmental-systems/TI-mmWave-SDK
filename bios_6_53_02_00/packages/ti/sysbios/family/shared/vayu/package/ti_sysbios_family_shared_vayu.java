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

public class ti_sysbios_family_shared_vayu
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
        pkgP = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.Package", new Proto.Obj());
        pkgV = (Value.Obj)om.bind("ti.sysbios.family.shared.vayu", new Value.Obj("ti.sysbios.family.shared.vayu", pkgP));
    }

    void IntXbar$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.IntXbar.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.shared.vayu.IntXbar", new Value.Obj("ti.sysbios.family.shared.vayu.IntXbar", po));
        pkgV.bind("IntXbar", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.IntXbar$$ModuleDataView", new Proto.Obj());
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.ModuleDataView", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.IntXbar$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.Module_State", new Proto.Str(spo, false));
    }

    void Mmu$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.Mmu.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.shared.vayu.Mmu", new Value.Obj("ti.sysbios.family.shared.vayu.Mmu", po));
        pkgV.bind("Mmu", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.Mmu$$PageView", new Proto.Obj());
        om.bind("ti.sysbios.family.shared.vayu.Mmu.PageView", new Proto.Str(spo, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc", new Proto.Enm("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc"));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.PageSize", new Proto.Enm("ti.sysbios.family.shared.vayu.Mmu.PageSize"));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.Mmu$$FirstLevelDescAttrs", new Proto.Obj());
        om.bind("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.Mmu$$Regs", new Proto.Obj());
        om.bind("ti.sysbios.family.shared.vayu.Mmu.Regs", new Proto.Str(spo, false));
        spo = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.Mmu$$Module_State", new Proto.Obj());
        om.bind("ti.sysbios.family.shared.vayu.Mmu.Module_State", new Proto.Str(spo, false));
    }

    void TimerSupport$$OBJECTS()
    {
        Proto.Obj po, spo;
        Value.Obj vo;

        po = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.TimerSupport.Module", new Proto.Obj());
        vo = (Value.Obj)om.bind("ti.sysbios.family.shared.vayu.TimerSupport", new Value.Obj("ti.sysbios.family.shared.vayu.TimerSupport", po));
        pkgV.bind("TimerSupport", vo);
        // decls 
        spo = (Proto.Obj)om.bind("ti.sysbios.family.shared.vayu.TimerSupport$$ModuleView", new Proto.Obj());
        om.bind("ti.sysbios.family.shared.vayu.TimerSupport.ModuleView", new Proto.Str(spo, false));
    }

    void IntXbar$$CONSTS()
    {
        // module IntXbar
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.numIrqXbarInputs", 420L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.NUM_EVE_XBAR_INST", 8L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.NUM_DSP_XBAR_INST", 64L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.NUM_BENELLI_XBAR_INST", 57L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.NUM_A15_XBAR_INST", 152L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_EVE0", 0x7A0L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_EVE1", 0x7B0L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_EVE2", 0x7C0L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_EVE3", 0x7D0L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_DSP0", 0x948L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_DSP1", 0x9c8L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_BENELLI_IPU1", 0x7E0L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_BENELLI_IPU2", 0x854L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_A15", 0xA48L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_OFFSET_LOCK2", 0x544L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_LOCK2_LOCK", 0xFDF45530L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.MMR_LOCK2_UNLOCK", 0xF757FDC0L);
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.connect", new Extern("ti_sysbios_family_shared_vayu_IntXbar_connect__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.disconnect", new Extern("ti_sysbios_family_shared_vayu_IntXbar_disconnect__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.connectIRQ", new Extern("ti_sysbios_family_shared_vayu_IntXbar_connectIRQ__E", "xdc_Void(*)(xdc_UInt,xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.disconnectIRQ", new Extern("ti_sysbios_family_shared_vayu_IntXbar_disconnectIRQ__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.initXbarRegs", new Extern("ti_sysbios_family_shared_vayu_IntXbar_initXbarRegs__I", "xdc_Void(*)(xdc_UInt32**,xdc_UInt16*)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.IntXbar.initIntXbar", new Extern("ti_sysbios_family_shared_vayu_IntXbar_initIntXbar__I", "xdc_Void(*)(xdc_Void)", true, false));
    }

    void Mmu$$CONSTS()
    {
        // module Mmu
        om.bind("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_FAULT", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc", "ti.sysbios.family.shared.vayu"), "ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_FAULT", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_PAGE_TABLE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc", "ti.sysbios.family.shared.vayu"), "ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_PAGE_TABLE", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_SECTION", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc", "ti.sysbios.family.shared.vayu"), "ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_SECTION", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.PageSize_SECTION", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageSize", "ti.sysbios.family.shared.vayu"), "ti.sysbios.family.shared.vayu.Mmu.PageSize_SECTION", xdc.services.intern.xsr.Enum.intValue(0L)+0));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.PageSize_LARGE", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageSize", "ti.sysbios.family.shared.vayu"), "ti.sysbios.family.shared.vayu.Mmu.PageSize_LARGE", xdc.services.intern.xsr.Enum.intValue(1L)+0));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.PageSize_SMALL", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageSize", "ti.sysbios.family.shared.vayu"), "ti.sysbios.family.shared.vayu.Mmu.PageSize_SMALL", xdc.services.intern.xsr.Enum.intValue(2L)+0));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.PageSize_SUPERSECTION", xdc.services.intern.xsr.Enum.make((Proto.Enm)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageSize", "ti.sysbios.family.shared.vayu"), "ti.sysbios.family.shared.vayu.Mmu.PageSize_SUPERSECTION", xdc.services.intern.xsr.Enum.intValue(3L)+0));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.disable", new Extern("ti_sysbios_family_shared_vayu_Mmu_disable__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.enable", new Extern("ti_sysbios_family_shared_vayu_Mmu_enable__E", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.initDescAttrs", new Extern("ti_sysbios_family_shared_vayu_Mmu_initDescAttrs__E", "xdc_Void(*)(ti_sysbios_family_shared_vayu_Mmu_FirstLevelDescAttrs*)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.isEnabled", new Extern("ti_sysbios_family_shared_vayu_Mmu_isEnabled__E", "xdc_Bool(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.setFirstLevelDesc", new Extern("ti_sysbios_family_shared_vayu_Mmu_setFirstLevelDesc__E", "xdc_Void(*)(xdc_Ptr,xdc_Ptr,ti_sysbios_family_shared_vayu_Mmu_FirstLevelDescAttrs*)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.writeTLBEntry", new Extern("ti_sysbios_family_shared_vayu_Mmu_writeTLBEntry__E", "xdc_Bool(*)(xdc_Ptr,xdc_Ptr,ti_sysbios_family_shared_vayu_Mmu_PageSize)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.clearTLBEntry", new Extern("ti_sysbios_family_shared_vayu_Mmu_clearTLBEntry__E", "xdc_Void(*)(xdc_Ptr)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.setTLBLockBaseValue", new Extern("ti_sysbios_family_shared_vayu_Mmu_setTLBLockBaseValue__E", "xdc_Void(*)(xdc_UInt)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.init", new Extern("ti_sysbios_family_shared_vayu_Mmu_init__I", "xdc_Void(*)(xdc_Void)", true, false));
        om.bind("ti.sysbios.family.shared.vayu.Mmu.initTableBuf", new Extern("ti_sysbios_family_shared_vayu_Mmu_initTableBuf__I", "xdc_Void(*)(xdc_UInt32*)", true, false));
    }

    void TimerSupport$$CONSTS()
    {
        // module TimerSupport
        om.bind("ti.sysbios.family.shared.vayu.TimerSupport.enable", new Extern("ti_sysbios_family_shared_vayu_TimerSupport_enable__E", "xdc_Void(*)(xdc_UInt,xdc_runtime_Error_Block*)", true, false));
    }

    void IntXbar$$CREATES()
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

    void IntXbar$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn IntXbar.connectMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.shared.vayu.IntXbar$$connectMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.Module", "ti.sysbios.family.shared.vayu"), null, 2, 2, false));
                fxn.addArg(0, "xbarInstance", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "intSource", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
        // fxn IntXbar.connectIRQMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.shared.vayu.IntXbar$$connectIRQMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.Module", "ti.sysbios.family.shared.vayu"), null, 2, 2, false));
                fxn.addArg(0, "cpuIRQNum", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
                fxn.addArg(1, "intSource", Proto.Elm.newCNum("(xdc_UInt)"), $$UNDEF);
    }

    void Mmu$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn Mmu.setFirstLevelDescMeta
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.shared.vayu.Mmu$$setFirstLevelDescMeta", new Proto.Fxn(om.findStrict("ti.sysbios.family.shared.vayu.Mmu.Module", "ti.sysbios.family.shared.vayu"), null, 3, 3, false));
                fxn.addArg(0, "virtualAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(1, "phyAddr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF);
                fxn.addArg(2, "attrs", (Proto)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.shared.vayu"), $$DEFAULT);
    }

    void TimerSupport$$FUNCTIONS()
    {
        Proto.Fxn fxn;

        // fxn TimerSupport.getAnyMask
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.shared.vayu.TimerSupport$$getAnyMask", new Proto.Fxn(om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport.Module", "ti.sysbios.family.shared.vayu"), Proto.Elm.newCNum("(xdc_Bits32)"), 0, 0, false));
        // fxn TimerSupport.getAvailMask
        fxn = (Proto.Fxn)om.bind("ti.sysbios.family.shared.vayu.TimerSupport$$getAvailMask", new Proto.Fxn(om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport.Module", "ti.sysbios.family.shared.vayu"), Proto.Elm.newCNum("(xdc_Bits32)"), 0, 0, false));
    }

    void IntXbar$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.Module_State", "ti.sysbios.family.shared.vayu");
        sizes.clear();
        sizes.add(Global.newArray("intXbar", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.shared.vayu.IntXbar.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.shared.vayu.IntXbar.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.shared.vayu.IntXbar.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void Mmu$$SIZES()
    {
        Proto.Str so;
        Object fxn;

        so = (Proto.Str)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.shared.vayu");
        sizes.clear();
        sizes.add(Global.newArray("type", "Nti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc;;0;1;2"));
        sizes.add(Global.newArray("supersection", "UShort"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.Regs", "ti.sysbios.family.shared.vayu");
        sizes.clear();
        sizes.add(Global.newArray("REVISION", "UInt32"));
        sizes.add(Global.newArray("hole1", "A3;UInt32"));
        sizes.add(Global.newArray("SYSCONFIG", "UInt32"));
        sizes.add(Global.newArray("SYSSTATUS", "UInt32"));
        sizes.add(Global.newArray("IRQSTATUS", "UInt32"));
        sizes.add(Global.newArray("IRQENABLE", "UInt32"));
        sizes.add(Global.newArray("hole2", "A8;UInt32"));
        sizes.add(Global.newArray("WALKING_ST", "UInt32"));
        sizes.add(Global.newArray("CNTL", "UInt32"));
        sizes.add(Global.newArray("FAULT_AD", "UInt32"));
        sizes.add(Global.newArray("TTB", "UInt32"));
        sizes.add(Global.newArray("LOCK", "UInt32"));
        sizes.add(Global.newArray("LD_TLB", "UInt32"));
        sizes.add(Global.newArray("CAM", "UInt32"));
        sizes.add(Global.newArray("RAM", "UInt32"));
        sizes.add(Global.newArray("GFLUSH", "UInt32"));
        sizes.add(Global.newArray("FLUSH_ENTRY", "UInt32"));
        sizes.add(Global.newArray("READ_CAM", "UInt32"));
        sizes.add(Global.newArray("READ_RAM", "UInt32"));
        sizes.add(Global.newArray("EMU_FAULT_AD", "UInt32"));
        sizes.add(Global.newArray("hole3", "A3;UInt32"));
        sizes.add(Global.newArray("FAULT_PC", "UInt32"));
        sizes.add(Global.newArray("FAULT_STATUS", "UInt32"));
        sizes.add(Global.newArray("GPR", "UInt32"));
        sizes.add(Global.newArray("BYPASS_REGION1_ADDR", "UInt32"));
        sizes.add(Global.newArray("BYPASS_REGION1_SIZE", "UInt32"));
        sizes.add(Global.newArray("BYPASS_REGION2_ADDR", "UInt32"));
        sizes.add(Global.newArray("BYPASS_REGION2_SIZE", "UInt32"));
        sizes.add(Global.newArray("BYPASS_REGION3_ADDR", "UInt32"));
        sizes.add(Global.newArray("BYPASS_REGION3_SIZE", "UInt32"));
        sizes.add(Global.newArray("BYPASS_REGION4_ADDR", "UInt32"));
        sizes.add(Global.newArray("BYPASS_REGION4_SIZE", "UInt32"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.shared.vayu.Mmu.Regs']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.shared.vayu.Mmu.Regs']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.shared.vayu.Mmu.Regs'], fld); }");
        so.bind("$offsetof", fxn);
        so = (Proto.Str)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.Module_State", "ti.sysbios.family.shared.vayu");
        sizes.clear();
        sizes.add(Global.newArray("regs", "UPtr"));
        sizes.add(Global.newArray("tableBuf", "UPtr"));
        so.bind("$$sizes", Global.newArray(sizes.toArray()));
        fxn = Global.eval("function() { return $$sizeof(xdc.om['ti.sysbios.family.shared.vayu.Mmu.Module_State']); }");
        so.bind("$sizeof", fxn);
        fxn = Global.eval("function() { return $$alignof(xdc.om['ti.sysbios.family.shared.vayu.Mmu.Module_State']); }");
        so.bind("$alignof", fxn);
        fxn = Global.eval("function(fld) { return $$offsetof(xdc.om['ti.sysbios.family.shared.vayu.Mmu.Module_State'], fld); }");
        so.bind("$offsetof", fxn);
    }

    void TimerSupport$$SIZES()
    {
        Proto.Str so;
        Object fxn;

    }

    void IntXbar$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/shared/vayu/IntXbar.xs");
        om.bind("ti.sysbios.family.shared.vayu.IntXbar$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.Module", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.IntXbar.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.shared.vayu"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("numIrqXbarInputs", Proto.Elm.newCNum("(xdc_UInt16)"), 420L, "rh");
                po.addFld("NUM_EVE_XBAR_INST", Proto.Elm.newCNum("(xdc_UInt16)"), 8L, "rh");
                po.addFld("NUM_DSP_XBAR_INST", Proto.Elm.newCNum("(xdc_UInt16)"), 64L, "rh");
                po.addFld("NUM_BENELLI_XBAR_INST", Proto.Elm.newCNum("(xdc_UInt16)"), 57L, "rh");
                po.addFld("NUM_A15_XBAR_INST", Proto.Elm.newCNum("(xdc_UInt16)"), 152L, "rh");
                po.addFld("MMR_OFFSET_EVE0", Proto.Elm.newCNum("(xdc_UInt32)"), 0x7A0L, "rh");
                po.addFld("MMR_OFFSET_EVE1", Proto.Elm.newCNum("(xdc_UInt32)"), 0x7B0L, "rh");
                po.addFld("MMR_OFFSET_EVE2", Proto.Elm.newCNum("(xdc_UInt32)"), 0x7C0L, "rh");
                po.addFld("MMR_OFFSET_EVE3", Proto.Elm.newCNum("(xdc_UInt32)"), 0x7D0L, "rh");
                po.addFld("MMR_OFFSET_DSP0", Proto.Elm.newCNum("(xdc_UInt32)"), 0x948L, "rh");
                po.addFld("MMR_OFFSET_DSP1", Proto.Elm.newCNum("(xdc_UInt32)"), 0x9c8L, "rh");
                po.addFld("MMR_OFFSET_BENELLI_IPU1", Proto.Elm.newCNum("(xdc_UInt32)"), 0x7E0L, "rh");
                po.addFld("MMR_OFFSET_BENELLI_IPU2", Proto.Elm.newCNum("(xdc_UInt32)"), 0x854L, "rh");
                po.addFld("MMR_OFFSET_A15", Proto.Elm.newCNum("(xdc_UInt32)"), 0xA48L, "rh");
                po.addFld("MMR_OFFSET_LOCK2", Proto.Elm.newCNum("(xdc_UInt32)"), 0x544L, "rh");
                po.addFld("MMR_LOCK2_LOCK", Proto.Elm.newCNum("(xdc_UInt32)"), 0xFDF45530L, "rh");
                po.addFld("MMR_LOCK2_UNLOCK", Proto.Elm.newCNum("(xdc_UInt32)"), 0xF757FDC0L, "rh");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.shared.vayu"), $$UNDEF, "wh");
            po.addFld("A_badEveXbarInstanceNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badEveXbarInstanceNum: xbarInstance must be >= 1 and <= 8"), "w");
            po.addFld("A_badDspXbarInstanceNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badDspXbarInstanceNum: xbarInstance must be >= 1 and <= 64"), "w");
            po.addFld("A_badBenelliXbarInstanceNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badBenelliXbarInstanceNum: xbarInstance must be >= 1 and <= 57"), "w");
            po.addFld("A_badA15XbarInstanceNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badA15XbarInstanceNum: xbarInstance must be >= 1 and <= 152"), "w");
            po.addFld("A_badEveIRQNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badEveIRQNum: IRQ number must be <= 7"), "w");
            po.addFld("A_badDspIRQNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badDspIRQNum: IRQ number must be >= 32 and <= 95"), "w");
            po.addFld("A_badBenelliIRQNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badBenelliIRQNum: IRQ number must be >= 23 and <= 79"), "w");
            po.addFld("A_badA15IRQNum", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badA15IRQNum: No XBAR instance corresponding to given IRQ num"), "w");
            po.addFld("A_badIntSourceIdx", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badIntSourceIdx: IRQ crossbar input index (intSource) out of range."), "w");
            po.addFld("A_badEveCpuId", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badEveCpuId: CPU Id must be 0, 1, 2 or 3"), "w");
            po.addFld("A_badDspCpuId", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badDspCpuId: CPU Id must be 0 or 1"), "w");
            po.addFld("A_badBenelliIpuId", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_badBenelliIpuId: Ipu Id must be 1 or 2"), "w");
            po.addFld("mmrBaseAddr", Proto.Elm.newCNum("(xdc_UInt32)"), 0x4A002000L, "w");
            po.addFld("intXbar", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt16)"), false), $$DEFAULT, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.IntXbar$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.IntXbar$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.IntXbar$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.IntXbar$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("connectMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar$$connectMeta", "ti.sysbios.family.shared.vayu"), Global.get(cap, "connectMeta"));
                po.addFxn("connectIRQMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar$$connectIRQMeta", "ti.sysbios.family.shared.vayu"), Global.get(cap, "connectIRQMeta"));
        // struct IntXbar.ModuleDataView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar$$ModuleDataView", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.IntXbar.ModuleDataView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("cpuIRQNumber", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("xbarInstanceNumber", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
                po.addFld("interruptSourceIndex", Proto.Elm.newCNum("(xdc_Int)"), $$UNDEF, "w");
        // struct IntXbar.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar$$Module_State", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.IntXbar.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("intXbar", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt16)"), false), $$DEFAULT, "w");
    }

    void Mmu$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/shared/vayu/Mmu.xs");
        om.bind("ti.sysbios.family.shared.vayu.Mmu$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.Module", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.Mmu.Module", om.findStrict("xdc.runtime.IModule.Module", "ti.sysbios.family.shared.vayu"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.shared.vayu"), $$UNDEF, "wh");
            po.addFld("A_nullPointer", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_nullPointer: Pointer is null"), "w");
            po.addFld("A_unknownDescType", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_unknownDescType: Descriptor type is not recognized"), "w");
            po.addFld("A_baseValueOutOfRange", (Proto)om.findStrict("xdc.runtime.Assert$$Id", "ti.sysbios.family.shared.vayu"), Global.newObject("msg", "A_baseValueOutOfRange: TLB lock entries base value out of range"), "w");
            po.addFld("defaultAttrs", (Proto)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.shared.vayu"), Global.newObject("type", om.find("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_SECTION"), "supersection", false), "w");
            po.addFld("enableMMU", $$T_Bool, false, "w");
            po.addFld("baseAddr", new Proto.Adr("ti_sysbios_family_shared_vayu_Mmu_Regs*", "PS"), null, "w");
            po.addFld("numTLBEntries", Proto.Elm.newCNum("(xdc_UInt)"), 32L, "w");
            po.addFld("tableBuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "wh");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.Mmu$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.Mmu$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.Mmu$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.Mmu$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("setFirstLevelDescMeta", (Proto.Fxn)om.findStrict("ti.sysbios.family.shared.vayu.Mmu$$setFirstLevelDescMeta", "ti.sysbios.family.shared.vayu"), Global.get(cap, "setFirstLevelDescMeta"));
        // struct Mmu.PageView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu$$PageView", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.Mmu.PageView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("Type", $$T_Str, $$UNDEF, "w");
                po.addFld("AddrVirtual", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("AddrPhysical", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("Level2TablePtr", new Proto.Adr("xdc_Ptr", "Pv"), $$UNDEF, "w");
                po.addFld("SuperSection", $$T_Bool, $$UNDEF, "w");
        // struct Mmu.FirstLevelDescAttrs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu$$FirstLevelDescAttrs", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("type", (Proto)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc", "ti.sysbios.family.shared.vayu"), $$UNDEF, "w");
                po.addFld("supersection", $$T_Bool, $$UNDEF, "w");
        // struct Mmu.Regs
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu$$Regs", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.Mmu.Regs", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("REVISION", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole1", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
                po.addFld("SYSCONFIG", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("SYSSTATUS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IRQSTATUS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("IRQENABLE", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole2", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(8L)), $$DEFAULT, "w");
                po.addFld("WALKING_ST", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CNTL", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FAULT_AD", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("TTB", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("LOCK", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("LD_TLB", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("CAM", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("RAM", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GFLUSH", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FLUSH_ENTRY", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("READ_CAM", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("READ_RAM", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("EMU_FAULT_AD", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("hole3", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false, xdc.services.intern.xsr.Enum.intValue(3L)), $$DEFAULT, "w");
                po.addFld("FAULT_PC", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("FAULT_STATUS", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("GPR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BYPASS_REGION1_ADDR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BYPASS_REGION1_SIZE", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BYPASS_REGION2_ADDR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BYPASS_REGION2_SIZE", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BYPASS_REGION3_ADDR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BYPASS_REGION3_SIZE", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BYPASS_REGION4_ADDR", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
                po.addFld("BYPASS_REGION4_SIZE", Proto.Elm.newCNum("(xdc_UInt32)"), $$UNDEF, "w");
        // struct Mmu.Module_State
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu$$Module_State", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.Mmu.Module_State", null);
                po.addFld("$hostonly", $$T_Num, 0, "r");
                po.addFld("regs", new Proto.Adr("ti_sysbios_family_shared_vayu_Mmu_Regs*", "PS"), $$UNDEF, "w");
                po.addFld("tableBuf", new Proto.Arr(Proto.Elm.newCNum("(xdc_UInt32)"), false), $$DEFAULT, "w");
    }

    void TimerSupport$$TYPES()
    {
        Scriptable cap;
        Proto.Obj po;
        Proto.Str ps;
        Proto.Typedef pt;
        Object fxn;

        cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/shared/vayu/TimerSupport.xs");
        om.bind("ti.sysbios.family.shared.vayu.TimerSupport$$capsule", cap);
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport.Module", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.TimerSupport.Module", om.findStrict("ti.sysbios.interfaces.ITimerSupport.Module", "ti.sysbios.family.shared.vayu"));
                po.addFld("$hostonly", $$T_Num, 0, "r");
        if (isCFG) {
            po.addFld("rovViewInfo", (Proto)om.findStrict("xdc.rov.ViewInfo.Instance", "ti.sysbios.family.shared.vayu"), $$UNDEF, "wh");
            po.addFld("availMask", Proto.Elm.newCNum("(xdc_Bits32)"), 0x0L, "w");
        }//isCFG
        fxn = Global.get(cap, "module$use");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.TimerSupport$$module$use", true);
        if (fxn != null) po.addFxn("module$use", $$T_Met, fxn);
        fxn = Global.get(cap, "module$meta$init");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.TimerSupport$$module$meta$init", true);
        if (fxn != null) po.addFxn("module$meta$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$static$init");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.TimerSupport$$module$static$init", true);
        if (fxn != null) po.addFxn("module$static$init", $$T_Met, fxn);
        fxn = Global.get(cap, "module$validate");
        if (fxn != null) om.bind("ti.sysbios.family.shared.vayu.TimerSupport$$module$validate", true);
        if (fxn != null) po.addFxn("module$validate", $$T_Met, fxn);
                po.addFxn("getAnyMask", (Proto.Fxn)om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport$$getAnyMask", "ti.sysbios.family.shared.vayu"), Global.get(cap, "getAnyMask"));
                po.addFxn("getAvailMask", (Proto.Fxn)om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport$$getAvailMask", "ti.sysbios.family.shared.vayu"), Global.get(cap, "getAvailMask"));
        // struct TimerSupport.ModuleView
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport$$ModuleView", "ti.sysbios.family.shared.vayu");
        po.init("ti.sysbios.family.shared.vayu.TimerSupport.ModuleView", null);
                po.addFld("$hostonly", $$T_Num, 1, "r");
                po.addFld("availMask", $$T_Str, $$UNDEF, "w");
    }

    void IntXbar$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar", "ti.sysbios.family.shared.vayu");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.shared.vayu.IntXbar.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar$$Module_State", "ti.sysbios.family.shared.vayu");
        po.bind("intXbar$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt16", "isScalar", true));
    }

    void Mmu$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu", "ti.sysbios.family.shared.vayu");
        vo.bind("FirstLevelDescAttrs$fetchDesc", Global.newObject("type", "ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu$$FirstLevelDescAttrs", "ti.sysbios.family.shared.vayu");
        vo.bind("Regs$fetchDesc", Global.newObject("type", "ti.sysbios.family.shared.vayu.Mmu.Regs", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu$$Regs", "ti.sysbios.family.shared.vayu");
        vo.bind("Module_State$fetchDesc", Global.newObject("type", "ti.sysbios.family.shared.vayu.Mmu.Module_State", "isScalar", false));
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu$$Module_State", "ti.sysbios.family.shared.vayu");
        po.bind("regs$fetchDesc", Global.newObject("type", "ti.sysbios.family.shared.vayu.Mmu.Regs", "isScalar", false));
        po.bind("tableBuf$fetchDesc", Global.newObject("type", "xdc.rov.support.ScalarStructs.S_UInt32", "isScalar", true));
    }

    void TimerSupport$$ROV()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport", "ti.sysbios.family.shared.vayu");
    }

    void $$SINGLETONS()
    {
        pkgP.init("ti.sysbios.family.shared.vayu.Package", (Proto.Obj)om.findStrict("xdc.IPackage.Module", "ti.sysbios.family.shared.vayu"));
        Scriptable cap = (Scriptable)Global.callFxn("loadCapsule", xdcO, "ti/sysbios/family/shared/vayu/package.xs");
        om.bind("xdc.IPackage$$capsule", cap);
        Object fxn;
                fxn = Global.get(cap, "init");
                if (fxn != null) pkgP.addFxn("init", (Proto.Fxn)om.findStrict("xdc.IPackage$$init", "ti.sysbios.family.shared.vayu"), fxn);
                fxn = Global.get(cap, "close");
                if (fxn != null) pkgP.addFxn("close", (Proto.Fxn)om.findStrict("xdc.IPackage$$close", "ti.sysbios.family.shared.vayu"), fxn);
                fxn = Global.get(cap, "validate");
                if (fxn != null) pkgP.addFxn("validate", (Proto.Fxn)om.findStrict("xdc.IPackage$$validate", "ti.sysbios.family.shared.vayu"), fxn);
                fxn = Global.get(cap, "exit");
                if (fxn != null) pkgP.addFxn("exit", (Proto.Fxn)om.findStrict("xdc.IPackage$$exit", "ti.sysbios.family.shared.vayu"), fxn);
                fxn = Global.get(cap, "getLibs");
                if (fxn != null) pkgP.addFxn("getLibs", (Proto.Fxn)om.findStrict("xdc.IPackage$$getLibs", "ti.sysbios.family.shared.vayu"), fxn);
                fxn = Global.get(cap, "getSects");
                if (fxn != null) pkgP.addFxn("getSects", (Proto.Fxn)om.findStrict("xdc.IPackage$$getSects", "ti.sysbios.family.shared.vayu"), fxn);
        pkgP.bind("$capsule", cap);
        pkgV.init2(pkgP, "ti.sysbios.family.shared.vayu", Value.DEFAULT, false);
        pkgV.bind("$name", "ti.sysbios.family.shared.vayu");
        pkgV.bind("$category", "Package");
        pkgV.bind("$$qn", "ti.sysbios.family.shared.vayu.");
        pkgV.bind("$vers", Global.newArray(2, 0, 0, 0));
        Value.Map atmap = (Value.Map)pkgV.getv("$attr");
        atmap.seal("length");
        imports.clear();
        pkgV.bind("$imports", imports);
        StringBuilder sb = new StringBuilder();
        sb.append("var pkg = xdc.om['ti.sysbios.family.shared.vayu'];\n");
        sb.append("if (pkg.$vers.length >= 3) {\n");
            sb.append("pkg.$vers.push(Packages.xdc.services.global.Vers.getDate(xdc.csd() + '/..'));\n");
        sb.append("}\n");
        sb.append("if ('ti.sysbios.family.shared.vayu$$stat$base' in xdc.om) {\n");
            sb.append("pkg.packageBase = xdc.om['ti.sysbios.family.shared.vayu$$stat$base'];\n");
            sb.append("pkg.packageRepository = xdc.om['ti.sysbios.family.shared.vayu$$stat$root'];\n");
        sb.append("}\n");
        sb.append("pkg.build.libraries = [\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.shared.vayu.aearp32',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.shared.vayu.aearp32F',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.shared.vayu.ae66',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.shared.vayu.ae66e',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.shared.vayu.aa15fg',\n");
            sb.append("'lib/sysbios/debug/ti.sysbios.family.shared.vayu.aem4',\n");
            sb.append("'lib/smpbios/debug/ti.sysbios.family.shared.vayu.aem4',\n");
        sb.append("];\n");
        sb.append("pkg.build.libDesc = [\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.shared.vayu.aearp32', {target: 'ti.targets.arp32.elf.ARP32', suffix: 'earp32'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.shared.vayu.aearp32F', {target: 'ti.targets.arp32.elf.ARP32_far', suffix: 'earp32F'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.shared.vayu.ae66', {target: 'ti.targets.elf.C66', suffix: 'e66'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.shared.vayu.ae66e', {target: 'ti.targets.elf.C66_big_endian', suffix: 'e66e'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.shared.vayu.aa15fg', {target: 'gnu.targets.arm.A15F', suffix: 'a15fg'}],\n");
            sb.append("['lib/sysbios/debug/ti.sysbios.family.shared.vayu.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
            sb.append("['lib/smpbios/debug/ti.sysbios.family.shared.vayu.aem4', {target: 'ti.targets.arm.elf.M4', suffix: 'em4'}],\n");
        sb.append("];\n");
        Global.eval(sb.toString());
    }

    void IntXbar$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar", "ti.sysbios.family.shared.vayu");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.Module", "ti.sysbios.family.shared.vayu");
        vo.init2(po, "ti.sysbios.family.shared.vayu.IntXbar", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.shared.vayu.IntXbar$$capsule", "ti.sysbios.family.shared.vayu"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.shared.vayu", "ti.sysbios.family.shared.vayu"));
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
        vo.bind("ModuleDataView", om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.ModuleDataView", "ti.sysbios.family.shared.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.ModuleDataView", "ti.sysbios.family.shared.vayu"));
        mcfgs.add("A_badEveXbarInstanceNum");
        mcfgs.add("A_badDspXbarInstanceNum");
        mcfgs.add("A_badBenelliXbarInstanceNum");
        mcfgs.add("A_badA15XbarInstanceNum");
        mcfgs.add("A_badEveIRQNum");
        mcfgs.add("A_badDspIRQNum");
        mcfgs.add("A_badBenelliIRQNum");
        mcfgs.add("A_badA15IRQNum");
        mcfgs.add("A_badIntSourceIdx");
        mcfgs.add("A_badEveCpuId");
        mcfgs.add("A_badDspCpuId");
        mcfgs.add("A_badBenelliIpuId");
        mcfgs.add("mmrBaseAddr");
        mcfgs.add("intXbar");
        icfgs.add("intXbar");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.Module_State", "ti.sysbios.family.shared.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.Module_State", "ti.sysbios.family.shared.vayu"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.shared.vayu")).add(vo);
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
        vo.bind("connect", om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.connect", "ti.sysbios.family.shared.vayu"));
        vo.bind("disconnect", om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.disconnect", "ti.sysbios.family.shared.vayu"));
        vo.bind("connectIRQ", om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.connectIRQ", "ti.sysbios.family.shared.vayu"));
        vo.bind("disconnectIRQ", om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.disconnectIRQ", "ti.sysbios.family.shared.vayu"));
        vo.bind("initXbarRegs", om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.initXbarRegs", "ti.sysbios.family.shared.vayu"));
        vo.bind("initIntXbar", om.findStrict("ti.sysbios.family.shared.vayu.IntXbar.initIntXbar", "ti.sysbios.family.shared.vayu"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_shared_vayu_IntXbar_Module__startupDone__E", "ti_sysbios_family_shared_vayu_IntXbar_connect__E", "ti_sysbios_family_shared_vayu_IntXbar_disconnect__E", "ti_sysbios_family_shared_vayu_IntXbar_connectIRQ__E", "ti_sysbios_family_shared_vayu_IntXbar_disconnectIRQ__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_badEveXbarInstanceNum", "A_badDspXbarInstanceNum", "A_badBenelliXbarInstanceNum", "A_badA15XbarInstanceNum", "A_badEveIRQNum", "A_badDspIRQNum", "A_badBenelliIRQNum", "A_badA15IRQNum", "A_badIntSourceIdx", "A_badEveCpuId", "A_badDspCpuId", "A_badBenelliIpuId"));
        Value.Map atmap = (Value.Map)vo.getv("$attr");
        atmap.setElem("", true);
        atmap.seal("length");
        vo.bind("MODULE_STARTUP$", 0);
        vo.bind("PROXY$", 0);
        loggables.clear();
        vo.bind("$$loggables", loggables.toArray());
        pkgV.bind("IntXbar", vo);
        ((Value.Arr)pkgV.getv("$unitNames")).add("IntXbar");
    }

    void Mmu$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu", "ti.sysbios.family.shared.vayu");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu.Module", "ti.sysbios.family.shared.vayu");
        vo.init2(po, "ti.sysbios.family.shared.vayu.Mmu", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.shared.vayu.Mmu$$capsule", "ti.sysbios.family.shared.vayu"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.shared.vayu", "ti.sysbios.family.shared.vayu"));
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
        vo.bind("PageView", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageView", "ti.sysbios.family.shared.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageView", "ti.sysbios.family.shared.vayu"));
        vo.bind("FirstLevelDesc", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc", "ti.sysbios.family.shared.vayu"));
        vo.bind("PageSize", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageSize", "ti.sysbios.family.shared.vayu"));
        vo.bind("FirstLevelDescAttrs", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.shared.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDescAttrs", "ti.sysbios.family.shared.vayu"));
        mcfgs.add("A_nullPointer");
        mcfgs.add("A_unknownDescType");
        mcfgs.add("A_baseValueOutOfRange");
        mcfgs.add("defaultAttrs");
        mcfgs.add("enableMMU");
        mcfgs.add("baseAddr");
        vo.bind("Regs", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.Regs", "ti.sysbios.family.shared.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.shared.vayu.Mmu.Regs", "ti.sysbios.family.shared.vayu"));
        mcfgs.add("numTLBEntries");
        icfgs.add("tableBuf");
        vo.bind("Module_State", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.Module_State", "ti.sysbios.family.shared.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.shared.vayu.Mmu.Module_State", "ti.sysbios.family.shared.vayu"));
        vo.bind("FirstLevelDesc_FAULT", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_FAULT", "ti.sysbios.family.shared.vayu"));
        vo.bind("FirstLevelDesc_PAGE_TABLE", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_PAGE_TABLE", "ti.sysbios.family.shared.vayu"));
        vo.bind("FirstLevelDesc_SECTION", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.FirstLevelDesc_SECTION", "ti.sysbios.family.shared.vayu"));
        vo.bind("PageSize_SECTION", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageSize_SECTION", "ti.sysbios.family.shared.vayu"));
        vo.bind("PageSize_LARGE", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageSize_LARGE", "ti.sysbios.family.shared.vayu"));
        vo.bind("PageSize_SMALL", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageSize_SMALL", "ti.sysbios.family.shared.vayu"));
        vo.bind("PageSize_SUPERSECTION", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.PageSize_SUPERSECTION", "ti.sysbios.family.shared.vayu"));
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.shared.vayu")).add(vo);
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
        vo.bind("disable", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.disable", "ti.sysbios.family.shared.vayu"));
        vo.bind("enable", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.enable", "ti.sysbios.family.shared.vayu"));
        vo.bind("initDescAttrs", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.initDescAttrs", "ti.sysbios.family.shared.vayu"));
        vo.bind("isEnabled", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.isEnabled", "ti.sysbios.family.shared.vayu"));
        vo.bind("setFirstLevelDesc", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.setFirstLevelDesc", "ti.sysbios.family.shared.vayu"));
        vo.bind("writeTLBEntry", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.writeTLBEntry", "ti.sysbios.family.shared.vayu"));
        vo.bind("clearTLBEntry", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.clearTLBEntry", "ti.sysbios.family.shared.vayu"));
        vo.bind("setTLBLockBaseValue", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.setTLBLockBaseValue", "ti.sysbios.family.shared.vayu"));
        vo.bind("init", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.init", "ti.sysbios.family.shared.vayu"));
        vo.bind("initTableBuf", om.findStrict("ti.sysbios.family.shared.vayu.Mmu.initTableBuf", "ti.sysbios.family.shared.vayu"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_shared_vayu_Mmu_Module__startupDone__E", "ti_sysbios_family_shared_vayu_Mmu_disable__E", "ti_sysbios_family_shared_vayu_Mmu_enable__E", "ti_sysbios_family_shared_vayu_Mmu_initDescAttrs__E", "ti_sysbios_family_shared_vayu_Mmu_isEnabled__E", "ti_sysbios_family_shared_vayu_Mmu_setFirstLevelDesc__E", "ti_sysbios_family_shared_vayu_Mmu_writeTLBEntry__E", "ti_sysbios_family_shared_vayu_Mmu_clearTLBEntry__E", "ti_sysbios_family_shared_vayu_Mmu_setTLBLockBaseValue__E"));
        vo.bind("$$logEvtCfgs", Global.newArray());
        vo.bind("$$errorDescCfgs", Global.newArray());
        vo.bind("$$assertDescCfgs", Global.newArray("A_nullPointer", "A_unknownDescType", "A_baseValueOutOfRange"));
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

    void TimerSupport$$SINGLETONS()
    {
        Proto.Obj po;
        Value.Obj vo;

        vo = (Value.Obj)om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport", "ti.sysbios.family.shared.vayu");
        po = (Proto.Obj)om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport.Module", "ti.sysbios.family.shared.vayu");
        vo.init2(po, "ti.sysbios.family.shared.vayu.TimerSupport", $$DEFAULT, false);
        vo.bind("Module", po);
        vo.bind("$category", "Module");
        vo.bind("$capsule", om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport$$capsule", "ti.sysbios.family.shared.vayu"));
        vo.bind("$package", om.findStrict("ti.sysbios.family.shared.vayu", "ti.sysbios.family.shared.vayu"));
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
        vo.bind("ModuleView", om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport.ModuleView", "ti.sysbios.family.shared.vayu"));
        tdefs.add(om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport.ModuleView", "ti.sysbios.family.shared.vayu"));
        mcfgs.add("availMask");
        vo.bind("$$tdefs", Global.newArray(tdefs.toArray()));
        vo.bind("$$proxies", Global.newArray(proxies.toArray()));
        vo.bind("$$mcfgs", Global.newArray(mcfgs.toArray()));
        vo.bind("$$icfgs", Global.newArray(icfgs.toArray()));
        inherits.add("ti.sysbios.interfaces");
        inherits.add("xdc.runtime");
        vo.bind("$$inherits", Global.newArray(inherits.toArray()));
        ((Value.Arr)pkgV.getv("$modules")).add(vo);
        ((Value.Arr)om.findStrict("$modules", "ti.sysbios.family.shared.vayu")).add(vo);
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
        vo.bind("enable", om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport.enable", "ti.sysbios.family.shared.vayu"));
        vo.bind("$$fxntab", Global.newArray("ti_sysbios_family_shared_vayu_TimerSupport_Module__startupDone__E", "ti_sysbios_family_shared_vayu_TimerSupport_enable__E"));
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

    void $$INITIALIZATION()
    {
        Value.Obj vo;

        if (isCFG) {
        }//isCFG
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar", "ti.sysbios.family.shared.vayu"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.shared.vayu.Mmu", "ti.sysbios.family.shared.vayu"));
        Global.callFxn("module$meta$init", (Scriptable)om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport", "ti.sysbios.family.shared.vayu"));
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.shared.vayu.IntXbar", "ti.sysbios.family.shared.vayu");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"XbarList", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewInitData", "structName", "ModuleDataView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.shared.vayu.Mmu", "ti.sysbios.family.shared.vayu");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"0x0-0x7FFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages1", "structName", "PageView")}), Global.newArray(new Object[]{"0x80000000-0x9FFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages2", "structName", "PageView")}), Global.newArray(new Object[]{"0xA0000000-0xBFFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages3", "structName", "PageView")}), Global.newArray(new Object[]{"0xC0000000-0xDFFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages4", "structName", "PageView")}), Global.newArray(new Object[]{"0xE0000000-0xFFFFFFFF", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE_DATA"), "viewInitFxn", "viewPages5", "structName", "PageView")})}))));
        }//isCFG
        if (isCFG) {
            vo = (Value.Obj)om.findStrict("ti.sysbios.family.shared.vayu.TimerSupport", "ti.sysbios.family.shared.vayu");
            Global.put(vo, "rovViewInfo", Global.callFxn("create", (Scriptable)om.find("xdc.rov.ViewInfo"), Global.newObject("viewMap", Global.newArray(new Object[]{Global.newArray(new Object[]{"Module", Global.newObject("type", om.find("xdc.rov.ViewInfo.MODULE"), "viewInitFxn", "viewInitModule", "structName", "ModuleView")})}))));
        }//isCFG
        Global.callFxn("init", pkgV);
        ((Value.Obj)om.getv("ti.sysbios.family.shared.vayu.IntXbar")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.shared.vayu.Mmu")).bless();
        ((Value.Obj)om.getv("ti.sysbios.family.shared.vayu.TimerSupport")).bless();
        ((Value.Arr)om.findStrict("$packages", "ti.sysbios.family.shared.vayu")).add(pkgV);
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
        IntXbar$$OBJECTS();
        Mmu$$OBJECTS();
        TimerSupport$$OBJECTS();
        IntXbar$$CONSTS();
        Mmu$$CONSTS();
        TimerSupport$$CONSTS();
        IntXbar$$CREATES();
        Mmu$$CREATES();
        TimerSupport$$CREATES();
        IntXbar$$FUNCTIONS();
        Mmu$$FUNCTIONS();
        TimerSupport$$FUNCTIONS();
        IntXbar$$SIZES();
        Mmu$$SIZES();
        TimerSupport$$SIZES();
        IntXbar$$TYPES();
        Mmu$$TYPES();
        TimerSupport$$TYPES();
        if (isROV) {
            IntXbar$$ROV();
            Mmu$$ROV();
            TimerSupport$$ROV();
        }//isROV
        $$SINGLETONS();
        IntXbar$$SINGLETONS();
        Mmu$$SINGLETONS();
        TimerSupport$$SINGLETONS();
        $$INITIALIZATION();
    }
}
